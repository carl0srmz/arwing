#pragma once
#include "snes.h"

#define GSU_RAM_MASK 0xffff
enum { SZ = 0x0002, SCY = 0x0004, SS = 0x0008, SOV = 0x0010, SG = 0x0020, SR = 0x0040,
       SALT1 = 0x0100, SALT2 = 0x0200, SB = 0x1000, SIRQ = 0x8000 };

typedef struct {
  u16 r[16];
  u16 sfr, cbr, ramaddr;
  u8 pbr, rombr, rambr, cfgr, scbr, clsr, scmr, bramr, colr, por;
  u8 sreg, dreg, pipeline, romdr;
  u32 paddr, curaddr;
  bool r15mod;
  u8 cache[512]; bool cvalid[32];
  struct { u8 data[8]; u8 bitpend; u16 offset; } pc[2];
  u64 clock; u32 cfrac;
  bool cache_written;
} Gsu;
extern Gsu g;

void gsu_flush_pixel_cache(int i);
extern bool gsu_hooks_enabled;
bool gsu_is_hook(int rom_off);
void gsu_hook(int rom_off);
#define GSU_HOOK(off) if (gsu_hooks_enabled) gsu_hook(off)
void gsu_plot(u8 x, u8 y);
u8 gsu_rpix(u8 x, u8 y);
u8 gsu_read_opcode(u16 addr);

extern u32 gsu_mul;
static inline void gstep(int n) { u32 t = g.cfrac + n * gsu_mul; g.clock += t >> 8; g.cfrac = t & 255; }
static inline int memcyc(void) { return g.clsr ? 5 : 6; }

static inline u8 gread(u32 a) {
  u8 b = (a >> 16) & 0x7f;
  if (b < 0x40) return rom[((((u32)b) << 15) | (a & 0x7fff)) & (rom_size - 1)];
  if (b < 0x60) return rom[((((u32)b & 0x1f) << 16) | (a & 0xffff)) & (rom_size - 1)];
  if (b >= 0x70 && b <= 0x71) return gsu_ram[(((b & 1) << 16) | (a & 0xffff)) & GSU_RAM_MASK];
  return 0;
}
extern int hd_active_scale;
void hd_gsu_ram_written(u32 addr);
void hd_plot(u8 x, u8 y, u8 color);
void hd_gsu_started(void);
u32 gsu_char_addr(u8 x, u8 y, int *bpp);
static inline void gwrite_raw(u32 a, u8 v) {
  u8 b = (a >> 16) & 0x7f;
  if (b >= 0x70 && b <= 0x71) gsu_ram[(((b & 1) << 16) | (a & 0xffff)) & GSU_RAM_MASK] = v;
}
static inline void gwrite(u32 a, u8 v) { gwrite_raw(a, v); if (hd_active_scale) hd_gsu_ram_written(a); }
static inline void flush_cache(void) { memset(g.cvalid, 0, sizeof g.cvalid); }

static inline u8 peekpipe(void) { u8 r = g.pipeline; g.curaddr = g.paddr; g.paddr = (g.pbr << 16) | g.r[15]; g.pipeline = gsu_read_opcode(g.r[15]); g.r15mod = false; return r; }
static inline u8 pipe(void) { u8 r = g.pipeline; g.paddr = (g.pbr << 16) | (u16)(g.r[15] + 1); g.pipeline = gsu_read_opcode(++g.r[15]); g.r15mod = false; return r; }

static inline void update_rom_buffer(void) { gstep(memcyc()); g.romdr = gread((g.rombr << 16) | g.r[14]); }
static inline void wreg(int n, u16 v) { g.r[n] = v; if (n == 14) update_rom_buffer(); if (n == 15) g.r15mod = true; }
static inline u16 SRC(void) { return g.r[g.sreg]; }
static inline void DST(u16 v) { wreg(g.dreg, v); }
static inline int ALT(void) { return (g.sfr >> 8) & 3; }
static inline void reset_prefix(void) { g.sfr &= ~(SALT1 | SALT2 | SB); g.sreg = g.dreg = 0; }
static inline void flag(u16 f, bool on) { if (on) g.sfr |= f; else g.sfr &= ~f; }
static inline void sz(u16 v) { flag(SS, v & 0x8000); flag(SZ, v == 0); }

static inline u8 ram_rd(u16 a) { gstep(memcyc()); return gread(((0x70 + g.rambr) << 16) | a); }
static inline void ram_wr(u16 a, u8 v) { gstep(memcyc()); gwrite(((0x70 + g.rambr) << 16) | a, v); }
static inline u16 ram_rd16(u16 a) { return ram_rd(a) | ram_rd(a ^ 1) << 8; }
static inline void ram_wr16(u16 a, u16 v) { ram_wr(a, (u8)v); ram_wr(a ^ 1, v >> 8); }

static inline u8 color_of(u8 src) {
  if (g.por & 4) return (g.colr & 0xf0) | (src >> 4);
  if (g.por & 8) return (g.colr & 0xf0) | (src & 0x0f);
  return src;
}

static inline void g_stop(void) { if (!(g.cfgr & 0x80)) g.sfr |= SIRQ; g.sfr &= ~SG; g.pipeline = 0x01; g.paddr = 0x800000; reset_prefix(); }
static inline void g_nop(void) { reset_prefix(); }
static inline void g_cache(void) { if (g.cbr != (g.r[15] & 0xfff0)) { g.cbr = g.r[15] & 0xfff0; flush_cache(); } reset_prefix(); }
static inline void g_lsr(void) { u16 s = SRC(); flag(SCY, s & 1); u16 v = s >> 1; DST(v); sz(v); reset_prefix(); }
static inline void g_rol(void) { u16 s = SRC(); bool c = s >> 15; u16 v = (s << 1) | ((g.sfr & SCY) ? 1 : 0); DST(v); flag(SCY, c); sz(v); reset_prefix(); }
static inline bool g_cond(int op) {
  bool S = g.sfr & SS, O = g.sfr & SOV, Z = g.sfr & SZ, C = g.sfr & SCY;
  switch (op) {
  case 0x05: return true; case 0x06: return (S ^ O) == 0; case 0x07: return (S ^ O) != 0;
  case 0x08: return !Z; case 0x09: return Z; case 0x0a: return !S; case 0x0b: return S;
  case 0x0c: return !C; case 0x0d: return C; case 0x0e: return !O; default: return O;
  }
}
static inline void g_branch(int op, s8 d) { if (g_cond(op)) { g.r[15] += d; g.r15mod = true; } }
static inline void g_to(int n) { if (!(g.sfr & SB)) { g.dreg = n; return; } wreg(n, SRC()); reset_prefix(); }
static inline void g_with(int n) { g.sreg = g.dreg = n; g.sfr |= SB; }
static inline void g_stw(int n) { g.ramaddr = g.r[n]; if (ALT() & 1) ram_wr(g.ramaddr, (u8)SRC()); else ram_wr16(g.ramaddr, SRC()); reset_prefix(); }
static inline void g_loop(void) { g.r[12]--; flag(SS, g.r[12] & 0x8000); flag(SZ, g.r[12] == 0); if (g.r[12]) wreg(15, g.r[13]); reset_prefix(); }
static inline void g_alt1(void) { g.sfr = (g.sfr & ~SB) | SALT1; }
static inline void g_alt2(void) { g.sfr = (g.sfr & ~SB) | SALT2; }
static inline void g_alt3(void) { g.sfr = (g.sfr & ~SB) | SALT1 | SALT2; }
static inline void g_ldw(int n) { g.ramaddr = g.r[n]; DST((ALT() & 1) ? ram_rd(g.ramaddr) : ram_rd16(g.ramaddr)); reset_prefix(); }
static inline void g_plot(void) {
  if (!(ALT() & 1)) { gsu_plot((u8)g.r[1], (u8)g.r[2]); g.r[1]++; }
  else { u16 v = gsu_rpix((u8)g.r[1], (u8)g.r[2]); DST(v); sz(v); }
  reset_prefix();
}
static inline void g_swap(void) { u16 s = SRC(); u16 v = (s >> 8) | (s << 8); DST(v); sz(v); reset_prefix(); }
static inline void g_color(void) { if (ALT() & 1) g.por = (u8)SRC(); else g.colr = color_of((u8)SRC()); reset_prefix(); }
static inline void g_not(void) { u16 v = ~SRC(); DST(v); sz(v); reset_prefix(); }
static inline void g_add(int n) {
  int alt = ALT(); u16 s = SRC(); u16 o = (alt & 2) ? n : g.r[n];
  s32 r = s + o + ((alt & 1) && (g.sfr & SCY) ? 1 : 0);
  flag(SOV, ~(s ^ o) & (o ^ r) & 0x8000); flag(SS, r & 0x8000); flag(SCY, r >= 0x10000); flag(SZ, (u16)r == 0);
  DST((u16)r); reset_prefix();
}
static inline void g_sub(int n) {
  int alt = ALT(); u16 s = SRC(); u16 o = (alt == 2) ? n : g.r[n];
  s32 r = s - o - ((alt == 1) && !(g.sfr & SCY) ? 1 : 0);
  flag(SOV, (s ^ o) & (s ^ r) & 0x8000); flag(SS, r & 0x8000); flag(SCY, r >= 0); flag(SZ, (u16)r == 0);
  if (alt != 3) DST((u16)r);
  reset_prefix();
}
static inline void g_merge(void) {
  u16 v = (g.r[7] & 0xff00) | (g.r[8] >> 8); DST(v);
  flag(SOV, v & 0xc0c0); flag(SS, v & 0x8080); flag(SCY, v & 0xe0e0); flag(SZ, v & 0xf0f0);
  reset_prefix();
}
static inline void g_and(int n) { int alt = ALT(); u16 s = SRC(); u16 o = (alt & 2) ? n : g.r[n]; u16 v = (alt & 1) ? (s & ~o) : (s & o); DST(v); sz(v); reset_prefix(); }
static inline void g_mult(int n) {
  int alt = ALT(); u16 s = SRC(); u16 o = (alt & 2) ? n : g.r[n];
  u16 v = (alt & 1) ? (u16)((u8)s * (u8)o) : (u16)((s8)s * (s8)o);
  DST(v); sz(v); reset_prefix();
  if (!(g.cfgr & 0x20)) gstep(g.clsr ? 1 : 2);
}
static inline void g_sbk(void) { ram_wr16(g.ramaddr, SRC()); reset_prefix(); }
static inline void g_link(int n) { g.r[11] = g.r[15] + n; reset_prefix(); }
static inline void g_sex(void) { u16 v = (u16)(s16)(s8)SRC(); DST(v); sz(v); reset_prefix(); }
static inline void g_asr(void) { u16 s = SRC(); flag(SCY, s & 1); u16 v = (u16)(((s16)s >> 1) + ((ALT() & 1) ? ((s + 1) >> 16) : 0)); DST(v); sz(v); reset_prefix(); }
static inline void g_ror(void) { u16 s = SRC(); bool c = s & 1; u16 v = ((g.sfr & SCY) ? 0x8000 : 0) | (s >> 1); DST(v); flag(SCY, c); sz(v); reset_prefix(); }
static inline void g_jmp(int n) {
  if (!(ALT() & 1)) wreg(15, g.r[n]);
  else { u16 s = SRC(); g.pbr = g.r[n] & 0x7f; wreg(15, s); g.cbr = g.r[15] & 0xfff0; flush_cache(); }
  reset_prefix();
}
static inline void g_lob(void) { u16 v = SRC() & 0xff; DST(v); flag(SS, v & 0x80); flag(SZ, v == 0); reset_prefix(); }
static inline void g_fmult(void) {
  u32 res = (u32)((s32)(s16)SRC() * (s32)(s16)g.r[6]);
  if (ALT() & 1) wreg(4, (u16)res);
  u16 v = res >> 16; DST(v);
  flag(SS, v & 0x8000); flag(SCY, res & 0x8000); flag(SZ, v == 0);
  reset_prefix();
  gstep(((g.cfgr & 0x20) ? 3 : 7) * (g.clsr ? 1 : 2));
}
static inline void g_ibt(int n, u8 imm) {
  int alt = ALT();
  if (alt & 1) { g.ramaddr = imm << 1; wreg(n, ram_rd16(g.ramaddr)); }
  else if (alt & 2) { g.ramaddr = imm << 1; ram_wr16(g.ramaddr, g.r[n]); }
  else wreg(n, (u16)(s16)(s8)imm);
  reset_prefix();
}
static inline void g_from(int n) {
  if (!(g.sfr & SB)) { g.sreg = n; return; }
  u16 v = g.r[n]; DST(v); flag(SOV, v & 0x80); flag(SS, v & 0x8000); flag(SZ, v == 0); reset_prefix();
}
static inline void g_hib(void) { u16 v = SRC() >> 8; DST(v); flag(SS, v & 0x80); flag(SZ, v == 0); reset_prefix(); }
static inline void g_or(int n) { int alt = ALT(); u16 s = SRC(); u16 o = (alt & 2) ? n : g.r[n]; u16 v = (alt & 1) ? (s ^ o) : (s | o); DST(v); sz(v); reset_prefix(); }
static inline void g_inc(int n) { wreg(n, g.r[n] + 1); sz(g.r[n]); reset_prefix(); }
static inline void g_dec(int n) { wreg(n, g.r[n] - 1); sz(g.r[n]); reset_prefix(); }
static inline void g_getc(void) {
  int alt = ALT();
  if (!(alt & 2)) g.colr = color_of(g.romdr);
  else if (!(alt & 1)) g.rambr = SRC() & 1;
  else g.rombr = SRC() & 0x7f;
  reset_prefix();
}
static inline void g_getb(void) {
  u16 s = SRC(), v;
  switch (ALT()) {
  case 0: v = g.romdr; break;
  case 1: v = (g.romdr << 8) | (s & 0xff); break;
  case 2: v = (s & 0xff00) | g.romdr; break;
  default: v = (u16)(s16)(s8)g.romdr; break;
  }
  DST(v); reset_prefix();
}
static inline void g_iwt(int n, u16 imm) {
  int alt = ALT();
  if (alt & 1) { g.ramaddr = imm; wreg(n, ram_rd16(g.ramaddr)); }
  else if (alt & 2) { g.ramaddr = imm; ram_wr16(g.ramaddr, g.r[n]); }
  else wreg(n, imm);
  reset_prefix();
}

static inline void gsu_exec_op(u8 op) {
  int n = op & 15;
  switch (op >> 4) {
  case 0x0:
    switch (op) {
    case 0x00: g_stop(); return;
    case 0x01: g_nop(); return;
    case 0x02: g_cache(); return;
    case 0x03: g_lsr(); return;
    case 0x04: g_rol(); return;
    default: { s8 d = (s8)pipe(); g_branch(op, d); return; }
    }
  case 0x1: g_to(n); return;
  case 0x2: g_with(n); return;
  case 0x3:
    if (n < 12) { g_stw(n); return; }
    if (n == 12) g_loop(); else if (n == 13) g_alt1(); else if (n == 14) g_alt2(); else g_alt3();
    return;
  case 0x4:
    if (n < 12) { g_ldw(n); return; }
    if (n == 12) g_plot(); else if (n == 13) g_swap(); else if (n == 14) g_color(); else g_not();
    return;
  case 0x5: g_add(n); return;
  case 0x6: g_sub(n); return;
  case 0x7: if (n == 0) g_merge(); else g_and(n); return;
  case 0x8: g_mult(n); return;
  case 0x9:
    switch (n) {
    case 0: g_sbk(); return;
    case 1: case 2: case 3: case 4: g_link(n); return;
    case 5: g_sex(); return;
    case 6: g_asr(); return;
    case 7: g_ror(); return;
    case 14: g_lob(); return;
    case 15: g_fmult(); return;
    default: g_jmp(n); return;
    }
  case 0xa: { u8 i = pipe(); g_ibt(n, i); return; }
  case 0xb: g_from(n); return;
  case 0xc: if (n == 0) g_hib(); else g_or(n); return;
  case 0xd: if (n < 15) g_inc(n); else g_getc(); return;
  case 0xe: if (n < 15) g_dec(n); else g_getb(); return;
  default: { u8 l = pipe(); u8 h = pipe(); g_iwt(n, l | h << 8); return; }
  }
}
