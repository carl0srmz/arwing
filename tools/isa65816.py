MODES = {
    'imp':    (0, '{m}'),
    'acc':    (0, '{m} a'),
    'immm':   (None, '{m} #{o}'),
    'immx':   (None, '{m} #{o}'),
    'imm8':   (1, '{m} #{o}'),
    'dp':     (1, '{m} {o}'),
    'dpx':    (1, '{m} {o},x'),
    'dpy':    (1, '{m} {o},y'),
    'dpind':  (1, '{m} ({o})'),
    'dpxind': (1, '{m} ({o},x)'),
    'dpindy': (1, '{m} ({o}),y'),
    'dplong': (1, '{m} [{o}]'),
    'dplongy': (1, '{m} [{o}],y'),
    'sr':     (1, '{m} {o},s'),
    'sriy':   (1, '{m} ({o},s),y'),
    'abs':    (2, '{m} {o}'),
    'absx':   (2, '{m} {o},x'),
    'absy':   (2, '{m} {o},y'),
    'absind': (2, '{m} ({o})'),
    'absxind': (2, '{m} ({o},x)'),
    'abslong': (2, '{m} [{o}]'),
    'long':   (3, '{m} {o}'),
    'longx':  (3, '{m} {o},x'),
    'rel8':   (1, '{m} {o}'),
    'rel16':  (2, '{m} {o}'),
    'bm':     (2, '{m} {o}'),
    'pea':    (2, '{m} {o}'),
    'pei':    (1, '{m} ({o})'),
}

OPS = [None] * 256

def _g1():
    names = ['ora', 'and', 'eor', 'adc', 'sta', 'lda', 'cmp', 'sbc']
    modes = {0x01: 'dpxind', 0x03: 'sr', 0x05: 'dp', 0x07: 'dplong', 0x09: 'immm', 0x0d: 'abs', 0x0f: 'long',
             0x11: 'dpindy', 0x12: 'dpind', 0x13: 'sriy', 0x15: 'dpx', 0x17: 'dplongy', 0x19: 'absy', 0x1d: 'absx', 0x1f: 'longx'}
    for g, n in enumerate(names):
        for lo, md in modes.items():
            OPS[g << 5 | lo] = (n, md)
    OPS[0x89] = ('bit', 'immm')
_g1()

_rest = """
00 brk imm8; 02 cop imm8; 04 tsb dp; 06 asl dp; 08 php imp; 0a asl acc; 0b phd imp; 0c tsb abs; 0e asl abs
10 bpl rel8; 14 trb dp; 16 asl dpx; 18 clc imp; 1a inc acc; 1b tcs imp; 1c trb abs; 1e asl absx
20 jsr abs; 22 jsl long; 24 bit dp; 26 rol dp; 28 plp imp; 2a rol acc; 2b pld imp; 2c bit abs; 2e rol abs
30 bmi rel8; 34 bit dpx; 36 rol dpx; 38 sec imp; 3a dec acc; 3b tsc imp; 3c bit absx; 3e rol absx
40 rti imp; 42 wdm imm8; 44 mvp bm; 46 lsr dp; 48 pha imp; 4a lsr acc; 4b phk imp; 4c jmp abs; 4e lsr abs
50 bvc rel8; 54 mvn bm; 56 lsr dpx; 58 cli imp; 5a phy imp; 5b tcd imp; 5c jml long; 5e lsr absx
60 rts imp; 62 per rel16; 64 stz dp; 66 ror dp; 68 pla imp; 6a ror acc; 6b rtl imp; 6c jmp absind; 6e ror abs
70 bvs rel8; 74 stz dpx; 76 ror dpx; 78 sei imp; 7a ply imp; 7b tdc imp; 7c jmp absxind; 7e ror absx
80 bra rel8; 82 brl rel16; 84 sty dp; 86 stx dp; 88 dey imp; 8a txa imp; 8b phb imp; 8c sty abs; 8e stx abs
90 bcc rel8; 94 sty dpx; 96 stx dpy; 98 tya imp; 9a txs imp; 9b txy imp; 9c stz abs; 9e stz absx
a0 ldy immx; a2 ldx immx; a4 ldy dp; a6 ldx dp; a8 tay imp; aa tax imp; ab plb imp; ac ldy abs; ae ldx abs
b0 bcs rel8; b4 ldy dpx; b6 ldx dpy; b8 clv imp; ba tsx imp; bb tyx imp; bc ldy absx; be ldx absy
c0 cpy immx; c2 rep imm8; c4 cpy dp; c6 dec dp; c8 iny imp; ca dex imp; cb wai imp; cc cpy abs; ce dec abs
d0 bne rel8; d4 pei pei; d6 dec dpx; d8 cld imp; da phx imp; db stp imp; dc jml abslong; de dec absx
e0 cpx immx; e2 sep imm8; e4 cpx dp; e6 inc dp; e8 inx imp; ea nop imp; eb xba imp; ec cpx abs; ee inc abs
f0 beq rel8; f4 pea pea; f6 inc dpx; f8 sed imp; fa plx imp; fb xce imp; fc jsr absxind; fe inc absx
"""
for line in _rest.strip().splitlines():
    for item in line.split(';'):
        h, n, md = item.split()
        OPS[int(h, 16)] = (n, md)
assert all(OPS), [i for i, o in enumerate(OPS) if not o]

def length(op, m8, x8):
    n, md = OPS[op]
    sz = MODES[md][0]
    if sz is None:
        sz = 1 if (m8 if md == 'immm' else x8) else 2
    return 1 + sz

BRANCHES = {'bpl', 'bmi', 'bvc', 'bvs', 'bcc', 'bcs', 'bne', 'beq', 'bra', 'brl'}
TERMINAL = {'bra', 'brl', 'jmp', 'jml', 'rts', 'rtl', 'rti', 'stp', 'brk', 'cop'}

ENCODE = {}
for i, (n, md) in enumerate(OPS):
    ENCODE[(n, md)] = i

HWREGS = {
    0x2100: 'INIDISP', 0x2101: 'OBSEL', 0x2102: 'OAMADDL', 0x2103: 'OAMADDH', 0x2104: 'OAMDATA', 0x2105: 'BGMODE',
    0x2106: 'MOSAIC', 0x2107: 'BG1SC', 0x2108: 'BG2SC', 0x2109: 'BG3SC', 0x210a: 'BG4SC', 0x210b: 'BG12NBA',
    0x210c: 'BG34NBA', 0x210d: 'BG1HOFS', 0x210e: 'BG1VOFS', 0x210f: 'BG2HOFS', 0x2110: 'BG2VOFS', 0x2111: 'BG3HOFS',
    0x2112: 'BG3VOFS', 0x2113: 'BG4HOFS', 0x2114: 'BG4VOFS', 0x2115: 'VMAIN', 0x2116: 'VMADDL', 0x2117: 'VMADDH',
    0x2118: 'VMDATAL', 0x2119: 'VMDATAH', 0x211a: 'M7SEL', 0x211b: 'M7A', 0x211c: 'M7B', 0x211d: 'M7C', 0x211e: 'M7D',
    0x211f: 'M7X', 0x2120: 'M7Y', 0x2121: 'CGADD', 0x2122: 'CGDATA', 0x2123: 'W12SEL', 0x2124: 'W34SEL',
    0x2125: 'WOBJSEL', 0x2126: 'WH0', 0x2127: 'WH1', 0x2128: 'WH2', 0x2129: 'WH3', 0x212a: 'WBGLOG', 0x212b: 'WOBJLOG',
    0x212c: 'TM', 0x212d: 'TS', 0x212e: 'TMW', 0x212f: 'TSW', 0x2130: 'CGWSEL', 0x2131: 'CGADSUB', 0x2132: 'COLDATA',
    0x2133: 'SETINI', 0x2134: 'MPYL', 0x2135: 'MPYM', 0x2136: 'MPYH', 0x2137: 'SLHV', 0x2138: 'OAMDATAREAD',
    0x2139: 'VMDATALREAD', 0x213a: 'VMDATAHREAD', 0x213b: 'CGDATAREAD', 0x213c: 'OPHCT', 0x213d: 'OPVCT',
    0x213e: 'STAT77', 0x213f: 'STAT78', 0x2140: 'APUIO0', 0x2141: 'APUIO1', 0x2142: 'APUIO2', 0x2143: 'APUIO3',
    0x2180: 'WMDATA', 0x2181: 'WMADDL', 0x2182: 'WMADDM', 0x2183: 'WMADDH',
    0x4016: 'JOYSER0', 0x4017: 'JOYSER1', 0x4200: 'NMITIMEN', 0x4201: 'WRIO', 0x4202: 'WRMPYA', 0x4203: 'WRMPYB',
    0x4204: 'WRDIVL', 0x4205: 'WRDIVH', 0x4206: 'WRDIVB', 0x4207: 'HTIMEL', 0x4208: 'HTIMEH', 0x4209: 'VTIMEL',
    0x420a: 'VTIMEH', 0x420b: 'MDMAEN', 0x420c: 'HDMAEN', 0x420d: 'MEMSEL', 0x4210: 'RDNMI', 0x4211: 'TIMEUP',
    0x4212: 'HVBJOY', 0x4213: 'RDIO', 0x4214: 'RDDIVL', 0x4215: 'RDDIVH', 0x4216: 'RDMPYL', 0x4217: 'RDMPYH',
    0x4218: 'JOY1L', 0x4219: 'JOY1H', 0x421a: 'JOY2L', 0x421b: 'JOY2H', 0x421c: 'JOY3L', 0x421d: 'JOY3H',
    0x421e: 'JOY4L', 0x421f: 'JOY4H',
    0x3000: 'GSU_R0', 0x3002: 'GSU_R1', 0x3004: 'GSU_R2', 0x3006: 'GSU_R3', 0x3008: 'GSU_R4', 0x300a: 'GSU_R5',
    0x300c: 'GSU_R6', 0x300e: 'GSU_R7', 0x3010: 'GSU_R8', 0x3012: 'GSU_R9', 0x3014: 'GSU_R10', 0x3016: 'GSU_R11',
    0x3018: 'GSU_R12', 0x301a: 'GSU_R13', 0x301c: 'GSU_R14', 0x301e: 'GSU_R15', 0x3030: 'GSU_SFR', 0x3031: 'GSU_SFRH',
    0x3033: 'GSU_BRAMR', 0x3034: 'GSU_PBR', 0x3036: 'GSU_ROMBR', 0x3037: 'GSU_CFGR', 0x3038: 'GSU_SCBR',
    0x3039: 'GSU_CLSR', 0x303a: 'GSU_SCMR', 0x303b: 'GSU_VCR', 0x303c: 'GSU_RAMBR', 0x303e: 'GSU_CBR',
}
for ch in range(8):
    for r, n in enumerate(['DMAP', 'BBAD', 'A1TL', 'A1TH', 'A1B', 'DASL', 'DASH', 'DASB', 'A2AL', 'A2AH', 'NTRL']):
        HWREGS[0x4300 | ch << 4 | r] = f'{n}{ch}'
