#pragma once
#ifdef _WIN32
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#else
#include "sdl/compat.h"
#endif
#include <stdint.h>
#include <stdbool.h>

typedef struct { int x, y, w, h; } Rect;

#define C_SPACE RGB(41, 57, 74)
#define C_PANEL RGB(30, 43, 57)
#define C_EDGE RGB(165, 181, 198)
#define C_INSET RGB(123, 123, 132)
#define C_ROW RGB(58, 82, 102)
#define C_TAB RGB(189, 189, 198)
#define C_TEXT RGB(255, 255, 255)
#define C_DIM RGB(140, 160, 180)
#define C_SEL RGB(156, 255, 255)
#define C_LCD RGB(255, 255, 255)
#define C_COMM RGB(0, 0, 0)
#define C_LOGO_EDGE RGB(107, 49, 66)
#define C_SHADE RGB(90, 90, 99)
#define C_ARROW RGB(255, 181, 0)

extern uint32_t *canvas; extern int cw, ch;
extern HFONT f_title, f_item, f_small, f_tab;
void gfx_canvas(int w, int h);
void fill(int x, int y, int w, int h, COLORREF c);
void text(int x, int y, HFONT f, COLORREF c, const char *s);
int text_w(HFONT f, const char *s);
void text_r(int xr, int y, HFONT f, COLORREF c, const char *s);
void text_wrap(Rect r, HFONT f, COLORREF c, const char *s);
void panel(int x, int y, int w, int h, COLORREF bg, COLORREF edge);
void tab(int x, int y, const char *s);
void sparkle(int cx, int cy);
void stars(void);
void logo(int x, int y);
void plate(int x, int y, int w, int h);
void lime(int x, int y, int w, int h);

#ifdef _WIN32
extern HDC mdc;
extern HWND gfx_hwnd;
void textw(int x, int y, HFONT f, COLORREF c, const wchar_t *s);
#else
extern char gfx_drop[1024];
int font_height(HFONT f);
int plat_pick(bool dir, char *out, int n);
#endif
extern int gfx_key, gfx_mx, gfx_my;
extern bool gfx_click, gfx_moved;
void gfx_begin(void);
int gfx_frame(int (*step)(void), bool shift);
int gfx_window(const wchar_t *title, int w, int h, int (*step)(void));
bool gfx_button(int x, int y, int w, const char *label);
bool gfx_check(int x, int y, const char *label, int *v);
