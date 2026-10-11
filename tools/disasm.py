import os
import sys
from collections import defaultdict

import numpy as np

sys.path.insert(0, os.path.dirname(__file__))
from isa65816 import OPS, MODES, HWREGS, BRANCHES, TERMINAL, length as op_length
import isagsu
from layout import OVERLAYS, home_addr, cpu2rom, gsu2rom, BIG_DATA

rom = b''
insn = {}
gins = {}
owner = None
labels = {}
label_kind = {}
label_comments = {}
noreturn = set()
conflicts = []

def add_label(off, kind):
    pri = {'sub': 3, 'gsu': 3, 'loc': 2, 'tbl': 1, 'dat': 0}
    if off in label_kind and pri[label_kind[off]] >= pri[kind]:
        return
    label_kind[off] = kind

def decode_cpu(off, cpu, m, x):
    op = rom[off]
    n = op_length(op, m, x)
    if off + n > len(rom):
        return None
    return op, n

def operand(off, n):
    v = 0
    for i in range(1, n):
        v |= rom[off + i] << (8 * (i - 1))
    return v

def targets(off, cpu, op, n):
    mn, md = OPS[op]
    pb = cpu & 0xff0000
    nxt = (cpu & 0xff0000) | ((cpu + n) & 0xffff)
    v = operand(off, n)
    t = []
    if md == 'rel8':
        t.append((pb | ((cpu + 2 + (v - 256 if v >= 128 else v)) & 0xffff), 'loc'))
    elif md == 'rel16' and mn == 'brl':
        t.append((pb | ((cpu + 3 + (v - 65536 if v >= 32768 else v)) & 0xffff), 'loc'))
    elif mn in ('jmp', 'jsr') and md == 'abs':
        t.append((pb | v, 'sub' if mn == 'jsr' else 'loc'))
    elif mn in ('jml', 'jsl') and md == 'long':
        t.append((v, 'sub' if mn == 'jsl' else 'loc'))
    return t, nxt

def analyze_cpu(seeds, dyn_jumps):
    work = list(seeds)
    expanded = set()
    while work:
        cpu, m, x, static = work.pop()
        off = cpu2rom(cpu)
        if off is None:
            continue
        if off in insn:
            if off in expanded:
                continue
            i = insn[off]
            m, x, n = i['m'], i['x'], i['n']
            if insn[off]['cpu'] != cpu and (insn[off]['cpu'] & 0xffff) != (cpu & 0xffff):
                pass
            cpu = i['cpu']
            op = rom[off]
        else:
            d = decode_cpu(off, cpu, m, x)
            if d is None:
                continue
            op, n = d
            if any(owner[off + k] for k in range(n)) or cpu2rom((cpu & 0xff0000) | ((cpu + n - 1) & 0xffff)) != off + n - 1 or home_addr(off + n - 1) != home_addr(off) + n - 1:
                conflicts.append((off, cpu, m, x))
                continue
            mn = OPS[op][0]
            if mn in ('brk', 'cop', 'wdm', 'stp'):
                continue
            insn[off] = dict(cpu=cpu, m=m, x=x, n=n, static=True)
            owner[off:off + n] = 1
        expanded.add(off)
        mn, md = OPS[op]
        nm, nx = m, x
        if mn == 'rep':
            v = rom[off + 1]
            nm = m and not (v & 0x20); nx = x and not (v & 0x10)
        elif mn == 'sep':
            v = rom[off + 1]
            nm = m or bool(v & 0x20); nx = x or bool(v & 0x10)
        elif mn == 'xce':
            nm, nx = True, True
        tl, nxt = targets(off, cpu, op, n)
        for t, kind in tl:
            to = cpu2rom(t)
            if to is not None:
                add_label(to, kind)
                work.append((t, nm, nx, True))
        for t in dyn_jumps.get(cpu, ()):
            to = cpu2rom(t)
            if to is not None and mn not in ('rts', 'rtl', 'rti'):
                add_label(to, 'loc')
            if to is not None:
                work.append((t, nm, nx, True))
        if mn in ('jmp', 'jsr') and md == 'absxind':
            scan_table(off, cpu, op, nm, nx, work)
        if mn in TERMINAL:
            continue
        if mn in ('jsr', 'jsl') and tl and cpu2rom(tl[0][0]) in noreturn:
            continue
        work.append((nxt, nm, nx, True))

def speculate_cpu(dyn):
    added = 0
    ends = sorted(o + i['n'] for o, i in insn.items() if OPS[rom[o]][0] in TERMINAL)
    for start in ends:
        if start >= len(rom) or owner[start] or start - 1 not in range(len(rom)):
            continue
        prev = max((o for o in (start - k for k in range(1, 5)) if o in insn), default=None)
        if prev is None:
            continue
        pi = insn[prev]
        cpu = (pi['cpu'] & 0xff0000) | ((pi['cpu'] + (start - prev)) & 0xffff)
        if cpu2rom(cpu) != start:
            continue
        best = None
        for m, x in ((pi['m'], pi['x']), (True, True), (False, False), (True, False), (False, True)):
            run = []
            off, c, ok, mm, xx = start, cpu, False, m, x
            evidence = 0
            while len(run) < 400:
                if off >= len(rom) or owner[off]:
                    break
                op = rom[off]
                mn, md = OPS[op]
                n = op_length(op, mm, xx)
                if any(owner[off + k] for k in range(n)) or mn in ('brk', 'cop', 'wdm', 'stp', 'xce'):
                    break
                tl, nxt = targets(off, c, op, n)
                bad = False
                for t, kind in tl:
                    to = cpu2rom(t)
                    if mn in ('jsr', 'jsl', 'jmp', 'jml'):
                        if to in insn: evidence += 1
                        else: bad = True
                    elif to is None or not (start <= to < off + 0x200 or to in insn):
                        bad = True
                if bad:
                    break
                run.append((off, c, mm, xx, n))
                if mn == 'rep':
                    v = rom[off + 1]; mm = mm and not (v & 0x20); xx = xx and not (v & 0x10)
                elif mn == 'sep':
                    v = rom[off + 1]; mm = mm or bool(v & 0x20); xx = xx or bool(v & 0x10)
                off += n
                c = nxt
                if mn in TERMINAL:
                    ok = True
                    break
            if ok and len(run) >= 3 and evidence >= 1:
                best = run
                break
        if best:
            for off, c, mm, xx, n in best:
                insn[off] = dict(cpu=c, m=mm, x=xx, n=n, static=True)
                owner[off:off + n] = 1
            add_label(start, 'loc')
            analyze_cpu([(best[0][1], best[0][2], best[0][3], True)], dyn)
            added += 1
    return added

def pulls_return(off):
    for _ in range(6):
        if off not in insn:
            return False
        mn = OPS[rom[off]][0]
        if mn in ('pla', 'plx', 'ply'):
            return True
        if mn in ('pha', 'phx', 'phy', 'php', 'phb', 'phd', 'phk', 'rts', 'rtl', 'jmp', 'jml', 'jsr', 'jsl', 'bra', 'brl', 'rti'):
            return False
        off += insn[off]['n']
    return False

def scan_table(off, cpu, op, m, x, work):
    pb = cpu & 0xff0000
    base = pb | operand(off, 3)
    to = cpu2rom(base)
    if to is None:
        return
    add_label(to, 'tbl')
    for i in range(128):
        p = to + 2 * i
        if p + 1 >= len(rom) or owner[p] or owner[p + 1]:
            break
        t = pb | rom[p] | rom[p + 1] << 8
        tr = cpu2rom(t)
        if tr is None or (t & 0xffff) < 0x8000 and (pb >> 16) < 0x40 and tr is None:
            break
        if OPS[rom[tr]][0] in ('brk', 'cop', 'wdm', 'stp'):
            break
        add_label(tr, 'loc')
        work.append((t, m, x, True))

def analyze_gsu(seeds):
    work = list(seeds)
    seen = set()
    gexpanded = set()
    while work:
        addr, alt, b, static = work.pop()
        off = gsu2rom(addr)
        if off is None or (off, alt, b) in seen:
            continue
        seen.add((off, alt, b))
        op = rom[off]
        if off in gins:
            if off in gexpanded:
                continue
            alt, b, addr = gins[off]['alt'], gins[off]['b'], gins[off]['addr']
            mn, kind, r = isagsu.decode(op, alt)
            n = gins[off]['n']
        else:
            mn, kind, r = isagsu.decode(op, alt)
            n = isagsu.oplen(kind)
            if any(owner[off + i] for i in range(n)):
                continue
            gins[off] = dict(addr=addr, alt=alt, b=b, n=n, static=static)
            owner[off:off + n] = 2
        gexpanded.add(off)
        bank = addr & 0xff0000
        nxt = bank | ((addr + n) & 0xffff)
        if op in (0x3d, 0x3e, 0x3f):
            nalt, nb = {0x3d: 1, 0x3e: 2, 0x3f: 3}[op], False
        elif mn == 'with':
            nalt, nb = alt, True
        elif mn in ('to', 'from') and not b:
            nalt, nb = alt, b
        elif kind == 'rel':
            nalt, nb = alt, b
        else:
            nalt, nb = 0, False
        if mn == 'stop':
            continue
        if kind == 'rel':
            d = rom[off + 1]
            tgt = bank | ((addr + 2 + (d - 256 if d >= 128 else d)) & 0xffff)
            to = gsu2rom(tgt)
            if to is not None:
                add_label(to, 'gsu')
            work.append((tgt, 0, False, True))
            if mn == 'bra':
                work.append((nxt, nalt, nb, True))
                ds = gsu2rom(nxt)
                continue
        if mn in ('jmp', 'ljmp'):
            work.append((nxt, 0, False, True))
            continue
        if mn == 'iwt' and r == 15:
            tgt = bank | operand(off, 3)
            to = gsu2rom(tgt)
            if to is not None:
                add_label(to, 'gsu')
                work.append((tgt, 0, False, True))
            work.append((nxt, 0, False, True))
            continue
        work.append((nxt, nalt, nb, True))

def lbl(off):
    return labels.get(off)

def render_cpu(off):
    i = insn[off]
    op = rom[off]
    mn, md = OPS[op]
    n = i['n']
    cpu = i['cpu']
    v = operand(off, n)
    tmpl = MODES[md][1]
    nb = n - 1
    if md in ('imp',):
        return mn
    if md == 'acc':
        return f'{mn} a'
    if md in ('immm', 'immx', 'imm8'):
        o = f'${v:0{2 * nb}x}'
    elif md in ('rel8', 'rel16'):
        disp = v - (256 if md == 'rel8' and v >= 128 else 0) - (65536 if md == 'rel16' and v >= 32768 else 0)
        h = home_addr(off)
        tgt = (h & 0xff0000) | ((h + n + disp) & 0xffff)
        to = cpu2rom(tgt) if (h & 0xffff) == (cpu & 0xffff) else None
        if to is not None and to in labels and home_addr(to) == tgt:
            o = labels[to]
        else:
            o = f'${tgt & 0xffff:04x}'
        if md == 'rel16' and mn == 'per':
            o = o
    elif md == 'bm':
        o = f'${rom[off + 2]:02x},${rom[off + 1]:02x}'
    elif nb == 3:
        to = cpu2rom(v)
        if to is not None and to in labels and home_addr(to) == v and (to in insn or to in gins or label_kind.get(to) in ('tbl', 'dat')):
            o = labels[to]
        else:
            o = f'${v:06x}'
    elif nb == 2:
        o = None
        if mn in ('jsr', 'jmp') and md in ('abs', 'absind', 'absxind') or md == 'abslong':
            if md == 'abs':
                tgt = (cpu & 0xff0000) | v
                to = cpu2rom(tgt)
                if to is not None and to in labels and (home_addr(to) & 0xffff) == v:
                    o = labels[to]
            elif md == 'absxind':
                to = cpu2rom((cpu & 0xff0000) | v)
                if to is not None and to in labels and (home_addr(to) & 0xffff) == v:
                    o = labels[to]
        if o is None and md in ('abs', 'absx', 'absy') and mn not in ('jsr', 'jmp', 'pea') and v in HWREGS:
            o = HWREGS[v]
        if o is None:
            o = f'${v:04x}'
    else:
        o = f'${v:02x}'
    return tmpl.format(m=mn, o=o)

def render_gsu(off):
    i = gins[off]
    op = rom[off]
    mn, kind, r = isagsu.decode(op, i['alt'])
    addr = i['addr']
    if kind is None:
        return mn
    if kind == 'r':
        return f'{mn} r{r}'
    if kind == '(r)':
        return f'{mn} (r{r})'
    if kind == '#n':
        return f'{mn} #{r}'
    if kind == 'rel':
        d = rom[off + 1]
        h = home_addr(off)
        tgt = (h & 0xff0000) | ((h + 2 + (d - 256 if d >= 128 else d)) & 0xffff)
        to = gsu2rom(tgt)
        if to is not None and to in labels and home_addr(to) == tgt:
            return f'{mn} {labels[to]}'
        return f'{mn} ${tgt & 0xffff:04x}'
    if kind == 'ibt':
        return f'ibt r{r},#${rom[off + 1]:02x}'
    if kind == 'lms':
        return f'lms r{r},(${rom[off + 1] << 1:03x})'
    if kind == 'sms':
        return f'sms (${rom[off + 1] << 1:03x}),r{r}'
    v = rom[off + 1] | rom[off + 2] << 8
    if kind == 'iwt':
        if r == 15:
            to = gsu2rom((addr & 0xff0000) | v)
            if to is not None and to in labels and (home_addr(to) & 0xffff) == v:
                return f'iwt r15,#{labels[to]}'
        return f'iwt r{r},#${v:04x}'
    if kind == 'lm':
        return f'lm r{r},(${v:04x})'
    return f'sm (${v:04x}),r{r}'

def write_output(outdir):
    os.makedirs(outdir, exist_ok=True)
    nbanks = len(rom) // 0x8000
    seg_starts = {o[0]: o for o in OVERLAYS}
    seg_ends = {o[1]: o for o in OVERLAYS}
    stats = dict(cpu=0, gsu=0, data=0)
    for bank in range(nbanks):
        lines = [f'; ROM bank ${bank:02x} (file offset ${bank * 0x8000:06x}-${bank * 0x8000 + 0x7fff:06x})',
                 f'.rombank ${bank:02x}', '']
        off = bank * 0x8000
        end = off + 0x8000
        state = None
        mode = None
        data = []

        def flush():
            nonlocal data
            if not data:
                return
            start = data[0]
            cnt = len(data)
            if cnt >= BIG_DATA:
                lines.append(f'    .incbin "data/{start:06x}-{start + cnt:06x}.bin"')
            else:
                for k in range(0, cnt, 16):
                    chunk = rom[start + k:start + min(k + 16, cnt)]
                    lines.append('    .db ' + ','.join(f'${b:02x}' for b in chunk))
            data = []

        while off < end:
            if off in seg_ends and seg_ends[off][1] != seg_ends[off][0]:
                flush(); lines.append('.endbase'); lines.append('')
            if off in seg_starts:
                flush(); lines.append(''); lines.append(f'.base ${seg_starts[off][2]:06x}    ; overlay: copied to RAM and executed there')
            if off in labels:
                flush()
                lines.append('')
                lines.append(f'{labels[off]}:' + (f'    ; {label_comments[off]}' if label_comments.get(off) else ''))
            if off in insn and owner[off] == 1:
                flush()
                i = insn[off]
                if mode != 'cpu':
                    lines.append('.cpu'); mode = 'cpu'; state = None
                if state != (i['m'], i['x']):
                    if state is None or state[0] != i['m']:
                        lines.append('.a8' if i['m'] else '.a16')
                    if state is None or state[1] != i['x']:
                        lines.append('.i8' if i['x'] else '.i16')
                    state = (i['m'], i['x'])
                lines.append('    ' + render_cpu(off))
                stats['cpu'] += i['n']
                off += i['n']
                continue
            if off in gins and owner[off] == 2:
                flush()
                if mode != 'gsu':
                    lines.append('.gsu'); mode = 'gsu'
                lines.append('    ' + render_gsu(off))
                stats['gsu'] += gins[off]['n']
                off += gins[off]['n']
                continue
            data.append(off)
            if len(data) > 1 and data[-1] != data[-2] + 1:
                last = data.pop(); flush(); data = [last]
            stats['data'] += 1
            off += 1
            if off in labels or off in insn or off in gins or off in seg_starts or off in seg_ends:
                flush()
        flush()
        if (bank + 1) * 0x8000 in seg_ends:
            pass
        with open(os.path.join(outdir, f'bank{bank:02x}.s'), 'w', newline='\n') as f:
            f.write('\n'.join(lines) + '\n')
    with open(os.path.join(outdir, 'starfox.s'), 'w', newline='\n') as f:
        f.write('; Star Fox - top-level assembly file. Build with tools/asm.py\n')
        f.write('.include "hw.inc"\n')
        for bank in range(nbanks):
            f.write(f'.include "bank{bank:02x}.s"\n')
    with open(os.path.join(outdir, 'hw.inc'), 'w', newline='\n') as f:
        f.write('; SNES / SuperFX hardware registers\n')
        for v, n in sorted(HWREGS.items()):
            f.write(f'{n} = ${v:04x}\n')
    return stats

def main():
    global rom, owner
    rom = open(sys.argv[1], 'rb').read()
    owner = np.zeros(len(rom) + 8, dtype=np.uint8)
    cov_cpu = None
    cov_gsu = None
    cov_rom = None
    dyn = defaultdict(set)
    for p in sys.argv[2:]:
        c = np.fromfile(p + '_cpu.bin', dtype=np.uint8)
        g = np.fromfile(p + '_gsu.bin', dtype=np.uint8)
        cov_cpu = c if cov_cpu is None else cov_cpu | c
        cov_gsu = g if cov_gsu is None else cov_gsu | g
        r = np.fromfile(p + '_rom.bin', dtype=np.uint8)
        cov_rom = r if cov_rom is None else cov_rom | r
        for line in open(p + '_jumps.txt'):
            a, b = line.split()
            dyn[int(a, 16)].add(int(b, 16))
    seeds = []
    for a in np.nonzero(cov_cpu)[0]:
        f = int(cov_cpu[a])
        for m in ((True,) if f & 2 else ()) + ((False,) if f & 4 else ()):
            for x in ((True,) if f & 8 else ()) + ((False,) if f & 16 else ()):
                seeds.append((int(a), m, x, False))
    for v in (0xffe4, 0xffe6, 0xffe8, 0xffea, 0xffee, 0xfffc):
        t = rom[v - 0x8000] | rom[v - 0x7fff] << 8
        to = cpu2rom(t)
        if to is not None:
            add_label(to, 'sub')
    gseeds = []
    for a in np.nonzero(cov_gsu)[0]:
        f = int(cov_gsu[a])
        for alt in range(4):
            if f & (1 << alt):
                gseeds.append((int(a), alt, bool(f & 0x10), False))
    seeds.sort(key=lambda s: -s[0])
    gseeds.sort(key=lambda s: -s[0])
    for g in gseeds:
        off = gsu2rom(g[0])
        if off is None or off in gins:
            continue
        mn, kind, r = isagsu.decode(rom[off], g[1])
        n = isagsu.oplen(kind)
        gins[off] = dict(addr=g[0], alt=g[1], b=g[2], n=n, static=False)
        owner[off:off + n] = 2
    for s_ in seeds:
        off = cpu2rom(s_[0])
        if off is None or off in insn:
            continue
        d = decode_cpu(off, s_[0], s_[1], s_[2])
        if d and not any(owner[off + k] for k in range(d[1])):
            insn[off] = dict(cpu=s_[0], m=s_[1], x=s_[2], n=d[1], static=False)
            owner[off:off + d[1]] = 1
    for off in np.nonzero(cov_rom)[0]:
        off = int(off)
        f = int(cov_rom[off])
        if off in insn:
            continue
        d = decode_cpu(off, home_addr(off), bool(f & 2), bool(f & 8))
        if d and not any(owner[off + k] for k in range(d[1])):
            insn[off] = dict(cpu=home_addr(off), m=bool(f & 2), x=bool(f & 8), n=d[1], static=False)
            owner[off:off + d[1]] = 1
    for off in list(insn):
        if pulls_return(off):
            noreturn.add(off)
    analyze_gsu([(gins[o]['addr'], gins[o]['alt'], gins[o]['b'], True) for o in list(gins)])
    analyze_cpu([(insn[o]['cpu'], insn[o]['m'], insn[o]['x'], True) for o in list(insn)], dyn)
    for _ in range(8):
        n = speculate_cpu(dyn)
        print('speculative code runs:', n)
        if not n:
            break
    for src, tl in dyn.items():
        for t in tl:
            to = cpu2rom(t)
            if to is not None and to in insn and cpu2rom(src) is not None and OPS[rom[cpu2rom(src)]][0] not in ('rts', 'rtl', 'rti'):
                add_label(to, 'loc')
    for a in np.nonzero(cov_gsu)[0]:
        pass
    names = {}
    comments = {}
    sp = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'asm', 'symbols.txt')
    if os.path.exists(sp):
        for line in open(sp):
            body, _, cmt = line.partition(';')
            w = body.split()
            if len(w) >= 2 and not body.lstrip().startswith('#'):
                names[int(w[0], 16)] = w[1]
                comments[int(w[0], 16)] = cmt.strip()
    for a in names:
        o = cpu2rom(a) if a >= 0x8000 or (a >> 16) in (0x7e, 0x7f) or (a & 0xffff) < 0x2000 else None
        if o is not None and (o in insn or o in gins):
            add_label(o, 'sub')
    for off, kind in label_kind.items():
        if off in insn:
            labels[off] = f'{kind}_{home_addr(off):06x}'
        elif off in gins:
            labels[off] = f'gsu_{home_addr(off):06x}'
        elif kind == 'tbl':
            labels[off] = f'tbl_{home_addr(off):06x}'
        if home_addr(off) in names and off in labels:
            labels[off] = names[home_addr(off)]
            label_comments[off] = comments[home_addr(off)]
    stats = write_output('asm')
    nstat = sum(1 for i in insn.values() if i['static'])
    print(f"cpu insns {len(insn)} (static {nstat}), gsu insns {len(gins)}, labels {len(labels)}, conflicts {len(conflicts)}")
    print(stats)

if __name__ == '__main__':
    main()
