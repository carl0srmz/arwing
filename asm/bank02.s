.rombank $02

.base $7e3193

sub_7e3193:
.cpu
.a8
.i8
    ldx $00
    jmp (tbl_7e3198,x)

tbl_7e3198:
    .db $f4,$3a,$fd,$3a,$46,$3b,$aa,$3b,$10,$35,$31,$38,$3a,$38,$43,$38
    .db $b2,$32,$08,$33,$ba,$33,$5f,$33,$df,$38,$ea,$39,$39,$3a,$98,$3a
    .db $db,$39,$ea,$33,$c0,$31,$30,$32

loc_7e31c0:
    rep #$10
.i16
    lda #$0a
    sta $120e
    sta HDMAEN
    lda #$01
    sta BGMODE
    stz $18c2
    lda #$13
    sta TM
    lda #$74
    sta BG3SC
    lda #$07
    sta BG34NBA
    stz BG2VOFS
    stz BG2VOFS
    stz $18b8
    stz $1f0e
    stz $1f0b
    stz $16a2
    lda #$01
    sta $1897
    jsl sub_02f492
    rep #$20
.a16
    lda #$8faa
    sta $700050
    sep #$20
.a8
    rep #$10
    rep #$20
.a16
    lda #$0080
    sta $7001b0
    stz $1eeb
    stz $1f09
    stz $169e
    lda #$0000
    sta $7ea05c
    sep #$20
.a8
    stz $1fc6
    stz $1ef1
    stz $1fe4
    stz $00
    rtl

loc_7e3230:
.i8
    rep #$10
.i16
    lda #$0a
    sta $120e
    sta HDMAEN
    lda #$02
    sta BGMODE
    stz $18c2
    lda #$13
    sta TM
    stz BG3SC
    stz BG3HOFS
    stz BG3HOFS
    stz BG3VOFS
    stz BG3VOFS
    lda #$2f
    sta BG3SC
    lda #$e0
    sta BG3HOFS
    stz BG3VOFS
    stz BG2VOFS
    stz BG2VOFS
    stz $18b8
    stz $1f0e
    stz $1f0b
    stz $16a2
    lda #$01
    sta $1897
    jsl sub_02f492
    rep #$20
.a16
    lda #$8faa
    sta $700050
    sep #$20
.a8
    rep #$10
    rep #$20
.a16
    lda #$0080
    sta $7001b0
    stz $1eeb
    stz $1f09
    stz $169e
    lda #$0000
    sta $7ea05c
    sep #$20
.a8
    stz $1fe4
    stz $1fc6
    stz $1ef1
    stz $00
    rtl

loc_7e32b2:
.i8
    rep #$10
.i16
    lda #$22
    sta BBAD0
    lda #$00
    sta CGADD
    ldx $1892
    stx A1TL0
    lda $1894
    sta A1B0
    ldx $1895
    stx DASL0
    stz DMAP0
    lda #$01
    sta MDMAEN
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx $188a
    stx VMADDL
    ldx #$2800
    stx A1TL0
    lda #$70
    sta A1B0
    ldx $188c
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    inc $00
    inc $00
    rtl

loc_7e3308:
.i8
    rep #$10
.i16
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx $188e
    stx VMADDL
    ldx #$4000
    stx A1TL0
    lda #$70
    sta A1B0
    ldx $1890
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$22
    sta BBAD0
    lda #$70
    sta CGADD
    rep #$20
.a16
    lda #$857e
    sta A1TL0
    sep #$20
.a8
    lda #$7e
    sta A1B0
    ldx #$0020
    stx DASL0
    stz DMAP0
    lda #$01
    sta MDMAEN
    stz $00
    rtl

loc_7e335f:
.i8
    rep #$10
.i16
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx $188a
    stx VMADDL
    ldx #$2800
    stx A1TL0
    lda #$70
    sta A1B0
    ldx $188c
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx $188e
    stx VMADDL
    ldx #$4000
    stx A1TL0
    lda #$70
    sta A1B0
    ldx $1890
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    stz $00
    rtl

sub_7e33ba:
    rep #$10
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx $188a
    stx VMADDL
    ldx #$2800
    stx A1TL0
    lda #$70
    sta A1B0
    ldx $188c
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    stz $00
    rtl

loc_7e33ea:
.i8
    lda $1fe5
    bne loc_7e33f2
    brl loc_7e34f6

loc_7e33f2:
    dec a
    bne loc_7e33f8
    brl loc_7e34ba

loc_7e33f8:
    dec a
    bne loc_7e33fe
    brl loc_7e348b

loc_7e33fe:
    dec a
    bne loc_7e3404
    brl loc_7e345c

loc_7e3404:
    rep #$10
.i16
    ldx $4c
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$2c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$4000
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    rep #$20
.a16
    lda #$0000
    cmp $4a
    beq loc_7e3442
    sta $4a
    lda #$3000
    sta $4c
    bra loc_7e3449

loc_7e3442:
    sta $4c
    lda #$3000
    sta $4a

loc_7e3449:
    sep #$20
.a8
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    stz $1fe5
    brl loc_7e34f6

loc_7e345c:
.i8
    rep #$10
.i16
    ldx #$6020
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD7
    stx VMADDL
    ldx #$4c00
    stx A1TL7
    lda #$70
    sta A1B7
    ldx #$1000
    stx DASL7
    lda #$01
    sta DMAP7
    lda #$80
    sta MDMAEN
    bra loc_7e34e9

loc_7e348b:
.i8
    rep #$10
.i16
    ldx #$5820
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD7
    stx VMADDL
    ldx #$3c00
    stx A1TL7
    lda #$70
    sta A1B7
    ldx #$1000
    stx DASL7
    lda #$01
    sta DMAP7
    lda #$80
    sta MDMAEN
    bra loc_7e34e9

loc_7e34ba:
.i8
    rep #$10
.i16
    ldx #$5020
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD7
    stx VMADDL
    ldx #$2c00
    stx A1TL7
    lda #$70
    sta A1B7
    ldx #$1000
    stx DASL7
    lda #$01
    sta DMAP7
    lda #$80
    sta MDMAEN
    bra loc_7e34e9

loc_7e34e9:
    lda $1fe5
    inc a
    cmp #$04
    bne loc_7e34f3
    lda #$00

loc_7e34f3:
    sta $1fe5

loc_7e34f6:
.i8
    lda $7ef0c6
    cmp #$ff
    beq loc_7e350c
    and #$1f
    beq loc_7e350c
    dec a
    ora #$e0
    sta COLDATA
    sta $7ef0c6

loc_7e350c:
    jsr sub_7e4021
    rtl

loc_7e3510:
    sep #$20
    lda #$01
    sta $fd
    rep #$10
.i16
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0070
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1fe5
    bne loc_7e3546
    brl loc_7e3631

loc_7e3546:
    dec a
    bne loc_7e354c
    brl loc_7e358b

loc_7e354c:
    dec a
    beq loc_7e35bb
    dec a
    bne loc_7e3555
    brl loc_7e35f0

loc_7e3555:
    rep #$20
.a16
    lda $4c
    clc
    adc #$1800
    tax
    sep #$20
.a8
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$5c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$1000
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    brl loc_7e3623

loc_7e358b:
    sep #$20
    rep #$10
    ldx $4c
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$2c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$1000
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    bra loc_7e3623

loc_7e35bb:
    rep #$20
.a16
    lda $4c
    clc
    adc #$0800
    tax
    sep #$20
.a8
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$3c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$1000
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    bra loc_7e3623

loc_7e35f0:
    rep #$20
.a16
    lda $4c
    clc
    adc #$1000
    tax
    sep #$20
.a8
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$4c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$1000
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN

loc_7e3623:
    lda $1fe5
    inc a
    sta $1fe5
    cmp #$05
    bne loc_7e3631
    stz $1fe5

loc_7e3631:
    lda $15c2
    pha
    ldx #$0010
    lda $0034
    bit #$01
    beq loc_7e3667
    clc
    adc #$40
    sta $0034
    rol a
    bcc loc_7e3667
    rep #$20
.a16
    stz $1261,x
    stz $1265,x
    stz $1269,x
    stz $126d,x
    stz $1263,x
    stz $1267,x
    stz $126b,x
    stz $126f,x
    sep #$20
.a8
    brl loc_7e371a

loc_7e3667:
    lda $0033
    cmp $0039
    bmi loc_7e36ae
    lda $0032
    sec
    sbc $0038
    beq loc_7e36a4
    bcc loc_7e3690
    sta $15c2
    lda $0033
    sec
    sbc $0039
    beq loc_7e368b
    cmp $15c2
    bne loc_7e36a4

loc_7e368b:
    dec $0032
    bra loc_7e36a4

loc_7e3690:
    sta $15c2
    lda $0039
    sec
    sbc $0033
    beq loc_7e36a1
    cmp $15c2
    bne loc_7e36a4

loc_7e36a1:
    inc $0032

loc_7e36a4:
    lda $0033
    cmp $0039
    beq loc_7e36c1
    bpl loc_7e36be

loc_7e36ae:
    inc $0033
    lda $0032
    cmp $0038
    beq loc_7e36c1
    inc $0032
    bra loc_7e36c1

loc_7e36be:
    dec $0033

loc_7e36c1:
    lda $0032
    clc
    adc #$08
    sta $1261,x
    sta $1269,x
    clc
    adc #$08
    sta $1265,x
    sta $126d,x
    lda $0033
    clc
    adc #$08
    sta $1262,x
    sta $1266,x
    clc
    adc #$08
    sta $126a,x
    sta $126e,x
    lda $0036
    beq loc_7e36f7
    dec a
    beq loc_7e36fb
    lda #$0d
    bra loc_7e36fd

loc_7e36f7:
    lda #$09
    bra loc_7e36fd

loc_7e36fb:
    lda #$05

loc_7e36fd:
    sta $1263,x
    inc a
    sta $1267,x
    inc a
    sta $126b,x
    inc a
    sta $126f,x
    lda #$3e
    sta $1264,x
    sta $1268,x
    sta $126c,x
    sta $1270,x

loc_7e371a:
    lda $16ed
    bne loc_7e3722
    brl loc_7e379e

loc_7e3722:
    ldx #$0000
    lda $16e4
    sec
    sbc #$0f
    sta $1261,x
    sta $1265,x
    clc
    adc #$08
    sta $1269,x
    sta $126d,x
    lda $16e6
    sta $1262,x
    sta $126a,x
    clc
    adc #$08
    sta $1266,x
    sta $126e,x
    lda $1263,x
    cmp #$11
    bne loc_7e3757
    lda #$15
    bra loc_7e3759

loc_7e3757:
    lda #$11

loc_7e3759:
    sta $1263,x
    inc a
    sta $126b,x
    inc a
    sta $1267,x
    inc a
    sta $126f,x
    lda #$1e
    sta $1264,x
    sta $1268,x
    sta $126c,x
    sta $1270,x
    dec $16e4
    dec $16e4
    inc $16e6
    inc $16e6
    lda $16e4
    cmp #$12
    bcc loc_7e3793
    lda $16e6
    cmp #$e0
    bcs loc_7e3793
    brl loc_7e3829

loc_7e3793:
    stz $16ed
    lda #$1e
    sta $16eb
    brl loc_7e3829

loc_7e379e:
    rep #$20
.a16
    lda $02
    pha
    lda $90
    pha
    lda $04
    pha
    lda $15c2
    pha
    sep #$20
.a8
    stz $02
    lda #$7d
    sta $90
    lda $16eb
    jsr sub_7e579d
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e37c9
    ora #$ff00
    bra loc_7e37cc

loc_7e37c9:
    and #$00ff

loc_7e37cc:
    clc
    adc #$0080
    sta $16e4
    lda $15c2
    bit #$0080
    beq loc_7e37e0
    ora #$ff00
    bra loc_7e37e3

loc_7e37e0:
    and #$00ff

loc_7e37e3:
    clc
    adc #$0064
    sta $16e6
    lda #$00c8
    sta $16e8
    lda $16ea
    clc
    adc #$0010
    sta $16ea
    sep #$20
.a8
    lda $16eb
    cmp #$a0
    bne loc_7e3818
    lda #$01
    sta $16ed
    lda #$ff
    sta $16e4
    lda #$00
    sta $16e6
    stz $16e5
    stz $16e7

loc_7e3818:
    rep #$20
.a16
    pla
    sta $15c2
    pla
    sta $04
    pla
    sta $90
    pla
    sta $02
    sep #$20

loc_7e3829:
.a8
    pla
    sta $15c2
    jsr sub_7e4021
    rtl

loc_7e3831:
.i8
    rep #$10
.i16
    lda #$0c
    sta $00
    brl loc_7e3b03

loc_7e383a:
.i8
    rep #$10
.i16
    lda #$0e
    sta $00
    brl loc_7e3b57

loc_7e3843:
.i8
    rep #$10

loc_7e3845:
.i16
    sep #$20
    lda SLHV
    lda OPHCT
    xba
    lda OPHCT
    xba
    rep #$20
.a16
    and #$01ff
    cmp #$0032
    bcc loc_7e3845
    cmp #$0046
    bcs loc_7e3845
    sep #$20
.a8
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$012c
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    stz $00
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    ldx $4a
    ldy $4c
    stx $4c
    sty $4a
    lda #$80
    sta VMAIN
    rep #$20
.a16
    lda #$731d
    sta VMADDL
    lda $1898
    clc
    adc #$3528
    sta VMDATAL
    rep #$20
    lda JOY1L
    pha
    eor $1201
    and JOY1L
    sta $1209
    lda JOY2L
    pha
    eor $1205
    and JOY2L
    sta $120b
    pla
    sta $1205
    pla
    sta $1201
    sep #$20
.a8
    jsr sub_7e4021
    rtl

loc_7e38df:
.i8
    rep #$10

loc_7e38e1:
.i16
    sep #$20
    lda SLHV
    lda OPHCT
    xba
    lda OPHCT
    xba
    rep #$20
.a16
    and #$01ff
    cmp #$0032
    bcc loc_7e38e1
    cmp #$0046
    bcs loc_7e38e1
    sep #$20
.a8
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0148
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$13
    sta TM
    stz $00
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    ldx $4a
    ldy $4c
    stx $4c
    sty $4a
    sep #$20
    lda $1f35
    sta BG2VOFS
    lda $1f36
    sta BG2VOFS
    lda $1f37
    sta BG2HOFS
    lda $1f38
    sta BG2HOFS
    stz CGADSUB
    stz COLDATA
    stz WH0
    stz WH1
    jsr sub_7e3e35
    rep #$20
.a16
    lda $1fda
    and #$00ff
    beq loc_7e39be
    lda $15bb
    and #$0001
    bne loc_7e397f
    stz $16c7
    bra loc_7e39a8

loc_7e397f:
    lda $1fda
    and #$00ff
    cmp #$001f
    beq loc_7e398f
    bcc loc_7e398f
    lda #$001f

loc_7e398f:
    sta $16c7
    asl a
    asl a
    asl a
    asl a
    asl a
    sta $1fdb
    asl a
    asl a
    asl a
    asl a
    asl a
    ora $1fdb
    ora $16c7
    sta $16c7

loc_7e39a8:
    sep #$20
.a8
    lda #$03
    sta CGADD
    lda $16c7
    sta CGDATA
    lda $16c8
    sta CGDATA
    dec $1fda

loc_7e39be:
    rep #$20
.a16
    lda JOY1L
    eor $1ffe
    and JOY1L
    sta $1209
    lda JOY1L
    sta $1ffe
    sep #$20
.a8
    jsr sub_7e3dab
    jsr sub_7e4021
    rtl

loc_7e39db:
.i8
    jsr sub_7e3ef7
    jsr sub_7e3dab
    lda #$01
    sta $18ac
    jsr sub_7e4021
    rtl

loc_7e39ea:
    rep #$10
.i16
    lda #$1c
    sta $00
    ldx $4a
    lda $1260
    and #$f7
    sta GSU_SCMR
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$2c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$2a00
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1260
    ora #$08
    sta GSU_SCMR
    jsr sub_7e3ef7
    jsr sub_7e3dab
    lda #$01
    sta $18bb
    jsr sub_7e4021
    rtl

loc_7e3a39:
.i8
    rep #$10
.i16
    lda #$1e
    sta $00
    rep #$20
.a16
    lda $4a
    clc
    adc #$1500
    tax
    sep #$20
.a8
    lda $1260
    and #$f7
    sta GSU_SCMR
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$5600
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$2a00
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1260
    ora #$08
    sta GSU_SCMR
    jsr sub_7e3ef7
    jsr sub_7e3dab
    lda #$02
    sta $18bb
    lda $45
    lsr a
    lsr a
    sta GSU_SCBR
    jsr sub_7e4021
    rtl

loc_7e3a98:
.i8
    lda $1f10
    bne loc_7e3a9e
    rtl

loc_7e3a9e:
    rep #$10
.i16
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    ldx $4a
    ldy $4c
    stx $4c
    sty $4a
    jsr sub_7e3fa3
    jsr sub_7e414b
    sep #$20
    rep #$10
    jsr sub_7e409f
    jsr sub_7e3ef7
    jsr sub_7e3dab
    rep #$20
.a16
    lda JOY1L
    pha
    eor $1201
    and JOY1L
    sta $1209
    lda JOY2L
    pha
    eor $1205
    and JOY2L
    sta $120b
    pla
    sta $1205
    pla
    sta $1201
    sep #$20
.a8
    jsr sub_7e4021
    lda #$20
    sta $00
    rtl

loc_7e3af4:
.i8
    lda #$01
    sta $18ac
    jsr sub_7e4021
    rtl

loc_7e3afd:
    rep #$10
.i16
    lda #$04
    sta $00

loc_7e3b03:
    ldx $4a
    lda $1260
    and #$f7
    sta GSU_SCMR
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$2c00
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$2a00
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1260
    ora #$08
    sta GSU_SCMR
    lda #$01
    sta $18bb
    jsr sub_7e4021
    rtl

loc_7e3b46:
.i8
    rep #$10
.i16
    lda $1f0d
    beq loc_7e3b53
    lda #$18
    sta $00
    bra loc_7e3b57

loc_7e3b53:
    lda #$06
    sta $00

loc_7e3b57:
    rep #$20
.a16
    lda $4a
    clc
    adc #$1500
    tax
    sep #$20
.a8
    lda $1260
    and #$f7
    sta GSU_SCMR
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    stx VMADDL
    ldx #$5600
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$2a00
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1260
    ora #$08
    sta GSU_SCMR
    lda #$02
    sta $18bb
    lda $45
    lsr a
    lsr a
    sta GSU_SCBR
    jsr sub_7e4021
    rtl

loc_7e3baa:
.i8
    lda $1f10
    bne loc_7e3bb0
    rtl

loc_7e3bb0:
    rep #$10

loc_7e3bb2:
.i16
    sep #$20
    lda SLHV
    lda OPHCT
    xba
    lda OPHCT
    xba
    rep #$20
.a16
    and #$01ff
    cmp #$0032
    bcc loc_7e3bb2
    cmp #$0046
    bcs loc_7e3bb2
    sep #$20
.a8
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0148
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx #$2fa0
    stx VMADDL
    ldx #$18cd
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0040
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$22
    sta BBAD0
    lda #$00
    sta CGADD
    ldx #$1789
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0100
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda $1f0e
    beq loc_7e3c77
    jsr sub_7e408b
    cmp #$33
    bcs loc_7e3c77
    lda #$22
    sta BBAD0
    lda #$00
    sta CGADD
    ldx #$8a4d
    stx A1TL0
    lda #$7e
    sta A1B0
    ldx #$0040
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN

loc_7e3c77:
    lda $1f0b
    beq loc_7e3ca8
    jsr sub_7e408b
    cmp #$05
    bcs loc_7e3ca8
    lda #$22
    sta BBAD0
    lda #$50
    sta CGADD
    ldx #$8ac9
    stx A1TL0
    lda #$7e
    sta A1B0
    ldx #$0020
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN

loc_7e3ca8:
    lda #$24
    sta CGADD
    lda $16cd
    beq loc_7e3cbe
    lda #$e0
    sta CGDATA
    lda #$7e
    sta CGDATA
    bra loc_7e3cc6

loc_7e3cbe:
    lda #$1f
    sta CGDATA
    stz CGDATA

loc_7e3cc6:
    lda $18b8
    beq loc_7e3cd7
    lda $18b9
    sta BG3HOFS
    lda $18ba
    sta BG3HOFS

loc_7e3cd7:
    ldx $18b4
    ldy $18b6
    stx $18b6
    sty $18b4
    sty A1TL2
    jsr sub_7e414b
    jsr sub_7e3d36
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    jsr sub_7e409f
    jsr sub_7e4021
    rep #$20
.a16
    lda JOY1L
    eor $1201
    and JOY1L
    sta $1209
    jsr sub_7e3e35
.a8
    sep #$20
    lda $1206
    sta $1205
    lda $1208
    sta $1207
    lda JOY2L
    sta $1208
    lda JOY2H
    sta $1206
    jsr sub_7e3dab
    ldx $4a
    ldy $4c
    stx $4c
    sty $4a
    stz $00
    rtl

sub_7e3d36:
    sep #$20
    lda $1fdd
    beq loc_7e3d56
    lda $1f35
    sta BG2VOFS
    lda $1f36
    sta BG2VOFS
    lda $1f37
    sta BG2HOFS
    lda $1f38
    sta BG2HOFS
    rts

loc_7e3d56:
    lda $16c9
    beq loc_7e3daa
    rep #$20
.a16
    lda $16c5
    lsr a
    lsr a
    and #$003e
    tax
    lda $7e8a0d,x
    tay
    sep #$20
.a8
    phb
    lda #$7e
    pha
    plb
    ldx #$0000

loc_7e3d75:
    lda $0000,y
    bpl loc_7e3d90
    and #$7f
    sta $7e4bfa,x
    inx
    lda #$18
    sta $7e4bfa,x
    inx
    lda #$01
    sta $7e4bfa,x
    bra loc_7e3da2

loc_7e3d90:
    sta $7e4bfa,x
    inx
    lda #$18
    sta $7e4bfa,x
    inx
    lda #$00
    sta $7e4bfa,x

loc_7e3da2:
    inx
    iny
    cpx #$02a0
    bne loc_7e3d75
    plb

loc_7e3daa:
    rts

sub_7e3dab:
    lda $18b2
    bne loc_7e3db3
    brl loc_7e3e34

loc_7e3db3:
    bpl loc_7e3dfe
    cmp #$fe
    beq loc_7e3df4
    cmp #$fd
    beq loc_7e3dec

loc_7e3dbd:
    lda $18b3

loc_7e3dc0:
    beq loc_7e3dd6
    dec a
    beq loc_7e3dd6
    sta $7e45f4
    sta $7e45f6
    sta $7e45f8
    sta $18b3
    bra loc_7e3e34

loc_7e3dd6:
    lda #$80
    sta $7e45f4
    sta $7e45f6
    sta $7e45f8
    stz $18b2
    stz $18b3
    bra loc_7e3e34

loc_7e3dec:
    lda $15bb
    and #$01
    beq loc_7e3dbd
    rts

loc_7e3df4:
    lda $18b3
    beq loc_7e3dd6
    dec a
    beq loc_7e3dd6
    bra loc_7e3dc0

loc_7e3dfe:
    cmp #$02
    beq loc_7e3e25
    lda $18b3

loc_7e3e05:
    cmp #$0f
    beq loc_7e3e1b
    inc a
    sta $7e45f4
    sta $7e45f6
    sta $7e45f8
    sta $18b3
    bra loc_7e3e34

loc_7e3e1b:
    stz $18b2
    lda #$0f
    sta $18b3
    bra loc_7e3e34

loc_7e3e25:
    lda $18b3
    cmp #$0f
    beq loc_7e3e1b
    inc a
    cmp #$0f
    beq loc_7e3e1b
    inc a
    bra loc_7e3e05

loc_7e3e34:
    rts

sub_7e3e35:
    sep #$20
    lda $1202
    sta $1201
    lda $1204
    sta $1203
    lda $1f0f
    and #$03
    asl a
    xba
    lda #$00
    xba
    tax
    jmp (tbl_7e3e51,x)

tbl_7e3e51:
    .db $59,$3e,$66,$3e,$89,$3e,$ae,$3e

loc_7e3e59:
    lda JOY1L
    sta $1204
    lda JOY1H
    sta $1202
    rts

loc_7e3e66:
    lda JOY1L
    sta $1204
    lda JOY1H
    and #$c0
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    xba
    lda #$00
    xba
    tax
    lda JOY1H
    and #$3f
    ora $7e3eef,x
    sta $1202
    rts

loc_7e3e89:
    lda JOY1L
    sta $1204
    lda JOY1H
    and #$0c
    lsr a
    lsr a
    xba
    lda #$00
    xba
    tax
    lda $7e3ef3,x
    sta $16c7
    lda JOY1H
    and #$f3
    ora $16c7
    sta $1202
    rts

loc_7e3eae:
    lda JOY1L
    sta $1204
    lda JOY1H
    and #$0c
    lsr a
    lsr a
    xba
    lda #$00
    xba
    tax
    lda $7e3ef3,x
    sta $16c7
    lda JOY1H
    and #$33
    ora $16c7
    pha
    lda JOY1H
    and #$c0
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    xba
    lda #$00
    xba
    tax
    lda $7e3eef,x
    sta $16c7
    pla
    ora $16c7
    sta $1202
    rts
    .db $00,$80,$40,$c0,$00,$08,$04,$0c

sub_7e3ef7:
.i8
    php
    sep #$20
    lda $1f2f
    sta BG1HOFS
    lda $1f30
    sta BG1HOFS
    lda $1f2d
    sta BG1VOFS
    lda $1f2e
    sta BG1VOFS
    lda $1f2b
    sta BG2HOFS
    lda $1f2c
    sta BG2HOFS
    lda $1f29
    sta BG2VOFS
    lda $1f2a
    sta BG2VOFS
    lda $1f27
    sta BG3HOFS
    lda $1f28
    sta BG3HOFS
    lda $1f25
    sta BG3VOFS
    lda $1f26
    sta BG3VOFS
    rep #$30
.a16
.i16
    lda $1f2f
    ldx $1f3b
    ldy #$0002
    jsr sub_7e4009
    sta $1f2f
    lda $1f2d
    ldx $1f39
    ldy #$0001
    jsr sub_7e4009
    sta $1f2d
    lda $1f2b
    ldx $1f37
    ldy #$0002
    jsr sub_7e4009
    sta $1f2b
    lda $1f29
    ldx $1f35
    ldy #$0001
    jsr sub_7e4009
    sta $1f29
    lda $1f27
    ldx $1f33
    ldy #$0004
    jsr sub_7e4009
    sta $1f27
    lda $1f25
    ldx $1f31
    ldy #$0002
    jsr sub_7e4009
    sta $1f25
    plp
    rts
    .db $08,$28,$60

sub_7e3fa3:
.a8
    php
    sep #$20
    rep #$10
    lda $1f13
    bit #$10
    bne loc_7e3fb1
    plp
    rts

loc_7e3fb1:
    ldx $1f1d
    ldy $1f1f
    sty VMADDL

loc_7e3fba:
    lda $7e9f55,x
    inx
    cmp #$00
    beq loc_7e3fff
    cmp #$01
    bne loc_7e3fdb
    rep #$20
.a16
    lda $7e9f55,x
    inx
    inx
    clc
    adc #$7000
    sta VMADDL
    tay
    sep #$20
.a8
    bra loc_7e3fba

loc_7e3fdb:
    rep #$20
.a16
    and #$00ff
    phx
    tax
    lda $7e8a6d,x
    and #$00ff
    plx
    ora #$2000
    clc
    adc #$0100
    sta VMDATAL
    sep #$20
.a8
    iny
    sty $1f1f
    stx $1f1d
    plp
    rts

loc_7e3fff:
    lda $1f13
    and #$ef
    sta $1f13
    plp
    rts

sub_7e4009:
.a16
    stx $16c7
    cmp $16c7
    sty $16c7
    beq loc_7e4020
    bmi loc_7e401c
    sec
    sbc $16c7
    bra loc_7e4020

loc_7e401c:
    clc
    adc $16c7

loc_7e4020:
    rts

sub_7e4021:
.a8
.i8
    php
    sep #$30
    lda $1f46
    beq loc_7e402e
    dec a
    beq loc_7e4039
    bra loc_7e4047

loc_7e402e:
    lda $1f47
    sta APUIO0
    inc $1f46
    bra loc_7e4047

loc_7e4039:
    lda APUIO0
    cmp $1f47
    bne loc_7e402e
    stz APUIO0
    inc $1f46

loc_7e4047:
    lda $1f51
    beq loc_7e4057
    cmp APUIO3
    bne loc_7e4078
    stz $1f51
    stz APUIO3

loc_7e4057:
    lda $1f52
    bne loc_7e407a
    ldx $1f4f
    cpx $1f4d
    beq loc_7e4076
    lda $1f53,x
    sta APUIO3
    sta $1f51
    lda $1f4f
    inc a
    and #$0f
    sta $1f4f

loc_7e4076:
    plp
    rts

loc_7e4078:
    plp
.i16
    rts

loc_7e407a:
.i8
    sta APUIO3
    sta $1f51
    stz $1f4d
    stz $1f4f
    stz $1f52
    plp
    rts

sub_7e408b:
.i16
    lda $ef
    clc
    sbc $f0
    sta $f0
    sbc $f1
    sta $f1
    sbc $f2
    sta $f2
    sbc $ef
    sta $ef
    rts

sub_7e409f:
    ldx $16a7
    beq loc_7e40fd
    cpx #$1481
    beq loc_7e4123
    lda $06,x
    sta CGADSUB
    lda $00,x
    beq loc_7e40b7
    sta COLDATA
    bra loc_7e40d2

loc_7e40b7:
    lda $01,x
    and #$1f
    ora #$20
    sta COLDATA
    lda $02,x
    and #$1f
    ora #$40
    sta COLDATA
    lda $03,x
    and #$1f
    ora #$80
    sta COLDATA

loc_7e40d2:
    lda $04,x
    sta TS
    lda $05,x
    bit #$30
    bne loc_7e40f3
    ora #$10
    sta CGWSEL
    lda #$80
    sta WOBJSEL
    lda #$10
    sta WH2
    lda #$f0
    sta WH3
    bra loc_7e4111

loc_7e40f3:
    sta CGWSEL
    lda #$20
    sta WOBJSEL
    bra loc_7e4111

loc_7e40fd:
    lda #$02
    sta CGWSEL
    lda #$50
    sta CGADSUB
    lda #$e0
    sta COLDATA
    lda #$07
    sta TS

loc_7e4111:
    stz W12SEL
    stz W34SEL
    stz WBGLOG
    lda #$0c
    sta WOBJLOG
    stz TMW
    rts

loc_7e4123:
    lda #$bb
    sta W12SEL
    lda #$bb
    sta W34SEL
    lda #$0b
    sta WOBJSEL
    lda $06,x
    sta WBGLOG
    and #$03
    sta WOBJLOG
    lda #$1f
    sta TMW
    stz CGADD
    stz CGDATA
    stz CGDATA
    rts

sub_7e414b:
    php
    rep #$20
.a16
    ldx $18a5
    lda $18a7
    stx $18a7
    sta $18a5
    sta A1TL3
    sep #$20
.a8
    lda $18a9
    eor #$01
    sta $18a9
    plp
    rts
    .incbin "data/010fd6-011d56.bin"

sub_7e4ee9:
    sta $003034
    phb
    lda #$00
    pha
    plb
    lda $1260
    ora #$18
    sta GSU_SCMR
    stx GSU_R15

loc_7e4efd:
    lda GSU_SFR
    and #$20
    bne loc_7e4efd
    lda $1260
    sta GSU_SCMR
    plb
    rtl
    .db $5c,$ee,$bd,$1f

sub_7e4f10:
.i8
    rep #$30
.a16
.i16
    lda $14c3
    sta $702b22
    lda $1f09
    sta $701a2a
    sep #$20
.a8
    lda #$01
    ldx #$ac1d
    sta GSU_PBR
    lda $1260
    ora #$18
    sta GSU_SCMR
    stx GSU_R15
    jsr sub_7e4f4c
    sep #$20

loc_7e4f3a:
    lda GSU_SFR
    and #$20
    bne loc_7e4f3a
    lda $1260
    sta GSU_SCMR
    jsl sub_02f4ff
    rtl

sub_7e4f4c:
    jsl sub_7e4f55
    rts
    .db $20,$ad,$4f,$6b

sub_7e4f55:
    phb
    php
    sep #$20
    rep #$10
    ldx $121d

loc_7e4f5e:
    lda $1d,x
    and #$80
    beq loc_7e4f68
    jml loc_7e4f6e

loc_7e4f68:
    lda #$01
    sta $2d,x
    bra loc_7e4f74

loc_7e4f6e:
    lda $1e,x
    ora #$02
    sta $1e,x

loc_7e4f74:
    lda $1d,x
    and #$7f
    sta $1d,x
    rep #$20
.a16
    lda #$0000
    sta $1b,x
    sep #$20
.a8
    txy
    ldx $00,y
    bne loc_7e4f5e
    sep #$20
    lda #$7e
    pha
    plb
    lda $1efb
    beq loc_7e4faa
    ldx #$0000

loc_7e4f96:
    phx
    jsr sub_7e4fad
    plx
    rep #$20
.a16
    txa
    clc
    adc #$000a
    tax
    sep #$20
.a8
    dec $1efb
    bne loc_7e4f96

loc_7e4faa:
    plp
    plb
    rtl

sub_7e4fad:
    stx $78
    ldy $2ec4,x
    tyx
    stx $76
    lda $1d,x
    and #$80
    beq loc_7e4fbe
    brl loc_7e52a3

loc_7e4fbe:
    ldy $04,x
    sty $1f03
    ldy $78
    stz $1ef9
    stz $f7
    rep #$20
.a16
    lda $2ec6,y
    bne loc_7e4fd4
    brl loc_7e52a6

loc_7e4fd4:
    tay
    sep #$20
.a8
    stz $1efa
    lda $0002,y
    beq loc_7e5009
    dec a
    sta $02
    lda $7e1ce7,x
    bpl loc_7e4fee
    and $02
    beq loc_7e5009
    bra loc_7e4ff5

loc_7e4fee:
    lda $02
    and $15bb
    beq loc_7e5009

loc_7e4ff5:
    rep #$20
.a16
    and #$007f
    sta $02
    tya
    ldy $02
    clc

loc_7e5000:
    adc #$0012
    dey
    bne loc_7e5000
    tay
    sep #$20

loc_7e5009:
.a8
    lda $0009,y
    sta $f6
    bit #$70
    bne loc_7e5015
    brl loc_7e525c

loc_7e5015:
    bit #$10
    beq loc_7e501c
    brl loc_7e51e3

loc_7e501c:
    bit #$20
    beq loc_7e5023
    brl loc_7e5167

loc_7e5023:
    bit #$40
    beq loc_7e502a
    brl loc_7e50eb

loc_7e502a:
    lda $0003,y
    sta $02
    sta $04
    lda $0005,y
    sta $08
    sta $0a
    lda $14,x
    beq loc_7e503f
    jsr sub_7e5ada

loc_7e503f:
    lda $0a
    sta $08
    lda $0007,y
    sta $90
    sta $15c2
    lda $12,x
    beq loc_7e5052
    jsr sub_7e593d

loc_7e5052:
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $13,x
    beq loc_7e5061
    jsr sub_7e579d

loc_7e5061:
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e506f
    ora #$ff00
    bra loc_7e5072

loc_7e506f:
    and #$00ff

loc_7e5072:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5088
    sty $f8
    tay
    lda $02

loc_7e5080:
    asl a
    dey
    bne loc_7e5080
    ldy $f8
    bra loc_7e508a

loc_7e5088:
    lda $02

loc_7e508a:
    clc
    adc $0c,x
    sta $6c
    lda $15c2
    bit #$0080
    beq loc_7e509c
    ora #$ff00
    bra loc_7e509f

loc_7e509c:
    and #$00ff

loc_7e509f:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e50b5
    sty $f8
    tay
    lda $02

loc_7e50ad:
    asl a
    dey
    bne loc_7e50ad
    ldy $f8
    bra loc_7e50b7

loc_7e50b5:
    lda $02

loc_7e50b7:
    clc
    adc $10,x
    sta $6e
    lda $0a
    bit #$0080
    beq loc_7e50c8
    ora #$ff00
    bra loc_7e50cb

loc_7e50c8:
    and #$00ff

loc_7e50cb:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e50e1
    sty $f8
    tay
    lda $02

loc_7e50d9:
    asl a
    dey
    bne loc_7e50d9
    ldy $f8
    bra loc_7e50e3

loc_7e50e1:
    lda $02

loc_7e50e3:
    clc
    adc $0e,x
    sta $74
    jmp loc_7e5276

loc_7e50eb:
.a8
    lda $0005,y
    sta $08
    sta $0a
    lda $0007,y
    sta $90
    sta $15c2
    lda $12,x
    beq loc_7e5101
    jsr sub_7e593d

loc_7e5101:
    rep #$20
.a16
    lda $0a
    bit #$0080
    beq loc_7e510f
    ora #$ff00
    bra loc_7e5112

loc_7e510f:
    and #$00ff

loc_7e5112:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5128
    sty $f8
    tay
    lda $02

loc_7e5120:
    asl a
    dey
    bne loc_7e5120
    ldy $f8
    bra loc_7e512a

loc_7e5128:
    lda $02

loc_7e512a:
    clc
    adc $0e,x
    sta $74
    lda $15c2
    bit #$0080
    beq loc_7e513c
    ora #$ff00
    bra loc_7e513f

loc_7e513c:
    and #$00ff

loc_7e513f:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5155
    sty $f8
    tay
    lda $02

loc_7e514d:
    asl a
    dey
    bne loc_7e514d
    ldy $f8
    bra loc_7e5157

loc_7e5155:
    lda $02

loc_7e5157:
    clc
    adc $10,x
    sta $6e
    lda $0003,y
    clc
    adc $0c,x
    sta $6c
    jmp loc_7e5276

loc_7e5167:
.a8
    lda $0003,y
    sta $02
    sta $04
    lda $0007,y
    sta $90
    sta $15c2
    lda $13,x
    beq loc_7e517d
    jsr sub_7e579d

loc_7e517d:
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e518b
    ora #$ff00
    bra loc_7e518e

loc_7e518b:
    and #$00ff

loc_7e518e:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e51a4
    sty $f8
    tay
    lda $02

loc_7e519c:
    asl a
    dey
    bne loc_7e519c
    ldy $f8
    bra loc_7e51a6

loc_7e51a4:
    lda $02

loc_7e51a6:
    clc
    adc $0c,x
    sta $6c
    lda $15c2
    bit #$0080
    beq loc_7e51b8
    ora #$ff00
    bra loc_7e51bb

loc_7e51b8:
    and #$00ff

loc_7e51bb:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e51d1
    sty $f8
    tay
    lda $02

loc_7e51c9:
    asl a
    dey
    bne loc_7e51c9
    ldy $f8
    bra loc_7e51d3

loc_7e51d1:
    lda $02

loc_7e51d3:
    clc
    adc $10,x
    sta $6e
    lda $0005,y
    clc
    adc $0e,x
    sta $74
    jmp loc_7e5276

loc_7e51e3:
.a8
    lda $0003,y
    sta $02
    sta $04
    lda $0005,y
    sta $08
    sta $0a
    lda $14,x
    beq loc_7e51f8
    jsr sub_7e5ada

loc_7e51f8:
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e5206
    ora #$ff00
    bra loc_7e5209

loc_7e5206:
    and #$00ff

loc_7e5209:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e521f
    sty $f8
    tay
    lda $02

loc_7e5217:
    asl a
    dey
    bne loc_7e5217
    ldy $f8
    bra loc_7e5221

loc_7e521f:
    lda $02

loc_7e5221:
    clc
    adc $0c,x
    sta $6c
    lda $0a
    bit #$0080
    beq loc_7e5232
    ora #$ff00
    bra loc_7e5235

loc_7e5232:
    and #$00ff

loc_7e5235:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e524b
    sty $f8
    tay
    lda $02

loc_7e5243:
    asl a
    dey
    bne loc_7e5243
    ldy $f8
    bra loc_7e524d

loc_7e524b:
    lda $02

loc_7e524d:
    clc
    adc $0e,x
    sta $74
    lda $0007,y
    clc
    adc $10,x
    sta $6e
    bra loc_7e5276

loc_7e525c:
.a8
    rep #$20
.a16
    lda $0003,y
    clc
    adc $0c,x
    sta $6c
    lda $0005,y
    clc
    adc $0e,x
    sta $74
    lda $0007,y
    clc
    adc $10,x
    sta $6e

loc_7e5276:
    lda $000a,y
    sta $1258
    lda $000c,y
    sta $125a
    lda $000e,y
    sta $125c
    phx
    phy
    sep #$20
.a8
    lda $0010,y
    sta $1ef9
    rep #$20
.a16
    jsr sub_7e52c4
.a8
    ply
    plx
    rep #$20
.a16
    lda $0000,y
    beq loc_7e52a3
    brl loc_7e4fd4

loc_7e52a3:
.a8
    sep #$20
    rts

loc_7e52a6:
.a16
    lda $2ec8,y
    sta $1258
    lda $2eca,y
    sta $125a
    lda $2ecc,y
    sta $125c
    lda $0c,x
    sta $6c
    lda $10,x
    sta $6e
    lda $0e,x
    sta $74

sub_7e52c4:
    lda $1efb
    sta $1efd
    ldy $78
    sty $1eff
    jmp loc_7e5788

loc_7e52d2:
    sep #$20
.a8
    sty $1eff
    ldx $2ec4,y
    stz $1ef8
    rep #$20
.a16
    ldy $76
    lda $001d,y
    and #$0080
    beq loc_7e52ec
    brl loc_7e5788

loc_7e52ec:
    lda $002e,y
    and $2e,x
    and #$00f8
    beq loc_7e52f9
    brl loc_7e5788

loc_7e52f9:
    tya
    cmp $19,x
    bne loc_7e5301
    brl loc_7e5788

loc_7e5301:
    txa
    tyx
    cmp $19,x
    bne loc_7e530a
    brl loc_7e5788

loc_7e530a:
    txy
    tax
    lda $0c,x
    sta $3a
    lda $0e,x
    sta $3c
    lda $10,x
    sta $3e
    lda $1f,x
    and #$0080
    beq loc_7e532c
    lda $001f,y
    and #$0080
    beq loc_7e532c
    lda $04,x
    txy
    bra loc_7e5337

loc_7e532c:
    lda $04,x
    txy
    cmp $1f03
    bne loc_7e5337
    brl loc_7e5788

loc_7e5337:
    ldx $1eff
    lda $2ec6,x
    bne loc_7e5342
    brl loc_7e570c

loc_7e5342:
    pha
    lda $3a
    sta $1ef2
    lda $3c
    sta $1ef4
    lda $3e
    sta $1ef6
    lda $2ecc,x
    clc
    adc $125c
    sta $1250
    lda $3e
    sec
    sbc $6e
    bpl loc_7e5367
    eor #$ffff
    inc a

loc_7e5367:
    sec
    sbc $1250
    bmi loc_7e5370
    jmp loc_7e53ac

loc_7e5370:
    lda $2ec8,x
    clc
    adc $1258
    sta $1250
    lda $3a
    sec
    sbc $6c
    bpl loc_7e5385
    eor #$ffff
    inc a

loc_7e5385:
    sec
    sbc $1250
    bmi loc_7e538e
    jmp loc_7e53ac

loc_7e538e:
    lda $2eca,x
    clc
    adc $125a
    sta $1250
    lda $3c
    sec
    sbc $74
    bpl loc_7e53a3
    eor #$ffff
    inc a

loc_7e53a3:
    sec
    sbc $1250
    bmi loc_7e53b0
    jmp loc_7e53ac

loc_7e53ac:
    pla
    jmp loc_7e5788

loc_7e53b0:
    pla
    tax

loc_7e53b2:
    sep #$20
.a8
    lda $0002,x
    beq loc_7e53e7
    dec a
    sta $02
    phx
    tyx
    lda $7e1ce7,x
    bpl loc_7e53cb
    plx
    and $02
    beq loc_7e53e7
    bra loc_7e53d3

loc_7e53cb:
    plx
    lda $02
    and $15bb
    beq loc_7e53e7

loc_7e53d3:
    rep #$20
.a16
    and #$007f
    sta $02
    txa
    ldx $02
    clc

loc_7e53de:
    adc #$0012
    dex
    bne loc_7e53de
    tax
    sep #$20

loc_7e53e7:
.a8
    lda $0009,x
    sta $f6
    and #$70
    bne loc_7e53f3
    brl loc_7e564c

loc_7e53f3:
    bit #$10
    beq loc_7e53fa
    brl loc_7e55cf

loc_7e53fa:
    bit #$20
    beq loc_7e5401
    brl loc_7e554f

loc_7e5401:
    bit #$40
    beq loc_7e5408
    brl loc_7e54cf

loc_7e5408:
    lda $0003,x
    sta $02
    sta $04
    lda $0005,x
    sta $08
    sta $0a
    lda $0014,y
    beq loc_7e541e
    jsr sub_7e5ada

loc_7e541e:
    lda $0a
    sta $08
    lda $0007,x
    sta $90
    sta $15c2
    lda $0012,y
    beq loc_7e5432
    jsr sub_7e593d

loc_7e5432:
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $0013,y
    beq loc_7e5442
    jsr sub_7e579d

loc_7e5442:
    rep #$20
.a16
    lda $0a
    bit #$0080
    beq loc_7e5450
    ora #$ff00
    bra loc_7e5453

loc_7e5450:
    and #$00ff

loc_7e5453:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5469
    sty $f8
    tay
    lda $02

loc_7e5461:
    asl a
    dey
    bne loc_7e5461
    ldy $f8
    bra loc_7e546b

loc_7e5469:
    lda $02

loc_7e546b:
    clc
    adc $1ef4
    sta $3c
    lda $15c2
    bit #$0080
    beq loc_7e547e
    ora #$ff00
    bra loc_7e5481

loc_7e547e:
    and #$00ff

loc_7e5481:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5497
    sty $f8
    tay
    lda $02

loc_7e548f:
    asl a
    dey
    bne loc_7e548f
    ldy $f8
    bra loc_7e5499

loc_7e5497:
    lda $02

loc_7e5499:
    clc
    adc $1ef6
    sta $3e
    lda $04
    bit #$0080
    beq loc_7e54ab
    ora #$ff00
    bra loc_7e54ae

loc_7e54ab:
    and #$00ff

loc_7e54ae:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e54c4
    sty $f8
    tay
    lda $02

loc_7e54bc:
    asl a
    dey
    bne loc_7e54bc
    ldy $f8
    bra loc_7e54c6

loc_7e54c4:
    lda $02

loc_7e54c6:
    clc
    adc $1ef2
    sta $3a
    brl loc_7e5669

loc_7e54cf:
.a8
    lda $0005,x
    sta $08
    sta $0a
    lda $0007,x
    sta $90
    sta $15c2
    lda $0012,y
    beq loc_7e54e6
    jsr sub_7e593d

loc_7e54e6:
    rep #$20
.a16
    lda $0a
    bit #$0080
    beq loc_7e54f4
    ora #$ff00
    bra loc_7e54f7

loc_7e54f4:
    and #$00ff

loc_7e54f7:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e550d
    sty $f8
    tay
    lda $02

loc_7e5505:
    asl a
    dey
    bne loc_7e5505
    ldy $f8
    bra loc_7e550f

loc_7e550d:
    lda $02

loc_7e550f:
    clc
    adc $1ef4
    sta $3c
    lda $15c2
    bit #$0080
    beq loc_7e5522
    ora #$ff00
    bra loc_7e5525

loc_7e5522:
    and #$00ff

loc_7e5525:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e553b
    sty $f8
    tay
    lda $02

loc_7e5533:
    asl a
    dey
    bne loc_7e5533
    ldy $f8
    bra loc_7e553d

loc_7e553b:
    lda $02

loc_7e553d:
    clc
    adc $1ef6
    sta $3e
    lda $1ef2
    clc
    adc $0003,x
    sta $3a
    jmp loc_7e5669

loc_7e554f:
.a8
    lda $0003,x
    sta $02
    sta $04
    lda $0007,x
    sta $90
    sta $15c2
    lda $0013,y
    beq loc_7e5566
    jsr sub_7e579d

loc_7e5566:
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e5574
    ora #$ff00
    bra loc_7e5577

loc_7e5574:
    and #$00ff

loc_7e5577:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e558d
    sty $f8
    tay
    lda $02

loc_7e5585:
    asl a
    dey
    bne loc_7e5585
    ldy $f8
    bra loc_7e558f

loc_7e558d:
    lda $02

loc_7e558f:
    clc
    adc $1ef2
    sta $3a
    lda $15c2
    bit #$0080
    beq loc_7e55a2
    ora #$ff00
    bra loc_7e55a5

loc_7e55a2:
    and #$00ff

loc_7e55a5:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e55bb
    sty $f8
    tay
    lda $02

loc_7e55b3:
    asl a
    dey
    bne loc_7e55b3
    ldy $f8
    bra loc_7e55bd

loc_7e55bb:
    lda $02

loc_7e55bd:
    clc
    adc $1ef6
    sta $3e
    lda $1ef4
    clc
    adc $0005,x
    sta $3c
    brl loc_7e5669

loc_7e55cf:
.a8
    lda $0003,x
    sta $02
    sta $04
    lda $0005,x
    sta $08
    sta $0a
    lda $0014,y
    beq loc_7e55e5
    jsr sub_7e5ada

loc_7e55e5:
    rep #$20
.a16
    lda $04
    bit #$0080
    beq loc_7e55f3
    ora #$ff00
    bra loc_7e55f6

loc_7e55f3:
    and #$00ff

loc_7e55f6:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e560c
    sty $f8
    tay
    lda $02

loc_7e5604:
    asl a
    dey
    bne loc_7e5604
    ldy $f8
    bra loc_7e560e

loc_7e560c:
    lda $02

loc_7e560e:
    clc
    adc $1ef2
    sta $3a
    lda $0a
    bit #$0080
    beq loc_7e5620
    ora #$ff00
    bra loc_7e5623

loc_7e5620:
    and #$00ff

loc_7e5623:
    sta $02
    lda $f6
    and #$000f
    beq loc_7e5639
    sty $f8
    tay
    lda $02

loc_7e5631:
    asl a
    dey
    bne loc_7e5631
    ldy $f8
    bra loc_7e563b

loc_7e5639:
    lda $02

loc_7e563b:
    clc
    adc $1ef4
    sta $3c
    lda $1ef6
    clc
    adc $0007,x
    sta $3e
    bra loc_7e5669

loc_7e564c:
.a8
    rep #$20
.a16
    lda $1ef2
    clc
    adc $0003,x
    sta $3a
    lda $1ef4
    clc
    adc $0005,x
    sta $3c
    lda $1ef6
    clc
    adc $0007,x
    sta $3e

loc_7e5669:
    lda $000e,x
    clc
    adc $125c
    sta $1250
    lda $3e
    sec
    sbc $6e
    bpl loc_7e567e
    eor #$ffff
    inc a

loc_7e567e:
    sec
    sbc $1250
    bmi loc_7e5687
    jmp loc_7e56d0

loc_7e5687:
    lda $000a,x
    clc
    adc $1258
    sta $1250
    lda $3a
    sec
    sbc $6c
    bpl loc_7e569c
    eor #$ffff
    inc a

loc_7e569c:
    sec
    sbc $1250
    bmi loc_7e56a5
    jmp loc_7e56d0

loc_7e56a5:
    lda $000c,x
    clc
    adc $125a
    sta $1250
    lda $3c
    sec
    sbc $74
    bpl loc_7e56ba
    eor #$ffff
    inc a

loc_7e56ba:
    sec
    sbc $1250
    bmi loc_7e56c3
    jmp loc_7e56d0

loc_7e56c3:
    sep #$20
.a8
    lda $0010,x
    ora $1ef8
    sta $1ef8
    rep #$20

loc_7e56d0:
.a16
    lda $0000,x
    tax
    beq loc_7e56d9
    brl loc_7e53b2

loc_7e56d9:
    sep #$20
.a8
    lda $1ef8
    beq loc_7e5709
    phx
    ldx $76
    lda $1d,x
    ora #$80
    sta $1d,x
    sty $1b,x
    lda $001d,y
    ora #$80
    sta $001d,y
    stx $1b,y
    lda $0035,y
    ora $1ef8
    sta $0035,y
    lda $35,x
    ora $1ef9
    sta $35,x
    plx
    jmp loc_7e579a

loc_7e5709:
    jmp loc_7e5788

loc_7e570c:
.a16
    lda $2ecc,x
    clc
    adc $125c
    sta $1250
    lda $3e
    sec
    sbc $6e
    bpl loc_7e5721
    eor #$ffff
    inc a

loc_7e5721:
    sec
    sbc $1250
    bmi loc_7e572a
    jmp loc_7e5788

loc_7e572a:
    lda $2ec8,x
    clc
    adc $1258
    sta $1250
    lda $3a
    sec
    sbc $6c
    bpl loc_7e573f
    eor #$ffff
    inc a

loc_7e573f:
    sec
    sbc $1250
    bmi loc_7e5748
    jmp loc_7e5788

loc_7e5748:
    lda $2eca,x
    clc
    adc $125a
    sta $1250
    lda $3c
    sec
    sbc $74
    bpl loc_7e575d
    eor #$ffff
    inc a

loc_7e575d:
    sec
    sbc $1250
    bmi loc_7e5766
    jmp loc_7e5788

loc_7e5766:
    phx
    ldx $76
    sep #$20
.a8
    lda $1d,x
    ora #$80
    sta $1d,x
    sty $1b,x
    lda $001d,y
    ora #$80
    sta $001d,y
    stx $1b,y
    lda $35,x
    ora $1ef9
    sta $35,x
    plx
    jmp loc_7e579a

loc_7e5788:
    rep #$20
.a16
    lda $1eff
    clc
    adc #$000a
    tay
    dec $1efd
    beq loc_7e579a
    jmp loc_7e52d2

loc_7e579a:
.a8
    sep #$20
    rts

sub_7e579d:
    phy
    phx
    php
    sep #$10
.i8
    eor #$ff
    inc a
    tax
    lda $7e5cb2,x
    sta $15f4
    lda $7e5c72,x
    sta $15f3
    lda $02
    bmi loc_7e57d1
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e57f8
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5808

loc_7e57d1:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e57e6
    sta $004203
    nop
    jmp loc_7e5801

loc_7e57e6:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5808

loc_7e57f8:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5801:
    lda #$00
    sec
    sbc $004217

loc_7e5808:
    tax
    stx $04
    lda $90
    bmi loc_7e5828
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e584f
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e585f

loc_7e5828:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e583d
    sta $004203
    nop
    jmp loc_7e5858

loc_7e583d:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e585f

loc_7e584f:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5858:
    lda #$00
    sec
    sbc $004217

loc_7e585f:
    tax
    txa
    clc
    adc $04
    sta $04
    bit #$80
    beq loc_7e5870
    lda #$ff
    sta $05
    bra loc_7e5872

loc_7e5870:
    stz $05

loc_7e5872:
    lda $02
    bmi loc_7e588f
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e58b6
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e58c6

loc_7e588f:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e58a4
    sta $004203
    nop
    jmp loc_7e58bf

loc_7e58a4:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e58c6

loc_7e58b6:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e58bf:
    lda #$00
    sec
    sbc $004217

loc_7e58c6:
    tax
    txa
    eor #$ff
    inc a
    sta $15c2
    lda $90
    bmi loc_7e58eb
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5912
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5922

loc_7e58eb:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5900
    sta $004203
    nop
    jmp loc_7e591b

loc_7e5900:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5922

loc_7e5912:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e591b:
    lda #$00
    sec
    sbc $004217

loc_7e5922:
    tax
    txa
    clc
    adc $15c2
    sta $15c2
    bit #$80
    beq loc_7e5936
    lda #$ff
    sta $15c3
    bra loc_7e5939

loc_7e5936:
    stz $15c3

loc_7e5939:
    plp
.i16
    plx
    ply
    rts

sub_7e593d:
    phx
    phy
    php
    sep #$10
.i8
    tax
    lda $7e5cb2,x
    sta $15f4
    lda $7e5c72,x
    sta $15f3
    lda $08
    bmi loc_7e596e
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5995
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e59a5

loc_7e596e:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5983
    sta $004203
    nop
    jmp loc_7e599e

loc_7e5983:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e59a5

loc_7e5995:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e599e:
    lda #$00
    sec
    sbc $004217

loc_7e59a5:
    tax
    stx $0a
    lda $90
    bmi loc_7e59c5
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e59ec
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e59fc

loc_7e59c5:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e59da
    sta $004203
    nop
    jmp loc_7e59f5

loc_7e59da:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e59fc

loc_7e59ec:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e59f5:
    lda #$00
    sec
    sbc $004217

loc_7e59fc:
    tax
    txa
    clc
    adc $0a
    sta $0a
    bit #$80
    beq loc_7e5a0d
    lda #$ff
    sta $0b
    bra loc_7e5a0f

loc_7e5a0d:
    stz $0b

loc_7e5a0f:
    lda $08
    bmi loc_7e5a2c
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5a53
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5a63

loc_7e5a2c:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5a41
    sta $004203
    nop
    jmp loc_7e5a5c

loc_7e5a41:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5a63

loc_7e5a53:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5a5c:
    lda #$00
    sec
    sbc $004217

loc_7e5a63:
    tax
    txa
    eor #$ff
    inc a
    sta $15c2
    lda $90
    bmi loc_7e5a88
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5aaf
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5abf

loc_7e5a88:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5a9d
    sta $004203
    nop
    jmp loc_7e5ab8

loc_7e5a9d:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5abf

loc_7e5aaf:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5ab8:
    lda #$00
    sec
    sbc $004217

loc_7e5abf:
    tax
    txa
    clc
    adc $15c2
    sta $15c2
    bit #$80
    beq loc_7e5ad3
    lda #$ff
    sta $15c3
    bra loc_7e5ad6

loc_7e5ad3:
    stz $15c3

loc_7e5ad6:
    plp
    ply
    plx
    rts

sub_7e5ada:
.i16
    phy
    phx
    php
    sep #$10
.i8
    tax
    lda $7e5cb2,x
    sta $15f4
    lda $7e5c72,x
    sta $15f3
    lda $02
    bmi loc_7e5b0b
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5b32
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5b42

loc_7e5b0b:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5b20
    sta $004203
    nop
    jmp loc_7e5b3b

loc_7e5b20:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5b42

loc_7e5b32:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5b3b:
    lda #$00
    sec
    sbc $004217

loc_7e5b42:
    tax
    stx $04
    lda $08
    bmi loc_7e5b62
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5b89
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5b99

loc_7e5b62:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5b77
    sta $004203
    nop
    jmp loc_7e5b92

loc_7e5b77:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5b99

loc_7e5b89:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5b92:
    lda #$00
    sec
    sbc $004217

loc_7e5b99:
    tax
    txa
    clc
    adc $04
    sta $04
    bit #$80
    beq loc_7e5baa
    lda #$ff
    sta $05
    bra loc_7e5bac

loc_7e5baa:
    stz $05

loc_7e5bac:
    lda $02
    bmi loc_7e5bc9
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5bf0
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5c00

loc_7e5bc9:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f3
    bmi loc_7e5bde
    sta $004203
    nop
    jmp loc_7e5bf9

loc_7e5bde:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5c00

loc_7e5bf0:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5bf9:
    lda #$00
    sec
    sbc $004217

loc_7e5c00:
    tax
    txa
    eor #$ff
    inc a
    sta $0a
    lda $08
    bmi loc_7e5c24
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5c4b
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5c5b

loc_7e5c24:
    eor #$ff
    inc a
    asl a
    sta $004202
    lda $15f4
    bmi loc_7e5c39
    sta $004203
    nop
    jmp loc_7e5c54

loc_7e5c39:
    eor #$ff
    inc a
    sta $004203
    nop
    nop
    nop
    nop
    lda $004217
    jmp loc_7e5c5b

loc_7e5c4b:
    eor #$ff
    inc a
    sta $004203
    nop
    nop

loc_7e5c54:
    lda #$00
    sec
    sbc $004217

loc_7e5c5b:
    tax
    txa
    clc
    adc $0a
    sta $0a
    bit #$80
    beq loc_7e5c6c
    lda #$ff
    sta $0b
    bra loc_7e5c6e

loc_7e5c6c:
    stz $0b

loc_7e5c6e:
    plp
.i16
    plx
    ply
    rts
    .incbin "data/012adf-013fbb.bin"

loc_7e714e:
.a16
    ora ($ff,x)
    per $71c4
    .incbin "data/013fc0-0142fa.bin"

loc_7e748d:
.a8
    adc $10,x
    asl $1100,x
    .incbin "data/0142ff-015956.bin"

sub_7e8ae9:
.i8
    sep #$20
    rep #$10
.i16
    lda $1200
    sta $16a3
    stz $1200

loc_7e8af6:
    lda $00
    bne $8af6
    stz $1f10
    lda #$02
    sta $00
    jsr sub_02dd4f
    jsl sub_06bb5c
    jsr sub_02db5a
.a16
    rep #$30
    lda $14fc
    sta $16c5
    lda $18b8
    beq $8b30
    ldx $1236
    lda $0c,x
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    dec a
    dec a
    dec a
    dec a
    sta $18b9

loc_7e8b30:
    lda $16a2
    and #$00ff
    beq $8b78
    cmp #$0001
    beq $8b5a
    lda $16a0
    clc
    adc $1701
    cmp #$01f4
    bcc $8b75
    lda $169c
    cmp #$feda
    beq $8b78
    dec a
    sta $169c
.endbase

    lda #$0000
    bra loc_02d9e2

loc_02d9c7:
    lda $16a0
    clc
    adc $1701
    cmp #$07d0
    bcc loc_02d9e2
    lda $169c
    cmp #$00d4
    beq loc_02d9e5
    inc a
    sta $169c
    lda #$0000

loc_02d9e2:
    sta $16a0

loc_02d9e5:
    jsr sub_02dc3a
.a8
    jsr sub_02dcc3
    jsl sub_02db27
    sep #$20
    rep #$10
    lda $1fd1
    bne loc_02d9fb
    inc $1f10

loc_02d9fb:
    lda $177a
    bit #$01
    beq loc_02da05
    brl loc_02da08

loc_02da05:
    jsr sub_02daf2

loc_02da08:
.a16
    sep #$20
.a8
    lda $1202
    sta $15a4
    lda $1204
    sta $15a5
    jsl sub_02f934
.i8
    jsl sub_03b269
.i16
    jsl sub_02f6fc
    jsl sub_02f6da
.a16
    jsl sub_02f4e6
    jsl sub_02f6d5
    jsl sub_03db86
.a8
    jsr sub_02dd0a
    jsl sub_1fc03d
    sep #$20

loc_02da3b:
    lda $18bb
    beq loc_02da3b
    lda $1f13
    beq loc_02da48
    jsr sub_02daa9

loc_02da48:
    jsl sub_02dc16

loc_02da4c:
    lda $18bb
    cmp #$02
    bne loc_02da4c
    stz $18bb
    rep #$30
.a16
    lda $16f9
    sta $70019e
    beq loc_02da65
    jsl sub_03baf7

loc_02da65:
.a8
.i8
    jsl sub_7e4f10
.i16
    jsr sub_02e20d
    sep #$20
    lda $1fd1
    beq loc_02da76
    inc $1f10

loc_02da76:
    sep #$20
    lda $1200
    sta $14e3
    lda $16a4
    clc
    adc $16a3
    sta $16a4
    inc $16a5
    lda $16a4
    cmp #$3c
    bcc loc_02daa4
    lda $16a5
    sta $16a6
    stz $16a5
    lda $16a4
    sec
    sbc #$3c
    sta $16a4

loc_02daa4:
    rtl
    .db $20,$a9,$da,$6b

sub_02daa9:
    lda $18bb
    cmp #$02
    bne sub_02daa9
    sei
    lda $00
    stz $00
    pha
    lda $004211
    cli
    sep #$20
    lda $1f13
    bit #$01
    beq loc_02dac8
    jsl sub_0993cb

loc_02dac8:
    rep #$30
.a16
    lda $1f13
    bit #$0004
    beq loc_02dad6
    jsl sub_03f55d

loc_02dad6:
    rep #$30
    lda $1f13
    bit #$0008
    beq loc_02dae4
    jsl sub_03f022

loc_02dae4:
    sep #$20
.a8
    lda $1f13
    and #$f2
    sta $1f13
    pla
    sta $00
    rts

sub_02daf2:
    inc $15bb
    bne loc_02dafa
    inc $15bc

loc_02dafa:
    phb
    lda #$7e
    pha
    plb
    jsl sub_0681d5
    jsl sub_03ed7e
.a16
    ldx $121d

loc_02db0a:
    stz $1248
    jsl sub_1fd26b
    lda $1248
    bne loc_02db1d
    ldy $00,x

loc_02db18:
    tyx
    bne loc_02db0a
    bra loc_02db25

loc_02db1d:
    ldy $00,x
    jsl sub_1fbfdc
    bra loc_02db18

loc_02db25:
    plb
    rts

sub_02db27:
.a8
    php
    sep #$20
    rep #$10
    jsr sub_02db31
.a16
    plp
.a8
    rtl

sub_02db31:
    stz $14c6
    lda $14c1
    sta $14c5
    rep #$20
.a16
    beq loc_02db4f
    ldx #$0008
    lda #$1481

loc_02db44:
    ror $14c5
    bcs loc_02db52
    adc #$0008
    dex
    bne loc_02db44

loc_02db4f:
    lda #$0000

loc_02db52:
    sta $16a7
    rts

sub_02db56:
.a8
    jsr sub_02db5a
.a16
    rtl

sub_02db5a:
.a8
    rep #$30
.a16
    stz $1951
    lda $1954
    and #$00ff
    bne loc_02db68
    rts

loc_02db68:
    lda $16f1
    and #$00ff
    bne loc_02db75
    lda #$0000
    bra loc_02db7a

loc_02db75:
    lda $1234
    bmi loc_02dbaa

loc_02db7a:
    xba
    and #$0007
    asl a
    tax
    lda $008c15,x
    cmp $194f
    bne loc_02db8a
    rts

loc_02db8a:
    sta $194f
    tax
    ldy #$0000

loc_02db91:
    lda $00,x
    clc
    adc $194d
    sta $18cd,y
    iny
    iny
    inx
    inx
    cpy #$0040
    bne loc_02db91
    lda #$0001
    sta $1951
    rts

loc_02dbaa:
    eor #$ffff
    inc a
    xba
    and #$0007
    asl a
    tax
    lda $008c15,x
    cmp $194f
    bne loc_02dbbe
    rts

loc_02dbbe:
    sta $194f
    clc
    adc #$003e
    tax
    ldy #$0000

loc_02dbc9:
    lda $00,x
    clc
    adc $194d
    sta $18cd,y
    dex
    dex
    iny
    iny
    cpy #$0040
    bne loc_02dbc9
    lda #$0001
    sta $1951
    rts

sub_02dbe2:
    php
    sep #$20
.a8
    rep #$10
    jsr sub_02dbec
    plp
.a16
    rtl

sub_02dbec:
.a8
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD0
    ldx #$18cd
    stx A1TL0
    stz A1B0
    ldx #$2fa0
    stx VMADDL
    ldx #$0040
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    rts

sub_02dc16:
    php
    sep #$20
    rep #$10
    lda #$01
    ldx #$b0cb
    jsl sub_7e4ee9
    plp
    rtl

sub_02dc26:
    php
    sep #$20
    rep #$10
    lda #$01
    ldx #$b0e2
    jsl sub_7e4ee9
    plp
    rtl
    .db $20,$3a,$dc,$6b

sub_02dc3a:
.a16
    rep #$30
    lda $1953
    and #$00ff
    bne loc_02dc45
    rts

loc_02dc45:
    ldx $1fe2
    jmp (tbl_02dc4b,x)

tbl_02dc4b:
    .db $91,$dc,$ad,$dc,$ad,$dc,$7f,$dc,$ad,$dc,$6d,$dc,$5b,$dc,$6d,$dc

loc_02dc5b:
    lda $c1
    sta $7000c6
    sep #$20
.a8
    lda #$06
    ldx #$fccd
    jsl sub_7e4ee9
    rts

loc_02dc6d:
.a16
    lda $c1
    sta $7000c6
    sep #$20
.a8
    lda #$06
    ldx #$fb5d
    jsl sub_7e4ee9
    rts

loc_02dc7f:
.a16
    lda $c1
    sta $7000c6
    sep #$20
.a8
    lda #$06
    ldx #$fc31
    jsl sub_7e4ee9
    rts

loc_02dc91:
.a16
    lda $1234
    sta $7000c6
    ldx $1238
    lda $0c,x
    sta $70002c
    sep #$20
.a8
    lda #$06
    ldx #$fb87
    jsl sub_7e4ee9
    rts

loc_02dcad:
.a16
    lda $c1
    sta $7000c6
    sep #$20
.a8
    lda #$06
    ldx #$fbe6
    jsl sub_7e4ee9
    rts
    .db $20,$c3,$dc,$6b

sub_02dcc3:
    sep #$30

loc_02dcc5:
.i8
    lda SLHV
    ldx OPHCT
    lda OPHCT
    and #$01
    bne loc_02dcc5
    cpx #$5a
    bcc loc_02dcc5
    cpx #$64
    bcs loc_02dcc5
    rep #$10
.i16
    sei
    ldx $18b6
    stx WMADDL
    stz WMADDH
    lda #$80
    sta BBAD0
    ldx #$0222
    stx A1TL0
    lda #$70
    sta A1B0
    ldx #$02a0
    stx DASL0
    stz DMAP0
    lda #$01
    sta MDMAEN
    lda $004211
    cli
    rts

sub_02dd0a:
    sep #$20
    rep #$10
    ldx $1567
    lda $2a,x
    bpl loc_02dd17
    lda #$00

loc_02dd17:
    sta $7001b8
    lda $7001ba
    beq loc_02dd35
    lda $7001bc
    dec a
    dec a
    bpl loc_02dd2f
    lda #$00
    sta $7001ba

loc_02dd2f:
    sta $7001bc
    bra loc_02dd4a

loc_02dd35:
    lda $7001bc
    cmp #$28
    beq loc_02dd4a
    lda $7001bc
    inc a
    sta $7001bc
    and #$0f
    beq loc_02dd4a

loc_02dd4a:
    rts

sub_02dd4b:
    jsr sub_02dd4f
    rtl

sub_02dd4f:
    sep #$20
    stz $1fd0
    rep #$30
.a16
    ldx $16ab
    bne loc_02dd6f
    sep #$20
.a8
    sep #$20
    lda $14c1
    and #$7f
    sta $14c1
    sep #$20
    rep #$10
    stz $1fd1
    rts

loc_02dd6f:
    rep #$20
.a16
    lda $02e0c2,x
    and #$00ff
    txy
    tax
    jmp (tbl_02dd7d,x)

tbl_02dd7d:
    .db $b3,$dd,$da,$dd,$fa,$dd,$1c,$de,$3e,$de,$60,$de,$77,$de,$8e,$de
    .db $a5,$de,$bb,$de,$c7,$de,$cf,$de,$de,$de,$ed,$de,$fc,$de,$04,$df
    .db $12,$df,$df,$e1,$ef,$e1,$a7,$dd,$f5,$e1

loc_02dda7:
    tyx
    lda $02e0c3,x
    sta $16ab
    tax
    jmp loc_02dd6f

loc_02ddb3:
    tyx
    stz $16af
    stz $16ad
    sep #$20
.a8
    stz $16b5
    stz $16b8
    stz $16b7
    stz $16ba
    stz $16b6
    stz $16b9
    lda #$27
    sta $1f68
    inx
    stx $16ab
    jmp loc_02dd6f

loc_02ddda:
.a16
    tyx
    lda $02e0c3,x
    sta $16ad
    lda $02e0c5,x
    sta $16b1
    lda $02e0c7,x
    sta $16b3
    inx
    inx
    inx
    inx
    inx
    inx
    inx
    jmp loc_02dd6f

loc_02ddfa:
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16b5
    lda $02e0c4,x
    sta $16be
    sta $16c1
    lda $02e0c5,x
    sta $16bb
    inx
    inx
    inx
    inx
    jmp loc_02dd6f

loc_02de1c:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16b6
    lda $02e0c4,x
    sta $16bf
    sta $16c2
    lda $02e0c5,x
    sta $16bc
    inx
    inx
    inx
    inx
    jmp loc_02dd6f

loc_02de3e:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16b7
    lda $02e0c4,x
    sta $16c0
    sta $16c3
    lda $02e0c5,x
    sta $16bd
    inx
    inx
    inx
    inx
    jmp loc_02dd6f

loc_02de60:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    cmp $16b8
    beq loc_02de6f
    brl loc_02df21

loc_02de6f:
    inx
    inx
    stx $16ab
    jmp loc_02dd6f

loc_02de77:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    cmp $16b9
    beq loc_02de86
    brl loc_02df21

loc_02de86:
    inx
    inx
    stx $16ab
    jmp loc_02dd6f

loc_02de8e:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    cmp $16ba
    beq loc_02de9d
    brl loc_02df21

loc_02de9d:
    inx
    inx
    stx $16ab
    jmp loc_02dd6f

loc_02dea5:
.a16
    tyx
    lda $02e0c3,x
    cmp $16af
    beq loc_02deb2
    brl loc_02df21

loc_02deb2:
    inx
    inx
    inx
    stx $16ab
    jmp loc_02dd6f

loc_02debb:
    stz $16a9
    stz $16ab
    stz $16af
    jmp loc_02df21

loc_02dec7:
    tyx
    inx
    stx $16ab
    jmp loc_02df21

loc_02decf:
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16b8
    inx
    inx
    jmp loc_02dd6f

loc_02dede:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16b9
    inx
    inx
    jmp loc_02dd6f

loc_02deed:
.a16
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $16ba
    inx
    inx
    jmp loc_02dd6f

loc_02defc:
.a16
    tyx
    inx
    stx $16ab
    jmp loc_02df21

loc_02df04:
    tyx
    lda $02e0c3,x
    sta $16af
    inx
    inx
    inx
    jmp loc_02dd6f

loc_02df12:
    tyx
    sep #$20
.a8
    lda $02e0c3,x
    sta $1f68
    inx
    inx
    jmp loc_02dd6f

loc_02df21:
    rep #$20
.a16
    lda $16af
    cmp $16ad
    beq loc_02df47
    bcc loc_02df3b
    sec
    sbc $16b1
    cmp $16ad
    bcs loc_02df47
    lda $16ad
    bra loc_02df47

loc_02df3b:
    clc
    adc $16b1
    cmp $16ad
    bcc loc_02df47
    lda $16ad

loc_02df47:
    cmp #$0000
    bne loc_02df4f
    lda #$0001

loc_02df4f:
    sta $16af
    sta $700020
    lda $16b1
    beq loc_02df62
    clc
    adc $16b3
    sta $16b1

loc_02df62:
    sep #$20
.a8
    lda $16be
    dec a
    sta $16be
    bne loc_02df9e
    lda $16c1
    sta $16be
    lda $16b8
    cmp $16b5
    beq loc_02df9b
    bcc loc_02df8f
    sec
    sbc $16bb
    bpl loc_02df85
    lda #$00

loc_02df85:
    cmp $16b5
    bcs loc_02df9b
    lda $16b8
    bra loc_02df9b

loc_02df8f:
    clc
    adc $16bb
    cmp $16b5
    bcc loc_02df9b
    lda $16b8

loc_02df9b:
    sta $16b8

loc_02df9e:
    lda $16bf
    dec a
    sta $16bf
    bne loc_02dfd8
    lda $16c2
    sta $16bf
    lda $16b9
    cmp $16b6
    beq loc_02dfd5
    bcc loc_02dfc9
    sec
    sbc $16bc
    bpl loc_02dfbf
    lda #$00

loc_02dfbf:
    cmp $16b6
    bcs loc_02dfd5
    lda $16b9
    bra loc_02dfd5

loc_02dfc9:
    clc
    adc $16bc
    cmp $16b6
    bcc loc_02dfd5
    lda $16b9

loc_02dfd5:
    sta $16b9

loc_02dfd8:
    lda $16c0
    dec a
    sta $16c0
    bne loc_02e012
    lda $16c3
    sta $16c0
    lda $16ba
    cmp $16b7
    beq loc_02e00f
    bcc loc_02e003
    sec
    sbc $16bd
    bpl loc_02dff9
    lda #$00

loc_02dff9:
    cmp $16b7
    bcs loc_02e00f
    lda $16ba
    bra loc_02e00f

loc_02e003:
    clc
    adc $16bd
    cmp $16b7
    bcc loc_02e00f
    lda $16ba

loc_02e00f:
    sta $16ba

loc_02e012:
    rep #$20
.a16
    ldx $16a9
    beq loc_02e038
    lda #$0000
    jsl sub_03dc8a
    lda $72
    clc
    adc #$0010
    sta $72
    sta $700026
    lda $74
    clc
    adc #$0010
    sta $700028
    bra loc_02e048

loc_02e038:
    lda #$0080
    sta $700026
    sta $72
    lda #$0070
    sta $700028

loc_02e048:
    sep #$20
.a8
    sep #$20
    rep #$10
    lda $14c1
    ora #$80
    sta $14c1
    ldx #$14b9
    sep #$20
    rep #$10
    stz $00,x
    lda $16b8
    sta $03,x
    lda $16b9
    sta $02,x
    lda $16ba
    sta $01,x
    lda #$10
    sta $05,x
    lda $1f68
    sta $06,x
    stz $04,x
    lda #$01
    ldx #$aad3
    jsl sub_7e4ee9

loc_02e082:
    sep #$20
    phb
    lda #$7e
    pha
    plb
    ldx #$017e
    ldy #$0240
    lda $18a9
    beq loc_02e0ab

loc_02e094:
    lda $700ef2,x
    sta $416b,y
    lda $7010b2,x
    sta $416a,y
    dey
    dey
    dey
    dex
    dex
    bpl loc_02e094
    plb
    rts

loc_02e0ab:
    lda $700ef2,x
    sta $43af,y
    lda $7010b2,x
    sta $43ae,y
    dey
    dey
    dey
    dex
    dex
    bpl loc_02e0ab
    plb
    rts
    .db $00,$00,$02,$c8,$00,$04,$00,$00,$00,$04,$1f,$03,$01,$06,$1f,$03
    .db $01,$08,$1f,$03,$01,$16,$0e,$18,$0e,$1a,$0e,$14,$10,$c8,$00,$04
    .db $00,$01,$02,$06,$00,$01,$02,$02,$f4,$01,$04,$00,$00,$00,$14,$0a
    .db $00,$08,$00,$01,$02,$14,$0e,$00,$12,$00,$1e,$29,$01,$16,$1c,$18
    .db $1c,$1a,$1c,$1c,$1e,$00,$00,$02,$09,$00,$09,$00,$00,$00,$04,$1f
    .db $07,$01,$06,$1f,$0f,$01,$08,$1f,$03,$01,$16,$1c,$18,$1c,$1a,$1c
    .db $1c,$02,$87,$00,$09,$00,$00,$00,$08,$00,$01,$02,$14,$10,$87,$00
    .db $02,$29,$01,$09,$00,$00,$00,$04,$00,$01,$01,$06,$00,$01,$01,$14
    .db $0c,$00,$12,$00,$02,$c5,$00,$12,$00,$ff,$ff,$04,$1f,$01,$01,$06
    .db $1f,$01,$01,$08,$1f,$01,$01,$16,$0e,$18,$0e,$1a,$0e,$14,$10,$ab
    .db $00,$04,$00,$01,$01,$06,$00,$01,$01,$14,$0a,$00,$02,$0a,$00,$04
    .db $00,$00,$00,$08,$00,$01,$01,$14,$10,$00,$00,$12,$00,$02,$c5,$00
    .db $12,$00,$ff,$ff,$08,$1f,$01,$01,$1a,$0e,$14,$10,$2c,$01,$12,$00
    .db $20,$22,$02,$c8,$00,$04,$00,$00,$00,$04,$1f,$03,$01,$06,$1f,$03
    .db $01,$08,$1f,$03,$01,$16,$0e,$18,$0e,$1a,$0e,$14,$10,$c8,$00,$04
    .db $00,$01,$02,$06,$00,$01,$02,$14,$0a,$00,$08,$00,$01,$02,$14,$0e
    .db $00,$12,$22,$82,$81,$24,$22,$a4,$86,$24,$26,$06,$01,$28,$22,$00
    .db $80,$24,$28,$22,$13,$84,$24,$28,$22,$ca,$86,$24,$28

loc_02e1df:
.a16
    tyx
    rep #$20
    lda $02e0c3,x
    sta $1fc9
    inx
    inx
    inx
    stx $16ab

loc_02e1ef:
    sep #$20
.a8
    inc $1fd0
    rts

loc_02e1f5:
.a16
    stz $16ab
    sep #$20
.a8
    sep #$20
    lda $14c1
    and #$fe
    sta $14c1
    sep #$20
    rep #$10
    rts

sub_02e209:
.a16
    jsr sub_02e20d
    rtl

sub_02e20d:
.a8
    sep #$20
    lda $1fd0
    bne loc_02e215
    rts

loc_02e215:
    rep #$20
.a16
    lda $1fc9
    sta $700028
    sep #$20
.a8
    lda #$01
    ldx #$d68b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $700028
    sta $1fc9
    sep #$20
.a8
    lda #$01
    sta $1fd1
    sep #$20
    rep #$10
    lda $14c1
    ora #$01
    sta $14c1
    ldx #$1481
    sep #$20
    rep #$10
    lda $700026
    sta $06,x
    rep #$20
.a16
    lda $1fc9
    cmp #$0001
    bne loc_02e261
    inc $16ab

loc_02e261:
    sep #$20
.a8
    jmp loc_02e082

sub_02e266:
.i8
    php
    sep #$20
    lda #$28
    sta $189f
    sta $18a2
    sta $18a0
    sta $18a1
    sta $18a3
    sta $18a4
    jsl sub_0bd2ef
    jsl sub_03bdaf
    rep #$30
.a16
.i16
    stz $1f69
    stz $1fbb
    stz $173c
    lda #$f0d0
    sta $700062
    lda #$1000
    sta $70002c
    lda #$0000
    sta $700090
    sep #$20
.a8
    lda #$17
    sta $700064
    lda #$01
    ldx #$b301
    jsl sub_7e4ee9
    rep #$20
.a16
    ldx #$0000

loc_02e2bb:
    lda $701000,x
    sta $7f0000,x
    inx
    inx
    cpx #$2000
    bne loc_02e2bb
    plp
.a8
.i8
    rtl

sub_02e2cc:
    php
    phb
    sep #$20
    lda #$00
    pha
    plb
    sei
    sep #$20
    stz HDMAEN
    lda #$80
    jsl sub_02f8df
    sta INIDISP
    stz $18b2
    stz $18b3
    lda #$6e
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
.i16
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    rep #$30
.a16
    stz $1fd2
    stz $16ab
    stz $16fb
    stz $16ff
    stz $1701
    stz $c5
    lda #$0001
    sta $70021c
    stz $1fd2
    stz $1201
    stz $1f4f
    stz $1f4d
    stz $1f51
    sep #$20
.a8
    lda #$01
    sta $15ac
    stz $1956
    stz $189d
    stz $189e
    stz $1f14
    stz $1fcd
    stz $1fce
    stz $14c1
    stz $1fcf
    stz $1f52
    stz $1f51
    stz $1fde
    jsl sub_02f4c9
    jsl sub_0af94c
    lda $1ff4
    pha
    lda $058002
    sta $1ff4
    rep #$30
.a16
    lda $16fd
    pha
    lda $058000
    tax
    jsl sub_03eda1
    sep #$20
.a8
    jsl sub_068004
    rep #$10
    plx
    pla
    sta $1ff4
    rep #$20
.a16
    stz $1fd2
    stx $16fd
    jsl sub_03eda1
    jsl sub_02e39a
    jsl sub_02db27
    plb
    plp
.a8
.i8
    rtl

sub_02e39a:
.a16
.i16
    php
    rep #$20
    lda #$1234
    sta $7001fe
    lda #$0001
    sta $7001b2
    jsl sub_02f125
.a8
    sep #$20
    lda #$80
    sta $9c
    lda #$ff
    sta $15bf
    stz $00
    sep #$30
.i8
    jsr sub_02f3fe
    jml loc_03b82d

loc_02e3c5:
.a16
.i16
    sep #$30
.a8
.i8
    jsl sub_02e2cc

loc_02e3cb:
    sep #$20
    sep #$20
    lda $1fe7
    bne loc_02e3f3
    lda $14d6
    bit #$20
    bne loc_02e3f3
.i16
    lda $14d3
    and #$10
    bne loc_02e3f3
    lda $14dd
    and #$20
    bne loc_02e3f3
    lda $1201
    bit #$10
    beq loc_02e3f3
    jsr sub_02efa5

loc_02e3f3:
.i8
    jsl sub_02fd84
    jsl sub_1fbdb0
    jsl $02d956
.i16
    jsl sub_03ea26
    rep #$20
.a16
    lda $1fd2
    beq loc_02e3cb
    cmp #$000a
    bne loc_02e412
    brl loc_02e4c8

loc_02e412:
    inc $16d6
    sep #$20
.a8
    lda #$01
    sta $15a8
    stz $15ab
    lda $1fd2
    cmp #$05
    beq loc_02e45b
    cmp #$0b
    beq loc_02e49b
    cmp #$0c
    beq loc_02e4a1
    cmp #$0d
    beq loc_02e4a7
    cmp #$0e
    beq loc_02e4ad
    cmp #$0f
    beq loc_02e4b1
    cmp #$10
    beq loc_02e469
    jsr sub_02ec26
    sep #$20
    lda $1fd2
    cmp #$07
    bne loc_02e451
    stz $15a8
    jml loc_02e3c5

loc_02e451:
    lda $1fd2
    cmp #$06
    bne loc_02e45b
    brl loc_02e575

loc_02e45b:
    sep #$20
    lda $1fce
    bne loc_02e492
    lda $1fd2
    cmp #$04
    bne loc_02e47c

loc_02e469:
    sep #$20
    lda #$28

loc_02e46d:
    pha
    jsl sub_02fd1d
    jsl $02d956
    sep #$20
    pla
    dec a
    bne loc_02e46d

loc_02e47c:
    sep #$20
    lda #$ff
    sta $18b2
    sep #$20
    sep #$10

loc_02e487:
.i8
    jsl $02d956
    sep #$20
    lda $18b2
    bne loc_02e487

loc_02e492:
    sep #$20
    stz $15a8
    jml loc_03bddf

loc_02e49b:
.i16
    jsl sub_03d0fb
    bra loc_02e4b1

loc_02e4a1:
    jsl sub_03d106
    bra loc_02e4b1

loc_02e4a7:
    jsl sub_03d111
    bra loc_02e4b1

loc_02e4ad:
    jsl sub_03d0d6

loc_02e4b1:
    sep #$20
    rep #$10
    ldx $1fbb
    lda #$65
    sta $1fbd,x
    inx
    stx $1fbb
    stz $15a8
    jml loc_03bddf

loc_02e4c8:
.a16
    jsl sub_06bbda
    sep #$20
.a8
    rep #$10
    jsl sub_03aec8
    stz $1fdf
    lda #$00
    sta $7ea05a
    jsl sub_03a963
    lda #$01
    ldx #$b4df
    jsl sub_7e4ee9
    lda #$01
    sta $18b2
    sta $1fdd
    rep #$20
.a16
    stz $1f37
    lda #$0020
    sta $1f35
    lda #$0032

loc_02e500:
    pha
    jsr sub_02f0b3
    jsl sub_02fd84
    jsl $02d956
.a8
    rep #$20
.a16
    pla
    dec a
    bne loc_02e500
    sep #$20
.a8
    stz $1209
    rep #$20
.a16
    lda #$04b0

loc_02e51c:
    pha

loc_02e51d:
.a8
    jsr sub_02f06f
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    rep #$10
    ldx #$14a1
    lda $07,x
    bne loc_02e51d
    sep #$20
    lda $1202
    bit #$10
    bne loc_02e542
    rep #$20
.a16
    pla
    dec a
    bne loc_02e51c

loc_02e542:
.a8
    sep #$20
    lda #$ff
    sta $18b2

loc_02e549:
    jsr sub_02f06f
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda $18b2
    and #$ff
    bne loc_02e549
    sep #$20
    stz $1fdd
    lda #$01
    sta $1fdf
    lda #$01
    sta $7ea05a
    jsl sub_03e403
    jml loc_03bddf

loc_02e575:
    sep #$20
    rep #$10
    lda #$00
    sta $70021c
    rep #$30
.a16
    lda #$fdda
    sta $188a
    lda #$cbd2
    sta $188c
    stz $188e
    lda #$0001
    sta $1890
    stz $1892
    sep #$20
.a8
    lda #$c8
    sta $1f0f

loc_02e5a0:
    rep #$20
.a16
    dec $1890
    beq loc_02e5aa
    brl loc_02e615

loc_02e5aa:
    ldx $188e
    cpx $1fbb
    bne loc_02e5b5
    brl loc_02e615

loc_02e5b5:
    lda #$001e
    sta $1890
    lda #$cdfe
    ldx #$fe0c
    ldy $188a
    jsr sub_02ea7c
    jsr sub_02e6a3
    lda $188c
    ldx #$0000
    ldy $188a
    jsr sub_02ea7c
    jsr sub_02e6a3
    inc $188c
    inc $188c
    ldx $188e
    lda $1fbd,x
    inx
    stx $188e
    and #$00ff
    sta $14c5
    asl a
    asl a
    clc
    adc $14c5
    clc
    adc #$cbe6
    ldx #$0258
    ldy $188a
    jsr sub_02ea7c
    jsr sub_02e6a3
    lda $188a
    clc
    adc #$00c8
    sta $188a
    inc $1892
    inc $1892

loc_02e615:
    sep #$20
.a8
    lda $1f0f
    cmp #$c8
    beq loc_02e621
    dec $1f0f

loc_02e621:
    jsl $02d956
    sep #$20
    lda $1f0f
    cmp #$c9
    beq loc_02e631
    brl loc_02e5a0

loc_02e631:
    jsr sub_02e768
    rep #$20
.a16
    lda #$0050

loc_02e639:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e639
    sep #$20
.a8
    lda #$09
    sta $1fd2
    rep #$20
.a16
    lda #$0172

loc_02e650:
    pha
    jsl $02d956
    rep #$20
    pla
    pha
    cmp #$000f
    bcs loc_02e667
    sep #$20
.a8
    lda #$ff
    sta $18b2
    rep #$20

loc_02e667:
.a16
    pla
    dec a
    bne loc_02e650
    jsl sub_1fdc89
    sep #$20
.a8
    rep #$10
    jsl sub_03aebd
    lda #$0d
    ldx #$7114
    sta $1ff4
    stx $16fd
    jsl sub_02e2cc
    stz $1fd2

loc_02e689:
    jsl sub_02fd84
    jsl $02d956
    sep #$20
    lda $1fd2
    cmp #$08
    bne loc_02e689
    jsr sub_02e8e1

loc_02e69d:
    jsl $02d956
    bra loc_02e69d

sub_02e6a3:
.a16
    php
    sep #$20
.a8
    phx
    ldx $1892
    jmp (tbl_02e6ad,x)

tbl_02e6ad:
    .db $c3,$e6,$d2,$e6,$e1,$e6,$f0,$e6,$ff,$e6,$0e,$e7,$1d,$e7,$2c,$e7
    .db $38,$e7,$44,$e7,$50,$e7

loc_02e6c3:
    plx
    rep #$20
.a16
    lda #$48a0
    sta $28,x
    sep #$20
.a8
    lda #$01
    jmp loc_02e75c

loc_02e6d2:
    plx
    rep #$20
.a16
    lda #$48d2
    sta $28,x
    sep #$20
.a8
    lda #$02
    jmp loc_02e75c

loc_02e6e1:
    plx
    rep #$20
.a16
    lda #$4904
    sta $28,x
    sep #$20
.a8
    lda #$03
    jmp loc_02e75c

loc_02e6f0:
    plx
    rep #$20
.a16
    lda #$4936
    sta $28,x
    sep #$20
.a8
    lda #$04
    jmp loc_02e75c

loc_02e6ff:
    plx
    rep #$20
.a16
    lda #$4968
    sta $28,x
    sep #$20
.a8
    lda #$05
    jmp loc_02e75c

loc_02e70e:
    plx
    rep #$20
.a16
    lda #$499a
    sta $28,x
    sep #$20
.a8
    lda #$06
    jmp loc_02e75c

loc_02e71d:
    plx
    rep #$20
.a16
    lda #$49cc
    sta $28,x
    sep #$20
.a8
    lda #$07
    jmp loc_02e75c

loc_02e72c:
    plx
    rep #$20
.a16
    lda #$4834
    sta $28,x
    sep #$20
.a8
    plp
    rts

loc_02e738:
    plx
    rep #$20
.a16
    lda #$484f
    sta $28,x
    sep #$20
.a8
    plp
    rts

loc_02e744:
    plx
    rep #$20
.a16
    lda #$486a
    sta $28,x
    sep #$20
.a8
    plp
    rts

loc_02e750:
    plx
    rep #$20
.a16
    lda #$4885
    sta $28,x
    sep #$20
.a8
    plp
    rts

loc_02e75c:
    cmp $1fbb
    bne loc_02e766
    lda #$1e
    sta $1f0f

loc_02e766:
    plp
    rts

sub_02e768:
    sep #$20
    lda #$01
    sta $1f0f
    rep #$30
.a16
    lda #$000e
    sta $1892
    jsr sub_02e8ac
    lda $14c5
    sta $700062
    lda $1fbb
    sec
    sbc $7ea058
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b6b7
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $700062
    sta $1957
    asl a
    asl a
    clc
    adc $1957
    clc
    adc #$cbe6
    pha
    lda #$cde4
    ldx #$0000
    ldy #$f9c0
    jsr sub_02ea7c
    jsr sub_02e6a3
    rep #$20
    inc $1892
    inc $1892
    lda #$0019

loc_02e7c8:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e7c8
    rep #$20
    jsr sub_02e8ac
    lda $14c5
    sta $18
    lda #$ff38
    sta $16
    lda $18
    ldx #$ffff

loc_02e7e7:
    inx
    sec
    sbc #$0064
    bpl loc_02e7e7
    clc
    adc #$0064
    sta $18
    txa
    ora #$0000
    beq loc_02e806
    ldx #$fed4
    ldy #$fa88
    jsr sub_02ea77
    jsr sub_02e6a3

loc_02e806:
    lda $18
    ldx #$ffff

loc_02e80b:
    inx
    sec
    sbc #$000a
    bpl loc_02e80b
    clc
    adc #$000a
    sta $18
    txa
    ora #$0000
    ldx #$ff6a
    ldy #$fa88
    jsr sub_02ea77
    jsr sub_02e6a3
    lda $18
    ldx #$0000
    ldy #$fa88
    jsr sub_02ea77
    jsr sub_02e6a3
    lda #$0000
    ldx #$0096
    ldy #$fa88
    jsr sub_02ea77
    jsr sub_02e6a3
    lda #$0000
    ldx #$012c
    ldy #$fa88
    jsr sub_02ea77
    jsr sub_02e6a3
    rep #$20
    inc $1892
    inc $1892
    lda #$0019

loc_02e85f:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e85f
    lda #$cdf0
    ldx #$0000
    ldy #$fcae
    jsr sub_02ea7c
    jsr sub_02e6a3
    inc $1892
    inc $1892
    lda #$0019

loc_02e882:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e882
    pla
    ldx #$0000
    ldy #$fd76
    jsr sub_02ea7c
    jsr sub_02e6a3
    inc $1892
    inc $1892
    sep #$20
.a8
    stz $1f0f
    rep #$20
.a16
    rts

sub_02e8a8:
    jsr sub_02e8ac
    rtl

sub_02e8ac:
    stz $14c5
    lda #$0000
    sta $7ea058
    ldx #$0000

loc_02e8b9:
    cpx $1fbb
    beq loc_02e8e0
    lda $001fbd,x
    and #$00ff
    cmp #$0065
    bne loc_02e8d6
    lda $7ea058
    inc a
    sta $7ea058
    lda #$0000

loc_02e8d6:
    clc
    adc $14c5
    sta $14c5
    inx
    bra loc_02e8b9

loc_02e8e0:
    rts

sub_02e8e1:
.a8
    rep #$30
.a16
    jsr sub_02e8ac
    lda $14c5
    sta $700062
    lda $1fbb
    sec
    sbc $7ea058
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b6b7
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $700062
    sta $1957
    asl a
    asl a
    clc
    adc $1957
    clc
    adc #$cbe6
    pha
    lda #$cde4
    ldx #$01f4
    ldy #$02ee
    jsr sub_02eb15
    rep #$20
    lda #$000a

loc_02e92b:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e92b
    rep #$20
    jsr sub_02e8ac
    lda $14c5
    sta $18
    lda #$ff38
    sta $16
    lda $18
    ldx #$ffff

loc_02e94a:
    inx
    sec
    sbc #$0064
    bpl loc_02e94a
    clc
    adc #$0064
    sta $18
    txa
    ora #$0000
    beq loc_02e966
    ldx #$00c8
    ldy #$0384
    jsr sub_02eb10

loc_02e966:
    lda $18
    ldx #$ffff

loc_02e96b:
    inx
    sec
    sbc #$000a
    bpl loc_02e96b
    clc
    adc #$000a
    sta $18
    txa
    ora #$0000
    ldx #$015e
    ldy #$0384
    jsr sub_02eb10
    lda $18
    ldx #$01f4
    ldy #$0384
    jsr sub_02eb10
    lda #$0000
    ldx #$028a
    ldy #$0384
    jsr sub_02eb10
    lda #$0000
    ldx #$0320
    ldy #$0384
    jsr sub_02eb10
    rep #$20
    lda #$000a

loc_02e9ad:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e9ad
    lda #$cdf0
    ldx #$01f4
    ldy #$041a
    jsr sub_02eb15
    rep #$20
    lda #$000a

loc_02e9c9:
    pha
    jsl $02d956
    rep #$20
    pla
    dec a
    bne loc_02e9c9
    pla
    ldx #$01f4
    ldy #$04b0
    jsr sub_02eb15
    rts
    .db $0a,$18,$69,$d0,$cb,$8d,$57,$19,$e2,$20,$8b,$a9,$7e,$48,$ab,$ae
    .db $1d,$12,$c2,$20,$a9,$24,$d9,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f
    .db $b0,$04,$5c,$6b,$ea,$02,$bb,$c2,$20,$a9,$0e,$80,$95,$16,$e2,$20
    .db $a9,$04,$95,$18,$b5,$1d,$09,$40,$95,$1d,$b5,$1e,$09,$01,$95,$1e
    .db $a9,$0e,$9d,$df,$1c,$c2,$20,$ad,$57,$19,$9d,$ea,$1c,$e2,$20,$a9
    .db $00,$9d,$f4,$1c,$a9,$07,$9d,$f5,$1c,$c2,$20,$a9,$34,$48,$95,$28
    .db $e2,$20,$ac,$36,$12,$22,$ed,$da,$1f,$c2,$20,$b5,$0c,$18,$65,$16
    .db $95,$0c,$e2,$20,$c2,$20,$b5,$0e,$18,$69,$4c,$04,$95,$0e,$e2,$20
    .db $c2,$20,$b5,$10,$18,$69,$a0,$0f,$95,$10,$e2,$20,$ab,$c2,$20,$a5
    .db $16,$18,$69,$96,$00,$85,$16,$60

sub_02ea77:
    asl a
    clc
    adc #$cbd0

sub_02ea7c:
    sta $1957
    stx $1f3d
    sty $1f3f
    php
    sep #$20
.a8
    phb
    lda #$7e
    pha
    plb
    ldx $121d
    rep #$20
.a16
    lda #$d924
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_02eaa4
    jml loc_02eb0d

loc_02eaa4:
    tyx
    rep #$20
.a16
    lda #$800e
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    lda $1d,x
    ora #$40
    sta $1d,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$03
    sta $1cdf,x
    rep #$20
.a16
    lda $1957
    sta $1cea,x
    sep #$20
.a8
    lda #$00
    sta $1cf4,x
    lda #$03
    sta $1cf5,x
    rep #$20
.a16
    lda #$4834
    sta $28,x
    sep #$20
.a8
    ldy $159e
    jsl sub_1fdaed
    rep #$20
.a16
    lda $0c,x
    clc
    adc $1f3d
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc $1f3f
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0fa0
    sta $10,x
    sep #$20
.a8
    sep #$20

loc_02eb0d:
    plb
    plp
    rts

sub_02eb10:
.a16
    asl a
    clc
    adc #$cbd0

sub_02eb15:
    sta $1957
    stx $1f3d
    sty $1f3f
    php
    sep #$20
.a8
    phb
    lda #$7e
    pha
    plb
    ldx $121d
    rep #$20
.a16
    lda #$d924
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_02eb3d
    jml loc_02eba4

loc_02eb3d:
    tyx
    rep #$20
.a16
    lda #$800e
    sta $16,x
    sep #$20
.a8
    lda #$04
    sta $18,x
    lda $1d,x
    ora #$40
    sta $1d,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$05
    sta $1cdf,x
    rep #$20
.a16
    lda $1957
    sta $1cea,x
    sep #$20
.a8
    lda #$00
    sta $1cf4,x
    lda #$03
    sta $1cf5,x
    rep #$20
.a16
    lda #$4820
    sta $28,x
    sep #$20
.a8
    ldy $1238
    jsl sub_1fdaed
    rep #$20
.a16
    lda $0c,x
    clc
    adc $1f3d
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc $1f3f
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0e10
    sta $10,x
    sep #$20

loc_02eba4:
.a8
    sep #$20
    plb
    plp
    rts
    .db $fc,$e7,$03,$e8,$f4,$e7,$0f,$00,$60,$00,$ad,$00,$0b,$00,$5b,$00
    .db $aa,$00,$02,$58,$0c,$58,$16,$58

sub_02ebc1:
.a16
    php
    sep #$30
.a8
.i8
    lda #$00
    ldx $18a0
    beq loc_02ebce
    clc
    adc #$05

loc_02ebce:
    ldx $18a2
    beq loc_02ebd6
    clc
    adc #$05

loc_02ebd6:
    ldx $18a1
    beq loc_02ebde
    clc
    adc #$05

loc_02ebde:
    rep #$30
.a16
.i16
    and #$00ff
    sta $14c5
    sep #$20
.a8
    stz $15b8
    rep #$20
.a16
    lda $173c
    and #$00ff
    beq loc_02ec16
    sta $70002c
    lda $14d9
    and #$00ff
    sta $700062
    sep #$20
.a8
    lda #$01
    ldx #$b6a2
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $700062

loc_02ec16:
    clc
    adc $14c5
    cmp #$0064
    bcc loc_02ec22
    lda #$0064

loc_02ec22:
    sta $18
    plp
    rts

sub_02ec26:
.a8
    rep #$30
.a16
    jsr sub_02ebc1
    lda $1fd2
    cmp #$0006
    bne loc_02ec36
    brl loc_02ef57

loc_02ec36:
    rep #$30
    jsr sub_02e8ac
    lda $14c5
    sta $22
    stz $16
    stz $1a
    stz $20
    stz $24

loc_02ec48:
    jsl $02d956
    rep #$30
    lda #$0010
    sta $700062
    lda #$002c
    sta $70002c
    lda #$e79e
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    rep #$20
    jsr sub_02e8ac
    lda $14c5
    sta $70002e
    lda #$00b0
    sta $700062
    lda #$0027
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b6c8
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    sep #$20
.a8
    lda #$01
    ldx #$b75a
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $1a
    beq loc_02ecf6
    dec a
    bne loc_02ecf6
    lda #$0010
    sta $700062
    lda #$0018
    sta $70002c
    lda #$e7c1
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $24
    bne loc_02ecdc
    brl loc_02ed98

loc_02ecdc:
    dec a
    sta $24
    cmp #$0001
    beq loc_02ece7
    brl loc_02ed98

loc_02ece7:
    sep #$20
.a8
    inc $1898
    lda #$01
    sta $1fcd
    rep #$20
.a16
    jmp loc_02ed98

loc_02ecf6:
    sta $1a
    cmp #$0002
    bne loc_02ed0c
    sep #$20
.a8
    lda #$1a
    jsl sub_03b7f9
    rep #$20
.a16
    lda #$000a
    sta $24

loc_02ed0c:
    lda #$0010
    sta $700062
    lda #$0018
    sta $70002c
    lda #$e7ab
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda #$003c
    sta $700062
    lda #$0018
    sta $70002c
    lda $16
    sta $70006c
    sep #$20
.a8
    lda #$01
    ldx #$b674
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda #$00b0
    sta $700062
    lda #$0018
    sta $70002c
    lda $16
    sta $70002e
    sep #$20
.a8
    lda #$01
    ldx #$b6c8
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    lda $700062
    clc
    adc #$0004
    sta $700062
    lda #$e7d1
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10

loc_02ed98:
    lda $20
    beq loc_02ed9f
    brl loc_02edcb

loc_02ed9f:
    sep #$20
.a8
    lda #$12
    jsl sub_03b7f9
    rep #$20
.a16
    lda $16
    clc
    adc #$0003
    sta $16
    cmp $18
    bmi loc_02edb9
    bvs loc_02edbd
    bra loc_02edbb

loc_02edb9:
    bvc loc_02edbd

loc_02edbb:
    bra loc_02edc0

loc_02edbd:
    jmp loc_02edf2

loc_02edc0:
    lda $18
    sta $16
    lda #$0014
    sta $20
    bra loc_02edf2

loc_02edcb:
    cmp #$0001
    beq loc_02edf2
    dec a
    sta $20
    cmp #$0002
    bne loc_02edf2
    sep #$20
.a8
    lda #$11
    jsl sub_03b7f9
    ldx $1fbb
    lda $18
    sta $001fbd,x
    inx
    stx $1fbb
    rep #$20
.a16
    jsr sub_02ef65

loc_02edf2:
    rep #$20
    lda #$0030
    sta $700062
    lda #$0045
    sta $70002c
    lda #$e7df
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    ldx #$0000
    ldy #$0000
    lda #$000b
    sta $700062
    sta $1f3d

loc_02ee28:
    lda #$0088
    sta $70002c
    lda $18a0,y
    and #$00ff
    sta $70002e
    phx
    sep #$20
.a8
    lda #$01
    ldx #$b799
    jsl sub_7e4ee9
    plx
    phx
    rep #$20
.a16
    lda $70002e
    beq loc_02ee73
    lda $02ebaf,x
    sta $700062
    lda #$0096
    sta $70002c
    lda $02eba9,x
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    bra loc_02eeba

loc_02ee73:
.a16
    lda $02ebaf,x
    sta $700062
    lda #$0089
    sta $70002c
    lda $02eba9,x
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rep #$20
.a16
    plx
    phx
    lda $02ebb5,x
    sta $700062
    lda #$0097
    sta $70002c
    lda #$e80a
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9

loc_02eeba:
    plx
    phx
    lda $02ebbb,x
    sta $700026
    lda $02ebbc,x
    sta $700028
    lda #$00
    sta $700027
    sta $700029
    lda $18a0,y
    bne loc_02eeee
    lda $15bb
    and #$01
    rep #$20
.a16
    bne loc_02eee9
    lda #$e224
    bra loc_02ef07

loc_02eee9:
    lda #$c1a4
    bra loc_02ef07

loc_02eeee:
.a8
    rep #$20
.a16
    cpx #$0000
    beq loc_02eeff
    cpx #$0002
    beq loc_02ef04
    lda #$d324
    bra loc_02ef07

loc_02eeff:
    lda #$c924
    bra loc_02ef07

loc_02ef04:
    lda #$ce24

loc_02ef07:
    sta $700018
    sep #$20
.a8
    lda #$01
    ldx #$d15b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    plx
    rep #$20
    inx
    inx
    iny
    lda $001f3d
    clc
    adc #$0050
    sta $1f3d
    sta $700062
    cpy #$0003
    beq loc_02ef37
    brl loc_02ee28

loc_02ef37:
    sep #$20
.a8
    lda $1c
    cmp #$00
    bne loc_02ef42
    brl loc_02ec48

loc_02ef42:
    sep #$20
    lda $1c
    cmp #$02
    beq loc_02ef4d
    brl loc_02ef53

loc_02ef4d:
    jsl $02d956
    bra loc_02ef42

loc_02ef53:
    stz $1fcd
    rts

loc_02ef57:
.a16
    ldx $1fbb
    lda $18
    sta $001fbd,x
    inx
    stx $1fbb
    rts

sub_02ef65:
    jsr sub_02e8ac
    ldx #$0000

loc_02ef6b:
    lda $02ef8d,x
    cmp $14c5
    beq loc_02ef7a
    bcc loc_02ef7a
    inx
    inx
    bra loc_02ef6b

loc_02ef7a:
    cmp $22
    beq loc_02ef86
    bmi loc_02ef84
    bvc loc_02ef87
    bra loc_02ef86

loc_02ef84:
    bvs loc_02ef87

loc_02ef86:
    rts

loc_02ef87:
    lda #$0014
    sta $1a
    rts
    .db $34,$08,$6c,$07,$a4,$06,$dc,$05,$14,$05,$4c,$04,$84,$03,$bc,$02
    .db $f4,$01,$2c,$01,$64,$00,$00,$00

sub_02efa5:
.a8
    php
    sep #$20
    rep #$10
    lda $1fd1
    bne loc_02f015
    lda $1962
    cmp #$ff
    bne loc_02f015
    lda #$02
    sta $1f52
    jsl $02d956
    jsr sub_02f017
    jsl $02d956
    sep #$20

loc_02efc8:
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda JOY1H
    bit #$10
    bne loc_02efc8

loc_02efdc:
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda JOY1H
    bit #$10
    beq loc_02efdc

loc_02eff0:
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda JOY1H
    bit #$10
    bne loc_02eff0
    stz $1202
    stz $1204
    stz $1201
    stz $1203
    lda #$01
    sta $1f52

loc_02f015:
    plp
    rts

sub_02f017:
    rep #$30
.a16
    lda #$005a
    sta $700062
    lda #$005a
    sta $70002c
    lda #$e796
    sta $7000a6
    sep #$20
.a8
    lda #$01
    ldx #$b54b
    jsl sub_7e4ee9
    rts
    .db $08,$e2,$20,$c2,$10,$da,$e2,$20,$c2,$10,$ad,$c1,$14,$09,$10,$8d
    .db $c1,$14,$a2,$a1,$14,$e2,$20,$c2,$10,$74,$04,$a9,$02,$95,$05,$a9
    .db $e6,$95,$06,$a9,$e0,$15,$07,$95,$00,$b5,$07,$c9,$0f,$f0,$03,$1a
    .db $95,$07,$fa,$28,$60

sub_02f06f:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$10
    sta $14c1
    ldx #$14a1
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$e6
    sta $06,x
    lda #$e0
    ora $07,x
    sta $00,x
    lda $07,x
    beq loc_02f0a2
    dec a
    sta $07,x
    plx
    plp
    rts

loc_02f0a2:
    sep #$20
    lda $14c1
    and #$ef
    sta $14c1
    sep #$20
    rep #$10
    plx
    plp
    rts

sub_02f0b3:
.a16
    php
    sep #$20
.a8
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$10
    sta $14c1
    ldx #$14a1
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$e6
    sta $06,x
    lda #$ff
    sta $00,x
    lda #$1f
    sta $07,x
    plx
    plp
.a16
    rts
    .db $08,$e2,$20,$c2,$10,$a5,$00,$d0,$fc,$a9,$02,$85,$00,$9c,$00,$12
    .db $ad,$bb,$18,$f0,$fb,$22,$16,$dc,$02,$ad,$bb,$18,$c9,$02,$d0,$f9
    .db $9c,$bb,$18,$22,$27,$db,$02,$22,$bf,$dc,$02,$c2,$30,$ad,$f9,$16
    .db $8f,$9e,$01,$70,$f0,$04,$22,$f7,$ba,$03,$22,$e6,$f4,$02,$22,$10
    .db $4f,$7e,$28,$60

sub_02f125:
    sep #$30
.a8
.i8
    sei
    stz NMITIMEN
    stz $00
    stz $18b3
    lda TIMEUP
    rep #$20
.a16
    lda $003030
    lda #$0021
    sta $1260
    jsl sub_02f907
    stz CGADD
    stz VMADDL
    stz VMADDH
    lda #$0080
    sta INIDISP
    sta VMAIN
    lda #$0000
    ldx #$7f

loc_02f15a:
    ldy #$00

loc_02f15c:
    sta VMDATAL
    sta VMDATAH
    dey
    bne loc_02f15c
    dex
    bne loc_02f15a
    rep #$30
.i16
    lda #$2c00
    sta VMADDL
    lda #$02a1
    ldx #$0400

loc_02f176:
    sta VMDATAL
    dex
    bne loc_02f176
    sep #$20
.a8
    rep #$10
    jsl sub_02f307
    rep #$10
    ldx #$0000
    stx $4a
    ldx #$3000
    stx $4c
    ldx #$2c00
    stx $44
    ldx #$2c00
    stx $46
    lda $45
    lsr a
    lsr a
    sta GSU_SCBR
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    lda #$03
    sta OBSEL
    lda #$2c
    sta BG1SC
    lda #$73
    sta BG2SC
    lda #$02
    sta BGMODE
    jsl sub_02db56
.a16
    jsl sub_02dbe2
    sep #$20
.a8
    rep #$10
    lda #$01
    jsl sub_02f464
    jsl sub_03db17
    lda #$22
    sta BBAD0
    lda #$80
    sta CGADD
    ldx #$1360
    stx A1TL0
    lda #$7f
    sta A1B0
    ldx #$0100
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    stz W12SEL
    stz W34SEL
    lda #$20
    sta WOBJSEL
    stz WBGLOG
    lda #$0c
    sta WOBJLOG
    stz TMW
    stz TSW
    stz WH0
    stz WH1
    lda #$17
    sta TM
    lda #$07
    sta TS
    jsl sub_02f8f0
    sep #$20
    lda #$00
    sta DMAP1
    lda #$00
    sta BBAD1
    ldx #$45f1
    stx A1TL1
    lda #$7e
    sta A1B1
    stz DASB1
    lda #$02
    sta DMAP2
    lda #$0f
    sta BBAD2
    ldx #$4619
    stx A1TL2
    lda #$7e
    sta A1B2
    stz DASB2
    lda #$01
    sta DMAP3
    lda #$26
    sta BBAD3
    ldx #$4169
    stx A1TL3
    lda #$7e
    sta A1B3
    stz DASB3
    lda #$02
    sta DMAP4
    lda #$10
    sta BBAD4
    ldx #$4bf7
    stx A1TL4
    lda #$7e
    sta A1B4
    stz DASB4
    lda #$1e
    sta $120e
    ldx #$4619
    stx $18b4
    ldx #$4908
    stx $18b6
    ldx #$4169
    stx $18a5
    ldx #$43ad
    stx $18a7
    stz $18a9
    jsl sub_02f42f
    sep #$20
    ldx #$00cf
    stx VTIMEL
    ldx #$0000
    stx HTIMEL
    lda #$80
    jsl sub_02f8df
    sta INIDISP
    stz $18b3
    lda #$02
    sta HDMAEN
    lda #$be
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda RDNMI
    lda #$31
    sta NMITIMEN
    lda #$ff
    sta $15ab
    lda $004211
    cli
    rtl
    php
    sei
    jsl sub_02f307
    lda $004211
    cli
    plp
    rtl

sub_02f307:
    sep #$20
    phb
    lda #$00
    pha
    plb
    lda #$80
    sta VMAIN
    rep #$30
.a16
    lda #$2c40
    sta VMADDL
    lda #$1c00
    ldy #$0000

loc_02f321:
    pha
    lda #$3aa0
    sta VMDATAL
    sta VMDATAL
    pla
    ldx #$0000

loc_02f32f:
    sta VMDATAL
    clc
    adc #$0018
    inx
    cpx #$001c
    bne loc_02f32f
    pha
    lda #$3aa0
    sta VMDATAL
    sta VMDATAL
    pla
    sec
    sbc #$029f
    iny
    cpy #$0018
    bne loc_02f321
    lda $70021c
    and #$00ff
    beq loc_02f3d2
    lda #$2f03
    sta VMADDL
    lda #$282e
    sta VMDATAL
    lda #$2f04
    sta VMADDL
    lda #$2846
    sta VMDATAL
    lda #$2f05
    sta VMADDL
    lda #$285e
    sta VMDATAL
    lda #$2f06
    sta VMADDL
    lda #$2876
    sta VMDATAL
    lda #$2f07
    sta VMADDL
    lda #$288e
    sta VMDATAL
    lda #$2f18
    sta VMADDL
    lda #$2a26
    sta VMDATAL
    lda #$2f19
    sta VMADDL
    lda #$2a3e
    sta VMDATAL
    lda #$2f1a
    sta VMADDL
    lda #$2a56
    sta VMDATAL
    lda #$2f1b
    sta VMADDL
    lda #$2a6e
    sta VMDATAL
    lda #$2f1c
    sta VMADDL
    lda #$2a86
    sta VMDATAL

loc_02f3d2:
    ldx #$2a00
    stx VMADDL
    ldx #$ffff
    ldy #$0010

loc_02f3de:
    stx VMDATAL
    dey
    bne loc_02f3de
    ldx #$5a00
    stx VMADDL
    ldx #$ffff
    ldy #$0010

loc_02f3f0:
    stx VMDATAL
    dey
    bne loc_02f3f0
    plb
    sep #$20
.a8
    rtl
    .db $20,$fe,$f3,$6b

sub_02f3fe:
.i8
    lda #$00
    sta $2a
    lda #$00
    sta $2b
    lda #$df
    sta $2e
    lda #$00
    sta $2f
    lda #$00
    sta $2c
    lda #$00
    sta $2d
    lda #$bf
    sta $30
    lda #$00
    sta $31
    lda #$70
    sta $ca
    lda #$00
    sta $cb
    lda #$60
    sta $cc
    lda #$00
    sta $cd
    rts

sub_02f42f:
.i16
    php
    sep #$20
    stz BG1HOFS
    stz BG1HOFS
    stz BG1VOFS
    stz BG1VOFS
    stz BG2HOFS
    stz BG2HOFS
    stz BG2VOFS
    stz BG2VOFS
    stz BG3HOFS
    stz BG3HOFS
    stz BG3VOFS
    stz BG3VOFS
    stz BG4HOFS
    stz BG4HOFS
    stz BG4VOFS
    stz BG4VOFS
    plp
    rtl

sub_02f464:
    php
    rep #$30
.a16
    and #$00ff
    xba
    lsr a
    lsr a
    lsr a
    tax
    sep #$20
.a8
    lda #$70
    sta CGADD
    ldy #$0000

loc_02f479:
    lda $038aaa,x
    sta CGDATA
    lda $038aab,x
    sta CGDATA
    inx
    inx
    iny
    iny
    cpy #$0020
    bne loc_02f479
    plp
    rtl

sub_02f492:
    php
    phb
    rep #$30
.a16
    and #$00ff
    xba
    lsr a
    lsr a
    lsr a
    tax
    sei
    sep #$20
.a8
    lda #$7e
    pha
    plb
    ldy #$0000
    rep #$20

loc_02f4aa:
.a16
    lda $038aaa,x
    sta $857e,y
    sta $1869,y
    inx
    inx
    iny
    iny
    cpy #$0020
    bne loc_02f4aa
    sep #$20
.a8
    lda $004211
    rep #$20
.a16
    cli
    plb
    plp
.a8
    rtl

sub_02f4c9:
    php
    rep #$30
.a16
    stz $121d
    lda #$0336
    sta $121f
    ldy #$0046

loc_02f4d8:
    tax
    clc
    adc #$0036
    sta $00,x
    dey
    bne loc_02f4d8
    stz $00,x
    plp
.a8
    rtl

sub_02f4e6:
.a16
    php
    jsr sub_02f58f
    sep #$20
.a8
    rep #$10
    sep #$20
    lda #$01
    ldx #$b17f
    jsl sub_7e4ee9
    sep #$20
    rep #$10
    plp
.a16
    rtl

sub_02f4ff:
.a8
    php
    phb
    sep #$20
    lda #$7e
    pha
    plb
    rep #$10
    ldx #$0ef2
    ldy $121d

loc_02f50f:
    sep #$20
    lda $0020,y
    and #$08
    bne loc_02f584
    rep #$20
.a16
    lda $0004,y
    stx $14c5
    tax
    lda $00000e,x
    ldx $14c5
    adc $700014,x
    bpl loc_02f560
    sep #$20
.a8
    lda $0008,y
    and #$f7
    sta $0008,y
    lda $14d0
    bit #$01
    bne loc_02f560
    lda $002e,y
    and #$04
    bne loc_02f560
    lda $0009,y
    and #$08
    beq loc_02f560
    phx
    tyx
    ldy $00,x
    jsl sub_1fbfdc
    rep #$20
.a16
    pla
    clc
    adc #$001e
    tax
    tya
    bra loc_02f589

loc_02f560:
.a8
    rep #$20
.a16
    lda $700012,x
    bpl loc_02f573
    lda $0008,y
    ora #$0014
    sta $0008,y
    bra loc_02f57c

loc_02f573:
    lda $0008,y
    ora #$0010
    sta $0008,y

loc_02f57c:
    rep #$20
    txa
    clc
    adc #$001e
    tax

loc_02f584:
.a8
    rep #$20
.a16
    lda $0000,y

loc_02f589:
    tay
    bne loc_02f50f
    plb
    plp
.a8
    rtl

sub_02f58f:
.a16
    php
    phb
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rep #$30
.a16
    stz $1ee5
    lda $195f
    sta $700220
    lda $c3
    sta $7000c8
    ldx #$0ef2
    ldy $121d

loc_02f5af:
    sep #$20
.a8
    sty $123a
    lda $0008,y
    and #$e1
    ora #$08
    sta $0008,y
    lda $0020,y
    and #$08
    beq loc_02f5c9
    jml loc_02f6c0

loc_02f5c9:
    lda $0009,y
    bit #$01
    rep #$20
.a16
    beq loc_02f5d7
    lda #$3a98
    bra loc_02f5da

loc_02f5d7:
    lda #$0000

loc_02f5da:
    sta $700002,x
    lda $000c,y
    sec
    sbc $c1
    sta $700012,x
    lda $000e,y
    sec
    sbc $c3
    sta $700010,x
    lda $0010,y
    sec
    sbc $c5
    sta $700014,x
    lda $0004,y
    sta $700008,x
    sep #$20
.a8
    lda $0012,y
    sta $700004,x
    lda $0013,y
    sta $700005,x
    lda $0014,y
    sta $700006,x
    sep #$20
    lda $0008,y
    and #$01
    beq loc_02f651
    lda $000a,y
    sta $700018,x
    lda $001d,y
    bit #$10
    beq loc_02f657
    rep #$20
.a16
    tya
    sta $70000a,x
    sep #$20
.a8
    lda $0022,y
    sta $70000c,x
    lda $0023,y
    sta $70000d,x
    lda $0024,y
    sta $70000e,x
    bra loc_02f657

loc_02f651:
    lda #$00
    sta $700018,x

loc_02f657:
    lda $001d,y
    sta $700007,x
    and #$fd
    sta $001d,y
    lda $1ce7,y
    bmi loc_02f66b
    lda $15bb

loc_02f66b:
    and #$7f
    sta $700019,x
    lda $1ce6,y
    bmi loc_02f679
    lda $15bb

loc_02f679:
    and #$7f
    sta $70001a,x
    lda $1cdf,y
    sta $70001b,x
    lda $1cf4,y
    sta $70001c,x
    lda $1cf5,y
    sta $70001d,x
    rep #$20
.a16
    cpy $1777
    bne loc_02f6b0
    lda $15bb
    and #$0007
    cmp #$0004
    bcc loc_02f6ab
    lda #$800c
    bra loc_02f6b3

loc_02f6ab:
    lda #$807c
    bra loc_02f6b3

loc_02f6b0:
    lda $1cea,y

loc_02f6b3:
    sta $700016,x
    inc $1ee5
    txa
    clc
    adc #$001e
    tax

loc_02f6c0:
.a8
    rep #$20
.a16
    lda $0000,y
    tay
    beq loc_02f6cb
    brl loc_02f5af

loc_02f6cb:
    lda $1ee5
    sta $7001b6
    plb
    plp
    rts

sub_02f6d5:
    jsr sub_02f6d9
    rtl

sub_02f6d9:
    rts

sub_02f6da:
.a8
    rep #$30
.a16
    ldy $1eed
    bne loc_02f6e2
    rtl

loc_02f6e2:
    ldx $1ee9
    ldy $1eed
    lda $02f7ff,x
    sta $1809,y
    dec $1ee9
    dec $1ee9
    dec $1eed
    dec $1eed
    rtl

sub_02f6fc:
.a8
    sep #$20
    lda $14d7
    and #$80
    beq loc_02f706
    rtl

loc_02f706:
    lda $1ef1
    bne loc_02f70c
    rtl

loc_02f70c:
    dec a
    sta $1ef1
    rep #$30
.a16
    ldx $1f15
    ldy $1f17
    lda $1f11

loc_02f71b:
    pha
    lda $1789,y
    and #$7c00
    sta $14c5
    lda $02f83f,x
    and #$7c00
    cmp $14c5
    beq loc_02f743
    bcs loc_02f73c
    lda $14c5
    sec
    sbc #$0400
    bra loc_02f743

loc_02f73c:
    lda $14c5
    clc
    adc #$0400

loc_02f743:
    sta $3a
    lda $1789,y
    and #$03e0
    sta $14c5
    lda $02f83f,x
    and #$03e0
    cmp $14c5
    beq loc_02f76c
    bcs loc_02f765
    lda $14c5
    sec
    sbc #$0020
    bra loc_02f76c

loc_02f765:
    lda $14c5
    clc
    adc #$0020

loc_02f76c:
    sta $3c
    lda $1789,y
    and #$001f
    sta $14c5
    lda $02f83f,x
    and #$001f
    cmp $14c5
    beq loc_02f78f
    bcs loc_02f78b
    lda $14c5
    dec a
    bra loc_02f78f

loc_02f78b:
    lda $14c5
    inc a

loc_02f78f:
    ora $3a
    ora $3c
    sta $1789,y
    iny
    iny
    inx
    inx
    pla
    dec a
    beq loc_02f7a1
    brl loc_02f71b

loc_02f7a1:
    rtl

sub_02f7a2:
.a8
    php
    phy
    phx
    phb
    sep #$20
    lda #$00
    pha
    plb
    rep #$30
.a16
    ldy #$0000
    lda #$0080

loc_02f7b4:
    pha
    lda $1789,y
    and #$7fe0
    sta $3a
    lda $1789,y
    and #$001f
    cmp #$0003
    beq loc_02f7ca
    bcs loc_02f7cd

loc_02f7ca:
    ora #$0003

loc_02f7cd:
    asl a
    cmp #$001f
    bcc loc_02f7d6
    lda #$001f

loc_02f7d6:
    and #$001f
    ora $3a
    sta $1789,y
    iny
    iny
    pla
    dec a
    bne loc_02f7b4
    lda #$0000
    sta $1867
    plb
    plx
    ply
    plp
.a8
    rtl

sub_02f7ef:
    phx
    sep #$20
    lda #$00
    ldx #$00df

loc_02f7f7:
    sta $1789,x
    dex
    bpl loc_02f7f7
    plx
    rtl
    .db $00,$00,$c0,$34,$e0,$38,$00,$3d,$20,$41,$40,$45,$60,$49,$80,$4d
    .db $a0,$51,$c0,$55,$e0,$59,$00,$5e,$20,$62,$40,$66,$60,$6a,$80,$6e
    .db $00,$00,$88,$00,$c9,$00,$ea,$04,$0b,$09,$2c,$0d,$4d,$11,$6e,$15
    .db $8f,$19,$b0,$1d,$d1,$21,$f2,$25,$13,$2a,$34,$2e,$55,$32,$76,$36
    .db $93,$25,$3d,$3f,$da,$32,$77,$26,$35,$1e,$f3,$15,$b2,$0d,$71,$05
    .db $50,$01,$0f,$01,$cd,$00,$8b,$00,$49,$00,$07,$00,$04,$00,$00,$00
    .db $93,$25,$13,$3a,$f2,$35,$d1,$31,$b0,$2d,$8f,$29,$6e,$25,$4d,$21
    .db $2c,$1d,$0b,$19,$ea,$14,$c9,$10,$a8,$0c,$87,$08,$66,$04,$45,$00
    .db $93,$25,$4a,$21,$29,$1d,$08,$19,$e7,$14,$c6,$10,$a5,$0c,$84,$08
    .db $63,$04,$42,$00,$21,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .db $93,$25,$36,$5b,$f4,$52,$b2,$4a,$70,$42,$2e,$3a,$ec,$31,$aa,$29
    .db $68,$21,$26,$19,$e4,$10,$a2,$04,$60,$00,$40,$00,$20,$00,$00,$00
    .db $00,$00,$2f,$00,$3a,$01,$bd,$0e,$7f,$23,$a2,$64,$47,$75,$8a,$7e
    .db $b1,$7f,$21,$04,$e7,$1c,$ad,$35,$73,$4e,$39,$67,$ff,$7f,$ec,$33

sub_02f8df:
.i8
    php
    sep #$20
    sta $7e45f4
    sta $7e45f6
    sta $7e45f8
    plp
    rtl

sub_02f8f0:
.i16
    php
    sep #$20
    lda #$5f
    sta $7e45f3
    lda #$2d
    sta $7e45f5
    lda #$32
    sta $7e45f7
    plp
    rtl

sub_02f907:
.i8
    php
    sep #$20
    rep #$10
.i16
    stz HDMAEN
    lda #$80
    sta INIDISP
    jsl sub_02f8df
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
    plp
.i8
    rtl

sub_02f934:
.i16
    sep #$20
    lda $1fc6
    beq loc_02f941
    stz $18c5
    stz $18c6

loc_02f941:
    lda $15ca
    and #$02
    beq loc_02f94c
    jml loc_02fab3

loc_02f94c:
    sep #$10
.i8
    rep #$20
.a16
    lda $1595
    bit #$0080
    beq loc_02f95d
    ora #$ff00
    bra loc_02f960

loc_02f95d:
    and #$00ff

loc_02f960:
    clc
    adc $14f6
    clc
    adc $14e6
    sta $c1
    lda $1596
    bit #$0080
    beq loc_02f977
    ora #$ff00
    bra loc_02f97a

loc_02f977:
    and #$00ff

loc_02f97a:
    clc
    adc $14f8
    clc
    adc $14e8
    sta $c3
    lda $1597
    bit #$0080
    beq loc_02f991
    ora #$ff00
    bra loc_02f994

loc_02f991:
    and #$00ff

loc_02f994:
    clc
    adc $14fa
    clc
    adc $14fe
    sta $c5
    lda $18c5
    sta $1633
    lda $18c7
    sec
    sbc $152a
    sta $1635
    lda $18c9
    sec
    sbc $1234
    sta $1637
    sep #$20
.a8
    lda $16f1
    bne loc_02f9c5
    sta $1638
    sta $1637

loc_02f9c5:
    sep #$20
    rep #$20
.a16
    lda $1633
    eor #$ffff
    inc a
    sta $162d
    stz $162f
    stz $1631
    sep #$20
.a8
    jsl sub_03b98a
    rep #$20
.a16
    lda $15d7
    sta $161b
    lda $15d9
    sta $161d
    lda $15db
    sta $161f
    lda $15dd
    sta $1621
    lda $15df
    sta $1623
    lda $15e1
    sta $1625
    lda $15e3
    sta $1627
    lda $15e5
    sta $1629
    lda $15e7
    sta $162b
    stz $02
    stz $08
    lda $18cb
    eor #$ffff
    inc a
    sta $90
    sep #$20
.a8
    jsl sub_03b950
    rep #$20
.a16
    stz $162d
    lda $1635
    eor #$ffff
    inc a
    sta $162f
    stz $1631
    sep #$20
.a8
    jsl sub_03b98a
    rep #$20
.a16
    lda $15d7
    sta $161b
    lda $15d9
    sta $161d
    lda $15db
    sta $161f
    lda $15dd
    sta $1621
    lda $15df
    sta $1623
    lda $15e1
    sta $1625
    lda $15e3
    sta $1627
    lda $15e5
    sta $1629
    lda $15e7
    sta $162b
    lda $b3
    sta $02
    lda $b5
    sta $08
    lda $b7
    sta $90
    sep #$20
.a8
    jsl sub_03b950
    clc
    lda $b3
    adc $c1
    sta $c1
    lda $b4
    adc $c2
    sta $c2
    clc
    lda $b5
    adc $c3
    sta $c3
    lda $b6
    adc $c4
    sta $c4
    clc
    lda $b7
    adc $c5
    sta $c5
    lda $b8
    adc $c6
    sta $c6

loc_02fab3:
    rep #$30
.a16
.i16
    ldx #$0300
    stx $1236
    lda $c1
    sta $0c,x
    lda $c3
    sta $0e,x
    lda $c5
    sta $10,x
    sep #$20
.a8
    lda $15ca
    and #$01
    bne loc_02fad4
    jml loc_02faf9

loc_02fad4:
    ldy $159e
    rep #$20
.a16
    jsl sub_1fd03e
    eor #$ffff
    inc a
    sta $1633
    sta $18c5
    jsl sub_1fd021
    sta $1635
    sta $18c7
    lda $18c9
    sta $1637
    sep #$20

loc_02faf9:
.a8
    rep #$20
.a16
    lda $1633
    eor #$ffff
    inc a
    sta $162d
    lda $1635
    eor #$ffff
    inc a
    sta $162f
    lda $1637
    eor #$ffff
    inc a
    sta $1631
    sep #$20
.a8
    jsl sub_03b98a
.i8
    rep #$20
.a16
    lda $15d7
    sta $161b
    lda $15d9
    sta $161d
    lda $15db
    sta $161f
    lda $15dd
    sta $1621
    lda $15df
    sta $1623
    lda $15e1
    sta $1625
    lda $15e3
    sta $1627
    lda $15e5
    sta $1629
    lda $15e7
    sta $162b
    rep #$20
    lda $1633
    sta $162d
    lda $1635
    sta $162f
    lda $1637
    sta $1631
    sep #$30
.a8
    jsl sub_03b98a
    rep #$20
.a16
    lda $15d7
    sta $161b
    lda $15d9
    sta $161d
    lda $15db
    sta $161f
    lda $15dd
    sta $1621
    lda $15df
    sta $1623
    lda $15e1
    sta $1625
    lda $15e3
    sta $1627
    lda $15e5
    sta $1629
    lda $15e7
    sta $162b
    sep #$20
.a8
    php
    rep #$30
.a16
.i16
    ldx $1238
    stz $08
    lda #$01f4
    sta $90
    sep #$20
.a8
    lda $12,x
    jsl sub_1fce84
    rep #$20
.a16
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    sep #$20
.a8
    lda $13,x
    jsl sub_1fcdf0
    rep #$20
.a16
    lda $04
    clc
    adc $0c,x
    sec
    sbc $c1
    sta $700062
    lda $0a
    clc
    adc $0e,x
    sec
    sbc $c3
    sta $70002c
    lda $15c2
    clc
    adc $10,x
    sec
    sbc $c5
    sta $70002e
    sep #$20
.a8
    lda $14db
    cmp #$03
    beq loc_02fc0b
    jml loc_02fc1b

loc_02fc0b:
    rep #$20
.a16
    lda $70002c
    clc
    adc #$0032
    sta $70002c
    sep #$20

loc_02fc1b:
.a8
    lda #$01
    ldx #$823e
    jsl sub_7e4ee9
    rep #$20
.a16
    lda $700026
    sta $02
    lda $700028
    sta $000008
    lda $70002a
    sta $90
    sep #$30
.a8
.i8
    jsl sub_03b9f2
    plp
    rep #$20
.a16
    lda $72
    sec
    sbc #$0070
    sta $16f2
    lda $74
    sec
    sbc #$0060
    sta $16f4
    sep #$20
.a8
    rtl

sub_02fc58:
.i16
    jsr sub_02fc5c
    rtl

sub_02fc5c:
    lda $ef
    clc
    sbc $f0
    sta $f0
    sbc $f1
    sta $f1
    sbc $f2
    sta $f2
    sbc $ef
    sta $ef
    rts

sub_02fc70:
.i8
    jsr sub_02fc74
    rtl

sub_02fc74:
    stz $68
    stz $69
    stz $67
    lda $65
    bmi loc_02fca1
    asl a
    sta WRMPYA
    lda $64
    bmi loc_02fc92
    lda $63
    sta WRMPYB
    nop
    nop
    lda $64
    jmp loc_02fcda

loc_02fc92:
    lda #$00
    sec
    sbc $63
    sta WRMPYB
    lda #$00
    sbc $64
    jmp loc_02fcb6

loc_02fca1:
    eor #$ff
    inc a
    asl a
    sta WRMPYA
    lda $64
    bmi loc_02fccc
    lda $63
    sta WRMPYB
    nop
    nop
    nop
    lda $64

loc_02fcb6:
    ldy RDMPYH
    sta WRMPYB
    sty $66
    rep #$20
.a16
    lda $68
    sec
    sbc RDMPYL
    sec
    sbc $66
    jmp loc_02fcec

loc_02fccc:
.a8
    lda #$00
    sec
    sbc $63
    sta WRMPYB
    nop
    nop
    lda #$00
    sbc $64

loc_02fcda:
    ldy RDMPYH
    sta WRMPYB
    sty $66
    rep #$21
.a16
    lda $68
    adc RDMPYL
    clc
    adc $66

loc_02fcec:
    sta $66
    sep #$20
.a8
    rts

sub_02fcf1:
.i16
    jsr sub_02fcf7
    rep #$20
.a16
    rtl

sub_02fcf7:
.a8
    phx
    php
    rep #$20
.a16
    lda $02
    sta $700062
    lda $08
    sta $70002c
    sep #$20
.a8
    rep #$10
    lda #$01
    ldx #$81aa
    jsl sub_7e4ee9
    rep #$20
.a16
    lda $700040
    plp
.a8
    plx
    rts

sub_02fd1d:
    jsr sub_02fd21
    rtl

sub_02fd21:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$04
    sta $14c1
    ldx #$1491
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$07
    sta $06,x
    lda #$e0
    ora $07,x
    sta $00,x
    lda $07,x
    cmp #$1f
    beq loc_02fd53
    inc a
    sta $07,x

loc_02fd53:
    plx
    plp
    rts

sub_02fd56:
    php
    sep #$20
    rep #$10
    lda #$28
    sta $1962
    sep #$20
    rep #$10
    lda $14c1
    ora #$02
    sta $14c1
    ldx #$1489
    sep #$20
    rep #$10
    lda #$1e
    sta $07,x
    stz $04,x
    jsl sub_02fd84
    sep #$20
    stz $18b3
    plp
    rtl

sub_02fd84:
.i8
    php
    sep #$20
    rep #$10
.i16
    lda $1962
    inc a
    beq loc_02fde7
    sep #$20
    rep #$10
    lda $14c1
    ora #$02
    sta $14c1
    ldx #$1489
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$a7
    sta $06,x
    lda $07,x
    ora #$e0
    sta $00,x
    lda $1962
    bne loc_02fdd8
    lda $7ef0b3
    beq loc_02fdc7
    lda $07,x
    beq loc_02fde2
    dec a
    dec a
    sta $07,x
    bra loc_02fde5

loc_02fdc7:
    inc a
    sta $7ef0b3
    rep #$20
.a16
    lda #$0118
    sta $16ab
    sep #$20
.a8
    lda #$00

loc_02fdd8:
    stz $04,x
    lda #$e7
    sta $06,x
    lda #$ff
    sta $00,x

loc_02fde2:
    dec $1962

loc_02fde5:
    plp
.i8
    rtl

loc_02fde7:
.i16
    sep #$20
    lda $14c1
    and #$fd
    sta $14c1
    sep #$20
    rep #$10
    jmp loc_02fde5

sub_02fdf8:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$40
    sta $14c1
    ldx #$14b1
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$27
    sta $06,x
    stz $01,x
    lda #$1f
    sta $02,x
    sta $03,x
    stz $00,x
    plx
    plp
    rtl

sub_02fe28:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$40
    sta $14c1
    ldx #$14b1
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$27
    sta $06,x
    stz $01,x
    lda #$07
    sta $02,x
    sta $03,x
    stz $00,x
    plx
    plp
    rtl

sub_02fe58:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$40
    sta $14c1
    ldx #$14b1
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$27
    sta $06,x
    stz $00,x
    lda #$1f
    sta $01,x
    stz $02,x
    stz $03,x
    plx
    plp
    rtl
    .db $08,$e2,$20,$c2,$10,$da,$e2,$20,$c2,$10,$ad,$c1,$14,$09,$20,$8d
    .db $c1,$14,$a2,$a9,$14,$e2,$20,$c2,$10,$74,$04,$a9,$02,$95,$05,$a9
    .db $27,$95,$06,$74,$00,$a9,$0a,$95,$01,$74,$02,$74,$03,$fa,$28,$6b
    .db $08,$e2,$20,$c2,$10,$da,$e2,$20,$ad,$c1,$14,$29,$df,$8d,$c1,$14
    .db $e2,$20,$c2,$10,$fa,$28,$6b,$08,$e2,$20,$c2,$10,$da,$e2,$20,$c2
    .db $10,$ad,$c1,$14,$09,$04,$8d,$c1,$14,$a2,$91,$14,$e2,$20,$c2,$10
    .db $a9,$1f,$95,$07,$fa,$28,$20,$f6,$fe,$6b,$20,$f6,$fe,$6b,$08,$e2
    .db $20,$c2,$10,$da,$e2,$20,$c2,$10,$ad,$c1,$14,$09,$04,$8d,$c1,$14
    .db $a2,$91,$14,$e2,$20,$c2,$10,$74,$04,$a9,$02,$95,$05,$a9,$07,$95
    .db $06,$a9,$e0,$15,$07,$95,$00,$b5,$07,$f0,$06,$3a,$95,$07,$fa,$28
    .db $60,$e2,$20,$ad,$c1,$14,$29,$fb,$8d,$c1,$14,$e2,$20,$c2,$10,$fa
    .db $28,$60

sub_02ff3a:
    php
    sep #$20
    rep #$10
    phx
    sep #$20
    rep #$10
    lda $14c1
    ora #$20
    sta $14c1
    ldx #$14a9
    sep #$20
    rep #$10
    stz $04,x
    lda #$02
    sta $05,x
    lda #$27
    sta $06,x
    stz $01,x
    lda #$1f
    sta $02,x
    sta $03,x
    stz $00,x
    plx
    plp
    rtl
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff
