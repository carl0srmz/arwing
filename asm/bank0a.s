.rombank $0a

    .db $a9,$7e,$48,$ab
.cpu
.a8
.i16
    rep #$20
.a16
    lda $121d
    sta $14ca
    sep #$20
.a8
    lda #$04
    sta $24,x
    rep #$20
.a16
    lda #$0000
    sta $3e
    lda #$2710
    sta $3a
    lda #$b84a
    jsl sub_1fc870
    cpy #$0000
    sep #$20
.a8
    bne loc_0a8030
    jml loc_0a8034

loc_0a8030:
    jml loc_0a8061

loc_0a8034:
    rtl
    rep #$20
.a16
    lda $121d
    sta $14ca
    sep #$20
.a8
    lda #$03
    sta $24,x
    rep #$20
.a16
    lda #$0000
    sta $3e
    lda #$2710
    sta $3a
    lda #$c1f4
    jsl sub_1fc870
    cpy #$0000
    sep #$20
.a8
    bne loc_0a8061
    jml loc_0a8034

loc_0a8061:
    lda $01
    sta $7e1ce9,x
    sty $06,x
    rep #$20
.a16
    lda #$80ab
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$0a
    sta $1cd2,x
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$8304
    sta $1cd0,x
    sep #$20
.a8
    lda #$02
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$40
    sta $14,x
    lda #$02
    sta $22,x
    lda #$8c
    sta $23,x
    lda $2e,x
    ora #$10
    sta $2e,x
    rtl
    ldy $06,x
    cpy #$0000
    bne loc_0a80b6
    jml loc_0a81bc

loc_0a80b6:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_0a80f8
    sec
    sbc $12,x
    cmp #$00
    bmi loc_0a80d3
    cmp #$10
    bpl loc_0a80d9
    lda #$10
    bra loc_0a80d9

loc_0a80d3:
    cmp #$f0
    bmi loc_0a80d9
    lda #$f0

loc_0a80d9:
    cmp #$80
    ror a
    bpl loc_0a80e0
    adc #$00

loc_0a80e0:
    cmp #$80
    ror a
    bpl loc_0a80e7
    adc #$00

loc_0a80e7:
    cmp #$80
    ror a
    bpl loc_0a80ee
    adc #$00

loc_0a80ee:
    cmp #$80
    ror a
    bpl loc_0a80f5
    adc #$00

loc_0a80f5:
    clc
    adc $12,x

loc_0a80f8:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_0a813c
    sec
    sbc $13,x
    cmp #$00
    bmi loc_0a8117
    cmp #$10
    bpl loc_0a811d
    lda #$10
    bra loc_0a811d

loc_0a8117:
    cmp #$f0
    bmi loc_0a811d
    lda #$f0

loc_0a811d:
    cmp #$80
    ror a
    bpl loc_0a8124
    adc #$00

loc_0a8124:
    cmp #$80
    ror a
    bpl loc_0a812b
    adc #$00

loc_0a812b:
    cmp #$80
    ror a
    bpl loc_0a8132
    adc #$00

loc_0a8132:
    cmp #$80
    ror a
    bpl loc_0a8139
    adc #$00

loc_0a8139:
    clc
    adc $13,x

loc_0a813c:
    sta $13,x
    rep #$20
.a16
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp #$0514
    sep #$20
.a8
    bpl loc_0a8154
    jml loc_0a8158

loc_0a8154:
    jml loc_0a819a

loc_0a8158:
    lda $15bb
    and #$07
    beq loc_0a8163
    jml loc_0a819a

loc_0a8163:
    lda $22,x
    bne loc_0a816b
    jml loc_0a81cc

loc_0a816b:
    dec $22,x
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
    lda #$0c
    jsl sub_1fd146
    cpy #$0000
    bne loc_0a819a
    ldy $156b

loc_0a819a:
    lda #$28
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    rtl

loc_0a81bc:
    lda $12,x
    sta $3a
    lda #$e0
    jsl sub_1fd8bd
    sta $12,x
    jml loc_0a819a

loc_0a81cc:
    rep #$20
.a16
    lda #$81e1
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda #$1e
    sta $22,x
    lda #$00
    sta $12,x
    ldy $06,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_0a8225
    sec
    sbc $13,x
    cmp #$00
    bmi loc_0a8200
    cmp #$10
    bpl loc_0a8206
    lda #$10
    bra loc_0a8206

loc_0a8200:
    cmp #$f0
    bmi loc_0a8206
    lda #$f0

loc_0a8206:
    cmp #$80
    ror a
    bpl loc_0a820d
    adc #$00

loc_0a820d:
    cmp #$80
    ror a
    bpl loc_0a8214
    adc #$00

loc_0a8214:
    cmp #$80
    ror a
    bpl loc_0a821b
    adc #$00

loc_0a821b:
    cmp #$80
    ror a
    bpl loc_0a8222
    adc #$00

loc_0a8222:
    clc
    adc $13,x

loc_0a8225:
    sta $13,x
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd88a
    sta $12,x
    dec $22,x
    bne loc_0a823b
    jml loc_0a8287

loc_0a823b:
    lda $24,x
    cmp #$03
    beq loc_0a8254
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda #$ff38
    jsl sub_1fd63c
    sta $0e,x
    sep #$20
.a8
    bra loc_0a8265

loc_0a8254:
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda #$ffc4
    jsl sub_1fd63c
    sta $0e,x
    sep #$20

loc_0a8265:
.a8
    lda #$1e
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    rtl

loc_0a8287:
    rep #$20
.a16
    lda #$8287
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    ldy $06,x
    cpy #$0000
    bne loc_0a829f
    jml loc_0a82b9

loc_0a829f:
    lda $08,x
    and #$04
    bne loc_0a82a9
    jml loc_0a82b9

loc_0a82a9:
    lda $13,x
    sta $3a
    lda #$e2
    jsl sub_1fd8f7
    sta $13,x
    jml loc_0a82c5

loc_0a82b9:
    lda $13,x
    sta $3a
    lda #$1e
    jsl sub_1fd8f7
    sta $13,x

loc_0a82c5:
    lda $12,x
    sta $3a
    lda #$e2
    jsl sub_1fd88a
    sta $12,x
    lda #$14
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    dec $23,x
    bne loc_0a82fe
    jml loc_0a82ff

loc_0a82fe:
    rtl

loc_0a82ff:
    jsl sub_1fd501
    rtl
    rep #$20
.a16
    lda #$8319
    sta $7e1cd0,x
    sep #$20
.a8
    lda #$0a
    sta $7e1cd2,x
    jsl sub_06eeee
    lda $15bb
    and #$01
    beq loc_0a8324
    jml loc_0a8328

loc_0a8324:
    jsl sub_068ea8

loc_0a8328:
    lda #$28
    sta $14c5
    lda #$01
    jsl sub_1fd60d
    rep #$20
.a16
    lda $0e,x
    cmp #$ff9c
    sep #$20
.a8
    bmi loc_0a8342
    jml loc_0a8375

loc_0a8342:
    lda $12,x
    cmp #$20
    beq loc_0a834e
    bmi loc_0a834e
    jml loc_0a8355

loc_0a834e:
    lda $12,x
    clc
    adc #$04
    sta $12,x

loc_0a8355:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    lda $14,x
    clc
    adc #$04
    sta $14,x
    jsl sub_1fdc69
    brl loc_0a8480

loc_0a8375:
    rep #$20
.a16
    lda #$8397
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    rep #$20
.a16
    lda #$f45f
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$06
    sta $7e1cd5,x
    lda #$ff
    sta $2a,x
    lda #$3c
    sta $14c5
    lda #$01
    jsl sub_1fd60d
    lda $14,x
    clc
    adc #$04
    sta $14,x
    lda $15bb
    and #$03
    beq loc_0a83b4
    jml loc_0a83c2

loc_0a83b4:
    jsl sub_068ea8
    rep #$20
.a16
    lda #$0028
    sta $0033,y
    sep #$20

loc_0a83c2:
.a8
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0a83d3
    eor #$ffff
    inc a

loc_0a83d3:
    cmp #$0bb8
    sep #$20
.a8
    bpl loc_0a83de
    jml loc_0a83e9

loc_0a83de:
    lda #$00
    sta $12,x
    lda #$80
    sta $13,x
    brl loc_0a846e

loc_0a83e9:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0a83f7
    eor #$ffff
    inc a

loc_0a83f7:
    cmp #$0190
    sep #$20
.a8
    bpl loc_0a8402
    jml loc_0a8480

loc_0a8402:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_0a8436
    sec
    sbc $12,x
    cmp #$00
    bmi loc_0a841f
    cmp #$04
    bpl loc_0a8425
    lda #$04
    bra loc_0a8425

loc_0a841f:
    cmp #$fc
    bmi loc_0a8425
    lda #$fc

loc_0a8425:
    cmp #$80
    ror a
    bpl loc_0a842c
    adc #$00

loc_0a842c:
    cmp #$80
    ror a
    bpl loc_0a8433
    adc #$00

loc_0a8433:
    clc
    adc $12,x

loc_0a8436:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_0a846c
    sec
    sbc $13,x
    cmp #$00
    bmi loc_0a8455
    cmp #$04
    bpl loc_0a845b
    lda #$04
    bra loc_0a845b

loc_0a8455:
    cmp #$fc
    bmi loc_0a845b
    lda #$fc

loc_0a845b:
    cmp #$80
    ror a
    bpl loc_0a8462
    adc #$00

loc_0a8462:
    cmp #$80
    ror a
    bpl loc_0a8469
    adc #$00

loc_0a8469:
    clc
    adc $13,x

loc_0a846c:
    sta $13,x

loc_0a846e:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7

loc_0a8480:
    jsl sub_1fdc69
    jsl sub_1fc7bb
    rtl
    lda $03
    sta $7e1ce9,x
    rep #$20
.a16
    lda #$84ba
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    jsl sub_1fd41a
    lda #$02
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$c0
    sta $13,x
    lda #$40
    sta $12,x
    lda #$0a
    sta $22,x
    lda $2e,x
    ora #$10
    sta $2e,x
    ldy $1238
    rep #$20
.a16
    lda $0e,x
    cmp $000e,y
    sep #$20
.a8
    bcc loc_0a84cc
    jml loc_0a84e8

loc_0a84cc:
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$0014
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    cmp #$ffe2
    bcc loc_0a84e6
    lda #$ffe2
    sta $0e,x

loc_0a84e6:
    sep #$20

loc_0a84e8:
.a8
    rep #$20
.a16
    lda $0c,x
    clc
    adc #$002b
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    cmp $000c,y
    sep #$20
.a8
    bmi loc_0a8503
    jml loc_0a8504

loc_0a8503:
    rtl

loc_0a8504:
    rep #$20
.a16
    lda #$8511
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda $12,x
    sec
    sbc #$08
    sta $12,x
    lda $13,x
    sec
    sbc #$08
    sta $13,x
    lda $13,x
    cmp #$80
    bne loc_0a8529
    jml loc_0a852a

loc_0a8529:
    rtl

loc_0a852a:
    rep #$20
.a16
    lda #$852a
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda $15bb
    clc
    adc $123a
    and #$03
    beq loc_0a8546
    jml loc_0a859f

loc_0a8546:
    ldy $1238
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    jsl sub_02fc58
    and #$03
    sta $152c
    lda $152c
    sec
    sbc #$01
    sta $152c
    jsl sub_02fc58
    and #$03
    sta $152d
    lda $152d
    sec
    sbc #$01
    sta $152d
    lda $152c
    sta $154c
    lda $152d
    sta $154b
    stz $154d
    stz $154e
    sty $154d
    lda #$0c
    jsl sub_1fd146
    cpy #$0000
    bne loc_0a859f
    ldy $156b

loc_0a859f:
    dec $22,x
    bne loc_0a85a7
    jml loc_0a85c4

loc_0a85a7:
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0a85b8
    eor #$ffff
    inc a

loc_0a85b8:
    cmp #$012c
    sep #$20
.a8
    bpl loc_0a85c3
    jml loc_0a85c4

loc_0a85c3:
    rtl

loc_0a85c4:
    rep #$20
.a16
    lda #$85d1
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda $12,x
    clc
    adc #$08
    sta $12,x
    lda $13,x
    clc
    adc #$08
    sta $13,x
    lda $13,x
    cmp #$c0
    bne loc_0a85e9
    jml loc_0a85ea

loc_0a85e9:
    rtl

loc_0a85ea:
    rep #$20
.a16
    lda #$85f7
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    rep #$20
.a16
    lda $0e,x
    sec
    sbc #$0013
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    clc
    adc #$0028
    sta $0c,x
    sep #$20
.a8
    lda #$32
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    rtl
    lda $0e
    sta $7e1ce9,x
    rep #$20
.a16
    lda #$8650
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    jsl sub_1fd41a
    lda #$10
    sta $2a,x
    lda #$0a
    sta $2b,x
    ldy $1238
    lda $13,x
    clc
    adc #$03
    sta $13,x
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$0002
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$001e
    sta $10,x
    sep #$20
.a8
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0a8683
    eor #$ffff
    inc a

loc_0a8683:
    cmp #$0bb8
    sep #$20
.a8
    bmi loc_0a868e
    jml loc_0a8693

loc_0a868e:
    jsl sub_1fdc69
    rtl

loc_0a8693:
    rep #$20
.a16
    lda #$86a8
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda #$20
    sta $22,x
    lda #$01
    sta $23,x
    dec $23,x
    beq loc_0a86b0
    jml loc_0a86ed

loc_0a86b0:
    lda #$1e
    sta $23,x
    rep #$20
.a16
    lda #$b481
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0a86c8
    jml loc_0a86ed

loc_0a86c8:
    rep #$20
.a16
    lda #$f687
    sta $0016,y
    sep #$20
.a8
    lda #$04
    sta $0018,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda $000e,y
    clc
    adc #$005a
    sta $000e,y
    sep #$20
.a8
    stx $19,y
    sty $19,x

loc_0a86ed:
    ldy $1238
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda $000c,y
    jsl sub_1fd6ab
    sta $0c,x
    sep #$20
.a8
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $12,x
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda #$fec0
    jsl sub_1fd73e
    sta $0e,x
    sep #$20
.a8
    lda $13,x
    clc
    adc #$04
    sta $13,x
    lda #$1e
    sta $14c5
    lda #$01
    jsl sub_1fd60d
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    rep #$20
.a16
    lda $10,x
    sec
    sbc #$000f
    sta $10,x
    sep #$20
.a8
    dec $22,x
    bne loc_0a875e
    jml loc_0a875f

loc_0a875e:
    rtl

loc_0a875f:
    rep #$20
.a16
    lda #$876c
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    rep #$20
.a16
    lda $10,x
    sec
    sbc #$000a
    sta $10,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sec
    sbc #$0003
    sta $0e,x
    sep #$20
.a8
    lda $13,x
    clc
    adc #$04
    sta $13,x
    jsl sub_1fdc69
    rtl
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
    .incbin "data/0507aa-0568d5.bin"
    rep #$20
.a16
    lda #$e8ee
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda $1d,x
    ora #$08
    sta $1d,x
    rep #$20
.a16
    lda $0c,x
    cmp $1571
    sep #$20
.a8
    beq loc_0ae8ff
    bmi loc_0ae8ff
    jml loc_0ae930

loc_0ae8ff:
    rep #$20
.a16
    lda $0c,x
    cmp $156f
    sep #$20
.a8
    bpl loc_0ae90e
    jml loc_0ae930

loc_0ae90e:
    rep #$20
.a16
    lda $0e,x
    cmp $1579
    sep #$20
.a8
    beq loc_0ae91f
    bmi loc_0ae91f
    jml loc_0ae930

loc_0ae91f:
    rep #$20
.a16
    lda $0e,x
    cmp $1577
    sep #$20
.a8
    beq loc_0ae930
    bmi loc_0ae930
    jml loc_0ae952

loc_0ae930:
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda #$0000
    jsl sub_1fd6f0
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda $1589
    jsl sub_1fd6f0
    sta $0e,x
    sep #$20

loc_0ae952:
.a8
    lda $14da
    and #$08
    bne loc_0ae95d
    jml loc_0ae975

loc_0ae95d:
    rep #$20
.a16
    lda $0e,x
    cmp #$ffc4
    sep #$20
.a8
    bpl loc_0ae96c
    jml loc_0ae975

loc_0ae96c:
    rep #$20
.a16
    lda #$ffc4
    sta $0e,x
    sep #$20

loc_0ae975:
.a8
    lda $12,x
    clc
    adc #$08
    sta $12,x
    lda $13,x
    clc
    adc #$06
    sta $13,x
    lda $14,x
    clc
    adc #$0c
    sta $14,x
    lda $1e,x
    and #$10
    beq loc_0ae994
    jml loc_0ae9e4

loc_0ae994:
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0ae9a5
    eor #$ffff
    inc a

loc_0ae9a5:
    cmp #$003c
    sep #$20
.a8
    bmi loc_0ae9b0
    jml loc_0ae9ee

loc_0ae9b0:
    jsl sub_1fd115
    rep #$20
.a16
    lda $158f
    cmp #$003c
    sep #$20
.a8
    bmi loc_0ae9c4
    jml loc_0ae9ee

loc_0ae9c4:
    ldy $1567
    lda $002a,y
    beq loc_0ae9ee
    clc
    adc #$05
    cmp #$28
    bmi loc_0ae9d5
    lda #$28

loc_0ae9d5:
    sta $002a,y
    lda #$10
    jsl sub_03b7f9
    lda $1e,x
    ora #$10
    sta $1e,x

loc_0ae9e4:
    lda #$00
    ora #$80
    sta $1ce6,x
    brl loc_0ae9f5

loc_0ae9ee:
    lda #$04
    ora #$80
    sta $1ce6,x

loc_0ae9f5:
    jsl sub_1fdc69
    rep #$20
.a16
    lda $10,x
    clc
    adc #$ffce
    sta $10,x
    sep #$20
.a8
    rtl
    .incbin "data/056a06-0577c4.bin"
    rep #$20
.a16
    lda #$f7e1
    sta $16,x
    sep #$20
.a8
    lda #$0a
    sta $18,x
    jsl sub_1fd41a
    lda #$10
    sta $2a,x
    lda #$01
    sta $2b,x
    lda $2a,x
    sta $22,x
    lda $2a,x
    cmp $0022,x
    bne loc_0af7ec
    jml loc_0af829

loc_0af7ec:
    lda $2a,x
    sta $22,x
    lda #$14
    jsl sub_03b7f9
    jsl sub_02fc58
    and #$0f
    sta $151b
    jsl sub_02fc58
    and #$00
    sta $151c
    rep #$20
.a16
    lda $151b
    sec
    sbc #$0007
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    sta $2f,x
    lda #$ffc4
    sta $31,x
    lda #$0050
    sta $33,x
    sep #$20

loc_0af829:
.a8
    jsl sub_1fc7bb
    rep #$20
.a16
    lda $0e,x
    cmp #$ffdd
    sep #$20
.a8
    bmi loc_0af83c
    jml loc_0af8f0

loc_0af83c:
    lda $1d,x
    and #$f7
    sta $1d,x
    rep #$20
.a16
    lda $31,x
    sep #$20
.a8
    bpl loc_0af84e
    jml loc_0af8c3

loc_0af84e:
    rep #$20
.a16
    lda $121d
    sta $14ca
    sep #$20

loc_0af858:
.a8
    rep #$20
.a16
    lda #$dd30
    jsl sub_1fc7d5
    cpy #$0000
    sep #$20
.a8
    bne loc_0af86c
    jml loc_0af8c3

loc_0af86c:
    rep #$20
.a16
    jsl sub_1fd0ab
    rep #$20
    lda $1250
    cmp #$0046
    sep #$20
.a8
    bmi loc_0af882
    jml loc_0af858

loc_0af882:
    rep #$20
.a16
    lda $000e,y
    sec
    sbc $0e,x
    bpl loc_0af890
    eor #$ffff
    inc a

loc_0af890:
    cmp #$0046
    sep #$20
.a8
    bmi loc_0af89b
    jml loc_0af858

loc_0af89b:
    rep #$20
.a16
    lda $000e,y
    cmp $000e,x
    sep #$20
.a8
    bpl loc_0af8ab
    jml loc_0af858

loc_0af8ab:
    rep #$20
.a16
    lda $000e,y
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sec
    sbc #$0046
    sta $0e,x
    sep #$20
.a8
    brl loc_0af8f9

loc_0af8c3:
    lda $1d,x
    ora #$08
    sta $1d,x
    rep #$20
.a16
    lda $31,x
    clc
    adc #$0005
    sta $31,x
    sep #$20
.a8
    rep #$20
.a16
    lda $33,x
    sep #$20
.a8
    bne loc_0af8e1
    jml loc_0af8ef

loc_0af8e1:
    lda $12,x
    clc
    adc #$0a
    sta $12,x
    lda $13,x
    clc
    adc #$05
    sta $13,x

loc_0af8ef:
    rtl

loc_0af8f0:
    rep #$20
.a16
    lda #$0000
    sta $0e,x
    sep #$20

loc_0af8f9:
.a8
    lda #$00
    sta $12,x
    jsl sub_1fdb45
    lda $1d,x
    and #$08
    bne loc_0af90b
    jml loc_0af917

loc_0af90b:
    lda $1d,x
    and #$f7
    sta $1d,x
    lda #$86
    jsl sub_03b7f9

loc_0af917:
    rtl
    .db $b5,$1d,$09,$20,$95,$1d,$a9,$00,$9d,$df,$1c,$a9,$00,$9d,$f4,$1c
    .db $b5,$1e,$09,$01,$95,$1e,$c2,$20,$a9,$3f,$f9,$95,$16,$e2,$20,$a9
    .db $0a,$95,$18,$a9,$46,$95,$0a,$d6,$0a,$f0,$04,$5c,$4b,$f9,$0a,$22
    .db $01,$d5,$1f,$6b

sub_0af94c:
    php
    phb
    sep #$20
    lda #$7e
    pha
    plb
    rep #$30
.a16
    ldx #$0002
    stz $a0a4,x
    stz $a0a6,x
    lda #$4ffe
    sta $a0a8,x
    stx $a0a4
    plb
    plp
.a8
    rtl
    .db $08,$8b,$da,$5a,$e2,$20,$a9,$7e,$48,$ab,$c2,$20,$a9,$80,$00,$85
    .db $42,$ae,$a4,$a0,$a9,$00,$00,$18,$7d,$a8,$a0,$48,$8a,$bd,$a8,$a0
    .db $68,$bc,$a4,$a0,$bb,$d0,$f0,$7a,$fa,$ab,$28,$6b

sub_0af997:
.a16
    cmp #$0000
    bne loc_0af99d
    rtl

loc_0af99d:
    phx
    phy
    php
    phb
    sep #$10
.i8
    ldx #$7e
    phx
    plb
    rep #$10
.i16
    dec a
    dec a
    sta $f0a4
    tax
    clc
    adc $a0a4,x
    sta $f0a6
    lda $a0a4,x
    sta $f0a8
    ldy $a0a4
    bne loc_0af9c4
    brl loc_0afa33

loc_0af9c4:
    tya
    clc
    adc $a0a8,y
    cmp $f0a4
    beq loc_0af9f2
    cpy $f0a6
    beq loc_0afa02
    lda $a0a4,y
    tay
    bne loc_0af9c4
    lda $a0a4,x
    sta $a0a8,x
    ldy $a0a4
    stx $a0a4
    txa
    sta $a0a6,y
    tya
    sta $a0a4,x
    stz $a0a6,x
    bra loc_0afa42

loc_0af9f2:
    lda $a0a8,y
    clc
    adc $a0a4,x
    sta $a0a8,y
    tyx
    jsr sub_0afa5f
    bra loc_0afa42

loc_0afa02:
    lda $a0a8,y
    clc
    adc $a0a4,x
    sta $a0a8,x
    lda $a0a4,y
    sta $a0a4,x
    lda $a0a6,y
    sta $a0a6,x
    txa
    ldy $a0a4,x
    beq loc_0afa21
    sta $a0a6,y

loc_0afa21:
    ldy $a0a6,x
    beq loc_0afa2b
    sta $a0a4,y
    bra loc_0afa2e

loc_0afa2b:
    sta $a0a4

loc_0afa2e:
    jsr sub_0afa5f
    bra loc_0afa42

loc_0afa33:
    stx $a0a4
    lda $a0a4,x
    sta $a0a8,x
    stz $a0a6,x
    stz $a0a4,x

loc_0afa42:
    plb
    plp
    ply
    plx
    rtl

sub_0afa47:
    lda $a0a6,x
    ldy $a0a4,x
    beq loc_0afa52
    sta $a0a6,y

loc_0afa52:
    tax
    beq loc_0afa5b
    tya
    sta $a0a4,x
    bra loc_0afa5e

loc_0afa5b:
    sty $a0a4

loc_0afa5e:
    rts

sub_0afa5f:
    stx $f0a4
    txa
    clc
    adc $a0a8,x
    sta $f0a6
    ldy $a0a4

loc_0afa6d:
    cpy $f0a6
    beq loc_0afa83
    tya
    clc
    adc $a0a8,y
    cmp $f0a4
    beq loc_0afa98
    lda $a0a4,y
    tay
    bne loc_0afa6d
    rts

loc_0afa83:
    lda $a0a8,x
    clc
    adc $a0a8,y
    sta $a0a8,x
    stx $f0a4
    tyx
    jsr sub_0afa47
    ldx $f0a4
    rts

loc_0afa98:
    lda $a0a8,y
    clc
    adc $a0a8,x
    sta $a0a8,y
    sty $f0a4
    jsr sub_0afa47
    ldx $f0a4
    rts

sub_0afaac:
    phx
    phy
    php
    phb
    sep #$10
.i8
    ldx #$7e
    phx
    plb
    rep #$10
.i16
    inc a
    and #$fffe
    beq loc_0afb30
    inc a
    inc a
    cmp #$0006
    bcs loc_0afac8
    lda #$0006

loc_0afac8:
    ldx $a0a4
    beq loc_0afb30

loc_0afacd:
    cmp $a0a8,x
    bcc loc_0afadf
    beq loc_0afadf
    ldy $a0a4,x
    tyx
    bne loc_0afacd
    lda #$0000
    bra loc_0afb30

loc_0afadf:
    sta $f0a4
    lda $a0a8,x
    sec
    sbc $f0a4
    cmp #$0006
    bcc loc_0afb04
    beq loc_0afb04
    sta $a0a8,x
    txa
    clc
    adc $a0a8,x
    tax
    lda $f0a4
    sta $a0a4,x
    inx
    inx
    txa
    bra loc_0afb30

loc_0afb04:
    lda $a0a8,x
    sta $f0a4
    stx $f0a6
    lda $a0a4,x
    ldy $a0a6,x
    beq loc_0afb1a
    sta $a0a4,y
    bra loc_0afb1d

loc_0afb1a:
    sta $a0a4

loc_0afb1d:
    tax
    beq loc_0afb24
    tya
    sta $a0a6,x

loc_0afb24:
    ldx $f0a6
    lda $f0a4
    sta $a0a4,x
    inx
    inx
    txa

loc_0afb30:
    plb
    plp
    ply
    plx
    rtl

sub_0afb35:
    clc
    adc #$0002
    jsl sub_0afaac
    cmp #$0000
    beq loc_0afb51
    phy
    tay
    lda $1cf6,x
    sta $a0a4,y
    tya
    sta $1cf6,x
    ply
    inc a
    inc a

loc_0afb51:
    rtl

sub_0afb52:
    phy
    phx
    dec a
    dec a
    sta $f0a4
    ldy $1cf6,x
    beq loc_0afb8b
    phx
    ldx #$0000

loc_0afb62:
    cpy $f0a4
    beq loc_0afb74
    tyx
    ldy $a0a4,x
    bne loc_0afb62
    plx
    ply
    jml loc_1fbdee
    .db $6b

loc_0afb74:
    lda $a0a4,y
    cpx #$0000
    beq loc_0afb82
    sta $a0a4,x
    plx
    bra loc_0afb86

loc_0afb82:
    plx
    sta $1cf6,x

loc_0afb86:
    tya
    jsl sub_0af997

loc_0afb8b:
    plx
    ply
    rtl

sub_0afb8e:
    phx
    phy
    php
    phb
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rep #$20
.a16
    ldy $1cf6,x
    beq loc_0afbaf
    phx

loc_0afba0:
    ldx $a0a4,y
    tya
    jsl sub_0af997
    txy
    bne loc_0afba0
    plx
    stz $1cf6,x

loc_0afbaf:
    plb
    plp
    ply
    plx
    rtl

loc_0afbb4:
    phx
    php
    phb
    pha
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rep #$20
.a16
    lda #$0006
    jsl sub_0afaac
    cmp #$0000
    bne loc_0afbd2
    plx
    plb
    plp
    plx
    sec
    rtl

loc_0afbd2:
    tax
    pla
    sta $a0a4,x
    lda $f0ac
    sta $a0a6,x
    lda $f0ae
    sta $a0a8,x
    txa
    plb
    plp
    plx
    clc
    rtl

sub_0afbe9:
    phx
    php
    phb
    pha
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rep #$20
.a16
    lda #$0006
    jsl sub_0afb35
    cmp #$0000
    bne loc_0afc07
    plx
    plb
    plp
    plx
    sec
    rtl

loc_0afc07:
    tax
    pla
    sta $a0a4,x
    lda $f0ac
    sta $a0a6,x
    lda $f0ae
    sta $a0a8,x
    txa
    plb
    plp
    plx
    clc
    rtl

loc_0afc1e:
    phx
    php
    phb
    sep #$10
.i8
    ldx #$7e
    phx
    plb
    rep #$10
.i16
    tax
    beq loc_0afc42
    lda $a0a4,x
    pha
    lda $a0a6,x
    sta $f0ac
    lda $a0a8,x
    sta $f0ae
    txa
    jsl sub_0af997
    pla

loc_0afc42:
    plb
    plp
    plx
    rtl

sub_0afc46:
    phx
    phy
    php
    phb
    pha
    sep #$20
.a8
    lda #$7e
    pha
    plb
    rep #$20
.a16
    ply
    beq loc_0afc6c
    lda $a0a4,y
    pha
    lda $a0a6,y
    sta $f0ac
    lda $a0a8,y
    sta $f0ae
    tya
    jsl sub_0afb52
    pla

loc_0afc6c:
    plb
    plp
    ply
    plx
    rtl
    .incbin "data/057c71-058000.bin"
