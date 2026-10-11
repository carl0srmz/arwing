#include "app.h"
#include <time.h>

bool app_quit;
const char *uitest_prefix;
void ui_debug_set(int s, int p);
void video_read(u32 *dst);
static bool is_fullscreen, snd;
void save_sram(void);

static s16 ring[16384 * 2]; static int ring_n;
static const s16 *clip; static int clip_len, clip_pos;

static void audio_ring_add(const s16 *s, int n) {
  int room = 16384 - ring_n; if (n > room) n = room;
  int vol = cfg.volume * 256 / 100;
  for (int i = 0; i < n * 2; i++) ring[ring_n * 2 + i] = (s16)((s[i] * vol) >> 8);
  ring_n += n;
}
static void audio_submit(void) {
  if (!snd) { ring_n = 0; return; }
  while (ring_n >= ABUF_FRAMES && snd_put(ring, ABUF_FRAMES)) {
    memmove(ring, ring + ABUF_FRAMES * 2, (ring_n - ABUF_FRAMES) * 4); ring_n -= ABUF_FRAMES;
  }
}
static int audio_queued(void) { return snd_busy() + ring_n; }
void audio_play_clip(const s16 *pcm, int frames) { clip = pcm; clip_len = frames; clip_pos = 0; }
void audio_stop_clip(void) { clip = NULL; }
static void audio_clip_pump(void) {
  if (!clip) return;
  while (clip_pos < clip_len && audio_queued() < ABUF_FRAMES * 4) {
    int n = clip_len - clip_pos; if (n > ABUF_FRAMES) n = ABUF_FRAMES;
    audio_ring_add(clip + clip_pos * 2, n); clip_pos += n; audio_submit();
  }
  if (clip_pos >= clip_len) clip = NULL;
}

static u32 *srcbuf, *epxbuf; static int srccap;
void build_source(const u32 *fb, const u8 *mask, const u32 *hdfb, int hdn, const Settings *st, const u32 **out, int *w, int *h) {
  int need = 1024 * 896;
  if (srccap < need) { free(srcbuf); free(epxbuf); srcbuf = malloc(need * 4); epxbuf = malloc(need * 4); srccap = need; }
  if (hdfb && hdn >= 2) {
    *w = 256 * hdn; *h = 224 * hdn;
    if (st->filter != FILT_PIXELART) { *out = hdfb; return; }
    scale_epx(fb, 256, 224, epxbuf, hdn);
    memcpy(srcbuf, hdfb, (size_t)*w * *h * 4);
    for (int y = 0; y < 224; y++)
      for (int x = 0; x < 256; x++) {
        if (mask[y * 256 + x]) continue;
        for (int sy = 0; sy < hdn; sy++)
          memcpy(&srcbuf[(y * hdn + sy) * *w + x * hdn], &epxbuf[(y * hdn + sy) * *w + x * hdn], hdn * 4);
      }
    *out = srcbuf; return;
  }
  if (st->filter == FILT_PIXELART) { scale_epx(fb, 256, 224, srcbuf, 4); *out = srcbuf; *w = 1024; *h = 896; return; }
  *out = fb; *w = 256; *h = 224;
}

static u32 *pv1x[2], *pvhd[2][5]; u8 *preview_mask[2];
static s16 *pvclip[2]; static int pvclip_frames;
static volatile LONG preview_ready;
#define PV_CLIP_START 3000
#define PV_CLIP_FRAMES 240
static const int pv_frame[2] = { 3600, 2000 };
static const char *PV_CACHE = "preview_cache.bin";

const u32 *preview_hd(int s, int n) { return (n >= 2 && n <= 4) ? pvhd[s][n] : NULL; }

static void pv_alloc(void) {
  for (int s = 0; s < 2; s++) {
    pv1x[s] = calloc(256 * 224, 4); preview_mask[s] = calloc(256 * 224, 1);
    for (int n = 2; n <= 4; n++) pvhd[s][n] = calloc(256 * n * 224 * n, 4);
    pvclip[s] = calloc(48000 * 6 * 2, 2);
  }
}
static void pv_downsample(int s) {
  for (int n = 2; n <= 3; n++)
    for (int y = 0; y < 224 * n; y++)
      for (int x = 0; x < 256 * n; x++) {
        u32 r = 0, g = 0, b = 0, c = 0;
        int x0 = x * 4 / n, x1 = ((x + 1) * 4 + n - 1) / n, y0 = y * 4 / n, y1 = ((y + 1) * 4 + n - 1) / n;
        for (int yy = y0; yy < y1; yy++) for (int xx = x0; xx < x1; xx++) {
          u32 p = pvhd[s][4][yy * 1024 + xx]; r += (p >> 16) & 255; g += (p >> 8) & 255; b += p & 255; c++;
        }
        pvhd[s][n][y * 256 * n + x] = 0xff000000 | (r / c) << 16 | (g / c) << 8 | (b / c);
      }
}
static bool pv_load_cache(void) {
  FILE *f = fopen(PV_CACHE, "rb"); if (!f) return false;
  u32 magic = 0; fread(&magic, 4, 1, f);
  bool ok = magic == 0x31565053;
  for (int s = 0; s < 2 && ok; s++) {
    ok &= fread(pv1x[s], 4, 256 * 224, f) == 256 * 224;
    ok &= fread(preview_mask[s], 1, 256 * 224, f) == 256 * 224;
    ok &= fread(pvhd[s][4], 4, 1024 * 896, f) == 1024 * 896;
    ok &= fread(pvclip[s], 4, 48000 * 4, f) == 48000 * 4;
  }
  fclose(f);
  if (ok) { pv_downsample(0); pv_downsample(1); pvclip_frames = 48000 * 4; }
  return ok;
}
static void pv_save_cache(void) {
  FILE *f = fopen(PV_CACHE, "wb"); if (!f) return;
  u32 magic = 0x31565053; fwrite(&magic, 4, 1, f);
  for (int s = 0; s < 2; s++) {
    fwrite(pv1x[s], 4, 256 * 224, f); fwrite(preview_mask[s], 1, 256 * 224, f);
    fwrite(pvhd[s][4], 4, 1024 * 896, f); fwrite(pvclip[s], 4, 48000 * 4, f);
  }
  fclose(f);
}
static int pv_thread(void *arg) {
  (void)arg;
  apu_dual = true;
  static s16 tmp[8192];
  int n0 = 0, n1 = 0;
  for (int f = 0; f <= pv_frame[0]; f++) {
    snes_set_pad(0, 0);
    snes_run_frame();
    int a = apu_take_samples(tmp, 4096), b2;
    if (f >= PV_CLIP_START && n0 + a <= 48000 * 4) { memcpy(pvclip[0] + n0 * 2, tmp, a * 4); n0 += a; }
    b2 = apu_take_samples2(tmp, 4096);
    if (f >= PV_CLIP_START && n1 + b2 <= 48000 * 4) { memcpy(pvclip[1] + n1 * 2, tmp, b2 * 4); n1 += b2; }
    for (int s = 0; s < 2; s++)
      if (f == pv_frame[s]) {
        memcpy(pv1x[s], framebuf, 256 * 224 * 4); memcpy(preview_mask[s], ppu_hdmask, 256 * 224);
        memcpy(pvhd[s][4], hd_framebuf, 1024 * 896 * 4);
      }
  }
  apu_dual = false;
  pvclip_frames = n0 < n1 ? n0 : n1;
  pv_downsample(0); pv_downsample(1);
  pv_save_cache();
  InterlockedExchange(&preview_ready, 1);
  return 0;
}

static void set_fullscreen(bool on) {
  if (on == is_fullscreen) return;
  plat_fullscreen(on);
  is_fullscreen = on; cfg.fullscreen = on;
}
void app_toggle_fullscreen(void) { set_fullscreen(!is_fullscreen); }

static int slot;
static void state_path(char *p, int n) { plat_mkdir("saves"); snprintf(p, n, "saves/slot%d.state", slot); }
static void save_state(void) {
  Ser s = { 0 }; snes_serialize(&s);
  char p[64]; state_path(p, sizeof p);
  FILE *f = fopen(p, "wb"); if (f) { fwrite(s.buf, 1, s.pos, f); fclose(f); osd_message("Saved state %d", slot); }
  free(s.buf);
}
static void load_state(void) {
  char p[64]; state_path(p, sizeof p);
  FILE *f = fopen(p, "rb");
  if (!f) { osd_message("State %d is empty", slot); return; }
  fseek(f, 0, SEEK_END); long n = ftell(f); fseek(f, 0, SEEK_SET);
  Ser s = { malloc(n), 0, (size_t)n, true }; fread(s.buf, 1, n, f); fclose(f);
  snes_serialize(&s); free(s.buf);
  hd_reset();
  osd_message("Loaded state %d", slot);
}
static void write_bmp32(const char *p, const u32 *pix, int w, int h) {
  FILE *f = fopen(p, "wb"); if (!f) return;
  u8 hd[54] = { 'B', 'M' };
  *(u32 *)(hd + 2) = 54 + w * h * 4; *(u32 *)(hd + 10) = 54; *(u32 *)(hd + 14) = 40;
  *(s32 *)(hd + 18) = w; *(s32 *)(hd + 22) = -h; *(u16 *)(hd + 26) = 1; *(u16 *)(hd + 28) = 32;
  fwrite(hd, 1, 54, f); fwrite(pix, 4, w * h, f); fclose(f);
}

static int ut_step; static char ut_name[64]; static int ut_game_frames;
static void ut_capture(void) {
  if (!ut_name[0]) return;
  u32 *buf = malloc(video_width() * video_height() * 4);
  video_read(buf);
  char p[256]; snprintf(p, sizeof p, "%s_%s.bmp", uitest_prefix, ut_name);
  write_bmp32(p, buf, video_width(), video_height());
  free(buf); ut_name[0] = 0; ut_step++;
}
static bool ut_menu(void) {
  if (ut_name[0] || !preview_ready) return false;
  switch (ut_step) {
  case 0: cfg.filter = FILT_SMOOTH; cfg.hd3d = 4; cfg.aspect = ASPECT_4_3; ui_debug_set(1, 0); strcpy(ut_name, "01_filter_smooth"); break;
  case 1: cfg.filter = FILT_CRT; ui_debug_set(2, 0); strcpy(ut_name, "02_crt_aperture"); break;
  case 2: cfg.crt_mask = MASK_SHADOW; strcpy(ut_name, "03_crt_shadow"); break;
  case 3: cfg.crt_mask = MASK_APERTURE; cfg.filter = FILT_PIXELART; ui_debug_set(1, 0); strcpy(ut_name, "04_pixelart"); break;
  case 4: cfg.filter = FILT_SMOOTH; cfg.hd3d = 1; ui_debug_set(8, 0); strcpy(ut_name, "05_hd_off"); break;
  case 5: cfg.hd3d = 4; strcpy(ut_name, "06_hd_4x"); break;
  case 6: cfg.aspect = ASPECT_16_9_AMBIENT; ui_debug_set(6, 0); strcpy(ut_name, "07_aspect_ambient"); break;
  case 7: cfg.aspect = ASPECT_4_3; ui_debug_set(0, 1); strcpy(ut_name, "08_controls"); break;
  case 8: ui_debug_set(0, 0); cfg.filter = FILT_CRT; return true;
  }
  return false;
}
static void ut_game(void) {
  if (ut_name[0]) return;
  if (ut_game_frames < 2300) return;
  switch (ut_step) {
  case 8: strcpy(ut_name, "09_game_crt_hd"); break;
  case 9: cfg.filter = FILT_SMOOTH; strcpy(ut_name, "10_game_smooth_hd"); break;
  case 10: cfg.aspect = ASPECT_16_9_AMBIENT; strcpy(ut_name, "11_game_ambient"); break;
  case 11: cfg.aspect = ASPECT_4_3; cfg.hd3d = 1; hd_scale = 0; hd_reset(); strcpy(ut_name, "12_game_smooth_1x"); break;
  case 12: {
    static u32 t0; static int f0;
    if (!t0) { t0 = GetTickCount(); f0 = ut_game_frames; }
    else if (GetTickCount() - t0 >= 3000) {
      printf("uitest: %.2f emulated frames/s with audio pacing (audio device %s)\n", (ut_game_frames - f0) * 1000.0 / (GetTickCount() - t0), snd ? "open" : "missing");
      fflush(stdout); ut_step++;
    }
    break;
  }
  default: app_quit = true;
  }
}

static void screenshot(const u32 *pix, int w, int h) {
  plat_mkdir("screenshots");
  time_t now = time(NULL); struct tm t = *localtime(&now);
  char p[128]; snprintf(p, sizeof p, "screenshots/starfox_%04d%02d%02d_%02d%02d%02d.bmp", t.tm_year + 1900, t.tm_mon + 1, t.tm_mday, t.tm_hour, t.tm_min, t.tm_sec);
  FILE *f = fopen(p, "wb"); if (!f) return;
  u8 hd[54] = { 'B', 'M' };
  *(u32 *)(hd + 2) = 54 + w * h * 4; *(u32 *)(hd + 10) = 54; *(u32 *)(hd + 14) = 40;
  *(s32 *)(hd + 18) = w; *(s32 *)(hd + 22) = -h; *(u16 *)(hd + 26) = 1; *(u16 *)(hd + 28) = 32;
  fwrite(hd, 1, 54, f); fwrite(pix, 4, w * h, f); fclose(f);
  osd_message("Screenshot saved: %s", p);
}

int app_run(void) {
  cfg_load("starfox.ini");
  if (!plat_open()) { plat_error("OpenGL initialisation failed."); return 1; }
  if (cfg.fullscreen) { cfg.fullscreen = 0; set_fullscreen(true); }
  snd = snd_open();
  ui_init();

  hd_scale = 4; hd_reset();
  Ser power = { 0 }; snes_serialize(&power);
  pv_alloc();
  void *th = NULL;
  if (pv_load_cache()) preview_ready = 1;
  else th = plat_thread(pv_thread);

  enum { M_MENU, M_GAME } mode = M_MENU;
  bool in_game = false, paused = false;
  bool k_save = 0, k_load = 0, k_menu = 0, k_slot = 0, k_pause = 0, k_shot = 0, k_fs = 0;
  double t0 = plat_time(), now;
  double fps = 0; int fps_frames = 0; double fps_t = t0;
  double frame_time = 357368.0 / 21477272.0; double next_frame = 0;
  const u32 *shown = framebuf; int shown_w = 256, shown_h = 224;
  bool ui_was_ready = false;

  while (!app_quit) {
    plat_events();
    input_poll();
    if (!ui_was_ready && preview_ready) {
      const u32 *a[2] = { pv1x[0], pv1x[1] }; const u32 *b[2] = { pvhd[0][4], pvhd[1][4] }; const s16 *c[2] = { pvclip[0], pvclip[1] };
      ui_set_preview_frames(a, b, 4, c, pvclip_frames);
      ui_was_ready = true;
    }
    bool fsk = input_key(VK_F11); if (fsk && !k_fs) set_fullscreen(!is_fullscreen); k_fs = fsk;
    if ((bool)cfg.fullscreen != is_fullscreen) set_fullscreen(cfg.fullscreen);

    if (mode == M_MENU) {
      apu_hq = cfg.audio_hires;
      UiResult res = ui_frame(in_game);
      if (uitest_prefix) { ut_capture(); if (ut_menu()) res = UI_START_GAME; }
      audio_clip_pump();
      video_present();
      if (res == UI_QUIT) app_quit = true;
      if (res == UI_START_GAME || res == UI_RESUME || res == UI_RESET) {
        if (!in_game || res == UI_RESET) {
          if (th) { plat_join(th); th = NULL; }
          static u8 keep[0x10000]; if (in_game) memcpy(keep, gsu_ram, sizeof keep);
          power.load = true; power.pos = 0; snes_serialize(&power);
          if (in_game) memcpy(gsu_ram, keep, sizeof keep);
          s16 junk[4096]; while (apu_take_samples(junk, 2048) > 0) {}
          in_game = true;
        }
        hd_scale = cfg.hd3d >= 2 ? cfg.hd3d : 0; hd_reset();
        cfg_save("starfox.ini");
        audio_stop_clip();
        mode = M_GAME; paused = false; input_flush_edges();
        k_menu = true;
        t0 = plat_time(); next_frame = 0;
      }
      continue;
    }

    bool b;
    b = input_bind_down(BIND_MENU); if (b && !k_menu) { mode = M_MENU; ui_init(); input_flush_edges(); k_menu = b; continue; } k_menu = b;
    b = input_bind_down(BIND_SAVE); if (b && !k_save) save_state(); k_save = b;
    b = input_bind_down(BIND_LOAD); if (b && !k_load) load_state(); k_load = b;
    b = input_key(VK_F3); if (b && !k_slot) { slot = (slot + 1) % 10; osd_message("State slot %d", slot); } k_slot = b;
    b = input_key('P') || input_key(VK_PAUSE); if (b && !k_pause) { paused = !paused; osd_message(paused ? "Paused" : "Resumed"); } k_pause = b;
    apu_hq = cfg.audio_hires;
    bool ff = input_bind_down(BIND_FAST);
    if (uitest_prefix) { ff = ut_game_frames < 2300; paused = !ff && ut_step < 12; }
    int frames = 0;
    if (!paused) {
      snes_set_pad(0, input_snes_mask());
      if (ff) {
        for (int i = 0; i < (uitest_prefix ? 25 : cfg.ff_speed); i++) { snes_run_frame(); frames++; }
        s16 junk[8192]; while (apu_take_samples(junk, 4096) > 0) {}
        t0 = plat_time(); next_frame = 0;
      } else if (snd) {
        double el = plat_time() - t0, q = audio_queued(), target = ABUF_FRAMES * 3;
        double adj = 1 + (q - target) / target * 0.005;
        if (adj < 0.995) adj = 0.995; if (adj > 1.005) adj = 1.005;
        while ((next_frame <= el || audio_queued() < ABUF_FRAMES) && frames < 4) {
          snes_run_frame(); frames++; next_frame += frame_time * adj;
          s16 tmp[8192]; int n = apu_take_samples(tmp, 4096); audio_ring_add(tmp, n); audio_submit();
        }
        if (el - next_frame > 0.25 || next_frame - el > 0.25) next_frame = el;
      } else {
        double el = plat_time() - t0;
        while (next_frame <= el && frames < 4) { snes_run_frame(); frames++; next_frame += frame_time; }
        if (el - next_frame > 0.25) next_frame = el;
        s16 junk[8192]; while (apu_take_samples(junk, 4096) > 0) {}
      }
    }
    if (frames || !shown) {
      int hn = hd_active_scale;
      build_source(framebuf, ppu_hdmask, hn ? hd_framebuf : NULL, hn, &cfg, &shown, &shown_w, &shown_h);
      video_upload_game(shown, shown_w, shown_h);
    }
    b = input_key(VK_F12); if (b && !k_shot) screenshot(shown, shown_w, shown_h); k_shot = b;
    fps_frames += frames;
    now = plat_time();
    double dt = now - fps_t;
    if (dt >= 0.5) { fps = fps_frames / dt; fps_frames = 0; fps_t = now; }
    video_clear(0, 0, 0);
    video_draw_game(&cfg, (Rect){ 0, 0, video_width(), video_height() }, 0, 0, 1, 1);
    osd_draw(fps);
    if (uitest_prefix) { ut_capture(); ut_game(); ut_game_frames += frames; }
    video_present();
    if (!frames && !cfg.vsync) Sleep(1);
  }
  if (th) plat_join(th);
  cfg_save("starfox.ini");
  if (in_game && !uitest_prefix) save_sram();
  return 0;
}
