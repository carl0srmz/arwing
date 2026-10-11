import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(__file__))
from isa65816 import OPS, MODES, ENCODE
import isagsu

GSU_ENC = {}
for _op in range(256):
    for _alt in range(4):
        _m, _k, _n = isagsu.decode(_op, _alt)
        GSU_ENC.setdefault((_m, _k, _n), _op)

MNEMONICS = {n for n, _ in OPS}
BRANCH8 = {'bpl', 'bmi', 'bvc', 'bvs', 'bcc', 'bcs', 'bne', 'beq', 'bra'}

class AsmError(Exception):
    pass

def lorom(off):
    return ((off >> 15) << 16) | 0x8000 | (off & 0x7fff)

class Assembler:
    def __init__(self):
        self.syms = {}
        self.rom = bytearray(b'\xff' * 0x100000)
        self.ir = []

    def load(self, path, out):
        base = os.path.dirname(path)
        for ln, raw in enumerate(open(path, encoding='utf-8'), 1):
            line = raw.split(';', 1)[0].strip()
            if not line:
                continue
            m = re.match(r'\.include\s+"([^"]+)"', line)
            if m:
                self.load(os.path.join(base, m.group(1)), out)
                continue
            out.append((path, ln, line, base))
        return out

    def value(self, s, pass2):
        s = s.strip()
        m = re.fullmatch(r'\$([0-9a-fA-F]+)', s)
        if m:
            return int(m.group(1), 16), (len(m.group(1)) + 1) // 2
        m = re.fullmatch(r'([0-9]+)', s)
        if m:
            return int(s), None
        m = re.fullmatch(r'([A-Za-z_][\w.]*)\s*([+-])\s*(\$?[0-9a-fA-F]+)', s)
        if m:
            v, sz = self.value(m.group(1), pass2)
            d = self.value(m.group(3), pass2)[0]
            return (v + d if m.group(2) == '+' else v - d), sz
        if re.fullmatch(r'[A-Za-z_][\w.]*', s):
            if s in self.syms:
                return self.syms[s]
            if pass2:
                raise AsmError(f'undefined symbol {s}')
            return 0, None
        raise AsmError(f'bad expression {s!r}')

    def cpu_insn(self, mn, opnd, pc, m8, x8, pass2):
        size = None
        if '.' in mn:
            mn, suf = mn.split('.')
            size = {'b': 1, 'w': 2, 'l': 3}[suf]
        if mn not in MNEMONICS:
            raise AsmError(f'unknown mnemonic {mn}')
        o = opnd.strip()
        modes = {md for (n, md) in ENCODE if n == mn}

        def sized(expr, cands):
            v, sz = self.value(expr, pass2)
            if size:
                sz = size
            if sz is None:
                sz = 2 if mn in ('jsr', 'jmp') else 3
            for md, s in cands:
                if s == sz and md in modes:
                    return md, v, sz
            for md, s in cands:
                if md in modes:
                    return md, v, s
            raise AsmError(f'no mode for {mn} {o}')

        if o == '':
            md, v, nb = ('imp', 0, 0)
        elif o == 'a':
            md, v, nb = 'acc', 0, 0
        elif o.startswith('#'):
            md = next(x for x in ('immm', 'immx', 'imm8') if x in modes)
            v, _ = self.value(o[1:], pass2)
            nb = 1 if md == 'imm8' else (1 if (m8 if md == 'immm' else x8) else 2)
        elif mn in BRANCH8 or mn in ('brl', 'per'):
            md = 'rel8' if mn in BRANCH8 else 'rel16'
            t, _ = self.value(o, pass2)
            nb = 1 if md == 'rel8' else 2
            d = (t & 0xffff) - ((pc + 1 + nb) & 0xffff)
            if d > 0x7fff: d -= 0x10000
            if d < -0x8000: d += 0x10000
            if pass2 and md == 'rel8' and not -128 <= d <= 127:
                raise AsmError(f'branch out of range ({d})')
            v = d & (0xff if nb == 1 else 0xffff)
        elif mn in ('mvn', 'mvp'):
            src, dst = o.split(',')
            v = self.value(dst, pass2)[0] | self.value(src, pass2)[0] << 8
            md, nb = 'bm', 2
        else:
            mm = re.fullmatch(r'\((.+),\s*x\)', o)
            if mm:
                md, v, nb = sized(mm.group(1), [('dpxind', 1), ('absxind', 2)])
            elif re.fullmatch(r'\((.+),\s*s\),\s*y', o):
                md, nb = 'sriy', 1; v = self.value(re.fullmatch(r'\((.+),\s*s\),\s*y', o).group(1), pass2)[0]
            elif re.fullmatch(r'\((.+)\),\s*y', o):
                md, nb = 'dpindy', 1; v = self.value(re.fullmatch(r'\((.+)\),\s*y', o).group(1), pass2)[0]
            elif re.fullmatch(r'\((.+)\)', o):
                md, v, nb = sized(o[1:-1], [('dpind', 1), ('pei', 1), ('absind', 2)])
            elif re.fullmatch(r'\[(.+)\],\s*y', o):
                md, nb = 'dplongy', 1; v = self.value(re.fullmatch(r'\[(.+)\],\s*y', o).group(1), pass2)[0]
            elif re.fullmatch(r'\[(.+)\]', o):
                md, v, nb = sized(o[1:-1], [('dplong', 1), ('abslong', 2)])
            elif re.fullmatch(r'(.+),\s*s', o):
                md, nb = 'sr', 1; v = self.value(o.rsplit(',', 1)[0], pass2)[0]
            elif re.fullmatch(r'(.+),\s*x', o):
                md, v, nb = sized(o.rsplit(',', 1)[0], [('dpx', 1), ('absx', 2), ('longx', 3)])
            elif re.fullmatch(r'(.+),\s*y', o):
                md, v, nb = sized(o.rsplit(',', 1)[0], [('dpy', 1), ('absy', 2)])
            else:
                md, v, nb = sized(o, [('dp', 1), ('abs', 2), ('long', 3), ('pea', 2)])
        op = ENCODE.get((mn, md))
        if op is None:
            raise AsmError(f'{mn} has no mode {md}')
        v &= (1 << (8 * nb)) - 1 if nb else 0
        return bytes([op] + [(v >> (8 * i)) & 0xff for i in range(nb)]), md, v

    def gsu_insn(self, mn, opnd, pc, pass2):
        o = opnd.replace(' ', '')
        if o == '':
            return bytes([GSU_ENC[(mn, None, 0)]])
        m = re.fullmatch(r'r(\d+)', o)
        if m:
            return bytes([GSU_ENC[(mn, 'r', int(m.group(1)))]])
        m = re.fullmatch(r'\(r(\d+)\)', o)
        if m:
            return bytes([GSU_ENC[(mn, '(r)', int(m.group(1)))]])
        m = re.fullmatch(r'#(\d+)', o)
        if m and mn not in ('ibt', 'iwt'):
            return bytes([GSU_ENC[(mn, '#n', int(m.group(1)))]])
        if mn in isagsu.BR:
            t, _ = self.value(o, pass2)
            d = (t & 0xffff) - ((pc + 2) & 0xffff)
            if d > 0x7fff: d -= 0x10000
            if d < -0x8000: d += 0x10000
            if pass2 and not -128 <= d <= 127:
                raise AsmError('gsu branch out of range')
            return bytes([GSU_ENC[(mn, 'rel', 0)], d & 0xff])
        m = re.fullmatch(r'r(\d+),#(.+)', o)
        if m and mn in ('ibt', 'iwt'):
            v, _ = self.value(m.group(2), pass2)
            op = GSU_ENC[(mn, mn, int(m.group(1)))]
            return bytes([op, v & 0xff]) if mn == 'ibt' else bytes([op, v & 0xff, (v >> 8) & 0xff])
        m = re.fullmatch(r'r(\d+),\((.+)\)', o)
        if m and mn in ('lm', 'lms'):
            v, _ = self.value(m.group(2), pass2)
            op = GSU_ENC[(mn, mn, int(m.group(1)))]
            return bytes([op, v >> 1]) if mn == 'lms' else bytes([op, v & 0xff, v >> 8])
        m = re.fullmatch(r'\((.+)\),r(\d+)', o)
        if m and mn in ('sm', 'sms'):
            v, _ = self.value(m.group(1), pass2)
            op = GSU_ENC[(mn, mn, int(m.group(2)))]
            return bytes([op, v >> 1]) if mn == 'sms' else bytes([op, v & 0xff, v >> 8])
        raise AsmError(f'bad gsu operand {mn} {opnd}')

    def run(self, lines, pass2):
        romptr = 0
        base = None
        m8 = x8 = True
        isa = 'cpu'
        alt = 0
        gb = False
        top = 0
        pending = []

        def pc():
            return base[0] + (romptr - base[1]) if base else lorom(romptr)

        def emit(data):
            nonlocal romptr, top
            if pass2:
                self.rom[romptr:romptr + len(data)] = data
            romptr += len(data)
            top = max(top, romptr)

        for path, ln, line, d in lines:
            try:
                m = re.fullmatch(r'([A-Za-z_][\w.]*):(.*)', line)
                if m:
                    name = m.group(1)
                    if not pass2:
                        if name in self.syms:
                            raise AsmError(f'duplicate label {name}')
                        self.syms[name] = (pc(), None)
                    line = m.group(2).strip()
                    if not line:
                        continue
                m = re.fullmatch(r'([A-Za-z_]\w*)\s*=\s*(.+)', line)
                if m:
                    self.syms[m.group(1)] = self.value(m.group(2), pass2)
                    continue
                if line.startswith('.'):
                    w = line.split(None, 1)
                    dname, arg = w[0], (w[1] if len(w) > 1 else '')
                    if dname == '.rombank':
                        romptr = self.value(arg, pass2)[0] * 0x8000; base = None
                    elif dname == '.base':
                        base = (self.value(arg, pass2)[0], romptr)
                    elif dname == '.endbase':
                        base = None
                    elif dname in ('.a8', '.a16'):
                        m8 = dname == '.a8'
                    elif dname in ('.i8', '.i16'):
                        x8 = dname == '.i8'
                    elif dname == '.cpu':
                        isa = 'cpu'
                    elif dname == '.gsu':
                        isa = 'gsu'; alt = 0; gb = False
                    elif dname == '.db':
                        emit(bytes(self.value(x, pass2)[0] & 0xff for x in arg.split(',')))
                    elif dname == '.dw':
                        out = bytearray()
                        for x in arg.split(','):
                            v = self.value(x, pass2)[0]; out += bytes([v & 0xff, (v >> 8) & 0xff])
                        emit(bytes(out))
                    elif dname == '.incbin':
                        fn = os.path.join(d, '..', arg.strip().strip('"'))
                        if os.path.exists(fn):
                            emit(open(fn, 'rb').read())
                        else:
                            lo, hi = os.path.splitext(os.path.basename(fn))[0].split('-')
                            emit(bytes(int(hi, 16) - int(lo, 16)))
                    else:
                        raise AsmError(f'unknown directive {dname}')
                    continue
                w = line.split(None, 1)
                mn = w[0].lower()
                opnd = w[1] if len(w) > 1 else ''
                addr = pc()
                if isa == 'cpu':
                    data, md, v = self.cpu_insn(mn, opnd, addr, m8, x8, pass2)
                    if pass2:
                        self.ir.append(dict(t='c', off=romptr, a=addr, op=data[0], mn=mn.split('.')[0], md=md, v=v, txt=line,
                                            n=len(data), m8=m8, x8=x8))
                else:
                    data = self.gsu_insn(mn, opnd, addr, pass2)
                    if pass2:
                        self.ir.append(dict(t='g', off=romptr, a=addr, op=data[0], mn=mn, n=len(data), alt=alt, txt=line,
                                            b=gb, ops=list(data[1:])))
                    op = data[0]
                    if op in (0x3d, 0x3e, 0x3f):
                        alt, gb = op - 0x3c, False
                    elif mn == 'with':
                        gb = True
                    elif mn in ('to', 'from') and not gb:
                        pass
                    elif mn in isagsu.BR:
                        pass
                    else:
                        alt, gb = 0, False
                emit(data)
            except AsmError as e:
                raise SystemExit(f'{path}:{ln}: {e}: {line}')
            except Exception as e:
                raise SystemExit(f'{path}:{ln}: {type(e).__name__} {e}: {line}')
        return top

def main():
    a = Assembler()
    lines = a.load(sys.argv[1], [])
    a.run(lines, False)
    top = a.run(lines, True)
    out = bytes(a.rom[:max(top, 0x8000)])
    open(sys.argv[2], 'wb').write(out)
    if len(sys.argv) > 3:
        with open(sys.argv[3], 'w') as f:
            json.dump(dict(ir=a.ir, syms={k: v[0] for k, v in a.syms.items()}), f)
    print(f'wrote {sys.argv[2]} ({len(out)} bytes, {len(a.ir)} instructions, {len(a.syms)} symbols)')

if __name__ == '__main__':
    main()
