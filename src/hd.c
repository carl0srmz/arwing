#include "gsu_ops.h"
#include <math.h>

int hd_scale;
int hd_debug;
bool gsu_hooks_enabled;
u32 *hd_framebuf;
int hd_active_scale;
long long hd_stat_vtx, hd_stat_vtx_hit;

#define NCHAR 2048
static u8 *gch[NCHAR]; static bool gvalid[NCHAR];
u8 *hd_vtile[NCHAR]; bool hd_vvalid[NCHAR];
static u32 vt_base[NCHAR], vt_mask[NCHAR];
static struct { float x, y; u32 stamp; } proj[256 * 256];
static u32 stamp = 1;

static inline int N(void) { return hd_active_scale; }
static inline int CSZ(void) { return 64 * N() * N(); }

void hd_reset(void) {
  int n = hd_scale >= 2 ? hd_scale : 0;
  if (n != hd_active_scale) {
    for (int i = 0; i < NCHAR; i++) { free(gch[i]); free(hd_vtile[i]); gch[i] = hd_vtile[i] = NULL; }
    free(hd_framebuf); hd_framebuf = NULL;
    hd_active_scale = n;
    if (n) hd_framebuf = calloc(256 * n * 239 * n, 4);
  }
  memset(gvalid, 0, sizeof gvalid); memset(hd_vvalid, 0, sizeof hd_vvalid); memset(vt_mask, 0, sizeof vt_mask);
  gsu_hooks_enabled = n || hd_debug;
}

static inline int char_index(u32 addr) { return (addr & 0xffff) >> 5; }

static void init_from_1x(int ci) {
  if (!gch[ci]) gch[ci] = malloc(CSZ());
  int n = N(), w = 8 * n;
  const u8 *p = &gsu_ram[ci << 5];
  for (int y = 0; y < 8; y++)
    for (int x = 0; x < 8; x++) {
      int b = 7 - x;
      u8 c = ((p[y * 2] >> b) & 1) | ((p[y * 2 + 1] >> b) & 1) << 1 | ((p[16 + y * 2] >> b) & 1) << 2 | ((p[17 + y * 2] >> b) & 1) << 3;
      for (int sy = 0; sy < n; sy++) memset(&gch[ci][(y * n + sy) * w + x * n], c, n);
    }
  gvalid[ci] = true;
}

void hd_gsu_ram_written(u32 addr) { if (hd_active_scale) gvalid[char_index(addr)] = false; }

static inline u8 *char_for(u8 x, u8 y) {
  int bpp; u32 a = gsu_char_addr(x, y, &bpp);
  if (bpp != 4) return NULL;
  int ci = char_index(a);
  if (!gvalid[ci]) init_from_1x(ci);
  return gch[ci];
}

static inline int screen_h(void) {
  int ht = (g.por & 0x10) ? 3 : ((g.scmr >> 2) & 1) | ((g.scmr >> 4) & 2);
  return ht == 0 ? 128 : ht == 1 ? 160 : ht == 2 ? 192 : 256;
}

static inline void hd_put(int hx, int hy, u8 c) {
  int n = N();
  int x = hx / n, y = hy / n;
  u8 *ch = char_for((u8)x, (u8)y);
  if (ch) ch[((y & 7) * n + hy % n) * 8 * n + (x & 7) * n + hx % n] = c;
}

static bool suppress_plot_site(void) {
  if ((g.curaddr >> 16) != 0x01) return false;
  u16 a = g.curaddr & 0xffff;
  return a == 0xa75d || a == 0xa38d || a == 0xa3a5;
}

void hd_plot(u8 x, u8 y, u8 color) {
  if (suppress_plot_site()) return;
  u8 *ch = char_for(x, y);
  if (!ch) return;
  int n = N(), w = 8 * n;
  for (int sy = 0; sy < n; sy++) memset(&ch[((y & 7) * n + sy) * w + (x & 7) * n], color & 15, n);
}

typedef struct { float x, y; } V2;

static V2 vertex_hd(u16 xi, u16 yi) {
  V2 v = { xi + 0.5f, yi + 0.5f };
  if (xi < 256 && yi < 256) {
    hd_stat_vtx++;
    u32 k = yi * 256 + xi;
    if (proj[k].stamp + 1 >= stamp) { v.x = proj[k].x; v.y = proj[k].y; hd_stat_vtx_hit++; }
  }
  return v;
}

static void fill_convex(const V2 *pv, int nv, u8 color, float grow) {
  int n = N(), H = screen_h();
  float ymin = 1e9f, ymax = -1e9f;
  for (int i = 0; i < nv; i++) { if (pv[i].y < ymin) ymin = pv[i].y; if (pv[i].y > ymax) ymax = pv[i].y; }
  float area = 0;
  for (int i = 0; i < nv; i++) { const V2 *a = &pv[i], *b = &pv[(i + 1) % nv]; area += a->x * b->y - b->x * a->y; }
  if (fabsf(area) < 1e-6f) return;
  float sgn = area > 0 ? 1.f : -1.f;
  int y0 = (int)floorf((ymin - grow) * n), y1 = (int)ceilf((ymax + grow) * n);
  if (y0 < 0) y0 = 0; if (y1 > H * n) y1 = H * n;
  u8 lo = color & 15, hi = (g.por & 2) ? color >> 4 : lo;
  for (int hy = y0; hy < y1; hy++) {
    float py = (hy + 0.5f) / n;
    float xl = -1e9f, xr = 1e9f;
    bool empty = false;
    for (int i = 0; i < nv && !empty; i++) {
      const V2 *a = &pv[i], *b = &pv[(i + 1) % nv];
      float ex = b->x - a->x, ey = b->y - a->y, len = sqrtf(ex * ex + ey * ey);
      if (len < 1e-6f) continue;
      float k = -sgn * ey, rhs = -grow * len - sgn * ex * (py - a->y) - sgn * ey * a->x;
      if (fabsf(k) < 1e-9f) { if (0 < rhs) empty = true; continue; }
      float bound = rhs / k;
      if (k > 0) { if (bound > xl) xl = bound; } else { if (bound < xr) xr = bound; }
    }
    if (empty || xl > xr) continue;
    int hx0 = (int)ceilf(xl * n - 0.5f), hx1 = (int)floorf(xr * n - 0.5f);
    if (hx0 < 0) hx0 = 0; if (hx1 > 256 * n - 1) hx1 = 256 * n - 1;
    for (int hx = hx0; hx <= hx1; hx++) {
      u8 c = ((hx ^ hy) & 1) ? hi : lo;
      if (c || (g.por & 1)) hd_put(hx, hy, c);
    }
  }
}

static u16 gram16(u16 a) { u32 b = (0x70 + g.rambr) << 16; return gread(b | a) | gread(b | (u16)(a + 1)) << 8; }

static void draw_poly(int n, int stride) {
  if (n < 2 || n > 16 || !N()) return;
  u8 color = g.colr;
  V2 v[16];
  for (int i = 0; i < n; i++) v[i] = vertex_hd(gram16(0x0982 + i * stride) & 0xff, gram16(0x0984 + i * stride) & 0xff);
  if (n == 2) {
    float dx = v[1].x - v[0].x, dy = v[1].y - v[0].y, l = sqrtf(dx * dx + dy * dy);
    if (l < 1e-3f) { dx = 1; dy = 0; l = 1; }
    float nx = -dy / l * 0.5f, ny = dx / l * 0.5f, tx = dx / l * 0.5f, ty = dy / l * 0.5f;
    V2 q[4] = { { v[0].x - tx + nx, v[0].y - ty + ny }, { v[1].x + tx + nx, v[1].y + ty + ny },
                { v[1].x + tx - nx, v[1].y + ty - ny }, { v[0].x - tx - nx, v[0].y - ty - ny } };
    fill_convex(q, 4, color & 15, 0);
  } else fill_convex(v, n, color, 0.5f);
}

static void record_projection(void) {
  u16 z = g.r[6] & ~1;
  u32 ra = (g.rombr << 16) | (u16)(0x896c + z);
  s16 recip = (s16)(gread(ra) | gread((ra & 0xff0000) | (u16)(ra + 1)) << 8);
  s16 cx = (s16)gram16(0x034), cy = (s16)gram16(0x036);
  s32 px = (s32)(s16)g.r[1] * recip, py = (s32)(s16)g.r[2] * recip;
  int xi = (s16)((u16)(px >> 15) + cx), yi = (s16)((u16)(py >> 15) + cy);
  if (xi < 0 || xi > 255 || yi < 0 || yi > 255) return;
  u32 k = yi * 256 + xi;
  proj[k].x = px / 32768.0f + cx; proj[k].y = py / 32768.0f + cy; proj[k].stamp = stamp;
}

bool gsu_is_hook(int off) { return off == 0xa681 || off == 0xa355 || off == 0x8a91; }

void gsu_hook(int off) {
  if (off == 0xa681) draw_poly((u16)(g.r[0] + 2), 4);
  else if (off == 0xa355) draw_poly(2, 4);
  else if (off == 0x8a91) record_projection();
}

void hd_gsu_started(void) { stamp++; }

void hd_vram_byte(u16 word_addr, int high, s32 src) {
  if (!hd_active_scale) return;
  int t = (word_addr & 0x7fff) >> 4;
  int bi = ((word_addr & 15) << 1) | high;
  if (src < 0 || ((src >> 16) & 0xfe) != 0x70) { hd_vvalid[t] = false; vt_mask[t] = 0; return; }
  u32 base = (u32)src - bi;
  if (vt_base[t] != base || vt_mask[t] == 0xffffffff) { vt_base[t] = base; vt_mask[t] = 0; }
  vt_mask[t] |= 1u << bi;
  if (vt_mask[t] != 0xffffffff) return;
  int ci = char_index(base);
  if ((base & 31) || !gvalid[ci] || !gch[ci]) { hd_vvalid[t] = false; return; }
  if (!hd_vtile[t]) hd_vtile[t] = malloc(CSZ());
  memcpy(hd_vtile[t], gch[ci], CSZ());
  hd_vvalid[t] = true;
}
