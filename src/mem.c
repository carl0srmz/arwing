#include "snes.h"
#include "cpu_ops.h"

u8 *rom; u32 rom_size;
u32 *wram_src;
static struct { u8 v; bool used; u32 src; } rdq[4]; static int rdq_n; static u32 rdq_id;
u32 cpu_instr_id;
s32 hd_dma_src = -1;
u8 wram[0x20000];
u64 master_clock;
int hcount, vcount;
bool frame_done;
bool nmi_line, irq_line;

#define LINE_MC 1364
#define LINES 262
#define RENDER_HC 1024
#define HDMA_HC 1104

static u8 mdr;
static u32 wmadd;
static u8 nmitimen, wrio = 0xff, wrmpya, memsel;
static u16 wrdiv, rddiv, rdmpy, htime = 0x1ff, vtime = 0x1ff;
static bool rdnmi, vblank, hdma_inited, rendered, hdma_done, irq_fired_line;
bool nmi_pending, timeup;
extern bool rc_enabled; bool rc_try(void);
static u16 pad_state[2], joy_auto[4];
static u32 joy_latch[2]; static u8 joy_strobe;

typedef struct {
  u8 dmap, bbad, a1b, dasb, ntrl, unk;
  u16 a1t, das, a2a;
  bool terminated, do_transfer;
} Dma;
static Dma dma[8];
static u8 hdmaen;

static int speed(u32 a) {
  u8 b = a >> 16; u16 o = (u16)a;
  if (b >= 0x40 && b < 0x80) return 8;
  if (b >= 0xc0) return (memsel & 1) ? 6 : 8;
  if (o < 0x2000) return 8;
  if (o < 0x4000) return 6;
  if (o < 0x4200) return 12;
  if (o < 0x6000) return 6;
  if (o < 0x8000) return 8;
  return (b >= 0x80 && (memsel & 1)) ? 6 : 8;
}

static void hdma_init(void);
static void hdma_run(void);

static void new_line(void) {
  hcount -= LINE_MC;
  apu_catchup();
  gsu_catchup();
  vcount++;
  rendered = hdma_done = irq_fired_line = false;
  if (vcount == LINES) {
    vcount = 0; vblank = false; rdnmi = false; hdma_inited = false;
  }
  if (vcount == (ppu_overscan ? 240 : 225)) {
    vblank = true; rdnmi = true;
    if (nmitimen & 0x80) nmi_pending = true;
    if (nmitimen & 1) { joy_auto[0] = pad_state[0]; joy_auto[1] = pad_state[1]; }
    frame_done = true;
  }
}

static void check_irq(void) {
  int mode = (nmitimen >> 4) & 3;
  if (!mode || irq_fired_line) return;
  int trig = (mode == 2) ? 10 : htime * 4 + 14;
  if (mode != 1 && vcount != vtime) return;
  if (hcount >= trig) { irq_fired_line = true; timeup = true; }
}

static void tick(int c) {
  master_clock += c;
  hcount += c;
  if (!hdma_inited && vcount == 0 && hcount >= 12) { hdma_inited = true; hdma_init(); }
  check_irq();
  if (!rendered && hcount >= RENDER_HC) {
    rendered = true;
    int last = ppu_overscan ? 239 : 224;
    if (vcount >= 1 && vcount <= last) ppu_render_line(vcount);
  }
  if (!hdma_done && hcount >= HDMA_HC) {
    hdma_done = true;
    if (vcount <= (ppu_overscan ? 239 : 224)) hdma_run();
  }
  if (hcount >= LINE_MC) new_line();
}

void bus_idle(void) { tick(6); }
void bus_fetch(u16 a, int n, u8 last) { int s = speed((cpu.pb << 16) | a); while (n--) tick(s); mdr = last; }

static u8 io_read(u16 a) {
  switch (a) {
  case 0x4016: { u8 v = (joy_latch[0] & 1); joy_latch[0] = (joy_latch[0] >> 1) | 0x80000000; return (mdr & 0xfc) | v; }
  case 0x4017: { u8 v = (joy_latch[1] & 1); joy_latch[1] = (joy_latch[1] >> 1) | 0x80000000; return (mdr & 0xe0) | 0x1c | v; }
  case 0x4210: { u8 v = (rdnmi ? 0x80 : 0) | 0x02 | (mdr & 0x70); rdnmi = false; return v; }
  case 0x4211: { u8 v = (timeup ? 0x80 : 0) | (mdr & 0x7f); timeup = false; return v; }
  case 0x4212: {
    bool hb = hcount < 4 || hcount >= 1096;
    bool busy = (nmitimen & 1) && vcount >= 225 && vcount <= 227;
    return (vblank ? 0x80 : 0) | (hb ? 0x40 : 0) | (busy ? 1 : 0) | (mdr & 0x3e);
  }
  case 0x4213: return wrio;
  case 0x4214: return (u8)rddiv; case 0x4215: return rddiv >> 8;
  case 0x4216: return (u8)rdmpy; case 0x4217: return rdmpy >> 8;
  case 0x4218: return (u8)joy_auto[0]; case 0x4219: return joy_auto[0] >> 8;
  case 0x421a: return (u8)joy_auto[1]; case 0x421b: return joy_auto[1] >> 8;
  case 0x421c: case 0x421d: case 0x421e: case 0x421f: return 0;
  }
  if (a >= 0x4300 && a < 0x4380) {
    Dma *d = &dma[(a >> 4) & 7];
    switch (a & 15) {
    case 0: return d->dmap; case 1: return d->bbad; case 2: return (u8)d->a1t; case 3: return d->a1t >> 8;
    case 4: return d->a1b; case 5: return (u8)d->das; case 6: return d->das >> 8; case 7: return d->dasb;
    case 8: return (u8)d->a2a; case 9: return d->a2a >> 8; case 10: return d->ntrl; case 11: case 15: return d->unk;
    }
  }
  return mdr;
}

static void do_dma(u8 mask);

static void io_write(u16 a, u8 v) {
  switch (a) {
  case 0x4016: if ((joy_strobe & 1) && !(v & 1)) { joy_latch[0] = pad_state[0] << 16 | 0xffff; joy_latch[1] = pad_state[1] << 16 | 0xffff;
      for (int p = 0; p < 2; p++) { u32 r = 0; for (int i = 0; i < 16; i++) if (pad_state[p] & (0x8000 >> i)) r |= 1u << i; joy_latch[p] = r | 0xffff0000; } }
    joy_strobe = v; return;
  case 0x4200:
    if (!(nmitimen & 0x80) && (v & 0x80) && rdnmi) nmi_pending = true;
    nmitimen = v; if (!(v & 0x30)) timeup = false; return;
  case 0x4201: if ((wrio & 0x80) && !(v & 0x80)) ppu_latch_counters(); wrio = v; return;
  case 0x4202: wrmpya = v; return;
  case 0x4203: rdmpy = wrmpya * v; rddiv = v; return;
  case 0x4204: wrdiv = (wrdiv & 0xff00) | v; return;
  case 0x4205: wrdiv = (wrdiv & 0xff) | v << 8; return;
  case 0x4206: if (v) { rddiv = wrdiv / v; rdmpy = wrdiv % v; } else { rddiv = 0xffff; rdmpy = wrdiv; } return;
  case 0x4207: htime = (htime & 0x100) | v; return;
  case 0x4208: htime = (htime & 0xff) | (v & 1) << 8; return;
  case 0x4209: vtime = (vtime & 0x100) | v; return;
  case 0x420a: vtime = (vtime & 0xff) | (v & 1) << 8; return;
  case 0x420b: do_dma(v); return;
  case 0x420c: hdmaen = v; return;
  case 0x420d: memsel = v; return;
  }
  if (a >= 0x4300 && a < 0x4380) {
    Dma *d = &dma[(a >> 4) & 7];
    switch (a & 15) {
    case 0: d->dmap = v; break; case 1: d->bbad = v; break;
    case 2: d->a1t = (d->a1t & 0xff00) | v; break; case 3: d->a1t = (d->a1t & 0xff) | v << 8; break;
    case 4: d->a1b = v; break;
    case 5: d->das = (d->das & 0xff00) | v; break; case 6: d->das = (d->das & 0xff) | v << 8; break;
    case 7: d->dasb = v; break;
    case 8: d->a2a = (d->a2a & 0xff00) | v; break; case 9: d->a2a = (d->a2a & 0xff) | v << 8; break;
    case 10: d->ntrl = v; break; case 11: case 15: d->unk = v; break;
    }
  }
}

static u8 bbus_read(u8 r) {
  if (r < 0x40) return ppu_read(0x2100 | r);
  if (r < 0x80) { apu_catchup(); return apu_read(r & 3); }
  if (r == 0x80) { u8 v = wram[wmadd]; wmadd = (wmadd + 1) & 0x1ffff; return v; }
  return mdr;
}
static void bbus_write(u8 r, u8 v) {
  if (r < 0x40) { ppu_write(0x2100 | r, v); return; }
  if (r < 0x80) { apu_catchup(); apu_write(r & 3, v); return; }
  switch (r) {
  case 0x80: wram[wmadd] = v; wmadd = (wmadd + 1) & 0x1ffff; break;
  case 0x81: wmadd = (wmadd & 0x1ff00) | v; break;
  case 0x82: wmadd = (wmadd & 0x100ff) | v << 8; break;
  case 0x83: wmadd = (wmadd & 0x0ffff) | (v & 1) << 16; break;
  }
}

static inline u32 lorom(u32 a) { return ((((a >> 16) & 0x3f) << 15) | (a & 0x7fff)) & (rom_size - 1); }
static inline u32 hirom(u32 a) { return (((a >> 16) & 0x1f) << 16 | (a & 0xffff)) & (rom_size - 1); }

static u8 mem_read(u32 a, bool side) {
  u8 b = a >> 16; u16 o = (u16)a;
  if ((b & 0x7f) < 0x40) {
    if (o < 0x2000) return wram[o];
    if (o >= 0x8000) return rom[lorom(a)];
    if (o >= 0x6000) return gsu_ram[o & 0x1fff];
    if (!side) return mdr;
    if (o >= 0x3000 && o < 0x3500) return gsu_read(o);
    if (o >= 0x2100 && o < 0x2200) return bbus_read(o & 0xff);
    if (o >= 0x4000 && o < 0x4400) return io_read(o);
    return mdr;
  }
  if (b == 0x7e || b == 0x7f) return wram[a & 0x1ffff];
  if ((b & 0x7f) < 0x60) return rom[hirom(a)];
  if ((b & 0x7e) == 0x70) return gsu_ram[a & 0xffff];
  return mdr;
}

static void mem_write(u32 a, u8 v) {
  u8 b = a >> 16; u16 o = (u16)a;
  if ((b & 0x7f) < 0x40) {
    if (o < 0x2000) { wram[o] = v; return; }
    if (o >= 0x8000) return;
    if (o >= 0x6000) { gsu_ram[o & 0x1fff] = v; if (hd_active_scale) hd_gsu_ram_written(o & 0x1fff); return; }
    if (o >= 0x3000 && o < 0x3500) { gsu_write(o, v); return; }
    if (o >= 0x2100 && o < 0x2200) { bbus_write(o & 0xff, v); return; }
    if (o >= 0x4000 && o < 0x4400) { io_write(o, v); return; }
    return;
  }
  if (b == 0x7e || b == 0x7f) { wram[a & 0x1ffff] = v; return; }
  if ((b & 0x7e) == 0x70) { gsu_ram[a & 0xffff] = v; if (hd_active_scale) hd_gsu_ram_written(a); return; }
}

int wram_index(u32 a) {
  u8 b = a >> 16;
  if (b == 0x7e || b == 0x7f) return a & 0x1ffff;
  if ((b & 0x7f) < 0x40 && (a & 0xffff) < 0x2000) return a & 0x1fff;
  return -1;
}
int rom_offset(u32 a) {
  u8 b = a >> 16;
  if ((b & 0x7f) < 0x40) return (a & 0xffff) >= 0x8000 ? (int)lorom(a) : -1;
  if ((b & 0x7f) < 0x60) return (int)hirom(a);
  return -1;
}
static u32 src_of(u32 a) { int r = rom_offset(a); if (r >= 0) return r + 1; int w = wram_index(a); return w >= 0 ? wram_src[w] : 0; }

u8 bus_read(u32 a) {
  tick(speed(a)); mdr = mem_read(a, true);
  if (wram_src && !cpu_fetching) {
    if (rdq_id != cpu_instr_id) { rdq_n = 0; rdq_id = cpu_instr_id; }
    if (rdq_n < 4) { rdq[rdq_n].v = mdr; rdq[rdq_n].used = false; rdq[rdq_n].src = src_of(a); rdq_n++; }
  }
  return mdr;
}
void bus_write(u32 a, u8 v) {
  tick(speed(a)); mdr = v;
  int w;
  if (wram_src && (w = wram_index(a)) >= 0) {
    u32 src = 0;
    for (int i = 0; i < rdq_n; i++) if (!rdq[i].used && rdq[i].v == v) { rdq[i].used = true; src = rdq[i].src; break; }
    wram_src[w] = src;
  }
  mem_write(a, v);
}

u8 bus_peek(u32 a) { return mem_read(a, false); }

static const u8 pat[8][4] = { {0,0,0,0},{0,1,0,1},{0,0,0,0},{0,0,1,1},{0,1,2,3},{0,1,0,1},{0,0,0,0},{0,0,1,1} };
static const u8 plen[8] = { 1, 2, 2, 4, 4, 4, 2, 4 };

static bool dma_a_ok(u32 a) {
  u16 o = (u16)a;
  if ((a >> 16 & 0x7f) >= 0x40) return true;
  return !((o >= 0x2100 && o < 0x2200) || (o >= 0x4300 && o < 0x4380) || o == 0x420b || o == 0x420c);
}

static void transfer(Dma *d, u32 aaddr, int i) {
  u8 b = d->bbad + pat[d->dmap & 7][i];
  tick(8);
  if (d->dmap & 0x80) { u8 v = bbus_read(b); if (dma_a_ok(aaddr)) { if (wram_src && wram_index(aaddr) >= 0) wram_src[wram_index(aaddr)] = 0; mem_write(aaddr, v); } }
  else {
    u8 v = dma_a_ok(aaddr) ? mem_read(aaddr, true) : 0;
    if (wram_src && b == 0x80) wram_src[wmadd] = src_of(aaddr);
    hd_dma_src = aaddr;
    bbus_write(b, v);
    hd_dma_src = -1;
  }
}

static void do_dma(u8 mask) {
  tick(8);
  for (int c = 0; c < 8; c++) {
    if (!(mask & (1 << c))) continue;
    Dma *d = &dma[c];
    tick(8);
    int i = 0;
    do {
      transfer(d, (d->a1b << 16) | d->a1t, i & 3);
      i++;
      if (!(d->dmap & 8)) d->a1t += (d->dmap & 0x10) ? -1 : 1;
      d->das--;
    } while (d->das);
  }
}

static void hdma_reload(Dma *d) {
  if ((d->ntrl & 0x7f) == 0) {
    d->ntrl = mem_read((d->a1b << 16) | d->a2a, true); d->a2a++;
    d->terminated = d->ntrl == 0;
    d->do_transfer = !d->terminated;
    if (d->dmap & 0x40) {
      u8 l = mem_read((d->a1b << 16) | d->a2a, true); d->a2a++;
      u8 h = mem_read((d->a1b << 16) | d->a2a, true); d->a2a++;
      d->das = l | h << 8;
      tick(16);
    }
    tick(8);
  }
}

static void hdma_init(void) {
  for (int c = 0; c < 8; c++) {
    Dma *d = &dma[c];
    d->do_transfer = true; d->terminated = false;
    if (!(hdmaen & (1 << c))) continue;
    d->a2a = d->a1t; d->ntrl = 0;
    hdma_reload(d);
  }
}

static void hdma_run(void) {
  if (!hdmaen) return;
  tick(18);
  for (int c = 0; c < 8; c++) {
    Dma *d = &dma[c];
    if (!(hdmaen & (1 << c)) || d->terminated) continue;
    if (d->do_transfer) {
      int n = plen[d->dmap & 7];
      for (int i = 0; i < n; i++) {
        u32 a;
        if (d->dmap & 0x40) { a = (d->dasb << 16) | d->das; d->das++; }
        else { a = (d->a1b << 16) | d->a2a; d->a2a++; }
        transfer(d, a, i);
      }
    }
  }
  for (int c = 0; c < 8; c++) {
    Dma *d = &dma[c];
    if (!(hdmaen & (1 << c)) || d->terminated) continue;
    d->ntrl--;
    d->do_transfer = (d->ntrl & 0x80) != 0;
    hdma_reload(d);
  }
}

void snes_set_pad(int port, u16 buttons) { pad_state[port & 1] = buttons; }

void snes_init(void) {
  memset(wram, 0x55, sizeof wram);
  ppu_reset(); apu_reset(); gsu_reset();
  hcount = 0; vcount = 0;
  cpu_reset();
}

void snes_run_frame(void) {
  frame_done = false;
  while (!frame_done) {
    bool irq = timeup || gsu_irq();
    if (nmi_pending) { nmi_pending = false; cpu_nmi(); continue; }
    if (irq && !(cpu.p & FI)) { cpu_irq(); continue; }
    if (cpu.wai && irq) cpu.wai = 0;
    if (rc_enabled && !cpu.wai && !cpu.stp && rc_try()) continue;
    cpu_step();
  }
}

void mem_serialize(Ser *s) {
  SER(s, wram); SER(s, master_clock); SER(s, hcount); SER(s, vcount); SER(s, mdr); SER(s, wmadd);
  SER(s, nmitimen); SER(s, wrio); SER(s, wrmpya); SER(s, memsel); SER(s, wrdiv); SER(s, rddiv); SER(s, rdmpy);
  SER(s, htime); SER(s, vtime); SER(s, rdnmi); SER(s, vblank); SER(s, hdma_inited); SER(s, rendered);
  SER(s, hdma_done); SER(s, irq_fired_line); SER(s, nmi_pending); SER(s, timeup); SER(s, joy_auto);
  SER(s, joy_latch); SER(s, joy_strobe); SER(s, dma); SER(s, hdmaen);
}

void snes_serialize(Ser *s) {
  u32 magic = 0x32465353, version = 1;
  SER(s, magic); SER(s, version);
  cpu_serialize(s); mem_serialize(s); ppu_serialize(s); apu_serialize(s); gsu_serialize(s);
}
