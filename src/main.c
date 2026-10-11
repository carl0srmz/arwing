#include "snes.h"

static char sram_path[512];
extern bool rc_enabled, grc_enabled; extern u64 rc_hits, rc_misses, grc_hits, grc_misses; void rc_init(void); void grc_init(void);
static u32 jumps[65536][2]; static int njumps;
static u32 ramx[65536][2];
void cov_note_ramexec(u32 ram, u32 src) {
  u32 h = (ram * 2654435761u ^ src * 40503u) & 0xffff;
  for (int i = 0; i < 65536; i++) {
    u32 k = (h + i) & 0xffff;
    if (ramx[k][0] == 0) { ramx[k][0] = ram | 0x80000000; ramx[k][1] = src; return; }
    if (ramx[k][0] == (ram | 0x80000000) && ramx[k][1] == src) return;
  }
}

void cov_note_jump(u32 from, u32 to) {
  u32 h = (from * 2654435761u ^ to * 40503u) & 0xffff;
  for (int i = 0; i < 65536; i++) {
    u32 k = (h + i) & 0xffff;
    if (jumps[k][0] == 0 && jumps[k][1] == 0) { jumps[k][0] = from | 0x80000000; jumps[k][1] = to; njumps++; return; }
    if (jumps[k][0] == (from | 0x80000000) && jumps[k][1] == to) return;
  }
}

static bool load_rom(const char *path) {
  FILE *f = fopen(path, "rb");
  if (!f) return false;
  fseek(f, 0, SEEK_END); long n = ftell(f); fseek(f, 0, SEEK_SET);
  if (n & 0x200) { fseek(f, 0x200, SEEK_SET); n -= 0x200; }
  u32 sz = 1; while (sz < (u32)n) sz <<= 1;
  rom = calloc(sz, 1); rom_size = sz;
  fread(rom, 1, n, f); fclose(f);
  for (u32 i = n; i < sz; i++) rom[i] = rom[i - (sz >> 1)];
  return true;
}

void save_sram(void) { FILE *f = fopen(sram_path, "wb"); if (f) { fwrite(gsu_ram, 1, 0x10000, f); fclose(f); } }
static void load_sram(void) { FILE *f = fopen(sram_path, "rb"); if (f) { fread(gsu_ram, 1, 0x10000, f); fclose(f); } }

static void write_bmp_buf(const char *path, const u32 *buf, int w, int h) {
  FILE *f = fopen(path, "wb"); if (!f) return;
  u8 hd[54] = { 'B', 'M' };
  *(u32 *)(hd + 2) = 54 + w * h * 4; *(u32 *)(hd + 10) = 54; *(u32 *)(hd + 14) = 40;
  *(s32 *)(hd + 18) = w; *(s32 *)(hd + 22) = -h; *(u16 *)(hd + 26) = 1; *(u16 *)(hd + 28) = 32;
  fwrite(hd, 1, 54, f); fwrite(buf, 4, w * h, f); fclose(f);
}

static void write_bmp(const char *path) {
  int h = ppu_overscan ? 239 : 224;
  if (hd_active_scale) { char p2[600]; snprintf(p2, sizeof p2, "%.*s_hd.bmp", (int)strlen(path) - 4, path); write_bmp_buf(p2, hd_framebuf, 256 * hd_active_scale, h * hd_active_scale); }
  FILE *f = fopen(path, "wb"); if (!f) return;
  u32 sz = 54 + 256 * h * 4;
  u8 hd[54] = { 'B', 'M' };
  *(u32 *)(hd + 2) = sz; *(u32 *)(hd + 10) = 54; *(u32 *)(hd + 14) = 40;
  *(s32 *)(hd + 18) = 256; *(s32 *)(hd + 22) = -h; *(u16 *)(hd + 26) = 1; *(u16 *)(hd + 28) = 32;
  fwrite(hd, 1, 54, f); fwrite(framebuf, 4, 256 * h, f); fclose(f);
}

static void dump_coverage(const char *prefix) {
  char p[512];
  sprintf(p, "%s_cpu.bin", prefix);
  FILE *f = fopen(p, "wb"); if (f) { fwrite(cov_cpu, 1, 1 << 24, f); fclose(f); }
  sprintf(p, "%s_gsu.bin", prefix);
  f = fopen(p, "wb"); if (f) { fwrite(cov_gsu, 1, 1 << 24, f); fclose(f); }
  sprintf(p, "%s_rom.bin", prefix);
  f = fopen(p, "wb"); if (f) { fwrite(cov_rom, 1, rom_size, f); fclose(f); }
  sprintf(p, "%s_ramexec.txt", prefix);
  f = fopen(p, "wb");
  if (f) { for (int i = 0; i < 65536; i++) if (ramx[i][0]) fprintf(f, "%06x %x\n", ramx[i][0] & 0xffffff, ramx[i][1]); fclose(f); }
  sprintf(p, "%s_wsrc.bin", prefix);
  f = fopen(p, "wb"); if (f) { fwrite(wram_src, 4, 0x20000, f); fclose(f); }
  sprintf(p, "%s_wram.bin", prefix);
  f = fopen(p, "wb"); if (f) { fwrite(wram, 1, sizeof wram, f); fclose(f); }
  sprintf(p, "%s_jumps.txt", prefix);
  f = fopen(p, "wb");
  if (f) { for (int i = 0; i < 65536; i++) if (jumps[i][0]) fprintf(f, "%06x %06x\n", jumps[i][0] & 0xffffff, jumps[i][1]); fclose(f); }
}

static struct { int frame; u16 mask; } script[4096]; static int nscript;
static void load_script(const char *path) {
  FILE *f = fopen(path, "r"); if (!f) return;
  char line[256];
  while (fgets(line, sizeof line, f) && nscript < 4096) {
    int fr; unsigned m;
    if (sscanf(line, "%d %x", &fr, &m) == 2) { script[nscript].frame = fr; script[nscript].mask = (u16)m; nscript++; }
  }
  fclose(f);
}
static u16 script_pad(int frame) {
  u16 m = 0;
  for (int i = 0; i < nscript; i++) if (script[i].frame <= frame) m = script[i].mask;
  return m;
}

int app_run(void);
bool plat_home(void);
void plat_error(const char *msg);

int main(int argc, char **argv) {
  const char *rom_path = "build/starfox.sfc", *shot_prefix = "shot", *cov_prefix = NULL;
  const char *gsuprof_path = NULL, *state_file = NULL, *save_file = NULL; int save_frame = -1;
  FILE *hashlog = NULL, *wav = NULL; u32 wav_frames = 0; int wramdump_frame = -1;
  int frames = -1; int shots[256]; int nshots = 0;
  for (int i = 1; i < argc; i++) {
    if (!strcmp(argv[i], "--version")) { puts("Project Arwing 1.0"); return 0; }
    else if (!strcmp(argv[i], "--frames") && i + 1 < argc) frames = atoi(argv[++i]);
    else if (!strcmp(argv[i], "--shot") && i + 1 < argc) { char *p = argv[++i]; while (*p && nshots < 256) { shots[nshots++] = strtol(p, &p, 10); if (*p == ',') p++; else break; } }
    else if (!strcmp(argv[i], "--shotprefix") && i + 1 < argc) shot_prefix = argv[++i];
    else if (!strcmp(argv[i], "--script") && i + 1 < argc) load_script(argv[++i]);
    else if (!strcmp(argv[i], "--cov") && i + 1 < argc) cov_prefix = argv[++i];
    else if (!strcmp(argv[i], "--interp")) rc_enabled = grc_enabled = false;
    else if (!strcmp(argv[i], "--interp-gsu")) grc_enabled = false;
    else if (!strcmp(argv[i], "--hd") && i + 1 < argc) hd_scale = atoi(argv[++i]);
    else if (!strcmp(argv[i], "--uitest") && i + 1 < argc) { extern const char *uitest_prefix; uitest_prefix = argv[++i]; }
    else if (!strcmp(argv[i], "--polydump") && i + 1 < argc) { extern bool gsu_hooks_enabled; extern int hd_debug; gsu_hooks_enabled = true; hd_debug = atoi(argv[++i]); }
    else if (!strcmp(argv[i], "--gsuprof") && i + 1 < argc) { extern u32 *gsu_prof; gsu_prof = calloc(1 << 23, 4); grc_enabled = false; gsuprof_path = argv[++i]; }
    else if (!strcmp(argv[i], "--wav") && i + 1 < argc) { wav = fopen(argv[++i], "wb"); u8 z[44] = { 0 }; fwrite(z, 1, 44, wav); }
    else if (!strcmp(argv[i], "--misslog") && i + 1 < argc) { extern FILE *rc_misslog; rc_misslog = fopen(argv[++i], "w"); }
    else if (!strcmp(argv[i], "--wramdump") && i + 1 < argc) wramdump_frame = atoi(argv[++i]);
    else if (!strcmp(argv[i], "--hashlog") && i + 1 < argc) hashlog = fopen(argv[++i], "w");
    else if (!strcmp(argv[i], "--state") && i + 1 < argc) state_file = argv[++i];
    else if (!strcmp(argv[i], "--savestate") && i + 2 < argc) { save_frame = atoi(argv[++i]); save_file = argv[++i]; }
    else rom_path = argv[i];
  }
  if (argc == 1 || (argc == 2 && !strncmp(argv[1], "-psn", 4))) {
    if (!plat_home()) return 0;
    rom_path = "starfox.sfc";
    bool rom_wizard(void);
    FILE *t = fopen(rom_path, "rb");
    if (t) fclose(t); else if (!rom_wizard()) return 0;
  }
  if (!load_rom(rom_path)) {
    char m[700];
    snprintf(m, sizeof m, "Cannot open %s.\n\nBuild it first:  python tools/build.py <your Star Fox ROM>", rom_path);
    if (frames < 0) plat_error(m); else fprintf(stderr, "%s\n", m);
    return 1;
  }
  snprintf(sram_path, sizeof sram_path, "%s.srm", rom_path);
  if (rc_enabled && !cov_prefix) rc_init(); else rc_enabled = false;
  if (grc_enabled && !cov_prefix) grc_init(); else grc_enabled = false;
  if (cov_prefix) { cov_cpu = calloc(1, 1 << 24); cov_gsu = calloc(1, 1 << 24); cov_rom = calloc(1, rom_size); wram_src = calloc(0x20000, 4); }
  snes_init();
  hd_reset();
  load_sram();
  FILE *sf = state_file ? fopen(state_file, "rb") : NULL;
  if (sf) {
    fseek(sf, 0, SEEK_END); long n = ftell(sf); fseek(sf, 0, SEEK_SET);
    Ser st = { malloc(n), 0, (size_t)n, true }; fread(st.buf, 1, n, sf); fclose(sf);
    snes_serialize(&st); free(st.buf); hd_reset();
  }

  if (frames >= 0) {
    for (int f = 0; f < frames; f++) {
      snes_set_pad(0, script_pad(f));
      snes_run_frame();
      if (wav) { static s16 sb[4096 * 2]; int n = apu_take_samples(sb, 4096); fwrite(sb, 4, n, wav); wav_frames += n; }
      if (f == save_frame) { Ser st = { 0 }; snes_serialize(&st); FILE *wf = fopen(save_file, "wb"); if (wf) { fwrite(st.buf, 1, st.pos, wf); fclose(wf); } free(st.buf); }
      if (f == wramdump_frame) { FILE *wf = fopen("out/wramdump.bin", "wb"); fwrite(wram, 1, sizeof wram, wf); fclose(wf); }
      if (hashlog) { u32 h = 0; for (int i = 0; i < 0x20000; i++) h = h * 31 + wram[i]; fprintf(hashlog, "%d %llu %08x %02x:%04x\n", f, master_clock, h, cpu.pb, cpu.pc); }
      for (int k = 0; k < nshots; k++) if (shots[k] == f) { char p[512]; sprintf(p, "%s_%05d.bmp", shot_prefix, f); write_bmp(p); }
    }
    if (cov_prefix) dump_coverage(cov_prefix);
    { extern long long hd_stat_vtx, hd_stat_vtx_hit; if (hd_stat_vtx) printf("hd vertices %lld, sub-pixel matched %.1f%%\n", hd_stat_vtx, 100.0 * hd_stat_vtx_hit / hd_stat_vtx); }
    if (gsuprof_path) { extern u32 *gsu_prof; FILE *pf = fopen(gsuprof_path, "wb"); fwrite(gsu_prof, 4, 1 << 23, pf); fclose(pf); }
    if (wav) {
      u8 h[44] = { 'R','I','F','F' }; *(u32 *)(h + 4) = 36 + wav_frames * 4; memcpy(h + 8, "WAVEfmt ", 8);
      *(u32 *)(h + 16) = 16; *(u16 *)(h + 20) = 1; *(u16 *)(h + 22) = 2; *(u32 *)(h + 24) = 48000; *(u32 *)(h + 28) = 192000;
      *(u16 *)(h + 32) = 4; *(u16 *)(h + 34) = 16; memcpy(h + 36, "data", 4); *(u32 *)(h + 40) = wav_frames * 4;
      fseek(wav, 0, SEEK_SET); fwrite(h, 1, 44, wav); fclose(wav);
    }
    u32 crc = 0; for (int i = 0; i < 256 * 224; i++) crc = crc * 31 + framebuf[i];
    u32 rcrc = 0; for (int i = 0; i < 0x20000; i++) rcrc = rcrc * 31 + wram[i];
    printf("pc=%02x:%04x frames=%d fb=%08x wram=%08x clock=%llu rc_hits=%llu misses=%llu gsu_hits=%llu gsu_misses=%llu\n", cpu.pb, cpu.pc, frames, crc, rcrc, master_clock, rc_hits, rc_misses, grc_hits, grc_misses);
    return 0;
  }

  return app_run();
}
