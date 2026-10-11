#include "recomp.h"

bool rc_enabled = true;
u64 rc_hits, rc_misses;
FILE *rc_misslog;
static int *htab; static u32 hmask;

static u32 hash(u32 k) { k ^= k >> 16; k *= 0x7feb352d; k ^= k >> 15; return k; }

void rc_init(void) {
  u32 n = 1; while (n < (u32)rc_count * 2) n <<= 1;
  hmask = n - 1; htab = malloc(n * sizeof *htab);
  for (u32 i = 0; i < n; i++) htab[i] = -1;
  for (int i = 0; i < rc_count; i++) {
    u32 h = hash(rc_entries[i].key) & hmask;
    while (htab[h] >= 0) h = (h + 1) & hmask;
    htab[h] = i;
  }
}

bool rc_try(void) {
  if (cpu.e || !htab) return false;
  u32 pc24 = (cpu.pb << 16) | cpu.pc;
  u32 flags = (cpu.p & FM ? 2 : 0) | (cpu.p & FX ? 1 : 0);
  int ro = rom_offset(pc24), wi = -1;
  u32 key;
  if (ro >= 0) key = (u32)ro * 4 + flags;
  else if ((wi = wram_index(pc24)) >= 0) key = (0x200000u + wi) * 4 + flags;
  else return false;
  for (u32 h = hash(key) & hmask; htab[h] >= 0; h = (h + 1) & hmask) {
    const RcEntry *e = &rc_entries[htab[h]];
    if (e->key != key) continue;
    if (wi >= 0 && (wi + e->len > sizeof wram || memcmp(&wram[wi], &rom[e->src], e->len))) break;
    rc_hits++;
    e->fn(e->idx);
    return true;
  }
  rc_misses++;
  if (rc_misslog) { static u32 seen[1 << 16]; u32 k = (pc24 * 4 + flags) & 0xffff; if (seen[k] != pc24 * 4 + flags + 1) { seen[k] = pc24 * 4 + flags + 1; fprintf(rc_misslog, "%06x %d\n", pc24, flags); } }
  return false;
}
