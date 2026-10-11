.rombank $01

.gsu
    iwt r15,#gsu_018ebc
    nop
    iwt r15,#gsu_018938
    nop
    iwt r15,#gsu_018709
    nop
    iwt r15,#gsu_018a4b
    nop
    iwt r15,#gsu_018c31
    nop
    iwt r15,#gsu_018d14
    nop
    iwt r15,#gsu_0186e7
    nop
    iwt r15,#gsu_0186ec
    nop
    iwt r15,#gsu_018700
    nop
    iwt r15,#gsu_0186e7
    nop
    iwt r15,#gsu_018ba4
    nop
    iwt r15,#gsu_0186e7
    nop
    iwt r15,#gsu_01919a
    nop
    iwt r15,#gsu_018790
    nop
    iwt r15,#gsu_0189af
    nop
    iwt r15,#gsu_018b81
    nop
    iwt r15,#gsu_018b9f
    nop
    iwt r15,#gsu_018b91
    nop
    iwt r15,#gsu_0186e7
    nop
    iwt r15,#gsu_018709
    nop
    iwt r15,#gsu_018ca2
    nop
    iwt r15,#gsu_018c8f
    nop
    ibt r6,#$00
    ibt r4,#$00
    ibt r12,#$08
    iwt r13,#$8062
    with r3
    add r3
    with r4
    rol
    with r3
    add r3
    with r4
    rol
    with r6
    add r6
    from r6
    add r6
    alt3
    cmp r4
    bcs gsu_018075
    with r4
    alt1
    sbc r0
    inc r6

gsu_018075:
    loop
    with r3
    jmp r11
    nop
    iwt r5,#$ffff
    iwt r4,#$7fff
    link #4
    iwt r15,#gsu_018086
    nop
    stop
    .db $01

gsu_018086:
    ibt r6,#$00
    ibt r8,#$00
    ibt r12,#$10
    iwt r13,#$8090
    with r5
    add r5
    with r4
    rol
    with r8
    rol
    with r5
    add r5
    with r4
    rol
    with r8
    rol
    with r6
    add r6
    from r6
    to r7
    add r6
    from r7
    sub r8
    bcs gsu_0180a8
    with r8
    alt1
    sbc r7
    inc r6

gsu_0180a8:
    loop
    with r5
    jmp r11
    nop
    iwt r1,#$0100
    iwt r2,#$0100
    iwt r3,#$7d00
    link #4
    iwt r15,#gsu_0180c5
    nop
    stop
    .db $01

gsu_0180bc:
    from r4
    to r1
    sub r1
    from r5
    to r2
    sub r2
    from r6
    to r3
    sub r3

gsu_0180c5:
    from r11
    stw (r10)
    inc r10
    inc r10
    with r1
    to r6
    from r1
    alt1
    lmult
    with r4
    to r5
    with r2
    to r6
    from r2
    to r6
    alt1
    lmult
    with r5
    add r4
    alt1
    adc r6
    with r3
    to r6
    from r3
    to r6
    alt1
    lmult
    with r5
    add r4
    alt1
    adc r6
    with r0
    from r0
    bne gsu_0180f9
    nop
    with r5
    from r5
    bne gsu_0180f9
    nop
    ibt r1,#$00
    ibt r2,#$00
    ibt r3,#$00
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_0180f9:
    with r0
    to r4
    link #4
    iwt r15,#gsu_018086
    nop
    with r6
    to r0
    ibt r9,#$00

gsu_018104:
    lsr
    beq gsu_01810b
    nop
    bra gsu_018104
    inc r9

gsu_01810b:
    sub r0
    iwt r4,#$7fff
    with r12
    from r9
    beq gsu_01811a
    nop
    with r15
    to r13
    with r4
    add r4
    loop
    rol

gsu_01811a:
    with r6
    to r6
    link #4
    iwt r15,#gsu_018183
    nop
    with r4
    to r6
    from r1
    to r7
    alt1
    lmult
    with r4
    to r1
    from r2
    to r8
    alt1
    lmult
    with r4
    to r2
    from r3
    alt1
    lmult
    with r4
    to r3
    with r12
    from r9
    beq gsu_018148
    nop
    with r15
    to r13
    with r7
    asr
    with r1
    ror
    with r8
    asr
    with r2
    ror
    asr
    with r3
    ror
    loop
    nop

gsu_018148:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01814d:
    cache
    from r5
    to r7
    alt1
    xor r6
    sub r0
    with r6
    from r6
    bpl gsu_018159
    to r6
    sub r6

gsu_018159:
    with r5
    from r5
    bpl gsu_018162
    to r4
    sub r4
    to r5
    alt1
    sbc r5

gsu_018162:
    with r4
    add r4
    from r5
    rol
    ibt r12,#$10
    with r15
    to r13
    sub r6
    bcc gsu_018175
    nop
    with r4
    rol
    loop
    rol
    bra gsu_01817a
    nop

gsu_018175:
    add r6
    with r4
    add r4
    loop
    rol

gsu_01817a:
    with r7
    from r7
    bpl gsu_018181
    with r4
    not
    inc r4

gsu_018181:
    jmp r11
    nop

gsu_018183:
    with r0
    from r0
    bmi gsu_01818d
    nop
    with r6
    from r6
    bpl gsu_018192
    nop

gsu_01818d:
    with r6
    lsr
    lsr
    with r4
    ror

gsu_018192:
    ibt r12,#$10
    with r4
    add r4
    rol
    with r15
    to r13
    sub r6
    bcc gsu_0181a3
    nop
    with r4
    rol
    loop
    rol
    jmp r11
    lsr

gsu_0181a3:
    add r6
    with r4
    add r4
    loop
    rol
    jmp r11
    lsr
    iwt r10,#$04c2
    alt1
    lms r1,($062)
    alt1
    lms r2,($02c)
    link #4
    iwt r15,#gsu_0181be
    nop
    alt2
    sms ($040),r0
    nop
    stop
    .db $01

gsu_0181be:
    from r11
    stw (r10)
    inc r10
    inc r10
    from r14
    stw (r10)
    inc r10
    inc r10
    with r6
    from r1
    bpl gsu_0181ce
    nop
    with r6
    not
    inc r6

gsu_0181ce:
    with r0
    from r2
    bpl gsu_0181d5
    nop
    not
    inc r0

gsu_0181d5:
    bne gsu_0181df
    nop
    iwt r0,#$4000
    iwt r15,#gsu_018223
    nop

gsu_0181df:
    ibt r5,#$00
    alt3
    cmp r6
    bne gsu_0181ed
    nop
    iwt r0,#$2000
    iwt r15,#gsu_018223
    nop

gsu_0181ed:
    blt gsu_0181f7
    nop
    with r6
    to r4
    with r0
    to r6
    with r4
    to r0
    dec r5

gsu_0181f7:
    ibt r4,#$00
    lsr
    with r4
    ror
    lsr
    with r4
    ror
    link #4
    iwt r15,#gsu_018192
    nop
    sub r0
    alt3
    romb
    from r4
    lsr
    lsr
    lsr
    lsr
    lsr
    alt3
    bic #1
    iwt r4,#$a44b
    to r14
    add r4
    getb
    inc r14
    alt1
    getbh
    with r5
    from r5
    bmi gsu_018223
    nop
    not
    inc r0
    iwt r4,#$4000
    add r4

gsu_018223:
    from r1
    to r4
    alt1
    xor r2
    bpl gsu_01822c
    nop
    not
    inc r0

gsu_01822c:
    with r2
    from r2
    bpl gsu_018235
    nop
    iwt r4,#$8000
    add r4

gsu_018235:
    dec r10
    dec r10
    to r14
    ldw (r10)
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    cache
    alt1
    lms r1,($062)
    alt1
    lms r2,($02c)
    alt1
    lms r3,($02e)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    alt2
    sms ($026),r0
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    alt2
    sms ($028),r0
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    alt2
    sms ($02a),r0
    stop
    .db $01
    iwt r9,#$00d2
    link #4
    iwt r15,#gsu_01829f
    nop
    stop
    .db $01

gsu_01829f:
    sub r0
    alt2
    ramb
    alt3
    romb
    alt1
    lms r1,($020)
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r12
    add r2
    iwt r14,#$4000
    with r1
    add r14
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r8
    add r2
    alt1
    lms r1,($022)
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r4
    add r2
    iwt r14,#$4000
    with r1
    add r14
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r3
    add r2
    alt1
    lms r1,($024)
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r7
    add r2
    iwt r14,#$4000
    with r1
    add r14
    iwt r6,#$99e5
    from r1
    hib
    add r0
    to r14
    add r6
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    getb
    inc r14
    alt1
    getbh
    to r6
    sub r2
    from r1
    lob
    swap
    lsr
    fmult
    rol
    to r5
    add r2
    with r5
    to r6
    from r4
    fmult
    to r1
    rol
    from r3
    fmult
    to r2
    rol
    with r7
    to r6
    from r4
    fmult
    to r13
    rol
    from r3
    fmult
    to r14
    rol
    with r12
    to r6
    from r13
    fmult
    rol
    add r2
    stw (r9)
    inc r9
    inc r9
    from r1
    fmult
    rol
    sub r14
    stw (r9)
    inc r9
    inc r9
    with r8
    to r6
    from r4
    fmult
    rol
    stw (r9)
    inc r9
    inc r9
    from r7
    fmult
    rol
    stw (r9)
    inc r9
    inc r9
    from r5
    fmult
    rol
    stw (r9)
    inc r9
    inc r9
    from r12
    not
    inc r0
    stw (r9)
    inc r9
    inc r9
    with r12
    to r6
    from r14
    fmult
    rol
    sub r1
    stw (r9)
    inc r9
    inc r9
    from r2
    fmult
    rol
    add r13
    stw (r9)
    inc r9
    inc r9
    with r8
    to r6
    from r3
    fmult
    rol
    stw (r9)
    jmp r11
    nop
    ibt r0,#$ff
    color
    ibt r1,#$00
    ibt r2,#$40
    ibt r12,#$20
    with r15
    to r13
    loop
    plot
    stop
    .db $01,$60,$3e,$df,$3f,$df,$fa,$c2,$04,$3d,$a0,$14,$3a,$da,$da,$f1
    .db $80,$00,$51,$60,$90,$94,$ff,$6b,$84,$01,$3d,$a0,$10,$4d,$4f,$d0
    .db $90,$3d,$a0,$11,$4d,$4f,$d0,$90,$3d,$a0,$12,$4d,$4f,$d0,$90,$ea
    .db $ea,$4a,$3e,$a0,$14,$94,$ff,$79,$84,$01,$00,$01,$60,$3e,$df,$3f
    .db $df,$fa,$c2,$04,$3d,$f4,$1a,$00,$ae,$12,$b4,$1e,$5e,$ef,$de,$3d
    .db $ef,$3e,$a0,$25,$ae,$07,$b4,$1e,$5e,$ef,$3e,$a0,$19,$ae,$00,$b4
    .db $1e,$5e,$ef,$de,$3d,$ef,$3e,$a0,$0b,$ae,$02,$b4,$1e,$5e,$ef,$3e
    .db $a0,$0e,$ae,$03,$b4,$1e,$5e,$ef,$de,$3d,$ef,$3e,$a0,$0c,$f0,$00
    .db $80,$94,$ff,$84,$84,$01,$00,$01

gsu_018456:
    alt1
    lms r0,($1a2)
    lob
    beq gsu_018479
    nop
    from r11
    stw (r10)
    inc r10
    inc r10
    link #4
    iwt r15,#gsu_01846b
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01846b:
    iwt r2,#$1000
    iwt r1,#$2000
    alt1
    lms r0,($054)
    and r2
    or r1
    bra gsu_018484
    nop

gsu_018479:
    from r11
    stw (r10)
    inc r10
    inc r10
    dec r10
    dec r10
    to r11
    ldw (r10)
    iwt r0,#$8000

gsu_018484:
    alt2
    sms ($054),r0
    from r11
    stw (r10)
    inc r10
    inc r10
    ibt r0,#$03
    alt3
    romb
    ibt r0,#$03
    alt3
    romb
    alt1
    lms r14,($050)
    alt1
    lms r0,($1a4)
    lob
    beq gsu_0184a5
    nop
    dec r0
    add r0
    add r0
    iwt r2,#$8f9a
    to r14
    add r2

gsu_0184a5:
    alt1
    lms r1,($02a)
    sub r0
    alt1
    getbh
    inc r14
    add r1
    bpl gsu_0184ba
    nop
    iwt r0,#$8b2a
    iwt r2,#$0000
    iwt r15,#gsu_0184e4
    nop

gsu_0184ba:
    sub r0
    alt1
    getbh
    inc r14
    add r1
    bpl gsu_0184cc
    nop
    iwt r0,#$8b42
    iwt r2,#$0020
    iwt r15,#gsu_0184e4
    nop

gsu_0184cc:
    sub r0
    alt1
    getbh
    inc r14
    add r1
    bpl gsu_0184de
    nop
    iwt r0,#$8b5a
    iwt r2,#$0040
    iwt r15,#gsu_0184e4
    nop

gsu_0184de:
    iwt r0,#$8b72
    iwt r2,#$0060

gsu_0184e4:
    alt2
    sms ($04c),r0
    alt1
    lms r0,($04e)
    add r2
    alt2
    sms ($052),r0
    cache
    ibt r0,#$01
    alt1
    lms r12,($032)
    with r12
    from r12
    beq gsu_0184fd
    nop
    with r15
    to r13
    loop
    add r0

gsu_0184fd:
    alt2
    sms ($030),r0
    alt1
    lms r1,($020)
    from r1
    lob
    swap
    not
    inc r0
    sbk
    alt1
    lms r2,($022)
    from r2
    lob
    swap
    not
    inc r0
    sbk
    alt1
    lms r3,($024)
    from r3
    lob
    swap
    not
    inc r0
    sbk
    from r1
    or r3
    beq gsu_018524
    nop
    iwt r15,#gsu_0185de
    nop

gsu_018524:
    or r2
    bne gsu_018575
    nop
    alt1
    lms r0,($0d2)
    alt2
    sms ($120),r0
    alt1
    lms r0,($0d4)
    alt2
    sms ($122),r0
    alt1
    lms r0,($0d6)
    alt2
    sms ($124),r0
    alt1
    lms r0,($0d8)
    alt2
    sms ($126),r0
    alt1
    lms r0,($0da)
    alt2
    sms ($128),r0
    alt1
    lms r0,($0dc)
    alt2
    sms ($12a),r0
    alt1
    lms r0,($0de)
    alt2
    sms ($12c),r0
    alt1
    lms r0,($0e0)
    alt2
    sms ($12e),r0
    alt1
    lms r0,($0e2)
    alt2
    sms ($130),r0
    alt1
    lms r0,($054)
    iwt r1,#$2000
    and r1
    beq gsu_018571
    sub r0
    alt2
    sms ($126),r0
    alt2
    sms ($128),r0
    alt2
    sms ($12a),r0

gsu_018571:
    iwt r15,#gsu_018615
    nop

gsu_018575:
    iwt r4,#$0040
    from r2
    sub r4
    bne gsu_018581
    nop
    iwt r15,#gsu_0185de
    nop

gsu_018581:
    sub r4
    bne gsu_0185de
    nop
    alt1
    lms r0,($0d2)
    not
    inc r0
    alt2
    sms ($120),r0
    alt1
    lms r0,($0d4)
    not
    inc r0
    alt2
    sms ($122),r0
    alt1
    lms r0,($0d6)
    not
    inc r0
    alt2
    sms ($124),r0
    alt1
    lms r0,($0d8)
    alt2
    sms ($126),r0
    alt1
    lms r0,($0da)
    alt2
    sms ($128),r0
    alt1
    lms r0,($0dc)
    alt2
    sms ($12a),r0
    alt1
    lms r0,($0de)
    not
    inc r0
    alt2
    sms ($12c),r0
    alt1
    lms r0,($0e0)
    not
    inc r0
    alt2
    sms ($12e),r0
    alt1
    lms r0,($0e2)
    not
    inc r0
    alt2
    sms ($130),r0
    alt1
    lms r0,($054)
    iwt r1,#$2000
    and r1
    beq gsu_0185da
    sub r0
    alt2
    sms ($126),r0
    alt2
    sms ($128),r0
    alt2
    sms ($12a),r0

gsu_0185da:
    iwt r15,#gsu_018615
    nop

gsu_0185de:
    iwt r9,#$0104
    link #4
    iwt r15,#gsu_01829f
    nop
    iwt r9,#$0104
    link #4
    iwt r15,#gsu_0194fe
    nop
    alt1
    lms r0,($054)
    iwt r1,#$2000
    and r1
    beq gsu_01860d
    sub r0
    alt2
    sms ($106),r0
    alt2
    sms ($10c),r0
    alt2
    sms ($112),r0
    iwt r9,#$0120
    link #4
    iwt r15,#gsu_01952e
    nop
    iwt r15,#gsu_018615
    nop

gsu_01860d:
    iwt r9,#$0120
    link #4
    iwt r15,#gsu_01952e
    nop

gsu_018615:
    iwt r0,#$49e5
    alt2
    sms ($0ee),r0
    iwt r0,#$49e5
    alt2
    sms ($0f0),r0
    iwt r0,#$49e5
    alt2
    sms ($0f2),r0
    alt1
    lms r1,($0ee)
    alt1
    lms r2,($0f0)
    alt1
    lms r3,($0f2)
    alt1
    lms r6,($120)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($122)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($124)
    from r3
    fmult
    rol
    add r5
    hib
    sex
    alt2
    sms ($0f4),r0
    alt1
    lms r6,($126)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($128)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($12a)
    from r3
    fmult
    rol
    add r5
    hib
    sex
    alt2
    sms ($0f6),r0
    alt1
    lms r6,($12c)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($12e)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($130)
    from r3
    fmult
    rol
    add r5
    hib
    sex
    alt2
    sms ($0f8),r0
    alt1
    lms r0,($032)
    alt2
    sub #3
    bpl gsu_0186c9
    nop
    iwt r2,#$0121
    to r1
    alt1
    ldb (r2)
    inc r2
    inc r2
    alt1
    ldb (r2)
    swap
    or r1
    alt2
    sms ($116),r0
    inc r2
    inc r2
    to r1
    alt1
    ldb (r2)
    inc r2
    inc r2
    alt1
    ldb (r2)
    swap
    or r1
    alt2
    sms ($118),r0
    inc r2
    inc r2
    to r1
    alt1
    ldb (r2)
    inc r2
    inc r2
    alt1
    ldb (r2)
    swap
    or r1
    alt2
    sms ($11a),r0
    inc r2
    inc r2
    to r1
    alt1
    ldb (r2)
    inc r2
    inc r2
    alt1
    ldb (r2)
    swap
    or r1
    alt2
    sms ($11c),r0
    inc r2
    inc r2
    alt1
    ldb (r2)
    alt2
    sms ($11e),r0

gsu_0186c9:
    sub r0
    alt2
    sms ($132),r0
    iwt r0,#$05c2
    alt2
    sms ($01e),r0
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($016)
    alt2
    sms ($01a),r14
    iwt r0,#$8ebc
    stw (r10)
    inc r10
    inc r10
    to r15
    getb
    inc r14

gsu_0186e7:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_0186ec:
    to r1
    getb
    inc r14
    alt1
    lms r0,($044)
    ibt r2,#$3f
    and r2

gsu_0186f5:
    alt3
    cmp r1
    bmi gsu_0186fd
    nop
    bra gsu_0186f5
    sub r1

gsu_0186fd:
    add r0
    with r14
    add r0

gsu_018700:
    getb
    inc r14
    alt1
    getbh
    with r14
    add r0
    to r15
    getb
    inc r14

gsu_018709:
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    sbk
    alt1
    lms r9,($01e)
    alt2
    sms ($012),r10
    alt1
    lms r10,($120)
    alt1
    lms r11,($126)
    alt1
    lms r13,($12c)
    alt1
    lms r4,($122)
    alt1
    lms r7,($128)
    alt1
    lms r8,($12e)
    cache

gsu_01872a:
    to r1
    getb
    inc r14
    with r1
    alt1
    getbh
    inc r14
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    inc r14
    with r10
    to r6
    from r1
    fmult
    to r5
    rol
    with r11
    to r6
    from r2
    fmult
    rol
    with r5
    add r0
    with r13
    to r6
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    with r4
    to r6
    from r1
    fmult
    to r5
    rol
    with r7
    to r6
    from r2
    fmult
    rol
    with r5
    add r0
    with r8
    to r6
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($124)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($12a)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($130)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    dec r12
    bne gsu_01872a
    inc r9
    alt2
    sms ($01e),r9
    alt1
    lms r10,($012)
    to r15
    getb
    inc r14

gsu_018790:
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    add r12
    sbk
    alt1
    lms r9,($01e)
    cache
    with r15
    to r13
    to r1
    getb
    inc r14
    with r1
    alt1
    getbh
    inc r14
    to r2
    getb
    inc r14
    with r2
    alt1
    getbh
    inc r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    inc r14
    alt1
    lms r6,($120)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($126)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($12c)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    alt1
    lms r6,($122)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($128)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($12e)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    alt1
    lms r6,($124)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($12a)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($130)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    with r9
    alt2
    add #6
    loop
    nop
    alt2
    sms ($01e),r9
    to r15
    getb
    inc r14

gsu_01881f:
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    sbk
    alt1
    lms r9,($01e)
    alt1
    lms r8,($030)
    cache
    with r15
    to r13
    getb
    inc r14
    to r1
    mult r8
    getb
    inc r14
    to r2
    mult r8
    getb
    inc r14
    to r3
    mult r8
    alt1
    lms r6,($120)
    from r1
    alt1
    lmult
    with r4
    to r7
    alt1
    lms r6,($126)
    from r2
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    alt1
    lms r6,($12c)
    from r3
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    with r7
    add r7
    rol
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($122)
    from r1
    alt1
    lmult
    with r4
    to r7
    alt1
    lms r6,($128)
    from r2
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    alt1
    lms r6,($12e)
    from r3
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    with r7
    add r7
    rol
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($124)
    from r1
    alt1
    lmult
    with r4
    to r7
    alt1
    lms r6,($12a)
    from r2
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    alt1
    lms r6,($130)
    from r3
    to r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r5
    with r7
    add r7
    rol
    stw (r9)
    inc r9
    loop
    inc r9
    alt2
    sms ($01e),r9
    to r15
    getb
    inc r14

gsu_0188af:
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    add r12
    sbk
    alt1
    lms r9,($01e)
    cache
    with r15
    to r13
    alt1
    lms r8,($030)
    getb
    inc r14
    to r1
    mult r8
    getb
    inc r14
    to r2
    mult r8
    getb
    inc r14
    to r3
    mult r8
    alt1
    lms r6,($120)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($126)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($12c)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    alt1
    lms r6,($122)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($128)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($12e)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    alt1
    lms r6,($124)
    from r1
    fmult
    to r8
    rol
    alt1
    lms r6,($12a)
    from r2
    fmult
    to r5
    rol
    alt1
    lms r6,($130)
    from r3
    fmult
    rol
    add r5
    add r8
    stw (r9)
    sub r8
    sub r8
    with r9
    alt2
    add #6
    stw (r9)
    with r9
    alt2
    sub #4
    with r9
    alt2
    add #6
    loop
    nop
    alt2
    sms ($01e),r9
    to r15
    getb
    inc r14

gsu_018938:
    alt1
    lms r0,($032)
    alt2
    sub #3
    bmi gsu_018944
    nop
    iwt r15,#gsu_01881f
    nop

gsu_018944:
    nop
    alt1
    lms r11,($01e)
    alt1
    lms r5,($116)
    alt1
    lms r6,($118)
    alt1
    lms r7,($11a)
    alt1
    lms r8,($11c)
    alt1
    lms r9,($11e)
    alt1
    lms r1,($030)
    from r9
    lob
    swap
    to r9
    or r1
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    sbk
    cache
    with r15
    to r13
    to r1
    getb
    inc r14
    from r5
    to r4
    mult r1
    to r2
    getb
    inc r14
    from r6
    hib
    mult r2
    to r4
    add r4
    to r3
    getb
    inc r14
    from r8
    mult r3
    add r4
    add r0
    hib
    mult r9
    stw (r11)
    inc r11
    inc r11
    from r5
    hib
    to r4
    mult r1
    from r7
    mult r2
    to r4
    add r4
    from r8
    hib
    mult r3
    add r4
    add r0
    hib
    mult r9
    stw (r11)
    inc r11
    inc r11
    from r6
    to r4
    mult r1
    from r7
    hib
    mult r2
    to r4
    add r4
    from r9
    hib
    mult r3
    add r4
    add r0
    hib
    mult r9
    stw (r11)
    inc r11
    loop
    inc r11
    alt2
    sms ($01e),r11
    to r15
    getb
    inc r14

gsu_0189af:
    alt1
    lms r0,($032)
    alt2
    sub #3
    bmi gsu_0189bb
    nop
    iwt r15,#gsu_0188af
    nop

gsu_0189bb:
    nop
    alt1
    lms r11,($01e)
    alt1
    lms r5,($116)
    alt1
    lms r6,($118)
    alt1
    lms r7,($11a)
    alt1
    lms r8,($11c)
    alt1
    lms r9,($11e)
    alt1
    lms r1,($030)
    from r9
    lob
    swap
    to r9
    or r1
    to r12
    getb
    inc r14
    alt1
    lms r0,($132)
    add r12
    add r12
    sbk
    cache

gsu_0189e0:
    to r1
    getb
    inc r14
    from r5
    to r13
    mult r1
    to r2
    getb
    inc r14
    from r6
    hib
    to r4
    mult r2
    to r3
    getb
    inc r14
    from r8
    mult r3
    to r4
    add r4
    from r4
    add r13
    add r0
    hib
    mult r9
    stw (r11)
    with r11
    alt2
    add #6
    from r4
    sub r13
    add r0
    hib
    mult r9
    stw (r11)
    with r11
    alt2
    sub #4
    from r5
    hib
    to r13
    mult r1
    from r7
    to r4
    mult r2
    from r8
    hib
    mult r3
    to r4
    add r4
    from r4
    add r13
    add r0
    hib
    mult r9
    stw (r11)
    with r11
    alt2
    add #6
    from r4
    sub r13
    add r0
    hib
    mult r9
    stw (r11)
    with r11
    alt2
    sub #4
    from r6
    to r13
    mult r1
    from r7
    hib
    to r4
    mult r2
    from r9
    hib
    mult r3
    to r4
    add r4
    from r4
    add r13
    add r0
    hib
    mult r9
    stw (r11)
    with r11
    alt2
    add #6
    from r4
    sub r13
    add r0
    hib
    mult r9
    stw (r11)
    inc r11
    inc r11
    dec r12
    bne gsu_0189e0
    nop
    alt2
    sms ($01e),r11
    to r15
    getb
    inc r14

gsu_018a4b:
    alt1
    lms r3,($026)
    alt1
    lms r11,($028)
    alt1
    lms r9,($02a)
    ibt r0,#$14
    alt3
    romb
    sub r0
    alt2
    sms ($138),r0
    iwt r7,#$05c2
    iwt r8,#$07a2
    alt2
    sms ($01a),r14
    alt1
    lms r12,($132)
    cache
    with r15
    to r13
    ldw (r7)
    inc r7
    inc r7
    to r1
    add r3
    ldw (r7)
    inc r7
    inc r7
    to r2
    add r11
    ldw (r7)
    inc r7
    inc r7
    to r6
    add r9
    ibt r4,#$00
    iwt r0,#$3000
    sub r6
    bpl gsu_018a86
    nop
    iwt r6,#$2fff

gsu_018a86:
    iwt r0,#$0100
    sub r6
    bmi gsu_018a91
    nop
    iwt r15,#gsu_018af5
    nop

gsu_018a91:
    with r6
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r6
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    with r4
    to r14
    from r1
    fmult
    rol
    alt1
    lms r1,($034)
    add r1
    with r0
    to r1
    stw (r8)
    inc r8
    inc r8
    from r2
    fmult
    rol
    alt1
    lms r2,($036)
    add r2
    with r0
    to r2
    stw (r8)
    inc r8
    inc r8
    with r14
    to r4
    with r0
    from r1
    bmi gsu_018ac8
    nop
    alt1
    lms r5,($03a)
    sub r5
    bmi gsu_018ac9
    nop
    inc r4

gsu_018ac8:
    inc r4

gsu_018ac9:
    with r4
    alt2
    mult #4
    with r0
    from r2
    bmi gsu_018ad9
    nop
    alt1
    lms r5,($03e)
    sub r5
    bmi gsu_018ada
    nop
    inc r4

gsu_018ad9:
    inc r4

gsu_018ada:
    ibt r0,#$1f
    alt1
    xor r4
    swap
    or r4
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r6,($138)
    or r6
    loop
    sbk
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)
    iwt r15,#gsu_018b57
    nop

gsu_018af5:
    with r0
    from r6
    bpl gsu_018b05
    nop
    ibt r4,#$04
    with r1
    not
    inc r1
    with r2
    not
    inc r2
    with r6
    not
    inc r6

gsu_018b05:
    from r6
    add r6
    add r0
    add r0
    to r6
    add r0
    with r1
    from r1
    bmi gsu_018b1e
    nop
    iwt r0,#$0400
    alt3
    cmp r1
    bpl gsu_018b29
    nop
    iwt r1,#$0400
    bra gsu_018b29
    nop

gsu_018b1e:
    iwt r0,#$fc00
    alt3
    cmp r1
    bmi gsu_018b29
    nop
    iwt r1,#$fc00

gsu_018b29:
    with r2
    from r2
    bmi gsu_018b3c
    nop
    iwt r0,#$0400
    alt3
    cmp r2
    bpl gsu_018b47
    nop
    iwt r2,#$0400
    bra gsu_018b47
    nop

gsu_018b3c:
    iwt r0,#$fc00
    alt3
    cmp r2
    bmi gsu_018b47
    nop
    iwt r2,#$fc00

gsu_018b47:
    from r1
    add r1
    add r0
    add r0
    to r1
    add r0
    from r2
    add r2
    add r0
    add r0
    to r2
    add r0
    iwt r15,#gsu_018a91
    nop

gsu_018b57:
    alt1
    lms r0,($138)
    iwt r1,#$1f00
    and r1
    alt3
    cmp r1
    beq gsu_018b67
    nop
    iwt r15,#gsu_018ecb
    nop

gsu_018b67:
    alt1
    lms r1,($138)
    ibt r0,#$1f
    and r1
    bne gsu_018b78
    nop
    alt1
    lms r0,($054)
    iwt r1,#$4000
    or r1
    sbk

gsu_018b78:
    alt1
    lms r14,($018)
    alt2
    sms ($01a),r14
    to r15
    getb
    inc r14

gsu_018b81:
    iwt r1,#$0b02
    alt2
    sms ($056),r1
    iwt r0,#$8c08
    stw (r10)
    inc r10
    inc r10
    cache
    to r15
    getb
    inc r14

gsu_018b91:
    getb
    inc r14
    alt1
    getbh
    add r14
    alt1
    lms r1,($056)
    stw (r1)
    inc r1
    inc r1
    alt2
    sms ($056),r1

gsu_018b9f:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_018ba4:
    getb
    inc r14
    iwt r1,#$0e72
    add r1
    alt1
    ldb (r0)
    swap
    with r0
    from r0
    bmi gsu_018bd0
    nop
    inc r14
    inc r14
    from r14
    stw (r10)
    inc r10
    inc r10
    getb
    lob
    beq gsu_018bc8
    nop
    to r14
    add r14
    from r15
    alt2
    add #5
    stw (r10)
    inc r10
    inc r10
    to r15
    getb
    inc r14

gsu_018bc8:
    dec r10
    dec r10
    to r14
    ldw (r10)
    inc r14
    to r15
    getb
    inc r14

gsu_018bd0:
    getb
    inc r14
    alt1
    getbh
    to r12
    add r14
    inc r14
    from r14
    stw (r10)
    inc r10
    inc r10
    inc r14
    from r12
    stw (r10)
    inc r10
    inc r10
    from r15
    alt2
    add #5
    stw (r10)
    inc r10
    inc r10
    to r15
    getb
    inc r14
    dec r10
    dec r10
    ldw (r10)
    alt1
    lms r1,($056)
    stw (r1)
    inc r1
    inc r1
    alt2
    sms ($056),r1
    dec r10
    dec r10
    to r14
    ldw (r10)
    getb
    lob
    beq gsu_018c03
    nop
    to r14
    add r14
    to r15
    getb
    inc r14

gsu_018c03:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    sub r0
    alt1
    lms r1,($056)
    stw (r1)
    iwt r0,#$0b02
    alt2
    sms ($056),r0

gsu_018c13:
    alt1
    lms r1,($056)
    to r14
    ldw (r1)
    inc r1
    inc r1
    alt2
    sms ($056),r1
    with r14
    from r14
    beq gsu_018c2d
    from r15
    alt2
    add #5
    stw (r10)
    inc r10
    inc r10
    to r15
    getb
    inc r14
    bra gsu_018c13
    nop

gsu_018c2d:
    iwt r15,#gsu_018ebc
    nop

gsu_018c31:
    to r12
    getb
    inc r14
    iwt r0,#$f4be
    add r12
    add r14
    alt2
    sms ($13e),r0
    alt2
    sms ($13c),r12
    alt2
    sms ($136),r12
    iwt r9,#$05c6
    iwt r5,#$0b42
    with r15
    to r13
    getb
    inc r14
    alt3
    umult #6
    add r9
    ldw (r0)
    stw (r5)
    inc r5
    loop
    inc r5

gsu_018c54:
    iwt r5,#$0b42
    iwt r7,#$8000
    alt1
    lms r12,($136)
    with r15
    to r13
    ldw (r5)
    alt3
    cmp r7
    blt gsu_018c69
    nop
    with r0
    to r7
    with r5
    to r6

gsu_018c69:
    inc r5
    loop
    inc r5
    iwt r0,#$8000
    stw (r6)
    alt1
    lms r0,($13e)
    to r14
    add r6
    getb
    inc r14
    alt1
    getbh
    with r0
    to r14
    from r15
    alt2
    add #5
    stw (r10)
    inc r10
    inc r10
    to r15
    getb
    inc r14
    alt1
    lms r0,($13c)
    dec r0
    bne gsu_018c54
    sbk
    iwt r15,#gsu_018ebc
    nop

gsu_018c8f:
    getb
    inc r14
    iwt r1,#$0e72
    add r1
    alt1
    ldb (r0)
    swap
    hib
    bmi gsu_018ca2
    nop
    inc r14
    inc r14
    inc r14
    to r15
    getb
    inc r14

gsu_018ca2:
    getb
    inc r14
    to r3
    alt3
    umult #6
    iwt r1,#$07a2
    from r3
    to r2
    add r1
    ldw (r2)
    inc r2
    inc r2
    alt2
    sms ($0a8),r0
    ldw (r2)
    alt2
    sms ($0aa),r0
    iwt r1,#$07a2
    iwt r1,#$05c6
    from r3
    add r1
    ldw (r0)
    alt1
    lms r1,($02a)
    add r1
    alt2
    sms ($0ac),r0
    iwt r1,#$0020
    sub r1
    bmi gsu_018d02
    nop
    link #4
    iwt r15,#gsu_01904f
    nop
    inc r14
    getb
    inc r14
    alt1
    lms r0,($0c2)
    lob
    inc r0
    alt2
    sms ($0b6),r0
    iwt r1,#$0100
    add r0
    swap
    bpl gsu_018ce8
    nop
    with r1
    lsr

gsu_018ce8:
    alt2
    sms ($0bc),r1
    alt2
    sms ($01a),r14
    sub r0
    alt2
    sms ($0c0),r0
    link #4
    iwt r15,#gsu_01a787
    nop
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)
    to r15
    getb
    inc r14

gsu_018d02:
    inc r14
    inc r14
    to r15
    getb
    inc r14

gsu_018d07:
    inc r0
    lob
    beq gsu_018d0f
    nop
    to r15
    getb
    inc r14

gsu_018d0f:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_018d14:
    ibt r0,#$70
    color
    ibt r0,#$02
    alt1
    cmode
    getb
    lob
    bmi gsu_018d07
    inc r14
    ibt r1,#$3f
    to r2
    and r1
    alt2
    sms ($134),r2
    dec r2
    dec r2
    beq gsu_018d54
    inc r14
    dec r14
    getb
    with r14
    alt2
    add #7
    iwt r1,#$0e72
    add r1
    alt1
    ldb (r0)
    swap
    hib
    bmi gsu_018d51
    nop
    alt1
    lms r0,($048)
    with r0
    from r0
    beq gsu_018d48
    nop
    iwt r15,#gsu_018f3a
    nop

gsu_018d48:
    alt1
    lms r0,($134)
    dec r0
    dec r0
    with r14
    bra gsu_018d14
    add r0

gsu_018d51:
    with r14
    alt2
    sub #6

gsu_018d54:
    link #4
    iwt r15,#gsu_01904f
    nop
    with r14
    alt2
    add #4
    alt1
    lms r0,($048)
    with r0
    from r0
    beq gsu_018d68
    nop
    iwt r15,#gsu_018ece
    nop

gsu_018d68:
    alt1
    lms r0,($054)
    iwt r1,#$4000
    and r1
    iwt r15,#gsu_018dd7
    nop
    iwt r9,#$07a2
    iwt r6,#$0982
    alt1
    lms r12,($134)
    with r15
    to r13
    to r4
    getb
    inc r14
    from r4
    alt3
    umult #6
    to r8
    add r9
    ldw (r8)
    stw (r6)
    inc r6
    inc r6
    inc r8
    inc r8
    ldw (r8)
    stw (r6)
    inc r6
    inc r6
    alt1
    lms r0,($042)
    with r0
    from r0
    beq gsu_018dcb
    nop
    inc r0
    beq gsu_018dac
    nop
    iwt r0,#$0e22
    add r4
    alt1
    ldb (r0)
    stw (r6)
    inc r6
    inc r6
    stw (r6)
    inc r6
    inc r6
    iwt r15,#gsu_018dcb
    nop

gsu_018dac:
    alt2
    sms ($01a),r14
    ibt r0,#$03
    alt3
    romb
    alt1
    lms r14,($082)
    getb
    inc r14
    stw (r6)
    inc r6
    inc r6
    getb
    inc r14
    stw (r6)
    inc r6
    inc r6
    alt2
    sms ($082),r14
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)

gsu_018dcb:
    loop
    nop
    alt2
    sms ($01a),r14
    alt1
    lms r0,($134)
    iwt r15,#gsu_018ea1
    nop

gsu_018dd7:
    iwt r9,#$07a2
    iwt r6,#$0982
    ibt r5,#$00
    alt1
    lms r12,($134)
    with r15
    to r13
    to r4
    getb
    inc r14
    from r4
    alt3
    umult #6
    to r8
    add r9
    ldw (r8)
    stw (r6)
    inc r6
    inc r6
    inc r8
    inc r8
    ldw (r8)
    stw (r6)
    inc r6
    inc r6
    inc r8
    inc r8
    ldw (r8)
    to r5
    or r5
    alt1
    lms r0,($042)
    with r0
    from r0
    beq gsu_018e36
    nop
    inc r0
    beq gsu_018e17
    nop
    iwt r0,#$0e22
    add r4
    alt1
    ldb (r0)
    stw (r6)
    inc r6
    inc r6
    stw (r6)
    inc r6
    inc r6
    iwt r15,#gsu_018e36
    nop

gsu_018e17:
    alt2
    sms ($01a),r14
    ibt r0,#$03
    alt3
    romb
    alt1
    lms r14,($082)
    getb
    inc r14
    stw (r6)
    inc r6
    inc r6
    getb
    inc r14
    stw (r6)
    inc r6
    inc r6
    alt2
    sms ($082),r14
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)

gsu_018e36:
    loop
    nop

gsu_018e38:
    alt2
    sms ($01a),r14
    from r5
    lob
    bne gsu_018e47
    nop
    alt1
    lms r0,($134)
    iwt r15,#gsu_018ea1
    nop

gsu_018e47:
    ibt r0,#$10
    and r5
    beq gsu_018e73
    nop
    iwt r1,#$1000
    from r1
    and r5
    sub r1
    bne gsu_018eb8
    nop
    alt1
    lms r0,($042)
    hib
    beq gsu_018e61
    nop
    iwt r15,#gsu_018eb8
    nop

gsu_018e61:
    alt1
    lms r0,($134)
    with r14
    sub r0
    link #4
    iwt r15,#gsu_019728
    nop
    with r0
    from r0
    beq gsu_018eb5
    nop
    bra gsu_018e86
    nop

gsu_018e73:
    iwt r1,#$0f00
    from r1
    and r5
    sub r1
    bne gsu_018eb8
    nop
    alt1
    lms r0,($042)
    hib
    bne gsu_018e94
    nop
    alt1
    lms r0,($134)

gsu_018e86:
    link #4
    iwt r15,#gsu_01a010
    nop
    with r0
    from r0
    beq gsu_018eb5
    nop
    iwt r15,#gsu_018ea1
    nop

gsu_018e94:
    alt1
    lms r0,($134)
    link #4
    iwt r15,#gsu_01988b
    nop
    with r0
    from r0
    beq gsu_018eb5
    nop

gsu_018ea1:
    alt2
    sms ($08e),r10
    ibt r1,#$00
    from r1
    alt3
    romb
    iwt r15,#gsu_01a66b
    nop

gsu_018ead:
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r10,($08e)

gsu_018eb5:
    alt1
    lms r14,($01a)

gsu_018eb8:
    iwt r15,#gsu_018d14
    nop

gsu_018ebc:
    ibt r1,#$00
    ibt r2,#$00
    alt1
    rpix
    nop
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    stop
    .db $01

gsu_018ecb:
    bra gsu_018ebc
    nop

gsu_018ece:
    link #4
    iwt r15,#gsu_018fbd
    nop

gsu_018ed3:
    getb
    inc r14
    alt3
    umult #6
    iwt r6,#$05c2
    to r7
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($062)
    to r1
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($02c)
    to r2
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($02e)
    to r3
    add r6
    link #4
    iwt r15,#gsu_019263
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r3,($138)
    or r3
    sbk
    alt1
    lms r0,($042)
    hib
    beq gsu_018f2c
    nop
    ibt r0,#$03
    alt3
    romb
    alt2
    sms ($01a),r14
    alt1
    lms r14,($082)
    getb
    inc r14
    stw (r8)
    inc r8
    inc r8
    getb
    inc r14
    stw (r8)
    inc r8
    inc r8
    alt2
    sms ($082),r14
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)

gsu_018f2c:
    alt1
    lms r0,($040)
    dec r0
    bne gsu_018ed3
    sbk
    alt1
    lms r5,($138)
    iwt r15,#gsu_018e38
    nop

gsu_018f3a:
    with r14
    alt2
    sub #6
    link #4
    iwt r15,#gsu_01904f
    nop
    with r14
    alt2
    add #4
    link #4
    iwt r15,#gsu_018fbd
    nop
    alt1
    lms r0,($134)
    with r14
    add r0
    dec r14

gsu_018f50:
    getb
    dec r14
    alt3
    umult #6
    iwt r6,#$05c2
    to r7
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($062)
    to r1
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($02c)
    to r2
    add r6
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r6,($02e)
    to r3
    add r6
    link #4
    iwt r15,#gsu_019263
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r3,($138)
    or r3
    sbk
    alt1
    lms r0,($042)
    hib
    beq gsu_018fa9
    nop
    ibt r0,#$03
    alt3
    romb
    alt2
    sms ($01a),r14
    alt1
    lms r14,($082)
    getb
    inc r14
    stw (r8)
    inc r8
    inc r8
    getb
    inc r14
    stw (r8)
    inc r8
    inc r8
    alt2
    sms ($082),r14
    alt1
    lms r0,($01c)
    alt3
    romb
    alt1
    lms r14,($01a)

gsu_018fa9:
    alt1
    lms r0,($040)
    dec r0
    bne gsu_018f50
    sbk
    alt1
    lms r0,($134)
    with r14
    add r0
    inc r14
    alt1
    lms r5,($138)
    iwt r15,#gsu_018e38
    nop

gsu_018fbd:
    sub r0
    alt2
    sms ($042),r0
    with r14
    alt2
    sub #3
    alt1
    lms r9,($048)
    to r1
    alt3
    getbs
    inc r14
    to r2
    alt3
    getbs
    inc r14
    to r3
    alt3
    getbs
    inc r14
    with r1
    not
    inc r1
    with r3
    not
    inc r3
    alt1
    lms r6,($120)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($126)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($12c)
    from r3
    fmult
    rol
    add r5
    mult r9
    asr
    asr
    alt1
    lms r6,($026)
    add r6
    alt2
    sms ($062),r0
    alt1
    lms r6,($122)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($128)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($12e)
    from r3
    fmult
    rol
    add r5
    with r0
    from r0
    bmi gsu_019016
    nop
    not
    inc r0

gsu_019016:
    mult r9
    asr
    asr
    alt1
    lms r6,($028)
    add r6
    alt2
    sms ($02c),r0
    alt1
    lms r6,($124)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($12a)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($130)
    from r3
    fmult
    rol
    add r5
    mult r9
    asr
    asr
    alt1
    lms r6,($02a)
    add r6
    alt2
    sms ($02e),r0
    sub r0
    alt2
    sms ($138),r0
    iwt r8,#$0982
    alt1
    lms r0,($134)
    alt2
    sms ($040),r0
    jmp r11
    nop

gsu_01904f:
    with r14
    to r2
    alt1
    lms r0,($054)
    iwt r1,#$2000
    to r1
    and r1
    beq gsu_019075
    nop
    iwt r1,#$1000
    and r1
    bne gsu_019075
    nop
    ibt r0,#$02
    alt1
    cmode
    ibt r0,#$09
    color
    sub r0
    alt2
    sms ($058),r0
    alt2
    sms ($042),r0
    iwt r15,#gsu_019191
    nop

gsu_019075:
    getb

gsu_019076:
    add r0
    ibt r1,#$03
    from r1
    alt3
    romb
    alt1
    lms r1,($04a)
    to r14
    add r1

gsu_019081:
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    with r3
    from r3
    bpl gsu_0190bc
    nop
    from r3
    add r3
    bpl gsu_0190aa
    nop
    iwt r0,#$fffe
    alt2
    sms ($042),r0
    from r3
    hib
    alt2
    and #15
    add r0
    add r0
    add r0
    add r0
    swap
    alt2
    or #8
    swap
    alt2
    sms ($058),r0
    iwt r15,#gsu_019191
    nop

gsu_0190aa:
    iwt r0,#$3fff
    to r14
    and r3
    alt1
    lms r0,($046)
    to r3
    getb
    dec r3
    and r3
    add r0
    inc r0
    to r14
    bra gsu_019081
    add r14

gsu_0190bc:
    sub r0
    alt2
    sms ($058),r0
    from r3
    add r3
    bpl gsu_0190c6
    sub r0
    dec r0

gsu_0190c6:
    alt2
    sms ($042),r0
    beq gsu_019111
    nop
    from r3
    lob
    bpl gsu_0190d7
    nop
    iwt r0,#$0400
    alt2
    sms ($058),r0

gsu_0190d7:
    from r3
    add r3
    lob
    lsr
    alt3
    umult #3
    iwt r1,#$8918
    to r14
    add r1
    getb
    inc r14
    alt1
    getbh
    inc r14
    alt2
    sms ($096),r0
    getb
    alt2
    sms ($094),r0
    from r3
    hib
    ibt r1,#$3f
    and r1
    add r0
    iwt r1,#$8a3e
    to r14
    add r1
    getb
    inc r14
    alt1
    getbh
    with r0
    to r14
    to r1
    getb
    inc r14
    with r1
    alt1
    getbh
    alt2
    sms ($0c2),r1
    inc r0
    inc r0
    alt2
    sms ($082),r0
    iwt r15,#gsu_019191
    nop

gsu_019111:
    ibt r1,#$3f
    from r3
    hib
    inc r0
    and r1
    bne gsu_01911e
    nop
    iwt r15,#gsu_01918e
    nop

gsu_01911e:
    inc r0
    and r1
    beq gsu_019127
    nop
    iwt r15,#gsu_019133
    nop

gsu_019127:
    from r3
    lob
    alt1
    lms r3,($052)
    to r14
    add r3
    getc
    iwt r15,#gsu_019191
    nop

gsu_019133:
    dec r0
    dec r0
    and r1
    with r0
    to r3
    alt1
    lms r0,($054)
    hib
    bpl gsu_01918e
    nop
    alt1
    lms r0,($04c)
    add r3
    to r14
    add r3
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    alt1
    lms r0,($01c)
    alt3
    romb
    with r2
    to r14
    inc r14
    getb
    inc r14
    alt1
    lms r4,($0f4)
    to r5
    mult r4
    getb
    inc r14
    alt1
    lms r4,($0f6)
    mult r4
    to r5
    add r5
    getb
    alt1
    lms r4,($0f8)
    mult r4
    add r5
    asr
    asr
    hib
    sex
    ibt r4,#$06
    alt3
    cmp r4
    bge gsu_019178
    nop
    ibt r0,#$06
    bra gsu_019181
    nop

gsu_019178:
    ibt r4,#$10
    alt3
    cmp r4
    blt gsu_019181
    nop
    ibt r0,#$0f

gsu_019181:
    to r1
    alt2
    sub #6
    ibt r0,#$03
    alt3
    romb
    from r6
    to r14
    add r1
    bra gsu_019191
    getc

gsu_01918e:
    from r3
    lob
    color

gsu_019191:
    alt1
    lms r0,($01c)
    alt3
    romb
    with r2
    to r14
    jmp r11
    nop

gsu_01919a:
    alt1
    lms r0,($054)
    iwt r1,#$4000
    and r1
    beq gsu_0191a8
    nop
    iwt r15,#gsu_01920b
    nop

gsu_0191a8:
    to r12
    getb
    inc r14
    iwt r9,#$07a2
    iwt r11,#$0e72
    cache
    with r15
    to r13
    getb
    inc r14
    alt2
    mult #6
    add r9
    to r1
    ldw (r0)
    inc r0
    inc r0
    to r2
    ldw (r0)
    inc r0
    inc r0
    to r5
    ldw (r0)
    getb
    inc r14
    alt2
    mult #6
    to r8
    add r9
    ldw (r8)
    inc r8
    inc r8
    to r3
    sub r1
    ldw (r8)
    inc r8
    inc r8
    to r7
    sub r2
    ldw (r8)
    to r5
    alt1
    xor r5
    getb
    inc r14
    alt2
    mult #6
    to r8
    add r9
    ldw (r8)
    inc r8
    inc r8
    to r1
    sub r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    sub r2
    ldw (r8)
    to r5
    alt1
    xor r5
    with r1
    to r6
    with r7
    alt1
    lmult
    with r4
    to r1
    with r3
    to r6
    with r2
    alt1
    lmult
    with r4
    sub r1
    with r2
    alt1
    sbc r7
    from r5
    add r5
    add r0
    add r0
    swap
    alt1
    xor r2
    hib
    alt1
    stb (r11)
    loop
    inc r11
    to r15
    getb
    inc r14

gsu_01920b:
    to r12
    getb
    inc r14
    iwt r9,#$07a2
    iwt r11,#$0e72
    cache
    with r15
    to r13
    getb
    inc r14
    alt3
    umult #6
    add r9
    to r1
    alt1
    ldb (r0)
    inc r0
    inc r0
    to r2
    alt1
    ldb (r0)
    getb
    inc r14
    alt3
    umult #6
    to r8
    add r9
    alt1
    ldb (r8)
    inc r8
    inc r8
    sub r1
    to r3
    asr
    alt1
    ldb (r8)
    sub r2
    to r7
    asr
    getb
    inc r14
    alt3
    umult #6
    to r8
    add r9
    alt1
    ldb (r8)
    inc r8
    inc r8
    sub r1
    to r1
    asr
    alt1
    ldb (r8)
    sub r2
    to r2
    asr
    from r1
    to r1
    mult r7
    from r3
    mult r2
    sub r1
    hib
    alt1
    stb (r11)
    loop
    inc r11
    to r15
    getb
    inc r14
    dec r14
    getb
    with r14
    alt2
    add #7
    iwt r1,#$0e72
    add r1
    alt1
    ldb (r0)
    jmp r11
    swap

gsu_019263:
    from r11
    stw (r10)
    inc r10
    inc r10
    with r3
    from r3
    bpl gsu_019270
    nop
    iwt r15,#gsu_019333
    nop

gsu_019270:
    nop
    bne gsu_019275
    nop
    inc r3

gsu_019275:
    ibt r5,#$00
    with r1
    from r1
    bmi gsu_0192d0
    nop
    with r2
    from r2
    bmi gsu_0192a4
    nop
    from r1
    sub r2
    bcc gsu_01928f
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    iwt r15,#gsu_0193f0
    nop

gsu_01928f:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    iwt r15,#gsu_0193f0
    nop

gsu_0192a4:
    with r2
    not
    inc r2
    from r1
    sub r2
    bcc gsu_0192b8
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_0192b8:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_0192d0:
    with r1
    not
    inc r1
    with r2
    from r2
    bmi gsu_019301
    nop
    from r1
    sub r2
    bcc gsu_0192e9
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_0192e9:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_019301:
    with r2
    not
    inc r2
    from r1
    sub r2
    bcc gsu_019318
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r2
    not
    inc r2
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_019318:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r2
    not
    inc r2
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_019333:
    with r3
    not
    inc r3
    ibt r5,#$04
    with r1
    from r1
    bmi gsu_01939d
    nop
    with r2
    from r2
    bmi gsu_019371
    nop
    from r1
    sub r2
    bcc gsu_019356
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    not
    inc r1
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_019356:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r1
    not
    inc r1
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_019371:
    with r2
    not
    inc r2
    from r1
    sub r2
    bcc gsu_019385
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_019385:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r1
    not
    inc r1
    iwt r15,#gsu_0193f0
    nop

gsu_01939d:
    with r1
    not
    inc r1
    with r2
    from r2
    bmi gsu_0193ce
    nop
    from r1
    sub r2
    bcc gsu_0193b6
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_0193b6:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    with r2
    not
    inc r2
    iwt r15,#gsu_0193f0
    nop

gsu_0193ce:
    with r2
    not
    inc r2
    from r1
    sub r2
    bcc gsu_0193df
    nop
    link #4
    iwt r15,#gsu_01942f
    nop
    iwt r15,#gsu_0193f0
    nop

gsu_0193df:
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2
    link #4
    iwt r15,#gsu_01942f
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2

gsu_0193f0:
    cache
    alt1
    lms r0,($034)
    with r1
    add r0
    alt1
    lms r0,($036)
    with r2
    add r0
    alt1
    lms r0,($038)
    sub r1
    bge gsu_01940a
    nop
    alt1
    lms r0,($03a)
    sub r1
    bge gsu_01940b
    nop
    inc r5

gsu_01940a:
    inc r5

gsu_01940b:
    with r5
    alt2
    mult #4
    alt1
    lms r0,($03c)
    sub r2
    bge gsu_01941d
    nop
    alt1
    lms r0,($03e)
    sub r2
    bge gsu_01941e
    nop
    inc r5

gsu_01941d:
    inc r5

gsu_01941e:
    ibt r0,#$1f
    alt1
    xor r5
    swap
    or r5
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    with r1
    to r0
    with r2
    to r1
    with r0
    to r2

gsu_01942f:
    from r11
    stw (r10)
    inc r10
    inc r10
    from r1
    lob
    to r4
    swap
    from r1
    hib
    alt3
    cmp r3
    bcs gsu_019473
    nop
    with r3
    to r6
    link #4
    iwt r15,#gsu_019493
    nop
    iwt r0,#$3fff
    sub r4
    bcc gsu_019462
    nop
    with r4
    to r1
    from r2
    lob
    to r4
    swap
    from r2
    hib
    with r3
    to r6
    link #4
    iwt r15,#gsu_019493
    nop
    with r4
    to r2
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_019462:
    with r4
    to r1
    from r2
    lob
    to r4
    swap
    from r2
    hib
    with r3
    to r6
    link #4
    iwt r15,#gsu_019493
    nop
    with r4
    to r2

gsu_019473:
    ibt r4,#$00
    from r2
    lsr
    with r4
    ror
    lsr
    with r4
    ror
    with r4
    sub r2
    ibt r6,#$00
    alt1
    sbc r6
    with r1
    to r6
    link #4
    iwt r15,#gsu_019493
    nop
    with r4
    to r2
    iwt r1,#$3fff
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_019493:
    with r0
    from r0
    bmi gsu_01949d
    nop
    with r6
    from r6
    bpl gsu_0194a2
    nop

gsu_01949d:
    with r6
    lsr
    lsr
    with r4
    ror

gsu_0194a2:
    ibt r12,#$10
    with r4
    add r4
    rol
    with r15
    to r13
    sub r6
    bcc gsu_0194b3
    nop
    with r4
    rol
    loop
    rol
    jmp r11
    lsr

gsu_0194b3:
    add r6
    with r4
    add r4
    loop
    rol
    jmp r11
    lsr
    from r11
    stw (r10)
    inc r10
    inc r10
    alt2
    sms ($040),r0
    sub r0
    alt2
    sms ($138),r0

gsu_0194c5:
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r9,($026)
    to r1
    add r9
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r9,($028)
    to r2
    add r9
    ldw (r7)
    inc r7
    inc r7
    alt1
    lms r9,($02a)
    to r3
    add r9
    link #4
    iwt r15,#gsu_019263
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r3,($138)
    or r3
    sbk
    alt1
    lms r0,($040)
    dec r0
    bne gsu_0194c5
    sbk
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_0194fe:
    inc r9
    inc r9
    to r1
    ldw (r9)
    inc r9
    inc r9
    to r2
    ldw (r9)
    inc r9
    inc r9
    to r3
    ldw (r9)
    from r1
    stw (r9)
    with r9
    alt2
    sub #4
    from r3
    stw (r9)
    with r9
    alt2
    add #8
    to r1
    ldw (r9)
    inc r9
    inc r9
    to r3
    ldw (r9)
    from r2
    stw (r9)
    inc r9
    inc r9
    to r2
    ldw (r9)
    from r1
    stw (r9)
    with r9
    alt2
    sub #4
    from r2
    stw (r9)
    with r9
    alt2
    sub #6
    from r3
    stw (r9)
    jmp r11
    nop

gsu_01952e:
    alt1
    lms r1,($104)
    alt1
    lms r2,($106)
    alt1
    lms r3,($108)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r1,($10a)
    alt1
    lms r2,($10c)
    alt1
    lms r3,($10e)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r1,($110)
    alt1
    lms r2,($112)
    alt1
    lms r3,($114)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    stw (r9)
    jmp r11
    nop

gsu_01962a:
    from r11
    stw (r10)
    inc r10
    inc r10
    iwt r0,#$98e5
    to r14
    add r2
    getb
    to r5
    swap
    iwt r0,#$98a5
    to r14
    add r2
    getb
    to r9
    swap
    with r1
    to r6
    from r9
    to r8
    alt1
    lmult
    with r4
    to r7
    with r3
    to r6
    from r5
    alt1
    lmult
    with r7
    add r4
    alt1
    adc r8
    to r2
    asr
    with r3
    to r6
    from r9
    to r8
    alt1
    lmult
    with r4
    to r7
    with r1
    to r6
    from r5
    alt1
    lmult
    with r7
    sub r4
    alt1
    sbc r8
    to r3
    asr
    with r2
    to r1
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01966b:
    cache
    with r3
    from r3
    bmi gsu_019679
    nop
    with r6
    from r6
    bmi gsu_019682
    nop
    sub r0
    jmp r11
    nop

gsu_019679:
    with r6
    from r6
    bpl gsu_0196de
    nop
    ibt r0,#$ff
    jmp r11
    nop

gsu_019682:
    alt2
    sms ($088),r1
    alt2
    sms ($08a),r2
    alt2
    sms ($08c),r3
    with r1
    to r0
    with r4
    to r1
    with r0
    to r4
    with r2
    to r0
    with r5
    to r2
    with r0
    to r5
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6

gsu_01969d:
    from r3
    add r6
    alt1
    div2
    beq gsu_0196c5
    nop
    bmi gsu_0196b6
    nop
    with r0
    to r6
    from r1
    add r4
    to r4
    alt1
    div2
    from r2
    add r5
    to r5
    alt1
    div2
    bra gsu_01969d
    nop

gsu_0196b6:
    with r0
    to r3
    from r1
    add r4
    to r1
    alt1
    div2
    from r2
    add r5
    to r2
    alt1
    div2
    bra gsu_01969d
    nop

gsu_0196c5:
    with r0
    to r6
    from r1
    add r4
    to r4
    alt1
    div2
    from r2
    add r5
    to r5
    alt1
    div2
    alt1
    lms r1,($088)
    alt1
    lms r2,($08a)
    alt1
    lms r3,($08c)
    ibt r0,#$01
    jmp r11
    nop

gsu_0196de:
    alt2
    sms ($088),r4
    alt2
    sms ($08a),r5
    alt2
    sms ($08c),r6

gsu_0196e7:
    from r3
    add r6
    alt1
    div2
    beq gsu_01970f
    nop
    bmi gsu_019700
    nop
    with r0
    to r6
    from r1
    add r4
    to r4
    alt1
    div2
    from r2
    add r5
    to r5
    alt1
    div2
    bra gsu_0196e7
    nop

gsu_019700:
    with r0
    to r3
    from r1
    add r4
    to r1
    alt1
    div2
    from r2
    add r5
    to r2
    alt1
    div2
    bra gsu_0196e7
    nop

gsu_01970f:
    with r0
    to r3
    from r1
    add r4
    to r1
    alt1
    div2
    from r2
    add r5
    to r2
    alt1
    div2
    alt1
    lms r4,($088)
    alt1
    lms r5,($08a)
    alt1
    lms r6,($08c)
    ibt r0,#$01
    jmp r11
    nop

gsu_019728:
    from r11
    stw (r10)
    inc r10
    inc r10
    with r0
    to r9
    alt1
    lms r5,($026)
    alt1
    lms r6,($028)
    alt1
    lms r7,($02a)
    iwt r2,#$0982
    with r9
    to r12
    with r15
    to r13
    getb
    inc r14
    alt3
    umult #6
    iwt r1,#$05c2
    with r1
    add r0
    ldw (r1)
    inc r1
    inc r1
    add r5
    stw (r2)
    inc r2
    inc r2
    ldw (r1)
    inc r1
    inc r1
    add r6
    stw (r2)
    inc r2
    inc r2
    ldw (r1)
    add r7
    stw (r2)
    inc r2
    loop
    inc r2
    with r9
    to r9
    sub r0
    alt2
    sms ($040),r0
    iwt r7,#$0982
    iwt r8,#$0a02
    from r9
    alt2
    sub #2
    bne gsu_0197a9
    nop
    to r1
    ldw (r7)
    inc r7
    inc r7
    to r2
    ldw (r7)
    inc r7
    inc r7
    to r3
    ldw (r7)
    inc r7
    inc r7
    to r4
    ldw (r7)
    inc r7
    inc r7
    to r5
    ldw (r7)
    inc r7
    inc r7
    to r6
    ldw (r7)
    link #4
    iwt r15,#gsu_01966b
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    from r3
    stw (r8)
    inc r8
    inc r8
    from r4
    stw (r8)
    inc r8
    inc r8
    from r5
    stw (r8)
    inc r8
    inc r8
    from r6
    stw (r8)
    inc r8
    inc r8
    ibt r0,#$02
    alt2
    sms ($040),r0
    iwt r15,#gsu_01983b
    nop

gsu_0197a9:
    to r1
    ldw (r7)
    inc r7
    inc r7
    to r2
    ldw (r7)
    inc r7
    inc r7
    to r3
    ldw (r7)
    inc r7
    inc r7
    with r9
    to r0
    dec r0
    bne gsu_0197be
    nop
    iwt r7,#$0982

gsu_0197be:
    to r4
    ldw (r7)
    inc r7
    inc r7
    to r5
    ldw (r7)
    inc r7
    inc r7
    to r6
    ldw (r7)
    with r7
    alt2
    sub #4
    from r6
    and r3
    bpl gsu_0197d4
    nop
    iwt r15,#gsu_019827
    nop

gsu_0197d4:
    with r3
    from r3
    bpl gsu_0197dd
    nop
    iwt r15,#gsu_019811
    nop

gsu_0197dd:
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    from r3
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r0,($040)
    inc r0
    sbk
    with r6
    from r6
    bmi gsu_0197f7
    nop
    iwt r15,#gsu_019827
    nop

gsu_0197f7:
    link #4
    iwt r15,#gsu_01966b
    nop
    from r4
    stw (r8)
    inc r8
    inc r8
    from r5
    stw (r8)
    inc r8
    inc r8
    from r6
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r0,($040)
    inc r0
    sbk
    iwt r15,#gsu_019827
    nop

gsu_019811:
    link #4
    iwt r15,#gsu_01966b
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    from r3
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r0,($040)
    inc r0
    sbk

gsu_019827:
    dec r9
    beq gsu_01982f
    nop
    iwt r15,#gsu_0197a9
    nop

gsu_01982f:
    alt1
    lms r0,($040)
    alt2
    sub #3
    bpl gsu_01983b
    nop
    iwt r15,#gsu_019885
    nop

gsu_01983b:
    alt1
    lms r0,($040)
    with r0
    to r9
    sub r0
    alt2
    sms ($138),r0
    iwt r7,#$0a02
    iwt r8,#$0982

gsu_01984a:
    to r1
    ldw (r7)
    inc r7
    inc r7
    to r2
    ldw (r7)
    inc r7
    inc r7
    to r3
    ldw (r7)
    inc r7
    inc r7
    link #4
    iwt r15,#gsu_019263
    nop
    from r1
    stw (r8)
    inc r8
    inc r8
    from r2
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r3,($138)
    or r3
    sbk
    dec r9
    bne gsu_01984a
    nop
    alt1
    lms r0,($138)
    iwt r1,#$0f00
    and r1
    alt3
    cmp r1
    beq gsu_01987c
    nop
    iwt r15,#gsu_019885
    nop

gsu_01987c:
    nop
    alt1
    lms r0,($040)
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_019885:
    sub r0
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01988b:
    from r11
    stw (r10)
    inc r10
    inc r10
    ibt r1,#$03
    alt3
    cmp r1
    bpl gsu_01989a
    nop
    iwt r15,#gsu_019d34
    nop

gsu_01989a:
    alt2
    sms ($086),r0
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    alt1
    lms r0,($040)
    alt2
    mult #8
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)
    inc r0
    inc r0
    from r3
    stw (r0)
    inc r0
    inc r0
    from r6
    stw (r0)

gsu_0198cb:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r8
    alt2
    add #4
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($038)
    from r1
    sub r0
    blt gsu_0198eb
    nop
    iwt r15,#gsu_019900
    nop

gsu_0198eb:
    alt1
    lms r0,($038)
    from r3
    sub r0
    blt gsu_0198f7
    nop
    iwt r15,#gsu_019928
    nop

gsu_0198f7:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_0199a1
    nop

gsu_019900:
    alt1
    lms r0,($038)
    from r3
    sub r0
    blt gsu_01990c
    nop
    iwt r15,#gsu_01998a
    nop

gsu_01990c:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019928:
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($038)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    add #4
    to r6
    ldw (r8)
    with r8
    alt2
    sub #8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    to r2
    ldw (r8)
    with r8
    alt2
    add #8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_0199a1
    nop

gsu_01998a:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_0199a1:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_0199ad
    nop
    iwt r15,#gsu_0198cb
    nop

gsu_0199ad:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_0199b9
    nop
    iwt r15,#gsu_019d34
    nop

gsu_0199b9:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    alt1
    lms r0,($040)
    alt2
    mult #8
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)
    inc r0
    inc r0
    from r3
    stw (r0)
    inc r0
    inc r0
    from r6
    stw (r0)

gsu_0199e9:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r8
    alt2
    add #4
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03a)
    from r1
    sub r0
    alt2
    sub #1
    bge gsu_019a0b
    nop
    iwt r15,#gsu_019a22
    nop

gsu_019a0b:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    bge gsu_019a19
    nop
    iwt r15,#gsu_019a4c
    nop

gsu_019a19:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019ac5
    nop

gsu_019a22:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    bge gsu_019a30
    nop
    iwt r15,#gsu_019aae
    nop

gsu_019a30:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019a4c:
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($03a)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    add #4
    to r6
    ldw (r8)
    with r8
    alt2
    sub #8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    to r2
    ldw (r8)
    with r8
    alt2
    add #8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019ac5
    nop

gsu_019aae:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019ac5:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019ad1
    nop
    iwt r15,#gsu_0199e9
    nop

gsu_019ad1:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_019add
    nop
    iwt r15,#gsu_019d34
    nop

gsu_019add:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    alt1
    lms r0,($040)
    alt2
    mult #8
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)
    inc r0
    inc r0
    from r3
    stw (r0)
    inc r0
    inc r0
    from r6
    stw (r0)

gsu_019b0d:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r8
    alt2
    add #4
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03c)
    from r2
    sub r0
    blt gsu_019b2d
    nop
    iwt r15,#gsu_019b42
    nop

gsu_019b2d:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_019b39
    nop
    iwt r15,#gsu_019b6a
    nop

gsu_019b39:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019bea
    nop

gsu_019b42:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_019b4e
    nop
    iwt r15,#gsu_019bd3
    nop

gsu_019b4e:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019b6a:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03c)
    sub r2
    alt2
    sms ($084),r0
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03c)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    add #4
    to r6
    ldw (r8)
    with r8
    alt2
    sub #8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r6
    sub r2
    alt1
    lms r0,($084)
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    to r2
    ldw (r8)
    with r8
    alt2
    add #8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    with r6
    sub r2
    alt1
    lms r0,($084)
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019bea
    nop

gsu_019bd3:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019bea:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019bf6
    nop
    iwt r15,#gsu_019b0d
    nop

gsu_019bf6:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_019c02
    nop
    iwt r15,#gsu_019d34
    nop

gsu_019c02:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    alt1
    lms r0,($040)
    alt2
    mult #8
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)
    inc r0
    inc r0
    from r3
    stw (r0)
    inc r0
    inc r0
    from r6
    stw (r0)

gsu_019c32:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r8
    alt2
    add #4
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03e)
    from r2
    sub r0
    alt2
    sub #1
    bge gsu_019c54
    nop
    iwt r15,#gsu_019c6b
    nop

gsu_019c54:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_019c62
    nop
    iwt r15,#gsu_019c95
    nop

gsu_019c62:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019d15
    nop

gsu_019c6b:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_019c79
    nop
    iwt r15,#gsu_019cfe
    nop

gsu_019c79:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019c95:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03e)
    sub r2
    alt2
    sms ($084),r0
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03e)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    add #4
    to r6
    ldw (r8)
    with r8
    alt2
    sub #8
    to r2
    ldw (r8)
    inc r8
    inc r8
    with r6
    sub r2
    alt1
    lms r0,($084)
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    to r2
    ldw (r8)
    with r8
    alt2
    add #8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #6
    with r6
    sub r2
    alt1
    lms r0,($084)
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019d15
    nop

gsu_019cfe:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r8
    alt2
    sub #4
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9
    ldw (r8)
    inc r8
    inc r8
    stw (r9)
    inc r9
    inc r9

gsu_019d15:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019d21
    nop
    iwt r15,#gsu_019c32
    nop

gsu_019d21:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_019d2d
    nop
    iwt r15,#gsu_019d34
    nop

gsu_019d2d:
    alt2
    add #3
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_019d34:
    sub r0
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_019d3a:
    alt2
    sms ($086),r0
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_019d5b:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($038)
    from r1
    sub r0
    blt gsu_019d78
    nop
    iwt r15,#gsu_019d8d
    nop

gsu_019d78:
    alt1
    lms r0,($038)
    from r3
    sub r0
    blt gsu_019d84
    nop
    iwt r15,#gsu_019da6
    nop

gsu_019d84:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019dd0
    nop

gsu_019d8d:
    alt1
    lms r0,($038)
    from r3
    sub r0
    blt gsu_019d99
    nop
    iwt r15,#gsu_019dc8
    nop

gsu_019d99:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019da6:
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($038)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019dd0
    nop

gsu_019dc8:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019dd0:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019ddc
    nop
    iwt r15,#gsu_019d5b
    nop

gsu_019ddc:
    alt1
    lms r0,($086)
    alt2
    sub #2
    bpl gsu_019de8
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_019de8:
    alt2
    add #2
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_019e08:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03a)
    from r1
    sub r0
    alt2
    sub #1
    bge gsu_019e27
    nop
    iwt r15,#gsu_019e3e
    nop

gsu_019e27:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    bge gsu_019e35
    nop
    iwt r15,#gsu_019e59
    nop

gsu_019e35:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019e83
    nop

gsu_019e3e:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    bge gsu_019e4c
    nop
    iwt r15,#gsu_019e7b
    nop

gsu_019e4c:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019e59:
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($03a)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019e83
    nop

gsu_019e7b:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019e83:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019e8f
    nop
    iwt r15,#gsu_019e08
    nop

gsu_019e8f:
    alt1
    lms r0,($086)
    alt2
    sub #2
    bpl gsu_019e9b
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_019e9b:
    alt2
    add #2
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_019ebb:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03c)
    from r2
    sub r0
    blt gsu_019ed8
    nop
    iwt r15,#gsu_019eed
    nop

gsu_019ed8:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_019ee4
    nop
    iwt r15,#gsu_019f06
    nop

gsu_019ee4:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019f36
    nop

gsu_019eed:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_019ef9
    nop
    iwt r15,#gsu_019f2e
    nop

gsu_019ef9:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019f06:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03c)
    sub r2
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03c)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019f36
    nop

gsu_019f2e:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019f36:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019f42
    nop
    iwt r15,#gsu_019ebb
    nop

gsu_019f42:
    alt1
    lms r0,($086)
    alt2
    sub #2
    bpl gsu_019f4e
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_019f4e:
    alt2
    add #2
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_019f6e:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03e)
    from r2
    sub r0
    alt2
    sub #1
    bge gsu_019f8d
    nop
    iwt r15,#gsu_019fa4
    nop

gsu_019f8d:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_019f9b
    nop
    iwt r15,#gsu_019fbf
    nop

gsu_019f9b:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_019fef
    nop

gsu_019fa4:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_019fb2
    nop
    iwt r15,#gsu_019fe7
    nop

gsu_019fb2:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019fbf:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03e)
    sub r2
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03e)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_019fef
    nop

gsu_019fe7:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_019fef:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_019ffb
    nop
    iwt r15,#gsu_019f6e
    nop

gsu_019ffb:
    alt1
    lms r0,($086)
    alt2
    sub #2
    bpl gsu_01a007
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_01a007:
    alt2
    add #2
    ibt r0,#$02
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01a010:
    from r11
    stw (r10)
    inc r10
    inc r10
    ibt r1,#$03
    alt3
    cmp r1
    bpl gsu_01a01f
    nop
    iwt r15,#gsu_019d3a
    nop

gsu_01a01f:
    alt2
    sms ($086),r0
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_01a040:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($038)
    from r1
    sub r0
    blt gsu_01a05d
    nop
    iwt r15,#gsu_01a0a0
    nop

gsu_01a05d:
    alt1
    lms r0,($038)
    from r3
    sub r0
    bge gsu_01a069
    nop
    iwt r15,#gsu_01a097
    nop

gsu_01a069:
    with r1
    to r0
    with r3
    to r1
    with r0
    to r3
    with r2
    to r0
    with r6
    to r2
    with r0
    to r6
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($038)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a0e3
    nop

gsu_01a097:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_01a0e3
    nop

gsu_01a0a0:
    alt1
    lms r0,($038)
    from r3
    sub r0
    blt gsu_01a0ac
    nop
    iwt r15,#gsu_01a0db
    nop

gsu_01a0ac:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($038)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($038)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a0e3
    nop

gsu_01a0db:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a0e3:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01a0ef
    nop
    iwt r15,#gsu_01a040
    nop

gsu_01a0ef:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_01a0fb
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_01a0fb:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_01a11b:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03a)
    from r1
    sub r0
    alt2
    sub #1
    bge gsu_01a13a
    nop
    iwt r15,#gsu_01a17f
    nop

gsu_01a13a:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    blt gsu_01a148
    nop
    iwt r15,#gsu_01a176
    nop

gsu_01a148:
    with r1
    to r0
    with r3
    to r1
    with r0
    to r3
    with r2
    to r0
    with r6
    to r2
    with r0
    to r6
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($03a)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a1c4
    nop

gsu_01a176:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_01a1c4
    nop

gsu_01a17f:
    alt1
    lms r0,($03a)
    from r3
    sub r0
    alt2
    sub #1
    bge gsu_01a18d
    nop
    iwt r15,#gsu_01a1bc
    nop

gsu_01a18d:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9
    with r3
    sub r1
    with r6
    sub r2
    alt1
    lms r0,($03a)
    sub r1
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r2
    alt1
    lms r6,($03a)
    from r6
    stw (r9)
    inc r9
    inc r9
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a1c4
    nop

gsu_01a1bc:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a1c4:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01a1d0
    nop
    iwt r15,#gsu_01a11b
    nop

gsu_01a1d0:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_01a1dc
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_01a1dc:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0982
    iwt r9,#$0a02
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_01a1fc:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03c)
    from r2
    sub r0
    blt gsu_01a219
    nop
    iwt r15,#gsu_01a22e
    nop

gsu_01a219:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_01a225
    nop
    iwt r15,#gsu_01a247
    nop

gsu_01a225:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_01a277
    nop

gsu_01a22e:
    alt1
    lms r0,($03c)
    from r6
    sub r0
    blt gsu_01a23a
    nop
    iwt r15,#gsu_01a26f
    nop

gsu_01a23a:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a247:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03c)
    sub r2
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03c)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a277
    nop

gsu_01a26f:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a277:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01a283
    nop
    iwt r15,#gsu_01a1fc
    nop

gsu_01a283:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_01a28f
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_01a28f:
    alt2
    add #3
    alt2
    sms ($040),r0
    iwt r8,#$0a02
    iwt r9,#$0982
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($040)
    alt2
    mult #4
    add r8
    from r1
    stw (r0)
    inc r0
    inc r0
    from r2
    stw (r0)

gsu_01a2af:
    to r1
    ldw (r8)
    inc r8
    inc r8
    to r2
    ldw (r8)
    inc r8
    inc r8
    to r3
    ldw (r8)
    inc r8
    inc r8
    to r6
    ldw (r8)
    with r8
    alt2
    sub #2
    alt1
    lms r0,($03e)
    from r2
    sub r0
    alt2
    sub #1
    bge gsu_01a2ce
    nop
    iwt r15,#gsu_01a2e5
    nop

gsu_01a2ce:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_01a2dc
    nop
    iwt r15,#gsu_01a300
    nop

gsu_01a2dc:
    alt1
    lms r0,($086)
    dec r0
    sbk
    iwt r15,#gsu_01a330
    nop

gsu_01a2e5:
    alt1
    lms r0,($03e)
    from r6
    sub r0
    alt2
    sub #1
    bge gsu_01a2f3
    nop
    iwt r15,#gsu_01a328
    nop

gsu_01a2f3:
    alt1
    lms r0,($086)
    inc r0
    sbk
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a300:
    with r3
    sub r1
    with r6
    sub r2
    with r3
    to r0
    with r6
    to r3
    with r0
    to r6
    alt1
    lms r0,($03e)
    sub r2
    to r5
    alt1
    lmult
    with r3
    to r6
    link #4
    iwt r15,#gsu_01814d
    nop
    from r4
    add r1
    alt1
    lms r6,($03e)
    stw (r9)
    inc r9
    inc r9
    from r6
    stw (r9)
    inc r9
    inc r9
    iwt r15,#gsu_01a330
    nop

gsu_01a328:
    from r1
    stw (r9)
    inc r9
    inc r9
    from r2
    stw (r9)
    inc r9
    inc r9

gsu_01a330:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01a33c
    nop
    iwt r15,#gsu_01a2af
    nop

gsu_01a33c:
    alt1
    lms r0,($086)
    alt2
    sub #3
    bpl gsu_01a348
    nop
    iwt r15,#gsu_01a34f
    nop

gsu_01a348:
    alt2
    add #3
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01a34f:
    sub r0
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01a355:
    cache
    iwt r7,#$0982
    to r1
    ldw (r7)
    inc r7
    inc r7
    to r2
    ldw (r7)
    inc r7
    inc r7
    to r3
    ldw (r7)
    inc r7
    inc r7
    to r4
    ldw (r7)
    ibt r5,#$01
    with r3
    sub r1
    bpl gsu_01a373
    nop
    ibt r5,#$ff
    with r3
    not
    inc r3

gsu_01a373:
    ibt r6,#$01
    with r4
    sub r2
    bpl gsu_01a37f
    nop
    ibt r6,#$ff
    with r4
    not
    inc r4

gsu_01a37f:
    from r3
    sub r4
    bmi gsu_01a39a
    nop
    with r3
    to r12
    inc r12
    lsr
    sub r4
    with r15
    to r13
    bcs gsu_01a391
    plot
    add r3
    with r2
    add r6

gsu_01a391:
    dec r1
    with r1
    add r5
    loop
    sub r4
    iwt r15,#gsu_018ead
    nop

gsu_01a39a:
    with r4
    to r12
    inc r12
    not
    inc r0
    lsr
    sub r3
    with r15
    to r13
    bcs gsu_01a3a9
    plot
    add r4
    with r1
    add r5

gsu_01a3a9:
    dec r1
    with r2
    add r6
    loop
    sub r3
    iwt r15,#gsu_018ead
    nop

gsu_01a3b2:
    dec r0
    dec r0
    bne gsu_01a3bb
    nop
    iwt r15,#gsu_01a355
    nop

gsu_01a3bb:
    inc r0
    inc r0
    with r0
    to r12
    add r0
    add r0
    add r0
    with r0
    to r3
    iwt r4,#$0982
    from r4
    to r5
    add r0
    iwt r2,#$03ff
    ibt r8,#$00
    with r15
    to r13
    alt1
    ldb (r4)
    inc r4
    inc r4
    alt1
    stb (r5)
    inc r5
    inc r5
    alt1
    ldb (r4)
    alt1
    stb (r5)
    alt3
    cmp r2
    bpl gsu_01a3e6
    nop
    with r0
    to r2
    with r4
    to r6

gsu_01a3e6:
    alt3
    cmp r8
    bmi gsu_01a3ed
    nop
    with r0
    to r8

gsu_01a3ed:
    inc r4
    inc r4
    inc r5
    inc r5
    alt1
    ldb (r4)
    inc r4
    inc r4
    alt1
    stb (r5)
    inc r5
    inc r5
    alt1
    ldb (r4)
    inc r4
    inc r4
    alt1
    stb (r5)
    inc r5
    loop
    inc r5
    from r2
    sub r8
    bne gsu_01a40b
    nop
    iwt r15,#gsu_01a667
    nop

gsu_01a40b:
    with r6
    to r4
    dec r4
    dec r4
    from r4
    to r5
    add r3
    alt1
    ldb (r4)
    inc r4
    inc r4
    to r9
    swap
    with r9
    to r10
    inc r4
    inc r4
    alt1
    ldb (r4)
    swap
    alt2
    sms ($06a),r0
    alt2
    sms ($06c),r0
    inc r4
    inc r4
    alt1
    ldb (r4)
    swap
    alt2
    sms ($076),r0
    alt2
    sms ($078),r0
    inc r4
    inc r4
    alt2
    sms ($05a),r4
    alt2
    sms ($05c),r5
    ibt r11,#$00
    ibt r3,#$00
    alt1
    lms r0,($058)
    color
    swap
    alt1
    cmode
    cache
    iwt r15,#gsu_01a537
    nop

gsu_01a448:
    alt2
    sms ($066),r7
    alt2
    sms ($068),r8
    from r11
    sub r3
    bmi gsu_01a461
    nop
    alt2
    sms ($05e),r0
    from r3
    swap
    to r2
    or r2
    sub r0
    alt2
    sms ($060),r0
    bra gsu_01a46e
    nop

gsu_01a461:
    from r3
    sub r11
    alt2
    sms ($060),r0
    from r11
    swap
    to r2
    or r2
    sub r0
    alt2
    sms ($05e),r0

gsu_01a46e:
    from r9
    to r1
    hib
    from r10
    hib
    to r12
    sub r1
    bcs gsu_01a47a
    inc r12
    ibt r12,#$01

gsu_01a47a:
    iwt r0,#$9647
    add r12
    to r14
    add r12
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    alt1
    lms r0,($074)
    alt1
    lms r4,($06c)
    add r4
    sbk
    alt1
    lms r8,($06a)
    from r4
    sub r8
    fmult
    to r5
    rol
    alt1
    lms r0,($072)
    add r8
    alt2
    sms ($06a),r0
    alt1
    lms r0,($080)
    alt1
    lms r4,($078)
    add r4
    sbk
    alt1
    lms r7,($076)
    from r4
    sub r7
    fmult
    to r6
    rol
    alt1
    lms r0,($07e)
    add r7
    alt2
    sms ($076),r0
    alt1
    lms r4,($0ae)
    with r8
    add r4
    alt1
    lms r4,($0b0)
    with r7
    add r4
    alt1
    lms r0,($094)
    alt3
    romb
    alt1
    lms r4,($096)
    alt1
    lms r3,($0c2)
    alt1
    lms r0,($042)
    inc r0
    bne gsu_01a4e1
    nop
    with r15
    to r13
    merge
    and r3
    to r14
    add r4
    with r7
    add r6
    with r8
    add r5
    getc
    loop
    plot
    iwt r15,#gsu_01a4fd
    nop

gsu_01a4e1:
    ibt r0,#$00
    alt3
    romb
    from r2
    add r2
    add r0
    alt2
    mult #13
    add r2
    add r1
    lob
    iwt r14,#$8e49
    to r14
    add r14
    with r15
    to r13
    getb
    inc r14
    add r8
    hib
    color
    with r8
    add r5
    loop
    plot

gsu_01a4fd:
    sub r0
    alt3
    romb
    alt1
    lms r7,($066)
    alt1
    lms r8,($068)
    with r9
    add r7
    bpl gsu_01a514
    nop
    iwt r0,#$0800
    add r9
    bmi gsu_01a514
    nop
    ibt r9,#$00

gsu_01a514:
    with r10
    add r8
    bpl gsu_01a522
    nop
    iwt r0,#$0800
    add r10
    bmi gsu_01a522
    nop
    ibt r10,#$00

gsu_01a522:
    inc r2
    from r2
    swap
    dec r0
    to r2
    swap
    from r2
    hib
    beq gsu_01a531
    nop
    iwt r15,#gsu_01a46e
    nop

gsu_01a531:
    alt1
    lms r11,($05e)
    alt1
    lms r3,($060)

gsu_01a537:
    with r0
    from r11
    beq gsu_01a540
    nop
    iwt r15,#gsu_01a5ce
    nop

gsu_01a540:
    ibt r0,#$7f
    add r9
    to r9
    hib
    alt1
    lms r0,($06a)
    hib
    sbk
    alt1
    lms r0,($076)
    hib
    sbk
    alt1
    lms r6,($05a)

gsu_01a552:
    with r9
    to r12
    alt1
    lms r0,($06a)
    alt2
    sms ($06e),r0
    alt1
    lms r0,($076)
    alt2
    sms ($07a),r0
    to r9
    alt1
    ldb (r6)
    inc r6
    inc r6
    to r4
    alt1
    ldb (r6)
    inc r6
    inc r6
    alt1
    ldb (r6)
    alt2
    sms ($06a),r0
    inc r6
    inc r6
    alt1
    ldb (r6)
    alt2
    sms ($076),r0
    inc r6
    inc r6
    from r4
    to r11
    sub r2
    beq gsu_01a552
    nop
    bpl gsu_01a585
    nop
    iwt r15,#gsu_01a667
    nop

gsu_01a585:
    alt2
    sms ($05a),r6
    iwt r0,#$9647
    add r11
    to r14
    add r11
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r9
    sub r12
    from r12
    to r9
    swap
    alt1
    lmult
    with r4
    add r4
    rol
    lob
    swap
    with r4
    hib
    to r7
    or r4
    alt1
    lms r0,($06a)
    alt1
    lms r1,($06e)
    sub r1
    lob
    swap
    fmult
    rol
    alt2
    sms ($072),r0
    alt1
    lms r0,($06e)
    swap
    alt2
    sms ($06a),r0
    alt1
    lms r0,($076)
    alt1
    lms r1,($07a)
    sub r1
    lob
    swap
    fmult
    rol
    alt2
    sms ($07e),r0
    alt1
    lms r0,($07a)
    swap
    alt2
    sms ($076),r0

gsu_01a5ce:
    with r0
    from r3
    beq gsu_01a5d7
    nop
    iwt r15,#gsu_01a448
    nop

gsu_01a5d7:
    ibt r0,#$7f
    add r10
    to r10
    hib
    alt1
    lms r0,($06c)
    hib
    sbk
    alt1
    lms r0,($078)
    hib
    sbk
    alt1
    lms r6,($05c)

gsu_01a5e9:
    with r10
    to r12
    alt1
    lms r0,($06c)
    alt2
    sms ($070),r0
    alt1
    lms r0,($078)
    alt2
    sms ($07c),r0
    dec r6
    dec r6
    alt1
    ldb (r6)
    alt2
    sms ($078),r0
    dec r6
    dec r6
    alt1
    ldb (r6)
    alt2
    sms ($06c),r0
    dec r6
    dec r6
    alt1
    ldb (r6)
    dec r6
    dec r6
    to r10
    alt1
    ldb (r6)
    to r3
    sub r2
    beq gsu_01a5e9
    nop
    bpl gsu_01a61a
    nop
    iwt r15,#gsu_01a667
    nop

gsu_01a61a:
    alt2
    sms ($05c),r6
    iwt r0,#$9647
    add r3
    to r14
    add r3
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r10
    sub r12
    from r12
    to r10
    swap
    alt1
    lmult
    with r4
    add r4
    rol
    lob
    swap
    with r4
    hib
    to r8
    or r4
    alt1
    lms r0,($06c)
    alt1
    lms r1,($070)
    sub r1
    lob
    swap
    fmult
    rol
    alt2
    sms ($074),r0
    alt1
    lms r0,($070)
    swap
    alt2
    sms ($06c),r0
    alt1
    lms r0,($078)
    alt1
    lms r1,($07c)
    sub r1
    lob
    swap
    fmult
    rol
    alt2
    sms ($080),r0
    alt1
    lms r0,($07c)
    swap
    alt2
    sms ($078),r0
    iwt r15,#gsu_01a448
    nop

gsu_01a667:
    iwt r15,#gsu_018ead
    nop

gsu_01a66b:
    cache
    alt1
    lms r1,($042)
    with r1
    from r1
    beq gsu_01a678
    nop
    iwt r15,#gsu_01a3b2
    nop

gsu_01a678:
    dec r0
    dec r0
    bne gsu_01a681
    nop
    iwt r15,#gsu_01a355
    nop

gsu_01a681:
    inc r0
    inc r0
    with r0
    to r12
    add r0
    add r0
    with r0
    to r3
    iwt r4,#$0982
    from r4
    to r5
    add r0
    iwt r2,#$03ff
    ibt r8,#$00
    with r15
    to r13
    alt1
    ldb (r4)
    alt1
    stb (r5)
    inc r4
    inc r4
    inc r5
    inc r5
    alt1
    ldb (r4)
    alt1
    stb (r5)
    alt3
    cmp r2
    bpl gsu_01a6ab
    inc r5
    with r0
    to r2
    with r4
    to r6

gsu_01a6ab:
    sub r8
    bmi gsu_01a6b1
    inc r5
    to r8
    add r8

gsu_01a6b1:
    inc r4
    loop
    inc r4
    from r2
    sub r8
    bne gsu_01a6bd
    nop
    iwt r15,#gsu_01a783
    nop

gsu_01a6bd:
    dec r6
    dec r6
    from r6
    to r5
    add r3
    to r8
    alt1
    ldb (r6)
    with r6
    alt2
    add #4
    to r9
    from r8
    swap
    iwt r13,#$a75c
    with r3
    bra gsu_01a6e1
    sub r3

gsu_01a6d2:
    with r0
    from r11
    bne gsu_01a715
    nop
    ibt r0,#$7f
    add r7
    to r7
    hib
    alt1
    lms r6,($05a)

gsu_01a6df:
    with r7
    to r8

gsu_01a6e1:
    to r7
    alt1
    ldb (r6)
    inc r6
    inc r6
    alt1
    ldb (r6)
    inc r6
    inc r6
    to r11
    sub r2
    bpl gsu_01a6f3
    nop
    iwt r15,#gsu_01a783
    nop

gsu_01a6f3:
    beq gsu_01a6df
    nop
    iwt r0,#$9647
    add r11
    to r14
    add r11
    alt2
    sms ($05a),r6
    from r7
    sub r8
    to r6
    getb
    inc r14
    from r8
    to r7
    swap
    with r6
    alt1
    getbh
    alt1
    lmult
    with r4
    add r4
    rol
    lob
    swap
    with r4
    hib
    to r8
    or r4

gsu_01a715:
    with r0
    from r3
    bne gsu_01a752
    nop
    ibt r0,#$7f
    add r9
    to r9
    hib

gsu_01a71f:
    with r9
    to r10
    dec r5
    dec r5
    alt1
    ldb (r5)
    dec r5
    dec r5
    to r9
    alt1
    ldb (r5)
    to r3
    sub r2
    bpl gsu_01a733
    nop
    iwt r15,#gsu_01a783
    nop

gsu_01a733:
    beq gsu_01a71f
    nop
    iwt r0,#$9647
    add r3
    to r14
    add r3
    from r9
    sub r10
    to r6
    getb
    inc r14
    from r10
    to r9
    swap
    with r6
    alt1
    getbh
    alt1
    lmult
    with r4
    add r4
    rol
    lob
    swap
    with r4
    hib
    to r10
    or r4

gsu_01a752:
    from r7
    to r1
    hib
    from r9
    hib
    to r12
    sub r1
    bmi gsu_01a75e
    inc r12
    loop
    plot

gsu_01a75e:
    with r7
    add r8
    bpl gsu_01a76c
    dec r11
    iwt r0,#$0800
    add r7
    bmi gsu_01a76c
    nop
    ibt r7,#$00

gsu_01a76c:
    with r9
    add r10
    bpl gsu_01a77a
    dec r3
    iwt r0,#$0800
    add r9
    bmi gsu_01a77a
    nop
    ibt r9,#$00

gsu_01a77a:
    from r11
    and r3
    bne gsu_01a752
    inc r2
    iwt r15,#gsu_01a6d2
    nop

gsu_01a783:
    iwt r15,#gsu_018ead
    nop

gsu_01a787:
    jmp r11
    nop

gsu_01a789:
    alt2
    sms ($19e),r11
    sub r0
    alt2
    ramb
    alt1
    cmode
    ibt r0,#$14
    alt3
    romb
    alt1
    lms r7,($062)
    alt1
    lms r8,($02c)
    alt1
    lms r9,($02e)
    alt1
    lms r1,($142)
    alt1
    lms r2,($144)
    alt1
    lms r3,($146)
    alt1
    lms r11,($152)
    iwt r0,#$000f
    alt2
    sms ($14e),r0
    cache

gsu_01a7b1:
    alt1
    lms r10,($150)
    with r9
    sub r3
    iwt r12,#$000f
    with r15
    to r13
    with r9
    add r3
    bpl gsu_01a7fa

gsu_01a7bf:
    with r7
    add r1
    with r8
    add r2
    loop
    inc r10
    inc r11
    alt1
    lms r0,($148)
    alt1
    lms r7,($062)
    with r7
    add r0
    alt2
    sms ($062),r7
    alt1
    lms r0,($14a)
    alt1
    lms r8,($02c)
    with r8
    add r0
    alt2
    sms ($02c),r8
    alt1
    lms r0,($14c)
    alt1
    lms r9,($02e)
    with r9
    add r0
    alt2
    sms ($02e),r9
    alt1
    lms r0,($14e)
    dec r0
    bne gsu_01a7b1
    sbk
    ibt r1,#$00
    ibt r2,#$00
    alt1
    rpix
    nop
    alt1
    lms r11,($19e)
    jmp r11
    nop

gsu_01a7fa:
    with r9
    to r6
    iwt r0,#$3000
    sub r6
    bpl gsu_01a806
    nop
    iwt r6,#$2fff

gsu_01a806:
    iwt r0,#$0100
    sub r6
    bpl gsu_01a7bf
    nop
    with r6
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r6
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r7
    fmult
    rol
    ibt r5,#$70
    add r5
    iwt r4,#$00e0
    alt3
    cmp r4
    bcs gsu_01a7bf
    nop
    from r8
    to r5
    fmult
    with r5
    rol
    ibt r6,#$60
    with r5
    add r6
    iwt r4,#$00c0
    from r5
    alt3
    cmp r4
    bcs gsu_01a85d
    nop
    with r1
    to r6
    with r0
    to r1
    from r10
    alt1
    xor r11
    alt2
    and #4
    alt2
    add #11
    ibt r0,#$0e
    color
    with r2
    to r0
    with r5
    to r2
    plot
    iwt r5,#$0200
    from r9
    to r5
    sub r5
    bcs gsu_01a859
    inc r2
    dec r1
    plot

gsu_01a859:
    with r6
    to r1
    with r0
    to r2

gsu_01a85d:
    iwt r15,#gsu_01a7bf
    nop
    iwt r9,#$0b52
    iwt r8,#$19f8
    alt2
    sms ($140),r8
    iwt r7,#$0080
    iwt r12,#$0078
    with r15
    to r13
    from r8
    swap
    ror
    add r8
    to r8
    alt1
    adc r8
    inc r8
    from r8
    stw (r9)
    inc r9
    inc r9
    from r8
    swap
    ror
    add r8
    to r8
    alt1
    adc r8
    inc r8
    from r8
    stw (r9)
    inc r9
    inc r9
    from r8
    swap
    ror
    add r8
    to r8
    alt1
    adc r8
    inc r8
    from r8
    stw (r9)
    inc r9
    inc r9
    loop
    nop
    alt1
    lms r11,($19e)
    stop
    .db $01,$fb,$a4,$a8,$ff,$a6,$a8,$01,$00,$01

gsu_01a8a6:
    alt2
    sms ($19e),r11
    ibt r0,#$14
    alt3
    romb
    iwt r9,#$0b52
    iwt r8,#$05c2
    ibt r0,#$78
    alt2
    sms ($040),r0
    cache

gsu_01a8b9:
    iwt r4,#$0800
    iwt r5,#$f800
    ldw (r9)
    inc r9
    inc r9
    alt1
    lms r1,($0c6)
    to r1
    sub r1
    from r1
    sub r4
    bcc gsu_01a8d5
    nop
    from r1
    sub r5
    bcs gsu_01a8d5
    nop
    iwt r15,#gsu_01a96b
    nop

gsu_01a8d5:
    ldw (r9)
    inc r9
    inc r9
    alt1
    lms r2,($0c8)
    to r2
    sub r2
    from r2
    sub r4
    bcc gsu_01a8eb
    nop
    from r2
    sub r5
    bcs gsu_01a8eb
    nop
    iwt r15,#gsu_01a96d
    nop

gsu_01a8eb:
    ldw (r9)
    inc r9
    inc r9
    alt1
    lms r3,($0ca)
    to r3
    sub r3
    iwt r4,#$0a00
    iwt r5,#$f600
    from r3
    sub r4
    bcc gsu_01a907
    nop
    from r3
    sub r5
    bcs gsu_01a907
    nop
    iwt r15,#gsu_01a96f
    nop

gsu_01a907:
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    with r0
    from r0
    bpl gsu_01a926
    nop
    iwt r15,#gsu_01a96f
    nop

gsu_01a926:
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    stw (r8)
    inc r8
    inc r8
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01a967
    nop
    iwt r15,#gsu_01a8b9
    nop

gsu_01a967:
    iwt r15,#gsu_01aa09
    nop

gsu_01a96b:
    inc r9
    inc r9

gsu_01a96d:
    inc r9
    inc r9

gsu_01a96f:
    with r9
    alt2
    sub #6
    alt1
    lms r7,($140)
    from r7
    swap
    ror
    add r7
    to r7
    alt1
    adc r7
    inc r7
    from r7
    asr
    asr
    asr
    asr
    asr
    to r1
    asr
    from r7
    swap
    ror
    add r7
    to r7
    alt1
    adc r7
    inc r7
    from r7
    asr
    asr
    asr
    asr
    asr
    to r2
    asr
    from r7
    swap
    ror
    add r7
    to r7
    alt1
    adc r7
    inc r7
    from r7
    lsr
    lsr
    lsr
    lsr
    lsr
    iwt r3,#$0200
    to r3
    add r3
    alt2
    sms ($140),r7
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d4)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0d6)
    from r3
    fmult
    rol
    add r5
    alt1
    lms r4,($0c6)
    add r4
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0d8)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0dc)
    from r3
    fmult
    rol
    add r5
    alt1
    lms r4,($0c8)
    add r4
    stw (r9)
    inc r9
    inc r9
    alt1
    lms r6,($0de)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0e0)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    alt1
    lms r4,($0ca)
    add r4
    stw (r9)
    inc r9
    inc r9
    with r9
    alt2
    sub #6
    iwt r15,#gsu_01a8b9
    nop

gsu_01aa09:
    sub r0
    alt1
    cmode
    iwt r10,#$04c2
    iwt r7,#$05c2
    ibt r0,#$78
    alt2
    sms ($040),r0
    cache

gsu_01aa18:
    to r3
    ldw (r7)
    inc r7
    inc r7
    to r1
    ldw (r7)
    inc r7
    inc r7
    to r2
    ldw (r7)
    inc r7
    inc r7
    with r3
    from r3
    bpl gsu_01aa2d
    nop
    iwt r15,#gsu_01aac3
    nop

gsu_01aa2d:
    nop
    with r3
    to r6
    iwt r0,#$3000
    sub r6
    bpl gsu_01aa3a
    nop
    iwt r6,#$2fff

gsu_01aa3a:
    iwt r0,#$0100
    sub r6
    bmi gsu_01aa54
    nop
    beq gsu_01aa54
    nop
    from r1
    add r1
    nop
    with r0
    to r1
    from r2
    add r2
    nop
    with r0
    to r2
    with r6
    add r6
    iwt r15,#gsu_01aac3
    nop

gsu_01aa54:
    with r6
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r6
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r1
    fmult
    rol
    alt1
    lms r5,($034)
    to r1
    add r5
    iwt r4,#$00e0
    from r1
    sub r4
    bcs gsu_01aac3
    add r4
    from r2
    fmult
    rol
    alt1
    lms r5,($036)
    to r2
    add r5
    iwt r5,#$00c0
    from r2
    sub r5
    bcs gsu_01aac3
    add r5
    from r3
    hib
    ibt r5,#$10
    alt3
    cmp r5
    bmi gsu_01aa8c
    nop
    sub r0

gsu_01aa8c:
    alt1
    lm r5,($1a26)
    with r5
    lob
    dec r5
    bmi gsu_01aaa6
    nop
    bne gsu_01aaa1
    nop
    iwt r5,#$bcac
    to r14
    add r5
    bra gsu_01aab6
    nop

gsu_01aaa1:
    ibt r0,#$03
    bra gsu_01aab7
    nop

gsu_01aaa6:
    iwt r5,#$bc6c
    to r14
    add r5
    alt1
    lms r0,($040)
    alt2
    and #3
    add r0
    add r0
    add r0
    add r0
    with r14
    add r0

gsu_01aab6:
    getb

gsu_01aab7:
    color
    plot
    iwt r5,#$0400
    from r3
    sub r5
    bcs gsu_01aac3
    inc r2
    dec r1
    plot

gsu_01aac3:
    alt1
    lms r0,($040)
    dec r0
    sbk
    beq gsu_01aacf
    nop
    iwt r15,#gsu_01aa18
    nop

gsu_01aacf:
    alt1
    lms r15,($19e)
    nop
    iwt r10,#$0ef2
    iwt r12,#$00e0
    sub r0
    with r15
    to r13
    cache
    stw (r10)
    inc r10
    loop
    inc r10
    alt1
    lms r13,($020)
    alt1
    lms r5,($026)
    alt1
    lms r6,($028)
    iwt r12,#$0ef2
    ibt r3,#$00
    with r13
    to r4
    ibt r9,#$01
    with r9
    sub r4
    ibt r7,#$01
    with r7
    add r3
    with r7
    add r3
    from r9
    to r8
    sub r4
    cache

gsu_01aaff:
    from r3

gsu_01ab00:
    sub r4
    bmi gsu_01ab08
    nop
    iwt r15,#gsu_01ab6c
    nop

gsu_01ab08:
    from r5
    to r1
    add r3
    from r6
    to r2
    add r4
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab1b
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab1b:
    from r5
    to r1
    add r3
    from r6
    to r2
    sub r4
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab2e
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab2e:
    from r5
    to r1
    add r4
    from r6
    to r2
    add r3
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab41
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab41:
    from r5
    to r1
    add r4
    from r6
    to r2
    sub r3
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab54
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab54:
    inc r3
    inc r7
    inc r7
    inc r8
    inc r8
    with r9
    from r9
    bpl gsu_01ab64
    nop
    with r9
    add r7
    iwt r15,#gsu_01ab00
    from r3

gsu_01ab64:
    inc r8
    inc r8
    with r9
    add r8
    iwt r15,#gsu_01aaff
    dec r4

gsu_01ab6c:
    from r5
    to r1
    add r3
    from r6
    to r2
    add r4
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab7f
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab7f:
    from r5
    to r1
    add r3
    from r6
    to r2
    sub r4
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01ab92
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01ab92:
    from r5
    to r1
    add r4
    from r6
    to r2
    add r3
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01aba5
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01aba5:
    from r5
    to r1
    add r4
    from r6
    to r2
    sub r3
    iwt r0,#$00f0
    alt3
    cmp r2
    bcc gsu_01abb8
    nop
    from r12
    add r2
    add r2
    from r1
    stw (r0)

gsu_01abb8:
    iwt r1,#$0ef2
    iwt r2,#$0ef2
    iwt r5,#$10b2
    iwt r12,#$00e0
    with r15
    to r13
    to r6
    ldw (r1)
    inc r1
    inc r1
    alt1
    lms r3,($026)
    from r3
    to r4
    sub r6
    from r4
    to r7
    add r3
    iwt r4,#$00f0
    with r7
    alt3
    cmp r4
    bpl gsu_01ac0b
    nop
    iwt r4,#$0010
    with r6
    alt3
    cmp r4
    bmi gsu_01ac0b
    nop
    iwt r4,#$0010
    with r7
    alt3
    cmp r4
    bpl gsu_01abf1
    nop
    iwt r7,#$0010

gsu_01abf1:
    iwt r4,#$00f0
    with r6
    alt3
    cmp r4
    bmi gsu_01abfd
    nop
    iwt r6,#$00f0

gsu_01abfd:
    from r6
    alt1
    stb (r2)
    inc r2
    inc r2
    from r7
    alt1
    stb (r5)
    inc r5
    inc r5
    loop
    nop
    stop
    .db $01

gsu_01ac0b:
    iwt r0,#$0064
    alt1
    stb (r2)
    inc r2
    inc r2
    iwt r0,#$00c8
    alt1
    stb (r5)
    inc r5
    inc r5
    loop
    nop
    stop
    .db $01
    iwt r10,#$04c2
    alt1
    lms r0,($1b2)
    lob
    beq gsu_01ac2c
    nop
    link #4
    iwt r15,#gsu_01b0bb
    nop

gsu_01ac2c:
    alt1
    lms r0,($19e)
    with r0
    from r0
    beq gsu_01ac44
    nop
    bmi gsu_01ac3f
    nop
    link #4
    iwt r15,#gsu_01a789
    nop
    bra gsu_01ac44
    nop

gsu_01ac3f:
    link #4
    iwt r15,#gsu_01a8a6
    nop

gsu_01ac44:
    iwt r10,#$04c2
    ibt r1,#$08
    alt1
    lms r0,($1a0)
    and r1
    beq gsu_01ac5a
    nop
    ibt r0,#$01
    alt2
    sms ($1a2),r0
    link #4
    iwt r15,#gsu_01ac97
    nop

gsu_01ac5a:
    sub r0
    alt2
    sms ($1a2),r0
    link #4
    iwt r15,#gsu_01ac97
    nop
    iwt r10,#$04c2
    sub r0
    alt1
    cmode
    alt1
    lm r0,($021c)
    lob
    beq gsu_01ac80
    nop
    link #4
    iwt r15,#gsu_01af81
    nop
    link #4
    iwt r15,#gsu_01afb8
    nop
    link #4
    iwt r15,#gsu_01afed
    nop

gsu_01ac80:
    link #4
    iwt r15,#gsu_01d76b
    nop
    alt1
    lm r0,($1a28)
    with r0
    from r0
    beq gsu_01ac93
    nop
    link #4
    iwt r15,#gsu_01d624
    nop

gsu_01ac93:
    alt1
    rpix
    stop
    .db $01

gsu_01ac97:
    alt1
    lm r1,($021e)
    with r1
    from r1
    bne gsu_01aca2
    nop
    jmp r11
    nop

gsu_01aca2:
    from r11
    stw (r10)
    inc r10
    inc r10

gsu_01aca6:
    sub r0
    alt3
    romb
    alt2
    sms ($132),r0
    from r1
    stw (r10)
    inc r10
    inc r10
    inc r1
    inc r1
    inc r1
    inc r1
    alt1
    ldb (r1)
    alt2
    sms ($020),r0
    inc r1
    alt1
    ldb (r1)
    alt2
    sms ($022),r0
    inc r1
    alt1
    ldb (r1)
    alt2
    sms ($024),r0
    inc r1
    to r4
    alt1
    ldb (r1)
    inc r1
    to r3
    ldw (r1)
    inc r1
    inc r1
    alt1
    lms r0,($1a2)
    lob
    beq gsu_01ad13
    nop
    ibt r0,#$00
    ibt r5,#$04
    from r4
    and r5
    beq gsu_01ace1
    nop
    iwt r0,#$1000

gsu_01ace1:
    alt2
    sms ($054),r0
    ibt r5,#$0c
    from r4
    and r5
    bne gsu_01acef
    nop
    iwt r15,#gsu_01af6c
    nop

gsu_01acef:
    ibt r14,#$14
    from r3
    to r14
    add r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    ldw (r1)
    alt2
    sms ($028),r0
    inc r1
    inc r1
    ldw (r1)
    alt2
    sms ($026),r0
    inc r1
    inc r1
    ldw (r1)
    alt2
    sms ($02a),r0
    inc r1
    inc r1
    inc r1
    inc r1
    inc r1
    inc r1
    bra gsu_01ad34
    nop

gsu_01ad13:
    ibt r5,#$04
    from r4
    and r5
    beq gsu_01ad1e
    nop
    iwt r15,#gsu_01af6c
    nop

gsu_01ad1e:
    inc r1
    inc r1
    inc r1
    inc r1
    inc r1
    inc r1
    ldw (r1)
    alt2
    sms ($028),r0
    inc r1
    inc r1
    ldw (r1)
    alt2
    sms ($026),r0
    inc r1
    inc r1
    ldw (r1)
    alt2
    sms ($02a),r0

gsu_01ad34:
    with r0
    to r6
    inc r1
    inc r1
    iwt r5,#$0010
    from r4
    and r5
    beq gsu_01ad94
    nop
    ibt r0,#$f4
    to r1
    add r1
    ldw (r1)
    alt2
    sms ($136),r0
    inc r1
    inc r1
    alt1
    ldb (r1)
    lob
    alt2
    sms ($13c),r0
    inc r1
    alt1
    ldb (r1)
    lob
    alt2
    sms ($13e),r0
    inc r1
    alt1
    ldb (r1)
    lob
    ibt r5,#$07
    and r5
    bne gsu_01ad63
    nop
    ibt r0,#$ff

gsu_01ad63:
    alt2
    sms ($132),r0
    alt1
    lm r0,($1a28)
    with r0
    from r0
    beq gsu_01ad90
    nop
    alt1
    lms r0,($132)
    with r0
    from r0
    beq gsu_01ad90
    nop
    bmi gsu_01ad88
    nop
    alt1
    lms r1,($13e)
    alt1
    lms r2,($136)
    alt1
    lms r3,($13c)
    link #4
    iwt r15,#gsu_01d198
    nop

gsu_01ad88:
    alt1
    lms r2,($136)
    link #4
    iwt r15,#gsu_01d471
    nop

gsu_01ad90:
    iwt r15,#gsu_01af6c
    nop

gsu_01ad94:
    ibt r5,#$40
    from r4
    and r5
    beq gsu_01add5
    nop
    ldw (r1)
    alt2
    sms ($01a),r0
    ibt r0,#$14
    alt2
    sms ($01c),r0
    inc r1
    inc r1
    inc r1
    inc r1
    inc r1
    alt1
    ldb (r1)
    inc r1
    to r5
    alt1
    ldb (r1)
    with r5
    sex
    alt2
    sms ($0b6),r5
    ibt r5,#$0f
    alt3
    cmp r5
    bne gsu_01adcc
    nop
    from r6
    hib
    lsr
    lsr
    ibt r5,#$05
    alt3
    cmp r5
    bcc gsu_01adc8
    nop
    with r5
    to r0

gsu_01adc8:
    ibt r5,#$0e
    from r5
    sub r0

gsu_01adcc:
    link #4
    iwt r15,#gsu_01cef0
    nop
    iwt r15,#gsu_01af6c
    nop

gsu_01add5:
    ibt r5,#$02
    from r4
    and r5
    bne gsu_01adf5
    nop
    ibt r5,#$01
    from r4
    and r5
    beq gsu_01ae0c
    nop
    iwt r5,#$82ed
    alt2
    sms ($04a),r5
    bra gsu_01ae31
    nop

gsu_01adec:
    iwt r5,#$80fc
    alt2
    sms ($04a),r5
    bra gsu_01ae31
    nop

gsu_01adf5:
    ibt r5,#$20
    from r4
    and r5
    bne gsu_01ae0c
    nop
    ibt r5,#$01
    from r4
    and r5
    bne gsu_01adec
    nop
    iwt r5,#$800c
    alt2
    sms ($04a),r5
    bra gsu_01ae31
    nop

gsu_01ae0c:
    ldw (r1)
    with r0
    from r0
    bne gsu_01ae2e
    nop
    ibt r14,#$12
    from r3
    to r14
    add r14
    getb
    inc r14
    alt1
    getbh
    iwt r5,#$8213
    alt3
    cmp r5
    bne gsu_01ae2e
    nop
    alt1
    lm r5,($1a2a)
    with r5
    from r5
    beq gsu_01ae2e
    nop
    with r5
    to r0

gsu_01ae2e:
    alt2
    sms ($04a),r0

gsu_01ae31:
    inc r1
    inc r1
    ibt r14,#$07
    from r3
    to r14
    add r14
    getb
    alt2
    sms ($032),r0
    from r3
    stw (r10)
    inc r10
    inc r10
    with r6
    to r0
    iwt r5,#$0bb8
    alt3
    cmp r5
    bcs gsu_01ae5d
    nop
    iwt r5,#$07d0
    alt3
    cmp r5
    bcs gsu_01ae6b
    nop
    iwt r5,#$03e8
    alt3
    cmp r5
    bcs gsu_01ae79
    nop
    bra gsu_01ae84
    nop

gsu_01ae5d:
    ibt r14,#$1a
    from r3
    to r14
    add r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    bra gsu_01ae84
    nop

gsu_01ae6b:
    ibt r14,#$18
    from r3
    to r14
    add r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh
    bra gsu_01ae84
    nop

gsu_01ae79:
    ibt r14,#$16
    from r3
    to r14
    add r14
    to r3
    getb
    inc r14
    with r3
    alt1
    getbh

gsu_01ae84:
    ibt r14,#$00
    from r3
    to r14
    add r14
    getb
    inc r14
    alt1
    getbh
    alt2
    sms ($016),r0
    ibt r14,#$02
    from r3
    to r14
    add r14
    getb
    alt2
    sms ($01c),r0
    ibt r14,#$03
    from r3
    to r14
    add r14
    getb
    inc r14
    alt1
    getbh
    alt2
    sms ($018),r0
    dec r10
    dec r10
    to r3
    ldw (r10)
    alt1
    ldb (r1)
    inc r1
    alt2
    sms ($048),r0
    alt1
    ldb (r1)
    alt2
    sms ($044),r0
    inc r1
    alt1
    ldb (r1)
    alt2
    sms ($046),r0
    inc r1
    ibt r5,#$20
    from r4
    and r5
    beq gsu_01aef5
    nop
    alt1
    lms r0,($1a2)
    lob
    bne gsu_01aef5
    nop
    sub r0
    alt3
    romb
    ibt r14,#$10
    from r3
    to r14
    add r14
    getb
    inc r14
    alt1
    getbh
    alt2
    sms ($098),r0
    alt1
    ldb (r1)
    alt2
    sms ($0c4),r0
    inc r1
    alt1
    ldb (r1)
    sex
    alt2
    sms ($0bc),r0
    alt1
    lms r0,($016)
    with r0
    from r0
    beq gsu_01aef1
    nop
    link #4
    iwt r15,#gsu_01cca8
    nop

gsu_01aef1:
    iwt r15,#gsu_01af6c
    nop

gsu_01aef5:
    alt1
    ldb (r1)
    alt2
    sms ($1a4),r0
    inc r1
    sub r0
    alt1
    ldb (r1)
    swap
    alt2
    sms ($0ae),r0
    inc r1
    alt1
    ldb (r1)
    swap
    alt2
    sms ($0b0),r0
    inc r1
    alt1
    lms r0,($018)
    with r0
    from r0
    beq gsu_01af6c
    nop
    sub r0
    alt3
    romb
    ibt r14,#$10
    with r14
    add r3
    to r5
    getb
    inc r14
    with r5
    alt1
    getbh
    alt1
    lms r6,($02a)
    from r6
    add r5
    bmi gsu_01af63
    nop
    with r5
    add r5
    with r6
    asr
    alt1
    lms r1,($026)
    with r1
    from r1
    bmi gsu_01af3d
    nop
    from r1
    sub r5
    sub r6
    bpl gsu_01af63
    nop
    iwt r15,#gsu_01af45
    nop

gsu_01af3d:
    from r5
    not
    inc r0
    sub r1
    sub r6
    bpl gsu_01af63
    nop

gsu_01af45:
    alt1
    lms r2,($028)
    with r2
    from r2
    bmi gsu_01af57
    nop
    from r2
    sub r5
    sub r6
    bpl gsu_01af63
    nop
    iwt r15,#gsu_01af67
    nop

gsu_01af57:
    from r5
    not
    inc r0
    sub r2
    sub r6
    bpl gsu_01af63
    nop
    iwt r15,#gsu_01af67
    nop

gsu_01af63:
    iwt r15,#gsu_01af6c
    nop

gsu_01af67:
    link #4
    iwt r15,#gsu_018456
    nop

gsu_01af6c:
    dec r10
    dec r10
    to r1
    ldw (r10)
    to r1
    ldw (r1)
    with r1
    from r1
    beq gsu_01af7b
    nop
    iwt r15,#gsu_01aca6
    nop

gsu_01af7b:
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01af81:
    from r11
    stw (r10)
    inc r10
    inc r10
    iwt r1,#$00b0
    iwt r2,#$00b0
    ibt r3,#$28
    ibt r4,#$08
    ibt r0,#$0d
    link #4
    iwt r15,#gsu_01b06c
    nop
    alt1
    lms r3,($1bc)
    with r3
    lob
    ibt r0,#$24
    alt3
    cmp r3
    bge gsu_01afa4
    nop
    with r0
    to r3

gsu_01afa4:
    iwt r1,#$00b2
    iwt r2,#$00b2
    ibt r4,#$04
    ibt r0,#$07
    link #4
    iwt r15,#gsu_01b053
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01afb8:
    from r11
    stw (r10)
    inc r10
    inc r10
    ibt r1,#$08
    iwt r2,#$00b0
    ibt r3,#$28
    ibt r4,#$08
    ibt r0,#$0d
    link #4
    iwt r15,#gsu_01b06c
    nop
    alt1
    lms r3,($1b8)
    with r3
    lob
    ibt r0,#$24
    alt3
    cmp r3
    bge gsu_01afda
    nop
    with r0
    to r3

gsu_01afda:
    ibt r1,#$0a
    iwt r2,#$00b2
    ibt r4,#$04
    ibt r0,#$04
    link #4
    iwt r15,#gsu_01b053
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01afed:
    from r11
    stw (r10)
    inc r10
    inc r10
    alt1
    lms r0,($19a)
    alt2
    add #10
    to r1
    lob
    alt1
    lms r0,($19c)
    lob
    alt3
    cmp r1
    bcc gsu_01b006
    nop
    ibt r0,#$00
    alt2
    sms ($19c),r0

gsu_01b006:
    alt1
    lms r0,($19a)
    to r3
    lob
    beq gsu_01b04a
    nop
    bpl gsu_01b013
    nop
    with r3
    lsr

gsu_01b013:
    inc r3
    inc r3
    inc r3
    inc r3
    ibt r4,#$06
    iwt r0,#$00de
    to r1
    sub r3
    ibt r2,#$02
    with r1
    to r5
    with r2
    to r6
    ibt r0,#$0e
    link #4
    iwt r15,#gsu_01b06c
    nop
    with r5
    to r1
    with r6
    to r2
    inc r1
    inc r1
    inc r2
    inc r2
    alt1
    lms r0,($19c)
    to r3
    lob
    alt1
    lms r0,($19a)
    lob
    bpl gsu_01b041
    nop
    with r3
    lsr

gsu_01b041:
    ibt r4,#$02
    ibt r0,#$02
    link #4
    iwt r15,#gsu_01b053
    nop

gsu_01b04a:
    sub r0
    alt2
    sms ($19c),r0
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01b053:
    with r3
    from r3
    beq gsu_01b06a
    color
    with r4
    from r4
    beq gsu_01b06a
    nop
    cache

gsu_01b05e:
    with r12
    from r3
    with r15
    to r13
    loop
    plot
    with r1
    sub r3
    dec r4
    bne gsu_01b05e
    inc r2

gsu_01b06a:
    jmp r11
    nop

gsu_01b06c:
    cache
    color
    with r3
    to r12
    with r15
    to r13
    loop
    plot
    with r4
    to r12
    dec r12
    dec r12
    with r15
    to r13
    inc r2
    with r1
    sub r3
    plot
    with r1
    add r3
    dec r1
    dec r1
    loop
    plot
    with r1
    sub r3
    inc r2
    with r3
    to r12
    with r15
    to r13
    loop
    plot
    jmp r11
    nop
    cache
    with r12
    from r3
    beq gsu_01b099
    color
    with r15
    to r13
    loop
    plot

gsu_01b099:
    jmp r11
    nop
    sub r0
    iwt r1,#$2c00
    iwt r12,#$2000
    cache
    with r15
    to r13
    stw (r1)
    inc r1
    loop
    inc r1
    stop
    .db $01
    sub r0
    iwt r1,#$2c00
    iwt r12,#$1800
    cache
    with r15
    to r13
    stw (r1)
    inc r1
    loop
    inc r1
    stop
    .db $01

gsu_01b0bb:
    sub r0
    iwt r1,#$5600
    iwt r12,#$1500
    cache
    with r15
    to r13
    stw (r1)
    inc r1
    loop
    inc r1
    jmp r11
    nop
    alt1
    lms r0,($1b2)
    lob
    beq gsu_01b0e0
    nop
    sub r0
    iwt r1,#$2c00
    iwt r12,#$1500
    cache
    with r15
    to r13
    stw (r1)
    inc r1
    loop
    inc r1

gsu_01b0e0:
    stop
    .db $01,$3d,$a0,$d9,$9e,$09,$0f,$01,$60,$f1,$00,$56,$fc,$00,$15,$02
    .db $2f,$1d,$31,$d1,$3c,$d1,$00,$01,$60,$3e,$df,$f1,$00,$00,$f2,$3c
    .db $00,$f3,$a0,$0f,$94,$ff,$63,$92,$01,$f0,$20,$00,$22,$50,$22,$14
    .db $f3,$64,$0f,$fa,$c2,$04,$02,$f1,$00,$00,$f2,$3c,$00,$b7,$3a,$da
    .db $da,$b6,$3a,$da,$da,$b4,$3a,$da,$da,$b3,$3a,$da,$da,$94,$ff,$63
    .db $92,$01,$f0,$20,$00,$22,$50,$ea,$ea,$13,$4a,$ea,$ea,$14,$4a,$ea
    .db $ea,$16,$4a,$ea,$ea,$17,$4a,$b2,$64,$09,$1a,$01,$22,$14,$3d,$36
    .db $d6,$27,$3f,$c1,$08,$05,$01,$60,$05,$04,$01,$f0,$00,$01,$3d,$36
    .db $d6,$4d,$3d,$36,$d6,$f0,$3c,$00,$23,$60,$0b,$06,$01,$3f,$66,$0b
    .db $a6,$01,$60,$3d,$36,$d6,$3d,$36,$d6,$3d,$36,$d6,$00,$01
    sub r0
    alt3
    romb
    alt2
    sm ($021e),r0
    iwt r9,#$0ef2
    alt1
    lms r12,($1b6)
    with r12
    lob
    bne gsu_01b193
    nop
    stop
    .db $01

gsu_01b193:
    cache
    with r15
    to r13
    ibt r8,#$07
    with r8
    add r9
    alt1
    ldb (r8)
    ibt r1,#$08
    and r1
    beq gsu_01b208
    nop
    ibt r8,#$12
    with r8
    add r9
    to r1
    ldw (r8)
    alt1
    lm r0,($0220)
    alt1
    lms r2,($0c8)
    to r2
    sub r2
    ibt r8,#$14
    with r8
    add r9
    to r3
    ldw (r8)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$0c
    with r8
    add r9
    stw (r8)
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$0a
    with r8
    add r9
    stw (r8)
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$0e
    with r8
    add r9
    stw (r8)

gsu_01b208:
    ibt r8,#$12
    with r8
    add r9
    to r1
    ldw (r8)
    ibt r8,#$10
    with r8
    add r9
    to r2
    ldw (r8)
    ibt r8,#$14
    with r8
    add r9
    to r3
    ldw (r8)
    alt1
    lms r6,($0d2)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0d8)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0de)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$12
    with r8
    add r9
    stw (r8)
    alt1
    lms r6,($0d4)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0da)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e0)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$10
    with r8
    add r9
    stw (r8)
    alt1
    lms r6,($0d6)
    from r1
    fmult
    to r5
    rol
    alt1
    lms r6,($0dc)
    from r2
    fmult
    rol
    with r5
    add r0
    alt1
    lms r6,($0e2)
    from r3
    fmult
    rol
    add r5
    ibt r8,#$14
    with r8
    add r9
    stw (r8)
    ibt r8,#$07
    with r8
    add r9
    alt1
    ldb (r8)
    ibt r1,#$04
    and r1
    beq gsu_01b295
    nop
    ibt r8,#$12
    with r8
    add r9
    ldw (r8)
    ibt r8,#$0c
    with r8
    add r9
    stw (r8)
    ibt r8,#$10
    with r8
    add r9
    ldw (r8)
    ibt r8,#$0a
    with r8
    add r9
    stw (r8)
    ibt r8,#$14
    with r8
    add r9
    ldw (r8)
    ibt r8,#$0e
    with r8
    add r9
    stw (r8)

gsu_01b295:
    ibt r8,#$08
    with r8
    add r9
    ldw (r8)
    iwt r1,#$0005
    to r14
    add r1
    getb
    inc r14
    ibt r8,#$14
    with r8
    add r9
    to r1
    ldw (r8)
    alt1
    getbh
    to r1
    add r1
    ibt r8,#$02
    with r8
    add r9
    ldw (r8)
    to r1
    add r1
    ibt r2,#$00
    alt1
    lm r7,($021e)
    with r7
    from r7
    bne gsu_01b2c6
    nop
    alt2
    sm ($021e),r9
    with r2
    to r7
    bra gsu_01b2ed
    nop

gsu_01b2c6:
    inc r7
    inc r7
    ldw (r7)
    dec r7
    dec r0
    alt3
    cmp r1
    bpl gsu_01b2e1
    dec r7
    with r2
    from r2
    bne gsu_01b2dc
    nop
    alt2
    sm ($021e),r9
    bra gsu_01b2ed
    nop

gsu_01b2dc:
    from r9
    stw (r2)
    bra gsu_01b2ed
    nop

gsu_01b2e1:
    with r7
    to r2
    to r7
    ldw (r7)
    with r7
    from r7
    bne gsu_01b2c6
    nop
    bra gsu_01b2dc
    nop

gsu_01b2ed:
    ibt r8,#$02
    with r8
    add r9
    from r1
    stw (r8)
    ibt r8,#$00
    with r8
    add r9
    from r7
    stw (r8)
    ibt r0,#$1e
    to r9
    add r9
    loop
    nop
    stop
    .db $01
    alt1
    lms r0,($064)
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    lms r14,($062)
    dec r14
    to r1
    getb
    dec r14
    with r1
    alt1
    getbh
    dec r14
    dec r14
    dec r14
    to r3
    getb
    dec r14
    with r3
    alt1
    getbh
    dec r14
    to r2
    getb
    dec r14
    with r2
    alt1
    getbh
    alt1
    lms r9,($02c)
    with r1
    add r9
    alt2
    sms ($05a),r1
    ibt r4,#$00
    ibt r6,#$00
    ibt r5,#$00
    iwt r7,#$b4b6
    cache
    with r15
    to r8
    ibt r12,#$03
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    ibt r0,#$ff
    and r4
    bne gsu_01b348
    nop
    iwt r15,#gsu_01b3c1
    nop

gsu_01b348:
    ibt r0,#$07
    alt3
    cmp r4
    bne gsu_01b380
    nop
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    bne gsu_01b35d
    nop
    link #4
    iwt r15,#gsu_01b49a
    dec r14

gsu_01b35d:
    bcc gsu_01b376
    nop
    ibt r12,#$0a
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    with r4
    from r4
    bne gsu_01b380
    nop
    ibt r12,#$12
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    bra gsu_01b380
    nop

gsu_01b376:
    ibt r12,#$04
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    with r4
    alt2
    add #7

gsu_01b380:
    ibt r12,#$08
    with r15
    to r13
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    beq gsu_01b39e
    nop
    with r6
    rol
    with r5
    rol
    loop
    nop
    dec r1
    from r6
    alt1
    stb (r1)
    dec r4
    bne gsu_01b380
    nop
    bra gsu_01b3c1
    nop

gsu_01b39e:
    dec r14
    to r3
    getb
    dec r14
    with r3
    alt1
    getbh
    dec r14
    to r2
    getb
    dec r14
    with r2
    alt1
    getbh
    ibt r0,#$01
    ror
    with r2
    ror
    with r3
    ror
    with r6
    rol
    with r5
    rol
    loop
    nop
    dec r1
    from r6
    alt1
    stb (r1)
    dec r4
    bne gsu_01b380
    nop

gsu_01b3c1:
    with r9
    alt3
    cmp r1
    bne gsu_01b3e6
    ibt r12,#$02
    alt2
    sms ($062),r14
    alt1
    lms r3,($090)
    with r3
    from r3
    beq gsu_01b3e4
    nop
    alt1
    lms r1,($02c)
    alt1
    lms r2,($05a)
    to r12
    from r2
    sub r1
    with r15
    to r13
    ldw (r1)
    add r3
    stw (r1)
    inc r1
    loop
    inc r1

gsu_01b3e4:
    stop
    .db $01

gsu_01b3e6:
    cache
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    ibt r6,#$02
    ibt r5,#$00
    ibt r12,#$08
    with r4
    from r4
    bne gsu_01b3fb
    nop
    iwt r15,#gsu_01b486
    nop

gsu_01b3fb:
    ibt r6,#$04
    ibt r0,#$02
    alt3
    cmp r4
    beq gsu_01b45e
    nop
    ibt r6,#$03
    ibt r0,#$01
    alt3
    cmp r4
    beq gsu_01b445
    nop
    ibt r12,#$02
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    ibt r0,#$03
    alt3
    cmp r4
    beq gsu_01b439
    nop
    ibt r0,#$02
    alt3
    cmp r4
    beq gsu_01b42a
    nop
    with r4
    alt2
    add #5
    with r4
    to r6
    bra gsu_01b45e
    nop

gsu_01b42a:
    ibt r12,#$02
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    with r4
    alt2
    add #7
    with r4
    to r6
    bra gsu_01b45e
    nop

gsu_01b439:
    ibt r12,#$08
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    with r4
    to r6
    bra gsu_01b45e
    nop

gsu_01b445:
    ibt r12,#$08
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    bne gsu_01b456
    nop
    link #4
    iwt r15,#gsu_01b49a
    dec r14
    nop

gsu_01b456:
    bcs gsu_01b486
    nop
    ibt r12,#$0e
    bra gsu_01b486
    nop

gsu_01b45e:
    ibt r12,#$10
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    bne gsu_01b46e
    nop
    link #4
    iwt r15,#gsu_01b49a
    dec r14

gsu_01b46e:
    bcc gsu_01b486
    nop
    ibt r12,#$08
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    bne gsu_01b481
    nop
    link #4
    iwt r15,#gsu_01b49a
    dec r14

gsu_01b481:
    bcs gsu_01b486
    nop
    ibt r12,#$0c

gsu_01b486:
    link #4
    iwt r15,#gsu_01b4b2
    with r4
    dec r6

gsu_01b48c:
    from r1
    add r4
    dec r0
    alt1
    ldb (r0)
    dec r1
    alt1
    stb (r1)
    dec r6
    bpl gsu_01b48c
    nop
    jmp r8
    nop

gsu_01b49a:
    to r3
    getb
    dec r14
    with r3
    alt1
    getbh
    dec r14
    to r2
    getb
    dec r14
    with r2
    alt1
    getbh
    ibt r0,#$01
    ror
    with r2
    ror
    with r3
    ror
    from r2
    or r3
    jmp r11
    nop

gsu_01b4b2:
    sub r4
    with r7
    to r13
    with r2
    lsr
    with r3
    ror
    from r2
    or r3
    beq gsu_01b4c4
    nop
    with r4
    rol
    loop
    with r2
    jmp r11
    nop

gsu_01b4c4:
    dec r14
    to r3
    getb
    dec r14
    with r3
    alt1
    getbh
    dec r14
    to r2
    getb
    dec r14
    with r2
    alt1
    getbh
    ibt r0,#$01
    ror
    with r2
    ror
    with r3
    ror
    with r4
    rol
    loop
    with r2
    jmp r11
    nop
    iwt r1,#$0200
    iwt r12,#$3f00
    with r15
    to r13
    sub r0
    stw (r1)
    inc r1
    loop
    inc r1
    stop
    .db $01
    ibt r0,#$01
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    cmode
    alt1
    lms r1,($062)
    iwt r0,#$00af
    sub r1
    alt2
    sms ($0a8),r0
    alt1
    lms r14,($0a6)
    ibt r0,#$09
    bra gsu_01b55e
    nop
    ibt r0,#$01
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    cmode
    alt1
    lms r1,($062)
    alt1
    lms r0,($0a8)
    sub r1
    alt2
    sms ($0a8),r0
    alt1
    lm r0,($0206)
    lob
    color
    alt1
    lms r14,($0a6)
    inc r14
    bra gsu_01b566
    nop
    ibt r0,#$01
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    cmode
    alt1
    lms r1,($062)
    iwt r0,#$00ae
    sub r1
    alt2
    sms ($0a8),r0
    bra gsu_01b55a
    nop
    ibt r0,#$01
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    cmode
    bra gsu_01b55a
    nop
    ibt r0,#$01
    alt3
    romb
    sub r0
    alt2
    ramb
    alt1
    cmode
    iwt r0,#$00e0
    alt2
    sms ($0a8),r0

gsu_01b55a:
    alt1
    lms r14,($0a6)
    getb

gsu_01b55e:
    inc r14
    lob
    color
    ibt r0,#$ff
    alt2
    sms ($0bc),r0

gsu_01b566:
    alt1
    lms r2,($02c)
    sub r0
    alt2
    sms ($0be),r0
    iwt r3,#$e696
    iwt r4,#$d90a
    alt2
    sms ($098),r14
    alt2
    sms ($0a0),r4
    alt2
    sms ($09e),r3

gsu_01b57c:
    link #4
    iwt r15,#gsu_01b604
    nop
    with r10
    from r10
    bne gsu_01b58a
    nop
    iwt r15,#gsu_01b600
    nop

gsu_01b58a:
    alt1
    lms r1,($062)
    iwt r3,#$07c2
    iwt r4,#$05c2
    iwt r5,#$d996
    with r1
    to r9
    cache

gsu_01b599:
    alt1
    lms r0,($0bc)
    with r0
    from r0
    bne gsu_01b5aa
    nop
    alt1
    ldb (r3)
    lob
    alt2
    sms ($0be),r0
    bra gsu_01b600
    nop

gsu_01b5aa:
    nop
    dec r0
    alt2
    sms ($0bc),r0
    alt1
    ldb (r3)
    inc r3
    lob
    bne gsu_01b5be
    nop
    with r9
    alt2
    add #5
    inc r4
    dec r10
    bra gsu_01b599
    nop

gsu_01b5be:
    alt3
    umult #12
    add r0
    from r5
    to r14
    add r0
    to r6
    alt1
    ldb (r4)
    inc r4
    with r6
    from r6
    beq gsu_01b5e8
    nop
    with r6
    to r7
    ibt r12,#$0c
    with r15
    to r13
    getb
    inc r14
    alt1
    getbh
    inc r14
    with r9
    to r1
    with r7
    to r6

gsu_01b5dc:
    add r0
    bcc gsu_01b5e2
    nop
    plot
    dec r1

gsu_01b5e2:
    dec r6
    bne gsu_01b5dc
    inc r1
    loop
    inc r2

gsu_01b5e8:
    with r2
    alt2
    sub #12
    with r9
    add r7
    dec r10
    bne gsu_01b599
    nop
    alt1
    lms r14,($094)
    with r14
    from r14
    beq gsu_01b600
    nop
    with r2
    alt2
    add #13
    iwt r15,#gsu_01b57c
    nop

gsu_01b600:
    alt1
    rpix
    stop
    .db $01

gsu_01b604:
    alt1
    lms r14,($098)
    alt1
    lms r3,($09e)
    alt1
    lms r4,($0a0)
    iwt r5,#$07c2
    iwt r6,#$05c2
    ibt r7,#$00
    alt2
    sms ($094),r7
    ibt r10,#$00
    cache

gsu_01b61b:
    getb
    lob
    bne gsu_01b622
    inc r14
    jmp r11
    nop

gsu_01b622:
    alt1
    lms r8,($0a8)
    with r8
    alt3
    cmp r7
    bcs gsu_01b645
    nop
    alt1
    lms r14,($098)
    alt1
    lms r3,($09e)
    alt1
    lms r4,($0a0)
    alt1
    lms r10,($09c)
    alt1
    lms r7,($09a)
    alt2
    sms ($094),r14
    alt2
    sms ($0a2),r3
    alt2
    sms ($0a4),r4
    jmp r11
    nop

gsu_01b645:
    ibt r8,#$20
    alt3
    cmp r8
    bne gsu_01b65b
    nop
    alt2
    sms ($098),r14
    alt2
    sms ($09e),r3
    alt2
    sms ($0a0),r4
    alt2
    sms ($09c),r10
    alt2
    sms ($09a),r7

gsu_01b65b:
    with r14
    to r8
    from r3
    to r14
    add r0
    getb
    alt1
    stb (r5)
    inc r5
    from r4
    to r14
    add r0
    getb
    with r7
    add r0
    alt1
    stb (r6)
    inc r6
    with r8
    to r14
    inc r10
    iwt r15,#gsu_01b61b
    nop
    ibt r0,#$0e
    alt1
    lms r1,($062)
    alt1
    lms r2,($02c)
    iwt r3,#$0068
    iwt r4,#$000c
    link #4
    iwt r15,#gsu_01b06c
    nop
    ibt r0,#$07
    alt1
    lms r1,($062)
    inc r1
    inc r1
    alt1
    lms r2,($02c)
    inc r2
    inc r2
    alt1
    lms r3,($06c)
    iwt r4,#$0008
    link #4
    iwt r15,#gsu_01b053
    nop
    alt1
    rpix
    stop
    .db $01,$3d,$a0,$31,$a2,$64,$14,$82,$60,$3d,$a6,$16,$94,$ff,$83,$81
    .db $01,$3e,$a4,$31,$00,$01,$60,$3d,$a4,$31,$3d,$a6,$16,$94,$ff,$92
    .db $81,$01,$3e,$a4,$31,$00,$01,$3d,$a4,$17,$a3,$64,$23,$3f,$64,$09
    .db $04,$01,$06,$0c,$01,$3d,$a0,$31,$3e,$68,$3e,$a0,$31,$05,$11,$01
    .db $a3,$09,$23,$3f,$64,$07,$09,$01,$3d,$a0,$31,$3e,$58,$3e,$a0,$31
    .db $94,$ff,$ff,$b6,$01,$00,$01,$94,$ff,$ff,$b6,$01,$00,$01,$2b,$1a
    .db $60,$3d,$4e,$a0,$0e,$4e,$02,$a0,$01,$3f,$df,$60,$3d,$a3,$17,$a4
    .db $64,$a5,$00,$23,$64,$0a,$fc,$d0,$23,$54,$3e,$a3,$17,$e0,$09,$07
    .db $01,$94,$ff,$68,$b7,$01,$d5,$60,$3d,$a3,$17,$a4,$0a,$23,$64,$0a
    .db $fc,$d0,$23,$54,$3e,$a3,$17,$e0,$08,$06,$01,$25,$b5,$09,$06,$01
    .db $94,$ff,$68,$b7,$01,$60,$3d,$a3,$17,$a4,$01,$e3,$0a,$fd,$d0,$e0
    .db $94,$ff,$68,$b7,$01,$3d,$4c,$9a,$01,$60,$94,$ff,$68,$b7,$01,$60
    .db $94,$ff,$68,$b7,$01,$00,$01,$fe,$96,$d9,$3e,$8c,$50,$2e,$50,$3d
    .db $a1,$31,$3d,$a2,$16,$60,$ac,$0d,$2f,$1d,$a3,$0f,$50,$0c,$03,$01
    .db $4c,$e1,$e3,$08,$f7,$d1,$ef,$de,$3d,$ef,$de,$3d,$a1,$31,$3c,$d2
    .db $21,$3e,$58,$3e,$a1,$31,$9b,$01,$3d,$a0,$17,$9e,$09,$30,$01,$60
    .db $3d,$4e,$a0,$0e,$3d,$a1,$31,$3d,$a2,$16,$f3,$2c,$00,$f4,$0c,$00
    .db $94,$ff,$6c,$b0,$01,$a0,$02,$3d,$a1,$31,$d1,$d1,$3d,$a2,$16,$d2
    .db $d2,$3d,$a3,$17,$f4,$08,$00,$94,$ff,$53,$b0,$01,$3d,$4c,$00,$01
    sub r0
    alt1
    cmode
    ibt r0,#$0e
    alt1
    lms r1,($062)
    alt1
    lms r2,($02c)
    iwt r3,#$002c
    iwt r4,#$000c
    link #4
    iwt r15,#gsu_01b06c
    nop
    alt1
    lms r1,($062)
    inc r1
    inc r1
    alt1
    lms r2,($02c)
    inc r2
    inc r2
    alt1
    lms r3,($02e)
    from r3
    lob
    beq gsu_01b805
    nop
    ibt r0,#$02
    iwt r4,#$0008
    link #4
    iwt r15,#gsu_01b053
    nop
    alt1
    rpix

gsu_01b805:
    stop
    .db $01
    sub r0
    alt2
    ramb
    alt3
    romb
    alt1
    cmode
    iwt r10,#$04c2
    alt1
    lms r1,($026)
    alt1
    lms r2,($028)
    alt1
    lms r3,($02a)
    alt1
    lms r4,($1d6)
    alt1
    lms r5,($1d8)
    alt1
    lms r6,($1da)
    link #4
    iwt r15,#gsu_0180bc
    nop
    from r1
    hib
    sex
    alt2
    sms ($0f4),r0
    from r2
    hib
    sex
    alt2
    sms ($0f6),r0
    from r3
    hib
    sex
    alt2
    sms ($0f8),r0
    ibt r0,#$03
    alt3
    romb
    alt1
    lms r0,($098)
    alt3
    umult #3
    iwt r1,#$8918
    to r14
    add r1
    getb
    inc r14
    alt1
    getbh
    alt2
    sms ($096),r0
    alt1
    lms r0,($020)
    alt1
    lms r0,($022)
    alt1
    lms r0,($024)
    iwt r9,#$0120
    link #4
    iwt r15,#gsu_01829f
    nop
    alt1
    lms r1,($120)
    alt1
    lms r2,($122)
    alt1
    lms r3,($124)
    link #4
    iwt r15,#gsu_0180c5
    nop
    alt2
    sms ($120),r1
    alt2
    sms ($122),r2
    alt2
    sms ($124),r3
    alt1
    lms r1,($126)
    alt1
    lms r2,($128)
    alt1
    lms r3,($12a)
    link #4
    iwt r15,#gsu_0180c5
    nop
    alt2
    sms ($126),r1
    alt2
    sms ($128),r2
    alt2
    sms ($12a),r3
    alt1
    lms r1,($12c)
    alt1
    lms r2,($12e)
    alt1
    lms r3,($130)
    link #4
    iwt r15,#gsu_0180c5
    nop
    alt2
    sms ($12c),r1
    alt2
    sms ($12e),r2
    alt2
    sms ($130),r3
    nop
    alt1
    lms r8,($1f2)
    from r8
    alt1
    umult r8
    alt2
    sms ($1f4),r0
    sub r0
    alt3
    romb
    iwt r0,#$9647
    add r8
    to r14
    add r8
    getb
    inc r14
    alt1
    getbh
    alt2
    sms ($1f6),r0
    with r0
    to r6
    iwt r1,#$0120
    iwt r2,#$01be
    ibt r12,#$09
    with r15
    to r13
    ldw (r1)
    inc r1
    inc r1
    fmult
    rol
    with r0
    from r0
    bpl gsu_01b8d6
    nop
    inc r0

gsu_01b8d6:
    stw (r2)
    inc r2
    inc r2
    loop
    nop
    alt1
    lms r0,($030)
    fmult
    to r6
    rol
    alt1
    lms r0,($0f4)
    swap
    fmult
    rol
    alt2
    sms ($1d0),r0
    alt1
    lms r0,($0f6)
    swap
    fmult
    rol
    alt2
    sms ($1d2),r0
    alt1
    lms r0,($0f8)
    swap
    fmult
    rol
    alt2
    sms ($1d4),r0
    alt1
    lms r0,($1c4)
    add r0
    sbk
    alt1
    lms r0,($1be)
    add r0
    sbk
    alt1
    lms r0,($1ca)
    add r0
    sbk
    alt1
    lms r0,($1d0)
    add r0
    sbk
    sub r0
    alt2
    sms ($1e4),r0
    alt2
    sms ($1e6),r0
    alt2
    sms ($1e8),r0
    alt2
    sms ($1ea),r0
    ibt r7,#$00

gsu_01b91f:
    alt2
    sms ($1fc),r7
    from r7
    to r3
    alt1
    umult r7
    from r8
    alt1
    umult r8
    to r3
    sub r3
    link #4
    iwt r15,#gsu_01b9a1
    nop
    alt2
    sms ($198),r6
    link #4
    iwt r15,#gsu_01b9c2
    nop
    alt1
    lms r7,($1fc)
    alt1
    lms r0,($1fa)
    to r2
    sub r7
    alt1
    lms r0,($03c)
    from r2
    sub r0
    blt gsu_01b94f
    nop
    ibt r4,#$ff
    link #4
    iwt r15,#gsu_01ba20
    nop

gsu_01b94f:
    alt1
    lms r7,($1fc)
    alt1
    lms r0,($1fa)
    to r2
    add r7
    alt1
    lms r0,($03e)
    inc r0
    from r2
    sub r0
    bge gsu_01b967
    nop
    ibt r4,#$01
    link #4
    iwt r15,#gsu_01ba20
    nop

gsu_01b967:
    alt1
    lms r4,($1c6)
    alt1
    lms r0,($1e4)
    add r4
    sbk
    alt1
    lms r4,($1c0)
    alt1
    lms r0,($1e6)
    add r4
    sbk
    alt1
    lms r4,($1cc)
    alt1
    lms r0,($1e8)
    add r4
    sbk
    alt1
    lms r4,($1d2)
    alt1
    lms r0,($1ea)
    add r4
    sbk
    alt1
    lms r7,($1fc)
    alt1
    lms r8,($1f2)
    inc r7
    from r7
    sub r8
    beq gsu_01b997
    nop
    iwt r15,#gsu_01b91f
    nop

gsu_01b997:
    nop
    ibt r1,#$00
    ibt r2,#$00
    alt1
    rpix
    nop
    stop
    .db $01

gsu_01b9a1:
    ibt r6,#$00
    ibt r4,#$00
    ibt r12,#$08
    iwt r13,#$b9ab
    with r3
    add r3
    with r4
    rol
    with r3
    add r3
    with r4
    rol
    with r6
    add r6
    from r6
    add r6
    alt3
    cmp r4
    bcs gsu_01b9be
    with r4
    alt1
    sbc r0
    inc r6

gsu_01b9be:
    loop
    with r3
    jmp r11
    nop

gsu_01b9c2:
    alt1
    lms r0,($198)
    with r0
    to r6
    inc r0
    to r5
    lsr
    inc r5
    alt2
    sms ($1ec),r5
    alt1
    lms r0,($1fc)
    to r4
    alt1
    umult r0
    alt1
    lms r0,($1f2)
    alt1
    umult r0
    to r2
    sub r4
    ibt r1,#$00
    iwt r10,#$05c2
    alt1
    lms r7,($1c8)
    alt1
    lms r8,($1c2)
    alt1
    lms r9,($1ce)
    alt1
    lms r3,($1d4)

gsu_01b9ec:
    from r7
    alt1
    lmult
    from r4
    stw (r10)
    inc r10
    inc r10
    from r8
    alt1
    lmult
    from r4
    stw (r10)
    inc r10
    inc r10
    from r9
    alt1
    lmult
    from r4
    stw (r10)
    inc r10
    inc r10
    from r3
    alt1
    lmult
    from r4
    stw (r10)
    inc r10
    inc r10
    inc r1
    inc r1
    from r1
    add r1
    add r0
    alt2
    add #4
    with r2
    sub r0
    cache

gsu_01ba12:
    from r6
    alt1
    umult r6
    from r2
    sub r0
    bmi gsu_01ba12
    dec r6
    dec r5
    bne gsu_01b9ec
    inc r6
    jmp r11
    nop

gsu_01ba20:
    alt2
    sms ($02c),r2
    alt1
    lms r0,($198)
    ibt r6,#$6f
    sub r6
    bmi gsu_01ba2f
    nop
    alt2
    sms ($198),r6

gsu_01ba2f:
    alt1
    lms r1,($1e4)
    alt1
    lms r2,($1e6)
    alt1
    lms r3,($1e8)
    alt1
    lms r9,($1ea)
    with r4
    from r4
    bpl gsu_01ba4c
    nop
    with r1
    not
    inc r1
    with r2
    not
    inc r2
    with r3
    not
    inc r3
    with r9
    not
    inc r9

gsu_01ba4c:
    ibt r0,#$01
    alt3
    romb
    alt2
    sms ($1dc),r1
    alt2
    sms ($1de),r2
    alt2
    sms ($1e0),r3
    alt2
    sms ($1e2),r9
    alt1
    lms r5,($1c4)
    alt1
    lms r7,($1be)
    alt1
    lms r8,($1ca)
    alt1
    lms r13,($1d0)
    alt2
    sms ($1ee),r11
    iwt r10,#$0982
    link #4
    iwt r15,#gsu_01ba9a
    nop
    iwt r10,#$0b52
    alt1
    lms r1,($1dc)
    alt1
    lms r2,($1de)
    alt1
    lms r3,($1e0)
    alt1
    lms r9,($1e2)
    with r5
    not
    inc r5
    with r7
    not
    inc r7
    with r8
    not
    inc r8
    with r13
    not
    inc r13
    link #4
    iwt r15,#gsu_01ba9a
    nop
    sub r0
    alt3
    romb
    iwt r15,#gsu_01bafb
    nop

gsu_01ba9a:
    alt1
    lms r12,($1ec)
    alt2
    sms ($1f0),r11
    iwt r11,#$05c2

gsu_01baa3:
    ldw (r11)
    inc r11
    inc r11
    to r4
    add r1
    from r4
    asr
    iwt r6,#$4000
    add r6
    stw (r10)
    inc r10
    with r0
    from r4
    bpl gsu_01bab7
    inc r10
    not
    inc r0

gsu_01bab7:
    lsr
    lsr
    lsr
    lsr
    add r0
    iwt r6,#$bbf6
    to r14
    add r6
    to r6
    ldw (r11)
    getb
    inc r14
    inc r11
    inc r11
    with r6
    add r2
    alt1
    getbh
    alt1
    lmult
    lob
    swap
    with r4
    hib
    or r4
    asr
    iwt r6,#$4000
    to r6
    add r6
    ldw (r11)
    inc r11
    add r3
    bpl gsu_01bae1
    inc r11
    with r6
    not
    inc r6

gsu_01bae1:
    from r6
    stw (r10)
    inc r10
    inc r10
    with r1
    add r5
    with r2
    add r7
    with r3
    add r8
    ldw (r11)
    inc r11
    add r9
    stw (r10)
    inc r10
    inc r10
    with r9
    add r13
    dec r12
    bne gsu_01baa3
    inc r11
    alt1
    lms r15,($1f0)
    nop

gsu_01bafb:
    sub r0
    iwt r10,#$0982
    link #4
    iwt r15,#gsu_01bb18
    nop
    iwt r0,#$8000
    iwt r10,#$0b52
    link #4
    iwt r15,#gsu_01bb18
    nop
    sub r0
    alt3
    romb
    ibt r1,#$00
    alt1
    lms r15,($1ee)
    nop

gsu_01bb18:
    alt2
    sms ($1f0),r11
    alt1
    lms r1,($1f8)
    alt1
    lms r2,($02c)
    with r1
    add r0
    ibt r0,#$12
    alt3
    romb
    alt1
    lms r9,($096)
    alt1
    lms r12,($198)
    from r2
    add r2
    add r0
    alt2
    mult #13
    add r2
    swap
    to r13
    add r1
    to r7
    ldw (r10)
    inc r10
    inc r10
    to r8
    ldw (r10)
    inc r10
    inc r10
    to r6
    ldw (r10)
    inc r10
    inc r10

gsu_01bb42:
    to r4
    ldw (r10)
    inc r10
    inc r10
    to r3
    ldw (r10)
    inc r10
    inc r10
    to r11
    ldw (r10)
    from r8
    sub r3
    asr
    with r3
    add r0
    with r7
    add r4
    with r7
    ror
    from r6
    sub r11
    asr
    with r11
    add r0
    merge
    lsr
    lsr
    iwt r5,#$1f3f
    and r5
    to r14
    add r9
    with r3
    to r8
    with r4
    to r7
    from r13
    add r13
    bcc gsu_01bb71
    nop
    iwt r13,#$a63d
    alt1
    xor r13

gsu_01bb71:
    with r0
    to r13
    lob
    add r0
    add r0
    add r0
    add r6
    hib
    bpl gsu_01bb7d
    nop
    sub r0

gsu_01bb7d:
    alt3
    bic #7
    iwt r5,#$0078
    alt1
    xor r5
    to r5
    add r0
    iwt r0,#$00f0
    alt3
    cmp r5
    bne gsu_01bb91
    nop
    iwt r5,#$00e0

gsu_01bb91:
    getb
    lsr
    lsr
    lsr
    lsr
    or r5
    color
    dec r12
    beq gsu_01bbf2
    plot
    with r1
    from r1
    bpl gsu_01bba3
    nop
    dec r1
    dec r1

gsu_01bba3:
    inc r10
    inc r10
    merge
    lsr
    lsr
    iwt r5,#$1f3f
    and r5
    to r14
    add r9
    with r11
    to r6
    from r13
    add r13
    bcc gsu_01bbba
    nop
    iwt r13,#$a63d
    alt1
    xor r13

gsu_01bbba:
    with r0
    to r13
    lob
    add r0
    add r0
    add r0
    add r11
    hib
    bpl gsu_01bbc6
    nop
    sub r0

gsu_01bbc6:
    alt3
    bic #7
    iwt r5,#$0078
    alt1
    xor r5
    to r5
    add r0
    iwt r0,#$00f0
    alt3
    cmp r5
    bne gsu_01bbda
    nop
    iwt r5,#$00e0

gsu_01bbda:
    getb
    lsr
    lsr
    lsr
    lsr
    or r5
    color
    plot
    with r1
    from r1
    bpl gsu_01bbe9
    nop
    dec r1
    dec r1

gsu_01bbe9:
    dec r12
    beq gsu_01bbf1
    nop
    iwt r15,#gsu_01bb42
    nop

gsu_01bbf1:
    nop

gsu_01bbf2:
    alt1
    lms r15,($1f0)
    nop
    stop
    .incbin "data/00bbf7-00cbf6.bin"
    ibt r0,#$03
    alt3
    romb
    sub r0
    alt1
    cmode
    ibt r1,#$10
    alt1
    lms r0,($09a)
    mult r1
    color
    iwt r2,#$0020
    alt1
    lms r1,($098)
    from r1
    lob
    and r2
    beq gsu_01cc12
    nop
    ibt r0,#$04

gsu_01cc12:
    alt2
    or #8
    alt1
    cmode
    from r1
    alt3
    umult #3
    iwt r1,#$8918
    to r14
    add r1
    getb
    inc r14
    alt1
    getbh
    inc r14
    to r1
    getb
    from r1
    alt3
    romb
    with r0
    to r14
    ibt r0,#$f0
    alt1
    lms r1,($1f8)
    to r1
    add r1
    alt1
    lms r2,($1fa)
    to r2
    add r2
    with r1
    to r9
    iwt r11,#$0020
    iwt r10,#$00e0
    iwt r7,#$cc48
    ibt r8,#$20
    cache

gsu_01cc44:
    with r8
    to r12
    with r15
    to r13
    getc
    inc r14
    loop
    plot
    nop
    with r14
    add r10
    with r9
    to r1
    dec r11
    bne gsu_01cc44
    inc r2
    alt1
    rpix
    stop
    .db $01,$fa,$c2,$04,$a0,$03,$3f,$df,$60,$3d,$4e,$3d,$a0,$fc,$3e,$a0
    .db $54,$3d,$a0,$fd,$3e,$a0,$55,$a1,$10,$3d,$a0,$4d,$81,$4e,$f2,$20
    .db $00,$3d,$a1,$4c,$b1,$9e,$72,$09,$03,$01,$a0,$04,$3e,$c8,$3d,$4e
    .db $b1,$3f,$83,$f1,$18,$89,$1e,$51,$ef,$de,$3d,$ef,$de,$3e,$a0,$4b
    .db $ef,$3e,$a0,$4a,$3d,$a1,$5e,$94,$ff,$23,$cd,$01,$3d,$4c,$00,$01

gsu_01cca8:
    from r11
    stw (r10)
    inc r10
    inc r10
    iwt r0,#$0080
    alt1
    lms r3,($02a)
    sub r3
    bpl gsu_01cced
    nop
    cache
    alt1
    lms r1,($0bc)
    alt1
    lms r12,($032)
    with r12
    from r12
    beq gsu_01ccca
    nop
    with r1
    to r0
    with r15
    to r13
    loop
    add r0
    with r0
    to r1

gsu_01ccca:
    alt1
    lms r0,($098)
    add r0
    to r1
    add r1
    bne gsu_01ccd5
    nop
    ibt r1,#$01

gsu_01ccd5:
    with r1
    to r5
    alt1
    lms r1,($026)
    alt1
    lms r2,($028)
    link #4
    iwt r15,#gsu_01cdfa
    nop
    alt2
    sms ($0a8),r1
    alt2
    sms ($0aa),r2
    with r1
    from r5
    bne gsu_01ccf2
    nop

gsu_01cced:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01ccf2:
    iwt r0,#$00f0
    sub r1
    bpl gsu_01ccfb
    add r1
    with r0
    to r1

gsu_01ccfb:
    alt2
    sms ($0bc),r1
    alt1
    lms r0,($0c4)
    link #4
    iwt r15,#gsu_019076
    nop
    alt1
    lms r0,($042)
    with r0
    from r0
    beq gsu_01cced
    nop
    alt1
    lms r1,($0bc)
    alt1
    lms r0,($0c2)
    lob
    inc r0
    alt2
    sms ($0b6),r0
    alt1
    lms r0,($058)
    color
    swap
    alt1
    cmode
    bra gsu_01cd28
    nop
    from r11
    stw (r10)
    inc r10
    inc r10
    cache

gsu_01cd28:
    from r1
    to r3
    not
    inc r3
    alt2
    sms ($0a0),r3
    iwt r3,#$00df
    with r3
    sub r1
    alt2
    sms ($0a2),r3
    ibt r3,#$ff
    from r1
    lsr
    alt1
    sbc r3
    alt1
    lms r3,($0a8)
    from r3
    sub r0
    sbk
    alt1
    lms r3,($0a0)
    inc r3
    alt3
    cmp r3
    bpl gsu_01cd51
    nop

gsu_01cd4c:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01cd51:
    iwt r3,#$00df
    alt3
    cmp r3
    bpl gsu_01cd4c
    nop
    ibt r3,#$ff
    from r1
    lsr
    alt1
    sbc r3
    alt1
    lms r3,($0aa)
    from r3
    sub r0
    sbk
    alt1
    lms r6,($0b6)
    from r1
    sub r6
    bcc gsu_01cd71
    nop
    iwt r15,#gsu_01ce3f
    nop

gsu_01cd71:
    with r6
    to r4
    ibt r0,#$00
    alt3
    romb
    iwt r0,#$9647
    add r1
    to r14
    add r1
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r4
    swap
    fmult
    to r9
    rol
    alt1
    lms r2,($0aa)
    ibt r7,#$00
    with r7
    to r8
    alt1
    lms r4,($0bc)
    with r4
    to r6
    alt1
    lms r0,($094)
    alt3
    romb
    alt1
    lms r5,($096)
    alt1
    lms r3,($0a8)
    with r3
    from r3
    bpl gsu_01cdb9
    nop
    with r6
    to r12
    with r15
    to r13
    bpl gsu_01cdb4
    nop
    with r8
    add r9
    loop
    inc r3
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01cdb4:
    with r12
    to r6
    merge
    to r5
    add r5

gsu_01cdb9:
    with r3
    to r1
    alt1
    lms r0,($0a2)
    sub r1
    bpl gsu_01cdd4
    nop
    iwt r0,#$00df
    with r6
    to r12
    with r15
    to r13
    alt3
    cmp r1
    bmi gsu_01cdd2
    nop
    with r8
    add r9
    loop
    inc r1

gsu_01cdd2:
    with r6
    sub r12

gsu_01cdd4:
    iwt r13,#$cde7

gsu_01cdd7:
    iwt r0,#$00c0
    sub r2
    bcc gsu_01cdef
    nop
    ibt r8,#$00
    merge
    to r14
    add r5
    with r3
    to r1
    with r6
    to r12
    with r8
    add r9
    merge
    getc
    to r14
    add r5
    loop
    plot

gsu_01cdef:
    with r7
    add r9
    dec r4
    bne gsu_01cdd7
    inc r2
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01cdfa:
    ibt r0,#$14
    alt3
    romb
    iwt r0,#$3000
    sub r3
    bpl gsu_01ce08
    nop
    iwt r3,#$2fff

gsu_01ce08:
    iwt r0,#$0100
    sub r3
    bmi gsu_01ce1b
    nop
    with r5
    add r5
    with r1
    add r1
    with r2
    add r2
    with r3
    add r3
    iwt r15,#gsu_01ce08
    nop

gsu_01ce1b:
    with r3
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r3
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r1
    fmult
    rol
    alt1
    lms r1,($034)
    with r1
    add r0
    from r2
    fmult
    rol
    alt1
    lms r2,($036)
    with r2
    add r0
    from r5
    fmult
    to r5
    rol
    jmp r11
    nop

gsu_01ce3f:
    with r6
    to r0
    with r1
    to r6
    alt3
    cmp r6
    bne gsu_01ce4e
    nop
    iwt r4,#$ffff
    bra gsu_01ce55
    nop

gsu_01ce4e:
    ibt r4,#$00
    link #4
    iwt r15,#gsu_018183
    nop

gsu_01ce55:
    with r4
    to r9
    cache
    alt1
    lms r6,($0b6)
    alt1
    lms r3,($0a8)
    alt1
    lms r2,($0aa)
    ibt r7,#$00
    ibt r11,#$00
    alt1
    lms r0,($094)
    alt3
    romb
    alt1
    lms r5,($096)
    with r9
    alt3
    bic #1
    with r6
    to r13
    iwt r0,#$00df
    to r6
    sub r3
    from r9
    lsr
    fmult
    to r4
    rol
    from r13
    sub r4
    dec r0
    bmi gsu_01ce84
    nop
    with r4
    to r13

gsu_01ce84:
    with r13
    to r6
    with r3
    from r3
    bpl gsu_01cea4
    nop
    from r3
    to r6
    not
    inc r6
    from r9
    lsr
    alt1
    lmult
    from r4
    to r11
    add r4
    rol
    bmi gsu_01ceeb
    nop
    with r5
    add r0
    from r13
    to r6
    sub r0
    bmi gsu_01ceeb
    nop
    ibt r3,#$00

gsu_01cea4:
    with r6
    from r6
    beq gsu_01ceeb
    nop
    ibt r4,#$00

gsu_01ceab:
    with r2
    from r2
    bmi gsu_01cedd
    nop
    iwt r0,#$00bf
    sub r2
    bmi gsu_01ceeb
    nop
    from r4
    swap
    to r14
    add r5
    with r3
    to r1
    with r11
    to r0
    getc
    with r6
    to r12
    dec r12
    beq gsu_01cecf
    nop
    with r15
    to r13
    inc r14

gsu_01cec9:
    add r9
    bcc gsu_01cec9
    plot
    loop
    getc

gsu_01cecf:
    with r0
    to r8
    iwt r0,#$00df

gsu_01ced4:
    alt3
    cmp r1
    bmi gsu_01cedd
    with r8
    add r9
    bcc gsu_01ced4
    plot

gsu_01cedd:
    nop
    with r7
    sub r9
    bcs gsu_01ceab
    inc r2
    inc r4
    alt1
    lms r0,($0b6)
    sub r4
    bne gsu_01ceab
    nop

gsu_01ceeb:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01cef0:
    from r11
    stw (r10)
    inc r10
    inc r10
    color
    sub r0
    alt2
    ramb
    alt1
    cmode
    iwt r0,#$0080
    alt1
    lms r1,($026)
    alt1
    lms r2,($028)
    alt1
    lms r3,($02a)
    alt3
    cmp r3
    bmi gsu_01cf10
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01cf10:
    link #4
    iwt r15,#gsu_019263
    nop
    alt2
    sms ($026),r1
    alt2
    sms ($028),r2
    alt1
    lms r0,($01c)
    alt3
    romb
    cache
    alt1
    lms r14,($01a)
    ibt r12,#$ff

gsu_01cf26:
    getb
    inc r14
    lob
    bne gsu_01cf26
    inc r12
    ibt r3,#$10
    from r12
    mult r3
    stw (r10)
    inc r10
    inc r10
    ibt r2,#$7f
    alt1
    lms r1,($0b6)
    with r1
    add r2
    from r1
    to r2
    alt1
    umult r12
    alt1
    lms r3,($02a)
    link #4
    iwt r15,#gsu_019263
    nop
    iwt r0,#$0070
    with r1
    sub r0
    iwt r0,#$0060
    with r2
    sub r0
    with r1
    lob
    alt2
    sms ($0b6),r1
    ibt r3,#$ff
    alt2
    add #0
    from r2
    ror
    alt1
    sbc r3
    alt1
    lms r3,($026)
    from r3
    sub r0
    sbk
    ibt r3,#$ff
    alt2
    add #0
    from r1
    ror
    alt1
    sbc r3
    alt1
    lms r3,($028)
    from r3
    sub r0
    sbk
    from r1
    to r3
    not
    inc r3
    alt2
    sms ($0a0),r3
    iwt r3,#$00e0
    with r3
    sub r1
    alt2
    sms ($0a2),r3
    dec r10
    dec r10
    to r6
    ldw (r10)
    from r2
    sub r6
    bcc gsu_01cf8d
    nop
    iwt r15,#gsu_01d03e
    nop

gsu_01cf8d:
    with r2
    to r0
    ibt r4,#$00
    link #4
    iwt r15,#gsu_018183
    nop
    with r4
    to r9
    with r4
    to r8
    ibt r3,#$00
    alt2
    sms ($0a0),r3
    cache
    alt1
    lms r2,($028)
    ibt r6,#$00
    ibt r4,#$00

gsu_01cfa7:
    with r2
    from r2
    bpl gsu_01cfb0
    nop
    iwt r15,#gsu_01d01b
    nop

gsu_01cfb0:
    iwt r0,#$00bf
    alt3
    cmp r2
    bpl gsu_01cfbc
    nop
    iwt r15,#gsu_01d01b
    nop

gsu_01cfbc:
    alt1
    lms r1,($026)
    ibt r7,#$00
    alt1
    lms r5,($01a)

gsu_01cfc4:
    alt1
    lms r0,($01c)
    alt3
    romb
    with r5
    to r14
    getb
    inc r5
    add r0
    beq gsu_01d01b
    nop
    ibt r3,#$14
    from r3
    alt3
    romb
    ibt r3,#$10
    alt1
    umult r3
    iwt r3,#$beba
    add r4
    add r4
    to r14
    add r3
    alt1
    lms r0,($0a0)
    alt3
    cmp r1
    bmi gsu_01cff1
    nop
    alt1
    lms r0,($0b6)
    to r1
    add r1
    bra gsu_01cfc4
    nop

gsu_01cff1:
    alt1
    lms r3,($0a2)
    dec r3
    dec r3
    with r3
    alt3
    cmp r1
    bmi gsu_01d01b
    nop
    getb
    inc r14
    alt1
    getbh
    ibt r12,#$10
    with r15
    to r13
    with r7
    sub r9
    bcc gsu_01d00e
    rol
    loop
    nop
    bra gsu_01cfc4
    nop

gsu_01d00e:
    bcs gsu_01d016
    nop
    loop
    inc r1
    bra gsu_01cfc4
    nop

gsu_01d016:
    loop
    plot
    bra gsu_01cfc4
    nop

gsu_01d01b:
    with r6
    sub r8
    bcc gsu_01d02b
    nop
    inc r4
    ibt r3,#$10
    from r4
    sub r3
    bne gsu_01d01b
    nop
    bra gsu_01d039
    nop

gsu_01d02b:
    inc r2
    inc r4
    ibt r3,#$10
    from r4
    sub r3
    beq gsu_01d038
    nop
    iwt r15,#gsu_01cfa7
    nop

gsu_01d038:
    nop

gsu_01d039:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01d03e:
    with r6
    to r0
    with r2
    to r6
    alt3
    cmp r6
    bne gsu_01d04d
    nop
    iwt r4,#$ffff
    bra gsu_01d054
    nop

gsu_01d04d:
    ibt r4,#$00
    link #4
    iwt r15,#gsu_018183
    nop

gsu_01d054:
    with r4
    to r9
    with r4
    to r8
    cache
    alt1
    lms r2,($028)
    ibt r6,#$00
    ibt r4,#$00

gsu_01d060:
    with r2
    from r2
    bpl gsu_01d069
    nop
    iwt r15,#gsu_01d13f
    nop

gsu_01d069:
    iwt r0,#$00bf
    alt3
    cmp r2
    bpl gsu_01d075
    nop
    iwt r15,#gsu_01d13f
    nop

gsu_01d075:
    alt1
    lms r1,($026)
    ibt r7,#$00
    alt1
    lms r5,($01a)

gsu_01d07d:
    alt1
    lms r0,($01c)
    alt3
    romb
    with r5
    to r14
    getb
    inc r5
    add r0
    bne gsu_01d08e
    nop
    iwt r15,#gsu_01d13f
    nop

gsu_01d08e:
    ibt r3,#$14
    from r3
    alt3
    romb
    ibt r3,#$10
    alt1
    umult r3
    iwt r3,#$beba
    add r4
    add r4
    to r14
    add r3
    alt1
    lms r0,($0a0)
    alt3
    cmp r1
    bmi gsu_01d0aa
    nop
    iwt r15,#gsu_01d12f
    nop

gsu_01d0aa:
    with r1
    from r1
    bpl gsu_01d0d9
    getb
    inc r14
    alt1
    getbh
    ibt r12,#$10
    with r15
    to r13
    rol
    bcs gsu_01d0c4
    nop

gsu_01d0ba:
    with r7
    sub r9
    bcs gsu_01d0ba
    inc r1
    loop
    nop
    bra gsu_01d07d
    nop

gsu_01d0c4:
    with r7
    sub r9
    bcs gsu_01d0c4
    inc r1
    bmi gsu_01d0d4
    nop
    iwt r13,#$d0ea
    loop
    nop
    bra gsu_01d07d
    nop

gsu_01d0d4:
    loop
    nop
    bra gsu_01d07d
    nop

gsu_01d0d9:
    inc r14
    alt1
    lms r3,($0a2)
    dec r3
    with r3
    alt3
    cmp r1
    bmi gsu_01d103
    nop
    alt1
    getbh
    ibt r12,#$10
    with r15
    to r13
    rol
    bcs gsu_01d0f8
    nop

gsu_01d0ee:
    with r7
    sub r9
    bcs gsu_01d0ee
    inc r1
    loop
    nop
    bra gsu_01d07d
    nop

gsu_01d0f8:
    with r7
    sub r9
    bcs gsu_01d0f8
    plot
    loop
    nop
    iwt r15,#gsu_01d07d
    nop

gsu_01d103:
    alt1
    getbh
    iwt r3,#$00df
    ibt r12,#$10
    with r15
    to r13
    rol
    bcs gsu_01d120
    nop

gsu_01d110:
    with r7
    sub r9
    bcs gsu_01d110
    inc r1
    with r1
    alt3
    cmp r3
    bpl gsu_01d13f
    nop
    loop
    nop
    bra gsu_01d13f
    nop

gsu_01d120:
    with r1
    alt3
    cmp r3
    bpl gsu_01d13f
    with r7
    sub r9
    bcs gsu_01d120
    plot
    loop
    nop
    bra gsu_01d13f
    nop

gsu_01d12f:
    alt1
    lms r3,($0b6)
    with r1
    add r3
    with r7
    sub r9
    bcc gsu_01d13a
    nop
    inc r1

gsu_01d13a:
    iwt r15,#gsu_01d07d
    nop
    nop

gsu_01d13f:
    nop
    inc r2
    with r6
    sub r8
    bcc gsu_01d14a
    nop
    iwt r15,#gsu_01d060
    nop

gsu_01d14a:
    inc r4
    ibt r3,#$10
    from r4
    sub r3
    beq gsu_01d156
    nop
    iwt r15,#gsu_01d060
    nop

gsu_01d156:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    sub r0
    alt2
    ramb
    ibt r0,#$17
    alt3
    romb
    cache
    alt1
    lms r4,($026)
    iwt r0,#$00c0
    alt1
    umult r4
    add r0
    to r4
    add r0
    alt1
    lms r0,($028)
    alt3
    umult #4
    add r4
    iwt r4,#$2c00
    to r4
    add r4
    iwt r5,#$0300
    alt1
    lms r14,($018)
    ibt r3,#$04

gsu_01d181:
    with r4
    to r1
    ibt r12,#$50
    with r15
    to r13
    getb
    inc r14
    alt1
    getbh
    inc r14
    stw (r1)
    inc r1
    loop
    inc r1
    with r4
    add r5
    dec r3
    bne gsu_01d181
    nop
    stop
    .db $01

gsu_01d198:
    from r11
    stw (r10)
    inc r10
    inc r10
    with r0
    to r8
    with r1
    to r6
    with r2
    to r5
    with r3
    to r9
    ibt r0,#$14
    alt3
    romb
    iwt r3,#$1aac
    alt1
    lms r2,($1fe)
    iwt r12,#$012c
    cache
    with r15
    to r13
    alt1
    ldb (r3)
    lob
    bne gsu_01d227
    nop
    sub r0
    ibt r7,#$06
    with r7
    add r3
    from r0
    stw (r7)
    ibt r7,#$08
    with r7
    add r3
    from r0
    stw (r7)
    ibt r7,#$0a
    with r7
    add r3
    from r0
    stw (r7)
    ibt r7,#$0c
    with r7
    add r3
    from r5
    stw (r7)
    from r6
    alt1
    stb (r3)
    ibt r0,#$01
    alt3
    cmp r8
    bne gsu_01d1e1
    nop
    iwt r15,#gsu_01d3fd
    nop

gsu_01d1e1:
    ibt r0,#$02
    alt3
    cmp r8
    bne gsu_01d1ec
    nop
    iwt r15,#gsu_01d387
    nop

gsu_01d1ec:
    ibt r0,#$03
    alt3
    cmp r8
    bne gsu_01d1f7
    nop
    iwt r15,#gsu_01d316
    nop

gsu_01d1f7:
    ibt r0,#$04
    alt3
    cmp r8
    bne gsu_01d202
    nop
    iwt r15,#gsu_01d2a6
    nop

gsu_01d202:
    ibt r0,#$05
    alt3
    cmp r8
    bne gsu_01d20d
    nop
    iwt r15,#gsu_01d3f9
    nop

gsu_01d20d:
    ibt r0,#$06
    alt3
    cmp r8
    bne gsu_01d218
    nop
    iwt r15,#gsu_01d234
    nop

gsu_01d218:
    ibt r0,#$07
    alt3
    cmp r8
    bne gsu_01d223
    nop
    iwt r15,#gsu_01d401
    nop

gsu_01d223:
    dec r9
    beq gsu_01d22c
    nop

gsu_01d227:
    with r3
    alt2
    add #14
    loop
    nop

gsu_01d22c:
    alt2
    sms ($1fe),r2
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01d234:
    from r9
    alt2
    and #15
    from r6
    add r0
    alt2
    sub #7
    ibt r7,#$00
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r0,#$10
    ibt r7,#$01
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r9
    to r0
    dec r0
    add r0
    iwt r7,#$bcdc
    to r14
    add r7
    alt3
    getbs
    inc r14
    alt1
    div2
    ibt r7,#$03
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$06
    with r7
    add r3
    from r0
    stw (r7)
    alt3
    getbs
    alt1
    div2
    ibt r7,#$04
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$08
    with r7
    add r3
    from r0
    stw (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    iwt r0,#$001f
    and r2
    alt2
    sub #15
    ibt r7,#$05
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$0a
    with r7
    add r3
    from r0
    stw (r7)
    ibt r4,#$04
    ibt r0,#$01
    and r12
    beq gsu_01d29b
    nop
    ibt r4,#$0e

gsu_01d29b:
    ibt r7,#$02
    with r7
    add r3
    from r4
    alt1
    stb (r7)
    iwt r15,#gsu_01d223
    nop

gsu_01d2a6:
    from r9
    alt2
    and #15
    from r6
    add r0
    alt2
    sub #7
    ibt r7,#$00
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r0,#$10
    ibt r7,#$01
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r9
    to r0
    dec r0
    add r0
    iwt r7,#$bcdc
    to r14
    add r7
    alt3
    getbs
    inc r14
    ibt r7,#$03
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$06
    with r7
    add r3
    from r0
    stw (r7)
    alt3
    getbs
    ibt r7,#$04
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$08
    with r7
    add r3
    from r0
    stw (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    iwt r0,#$003f
    and r2
    iwt r7,#$001f
    sub r7
    ibt r7,#$05
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$0a
    with r7
    add r3
    from r0
    stw (r7)
    ibt r4,#$04
    ibt r0,#$01
    and r12
    beq gsu_01d30b
    nop
    ibt r4,#$0e

gsu_01d30b:
    ibt r7,#$02
    with r7
    add r3
    from r4
    alt1
    stb (r7)
    iwt r15,#gsu_01d223
    nop

gsu_01d316:
    sub r0
    ibt r7,#$01
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$0f
    and r2
    ibt r7,#$07
    sub r7
    ibt r7,#$03
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r0
    from r0
    bpl gsu_01d339
    nop
    not
    inc r0

gsu_01d339:
    with r0
    to r4
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$07
    and r2
    ibt r7,#$32
    add r7
    ibt r7,#$04
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$0f
    and r2
    ibt r7,#$07
    sub r7
    ibt r7,#$05
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r0
    from r0
    bpl gsu_01d36a
    nop
    not
    inc r0

gsu_01d36a:
    with r4
    add r0
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$03
    and r2
    bne gsu_01d37b
    nop
    ibt r0,#$01

gsu_01d37b:
    inc r0
    ibt r7,#$02
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    iwt r15,#gsu_01d223
    nop

gsu_01d387:
    ibt r0,#$02
    ibt r7,#$01
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$0f
    and r2
    ibt r7,#$07
    sub r7
    ibt r7,#$03
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r0
    from r0
    bpl gsu_01d3ab
    nop
    not
    inc r0

gsu_01d3ab:
    with r0
    to r4
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$07
    and r2
    ibt r7,#$d8
    add r7
    ibt r7,#$04
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$0f
    and r2
    ibt r7,#$07
    sub r7
    ibt r7,#$05
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r0
    from r0
    bpl gsu_01d3dc
    nop
    not
    inc r0

gsu_01d3dc:
    with r4
    add r0
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    ibt r0,#$03
    and r2
    bne gsu_01d3ed
    nop
    ibt r0,#$01

gsu_01d3ed:
    inc r0
    ibt r7,#$02
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    iwt r15,#gsu_01d223
    nop

gsu_01d3f9:
    iwt r15,#gsu_01d223
    nop

gsu_01d3fd:
    iwt r15,#gsu_01d223
    nop

gsu_01d401:
    from r9
    alt2
    and #15
    from r6
    add r0
    alt2
    sub #7
    ibt r7,#$00
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r0,#$10
    ibt r7,#$01
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    with r9
    to r0
    dec r0
    add r0
    iwt r7,#$bcdc
    to r14
    add r7
    alt3
    getbs
    inc r14
    ibt r7,#$03
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$06
    with r7
    add r3
    from r0
    stw (r7)
    alt3
    getbs
    ibt r7,#$04
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$08
    with r7
    add r3
    from r0
    stw (r7)
    from r2
    swap
    ror
    add r2
    to r2
    alt1
    adc r2
    iwt r0,#$003f
    and r2
    iwt r7,#$001f
    sub r7
    ibt r7,#$05
    with r7
    add r3
    from r0
    alt1
    stb (r7)
    ibt r7,#$0a
    with r7
    add r3
    from r0
    stw (r7)
    ibt r4,#$04
    ibt r0,#$01
    and r12
    beq gsu_01d466
    nop
    ibt r4,#$0e

gsu_01d466:
    ibt r7,#$02
    with r7
    add r3
    from r4
    alt1
    stb (r7)
    iwt r15,#gsu_01d223
    nop

gsu_01d471:
    from r11
    stw (r10)
    inc r10
    inc r10
    sub r0
    alt1
    cmode
    with r2
    to r7
    ibt r0,#$14
    alt3
    romb
    iwt r11,#$1ab8
    iwt r12,#$012c
    cache

gsu_01d485:
    ldw (r11)
    sub r7
    beq gsu_01d496
    nop

gsu_01d48a:
    with r11
    alt2
    add #14
    dec r12
    bne gsu_01d485
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01d496:
    with r11
    alt2
    sub #12
    ibt r0,#$03
    add r11
    alt1
    ldb (r0)
    sex
    ibt r1,#$06
    with r1
    add r11
    to r1
    ldw (r1)
    with r1
    to r3
    add r1
    sbk
    alt1
    lms r4,($026)
    to r1
    add r4
    ibt r0,#$04
    add r11
    alt1
    ldb (r0)
    sex
    ibt r2,#$08
    with r2
    add r11
    to r2
    ldw (r2)
    with r2
    to r9
    add r2
    sbk
    alt1
    lms r4,($028)
    to r2
    add r4
    ibt r0,#$05
    add r11
    alt1
    ldb (r0)
    sex
    ibt r6,#$0a
    with r6
    add r11
    to r6
    ldw (r6)
    with r6
    to r13
    add r6
    sbk
    alt1
    lms r4,($02a)
    to r6
    add r4
    ibt r5,#$01
    with r5
    add r11
    to r5
    alt1
    ldb (r5)
    from r5
    alt2
    or #1
    ibt r4,#$01
    with r4
    add r11
    from r0
    alt1
    stb (r4)
    from r5
    alt2
    and #2
    beq gsu_01d4fd
    nop
    ibt r0,#$04
    add r11
    alt1
    ldb (r0)
    alt2
    add #2
    ibt r4,#$04
    with r4
    add r11
    from r0
    alt1
    stb (r4)

gsu_01d4fd:
    with r6
    from r6
    bmi gsu_01d567
    nop
    iwt r0,#$3000
    sub r6
    bpl gsu_01d50c
    nop
    iwt r6,#$2fff

gsu_01d50c:
    iwt r0,#$0100
    sub r6
    bmi gsu_01d51a
    nop
    beq gsu_01d51a
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d51a:
    with r6
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r6
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r1
    fmult
    rol
    ibt r5,#$70
    to r1
    add r5
    iwt r4,#$00de
    from r1
    sub r4
    bcc gsu_01d53b
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d53b:
    add r4
    from r2
    fmult
    rol
    ibt r5,#$60
    to r2
    add r5
    iwt r5,#$00be
    from r2
    sub r5
    bcc gsu_01d54f
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d54f:
    add r5
    ibt r0,#$02
    add r11
    alt1
    ldb (r0)
    color
    ibt r0,#$01
    add r11
    alt1
    ldb (r0)
    alt2
    and #4
    bne gsu_01d56e
    nop
    plot
    plot
    inc r2
    dec r1
    dec r1
    plot
    plot

gsu_01d567:
    with r11
    alt2
    add #12
    iwt r15,#gsu_01d48a
    nop

gsu_01d56e:
    alt1
    lms r0,($026)
    to r3
    add r3
    alt1
    lms r0,($028)
    to r9
    add r9
    alt1
    lms r0,($02a)
    to r13
    add r13
    bpl gsu_01d567
    nop
    with r13
    to r6
    iwt r0,#$3000
    sub r6
    bpl gsu_01d58c
    nop
    iwt r6,#$2fff

gsu_01d58c:
    iwt r0,#$0100
    sub r6
    bmi gsu_01d59a
    nop
    beq gsu_01d59a
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d59a:
    with r6
    alt3
    bic #1
    iwt r0,#$896c
    to r14
    add r6
    to r6
    getb
    inc r14
    with r6
    alt1
    getbh
    from r3
    fmult
    rol
    ibt r5,#$70
    to r3
    add r5
    iwt r4,#$00de
    from r3
    sub r4
    bcc gsu_01d5bb
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d5bb:
    add r4
    from r9
    fmult
    rol
    ibt r5,#$60
    to r9
    add r5
    iwt r5,#$00be
    from r9
    sub r5
    bcc gsu_01d5cf
    nop
    iwt r15,#gsu_01d567
    nop

gsu_01d5cf:
    add r5
    alt2
    sms ($040),r12
    ibt r5,#$01
    with r3
    sub r1
    bpl gsu_01d5df
    nop
    ibt r5,#$ff
    with r3
    not
    inc r3

gsu_01d5df:
    ibt r6,#$01
    with r9
    sub r2
    bpl gsu_01d5eb
    nop
    ibt r6,#$ff
    with r9
    not
    inc r9

gsu_01d5eb:
    from r3
    sub r9
    bmi gsu_01d609
    nop
    with r3
    to r12
    inc r12
    lsr
    sub r9
    with r15
    to r13
    bcs gsu_01d5fd
    plot
    add r3
    with r2
    add r6

gsu_01d5fd:
    dec r1
    with r1
    add r5
    loop
    sub r9
    alt1
    lms r12,($040)
    iwt r15,#gsu_01d567
    nop

gsu_01d609:
    with r9
    to r12
    inc r12
    not
    inc r0
    lsr
    sub r3
    with r15
    to r13
    bcs gsu_01d618
    plot
    add r9
    with r1
    add r5

gsu_01d618:
    dec r1
    with r2
    add r6
    loop
    sub r3
    alt1
    lms r12,($040)
    iwt r15,#gsu_01d567
    nop

gsu_01d624:
    ibt r0,#$14
    alt3
    romb
    iwt r8,#$000e
    iwt r9,#$1aac
    iwt r12,#$012c
    ibt r5,#$20
    cache
    with r15
    to r13
    alt1
    ldb (r9)
    lob
    beq gsu_01d66e
    nop
    dec r0
    alt1
    stb (r9)
    with r0
    to r7
    ibt r0,#$01
    add r9
    alt1
    ldb (r0)
    ibt r6,#$10
    and r6
    beq gsu_01d660
    nop
    with r7
    to r0
    alt3
    cmp r5
    bpl gsu_01d660
    nop
    iwt r14,#$bcbc
    with r14
    add r0
    getb
    ibt r7,#$02
    with r7
    add r9
    from r0
    alt1
    stb (r7)

gsu_01d660:
    ibt r0,#$01
    add r9
    alt1
    ldb (r0)
    with r0
    to r6
    alt2
    and #1
    bne gsu_01d67a
    sub r0
    alt1
    stb (r9)

gsu_01d66e:
    ibt r7,#$0c
    with r7
    add r9
    from r0
    stw (r7)
    with r9
    add r8
    loop
    nop
    jmp r11
    nop

gsu_01d67a:
    with r6
    to r0
    alt3
    bic #1
    ibt r7,#$01
    with r7
    add r9
    from r0
    alt1
    stb (r7)
    with r9
    add r8
    loop
    nop
    jmp r11
    nop
    sub r0
    alt2
    ramb
    alt1
    cmode
    ibt r0,#$14
    alt3
    romb
    alt1
    lm r14,($0028)
    getb
    inc r14
    alt2
    sm ($0026),r0
    cache

gsu_01d69f:
    to r1
    getb
    inc r14
    iwt r0,#$00ff
    alt3
    cmp r1
    beq gsu_01d6ca
    nop
    to r2
    getb
    inc r14
    to r3
    getb
    inc r14
    to r4
    getb
    inc r14
    to r7
    getb
    inc r14
    with r7
    from r7
    beq $d6c0
    iwt r7,#$10b2
    bra gsu_01d6c2
    nop
    .db $f2,$0e

gsu_01d6c2:
    link #4
    iwt r15,#gsu_01d6e8
    nop
    bra gsu_01d69f
    nop

gsu_01d6ca:
    alt2
    sm ($0028),r14
    getb
    inc r14
    alt1
    getbh
    iwt r1,#$ffff
    alt3
    cmp r1
    bne gsu_01d6e1
    nop
    iwt r0,#$0001
    alt2
    sm ($0028),r0

gsu_01d6e1:
    link #4
    iwt r15,#gsu_01d743
    nop
    stop
    .db $01

gsu_01d6e8:
    ibt r5,#$10
    with r1
    add r5
    with r3
    add r5
    add r5
    ibt r5,#$01
    with r3
    sub r1
    bpl gsu_01d6fb
    nop
    ibt r5,#$ff
    with r3
    not
    inc r3

gsu_01d6fb:
    ibt r6,#$01
    with r4
    sub r2
    bpl gsu_01d707
    nop
    ibt r6,#$ff
    with r4
    not
    inc r4

gsu_01d707:
    from r3
    sub r4
    bmi gsu_01d726
    nop
    with r3
    to r12
    inc r12
    lsr
    with r15
    to r13
    from r7
    to r8
    add r2
    with r8
    add r2
    from r1
    stw (r8)
    sub r4
    bcs gsu_01d720
    nop
    add r3
    with r2
    add r6

gsu_01d720:
    with r1
    add r5
    loop
    nop
    jmp r11
    nop

gsu_01d726:
    with r4
    to r12
    inc r12
    not
    inc r0
    lsr
    cache
    with r15
    to r13
    from r7
    to r8
    add r2
    with r8
    add r2
    from r1
    stw (r8)
    sub r3
    bcs gsu_01d73d
    nop
    add r4
    with r1
    add r5

gsu_01d73d:
    with r2
    add r6
    loop
    nop
    jmp r11
    nop

gsu_01d743:
    iwt r1,#$0ef2
    iwt r2,#$10b2
    iwt r12,#$00e0
    cache
    with r15
    to r13
    ldw (r1)
    to r3
    ldw (r2)
    alt3
    cmp r3
    beq gsu_01d760
    nop
    bpl gsu_01d764
    nop
    stw (r2)
    from r3
    stw (r1)
    bra gsu_01d764
    nop

gsu_01d760:
    dec r0
    stw (r1)
    from r3
    stw (r2)

gsu_01d764:
    inc r1
    inc r1
    inc r2
    loop
    inc r2
    jmp r11
    nop

gsu_01d76b:
    from r11
    stw (r10)
    inc r10
    inc r10
    alt1
    lm r0,($2b22)
    with r0
    from r0
    bmi gsu_01d77c
    nop
    iwt r15,#gsu_01d823
    nop

gsu_01d77c:
    ibt r0,#$00
    alt3
    romb
    sub r0
    alt1
    cmode
    alt1
    lm r0,($2b24)
    alt2
    sm ($2b28),r0
    alt2
    sm ($2b2a),r0
    iwt r0,#$00c8
    alt2
    sms ($132),r0
    iwt r0,#$0000
    alt2
    sms ($136),r0
    iwt r0,#$0109
    alt2
    sms ($13c),r0
    iwt r0,#$0000
    alt2
    sms ($13e),r0
    link #4
    iwt r15,#gsu_01d828
    nop
    alt1
    lm r0,($2b26)
    ibt r1,#$01
    and r1
    beq gsu_01d7bc
    nop
    ibt r0,#$02
    alt2
    sm ($2b2a),r0

gsu_01d7bc:
    alt1
    lm r0,($2b26)
    ibt r1,#$02
    and r1
    beq gsu_01d7cc
    nop
    ibt r0,#$02
    alt2
    sm ($2b28),r0

gsu_01d7cc:
    iwt r0,#$0000
    alt2
    sms ($132),r0
    iwt r0,#$00fa
    alt2
    sms ($136),r0
    iwt r0,#$ffe0
    alt2
    sms ($13c),r0
    iwt r0,#$013b
    alt2
    sms ($13e),r0
    link #4
    iwt r15,#gsu_01d828
    nop
    iwt r0,#$ffe0
    alt2
    sms ($132),r0
    iwt r0,#$013b
    alt2
    sms ($136),r0
    iwt r0,#$0020
    alt2
    sms ($13c),r0
    iwt r0,#$013b
    alt2
    sms ($13e),r0
    link #4
    iwt r15,#gsu_01d828
    nop
    iwt r0,#$0000
    alt2
    sms ($132),r0
    iwt r0,#$00fa
    alt2
    sms ($136),r0
    iwt r0,#$0020
    alt2
    sms ($13c),r0
    iwt r0,#$013b
    alt2
    sms ($13e),r0
    link #4
    iwt r15,#gsu_01d828
    nop

gsu_01d823:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01d828:
    from r11
    stw (r10)
    inc r10
    inc r10
    alt1
    lm r0,($2b28)
    color
    alt1
    lms r1,($132)
    alt1
    lms r3,($136)
    alt1
    lm r2,($2b22)
    with r2
    lob
    link #4
    iwt r15,#gsu_01962a
    nop
    alt2
    sms ($132),r1
    alt2
    sms ($136),r3
    alt1
    lms r1,($13c)
    alt1
    lms r3,($13e)
    alt1
    lm r2,($2b22)
    with r2
    lob
    link #4
    iwt r15,#gsu_01962a
    nop
    alt2
    sms ($13c),r1
    alt2
    sms ($13e),r3
    iwt r0,#$0070
    alt1
    lms r1,($132)
    alt1
    lms r3,($13c)
    with r1
    add r0
    with r3
    add r0
    iwt r0,#$0060
    alt1
    lms r2,($136)
    alt1
    lms r9,($13e)
    with r2
    add r0
    with r9
    add r0
    link #4
    iwt r15,#gsu_01d8b3
    nop
    alt1
    lm r0,($2b2a)
    color
    iwt r0,#$0070
    alt1
    lms r1,($132)
    with r1
    not
    inc r1
    alt1
    lms r3,($13c)
    with r3
    not
    inc r3
    with r1
    add r0
    with r3
    add r0
    iwt r0,#$0060
    alt1
    lms r2,($136)
    with r2
    not
    inc r2
    alt1
    lms r9,($13e)
    with r9
    not
    inc r9
    with r2
    add r0
    with r9
    add r0
    link #4
    iwt r15,#gsu_01d8b3
    nop
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop

gsu_01d8b3:
    from r11
    stw (r10)
    inc r10
    inc r10
    cache
    ibt r5,#$01
    with r3
    sub r1
    bpl gsu_01d8c4
    nop
    ibt r5,#$ff
    with r3
    not
    inc r3

gsu_01d8c4:
    ibt r6,#$01
    with r9
    sub r2
    bpl gsu_01d8d0
    nop
    ibt r6,#$ff
    with r9
    not
    inc r9

gsu_01d8d0:
    from r3
    sub r9
    bmi gsu_01d8eb
    nop
    with r3
    to r12
    inc r12
    lsr
    sub r9
    with r15
    to r13
    bcs gsu_01d8e2
    plot
    add r3
    with r2

gsu_01d8e1:
    add r6

gsu_01d8e2:
    dec r1
    with r1
    add r5
    loop
    sub r9
    iwt r15,#gsu_01d8ff
    nop

gsu_01d8eb:
    with r9
    to r12
    inc r12
    not
    inc r0
    lsr
    sub r3
    with r15
    to r13
    bcs gsu_01d8fa
    plot
    add r9
    with r1
    add r5

gsu_01d8fa:
    dec r1
    with r2
    add r6
    loop
    sub r3

gsu_01d8ff:
    dec r10
    dec r10
    to r15
    ldw (r10)
    nop
    asr
    inc r9
    bpl gsu_01d8e1
    from r6
    dec r6
    blt $d911
    blt $d915
    blt $d917
    blt $d919
    blt $d91b
    blt $d91d
    blt $d91f
    blt $d921
    blt $d923
    bra gsu_01d926
    blt $d927
    beq $d929
    blt $d92b
    bne $d92d

gsu_01d926:
    blt gsu_01d92f
    blt gsu_01d931
    beq gsu_01d933
    blt gsu_01d935
    lsr

gsu_01d92f:
    bmi $d934

gsu_01d931:
    bra gsu_01d939

gsu_01d933:
    bge gsu_01d93b

gsu_01d935:
    bge gsu_01d93d
    bge gsu_01d93f

gsu_01d939:
    bge $d93e

gsu_01d93b:
    bge gsu_01d943

gsu_01d93d:
    bge $d946

gsu_01d93f:
    bge gsu_01d947
    bge gsu_01d949

gsu_01d943:
    bge gsu_01d94b
    blt gsu_01d94d

gsu_01d947:
    blt $d950

gsu_01d949:
    bge gsu_01d951

gsu_01d94b:
    bge gsu_01d953

gsu_01d94d:
    lsr
    lsr
    blt gsu_01d957

gsu_01d951:
    bne gsu_01d95b

gsu_01d953:
    bne gsu_01d95d
    bne gsu_01d95f

gsu_01d957:
    bne gsu_01d961
    bne gsu_01d963

gsu_01d95b:
    blt gsu_01d965

gsu_01d95d:
    blt gsu_01d967

gsu_01d95f:
    bne gsu_01d969

gsu_01d961:
    bne gsu_01d96b

gsu_01d963:
    bne gsu_01d96d

gsu_01d965:
    bra gsu_01d96f

gsu_01d967:
    bne gsu_01d971

gsu_01d969:
    bne gsu_01d973

gsu_01d96b:
    bne gsu_01d975

gsu_01d96d:
    bne gsu_01d977

gsu_01d96f:
    bne gsu_01d979

gsu_01d971:
    bne gsu_01d97b

gsu_01d973:
    bne gsu_01d97d

gsu_01d975:
    bne gsu_01d97f

gsu_01d977:
    bne gsu_01d981

gsu_01d979:
    blt gsu_01d983

gsu_01d97b:
    blt gsu_01d985

gsu_01d97d:
    bne gsu_01d987

gsu_01d97f:
    bne gsu_01d985

gsu_01d981:
    bra $d988

gsu_01d983:
    bne $d98a

gsu_01d985:
    bra gsu_01d98d

gsu_01d987:
    bge gsu_01d98f
    bge $d991
    bra gsu_01d993

gsu_01d98d:
    lsr
    lsr

gsu_01d98f:
    lsr
    blt gsu_01d995
    rol

gsu_01d993:
    bne gsu_01d99d

gsu_01d995:
    bne gsu_01d997

gsu_01d997:
    and r8
    stop
    .db $cc,$00,$cc,$00

gsu_01d99d:
    or r12
    stop
    .incbin "data/00d99f-010000.bin"
