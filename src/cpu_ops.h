#pragma once
#include "snes.h"

#define M8 (cpu.p & FM)
#define X8 (cpu.p & FX)
#define IO() bus_idle()

static inline u8 rd8(u32 a) { return bus_read(a & 0xffffff); }
static inline void wr8(u32 a, u8 v) { bus_write(a & 0xffffff, v); }
static inline u32 nxt(u32 a, int w) { return w ? (a & 0xff0000) | ((a + 1) & 0xffff) : (a + 1) & 0xffffff; }
static inline u16 rd16(u32 a, int w) { u8 l = rd8(a); return l | rd8(nxt(a, w)) << 8; }
static inline void wr16(u32 a, u16 v, int w) { wr8(a, (u8)v); wr8(nxt(a, w), v >> 8); }
static inline u32 rd24(u32 a, int w) { u16 l = rd16(a, w); return l | rd8(nxt(nxt(a, w), w)) << 16; }

static inline void setnz8(u8 v) { cpu.p = (cpu.p & ~(FN | FZ)) | (v & 0x80) | (v ? 0 : FZ); }
static inline void setnz16(u16 v) { cpu.p = (cpu.p & ~(FN | FZ)) | ((v >> 8) & 0x80) | (v ? 0 : FZ); }

static inline void push8(u8 v) { wr8(cpu.s, v); cpu.s = cpu.e ? 0x100 | ((cpu.s - 1) & 0xff) : cpu.s - 1; }
static inline u8 pull8(void) { cpu.s = cpu.e ? 0x100 | ((cpu.s + 1) & 0xff) : cpu.s + 1; return rd8(cpu.s); }
static inline void push16(u16 v) { push8(v >> 8); push8((u8)v); }
static inline u16 pull16(void) { u8 l = pull8(); return l | pull8() << 8; }

static inline void dpio(void) { if (cpu.d & 0xff) IO(); }
static inline u32 ea_dp(u8 o) { dpio(); return (u16)(cpu.d + o); }
static inline u32 ea_dpx(u8 o) { dpio(); IO(); return (u16)(cpu.d + o + cpu.x); }
static inline u32 ea_dpy(u8 o) { dpio(); IO(); return (u16)(cpu.d + o + cpu.y); }
static inline u32 ea_dpind(u8 o) { dpio(); return (cpu.db << 16) + rd16((u16)(cpu.d + o), 1); }
static inline u32 ea_dpxind(u8 o) { dpio(); IO(); return (cpu.db << 16) + rd16((u16)(cpu.d + o + cpu.x), 1); }
static inline u32 ea_dpindy(u8 o, int wr) {
  dpio(); u16 b = rd16((u16)(cpu.d + o), 1);
  if (wr || !X8 || ((b + cpu.y) & 0xff00) != (b & 0xff00)) IO();
  return ((cpu.db << 16) + b + cpu.y) & 0xffffff;
}
static inline u32 ea_dplong(u8 o) { dpio(); return rd24((u16)(cpu.d + o), 1); }
static inline u32 ea_dplongy(u8 o) { dpio(); return (rd24((u16)(cpu.d + o), 1) + cpu.y) & 0xffffff; }
static inline u32 ea_abs(u16 o) { return (cpu.db << 16) | o; }
static inline u32 ea_absi(u16 o, u16 i, int wr) {
  if (wr || !X8 || ((o + i) & 0xff00) != (o & 0xff00)) IO();
  return ((cpu.db << 16) + o + i) & 0xffffff;
}
static inline u32 ea_long(u32 o) { return o; }
static inline u32 ea_longx(u32 o) { return (o + cpu.x) & 0xffffff; }
static inline u32 ea_sr(u8 o) { IO(); return (u16)(cpu.s + o); }
static inline u32 ea_sriy(u8 o) { IO(); u16 b = rd16((u16)(cpu.s + o), 1); IO(); return ((cpu.db << 16) + b + cpu.y) & 0xffffff; }

static inline u16 rdM(u32 a, int w) { return M8 ? rd8(a) : rd16(a, w); }
static inline u16 rdX(u32 a, int w) { return X8 ? rd8(a) : rd16(a, w); }

static inline void op_lda(u16 v) { if (M8) { cpu.a = (cpu.a & 0xff00) | (u8)v; setnz8((u8)v); } else { cpu.a = v; setnz16(v); } }
static inline void op_ldx(u16 v) { if (X8) { cpu.x = (u8)v; setnz8((u8)v); } else { cpu.x = v; setnz16(v); } }
static inline void op_ldy(u16 v) { if (X8) { cpu.y = (u8)v; setnz8((u8)v); } else { cpu.y = v; setnz16(v); } }
static inline void op_ora(u16 v) { op_lda(cpu.a | v); }
static inline void op_and(u16 v) { op_lda(cpu.a & (v | (M8 ? 0xff00 : 0))); }
static inline void op_eor(u16 v) { op_lda(cpu.a ^ (M8 ? (u8)v : v)); }
static inline void cmpgen(u16 r, u16 v, int b8) {
  if (b8) { int t = (u8)r - (u8)v; cpu.p = (cpu.p & ~FC) | (t >= 0 ? FC : 0); setnz8((u8)t); }
  else { int t = r - v; cpu.p = (cpu.p & ~FC) | (t >= 0 ? FC : 0); setnz16((u16)t); }
}
static inline void op_cmp(u16 v) { cmpgen(cpu.a, v, M8); }
static inline void op_cpx(u16 v) { cmpgen(cpu.x, v, X8); }
static inline void op_cpy(u16 v) { cmpgen(cpu.y, v, X8); }
static inline void op_bit(u16 v) {
  if (M8) { cpu.p = (cpu.p & ~(FN | FV | FZ)) | (v & 0xc0) | ((cpu.a & v & 0xff) ? 0 : FZ); }
  else { cpu.p = (cpu.p & ~(FN | FV | FZ)) | ((v >> 8) & 0xc0) | ((cpu.a & v) ? 0 : FZ); }
}
static inline void op_bit_imm(u16 v) { cpu.p = (cpu.p & ~FZ) | ((cpu.a & v & (M8 ? 0xff : 0xffff)) ? 0 : FZ); }

static inline void op_adc(u16 data) {
  int c = cpu.p & FC, r;
  if (M8) {
    u8 a = (u8)cpu.a; data &= 0xff;
    if (!(cpu.p & FD)) r = a + data + c;
    else {
      r = (a & 0x0f) + (data & 0x0f) + c; if (r > 0x09) r += 0x06; c = r > 0x0f;
      r = (a & 0xf0) + (data & 0xf0) + (c << 4) + (r & 0x0f);
    }
    cpu.p &= ~(FV | FC); if (~(a ^ data) & (a ^ r) & 0x80) cpu.p |= FV;
    if ((cpu.p & FD) && r > 0x9f) r += 0x60;
    if (r > 0xff) cpu.p |= FC;
    cpu.a = (cpu.a & 0xff00) | (u8)r; setnz8((u8)r);
  } else {
    u16 a = cpu.a;
    if (!(cpu.p & FD)) r = a + data + c;
    else {
      r = (a & 0x000f) + (data & 0x000f) + c; if (r > 0x0009) r += 0x0006; c = r > 0x000f;
      r = (a & 0x00f0) + (data & 0x00f0) + (c << 4) + (r & 0x000f); if (r > 0x009f) r += 0x0060; c = r > 0x00ff;
      r = (a & 0x0f00) + (data & 0x0f00) + (c << 8) + (r & 0x00ff); if (r > 0x09ff) r += 0x0600; c = r > 0x0fff;
      r = (a & 0xf000) + (data & 0xf000) + (c << 12) + (r & 0x0fff);
    }
    cpu.p &= ~(FV | FC); if (~(a ^ data) & (a ^ r) & 0x8000) cpu.p |= FV;
    if ((cpu.p & FD) && r > 0x9fff) r += 0x6000;
    if (r > 0xffff) cpu.p |= FC;
    cpu.a = (u16)r; setnz16((u16)r);
  }
}
static inline void op_sbc(u16 data) {
  int c = cpu.p & FC, r;
  if (M8) {
    u8 a = (u8)cpu.a; data = ~data & 0xff;
    if (!(cpu.p & FD)) r = a + data + c;
    else {
      r = (a & 0x0f) + (data & 0x0f) + c; if (r <= 0x0f) r -= 0x06; c = r > 0x0f;
      r = (a & 0xf0) + (data & 0xf0) + (c << 4) + (r & 0x0f);
    }
    cpu.p &= ~(FV | FC); if (~(a ^ data) & (a ^ r) & 0x80) cpu.p |= FV;
    if ((cpu.p & FD) && r <= 0xff) r -= 0x60;
    if (r > 0xff) cpu.p |= FC;
    cpu.a = (cpu.a & 0xff00) | (u8)r; setnz8((u8)r);
  } else {
    u16 a = cpu.a; data = ~data;
    if (!(cpu.p & FD)) r = a + data + c;
    else {
      r = (a & 0x000f) + (data & 0x000f) + c; if (r <= 0x000f) r -= 0x0006; c = r > 0x000f;
      r = (a & 0x00f0) + (data & 0x00f0) + (c << 4) + (r & 0x000f); if (r <= 0x00ff) r -= 0x0060; c = r > 0x00ff;
      r = (a & 0x0f00) + (data & 0x0f00) + (c << 8) + (r & 0x00ff); if (r <= 0x0fff) r -= 0x0600; c = r > 0x0fff;
      r = (a & 0xf000) + (data & 0xf000) + (c << 12) + (r & 0x0fff);
    }
    cpu.p &= ~(FV | FC); if (~(a ^ data) & (a ^ r) & 0x8000) cpu.p |= FV;
    if ((cpu.p & FD) && r <= 0xffff) r -= 0x6000;
    if (r > 0xffff) cpu.p |= FC;
    cpu.a = (u16)r; setnz16((u16)r);
  }
}

static inline void op_sta(u32 a, int w) { if (M8) wr8(a, (u8)cpu.a); else wr16(a, cpu.a, w); }
static inline void op_stx(u32 a, int w) { if (X8) wr8(a, (u8)cpu.x); else wr16(a, cpu.x, w); }
static inline void op_sty(u32 a, int w) { if (X8) wr8(a, (u8)cpu.y); else wr16(a, cpu.y, w); }
static inline void op_stz(u32 a, int w) { if (M8) wr8(a, 0); else wr16(a, 0, w); }

enum { R_ASL, R_LSR, R_ROL, R_ROR, R_INC, R_DEC, R_TSB, R_TRB };
static inline u16 rmw_val(int k, u16 v) {
  int b8 = M8; u16 msk = b8 ? 0xff : 0xffff, hib = b8 ? 0x80 : 0x8000; u16 r;
  switch (k) {
  case R_ASL: cpu.p = (cpu.p & ~FC) | ((v & hib) ? FC : 0); r = (v << 1) & msk; break;
  case R_LSR: cpu.p = (cpu.p & ~FC) | (v & 1); r = (v & msk) >> 1; break;
  case R_ROL: { int c = cpu.p & FC; cpu.p = (cpu.p & ~FC) | ((v & hib) ? FC : 0); r = ((v << 1) | c) & msk; break; }
  case R_ROR: { int c = cpu.p & FC; cpu.p = (cpu.p & ~FC) | (v & 1); r = ((v & msk) >> 1) | (c ? hib : 0); break; }
  case R_INC: r = (v + 1) & msk; break;
  case R_DEC: r = (v - 1) & msk; break;
  case R_TSB: cpu.p = (cpu.p & ~FZ) | ((v & cpu.a & msk) ? 0 : FZ); return (v | cpu.a) & msk;
  default:    cpu.p = (cpu.p & ~FZ) | ((v & cpu.a & msk) ? 0 : FZ); return (v & ~cpu.a) & msk;
  }
  if (b8) setnz8((u8)r); else setnz16(r);
  return r;
}
static inline void op_rmw(int k, u32 a, int w) {
  if (M8) { u8 v = rd8(a); IO(); wr8(a, (u8)rmw_val(k, v)); }
  else { u16 v = rd16(a, w); IO(); u16 r = rmw_val(k, v); wr8(nxt(a, w), r >> 8); wr8(a, (u8)r); }
}
static inline void op_rmw_a(int k) { IO(); u16 r = rmw_val(k, M8 ? (cpu.a & 0xff) : cpu.a); if (M8) cpu.a = (cpu.a & 0xff00) | r; else cpu.a = r; }

static inline void fix_mode(void) {
  if (cpu.e) { cpu.p |= FM | FX; cpu.s = 0x100 | (cpu.s & 0xff); }
  if (cpu.p & FX) { cpu.x &= 0xff; cpu.y &= 0xff; }
}
static inline void op_rep(u8 v) { IO(); cpu.p &= ~v; fix_mode(); }
static inline void op_sep(u8 v) { IO(); cpu.p |= v; fix_mode(); }
static inline void op_xce(void) { IO(); int c = cpu.p & FC; cpu.p = (cpu.p & ~FC) | cpu.e; cpu.e = c; fix_mode(); }
static inline void op_plp(void) { IO(); IO(); cpu.p = pull8(); fix_mode(); }

static inline void tr_a(u16 v) { op_lda(v); }
static inline void op_tax(void) { IO(); op_ldx(cpu.a); }
static inline void op_tay(void) { IO(); op_ldy(cpu.a); }
static inline void op_txa(void) { IO(); op_lda(cpu.x); }
static inline void op_tya(void) { IO(); op_lda(cpu.y); }
static inline void op_txy(void) { IO(); op_ldy(cpu.x); }
static inline void op_tyx(void) { IO(); op_ldx(cpu.y); }
static inline void op_tsx(void) { IO(); op_ldx(cpu.s); }
static inline void op_txs(void) { IO(); cpu.s = cpu.e ? 0x100 | (cpu.x & 0xff) : cpu.x; }
static inline void op_tcs(void) { IO(); cpu.s = cpu.e ? 0x100 | (cpu.a & 0xff) : cpu.a; }
static inline void op_tsc(void) { IO(); cpu.a = cpu.s; setnz16(cpu.a); }
static inline void op_tcd(void) { IO(); cpu.d = cpu.a; setnz16(cpu.a); }
static inline void op_tdc(void) { IO(); cpu.a = cpu.d; setnz16(cpu.a); }
static inline void op_xba(void) { IO(); IO(); cpu.a = (cpu.a >> 8) | (cpu.a << 8); setnz8((u8)cpu.a); }
static inline void op_inx(void) { IO(); op_ldx(cpu.x + 1); }
static inline void op_iny(void) { IO(); op_ldy(cpu.y + 1); }
static inline void op_dex(void) { IO(); op_ldx(cpu.x - 1); }
static inline void op_dey(void) { IO(); op_ldy(cpu.y - 1); }

static inline void op_pha(void) { IO(); if (M8) push8((u8)cpu.a); else push16(cpu.a); }
static inline void op_phx(void) { IO(); if (X8) push8((u8)cpu.x); else push16(cpu.x); }
static inline void op_phy(void) { IO(); if (X8) push8((u8)cpu.y); else push16(cpu.y); }
static inline void op_pla(void) { IO(); IO(); op_lda(M8 ? pull8() : pull16()); }
static inline void op_plx(void) { IO(); IO(); op_ldx(X8 ? pull8() : pull16()); }
static inline void op_ply(void) { IO(); IO(); op_ldy(X8 ? pull8() : pull16()); }
static inline void op_phb(void) { IO(); push8(cpu.db); }
static inline void op_phk(void) { IO(); push8(cpu.pb); }
static inline void op_phd(void) { IO(); push16(cpu.d); }
static inline void op_php(void) { IO(); push8(cpu.p); }
static inline void op_plb(void) { IO(); IO(); cpu.db = pull8(); setnz8(cpu.db); }
static inline void op_pld(void) { IO(); IO(); cpu.d = pull16(); setnz16(cpu.d); }

static inline bool op_mv(int inc, u8 dstb, u8 srcb) {
  cpu.db = dstb;
  u8 v = rd8((srcb << 16) | cpu.x);
  wr8((dstb << 16) | cpu.y, v);
  IO(); IO();
  if (inc) { cpu.x++; cpu.y++; } else { cpu.x--; cpu.y--; }
  if (X8) { cpu.x &= 0xff; cpu.y &= 0xff; }
  return cpu.a-- != 0;
}

static inline void cpu_interrupt(u16 nvec, u16 evec, bool brk) {
  if (!cpu.e) push8(cpu.pb);
  push16(cpu.pc);
  push8(cpu.e ? ((cpu.p & ~0x10) | (brk ? 0x10 : 0)) : cpu.p);
  cpu.p = (cpu.p | FI) & ~FD;
  cpu.pb = 0;
  cpu.pc = rd16(cpu.e ? evec : nvec, 0);
}
