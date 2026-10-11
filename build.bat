@echo off
setlocal
if not defined VCINSTALLDIR call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" >nul
if not exist build mkdir build
if not exist build\obj mkdir build\obj
if not exist build\obj\inst mkdir build\obj\inst
rc /nologo /fobuild\obj\game.res res\game.rc || exit /b 1
cl /nologo /O2 /W3 /MP /wd4244 /wd4996 /wd4146 /wd4102 /D_CRT_SECURE_NO_WARNINGS /Isrc /Fobuild\obj\ /Febuild\starfox.exe src\*.c build\gen\*.c build\obj\game.res %* /link /subsystem:windows /entry:mainCRTStartup || exit /b 1
rc /nologo /fobuild\obj\arwing.res installer\arwing.rc || exit /b 1
cl /nologo /O2 /W3 /wd4996 /D_CRT_SECURE_NO_WARNINGS /Fobuild\obj\inst\ /Febuild\arwing.exe installer\arwing.c src\gfx.c build\obj\arwing.res /link /subsystem:windows || exit /b 1
