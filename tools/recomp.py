import json
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
from layout import OVERLAYS

ENDS = {'bpl', 'bmi', 'bvc', 'bvs', 'bcc', 'bcs', 'bne', 'beq', 'bra', 'brl', 'jmp', 'jml', 'jsr', 'jsl',
        'rts', 'rtl', 'rti', 'brk', 'cop', 'wai', 'stp', 'mvn', 'mvp', 'plp', 'xce'}
COND = {'bpl': '!(cpu.p & FN)', 'bmi': '(cpu.p & FN)', 'bvc': '!(cpu.p & FV)', 'bvs': '(cpu.p & FV)',
        'bcc': '!(cpu.p & FC)', 'bcs': '(cpu.p & FC)', 'bne': '!(cpu.p & FZ)', 'beq': '(cpu.p & FZ)', 'bra': '1'}
LOADM = {'lda': 'op_lda', 'ora': 'op_ora', 'and': 'op_and', 'eor': 'op_eor', 'adc': 'op_adc', 'sbc': 'op_sbc',
         'cmp': 'op_cmp', 'bit': 'op_bit'}
LOADX = {'ldx': 'op_ldx', 'ldy': 'op_ldy', 'cpx': 'op_cpx', 'cpy': 'op_cpy'}
STORE = {'sta': 'op_sta', 'stx': 'op_stx', 'sty': 'op_sty', 'stz': 'op_stz'}
RMW = {'asl': 'R_ASL', 'lsr': 'R_LSR', 'rol': 'R_ROL', 'ror': 'R_ROR', 'inc': 'R_INC', 'dec': 'R_DEC',
       'tsb': 'R_TSB', 'trb': 'R_TRB'}
SIMPLE = {'tax': 'op_tax();', 'tay': 'op_tay();', 'txa': 'op_txa();', 'tya': 'op_tya();', 'txy': 'op_txy();',
          'tyx': 'op_tyx();', 'tsx': 'op_tsx();', 'txs': 'op_txs();', 'tcs': 'op_tcs();', 'tsc': 'op_tsc();',
          'tcd': 'op_tcd();', 'tdc': 'op_tdc();', 'xba': 'op_xba();', 'inx': 'op_inx();', 'iny': 'op_iny();',
          'dex': 'op_dex();', 'dey': 'op_dey();', 'pha': 'op_pha();', 'phx': 'op_phx();', 'phy': 'op_phy();',
          'pla': 'op_pla();', 'plx': 'op_plx();', 'ply': 'op_ply();', 'phb': 'op_phb();', 'phk': 'op_phk();',
          'phd': 'op_phd();', 'php': 'op_php();', 'plb': 'op_plb();', 'pld': 'op_pld();', 'plp': 'op_plp();',
          'xce': 'op_xce();', 'nop': 'IO();', 'clc': 'IO(); cpu.p &= ~FC;', 'sec': 'IO(); cpu.p |= FC;',
          'cli': 'IO(); cpu.p &= ~FI;', 'sei': 'IO(); cpu.p |= FI;', 'clv': 'IO(); cpu.p &= ~FV;',
          'cld': 'IO(); cpu.p &= ~FD;', 'sed': 'IO(); cpu.p |= FD;', 'wdm': '',
          'wai': 'IO(); IO(); cpu.wai = 1;', 'stp': 'IO(); IO(); cpu.stp = 1;'}

def ea(md, v, wr):
    return {
        'dp': (f'ea_dp(0x{v:02x})', 1), 'dpx': (f'ea_dpx(0x{v:02x})', 1), 'dpy': (f'ea_dpy(0x{v:02x})', 1),
        'dpind': (f'ea_dpind(0x{v:02x})', 0), 'dpxind': (f'ea_dpxind(0x{v:02x})', 0),
        'dpindy': (f'ea_dpindy(0x{v:02x}, {wr})', 0), 'dplong': (f'ea_dplong(0x{v:02x})', 0),
        'dplongy': (f'ea_dplongy(0x{v:02x})', 0), 'sr': (f'ea_sr(0x{v:02x})', 1), 'sriy': (f'ea_sriy(0x{v:02x})', 0),
        'abs': (f'ea_abs(0x{v:04x})', 0), 'absx': (f'ea_absi(0x{v:04x}, cpu.x, {wr})', 0),
        'absy': (f'ea_absi(0x{v:04x}, cpu.y, {wr})', 0), 'long': (f'0x{v:06x}', 0),
        'longx': (f'ea_longx(0x{v:06x})', 0),
    }[md]

def gen_insn(i, nxt16):
    mn, md, v, a = i['mn'], i['md'], i['v'], i['a']
    a16 = a & 0xffff
    if mn in SIMPLE and md in ('imp',):
        return SIMPLE[mn]
    if md == 'acc':
        return f'op_rmw_a({RMW[mn]});'
    if mn in LOADM:
        if md == 'immm':
            return f'op_bit_imm(0x{v:x});' if mn == 'bit' else f'{LOADM[mn]}(0x{v:x});'
        e, w = ea(md, v, 0)
        return f'{{ u32 a_ = {e}; {LOADM[mn]}(rdM(a_, {w})); }}'
    if mn in LOADX:
        if md == 'immx':
            return f'{LOADX[mn]}(0x{v:x});'
        e, w = ea(md, v, 0)
        return f'{{ u32 a_ = {e}; {LOADX[mn]}(rdX(a_, {w})); }}'
    if mn in STORE:
        e, w = ea(md, v, 1)
        return f'{STORE[mn]}({e}, {w});'
    if mn in RMW:
        e, w = ea(md, v, 1)
        return f'op_rmw({RMW[mn]}, {e}, {w});'
    if mn == 'rep':
        return f'op_rep(0x{v:02x});'
    if mn == 'sep':
        return f'op_sep(0x{v:02x});'
    if mn in COND:
        d = v - 256 if v >= 128 else v
        t = (nxt16 + d) & 0xffff
        return f'if ({COND[mn]}) {{ IO(); cpu.pc = 0x{t:04x}; }}'
    if mn == 'brl':
        d = v - 65536 if v >= 32768 else v
        return f'IO(); cpu.pc = 0x{(nxt16 + d) & 0xffff:04x};'
    if mn == 'per':
        d = v - 65536 if v >= 32768 else v
        return f'IO(); push16(0x{(nxt16 + d) & 0xffff:04x});'
    if mn == 'jmp':
        if md == 'abs':
            return f'cpu.pc = 0x{v:04x};'
        if md == 'absind':
            return f'cpu.pc = rd16(0x{v:04x}, 1);'
        return f'IO(); cpu.pc = rd16((cpu.pb << 16) | (u16)(0x{v:04x} + cpu.x), 1);'
    if mn == 'jml':
        if md == 'long':
            return f'cpu.pc = 0x{v & 0xffff:04x}; cpu.pb = 0x{v >> 16:02x};'
        return f'{{ u32 t_ = rd24(0x{v:04x}, 1); cpu.pc = (u16)t_; cpu.pb = t_ >> 16; }}'
    if mn == 'jsr':
        if md == 'abs':
            return f'IO(); push16(0x{(nxt16 - 1) & 0xffff:04x}); cpu.pc = 0x{v:04x};'
        return f'push16(0x{(nxt16 - 1) & 0xffff:04x}); IO(); cpu.pc = rd16((cpu.pb << 16) | (u16)(0x{v:04x} + cpu.x), 1);'
    if mn == 'jsl':
        return f'push8(cpu.pb); IO(); push16(0x{(nxt16 - 1) & 0xffff:04x}); cpu.pc = 0x{v & 0xffff:04x}; cpu.pb = 0x{v >> 16:02x};'
    if mn == 'rts':
        return 'IO(); IO(); cpu.pc = pull16() + 1; IO();'
    if mn == 'rtl':
        return 'IO(); IO(); cpu.pc = pull16() + 1; cpu.pb = pull8();'
    if mn == 'rti':
        return 'IO(); IO(); cpu.p = pull8(); fix_mode(); cpu.pc = pull16(); if (!cpu.e) cpu.pb = pull8();'
    if mn == 'brk':
        return 'cpu_interrupt(0xffe6, 0xfffe, true);'
    if mn == 'cop':
        return 'cpu_interrupt(0xffe4, 0xfff4, false);'
    if mn in ('mvn', 'mvp'):
        dst, src = v & 0xff, v >> 8
        return f'if (op_mv({1 if mn == "mvn" else 0}, 0x{dst:02x}, 0x{src:02x})) cpu.pc = 0x{a16:04x};'
    if mn == 'pea':
        return f'push16(0x{v:04x});'
    if mn == 'pei':
        return f'{{ dpio(); push16(rd16((u16)(cpu.d + 0x{v:02x}), 1)); }}'
    raise ValueError(f'unhandled {mn} {md}')

def wram_index(a):
    b, o = a >> 16, a & 0xffff
    if b in (0x7e, 0x7f):
        return a & 0x1ffff
    if (b & 0x7f) < 0x40 and o < 0x2000:
        return o
    return None

def main():
    ir = json.load(open(sys.argv[1]))['ir']
    syms = json.load(open(sys.argv[1]))['syms']
    out = sys.argv[2]
    os.makedirs(out, exist_ok=True)
    cpu = [i for i in ir if i['t'] == 'c']
    by_off = {i['off']: i for i in cpu}
    by_addr = {i['a']: i for i in cpu}
    lead = set()
    sym_addrs = set(syms.values())
    for i in cpu:
        if i['a'] in sym_addrs:
            lead.add(i['off'])
        if i['mn'] in ENDS:
            lead.add(i['off'] + i['n'])
            if i['mn'] in COND or i['mn'] == 'brl':
                v = i['v']
                d = (v - 256 if v >= 128 else v) if i['mn'] in COND else (v - 65536 if v >= 32768 else v)
                t = (i['a'] & 0xff0000) | ((i['a'] + i['n'] + d) & 0xffff)
                if t in by_addr:
                    lead.add(by_addr[t]['off'])
            if i['mn'] in ('jmp', 'jsr') and i['md'] == 'abs':
                t = (i['a'] & 0xff0000) | i['v']
                if t in by_addr:
                    lead.add(by_addr[t]['off'])
            if i['mn'] in ('jml', 'jsl') and i['v'] in by_addr:
                lead.add(by_addr[i['v']]['off'])

    files = {}
    entries = []
    nblocks = ninsn = 0
    for off in sorted(lead):
        if off not in by_off:
            continue
        first = by_off[off]
        m8, x8 = first['m8'], first['x8']
        body = []
        insns = []
        o = off
        while o in by_off:
            i = by_off[o]
            if insns and o in lead:
                break
            if i['md'] == 'immm' and i['m8'] != m8 or i['md'] == 'immx' and i['x8'] != x8:
                break
            a16 = i['a'] & 0xffff
            nxt16 = (a16 + i['n']) & 0xffff
            k = len(insns)
            if k:
                body.append('  if (rc_pending()) return;')
            insns.append((o, m8, x8))
            nb = i['n'] - 1
            last = (i['v'] >> (8 * (nb - 1))) & 0xff if nb else i['op']
            if i['mn'] == 'jsl':
                v = i['v']
                code = (f'cpu.pc = 0x{nxt16:04x}; FETCH(0x{a16:04x}, 3, 0x{(v >> 8) & 0xff:02x}); push8(cpu.pb); IO(); '
                        f'FETCH(0x{(a16 + 3) & 0xffff:04x}, 1, 0x{v >> 16:02x}); push16(0x{(nxt16 - 1) & 0xffff:04x}); '
                        f'cpu.pc = 0x{v & 0xffff:04x}; cpu.pb = 0x{v >> 16:02x};')
            else:
                code = f'cpu.pc = 0x{nxt16:04x}; FETCH(0x{a16:04x}, {i["n"]}, 0x{last:02x}); {gen_insn(i, nxt16)}'
            body.append(f'e{k}: {code}  // {i["a"]:06x}: {i.get("txt", i["mn"])}')
            if i['mn'] == 'rep':
                m8 = m8 and not (i['v'] & 0x20); x8 = x8 and not (i['v'] & 0x10)
            elif i['mn'] == 'sep':
                m8 = m8 or bool(i['v'] & 0x20); x8 = x8 or bool(i['v'] & 0x10)
            o += i['n']
            if i['mn'] in ENDS:
                break
            if o in by_off and by_off[o]['a'] != i['a'] + i['n']:
                break
        if not insns:
            continue
        a = first['a']
        name = f'rc_{a:06x}_{int(first["m8"])}{int(first["x8"])}'
        bank = off >> 15
        head = ''
        if len(insns) > 1:
            head = '  switch (e) {' + ''.join(f' case {k}: goto e{k};' for k in range(1, len(insns))) + ' }\n'
        files.setdefault(bank, []).append(f'void {name}(int e) {{\n{head}' + '\n'.join(body) + '\n}\n')
        def decodes_same(k, m8, x8):
            for io, _, _ in insns[k:]:
                i = by_off[io]
                if i['md'] == 'immm' and i['m8'] != m8 or i['md'] == 'immx' and i['x8'] != x8:
                    return False
                if i['mn'] == 'rep':
                    m8 = m8 and not (i['v'] & 0x20); x8 = x8 and not (i['v'] & 0x10)
                elif i['mn'] == 'sep':
                    m8 = m8 or bool(i['v'] & 0x20); x8 = x8 or bool(i['v'] & 0x10)
            return True
        for k, (io, im8, ix8) in enumerate(insns):
            ia = by_off[io]['a']
            wi = wram_index(ia)
            for fm8, fx8 in ((True, True), (True, False), (False, True), (False, False)):
                if (fm8, fx8) != (im8, ix8) and not decodes_same(k, fm8, fx8):
                    continue
                flags = int(fm8) * 2 + int(fx8)
                if wi is not None:
                    entries.append(((0x200000 + wi) * 4 + flags, io, o - io, name, k))
                else:
                    entries.append((io * 4 + flags, 0, 0, name, k))
        nblocks += 1
        ninsn += len(insns)
    for bank, funcs in files.items():
        with open(os.path.join(out, f'rc_bank{bank:02x}.c'), 'w', newline='\n') as f:
            f.write(f'// generated by tools/recomp.py from asm/bank{bank:02x}.s - do not edit\n#include "recomp.h"\n\n')
            f.write('\n'.join(funcs))
    with open(os.path.join(out, 'rc_table.c'), 'w', newline='\n') as f:
        f.write('// generated by tools/recomp.py - do not edit\n#include "recomp.h"\n\n')
        for name in sorted({e[3] for e in entries}):
            f.write(f'void {name}(int);\n')
        f.write('\nconst RcEntry rc_entries[] = {\n')
        for key, src, ln, name, k in entries:
            f.write(f'  {{ 0x{key:x}, 0x{src:x}, {ln}, {name}, {k} }},\n')
        f.write('};\nconst int rc_count = %d;\n' % len(entries))
    print(f'{nblocks} blocks, {ninsn} instructions, {len(files)} files')

def gsu_call(op, ops):
    n = op & 15
    hi = op >> 4
    if op <= 4:
        return ['g_stop();', 'g_nop();', 'g_cache();', 'g_lsr();', 'g_rol();'][op]
    if op <= 0x0f:
        d = ops[0] - 256 if ops[0] >= 128 else ops[0]
        return f'pipe(); g_branch(0x{op:02x}, {d});'
    if hi == 1: return f'g_to({n});'
    if hi == 2: return f'g_with({n});'
    if hi == 3:
        return f'g_stw({n});' if n < 12 else ['g_loop();', 'g_alt1();', 'g_alt2();', 'g_alt3();'][n - 12]
    if hi == 4:
        return f'g_ldw({n});' if n < 12 else ['g_plot();', 'g_swap();', 'g_color();', 'g_not();'][n - 12]
    if hi == 5: return f'g_add({n});'
    if hi == 6: return f'g_sub({n});'
    if hi == 7: return 'g_merge();' if n == 0 else f'g_and({n});'
    if hi == 8: return f'g_mult({n});'
    if hi == 9:
        if n == 0: return 'g_sbk();'
        if n <= 4: return f'g_link({n});'
        if n <= 7: return ['g_sex();', 'g_asr();', 'g_ror();'][n - 5]
        if n <= 13: return f'g_jmp({n});'
        return 'g_lob();' if n == 14 else 'g_fmult();'
    if hi == 0xa: return f'pipe(); g_ibt({n}, 0x{ops[0]:02x});'
    if hi == 0xb: return f'g_from({n});'
    if hi == 0xc: return 'g_hib();' if n == 0 else f'g_or({n});'
    if hi == 0xd: return f'g_inc({n});' if n < 15 else 'g_getc();'
    if hi == 0xe: return f'g_dec({n});' if n < 15 else 'g_getb();'
    return f'pipe(); pipe(); g_iwt({n}, 0x{ops[0] | ops[1] << 8:04x});'

GSU_HOOKS = {0xa681, 0xa355, 0x8a91}

def gen_gsu(ir, out):
    gi = sorted((i for i in ir if i['t'] == 'g'), key=lambda i: i['off'])
    by_off = {i['off']: i for i in gi}
    funcs = []
    entries = []
    k0 = 0
    blocks = []
    cur = []
    for i in gi:
        if cur and (i['off'] != cur[-1]['off'] + cur[-1]['n'] or len(cur) >= 256 or cur[-1]['op'] == 0):
            blocks.append(cur); cur = []
        cur.append(i)
    if cur:
        blocks.append(cur)
    for blk in blocks:
        name = f'grc_{blk[0]["a"]:06x}'
        lines = []
        if len(blk) > 1:
            lines.append('  switch (e) {' + ''.join(f' case {k}: goto e{k};' for k in range(1, len(blk))) + ' }')
        for k, i in enumerate(blk):
            if k:
                lines.append('  if (!(g.sfr & SG) || g.clock >= master_clock) return;')
            call = gsu_call(i['op'], i['ops'])
            ds = by_off.get(i['off'] + i['n'])
            if ds is not None and ds['n'] == 1:
                delay = (f'if ((g.sfr & SG) && g.clock < master_clock) {{ peekpipe(); {gsu_call(ds["op"], [])} '
                         f'if (!g.r15mod) g.r[15]++; }} ')
            else:
                delay = ''
            hook = f'GSU_HOOK(0x{i["off"]:x}); ' if i['off'] in GSU_HOOKS else ''
            lines.append(f'e{k}: {hook}peekpipe(); {call} if (g.r15mod) {{ {delay}return; }} g.r[15]++;'
                         f'  // {i["a"]:06x}: {i.get("txt", i["mn"])}')
            entries.append((i['off'], name, k))
        funcs.append(f'void {name}(int e) {{\n' + '\n'.join(lines) + '\n}\n')
    with open(os.path.join(out, 'gsu_code.c'), 'w', newline='\n') as f:
        f.write('// generated by tools/recomp.py from the SuperFX code in asm/ - do not edit\n#include "gsu_ops.h"\n\n')
        f.write('\n'.join(funcs))
        f.write('\ntypedef struct { u32 key; void (*fn)(int); int idx; } GrcEntry;\nconst GrcEntry grc_entries[] = {\n')
        for off, name, k in entries:
            f.write(f'  {{ 0x{off:x}, {name}, {k} }},\n')
        f.write('};\nconst int grc_count = %d;\n' % len(entries))
    print(f'gsu: {len(blocks)} blocks, {len(entries)} instructions')

if __name__ == '__main__':
    main()
    gen_gsu(json.load(open(sys.argv[1]))['ir'], sys.argv[2])
    with open(os.path.join(sys.argv[2], 'build_id.c'), 'w', newline='\n') as f:
        f.write('const char build_id[] = "%s";\n' % os.environ.get('BUILD_ID', ''))
