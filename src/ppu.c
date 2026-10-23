#include "snes.h"

u32 framebuf[256 * 239];
u8 ppu_hdmask[256 * 239];
u8 ppu_inidisp = 0x80;
bool ppu_overscan;

static u16 vram[0x8000];
static u16 cgram[256];
static u8 oam[544];

static u8 obsel, bgmode, mosaic, bgsc[4], bgnba[2], vmain, m7sel, setini;
static u16 bghofs[4], bgvofs[4], m7hofs, m7vofs;
static u8 ofs_latch, bghofs_latch, m7_latch;
static s16 m7a, m7b, m7c, m7d, m7x, m7y;
static u16 vmadd, vram_prefetch;
static u8 cgadd_lo, cgadd, cg_latch; static bool cg_hi;
static u16 oamadd, oam_reload; static u8 oam_latch; static bool oam_prio;
static u8 wsel[3], wh[4], wbglog, wobjlog, tm, ts, tmw, tsw, cgwsel, cgadsub;
static u16 fixed_color;
static s32 mpy;
static u16 hlatch, vlatch; static bool hl_hi, vl_hi, latched;
static u8 ppu1_mdr, ppu2_mdr;

void ppu_reset(void) {
  memset(vram, 0, sizeof vram); memset(cgram, 0, sizeof cgram); memset(oam, 0, sizeof oam);
  ppu_inidisp = 0x80;
}

static u16 vram_remap(u16 a) {
  switch ((vmain >> 2) & 3) {
  case 1: return (a & 0xff00) | ((a & 0x001f) << 3) | ((a >> 5) & 7);
  case 2: return (a & 0xfe00) | ((a & 0x003f) << 3) | ((a >> 6) & 7);
  case 3: return (a & 0xfc00) | ((a & 0x007f) << 3) | ((a >> 7) & 7);
  }
  return a;
}
static void vram_inc(void) { static const u16 inc[4] = { 1, 32, 128, 128 }; vmadd += inc[vmain & 3]; }

void ppu_latch_counters(void) {
  hlatch = hcount / 4; vlatch = vcount; latched = true;
}

u8 ppu_read(u16 r) {
  switch (r) {
  case 0x2134: return ppu1_mdr = (u8)mpy;
  case 0x2135: return ppu1_mdr = (u8)(mpy >> 8);
  case 0x2136: return ppu1_mdr = (u8)(mpy >> 16);
  case 0x2137: ppu_latch_counters(); hl_hi = vl_hi = false; return 0;
  case 0x2138: {
    u8 v = oamadd < 512 ? oam[oamadd] : oam[512 + (oamadd & 31)];
    oamadd = (oamadd + 1) & 0x3ff; return ppu1_mdr = v;
  }
  case 0x2139: { u8 v = (u8)vram_prefetch; if (!(vmain & 0x80)) { vram_prefetch = vram[vram_remap(vmadd) & 0x7fff]; vram_inc(); } return ppu1_mdr = v; }
  case 0x213a: { u8 v = vram_prefetch >> 8; if (vmain & 0x80) { vram_prefetch = vram[vram_remap(vmadd) & 0x7fff]; vram_inc(); } return ppu1_mdr = v; }
  case 0x213b: { u8 v; if (!cg_hi) v = (u8)cgram[cgadd]; else { v = (cgram[cgadd] >> 8) | (ppu2_mdr & 0x80); cgadd++; } cg_hi = !cg_hi; return ppu2_mdr = v; }
  case 0x213c: { u8 v = hl_hi ? (hlatch >> 8) & 1 : (u8)hlatch; hl_hi = !hl_hi; return ppu2_mdr = v; }
  case 0x213d: { u8 v = vl_hi ? (vlatch >> 8) & 1 : (u8)vlatch; vl_hi = !vl_hi; return ppu2_mdr = v; }
  case 0x213e: return ppu1_mdr = 0x01;
  case 0x213f: { u8 v = (latched ? 0x40 : 0) | 0x03; latched = false; hl_hi = vl_hi = false; return ppu2_mdr = v; }
  }
  return ppu1_mdr;
}

void ppu_write(u16 r, u8 v) {
  switch (r) {
  case 0x2100: ppu_inidisp = v; break;
  case 0x2101: obsel = v; break;
  case 0x2102: oam_reload = (oam_reload & 0x200) | v << 1; oamadd = oam_reload; break;
  case 0x2103: oam_reload = (oam_reload & 0x1fe) | (v & 1) << 9; oam_prio = v >> 7; oamadd = oam_reload; break;
  case 0x2104:
    if (oamadd >= 512) oam[512 + (oamadd & 31)] = v;
    else if (!(oamadd & 1)) oam_latch = v;
    else { oam[oamadd - 1] = oam_latch; oam[oamadd] = v; }
    oamadd = (oamadd + 1) & 0x3ff; break;
  case 0x2105: bgmode = v; break;
  case 0x2106: mosaic = v; break;
  case 0x2107: case 0x2108: case 0x2109: case 0x210a: bgsc[r - 0x2107] = v; break;
  case 0x210b: bgnba[0] = v; break;
  case 0x210c: bgnba[1] = v; break;
  case 0x210d:
    m7hofs = (v << 8 | m7_latch) & 0x1fff; m7_latch = v;
  case 0x210f: case 0x2111: case 0x2113: {
    int n = (r - 0x210d) >> 1;
    bghofs[n] = ((v << 8) | (ofs_latch & ~7) | (bghofs_latch & 7)) & 0x3ff;
    ofs_latch = v; bghofs_latch = v; break;
  }
  case 0x210e:
    m7vofs = (v << 8 | m7_latch) & 0x1fff; m7_latch = v;
  case 0x2110: case 0x2112: case 0x2114: {
    int n = (r - 0x210e) >> 1;
    bgvofs[n] = ((v << 8) | ofs_latch) & 0x3ff; ofs_latch = v; break;
  }
  case 0x2115: vmain = v; break;
  case 0x2116: vmadd = (vmadd & 0xff00) | v; vram_prefetch = vram[vram_remap(vmadd) & 0x7fff]; break;
  case 0x2117: vmadd = (vmadd & 0xff) | v << 8; vram_prefetch = vram[vram_remap(vmadd) & 0x7fff]; break;
  case 0x2118: { u16 a = vram_remap(vmadd) & 0x7fff; vram[a] = (vram[a] & 0xff00) | v; if (hd_active_scale) hd_vram_byte(a, 0, hd_dma_src); if (!(vmain & 0x80)) vram_inc(); break; }
  case 0x2119: { u16 a = vram_remap(vmadd) & 0x7fff; vram[a] = (vram[a] & 0xff) | v << 8; if (hd_active_scale) hd_vram_byte(a, 1, hd_dma_src); if (vmain & 0x80) vram_inc(); break; }
  case 0x211a: m7sel = v; break;
  case 0x211b: m7a = v << 8 | m7_latch; m7_latch = v; mpy = (s32)m7a * (s8)(m7b >> 8); break;
  case 0x211c: m7b = v << 8 | m7_latch; m7_latch = v; mpy = (s32)m7a * (s8)v; break;
  case 0x211d: m7c = v << 8 | m7_latch; m7_latch = v; break;
  case 0x211e: m7d = v << 8 | m7_latch; m7_latch = v; break;
  case 0x211f: m7x = ((s16)((v << 8 | m7_latch) << 3)) >> 3; m7_latch = v; break;
  case 0x2120: m7y = ((s16)((v << 8 | m7_latch) << 3)) >> 3; m7_latch = v; break;
  case 0x2121: cgadd = v; cg_hi = false; break;
  case 0x2122: if (!cg_hi) cg_latch = v; else { cgram[cgadd] = (cg_latch | v << 8) & 0x7fff; cgadd++; } cg_hi = !cg_hi; break;
  case 0x2123: wsel[0] = v; break; case 0x2124: wsel[1] = v; break; case 0x2125: wsel[2] = v; break;
  case 0x2126: wh[0] = v; break; case 0x2127: wh[1] = v; break; case 0x2128: wh[2] = v; break; case 0x2129: wh[3] = v; break;
  case 0x212a: wbglog = v; break; case 0x212b: wobjlog = v; break;
  case 0x212c: tm = v; break; case 0x212d: ts = v; break; case 0x212e: tmw = v; break; case 0x212f: tsw = v; break;
  case 0x2130: cgwsel = v; break; case 0x2131: cgadsub = v; break;
  case 0x2132:
    if (v & 0x20) fixed_color = (fixed_color & ~0x001f) | (v & 31);
    if (v & 0x40) fixed_color = (fixed_color & ~0x03e0) | (v & 31) << 5;
    if (v & 0x80) fixed_color = (fixed_color & ~0x7c00) | (v & 31) << 10;
    break;
  case 0x2133: setini = v; ppu_overscan = (v & 4) != 0; break;
  }
}

typedef struct { u16 col[256]; u8 z[256]; u8 pal[256]; u32 hd[256]; } Layer;
static Layer lay[5];

static void window_mask(int sel, int logic, u8 *out) {
  bool e1 = sel & 2, i1 = sel & 1, e2 = sel & 8, i2 = sel & 4;
  for (int x = 0; x < 256; x++) {
    bool w1 = x >= wh[0] && x <= wh[1], w2 = x >= wh[2] && x <= wh[3];
    if (i1) w1 = !w1; if (i2) w2 = !w2;
    bool r;
    if (e1 && e2) {
      switch (logic & 3) { case 0: r = w1 || w2; break; case 1: r = w1 && w2; break; case 2: r = w1 != w2; break; default: r = w1 == w2; }
    } else if (e1) r = w1; else if (e2) r = w2; else r = false;
    out[x] = r;
  }
}

static int bg_bpp(int mode, int bg) {
  static const s8 t[8][4] = { {2,2,2,2},{4,4,2,0},{4,4,0,0},{8,4,0,0},{8,2,0,0},{4,2,0,0},{4,0,0,0},{8,0,0,0} };
  return t[mode][bg];
}

static inline u8 tile_pixel(u16 base, int bpp, u16 tile, int px, int py) {
  u16 a = (base + tile * (bpp * 4) + py) & 0x7fff;
  int sh = 7 - px; u8 c = 0;
  for (int p = 0; p < bpp; p += 2) {
    u16 w = vram[(a + p * 4) & 0x7fff];
    c |= ((w >> sh) & 1) << p;
    c |= ((w >> (sh + 8)) & 1) << (p + 1);
  }
  return c;
}

static u16 direct_color(u8 c, u8 pal) {
  return ((c & 7) << 2 | (pal & 1) << 1) | (((c >> 3) & 7) << 7 | (pal & 2) << 5) | (((c >> 6) & 3) << 13 | (pal & 4) << 10);
}

static u16 tilemap_entry(int bg, int tx, int ty) {
  u8 sc = bgsc[bg];
  u16 base = (sc & 0xfc) << 8;
  int addr = base + ((ty & 31) << 5) + (tx & 31);
  if ((tx & 32) && (sc & 1)) addr += 0x400;
  if ((ty & 32) && (sc & 2)) addr += (sc & 1) ? 0x800 : 0x400;
  return vram[addr & 0x7fff];
}

static void render_bg(int bg, int line, int mode, const u8 *zt) {
  Layer *L = &lay[bg];
  int bpp = bg_bpp(mode, bg);
  u16 chr = ((bgnba[bg >> 1] >> ((bg & 1) * 4)) & 15) << 12;
  bool big = (bgmode >> (4 + bg)) & 1;
  int tsz = big ? 16 : 8;
  int mos = (mosaic & (1 << bg)) ? (mosaic >> 4) + 1 : 1;
  int y = line;
  if (mos > 1) y = line - ((line - 1) % mos);
  bool opt = (mode == 2 || mode == 4 || mode == 6) && bg < 2;
  bool direct = (cgwsel & 1) && bpp == 8;
  int palbase = (mode == 0) ? bg * 32 : 0;
  for (int x = 0; x < 256; x++) {
    int sx = x - (x % mos);
    int hofs = bghofs[bg], vofs = bgvofs[bg];
    if (opt && sx >= 8) {
      int col = ((sx - 8 + (bghofs[2] & 7)) >> 3) + (bghofs[2] >> 3);
      int vb = (bgvofs[2] >> 3);
      u16 hv = tilemap_entry(2, col, vb);
      u16 vv = tilemap_entry(2, col, vb + 1);
      if (mode == 4) {
        if (hv & 0x8000) { if (hv & (0x2000 << bg)) vofs = hv & 0x3ff; }
        else if (hv & (0x2000 << bg)) hofs = (hofs & 7) | (hv & 0x3f8);
      } else {
        if (hv & (0x2000 << bg)) hofs = (hofs & 7) | (hv & 0x3f8);
        if (vv & (0x2000 << bg)) vofs = vv & 0x3ff;
      }
    }
    int px = (sx + hofs) & 0x3ff, py = (y + vofs) & 0x3ff;
    int tx = px / tsz, ty = py / tsz;
    u16 e = tilemap_entry(bg, tx, ty);
    int fx = px % tsz, fy = py % tsz;
    if (e & 0x4000) fx = tsz - 1 - fx;
    if (e & 0x8000) fy = tsz - 1 - fy;
    u16 tile = e & 0x3ff;
    if (fx >= 8) tile += 1;
    if (fy >= 8) tile += 16;
    u8 c = tile_pixel(chr, bpp, tile & 0x3ff, fx & 7, fy & 7);
    u8 pal = (e >> 10) & 7;
    L->hd[x] = 0;
    if (hd_active_scale && bpp == 4) {
      int t = ((chr + (tile & 0x3ff) * 16) & 0x7fff) >> 4;
      if (hd_vvalid[t]) {
        int n = hd_active_scale;
        u32 ref = 0x80000000u | t << 16 | (fx & 7) << 12 | (fy & 7) << 8 | ((palbase + pal * 16) & 0xff)
                | ((e & 0x4000) ? 0x8000 : 0) | ((e & 0x8000) ? 0x800 : 0);
        if (!c) {
          const u8 *cell = hd_vtile[t] + (fy & 7) * n * 8 * n + (fx & 7) * n;
          (void)cell;
          for (int sy = 0; sy < n && !c; sy++) for (int sx = 0; sx < n; sx++) if (cell[sy * 8 * n + sx]) { c = cell[sy * 8 * n + sx]; break; }
        }
        if (c) L->hd[x] = ref;
      }
    }
    if (!c) { L->col[x] = 0; continue; }
    u16 color;
    if (direct) color = direct_color(c, pal);
    else if (bpp == 8) color = cgram[c];
    else color = cgram[(palbase + pal * (1 << bpp) + c) & 0xff];
    L->col[x] = color | 0x8000;
    L->z[x] = zt[(e >> 13) & 1];
  }
}

static void render_mode7(int line, const u8 *zt1, const u8 *zt2, bool ext) {
  #define CLIP(n) (((n) & 0x2000) ? ((n) | ~1023) : ((n) & 1023))
  int a = m7a, b = m7b, c = m7c, d = m7d;
  int hc = m7x, vc = m7y;
  int ho = ((s16)(m7hofs << 3)) >> 3, vo = ((s16)(m7vofs << 3)) >> 3;
  int y = (m7sel & 2) ? 255 - line : line;
  int mos = (mosaic & 1) ? (mosaic >> 4) + 1 : 1;
  if (mos > 1) y -= (line - 1) % mos;
  int ox = ((a * CLIP(ho - hc)) & ~63) + ((b * CLIP(vo - vc)) & ~63) + ((b * y) & ~63) + (hc << 8);
  int oy = ((c * CLIP(ho - hc)) & ~63) + ((d * CLIP(vo - vc)) & ~63) + ((d * y) & ~63) + (vc << 8);
  int rep = m7sel >> 6;
  bool direct = cgwsel & 1;
  for (int x = 0; x < 256; x++) {
    int xx = (m7sel & 1) ? 255 - x : x;
    xx -= xx % mos;
    int pxx = (ox + a * xx) >> 8, pyy = (oy + c * xx) >> 8;
    bool oob = ((pxx | pyy) & ~1023) != 0;
    int tile, pix;
    if (rep == 3 && oob) tile = 0; else tile = vram[((pyy >> 3) & 127) * 128 + ((pxx >> 3) & 127)] & 0xff;
    if (rep == 2 && oob) pix = 0; else pix = vram[(tile << 6) | ((pyy & 7) << 3) | (pxx & 7)] >> 8;
    lay[0].col[x] = 0; lay[1].col[x] = 0;
    if (pix) {
      lay[0].col[x] = (direct ? direct_color(pix, 0) : cgram[pix]) | 0x8000;
      lay[0].z[x] = zt1[0];
    }
    if (ext && (pix & 0x7f)) {
      lay[1].col[x] = cgram[pix & 0x7f] | 0x8000;
      lay[1].z[x] = zt2[pix >> 7];
    }
  }
}

static void render_obj(int line, const u8 *zt) {
  static const u8 sz[8][4] = { {8,8,16,16},{8,8,32,32},{8,8,64,64},{16,16,32,32},{16,16,64,64},{32,32,64,64},{16,32,32,64},{16,32,32,32} };
  Layer *L = &lay[4];
  memset(L->col, 0, sizeof L->col);
  u16 base = (obsel & 7) << 13;
  u16 gap = ((obsel >> 3) & 3) + 1;
  int first = oam_prio ? (oamadd >> 2) & 0x7f : 0;
  int count = 0, tiles = 0;
  int list[32];
  for (int k = 0; k < 128 && count < 32; k++) {
    int i = (first + k) & 127;
    u8 hi = oam[512 + (i >> 2)] >> ((i & 3) * 2);
    int large = (hi >> 1) & 1;
    int w = sz[obsel >> 5][large * 2], h = sz[obsel >> 5][large * 2 + 1];
    int sx = oam[i * 4] | ((hi & 1) << 8);
    if (sx >= 256) sx -= 512;
    int row = (u8)(line - 1 - oam[i * 4 + 1]);
    if (row >= h) continue;
    if (sx <= -w) continue;
    list[count++] = i;
  }
  for (int n = count - 1; n >= 0; n--) {
    int i = list[n];
    u8 hi = oam[512 + (i >> 2)] >> ((i & 3) * 2);
    int large = (hi >> 1) & 1;
    int w = sz[obsel >> 5][large * 2], h = sz[obsel >> 5][large * 2 + 1];
    int sx = oam[i * 4] | ((hi & 1) << 8);
    if (sx >= 256) sx -= 512;
    u8 tile = oam[i * 4 + 2], attr = oam[i * 4 + 3];
    int row = (u8)(line - 1 - oam[i * 4 + 1]);
    if (attr & 0x80) row = h - 1 - row;
    u16 tbase = base + ((attr & 1) ? gap << 12 : 0);
    int pal = (attr >> 1) & 7, pri = (attr >> 4) & 3;
    for (int px = 0; px < w; px++) {
      int x = sx + px;
      if (x < 0 || x >= 256) continue;
      if (++tiles > 34 * 8) break;
      int col = (attr & 0x40) ? w - 1 - px : px;
      u8 t = (u8)(((tile >> 4) + (row >> 3)) << 4 | ((tile + (col >> 3)) & 15));
      u8 c = tile_pixel(tbase & 0x7fff, 4, t, col & 7, row & 7);
      if (!c) continue;
      L->col[x] = cgram[128 + pal * 16 + c] | 0x8000;
      L->z[x] = zt[pri];
      L->pal[x] = pal;
    }
  }
}

static inline u16 cmath(u16 a, u16 b, bool sub, bool half) {
  int r = a & 31, g = (a >> 5) & 31, bl = (a >> 10) & 31;
  int r2 = b & 31, g2 = (b >> 5) & 31, b2 = (b >> 10) & 31;
  if (!sub) { r += r2; g += g2; bl += b2; if (half) { r >>= 1; g >>= 1; bl >>= 1; } if (r > 31) r = 31; if (g > 31) g = 31; if (bl > 31) bl = 31; }
  else { r -= r2; g -= g2; bl -= b2; if (r < 0) r = 0; if (g < 0) g = 0; if (bl < 0) bl = 0; if (half) { r >>= 1; g >>= 1; bl >>= 1; } }
  return r | g << 5 | bl << 10;
}

// Brightness in 1/16 steps, so smooth.c can ease a fade between the game's own steps.
int ppu_br16 = -1, ppu_br_base;
static inline u32 rgb_out(u16 color, int br) {
  int r = (color & 31) * br / 240, g = ((color >> 5) & 31) * br / 240, b = ((color >> 10) & 31) * br / 240;
  return 0xff000000 | (r << 19 | (r >> 2) << 16) | (g << 11 | (g >> 2) << 8) | (b << 3 | b >> 2);
}

void ppu_render_line(int line) {
  u32 *out = &framebuf[(line - 1) * 256];
  if (ppu_inidisp & 0x80) {
    memset(out, 0, 256 * 4);
    if (hd_active_scale) memset(&hd_framebuf[(line - 1) * hd_active_scale * 256 * hd_active_scale], 0, 256 * hd_active_scale * hd_active_scale * 4);
    return;
  }
  int mode = bgmode & 7;
  static const u8 Z0[5][4] = { {8,11},{7,10},{2,5},{1,4},{3,6,9,12} };
  static const u8 Z1[5][4] = { {6,9},{5,8},{1,3},{0,0},{2,4,7,10} };
  static const u8 Z1H[5][4] = { {6,9},{5,8},{1,11},{0,0},{2,4,7,10} };
  static const u8 Z2[5][4] = { {3,7},{1,5},{0,0},{0,0},{2,4,6,8} };
  static const u8 Z6[5][4] = { {2,5},{0,0},{0,0},{0,0},{1,3,4,6} };
  static const u8 Z7[5][4] = { {3,3},{1,5},{0,0},{0,0},{2,4,6,7} };
  const u8 (*Z)[4];
  switch (mode) {
  case 0: Z = Z0; break;
  case 1: Z = (bgmode & 8) ? Z1H : Z1; break;
  case 6: Z = Z6; break;
  case 7: Z = Z7; break;
  default: Z = Z2; break;
  }
  u8 used = tm | ts;
  for (int bg = 0; bg < 4; bg++) { memset(lay[bg].col, 0, sizeof lay[bg].col); memset(lay[bg].hd, 0, sizeof lay[bg].hd); }
  if (mode == 7) {
    if (used & 3) render_mode7(line, Z[0], Z[1], (setini & 0x40) != 0);
  } else {
    for (int bg = 0; bg < 4; bg++)
      if ((used & (1 << bg)) && bg_bpp(mode, bg)) render_bg(bg, line, mode, Z[bg]);
  }
  if (used & 0x10) render_obj(line, Z[4]); else memset(lay[4].col, 0, sizeof lay[4].col);

  static u8 wm[6][256];
  for (int l = 0; l < 5; l++) {
    int sel = (wsel[l >> 1] >> ((l & 1) * 4)) & 15;
    int logic = l < 4 ? (wbglog >> (l * 2)) & 3 : wobjlog & 3;
    window_mask(sel, logic, wm[l]);
  }
  window_mask(wsel[2] >> 4, (wobjlog >> 2) & 3, wm[5]);

  u16 back = cgram[0];
  bool addsub = (cgwsel & 2) != 0;
  int clipm = (cgwsel >> 6) & 3, prevm = (cgwsel >> 4) & 3;
  int hn = hd_active_scale;
  u32 *hout = hn ? &hd_framebuf[(line - 1) * hn * 256 * hn] : NULL;
  int br = (ppu_inidisp & 15) * 16;
  if (ppu_br16 >= 0 && (ppu_inidisp & 15) == ppu_br_base) br = ppu_br16;
  for (int x = 0; x < 256; x++) {
    int mz = -1, ml = 5; u16 mc = back;
    int mz2 = -1; u16 mc2 = back;
    int sz = -1, sl = 5; u16 sc = 0; bool sub_opaque = false;
    for (int l = 0; l < 5; l++) {
      if (!(lay[l].col[x] & 0x8000)) continue;
      int z = lay[l].z[x];
      if ((tm >> l) & 1 && !(((tmw >> l) & 1) && wm[l][x])) {
        if (z > mz) { mz2 = mz; mc2 = mc; mz = z; ml = l; mc = lay[l].col[x] & 0x7fff; }
        else if (z > mz2) { mz2 = z; mc2 = lay[l].col[x] & 0x7fff; }
      }
      if ((ts >> l) & 1 && !(((tsw >> l) & 1) && wm[l][x]) && z > sz) { sz = z; sl = l; sc = lay[l].col[x] & 0x7fff; sub_opaque = true; }
    }
    bool cw = wm[5][x];
    bool clip = clipm == 3 || (clipm == 1 && !cw) || (clipm == 2 && cw);
    bool prevent = prevm == 3 || (prevm == 1 && !cw) || (prevm == 2 && cw);
    if (clip) mc = 0;
    bool en = (cgadsub >> (ml == 5 ? 5 : ml)) & 1;
    if (ml == 4 && lay[4].pal[x] < 4) en = false;
    u16 color = mc;
    u16 other = 0; bool half = false, domath = en && !prevent;
    if (domath) {
      half = (cgadsub & 0x40) != 0;
      if (addsub) { if (sub_opaque) other = sc; else { other = fixed_color; half = false; } }
      else other = fixed_color;
      if (clip) half = false;
      color = cmath(mc, other, (cgadsub & 0x80) != 0, half);
    }
    (void)sl;
    out[x] = rgb_out(color, br);
    if (!hn) continue;
    u32 ref = ml < 4 ? lay[ml].hd[x] : 0;
    ppu_hdmask[(line - 1) * 256 + x] = ref != 0;
    u32 *ho = hout + x * hn;
    if (!ref) {
      for (int sy = 0; sy < hn; sy++) for (int sx = 0; sx < hn; sx++) ho[sy * 256 * hn + sx] = out[x];
      continue;
    }
    const u8 *tile = hd_vtile[(ref >> 16) & 0x7ff];
    int cx = (ref >> 12) & 7, cy = (ref >> 8) & 7;
    bool hf = (ref >> 15) & 1, vf = (ref >> 11) & 1;
    u8 palb = (u8)ref;
    for (int sy = 0; sy < hn; sy++)
      for (int sx = 0; sx < hn; sx++) {
        int tx = cx * hn + (hf ? hn - 1 - sx : sx), ty = cy * hn + (vf ? hn - 1 - sy : sy);
        u8 idx = tile[ty * 8 * hn + tx];
        u16 c = idx ? cgram[(palb + idx) & 0xff] : mc2;
        if (clip) c = 0;
        if (domath) c = cmath(c, other, (cgadsub & 0x80) != 0, half);
        ho[sy * 256 * hn + sx] = rgb_out(c, br);
      }
  }
}

// What smooth.c borrows from the real machine for an interpolated frame: palette, sprites, colour math.
typedef struct { u16 cgram[256]; u8 oam[544]; u16 fixed_color; u8 cgwsel, cgadsub, obsel; } Ppu2d;
static Ppu2d p2d;
void ppu_keep_2d(void) { memcpy(p2d.cgram, cgram, sizeof cgram); memcpy(p2d.oam, oam, sizeof oam); p2d.fixed_color = fixed_color; p2d.cgwsel = cgwsel; p2d.cgadsub = cgadsub; p2d.obsel = obsel; }
void ppu_use_2d(void) { memcpy(cgram, p2d.cgram, sizeof cgram); memcpy(oam, p2d.oam, sizeof oam); fixed_color = p2d.fixed_color; cgwsel = p2d.cgwsel; cgadsub = p2d.cgadsub; obsel = p2d.obsel; }

// Display registers the game's frozen logic would have set during the real frame (fades, windows,
// layer enables, scroll). Recorded per line while the real frame is drawn, replayed on the copy's frame.
typedef struct {
  u8 inidisp, mosaic, bgmode, bgsc[4], wsel[3], wh[4], wbglog, wobjlog, tm, ts, tmw, tsw, cgwsel, cgadsub, setini, obsel;
  u16 bghofs[4], bgvofs[4], fixed_color;
} LineRegs;
static LineRegs lregs[240];
#define LR_BYTES(X) X(inidisp, ppu_inidisp) X(mosaic, mosaic) X(bgmode, bgmode) X(wbglog, wbglog) X(wobjlog, wobjlog) X(tm, tm) X(ts, ts) \
  X(tmw, tmw) X(tsw, tsw) X(cgwsel, cgwsel) X(cgadsub, cgadsub) X(setini, setini) X(obsel, obsel)
void ppu_regs_keep(int y) {
  LineRegs *l = &lregs[y];
#define K(f, v) l->f = v;
  LR_BYTES(K)
#undef K
  memcpy(l->bgsc, bgsc, sizeof bgsc); memcpy(l->wsel, wsel, sizeof wsel); memcpy(l->wh, wh, sizeof wh);
  memcpy(l->bghofs, bghofs, sizeof bghofs); memcpy(l->bgvofs, bgvofs, sizeof bgvofs); l->fixed_color = fixed_color;
}
int ppu_blend_num, ppu_blend_den = 1;
static u16 lerp_scroll(u16 a, u16 b) {
  if ((a | b) > 0x3ff) return a;
  int d = (b - a) & 0x3ff;
  if (d > 512) d -= 1024;
  return (u16)((a + d * ppu_blend_num / ppu_blend_den) & 0x3ff);
}
// The copy's own values are the next tick's; the flags and layer setup come from the real frame, and what the
// game steps once per tick (scroll) is moved from the real frame's value to the copy's.
void ppu_regs_use(int y) {
  LineRegs *l = &lregs[y];
  u16 hs[4], vs[4];
  for (int i = 0; i < 4; i++) { hs[i] = lerp_scroll(l->bghofs[i], bghofs[i]); vs[i] = lerp_scroll(l->bgvofs[i], bgvofs[i]); }
#define U(f, v) v = l->f;
  LR_BYTES(U)
#undef U
  memcpy(bgsc, l->bgsc, sizeof bgsc); memcpy(wsel, l->wsel, sizeof wsel); memcpy(wh, l->wh, sizeof wh); fixed_color = l->fixed_color;
  memcpy(bghofs, hs, sizeof hs); memcpy(bgvofs, vs, sizeof vs);
}

u8 ppu_get_nba(void) { return bgnba[0]; }

void ppu_serialize(Ser *s) {
  SER(s, vram); SER(s, cgram); SER(s, oam); SER(s, ppu_inidisp); SER(s, ppu_overscan);
  SER(s, obsel); SER(s, bgmode); SER(s, mosaic); SER(s, bgsc); SER(s, bgnba); SER(s, vmain); SER(s, m7sel); SER(s, setini);
  SER(s, bghofs); SER(s, bgvofs); SER(s, m7hofs); SER(s, m7vofs); SER(s, ofs_latch); SER(s, bghofs_latch); SER(s, m7_latch);
  SER(s, m7a); SER(s, m7b); SER(s, m7c); SER(s, m7d); SER(s, m7x); SER(s, m7y); SER(s, vmadd); SER(s, vram_prefetch);
  SER(s, cgadd_lo); SER(s, cgadd); SER(s, cg_latch); SER(s, cg_hi); SER(s, oamadd); SER(s, oam_reload); SER(s, oam_latch);
  SER(s, oam_prio); SER(s, wsel); SER(s, wh); SER(s, wbglog); SER(s, wobjlog); SER(s, tm); SER(s, ts); SER(s, tmw); SER(s, tsw);
  SER(s, cgwsel); SER(s, cgadsub); SER(s, fixed_color); SER(s, mpy); SER(s, hlatch); SER(s, vlatch); SER(s, hl_hi);
  SER(s, vl_hi); SER(s, latched); SER(s, ppu1_mdr); SER(s, ppu2_mdr);
}
