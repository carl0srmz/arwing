#include "cpu_ops.h"

Cpu cpu;
u8 *cov_cpu, *cov_rom;
bool cpu_fetching;
extern u32 cpu_instr_id;

static inline u8 f8(void) { cpu_fetching = true; u8 v = rd8((cpu.pb << 16) | cpu.pc); cpu_fetching = false; cpu.pc++; return v; }
static inline u16 f16(void) { u8 l = f8(); return l | f8() << 8; }
static inline u32 f24(void) { u16 l = f16(); return l | f8() << 16; }
static inline u16 fM(void) { return M8 ? f8() : f16(); }
static inline u16 fX(void) { return X8 ? f8() : f16(); }

void cpu_reset(void) {
  memset(&cpu, 0, sizeof cpu);
  cpu.e = 1; cpu.p = FM | FX | FI; cpu.s = 0x1ff;
  cpu.pc = bus_peek(0xfffc) | bus_peek(0xfffd) << 8;
}

void cpu_nmi(void) { cpu.wai = 0; IO(); IO(); cpu_interrupt(0xffea, 0xfffa, false); }
void cpu_irq(void) { cpu.wai = 0; IO(); IO(); cpu_interrupt(0xffee, 0xfffe, false); }

static void branch(bool take) {
  s8 d = (s8)f8();
  if (take) { IO(); u16 t = cpu.pc + d; if (cpu.e && (t & 0xff00) != (cpu.pc & 0xff00)) IO(); cpu.pc = t; }
}

static u32 g1_ea(u8 op, int wr, int *w) {
  *w = 0;
  switch (op & 0x1f) {
  case 0x01: *w = 0; return ea_dpxind(f8());
  case 0x03: *w = 1; return ea_sr(f8());
  case 0x05: *w = 1; return ea_dp(f8());
  case 0x07: return ea_dplong(f8());
  case 0x0d: return ea_abs(f16());
  case 0x0f: return ea_long(f24());
  case 0x11: return ea_dpindy(f8(), wr);
  case 0x12: return ea_dpind(f8());
  case 0x13: return ea_sriy(f8());
  case 0x15: *w = 1; return ea_dpx(f8());
  case 0x17: return ea_dplongy(f8());
  case 0x19: { u16 o = f16(); return ea_absi(o, cpu.y, wr); }
  case 0x1d: { u16 o = f16(); return ea_absi(o, cpu.x, wr); }
  default:   { u32 o = f24(); return ea_longx(o); }
  }
}

void cpu_step(void) {
  if (cpu.stp) { IO(); return; }
  if (cpu.wai) { IO(); return; }
  u32 pc24 = (cpu.pb << 16) | cpu.pc;
  cpu_instr_id++;
  if (cov_cpu) {
    u8 fl = 1 | (M8 ? 2 : 4) | (X8 ? 8 : 16);
    cov_cpu[pc24] |= fl;
    int ro = rom_offset(pc24), wi = wram_index(pc24);
    if (ro >= 0) cov_rom[ro] |= fl;
    else if (wi >= 0 && wram_src[wi]) { cov_rom[wram_src[wi] - 1] |= fl; cov_note_ramexec(pc24, wram_src[wi] - 1); }
    else if (wi >= 0) cov_note_ramexec(pc24, 0xffffffff);
  }
  u8 op = f8();
  int w; u32 a;

  if ((op & 3) == 1 || ((op & 0x1f) == 0x12) || ((op & 0x1f) == 0x13 && (op & 3) == 3) || (op & 0x1f) == 0x03 ||
      (op & 0x1f) == 0x07 || (op & 0x1f) == 0x0f || (op & 0x1f) == 0x17 || (op & 0x1f) == 0x1f) {
    int g = op >> 5;
    if ((op & 0x1f) == 0x09) {
      if (g == 4) { op_bit_imm(fM()); return; }
      u16 v = fM();
      switch (g) { case 0: op_ora(v); break; case 1: op_and(v); break; case 2: op_eor(v); break; case 3: op_adc(v); break;
                   case 5: op_lda(v); break; case 6: op_cmp(v); break; default: op_sbc(v); }
      return;
    }
    a = g1_ea(op, g == 4, &w);
    if (g == 4) { op_sta(a, w); return; }
    u16 v = rdM(a, w);
    switch (g) { case 0: op_ora(v); break; case 1: op_and(v); break; case 2: op_eor(v); break; case 3: op_adc(v); break;
                 case 5: op_lda(v); break; case 6: op_cmp(v); break; default: op_sbc(v); }
    return;
  }

  switch (op) {
  case 0x10: branch(!(cpu.p & FN)); break;
  case 0x30: branch(cpu.p & FN); break;
  case 0x50: branch(!(cpu.p & FV)); break;
  case 0x70: branch(cpu.p & FV); break;
  case 0x80: branch(true); break;
  case 0x90: branch(!(cpu.p & FC)); break;
  case 0xb0: branch(cpu.p & FC); break;
  case 0xd0: branch(!(cpu.p & FZ)); break;
  case 0xf0: branch(cpu.p & FZ); break;
  case 0x82: { u16 d = f16(); IO(); cpu.pc += d; break; }
  case 0x4c: cpu.pc = f16(); break;
  case 0x5c: { u32 t = f24(); cpu.pc = (u16)t; cpu.pb = t >> 16; break; }
  case 0x6c: { u16 o = f16(); cpu.pc = rd16(o, 1); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break; }
  case 0x7c: { u16 o = f16(); IO(); cpu.pc = rd16((cpu.pb << 16) | (u16)(o + cpu.x), 1); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break; }
  case 0xdc: { u16 o = f16(); u32 t = rd24(o, 1); cpu.pc = (u16)t; cpu.pb = t >> 16; if (cov_cpu) cov_note_jump(pc24, t); break; }
  case 0x20: { u16 t = f16(); IO(); push16(cpu.pc - 1); cpu.pc = t; break; }
  case 0xfc: { u16 o = f16(); push16(cpu.pc - 1); IO(); cpu.pc = rd16((cpu.pb << 16) | (u16)(o + cpu.x), 1); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break; }
  case 0x22: { u16 t = f16(); push8(cpu.pb); IO(); u8 b = f8(); push16(cpu.pc - 1); cpu.pc = t; cpu.pb = b; break; }
  case 0x60: IO(); IO(); cpu.pc = pull16() + 1; IO(); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break;
  case 0x6b: IO(); IO(); cpu.pc = pull16() + 1; cpu.pb = pull8(); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break;
  case 0x40: IO(); IO(); cpu.p = pull8(); fix_mode(); cpu.pc = pull16(); if (!cpu.e) cpu.pb = pull8(); if (cov_cpu) cov_note_jump(pc24, (cpu.pb << 16) | cpu.pc); break;
  case 0x00: f8(); cpu_interrupt(0xffe6, 0xfffe, true); break;
  case 0x02: f8(); cpu_interrupt(0xffe4, 0xfff4, false); break;
  case 0xcb: IO(); IO(); cpu.wai = 1; break;
  case 0xdb: IO(); IO(); cpu.stp = 1; break;
  case 0x42: f8(); break;
  case 0xea: IO(); break;

  case 0x18: IO(); cpu.p &= ~FC; break;
  case 0x38: IO(); cpu.p |= FC; break;
  case 0x58: IO(); cpu.p &= ~FI; break;
  case 0x78: IO(); cpu.p |= FI; break;
  case 0xb8: IO(); cpu.p &= ~FV; break;
  case 0xd8: IO(); cpu.p &= ~FD; break;
  case 0xf8: IO(); cpu.p |= FD; break;
  case 0xc2: op_rep(f8()); break;
  case 0xe2: op_sep(f8()); break;
  case 0xfb: op_xce(); break;

  case 0xaa: op_tax(); break; case 0xa8: op_tay(); break; case 0x8a: op_txa(); break; case 0x98: op_tya(); break;
  case 0x9b: op_txy(); break; case 0xbb: op_tyx(); break; case 0xba: op_tsx(); break; case 0x9a: op_txs(); break;
  case 0x1b: op_tcs(); break; case 0x3b: op_tsc(); break; case 0x5b: op_tcd(); break; case 0x7b: op_tdc(); break;
  case 0xeb: op_xba(); break;
  case 0xe8: op_inx(); break; case 0xc8: op_iny(); break; case 0xca: op_dex(); break; case 0x88: op_dey(); break;

  case 0x48: op_pha(); break; case 0xda: op_phx(); break; case 0x5a: op_phy(); break;
  case 0x68: op_pla(); break; case 0xfa: op_plx(); break; case 0x7a: op_ply(); break;
  case 0x8b: op_phb(); break; case 0x4b: op_phk(); break; case 0x0b: op_phd(); break; case 0x08: op_php(); break;
  case 0xab: op_plb(); break; case 0x2b: op_pld(); break; case 0x28: op_plp(); break;
  case 0xf4: push16(f16()); break;
  case 0xd4: { u8 o = f8(); dpio(); push16(rd16((u16)(cpu.d + o), 1)); break; }
  case 0x62: { u16 d = f16(); IO(); push16(cpu.pc + d); break; }

  case 0x54: case 0x44: {
    u8 db = f8(), sb = f8();
    if (op_mv(op == 0x54, db, sb)) cpu.pc -= 3;
    break;
  }

  case 0xa2: op_ldx(fX()); break;
  case 0xa6: a = ea_dp(f8()); op_ldx(rdX(a, 1)); break;
  case 0xb6: a = ea_dpy(f8()); op_ldx(rdX(a, 1)); break;
  case 0xae: a = ea_abs(f16()); op_ldx(rdX(a, 0)); break;
  case 0xbe: { u16 o = f16(); a = ea_absi(o, cpu.y, 0); op_ldx(rdX(a, 0)); break; }
  case 0xa0: op_ldy(fX()); break;
  case 0xa4: a = ea_dp(f8()); op_ldy(rdX(a, 1)); break;
  case 0xb4: a = ea_dpx(f8()); op_ldy(rdX(a, 1)); break;
  case 0xac: a = ea_abs(f16()); op_ldy(rdX(a, 0)); break;
  case 0xbc: { u16 o = f16(); a = ea_absi(o, cpu.x, 0); op_ldy(rdX(a, 0)); break; }
  case 0x86: op_stx(ea_dp(f8()), 1); break;
  case 0x96: op_stx(ea_dpy(f8()), 1); break;
  case 0x8e: op_stx(ea_abs(f16()), 0); break;
  case 0x84: op_sty(ea_dp(f8()), 1); break;
  case 0x94: op_sty(ea_dpx(f8()), 1); break;
  case 0x8c: op_sty(ea_abs(f16()), 0); break;
  case 0x64: op_stz(ea_dp(f8()), 1); break;
  case 0x74: op_stz(ea_dpx(f8()), 1); break;
  case 0x9c: op_stz(ea_abs(f16()), 0); break;
  case 0x9e: { u16 o = f16(); op_stz(ea_absi(o, cpu.x, 1), 0); break; }
  case 0xe0: op_cpx(fX()); break;
  case 0xe4: a = ea_dp(f8()); op_cpx(rdX(a, 1)); break;
  case 0xec: a = ea_abs(f16()); op_cpx(rdX(a, 0)); break;
  case 0xc0: op_cpy(fX()); break;
  case 0xc4: a = ea_dp(f8()); op_cpy(rdX(a, 1)); break;
  case 0xcc: a = ea_abs(f16()); op_cpy(rdX(a, 0)); break;

  case 0x24: a = ea_dp(f8()); op_bit(rdM(a, 1)); break;
  case 0x34: a = ea_dpx(f8()); op_bit(rdM(a, 1)); break;
  case 0x2c: a = ea_abs(f16()); op_bit(rdM(a, 0)); break;
  case 0x3c: { u16 o = f16(); a = ea_absi(o, cpu.x, 0); op_bit(rdM(a, 0)); break; }

  case 0x0a: op_rmw_a(R_ASL); break; case 0x4a: op_rmw_a(R_LSR); break;
  case 0x2a: op_rmw_a(R_ROL); break; case 0x6a: op_rmw_a(R_ROR); break;
  case 0x1a: op_rmw_a(R_INC); break; case 0x3a: op_rmw_a(R_DEC); break;
  default: {
    static const s8 kind[8] = { R_ASL, R_ROL, R_LSR, R_ROR, -1, -1, R_DEC, R_INC };
    int k = -1;
    u8 lo = op & 0x1f;
    if (lo == 0x06 || lo == 0x0e || lo == 0x16 || lo == 0x1e) k = kind[op >> 5];
    if (op == 0x04 || op == 0x0c) k = R_TSB;
    if (op == 0x14 || op == 0x1c) k = R_TRB;
    if (k < 0) { fprintf(stderr, "bad opcode %02x at %06x\n", op, pc24); break; }
    switch (lo) {
    case 0x04: case 0x06: op_rmw(k, ea_dp(f8()), 1); break;
    case 0x0c: case 0x0e: op_rmw(k, ea_abs(f16()), 0); break;
    case 0x14: if (op == 0x14) { op_rmw(k, ea_dp(f8()), 1); break; }
    case 0x16: op_rmw(k, ea_dpx(f8()), 1); break;
    case 0x1c: op_rmw(k, ea_abs(f16()), 0); break;
    case 0x1e: { u16 o = f16(); op_rmw(k, ea_absi(o, cpu.x, 1), 0); break; }
    }
  }
  }
}

void cpu_serialize(Ser *s) { SER(s, cpu); }
