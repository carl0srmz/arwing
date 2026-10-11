#pragma once
#include "cpu_ops.h"

typedef struct { u32 key, src, len; void (*fn)(int); int idx; } RcEntry;
extern const RcEntry rc_entries[];
extern const int rc_count;

extern bool nmi_pending, timeup, frame_done;
void bus_fetch(u16 addr, int n, u8 last);
#define FETCH(a, n, last) bus_fetch((a), (n), (last))
static inline bool rc_pending(void) { return nmi_pending || frame_done || ((timeup || gsu_irq()) && !(cpu.p & FI)); }
