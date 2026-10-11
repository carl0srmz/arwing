#!/bin/sh
set -e
cd "$(dirname "$0")"
SDLCFG="${SDLCFG:-$PWD/build/sdl/bin/sdl2-config}"
[ -x "$SDLCFG" ] || SDLCFG=sdl2-config
FLAGS="-O2 -mmacosx-version-min=11.0"
for a in ${ARCHS:-arm64 x86_64}; do FLAGS="$FLAGS -arch $a"; done
CFLAGS="$FLAGS -Isrc $("$SDLCFG" --cflags) -DGL_SILENCE_DEPRECATION -Wno-deprecated-declarations -Wno-unused-label"
OBJ=build/obj/mac
APP="build/Project Arwing.app"
rm -rf "$OBJ" "$APP" build/arwing.iconset build/dmg
mkdir -p "$OBJ"
export CFLAGS OBJ

for f in src/*.c src/sdl/*.c src/mac/*.c src/mac/*.m build/gen/*.c; do
  case "$f" in src/input.c|src/win32.c) ;; *) echo "$f" ;; esac
done | xargs -P "$(sysctl -n hw.ncpu)" -I{} sh -c 'case "$1" in *.m) x=-fobjc-arc ;; *) x= ;; esac; clang $CFLAGS $x -c "$1" -o "$OBJ/$(echo "$1" | tr / _).o"' sh {}

clang $FLAGS "$OBJ"/*.o $("$SDLCFG" --static-libs) \
  -framework Cocoa -framework OpenGL -framework CoreText -framework CoreGraphics -framework CoreServices -o build/arwing

mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources" build/arwing.iconset
cp build/arwing "$APP/Contents/MacOS/arwing"
cp res/Info.plist "$APP/Contents/Info.plist"
python3 -c "import struct,sys;d=open('res/arwing.ico','rb').read();e=max((struct.unpack('<BBBBHHII',d[6+16*i:22+16*i]) for i in range(struct.unpack('<H',d[4:6])[0])),key=lambda e:e[0] or 256);open(sys.argv[1],'wb').write(d[e[7]:e[7]+e[6]])" build/icon.png
for s in 16 32 128 256 512; do
  sips -z $s $s build/icon.png --out "build/arwing.iconset/icon_${s}x${s}.png" >/dev/null
  sips -z $((s * 2)) $((s * 2)) build/icon.png --out "build/arwing.iconset/icon_${s}x${s}@2x.png" >/dev/null
done
iconutil -c icns build/arwing.iconset -o "$APP/Contents/Resources/arwing.icns"
codesign --force --deep -s - "$APP"

mkdir -p build/dmg
cp -R "$APP" build/dmg/
for i in 1 2 3; do
  hdiutil create -volname "Project Arwing" -srcfolder build/dmg -ov -format UDZO build/arwing-macos.dmg && break
  sleep 5
done
test -f build/arwing-macos.dmg
