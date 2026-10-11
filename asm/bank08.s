.rombank $08

    .incbin "data/040000-042c8b.bin"
.cpu
.a8
.i16
    rep #$20
.a16
    lda #$acce
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    jsl sub_1fd41a
    lda #$02
    sta $2a,x
    lda #$04
    sta $2b,x
    lda #$28
    sta $15,x
    lda #$40
    sta $12,x
    lda #$80
    sta $13,x
    rep #$20
.a16
    lda $0c,x
    clc
    adc $150d
    sta $0c,x
    sep #$20
.a8
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $2e,x
    ora #$01
    sta $2e,x
    lda #$0f
    sta $7e1ce9,x
    rep #$20
.a16
    lda $150f
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    sec
    sbc #$0320
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    cmp $151b
    sep #$20
.a8
    bpl loc_08acf5
    jml loc_08ad04

loc_08acf5:
    lda $12,x
    bne loc_08acfd
    jml loc_08ad1f

loc_08acfd:
    lda $12,x
    clc
    adc #$fe
    sta $12,x

loc_08ad04:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    rtl

loc_08ad1f:
    rep #$20
.a16
    lda #$ad59
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$0a
    sta $1549
    lda #$0c
    jsl sub_1fd146
    cpy #$0000
    bne loc_08ad59
    ldy $156b

loc_08ad59:
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08ad6a
    eor #$ffff
    inc a

loc_08ad6a:
    cmp #$07d0
    sep #$20
.a8
    bpl loc_08ad75
    jml loc_08ad78

loc_08ad75:
    brl loc_08ad04

loc_08ad78:
    rep #$20
.a16
    lda #$ad8c
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda $12,x
    clc
    adc #$fc
    sta $12,x
    lda $12,x
    clc
    adc #$fc
    sta $12,x
    bne loc_08ad99
    jml loc_08adb6

loc_08ad99:
    lda $12,x
    bpl loc_08ada1
    jml loc_08ade3

loc_08ada1:
    lda $12,x
    cmp #$c0
    bpl loc_08adab
    jml loc_08ade3

loc_08adab:
    lda $15bb
    and #$03
    beq loc_08adb6
    jml loc_08ade3

loc_08adb6:
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$0a
    sta $1549
    lda #$0c
    jsl sub_1fd146
    cpy #$0000
    bne loc_08ade3
    ldy $156b

loc_08ade3:
    lda $12,x
    cmp #$fc
    bne loc_08aded
    jml loc_08adf0

loc_08aded:
    brl loc_08ad04

loc_08adf0:
    rep #$20
.a16
    lda #$adfd
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda #$3c
    sta $14c5
    lda #$01
    jsl sub_1fd60d
    jsl sub_1fda57
    brl loc_08ad04
    .incbin "data/042e0f-043176.bin"
    lda #$ff
    sta $2a,x
    lda #$04
    sta $2b,x
    rep #$20
.a16
    lda #$b18c
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    rtl
    lda $13,x
    clc
    adc #$08
    sta $13,x
    rtl
    lda $2e,x
    ora #$10
    sta $2e,x
    jml loc_068599
    rep #$20
.a16
    lda #$b1c3
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    jsl sub_1fd41a
    lda #$08
    sta $2a,x
    lda #$04
    sta $2b,x
    lda $2e,x
    ora #$10
    sta $2e,x
    lda $2e,x
    ora #$01
    sta $2e,x
    lda $13,x
    clc
    adc #$08
    sta $13,x
    rtl
    rep #$20
.a16
    lda #$03e8
    sta $26,x
    sep #$20
.a8
    lda #$06
    sta $23,x
    brl loc_08b1e8
    rep #$20
.a16
    lda #$fc18
    sta $26,x
    sep #$20
.a8
    lda #$fa
    sta $23,x

loc_08b1e8:
    lda $1d,x
    ora #$08
    sta $1d,x
    rep #$20
.a16
    lda $0c,x
    clc
    adc $150d
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $26,x
    clc
    adc $150d
    sta $26,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$b257
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    jsl sub_1fd41a
    lda #$02
    sta $2a,x
    lda #$04
    sta $2b,x
    lda #$3c
    sta $15,x
    lda $09,x
    and #$f7
    sta $09,x
    ldy $1238
    lda $2e,x
    ora #$20
    sta $2e,x
    lda $2e,x
    ora #$40
    sta $2e,x
    lda $2e,x
    ora #$01
    sta $2e,x
    rep #$20
.a16
    lda $26,x
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    sta $1cca,x
    sep #$20
.a8
    lda #$03
    sta $7e1ce9,x
    rep #$20
.a16
    lda #$05dc
    sta $1cce,x
    sep #$20
.a8
    rep #$20
.a16
    lda $1cce,x
    clc
    adc $1511
    sta $1cce,x
    sep #$20
.a8
    stz $1532
    rep #$20
.a16
    lda $7e1cca,x
    sta $04
    lda $7e1cce,x
    sta $15c2
    sep #$20
.a8
    jsl sub_1fcf43
    eor #$ff
    inc a
    cmp $13,x
    beq loc_08b2bb
    sec
    sbc $13,x
    cmp #$00
    bmi loc_08b29d
    cmp #$08
    bpl loc_08b2a3
    lda #$08
    bra loc_08b2a3

loc_08b29d:
    cmp #$f8
    bmi loc_08b2a3
    lda #$f8

loc_08b2a3:
    cmp #$80
    ror a
    bpl loc_08b2aa
    adc #$00

loc_08b2aa:
    cmp #$80
    ror a
    bpl loc_08b2b1
    adc #$00

loc_08b2b1:
    cmp #$80
    ror a
    bpl loc_08b2b8
    adc #$00

loc_08b2b8:
    clc
    adc $13,x

loc_08b2bb:
    sta $13,x
    rep #$20
.a16
    lda $7e1cca,x
    sta $04
    lda $7e1ccc,x
    sta $0a
    lda $7e1cce,x
    sta $15c2
    sep #$20
.a8
    jsl sub_1fd05c
    cmp $12,x
    beq loc_08b309
    sec
    sbc $12,x
    cmp #$00
    bmi loc_08b2eb
    cmp #$08
    bpl loc_08b2f1
    lda #$08
    bra loc_08b2f1

loc_08b2eb:
    cmp #$f8
    bmi loc_08b2f1
    lda #$f8

loc_08b2f1:
    cmp #$80
    ror a
    bpl loc_08b2f8
    adc #$00

loc_08b2f8:
    cmp #$80
    ror a
    bpl loc_08b2ff
    adc #$00

loc_08b2ff:
    cmp #$80
    ror a
    bpl loc_08b306
    adc #$00

loc_08b306:
    clc
    adc $12,x

loc_08b309:
    sta $12,x
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08b31c
    eor #$ffff
    inc a

loc_08b31c:
    cmp #$03e8
    sep #$20
.a8
    bmi loc_08b327
    jml loc_08b372

loc_08b327:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    rep #$20
.a16
    lda $0e,x
    cmp #$0000
    sep #$20
.a8
    bpl loc_08b348
    jml loc_08b351

loc_08b348:
    rep #$20
.a16
    lda #$0000
    sta $0e,x
    sep #$20

loc_08b351:
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc $0028,x
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    clc
    adc $0006,x
    sta $0c,x
    sep #$20
.a8
    jsl sub_1fc7bb
    jsl sub_1fdc69
    rtl

loc_08b372:
    rep #$20
.a16
    lda #$b385
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda $09,x
    ora #$08
    sta $09,x
    lda $13,x
    sta $3a
    lda #$00
    jsl sub_1fd8bd
    sta $13,x
    bcc loc_08b397
    jml loc_08b3a1

loc_08b397:
    lda $12,x
    clc
    adc #$ff
    sta $12,x
    brl loc_08b327

loc_08b3a1:
    rep #$20
.a16
    lda #$b3ae
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08b3bf
    eor #$ffff
    inc a

loc_08b3bf:
    cmp #$0578
    sep #$20
.a8
    bpl loc_08b3ca
    jml loc_08b417

loc_08b3ca:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08b3d8
    eor #$ffff
    inc a

loc_08b3d8:
    cmp #$0708
    sep #$20
.a8
    bmi loc_08b3e3
    jml loc_08b4a0

loc_08b3e3:
    lda $15bb
    and #$03
    beq loc_08b3ee
    jml loc_08b4a0

loc_08b3ee:
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    sty $154d
    stz $154c
    stz $154b
    lda #$0a
    jsl sub_1fd146
    cpy #$0000
    bne loc_08b414
    ldy $156b

loc_08b414:
    brl loc_08b4a0

loc_08b417:
    lda #$2d
    sta $14c5
    lda #$01
    jsl sub_1fd60d
    lda $14,x
    sta $22,x
    lda $22,x
    sec
    sbc #$40
    sta $22,x
    phx
    rep #$20
.a16
    lda $22,x
    and #$00ff
    tax
    lda $0098a5,x
    bit #$0080
    beq loc_08b444
    ora #$ff00
    bra loc_08b447

loc_08b444:
    and #$00ff

loc_08b447:
    plx
    cmp #$8000
    ror a
    bpl loc_08b451
    adc #$0000

loc_08b451:
    cmp #$8000
    ror a
    bpl loc_08b45a
    adc #$0000

loc_08b45a:
    cmp #$8000
    ror a
    bpl loc_08b463
    adc #$0000

loc_08b463:
    sta $28,x
    sep #$20
.a8
    phx
    rep #$20
.a16
    lda $22,x
    and #$00ff
    tax
    lda $0098e5,x
    bit #$0080
    beq loc_08b47e
    ora #$ff00
    bra loc_08b481

loc_08b47e:
    and #$00ff

loc_08b481:
    plx
    cmp #$8000
    ror a
    bpl loc_08b48b
    adc #$0000

loc_08b48b:
    cmp #$8000
    ror a
    bpl loc_08b494
    adc #$0000

loc_08b494:
    sta $06,x
    sep #$20
.a8
    lda $14,x
    clc
    adc $0023,x
    sta $14,x

loc_08b4a0:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08b4ae
    eor #$ffff
    inc a

loc_08b4ae:
    cmp #$02bc
    sep #$20
.a8
    bpl loc_08b4b9
    jml loc_08b536

loc_08b4b9:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_08b4f4
    sec
    sbc $12,x
    cmp #$00
    bmi loc_08b4d6
    cmp #$08
    bpl loc_08b4dc
    lda #$08
    bra loc_08b4dc

loc_08b4d6:
    cmp #$f8
    bmi loc_08b4dc
    lda #$f8

loc_08b4dc:
    cmp #$80
    ror a
    bpl loc_08b4e3
    adc #$00

loc_08b4e3:
    cmp #$80
    ror a
    bpl loc_08b4ea
    adc #$00

loc_08b4ea:
    cmp #$80
    ror a
    bpl loc_08b4f1
    adc #$00

loc_08b4f1:
    clc
    adc $12,x

loc_08b4f4:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_08b531
    sec
    sbc $13,x
    cmp #$00
    bmi loc_08b513
    cmp #$08
    bpl loc_08b519
    lda #$08
    bra loc_08b519

loc_08b513:
    cmp #$f8
    bmi loc_08b519
    lda #$f8

loc_08b519:
    cmp #$80
    ror a
    bpl loc_08b520
    adc #$00

loc_08b520:
    cmp #$80
    ror a
    bpl loc_08b527
    adc #$00

loc_08b527:
    cmp #$80
    ror a
    bpl loc_08b52e
    adc #$00

loc_08b52e:
    clc
    adc $13,x

loc_08b531:
    sta $13,x
    brl loc_08b327

loc_08b536:
    brl loc_08b327
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$f046
    sta $1cd0,x
    sep #$20
.a8
    lda #$08
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $2e,x
    ora #$10
    sta $2e,x
    rtl
    rep #$20
.a16
    lda #$b5a4
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$f046
    sta $1cd0,x
    sep #$20
.a8
    lda #$08
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $2e,x
    ora #$10
    sta $2e,x
    rep #$20
.a16
    lda $121d
    sta $14ca
    sep #$20

loc_08b5ae:
.a8
    rep #$20
.a16
    lda #$0000
    sta $3e
    lda #$07d0
    sta $3a
    lda #$0000
    jsl sub_1fc870
    cpy #$0000
    sep #$20
.a8
    bne loc_08b5cc
    jml loc_08b5d9

loc_08b5cc:
    lda $002e,y
    and #$20
    bne loc_08b5d7
    jml loc_08b5ae

loc_08b5d7:
    sty $26,x

loc_08b5d9:
    ldy $26,x
    cpy #$0000
    bne loc_08b5e4
    jml loc_08b62c

loc_08b5e4:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08b5f2
    eor #$ffff
    inc a

loc_08b5f2:
    cmp #$00c8
    sep #$20
.a8
    bpl loc_08b5fd
    jml loc_08b681

loc_08b5fd:
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_08b62a
    sec
    sbc $13,x
    cmp #$00
    bmi loc_08b61a
    cmp #$02
    bpl loc_08b620
    lda #$02
    bra loc_08b620

loc_08b61a:
    cmp #$fe
    bmi loc_08b620
    lda #$fe

loc_08b620:
    cmp #$80
    ror a
    bpl loc_08b627
    adc #$00

loc_08b627:
    clc
    adc $13,x

loc_08b62a:
    sta $13,x

loc_08b62c:
    ldy $1238
    rep #$20
.a16
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp #$0320
    sep #$20
.a8
    bpl loc_08b645
    jml loc_08b681

loc_08b645:
    lda $15bb
    clc
    adc $123a
    and #$0f
    beq loc_08b654
    jml loc_08b681

loc_08b654:
    lda #$00
    sta $1545
    lda #$f0
    sta $1547
    lda #$0a
    sta $1549
    lda #$f0
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$24
    jsl sub_1fd146
    cpy #$0000
    bne loc_08b681
    ldy $156b

loc_08b681:
    rtl
    .incbin "data/043682-045414.bin"
    lda #$04
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$14
    sta $15,x
    lda #$20
    sta $13,x

loc_08d424:
    rep #$20
.a16
    lda #$d44f
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$08
    sta $1cd2,x
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$d51d
    sta $1cd0,x
    sep #$20
.a8
    lda #$14
    sta $22,x
    lda $22,x
    bne loc_08d457
    jml loc_08d480

loc_08d457:
    dec $22,x
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
    jsl sub_1fc7bb

loc_08d473:
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0023
    sta $10,x
    sep #$20
.a8
    rtl

loc_08d480:
    rep #$20
.a16
    lda #$d491
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    lda #$2a
    sta $22,x
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08d4a2
    eor #$ffff
    inc a

loc_08d4a2:
    cmp #$0bb8
    sep #$20
.a8
    bmi loc_08d4ad
    jml loc_08d509

loc_08d4ad:
    lda $13,x
    cmp #$00
    bpl loc_08d4bb
    cmp #$e0
    bcs loc_08d4c3
    jml loc_08d4c7

loc_08d4bb:
    cmp #$e0
    bcc loc_08d4c3
    jml loc_08d4c7

loc_08d4c3:
    jml loc_08d509

loc_08d4c7:
    lda $15bb
    and #$07
    beq loc_08d4d2
    jml loc_08d509

loc_08d4d2:
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    lda #$f0
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$26
    jsl sub_1fd146
    cpy #$0000
    bne loc_08d4ff
    ldy $156b

loc_08d4ff:
    rep #$20
.a16
    lda $1238
    sta $0006,y
    sep #$20

loc_08d509:
.a8
    lda $13,x
    clc
    adc #$02
    sta $13,x
    lda $22,x
    bne loc_08d518
    jml loc_08d424

loc_08d518:
    dec $22,x
    brl loc_08d473
    rep #$20
.a16
    lda #$c494
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_08d531
    jml loc_08d552

loc_08d531:
    rep #$20
.a16
    lda #$d556
    sta $0016,y
    sep #$20
.a8
    lda #$08
    sta $0018,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda $000e,y
    clc
    adc #$ffec
    sta $000e,y
    sep #$20

loc_08d552:
.a8
    jml loc_06f45f
    rep #$20
.a16
    lda #$d56d
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    jsl sub_1fd450
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $14d7
    and #$80
    beq loc_08d578
    jsl sub_1fd501

loc_08d578:
    lda $22,x
    beq loc_08d580
    jml loc_08d58c

loc_08d580:
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0014
    sta $10,x
    sep #$20

loc_08d58c:
.a8
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_08d59d
    eor #$ffff
    inc a

loc_08d59d:
    cmp #$0078
    sep #$20
.a8
    bmi loc_08d5a8
    jml loc_08d5ef

loc_08d5a8:
    jsl sub_1fd115
    rep #$20
.a16
    lda $158f
    cmp #$003c
    sep #$20
.a8
    bmi loc_08d5bc
    jml loc_08d5ef

loc_08d5bc:
    rep #$20
.a16
    lda $15ad
    cmp #$0005
    sep #$20
.a8
    bmi loc_08d5cc
    jml loc_08d5de

loc_08d5cc:
    rep #$20
.a16
    inc $15ad
    sep #$20
.a8
    lda #$1e
    sta $1fc8
    lda #$18
    jsl sub_03b7f9

loc_08d5de:
    rep #$20
.a16
    lda #$e25b
    sta $16,x
    sep #$20
.a8
    lda #$08
    sta $18,x
    jml loc_1fdc25

loc_08d5ef:
    rtl
    .incbin "data/0455f0-04715d.bin"
    rep #$20
.a16
    lda #$0000
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    jsl sub_1fd450
    lda $09,x
    ora #$01
    sta $09,x
    lda $1e,x
    ora #$01
    sta $1e,x
    rtl
    .incbin "data/04717b-048000.bin"
