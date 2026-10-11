#include "snes.h"
#include <math.h>

static const u8 ipl[64] = {
  0xcd,0xef,0xbd,0xe8,0x00,0xc6,0x1d,0xd0,0xfc,0x8f,0xaa,0xf4,0x8f,0xbb,0xf5,0x78,
  0xcc,0xf4,0xd0,0xfb,0x2f,0x19,0xeb,0xf4,0xd0,0xfc,0x7e,0xf4,0xd0,0x0b,0xe4,0xf5,
  0xcb,0xf4,0xd7,0x00,0xfc,0xd0,0xf3,0xab,0x01,0x10,0xef,0x7e,0xf4,0x10,0xeb,0xba,
  0xf6,0xda,0x00,0xba,0xf4,0xc4,0xf4,0xdd,0x5d,0xd0,0xdb,0x1f,0x00,0x00,0xc0,0xff,
};

static const u8 cyc[256] = {
  2,8,4,5,3,4,3,6,2,6,5,4,5,4,6,8, 2,8,4,5,4,5,5,6,5,5,6,5,2,2,4,6,
  2,8,4,5,3,4,3,6,2,6,5,4,5,4,5,4, 2,8,4,5,4,5,5,6,5,5,6,5,2,2,3,8,
  2,8,4,5,3,4,3,6,2,6,4,4,5,4,6,6, 2,8,4,5,4,5,5,6,5,5,4,5,2,2,4,3,
  2,8,4,5,3,4,3,6,2,6,4,4,5,4,5,5, 2,8,4,5,4,5,5,6,5,5,5,5,2,2,3,6,
  2,8,4,5,3,4,3,6,2,6,5,4,5,2,4,5, 2,8,4,5,4,5,5,6,5,5,5,5,2,2,12,5,
  3,8,4,5,3,4,3,6,2,6,4,4,5,2,4,4, 2,8,4,5,4,5,5,6,5,5,5,5,2,2,3,4,
  3,8,4,5,4,5,4,7,2,5,6,4,5,2,4,9, 2,8,4,5,5,6,6,7,4,5,5,5,2,2,6,3,
  2,8,4,5,3,4,3,6,2,4,5,3,4,3,4,3, 2,8,4,5,4,5,5,6,3,4,5,4,2,2,4,3,
};

static u8 aram[0x10000];
static struct { u8 a, x, y, sp, psw; u16 pc; bool stop; } s;
static u8 in_port[4], out_port[4];
static u8 control = 0xb0, dspaddr;
static struct { u8 target, stage, counter; bool en; int div, sub; } tmr[3];
static u64 spc_cycles;
static int sample_clock;

enum { PC_ = 1, PZ = 2, PI = 4, PH = 8, PB = 16, PP = 32, PV = 64, PN = 128 };

static u8 dsp[128];
typedef struct {
  u16 brr_addr; int brr_off; u8 brr_hdr;
  s16 buf[32]; int wpos, rpos;
  u32 counter;
  int env, env_mode;
  int out;
  bool on; int kon_delay;
} Voice;
static Voice vo[8];
static u16 noise = 0x4000;
static int gcounter;
static s16 echo_hist[8][2]; static int echo_hpos, echo_off;
static const u16 gauss[512] = {
0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
  1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   2,   2,   2,   2,   2,
  2,   2,   3,   3,   3,   3,   3,   4,   4,   4,   4,   4,   5,   5,   5,   5,
  6,   6,   6,   6,   7,   7,   7,   8,   8,   8,   9,   9,   9,  10,  10,  10,
 11,  11,  11,  12,  12,  13,  13,  14,  14,  15,  15,  15,  16,  16,  17,  17,
 18,  19,  19,  20,  20,  21,  21,  22,  23,  23,  24,  24,  25,  26,  27,  27,
 28,  29,  29,  30,  31,  32,  32,  33,  34,  35,  36,  36,  37,  38,  39,  40,
 41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  52,  53,  54,  55,  56,
 58,  59,  60,  61,  62,  64,  65,  66,  67,  69,  70,  71,  73,  74,  76,  77,
 78,  80,  81,  83,  84,  86,  87,  89,  90,  92,  94,  95,  97,  99, 100, 102,
104, 106, 107, 109, 111, 113, 115, 117, 118, 120, 122, 124, 126, 128, 130, 132,
134, 137, 139, 141, 143, 145, 147, 150, 152, 154, 156, 159, 161, 163, 166, 168,
171, 173, 175, 178, 180, 183, 186, 188, 191, 193, 196, 199, 201, 204, 207, 210,
212, 215, 218, 221, 224, 227, 230, 233, 236, 239, 242, 245, 248, 251, 254, 257,
260, 263, 267, 270, 273, 276, 280, 283, 286, 290, 293, 297, 300, 304, 307, 311,
314, 318, 321, 325, 328, 332, 336, 339, 343, 347, 351, 354, 358, 362, 366, 370,
374, 378, 381, 385, 389, 393, 397, 401, 405, 410, 414, 418, 422, 426, 430, 434,
439, 443, 447, 451, 456, 460, 464, 469, 473, 477, 482, 486, 491, 495, 499, 504,
508, 513, 517, 522, 527, 531, 536, 540, 545, 550, 554, 559, 563, 568, 573, 577,
582, 587, 592, 596, 601, 606, 611, 615, 620, 625, 630, 635, 640, 644, 649, 654,
659, 664, 669, 674, 678, 683, 688, 693, 698, 703, 708, 713, 718, 723, 728, 732,
737, 742, 747, 752, 757, 762, 767, 772, 777, 782, 787, 792, 797, 802, 806, 811,
816, 821, 826, 831, 836, 841, 846, 851, 855, 860, 865, 870, 875, 880, 884, 889,
894, 899, 904, 908, 913, 918, 923, 927, 932, 937, 941, 946, 951, 955, 960, 965,
969, 974, 978, 983, 988, 992, 997,1001,1005,1010,1014,1019,1023,1027,1032,1036,
1040,1045,1049,1053,1057,1061,1066,1070,1074,1078,1082,1086,1090,1094,1098,1102,
1106,1109,1113,1117,1121,1125,1128,1132,1136,1139,1143,1146,1150,1153,1157,1160,
1164,1167,1170,1174,1177,1180,1183,1186,1190,1193,1196,1199,1202,1205,1207,1210,
1213,1216,1219,1221,1224,1227,1229,1232,1234,1237,1239,1241,1244,1246,1248,1251,
1253,1255,1257,1259,1261,1263,1265,1267,1269,1270,1272,1274,1275,1277,1279,1280,
1282,1283,1284,1286,1287,1288,1290,1291,1292,1293,1294,1295,1296,1297,1297,1298,
1299,1300,1300,1301,1302,1302,1303,1303,1303,1304,1304,1304,1304,1304,1305,1305
};
static s16 outbuf[8192 * 2]; static int out_w, out_r;
int apu_hq;
bool apu_dual;
static s16 outbuf2[8192 * 2]; static int out2_w, out2_r;

static void fifo_push(s16 *buf, int *w, int *r, int l, int rr) {
  int nw = (*w + 1) & 8191;
  if (nw == *r) return;
  buf[*w * 2] = (s16)(l < -32768 ? -32768 : l > 32767 ? 32767 : l);
  buf[*w * 2 + 1] = (s16)(rr < -32768 ? -32768 : rr > 32767 ? 32767 : rr);
  *w = nw;
}
static void out_push(int l, int r) { fifo_push(outbuf, &out_w, &out_r, l, r); }
static void out_push_hq(int l, int r) { if (apu_dual) fifo_push(outbuf2, &out2_w, &out2_r, l, r); else out_push(l, r); }
int apu_take_samples2(s16 *o, int max) {
  int n = 0;
  while (n < max && out2_r != out2_w) { o[n * 2] = outbuf2[out2_r * 2]; o[n * 2 + 1] = outbuf2[out2_r * 2 + 1]; out2_r = (out2_r + 1) & 8191; n++; }
  return n;
}

#define RS_TAPS 16
static float rs_kern[3][RS_TAPS];
static s16 rs_hist[64][2]; static u32 rs_in, rs_out;
static void resample_init(void) {
  for (int ph = 0; ph < 3; ph++) {
    float sum = 0;
    for (int k = 0; k < RS_TAPS; k++) {
      double d = (k - (RS_TAPS / 2 - 1)) - ph / 3.0;
      double sinc = fabs(d) < 1e-9 ? 1 : sin(3.14159265358979 * d) / (3.14159265358979 * d);
      double w = 0.42 + 0.5 * cos(3.14159265358979 * d / (RS_TAPS / 2)) + 0.08 * cos(2 * 3.14159265358979 * d / (RS_TAPS / 2));
      rs_kern[ph][k] = (float)(sinc * (fabs(d) < RS_TAPS / 2 ? w : 0)); sum += rs_kern[ph][k];
    }
    for (int k = 0; k < RS_TAPS; k++) rs_kern[ph][k] /= sum;
  }
}
static void resample_push(int l, int r) {
  rs_hist[rs_in & 63][0] = (s16)l; rs_hist[rs_in & 63][1] = (s16)r; rs_in++;
  while ((2 * rs_out) / 3 + RS_TAPS / 2 < rs_in) {
    u32 m = (2 * rs_out) / 3; int ph = (2 * rs_out) % 3;
    float a = 0, b = 0;
    for (int k = 0; k < RS_TAPS; k++) {
      u32 idx = m + k - (RS_TAPS / 2 - 1);
      a += rs_hist[idx & 63][0] * rs_kern[ph][k]; b += rs_hist[idx & 63][1] * rs_kern[ph][k];
    }
    out_push((int)lrintf(a), (int)lrintf(b));
    rs_out++;
  }
}

static float hq_acc[2][2]; static int hq_par; static float hq_echo_prev[2];
static void hq_voice(Voice *v, int idx, int p0, u32 c0, int pitch, int noise_smp, int voll, int volr) {
  static const float slot_f[2][2] = { { 0.f, 2.f / 3 }, { 1.f / 3, -1 } };
  for (int sl = 0; sl < 2; sl++) {
    float f = slot_f[hq_par][sl];
    if (f < 0) break;
    float smp;
    if (noise_smp != 0x7fffffff) smp = (float)noise_smp;
    else {
      float x = (c0 + f * pitch) / 4096.0f;
      int ix = (int)x; float t = x - ix;
      int base = p0 + 1 + ix;
      int lim = v->wpos - 1;
      #define S(k) (float)v->buf[((base + (k)) > lim ? lim : (base + (k))) & 31]
      float bm1 = S(-1), b0 = S(0), b1 = S(1), b2 = S(2);
      #undef S
      smp = b0 + 0.5f * t * (b1 - bm1 + t * (2 * bm1 - 5 * b0 + 4 * b1 - b2 + t * (3 * (b0 - b1) + b2 - bm1)));
    }
    float out = smp * v->env / 2048.0f;
    hq_acc[sl][0] += out * voll / 128.0f; hq_acc[sl][1] += out * volr / 128.0f;
  }
  (void)idx;
}
static void hq_finish(u8 flg, int echol, int echor) {
  static const float slot_f[2][2] = { { 0.f, 2.f / 3 }, { 1.f / 3, -1 } };
  for (int sl = 0; sl < 2; sl++) {
    float f = slot_f[hq_par][sl];
    if (f < 0) break;
    float el = hq_echo_prev[0] + (echol - hq_echo_prev[0]) * f, er = hq_echo_prev[1] + (echor - hq_echo_prev[1]) * f;
    float l = hq_acc[sl][0] * (s8)dsp[0x0c] / 128.0f + el, r = hq_acc[sl][1] * (s8)dsp[0x1c] / 128.0f + er;
    if (flg & 0x40) l = r = 0;
    out_push_hq((int)lrintf(l), (int)lrintf(r));
    hq_acc[sl][0] = hq_acc[sl][1] = 0;
  }
  hq_echo_prev[0] = (float)echol; hq_echo_prev[1] = (float)echor;
  hq_par ^= 1;
}

static const u16 crates[32] = { 0x7800, 2048, 1536, 1280, 1024, 768, 640, 512, 384, 320, 256, 192, 160, 128, 96, 80,
                                64, 48, 40, 32, 24, 20, 16, 12, 10, 8, 6, 5, 4, 3, 2, 1 };
static const u16 coffs[32] = { 1, 0, 1040, 536, 0, 1040, 536, 0, 1040, 536, 0, 1040, 536, 0, 1040, 536,
                               0, 1040, 536, 0, 1040, 536, 0, 1040, 536, 0, 1040, 536, 0, 1040, 0, 0 };
static bool rate_tick(int r) { return r && ((gcounter + coffs[r]) % crates[r]) == 0; }

static inline int clamp16(int v) { return v < -32768 ? -32768 : v > 32767 ? 32767 : v; }

static void decode_block(Voice *v) {
  u8 h = aram[v->brr_addr];
  v->brr_hdr = h;
  int shift = h >> 4, filter = (h >> 2) & 3;
  for (int i = 0; i < 16; i++) {
    u8 b = aram[(u16)(v->brr_addr + 1 + (i >> 1))];
    int n = (i & 1) ? (b & 15) : (b >> 4);
    if (n >= 8) n -= 16;
    int smp = shift <= 12 ? (n << shift) >> 1 : (n < 0 ? -2048 : 0);
    int p1 = v->buf[(v->wpos - 1) & 31] >> 1, p2 = v->buf[(v->wpos - 2) & 31] >> 1;
    switch (filter) {
    case 1: smp += p1 + ((-p1) >> 4); break;
    case 2: smp += 2 * p1 + ((-3 * p1) >> 5) - p2 + (p2 >> 4); break;
    case 3: smp += 2 * p1 + ((-13 * p1) >> 6) - p2 + ((3 * p2) >> 4); break;
    }
    smp = clamp16(smp);
    v->buf[v->wpos & 31] = (s16)(smp << 1);
    v->wpos++;
  }
}

static void next_block(Voice *v, int idx) {
  u8 h = v->brr_hdr;
  if (h & 1) {
    dsp[0x7c] |= 1 << idx;
    u16 dir = dsp[0x5d] << 8;
    u16 e = dir + dsp[idx * 16 + 4] * 4;
    v->brr_addr = aram[(u16)(e + 2)] | aram[(u16)(e + 3)] << 8;
    if (!(h & 2)) { v->env_mode = 3; v->env = 0; }
  } else v->brr_addr += 9;
  decode_block(v);
}

static void key_on(Voice *v, int idx) {
  u16 dir = dsp[0x5d] << 8;
  u16 e = dir + dsp[idx * 16 + 4] * 4;
  v->brr_addr = aram[e] | aram[(u16)(e + 1)] << 8;
  memset(v->buf, 0, sizeof v->buf);
  v->wpos = 3; v->rpos = 0; v->counter = 0;
  v->env = 0; v->env_mode = 0; v->on = true;
  dsp[0x7c] &= ~(1 << idx);
  decode_block(v);
}

static void run_env(Voice *v, int idx) {
  u8 adsr1 = dsp[idx * 16 + 5], adsr2 = dsp[idx * 16 + 6], gain = dsp[idx * 16 + 7];
  int env = v->env;
  if (v->env_mode == 3) { env -= 8; if (env < 0) env = 0; v->env = env; return; }
  int rate, step = 0;
  if (adsr1 & 0x80) {
    if (v->env_mode == 2 || (v->env_mode == 1 && 0)) {}
    switch (v->env_mode) {
    case 0: rate = (adsr1 & 15) * 2 + 1; step = rate == 31 ? 1024 : 32; break;
    case 1: rate = ((adsr1 >> 4) & 7) * 2 + 16; step = -(((env - 1) >> 8) + 1); break;
    default: rate = adsr2 & 31; step = -(((env - 1) >> 8) + 1); break;
    }
  } else if (!(gain & 0x80)) {
    v->env = (gain & 0x7f) << 4; return;
  } else {
    rate = gain & 31;
    switch ((gain >> 5) & 3) {
    case 0: step = -32; break;
    case 1: step = -(((env - 1) >> 8) + 1); break;
    case 2: step = 32; break;
    default: step = env < 0x600 ? 32 : 8; break;
    }
  }
  if (!rate_tick(rate)) return;
  env += step;
  if (adsr1 & 0x80) {
    if (v->env_mode == 0 && env >= 0x7e0) { if (env > 0x7ff) env = 0x7ff; v->env_mode = 1; }
    if (v->env_mode == 1 && (env >> 8) == (adsr2 >> 5)) v->env_mode = 2;
  }
  if (env < 0) env = 0; if (env > 0x7ff) env = 0x7ff;
  v->env = env;
}

static void dsp_sample(void) {
  gcounter = gcounter ? gcounter - 1 : 0x77ff;
  u8 flg = dsp[0x6c];
  if (rate_tick(flg & 31)) { int fb = (noise << 13) ^ (noise << 14); noise = (fb & 0x4000) ^ (noise >> 1); }
  int ml = 0, mr = 0, el = 0, er = 0;
  int prev_out = 0;
  for (int i = 0; i < 8; i++) {
    Voice *v = &vo[i];
    u8 *r = &dsp[i * 16];
    if (!v->on) { r[8] = 0; r[9] = 0; prev_out = 0; continue; }
    int pitch = (r[2] | r[3] << 8) & 0x3fff;
    if ((dsp[0x2d] & (1 << i)) && i) pitch += ((prev_out >> 5) * pitch) >> 10;
    if (pitch < 0) pitch = 0; if (pitch > 0x7fff) pitch = 0x7fff;
    int f = (v->counter >> 4) & 0xff;
    s16 *b = v->buf; int p = v->rpos;
    int smp;
    if (dsp[0x3d] & (1 << i)) smp = (s16)(noise << 1);
    else {
      int o = (gauss[255 - f] * b[p & 31]) >> 11;
      o += (gauss[511 - f] * b[(p + 1) & 31]) >> 11;
      o += (gauss[256 + f] * b[(p + 2) & 31]) >> 11;
      o = (s16)o;
      o += (gauss[f] * b[(p + 3) & 31]) >> 11;
      smp = clamp16(o) & ~1;
    }
    run_env(v, i);
    int out = ((smp * v->env) >> 11) & ~1;
    v->out = out; prev_out = out;
    r[8] = v->env >> 4; r[9] = out >> 8;
    int l = (out * (s8)r[0]) >> 7, rr = (out * (s8)r[1]) >> 7;
    ml = clamp16(ml + l); mr = clamp16(mr + rr);
    if (dsp[0x4d] & (1 << i)) { el = clamp16(el + l); er = clamp16(er + rr); }
    u32 c0 = v->counter; int p0 = v->rpos;
    v->counter += pitch;
    while (v->counter >= 0x1000) {
      v->counter -= 0x1000; v->rpos++;
      if (v->wpos - v->rpos < 4) next_block(v, i);
    }
    if (apu_hq || apu_dual) hq_voice(v, i, p0, c0, pitch, (dsp[0x3d] & (1 << i)) ? (s16)(noise << 1) : 0x7fffffff, (s8)r[0], (s8)r[1]);
    if (v->env_mode == 3 && v->env == 0 && (v->brr_hdr & 1) && !(v->brr_hdr & 2)) v->on = false;
  }
  u16 ebase = dsp[0x6d] << 8;
  int elen = (dsp[0x7d] & 15) * 0x800; if (!elen) elen = 4;
  u16 ea = ebase + echo_off;
  s16 inl = (s16)(aram[ea] | aram[(u16)(ea + 1)] << 8) >> 1;
  s16 inr = (s16)(aram[(u16)(ea + 2)] | aram[(u16)(ea + 3)] << 8) >> 1;
  echo_hpos = (echo_hpos + 1) & 7;
  echo_hist[echo_hpos][0] = inl; echo_hist[echo_hpos][1] = inr;
  int fl = 0, fr = 0;
  for (int t = 0; t < 8; t++) {
    s8 c = (s8)dsp[t * 16 + 15];
    int hp = (echo_hpos + t + 1) & 7;
    fl += (echo_hist[hp][0] * c) >> 6; fr += (echo_hist[hp][1] * c) >> 6;
  }
  fl = clamp16(fl) & ~1; fr = clamp16(fr) & ~1;
  int outl = clamp16(((ml * (s8)dsp[0x0c]) >> 7) + ((fl * (s8)dsp[0x2c]) >> 7));
  int outr = clamp16(((mr * (s8)dsp[0x1c]) >> 7) + ((fr * (s8)dsp[0x3c]) >> 7));
  if (!(flg & 0x20)) {
    int wl = clamp16(el + ((fl * (s8)dsp[0x0d]) >> 7)) & ~1, wr = clamp16(er + ((fr * (s8)dsp[0x0d]) >> 7)) & ~1;
    aram[ea] = (u8)wl; aram[(u16)(ea + 1)] = wl >> 8; aram[(u16)(ea + 2)] = (u8)wr; aram[(u16)(ea + 3)] = wr >> 8;
  }
  echo_off += 4; if (echo_off >= elen) echo_off = 0;
  if (flg & 0x40) outl = outr = 0;
  if (apu_hq || apu_dual) hq_finish(flg, (fl * (s8)dsp[0x2c]) >> 7, (fr * (s8)dsp[0x3c]) >> 7);
  if (!apu_hq || apu_dual) resample_push(outl, outr);
}

static void dsp_write(u8 a, u8 v) {
  if (a >= 0x80) return;
  dsp[a] = v;
  if (a == 0x4c) for (int i = 0; i < 8; i++) if (v & (1 << i)) key_on(&vo[i], i);
  if (a == 0x5c) for (int i = 0; i < 8; i++) if (v & (1 << i)) vo[i].env_mode = 3;
  if (a == 0x7c) dsp[0x7c] = 0;
  if (a == 0x6c && (v & 0x80)) for (int i = 0; i < 8; i++) { vo[i].env_mode = 3; vo[i].env = 0; }
}

int apu_take_samples(s16 *o, int max) {
  int n = 0;
  while (n < max && out_r != out_w) { o[n * 2] = outbuf[out_r * 2]; o[n * 2 + 1] = outbuf[out_r * 2 + 1]; out_r = (out_r + 1) & 8191; n++; }
  return n;
}

static u8 io_rd(u16 a) {
  switch (a) {
  case 0xf2: return dspaddr;
  case 0xf3: return dsp[dspaddr & 0x7f];
  case 0xf4: case 0xf5: case 0xf6: case 0xf7: return in_port[a - 0xf4];
  case 0xfd: case 0xfe: case 0xff: { u8 v = tmr[a - 0xfd].counter & 15; tmr[a - 0xfd].counter = 0; return v; }
  }
  return aram[a];
}
static inline u8 rd(u16 a) {
  if ((a & 0xfff0) == 0x00f0) return io_rd(a);
  if (a >= 0xffc0 && (control & 0x80)) return ipl[a - 0xffc0];
  return aram[a];
}
static inline void wr(u16 a, u8 v) {
  if ((a & 0xfff0) == 0x00f0) {
    switch (a) {
    case 0xf1:
      for (int i = 0; i < 3; i++) { bool e = (v >> i) & 1; if (e && !tmr[i].en) { tmr[i].stage = 0; tmr[i].counter = 0; } tmr[i].en = e; }
      if (v & 0x10) in_port[0] = in_port[1] = 0;
      if (v & 0x20) in_port[2] = in_port[3] = 0;
      control = v; return;
    case 0xf2: dspaddr = v; return;
    case 0xf3: dsp_write(dspaddr, v); return;
    case 0xf4: case 0xf5: case 0xf6: case 0xf7: out_port[a - 0xf4] = v; return;
    case 0xfa: case 0xfb: case 0xfc: tmr[a - 0xfa].target = v; return;
    }
  }
  aram[a] = v;
}

static inline u8 imm(void) { return rd(s.pc++); }
static inline u16 imm16(void) { u8 l = imm(); return l | imm() << 8; }
static inline u16 dp(u8 o) { return ((s.psw & PP) ? 0x100 : 0) | o; }
static inline u8 rdp(u8 o) { return rd(dp(o)); }
static inline void wdp(u8 o, u8 v) { wr(dp(o), v); }
static inline u16 rdp16(u8 o) { return rdp(o) | rdp((u8)(o + 1)) << 8; }
static inline void wdp16(u8 o, u16 v) { wdp(o, (u8)v); wdp((u8)(o + 1), v >> 8); }
static inline void push(u8 v) { wr(0x100 | s.sp--, v); }
static inline u8 pop(void) { return rd(0x100 | ++s.sp); }
static inline void nz(u8 v) { s.psw = (s.psw & ~(PN | PZ)) | (v & 0x80) | (v ? 0 : PZ); }
static inline void setf(u8 f, bool on) { if (on) s.psw |= f; else s.psw &= ~f; }

static u8 adc(u8 a, u8 b) {
  int r = a + b + (s.psw & PC_);
  setf(PV, ~(a ^ b) & (a ^ r) & 0x80); setf(PH, (a ^ b ^ r) & 0x10); setf(PC_, r > 0xff);
  nz((u8)r); return (u8)r;
}
static u8 sbc(u8 a, u8 b) { return adc(a, ~b); }
static u8 cmp(u8 a, u8 b) { int r = a - b; setf(PC_, r >= 0); nz((u8)r); return a; }
static u8 or_(u8 a, u8 b) { a |= b; nz(a); return a; }
static u8 and_(u8 a, u8 b) { a &= b; nz(a); return a; }
static u8 eor(u8 a, u8 b) { a ^= b; nz(a); return a; }
static u8 asl(u8 v) { setf(PC_, v & 0x80); v <<= 1; nz(v); return v; }
static u8 lsr(u8 v) { setf(PC_, v & 1); v >>= 1; nz(v); return v; }
static u8 rol(u8 v) { int c = s.psw & PC_; setf(PC_, v & 0x80); v = (v << 1) | c; nz(v); return v; }
static u8 ror(u8 v) { int c = s.psw & PC_; setf(PC_, v & 1); v = (v >> 1) | (c << 7); nz(v); return v; }
static u8 inc(u8 v) { v++; nz(v); return v; }
static u8 dec(u8 v) { v--; nz(v); return v; }

static int branch(bool t) { s8 d = (s8)imm(); if (t) { s.pc += d; return 2; } return 0; }

typedef u8 (*AluFn)(u8, u8);

static int spc_step(void) {
  u8 op = imm();
  int c = cyc[op];
  u8 lo = op & 0x1f, hi = op >> 5;
  static const AluFn alu[8] = { or_, and_, eor, cmp, adc, sbc, 0, 0 };
  if (hi < 6 && (lo & 0x0f) >= 4 && (lo & 0x0f) <= 9 && !((op & 0x0f) == 0x08 && 0)) {
    AluFn f = alu[hi];
    switch (lo) {
    case 0x04: s.a = f(s.a, rdp(imm())); return c;
    case 0x05: s.a = f(s.a, rd(imm16())); return c;
    case 0x06: s.a = f(s.a, rdp(s.x)); return c;
    case 0x07: { u8 o = imm(); s.a = f(s.a, rd(rdp16((u8)(o + s.x)))); return c; }
    case 0x08: s.a = f(s.a, imm()); return c;
    case 0x09: { u8 sa = imm(), da = imm(); u8 r = f(rdp(da), rdp(sa)); if (hi != 3) wdp(da, r); return c; }
    case 0x14: s.a = f(s.a, rdp((u8)(imm() + s.x))); return c;
    case 0x15: s.a = f(s.a, rd(imm16() + s.x)); return c;
    case 0x16: s.a = f(s.a, rd(imm16() + s.y)); return c;
    case 0x17: { u8 o = imm(); s.a = f(s.a, rd(rdp16(o) + s.y)); return c; }
    case 0x18: { u8 i = imm(), da = imm(); u8 r = f(rdp(da), i); if (hi != 3) wdp(da, r); return c; }
    case 0x19: { u8 r = f(rdp(s.x), rdp(s.y)); if (hi != 3) wdp(s.x, r); return c; }
    }
  }
  if ((op & 0x0f) == 0x01) { u16 v = 0xffde - (op >> 4) * 2; push(s.pc >> 8); push((u8)s.pc); s.pc = rd(v) | rd(v + 1) << 8; return c; }
  if ((op & 0x0f) == 0x02) { u8 o = imm(); u8 b = 1 << (op >> 5); u8 v = rdp(o); wdp(o, (op & 0x10) ? v & ~b : v | b); return c; }
  if ((op & 0x0f) == 0x03) { u8 o = imm(); u8 v = rdp(o); bool set = (v >> (op >> 5)) & 1; return c + branch((op & 0x10) ? !set : set); }

  switch (op) {
  case 0x00: return c;
  case 0xef: case 0xff: s.stop = true; s.pc--; return c;
  case 0x10: return c + branch(!(s.psw & PN)); case 0x30: return c + branch(s.psw & PN);
  case 0x50: return c + branch(!(s.psw & PV)); case 0x70: return c + branch(s.psw & PV);
  case 0x90: return c + branch(!(s.psw & PC_)); case 0xb0: return c + branch(s.psw & PC_);
  case 0xd0: return c + branch(!(s.psw & PZ)); case 0xf0: return c + branch(s.psw & PZ);
  case 0x2f: return c + branch(true) - 2;
  case 0x2e: { u8 o = imm(); u8 v = rdp(o); return c + branch(s.a != v); }
  case 0xde: { u8 o = imm(); u8 v = rdp((u8)(o + s.x)); return c + branch(s.a != v); }
  case 0x6e: { u8 o = imm(); u8 v = rdp(o) - 1; wdp(o, v); return c + branch(v != 0); }
  case 0xfe: s.y--; return c + branch(s.y != 0);
  case 0x5f: s.pc = imm16(); return c;
  case 0x1f: { u16 a = imm16() + s.x; s.pc = rd(a) | rd(a + 1) << 8; return c; }
  case 0x3f: { u16 t = imm16(); push(s.pc >> 8); push((u8)s.pc); s.pc = t; return c; }
  case 0x4f: { u8 t = imm(); push(s.pc >> 8); push((u8)s.pc); s.pc = 0xff00 | t; return c; }
  case 0x6f: { u8 l = pop(); s.pc = l | pop() << 8; return c; }
  case 0x7f: { s.psw = pop(); u8 l = pop(); s.pc = l | pop() << 8; return c; }
  case 0x0f: push(s.pc >> 8); push((u8)s.pc); push(s.psw); s.psw = (s.psw | PB) & ~PI; s.pc = rd(0xffde) | rd(0xffdf) << 8; return c;
  case 0x20: s.psw &= ~PP; return c; case 0x40: s.psw |= PP; return c;
  case 0x60: s.psw &= ~PC_; return c; case 0x80: s.psw |= PC_; return c;
  case 0xa0: s.psw |= PI; return c; case 0xc0: s.psw &= ~PI; return c;
  case 0xe0: s.psw &= ~(PV | PH); return c; case 0xed: s.psw ^= PC_; return c;
  case 0x0d: push(s.psw); return c; case 0x2d: push(s.a); return c; case 0x4d: push(s.x); return c; case 0x6d: push(s.y); return c;
  case 0x8e: s.psw = pop(); return c; case 0xae: s.a = pop(); return c; case 0xce: s.x = pop(); return c; case 0xee: s.y = pop(); return c;
  case 0x0b: { u8 o = imm(); wdp(o, asl(rdp(o))); return c; }
  case 0x0c: { u16 a = imm16(); wr(a, asl(rd(a))); return c; }
  case 0x1b: { u8 o = (u8)(imm() + s.x); wdp(o, asl(rdp(o))); return c; }
  case 0x1c: s.a = asl(s.a); return c;
  case 0x2b: { u8 o = imm(); wdp(o, rol(rdp(o))); return c; }
  case 0x2c: { u16 a = imm16(); wr(a, rol(rd(a))); return c; }
  case 0x3b: { u8 o = (u8)(imm() + s.x); wdp(o, rol(rdp(o))); return c; }
  case 0x3c: s.a = rol(s.a); return c;
  case 0x4b: { u8 o = imm(); wdp(o, lsr(rdp(o))); return c; }
  case 0x4c: { u16 a = imm16(); wr(a, lsr(rd(a))); return c; }
  case 0x5b: { u8 o = (u8)(imm() + s.x); wdp(o, lsr(rdp(o))); return c; }
  case 0x5c: s.a = lsr(s.a); return c;
  case 0x6b: { u8 o = imm(); wdp(o, ror(rdp(o))); return c; }
  case 0x6c: { u16 a = imm16(); wr(a, ror(rd(a))); return c; }
  case 0x7b: { u8 o = (u8)(imm() + s.x); wdp(o, ror(rdp(o))); return c; }
  case 0x7c: s.a = ror(s.a); return c;
  case 0x8b: { u8 o = imm(); wdp(o, dec(rdp(o))); return c; }
  case 0x8c: { u16 a = imm16(); wr(a, dec(rd(a))); return c; }
  case 0x9b: { u8 o = (u8)(imm() + s.x); wdp(o, dec(rdp(o))); return c; }
  case 0x9c: s.a = dec(s.a); return c;
  case 0xab: { u8 o = imm(); wdp(o, inc(rdp(o))); return c; }
  case 0xac: { u16 a = imm16(); wr(a, inc(rd(a))); return c; }
  case 0xbb: { u8 o = (u8)(imm() + s.x); wdp(o, inc(rdp(o))); return c; }
  case 0xbc: s.a = inc(s.a); return c;
  case 0x1d: s.x = dec(s.x); return c; case 0x3d: s.x = inc(s.x); return c;
  case 0xdc: s.y = dec(s.y); return c; case 0xfc: s.y = inc(s.y); return c;
  case 0x0e: { u16 a = imm16(); u8 v = rd(a); nz(s.a - v); wr(a, v | s.a); return c; }
  case 0x4e: { u16 a = imm16(); u8 v = rd(a); nz(s.a - v); wr(a, v & ~s.a); return c; }
  case 0x1e: cmp(s.x, rd(imm16())); return c;
  case 0x3e: cmp(s.x, rdp(imm())); return c;
  case 0x5e: cmp(s.y, rd(imm16())); return c;
  case 0x7e: cmp(s.y, rdp(imm())); return c;
  case 0xad: cmp(s.y, imm()); return c;
  case 0xc8: cmp(s.x, imm()); return c;
  case 0x1a: { u8 o = imm(); u16 v = rdp16(o) - 1; wdp16(o, v); setf(PN, v & 0x8000); setf(PZ, !v); return c; }
  case 0x3a: { u8 o = imm(); u16 v = rdp16(o) + 1; wdp16(o, v); setf(PN, v & 0x8000); setf(PZ, !v); return c; }
  case 0x5a: { u16 v = rdp16(imm()); int r = (s.y << 8 | s.a) - v; setf(PC_, r >= 0); setf(PN, r & 0x8000); setf(PZ, !(u16)r); return c; }
  case 0x7a: case 0x9a: {
    u16 v = rdp16(imm()), ya = s.y << 8 | s.a; int r;
    if (op == 0x9a) v = ~v;
    int cin = op == 0x9a ? 1 : 0;
    r = ya + v + cin;
    setf(PC_, r > 0xffff); setf(PV, ~(ya ^ v) & (ya ^ r) & 0x8000); setf(PH, (ya ^ v ^ r) & 0x1000);
    setf(PN, r & 0x8000); setf(PZ, !(u16)r);
    s.a = (u8)r; s.y = (u8)(r >> 8); return c;
  }
  case 0xba: { u16 v = rdp16(imm()); s.a = (u8)v; s.y = v >> 8; setf(PN, v & 0x8000); setf(PZ, !v); return c; }
  case 0xda: { u8 o = imm(); wdp16(o, s.y << 8 | s.a); return c; }
  case 0xcf: { u16 r = s.y * s.a; s.a = (u8)r; s.y = r >> 8; nz(s.y); return c; }
  case 0x9e: {
    u16 ya = s.y << 8 | s.a;
    setf(PV, s.y >= s.x); setf(PH, (s.y & 15) >= (s.x & 15));
    if (s.y < (s.x << 1)) { s.a = s.x ? ya / s.x : 0xff; s.y = s.x ? ya % s.x : s.a; }
    else { s.a = 255 - (ya - (s.x << 9)) / (256 - s.x); s.y = s.x + (ya - (s.x << 9)) % (256 - s.x); }
    nz(s.a); return c;
  }
  case 0xdf: if ((s.psw & PC_) || s.a > 0x99) { s.a += 0x60; s.psw |= PC_; } if ((s.psw & PH) || (s.a & 15) > 9) s.a += 6; nz(s.a); return c;
  case 0xbe: if (!(s.psw & PC_) || s.a > 0x99) { s.a -= 0x60; s.psw &= ~PC_; } if (!(s.psw & PH) || (s.a & 15) > 9) s.a -= 6; nz(s.a); return c;
  case 0x9f: s.a = (s.a >> 4) | (s.a << 4); nz(s.a); return c;
  case 0x0a: case 0x2a: case 0x4a: case 0x6a: case 0x8a: case 0xaa: case 0xca: case 0xea: {
    u16 w = imm16(); u16 a = w & 0x1fff; int b = w >> 13; bool bit = (rd(a) >> b) & 1; bool C = s.psw & PC_;
    switch (op) {
    case 0x0a: C = C || bit; break; case 0x2a: C = C || !bit; break;
    case 0x4a: C = C && bit; break; case 0x6a: C = C && !bit; break;
    case 0x8a: C = C != bit; break; case 0xaa: C = bit; break;
    case 0xca: { u8 v = rd(a); v = C ? v | (1 << b) : v & ~(1 << b); wr(a, v); return c; }
    default: { u8 v = rd(a) ^ (1 << b); wr(a, v); return c; }
    }
    setf(PC_, C); return c;
  }
  case 0x5d: s.x = s.a; nz(s.x); return c;
  case 0x7d: s.a = s.x; nz(s.a); return c;
  case 0x9d: s.x = s.sp; nz(s.x); return c;
  case 0xbd: s.sp = s.x; return c;
  case 0xdd: s.a = s.y; nz(s.a); return c;
  case 0xfd: s.y = s.a; nz(s.y); return c;
  case 0x8d: s.y = imm(); nz(s.y); return c;
  case 0xcd: s.x = imm(); nz(s.x); return c;
  case 0xe8: s.a = imm(); nz(s.a); return c;
  case 0x8f: { u8 i = imm(), o = imm(); wdp(o, i); return c; }
  case 0xfa: { u8 sa = imm(), da = imm(); wdp(da, rdp(sa)); return c; }
  case 0xaf: wdp(s.x++, s.a); return c;
  case 0xbf: s.a = rdp(s.x++); nz(s.a); return c;
  case 0xc4: wdp(imm(), s.a); return c;
  case 0xc5: wr(imm16(), s.a); return c;
  case 0xc6: wdp(s.x, s.a); return c;
  case 0xc7: { u8 o = imm(); wr(rdp16((u8)(o + s.x)), s.a); return c; }
  case 0xc9: wr(imm16(), s.x); return c;
  case 0xcb: wdp(imm(), s.y); return c;
  case 0xcc: wr(imm16(), s.y); return c;
  case 0xd4: wdp((u8)(imm() + s.x), s.a); return c;
  case 0xd5: wr(imm16() + s.x, s.a); return c;
  case 0xd6: wr(imm16() + s.y, s.a); return c;
  case 0xd7: { u8 o = imm(); wr(rdp16(o) + s.y, s.a); return c; }
  case 0xd8: wdp(imm(), s.x); return c;
  case 0xd9: wdp((u8)(imm() + s.y), s.x); return c;
  case 0xdb: wdp((u8)(imm() + s.x), s.y); return c;
  case 0xe4: s.a = rdp(imm()); nz(s.a); return c;
  case 0xe5: s.a = rd(imm16()); nz(s.a); return c;
  case 0xe6: s.a = rdp(s.x); nz(s.a); return c;
  case 0xe7: { u8 o = imm(); s.a = rd(rdp16((u8)(o + s.x))); nz(s.a); return c; }
  case 0xe9: s.x = rd(imm16()); nz(s.x); return c;
  case 0xeb: s.y = rdp(imm()); nz(s.y); return c;
  case 0xec: s.y = rd(imm16()); nz(s.y); return c;
  case 0xf4: s.a = rdp((u8)(imm() + s.x)); nz(s.a); return c;
  case 0xf5: s.a = rd(imm16() + s.x); nz(s.a); return c;
  case 0xf6: s.a = rd(imm16() + s.y); nz(s.a); return c;
  case 0xf7: { u8 o = imm(); s.a = rd(rdp16(o) + s.y); nz(s.a); return c; }
  case 0xf8: s.x = rdp(imm()); nz(s.x); return c;
  case 0xf9: s.x = rdp((u8)(imm() + s.y)); nz(s.x); return c;
  case 0xfb: s.y = rdp((u8)(imm() + s.x)); nz(s.y); return c;
  }
  fprintf(stderr, "spc: unhandled %02x\n", op);
  return c;
}

static void timers(int cycles) {
  static const int div[3] = { 128, 128, 16 };
  for (int i = 0; i < 3; i++) {
    tmr[i].sub += cycles;
    while (tmr[i].sub >= div[i]) {
      tmr[i].sub -= div[i];
      if (!tmr[i].en) continue;
      tmr[i].stage++;
      if (tmr[i].stage == tmr[i].target || (tmr[i].target == 0 && tmr[i].stage == 0)) { tmr[i].stage = 0; tmr[i].counter = (tmr[i].counter + 1) & 15; }
    }
  }
}

void apu_reset(void) {
  memset(aram, 0, sizeof aram); memset(dsp, 0, sizeof dsp); memset(vo, 0, sizeof vo);
  memset(&s, 0, sizeof s);
  s.pc = ipl[62] | ipl[63] << 8; s.sp = 0xef; control = 0xb0;
  dsp[0x6c] = 0xe0;
  resample_init();
  spc_cycles = 0;
}

void apu_catchup(void) {
  u64 target = master_clock * 1024000ull / 21477272ull;
  while (spc_cycles < target) {
    int c = s.stop ? 2 : spc_step();
    spc_cycles += c;
    timers(c);
    sample_clock += c;
    while (sample_clock >= 32) { sample_clock -= 32; dsp_sample(); }
  }
}

u8 apu_read(int port) { return out_port[port & 3]; }
void apu_write(int port, u8 v) { in_port[port & 3] = v; }

void apu_serialize(Ser *s_) {
  SER(s_, aram); SER(s_, s); SER(s_, in_port); SER(s_, out_port); SER(s_, control); SER(s_, dspaddr); SER(s_, tmr);
  SER(s_, spc_cycles); SER(s_, sample_clock); SER(s_, dsp); SER(s_, vo); SER(s_, noise); SER(s_, gcounter);
  SER(s_, echo_hist); SER(s_, echo_hpos); SER(s_, echo_off);
}
