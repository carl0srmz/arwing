#include "gsu_ops.h"

u8 gsu_ram[0x20000];
u8 *cov_gsu;
u32 *gsu_prof;
Gsu g;

u8 gsu_read_opcode(u16 addr) {
  u16 off = addr - g.cbr;
  if (off < 512) {
    if (!g.cvalid[off >> 4]) {
      u16 dp = off & 0xfff0;
      u32 sp = (g.pbr << 16) + ((g.cbr + dp) & 0xfff0);
      for (int n = 0; n < 16; n++) { gstep(memcyc()); g.cache[dp++] = gread(sp++); }
      g.cvalid[off >> 4] = true;
    } else gstep(g.clsr ? 1 : 2);
    return g.cache[off];
  }
  gstep(memcyc());
  return gread((g.pbr << 16) | addr);
}

u32 gsu_char_addr(u8 x, u8 y, int *bpp) {
  int cn;
  int ht = (g.por & 0x10) ? 3 : ((g.scmr >> 2) & 1) | ((g.scmr >> 4) & 2);
  switch (ht) {
  case 0: cn = ((x & 0xf8) << 1) + ((y & 0xf8) >> 3); break;
  case 1: cn = ((x & 0xf8) << 1) + ((x & 0xf8) >> 1) + ((y & 0xf8) >> 3); break;
  case 2: cn = ((x & 0xf8) << 1) + ((x & 0xf8) << 0) + ((y & 0xf8) >> 3); break;
  default: cn = ((y & 0x80) << 2) + ((x & 0x80) << 1) + ((y & 0x78) << 1) + ((x & 0x78) >> 3); break;
  }
  int md = g.scmr & 3;
  *bpp = 2 << (md - (md >> 1));
  return 0x700000 + cn * (*bpp << 3) + (g.scbr << 10) + (y & 7) * 2;
}

void gsu_flush_pixel_cache(int i) {
  if (!g.pc[i].bitpend) return;
  u8 x = (u8)(g.pc[i].offset << 3), y = (u8)(g.pc[i].offset >> 5);
  int bpp; u32 addr = gsu_char_addr(x, y, &bpp);
  for (int n = 0; n < bpp; n++) {
    u32 byte = ((n >> 1) << 4) + (n & 1);
    u8 data = 0;
    for (int px = 0; px < 8; px++) data |= ((g.pc[i].data[px] >> n) & 1) << px;
    if (g.pc[i].bitpend != 0xff) {
      gstep(memcyc());
      data &= g.pc[i].bitpend;
      data |= gread(addr + byte) & ~g.pc[i].bitpend;
    }
    gstep(memcyc());
    gwrite_raw(addr + byte, data);
  }
  g.pc[i].bitpend = 0;
}

void gsu_plot(u8 x, u8 y) {
  if (!(g.por & 1)) {
    if ((g.scmr & 3) == 3) {
      if (g.por & 8) { if ((g.colr & 0x0f) == 0) return; }
      else if (g.colr == 0) return;
    } else if ((g.colr & 0x0f) == 0) return;
  }
  u8 color = g.colr;
  if ((g.por & 2) && (g.scmr & 3) != 3) { if ((x ^ y) & 1) color >>= 4; color &= 0x0f; }
  if (hd_active_scale) hd_plot(x, y, color);
  u16 off = (y << 5) + (x >> 3);
  if (g.pc[0].offset != off) {
    gsu_flush_pixel_cache(1);
    g.pc[1] = g.pc[0];
    g.pc[0].bitpend = 0;
    g.pc[0].offset = off;
  }
  x = (x & 7) ^ 7;
  g.pc[0].data[x] = color;
  g.pc[0].bitpend |= 1 << x;
  if (g.pc[0].bitpend == 0xff) {
    gsu_flush_pixel_cache(1);
    g.pc[1] = g.pc[0];
    g.pc[0].bitpend = 0;
  }
}

u8 gsu_rpix(u8 x, u8 y) {
  gsu_flush_pixel_cache(1);
  gsu_flush_pixel_cache(0);
  int bpp; u32 addr = gsu_char_addr(x, y, &bpp);
  u8 data = 0;
  x = (x & 7) ^ 7;
  for (int n = 0; n < bpp; n++) {
    u32 byte = ((n >> 1) << 4) + (n & 1);
    gstep(memcyc());
    data |= ((gread(addr + byte) >> x) & 1) << n;
  }
  return data;
}

static int gsu_rom_offset(u32 a) {
  u8 b = (a >> 16) & 0x7f;
  if (b < 0x40) return ((b << 15) | (a & 0x7fff)) & (rom_size - 1);
  if (b < 0x60) return (((b & 0x1f) << 16) | (a & 0xffff)) & (rom_size - 1);
  return -1;
}

static void gsu_step(void) {
  if (gsu_hooks_enabled) { int ro = (g.paddr & 0x800000) ? -1 : gsu_rom_offset(g.paddr); if (ro >= 0 && gsu_is_hook(ro)) gsu_hook(ro); }
  u8 op = peekpipe();
  if (cov_gsu && !(g.curaddr & 0x800000)) cov_gsu[g.curaddr] |= 1 << ((g.sfr >> 8) & 3) | ((g.sfr & SB) ? 0x10 : 0);
  if (gsu_prof && !(g.curaddr & 0x800000)) gsu_prof[g.curaddr & 0x7fffff]++;
  gsu_exec_op(op);
  if (!g.r15mod) g.r[15]++;
}

typedef struct { u32 key; void (*fn)(int); int idx; } GrcEntry;
extern const GrcEntry grc_entries[];
extern const int grc_count;
bool grc_enabled = true;
u64 grc_hits, grc_misses;
static int *ghtab; static u32 ghmask;
static u32 ghash(u32 k) { k ^= k >> 16; k *= 0x7feb352d; k ^= k >> 15; return k; }

void grc_init(void) {
  u32 n = 1; while (n < (u32)grc_count * 2) n <<= 1;
  ghmask = n - 1; ghtab = malloc(n * sizeof *ghtab);
  for (u32 i = 0; i < n; i++) ghtab[i] = -1;
  for (int i = 0; i < grc_count; i++) {
    u32 h = ghash(grc_entries[i].key) & ghmask;
    while (ghtab[h] >= 0) h = (h + 1) & ghmask;
    ghtab[h] = i;
  }
}

static bool grc_try(void) {
  if (!ghtab || g.cache_written) return false;
  if (g.paddr & 0x800000) return false;
  if ((u16)(g.paddr + 1) != g.r[15] || (g.paddr >> 16) != g.pbr) return false;
  int ro = gsu_rom_offset(g.paddr);
  if (ro < 0) return false;
  u32 key = (u32)ro;
  for (u32 h = ghash(key) & ghmask; ghtab[h] >= 0; h = (h + 1) & ghmask) {
    if (grc_entries[ghtab[h]].key != key) continue;
    grc_hits++;
    grc_entries[ghtab[h]].fn(grc_entries[ghtab[h]].idx);
    return true;
  }
  grc_misses++;
  return false;
}

void gsu_reset(void) {
  memset(&g, 0, sizeof g);
  g.pipeline = 0x01; g.paddr = 0x800000;
  memset(gsu_ram, 0, sizeof gsu_ram);
}

bool gsu_running(void) { return (g.sfr & SG) != 0; }
bool gsu_irq(void) { return (g.sfr & SIRQ) != 0; }

u32 gsu_mul = 256;

void gsu_catchup(void) {
  if (!(g.sfr & SG)) { g.clock = master_clock; return; }
  while ((g.sfr & SG) && g.clock < master_clock) {
    if (grc_enabled && grc_try()) continue;
    gsu_step();
  }
  if (!(g.sfr & SG)) g.clock = master_clock;
}

u8 gsu_read(u16 addr) {
  gsu_catchup();
  addr = 0x3000 | (addr & 0x3ff);
  if (addr >= 0x3100 && addr <= 0x32ff) return g.cache[(addr - 0x3100 + g.cbr) & 511];
  if (addr <= 0x301f) return g.r[(addr >> 1) & 15] >> ((addr & 1) << 3);
  switch (addr) {
  case 0x3030: return (u8)g.sfr;
  case 0x3031: { u8 v = g.sfr >> 8; g.sfr &= ~SIRQ; return v; }
  case 0x3034: return g.pbr;
  case 0x3036: return g.rombr;
  case 0x303b: return 0x04;
  case 0x303c: return g.rambr;
  case 0x303e: return (u8)g.cbr;
  case 0x303f: return g.cbr >> 8;
  }
  return 0;
}

void gsu_write(u16 addr, u8 v) {
  gsu_catchup();
  addr = 0x3000 | (addr & 0x3ff);
  if (addr >= 0x3100 && addr <= 0x32ff) {
    u16 a = (addr - 0x3100 + g.cbr) & 511;
    g.cache[a] = v; if ((a & 15) == 15) g.cvalid[a >> 4] = true;
    g.cache_written = true;
    return;
  }
  if (addr <= 0x301f) {
    int n = (addr >> 1) & 15;
    if (!(addr & 1)) g.r[n] = (g.r[n] & 0xff00) | v;
    else g.r[n] = (v << 8) | (g.r[n] & 0xff);
    if (n == 14) g.romdr = gread((g.rombr << 16) | g.r[14]);
    if (addr == 0x301f) { g.sfr |= SG; g.clock = master_clock; hd_gsu_started(); }
    return;
  }
  switch (addr) {
  case 0x3030: {
    bool was = g.sfr & SG;
    g.sfr = (g.sfr & 0xff00) | v;
    if (was && !(g.sfr & SG)) { g.cbr = 0; flush_cache(); }
    if (!was && (g.sfr & SG)) g.clock = master_clock;
    break;
  }
  case 0x3031: g.sfr = (v << 8) | (g.sfr & 0xff); break;
  case 0x3033: g.bramr = v & 1; break;
  case 0x3034: g.pbr = v & 0x7f; flush_cache(); break;
  case 0x3037: g.cfgr = v; break;
  case 0x3038: g.scbr = v; break;
  case 0x3039: g.clsr = v & 1; break;
  case 0x303a: g.scmr = v; break;
  }
}

void gsu_serialize(Ser *s) { SER(s, g); SER(s, gsu_ram); }
