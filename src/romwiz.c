#include "app.h"

#define ROM_SHA1 "cf08148cd8f26d51f8c67c956179dfc594e7a4f1"

static int page;
static u8 *buf; static long len;

#ifdef _WIN32
#include <commdlg.h>
#include <wincrypt.h>
#pragma comment(lib, "comdlg32.lib")
#pragma comment(lib, "advapi32.lib")

static void sha1_hex(const u8 *d, long n, char out[41]) {
  HCRYPTPROV p; HCRYPTHASH h; BYTE b[20]; DWORD bl = 20;
  out[0] = 0;
  if (!CryptAcquireContextW(&p, NULL, NULL, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)) return;
  if (CryptCreateHash(p, CALG_SHA1, 0, 0, &h)) {
    if (CryptHashData(h, d, (DWORD)n, 0) && CryptGetHashParam(h, HP_HASHVAL, b, &bl, 0))
      for (int i = 0; i < 20; i++) sprintf(out + i * 2, "%02x", b[i]);
    CryptDestroyHash(h);
  }
  CryptReleaseContext(p, 0);
}

static bool pick(FILE **f) {
  wchar_t fn[MAX_PATH] = L"";
  OPENFILENAMEW o = { sizeof o };
  o.hwndOwner = gfx_hwnd; o.lpstrFile = fn; o.nMaxFile = MAX_PATH;
  o.lpstrFilter = L"SNES ROM (*.sfc, *.smc)\0*.sfc;*.smc\0All files\0*.*\0";
  o.Flags = OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST | OFN_NOCHANGEDIR;
  if (!GetOpenFileNameW(&o)) return false;
  *f = _wfopen(fn, L"rb");
  return true;
}
#else
static u32 rol(u32 x, int n) { return x << n | x >> (32 - n); }

static void sha1_hex(const u8 *d, long n, char out[41]) {
  u32 h[5] = { 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, 0xc3d2e1f0 };
  u64 bits = (u64)n * 8;
  long total = (n + 72) & ~63L;
  for (long off = 0; off < total; off += 64) {
    u32 w[80];
    for (int i = 0; i < 64; i++) {
      long k = off + i;
      u32 b = k < n ? d[k] : k == n ? 0x80 : k >= total - 8 ? (u32)(bits >> (8 * (total - 1 - k))) & 255 : 0;
      if (!(i & 3)) w[i >> 2] = 0;
      w[i >> 2] |= b << (24 - 8 * (i & 3));
    }
    for (int i = 16; i < 80; i++) w[i] = rol(w[i - 3] ^ w[i - 8] ^ w[i - 14] ^ w[i - 16], 1);
    u32 a = h[0], b = h[1], c = h[2], e4 = h[3], e = h[4];
    for (int i = 0; i < 80; i++) {
      u32 f, k;
      if (i < 20) { f = (b & c) | (~b & e4); k = 0x5a827999; }
      else if (i < 40) { f = b ^ c ^ e4; k = 0x6ed9eba1; }
      else if (i < 60) { f = (b & c) | (b & e4) | (c & e4); k = 0x8f1bbcdc; }
      else { f = b ^ c ^ e4; k = 0xca62c1d6; }
      u32 t = rol(a, 5) + f + e + k + w[i];
      e = e4; e4 = c; c = rol(b, 30); b = a; a = t;
    }
    h[0] += a; h[1] += b; h[2] += c; h[3] += e4; h[4] += e;
  }
  for (int i = 0; i < 20; i++) sprintf(out + i * 2, "%02x", (h[i >> 2] >> (24 - 8 * (i & 3))) & 255);
}

static bool pick(FILE **f) {
  char p[1024];
  if (gfx_drop[0]) { snprintf(p, sizeof p, "%s", gfx_drop); gfx_drop[0] = 0; }
  else {
    int r = plat_pick(false, p, sizeof p);
    if (r < 0) page = 4;
    if (r <= 0) return false;
  }
  *f = fopen(p, "rb");
  return true;
}
#endif

static int check(FILE *f) {
  if (!f) return 1;
  fseek(f, 0, SEEK_END); long n = ftell(f); fseek(f, 0, SEEK_SET);
  if (n & 0x200) { fseek(f, 0x200, SEEK_SET); n -= 0x200; }
  free(buf); buf = NULL; len = 0;
  if (n < 0x8000 || n > 0x800000) { fclose(f); return 1; }
  buf = malloc(n); len = (long)fread(buf, 1, n, f); fclose(f);
  if (len != n || memcmp(buf + 0x7fc0, "STAR FOX", 8)) return 1;
  char h[41]; sha1_hex(buf, len, h);
  return strcmp(h, ROM_SHA1) ? 2 : 0;
}

static bool save(void) {
  FILE *f = fopen("starfox.sfc", "wb");
  if (!f) return false;
  bool ok = fwrite(buf, 1, len, f) == (size_t)len;
  fclose(f);
  remove("preview_cache.bin");
  return ok;
}

static int browse(void) {
  FILE *f;
  if (!pick(&f)) return page;
  switch (check(f)) {
  case 0: return save() ? 9 : 3;
  case 2: return 2;
  default: return 1;
  }
}

static int step(void) {
  logo(8, 2);
  text_r(cw - 8, 10, f_small, C_DIM, "Project Arwing");
  panel(8, 36, cw - 16, ch - 44, C_PANEL, C_EDGE);
  tab(16, 30, "ROM");
  static const char *head[] = { "Pick your Star Fox ROM.", "That's not Star Fox.", "That's not the USA Rev 2 version.", "Couldn't save the ROM.", "No file picker found." };
  static const char *sub[] = { "Only the USA Rev 2 release is tested.", "Try another file.", "It might still work, but it's untested.", "Check the disk and try again.", "Drop the ROM file on this window." };
  text(18, 48, f_item, C_TEXT, head[page]);
  text(18, 64, f_small, C_DIM, sub[page]);
  int y = ch - 30;
#ifndef _WIN32
  if (gfx_drop[0]) { int r = browse(); if (r == 9) return 1; page = r; }
#endif
  if (page == 2) {
    if (gfx_button(18, y, 84, "Use it")) return save() ? 1 : (page = 3, 0);
    if (gfx_button(108, y, 84, "Pick another")) { int r = browse(); if (r == 9) return 1; page = r; }
  } else {
    if (gfx_button(18, y, 84, "Browse...")) { int r = browse(); if (r == 9) return 1; page = r; }
    if (gfx_button(108, y, 84, "Quit")) return 2;
  }
  if (gfx_key == VK_ESCAPE) return 2;
  return 0;
}

bool rom_wizard(void) {
  page = 0;
  bool ok = gfx_window(L"Project Arwing", 320, 160, step) == 1;
  free(buf); buf = NULL;
  return ok;
}
