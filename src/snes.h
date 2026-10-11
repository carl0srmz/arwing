#pragma once
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

typedef uint8_t u8; typedef uint16_t u16; typedef uint32_t u32;
typedef int8_t s8; typedef int16_t s16; typedef int32_t s32; typedef uint64_t u64;

typedef struct {
  u16 a, x, y, s, d, pc;
  u8 db, pb, p, e;
  u8 wai, stp;
} Cpu;
extern Cpu cpu;
enum { FC = 1, FZ = 2, FI = 4, FD = 8, FX = 16, FM = 32, FV = 64, FN = 128 };

void cpu_reset(void);
void cpu_step(void);
void cpu_nmi(void);
void cpu_irq(void);

extern u8 *rom; extern u32 rom_size;
extern u8 wram[0x20000];
extern u64 master_clock;
extern int hcount, vcount;
extern bool frame_done;
extern bool nmi_line, irq_line;

u8 bus_read(u32 addr);
void bus_write(u32 addr, u8 v);
u8 bus_peek(u32 addr);
void bus_idle(void);
void snes_init(void);
void snes_run_frame(void);
void snes_set_pad(int port, u16 buttons);

void ppu_reset(void);
u8 ppu_read(u16 reg);
void ppu_write(u16 reg, u8 v);
void ppu_render_line(int line);
void ppu_latch_counters(void);
extern u32 framebuf[256 * 239];
extern u8 ppu_hdmask[256 * 239];
extern u8 ppu_inidisp;
extern bool ppu_overscan;

void apu_reset(void);
void apu_catchup(void);
u8 apu_read(int port);
void apu_write(int port, u8 v);
int apu_take_samples(s16 *out, int max_frames);
int apu_take_samples2(s16 *out, int max_frames);
extern int apu_hq; extern bool apu_dual;

extern u8 gsu_ram[0x20000];
void gsu_reset(void);
void gsu_catchup(void);
u8 gsu_read(u16 addr);
void gsu_write(u16 addr, u8 v);
bool gsu_irq(void);
bool gsu_running(void);

extern u8 *cov_cpu;
extern u8 *cov_gsu;
void cov_note_jump(u32 from, u32 to);
void cov_note_ramexec(u32 ram24, u32 romoff);
extern u8 *cov_rom;
extern u32 *wram_src;
extern bool cpu_fetching;
int wram_index(u32 addr);
int rom_offset(u32 addr);

extern int hd_scale, hd_active_scale;
extern u32 *hd_framebuf;
extern s32 hd_dma_src;
extern u8 *hd_vtile[2048]; extern bool hd_vvalid[2048];
void hd_reset(void);
void hd_gsu_ram_written(u32 addr);
void hd_vram_byte(u16 word_addr, int high, s32 src);

typedef struct { u8 *buf; size_t pos, cap; bool load; } Ser;
static inline void ser(Ser *s, void *p, size_t n) {
  if (s->load) { if (s->pos + n <= s->cap) memcpy(p, s->buf + s->pos, n); }
  else {
    if (s->pos + n > s->cap) { s->cap = (s->pos + n) * 2; s->buf = (u8 *)realloc(s->buf, s->cap); }
    memcpy(s->buf + s->pos, p, n);
  }
  s->pos += n;
}
#define SER(s, v) ser((s), &(v), sizeof(v))
void cpu_serialize(Ser *s);
void mem_serialize(Ser *s);
void ppu_serialize(Ser *s);
void apu_serialize(Ser *s);
void gsu_serialize(Ser *s);
void snes_serialize(Ser *s);
