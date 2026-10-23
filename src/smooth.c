#include "snes.h"

// 60 fps by interpolation. The game advances its world once per drawn frame (every 3+ vblanks).
// After each tick's logic we keep a snapshot of the whole machine. On the vblanks between two
// displayed images we restore the newer snapshot into a throwaway copy, blend object positions and
// angles with the older one, freeze the game logic and let the game's own camera, background,
// sprite and SuperFX code draw that state, then show the copy's frame. The real machine never sees
// any of it, and since tick k+1 is already computed when image k goes up, there is no added lag.

static u16 rd16(const u8 *w, u32 a) { return w[a] | w[a + 1] << 8; }

// ---- Star Fox ----
#define SM_AL0 0x0300       // objects; 0x0300 is viewblk, the camera
#define SM_ALSZ 0x36
#define SM_NAL 71
#define SM_POS 0x0c         // world x/y/z words
static const u8 sm_rot[3] = { 0x12, 0x13, 0x14 };   // x/y/z angle bytes
#define SM_ALLST 0x121d     // head of the active object list
#define SM_ALX 0x1cca       // each object's second block (strategy state, anim frame) sits this far after it
#define SM_GSU_FAST 1       // the copy may run the SuperFX flat out
#define SM_RELIST 1         // keep the older tick's set of objects
// Camera inputs read by getview: pviewpos x/y/z + z offset, viewfloat x/y, outv x/y/z angles, outdist,
// player_turnrot, and the player's x/y/z rotation.
static const u16 sm_words[] = { 0x14f6, 0x14f8, 0x14fa, 0x14fe, 0x14e6, 0x14e8, 0x18c5, 0x18c7, 0x18c9, 0x18cb,
                                0x152a, 0x1230, 0x1232, 0x1234 };
static int blend_words(const u8 *B, const u16 **w) { (void)B; if (w) *w = sm_words; return sizeof sm_words / sizeof *sm_words; }
static bool same_kind(const u8 *A, const u8 *B, u32 o) { return rd16(A, o + 4) == rd16(B, o + 4) && A[o + 9] == B[o + 9]; }
static u16 tick_now(void) { return rd16(wram, 0x15bb); }               // gameframe, +1 per dostrats
static void tick_set(u16 t) { (void)t; }                               // part of WRAM already
static void tick_write(u32 a, u8 v) { (void)a; (void)v; }
static bool is_snap(u32 a, u8 v) { (void)v; return a == 0x15a4; }     // lastcont0, written right after dostrats
static bool is_send(u32 a, u8 v) { return a == 0x0000 && v == 2; }    // trans_flag: start sending the last image
static u16 sent_tick(void) { return tick_now(); }                      // ...which dostrats has not moved past yet
static bool is_sent(u32 a, u8 v) { return a == 0x18bb && v == 2; }    // transbmp1: both halves in VRAM
static void freeze(void) { wram[0x177a] |= 1; }                        // freezestrats bit 0 skips dostrats
// ----

bool smooth_on, emu_clone, ppu_skip;
bool smooth_snap_due;

typedef struct { bool valid; u16 tick; Ser st; u8 wram[0x20000]; } Snap;
static Snap snaps[4];
static int snap_next;
static Ser real;

static bool pend_ok; static u16 pend_tick;          // tick of the image whose transfer just started
static bool shown_ok; static u16 shown_tick;        // tick of the image on screen
static long frame_no, swap_frame = -1000; static int period = 3;
static bool swapped, swap_late, new_ok; static u16 new_tick;
static u8 last_nba;

static bool cl_pend_ok, cl_capture, cl_next, cl_done; static u16 cl_pend_tick, cl_target;

void ppu_keep_2d(void), ppu_use_2d(void);

// The game's 2D layer (palette, sprites, flashes) runs a tick ahead of the 3D image and the copy's logic is
// frozen, so an interpolated frame takes the 2D state the real machine shows at the start of that frame.
void smooth_line1(void) {
  if (!emu_clone) { if (smooth_on) ppu_keep_2d(); }
  else if (cl_capture) ppu_use_2d();
}

void ppu_regs_keep(int y), ppu_regs_use(int y);
void smooth_line_regs(int y) {
  if (!emu_clone) { if (smooth_on) ppu_regs_keep(y); }
  else if (cl_capture) ppu_regs_use(y);
}

extern bool gsu_skip_run;

void smooth_wram_write(u32 a, u8 v) {
  tick_write(a, v);
  // Once the copy's image is in VRAM, the SuperFX would only draw a frame we never show.
  if (is_sent(a, v) && emu_clone && cl_pend_ok && cl_pend_tick == cl_target) gsu_skip_run = true;
  if (is_snap(a, v) && !emu_clone && smooth_on && blend_words(wram, NULL) >= 0) smooth_snap_due = true;
  if (is_send(a, v)) {
    if (emu_clone) { cl_pend_ok = true; cl_pend_tick = sent_tick(); }
    else { pend_ok = true; pend_tick = sent_tick(); }
  }
}

void smooth_bg12nba(u8 v) {
  if (v == last_nba) return;
  last_nba = v;
  // The game swaps from a line IRQ under the 3D window, so a swap during the visible lines
  // shows up on the next frame.
  bool late = vcount >= 1 && vcount <= 224;
  if (emu_clone) {
    if (cl_pend_ok && cl_pend_tick == cl_target) { if (late) cl_next = true; else { cl_capture = true; ppu_skip = false; } }
    cl_pend_ok = false;
    return;
  }
  swapped = true; swap_late = late;
  if (!late) ppu_skip = false;
  new_ok = pend_ok; new_tick = pend_tick; pend_ok = false;
}

void smooth_snapshot(void) {
  smooth_snap_due = false;
  Snap *s = &snaps[snap_next]; snap_next = (snap_next + 1) & 3;
  s->st.pos = 0; s->st.load = false;
  snes_serialize(&s->st);
  memcpy(s->wram, wram, sizeof wram);
  s->tick = tick_now(); s->valid = true;
}

static Snap *find(u16 tick) {
  for (int i = 0; i < 4; i++) if (snaps[i].valid && snaps[i].tick == tick) return &snaps[i];
  return NULL;
}

static void active_set(const u8 *w, bool *on) {
  memset(on, 0, SM_NAL);
  on[0] = true;
  u16 x = rd16(w, SM_ALLST);
  for (int n = 0; x && n < SM_NAL * 2; n++) {
    if (x < SM_AL0 || (x - SM_AL0) % SM_ALSZ || (x - SM_AL0) / SM_ALSZ >= SM_NAL) break;
    on[(x - SM_AL0) / SM_ALSZ] = true;
    x = rd16(w, x);
  }
}

static int mix(int a, int d, int num, int den) { int t = d * num * 2; return a + (t >= 0 ? (t + den) / (2 * den) : -((-t + den) / (2 * den))); }
static s16 lerp16(s16 a, s16 b, int num, int den) { return (s16)mix(a, (s16)(b - a), num, den); }
static s8 lerp8(s8 a, s8 b, int num, int den) { return (s8)mix(a, (s8)(b - a), num, den); }

static void wr16(u32 a, u16 v) { wram[a] = (u8)v; wram[a + 1] = v >> 8; }

static void unlink_obj(u32 o) {
  u16 n = rd16(wram, o), p = rd16(wram, o + 2);
  if (p) wr16(p, n); else wr16(SM_ALLST, n);
  if (n) wr16(n + 2, p);
}

static void link_obj(u32 o) {
  u16 h = rd16(wram, SM_ALLST);
  wr16(o, h); wr16(o + 2, 0);
  if (h) wr16(h + 2, (u16)o);
  wr16(SM_ALLST, (u16)o);
}

// Bring back the object the older tick had in this slot, keeping the copy's list links if it has any.
static void restore_obj(const u8 *A, u32 o, bool linked) {
  u16 n = rd16(wram, o), p = rd16(wram, o + 2);
  memcpy(&wram[o], &A[o], SM_ALSZ);
  memcpy(&wram[o + SM_ALX], &A[o + SM_ALX], SM_ALSZ);
  if (linked) { wr16(o, n); wr16(o + 2, p); } else link_obj(o);
}

static void blend(const u8 *A, const u8 *B, int num, int den) {
  const u16 *words; int nw = blend_words(B, &words);
  for (int i = 0; i < nw; i++) {
    u16 o = words[i]; s16 a = (s16)rd16(A, o), d = (s16)(rd16(B, o) - a);
    if (d > 0x2000 || d < -0x2000) continue;
    wr16(o, (u16)mix(a, d, num, den));
  }
  // In-between frames show the older tick's set of objects, as the real frames do until the next image:
  // objects created this tick stay hidden and ones removed this tick stay visible.
  bool ona[SM_NAL], onb[SM_NAL];
  active_set(A, ona); active_set(B, onb);
  for (int i = 1; i < SM_NAL && SM_RELIST; i++) {
    u32 o = SM_AL0 + i * SM_ALSZ;
    bool same = ona[i] && onb[i] && same_kind(A, B, o);
    if (onb[i] && !same && !ona[i]) unlink_obj(o);
    else if (ona[i] && !same) restore_obj(A, o, onb[i]);
  }
  for (int i = 0; i < SM_NAL; i++) {
    if (!ona[i] || !onb[i]) continue;
    u32 o = SM_AL0 + i * SM_ALSZ;
    if (i && !same_kind(A, B, o)) continue;
    bool jump = false;
    for (int k = 0; k < 3; k++) { s16 d = (s16)(rd16(B, o + SM_POS + k * 2) - rd16(A, o + SM_POS + k * 2)); if (d > 2000 || d < -2000) jump = true; }
    if (jump) continue;
    for (int k = 0; k < 3; k++) {
      wr16(o + SM_POS + k * 2, (u16)lerp16((s16)rd16(A, o + SM_POS + k * 2), (s16)rd16(B, o + SM_POS + k * 2), num, den));
      wram[o + sm_rot[k]] = (u8)lerp8((s8)A[o + sm_rot[k]], (s8)B[o + sm_rot[k]], num, den);
    }
  }
}

extern u32 gsu_mul, gsu_base_mul;
void apu_set_silent(bool on);
void pace_clone(bool on);

extern int ppu_blend_num, ppu_blend_den;
static bool clone_frame(Snap *A, Snap *B, int num, int den) {
  ppu_blend_num = num; ppu_blend_den = den;
  real.pos = 0; real.load = false;
  snes_serialize(&real);
  u16 tick = tick_now();
  pace_clone(true); gsu_mul = SM_GSU_FAST ? 1 : gsu_base_mul;
  emu_clone = true; ppu_skip = true; apu_set_silent(true); hd_ctx(1);
  u8 nba = last_nba;
  B->st.pos = 0; B->st.load = true; snes_serialize(&B->st);
  tick_set(B->tick);
  blend(A->wram, B->wram, num, den);
  freeze();
  cl_pend_ok = false; cl_capture = cl_next = cl_done = false; cl_target = B->tick;
  for (int n = 0; n < 12 && !cl_done; n++) {
    if (cl_next) { cl_next = false; cl_capture = true; ppu_skip = false; }
    snes_run_frame();
    if (cl_capture) cl_done = true;
  }
  hd_ctx(0); apu_set_silent(false); ppu_skip = false; emu_clone = false; gsu_skip_run = false;
  pace_clone(false); last_nba = nba;
  real.pos = 0; real.load = true; snes_serialize(&real); tick_set(tick);
  return cl_done;
}

// Frames between two swaps show the in-between state of the image on screen and the next one.
static bool cur_interp, cur_fail; static int cur_num, cur_den; static u16 cur_tick;

static bool interp_due(long f) {
  int j = (int)(f - swap_frame);
  Snap *B;
  return smooth_on && shown_ok && !cur_fail && j >= 1 && j <= 10 && find(shown_tick) && (B = find((u16)(shown_tick + 1))) &&
         blend_words(B->wram, NULL) >= 0;
}

// Before each real frame: a frame that will be replaced need not be drawn.
void smooth_frame_begin(void) { ppu_skip = interp_due(frame_no + 1); }

// After each real frame: note which state the frame shows.
void smooth_frame_end(void) {
  frame_no++;
  // A swap during the visible lines only shows up next frame: this one still shows the old image.
  cur_interp = (!swapped || swap_late) && interp_due(frame_no);
  if (cur_interp) { int j = (int)(frame_no - swap_frame); cur_num = j < period ? j : period; cur_den = period; cur_tick = shown_tick; }
  if (swapped) {
    long at = frame_no + swap_late;
    int p = (int)(at - swap_frame);
    if (p >= 2 && p <= 10) period = p;
    swap_frame = at; swapped = false;
    shown_ok = new_ok; shown_tick = new_tick; cur_fail = false;
  }
  ppu_skip = false;
}

// Draw the frame to show for the last real frame. Without this, framebuf keeps the last image.
void smooth_present(void) {
  if (!cur_interp) return;
  cur_interp = false;
  Snap *A = find(cur_tick), *B = find((u16)(cur_tick + 1));
  // If the copy never gets its image on screen (the game left its 3D loop), the last frame stays up and
  // real frames are drawn again until the next swap.
  static u32 keep[256 * 239], hd_keep[256 * 8 * 239 * 8];
  size_t hn = hd_active_scale ? (size_t)256 * hd_active_scale * 239 * hd_active_scale : 0;
  bool had = false;
  for (int i = 0; i < 256 * 224 && !had; i++) had = framebuf[i] & 0xffffff;
  if (hn <= sizeof hd_keep / 4) { memcpy(keep, framebuf, sizeof keep); if (hn) memcpy(hd_keep, hd_framebuf, hn * 4); }
  bool ok = A && B && clone_frame(A, B, cur_num, cur_den);
  // A copy that comes out completely black while the screen was not is a miss: keep the old image.
  bool blank = ok && had;
  for (int i = 0; i < 256 * 224 && blank; i++) blank = !(framebuf[i] & 0xffffff);
  if (blank && hn <= sizeof hd_keep / 4) { memcpy(framebuf, keep, sizeof keep); if (hn) memcpy(hd_framebuf, hd_keep, hn * 4); }
  if (!ok) cur_fail = true;
}

void smooth_reset(void) {
  for (int i = 0; i < 4; i++) snaps[i].valid = false;
  pend_ok = shown_ok = new_ok = swapped = smooth_snap_due = cur_interp = cur_fail = false;
  swap_frame = frame_no - 1000;
}
