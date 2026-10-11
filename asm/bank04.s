.rombank $04

    .db $a9,$7e,$48,$ab
.cpu
.a8
.i16
    lda #$0a
    sta $2a,x
    lda #$0a
    sta $2b,x
    bra loc_048022
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $1d,x
    ora #$40
    sta $1d,x
    lda #$0a
    sta $2a,x
    lda #$08
    sta $2b,x

loc_048022:
    rep #$20
.a16
    lda #$805f
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    lda #$04
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$a2de
    sta $1cd3,x
    lda #$f45f
    sta $1cd0,x
    sep #$20
.a8
    lda $2e,x
    ora #$10
    sta $2e,x
    lda $1d,x
    ora #$08
    sta $1d,x
    lda #$00
    sta $25,x
    stz $f0b0
    stz $f0b1

loc_04805f:
    ldy $28,x
    phx
    tyx
    lda $04a413,x
    plx
    sta $1cdc,x
    rep #$20
.a16
    lda #$807c
    sta $53
    sep #$20
.a8
    lda #$04
    sta $55
    jml loc_09bade
    .incbin "data/02007c-02031c.bin"

loc_04831c:
.a16
    sep #$20
.a8
    rep #$20
.a16
    lda $28,x
    clc
    adc #$000e
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_048331:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$000d
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048342:
    lda #$00
    sta $24,x
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0009
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_04835b:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0008
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_048370:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0007
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_048385:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0006
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_04839a:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0005
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_0483af:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0004
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_0483c4:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0003
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_0483d5:
    lda #$00
    sta $24,x

loc_0483d9:
    sep #$20
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0002
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    .db $a9,$00,$95,$24

loc_0483ee:
    sep #$20
    rep #$20
.a16
    inc $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_0483f9:
    rep #$20
.a16
    jsr sub_04a35f
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048405:
    rep #$20
.a16
    jsr sub_04a36b
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048411:
    rep #$20
.a16
    jsr sub_04a377
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_04841d:
    rep #$20
.a16
    jsr sub_04a383
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048429:
    rep #$20
.a16
    jsr sub_04a38f
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048435:
.a16
    rep #$20
    jsr sub_04a39b
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_048441:
    rep #$20
.a16
    jsr sub_04a3a7
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_04844d:
    lda $1e,x
    ora #$40
    sta $1e,x
    jmp loc_0483ee

loc_048456:
    lda $1e,x
    and #$bf
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    and #$7f
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    ora #$80
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    ora #$10
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    and #$ef
    sta $1e,x
    jmp loc_0483ee
    jsr sub_04a35f
    cmp $24,x
    bne loc_04848e
    jml loc_0483d5

loc_04848e:
    inc $24,x
    jmp loc_04a1af
    rep #$20
.a16
    inc $28,x
    sep #$20
.a8
    jmp loc_04a1af
    lda $1e,x
    ora #$20
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    and #$df
    sta $1e,x
    jmp loc_0483ee
    jsr sub_04a35f
    sta $15,x
    lda $1e,x
    and #$20
    beq loc_0484bd
    jml loc_0483d9

loc_0484bd:
    jsr sub_0484c3
    jmp loc_0483d9

sub_0484c3:
    lda $1e,x
    and #$40
    beq loc_0484cd
    jml loc_0484e0

loc_0484cd:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    rts

loc_0484e0:
    lda $15,x
    sta $7e
    lda $13,x
    jsl sub_1fc177
    rep #$20
.a16
    lda $02
    sta $2f,x
    lda $90
    sta $33,x
    sep #$20
.a8
    rts
    jsr sub_04a35f
    cmp $23,x
    beq loc_04850c
    inc $23,x
    rep #$20
.a16
    jsr sub_04a36b
    sta $28,x
    sep #$20
.a8
    jmp loc_04a1af

loc_04850c:
    stz $23,x
    jmp loc_0483af
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    jsr sub_04a36b
    clc
    adc $0000,y
    sta $0000,y
    jmp loc_0483c4
    jsr sub_04a35f
    clc
    adc $12,x
    sta $12,x
    jmp loc_0483d9
    jsr sub_04a35f
    clc
    adc $13,x
    sta $13,x
    jmp loc_0483d9
    jsr sub_04a35f
    clc
    adc $14,x
    sta $14,x
    jmp loc_0483d9
    jsr sub_04a35f
    rep #$20
.a16
    bit #$0080
    beq loc_048557
    ora #$ff00
    bra loc_04855a

loc_048557:
    and #$00ff

loc_04855a:
    clc
    adc $0c,x
    sta $0c,x
    jmp loc_0483d9
.a8
    jsr sub_04a35f
    rep #$20
.a16
    bit #$0080
    beq loc_048571
    ora #$ff00
    bra loc_048574

loc_048571:
    and #$00ff

loc_048574:
    clc
    adc $0e,x
    sta $0e,x
    jmp loc_0483d9
.a8
    jsr sub_04a35f
    rep #$20
.a16
    bit #$0080
    beq loc_04858b
    ora #$ff00
    bra loc_04858e

loc_04858b:
    and #$00ff

loc_04858e:
    clc
    adc $10,x
    sta $10,x
    jmp loc_0483d9

loc_048596:
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    jsr sub_04a36b
    rep #$20
    bit #$0080
    beq loc_0485ae
    ora #$ff00
    bra loc_0485b1

loc_0485ae:
    and #$00ff

loc_0485b1:
    clc
    adc $0000,y
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483c4
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    jsr sub_04a36b
    clc
    adc $0000,y
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483af
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $0000,y
    inc a
    sta $0000,y
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    inc a
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $0000,y
    dec a
    sta $0000,y
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    dec a
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483d9
    .db $ac,$38,$12,$9c,$32,$15,$22,$3e,$d0,$1f,$e2,$20,$eb,$d5,$12,$d0
    .db $04,$5c,$73,$86,$04,$38,$f5,$12,$c9,$00,$30,$08,$c9,$08,$10,$0a
    .db $a9,$08,$80,$06,$c9,$f8,$30,$02,$a9,$f8,$c9,$80,$6a,$10,$02,$69
    .db $00,$c9,$80,$6a,$10,$02,$69,$00,$c9,$80,$6a,$10,$02,$69,$00,$18
    .db $75,$12,$95,$12,$5c,$76,$86,$04,$ee,$32,$15,$22,$21,$d0,$1f,$e2
    .db $20,$eb,$49,$ff,$1a,$d5,$13,$d0,$04,$5c,$bb,$86,$04,$38,$f5,$13
    .db $c9,$00,$30,$08,$c9,$08,$10,$0a,$a9,$08,$80,$06,$c9,$f8,$30,$02
    .db $a9,$f8,$c9,$80,$6a,$10,$02,$69,$00,$c9,$80,$6a,$10,$02,$69,$00
    .db $c9,$80,$6a,$10,$02,$69,$00,$18,$75,$13,$95,$13,$5c,$be,$86,$04
    .db $ee,$32,$15,$ad,$32,$15,$c9,$02,$d0,$04,$5c,$ee,$83,$04,$4c,$af
    .db $a1
    ldy $1238
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_048703
    sec
    sbc $12,x
    cmp #$00
    bmi loc_0486ec
    cmp #$04
    bpl loc_0486f2
    lda #$04
    bra loc_0486f2

loc_0486ec:
    cmp #$fc
    bmi loc_0486f2
    lda #$fc

loc_0486f2:
    cmp #$80
    ror a
    bpl loc_0486f9
    adc #$00

loc_0486f9:
    cmp #$80
    ror a
    bpl loc_048700
    adc #$00

loc_048700:
    clc
    adc $12,x

loc_048703:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_048739
    sec
    sbc $13,x
    cmp #$00
    bmi loc_048722
    cmp #$04
    bpl loc_048728
    lda #$04
    bra loc_048728

loc_048722:
    cmp #$fc
    bmi loc_048728
    lda #$fc

loc_048728:
    cmp #$80
    ror a
    bpl loc_04872f
    adc #$00

loc_04872f:
    cmp #$80
    ror a
    bpl loc_048736
    adc #$00

loc_048736:
    clc
    adc $13,x

loc_048739:
    sta $13,x
    jmp loc_0483ee
    .db $20,$52,$87,$4c,$ee,$83,$20,$52,$87,$b9,$2e,$00,$09,$10,$99,$2e
    .db $00,$4c,$ee,$83,$a9,$00,$8d,$45,$15,$a9,$00,$8d,$47,$15,$a9,$00
    .db $8d,$49,$15,$a9,$00,$8d,$4c,$15,$a9,$00,$8d,$4b,$15,$9c,$4d,$15
    .db $9c,$4e,$15,$a9,$0c,$22,$46,$d1,$1f,$c0,$00,$00,$d0,$03,$ac,$6b
    .db $15,$60,$a9,$00,$8d,$45,$15,$a9,$00,$8d,$47,$15,$a9,$00,$8d,$49
    .db $15,$a9,$00,$8d,$4c,$15,$a9,$00,$8d,$4b,$15,$9c,$4d,$15,$9c,$4e
    .db $15,$a9,$12,$22,$46,$d1,$1f,$c0,$00,$00,$d0,$03,$ac,$6b,$15,$da
    .db $ae,$38,$12,$96,$06,$fa,$4c,$ee,$83
    jsr sub_04a35f
    sta $2c,x
    jmp loc_0483d9
    jsr sub_048815
    lda $002e,y
    ora #$10
    sta $002e,y
    jmp loc_0483ee
    jsr sub_048815
    jmp loc_0483ee
    .db $20,$e7,$87,$b9,$2e,$00,$09,$10,$99,$2e,$00,$4c,$ee,$83,$20,$e7
    .db $87,$4c,$ee,$83,$20,$15,$88,$da,$ae,$38,$12,$96,$06,$fa,$60,$20
    .db $06,$88,$b9,$2e,$00,$09,$10,$99,$2e,$00,$4c,$ee,$83,$20,$06,$88
    .db $4c,$ee,$83,$20,$15,$88,$da,$c2,$20,$b5,$06,$aa,$e2,$20,$96,$06
    .db $fa,$60

sub_048815:
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda $2c,x
    jsl sub_1fd146
    cpy #$0000
    bne loc_048842
    ldy $156b

loc_048842:
    sty $f0d8
    rts
    jsr sub_04a35f
    sta $1759
    stx $1757
    jsr sub_04a36b
    jsr sub_04a098
    lda $0000,y
    sta $1757
    lda $1759
    cmp $1757
    beq loc_048892
    sec
    sbc $1757
    cmp #$00
    bmi loc_048873
    cmp #$08
    bpl loc_048879
    lda #$08
    bra loc_048879

loc_048873:
    cmp #$f8
    bmi loc_048879
    lda #$f8

loc_048879:
    cmp #$80
    ror a
    bpl loc_048880
    adc #$00

loc_048880:
    cmp #$80
    ror a
    bpl loc_048887
    adc #$00

loc_048887:
    cmp #$80
    ror a
    bpl loc_04888e
    adc #$00

loc_04888e:
    clc
    adc $1757

loc_048892:
    sta $1757
    lda $1757
    sta $0000,y
    jmp loc_0483c4

loc_04889e:
    rep #$20
.a16
    jsr sub_04a35f
    sta $1759
    sep #$20
.a8
    stx $1757
    jsr sub_04a377
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    lda $1759
    cmp $1757
    beq loc_0488ff
    sec
    sbc $1757
    cmp #$0000
    bmi loc_0488d8
    cmp #$0008
    bpl loc_0488e0
    lda #$0008
    bra loc_0488e0

loc_0488d8:
    cmp #$fff8
    bmi loc_0488e0
    lda #$fff8

loc_0488e0:
    cmp #$8000
    ror a
    bpl loc_0488e9
    adc #$0000

loc_0488e9:
    cmp #$8000
    ror a
    bpl loc_0488f2
    adc #$0000

loc_0488f2:
    cmp #$8000
    ror a
    bpl loc_0488fb
    adc #$0000

loc_0488fb:
    clc
    adc $1757

loc_0488ff:
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    lda $1757
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483af
    jsr sub_04a35f
    sta $1759
    stx $1757
    jsr sub_04a36b
    jsr sub_04a098
    lda $0000,y
    sta $1757
    lda $1759
    cmp $1757
    bne loc_048932
    jml loc_048966

loc_048932:
    sec
    sbc $1757
    cmp #$00
    bmi loc_048942
    cmp #$08
    bpl loc_048948
    lda #$08
    bra loc_048948

loc_048942:
    cmp #$f8
    bmi loc_048948
    lda #$f8

loc_048948:
    cmp #$80
    ror a
    bpl loc_04894f
    adc #$00

loc_04894f:
    cmp #$80
    ror a
    bpl loc_048956
    adc #$00

loc_048956:
    cmp #$80
    ror a
    bpl loc_04895d
    adc #$00

loc_04895d:
    clc
    adc $1757
    sta $1757
    bra loc_04896a

loc_048966:
    jml loc_048973

loc_04896a:
    lda $1757
    sta $0000,y
    jmp loc_04a1af

loc_048973:
    lda $1757
    sta $0000,y
    jmp loc_0483c4
    .db $c2,$20,$20,$5f,$a3,$8d,$59,$17,$e2,$20,$8e,$57,$17,$20,$77,$a3
    .db $20,$98,$a0,$c2,$20,$b9,$00,$00,$8d,$57,$17,$e2,$20,$c2,$20,$ad
    .db $59,$17,$cd,$57,$17,$d0,$04,$5c,$e6,$89,$04,$38,$ed,$57,$17,$c9
    .db $00,$00,$30,$0a,$c9,$08,$00,$10,$0d,$a9,$08,$00,$80,$08,$c9,$f8
    .db $ff,$30,$03,$a9,$f8,$ff,$c9,$00,$80,$6a,$10,$03,$69,$00,$00,$c9
    .db $00,$80,$6a,$10,$03,$69,$00,$00,$c9,$00,$80,$6a,$10,$03,$69,$00
    .db $00,$18,$6d,$57,$17,$8d,$57,$17,$80,$06,$e2,$20,$5c,$fb,$89,$04
    .db $e2,$20,$c2,$20,$ad,$57,$17,$99,$00,$00,$e2,$20,$4c,$af,$a1,$c2
    .db $20,$ad,$57,$17,$99,$00,$00,$e2,$20,$4c,$af,$83
    phx
    jsr sub_048ab4
    lda $0000,x
    clc
    adc $0000,y
    sta $0000,y
    plx
    jmp loc_0483c4
    phx
    jsr sub_048ab4
    rep #$20
.a16
    lda $0000,x
    clc
    adc $0000,y
    sta $0000,y
    plx
    jmp loc_0483c4

loc_048a2e:
    phx
    jsr sub_048ab4
    rep #$20
    lda $0000,x
    sep #$20
.a8
    clc
    adc $0000,y
    sta $0000,y
    plx
    jmp loc_0483c4
    phx
    jsr sub_048ab4
    lda $0000,x
    rep #$20
.a16
    bit #$0080
    beq loc_048a57
    ora #$ff00
    bra loc_048a5a

loc_048a57:
    and #$00ff

loc_048a5a:
    clc
    adc $0000,y
    sta $0000,y
    plx
    jmp loc_0483c4
.a8
    phx
    jsr sub_048ab4
    lda $0000,x
    sta $0000,y
    plx
    jmp loc_0483c4

loc_048a73:
    phx
    jsr sub_048ab4
    rep #$20
.a16
    lda $0000,x
    sta $0000,y
    plx
    jmp loc_0483c4
.a8
    phx
    jsr sub_048ab4
    rep #$20
.a16
    lda $0000,x
    sep #$20
.a8
    sta $0000,y
    plx
    jmp loc_0483c4

loc_048a95:
    phx
    jsr sub_048ab4
    sep #$20
    lda $0000,x
    rep #$20
.a16
    bit #$0080
    beq loc_048aaa
    ora #$ff00
    bra loc_048aad

loc_048aaa:
    and #$00ff

loc_048aad:
    sta $0000,y
    plx
    jmp loc_0483c4

sub_048ab4:
.a8
    php
    sep #$20
    stx $1757
    jsr sub_04a36b
    jsr sub_04a098
    phy
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    plx
    plp
    rts
    jsr sub_048b17
    lda $175d
    sta $0000,y
    jmp loc_0483af
    jsr sub_048b17
    rep #$20
.a16
    lda $175d
    sta $0000,y
    jmp loc_0483af
.a8
    jsr sub_048b01
.a16
    sep #$20
.a8
    lda $175d
    sta $0000,y
    jmp loc_0483af
    jsr sub_048b01
.a16
    lda $175d
    sta $0000,y
    jmp loc_0483af

sub_048b01:
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    sta $175d
    jsr sub_04a36b
    tay
    rts

sub_048b17:
.a8
    rep #$20
.a16
    jsr sub_04a36b
    tay
    lda $0000,y
    sta $175d
    sep #$20
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rts
    stx $1757
    jsr sub_04a36b
    jsr sub_04a098
    sep #$20
    jsr sub_04a35f
    sta $0000,y
    jmp loc_0483c4
    stx $1757
    jsr sub_04a377
    jsr sub_04a098
    rep #$20
.a16
    jsr sub_04a35f
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483af
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    sep #$20
    lda #$00
    sta $0000,y
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda #$0000
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483d9
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    ldy $121d
    sty $14ca
    rep #$20
.a16
    lda #$0000
    sta $3e
    lda #$1b58
    sta $3a
    lda $1757
    jsl sub_1fc870
    cpy #$0000
    sep #$20
.a8
    bne loc_048bb0
    jml loc_048bb5

loc_048bb0:
    sty $06,x
    jmp loc_0483c4

loc_048bb5:
    stz $06,x
    stz $07,x
    jmp loc_0483c4
    .db $c2,$20,$20,$5f,$a3,$8d,$57,$17,$e2,$20,$b4,$06,$d0,$04,$5c,$f4
    .db $8b,$04,$8c,$ca,$14,$c2,$20,$a9,$00,$00,$85,$3e,$a9,$b8,$0b,$85
    .db $3a,$ad,$57,$17,$22,$70,$c8,$1f,$c0,$00,$00,$e2,$20,$d0,$04,$5c
    .db $f4,$8b,$04,$94,$06,$4c,$c4,$83,$74,$06,$74,$07,$4c,$c4,$83
    ldy $06,x
    bne loc_048c03
    jml loc_0483ee

loc_048c03:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    bne loc_048c15
    jml loc_048c48

loc_048c15:
    sec
    sbc $12,x
    cmp #$00
    bmi loc_048c24
    cmp #$08
    bpl loc_048c2a
    lda #$08
    bra loc_048c2a

loc_048c24:
    cmp #$f8
    bmi loc_048c2a
    lda #$f8

loc_048c2a:
    cmp #$80
    ror a
    bpl loc_048c31
    adc #$00

loc_048c31:
    cmp #$80
    ror a
    bpl loc_048c38
    adc #$00

loc_048c38:
    cmp #$80
    ror a
    bpl loc_048c3f
    adc #$00

loc_048c3f:
    clc
    adc $12,x
    sta $12,x
    jml loc_048c4b

loc_048c48:
    inc $1532

loc_048c4b:
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    bne loc_048c5d
    jml loc_048c90

loc_048c5d:
    sec
    sbc $13,x
    cmp #$00
    bmi loc_048c6c
    cmp #$08
    bpl loc_048c72
    lda #$08
    bra loc_048c72

loc_048c6c:
    cmp #$f8
    bmi loc_048c72
    lda #$f8

loc_048c72:
    cmp #$80
    ror a
    bpl loc_048c79
    adc #$00

loc_048c79:
    cmp #$80
    ror a
    bpl loc_048c80
    adc #$00

loc_048c80:
    cmp #$80
    ror a
    bpl loc_048c87
    adc #$00

loc_048c87:
    clc
    adc $13,x
    sta $13,x
    jml loc_048c93

loc_048c90:
    inc $1532

loc_048c93:
    lda $1532
    cmp #$02
    bne loc_048c9e
    jml loc_0483ee

loc_048c9e:
    jmp loc_04a1af

loc_048ca1:
.a16
    jsr sub_04a35f
    sta $1757
    phx
    lda $20,x
    and #$f040
    tsb $5c
    lda $8c,x
    tsb $b4
    asl $bb
    lda $1757
    jsl sub_1fdc40
    jsl sub_1fd540
    plx
    jmp loc_0483d9
.a8
    lda $20,x
    and #$40
    bne loc_048cce
    jml loc_048ce4

loc_048cce:
    ldy $26,x

loc_048cd0:
    cpy #$0000
    beq loc_048ce4
    rep #$20
.a16
    lda $0026,y
    pha
    sep #$20
.a8
    jsl sub_1fd540
    ply
    bra loc_048cd0

loc_048ce4:
    jsl sub_1fd501
    jmp loc_04a2d1
    lda $25,x
    beq loc_048cfc
    rep #$20
.a16
    and #$00ff
    tay
    sep #$20
.a8
    lda #$00
    sta $189f,y

loc_048cfc:
    lda $20,x
    and #$40
    bne loc_048d06
    jml loc_048d25

loc_048d06:
    ldy $26,x

loc_048d08:
    cpy #$0000
    beq loc_048d25
    rep #$20
.a16
    lda $0026,y
    pha
    sep #$20
.a8
    lda $001e,y
    ora #$01
    sta $001e,y
    lda #$00
    sta $002a,y
    ply
    bra loc_048d08

loc_048d25:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    jmp loc_04a2c0
    .incbin "data/020d32-021031.bin"
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    ldy $1238

loc_04903e:
    lda $f0b2
    beq loc_049062
    stz $f0b2
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_049054
    eor #$ffff
    inc a

loc_049054:
    cmp $1757
    sep #$20
.a8
    bmi loc_04905f
    jml loc_048411

loc_04905f:
    jmp loc_04839a

loc_049062:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_049070
    eor #$ffff
    inc a

loc_049070:
    cmp $1757
    sep #$20
.a8
    bpl loc_04907b
    jml loc_048411

loc_04907b:
    jmp loc_04839a
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    ldy $06,x
    bne loc_049090
    jml loc_04839a

loc_049090:
    bra loc_04903e
    rep #$20
.a16
    jsr sub_04a35f
    sta $28,x
    sep #$20
.a8
    jmp loc_04a1af
    jsr sub_04a35f
    sta $0a,x
    jsr sub_04a36b
    sta $0b,x
    jmp loc_0483c4
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $0e,x
    sep #$20
.a8
    php
    lda $f0b2
    beq loc_0490c8
    stz $f0b2
    plp
    bmi loc_0490c5
    jml loc_04839a

loc_0490c5:
    jmp loc_048411

loc_0490c8:
    plp
    bpl loc_0490cf
    jml loc_04839a

loc_0490cf:
    jmp loc_048411

loc_0490d2:
    rep #$20
.a16
    lda $1571
    sec
    sbc $156f
    sta $02
    lda $0c,x
    sec
    sbc $156f
    cmp $02
    bcc loc_0490eb
    jml loc_0483f9

loc_0490eb:
    lda $1579
    sec
    sbc $1577
    sta $02
    lda $0e,x
    sec
    sbc $1577
    cmp $02
    bcc loc_049102
    jml loc_0483f9

loc_049102:
    jmp loc_0483c4
.a8
    jsr sub_04a35f
    sta $1757
    lda $1757
    ora #$80
    sta $1ce7,x
    jmp loc_0483d9
    jsr sub_04a35f
    sta $1757
    jsr sub_04a36b
    sta $175d
    lda $1ce7,x
    clc
    adc $1757
    bmi loc_04912f
    clc
    adc $175d

loc_04912f:
    and #$7f
    cmp $175d
    bcc loc_04913a
    sec
    sbc $175d

loc_04913a:
    ora #$80
    sta $1ce7,x
    jmp loc_0483c4

loc_049142:
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    lda $1757
    sta $1ce4,x
    sep #$20
.a8
    jmp loc_0483c4
    jsr sub_04a35f
    cmp #$06
    beq loc_049175
    rep #$20
.a16
    and #$00ff
    tay
    sep #$20
.a8
    lda $189f,y
    bne loc_049171
    jml loc_0491e0

loc_049171:
    tya
    jmp loc_0491db

loc_049175:
    lda $18a1
    beq loc_0491b3
    lda $18a2
    beq loc_049192
    lda $18a0
    beq loc_0491a5
    jsl sub_02fc58
    cmp #$32
    bcc loc_0491d9
    cmp #$96
    bcc loc_0491d1
    bra loc_0491d5

loc_049192:
    lda $18a0
    beq loc_0491d9
    jsl sub_02fc58
    cmp #$66
    bcs loc_0491a3
    jml loc_0491d9

loc_0491a3:
    bra loc_0491d1

loc_0491a5:
    jsl sub_02fc58
    cmp #$66
    bcs loc_0491b1
    jml loc_0491d9

loc_0491b1:
    bra loc_0491d5

loc_0491b3:
    lda $18a2
    beq loc_0491cc
    lda $18a0
    beq loc_0491d5
    jsl sub_02fc58
    cmp #$7f
    bcs loc_0491c9
    jml loc_0491d5

loc_0491c9:
    jmp loc_0491d1

loc_0491cc:
    lda $18a0
    beq loc_0491e0

loc_0491d1:
    lda #$01
    bra loc_0491db

loc_0491d5:
    lda #$03
    bra loc_0491db

loc_0491d9:
    lda #$02

loc_0491db:
    sta $25,x
    jmp loc_0483d9

loc_0491e0:
    jmp loc_0483d9
    ldy $1769
    bne loc_0491ee
    stx $1769
    jmp loc_0483ee

loc_0491ee:
    sty $06,x
    stx $06,y
    stz $1769
    stz $176a
    jmp loc_0483ee
    ldy $06,x
    bne loc_049203
    jml loc_0483f9

loc_049203:
    jmp loc_0483c4
    lda $f0b2
    beq loc_04921e
    stz $f0b2
    jsr sub_04a35f
    dec a
    cmp $1ffd
    bne loc_04921b
    jml loc_0483af

loc_04921b:
    jmp loc_048405

loc_04921e:
    jsr sub_04a35f
    dec a
    cmp $1ffd
    beq loc_04922b
    jml loc_0483af

loc_04922b:
    jmp loc_048405
    ldy $1238
    rep #$20
.a16
    lda $000c,y
    cmp $0c,x
    bpl loc_049281
    sep #$20
.a8
    jmp loc_0483c4
    ldy $1238
    rep #$20
.a16
    lda $000c,y
    cmp $0c,x
    bmi loc_049281
    sep #$20
.a8
    jmp loc_0483c4
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    cmp $10,x
    bpl loc_049281
    jmp loc_0483c4

loc_04925f:
    ldy $1238
    rep #$20
    lda $000e,y
    cmp $0e,x
    bpl loc_049281
    sep #$20
.a8
    jmp loc_0483c4

loc_049270:
    ldy $1238
    rep #$20
.a16
    lda $000e,y
    cmp $0e,x
    bmi loc_049281
    sep #$20
.a8
    jmp loc_0483c4

loc_049281:
    jmp loc_0483f9
    lda $f0b2
    beq loc_0492a6
    stz $f0b2
    jsr sub_04a35f
    cmp #$06
    bne loc_04929b
    lda $25,x
    bne loc_04929b
    jml loc_0483af

loc_04929b:
    cmp $25,x
    bne loc_0492a3
    jml loc_048405

loc_0492a3:
    jmp loc_0483af

loc_0492a6:
    jsr sub_04a35f
    cmp #$06
    bne loc_0492b1
    lda $25,x
    beq loc_0492b9

loc_0492b1:
    cmp $25,x
    bne loc_0492b9
    jml loc_0483af

loc_0492b9:
    jmp loc_048405
    jsr sub_04a35f
    phx
    jsl sub_03e9cf
    plx
    jmp loc_0483d9
    lda #$ff
    sta $1ffb
    jsr sub_04a35f
    phx
    jsl sub_03e9cf
    plx
    jmp loc_0483d9
    lda $25,x
    beq loc_0492ef
    rep #$20
.a16
    and #$00ff
    tay
    sep #$20
.a8
    lda $189f,y
    cmp #$0b
    bcs loc_0492ef
    jmp loc_0483f9

loc_0492ef:
    jmp loc_0483c4
    lda $25,x
    beq loc_04930b
    rep #$20
.a16
    and #$00ff
    tay
    sep #$20
.a8
    lda $189f,y
    sec
    sbc #$0a
    bcs loc_049308
    lda #$00

loc_049308:
    sta $189f,y

loc_04930b:
    jmp loc_0483ee
    lda $1f,x
    ora #$02
    sta $1f,x
    jmp loc_0483ee
    lda $1f,x
    and #$fd
    sta $1f,x
    jmp loc_0483ee
    lda $09,x
    ora #$08
    sta $09,x
    jmp loc_04a1af
    jsl sub_02fc58
    cmp #$7f
    bcs loc_049335
    jml loc_049281

loc_049335:
    jmp loc_0483c4
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $0000,y
    bne loc_04934a
    jml loc_048405

loc_04934a:
    jmp loc_0483af

loc_04934d:
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    bne loc_049361
    jml loc_048405

loc_049361:
    jmp loc_0483af
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $0000,y
    bne loc_049376
    jml loc_0483af

loc_049376:
    jmp loc_048405
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    bne loc_04938d
    jml loc_0483af

loc_04938d:
    jmp loc_048405
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    jsr sub_04a36b
    cmp $0000,y
    php
    lda $f0b2
    beq loc_0493b2
    stz $f0b2
    plp
    bne loc_0493af
    jml loc_04839a

loc_0493af:
    jmp loc_048411

loc_0493b2:
    plp
    beq loc_0493b9
    jml loc_04839a

loc_0493b9:
    jmp loc_048411
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    jsr sub_04a36b
    cmp $0000,y
    sep #$20
.a8
    php
    lda $f0b2
    beq loc_0493e2
    stz $f0b2
    plp
    bne loc_0493df
    jml loc_048385

loc_0493df:
    jmp loc_04841d

loc_0493e2:
    plp
    beq loc_0493e9
    jml loc_048385

loc_0493e9:
    jmp loc_04841d
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $f0b2
    beq loc_049418
    stz $f0b2
    jsr sub_04a36b
    cmp $0000,y
    bmi loc_049409
    jml loc_04841d

loc_049409:
    jsr sub_04a377
    cmp $0000,y
    bpl loc_049415
    jml loc_04841d

loc_049415:
    jmp loc_048385

loc_049418:
    jsr sub_04a36b
    cmp $0000,y
    bmi loc_049424
    jml loc_048385

loc_049424:
    jsr sub_04a377
    cmp $0000,y
    bpl loc_049430
    jml loc_048385

loc_049430:
    jmp loc_04841d
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    lda $f0b2
    beq loc_049461
    stz $f0b2
    rep #$20
.a16
    jsr sub_04a36b
    cmp $0000,y
    bmi loc_049452
    jml loc_048435

loc_049452:
    jsr sub_04a383
    cmp $0000,y
    bpl loc_04945e
    jml loc_048435

loc_04945e:
    jmp loc_04835b

loc_049461:
.a8
    rep #$20
.a16
    jsr sub_04a36b
    cmp $0000,y
    bmi loc_04946f
    jml loc_04835b

loc_04946f:
    jsr sub_04a383
    cmp $0000,y
    bpl loc_04947b
    jml loc_04835b

loc_04947b:
    jmp loc_048435
.a8
    lda $1f,x
    ora #$20
    sta $1f,x
    jmp loc_0483ee

loc_049487:
    lda $1f,x
    and #$df
    sta $1f,x
    jmp loc_0483ee

loc_049490:
    lda $14d7
    bit #$80
    beq loc_04949b
    jml loc_049281

loc_04949b:
    lda $14d0
    bit #$02
    bne loc_0494a6
    jml loc_0483c4

loc_0494a6:
    jmp loc_049281
    rep #$20
.a16
    jsr sub_04a35f
    sta $175d
    sep #$20
.a8
    jsr sub_04a38f
    sta $1758
    jsr sub_04a39b
    sta $175a
    jsr sub_04a3a7
    sta $175c
    jsr sub_04a3cb
    sta $1757
    jsr sub_04a3d7
    sta $1759
    jsr sub_04a3e3
    sta $175b
    jsr sub_04a3ef
    sta $175f
    rep #$20
.a16
    lda $121d
    pha
    sep #$20
.a8
    stx $121d
    rep #$20
.a16
    lda $175d
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0494fc
    jml loc_049540

loc_0494fc:
    lda $175f
    jsl sub_1fd56f
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$8022
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    lda $2e,x
    ora #$10
    sta $2e,x
    lda $1757
    sta $1cec,x
    lda $1759
    sta $1ced,x
    lda $175b
    sta $1cee,x
    lda $1758
    sta $1cef,x
    lda $175a
    sta $1cf0,x
    lda $175c
    sta $1cf1,x
    phx
    tyx
    ply

loc_049540:
    sty $f0d8
    rep #$20
.a16
    pla
    sta $121d
    sep #$20
.a8
    sep #$20
    jsr sub_04a3b3
    sta $002a,y
    jsr sub_04a3bf
    sta $002b,y
    rep #$20
.a16
    jsr sub_04a377
    sta $0028,y
    jmp loc_04831c
.a8
    jsr sub_0495ef
    sty $06,x
    cpy #$0000
    bne loc_049572
    jml loc_048331

loc_049572:
    stx $06,y
    jmp loc_048331
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    jsr sub_04a377
    sta $175d
    sep #$20
.a8
    rep #$20
.a16
    lda $121d
    pha
    sep #$20
.a8
    rep #$20
.a16
    lda $1757
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0495a3
    jml loc_0495de

loc_0495a3:
    sty $f0d8
    rep #$20
.a16
    pla
    sta $121d
    sep #$20
.a8
    rep #$20
.a16
    lda #$8022
    sta $0016,y
    sep #$20
.a8
    lda #$04
    sta $0018,y
    rep #$20
.a16
    lda $175d
    sta $0028,y
    sep #$20
.a8
    jsl sub_1fdad9
    jsl sub_1fdb01
    jsr sub_04a38f
    sta $002a,y
    jsr sub_04a39b
    sta $002b,y
    jmp loc_048370

loc_0495de:
    rep #$20
.a16
    pla
    sta $121d
    sep #$20
.a8
    jmp loc_048370
    .db $20,$ef,$95,$4c,$31,$83

sub_0495ef:
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    jsr sub_04a377
    sta $175f
    sep #$20
.a8
    rep #$20
.a16
    lda $121d
    pha
    sep #$20
.a8
    stx $121d
    rep #$20
.a16
    lda $1757
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_04961e
    jml loc_049715

loc_04961e:
    sty $f0d8
    rep #$20
.a16
    pla
    sta $121d
    sep #$20
.a8
    rep #$20
.a16
    lda #$8022
    sta $0016,y
    sep #$20
.a8
    lda #$04
    sta $0018,y
    rep #$20
.a16
    lda $175f
    sta $0028,y
    sep #$20
.a8
    jsr sub_04a38f
    clc
    adc $12,x
    sta $0012,y
    jsr sub_04a39b
    clc
    adc $13,x
    sta $0013,y
    jsr sub_04a3a7
    clc
    adc $14,x
    sta $0014,y
    jsr sub_04a3b3
    sta $002a,y
    jsr sub_04a3bf
    sta $002b,y
    jsr sub_04a3cb
    sta $1757
    jsr sub_04a3d7
    sta $1759
    jsr sub_04a3e3
    sta $175b
    lda $1757
    sta $02
    sta $04
    bit #$80
    beq loc_04968c
    lda #$ff
    sta $05
    bra loc_04968e

loc_04968c:
    stz $05

loc_04968e:
    lda $1759
    sta $08
    sta $0a
    bit #$80
    beq loc_04969f
    lda #$ff
    sta $0b
    bra loc_0496a1

loc_04969f:
    stz $0b

loc_0496a1:
    lda $175b
    sta $90
    sta $15c2
    bit #$80
    beq loc_0496b4
    lda #$ff
    sta $15c3
    bra loc_0496b7

loc_0496b4:
    stz $15c3

loc_0496b7:
    lda $14,x
    jsl sub_1fcc78
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    lda $12,x
    jsl sub_1fcafb
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    lda $13,x
    jsl sub_1fc97b
    rep #$20
.a16
    lda $04
    asl a
    asl a
    sta $04
    lda $0a
    asl a
    asl a
    sta $0a
    lda $15c2
    asl a
    asl a
    sta $15c2
    lda $0c,x
    clc
    adc $04
    sta $000c,y
    lda $10,x
    clc
    adc $15c2
    sta $0010,y
    lda $0e,x
    clc
    adc $0a
    sta $000e,y
    sep #$20
.a8
    rts

loc_049715:
    rep #$20
.a16
    pla
    sta $121d
    sep #$20
.a8
    ldy #$0000
    rts
    .db $5c,$ee,$bd,$1f
    lda $09,x
    ora #$08
    sta $09,x
    jmp loc_0483ee
    lda $09,x
    and #$f7
    sta $09,x
    jmp loc_0483ee
    jsr sub_04a35f
    sta $1757
    phx
    lda $20,x
    and #$40
    beq loc_049748
    jml loc_049751

loc_049748:
    ldy $06,x
    tyx
    bne loc_049751
    jml loc_049764

loc_049751:
    phy
    lda $1757
    jsl sub_1fdc40
    cpy #$0000
    bne loc_049763
    ply
    jml loc_049768

loc_049763:
    ply

loc_049764:
    plx
    jmp loc_0483af

loc_049768:
    plx
    jmp loc_048405

loc_04976c:
    jsr sub_04a35f
    sta $1757
    lda $1757
    jsl sub_1fdc40
    cpy #$0000
    bne loc_049782
    jml loc_0483d9

loc_049782:
    rep #$20
.a16
    tya
    cmp $06,x
    sep #$20
.a8
    bne loc_04978f
    jml loc_0483d9

loc_04978f:
    rep #$20
.a16
    lda $0006,y
    sta $1757
    lda $06,x
    sty $06,x
    sta $0006,y
    sep #$20
.a8
    phx
    tyx
    jsl sub_09ac7e
    ldx $1757
    stx $06,y
    plx
    jsr sub_04a35f
    sta $1757
    phx
    lda $20,x
    and #$40
    beq loc_0497bd
    jml loc_0497c5

loc_0497bd:
    ldy $06,x
    tyx
    cpy #$0000
    beq loc_0497cc

loc_0497c5:
    lda $1757
    jsl sub_1fdc40

loc_0497cc:
    plx
    cpy #$0000
    bne loc_0497d6
    jml loc_0483d9

loc_0497d6:
    lda $0020,y
    ora #$20
    sta $0020,y
    jmp loc_0483d9

loc_0497e1:
    lda $20,x
    and #$10
    bne loc_0497eb
    jml loc_0483ee

loc_0497eb:
    ldy $06,x
    lda $20,x
    and #$ef
    sta $20,x
    rep #$20
.a16
    stx $3c
    phy

loc_0497f8:
    lda $0026,y
    beq loc_049809
    cmp $3c
    beq loc_049804
    tay
    bra loc_0497f8

loc_049804:
    lda $26,x
    sta $0026,y

loc_049809:
    ply
    sep #$20
.a8
    jmp loc_0483ee
    jsr sub_04a35f
    sta $1757
    phx
    lda $20,x
    and #$40
    beq loc_049820
    jml loc_049828

loc_049820:
    ldy $06,x
    tyx
    cpy #$0000
    beq loc_04982f

loc_049828:
    lda $1757
    jsl sub_1fdc40

loc_04982f:
    plx
    cpy #$0000
    bne loc_049839
    jml loc_0483d9

loc_049839:
    phx
    ldx $06,y
    lda $0020,y
    and #$ef
    sta $0020,y
    rep #$20
.a16
    sty $3c
    phx

loc_049849:
    lda $26,x
    beq loc_049859
    cmp $3c
    beq loc_049854
    tax
    bra loc_049849

loc_049854:
    lda $0026,y
    sta $26,x

loc_049859:
    plx
    sep #$20
.a8
    plx
    jmp loc_0483d9

loc_049860:
    ldy $06,x
    cpy #$0000
    bne loc_04986b
    jml loc_0483ee

loc_04986b:
    lda $0020,y
    ora #$20
    sta $0020,y
    jmp loc_0483ee
    ldy $06,x
    cpy #$0000
    bne loc_049881
    jml loc_0483ee

loc_049881:
    lda $0020,y
    ora #$20
    sta $0020,y
    jmp loc_0483ee
    lda $20,x
    and #$20
    bne loc_049896
    jml loc_0483c4

loc_049896:
    lda $20,x
    and #$df
    sta $20,x
    jmp loc_0483f9
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    jsr sub_04a377
    sta $1759
    jsr sub_04a383
    sta $175b
    lda $1d,x
    ora #$40
    sta $1d,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $1759
    sta $1cdf,x
    rep #$20
.a16
    lda $1757
    sta $1cea,x
    sep #$20
.a8
    lda $175b
    sta $1cf4,x
    jmp loc_04839a
    jsr sub_04a35f
    sta $1cf5,x
    jmp loc_0483d9

loc_0498e3:
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    dec $28,x
    sep #$20
.a8
    rep #$20
.a16
    lda $28,x
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0000,y
    sec
    sbc #$a413
    sta $0028,x
    sep #$20
.a8
    jmp loc_04805f
    rep #$20
.a16
    lda $28,x
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483f9
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $28,x
    sep #$20
.a8
    rep #$20
.a16
    lda $28,x
    cmp #$ffff
    sep #$20
.a8
    bne loc_04994e
    jml loc_04a194

loc_04994e:
    jmp loc_0483c4

loc_049951:
    rep #$20
.a16
    lda $28,x
    inc a
    inc a
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    and #$00ff
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483d9

loc_049991:
    rep #$20
.a16
    lda $28,x
    inc a
    inc a
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    rep #$20
.a16
    lda $0000,y
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483d9
    rep #$20
.a16
    lda $28,x
    inc a
    inc a
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    jsr sub_04a35f
    and #$00ff
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483d9

loc_049a05:
    rep #$20
.a16
    lda $28,x
    clc
    adc #$0003
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    jsr sub_04a35f
    sep #$20
.a8
    rep #$20
.a16
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483c4
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    dec $1757
    sep #$20
.a8
    beq loc_049a95
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $28,x
    sep #$20
.a8
    rep #$20
.a16
    lda $28,x
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    lda $1757
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_04a1af

loc_049a95:
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    jmp loc_0483ee

loc_049aac:
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    dec $1757
    sep #$20
.a8
    beq loc_049a95
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $28,x
    sep #$20
.a8
    rep #$20
.a16
    lda $28,x
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    lda $1757
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_04805f
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    jmp loc_0483f9

loc_049b31:
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $1757
    sep #$20
.a8
    jmp loc_0483ee
    lda $20,x
    ora #$08
    sta $20,x
    lda $1e,x
    ora #$01
    sta $1e,x
    jmp loc_0483ee

loc_049b6b:
    lda $20,x
    and #$f7
    sta $20,x
    lda $1e,x
    and #$fe
    sta $1e,x
    jmp loc_0483ee
    rep #$20
.a16
    lda $1cfa,x
    sep #$20
.a8
    beq loc_049b87
    jml loc_049bb4

loc_049b87:
    rep #$20
.a16
    lda #$0004
    jsl sub_0afb35
    tay
    sep #$20
.a8
    lda #$01
    sta $a0a4,y
    rep #$20
.a16
    jsr sub_04a35f
    sta $a0a5,y
    sep #$20
.a8
    jsr sub_04a377
    sta $a0a7,y
    rep #$20
.a16
    tya
    sta $1cfa,x
    sep #$20
.a8
    jml loc_0483af

loc_049bb4:
    ldy $1cfa,x
    lda $a0a4,y
    inc a
    sta $175b
    asl a
    clc
    adc $175b
    inc a
    sta $1757
    stz $1758
    rep #$20
.a16
    rep #$20
    lda $1757
    jsl sub_0afb35
    tay
    sep #$20
.a8
    phx
    sty $175d
    ldy $1cfa,x
    ldx $175d
    lda $a0a4,y
    sta $1757
    inc a
    sta $a0a4,x
    iny
    inx

loc_049bee:
    lda $a0a4,y
    sta $a0a4,x
    lda $a0a5,y
    sta $a0a5,x
    lda $a0a6,y
    sta $a0a6,x
    inx
    inx
    inx
    iny
    iny
    iny
    dec $1757
    bne loc_049bee
    stx $1759
    plx
    ldy $1cfa,x
    rep #$20
.a16
    tya
    jsl sub_0afb52
    sep #$20
.a8
    rep #$20
.a16
    lda $175d
    sta $1cfa,x
    sep #$20
.a8
    rep #$20
.a16
    jsr sub_04a35f
    ldy $1759
    sta $a0a4,y
    sep #$20
.a8
    jsr sub_04a377
    sta $a0a6,y
    jmp loc_0483af
    ldy $1cfa,x
    bne loc_049c44
    jml loc_0483c4

loc_049c44:
    lda $a0a4,y
    cmp #$01
    bne loc_049c5e
    rep #$20
.a16
    tya
    jsl sub_0afb52
    sep #$20
.a8
    stz $1cfa,x
    stz $1cfb,x
    jml loc_0483c4

loc_049c5e:
    sta $1757
    stz $1758
    rep #$20
.a16
    jsr sub_04a35f
    iny

loc_049c6a:
    cmp $a0a4,y
    beq loc_049c7a
    iny
    iny
    iny
    dec $1757
    bne loc_049c6a
    jmp loc_0483c4

loc_049c7a:
    sty $1759
    ldy $1cfa,x
    lda $a0a4,y
    and #$00ff
    dec a
    sep #$20
.a8
    sta $a0a4,y
    rep #$20
.a16
    sta $1757
    asl a
    clc
    adc $1757
    clc
    adc $1cfa,x
    inc a
    sta $175f
    ldy $1759
    sep #$20
.a8
    bra loc_049cac

loc_049ca5:
    lda $a0a7,y
    sta $a0a4,y
    iny

loc_049cac:
    cpy $175f
    bne loc_049ca5
    jml loc_0483c4
    ldy $f0b0
    bne loc_049cbe
    jml loc_0483c4

loc_049cbe:
    rep #$20
.a16
    jsr sub_04a35f
    sta $f0b0
    jmp loc_0483c4
.a8
    jsr sub_04a35f
    sta $1757
    jsr sub_04a36b
    sta $1759
    lda $1d,x
    ora #$20
    sta $1d,x
    lda $1757
    sta $1cdf,x
    lda $1759
    sta $1cf4,x
    jmp loc_0483c4

loc_049cea:
    rep #$20
.a16
    jsr sub_04a35f
    sta $16,x
    sep #$20
.a8
    jsr sub_04a377
    sta $18,x
    lda #$00
    sta $1cdc,x
    rep #$20
.a16
    lda #$0000
    sta $28,x
    sep #$20
.a8
    jmp loc_04a1af
    stx $1757
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $1757
    tay
    sep #$20
.a8
    lda $0000,y
    eor #$ff
    inc a
    sta $0000,y
    jmp loc_0483c4
    stx $1757
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $1757
    tay
    lda $0000,y
    eor #$ffff
    inc a
    sta $0000,y
    jmp loc_0483c4
.a8
    jsr sub_04a377
    sta $175b
    stx $1757
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $1757
    tay
    sep #$20
.a8
    jsl sub_02fc58
    and $175b
    sta $0000,y
    jmp loc_0483af
    rep #$20
.a16
    jsr sub_04a377
    sta $175b
    stx $1757
    jsr sub_04a35f
    clc
    adc $1757
    tay
    sep #$20
.a8
    jsl sub_02fc58
    xba
    jsl sub_02fc58
    rep #$20
.a16
    and $175b
    sta $0000,y
    jmp loc_04839a

loc_049d89:
    jsr sub_04a377
    sta $1757
    lda $35,x
    and $1757
    bne loc_049d9a
    jml loc_0483af

loc_049d9a:
    lda $1757
    eor #$35ff
    and $95,x
    and $4c,x
    .db $f9,$83
.a8
    lda $1e,x
    and #$fe
    sta $1e,x
    jmp loc_0483ee
    lda $1e,x
    ora #$01
    sta $1e,x
    jmp loc_0483ee
    phx
    phb
    php
    lda #$04
    pha
    pea $9dd3
    lda #$04
    pha
    rep #$20
.a16
    lda $28,x
    clc
    adc #$a413
    pha
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rtl
.a16
    plp
.a8
    plb
    plx
    rep #$20
.a16
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f
    lda #$01
    sta $f0b2
    jmp loc_0483ee
    .db $c2,$20,$a9,$a1,$ac,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$0f,$9e,$04,$c2,$20,$a9,$e6,$f7,$99,$16,$00,$e2,$20,$a9,$06
    .db $99,$18,$00,$22,$d9,$da,$1f,$4c,$ee,$83,$b5,$1d,$09,$08,$95,$1d
    .db $4c,$ee,$83
    lda $1d,x
    and #$f7
    sta $1d,x
    jmp loc_0483ee
    jsr sub_04a35f
    jsl sub_03b7f9
    jmp loc_0483d9
    jsr sub_04a35f
    sta $1757
    lda $1757
    sta $7e1ce9,x
    jmp loc_0483d9
    stx $1757
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $1757
    tay
    sep #$20
.a8
    lda $0000,y
    bpl loc_049e53
    inc a

loc_049e53:
    cmp #$80
    ror a
    sta $0000,y
    jmp loc_0483c4

loc_049e5c:
    stx $1757
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $1757
    tay
    lda $0000,y
    bpl loc_049e53
    inc a
    cmp #$8000
    ror a
    sta $0000,y
    jmp loc_0483c4
.a8
    jsr sub_049ea2
.a16
    lda $175d
    clc
    adc $5d
    sta $5d
    sep #$20
.a8
    lda [$5d]
    sta $0000,y
    jmp loc_04835b

loc_049e8e:
    jsr sub_049ea2
    lda $175d
    asl a
    clc
    adc $5d
    sta $5d
    lda [$5d]
    sta $0000,y
    jmp loc_04835b

sub_049ea2:
    jsr sub_04a377
    sta $5f
    rep #$20
.a16
    jsr sub_04a35f
    sta $5d
    stx $1757
    jsr sub_04a383
    clc
    adc $1757
    tay
    lda $0000,y
    and #$00ff
    sta $175d
    jsr sub_04a39b
    clc
    adc $1757
    tay
    rts
.a8
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    sep #$20
    lda $0000,y
    sta $f0ac
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    sep #$20
    rep #$20
.a16
    lda $0000,y
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    sep #$20
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    sep #$20
.a8
    lda $f0ac
    sta $0000,y
    jmp loc_0483d9
    stx $1757
    jsr sub_04a35f
    jsr sub_04a098
    sep #$20
    rep #$20
.a16
    lda $1cf8,x
    jsl sub_0afc46
    sta $1cf8,x
    lda $f0ac
    sta $0000,y
    sep #$20
.a8
    jmp loc_0483d9
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    lda #$00c8
    jsl sub_0980a7
.a8
    bcs loc_049f68
    jml loc_04839a

loc_049f68:
    rep #$20
.a16
    jsl sub_1fd115
.a8
    rep #$20
.a16
    lda $158f
    cmp #$0000
    bmi loc_049f7d
    cmp $1757
    bmi loc_049f83

loc_049f7d:
    sep #$20
.a8
    jml loc_04839a

loc_049f83:
.a16
    sep #$20
.a8
    jmp loc_048411

loc_049f88:
    rep #$20
.a16
    jsr sub_04a35f
    sta $1757
    sep #$20
.a8
    ldy $06,x
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_049fa2
    eor #$ffff
    inc a

loc_049fa2:
    cmp #$00c8
    sep #$20
.a8
    bmi loc_049fad
    jml loc_04839a

loc_049fad:
    rep #$20
.a16
    jsl sub_1fd115
    rep #$20
    lda $158f
    cmp #$0000
    bmi loc_049fc2
    cmp $1757
    bmi loc_049fc8

loc_049fc2:
    sep #$20
.a8
    jml loc_04839a

loc_049fc8:
.a16
    sep #$20
.a8
    jmp loc_048411

loc_049fcd:
    stx $f0d4
    rep #$20
.a16
    lda $28,x
    pha
    sep #$20
.a8
    ldy $06,x
    rep #$20
.a16
    lda $0028,y
    sta $f0d6
    sep #$20
.a8
    tyx
    rep #$20
.a16
    pla
    sta $28,x
    sep #$20
.a8
    jmp loc_0483ee

loc_049fee:
    stx $f0d4
    rep #$20
.a16
    lda $28,x
    pha
    sep #$20
.a8
    ldy $06,x
    rep #$20
.a16
    lda $0028,y
    sta $f0d6
    sep #$20
.a8
    tyx
    rep #$20
.a16
    pla
    sta $28,x
    sep #$20
.a8
    jmp loc_0483ee
    .db $20,$5f,$a3,$8d,$57,$17,$8e,$d4,$f0,$c2,$20,$b5,$28,$48,$e2,$20
    .db $b5,$20,$29,$40,$f0,$04,$5c,$2c,$a0,$04,$b4,$06,$bb,$ad,$57,$17
    .db $22,$40,$dc,$1f,$c2,$20,$b9,$28,$00,$8d,$d6,$f0,$e2,$20,$bb,$c2
    .db $20,$68,$95,$28,$e2,$20,$4c,$d9,$83
    rep #$20
.a16
    lda $28,x
    pha
    sep #$20
.a8
    rep #$20
.a16
    lda $f0d6
    sta $28,x
    sep #$20
.a8
    ldx $f0d4
    rep #$20
.a16
    pla
    sta $28,x
    sep #$20
.a8
    jmp loc_0483ee
    stx $f0d4
    rep #$20
.a16
    lda $28,x
    pha
    sep #$20
.a8
    ldy $f0d8
    rep #$20
.a16
    lda $0028,y
    sta $f0d6
    sep #$20
.a8
    tyx
    rep #$20
.a16
    pla
    sta $28,x
    sep #$20
.a8
    jmp loc_0483ee

loc_04a087:
    rep #$20
.a16
    jsr sub_04a35f
    clc
    adc $7ea05e
    sta $7ea05e
    jmp loc_0483c4

sub_04a098:
.a8
    php
    rep #$20
.a16
    and #$00ff
    bit #$0080
    beq loc_04a0a7
    clc
    adc #$1c4a

loc_04a0a7:
    clc
    adc $1757
    tay
    plp
.a8
    rts

sub_04a0ae:
    lda $f0b0
    ora $f0b0
    beq loc_04a0ba
    jml loc_1fbdee

loc_04a0ba:
    ldy $28,x
    sty $f0b0
    ldy $1cfa,x
    bne loc_04a0c8
    jml loc_04a1a8

loc_04a0c8:
    lda $a0a4,y
    bne loc_04a0d1
    jml loc_04a1a8

loc_04a0d1:
    iny

loc_04a0d2:
    pha
    phy
    phx
    lda $a0a6,y
    rep #$20
.a16
    and #$00ff
    asl a
    tax
    sep #$20
.a8
    jmp (tbl_04a0e4,x)

tbl_04a0e4:
    .db $70,$a1,$4d,$a1,$51,$a1,$55,$a1,$59,$a1,$5d,$a1,$61,$a1,$65,$a1
    .db $3f,$a1,$31,$a1,$1d,$a1,$0b,$a1,$fe,$a0

loc_04a0fe:
    plx
    phx
    lda $2a,x
    bne loc_04a108
    jml loc_04a170

loc_04a108:
    brl loc_04a194

loc_04a10b:
    plx
    phx
    rep #$20
.a16
    lda $06,x
    sep #$20
.a8
    beq loc_04a119
    jml loc_04a194

loc_04a119:
    jml loc_04a170

loc_04a11d:
    plx
    phx
    lda $20,x
    and #$20
    bne loc_04a129
    jml loc_04a194

loc_04a129:
    lda $20,x
    and #$df
    sta $20,x
    bra loc_04a170

loc_04a131:
    plx
    phx
    lda $1f,x
    and #$01
    bne loc_04a13d
    jml loc_04a194

loc_04a13d:
    bra loc_04a170

loc_04a13f:
    plx
    phx
    lda $1f,x
    and #$04
    bne loc_04a14b
    jml loc_04a194

loc_04a14b:
    bra loc_04a170

loc_04a14d:
    lda #$01
    bra loc_04a169

loc_04a151:
    lda #$03
    bra loc_04a169

loc_04a155:
    lda #$07
    bra loc_04a169

loc_04a159:
    lda #$0f
    bra loc_04a169

loc_04a15d:
    lda #$1f
    bra loc_04a169

loc_04a161:
    lda #$3f
    bra loc_04a169

loc_04a165:
    lda #$7f
    bra loc_04a169

loc_04a169:
    and $15bb
    beq loc_04a170
    bra loc_04a194

loc_04a170:
    plx
    phx
    rep #$20
.a16
    lda #$ffff
    rep #$20
    sta $f0ac
    lda $1cf8,x
    jsl sub_0afbe9
    sta $1cf8,x
    sep #$20
.a8
    rep #$20
.a16
    lda $a0a4,y
    sta $28,x
    sep #$20
.a8
    jmp loc_04805f

loc_04a194:
    plx
    ply
    iny
    iny
    iny
    sep #$20
    pla
    dec a
    beq loc_04a1a3
    jml loc_04a0d2

loc_04a1a3:
    ldy $f0b0
    sty $28,x

loc_04a1a8:
    stz $f0b0
    stz $f0b1
    rts

loc_04a1af:
    lda $0b,x
    bne loc_04a1b7
    jml loc_04a1e6

loc_04a1b7:
    lda $15,x
    cmp $0a,x
    bmi loc_04a1c8
    sec
    sbc $0b,x
    cmp $0a,x
    bpl loc_04a1d7
    lda $0a,x
    bra loc_04a1d1

loc_04a1c8:
    clc
    adc $0b,x
    cmp $0a,x
    bmi loc_04a1d7
    lda $0a,x

loc_04a1d1:
    sta $15,x
    stz $0b,x
    bra loc_04a1d9

loc_04a1d7:
    sta $15,x

loc_04a1d9:
    lda $1e,x
    and #$20
    beq loc_04a1e3
    jml loc_04a1e6

loc_04a1e3:
    jsr sub_0484c3

loc_04a1e6:
    lda $1e,x
    and #$80
    bne loc_04a1f0
    jml loc_04a205

loc_04a1f0:
    lda $14,x
    cmp #$80
    ror a
    bpl loc_04a1f9
    adc #$00

loc_04a1f9:
    cmp #$80
    ror a
    bpl loc_04a200
    adc #$00

loc_04a200:
    clc
    adc $13,x
    sta $13,x

loc_04a205:
    lda $1e,x
    and #$40
    bne loc_04a20f
    jml loc_04a220

loc_04a20f:
    lda $12,x
    sta $15,x
    lda $1e,x
    and #$20
    beq loc_04a21d
    jml loc_04a220

loc_04a21d:
    jsr sub_0484c3

loc_04a220:
    lda $1e,x
    and #$10
    bne loc_04a22a
    jml loc_04a22e

loc_04a22a:
    jsl sub_1fdc69

loc_04a22e:
    lda $1e,x
    and #$20
    bne loc_04a238
    jml loc_04a23b

loc_04a238:
    jsr sub_0484c3

loc_04a23b:
    jsl sub_1fc7bb
    lda $1f,x
    and #$02
    bne loc_04a249
    jml loc_04a25c

loc_04a249:
    lda $15bb
    clc
    adc $123a
    and #$03
    beq loc_04a258
    jml loc_04a25c

loc_04a258:
    jsl sub_068ea8

loc_04a25c:
    lda $1d,x
    and #$40
    bne loc_04a266
    jml loc_04a2c0

loc_04a266:
    lda $1cf5,x
    bne loc_04a26f
    jml loc_04a2c0

loc_04a26f:
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_04a283
    jml loc_04a2c0

loc_04a283:
    jsl sub_1fdb01
    jsl sub_1fdad9
    rep #$20
.a16
    lda $1cea,x
    sta $1cea,y
    sep #$20
.a8
    lda $1cf4,x
    sta $1cf4,y
    lda $1cf5,x
    sta $1cdf,y
    lda $001d,y
    ora #$40
    sta $001d,y
    lda $001e,y
    ora #$01
    sta $001e,y
    rep #$20
.a16
    lda #$a306
    sta $0016,y
    sep #$20
.a8
    lda #$04
    sta $0018,y

loc_04a2c0:
    jsr sub_04a0ae
    lda $20,x
    and #$40
    bne loc_04a2cd
    jml loc_04a2d1

loc_04a2cd:
    jsl sub_09dbcf

loc_04a2d1:
    lda $1f,x
    and #$fb
    sta $1f,x
    lda $1f,x
    and #$fe
    sta $1f,x
    rtl
    lda $1f,x
    ora #$04
    sta $1f,x
    ldy $1b,x
    lda $002e,y
    and #$80
    bne loc_04a2f1
    jml loc_04a302

loc_04a2f1:
    lda $002e,y
    and #$08
    bne loc_04a2fc
    jml loc_04a302

loc_04a2fc:
    lda $1f,x
    ora #$01
    sta $1f,x

loc_04a302:
    jml loc_0689a3
    lda #$0a
    sta $2a,x
    lda #$08
    sta $2b,x
    rep #$20
.a16
    lda #$a31f
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    lda #$05
    sta $22,x
    lda $22,x
    and #$01
    bne loc_04a349
    lda $1cdf,x
    cmp #$01
    bne loc_04a330
    jml loc_04a349

loc_04a330:
    lda $1cdf,x
    cmp #$05
    bne loc_04a33b
    jml loc_04a349

loc_04a33b:
    lda $1cdf,x
    cmp #$09
    bne loc_04a346
    jml loc_04a349

loc_04a346:
    dec $1cdf,x

loc_04a349:
    jsl sub_1fdc69
    lda $22,x
    bne loc_04a355
    jml loc_04a358

loc_04a355:
    dec $22,x

loc_04a357:
    rtl

loc_04a358:
    jsl sub_1fd501
    jmp loc_04a357

sub_04a35f:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a414,x
    ply
    plx
    rts

sub_04a36b:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a415,x
    ply
    plx
    rts

sub_04a377:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a416,x
    ply
    plx
    rts

sub_04a383:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a417,x
    ply
    plx
    rts

sub_04a38f:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a418,x
    ply
    plx
    rts

sub_04a39b:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a419,x
    ply
    plx
    rts

sub_04a3a7:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41a,x
    ply
    plx
    rts

sub_04a3b3:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41b,x
    ply
    plx
    rts

sub_04a3bf:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41c,x
    ply
    plx
    rts

sub_04a3cb:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41d,x
    ply
    plx
    rts

sub_04a3d7:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41e,x
    ply
    plx
    rts

sub_04a3e3:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a41f,x
    ply
    plx
    rts

sub_04a3ef:
    phx
    phy
    ldy $28,x
    tyx
    lda $04a420,x
    ply
    plx
    rts
    .incbin "data/0223fb-025f06.bin"
    rep #$20
.a16
    lda #$faa0
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    rep #$20
.a16
    lda #$3b0a
    rtl
    .db $3f,$78,$bd,$1e,$3b,$00,$00,$00,$0a,$0a,$00,$ce,$01,$5c,$1c,$3b
    .db $0c,$0f,$4d,$54,$3b,$50,$25,$3b,$20,$1f,$3b,$02,$07,$98,$b2,$a5
    .db $07,$b2,$04,$68,$0e,$b2,$3a,$0e,$b4,$fb,$e7,$ff,$29,$3b,$11,$e7
    .db $ff,$0e,$75,$49,$77,$d5,$ad,$58,$3b,$0a,$0a,$77,$d5,$ad,$54,$3b
    .db $0a,$0a,$77,$d5,$ad,$56,$3b,$0a,$0a,$0f,$a1,$d8,$a1,$14,$5f,$00
    .db $00,$a3,$f6,$70
.a8
    lda #$00
    ora #$80
    sta $1ce6,x
    rep #$20
.a16
    lda #$3b6b
    rtl
    .db $89,$08,$70
.a8
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_04df8c
    clc
    adc #$0f

loc_04df8c:
    and #$7f
    cmp #$0f
    bcc loc_04df95
    sec
    sbc #$0f

loc_04df95:
    ora #$80
    sta $1ce6,x
    rep #$20
.a16
    lda #$3b8d
    rtl
    .incbin "data/025fa0-0268d9.bin"
.a8
    lda $1f,x
    ora #$40
    sta $1f,x
    rep #$20
.a16
    lda #$44d2
    rtl
    .db $6b,$fc,$1c,$7f,$07,$b2,$c0,$68,$0c,$b2,$6c,$fe,$1c,$ff,$01,$6a
    .db $fe,$1c,$67,$0e,$b4,$a3,$ec,$18,$0f,$00,$51,$da,$c8,$04,$50,$08
    .db $10,$d0,$07,$99,$0e,$99,$0c,$0f,$00,$5c,$5a,$45,$00,$52,$07,$70
.a8
    rep #$20
.a16
    lda $0c,x
    cmp #$8000
    ror a
    bpl loc_04e922
    adc #$0000

loc_04e922:
    cmp #$fe70
    bpl loc_04e92a
    lda #$fe70

loc_04e92a:
    cmp #$0190
    bmi loc_04e932
    lda #$0190

loc_04e932:
    eor #$ffff
    inc a
    beq loc_04e93f
    clc
    adc $0c,x
    sta $0c,x
    bne loc_04e945

loc_04e93f:
    stz $0c,x
    lda #$453b
    rtl

loc_04e945:
    rep #$20
    lda #$4538
    rtl
    .db $20,$01,$45,$52,$00,$02,$14,$5c,$46,$45,$00,$20,$43,$45,$9d,$95
    .db $71,$38,$95,$09,$00,$c1,$45,$5e,$c0,$45,$12,$2d,$b4,$2a,$59,$45
    .db $54,$54,$70
.a8
    rep #$20
.a16
    lda $c5
    clc
    adc #$0fa0
    sta $10,x
    rep #$20
    lda #$456b
    rtl
    .db $54,$00,$5a,$02,$87,$70,$e2,$20,$ad,$d0,$14,$29,$df,$8d,$d0,$14
    .db $c2,$20,$ad,$c5,$18,$c9,$80,$da,$f0,$09,$38,$e9,$80,$00,$8d,$c5
    .db $18,$d0,$04,$a9,$c0,$45,$6b,$c2,$20,$a9,$98,$45,$6b,$20,$70,$45
    .db $5c,$ab,$45,$0c,$5c,$bd,$45,$0c,$11,$7f,$85,$a0,$5f,$00,$00,$0f
    .db $36,$b5,$45,$77,$4c,$c8,$b6,$45,$0a,$02,$54,$60,$fc,$ee,$0a,$72
    .db $18,$0f,$72,$54,$18,$15,$54,$00,$52,$07,$89,$27,$a2,$ce,$08,$10
    .db $c8,$00,$56,$03,$05,$78,$9e,$04,$37,$12,$88,$db,$45,$20,$d1,$45
    .db $0f,$00,$52,$07,$08,$0c,$70,$fe,$38,$0c,$00,$00,$ec,$45,$20,$df
    .db $45,$52,$00,$02,$64,$52,$07,$08,$10,$38,$ff,$20,$f2,$45,$0f,$00
    .db $03,$51,$da,$c8,$04,$30,$52,$03,$05,$88,$53,$6a,$46,$06,$05,$08
    .db $46,$05,$00,$52,$00,$02,$3c,$52,$03,$08,$0c,$d4,$fe,$06,$05,$14
    .db $46,$15,$0f,$00,$03,$51,$e3,$c8,$08,$10,$52,$0b,$05,$88,$53,$6a
    .db $46,$06,$05,$2c,$46,$05,$00,$52,$00,$02,$1b,$52,$0b,$08,$0c,$2c
    .db $01,$06,$05,$38,$46,$15,$0f,$00,$03,$52,$07,$2c,$53,$46,$89,$0b
    .db $08,$0c,$6a,$ff,$56,$21,$5a,$46,$89,$0b,$08,$0c,$96,$00,$56,$52
    .db $00,$02,$3c,$10,$1a,$12,$05,$88,$52,$07,$9e,$fd,$20,$65,$46,$03
    .db $2f,$7c,$46,$10,$c0,$12,$9e,$04,$37,$12,$00,$7b,$46,$20,$71,$46
    .db $54,$10,$40,$12,$9e,$fc,$37,$12,$00,$7b,$46,$20,$7f,$46,$00,$03
    .db $10,$80,$13,$36,$ad,$46,$02,$32,$05,$1e,$10,$10,$12,$02,$0a,$a0
    .db $10,$9e,$06,$06,$0a,$9a,$46,$a0,$10,$9e,$fc,$06,$06,$a2,$46,$20
    .db $c6,$46,$02,$32,$05,$1e,$10,$f0,$12,$02,$0a,$a0,$10,$9e,$fa,$06
    .db $0a,$b6,$46,$a0,$10,$9e,$04,$06,$06,$be,$46,$22,$28,$05,$a0,$20
    .db $1e,$64,$00,$d4,$46,$09,$20,$c9,$46,$a5,$a0,$20,$06,$14,$d5,$46
    .db $0f,$00,$03,$10,$80,$13,$36,$00,$47,$02,$32,$05,$1e,$10,$50,$13
    .db $02,$0a,$a0,$10,$9f,$06,$06,$0a,$ed,$46,$a0,$10,$9f,$fc,$06,$06
    .db $f5,$46,$20,$19,$47,$02,$32,$05,$1e,$10,$b0,$13,$02,$0a,$a0,$10
    .db $9f,$fa,$06,$0a,$09,$47,$a0,$10,$9f,$04,$06,$06,$11,$47,$22,$28
    .db $05,$a0,$20,$1e,$64,$00,$27,$47,$09,$20,$1c,$47,$a5,$a0,$20,$06
    .db $14,$28,$47,$0f,$70
.a8
    jsl sub_06916d
    rep #$20
.a16
    lda #$473a
    rtl
    .db $5c,$3f,$47,$00,$54,$70
.a8
    jsl sub_0691df
    rep #$20
.a16
    lda #$474a
    rtl
    .incbin "data/026b5d-027687.bin"
.a8
    rep #$20
.a16
    lda #$f6aa
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    jsl sub_1fd41a
    lda #$02
    sta $2a,x
    lda #$04
    sta $2b,x
    lda #$f1
    sta $22,x
    lda $1d,x
    ora #$08
    sta $1d,x
    jsl sub_1fdc69
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$000a
    sta $0e,x
    sep #$20
.a8
    lda $14,x
    cmp #$80
    bcc loc_04f6c4
    jml loc_04f6d7

loc_04f6c4:
    lda $22,x
    cmp #$f1
    bne loc_04f6ce
    jml loc_04f6e8

loc_04f6ce:
    lda $22,x
    sec
    sbc #$05
    sta $22,x
    bra loc_04f6e8

loc_04f6d7:
    lda $22,x
    cmp #$0f
    bne loc_04f6e1
    jml loc_04f6e8

loc_04f6e1:
    lda $22,x
    clc
    adc #$05
    sta $22,x

loc_04f6e8:
    lda $22,x
    sta $152c
    lda $14,x
    clc
    adc $152c
    sta $14,x
    rep #$20
.a16
    lda $0e,x
    cmp #$0000
    sep #$20
.a8
    bmi loc_04f704
    jml loc_04f705

loc_04f704:
    rtl

loc_04f705:
    rep #$20
.a16
    lda #$f733
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    rep #$20
.a16
    lda #$0000
    sta $0e,x
    sep #$20
.a8
    lda #$00
    sta $14,x
    rep #$20
.a16
    lda #$b4a2
    sta $04,x
    sep #$20
.a8
    lda #$0a
    sta $15,x
    lda $1e,x
    and #$fb
    sta $1e,x
    rtl
    lda $1e,x
    and #$04
    bne loc_04f73d
    jml loc_04f788

loc_04f73d:
    stz $1532
    lda $13,x
    sta $3a
    lda $24,x
    jsl sub_1fd85e
    sta $13,x
    bcc loc_04f752
    jml loc_04f756

loc_04f752:
    jml loc_04f759

loc_04f756:
    inc $1532

loc_04f759:
    lda $12,x
    sta $3a
    lda $25,x
    jsl sub_1fd85e
    sta $12,x
    bcc loc_04f76b
    jml loc_04f76f

loc_04f76b:
    jml loc_04f772

loc_04f76f:
    inc $1532

loc_04f772:
    lda $1532
    cmp #$02
    bne loc_04f77d
    jml loc_04f7c9

loc_04f77d:
    lda $15bb
    and #$00
    beq loc_04f788
    jml loc_04f7b3

loc_04f788:
    lda $1e,x
    ora #$04
    sta $1e,x
    phy
    ldy $1238
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $25,x
    beq loc_04f7a0

loc_04f7a0:
    sta $25,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $24,x
    beq loc_04f7b0

loc_04f7b0:
    sta $24,x
    ply

loc_04f7b3:
    lda $15,x
    sta $7e
    lda $13,x
    jsl sub_1fc177
    rep #$20
.a16
    lda $02
    sta $2f,x
    lda $90
    sta $33,x
    sep #$20

loc_04f7c9:
.a8
    jsl sub_1fc7bb
    ldy $1238
    rep #$20
.a16
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp #$0190
    sep #$20
.a8
    bpl loc_04f7e6
    jml loc_04f844

loc_04f7e6:
    lda $15bb
    clc
    adc $123a
    and #$0f
    beq loc_04f7f5
    jml loc_04f7fe

loc_04f7f5:
    rep #$20
.a16
    lda #$fff1
    sta $31,x
    sep #$20

loc_04f7fe:
.a8
    jsl sub_1fc7bb
    rep #$20
.a16
    lda $31,x
    clc
    adc #$0003
    sta $31,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    cmp #$0000
    sep #$20
.a8
    bpl loc_04f81d
    jml loc_04f843

loc_04f81d:
    rep #$20
.a16
    lda #$0000
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $31,x
    eor #$ffff
    inc a
    cmp #$8000
    ror a
    bpl loc_04f837
    adc #$0000

loc_04f837:
    cmp #$fffb
    bcc loc_04f83f
    lda #$0000

loc_04f83f:
    sta $31,x
    sep #$20

loc_04f843:
.a8
    rtl

loc_04f844:
    rep #$20
.a16
    lda #$f851
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda $150f
    jsl sub_1fd66f
    sta $0e,x
    sep #$20
.a8
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_04f873
    eor #$ffff
    inc a

loc_04f873:
    cmp #$00c8
    sep #$20
.a8
    bmi loc_04f87e
    jml loc_04f88f

loc_04f87e:
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda $150d
    jsl sub_1fd6ab
    sta $0c,x
    sep #$20

loc_04f88f:
.a8
    rtl

loc_04f890:
    rep #$20
.a16
    lda #$f8be
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    jsl sub_1fd450
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$80
    sta $13,x
    lda #$00
    sta $176d
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$0bb8
    jsl sub_0980a7
    bcc loc_04f8fa
    lda $14d6
    ora #$8d60
    dec $14,x
    ldy $1238
    rep #$20
    lda $000c,y
    sta $3a
    lda #$0000
    jsl sub_1fd6f0
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    sta $3a
    lda $1589
    jsl sub_1fd6f0
    sta $000e,y
    sep #$20

loc_04f8fa:
.a8
    rep #$20
.a16
    lda #$3500
    jsl sub_0980a7
    bcs loc_04f90f
    rep #$20
    lda #$cb40
    sta $04,x
    sep #$20
.a8
    rtl

loc_04f90f:
.a16
    rep #$20
    lda #$cb24
    sta $04,x
    sep #$20
.a8
    rtl
    .incbin "data/027919-028000.bin"
