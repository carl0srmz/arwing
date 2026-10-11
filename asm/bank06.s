.rombank $06

    .db $a9,$7e,$48,$ab

sub_068004:
.cpu
.a8
.i16
    rep #$20
.a16
    stz $18c5
    stz $18c7
    stz $18c9
    stz $1956
    lda #$0000
    sta $70019a
    sep #$20
.a8
    stz $14d0
    lda #$08
    sta $14d1
    stz $14d3
    stz $14d2
    lda #$01
    sta $15ac
    lda #$28
    sta $7001bc
    sep #$20
    rep #$10
    stz $1956
    phb
    lda #$7e
    pha
    plb
    ldx $121d

loc_068043:
    stz $1248
    jsl sub_1fd26b
    lda $1248
    bne loc_068056
    ldy $00,x

loc_068051:
    tyx
    bne loc_068043
    bra loc_06805e

loc_068056:
    ldy $00,x
    jsl sub_1fbfdc
    bra loc_068051

loc_06805e:
    jsl sub_0681d5
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_068076
    jml loc_068093

loc_068076:
    sty $156b
    lda $0009,y
    and #$f7
    sta $0009,y
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $0020,y
    ora #$01
    sta $0020,y
    bra loc_068097

loc_068093:
    jml loc_1fbdee

loc_068097:
    ldx $1238
    lda $1f,x
    and #$f7
    sta $1f,x
    lda $20,x
    ora #$01
    sta $20,x
    ldx $1567
    lda $1f,x
    and #$f7
    sta $1f,x
    lda $20,x
    ora #$01
    sta $20,x
    ldx $1563
    lda $1f,x
    and #$f7
    sta $1f,x
    lda $20,x
    ora #$01
    sta $20,x
    ldx $1565
    lda $1f,x
    and #$f7
    sta $1f,x
    lda $20,x
    ora #$01
    sta $20,x
    plb
    rtl
    .db $20,$d3,$ac,$d3,$74,$d3,$e4,$d3,$60,$c3,$98,$c3,$7c,$c3,$b4,$c3
    .db $a1,$ac,$a1,$ac,$a1,$ac,$a1,$ac,$64,$d7,$64,$d7,$64,$d7,$64,$d7
    .db $a1,$ac,$a1,$ac,$a1,$ac,$a1,$ac,$e8,$d2,$90,$d3,$58,$d3,$c8,$d3
    .db $68,$dd,$b8,$d7,$9c,$d7,$80,$d7,$0a,$0a,$0a,$8d,$32,$15,$ad,$d6
    .db $14,$29,$18,$f0,$59,$89,$08,$f0,$1f,$89,$10,$d0,$36,$da,$bb,$7a
    .db $da,$c2,$20,$ad,$32,$15,$29,$ff,$00,$aa,$bf,$d7,$80,$06,$fa,$95
    .db $04,$e2,$20,$da,$bb,$7a,$80,$4f,$da,$bb,$7a,$da,$c2,$20,$ad,$32
    .db $15,$29,$ff,$00,$aa,$bf,$d9,$80,$06,$fa,$95,$04,$e2,$20,$da,$bb
    .db $7a,$80,$34,$da,$bb,$7a,$da,$c2,$20,$ad,$32,$15,$29,$ff,$00,$aa
    .db $bf,$db,$80,$06,$fa,$95,$04,$e2,$20,$da,$bb,$7a,$80,$19,$da,$bb
    .db $7a,$da,$c2,$20,$ad,$32,$15,$29,$ff,$00,$aa,$bf,$d5,$80,$06,$fa
    .db $95,$04,$e2,$20,$da,$bb,$7a,$6b

sub_06818d:
.i8
    jsr sub_068191
    rtl

sub_068191:
    phx
    phy
    rep #$20
.a16
    and #$00ff
    asl a
    asl a
    asl a
    tax
    lda $0680d5,x
    sta $7e3186
    lda $0680d7,x
    sta $7e3188
    lda $0680d9,x
    sta $7e318a
    lda $0680db,x
    sta $7e318c
    sep #$20
.a8
    ply
    plx
    rts

loc_0681c1:
    inc $15a0
    lda $15a0
    cmp #$07
    bmi loc_0681ce
    stz $15a0

loc_0681ce:
    lda $15a0
    jsr sub_068191
    rts

sub_0681d5:
.i16
    sep #$20
    rep #$10
    lda $14dd
    and #$08
    bne loc_0681e4
    jml loc_0681e7

loc_0681e4:
    stz $1fc7

loc_0681e7:
    lda #$00
    sta $14c4
    lda $14db
    cmp #$03
    beq loc_0681f7
    jml loc_0681fc

loc_0681f7:
    lda #$ff
    sta $14c4

loc_0681fc:
    lda $14d3
    and #$10
    bne loc_068207
    jml loc_068248

loc_068207:
    lda $15bb
    and #$03
    beq loc_068212
    jml loc_068219

loc_068212:
    jsl sub_02ff3a
    brl loc_068227

loc_068219:
    sep #$20
    lda $14c1
    and #$df
    sta $14c1
    sep #$20
    rep #$10

loc_068227:
    lda $14d0
    and #$04
    bne loc_068232
    jml loc_068248

loc_068232:
    lda $14d3
    and #$ef
    sta $14d3
    sep #$20
    lda $14c1
    and #$df
    sta $14c1
    sep #$20
    rep #$10

loc_068248:
    ldx $15a2
    ldy $156b
    jsl sub_1fdad9
    lda #$0f
    sta $702b24
    ldx $1238
    lda $15a0
    cmp #$01
    bne loc_06828e
    lda $14d7
    and #$02
    bne loc_06826d
    jml loc_068284

loc_06826d:
    phx
    rep #$20
.a16
    lda $1ce6,x
    and #$0003
    tax
    sep #$20
.a8
    lda $06bbd6,x
    sta $702b24
    plx
    bra loc_06828e

loc_068284:
    lda $1d,x
    and #$02
    bne loc_06828e
    jml loc_0682a9

loc_06828e:
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_068299
    clc
    adc #$04

loc_068299:
    and #$7f
    cmp #$04
    bcc loc_0682a2
    sec
    sbc #$04

loc_0682a2:
    ora #$80
    sta $1ce6,x
    bra loc_0682b0

loc_0682a9:
    lda #$04
    ora #$80
    sta $1ce6,x

loc_0682b0:
    lda $14da
    and #$10
    bne loc_0682bb
    jml loc_0682cd

loc_0682bb:
    lda $1569
    clc
    adc #$04
    sta $1569
    lda $156a
    clc
    adc #$08
    sta $156a

loc_0682cd:
    lda $14da
    sta $7001a0
    lda $14d6
    and #$40
    bne loc_0682e2
    lda #$ff
    sta $15ab
    bra loc_0682e5

loc_0682e2:
    stz $15ab

loc_0682e5:
    rep #$20
.a16
    lda $1598
    cmp $18cb
    sep #$20
.a8
    beq loc_0682f5
    jml loc_06835d

loc_0682f5:
    lda $1962
    cmp #$ff
    beq loc_068300
    jml loc_06835d

loc_068300:
    lda $14d6
    and #$20
    beq loc_06830b
    jml loc_06835d

loc_06830b:
    lda $14dd
    and #$20
    beq loc_068316
    jml loc_06835d

loc_068316:
    lda $14dd
    and #$08
    beq loc_068321
    jml loc_06835d

loc_068321:
    ldx $1238
    lda $23,x
    beq loc_06832c
    jml loc_06835d

loc_06832c:
    lda $1202
    and #$20
    bne loc_068337
    jml loc_06835d

loc_068337:
    lda $15a4
    and #$20
    beq loc_068342
    jml loc_06835d

loc_068342:
    lda #$65
    jsl sub_03b7f9
    lda $14db
    inc a
    cmp $14dc
    bmi loc_068353
    lda #$00

loc_068353:
    sta $14db
    ldx $1238
    jsl sub_06ba91

loc_06835d:
    rep #$20
.a16
    ldx $15a2
    lda $0c,x
    sta $150d
    lda $0e,x
    sta $150f
    lda $10,x
    sta $1511
    sep #$20
.a8
    rep #$20
.a16
    lda $33,x
    sta $14ea
    sep #$20
.a8
    lda $14d0
    bit #$02
    bne loc_068387
    jml loc_0684da

loc_068387:
    rep #$20
.a16
    lda #$0000
    cmp $18c5
    beq loc_0683cb
    sec
    sbc $18c5
    cmp #$0000
    bmi loc_0683a4
    cmp #$0008
    bpl loc_0683ac
    lda #$0008
    bra loc_0683ac

loc_0683a4:
    cmp #$fff8
    bmi loc_0683ac
    lda #$fff8

loc_0683ac:
    cmp #$8000
    ror a
    bpl loc_0683b5
    adc #$0000

loc_0683b5:
    cmp #$8000
    ror a
    bpl loc_0683be
    adc #$0000

loc_0683be:
    cmp #$8000
    ror a
    bpl loc_0683c7
    adc #$0000

loc_0683c7:
    clc
    adc $18c5

loc_0683cb:
    sta $18c5
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    cmp $1234
    beq loc_06840b
    sec
    sbc $1234
    cmp #$0000
    bmi loc_0683ed
    cmp #$0004
    bpl loc_0683f5
    lda #$0004
    bra loc_0683f5

loc_0683ed:
    cmp #$fffc
    bmi loc_0683f5
    lda #$fffc

loc_0683f5:
    cmp #$8000
    ror a
    bpl loc_0683fe
    adc #$0000

loc_0683fe:
    cmp #$8000
    ror a
    bpl loc_068407
    adc #$0000

loc_068407:
    clc
    adc $1234

loc_06840b:
    sta $1234
    sep #$20
.a8
    lda $14da
    and #$02
    bne loc_06841b
    jml loc_068429

loc_06841b:
    rep #$20
.a16
    lda $18c7
    sec
    sbc $14ec
    sta $18c7
    sep #$20

loc_068429:
.a8
    lda $14d0
    bit #$40
    beq loc_068434
    jml loc_068489

loc_068434:
    rep #$20
.a16
    lda #$01f4
    cmp $18cb
    beq loc_068481
    sec
    sbc $18cb
    cmp #$0000
    bmi loc_068451
    cmp #$0010
    bpl loc_068459
    lda #$0010
    bra loc_068459

loc_068451:
    cmp #$fff0
    bmi loc_068459
    lda #$fff0

loc_068459:
    cmp #$8000
    ror a
    bpl loc_068462
    adc #$0000

loc_068462:
    cmp #$8000
    ror a
    bpl loc_06846b
    adc #$0000

loc_06846b:
    cmp #$8000
    ror a
    bpl loc_068474
    adc #$0000

loc_068474:
    cmp #$8000
    ror a
    bpl loc_06847d
    adc #$0000

loc_06847d:
    clc
    adc $18cb

loc_068481:
    sta $18cb
    sep #$20
.a8
    brl loc_0684da

loc_068489:
    lda $155c
    bne loc_068492
    jml loc_068499

loc_068492:
    dec $155c
    jml loc_0684da

loc_068499:
    sep #$20
    lda #$ff
    sta $18b2
    sep #$20
    rep #$10
    lda $18b3
    beq loc_0684ac
    brl loc_0684da

loc_0684ac:
    stz $1f0c
    stz $16ab
    stz $16ac
    lda $14d1
    and #$f7
    sta $14d1
    jsl sub_1fd3e0
    lda $16ec
    beq loc_0684c9
    brl loc_0684d2

loc_0684c9:
    sep #$20
    lda #$0a
    sta $1fd2
    bra loc_0684da

loc_0684d2:
    lda $1f13
    ora #$01
    sta $1f13

loc_0684da:
    lda $1527
    beq loc_068514
    lda $1528
    cmp #$00
    bne loc_0684ea
    jml loc_0684fa

loc_0684ea:
    lda $1527
    cmp #$02
    bne loc_0684f5
    jsl sub_02fe28

loc_0684f5:
    dec $1527
    bra loc_068522

loc_0684fa:
    lda $1527
    cmp #$04
    bne loc_068507
    jsl sub_02fdf8
    bra loc_06850f

loc_068507:
    cmp #$02
    bne loc_06850f
    jsl sub_02fe58

loc_06850f:
    dec $1527
    bra loc_068522

loc_068514:
    sep #$20
    lda $14c1
    and #$bf
    sta $14c1
    sep #$20
    rep #$10

loc_068522:
    lda $14da
    and #$10
    bne loc_06852d
    jml loc_06858e

loc_06852d:
    lda $14d6
    and #$18
    bne loc_068538
    jml loc_06854c

loc_068538:
    phx
    rep #$20
.a16
    lda $14e4
    tax
    lda $06bada,x
    plx
    sta $14e8
    sep #$20
.a8
    brl loc_068566

loc_06854c:
    phx
    rep #$20
.a16
    lda $14e4
    tax
    lda $06bada,x
    plx
    cmp #$8000
    ror a
    bpl loc_068561
    adc #$0000

loc_068561:
    sta $14e8
    sep #$20

loc_068566:
.a8
    rep #$20
.a16
    lda $14e4
    clc
    adc #$0002
    sta $14e4
    sep #$20
.a8
    rep #$20
.a16
    lda $14e4
    cmp #$0048
    sep #$20
.a8
    beq loc_068584
    jml loc_06858e

loc_068584:
    rep #$20
.a16
    lda #$0000
    sta $14e4
    sep #$20

loc_06858e:
.a8
    jsl sub_02fc58
    rtl
    .db $b5,$2e,$09,$10,$95,$2e

loc_068599:
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    rtl

loc_0685af:
    lda $09,x
    and #$f7
    sta $09,x
    jml loc_0685b9

loc_0685b9:
    lda $2e,x
    ora #$10
    sta $2e,x
    lda #$80
    sta $13,x
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    rtl
    .db $b5,$2e,$09,$10,$95,$2e,$a9,$80,$95,$13,$a9,$ff,$95,$2a,$a9,$14
    .db $95,$2b,$c2,$20,$a9,$00,$00,$95,$16,$e2,$20,$a9,$00,$95,$18,$6b
    .db $b5,$2e,$09,$10,$95,$2e,$a9,$ff,$95,$2a,$a9,$08,$95,$2b,$c2,$20
    .db $a9,$14,$86,$95,$16,$e2,$20,$a9,$06,$95,$18,$b5,$12,$18,$7d,$22
    .db $00,$95,$12,$b5,$13,$18,$7d,$23,$00,$95,$13,$b5,$14,$18,$7d,$24
    .db $00,$95,$14,$6b,$a9,$ff,$95,$2a,$a9,$08,$95,$2b,$a9,$80,$95,$13
    .db $c2,$20,$a9,$46,$86,$95,$16,$e2,$20,$a9,$06,$95,$18,$22,$69,$dc
    .db $1f,$6b,$22,$69,$dc,$1f,$b5,$1e,$09,$01,$95,$1e,$6b,$c2,$20,$b5
    .db $26,$95,$10,$e2,$20,$c2,$20,$b5,$10,$18,$6d,$fa,$14,$95,$10,$e2
    .db $20,$b5,$1e,$09,$01,$95,$1e,$6b
    lda #$0a
    sta $0a,x
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$86aa
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $22,x
    sta $152c
    lda $1d,x
    ora #$20
    sta $1d,x
    lda #$00
    sta $1cdf,x
    lda $152c
    sta $1cf4,x
    lda $20,x
    and #$f7
    sta $20,x
    lda $09,x
    and #$f7
    sta $09,x
    dec $1cf4,x
    ldy $158b
    cpy #$0000
    bne loc_0686b9
    jml loc_068d12

loc_0686b9:
    lda #$00
    sta $02
    sta $04
    bit #$80
    beq loc_0686c9
    lda #$ff
    sta $05
    bra loc_0686cb

loc_0686c9:
    stz $05

loc_0686cb:
    lda #$00
    sta $08
    sta $0a
    bit #$80
    beq loc_0686db
    lda #$ff
    sta $0b
    bra loc_0686dd

loc_0686db:
    stz $0b

loc_0686dd:
    lda $156e
    sta $90
    sta $15c2
    bit #$80
    beq loc_0686f0
    lda #$ff
    sta $15c3
    bra loc_0686f3

loc_0686f0:
    stz $15c3

loc_0686f3:
    lda $0012,y
    jsl sub_1fcafb
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    lda $0013,y
    jsl sub_1fc97b
    rep #$20
.a16
    lda $000c,y
    clc
    adc $04
    sta $0c,x
    lda $0010,y
    clc
    adc $15c2
    sta $10,x
    lda $000e,y
    clc
    adc $0a
    sta $0e,x
    sep #$20
.a8
    dec $0a,x
    beq loc_068733
    jml loc_068737

loc_068733:
    jsl sub_1fd501

loc_068737:
    rtl
    .db $a9,$00,$09,$80,$9d,$e7,$1c
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    rtl
    .db $5a,$b4,$1b,$f0,$0e,$b9,$2b,$00,$85,$02,$a9,$0a,$8d,$c5,$14,$22
    .db $3a,$d2,$1f,$7a,$b5,$2a,$f0,$04,$5c,$82,$87,$06,$bf,$d2,$1c,$7e
    .db $f0,$0c,$48,$c2,$20,$bf,$d0,$1c,$7e,$3a,$48,$e2,$20,$6b,$6b,$6b
    ldy $1b,x
    lda $001f,y
    and #$20
    beq loc_068790
    jml loc_0687a6

loc_068790:
    lda $002a,y
    cmp #$ff
    bne loc_06879b
    jml loc_0687a6

loc_06879b:
    lda $1cd3,y
    ora $1cd4,y
    ora $1cd5,y
    bne loc_0687aa

loc_0687a6:
    jsl sub_03b681

loc_0687aa:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    lda $7e1cd2,x
    beq loc_0687c6
    pha
    rep #$20
.a16
    lda $7e1cd0,x
    dec a
    pha
    sep #$20
.a8
    rtl

loc_0687c6:
    rtl
    ldy $1b,x
    lda $002b,y
    beq loc_0687d2
    jml loc_0687e2

loc_0687d2:
    lda #$01
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a
    brl loc_068801

loc_0687e2:
    lda $002e,y
    and #$02
    bne loc_0687ed
    jml loc_068d07

loc_0687ed:
    phy
    ldy $1b,x
    beq loc_068800
    lda $002b,y
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_068800:
    ply

loc_068801:
    lda $2a,x
    beq loc_068809
    jml loc_06881c

loc_068809:
    lda $7e1cd2,x
    beq loc_06881b
    pha
    rep #$20
.a16
    lda $7e1cd0,x
    dec a
    pha
    sep #$20
.a8
    rtl

loc_06881b:
    rtl

loc_06881c:
    jml loc_1fdc25
    .db $b5,$1d,$29,$7f,$95,$1d,$b4,$1b,$c2,$20,$b9,$04,$00,$c9,$69,$b3
    .db $e2,$20,$f0,$04,$5c,$9a,$88,$06,$da,$bb,$b5,$13,$48,$b5,$12,$48
    .db $b5,$15,$48,$c2,$20,$b5,$19,$48,$e2,$20,$a9,$00,$95,$15,$b5,$13
    .db $18,$69,$80,$95,$13,$b5,$12,$49,$ff,$1a,$95,$12,$a9,$00,$8d,$45
    .db $15,$a9,$00,$8d,$47,$15,$a9,$00,$8d,$49,$15,$a9,$00,$8d,$4c,$15
    .db $a9,$00,$8d,$4b,$15,$9c,$4d,$15,$9c,$4e,$15,$a9,$02,$22,$46,$d1
    .db $1f,$c0,$00,$00,$d0,$03,$ac,$6b,$15,$c2,$20,$68,$95,$19,$e2,$20
    .db $68,$95,$15,$68,$95,$12,$68,$95,$13,$fa,$5c,$25,$dc,$1f,$b5,$1d
    .db $29,$7f,$95,$1d,$b4,$1b,$c2,$20,$b9,$04,$00,$c9,$69,$b3,$e2,$20
    .db $f0,$04,$5c,$17,$89,$06,$da,$bb,$b5,$13,$48,$b5,$12,$48,$b5,$15
    .db $48,$c2,$20,$b5,$19,$48,$e2,$20,$a9,$00,$95,$15,$b5,$13,$18,$69
    .db $40,$95,$13,$22,$58,$fc,$02,$95,$12,$a9,$00,$8d,$45,$15,$a9,$00
    .db $8d,$47,$15,$a9,$00,$8d,$49,$15,$a9,$00,$8d,$4c,$15,$a9,$00,$8d
    .db $4b,$15,$9c,$4d,$15,$9c,$4e,$15,$a9,$02,$22,$46,$d1,$1f,$c0,$00
    .db $00,$d0,$03,$ac,$6b,$15,$c2,$20,$68,$95,$19,$e2,$20,$68,$95,$15
    .db $68,$95,$12,$68,$95,$13,$fa,$5c,$25,$dc,$1f,$b5,$1f,$29,$20,$f0
    .db $04,$5c,$3f,$89,$06,$a9,$80,$22,$f9,$b7,$03,$b4,$1b,$da,$bb,$22
    .db $ee,$ee,$06,$b9,$1f,$00,$09,$40,$99,$1f,$00,$fa,$82,$64,$00,$a9
    .db $24,$22,$f9,$b7,$03,$82,$5b,$00,$b4,$1b,$da,$bb,$22,$ee,$ee,$06
    .db $fa,$a9,$24,$22,$f9,$b7,$03,$82,$49,$00,$b4,$1b,$da,$bb,$22,$fd
    .db $ee,$06,$fa,$a9,$24,$22,$f9,$b7,$03,$82,$37,$00,$b4,$1b,$da,$bb
    .db $22,$df,$ee,$06,$fa,$a9,$24,$22,$f9,$b7,$03,$b5,$1d,$29,$7f,$95
    .db $1d,$b5,$1f,$29,$20,$f0,$04,$5c,$05,$8a,$06,$5a,$b4,$1b,$f0,$0e
    .db $b9,$2b,$00,$85,$02,$a9,$0a,$8d,$c5,$14,$22,$3a,$d2,$1f,$7a,$5c
    .db $cd,$89,$06

loc_0689a3:
    lda $1d,x
    and #$7f
    sta $1d,x
    lda $1f,x
    and #$20
    beq loc_0689b3
    jml loc_068a05

loc_0689b3:
    phy
    ldy $1b,x
    beq loc_0689c6
    lda $002b,y
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_0689c6:
    ply
    lda $1d,x
    ora #$02
    sta $1d,x
    phy
    ldy $1238
    jsl sub_1fd0ab
    rep #$20
.a16
    lda $1250
    cmp #$03e8
    bcc loc_0689fc
    cmp #$07d0
    bcc loc_0689f0
    sep #$20
.a8
    lda #$26
    jsl sub_03b7f9
    jml loc_068a04

loc_0689f0:
.a16
    sep #$20
.a8
    lda #$25
    jsl sub_03b7f9
    jml loc_068a04

loc_0689fc:
.a16
    sep #$20
.a8
    lda #$24
    jsl sub_03b7f9

loc_068a04:
    ply

loc_068a05:
    jml loc_1fdc25
    .db $b4,$1b,$c2,$20,$b9,$04,$00,$d5,$04,$e2,$20,$d0,$04,$5c,$90,$8a
    .db $06,$5a,$b4,$1b,$f0,$0e,$b9,$2b,$00,$85,$02,$a9,$0a,$8d,$c5,$14
    .db $22,$3a,$d2,$1f,$7a,$b9,$09,$00,$29,$02,$f0,$04,$5c,$44,$8a,$06
    .db $b5,$1e,$09,$01,$95,$1e,$a9,$00,$95,$2a,$6b,$b5,$1d,$09,$02,$95
    .db $1d,$c2,$20,$a9,$5f,$8a,$9f,$d3,$1c,$7e,$e2,$20,$a9,$06,$9f,$d5
    .db $1c,$7e,$5c,$25,$dc,$1f,$5a,$b4,$1b,$f0,$0e,$b9,$2b,$00,$85,$02
    .db $a9,$0a,$8d,$c5,$14,$22,$3a,$d2,$1f,$7a,$b5,$1d,$29,$fd,$95,$1d
    .db $b5,$1d,$29,$7f,$95,$1d,$c2,$20,$a9,$09,$8a,$9f,$d3,$1c,$7e,$e2
    .db $20,$a9,$06,$9f,$d5,$1c,$7e,$5c,$25,$dc,$1f,$22,$69,$dc,$1f,$b5
    .db $13,$18,$69,$04,$95,$13,$6b,$22,$bb,$c7,$1f,$b5,$2a,$c9,$04,$d0
    .db $04,$5c,$b8,$8a,$06,$10,$04,$5c,$b8,$8a,$06,$5c,$58,$8b,$06,$b5
    .db $08,$09,$40,$95,$08,$ad,$bb,$15,$29,$07,$f0,$04,$5c,$58,$8b,$06
    .db $22,$a8,$8e,$06,$c0,$00,$00,$d0,$04,$5c,$58,$8b,$06,$a9,$00,$85
    .db $02,$85,$04,$89,$80,$f0,$06,$a9,$ff,$85,$05,$80,$02,$64,$05,$a9
    .db $9c,$85,$08,$85,$0a,$89,$80,$f0,$06,$a9,$ff,$85,$0b,$80,$02,$64
    .db $0b,$a9,$00,$85,$90,$8d,$c2,$15,$89,$80,$f0,$07,$a9,$ff,$8d,$c3
    .db $15,$80,$03,$9c,$c3,$15,$b5,$14,$22,$78,$cc,$1f,$a5,$04,$85,$02
    .db $a5,$0a,$85,$08,$ad,$c2,$15,$85,$90,$b5,$12,$22,$fb,$ca,$1f,$a5
    .db $04,$85,$02,$a5,$0a,$85,$08,$ad,$c2,$15,$85,$90,$b5,$13,$22,$7b
    .db $c9,$1f,$c2,$20,$b5,$0c,$18,$65,$04,$99,$0c,$00,$b5,$10,$18,$6d
    .db $c2,$15,$99,$10,$00,$b5,$0e,$18,$65,$0a,$99,$0e,$00,$e2,$20,$6b
    .db $ac,$38,$12,$22,$21,$d0,$1f,$e2,$20,$eb,$49,$ff,$1a,$d5,$13,$f0
    .db $26,$38,$f5,$13,$c9,$00,$30,$08,$c9,$04,$10,$0a,$a9,$04,$80,$06
    .db $c9,$fc,$30,$02,$a9,$fc,$c9,$80,$6a,$10,$02,$69,$00,$c9,$80,$6a
    .db $10,$02,$69,$00,$18,$75,$13,$95,$13,$6b,$6b,$e2,$20,$9c,$ab,$16
    .db $9c,$ac,$16,$22,$f2,$fe,$02,$6b,$08,$e2,$20,$ad,$d0,$14,$89,$80
    .db $d0,$03,$28,$18,$6b,$ad,$d0,$14,$29,$7f,$8d,$d0,$14,$28,$38,$6b
    php
    sep #$20
    lda $14d0
    bit #$08
    bne loc_068bc6
    plp
    clc
    rtl

loc_068bc6:
    lda $14d0
    and #$f7
    sta $14d0
    plp
    sec
    rtl
    .db $08,$e2,$20,$ad,$d0,$14,$89,$10,$d0,$03,$28,$18,$6b,$28,$38,$6b
    .db $08,$e2,$20,$ad,$d0,$14,$89,$04,$d0,$03,$28,$18,$6b,$ad,$d0,$14
    .db $29,$fb,$8d,$d0,$14,$a9,$00,$8f,$9a,$01,$70,$a9,$00,$8f,$9c,$01
    .db $70,$28,$38,$6b,$08,$c2,$20,$ad,$34,$17,$22,$51,$c9,$1f,$e0,$00
    .db $00,$f0,$03,$28,$38,$6b,$28,$18,$6b,$c2,$20,$a9,$b5,$ae,$8d,$c5
    .db $14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04,$5c,$96,$8c,$06,$82,$14,$00

sub_068c31:
    rep #$20
.a16
    lda #$aed1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_068c45
    jml loc_068c96

loc_068c45:
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $0013,y
    lda $18c6
    sta $0012,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$8c97
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    rep #$20
.a16
    lda $0010,y
    clc
    adc #$fffb
    sta $0010,y
    sep #$20
.a8
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y

loc_068c96:
    rtl

loc_068c97:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    ora #$80
    sta $1ce6,x
    rep #$20
.a16
    lda #$8cb6
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    jsl sub_1fdc69
    rtl
    .db $22,$69,$dc,$1f,$bd,$e6,$1c,$18,$69,$01,$30,$03,$18,$69,$07,$29
    .db $7f,$c9,$07,$90,$0b,$a9,$07,$3a,$09,$80,$9d,$e6,$1c,$4c,$dc,$8c
    .db $09,$80,$9d,$e6,$1c,$6b,$22,$01,$d5,$1f,$6b,$b4,$06,$b5,$20,$29
    .db $ef,$95,$20,$c2,$20,$86,$3c,$5a,$b9,$26,$00,$f0,$0c,$c5,$3c,$f0
    .db $03,$a8,$80,$f4,$b5,$26,$99,$26,$00,$7a,$e2,$20,$22,$01,$d5,$1f
    .db $6b

loc_068d07:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    rtl

loc_068d12:
    jsl sub_1fd501
    rtl
    .db $b5,$20,$09,$04,$95,$20,$82,$06,$00

loc_068d20:
    lda $20,x
    and #$fb
    sta $20,x
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    rep #$20
.a16
    lda #$8d45
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    jsl sub_1fd450
    lda $1e,x
    ora #$01
    sta $1e,x
    dec $0a,x
    beq loc_068d4d
    jml loc_068d51

loc_068d4d:
    jsl sub_1fd501

loc_068d51:
    lda $20,x
    and #$04
    bne loc_068d5b
    jml loc_068d5f

loc_068d5b:
    jsl sub_1fdc69

loc_068d5f:
    rtl
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $13,x
    lda $18c6
    sta $12,x
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    jsl sub_1fd450
    rtl
    .db $a9,$02,$95,$22,$c2,$20,$a9,$c5,$b1,$95,$04,$e2,$20,$b5,$1e,$09
    .db $01,$95,$1e,$c2,$20,$a9,$e3,$8d,$95,$16,$e2,$20,$a9,$06,$95,$18
    .db $c2,$20,$a9,$e3,$8d,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06,$9f,$d2,$1c
    .db $7e,$c2,$20,$a9,$e3,$8d,$9f,$d3,$1c,$7e,$e2,$20,$a9,$06,$9f,$d5
    .db $1c,$7e,$ad,$c8,$18,$49,$ff,$1a,$18,$69,$80,$18,$6d,$2b,$15,$95
    .db $13,$ad,$c6,$18,$95,$12,$6b,$d6,$22,$f0,$04,$5c,$ef,$8d,$06,$22
    .db $01,$d5,$1f,$6b,$a9,$09,$95,$23,$c2,$20,$a9,$02,$8e,$95,$16,$e2
    .db $20,$a9,$06,$95,$18,$6b,$ad,$c8,$18,$49,$ff,$1a,$18,$69,$80,$18
    .db $6d,$2b,$15,$95,$13,$ad,$c6,$18,$95,$12,$d6,$23,$f0,$04,$5c,$28
    .db $8e,$06,$b5,$22,$95,$23,$22,$a8,$8e,$06,$80,$14,$b5,$23,$c9,$08
    .db $d0,$04,$5c,$22,$8e,$06,$b5,$23,$c9,$10,$d0,$04,$5c,$22,$8e,$06
    .db $6b,$c2,$20,$a9,$49,$ad,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0
    .db $04,$5c,$a7,$8e,$06,$ad,$32,$15,$99,$22,$00,$c2,$20,$a9,$f0,$8d
    .db $99,$16,$00,$e2,$20,$a9,$06,$99,$18,$00,$b9,$1f,$00,$29,$f7,$99
    .db $1f,$00,$b9,$1e,$00,$09,$01,$99,$1e,$00,$ad,$c8,$18,$49,$ff,$1a
    .db $18,$69,$80,$18,$6d,$2b,$15,$99,$13,$00,$ad,$c6,$18,$99,$12,$00
    .db $22,$d9,$da,$1f,$b9,$09,$00,$09,$08,$99,$09,$00,$c2,$20,$98,$9f
    .db $dd,$1c,$7e,$e2,$20,$b5,$08,$09,$40,$95,$08,$6b

sub_068ea8:
    ldy #$0000
    rep #$20
.a16
    lda #$add5
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_068ebf
    jml loc_068f00

loc_068ebf:
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $0013,y
    lda $18c6
    sta $0012,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$8f72
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda $0009,y
    ora #$08
    sta $0009,y
    lda $001e,y
    ora #$01
    sta $001e,y

loc_068f00:
    rtl
    .db $c2,$20,$a9,$2f,$8f,$95,$16,$e2,$20,$a9,$06,$95,$18,$22,$50,$d4
    .db $1f,$b5,$1e,$09,$01,$95,$1e,$a9,$00,$09,$80,$9d,$e6,$1c,$b5,$1d
    .db $09,$20,$95,$1d,$a9,$00,$9d,$df,$1c,$a9,$00,$9d,$f4,$1c,$ad,$c8
    .db $18,$49,$ff,$1a,$18,$69,$80,$18,$6d,$2b,$15,$95,$13,$ad,$c6,$18
    .db $95,$12,$bd,$e6,$1c,$18,$69,$01,$30,$03,$18,$69,$09,$29,$7f,$c9
    .db $09,$90,$03,$38,$e9,$09,$09,$80,$9d,$e6,$1c,$bd,$e6,$1c,$29,$7f
    .db $c9,$08,$f0,$04,$5c,$6d,$8f,$06,$22,$01,$d5,$1f,$22,$69,$dc,$1f
    .db $6b
    lda $1d,x
    ora #$20
    sta $1d,x
    lda #$00
    sta $1cdf,x
    lda #$00
    sta $1cf4,x
    rep #$20
.a16
    lda #$8fa7
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    jsl sub_1fd450
    lda #$14
    sta $22,x
    rep #$20
.a16
    lda #$0006
    sta $26,x
    sep #$20
.a8
    lda #$00
    ora #$80
    sta $1ce6,x
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $13,x
    lda $18c6
    sta $12,x
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_068fc6
    clc
    adc #$08

loc_068fc6:
    and #$7f
    cmp #$08
    bcc loc_068fcf
    sec
    sbc #$08

loc_068fcf:
    ora #$80
    sta $1ce6,x
    lda $1ce6,x
    and #$7f
    cmp #$00
    bne loc_068fe1
    jml loc_069011

loc_068fe1:
    rep #$20
.a16
    lda $0c,x
    sec
    sbc #$0001
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sec
    sbc $0026,x
    sta $0e,x
    sep #$20
.a8
    dec $22,x
    beq loc_069001
    jml loc_069015

loc_069001:
    lda #$14
    sta $22,x
    rep #$20
.a16
    dec $26,x
    sep #$20
.a8
    beq loc_069011
    jml loc_069015

loc_069011:
    jsl sub_1fd501

loc_069015:
    jsl sub_1fc7bb
    rtl

loc_06901a:
    lda $14d5
    bit #$02
    beq loc_069032
    rep #$20
.a16
    lda $0c,x
    cmp $1575
    sep #$20
.a8
    beq loc_069032
    bmi loc_069032
    jml loc_0690cb

loc_069032:
    lda $14d5
    bit #$01
    beq loc_069048
    rep #$20
.a16
    lda $0c,x
    cmp $1573
    sep #$20
.a8
    bpl loc_069048
    jml loc_0690cb

loc_069048:
    lda $14d5
    bit #$64
    beq loc_069098
    rep #$20
.a16
    lda $0e,x
    cmp $1577
    sep #$20
.a8
    beq loc_069060
    bmi loc_069060
    jml loc_069098

loc_069060:
    lda $14d5
    bit #$40
    beq loc_06907c
    ldy $1238
    rep #$20
.a16
    lda $000c,y
    cmp $1583
    sep #$20
.a8
    beq loc_06907c
    bmi loc_06907c
    jml loc_069098

loc_06907c:
    lda $14d5
    bit #$20
    beq loc_0690cb
    ldy $1238
    rep #$20
.a16
    lda $000c,y
    cmp $1581
    sep #$20
.a8
    beq loc_069098
    bmi loc_069098
    jml loc_0690cb

loc_069098:
    lda $14d5
    bit #$18
    beq loc_0690ca
    rep #$20
.a16
    lda $0e,x
    cmp $157f
    sep #$20
.a8
    bpl loc_0690ae
    jml loc_0690ca

loc_0690ae:
    lda $14d5
    bit #$10
    beq loc_0690cb
    ldy $1238
    rep #$20
.a16
    lda $000c,y
    cmp $1585
    sep #$20
.a8
    beq loc_0690ca
    bmi loc_0690ca
    jml loc_0690cb

loc_0690ca:
    rtl

loc_0690cb:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    rtl
    .db $22,$01,$d5,$1f,$6b

loc_0690db:
    lda $14d0
    and #$04
    beq loc_0690e6
    jml loc_068d07

loc_0690e6:
    lda $14d3
    and #$10
    beq loc_0690f1
    jml loc_068d07

loc_0690f1:
    lda $1e,x
    and #$10
    bne loc_0690fb
    jml loc_06901a

loc_0690fb:
    rtl
    .db $c2,$20,$a9,$4e,$91,$95,$16,$e2,$20,$a9,$06,$95,$18,$b5,$22,$95
    .db $12,$b5,$23,$95,$13,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12
    .db $8d,$a6,$15,$22,$a7,$d5,$1f,$b5,$24,$85,$7e,$b5,$13,$8d,$a7,$15
    .db $b5,$12,$8d,$a6,$15,$22,$1e,$c4,$1f,$c2,$20,$a5,$02,$18,$75,$2f
    .db $95,$2f,$a5,$08,$18,$75,$31,$95,$31,$a5,$90,$18,$75,$33,$95,$33
    .db $e2,$20,$22,$69,$dc,$1f,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c,$63
    .db $91,$06,$22,$01,$d5,$1f,$6b,$b5,$14,$18,$69,$14,$95,$14,$82,$6e
    .db $ff

sub_06916d:
    rep #$20
.a16
    lda #$b219
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_069181
    jml loc_0691de

loc_069181:
    phx
    phy
    rep #$20
.a16
    ldy $04,x
    tyx
    lda $00000e,x
    eor #$ffff
    inc a
    sta $151d
    lda $00000c,x
    sec
    sbc #$0018
    sta $151b
    ply
    plx
    sep #$20
.a8
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda $151b
    sta $1cf4,y
    lda $151d
    sta $1ce3,y
    rep #$20
.a16
    tya
    sta $7e1cdd,x
    sep #$20
.a8
    lda $001e,y
    ora #$01
    sta $001e,y
    jsl sub_0691df
    lda $0020,y
    ora #$08
    sta $0020,y
    lda $08,x
    ora #$40
    sta $08,x

loc_0691de:
    rtl

sub_0691df:
    ldy $1cdd,x
    cpy #$0000
    bne loc_0691eb
    jml loc_069269

loc_0691eb:
    lda $0020,y
    and #$f7
    sta $0020,y
    lda $1ce3,y
    sta $152c
    lda #$00
    sta $02
    sta $04
    bit #$80
    beq loc_069209
    lda #$ff
    sta $05
    bra loc_06920b

loc_069209:
    stz $05

loc_06920b:
    lda #$00
    sta $08
    sta $0a
    bit #$80
    beq loc_06921b
    lda #$ff
    sta $0b
    bra loc_06921d

loc_06921b:
    stz $0b

loc_06921d:
    lda $152c
    sta $90
    sta $15c2
    bit #$80
    beq loc_069230
    lda #$ff
    sta $15c3
    bra loc_069233

loc_069230:
    stz $15c3

loc_069233:
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

loc_069269:
.a8
    rtl

loc_06926a:
    rep #$20
.a16
    lda #$92cb
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda #$02
    sta $7e1ce9,x
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $2e,x
    ora #$01
    sta $2e,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    lda $24,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    clc
    adc $2f,x
    sta $2f,x
    lda $08
    clc
    adc $31,x
    sta $31,x
    lda $90
    clc
    adc $33,x
    sta $33,x
    sep #$20
.a8
    jsl sub_06916d
    rtl
    .incbin "data/0312cb-031a5b.bin"
    rep #$20
.a16
    lda #$9a7e
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $13,x
    sta $22,x
    lda $12,x
    sta $23,x
    lda #$00
    sta $12,x
    lda #$80
    sta $13,x
    lda #$06
    sta $7e1ce9,x
    lda $09,x
    ora #$08
    sta $09,x
    lda $08,x
    and #$10
    beq loc_069a8e
    jml loc_069a92

loc_069a8e:
    jsl sub_1fd501

loc_069a92:
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $13,x
    lda $18c6
    sta $12,x
    ldy $06,x
    cpy #$0000
    bne loc_069ab1
    jml loc_069b52

loc_069ab1:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_069abf
    eor #$ffff
    inc a

loc_069abf:
    cmp #$01f4
    sep #$20
.a8
    bpl loc_069aca
    jml loc_069b52

loc_069aca:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $23,x
    beq loc_069b0c
    sec
    sbc $23,x
    cmp #$00
    bmi loc_069ae7
    cmp #$10
    bpl loc_069aed
    lda #$10
    bra loc_069aed

loc_069ae7:
    cmp #$f0
    bmi loc_069aed
    lda #$f0

loc_069aed:
    cmp #$80
    ror a
    bpl loc_069af4
    adc #$00

loc_069af4:
    cmp #$80
    ror a
    bpl loc_069afb
    adc #$00

loc_069afb:
    cmp #$80
    ror a
    bpl loc_069b02
    adc #$00

loc_069b02:
    cmp #$80
    ror a
    bpl loc_069b09
    adc #$00

loc_069b09:
    clc
    adc $23,x

loc_069b0c:
    sta $23,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $22,x
    beq loc_069b50
    sec
    sbc $22,x
    cmp #$00
    bmi loc_069b2b
    cmp #$10
    bpl loc_069b31
    lda #$10
    bra loc_069b31

loc_069b2b:
    cmp #$f0
    bmi loc_069b31
    lda #$f0

loc_069b31:
    cmp #$80
    ror a
    bpl loc_069b38
    adc #$00

loc_069b38:
    cmp #$80
    ror a
    bpl loc_069b3f
    adc #$00

loc_069b3f:
    cmp #$80
    ror a
    bpl loc_069b46
    adc #$00

loc_069b46:
    cmp #$80
    ror a
    bpl loc_069b4d
    adc #$00

loc_069b4d:
    clc
    adc $22,x

loc_069b50:
    sta $22,x

loc_069b52:
    lda $15,x
    sta $7e
    lda $22,x
    sta $15a7
    lda $23,x
    sta $15a6
    jsl sub_1fd5a7
    lda $24,x
    sta $7e
    lda $22,x
    sta $15a7
    lda $23,x
    sta $15a6
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    clc
    adc $2f,x
    sta $2f,x
    lda $08
    clc
    adc $31,x
    sta $31,x
    lda $90
    clc
    adc $33,x
    sta $33,x
    sep #$20
.a8
    jsl sub_1fdc69
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_069b9f
    jml loc_069ba3

loc_069b9f:
    jsl sub_1fd501

loc_069ba3:
    brl loc_0690db
    .db $c2,$20,$a9,$ca,$9b,$95,$16,$e2,$20,$a9,$06,$95,$18,$a9,$06,$9f
    .db $e9,$1c,$7e,$22,$58,$fc,$02,$29,$07,$8d,$2c,$15,$ad,$2c,$15,$09
    .db $80,$9d,$e7,$1c,$bd,$e7,$1c,$18,$69,$01,$30,$03,$18,$69,$08,$29
    .db $7f,$c9,$08,$90,$03,$38,$e9,$08,$09,$80,$9d,$e7,$1c,$b4,$06,$22
    .db $21,$d0,$1f,$e2,$20,$eb,$49,$ff,$1a,$d5,$13,$f0,$00,$95,$13,$b5
    .db $15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6,$15,$22,$a7,$d5
    .db $1f,$22,$69,$dc,$1f,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c,$1b,$9c
    .db $06,$22,$01,$d5,$1f,$82,$bd,$f4
    rep #$20
.a16
    lda #$9c4b
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $13,x
    sta $22,x
    lda $12,x
    sta $23,x
    lda $15,x
    sta $7e
    lda $22,x
    sta $15a7
    lda $23,x
    sta $15a6
    jsl sub_1fd5a7
    lda #$06
    sta $7e1ce9,x
    jsl sub_1fdc69
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_069c5b
    jml loc_069c65

loc_069c5b:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x

loc_069c65:
    brl loc_0690db
    .db $c2,$20,$a9,$95,$9c,$95,$16,$e2,$20,$a9,$06,$95,$18,$b5,$13,$95
    .db $22,$b5,$12,$95,$23,$b5,$15,$85,$7e,$b5,$22,$8d,$a7,$15,$b5,$23
    .db $8d,$a6,$15,$22,$a7,$d5,$1f,$a9,$06,$9f,$e9,$1c,$7e,$ad,$c8,$18
    .db $49,$ff,$1a,$18,$69,$80,$18,$6d,$2b,$15,$95,$13,$ad,$c6,$18,$95
    .db $12,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c,$bf,$9c,$06,$b5,$1e,$09
    .db $01,$95,$1e,$a9,$00,$95,$2a,$82,$19,$f4,$c2,$20,$a9,$e5,$9c,$95
    .db $16,$e2,$20,$a9,$06,$95,$18,$a9,$02,$9f,$e9,$1c,$7e,$b5,$2e,$09
    .db $01,$95,$2e,$b5,$1d,$09,$08,$95,$1d,$22,$6d,$91,$06,$d6,$0a,$f0
    .db $04,$5c,$f1,$9c,$06,$22,$01,$d5,$1f,$b5,$14,$18,$69,$0a,$95,$14
    .db $b5,$1e,$29,$10,$f0,$04,$5c,$57,$9d,$06,$b5,$13,$85,$3a,$b5,$23
    .db $22,$8a,$d8,$1f,$95,$13,$b5,$12,$85,$3a,$b5,$22,$22,$8a,$d8,$1f
    .db $95,$12,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6,$15
    .db $22,$a7,$d5,$1f,$b5,$24,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d
    .db $a6,$15,$22,$1e,$c4,$1f,$c2,$20,$a5,$02,$18,$75,$2f,$95,$2f,$a5
    .db $08,$18,$75,$31,$95,$31,$a5,$90,$18,$75,$33,$95,$33,$e2,$20,$22
    .db $69,$dc,$1f,$22,$bb,$c7,$1f,$22,$df,$91,$06,$82,$75,$f3,$b5,$22
    .db $95,$12,$b5,$23,$95,$13,$c2,$20,$a9,$98,$9d,$95,$16,$e2,$20,$a9
    .db $06,$95,$18,$b5,$09,$09,$08,$95,$09,$a9,$02,$9f,$e9,$1c,$7e,$b5
    .db $1d,$09,$08,$95,$1d,$b5,$2e,$09,$01,$95,$2e,$22,$6d,$91,$06,$6b
    .db $b5,$1e,$29,$20,$f0,$04,$5c,$c9,$9d,$06,$ac,$38,$12,$c2,$20,$b9
    .db $10,$00,$38,$f5,$10,$10,$04,$49,$ff,$ff,$1a,$c9,$58,$02,$e2,$20
    .db $30,$04,$5c,$c9,$9d,$06,$a9,$64,$8d,$c5,$14,$a9,$05,$22,$0d,$d6
    .db $1f,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6,$15,$22
    .db $a7,$d5,$1f,$22,$69,$dc,$1f,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c
    .db $ef,$9d,$06,$22,$01,$d5,$1f,$9c,$38,$15,$a9,$00,$d5,$12,$f0,$26
    .db $38,$f5,$12,$c9,$00,$30,$08,$c9,$04,$10,$0a,$a9,$04,$80,$06,$c9
    .db $fc,$30,$02,$a9,$fc,$c9,$80,$6a,$10,$02,$69,$00,$c9,$80,$6a,$10
    .db $02,$69,$00,$18,$75,$12,$95,$12,$a9,$80,$d5,$13,$f0,$26,$38,$f5
    .db $13,$c9,$00,$30,$08,$c9,$04,$10,$0a,$a9,$04,$80,$06,$c9,$fc,$30
    .db $02,$a9,$fc,$c9,$80,$6a,$10,$02,$69,$00,$c9,$80,$6a,$10,$02,$69
    .db $00,$18,$75,$13,$95,$13,$b5,$14,$18,$69,$0a,$95,$14,$22,$df,$91
    .db $06,$82,$7f,$f2
    rep #$20
.a16
    lda #$9eb6
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $22,x
    sta $12,x
    lda $23,x
    sta $13,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5bc
    lda $24,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    clc
    adc $2f,x
    sta $2f,x
    lda $08
    clc
    adc $31,x
    sta $31,x
    lda $90
    clc
    adc $33,x
    sta $33,x
    sep #$20
.a8
    lda #$00
    ora #$80
    sta $1ce7,x
    rtl
    lda $1ce7,x
    and #$7f
    cmp #$04
    bne loc_069ec3
    jml loc_069edc

loc_069ec3:
    lda $1ce7,x
    clc
    adc #$02
    bmi loc_069ece
    clc
    adc #$08

loc_069ece:
    and #$7f
    cmp #$08
    bcc loc_069ed7
    sec
    sbc #$08

loc_069ed7:
    ora #$80
    sta $1ce7,x

loc_069edc:
    jsl sub_1fdc69
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_069eec
    jml loc_069ef1

loc_069eec:
    jsl sub_1fd501
    rtl

loc_069ef1:
    brl loc_0690db
    rep #$20
.a16
    lda #$9f23
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $22,x
    sta $12,x
    lda $23,x
    sta $13,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5bc
    lda #$00
    ora #$80
    sta $1ce7,x
    rtl
    lda $1ce7,x
    and #$7f
    cmp #$04
    bne loc_069f30
    jml loc_069f49

loc_069f30:
    lda $1ce7,x
    clc
    adc #$02
    bmi loc_069f3b
    clc
    adc #$08

loc_069f3b:
    and #$7f
    cmp #$08
    bcc loc_069f44
    sec
    sbc #$08

loc_069f44:
    ora #$80
    sta $1ce7,x

loc_069f49:
    lda $1e,x
    and #$20
    beq loc_069f53
    jml loc_069fe5

loc_069f53:
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_069f64
    eor #$ffff
    inc a

loc_069f64:
    cmp #$0320
    sep #$20
.a8
    bmi loc_069f6f
    jml loc_069f75

loc_069f6f:
    lda $1e,x
    ora #$20
    sta $1e,x

loc_069f75:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_069fa2
    sec
    sbc $12,x
    cmp #$00
    bmi loc_069f92
    cmp #$02
    bpl loc_069f98
    lda #$02
    bra loc_069f98

loc_069f92:
    cmp #$fe
    bmi loc_069f98
    lda #$fe

loc_069f98:
    cmp #$80
    ror a
    bpl loc_069f9f
    adc #$00

loc_069f9f:
    clc
    adc $12,x

loc_069fa2:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_069fd1
    sec
    sbc $13,x
    cmp #$00
    bmi loc_069fc1
    cmp #$02
    bpl loc_069fc7
    lda #$02
    bra loc_069fc7

loc_069fc1:
    cmp #$fe
    bmi loc_069fc7
    lda #$fe

loc_069fc7:
    cmp #$80
    ror a
    bpl loc_069fce
    adc #$00

loc_069fce:
    clc
    adc $13,x

loc_069fd1:
    sta $13,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5bc

loc_069fe5:
    jsl sub_1fdc69
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_069ff5
    jml loc_069ffa

loc_069ff5:
    jsl sub_1fd501
    rtl

loc_069ffa:
    brl loc_0690db

loc_069ffd:
    rep #$20
.a16
    lda #$a02c
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $22,x
    sta $12,x
    lda $23,x
    sta $13,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5bc
    lda #$00
    ora #$80
    sta $1ce7,x
    rtl
    .db $bd,$e7,$1c,$29,$7f,$c9,$04,$d0,$04,$5c,$52,$a0,$06,$bd,$e7,$1c
    .db $18,$69,$02,$30,$03,$18,$69,$08,$29,$7f,$c9,$08,$90,$03,$38,$e9
    .db $08,$09,$80,$9d,$e7,$1c,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c,$63
    .db $a0,$06,$22,$01,$d5,$1f,$6b,$82,$75,$f0

loc_06a066:
    rep #$20
.a16
    lda #$0000
    sta $06,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$b2a5
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06a083
    jml loc_06a0a8

loc_06a083:
    lda $001f,y
    and #$f7
    sta $001f,y
    sty $06,x
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$8d60
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda $001e,y
    ora #$01
    sta $001e,y

loc_06a0a8:
    rep #$20
.a16
    lda #$a0b9
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    lda $20,x
    and #$04
    bne loc_06a0c3
    jml loc_06a0d2

loc_06a0c3:
    lda $14d0
    and #$02
    beq loc_06a0ce
    jml loc_06a0d2

loc_06a0ce:
    jsl sub_1fdc69

loc_06a0d2:
    lda $1ce7,x
    and #$7f
    cmp #$08
    bne loc_06a0df
    jml loc_06a0f9

loc_06a0df:
    lda $1ce7,x
    clc
    adc #$02
    bmi loc_06a0ea
    clc
    adc #$09

loc_06a0ea:
    and #$7f
    cmp #$09
    bcc loc_06a0f3
    sec
    sbc #$09

loc_06a0f3:
    ora #$80
    sta $1ce7,x
    rtl

loc_06a0f9:
    ldy $06,x
    cpy #$0000
    bne loc_06a104
    jml loc_06a108

loc_06a104:
    jsl sub_1fd540

loc_06a108:
    jsl sub_1fd501
    rtl
    .db $c2,$20,$a9,$78,$a1,$95,$16,$e2,$20,$a9,$06,$95,$18,$b5,$22,$95
    .db $12,$b5,$23,$95,$13,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12
    .db $8d,$a6,$15,$22,$d4,$d5,$1f,$b5,$24,$85,$7e,$b5,$13,$8d,$a7,$15
    .db $b5,$12,$8d,$a6,$15,$22,$1e,$c4,$1f,$c2,$20,$a5,$02,$18,$75,$2f
    .db $95,$2f,$a5,$08,$18,$75,$31,$95,$31,$a5,$90,$18,$75,$33,$95,$33
    .db $e2,$20,$a9,$04,$09,$80,$9d,$e7,$1c,$ad,$dd,$14,$29,$10,$f0,$04
    .db $5c,$77,$a1,$06,$b5,$1e,$09,$01,$95,$1e,$6b,$a9,$00,$95,$12,$a9
    .db $00,$95,$13,$b5,$14,$18,$69,$18,$95,$14,$82,$6b,$00
    rep #$20
.a16
    lda #$a1f5
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda $22,x
    sta $12,x
    lda $23,x
    sta $13,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5d4
    lda $24,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    clc
    adc $2f,x
    sta $2f,x
    lda $08
    clc
    adc $31,x
    sta $31,x
    lda $90
    clc
    adc $33,x
    sta $33,x
    sep #$20
.a8
    lda #$04
    ora #$80
    sta $1ce7,x
    lda $14dd
    and #$10
    beq loc_06a1ee
    jml loc_06a1f4

loc_06a1ee:
    lda $1e,x
    ora #$01
    sta $1e,x

loc_06a1f4:
    rtl
    lda $14d7
    and #$80
    beq loc_06a200
    jsl sub_1fd501

loc_06a200:
    lda $1e,x
    and #$fe
    sta $1e,x
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_06a212
    jml loc_06a21a

loc_06a212:
    jsl sub_1fd501
    dec $1523
    rtl

loc_06a21a:
    brl loc_0690db
    lda $09,x
    and #$f7
    sta $09,x
    dec $1523
    jml loc_06a066
    .db $ce,$23,$15,$c2,$20,$a9,$12,$8d,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06
    .db $9f,$d2,$1c,$7e,$6b
    rep #$20
.a16
    lda #$a2b2
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,x
    lda #$a330
    sta $1cd0,x
    sep #$20
.a8
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5bc
    lda $24,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fc41e
    rep #$20
.a16
    lda $02
    clc
    adc $2f,x
    sta $2f,x
    lda $08
    clc
    adc $31,x
    sta $31,x
    lda $90
    clc
    adc $33,x
    sta $33,x
    sep #$20
.a8
    lda #$00
    sta $12,x
    lda #$80
    sta $13,x
    lda #$06
    sta $7e1ce9,x
    rtl
    lda $14d7
    and #$80
    beq loc_06a2bd
    jsl sub_1fd501

loc_06a2bd:
    lda $14d6
    and #$40
    beq loc_06a2c8
    jml loc_06a320

loc_06a2c8:
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_06a2d4
    jml loc_06a2de

loc_06a2d4:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x

loc_06a2de:
    lda $14da
    and #$01
    bne loc_06a2e9
    jml loc_06a2f5

loc_06a2e9:
    rep #$20
.a16
    lda $31,x
    clc
    adc #$0002
    sta $31,x
    sep #$20

loc_06a2f5:
.a8
    lda $1204
    and #$80
    bne loc_06a300
    jml loc_06a315

loc_06a300:
    lda $15a5
    and #$80
    beq loc_06a30b
    jml loc_06a315

loc_06a30b:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x

loc_06a315:
    lda $1e,x
    and #$10
    bne loc_06a31f
    jml loc_06901a

loc_06a31f:
    rtl

loc_06a320:
    rep #$20
.a16
    inc $15ad
    sep #$20
.a8
    lda #$01
    sta $1526
    jml loc_068d12
    rep #$20
.a16
    lda #$00c8
    sta $26,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$a371
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    rep #$20
.a16
    lda #$aca1
    sta $04,x
    sep #$20
.a8
    jsl sub_06eeee
    stx $16a9
    rep #$20
.a16
    lda #$0039
    sta $16ab
    sep #$20
.a8
    lda #$30
    jsl sub_03b7f9
    lda #$00
    sta $7e1ce9,x
    rtl
    rep #$20
.a16
    lda $26,x
    cmp #$1b58
    sep #$20
.a8
    bmi loc_06a381
    jsl sub_1fd501
    rtl

loc_06a381:
    jsl sub_1fdc69
    lda $14d7
    and #$80
    beq loc_06a390
    jml loc_06a417

loc_06a390:
    rep #$20
.a16
    lda $121d
    sta $14ca
    sep #$20
.a8
    rep #$20
.a16
    lda $26,x
    sta $151d
    sec
    sbc #$00c8
    sta $151b
    sep #$20

loc_06a3aa:
.a8
    rep #$20
.a16
    lda $151b
    sta $3e
    lda $151d
    sta $3a
    lda #$0000
    jsl sub_1fc8ea
    cpy #$0000
    sep #$20
.a8
    bne loc_06a3c8
    jml loc_06a40b

loc_06a3c8:
    lda $001f,y
    and #$20
    beq loc_06a3d3
    jml loc_06a3aa

loc_06a3d3:
    lda $001e,y
    and #$01
    beq loc_06a3de
    jml loc_06a3aa

loc_06a3de:
    lda $0008,y
    and #$08
    bne loc_06a3e9
    jml loc_06a3aa

loc_06a3e9:
    lda $002a,y
    bmi loc_06a3aa
    sec
    sbc #$08
    bpl loc_06a3f5
    lda #$00

loc_06a3f5:
    sta $002a,y
    lda $001d,y
    ora #$02
    sta $001d,y
    lda $0009,y
    ora #$10
    sta $0009,y
    brl loc_06a3aa

loc_06a40b:
    rep #$20
.a16
    lda $26,x
    clc
    adc #$00c8
    sta $26,x
    sep #$20

loc_06a417:
.a8
    rtl
    .incbin "data/032418-032782.bin"
    rep #$20
.a16
    lda #$af41
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06a796
    jml loc_06a7e2

loc_06a796:
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y
    lda #$02
    sta $002a,y
    lda #$08
    sta $002b,y
    rep #$20
.a16
    lda #$a23f
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fd464
    lda #$32
    sta $0015,y
    lda #$1c
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$80
    sta $002e,y
    jsr sub_06b552

loc_06a7e2:
    rtl
    rep #$20
.a16
    lda #$b369
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06a7f7
    jml loc_06a847

loc_06a7f7:
    lda #$01
    sta $002a,y
    lda #$02
    sta $002b,y
    rep #$20
.a16
    lda #$a18a
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$8783
    sta $1cd3,y
    lda #$a21d
    sta $1cd0,y
    sep #$20
.a8
    lda #$42
    sta $0015,y
    lda #$0a
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$80
    sta $002e,y
    jsr sub_06b552

loc_06a847:
    rtl
    .db $c2,$20,$a9,$fd,$b1,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$be,$a8,$06,$b9,$1d,$00,$09,$20,$99,$1d,$00,$a9,$00,$99,$df
    .db $1c,$a9,$00,$99,$f4,$1c,$a9,$01,$99,$2a,$00,$a9,$03,$99,$2b,$00
    .db $c2,$20,$a9,$0d,$a1,$99,$16,$00,$e2,$20,$a9,$06,$99,$18,$00,$a9
    .db $06,$99,$d5,$1c,$a9,$06,$99,$d2,$1c,$c2,$20,$a9,$83,$87,$99,$d3
    .db $1c,$a9,$2a,$a2,$99,$d0,$1c,$e2,$20,$a9,$42,$99,$15,$00,$a9,$0a
    .db $99,$0a,$00,$b9,$2e,$00,$09,$08,$99,$2e,$00,$b9,$2e,$00,$09,$80
    .db $99,$2e,$00,$20,$52,$b5,$6b
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$50
    sta $1549
    rep #$20
.a16
    lda #$b369
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06a8e2
    jml loc_06a936

loc_06a8e2:
    lda #$01
    sta $002a,y
    lda #$02
    sta $002b,y
    rep #$20
.a16
    lda #$9e5c
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$a066
    sta $1cd0,y
    sep #$20
.a8
    lda #$42
    sta $0015,y
    lda #$0a
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$80
    sta $002e,y
    jsr sub_06b552
    jsl sub_03b6cd

loc_06a936:
    rtl
    .db $c2,$20,$a9,$69,$b3,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$bd,$a9,$06,$a9,$01,$99,$2a,$00,$a9,$02,$99,$2b,$00,$c2,$20
    .db $a9,$5c,$9e,$99,$16,$00,$e2,$20,$a9,$06,$99,$18,$00,$a9,$06,$99
    .db $d5,$1c,$a9,$06,$99,$d2,$1c,$c2,$20,$a9,$c7,$87,$99,$d3,$1c,$a9
    .db $66,$a0,$99,$d0,$1c,$e2,$20,$a9,$3c,$99,$15,$00,$a9,$28,$99,$0a
    .db $00,$b9,$2e,$00,$09,$40,$99,$2e,$00,$b9,$2e,$00,$09,$08,$99,$2e
    .db $00,$b9,$2e,$00,$09,$10,$99,$2e,$00,$b9,$2e,$00,$09,$20,$99,$2e
    .db $00,$c2,$20,$ad,$49,$15,$18,$69,$14,$00,$8d,$49,$15,$e2,$20,$20
    .db $52,$b5,$22,$81,$b6,$03,$6b
    rep #$20
.a16
    lda #$aeed
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06a9d2
    jml loc_06aa40

loc_06a9d2:
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y
    lda #$01
    sta $002a,y
    lda #$0a
    sta $002b,y
    rep #$20
.a16
    lda #$9c1e
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$8d12
    sta $1cd0,y
    sep #$20
.a8
    lda #$50
    sta $0015,y
    lda #$64
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    jsr sub_06b552
    jsl sub_03b6e9

loc_06aa40:
    rtl
    .incbin "data/032a41-032cd0.bin"
    rep #$20
.a16
    lda #$aeed
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06ace4
    jml loc_06ad52

loc_06ace4:
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y
    lda #$01
    sta $002a,y
    lda #$0a
    sta $002b,y
    rep #$20
.a16
    lda #$9c1e
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$8d12
    sta $1cd0,y
    sep #$20
.a8
    lda #$50
    sta $0015,y
    lda #$1e
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    jsr sub_06b552
    jsl sub_03b6e9

loc_06ad52:
    rtl
    rep #$20
.a16
    lda #$aeed
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06ad67
    jml loc_06add5

loc_06ad67:
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y
    lda #$01
    sta $002a,y
    lda #$0a
    sta $002b,y
    rep #$20
.a16
    lda #$9a5b
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$8d12
    sta $1cd0,y
    sep #$20
.a8
    lda #$3c
    sta $0015,y
    lda #$32
    sta $000a,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    jsr sub_06b552
    jsl sub_03b6e9

loc_06add5:
    rtl
    .db $c2,$20,$a9,$00,$c6,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$60,$ae,$06,$b9,$1d,$00,$09,$20,$99,$1d,$00,$a9,$00,$99,$df
    .db $1c,$a9,$00,$99,$f4,$1c,$a9,$01,$99,$2a,$00,$a9,$08,$99,$2b,$00
    .db $c2,$20,$a9,$a6,$9b,$99,$16,$00,$e2,$20,$a9,$06,$99,$18,$00,$a9
    .db $06,$99,$d5,$1c,$a9,$06,$99,$d2,$1c,$c2,$20,$a9,$c7,$87,$99,$d3
    .db $1c,$a9,$12,$8d,$99,$d0,$1c,$e2,$20,$a9,$64,$99,$15,$00,$a9,$32
    .db $99,$0a,$00,$b9,$2e,$00,$09,$08,$99,$2e,$00,$b9,$2e,$00,$09,$40
    .db $99,$2e,$00,$b9,$20,$00,$09,$04,$99,$20,$00,$b9,$09,$00,$29,$f7
    .db $99,$09,$00,$20,$52,$b5,$22,$e9,$b6,$03,$6b
    rep #$20
.a16
    lda #$b34d
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06ae75
    jml loc_06aee0

loc_06ae75:
    lda #$01
    sta $002a,y
    lda #$02
    sta $002b,y
    rep #$20
.a16
    lda #$9e5c
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$a066
    sta $1cd0,y
    sep #$20
.a8
    jsr sub_06b53c
    lda #$28
    sta $000a,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    rep #$20
.a16
    lda $1549
    clc
    adc #$0014
    sta $1549
    sep #$20
.a8
    jsr sub_06b552
    jsl sub_03b6cd
    jsr sub_06b662

loc_06aee0:
    rtl
    rep #$20
.a16
    lda #$b34d
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06aef5
    jml loc_06af60

loc_06aef5:
    lda #$01
    sta $002a,y
    lda #$02
    sta $002b,y
    rep #$20
.a16
    lda #$9ef4
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$a066
    sta $1cd0,y
    sep #$20
.a8
    jsr sub_06b53c
    lda #$28
    sta $000a,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $002e,y
    ora #$08
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    rep #$20
.a16
    lda $1549
    clc
    adc #$0014
    sta $1549
    sep #$20
.a8
    jsr sub_06b552
    jsl sub_03b6cd
    jsr sub_06b662

loc_06af60:
    rtl
    rep #$20
.a16
    lda #$b34d
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06af75
    jml loc_06afe2

loc_06af75:
    lda #$01
    sta $002a,y
    lda #$02
    sta $002b,y
    rep #$20
.a16
    lda #$9e5c
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda #$06
    sta $1cd5,y
    lda #$06
    sta $1cd2,y
    rep #$20
.a16
    lda #$87c7
    sta $1cd3,y
    lda #$a066
    sta $1cd0,y
    sep #$20
.a8
    lda #$5a
    sta $0015,y
    lda #$28
    sta $000a,y
    lda $002e,y
    ora #$40
    sta $002e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    lda $002e,y
    ora #$08
    sta $002e,y
    rep #$20
.a16
    lda $1549
    clc
    adc #$0014
    sta $1549
    sep #$20
.a8
    jsr sub_06b552
    jsl sub_03b6cd
    jsr sub_06b662

loc_06afe2:
    rtl
    .incbin "data/032fe3-03353c.bin"

sub_06b53c:
    lda #$30
    sta $0015,y
    lda $1ffd
    cmp #$00
    bne loc_06b54c
    jml loc_06b551

loc_06b54c:
    lda #$3c
    sta $0015,y

loc_06b551:
    rts

sub_06b552:
    lda #$02
    sta $0009,y
    lda $002e,y
    ora #$02
    sta $002e,y
    jsl sub_1fdb01
    lda #$00
    sta $0014,y
    lda $1545
    sta $02
    sta $04
    bit #$80
    beq loc_06b579
    lda #$ff
    sta $05
    bra loc_06b57b

loc_06b579:
    stz $05

loc_06b57b:
    lda $1547
    sta $08
    sta $0a
    bit #$80
    beq loc_06b58c
    lda #$ff
    sta $0b
    bra loc_06b58e

loc_06b58c:
    stz $0b

loc_06b58e:
    lda $1549
    sta $90
    sta $15c2
    bit #$80
    beq loc_06b5a1
    lda #$ff
    sta $15c3
    bra loc_06b5a4

loc_06b5a1:
    stz $15c3

loc_06b5a4:
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
    phx
    ldx $154d
    beq loc_06b637
    rep #$20
.a16
    lda $0c,x
    sta $04
    lda $0e,x
    sta $0a
    lda $10,x
    sta $15c2
    sep #$20
.a8
    phx
    tyx
    ply
    jsl sub_1fd05c
    clc
    adc $154c
    sta $12,x
    jsl sub_1fd084
    eor #$ff
    inc a
    clc
    adc $154b
    sta $13,x
    phx
    tyx
    ply
    bra loc_06b64b

loc_06b637:
    lda $0012,y
    clc
    adc $154c
    sta $0012,y
    lda $0013,y
    clc
    adc $154b
    sta $0013,y

loc_06b64b:
    plx
    lda $0012,y
    sta $0022,y
    lda $0013,y
    sta $0023,y
    lda $15,x
    sta $0024,y
    stx $19,y
    sty $19,x
    rts

sub_06b662:
    phx
    tyx
    ldy $1238
    rep #$20
.a16
    lda #$b0ad
    sta $1540
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_06b67f
    eor #$ffff
    inc a

loc_06b67f:
    cmp #$01f4
    sep #$20
.a8
    bpl loc_06b68a
    jml loc_06b6b7

loc_06b68a:
    rep #$20
.a16
    lda #$b091
    sta $1540
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_06b6a2
    eor #$ffff
    inc a

loc_06b6a2:
    cmp #$03e8
    sep #$20
.a8
    bpl loc_06b6ad
    jml loc_06b6b7

loc_06b6ad:
    rep #$20
.a16
    lda #$b075
    sta $1540
    sep #$20

loc_06b6b7:
.a8
    rep #$20
.a16
    lda $1540
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06b6cb
    jml loc_06b6e3

loc_06b6cb:
    jsl sub_1fdad9
    lda #$80
    sta $0013,y
    rep #$20
.a16
    lda #$b6e6
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y

loc_06b6e3:
    txy
    plx
    rts
    lda $1d,x
    ora #$20
    sta $1d,x
    lda #$00
    sta $1cdf,x
    lda #$00
    sta $1cf4,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    ora #$80
    sta $1ce6,x
    rep #$20
.a16
    lda #$b715
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    jsl sub_1fdc69
    rtl
    jsl sub_1fdc69
    lda $1ce6,x
    and #$7f
    cmp #$02
    bne loc_06b726
    jml loc_068d12

loc_06b726:
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_06b731
    clc
    adc #$04

loc_06b731:
    and #$7f
    cmp #$04
    bcc loc_06b73a
    sec
    sbc #$04

loc_06b73a:
    ora #$80
    sta $1ce6,x
    rtl
    .incbin "data/033740-033a91.bin"

sub_06ba91:
    lda $14db
    cmp #$00
    beq loc_06ba9c
    jml loc_06baa6

loc_06ba9c:
    rep #$20
.a16
    lda #$0078
    sta $1598
    sep #$20

loc_06baa6:
.a8
    lda $14db
    cmp #$01
    beq loc_06bab1
    jml loc_06babb

loc_06bab1:
    rep #$20
.a16
    lda #$003c
    sta $1598
    sep #$20

loc_06babb:
.a8
    lda $14db
    cmp #$02
    beq loc_06bac6
    jml loc_06baca

loc_06bac6:
    jsl sub_0bc87e

loc_06baca:
    lda $14db
    cmp #$04
    beq loc_06bad5
    jml loc_06bad9

loc_06bad5:
    jsl sub_0bcc7c

loc_06bad9:
    rtl
    .db $00,$00,$01,$00,$02,$00,$03,$00,$04,$00,$04,$00,$05,$00,$05,$00
    .db $06,$00,$06,$00,$06,$00,$05,$00,$05,$00,$04,$00,$04,$00,$03,$00
    .db $02,$00,$01,$00,$00,$00,$ff,$ff,$fe,$ff,$fd,$ff,$fc,$ff,$fc,$ff
    .db $fb,$ff,$fb,$ff,$fa,$ff,$fa,$ff,$fa,$ff,$fb,$ff,$fb,$ff,$fc,$ff
    .db $fc,$ff,$fd,$ff,$fe,$ff,$ff,$ff,$e2,$20,$ad,$3c,$17,$18,$6d,$08
    .db $1f,$8d,$08,$1f,$ad,$d9,$14,$18,$6d,$07,$1f,$8d,$07,$1f,$e2,$20
    .db $ad,$3c,$17,$38,$ed,$d9,$14,$f0,$14,$0a,$8d,$c5,$14,$ad,$ad,$18
    .db $18,$6d,$c5,$14,$c9,$64,$90,$02,$a9,$64,$8d,$ad,$18,$6b,$a9,$00
    .db $48,$ab

sub_06bb5c:
    phy
    php
    sep #$10
.i8
    rep #$20
.a16
    lda $18c5
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
    sta $14c5
    cmp #$8000
    ror a
    clc
    adc $14c5
    eor #$ffff
    inc a
    ldy $14cc
    bne loc_06bba1
    cmp #$00e8
    bmi loc_06bb99
    lda #$00e8

loc_06bb99:
    cmp #$ffc8
    bpl loc_06bba1
    lda #$ffc8

loc_06bba1:
    clc
    adc $169c
    and #$01ff
    sta $194d
    stz $194f
    lda $18c7
    sec
    sbc $152a
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
    clc
    adc $169e
    sta $7001b0
    sep #$20
.a8
    plp
.i16
    ply
    rtl
    .db $08,$07,$06,$05

sub_06bbda:
.a16
    sep #$20
.a8
    rep #$10
    phx
    lda #$0d
    sta $1ff4
    ldx #$7997
    stx $16fd
    plx
    jsl sub_02e2cc
    jsl sub_0bd2ef
    jsl sub_0bb551
    lda #$00
    sta $701a28
    sta $701a29
    lda $14d0
    and #$fd
    sta $14d0
    ldx $1238
    sep #$20
    rep #$10
    rep #$20
.a16
    lda #$b235
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06bc24
    jml loc_06bc71

loc_06bc24:
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
    lda #$4758
    sta $0028,y
    sep #$20
.a8
    lda #$ff
    sta $002a,y
    lda #$00
    sta $002b,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$fef2
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    clc
    adc #$0078
    sta $000e,y
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    clc
    adc #$0d48
    sta $0010,y
    sep #$20

loc_06bc71:
.a8
    rep #$20
.a16
    lda #$b251
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06bc85
    jml loc_06bcd2

loc_06bc85:
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
    lda #$4758
    sta $0028,y
    sep #$20
.a8
    lda #$ff
    sta $002a,y
    lda #$00
    sta $002b,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$010e
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    clc
    adc #$0078
    sta $000e,y
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    clc
    adc #$0d48
    sta $0010,y
    sep #$20

loc_06bcd2:
.a8
    rep #$20
.a16
    ldx #$0000

loc_06bcd7:
    stz $1789,x
    inx
    inx
    cpx #$00e0
    bne loc_06bcd7
    txy
    ldx #$0000

loc_06bce5:
    lda $02f8bf,x
    sta $1789,y
    iny
    iny
    inx
    inx
    cpx #$0020
    bne loc_06bce5
    lda #$ffff
    sta $16f9
    lda #$0000
    sta $70021c
    rtl
    .incbin "data/033d03-036915.bin"

sub_06e915:
.a8
    inc $24,x
    lda $24,x
    cmp #$1c
    beq loc_06e921
    jml loc_06e925

loc_06e921:
    lda #$00
    sta $24,x

loc_06e925:
    phx
    rep #$20
.a16
    lda $24,x
    and #$00ff
    tax
    sep #$20
.a8
    lda $0beb8f,x
    plx
    asl a
    sta $14,x
    inc $25,x
    lda $25,x
    asl a
    sta $25,x
    lda $25,x
    cmp #$48
    beq loc_06e949
    jml loc_06e94d

loc_06e949:
    lda #$00
    sta $25,x

loc_06e94d:
    phx
    rep #$20
.a16
    lda $25,x
    and #$00ff
    tax
    lda $06bada,x
    bit #$0080
    beq loc_06e964
    ora #$ff00
    bra loc_06e967

loc_06e964:
    and #$00ff

loc_06e967:
    plx
    asl a
    sta $0e,x
    sep #$20
.a8
    lda $25,x
    cmp #$80
    ror a
    sta $25,x
    rtl
    .incbin "data/036975-036e09.bin"
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    rep #$20
.a16
    lda #$ee38
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda #$00
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$0000
    sta $1cd3,x
    lda #$f45f
    sta $1cd0,x
    sep #$20
.a8
    lda $1d,x
    ora #$02
    sta $1d,x
    dec $0a,x
    bmi loc_06ee46
    jml loc_06ee63

loc_06ee46:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    lda $7e1cd2,x
    beq loc_06ee62
    pha
    rep #$20
.a16
    lda $7e1cd0,x
    dec a
    pha
    sep #$20
.a8
    rtl

loc_06ee62:
    rtl

loc_06ee63:
    lda $20,x
    and #$04
    bne loc_06ee6d
    jml loc_06ee71

loc_06ee6d:
    jsl sub_1fdc69

loc_06ee71:
    rtl
    .db $a9,$ff,$95,$2a,$a9,$08,$95,$2b,$c2,$20,$a9,$91,$ee,$95,$16,$e2
    .db $20,$a9,$06,$95,$18,$22,$50,$d4,$1f,$b5,$1e,$09,$01,$95,$1e,$d6
    .db $0a,$30,$04,$5c,$da,$ee,$06,$22,$05,$ec,$06,$b5,$1e,$29,$10,$d0
    .db $04,$5c,$d6,$ee,$06,$c2,$20,$a9,$a1,$ac,$8d,$c5,$14,$e2,$20,$22
    .db $4b,$d5,$1f,$b0,$04,$5c,$d6,$ee,$06,$c2,$20,$a9,$9c,$f8,$99,$16
    .db $00,$e2,$20,$a9,$06,$99,$18,$00,$22,$d9,$da,$1f,$b9,$20,$00,$09
    .db $04,$99,$20,$00,$22,$01,$d5,$1f,$22,$69,$dc,$1f,$6b,$22,$1b,$ef
    .db $06,$c2,$20,$a9,$d9,$ac,$99,$04,$00,$e2,$20,$6b

sub_06eeee:
    jsl sub_06ef1b
    rep #$20
.a16
    lda #$acf5
    sta $0004,y
    sep #$20
.a8
    rtl

sub_06eefd:
    jsl sub_06ef1b
    rep #$20
.a16
    lda #$ad11
    sta $0004,y
    sep #$20
.a8
    rtl

loc_06ef0c:
    jsl sub_06ef1b
    rep #$20
.a16
    lda #$acbd
    sta $0004,y
    sep #$20
.a8
    rtl

sub_06ef1b:
    rep #$20
.a16
    lda #$0000
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06ef2f
    jml loc_06ef63

loc_06ef2f:
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $001e,y
    ora #$01
    sta $001e,y
    lda $001e,y
    ora #$08
    sta $001e,y
    lda $0020,y
    ora #$04
    sta $0020,y
    rep #$20
.a16
    lda #$ee09
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9
    rtl

loc_06ef63:
    ldy $156b
    rtl

loc_06ef67:
    jsl sub_02fc58
    rep #$20
.a16
    bit #$0080
    beq loc_06ef77
    ora #$ff00
    bra loc_06ef7a

loc_06ef77:
    and #$00ff

loc_06ef7a:
    clc
    adc $000c,y
    sta $000c,y
    sep #$20
.a8
    jsl sub_02fc58
    rep #$20
.a16
    bit #$0080
    beq loc_06ef93
    ora #$ff00
    bra loc_06ef96

loc_06ef93:
    and #$00ff

loc_06ef96:
    clc
    adc $000e,y
    sta $000e,y
    sep #$20
.a8
    rtl

loc_06efa0:
    jsl sub_02fc58
    rep #$20
.a16
    bit #$0080
    beq loc_06efb0
    ora #$ff00
    bra loc_06efb3

loc_06efb0:
    and #$00ff

loc_06efb3:
    asl a
    clc
    adc $000c,y
    sta $000c,y
    sep #$20
.a8
    jsl sub_02fc58
    rep #$20
.a16
    bit #$0080
    beq loc_06efcd
    ora #$ff00
    bra loc_06efd0

loc_06efcd:
    and #$00ff

loc_06efd0:
    asl a
    clc
    adc $000e,y
    sta $000e,y
    sep #$20
.a8
    jsl sub_02fc58
    rep #$20
.a16
    bit #$0080
    beq loc_06efea
    ora #$ff00
    bra loc_06efed

loc_06efea:
    and #$00ff

loc_06efed:
    asl a
    clc
    adc $0010,y
    sta $0010,y
    sep #$20
.a8
    rtl
    .db $a9,$32,$95,$0a,$c2,$20,$a9,$1e,$f0,$9f,$d0,$1c,$7e,$e2,$20,$a9
    .db $06,$9f,$d2,$1c,$7e,$b5,$08,$09,$01,$95,$08,$a9,$00,$95,$2a,$b5
    .db $1e,$09,$01,$95,$1e,$6b,$d6,$0a,$f0,$04,$5c,$36,$f0,$06,$b5,$08
    .db $29,$fe,$95,$08,$a9,$ff,$95,$2a,$b5,$1e,$29,$fe,$95,$1e,$b5,$13
    .db $18,$69,$04,$95,$13,$22,$69,$dc,$1f,$22,$bb,$c7,$1f,$6b
    rep #$20
.a16
    lda #$b3a1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f05a
    jml loc_06f070

loc_06f05a:
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$0000
    sta $000e,y
    sep #$20
.a8
    lda $001f,y
    and #$f7
    sta $001f,y

loc_06f070:
    jml loc_06f45f
    .db $c2,$20,$a9,$bd,$b3,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$9e,$f0,$06,$22,$d9,$da,$1f,$c2,$20,$a9,$00,$00,$99,$0e,$00
    .db $e2,$20,$b9,$1f,$00,$29,$f7,$99,$1f,$00,$5c,$5f,$f4,$06,$c2,$20
    .db $a9,$d9,$b3,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04,$5c,$cc
    .db $f0,$06,$22,$d9,$da,$1f,$c2,$20,$a9,$00,$00,$99,$0e,$00,$e2,$20
    .db $b9,$1f,$00,$29,$f7,$99,$1f,$00,$5c,$5f,$f4,$06,$22,$df,$ee,$06
    .db $b9,$1f,$00,$09,$40,$99,$1f,$00,$22,$67,$ef,$06,$a9,$01,$99,$0a
    .db $00,$22,$df,$ee,$06,$b9,$1f,$00,$09,$40,$99,$1f,$00,$22,$67,$ef
    .db $06,$b9,$1e,$00,$29,$f7,$99,$1e,$00,$a9,$02,$99,$0a,$00,$22,$df
    .db $ee,$06,$b9,$1f,$00,$09,$40,$99,$1f,$00,$22,$67,$ef,$06,$a9,$03
    .db $99,$0a,$00,$22,$df,$ee,$06,$b9,$1f,$00,$09,$40,$99,$1f,$00,$22
    .db $67,$ef,$06,$b9,$1e,$00,$29,$f7,$99,$1e,$00,$a9,$04,$99,$0a,$00
    .db $22,$df,$ee,$06,$b9,$1f,$00,$09,$40,$99,$1f,$00,$22,$67,$ef,$06
    .db $a9,$05,$99,$0a,$00,$a9,$04,$95,$0a,$b5,$20,$09,$04,$95,$20,$5c
    .db $09,$ee,$06

loc_06f157:
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f16b
    jml loc_06f17e

loc_06f16b:
    rep #$20
.a16
    lda #$f84d
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9

loc_06f17e:
    brl loc_06f201

loc_06f181:
.a16
    jsl sub_02fc58
    cmp #$b0e5
    tsb $5c
    dec $06f1
    bra loc_06f19b

loc_06f18f:
.a8
.i8
    jsl sub_02fc58
    cmp #$cc
    bcs loc_06f19b
    jml loc_06f1ce

loc_06f19b:
.a16
.i16
    rep #$20
    lda #$b26d
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f1af
    jml loc_06f1ce

loc_06f1af:
    rep #$20
.a16
    lda #$f1d2
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0028
    sta $10,x
    sep #$20

loc_06f1ce:
.a8
    jml loc_06f45f
    .db $b5,$14,$18,$69,$08,$95,$14,$6b

loc_06f1da:
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f1ee
    jml loc_06f201

loc_06f1ee:
    rep #$20
.a16
    lda #$f7e6
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9

loc_06f201:
    rep #$20
.a16
    ldy $1ce4,x
    phx
    tyx
    lda $000010,x
    plx
    cmp #$0040
    bcs loc_06f215
    brl loc_06f225

loc_06f215:
    cmp #$0080
    bcs loc_06f21d
    brl loc_06f22a

loc_06f21d:
    cmp #$0100
    bcs loc_06f225
    brl loc_06f22f

loc_06f225:
    lda #$000f
    bra loc_06f232

loc_06f22a:
    lda #$001e
    bra loc_06f232

loc_06f22f:
    lda #$0023

loc_06f232:
    sta $152d
    sep #$20
.a8
    rep #$20
.a16
    lda $1ce4,x
    sta $151b
    sep #$20
.a8
    jsl sub_02fc58
    sta $152c
    lda $152c
    sta $152e
    lda $152e
    clc
    adc #$10
    sta $152e
    rep #$20
.a16
    lda $151b
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f26b
    jml loc_06f2aa

loc_06f26b:
    rep #$20
.a16
    lda #$f360
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9
    jsl sub_1fdb01
    lda $1d,x
    sta $001d,y
    lda $1e,x
    sta $001e,y
    lda $1f,x
    sta $001f,y
    lda $20,x
    sta $0020,y
    phx
    tyx
    ply
    lda $152e
    sta $02
    lda $152d
    sta $90
    jsl sub_1fdab8
    phx
    tyx
    ply

loc_06f2aa:
    lda $152e
    clc
    adc #$55
    sta $152e
    rep #$20
.a16
    lda $151b
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f2c7
    jml loc_06f306

loc_06f2c7:
    rep #$20
.a16
    lda #$f360
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fdad9
    jsl sub_1fdb01
    lda $1d,x
    sta $001d,y
    lda $1e,x
    sta $001e,y
    lda $1f,x
    sta $001f,y
    lda $20,x
    sta $0020,y
    phx
    tyx
    ply
    lda $152e
    sta $02
    lda $152d
    sta $90
    jsl sub_1fdab8
    phx
    tyx
    ply

loc_06f306:
    jml loc_06f4b5
    .db $c2,$20,$a9,$33,$f3,$95,$16,$e2,$20,$a9,$06,$95,$18,$22,$58,$fc
    .db $02,$95,$12,$22,$58,$fc,$02,$95,$14,$b5,$1e,$09,$01,$95,$1e,$b5
    .db $1d,$29,$fd,$95,$1d,$a9,$0f,$95,$0a,$b5,$12,$18,$69,$10,$95,$12
    .db $b5,$14,$18,$69,$06,$95,$14,$22,$bb,$c7,$1f,$d6,$0a,$f0,$04,$5c
    .db $51,$f3,$06,$22,$01,$d5,$1f,$b5,$20,$29,$04,$d0,$04,$5c,$5f,$f3
    .db $06,$22,$69,$dc,$1f,$6b
    rep #$20
.a16
    lda #$f3b6
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda #$00
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$0000
    sta $1cd3,x
    lda #$f3f5
    sta $1cd0,x
    sep #$20
.a8
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $1e,x
    ora #$01
    sta $1e,x
    jsl sub_02fc58
    and #$07
    sta $152c
    lda $152c
    clc
    adc #$0a
    sta $152c
    lda $152c
    sta $0a,x
    lda $1d,x
    and #$fd
    sta $1d,x
    jsl sub_1fc7bb
    lda $12,x
    clc
    adc #$08
    sta $12,x
    lda $14,x
    clc
    adc #$04
    sta $14,x
    dec $0a,x
    beq loc_06f3cc
    jml loc_06f3d6

loc_06f3cc:
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x

loc_06f3d6:
    jsl sub_1fc7bb
    lda $20,x
    and #$04
    bne loc_06f3e4
    jml loc_06f3f4

loc_06f3e4:
    jsl sub_1fdc69
    rep #$20
.a16
    lda $10,x
    sec
    sbc #$0020
    sta $10,x
    sep #$20

loc_06f3f4:
.a8
    rtl
    lda $1d,x
    and #$fe
    sta $1d,x
    lda $20,x
    and #$7f
    sta $20,x
    brl loc_06f45f
    .db $c2,$20,$a9,$a1,$ac,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$2b,$f4,$06,$c2,$20,$a9,$9c,$f8,$99,$16,$00,$e2,$20,$a9,$06
    .db $99,$18,$00,$22,$d9,$da,$1f,$82,$31,$00,$b5,$20,$09,$04,$95,$20
    .db $c2,$20,$b5,$0c,$38,$fd,$2f,$00,$95,$0c,$e2,$20,$c2,$20,$b5,$0e
    .db $38,$fd,$31,$00,$95,$0e,$e2,$20,$c2,$20,$b5,$10,$38,$fd,$33,$00
    .db $95,$10,$e2,$20,$22,$45,$db,$1f,$82,$00,$00

loc_06f45f:
    lda $20,x
    and #$10
    beq loc_06f469
    jml loc_06f473

loc_06f469:
    lda $20,x
    and #$40
    bne loc_06f473
    jml loc_06f477

loc_06f473:
    jsl sub_1fdba4

loc_06f477:
    lda $1d,x
    and #$01
    bne loc_06f481
    jml loc_06f4a8

loc_06f481:
    rep #$20
.a16
    lda #$e4d8
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f495
    jml loc_06f4a8

loc_06f495:
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$e8d5
    sta $0016,y
    sep #$20
.a8
    lda #$0a
    sta $0018,y

loc_06f4a8:
    rep #$20
.a16
    lda $1ce4,x
    sep #$20
.a8
    beq loc_06f4b5
    jml loc_06f1da

loc_06f4b5:
    lda $1d,x
    bit #$01
    bne loc_06f4c1
    lda $20,x
    bit #$80
    beq loc_06f4c4

loc_06f4c1:
    inc $14d9

loc_06f4c4:
    lda $08,x
    and #$10
    bne loc_06f4ce
    jml loc_068d12

loc_06f4ce:
    lda $08,x
    ora #$01
    sta $08,x
    lda #$00
    sta $2a,x
    lda $1d,x
    and #$df
    sta $1d,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $08,x
    and #$40
    bne loc_06f4ee
    jml loc_06f514

loc_06f4ee:
    phy
    rep #$20
.a16
    lda $7e1cdd,x
    beq loc_06f511
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

loc_06f511:
    sep #$20
    ply

loc_06f514:
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_06f528
    jml loc_068d12

loc_06f528:
    lda $1d,x
    sta $001d,y
    lda $1e,x
    sta $001e,y
    lda $1f,x
    sta $001f,y
    lda $20,x
    sta $0020,y
    lda $001d,y
    and #$fe
    sta $001d,y
    lda $001d,y
    and #$fd
    sta $001d,y
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $001d,y
    and #$f7
    sta $001d,y
    lda $001d,y
    ora #$20
    sta $001d,y
    lda #$00
    sta $1cdf,y
    lda #$00
    sta $1cf4,y
    rep #$20
.a16
    phy
    ldy $04,x
    phx
    tyx
    stz $151b
    lda $000010,x
    cmp #$0040
    bcs loc_06f584
    brl loc_06f662

loc_06f584:
    cmp #$0080
    bcs loc_06f58c
    brl loc_06f614

loc_06f58c:
    cmp #$0100
    bcs loc_06f594
    brl loc_06f5c5

loc_06f594:
    plx
    ply
    sep #$20
.a8
    lda #$08
    sta $000b,y
    rep #$20
.a16
    lda #$b155
    sta $0004,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$be20
    sta $04,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$f783
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    jml loc_06f6ab

loc_06f5c5:
.a16
    sec
    sbc #$0100
    sta $02
    lda $000007,x
    and #$00ff
    beq loc_06f5d9

loc_06f5d4:
    lsr $02
    dec a
    bne loc_06f5d4

loc_06f5d9:
    lda $02
    plx
    ply
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    sep #$20
.a8
    sta $1cf4,y
    lda #$08
    sta $000b,y
    rep #$20
.a16
    lda #$b139
    sta $0004,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$be20
    sta $04,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$f7ad
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    jml loc_06f6ab

loc_06f614:
.a16
    sec
    sbc #$0080
    sta $02
    lda $000007,x
    and #$00ff
    beq loc_06f628

loc_06f623:
    lsr $02
    dec a
    bne loc_06f623

loc_06f628:
    lda $02
    plx
    ply
    lsr a
    lsr a
    lsr a
    lsr a
    sep #$20
.a8
    sta $1cf4,y
    lda #$06
    sta $000b,y
    rep #$20
.a16
    lda #$b11d
    sta $0004,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$be04
    sta $04,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$f7ad
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    jml loc_06f6ab

loc_06f662:
.a16
    sec
    sbc #$0040
    sta $02
    lda $000007,x
    and #$00ff
    beq loc_06f676

loc_06f671:
    lsr $02
    dec a
    bne loc_06f671

loc_06f676:
    lda $02
    plx
    ply
    lsr a
    lsr a
    lsr a
    sep #$20
.a8
    sta $1cf4,y
    lda #$04
    sta $000b,y
    rep #$20
.a16
    lda #$b101
    sta $0004,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$b587
    sta $04,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$f7ad
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x

loc_06f6ab:
    jsl sub_02fc58
    sta $12,x
    jsl sub_02fc58
    sta $13,x
    lda #$0c
    sta $0b,x
    lda #$00
    sta $0a,x
    lda #$00
    sta $000a,y
    lda #$00
    ora #$80
    sta $1ce6,x
    lda #$00
    ora #$80
    sta $1ce6,y
    jsl sub_1fdad9
    lda $18c8
    eor #$ff
    inc a
    clc
    adc #$80
    clc
    adc $152b
    sta $0013,y
    lda $18c6
    sta $0012,y
    rep #$20
.a16
    lda #$f7ad
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    jsl sub_1fd464
    lda #$ff
    sta $002a,y
    lda #$08
    sta $002b,y
    lda $001e,y
    ora #$01
    sta $001e,y
    rep #$20
.a16
    lda $000e,y
    sec
    sbc $151b
    sta $000e,y
    sep #$20
.a8
    rep #$20
.a16
    lda $2f,x
    sta $002f,y
    lda $31,x
    sta $0031,y
    lda $33,x
    sta $0033,y
    sep #$20
.a8
    lda $1e,x
    and #$08
    beq loc_06f73c
    jml loc_06f774

loc_06f73c:
    phy
    ldy $1238
    jsl sub_1fd0ab
    rep #$20
.a16
    lda $1250
    cmp #$03e8
    bcc loc_06f76b
    cmp #$07d0
    bcc loc_06f75f
    sep #$20
.a8
    lda #$23
    jsl sub_03b7f9
    jml loc_06f773

loc_06f75f:
.a16
    sep #$20
.a8
    lda #$22
    jsl sub_03b7f9
    jml loc_06f773

loc_06f76b:
.a16
    sep #$20
.a8
    lda #$21
    jsl sub_03b7f9

loc_06f773:
    ply

loc_06f774:
    lda $1f,x
    and #$40
    bne loc_06f77e
    jml loc_06f782

loc_06f77e:
    jsl sub_1fd501

loc_06f782:
    rtl
    lda $15bb
    and #$01
    beq loc_06f78e
    jml loc_06f7c8

loc_06f78e:
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_06f799
    clc
    adc #$08

loc_06f799:
    and #$7f
    cmp #$08
    bcc loc_06f7a2
    sec
    sbc #$08

loc_06f7a2:
    ora #$80
    sta $1ce6,x
    inc $0a,x
    jml loc_06f7c8
    lda $1ce6,x
    clc
    adc #$01
    bmi loc_06f7b8
    clc
    adc #$08

loc_06f7b8:
    and #$7f
    cmp #$08
    bcc loc_06f7c1
    sec
    sbc #$08

loc_06f7c1:
    ora #$80
    sta $1ce6,x
    inc $0a,x

loc_06f7c8:
    lda $20,x
    and #$04
    bne loc_06f7d2
    jml loc_06f7d6

loc_06f7d2:
    jsl sub_1fdc69

loc_06f7d6:
    jsl sub_1fc7bb
    lda $0a,x
    cmp $000b,x
    bmi loc_06f7e5
    jml loc_068d12

loc_06f7e5:
    rtl
    .db $c2,$20,$a9,$1c,$f8,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06,$9f,$d2,$1c
    .db $7e,$b5,$1e,$09,$01,$95,$1e,$b5,$08,$09,$01,$95,$08,$b5,$1d,$09
    .db $10,$95,$1d,$a9,$06,$95,$24,$a9,$3c,$95,$22,$a9,$1e,$95,$23,$b5
    .db $1d,$29,$f7,$95,$1d,$6b,$b5,$1d,$09,$10,$95,$1d,$a9,$00,$95,$24
    .db $a9,$00,$95,$22,$a9,$00,$95,$23,$b5,$1d,$29,$f7,$95,$1d,$f6,$0a
    .db $b5,$0a,$c9,$28,$d0,$04,$5c,$12,$8d,$06,$c2,$20,$b5,$10,$18,$69
    .db $23,$00,$95,$10,$e2,$20,$6b
    rep #$20
.a16
    lda #$f883
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $08,x
    ora #$01
    sta $08,x
    lda $1d,x
    ora #$10
    sta $1d,x
    lda #$07
    sta $24,x
    lda #$3c
    sta $22,x
    lda #$28
    sta $23,x
    lda $1d,x
    and #$f7
    sta $1d,x
    rtl
    lda $1d,x
    ora #$10
    sta $1d,x
    lda #$00
    sta $24,x
    lda #$00
    sta $22,x
    lda #$00
    sta $23,x
    lda $1d,x
    and #$f7
    sta $1d,x
    rtl
    rep #$20
.a16
    lda #$f8d2
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd2,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $08,x
    ora #$01
    sta $08,x
    lda $1d,x
    ora #$10
    sta $1d,x
    lda #$04
    sta $24,x
    lda #$ff
    sta $22,x
    lda #$64
    sta $23,x
    lda $1d,x
    and #$f7
    sta $1d,x
    rtl
    lda $1d,x
    ora #$10
    sta $1d,x
    lda #$00
    sta $24,x
    lda #$00
    sta $22,x
    lda #$00
    sta $23,x
    lda $1d,x
    and #$f7
    sta $1d,x
    inc $0a,x
    lda $0a,x
    cmp #$6e
    bne loc_06f8f6
    jml loc_068d12

loc_06f8f6:
    lda $20,x
    and #$04
    bne loc_06f900
    jml loc_06f904

loc_06f900:
    jsl sub_1fdc69

loc_06f904:
    rtl
    .db $c2,$20,$a9,$3b,$f9,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06,$9f,$d2,$1c
    .db $7e,$b5,$1e,$09,$01,$95,$1e,$b5,$08,$09,$01,$95,$08,$b5,$1d,$09
    .db $10,$95,$1d,$a9,$06,$95,$24,$a9,$fa,$95,$22,$a9,$3c,$95,$23,$b5
    .db $1d,$29,$f7,$95,$1d,$6b,$b5,$1d,$09,$10,$95,$1d,$a9,$00,$95,$24
    .db $a9,$00,$95,$22,$a9,$00,$95,$23,$b5,$1d,$29,$f7,$95,$1d,$f6,$0a
    .db $b5,$0a,$c9,$32,$d0,$04,$5c,$12,$8d,$06,$b5,$20,$29,$04,$d0,$04
    .db $5c,$6d,$f9,$06,$22,$69,$dc,$1f,$6b,$6b,$b5,$1d,$09,$10,$95,$1d
    .db $a9,$02,$95,$24,$a9,$02,$95,$22,$a9,$19,$95,$23,$b5,$1d,$29,$f7
    .db $95,$1d,$c2,$20,$a9,$a5,$f9,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06,$9f
    .db $d2,$1c,$7e,$b5,$1e,$09,$01,$95,$1e,$b5,$08,$09,$01,$95,$08,$6b
    .db $6b,$b5,$1d,$09,$10,$95,$1d,$a9,$03,$95,$24,$a9,$04,$95,$22,$a9
    .db $09,$95,$23,$b5,$1d,$29,$f7,$95,$1d,$5c,$87,$f9,$06,$c2,$20,$a9
    .db $a1,$ac,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04,$5c,$f7,$f9
    .db $06,$22,$d9,$da,$1f,$c2,$20,$a9,$f8,$f9,$99,$16,$00,$e2,$20,$a9
    .db $06,$99,$18,$00,$c2,$20,$b9,$0e,$00,$18,$69,$88,$ff,$99,$0e,$00
    .db $e2,$20,$6b,$c2,$20,$a9,$2e,$fa,$9f,$d0,$1c,$7e,$e2,$20,$a9,$06
    .db $9f,$d2,$1c,$7e,$b5,$1e,$09,$01,$95,$1e,$b5,$08,$09,$01,$95,$08
    .db $b5,$1d,$09,$10,$95,$1d,$a9,$06,$95,$24,$a9,$3c,$95,$22,$a9,$fa
    .db $95,$23,$b5,$1d,$29,$f7,$95,$1d,$6b,$b5,$1d,$09,$10,$95,$1d,$a9
    .db $00,$95,$24,$a9,$00,$95,$22,$a9,$00,$95,$23,$b5,$1d,$29,$f7,$95
    .db $1d,$f6,$0a,$b5,$0a,$c9,$fa,$d0,$04,$5c,$12,$8d,$06,$6b,$22,$58
    .db $fc,$02,$c9,$cc,$b0,$04,$5c,$9c,$fa,$06,$b4,$1b,$c0,$00,$00,$d0
    .db $04,$5c,$75,$fa,$06,$b9,$2e,$00,$29,$08,$d0,$04,$5c,$9c,$fa,$06
    .db $c2,$20,$a9,$d8,$e4,$8d,$c5,$14,$e2,$20,$22,$4b,$d5,$1f,$b0,$04
    .db $5c,$9c,$fa,$06,$22,$d9,$da,$1f,$c2,$20,$a9,$d5,$e8,$99,$16,$00
    .db $e2,$20,$a9,$0a,$99,$18,$00,$5c,$2e,$f4,$06
    rep #$20
.a16
    lda #$00a0
    sta $28,x
    sep #$20
.a8
    brl loc_06fab5
    rep #$20
.a16
    lda #$0000
    sta $28,x
    sep #$20

loc_06fab5:
.a8
    lda #$00
    sta $02
    lda #$d8
    sta $08
    lda $14,x
    jsl sub_1fcc78
    rep #$20
.a16
    lda #$0000
    sta $02
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $08
    sep #$20
.a8
    lda #$08

loc_06fad7:
    sta $90
    jsl sub_06eeee
    lda $0020,y
    and #$fb
    sta $0020,y
    lda $001f,y
    ora #$40
    sta $001f,y
    rep #$20
.a16
    lda $000c,y
    clc
    adc $02
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    clc
    adc $08
    sta $000e,y
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    clc
    adc $0028,x
    sta $000e,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$ee09
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    rep #$20
.a16
    lda $02
    clc
    adc $04
    sta $02
    sep #$20
.a8
    rep #$20
.a16
    lda $08
    clc
    adc $0a
    sta $08
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    sec
    sbc #$000a
    sta $0010,y
    sep #$20
.a8
    lda #$08
    sec
    sbc $90
    sta $000a,y
    lda $90
    dec a
    bne loc_06fad7
    lda #$07
    sta $0a,x
    jml loc_068d20
.gsu
    alt1
    lms r7,($0c6)
    with r7
    asr
    from r7
    asr
    asr
    iwt r7,#$0080
    add r7
    alt1
    lms r6,($1b0)
    add r6
    ibt r6,#$01
    iwt r10,#$0222
    iwt r12,#$00e0
    cache
    with r15
    to r13
    from r6
    alt1
    stb (r10)
    inc r10
    alt1
    stb (r10)
    inc r10
    swap
    alt1
    stb (r10)
    inc r10
    loop
    swap
    stop
    .db $01
    ibt r1,#$00
    ibt r2,#$00
    alt1
    lms r3,($0c6)
    with r3
    to r0
    not
    asr
    asr
    asr
    asr
    asr
    asr
    asr
    to r3
    hib
    with r3
    sex
    to r4
    lob
    with r4
    swap
    ibt r5,#$00
    alt1
    lms r7,($02c)
    with r7
    asr
    with r7
    asr
    with r7
    asr
    alt1
    lms r6,($1b0)
    with r7
    add r6
    ibt r6,#$01
    iwt r9,#$0372
    iwt r10,#$0371
    iwt r12,#$0070
    cache
    with r15
    to r13
    with r2
    add r4
    with r1
    alt1
    adc r3
    from r1
    add r5
    not
    add r7
    from r6
    alt1
    stb (r9)
    inc r9
    alt1
    stb (r9)
    inc r9
    swap
    alt1
    stb (r9)
    inc r9
    swap
    sub r7
    not
    add r7
    swap
    alt1
    stb (r10)
    dec r10
    swap
    alt1
    stb (r10)
    dec r10
    from r6
    alt1
    stb (r10)
    dec r10
    loop
    nop
    stop
    .db $01
    ibt r1,#$00
    ibt r2,#$00
    alt1
    lms r3,($0c6)
    with r3
    to r0
    add r3
    add r3
    add r3
    with r3
    asr
    with r3
    asr
    add r3
    to r3
    hib
    with r3
    sex
    to r4
    lob
    with r4
    swap
    iwt r5,#$0080
    ibt r6,#$01
    iwt r9,#$0372
    iwt r10,#$0372
    iwt r12,#$0070
    cache
    with r15
    to r13
    with r2
    add r4
    with r1
    alt1
    adc r3
    from r1
    add r5
    from r6
    alt1
    stb (r9)
    inc r9
    alt1
    stb (r9)
    swap
    inc r9
    alt1
    stb (r9)
    inc r9
    dec r10
    alt1
    stb (r10)
    swap
    dec r10
    alt1
    stb (r10)
    dec r10
    from r6
    alt1
    stb (r10)
    loop
    nop
    stop
    .incbin "data/037c30-038000.bin"
