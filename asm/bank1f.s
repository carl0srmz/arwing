.rombank $1f

    .incbin "data/0f8000-0fbdb0.bin"

sub_1fbdb0:
.cpu
.a8
.i8
    rtl

loc_1fbdb1:
    sei
    clc
    xce
    rep #$30
.a16
.i16
    lda #$0000
    tcd
    ldx #$02ff
    txs
    sep #$30
.a8
.i8
    pha
    plb
    sep #$30
    jsl sub_1fbed4
    jsr sub_1fbe41
    rep #$10
.i16
    ldx #$02ff
    txs
    sep #$30
.i8
    jsl sub_02e266
    jsl sub_1ff51c
.i16
    jsl sub_1ff45d
    sep #$20
    lda #$00
    sta $7ea05a
    lda #$00
    sta $1fdf
    bra loc_1fbe35

loc_1fbdee:
    rep #$30
.a16
    clc
    xce
    lda #$0000
    tcd
    ldx #$02ff
    txs
    sep #$30
.a8
.i8
    sei
    jsl sub_1fbed4
    lda $0016d8
    pha
    lda $1fdf
    pha
    lda $7ea05a
    pha
    lda $1f0f
    pha
    jsr sub_1fbe41
    pla
    sta $1f0f
    pla
    sta $7ea05a
    pla
    sta $1fdf
    pla
    sta $0016d8
    lda #$01
    sta $1f65
    sta $7ef0b3
    jsl sub_02e266

loc_1fbe35:
    jsl sub_1ff963
    jsl sub_02e266
    jml loc_03bddf

sub_1fbe41:
    php
    sep #$20
    lda #$7e
    pha
    plb
    rep #$30
.a16
.i16
    ldx #$2000

loc_1fbe4d:
    stz $0000,x
    stz $0002,x
    stz $0004,x
    stz $0006,x
    txa
    clc
    adc #$0008
    tax
    bne loc_1fbe4d
    sep #$20
.a8
    lda #$7f
    pha
    plb
    rep #$20

loc_1fbe69:
.a16
    stz $0000,x
    stz $0002,x
    stz $0004,x
    stz $0006,x
    txa
    clc
    adc #$0008
    tax
    bne loc_1fbe69
    sep #$20
.a8
    lda #$70
    pha
    plb
    rep #$30
.a16
    ldx #$7ff8

loc_1fbe88:
    stz $0000,x
    stz $0002,x
    stz $0004,x
    stz $0006,x
    txa
    sec
    sbc #$0008
    tax
    bpl loc_1fbe88
    sep #$20
.a8
    lda #$00
    pha
    plb
    rep #$20
.a16
    ldx #$1cf8

loc_1fbea7:
    stz $0300,x
    stz $0302,x
    stz $0304,x
    stz $0306,x
    txa
    sec
    sbc #$0008
    tax
    bpl loc_1fbea7
    ldx #$00fe

loc_1fbebe:
    stz $00,x
    dex
    dex
    bpl loc_1fbebe
    jsl sub_1ffdfb
    sep #$20
.a8
    lda STAT78
    and #$10
    sta $16f6
    plp
.i8
    rts

sub_1fbed4:
    sei
    lda #$01
    sta $16db
    jsl sub_03bd8d
    sep #$30
    lda #$00
    sta $16db
    jsl sub_03bd8d
    sep #$30
    lda #$8f
    sta INIDISP
    lda #$00
    sta OBSEL
    sta OAMADDL
    sta OAMADDH
    sta BGMODE
    sta MOSAIC
    sta BG1SC
    sta BG2SC
    sta BG3SC
    sta BG4SC
    sta BG12NBA
    sta BG34NBA
    sta BG1HOFS
    sta BG1HOFS
    sta BG1VOFS
    sta BG1VOFS
    sta BG2HOFS
    sta BG2HOFS
    sta BG2VOFS
    sta BG2VOFS
    sta BG3HOFS
    sta BG3VOFS
    sta BG3VOFS
    sta BG4HOFS
    sta BG4HOFS
    sta BG4VOFS
    sta BG4VOFS
    ldx #$80
    stx VMAIN
    sta VMADDL
    sta VMADDH
    sta M7SEL
    ldx #$01
    sta M7A
    stx M7A
    sta M7B
    sta M7B
    sta M7C
    sta M7C
    sta M7D
    stx M7D
    sta M7X
    sta M7X
    sta M7Y
    sta M7Y
    sta CGADD
    sta CGDATA
    sta W12SEL
    sta W34SEL
    sta WOBJSEL
    sta WH0
    sta WH1
    sta WH2
    sta WH3
    sta WBGLOG
    sta WOBJLOG
    sta TM
    sta TS
    sta TMW
    ldy #$30
    sty CGWSEL
    sta CGADSUB
    ldx #$e0
    stx COLDATA
    sta SETINI
    sta NMITIMEN
    ldx #$ff
    stx WRIO
    sta WRMPYA
    sta WRMPYB
    sta WRDIVL
    sta WRDIVH
    sta WRDIVB
    sta HTIMEL
    sta HTIMEH
    sta VTIMEL
    sta VTIMEH
    sta MDMAEN
    sta HDMAEN
    sta MEMSEL
    rtl
    .db $6b

sub_1fbfdc:
.i16
    jsr sub_1fbfe0
    rtl

sub_1fbfe0:
    phx
    phy
    php
    jsl sub_1fdba4
    rep #$20
.a16
    phx
    txa
    ldx $121d

loc_1fbfee:
    cmp $19,x
    bne loc_1fbff4
    stz $19,x

loc_1fbff4:
    cmp $06,x
    bne loc_1fbffa
    stz $06,x

loc_1fbffa:
    cmp $1cdd,x
    bne loc_1fc002
    stz $1cdd,x

loc_1fc002:
    cmp $1b,x
    bne loc_1fc008
    stz $1b,x

loc_1fc008:
    ldy $00,x
    tyx
    bne loc_1fbfee
    plx
    jsl sub_0afb8e
    ldy $02,x
    bne loc_1fc023
    ldy $00,x
    sty $121d
    lda #$0000
    sta $0002,y
    bra loc_1fc031

loc_1fc023:
    phx
    lda $00,x
    tax
    stx $00,y
    cmp #$0000
    beq loc_1fc030
    sty $02,x

loc_1fc030:
    plx

loc_1fc031:
    lda $121f
    sta $00,x
    stx $121f
    plp
.a8
    ply
    plx
    rts

sub_1fc03d:
    php
    rep #$30
.a16
    stz $1efb
    ldx $121d
    beq loc_1fc09d
    ldy #$0000

loc_1fc04b:
    phx
    lda $2e,x
    and #$0004
    bne loc_1fc097
    lda $1e,x
    and #$0001
    bne loc_1fc097
    lda $2a,x
    and #$00ff
    beq loc_1fc097
    lda $08,x
    bit #$0001
    bne loc_1fc097
    phx
    lda $04,x
    tyx
    tay
    pla
    sta $7e2ec4,x
    lda $0008,y
    sta $7e2ec6,x
    lda $000a,y
    sta $7e2ec8,x
    lda $000c,y
    sta $7e2eca,x
    lda $000e,y
    sta $7e2ecc,x
    inc $1efb
    txa
    clc
    adc #$000a
    tay

loc_1fc097:
    plx
    lda $00,x
    tax
    bne loc_1fc04b

loc_1fc09d:
    plp
.a8
    rtl
    .db $b5,$15,$85,$7e,$8b,$86,$76,$84,$78,$64,$08,$64,$09,$b5,$13,$aa
    .db $e2,$10,$a9,$00,$48,$ab,$bd,$a5,$98,$85,$7a,$bd,$e5,$98,$85,$7b
    .db $a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7a,$30,$2f,$8d,$03,$42,$ea
    .db $ea,$ea,$ea,$ad,$17,$42,$4c,$08,$c1,$49,$ff,$1a,$0a,$8d,$02,$42
    .db $a5,$7a,$30,$07,$8d,$03,$42,$ea,$4c,$02,$c1,$49,$ff,$1a,$8d,$03
    .db $42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$08,$c1,$49,$ff,$1a,$8d,$03
    .db $42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$a2,$00,$85,$02,$c9,$00
    .db $10,$01,$ca,$86,$03,$a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7b,$30
    .db $2f,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$5d,$c1,$49,$ff
    .db $1a,$0a,$8d,$02,$42,$a5,$7b,$30,$07,$8d,$03,$42,$ea,$4c,$57,$c1
    .db $49,$ff,$1a,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$5d,$c1
    .db $49,$ff,$1a,$8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$a2
    .db $00,$85,$90,$c9,$00,$10,$01,$ca,$86,$91,$c2,$10,$a6,$76,$a4,$78
    .db $ab,$6b,$b5,$15,$85,$7e,$b5,$13

sub_1fc177:
    stx $76
    sty $78
    stz $08
    stz $09
    eor #$ff
    inc a
    tax
    sep #$10
.i8
    phb
    lda #$00
    pha
    plb
    inx
    iny
    lda $98a5,x
    sta $7a
    lda $98e5,x
    sta $7b
    lda $7e
    bmi loc_1fc1af
    asl a
    sta WRMPYA
    lda $7a
    bmi loc_1fc1d1
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc1df

loc_1fc1af:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $7a
    bmi loc_1fc1c1
    sta WRMPYB
    nop
    jmp loc_1fc1d9

loc_1fc1c1:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc1df

loc_1fc1d1:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc1d9:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc1df:
    tax
    ldx #$00
    sta $02
    cmp #$00
    bpl loc_1fc1e9
    dex

loc_1fc1e9:
    stx $03
    lda $7e
    bmi loc_1fc204
    asl a
    sta WRMPYA
    lda $7b
    bmi loc_1fc226
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc234

loc_1fc204:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $7b
    bmi loc_1fc216
    sta WRMPYB
    nop
    jmp loc_1fc22e

loc_1fc216:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc234

loc_1fc226:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc22e:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc234:
    tax
    ldx #$00
    sta $90
    cmp #$00
    bpl loc_1fc23e
    dex

loc_1fc23e:
    stx $91
    rep #$10
.i16
    ldx $76
    ldy $78
    plb
    rtl
    .db $b5,$15,$85,$7e,$64,$03,$64,$09,$64,$91,$86,$76,$84,$78,$b5,$13
    .db $a8,$b5,$12,$49,$ff,$1a,$aa,$e2,$10,$8b,$a9,$00,$48,$ab,$b9,$a5
    .db $98,$85,$7a,$b9,$e5,$98,$85,$7b,$bd,$a5,$98,$85,$82,$bd,$e5,$98
    .db $85,$83,$a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7a,$30,$2f,$8d,$03
    .db $42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$c3,$c2,$49,$ff,$1a,$0a,$8d
    .db $02,$42,$a5,$7a,$30,$07,$8d,$03,$42,$ea,$4c,$bd,$c2,$49,$ff,$1a
    .db $8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$c3,$c2,$49,$ff,$1a
    .db $8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$85,$02,$a5,$02
    .db $30,$15,$0a,$8d,$02,$42,$a5,$83,$30,$2f,$8d,$03,$42,$ea,$ea,$ea
    .db $ea,$ad,$17,$42,$4c,$0f,$c3,$49,$ff,$1a,$0a,$8d,$02,$42,$a5,$83
    .db $30,$07,$8d,$03,$42,$ea,$4c,$09,$c3,$49,$ff,$1a,$8d,$03,$42,$ea
    .db $ea,$ea,$ea,$ad,$17,$42,$4c,$0f,$c3,$49,$ff,$1a,$8d,$03,$42,$ea
    .db $ea,$a9,$00,$38,$ed,$17,$42,$aa,$85,$02,$c9,$00,$10,$02,$c6,$03
    .db $a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7b,$30,$2f,$8d,$03,$42,$ea
    .db $ea,$ea,$ea,$ad,$17,$42,$4c,$61,$c3,$49,$ff,$1a,$0a,$8d,$02,$42
    .db $a5,$7b,$30,$07,$8d,$03,$42,$ea,$4c,$5b,$c3,$49,$ff,$1a,$8d,$03
    .db $42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$61,$c3,$49,$ff,$1a,$8d,$03
    .db $42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$85,$90,$a5,$90,$30,$15
    .db $0a,$8d,$02,$42,$a5,$83,$30,$2f,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad
    .db $17,$42,$4c,$ad,$c3,$49,$ff,$1a,$0a,$8d,$02,$42,$a5,$83,$30,$07
    .db $8d,$03,$42,$ea,$4c,$a7,$c3,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$ea
    .db $ea,$ad,$17,$42,$4c,$ad,$c3,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$a9
    .db $00,$38,$ed,$17,$42,$aa,$85,$90,$c9,$00,$10,$02,$c6,$91,$a5,$7e
    .db $30,$15,$0a,$8d,$02,$42,$a5,$82,$30,$2f,$8d,$03,$42,$ea,$ea,$ea
    .db $ea,$ad,$17,$42,$4c,$ff,$c3,$49,$ff,$1a,$0a,$8d,$02,$42,$a5,$82
    .db $30,$07,$8d,$03,$42,$ea,$4c,$f9,$c3,$49,$ff,$1a,$8d,$03,$42,$ea
    .db $ea,$ea,$ea,$ad,$17,$42,$4c,$ff,$c3,$49,$ff,$1a,$8d,$03,$42,$ea
    .db $ea,$a9,$00,$38,$ed,$17,$42,$aa,$85,$08,$c9,$00,$10,$02,$c6,$09
    .db $c2,$10,$a6,$76,$a4,$78,$ab,$6b,$b5,$15,$85,$7e,$b5,$13,$8d,$a7
    .db $15,$b5,$12,$8d,$a6,$15

sub_1fc41e:
    stz $03
    stz $09
    stz $91
    stx $76
    sty $78
    phb
    lda #$00
    pha
    plb
    lda $15a7
    eor #$ff
    inc a
    tay
    lda $15a6
    tax
    sep #$10
.i8
    lda $98a5,y
    sta $7a
    lda $98e5,y
    sta $7b
    lda $98a5,x
    sta $82
    lda $98e5,x
    sta $83
    lda $7e
    bmi loc_1fc467
    asl a
    sta WRMPYA
    lda $7a
    bmi loc_1fc489
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc497

loc_1fc467:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $7a
    bmi loc_1fc479
    sta WRMPYB
    nop
    jmp loc_1fc491

loc_1fc479:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc497

loc_1fc489:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc491:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc497:
    tax
    sta $02
    lda $02
    bmi loc_1fc4b3
    asl a
    sta WRMPYA
    lda $83
    bmi loc_1fc4d5
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc4e3

loc_1fc4b3:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $83
    bmi loc_1fc4c5
    sta WRMPYB
    nop
    jmp loc_1fc4dd

loc_1fc4c5:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc4e3

loc_1fc4d5:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc4dd:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc4e3:
    tax
    sta $02
    cmp #$00
    bpl loc_1fc4ec
    dec $03

loc_1fc4ec:
    lda $7e
    bmi loc_1fc505
    asl a
    sta WRMPYA
    lda $7b
    bmi loc_1fc527
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc535

loc_1fc505:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $7b
    bmi loc_1fc517
    sta WRMPYB
    nop
    jmp loc_1fc52f

loc_1fc517:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc535

loc_1fc527:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc52f:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc535:
    tax
    sta $90
    lda $90
    bmi loc_1fc551
    asl a
    sta WRMPYA
    lda $83
    bmi loc_1fc573
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc581

loc_1fc551:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $83
    bmi loc_1fc563
    sta WRMPYB
    nop
    jmp loc_1fc57b

loc_1fc563:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc581

loc_1fc573:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc57b:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc581:
    tax
    sta $90
    cmp #$00
    bpl loc_1fc58a
    dec $91

loc_1fc58a:
    lda $7e
    bmi loc_1fc5a3
    asl a
    sta WRMPYA
    lda $82
    bmi loc_1fc5c5
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc5d3

loc_1fc5a3:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $82
    bmi loc_1fc5b5
    sta WRMPYB
    nop
    jmp loc_1fc5cd

loc_1fc5b5:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc5d3

loc_1fc5c5:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc5cd:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc5d3:
    tax
    sta $08
    cmp #$00
    bpl loc_1fc5dc
    dec $09

loc_1fc5dc:
    rep #$10
.i16
    ldx $76
    ldy $78
    plb
    rtl
    .db $85,$7e,$86,$76,$84,$78,$64,$08,$64,$09,$38,$a9,$40,$f5,$13,$aa
    .db $e2,$10,$8b,$a9,$00,$48,$ab,$e8,$bd,$a5,$98,$85,$7a,$bd,$e5,$98
    .db $85,$7b,$a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7a,$30,$2f,$8d,$03
    .db $42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$4f,$c6,$49,$ff,$1a,$0a,$8d
    .db $02,$42,$a5,$7a,$30,$07,$8d,$03,$42,$ea,$4c,$49,$c6,$49,$ff,$1a
    .db $8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$4f,$c6,$49,$ff,$1a
    .db $8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$a2,$00,$85,$02
    .db $c9,$00,$10,$01,$ca,$86,$03,$a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5
    .db $7b,$30,$2f,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$a4,$c6
    .db $49,$ff,$1a,$0a,$8d,$02,$42,$a5,$7b,$30,$07,$8d,$03,$42,$ea,$4c
    .db $9e,$c6,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c
    .db $a4,$c6,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17,$42
    .db $aa,$a2,$00,$85,$90,$c9,$00,$10,$01,$ca,$86,$91,$c2,$10,$a6,$76
    .db $a4,$78,$ab,$6b,$85,$7e,$86,$76,$84,$78,$64,$08,$64,$09,$b5,$13
    .db $aa,$e2,$10,$8b,$a9,$00,$48,$ab,$e8,$bd,$a5,$98,$85,$7a,$bd,$e5
    .db $98,$85,$7b,$a5,$7e,$30,$15,$0a,$8d,$02,$42,$a5,$7a,$30,$2f,$8d
    .db $03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$20,$c7,$49,$ff,$1a,$0a
    .db $8d,$02,$42,$a5,$7a,$30,$07,$8d,$03,$42,$ea,$4c,$1a,$c7,$49,$ff
    .db $1a,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$20,$c7,$49,$ff
    .db $1a,$8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17,$42,$aa,$a2,$00,$85
    .db $02,$c9,$00,$10,$01,$ca,$86,$03,$a5,$7e,$30,$15,$0a,$8d,$02,$42
    .db $a5,$7b,$30,$2f,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42,$4c,$75
    .db $c7,$49,$ff,$1a,$0a,$8d,$02,$42,$a5,$7b,$30,$07,$8d,$03,$42,$ea
    .db $4c,$6f,$c7,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$ea,$ea,$ad,$17,$42
    .db $4c,$75,$c7,$49,$ff,$1a,$8d,$03,$42,$ea,$ea,$a9,$00,$38,$ed,$17
    .db $42,$aa,$a2,$00,$85,$90,$c9,$00,$10,$01,$ca,$86,$91,$c2,$10,$a6
    .db $76,$a4,$78,$ab,$6b,$c2,$20,$06,$02,$06,$08,$06,$90,$06,$02,$06
    .db $08,$06,$90,$80,$0a,$c2,$20,$06,$02,$06,$08,$06,$90,$c2,$20,$b5
    .db $0c,$18,$65,$02,$95,$0c,$b5,$0e,$18,$65,$08,$95,$0e,$b5,$10,$18
    .db $65,$90,$95,$10,$e2,$20,$6b

sub_1fc7bb:
    rep #$20
.a16
    lda $0c,x
    clc
    adc $2f,x
    sta $0c,x
    lda $0e,x
    clc
    adc $31,x
    sta $0e,x
    lda $10,x
    clc
    adc $33,x
    sta $10,x
    sep #$20
.a8
    rtl

sub_1fc7d5:
.a16
    stx $3a
    ldx $14ca
    beq loc_1fc7f8
    cmp #$0000
    beq loc_1fc801
    txy

loc_1fc7e2:
    cmp $04,x
    beq loc_1fc7eb

loc_1fc7e6:
    ldy $00,x
    tyx
    bne loc_1fc7e2

loc_1fc7eb:
    cpx $3a
    beq loc_1fc7e6
    ldy $00,x
    sty $14ca
    txy
    ldx $3a
    rtl

loc_1fc7f8:
    ldy #$0000
    sty $14ca
    ldx $3a
    rtl

loc_1fc801:
    ldy $00,x
    beq loc_1fc7f8
    tyx
    cpx $3a
    beq loc_1fc801
    lda $1f,x
    and #$0008
    beq loc_1fc801
    stx $14ca
    ldx $3a
    rtl
    .db $c9,$00,$00,$f0,$30,$86,$3a,$ae,$ca,$14,$f0,$d5,$9b,$d5,$04,$f0
    .db $05,$b4,$00,$bb,$d0,$f7,$e4,$3a,$f0,$f7,$8d,$c5,$14,$e2,$20,$b5
    .db $1d,$25,$02,$c2,$20,$d0,$05,$ad,$c5,$14,$80,$e5,$b4,$00,$8c,$ca
    .db $14,$9b,$a6,$3a,$6b,$86,$3a,$ae,$ca,$14,$f0,$a5,$9b,$e2,$20,$e4
    .db $3a,$f0,$06,$b5,$1d,$25,$02,$d0,$05,$b4,$00,$bb,$d0,$f1,$b4,$00
    .db $8c,$ca,$14,$9b,$a6,$3a,$c2,$20,$6b

sub_1fc870:
    stx $04
    ldx $14ca
    bne loc_1fc87a
    brl loc_1fc8b3

loc_1fc87a:
    cmp #$0000
    beq loc_1fc8b9
    sta $0a
    stz $3c

loc_1fc883:
    cpx $04
    beq loc_1fc8a4
    lda $04,x
    cmp $0a
    bne loc_1fc8a4
    ldy $04
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp $3a
    bpl loc_1fc8a4
    cmp $3e
    bmi loc_1fc8a4
    sta $3a
    stx $3c

loc_1fc8a4:
    ldy $00,x
    tyx
    bne loc_1fc883
    ldy $00,x
    sty $14ca
    ldy $3c
    ldx $04
    rtl

loc_1fc8b3:
    ldy #$0000
    ldx $04
    rtl

loc_1fc8b9:
    stz $3c

loc_1fc8bb:
    cpx $04
    beq loc_1fc8dd
    lda $1f,x
    and #$0008
    beq loc_1fc8dd
    ldy $04
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp $3a
    bpl loc_1fc8dd
    cmp $3e
    bmi loc_1fc8dd
    sta $3a
    stx $3c

loc_1fc8dd:
    ldy $00,x
    tyx
    bne loc_1fc8bb
    sty $14ca
    ldy $3c
    ldx $04
    rtl

sub_1fc8ea:
    stx $04
    ldx $14ca
    beq loc_1fc8b3
    cmp #$0000
    beq loc_1fc925
    sta $0a
    stz $3c

loc_1fc8fa:
    cpx $04
    beq loc_1fc917
    lda $04,x
    cmp $0a
    bne loc_1fc917
    ldy $04
    jsl sub_1fd0ab
    rep #$20
    lda $1250
    cmp $3a
    bpl loc_1fc917
    cmp $3e
    bpl loc_1fc91c

loc_1fc917:
    ldy $00,x
    tyx
    bne loc_1fc8fa

loc_1fc91c:
    ldy $00,x
    sty $14ca
    txy
    ldx $04
    rtl

loc_1fc925:
    cpx $04
    beq loc_1fc943
    lda $1f,x
    and #$0008
    beq loc_1fc943
    ldy $04
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp $3a
    bpl loc_1fc943
    cmp $3e
    bpl loc_1fc948

loc_1fc943:
    ldy $00,x
    tyx
    bne loc_1fc925

loc_1fc948:
    ldy $00,x
    sty $14ca
    txy
    ldx $04
    rtl
    .db $08,$ac,$1d,$12,$bb,$d5,$04,$f0,$07,$b4,$00,$d0,$f7,$a2,$00,$00
    .db $28,$6b,$08,$ac,$1d,$12,$9c,$c5,$14,$bb,$d5,$04,$d0,$03,$ee,$c5
    .db $14,$b4,$00,$d0,$f4,$ad,$c5,$14,$28,$6b

sub_1fc97b:
.a8
    phy
    phx
    php
    phb
    sep #$10
.i8
    eor #$ff
    inc a
    tax
    lda #$00
    pha
    plb
    lda $98e5,x
    sta $15f4
    lda $98a5,x
    sta $15f3
    lda $02
    bmi loc_1fc9af
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fc9d2
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc9e0

loc_1fc9af:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fc9c2
    sta WRMPYB
    nop
    jmp loc_1fc9da

loc_1fc9c2:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fc9e0

loc_1fc9d2:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fc9da:
    lda #$00
    sec
    sbc RDMPYH

loc_1fc9e0:
    tax
    stx $04
    lda $90
    bmi loc_1fc9fd
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fca20
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fca2e

loc_1fc9fd:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fca10
    sta WRMPYB
    nop
    jmp loc_1fca28

loc_1fca10:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fca2e

loc_1fca20:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fca28:
    lda #$00
    sec
    sbc RDMPYH

loc_1fca2e:
    tax
    txa
    clc
    adc $04
    sta $04
    bit #$80
    beq loc_1fca3f
    lda #$ff
    sta $05
    bra loc_1fca41

loc_1fca3f:
    stz $05

loc_1fca41:
    lda $02
    bmi loc_1fca5b
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fca7e
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fca8c

loc_1fca5b:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fca6e
    sta WRMPYB
    nop
    jmp loc_1fca86

loc_1fca6e:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fca8c

loc_1fca7e:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fca86:
    lda #$00
    sec
    sbc RDMPYH

loc_1fca8c:
    tax
    txa
    eor #$ff
    inc a
    sta $15c2
    lda $90
    bmi loc_1fcaae
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcad1
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcadf

loc_1fcaae:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcac1
    sta WRMPYB
    nop
    jmp loc_1fcad9

loc_1fcac1:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcadf

loc_1fcad1:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcad9:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcadf:
    tax
    txa
    clc
    adc $15c2
    sta $15c2
    bit #$80
    beq loc_1fcaf3
    lda #$ff
    sta $15c3
    bra loc_1fcaf6

loc_1fcaf3:
    stz $15c3

loc_1fcaf6:
    plb
    plp
.i16
    plx
    ply
    rtl

sub_1fcafb:
    phx
    phy
    php
    phb
    sep #$10
.i8
    tax
    lda #$00
    pha
    plb
    lda $98e5,x
    sta $15f4
    lda $98a5,x
    sta $15f3
    lda $08
    bmi loc_1fcb2c
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcb4f
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcb5d

loc_1fcb2c:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcb3f
    sta WRMPYB
    nop
    jmp loc_1fcb57

loc_1fcb3f:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcb5d

loc_1fcb4f:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcb57:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcb5d:
    tax
    stx $0a
    lda $90
    bmi loc_1fcb7a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcb9d
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcbab

loc_1fcb7a:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcb8d
    sta WRMPYB
    nop
    jmp loc_1fcba5

loc_1fcb8d:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcbab

loc_1fcb9d:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcba5:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcbab:
    tax
    txa
    clc
    adc $0a
    sta $0a
    bit #$80
    beq loc_1fcbbc
    lda #$ff
    sta $0b
    bra loc_1fcbbe

loc_1fcbbc:
    stz $0b

loc_1fcbbe:
    lda $08
    bmi loc_1fcbd8
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcbfb
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcc09

loc_1fcbd8:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcbeb
    sta WRMPYB
    nop
    jmp loc_1fcc03

loc_1fcbeb:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcc09

loc_1fcbfb:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcc03:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcc09:
    tax
    txa
    eor #$ff
    inc a
    sta $15c2
    lda $90
    bmi loc_1fcc2b
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcc4e
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcc5c

loc_1fcc2b:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcc3e
    sta WRMPYB
    nop
    jmp loc_1fcc56

loc_1fcc3e:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcc5c

loc_1fcc4e:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcc56:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcc5c:
    tax
    txa
    clc
    adc $15c2
    sta $15c2
    bit #$80
    beq loc_1fcc70
    lda #$ff
    sta $15c3
    bra loc_1fcc73

loc_1fcc70:
    stz $15c3

loc_1fcc73:
    plb
    plp
.i16
    ply
    plx
    rtl

sub_1fcc78:
    phy
    phx
    php
    phb
    sep #$10
.i8
    tax
    lda #$00
    pha
    plb
    lda $98e5,x
    sta $15f4
    lda $98a5,x
    sta $15f3
    lda $02
    bmi loc_1fcca9
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcccc
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fccda

loc_1fcca9:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fccbc
    sta WRMPYB
    nop
    jmp loc_1fccd4

loc_1fccbc:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fccda

loc_1fcccc:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fccd4:
    lda #$00
    sec
    sbc RDMPYH

loc_1fccda:
    tax
    stx $04
    lda $08
    bmi loc_1fccf7
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcd1a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcd28

loc_1fccf7:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcd0a
    sta WRMPYB
    nop
    jmp loc_1fcd22

loc_1fcd0a:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcd28

loc_1fcd1a:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcd22:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcd28:
    tax
    txa
    clc
    adc $04
    sta $04
    bit #$80
    beq loc_1fcd39
    lda #$ff
    sta $05
    bra loc_1fcd3b

loc_1fcd39:
    stz $05

loc_1fcd3b:
    lda $02
    bmi loc_1fcd55
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcd78
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcd86

loc_1fcd55:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f3
    bmi loc_1fcd68
    sta WRMPYB
    nop
    jmp loc_1fcd80

loc_1fcd68:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcd86

loc_1fcd78:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcd80:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcd86:
    tax
    txa
    eor #$ff
    inc a
    sta $0a
    lda $08
    bmi loc_1fcda7
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcdca
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcdd8

loc_1fcda7:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $15f4
    bmi loc_1fcdba
    sta WRMPYB
    nop
    jmp loc_1fcdd2

loc_1fcdba:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop
    nop
    nop
    lda RDMPYH
    jmp loc_1fcdd8

loc_1fcdca:
    eor #$ff
    inc a
    sta WRMPYB
    nop
    nop

loc_1fcdd2:
    lda #$00
    sec
    sbc RDMPYH

loc_1fcdd8:
    tax
    txa
    clc
    adc $0a
    sta $0a
    bit #$80
    beq loc_1fcde9
    lda #$ff
    sta $0b
    bra loc_1fcdeb

loc_1fcde9:
    stz $0b

loc_1fcdeb:
    plb
    plp
.i16
    plx
    ply
    rtl

sub_1fcdf0:
    stx $3a
    sty $3c
    php
    phb
    sep #$10
.i8
    tax
    lda #$00
    pha
    plb
    lda $98a5,x
    sta $15c6
    lda $98e5,x
    sta $15c7
    lda $02
    sta $63
    lda $03
    sta $64
    lda $15c6
    sta $65
    jsl sub_02fc70
    lda $66
    sta $15c2
    lda $67
    sta $15c3
    lda $90
    sta $63
    lda $91
    sta $64
    lda $15c7
    sta $65
    jsl sub_02fc70
    lda $66
    clc
    adc $15c2
    sta $15c2
    lda $67
    adc $15c3
    sta $15c3
    lda $90
    sta $63
    lda $91
    sta $64
    lda $15c6
    sta $65
    jsl sub_02fc70
    lda $66
    sta $04
    lda $67
    sta $05
    lda $02
    sta $63
    lda $03
    sta $64
    lda $15c7
    sta $65
    jsl sub_02fc70
    lda $66
    sec
    sbc $04
    sta $04
    lda $67
    sbc $05
    sta $05
    plb
    plp
.i16
    ldy $3c
    ldx $3a
    rtl

sub_1fce84:
    stx $3a
    sty $3c
    php
    phb
    sep #$10
.i8
    eor #$ff
    inc a
    tax
    lda #$00
    pha
    plb
    lda $98a5,x
    sta $15c6
    lda $98e5,x
    sta $15c7
    lda $08
    sta $63
    lda $09
    sta $64
    lda $15c6
    sta $65
    jsl sub_02fc70
    lda $66
    sta $15c2
    lda $67
    sta $15c3
    lda $90
    sta $63
    lda $91
    sta $64
    lda $15c7
    sta $65
    jsl sub_02fc70
    lda $66
    clc
    adc $15c2
    sta $15c2
    lda $67
    adc $15c3
    sta $15c3
    lda $90
    sta $63
    lda $91
    sta $64
    lda $15c6
    sta $65
    jsl sub_02fc70
    lda $66
    sta $0a
    lda $67
    sta $0b
    lda $08
    sta $63
    lda $09
    sta $64
    lda $15c7
    sta $65
    jsl sub_02fc70
    lda $66
    sec
    sbc $0a
    sta $0a
    lda $67
    sbc $0b
    sta $0b
    plb
    plp
.i16
    ldy $3c
    ldx $3a
    rtl

loc_1fcf1b:
    phx
    phy
    jsl sub_1fd0ab
    rep #$20
.a16
    lda $02
    clc
    adc $04
    sta $02
    lda $08
    clc
    adc $15c2
    sta $08
    jsl sub_02fcf1
    rep #$20
    xba
    and #$00ff
    sep #$20
.a8
    rep #$10
    ply
    plx
    rtl

sub_1fcf43:
    phx
    phy
    jsl sub_1fcf92
    jsl sub_02fcf1
.a16
    rep #$20
    xba
    and #$00ff
    sep #$20
.a8
    rep #$10
    ply
    plx
    rtl
    .db $c2,$20,$b9,$0c,$00,$18,$65,$04,$38,$f5,$0c,$85,$02,$10,$06,$a9
    .db $00,$00,$38,$e5,$02,$8d,$50,$12,$b9,$10,$00,$18,$6d,$c2,$15,$38
    .db $f5,$10,$85,$08,$30,$06,$18,$6d,$50,$12,$80,$06,$38,$ad,$50,$12
    .db $e5,$08,$8d,$50,$12,$e2,$20,$6b

sub_1fcf92:
    rep #$20
.a16
    lda $04
    sec
    sbc $0c,x
    sta $02
    bpl loc_1fcfa3
    lda #$0000
    sec
    sbc $02

loc_1fcfa3:
    sta $1250
    lda $15c2
    sec
    sbc $10,x
    sta $08
    bmi loc_1fcfb6
    clc
    adc $1250
    bra loc_1fcfbc

loc_1fcfb6:
    sec
    lda $1250
    sbc $08

loc_1fcfbc:
    sta $1250
    sep #$20
.a8
    rtl
    .db $c2,$20,$a5,$04,$38,$f5,$0c,$85,$02,$10,$06,$a9,$00,$00,$38,$e5
    .db $02,$8d,$50,$12,$a5,$0a,$38,$f5,$0e,$85,$08,$30,$06,$18,$6d,$50
    .db $12,$80,$06,$38,$ad,$50,$12,$e5,$08,$8d,$50,$12,$e2,$20,$6b,$c2
    .db $20,$86,$3a,$bb,$a4,$3a,$b5,$2f,$85,$02,$b5,$31,$85,$08,$b5,$33
    .db $85,$90,$86,$3a,$bb,$a4,$3a,$b5,$2f,$18,$65,$02,$95,$2f,$b5,$31
    .db $18,$65,$08,$95,$31,$b5,$33,$18,$65,$90,$95,$33,$e2,$20,$6b

sub_1fd021:
    phx
    phy
    rep #$20
.a16
    lda $000c,y
    sec
    sbc $0c,x
    sta $02
    lda $0010,y
    sec
    sbc $10,x
    sta $08
    jsl sub_02fcf1
    rep #$30
    ply
    plx
    rtl

sub_1fd03e:
.a8
    phx
    phy
    jsl sub_1fd0ab
    rep #$20
.a16
    lda $1250
    sta $08
    lda $000e,y
    sec
    sbc $0e,x
    sta $02
    jsl sub_02fcf1
    rep #$30
    ply
    plx
    rtl

sub_1fd05c:
.a8
    phx
    phy
    jsl sub_1fcf92
    rep #$20
.a16
    lda $1250
    sta $08
    lda $000a
    sec
    sbc $0e,x
    sta $02
    jsl sub_02fcf1
    rep #$20
    sta $3a
    xba
    and #$00ff
    sep #$20
.a8
    rep #$10
    ply
    plx
    rtl

sub_1fd084:
    phx
    phy
    rep #$20
.a16
    lda $0004
    sec
    sbc $0c,x
    sta $02
    lda $15c2
    sec
    sbc $10,x
    sta $08
    jsl sub_02fcf1
    rep #$20
    sta $3a
    xba
    and #$00ff
    sep #$20
.a8
    rep #$10
    ply
    plx
    rtl

sub_1fd0ab:
    rep #$20
.a16
    lda $000c,y
    sec
    sbc $0c,x
    bpl loc_1fd0b9
    eor #$ffff
    inc a

loc_1fd0b9:
    sta $02
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_1fd0c7
    eor #$ffff
    inc a

loc_1fd0c7:
    sta $08
    rep #$20
    lda $02
    cmp #$8000
    ror a
    sta $02
    lda $08
    cmp #$8000
    ror a
    sta $08
    lda $08
    clc
    adc $02
    asl a
    sta $1250
    lda $08
    cmp $02
    bmi loc_1fd0ee
    lda $08
    bra loc_1fd0f0

loc_1fd0ee:
    lda $02

loc_1fd0f0:
    clc
    adc $1250
    sta $02
    asl a
    asl a
    sta $08
    lda $02
    cmp #$8000
    ror a
    clc
    adc $08
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    sta $1250
    sep #$20
.a8
    rtl

sub_1fd115:
    rep #$20
.a16
    lda $000c,y
    sec
    sbc $0c,x
    sta $02
    bpl loc_1fd127
    lda #$0000
    sec
    sbc $02

loc_1fd127:
    sta $158f
    lda $000e,y
    sec
    sbc $0e,x
    sta $08
    bmi loc_1fd13a
    clc
    adc $158f
    bra loc_1fd140

loc_1fd13a:
    sec
    lda $158f
    sbc $08

loc_1fd140:
    sta $158f
    sep #$20
.a8
    rtl

sub_1fd146:
    pha
    lda $14d2
    and #$01
    bne loc_1fd170
    pla

loc_1fd14f:
    stx $3a
    sep #$30
.i8
    sta $14c5
    asl a
    clc
    adc $14c5
    tax
    lda $1fd17e,x
    pha
    rep #$20
.a16
    lda $1fd17c,x
    dec a
    pha
    sep #$20
.a8
    rep #$10
.i16
    ldx $3a
    rtl

loc_1fd170:
    pla
    cpx $1238
    beq loc_1fd14f
    ldy #$0000
    rtl
    .db $20,$fe,$00,$00,$00,$00,$00,$00,$37,$a9,$06,$00,$e0,$01,$e3,$a7
    .db $06,$00,$c0,$03,$bf,$a8,$06,$00,$a0,$05,$e3,$af,$06,$00,$80,$07
    .db $e1,$ae,$06,$00,$60,$09,$61,$ae,$06,$00,$40,$0b,$61,$af,$06,$00
    .db $20,$0d,$99,$b3,$06,$00,$00,$0f,$de,$b0,$06,$00,$e0,$10,$5d,$b0
    .db $06,$00,$c0,$12,$40,$b2,$06,$00,$a0,$14,$b2,$b2,$06,$00,$80,$16
    .db $24,$b3,$06,$00,$60,$18,$84,$b1,$06,$00,$40,$1a,$7d,$b4,$06,$00
    .db $20,$1c,$0b,$b4,$06,$00,$00,$1e,$be,$a9,$06,$00,$e0,$1f,$d0,$ac
    .db $06,$00,$c0,$21,$53,$ad,$06,$00,$a0,$23,$d6,$ad,$06,$00,$80,$25
    .db $82,$a7,$06,$00,$60,$27,$e7,$b4,$06,$00,$40,$29,$ca,$ab,$06,$00
    .db $20,$2b,$4d,$ac,$06,$00,$00,$2d,$c4,$aa,$06,$00,$e0,$2e,$47,$ab
    .db $06,$00,$c0,$30,$41,$aa,$06,$00,$a0,$32,$be,$a9,$06,$00,$80,$34
    .db $f6,$b1,$06,$00,$60,$36,$1b,$b2,$06,$00,$40,$38,$48,$a8,$06,$00

sub_1fd23a:
    dec $2d,x
    beq loc_1fd242
    jml loc_1fd26a

loc_1fd242:
    lda $14d8
    and #$01
    bne loc_1fd24d
    jml loc_1fd258

loc_1fd24d:
    lda $02
    cmp #$08
    bne loc_1fd258
    cmp #$80
    ror a
    sta $02

loc_1fd258:
    lda $2a,x
    bmi loc_1fd265
    sec
    sbc $02
    bpl loc_1fd263
    lda #$00

loc_1fd263:
    sta $2a,x

loc_1fd265:
    lda $14c5
    sta $2d,x

loc_1fd26a:
    rtl

sub_1fd26b:
    php
    rep #$30
.a16
    cpx $156b
    bne loc_1fd276
    brl loc_1fd330

loc_1fd276:
    lda $2e,x
    and #$fffb
    sta $2e,x
    lda $0c,x
    sta $1513
    lda $0e,x
    sta $1515
    lda $10,x
    sta $1517
    sep #$20
.a8
    stx $123a
    lda $2a,x
    bne loc_1fd2c2
    lda $09,x
    and #$10
    beq loc_1fd29f
    jml loc_1fd2c2

loc_1fd29f:
    rep #$20
.a16
    lda $7e1cd6,x
    beq loc_1fd2af
    sep #$20
.a8
    lda $1e,x
    and #$02
    bne loc_1fd2ed

loc_1fd2af:
    sep #$20
    lda $7e1cd2,x
    sta $1244
    rep #$20
.a16
    lda $7e1cd0,x
    bne loc_1fd30f
    sep #$20

loc_1fd2c2:
.a8
    lda $09,x
    and #$ef
    sta $09,x
    lda $1d,x
    and #$80
    beq loc_1fd2e7
    lda $7e1cd5,x
    sta $1244
    rep #$20
.a16
    lda $7e1cd3,x
    bne loc_1fd30f
    sep #$20
.a8
    lda $1d,x
    and #$7f
    sta $1d,x
    bra loc_1fd304

loc_1fd2e7:
    lda $1e,x
    and #$02
    beq loc_1fd304

loc_1fd2ed:
    lda $1e,x
    and #$fd
    sta $1e,x
    lda $7e1cd8,x
    sta $1244
    rep #$20
.a16
    lda $7e1cd6,x
    bne loc_1fd30f
    sep #$20

loc_1fd304:
.a8
    lda $18,x
    sta $1244
    rep #$20
.a16
    lda $16,x
    beq loc_1fd335

loc_1fd30f:
    sta $1242
    sep #$20
.a8
    lda #$1f
    pha
    rep #$20
.a16
    lda #$d32f
    pha
    sep #$20
.a8
    lda $1244
    pha
    rep #$20
.a16
    stz $1521
    lda $1242
    dec a
    pha
    sep #$20
.a8
    rtl

loc_1fd330:
    sep #$20
    lda $14c9

loc_1fd335:
    plp
    rtl
    .db $e2,$20,$9c,$00,$42,$9c,$0c,$42,$9c,$2c,$21,$9c,$2d,$21,$48,$9c
    .db $0c,$42,$a9,$80,$8d,$00,$21,$68,$9c,$21,$21,$8d,$22,$21,$1a,$8d
    .db $22,$21,$1a,$29,$0f,$48,$ad,$0e,$12,$8d,$0c,$42,$a9,$0f,$8d,$00
    .db $21,$ea,$ea,$ea,$ea,$80,$d8

sub_1fd36e:
    phx
    tyx
    ply
    lda #$00
    phy
    phx
    ldy #$0032

loc_1fd378:
    sta $04,x
    inx
    dey
    bne loc_1fd378
    plx
    phx
    ldy #$0036

loc_1fd383:
    sta $7e1cca,x
    inx
    dey
    bne loc_1fd383
    plx
    ply
    lda $08,x
    ora #$10
    sta $08,x
    lda $09,x
    ora #$08
    sta $09,x
    lda $2e,x
    ora #$04
    sta $2e,x
    lda $1f,x
    ora #$08
    sta $1f,x
    phx
    tyx
    ply
    rtl

sub_1fd3a9:
    rep #$20
.a16
    txy
    ldx $121f
    bne loc_1fd3b7
    sep #$20
.a8
    tyx
    jmp loc_1fd3de

loc_1fd3b7:
.a16
    lda $00,x
    sta $121f
    tya
    bne loc_1fd3cb
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_1fd3d4

loc_1fd3cb:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_1fd3d4:
    ldy $00,x
    beq loc_1fd3da
    stx $02,y

loc_1fd3da:
    sep #$20
.a8
    sec
    rtl

loc_1fd3de:
    clc
    rtl

sub_1fd3e0:
    rep #$10
    phx
    ldx $121d
    beq loc_1fd3fb

loc_1fd3e8:
    ldy $00,x
    sep #$20
    lda $20,x
    and #$01
    bne loc_1fd3f8
    phy
    jsl sub_1fbfdc
    ply

loc_1fd3f8:
    tyx
    bne loc_1fd3e8

loc_1fd3fb:
    plx
    rtl

loc_1fd3fd:
    rep #$10
    phx
    ldx $121d
    beq loc_1fd418

loc_1fd405:
    ldy $00,x
    sep #$20
    lda $1f,x
    and #$08
    beq loc_1fd415
    phy
    jsl sub_1fbfdc
    ply

loc_1fd415:
    tyx
    bne loc_1fd405

loc_1fd418:
    plx
    rtl

sub_1fd41a:
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$f45f
    sta $1cd0,x
    sep #$20
.a8
    lda #$06
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rtl
    .db $c2,$20,$a9,$a3,$89,$99,$d3,$1c,$a9,$5f,$f4,$99,$d0,$1c,$e2,$20
    .db $a9,$06,$99,$d5,$1c,$a9,$06,$99,$d2,$1c,$6b

sub_1fd450:
    rep #$20
.a16
    lda #$0000
    sta $1cd3,x
    sta $1cd0,x
    sep #$20
.a8
    sta $1cd5,x
    sta $1cd2,x
    rtl

sub_1fd464:
    rep #$20
.a16
    lda #$0000
    sta $1cd3,y
    sta $1cd0,y
    sep #$20
.a8
    sta $1cd5,y
    sta $1cd2,y
    rtl
    .db $b5,$0c,$18,$65,$04,$99,$0c,$00,$b5,$10,$18,$6d,$c2,$15,$99,$10
    .db $00,$b5,$0e,$18,$65,$0a,$99,$0e,$00,$6b,$c9,$00,$80,$6a,$85,$3a
    .db $c9,$00,$80,$6a,$c9,$00,$80,$6a,$c9,$00,$80,$6a,$18,$65,$3a,$6b
    .db $c9,$00,$80,$6a,$85,$3a,$c9,$00,$80,$6a,$c9,$00,$80,$6a,$18,$65
    .db $3a,$6b

sub_1fd4ba:
.a16
    cmp #$8000
    ror a
    sta $3a
    cmp #$8000
    ror a
    clc
    adc $3a
    rtl

sub_1fd4c8:
    cmp #$8000
    ror a
    sta $3a
    cmp #$8000
    ror a
    sta $3c
    cmp #$8000
    ror a
    clc
    adc $3a
    clc
    adc $3c
    rtl
    .db $c9,$00,$80,$6a,$85,$3a,$c9,$00,$80,$6a,$85,$3c,$c9,$00,$80,$6a
    .db $8d,$c5,$14,$c9,$00,$80,$6a,$18,$6d,$c5,$14,$18,$65,$3a,$18,$65
    .db $3c,$6b

sub_1fd501:
.a8
    lda $08,x
    and #$40
    bne loc_1fd50b
    jml loc_1fd531

loc_1fd50b:
    phy
    rep #$20
.a16
    lda $7e1cdd,x
    beq loc_1fd52e
    tay
    lda #$0000
    sta $7e1cdd,x
    sep #$20
.a8
    lda $08,x
    and #$bf
    sta $08,x
    phx
    tyx
    ply
    jsl sub_1fbfdc
    phx
    tyx
    ply

loc_1fd52e:
    sep #$20
    ply

loc_1fd531:
    cpx $123a
    bne loc_1fd53b
    inc $1248
    bra loc_1fd53f

loc_1fd53b:
    jsl sub_1fbfdc

loc_1fd53f:
    rtl

sub_1fd540:
    phx
    tyx
    ply
    jsl sub_1fd501
    phx
    tyx
    ply
    rtl

sub_1fd54b:
    stx $3a
    jsl sub_1fd3a9
    bcs loc_1fd55a
    ldy #$0000
    ldx $3a
    clc
    rtl

loc_1fd55a:
    txy
    ldx $3a
    sep #$20
    jsl sub_1fd36e
    rep #$20
.a16
    lda $14c5
    sta $0004,y
    sep #$20
.a8
    sec
    rtl

sub_1fd56f:
    sta $14c5
    lda $14c5
    sta $0022,y
    stx $06,y
    rep #$20
.a16
    lda #$0000
    sta $0026,y
    sep #$20
.a8
    rep #$20
.a16
    sty $3a
    txa

loc_1fd589:
    tay
    lda $0026,y
    bne loc_1fd589
    lda $3a
    sta $0026,y
    ldy $3a
    sep #$20
.a8
    lda $20,x
    ora #$40
    sta $20,x
    lda $0020,y
    ora #$10
    sta $0020,y
    rtl

sub_1fd5a7:
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    sta $2f,x
    lda $08
    sta $31,x
    lda $90
    sta $33,x
    sep #$20
.a8
    rtl

sub_1fd5bc:
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    asl a
    sta $2f,x
    lda $08
    asl a
    sta $31,x
    lda $90
    asl a
    sta $33,x
    sep #$20
.a8
    rtl

sub_1fd5d4:
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    asl a
    asl a
    sta $2f,x
    lda $08
    asl a
    asl a
    sta $31,x
    lda $90
    asl a
    asl a
    sta $33,x
    sep #$20
.a8
    rtl

loc_1fd5ef:
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    asl a
    asl a
    asl a
    sta $2f,x
    lda $08
    asl a
    asl a
    asl a
    sta $31,x
    lda $90
    asl a
    asl a
    asl a
    sta $33,x
    sep #$20
.a8
    rtl

sub_1fd60d:
    sta $3a
    lda $15,x
    sec
    sbc $14c5
    beq loc_1fd63a
    bpl loc_1fd61c
    eor #$ff
    inc a

loc_1fd61c:
    cmp $3a
    bpl loc_1fd625
    lda $14c5
    bra loc_1fd636

loc_1fd625:
    lda $15,x
    cmp $14c5
    beq loc_1fd636
    bmi loc_1fd633
    sec
    sbc $3a
    bra loc_1fd636

loc_1fd633:
    clc
    adc $3a

loc_1fd636:
    sta $15,x
    clc
    rtl

loc_1fd63a:
    sec
    rtl

sub_1fd63c:
.a16
    cmp $3a
    bne loc_1fd644
    jml loc_1fda29

loc_1fd644:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd656
    cmp #$0002
    bpl loc_1fd65e
    lda #$0002
    bra loc_1fd65e

loc_1fd656:
    cmp #$fffe
    bmi loc_1fd65e
    lda #$fffe

loc_1fd65e:
    cmp #$8000
    ror a
    bpl loc_1fd667
    adc #$0000

loc_1fd667:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd66f:
    cmp $3a
    bne loc_1fd677
    jml loc_1fda29

loc_1fd677:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd689
    cmp #$0004
    bpl loc_1fd691
    lda #$0004
    bra loc_1fd691

loc_1fd689:
    cmp #$fffc
    bmi loc_1fd691
    lda #$fffc

loc_1fd691:
    cmp #$8000
    ror a
    bpl loc_1fd69a
    adc #$0000

loc_1fd69a:
    cmp #$8000
    ror a
    bpl loc_1fd6a3
    adc #$0000

loc_1fd6a3:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd6ab:
    cmp $3a
    bne loc_1fd6b3
    jml loc_1fda29

loc_1fd6b3:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd6c5
    cmp #$0008
    bpl loc_1fd6cd
    lda #$0008
    bra loc_1fd6cd

loc_1fd6c5:
    cmp #$fff8
    bmi loc_1fd6cd
    lda #$fff8

loc_1fd6cd:
    cmp #$8000
    ror a
    bpl loc_1fd6d6
    adc #$0000

loc_1fd6d6:
    cmp #$8000
    ror a
    bpl loc_1fd6df
    adc #$0000

loc_1fd6df:
    cmp #$8000
    ror a
    bpl loc_1fd6e8
    adc #$0000

loc_1fd6e8:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd6f0:
    cmp $3a
    bne loc_1fd6f8
    jml loc_1fda29

loc_1fd6f8:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd70a
    cmp #$0010
    bpl loc_1fd712
    lda #$0010
    bra loc_1fd712

loc_1fd70a:
    cmp #$fff0
    bmi loc_1fd712
    lda #$fff0

loc_1fd712:
    cmp #$8000
    ror a
    bpl loc_1fd71b
    adc #$0000

loc_1fd71b:
    cmp #$8000
    ror a
    bpl loc_1fd724
    adc #$0000

loc_1fd724:
    cmp #$8000
    ror a
    bpl loc_1fd72d
    adc #$0000

loc_1fd72d:
    cmp #$8000
    ror a
    bpl loc_1fd736
    adc #$0000

loc_1fd736:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd73e:
    cmp $3a
    bne loc_1fd746
    jml loc_1fda29

loc_1fd746:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd758
    cmp #$0020
    bpl loc_1fd760
    lda #$0020
    bra loc_1fd760

loc_1fd758:
    cmp #$ffe0
    bmi loc_1fd760
    lda #$ffe0

loc_1fd760:
    cmp #$8000
    ror a
    bpl loc_1fd769
    adc #$0000

loc_1fd769:
    cmp #$8000
    ror a
    bpl loc_1fd772
    adc #$0000

loc_1fd772:
    cmp #$8000
    ror a
    bpl loc_1fd77b
    adc #$0000

loc_1fd77b:
    cmp #$8000
    ror a
    bpl loc_1fd784
    adc #$0000

loc_1fd784:
    cmp #$8000
    ror a
    bpl loc_1fd78d
    adc #$0000

loc_1fd78d:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

loc_1fd795:
    cmp $3a
    bne loc_1fd79d
    jml loc_1fda29

loc_1fd79d:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd7af
    cmp #$0040
    bpl loc_1fd7b7
    lda #$0040
    bra loc_1fd7b7

loc_1fd7af:
    cmp #$ffc0
    bmi loc_1fd7b7
    lda #$ffc0

loc_1fd7b7:
    cmp #$8000
    ror a
    bpl loc_1fd7c0
    adc #$0000

loc_1fd7c0:
    cmp #$8000
    ror a
    bpl loc_1fd7c9
    adc #$0000

loc_1fd7c9:
    cmp #$8000
    ror a
    bpl loc_1fd7d2
    adc #$0000

loc_1fd7d2:
    cmp #$8000
    ror a
    bpl loc_1fd7db
    adc #$0000

loc_1fd7db:
    cmp #$8000
    ror a
    bpl loc_1fd7e4
    adc #$0000

loc_1fd7e4:
    cmp #$8000
    ror a
    bpl loc_1fd7ed
    adc #$0000

loc_1fd7ed:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

loc_1fd7f5:
    cmp $3a
    bne loc_1fd7fd
    jml loc_1fda29

loc_1fd7fd:
    sec
    sbc $3a
    cmp #$0000
    bmi loc_1fd80f
    cmp #$0080
    bpl loc_1fd817
    lda #$0080
    bra loc_1fd817

loc_1fd80f:
    cmp #$ff80
    bmi loc_1fd817
    lda #$ff80

loc_1fd817:
    cmp #$8000
    ror a
    bpl loc_1fd820
    adc #$0000

loc_1fd820:
    cmp #$8000
    ror a
    bpl loc_1fd829
    adc #$0000

loc_1fd829:
    cmp #$8000
    ror a
    bpl loc_1fd832
    adc #$0000

loc_1fd832:
    cmp #$8000
    ror a
    bpl loc_1fd83b
    adc #$0000

loc_1fd83b:
    cmp #$8000
    ror a
    bpl loc_1fd844
    adc #$0000

loc_1fd844:
    cmp #$8000
    ror a
    bpl loc_1fd84d
    adc #$0000

loc_1fd84d:
    cmp #$8000
    ror a
    bpl loc_1fd856
    adc #$0000

loc_1fd856:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd85e:
.a8
    cmp $3a
    bne loc_1fd866
    jml loc_1fda29

loc_1fd866:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd875
    cmp #$02
    bpl loc_1fd87b
    lda #$02
    bra loc_1fd87b

loc_1fd875:
    cmp #$fe
    bmi loc_1fd87b
    lda #$fe

loc_1fd87b:
    cmp #$80
    ror a
    bpl loc_1fd882
    adc #$00

loc_1fd882:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd88a:
    cmp $3a
    bne loc_1fd892
    jml loc_1fda29

loc_1fd892:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd8a1
    cmp #$04
    bpl loc_1fd8a7
    lda #$04
    bra loc_1fd8a7

loc_1fd8a1:
    cmp #$fc
    bmi loc_1fd8a7
    lda #$fc

loc_1fd8a7:
    cmp #$80
    ror a
    bpl loc_1fd8ae
    adc #$00

loc_1fd8ae:
    cmp #$80
    ror a
    bpl loc_1fd8b5
    adc #$00

loc_1fd8b5:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd8bd:
    cmp $3a
    bne loc_1fd8c5
    jml loc_1fda29

loc_1fd8c5:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd8d4
    cmp #$08
    bpl loc_1fd8da
    lda #$08
    bra loc_1fd8da

loc_1fd8d4:
    cmp #$f8
    bmi loc_1fd8da
    lda #$f8

loc_1fd8da:
    cmp #$80
    ror a
    bpl loc_1fd8e1
    adc #$00

loc_1fd8e1:
    cmp #$80
    ror a
    bpl loc_1fd8e8
    adc #$00

loc_1fd8e8:
    cmp #$80
    ror a
    bpl loc_1fd8ef
    adc #$00

loc_1fd8ef:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd8f7:
    cmp $3a
    bne loc_1fd8ff
    jml loc_1fda29

loc_1fd8ff:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd90e
    cmp #$10
    bpl loc_1fd914
    lda #$10
    bra loc_1fd914

loc_1fd90e:
    cmp #$f0
    bmi loc_1fd914
    lda #$f0

loc_1fd914:
    cmp #$80
    ror a
    bpl loc_1fd91b
    adc #$00

loc_1fd91b:
    cmp #$80
    ror a
    bpl loc_1fd922
    adc #$00

loc_1fd922:
    cmp #$80
    ror a
    bpl loc_1fd929
    adc #$00

loc_1fd929:
    cmp #$80
    ror a
    bpl loc_1fd930
    adc #$00

loc_1fd930:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

sub_1fd938:
    cmp $3a
    bne loc_1fd940
    jml loc_1fda29

loc_1fd940:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd94f
    cmp #$20
    bpl loc_1fd955
    lda #$20
    bra loc_1fd955

loc_1fd94f:
    cmp #$e0
    bmi loc_1fd955
    lda #$e0

loc_1fd955:
    cmp #$80
    ror a
    bpl loc_1fd95c
    adc #$00

loc_1fd95c:
    cmp #$80
    ror a
    bpl loc_1fd963
    adc #$00

loc_1fd963:
    cmp #$80
    ror a
    bpl loc_1fd96a
    adc #$00

loc_1fd96a:
    cmp #$80
    ror a
    bpl loc_1fd971
    adc #$00

loc_1fd971:
    cmp #$80
    ror a
    bpl loc_1fd978
    adc #$00

loc_1fd978:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

loc_1fd980:
    cmp $3a
    bne loc_1fd988
    jml loc_1fda29

loc_1fd988:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd997
    cmp #$40
    bpl loc_1fd99d
    lda #$40
    bra loc_1fd99d

loc_1fd997:
    cmp #$c0
    bmi loc_1fd99d
    lda #$c0

loc_1fd99d:
    cmp #$80
    ror a
    bpl loc_1fd9a4
    adc #$00

loc_1fd9a4:
    cmp #$80
    ror a
    bpl loc_1fd9ab
    adc #$00

loc_1fd9ab:
    cmp #$80
    ror a
    bpl loc_1fd9b2
    adc #$00

loc_1fd9b2:
    cmp #$80
    ror a
    bpl loc_1fd9b9
    adc #$00

loc_1fd9b9:
    cmp #$80
    ror a
    bpl loc_1fd9c0
    adc #$00

loc_1fd9c0:
    cmp #$80
    ror a
    bpl loc_1fd9c7
    adc #$00

loc_1fd9c7:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

loc_1fd9cf:
    cmp $3a
    bne loc_1fd9d7
    jml loc_1fda29

loc_1fd9d7:
    sec
    sbc $3a
    cmp #$00
    bmi loc_1fd9e6
    cmp #$80
    bpl loc_1fd9ec
    lda #$80
    bra loc_1fd9ec

loc_1fd9e6:
    cmp #$80
    bmi loc_1fd9ec
    lda #$80

loc_1fd9ec:
    cmp #$80
    ror a
    bpl loc_1fd9f3
    adc #$00

loc_1fd9f3:
    cmp #$80
    ror a
    bpl loc_1fd9fa
    adc #$00

loc_1fd9fa:
    cmp #$80
    ror a
    bpl loc_1fda01
    adc #$00

loc_1fda01:
    cmp #$80
    ror a
    bpl loc_1fda08
    adc #$00

loc_1fda08:
    cmp #$80
    ror a
    bpl loc_1fda0f
    adc #$00

loc_1fda0f:
    cmp #$80
    ror a
    bpl loc_1fda16
    adc #$00

loc_1fda16:
    cmp #$80
    ror a
    bpl loc_1fda1d
    adc #$00

loc_1fda1d:
    clc
    adc $3a
    sta $3a
    brl loc_1fda25

loc_1fda25:
    lda $3a
    clc
    rtl

loc_1fda29:
    lda $3a
    sec
    rtl
    .db $c2,$20,$a9,$5f,$f4,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06,$9f,$d2,$1c
    .db $7e,$6b,$da,$bb,$7a,$c2,$20,$a9,$5f,$f4,$9f,$d0,$1c,$7e,$e2,$20
    .db $a9,$06,$9f,$d2,$1c,$7e,$da,$bb,$7a,$6b

sub_1fda57:
    rep #$20
.a16
    lda $0c,x
    sec
    sbc $150d
    sta $14c5
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    sep #$20
.a8
    clc
    adc $14,x
    sta $14,x
    lda $15bb
    clc
    adc $123a
    and #$03
    beq loc_1fda90
    jml loc_1fdab7

loc_1fda90:
    lda $14c6
    bmi loc_1fda99
    inc $13,x
    bra loc_1fda9b

loc_1fda99:
    dec $13,x

loc_1fda9b:
    rep #$20
.a16
    lda $0e,x
    sec
    sbc $150f
    sep #$20
.a8
    bmi loc_1fdab0
    lda $12,x
    clc
    adc #$01
    sta $12,x
    bra loc_1fdab7

loc_1fdab0:
    lda $12,x
    sec
    sbc #$01
    sta $12,x

loc_1fdab7:
    rtl

sub_1fdab8:
    lda $02
    sta $15a6
    lda $90
    sta $7e
    lda #$40
    sta $15a7
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    sta $2f,x
    lda $08
    sta $31,x
    stz $33,x
    sep #$20
.a8
    rtl

sub_1fdad9:
    rep #$20
.a16
    lda $0c,x
    sta $000c,y
    lda $0e,x
    sta $000e,y
    lda $10,x
    sta $0010,y
    sep #$20
.a8
    rtl

sub_1fdaed:
    rep #$20
.a16
    lda $000c,y
    sta $0c,x
    lda $000e,y
    sta $0e,x
    lda $0010,y
    sta $10,x
    sep #$20
.a8
    rtl

sub_1fdb01:
    lda $12,x
    sta $0012,y
    lda $13,x
    sta $0013,y
    lda $14,x
    sta $0014,y
    rtl

sub_1fdb11:
    lda $0012,y
    sta $12,x
    lda $0013,y
    sta $13,x
    lda $0014,y
    sta $14,x
    rtl
    .db $c2,$20,$ad,$ea,$14,$38,$ed,$f4,$14,$18,$75,$10,$95,$10,$e2,$20
    .db $6b,$c2,$20,$ad,$ea,$14,$38,$ed,$f4,$14,$18,$79,$10,$00,$99,$10
    .db $00,$e2,$20,$6b

sub_1fdb45:
    rep #$20
.a16
    stz $2f,x
    stz $31,x
    stz $33,x
    sep #$20
.a8
    stz $15,x
    rtl
    .db $c2,$20,$a9,$00,$00,$99,$2f,$00,$99,$31,$00,$99,$33,$00,$e2,$20
    .db $99,$15,$00,$6b

loc_1fdb66:
    lda $1cdc,x
    inc a
    sta $1cdc,x
    brl loc_1fdba0
    .db $a9,$00,$9d,$dc,$1c,$82,$28,$00,$a9,$01,$9d,$dc,$1c,$82,$20,$00
    .db $a9,$02,$9d,$dc,$1c,$82,$18,$00,$a9,$03,$9d,$dc,$1c,$82,$10,$00
    .db $a9,$04,$9d,$dc,$1c,$82,$08,$00,$a9,$05,$9d,$dc,$1c,$82,$00,$00

loc_1fdba0:
    jml loc_1fdc25

sub_1fdba4:
    sep #$20
    lda $20,x
    and #$10
    bne loc_1fdbb0
    jml loc_1fdbd1

loc_1fdbb0:
    ldy $06,x
    lda $20,x
    and #$ef
    sta $20,x
    rep #$20
.a16
    stx $3c
    phy

loc_1fdbbd:
    lda $0026,y
    beq loc_1fdbce
    cmp $3c
    beq loc_1fdbc9
    tay
    bra loc_1fdbbd

loc_1fdbc9:
    lda $26,x
    sta $0026,y

loc_1fdbce:
    ply
    sep #$20

loc_1fdbd1:
.a8
    lda $20,x
    and #$40
    bne loc_1fdbdb
    jml loc_1fdc24

loc_1fdbdb:
    lda $0020,y
    and #$bf
    sta $0020,y
    stz $14c5
    phy
    phx

loc_1fdbe8:
    ldy $26,x
    beq loc_1fdbf2
    inc $14c5
    tyx
    bra loc_1fdbe8

loc_1fdbf2:
    plx
    ply
    lda $14c5
    beq loc_1fdc24

loc_1fdbf9:
    sta $14c5
    lda $14c5
    jsl sub_1fdc40
    cpy #$0000
    bne loc_1fdc0c
    jml loc_1fdc1e

loc_1fdc0c:
    lda $0020,y
    and #$ef
    sta $0020,y
    rep #$20
.a16
    lda #$0000
    sta $0006,y
    sep #$20

loc_1fdc1e:
.a8
    lda $14c5
    dec a
    bne loc_1fdbf9

loc_1fdc24:
    rtl

loc_1fdc25:
    lda $18,x
    pha
    rep #$20
.a16
    bne loc_1fdc35
    lda $16,x
    beq loc_1fdc3c
    dec a
    pha
    sep #$20
.a8
    rtl

loc_1fdc35:
.a16
    lda $16,x
    dec a
    pha
    sep #$20
.a8
    rtl

loc_1fdc3c:
.a16
    sep #$20
.a8
    pla
    rtl

sub_1fdc40:
    sta $1fe6
    phx

loc_1fdc44:
    ldy $26,x
    beq loc_1fdc53
    lda $0022,y
    cmp $1fe6
    beq loc_1fdc53
    tyx
    bra loc_1fdc44

loc_1fdc53:
    plx
    rtl
    .db $8d,$e6,$1f,$5a,$b6,$26,$f0,$0a,$b5,$22,$cd,$e6,$1f,$f0,$03,$9b
    .db $80,$f2,$7a,$6b

sub_1fdc69:
    rep #$20
.a16
    lda $10,x
    clc
    adc $14f4
    sta $10,x
    sep #$20
.a8
    rtl
    .db $c2,$20,$b9,$10,$00,$18,$6d,$f4,$14,$99,$10,$00,$e2,$20,$6b,$60
    .db $60,$6b,$60

sub_1fdc89:
.a16
    php
    jsl sub_02e39a
    jsl sub_03e8b6
    sep #$20
.a8
    rep #$10
    sei
    lda #$80
    jsl sub_02f8df
    lda #$6e
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$12
    sta $1f47
    stz $1f46
    stz $15a8
    sep #$20
    rep #$10
    stz $1201
    stz $1205
    stz $1209
    stz $120b
    rep #$20
.a16
    lda #$0000
    sta $1f2f
    sta $1f3b
    lda #$0000
    sta $1f2d
    sta $1f39
    lda #$0000
    sta $1f2b
    sta $1f37
    lda #$0100
    sta $1f29
    sta $1f35
    lda #$0080
    sta $1f27
    sta $1f33
    lda #$ffef
    sta $1f25
    sta $1f31
    stz $1f21
    ldx $1f69
    lda #$ffff
    sta $1f6b,x
    ldx #$0000
    stx $1f69
    stz $16f9
    stz $16ab
    sep #$20
.a8
    rep #$10
    stz $15bb
    lda #$09
    sta BGMODE
    lda #$07
    sta TM
    stz $14c1
    lda #$06
    sta BG34NBA
    lda #$71
    sta BG3SC
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0014
    sta $700064
    lda #$e362
    sta $700062
    lda #$5c00
    sta $188a
    lda #$1800
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    rep #$20
.a16
    lda #$00c0
    sta $700090
    lda #$0014
    sta $700064
    lda #$e43e
    sta $700062
    lda #$7800
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0014
    sta $700064
    lda #$e272
    sta $700062
    lda #$6800
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    lda #$20
    sta $00
    lda #$01
    sta $1fcf
    lda $004211
    cli

loc_1fddd5:
    jsr sub_1fdf19
    jsr sub_1fe167
    jsr sub_1fde13
    sep #$20
    lda $1962
    bne loc_1fddf1
    lda #$0e
    sta $18b3
    lda #$01
    sta $18b2
    bra loc_1fddd5

loc_1fddf1:
    cmp #$01
    beq loc_1fddfa
    dec $1962
    bra loc_1fddd5

loc_1fddfa:
    rep #$20
.a16
    lda #$0113
    sta $16ab
    sep #$20
.a8
    dec $1962
    bra loc_1fddd5

loc_1fde09:
.a16
    plp
    rep #$30
    pla
    plp
    rtl
    .db $20,$13,$de,$6b

sub_1fde13:
.a8
    sep #$20
    rep #$10

loc_1fde17:
    lda $00
    cmp #$20
    bne loc_1fde17
    stz $1f10
    lda #$1a
    sta $00
    jsl sub_02dd4b
    jsl sub_02db27
    sep #$20
    rep #$10
    lda $1fd1
    bne loc_1fde38
    inc $1f10

loc_1fde38:
    jsr sub_1fde8b
    jsl sub_02f934
    jsl sub_02f4e6
    jsl sub_02f6d5
    jsl sub_1fc03d
    sep #$20
    rep #$10

loc_1fde4f:
    lda $18bb
    beq loc_1fde4f
    jsl sub_02dc16

loc_1fde58:
    lda $18bb
    cmp #$02
    bne loc_1fde58
    stz $18bb
    rep #$30
.a16
    lda #$0000
    sta $70021c
    lda $16f9
    sta $70019e
    beq loc_1fde78
    jsl sub_03baf7

loc_1fde78:
    jsl sub_7e4f10
    jsl sub_02e209
    sep #$20
.a8
    lda $1fd1
    beq loc_1fde8a
    inc $1f10

loc_1fde8a:
    rts

sub_1fde8b:
    php
    sep #$20
    rep #$10
    inc $15bb
    bne loc_1fde98
    inc $15bc

loc_1fde98:
    phb
    lda #$7e
    pha
    plb
    jsl sub_0681d5
    ldx $121d

loc_1fdea4:
    stz $1248
    jsl sub_1fd26b
    lda $1248
    bne loc_1fdeb7
    ldy $00,x

loc_1fdeb2:
    tyx
    bne loc_1fdea4
    bra loc_1fdebf

loc_1fdeb7:
    ldy $00,x
    jsl sub_1fbfdc
    bra loc_1fdeb2

loc_1fdebf:
    plb
    ldx $1734
    beq loc_1fdef6
    rep #$20
.a16
    lda $0c,x
    sta $14f6
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $14f8
    sep #$20
.a8
    rep #$20
.a16
    lda $14f8
    clc
    adc $1f19
    sta $14f8
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    sta $14fa
    sep #$20
.a8
    ldx $1736
    beq loc_1fdef6
    stx $14f6

loc_1fdef6:
    plp
    rts
    .db $da,$48,$af,$69,$1f,$00,$aa,$f0,$08,$68,$df,$69,$1f,$00,$f0,$0f
    .db $48,$68,$9f,$6b,$1f,$00,$e8,$e8,$8a,$8f,$69,$1f,$00,$fa,$6b,$fa
    .db $6b

sub_1fdf19:
    php
    rep #$30
.a16
    dec $1f21
    bmi loc_1fdf23
    plp
    rts

loc_1fdf23:
    sep #$20
.a8
    lda $15a8
    beq loc_1fdf4b
    cmp #$02
    bne loc_1fdf36
    lda #$f1
    sta $1f47
    stz $1f46

loc_1fdf36:
    rep #$20
.a16
    lda #$0102
    sta $16ab
    lda #$0025

loc_1fdf41:
    pha
    jsr sub_1fde13
    rep #$20
    pla
    dec a
    bne loc_1fdf41

loc_1fdf4b:
    sep #$20
.a8
    stz HDMAEN
    lda #$8c
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    stz $18b3
    stz $18b2
    lda #$80
    jsl sub_02f8df
    sta INIDISP
    rep #$20
.a16
    stz $16fb
    stz $16ff
    stz $1701
    stz $c5
    jsl sub_02f4c9
    stz $14f6
    stz $14f8
    stz $14fa
    sep #$20
.a8
    rep #$10
    ldx $121d
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_1fdfae
    jml loc_1fdfae

loc_1fdfae:
    sty $1238
    rep #$20
.a16
    lda #$b566
    sta $0016,y
    sep #$20
.a8
    lda #$0b
    sta $0018,y
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_1fdfd4
    jml loc_1fdfd4

loc_1fdfd4:
    sty $1236
    rep #$30
.a16
    ldx $1f69
    lda $1f6b,x
    cmp #$ffff
    bne loc_1fdfe7
    brl loc_1fde09

loc_1fdfe7:
    inx
    inx
    stx $1f69
    tax
    sep #$20
.a8
    lda $1fec20,x
    sta $1ff4
    rep #$20
.a16
    lda $1fec1e,x
    pha
    lda $1fec21,x
    sta $1f1b
    inx
    inx
    inx
    inx
    inx
    stx $1f23
    plx
    jsl sub_03eda1
    stz $18c5
    stz $18c7
    stz $18c9
    stz $18cb
    sep #$20
.a8
    rep #$10
    jsl sub_068004
    jsr sub_1fe167
    rep #$20
.a16
    lda #$0106
    sta $16ab
    sep #$20
.a8
    lda #$04
    sta $1962
    lda #$0a
    sta HDMAEN
    lda #$96
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$8c
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$20
    sta $00
    lda #$01
    sta $15a8
    ldx $1f69
    lda $1f6b,x
    cmp #$ff
    bne loc_1fe06e
    lda #$02
    sta $15a8

loc_1fe06e:
    plp
    rts
    .db $a9,$22,$8d,$01,$43,$a9,$00,$8d,$21,$21,$a2,$80,$12,$8e,$02,$43
    .db $a9,$7f,$8d,$04,$43,$a2,$00,$02,$8e,$05,$43,$a9,$00,$8d,$00,$43
    .db $a9,$01,$8d,$0b,$42,$4c,$bd,$e0,$a9,$22,$8d,$01,$43,$a9,$00,$8d
    .db $21,$21,$a2,$a0,$11,$8e,$02,$43,$a9,$7f,$8d,$04,$43,$a2,$00,$02
    .db $8e,$05,$43,$a9,$00,$8d,$00,$43,$a9,$01,$8d,$0b,$42,$c2,$20,$a9
    .db $00,$01,$8f,$90,$00,$70,$a9,$14,$00,$8f,$64,$00,$70,$a9,$c2,$e2
    .db $8f,$62,$00,$70,$a9,$00,$70,$8d,$8a,$18,$a9,$00,$10,$8d,$8c,$18
    .db $e2,$20,$22,$2b,$ab,$03,$a5,$00,$f0,$04,$c9,$20,$d0,$f8,$a9,$14
    .db $85,$00,$a5,$00,$f0,$04,$c9,$20,$d0,$f8,$9c,$21,$21,$9c,$22,$21
    .db $9c,$22,$21,$a9,$01,$22,$64,$f4,$02,$a9,$8a,$8f,$4e,$00,$70,$a9
    .db $8b,$8f,$4f,$00,$70,$c2,$20,$a9,$aa,$8f,$8f,$50,$00,$70,$e2,$20
    .db $c2,$10,$60,$08,$e2,$20,$c2,$10,$bf,$6f,$ed,$1f,$e8,$c9,$00,$f0
    .db $34,$c9,$01,$d0,$13,$c2,$20,$bf,$6f,$ed,$1f,$e8,$e8,$18,$69,$00
    .db $70,$8d,$16,$21,$e2,$20,$80,$e0,$c2,$20,$29,$ff,$00,$9b,$aa,$bf
    .db $6d,$8a,$7e,$29,$ff,$00,$bb,$09,$00,$20,$18,$69,$00,$01,$8d,$18
    .db $21,$e2,$20,$80,$c3,$28,$60

sub_1fe167:
    rep #$30
.a16
    jmp ($1f1b)
    .incbin "data/0fe16c-0ff45d.bin"

sub_1ff45d:
.a8
    php

loc_1ff45e:
    sep #$20
    rep #$10
    sei
    lda #$01
    sta $7ef0b3
    lda #$0d
    ldx #$7918
    sta $1ff4
    stx $16fd
    jsl sub_02e2cc
    lda $14d8
    and #$fd
    sta $14d8
    jsl sub_03e8b6
    rep #$20
.a16
    lda #$0000
    sta $70021c
    sta $1ffc
    stz $15bb
    rep #$20
    lda #$0370
    pha

loc_1ff499:
.a8
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda #$09
    sta BGMODE
    rep #$20
.a16
    pla
    dec a
    beq loc_1ff4f0
    pha
    lda $15bb
    cmp #$0028
    bcc loc_1ff499
    sep #$20
.a8
    lda $1202
    bit #$10
    beq loc_1ff499
    rep #$20
.a16
    pla
    sep #$20
.a8
    lda #$10
    jsl sub_03b7f9
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$fd
    sta $18b2

loc_1ff4d8:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda #$09
    sta BGMODE
    lda $18b2
    and #$ff
    bne loc_1ff4d8
    plp
    rtl

loc_1ff4f0:
.a16
    sep #$20
.a8
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$fd
    sta $18b2

loc_1ff4ff:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda #$09
    sta BGMODE
    lda $18b2
    and #$ff
    bne loc_1ff4ff
    jsl sub_1ff51c
    jmp loc_1ff45e

sub_1ff51c:
.i8
    sep #$20
    rep #$10
.i16
    jsl sub_03ad5d
    sep #$20
    rep #$10
    ldx #$0000

loc_1ff52b:
    dex
    bne loc_1ff52b
    jsl sub_03aea7
    sei
    lda #$0d
    ldx #$7796
    sta $1ff4
    stx $16fd
    jsl sub_02e2cc
    lda $14d8
    and #$fd
    sta $14d8
    jsl sub_03e8b6
    lda #$00
    sta $70021c
    sta $1ffc
    sta $7ef0b3
    stz $15bb

loc_1ff55e:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda $15bb
    cmp #$1e
    bcc loc_1ff55e
    lda $1ffc
    bne loc_1ff57c
    lda $1202
    ora $1204
    beq loc_1ff55e

loc_1ff57c:
    lda #$fe
    sta $18b2
    lda #$0b
    sta $18b3

loc_1ff586:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda $18b2
    bne loc_1ff586
    rtl
    lda #$ef
    sta $12,x
    lda #$60
    sta $13,x
    lda #$00
    sta $14,x
    rep #$20
.a16
    lda #$f5af
    sta $16,x
    sep #$20
.a8
    lda #$1f
    sta $18,x
    lda $14,x
    clc
    adc #$02
    sta $14,x
    jsl sub_1fdc69
    rtl
    .incbin "data/0ff5bb-0ff963.bin"

sub_1ff963:
.i8
    php
    sep #$20
    rep #$10
.i16
    jsl sub_03ad73
    sei
    lda #$80
    jsl sub_02f8df
    lda #$c8
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$be
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    sep #$20
    lda #$01
    sta $7ef0b3
    lda #$0d
    ldx #$7962
    sta $1ff4
    stx $16fd
    jsl sub_02e2cc
    jsl sub_03e8b6
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$001f
    sta $700064
    lda #$b999
    sta $700062
    lda #$6800
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    lda #$22
    sta BBAD0
    lda #$80
    sta CGADD
    ldx #$0540
    stx A1TL0
    lda #$7f
    sta A1B0
    ldx #$0100
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$41
    sta $7e45f3
    lda #$43
    sta $7e45f5
    lda #$3a
    sta $7e45f7
    rep #$20
.a16
    lda #$0000
    sta $70021c
    lda #$0040
    sta $700034
    lda #$0030
    sta $700036
    sep #$20
.a8
    lda #$01
    sta $1f0d
    stz $15bb
    stz $15bc
    stz $1202
    stz $1201
    lda $1fdf
    beq loc_1ffa3e
    brl loc_1ffa95

loc_1ffa3e:
    lda $7ea05a
    beq loc_1ffa47
    brl loc_1ffa95

loc_1ffa47:
    sep #$20
    lda $14d6
    and #$1f
    sta $14d6

loc_1ffa51:
    jsl sub_02fd84
    rep #$20
.a16
    stz $15af
    jsl sub_03dbd0
    jsr sub_1ffd54
    sep #$20
.a8
    lda $120a
    bit #$20
    beq loc_1ffa79
    lda $1f0f
    inc a
    and #$03
    sta $1f0f
    lda #$11
    jsl sub_03b7f9

loc_1ffa79:
    jsr sub_1ffdac
.a16
    rep #$20
    lda $15bb
    cmp #$0010
    bcc loc_1ffa51
    sep #$20
.a8
    lda $120a
    bit #$10
    beq loc_1ffa51
    lda #$10
    jsl sub_03b7f9

loc_1ffa95:
    sep #$20
    lda $004211
    cli

loc_1ffa9c:
    jsl sub_02fd84
    jsr sub_1ffbff
.a16
    jsr sub_1ffd54
    jsr sub_1ffdac
    sep #$20
.a8
    lda $14d6
    ora #$60
    sta $14d6
    lda $120a
    bit #$20
    beq loc_1ffaca
    lda $7ea05a
    eor #$01
    sta $7ea05a
    lda #$11
    jsl sub_03b7f9

loc_1ffaca:
    lda $7ea05a
    beq loc_1ffae3
    lda $120a
    bit #$08
    beq loc_1ffae3
    lda #$00
    sta $7ea05a
    lda #$11
    jsl sub_03b7f9

loc_1ffae3:
    lda $7ea05a
    bne loc_1ffafc
    lda $120a
    bit #$04
    beq loc_1ffafc
    lda #$01
    sta $7ea05a
    lda #$11
    jsl sub_03b7f9

loc_1ffafc:
    lda $1209
    bit #$40
    beq loc_1ffb06
    brl loc_1ffa47

loc_1ffb06:
    lda $120a
    bit #$40
    beq loc_1ffb10
    brl loc_1ffa47

loc_1ffb10:
    lda $1209
    bit #$80
    bne loc_1ffb28
    lda $120a
    bit #$80
    bne loc_1ffb28
    lda $120a
    bit #$10
    bne loc_1ffb28
    brl loc_1ffa9c

loc_1ffb28:
    sep #$20
    lda #$10
    jsl sub_03b7f9
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$ff
    sta $18b2

loc_1ffb3d:
    jsl sub_02fd84
    jsr sub_1ffbff
.a16
    jsr sub_1ffd54
    sep #$20
.a8
    lda $18b2
    and #$ff
    bne loc_1ffb3d
    stz $1f0d
    lda $7ea05a
    beq loc_1ffb5c
    brl loc_1ffbfd

loc_1ffb5c:
    jsl sub_02e266
    sep #$20
    rep #$10
    lda #$0d
    ldx #$6dc0
    sta $1ff4
    stx $16fd
    jsl sub_02e2cc
    sep #$20
    lda #$01
    sta $16ec
    stz $15bb
    stz $15bc

loc_1ffb80:
    jsl sub_02fd84
    jsl $02d956
    jsl sub_03ea26
    rep #$20
.a16
    lda $15bb
    cmp #$0014
    bcc loc_1ffb80
    sep #$20
.a8
    lda $1fd2
    cmp #$0a
    beq loc_1ffbe5
    lda $14d1
    and #$08
    beq loc_1ffbad
    lda $14d7
    bit #$80
    bne loc_1ffb80

loc_1ffbad:
    lda $120a
    bit #$10
    beq loc_1ffb80
    sep #$20
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$ff
    sta $18b2

loc_1ffbc3:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda $18b2
    and #$ff
    bne loc_1ffbc3
    jsl sub_02e266
    sep #$20
    lda #$01
    sta $7ea05a
    sta $1fdf
    bra loc_1ffbf6

loc_1ffbe5:
    jsl sub_02e266
    sep #$20
    lda #$00
    sta $7ea05a
    lda #$01
    sta $1fdf

loc_1ffbf6:
    stz $1fd2
    plp
.i8
    jmp sub_1ff963

loc_1ffbfd:
.i16
    plp
.i8
    rtl

sub_1ffbff:
.i16
    rep #$30
.a16
    ldx #$0000
    stx $15af
    ldx #$0000
    lda $7ea05a
    beq loc_1ffc13
    ldx #$0078

loc_1ffc13:
    ldy $15af
    lda #$97a8
    sta $14c5

loc_1ffc1c:
    lda $14c5
    sta $1261,y
    lda $1ffc64,x
    clc
    adc #$3080
    sta $1263,y
    iny
    iny
    iny
    iny
    inx
    inx
    lda $14c5
    clc
    adc #$0008
    sta $14c5
    and #$00ff
    cmp #$00f8
    bne loc_1ffc1c
    lda $14c5
    and #$ff00
    clc
    adc #$0800
    cmp #$c700
    beq loc_1ffc5c
    ora #$00a8
    sta $14c5
    bra loc_1ffc1c

loc_1ffc5c:
    sty $15af
    jsl sub_03dbd0
    rts
    .db $00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00
    .db $01,$00,$00,$40,$02,$00,$20,$00,$04,$00,$05,$00,$06,$00,$07,$00
    .db $08,$00,$09,$00,$0a,$00,$02,$40,$02,$00,$20,$80,$0b,$00,$0c,$00
    .db $0d,$00,$0e,$00,$0f,$00,$10,$00,$11,$00,$02,$40,$02,$00,$03,$00
    .db $12,$00,$13,$00,$14,$00,$15,$00,$16,$00,$17,$00,$18,$00,$02,$40
    .db $02,$00,$03,$00,$19,$00,$1a,$00,$1b,$00,$1c,$00,$1d,$00,$1e,$00
    .db $1f,$00,$02,$40,$00,$80,$01,$80,$01,$80,$01,$80,$01,$80,$01,$80
    .db $01,$80,$01,$80,$01,$80,$00,$c0,$00,$00,$01,$00,$01,$00,$01,$00
    .db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$40,$02,$00,$03,$00
    .db $04,$00,$05,$00,$06,$00,$07,$00,$08,$00,$09,$00,$0a,$00,$02,$40
    .db $02,$00,$03,$00,$0b,$00,$0c,$00,$0d,$00,$0e,$00,$0f,$00,$10,$00
    .db $11,$00,$02,$40,$02,$00,$20,$00,$12,$00,$13,$00,$14,$00,$15,$00
    .db $16,$00,$17,$00,$18,$00,$02,$40,$02,$00,$20,$80,$19,$00,$1a,$00
    .db $1b,$00,$1c,$00,$1d,$00,$1e,$00,$1f,$00,$02,$40,$00,$80,$01,$80
    .db $01,$80,$01,$80,$01,$80,$01,$80,$01,$80,$01,$80,$01,$80,$00,$c0

sub_1ffd54:
    jsl $02d956

loc_1ffd58:
.a8
    lda $00
    bne loc_1ffd58
    sep #$20
    rep #$10
    ldx $16ab
    cpx #$0039
    bne loc_1ffd73
    lda #$28
    sta $1fda
    stz $16ab
    stz $16ac

loc_1ffd73:
    lda #$03
    sta $15ad
    ldx $1238
    lda $15,x
    sta $7e
    lda $12,x
    asl a
    sta $15a6
    lda $13,x
    sta $15a7
    jsl sub_1fc41e
    rep #$20
.a16
    lda $1fd4
    clc
    adc $02
    sta $1fd4
    lda $1fd6
    clc
    adc $08
    sta $1fd6
    lda $1fd8
    clc
    adc $90
    sta $1fd8
    rts

sub_1ffdac:
.a8
    sep #$20
    rep #$10
    lda $1f0f
    cmp #$01
    beq loc_1ffdce
    cmp #$02
    beq loc_1ffddd
    cmp #$03
    beq loc_1ffdec
    rep #$20
.a16
    lda #$0000
    sta $1f35
    lda #$0000
    sta $1f37
    rts

loc_1ffdce:
.a8
    rep #$20
.a16
    lda #$0000
    sta $1f35
    lda #$0100
    sta $1f37
    rts

loc_1ffddd:
.a8
    rep #$20
.a16
    lda #$0100
    sta $1f35
    lda #$0000
    sta $1f37
    rts

loc_1ffdec:
.a8
    rep #$20
.a16
    lda #$0100
    sta $1f35
    lda #$0100
    sta $1f37
    rts

sub_1ffdfb:
    php
    sep #$20
.a8
    rep #$10
    ldx #$0060

loc_1ffe03:
    lda $1ffe1e,x
    sta $000101,x
    dex
    bpl loc_1ffe03
    ldx #$59c1

loc_1ffe11:
    lda $028000,x
    sta sub_7e3193,x
    dex
    bpl loc_1ffe11
    plp
.a16
    rtl

.base $000101
    .db $5c,$ee,$bd,$1f,$5c,$ee,$bd,$1f,$82,$2c,$00

sub_00010c:
.a8
.i8
    nop
    rep #$30
.a16
.i16
    pha
    lda $003030
    bmi loc_000136
    phb
    sei
    phx
    phy
    sep #$30
.a8
.i8
    lda #$00
    pha
    plb
    lda $1260
    ora #$18
    sta GSU_SCMR
    jsl sub_7e3193
    sep #$20
    inc $1200
    lda TIMEUP
    bra loc_00015b

loc_000136:
.a16
.i16
    pla
    rti
    .db $c2,$30,$48,$8b,$da,$5a,$e2,$20,$a9,$00,$48,$ab,$ad,$60,$12,$8d
    .db $3a,$30,$22,$db,$bf,$1f,$ad,$60,$12,$09,$18,$8d,$3a,$30,$e2,$20
    .db $ad,$10,$42

loc_00015b:
.a8
.i8
    rep #$30
.a16
.i16
    ply
    plx
    plb
    pla
    rti
.endbase

    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff
