ROM_SIZE = 0x100000

OVERLAYS = [
    (0x0ffe1e, 0x0ffe7f, 0x000101, 0x00101),
    (0x010000, 0x0159c2, 0x7e3193, 0x03193),
]

BIG_DATA = 512

def lorom(off):
    return ((off >> 15) << 16) | 0x8000 | (off & 0x7fff)

def home_addr(off):
    for s, e, base, _ in OVERLAYS:
        if s <= off < e:
            return base + (off - s)
    return lorom(off)

def wram_to_rom(wi):
    for s, e, base, w in OVERLAYS:
        if w <= wi < w + (e - s):
            return s + (wi - w)
    return None

def cpu2rom(a):
    b, o = a >> 16, a & 0xffff
    if b in (0x7e, 0x7f):
        return wram_to_rom(a & 0x1ffff)
    lb = b & 0x7f
    if lb < 0x40:
        if o < 0x2000:
            return wram_to_rom(o)
        if o >= 0x8000:
            return ((lb << 15) | (o & 0x7fff)) & (ROM_SIZE - 1)
        return None
    if lb < 0x60:
        return ((lb & 0x1f) << 16 | o) & (ROM_SIZE - 1)
    return None

def gsu2rom(a):
    b, o = (a >> 16) & 0x7f, a & 0xffff
    if b < 0x40:
        return ((b << 15) | (o & 0x7fff)) & (ROM_SIZE - 1)
    if b < 0x60:
        return ((b & 0x1f) << 16 | o) & (ROM_SIZE - 1)
    return None
