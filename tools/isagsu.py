PREFIX = {0x3d: 'alt1', 0x3e: 'alt2', 0x3f: 'alt3'}
BR = ['bra', 'bge', 'blt', 'bne', 'beq', 'bpl', 'bmi', 'bcc', 'bcs', 'bvc', 'bvs']
_ALU = {5: ('add', 'adc', 'add', 'adc'), 6: ('sub', 'sbc', 'sub', 'cmp'), 7: ('and', 'bic', 'and', 'bic'),
        8: ('mult', 'umult', 'mult', 'umult'), 0xc: ('or', 'xor', 'or', 'xor')}

def decode(op, alt):
    hi, n = op >> 4, op & 15
    if op <= 4:
        return (['stop', 'nop', 'cache', 'lsr', 'rol'][op], None, 0)
    if op <= 0x0f:
        return (BR[op - 5], 'rel', 0)
    if hi == 1:
        return ('to', 'r', n)
    if hi == 2:
        return ('with', 'r', n)
    if hi == 3:
        if n < 12:
            return ('stb' if alt & 1 else 'stw', '(r)', n)
        return (['loop', 'alt1', 'alt2', 'alt3'][n - 12], None, 0)
    if hi == 4:
        if n < 12:
            return ('ldb' if alt & 1 else 'ldw', '(r)', n)
        if n == 12:
            return ('rpix' if alt & 1 else 'plot', None, 0)
        if n == 13:
            return ('swap', None, 0)
        if n == 14:
            return ('cmode' if alt & 1 else 'color', None, 0)
        return ('not', None, 0)
    if hi == 7 and n == 0:
        return ('merge', None, 0)
    if hi == 0xc and n == 0:
        return ('hib', None, 0)
    if hi in _ALU:
        m = _ALU[hi][alt]
        imm = (alt & 2) and not (hi == 6 and alt == 3)
        return (m, '#n' if imm else 'r', n)
    if hi == 9:
        if n == 0: return ('sbk', None, 0)
        if n <= 4: return ('link', '#n', n)
        if n == 5: return ('sex', None, 0)
        if n == 6: return ('div2' if alt & 1 else 'asr', None, 0)
        if n == 7: return ('ror', None, 0)
        if n <= 13: return ('ljmp' if alt & 1 else 'jmp', 'r', n)
        if n == 14: return ('lob', None, 0)
        return ('lmult' if alt & 1 else 'fmult', None, 0)
    if hi == 0xa:
        if alt & 1: return ('lms', 'lms', n)
        if alt & 2: return ('sms', 'sms', n)
        return ('ibt', 'ibt', n)
    if hi == 0xb:
        return ('from', 'r', n)
    if hi == 0xd:
        if n < 15: return ('inc', 'r', n)
        if not alt & 2: return ('getc', None, 0)
        return ('romb' if alt & 1 else 'ramb', None, 0)
    if hi == 0xe:
        if n < 15: return ('dec', 'r', n)
        return (['getb', 'getbh', 'getbl', 'getbs'][alt], None, 0)
    if alt & 1: return ('lm', 'lm', n)
    if alt & 2: return ('sm', 'sm', n)
    return ('iwt', 'iwt', n)

def oplen(kind):
    return {'rel': 2, 'ibt': 2, 'lms': 2, 'sms': 2, 'iwt': 3, 'lm': 3, 'sm': 3}.get(kind, 1)

def next_alt(op, alt):
    if op == 0x3d: return 1
    if op == 0x3e: return 2
    if op == 0x3f: return 3
    hi = op >> 4
    if hi in (1, 2, 0xb) or 5 <= op <= 0x0f:
        return alt
    return 0

def encode(mn, kind, n):
    for op in range(256):
        for alt in range(4):
            m, k, nn = decode(op, alt)
            if m == mn and nn == n and (k == kind or (kind is None and k is None)):
                return op
    raise KeyError((mn, kind, n))
