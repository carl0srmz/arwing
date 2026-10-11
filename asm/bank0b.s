.rombank $0b

    .db $a9,$7e,$48,$ab
.cpu
.a8
.i16
    lda $14d6
    ora #$60
    sta $14d6
    rep #$20
.a16
    lda #$ffc4
    sta $1589
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff88
    sta $156f
    sep #$20
.a8
    rep #$20
.a16
    lda #$0078
    sta $1571
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff88
    sta $1573
    sep #$20
.a8
    rep #$20
.a16
    lda #$0078
    sta $1575
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $157f
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff88
    sta $157b
    sep #$20
.a8
    rep #$20
.a16
    lda #$0005
    sta $157d
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff88
    sta $1577
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffec
    sta $1579
    sep #$20
.a8
    lda #$09
    sta $14da
    lda #$ff
    sta $14df
    lda #$0b
    sta $14d5
    lda $14d0
    ora #$00
    sta $14d0
    lda $14d0
    and #$df
    sta $14d0
    lda $14dd
    and #$fb
    sta $14dd
    lda $14d8
    ora #$02
    sta $14d8
    lda $14d7
    and #$fb
    sta $14d7
    lda $14dd
    and #$d7
    sta $14dd
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $14d8
    ora #$01
    sta $14d8
    rep #$20
.a16
    lda #$8134
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    jsl sub_1fd450
    stz $15bb
    lda #$02
    sta $18b2
    rep #$20
.a16
    lda #$f800
    sta $18c5
    sep #$20
.a8
    lda $14d0
    ora #$01
    sta $14d0
    lda #$03
    sta $15ca
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0b8101
    jml loc_0b8114

loc_0b8101:
    rep #$20
.a16
    lda #$873f
    sta $0016,y
    sep #$20
.a8
    lda #$07
    sta $0018,y
    jsl sub_1fdad9

loc_0b8114:
    lda $14d0
    and #$ef
    sta $14d0
    lda #$46
    sta $1553
    rep #$20
.a16
    lda #$d304
    sta $04,x
    sep #$20
.a8
    lda #$00
    sta $1551
    lda #$00
    sta $1552
    inc $1551
    lda $1551
    cmp #$1c
    beq loc_0b8142
    jml loc_0b8147

loc_0b8142:
    lda #$00
    sta $1551

loc_0b8147:
    phx
    rep #$20
.a16
    lda $1551
    and #$00ff
    tax
    sep #$20
.a8
    lda $0beb8f,x
    plx
    sta $14,x
    lda $1552
    clc
    adc #$02
    sta $1552
    lda $1552
    cmp #$48
    beq loc_0b816e
    jml loc_0b8173

loc_0b816e:
    lda #$00
    sta $1552

loc_0b8173:
    phx
    rep #$20
.a16
    lda $1552
    and #$00ff
    tax
    lda $06bada,x
    bit #$0080
    beq loc_0b818b
    ora #$ff00
    bra loc_0b818e

loc_0b818b:
    and #$00ff

loc_0b818e:
    plx
    asl a
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$ffe2
    sta $0e,x
    sep #$20
.a8
    lda $14d0
    and #$10
    bne loc_0b81ab
    jml loc_0b81b7

loc_0b81ab:
    lda $1553
    bne loc_0b81b4
    jml loc_0b81c8

loc_0b81b4:
    dec $1553

loc_0b81b7:
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0041
    sta $10,x
    sep #$20
.a8
    jsl sub_02f7ef
    rtl

loc_0b81c8:
    rep #$20
.a16
    lda #$8211
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    stx $158b
    rep #$20
.a16
    lda #$b219
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0b81ec
    jml loc_0b8203

loc_0b81ec:
    rep #$20
.a16
    lda #$8671
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda $0020,y
    ora #$08
    sta $0020,y

loc_0b8203:
    lda #$32
    jsl sub_03b7f9
    lda $14d8
    and #$fd
    sta $14d8
    lda $14,x
    sta $3a
    lda #$00
    jsl sub_1fd8bd
    sta $14,x
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0073
    sta $10,x
    sep #$20
.a8
    rtl
    .incbin "data/05822a-058ec5.bin"

sub_0b8ec5:
    sep #$20
    rep #$10
    lda #$7e
    pha
    plb
    ldx $1238
    rep #$20
.a16
    lda #$0000
    sta $16ff
    sep #$20
.a8
    jsl sub_1fd3e0
    rep #$20
.a16
    lda #$00e8
    sta $169c
    sep #$20
.a8
    lda $14d0
    ora #$01
    sta $14d0
    rep #$20
.a16
    lda #$ffce
    sta $1589
    sep #$20
.a8
    rep #$20
.a16
    lda #$fe0c
    sta $156f
    sep #$20
.a8
    rep #$20
.a16
    lda #$01f4
    sta $1571
    sep #$20
.a8
    rep #$20
.a16
    lda #$fe0c
    sta $1573
    sep #$20
.a8
    rep #$20
.a16
    lda #$01f4
    sta $1575
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $157f
    sep #$20
.a8
    rep #$20
.a16
    lda #$fda8
    sta $157b
    sep #$20
.a8
    rep #$20
.a16
    lda #$0005
    sta $157d
    sep #$20
.a8
    rep #$20
.a16
    lda #$fda8
    sta $1577
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffec
    sta $1579
    sep #$20
.a8
    lda #$0b
    sta $14da
    lda #$a8
    sta $14df
    lda #$08
    sta $14d5
    lda $14d0
    ora #$20
    sta $14d0
    lda $14d0
    and #$ff
    sta $14d0
    lda $14dd
    and #$fb
    sta $14dd
    lda $14d8
    ora #$02
    sta $14d8
    lda $14d7
    and #$fb
    sta $14d7
    lda $14dd
    and #$d7
    sta $14dd
    lda $14dd
    ora #$20
    sta $14dd
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $14d8
    and #$fe
    sta $14d8
    rep #$20
.a16
    lda #$9031
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$e729
    sta $1cd3,x
    lda #$e215
    sta $1cd0,x
    sep #$20
.a8
    lda $14d0
    and #$df
    sta $14d0
    lda $14d6
    ora #$60
    sta $14d6
    lda #$03
    sta $15ca
    rep #$20
.a16
    lda #$fe70
    sta $c1
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff6f
    sta $c3
    sep #$20
.a8
    rep #$20
.a16
    lda #$03e8
    sta $c5
    sep #$20
.a8
    lda #$37
    sta $1551
    lda #$00
    sta $150c
    rep #$20
.a16
    lda #$ff28
    sta $0c,x
    lda #$fec8
    sta $0e,x
    lda #$ff38
    sta $10,x
    sep #$20
.a8
    lda $20,x
    ora #$08
    sta $20,x
    lda #$01
    sta $14cc
    lda $14d8
    and #$fd
    sta $14d8
    rtl
    lda $1551
    cmp #$28
    beq loc_0b903c
    jml loc_0b903c

loc_0b903c:
    rep #$20
.a16
    lda #$ff28
    sta $0c,x
    lda #$fec8
    sta $0e,x
    lda #$ff38
    sta $10,x
    sep #$20
.a8
    dec $1551
    beq loc_0b9058
    jml loc_0bbbe3

loc_0b9058:
    lda #$3c
    sta $1551
    rep #$20
.a16
    lda #$9085
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda $20,x
    and #$f7
    sta $20,x
    lda #$32
    sta $15b9
    lda #$00
    sta $7e1ce9,x
    lda #$00
    sta $1552
    lda #$b1
    sta $1ce8,x
    inc $1552
    lda $1552
    cmp #$0c
    beq loc_0b9093
    jml loc_0b9098

loc_0b9093:
    lda #$91
    sta $1ce8,x

loc_0b9098:
    lda $1552
    cmp #$14
    beq loc_0b90a3
    jml loc_0b90a8

loc_0b90a3:
    lda #$81
    sta $1ce8,x

loc_0b90a8:
    lda $1552
    cmp #$1e
    beq loc_0b90b3
    jml loc_0b90b8

loc_0b90b3:
    lda #$a1
    sta $1ce8,x

loc_0b90b8:
    lda #$32
    sta $150c
    dec $1551
    beq loc_0b90c6
    jml loc_0bbbe3

loc_0b90c6:
    rep #$20
.a16
    lda #$90db
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda $14d8
    ora #$02
    sta $14d8
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda #$0000
    jsl sub_1fd66f
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda $1589
    jsl sub_1fd66f
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    cmp $c1
    beq loc_0b9135
    sec
    sbc $c1
    cmp #$0000
    bmi loc_0b9118
    cmp #$0004
    bpl loc_0b9120
    lda #$0004
    bra loc_0b9120

loc_0b9118:
    cmp #$fffc
    bmi loc_0b9120
    lda #$fffc

loc_0b9120:
    cmp #$8000
    ror a
    bpl loc_0b9129
    adc #$0000

loc_0b9129:
    cmp #$8000
    ror a
    bpl loc_0b9132
    adc #$0000

loc_0b9132:
    clc
    adc $c1

loc_0b9135:
    sta $c1
    sep #$20
.a8
    rep #$20
.a16
    lda $1589
    cmp $c3
    beq loc_0b9171
    sec
    sbc $c3
    cmp #$0000
    bmi loc_0b9154
    cmp #$0004
    bpl loc_0b915c
    lda #$0004
    bra loc_0b915c

loc_0b9154:
    cmp #$fffc
    bmi loc_0b915c
    lda #$fffc

loc_0b915c:
    cmp #$8000
    ror a
    bpl loc_0b9165
    adc #$0000

loc_0b9165:
    cmp #$8000
    ror a
    bpl loc_0b916e
    adc #$0000

loc_0b916e:
    clc
    adc $c3

loc_0b9171:
    sta $c3
    sep #$20
.a8
    rep #$20
.a16
    lda $1511
    cmp $c5
    beq loc_0b91b6
    sec
    sbc $c5
    cmp #$0000
    bmi loc_0b9190
    cmp #$0008
    bpl loc_0b9198
    lda #$0008
    bra loc_0b9198

loc_0b9190:
    cmp #$fff8
    bmi loc_0b9198
    lda #$fff8

loc_0b9198:
    cmp #$8000
    ror a
    bpl loc_0b91a1
    adc #$0000

loc_0b91a1:
    cmp #$8000
    ror a
    bpl loc_0b91aa
    adc #$0000

loc_0b91aa:
    cmp #$8000
    ror a
    bpl loc_0b91b3
    adc #$0000

loc_0b91b3:
    clc
    adc $c5

loc_0b91b6:
    sta $c5
    sep #$20
.a8
    rep #$20
.a16
    lda $c5
    clc
    adc $33,x
    sta $c5
    sep #$20
.a8
    ldy $1236
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0b91d6
    eor #$ffff
    inc a

loc_0b91d6:
    cmp #$00aa
    sep #$20
.a8
    bmi loc_0b91e1
    jml loc_0bbbe3

loc_0b91e1:
    lda #$00
    sta $15ca
    lda $14d0
    and #$fe
    sta $14d0
    lda #$41
    sta $150c
    rep #$20
.a16
    lda #$d320
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0b9207
    jml loc_0b923c

loc_0b9207:
    rep #$20
.a16
    lda #$806d
    sta $0016,y
    sep #$20
.a8
    lda #$07
    sta $0018,y
    lda $001e,y
    ora #$01
    sta $001e,y
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$ffce
    sta $000c,y
    lda #$ff9c
    sta $000e,y
    lda $0010,y
    clc
    adc #$ff38
    sta $0010,y
    sep #$20

loc_0b923c:
.a8
    lda #$00
    sta $7e1ce8,x
    lda #$00
    sta $14cc
    jml loc_0bbb03
    .incbin "data/05924b-05ac1b.bin"
    lda #$00
    ora #$80
    sta $1ce6,x
    rep #$20
.a16
    lda #$ac30
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    rtl
    lda $1ce6,x
    clc
    adc #$02
    bmi loc_0bac3b
    clc
    adc #$10

loc_0bac3b:
    and #$7f
    cmp #$10
    bcc loc_0bac44
    sec
    sbc #$10

loc_0bac44:
    ora #$80
    sta $1ce6,x
    jsl sub_1fdc69
    jsl sub_1fc7bb
    dec $0a,x
    beq loc_0bac59
    jml loc_0bac5d

loc_0bac59:
    jsl sub_1fd501

loc_0bac5d:
    rtl

sub_0bac5e:
    jsr sub_0bac62
    rtl

sub_0bac62:
    lda $14d7
    and #$04
    beq loc_0bac6d
    jml loc_0bacde

loc_0bac6d:
    rep #$20
.a16
    lda #$b2c1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0bac81
    jml loc_0bacde

loc_0bac81:
    rep #$20
.a16
    lda #$ac1b
    sta $0016,y
    sep #$20
.a8
    lda #$0b
    sta $0018,y
    lda $001e,y
    ora #$01
    sta $001e,y
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
    phx
    tyx
    ply
    jsl sub_02fc58
    sta $000014,x
    lda #$05
    sta $0a,x
    lda #$0f
    sta $15,x
    lda $15,x
    sta $7e
    lda $14,x
    jsl sub_1fc177
    rep #$20
.a16
    lda $02
    sta $2f,x
    lda $90
    sta $31,x
    sep #$20
.a8
    phx
    tyx
    ply

loc_0bacde:
    rts

loc_0bacdf:
    ldy $1567
    rep #$20
.a16
    lda $1b,x
    sta $001b,y
    sep #$20
.a8
    lda $001d,y
    ora #$80
    sta $001d,y
    rep #$20
.a16
    lda $1b,x
    sep #$20
.a8
    bne loc_0bacff
    jml loc_0bad02

loc_0bacff:
    brl loc_0bad8b

loc_0bad02:
    phx
    tyx
    ply
    lda #$04
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a
    phx
    tyx
    ply
    brl loc_0bad8b

loc_0bad18:
    lda $2d,x
    cmp #$01
    beq loc_0bad22
    jml loc_0bad6a

loc_0bad22:
    ldy $1b,x
    phx
    ldx $1567
    sty $1b,x
    lda $14d7
    and #$02
    beq loc_0bad35
    jml loc_0bad4f

loc_0bad35:
    phy
    ldy $1b,x
    beq loc_0bad4b
    lda $002b,y
    cmp #$80
    ror a
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_0bad4b:
    ply
    brl loc_0bad69

loc_0bad4f:
    phy
    ldy $1b,x
    beq loc_0bad68
    lda $002b,y
    cmp #$80
    ror a
    cmp #$80
    ror a
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_0bad68:
    ply

loc_0bad69:
    plx

loc_0bad6a:
    lda $14d7
    and #$02
    beq loc_0bad75
    jml loc_0bad85

loc_0bad75:
    lda #$01
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a
    brl loc_0bad8b

loc_0bad85:
    lda #$14
    jsl sub_03b7f9

loc_0bad8b:
    phy
    phx
    lda #$0b
    pha
    rep #$20
.a16
    lda #$ada3
    pha
    sep #$20
.a8
    lda $18,x
    pha
    rep #$20
.a16
    lda $16,x
    dec a
    pha
    sep #$20
.a8
    rtl
    plx
    ply
    ldy $26,x
    cpy #$0000
    bne loc_0badb1
    jml loc_0badb8

loc_0badb1:
    jsl sub_1fdad9
    jsr sub_0bac62

loc_0badb8:
    rtl
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$ae00
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$ae72
    sta $1cd3,x
    lda #$afc9
    sta $1cd0,x
    sep #$20
.a8
    lda #$28
    sta $2a,x
    lda #$03
    sta $2b,x
    stx $1567
    lda $14d6
    and #$fe
    sta $14d6
    lda $1e,x
    ora #$01
    sta $1e,x
    rtl
    ldy $1238
    jsl sub_1fdaed
    jsl sub_1fdb11
    lda #$00
    sta $02
    sta $04
    bit #$80
    beq loc_0bae1b
    lda #$ff
    sta $05
    bra loc_0bae1d

loc_0bae1b:
    stz $05

loc_0bae1d:
    lda #$00
    sta $08
    sta $0a
    bit #$80
    beq loc_0bae2d
    lda #$ff
    sta $0b
    bra loc_0bae2f

loc_0bae2d:
    stz $0b

loc_0bae2f:
    lda #$00
    sta $90
    sta $15c2
    bit #$80
    beq loc_0bae41
    lda #$ff
    sta $15c3
    bra loc_0bae44

loc_0bae41:
    stz $15c3

loc_0bae44:
    lda $14,x
    jsl sub_1fcc78
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    rep #$20
.a16
    lda $0c,x
    clc
    adc $04
    sta $0c,x
    lda $10,x
    clc
    adc $15c2
    sta $10,x
    lda $0e,x
    clc
    adc $0a
    sta $0e,x
    sep #$20
.a8
    rtl
    ldy $1b,x
    lda $14d7
    and #$02
    beq loc_0bae7f
    jml loc_0baea1

loc_0bae7f:
    cpy #$0000
    bne loc_0bae88
    jml loc_0bae9b

loc_0bae88:
    lda $002b,y
    cmp #$08
    bpl loc_0bae93
    jml loc_0bae9b

loc_0bae93:
    lda #$04
    jsl sub_03b7f9
    bra loc_0baea1

loc_0bae9b:
    lda #$19
    jsl sub_03b7f9

loc_0baea1:
    cpy #$0000
    bne loc_0baeaa
    jml loc_0baeb3

loc_0baeaa:
    lda $002b,y
    bne loc_0baeb3
    jml loc_0baf9e

loc_0baeb3:
    ldy $1238
    lda #$07
    sta $0022,y
    lda #$04
    sta $1527
    lda #$00
    sta $1528
    rep #$20
.a16
    lda #$aef8
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    rep #$20
.a16
    lda #$afa2
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd8,x
    rep #$20
.a16
    lda $1b,x
    sta $1561
    sep #$20
.a8
    lda $14d6
    ora #$01
    sta $14d6
    ldy $1238
    rep #$20
.a16
    lda $1561
    sep #$20
.a8
    bne loc_0baf08
    jml loc_0baf9e

loc_0baf08:
    lda #$07
    sta $0022,y
    lda $14d7
    and #$02
    beq loc_0baf18
    jml loc_0baf2f

loc_0baf18:
    phy
    ldy $1b,x
    beq loc_0baf2b
    lda $002b,y
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_0baf2b:
    ply
    brl loc_0baf46

loc_0baf2f:
    phy
    ldy $1b,x
    beq loc_0baf45
    lda $002b,y
    cmp #$80
    ror a
    sta $02
    lda #$0a
    sta $14c5
    jsl sub_1fd23a

loc_0baf45:
    ply

loc_0baf46:
    lda $2a,x
    bne loc_0baf4e
    jml loc_0baf9e

loc_0baf4e:
    lda $2a,x
    cmp #$0a
    beq loc_0baf5a
    bmi loc_0baf5a
    jml loc_0baf70

loc_0baf5a:
    lda $1e,x
    and #$10
    beq loc_0baf64
    jml loc_0baf76

loc_0baf64:
    lda $1e,x
    ora #$10
    sta $1e,x
    lda #$1b
    jsl sub_03b7f9

loc_0baf70:
    lda $1e,x
    and #$ef
    sta $1e,x

loc_0baf76:
    lda $2a,x
    cmp #$05
    beq loc_0baf82
    bmi loc_0baf82
    jml loc_0baf98

loc_0baf82:
    lda $1e,x
    and #$20
    beq loc_0baf8c
    jml loc_0baf9e

loc_0baf8c:
    lda $1e,x
    ora #$20
    sta $1e,x
    lda #$1c
    jsl sub_03b7f9

loc_0baf98:
    lda $1e,x
    and #$df
    sta $1e,x

loc_0baf9e:
    jml loc_1fdc25
    rep #$20
.a16
    lda #$0000
    sta $1561
    sep #$20
.a8
    rep #$20
.a16
    lda #$ae72
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    lda $14d6
    and #$fe
    sta $14d6
    jml loc_1fdc25
    lda $14d6
    and #$20
    beq loc_0bafd4
    jml loc_0bafdf

loc_0bafd4:
    lda $14dd
    and #$20
    bne loc_0bafdf
    jml loc_0bafe4

loc_0bafdf:
    lda #$01
    sta $2a,x
    rtl

loc_0bafe4:
    ldy $1238
    lda $001e,y
    ora #$01
    sta $001e,y
    lda #$00
    sta $002a,y
    rtl
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$b039
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$b110
    sta $1cd3,x
    lda #$b263
    sta $1cd0,x
    sep #$20
.a8
    lda #$05
    sta $2a,x
    lda #$03
    sta $2b,x
    lda $00
    sta $1cdc,x
    stx $1563
    lda $1e,x
    ora #$01
    sta $1e,x
    rtl

loc_0bb039:
    ldy $1238
    jsl sub_1fdaed
    jsl sub_1fdb11
    lda #$df
    sta $02
    sta $04
    bit #$80
    beq loc_0bb054
    lda #$ff
    sta $05
    bra loc_0bb056

loc_0bb054:
    stz $05

loc_0bb056:
    lda #$0d
    sta $08
    sta $0a
    bit #$80
    beq loc_0bb066
    lda #$ff
    sta $0b
    bra loc_0bb068

loc_0bb066:
    stz $0b

loc_0bb068:
    lda #$00
    sta $90
    sta $15c2
    bit #$80
    beq loc_0bb07a
    lda #$ff
    sta $15c3
    bra loc_0bb07d

loc_0bb07a:
    stz $15c3

loc_0bb07d:
    lda $14,x
    jsl sub_1fcc78
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    rep #$20
.a16
    lda $0c,x
    clc
    adc $04
    sta $0c,x
    lda $10,x
    clc
    adc $15c2
    sta $10,x
    lda $0e,x
    clc
    adc $0a
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    cmp $156f
    sep #$20
.a8
    beq loc_0bb0bb
    bmi loc_0bb0bb
    jml loc_0bb0d0

loc_0bb0bb:
    rep #$20
.a16
    lda $156f
    sec
    sbc $0c,x
    sta $158d
    sep #$20
.a8
    lda $14de
    ora #$01
    sta $14de

loc_0bb0d0:
    rep #$20
.a16
    lda $0e,x
    cmp $157b
    sep #$20
.a8
    beq loc_0bb0e1
    bmi loc_0bb0e1
    jml loc_0bb0e9

loc_0bb0e1:
    lda $14de
    ora #$04
    sta $14de

loc_0bb0e9:
    rep #$20
.a16
    lda $0e,x
    cmp $157d
    sep #$20
.a8
    bpl loc_0bb0f8
    jml loc_0bb10f

loc_0bb0f8:
    lda $14de
    ora #$08
    sta $14de
    lda $14da
    and #$04
    bne loc_0bb10b
    jml loc_0bb10f

loc_0bb10b:
    jsl sub_068c31

loc_0bb10f:
    rtl
    lda #$02
    sta $1527
    lda #$01
    sta $1528
    ldy $1b,x
    lda $14d7
    and #$02
    beq loc_0bb127
    jml loc_0bb149

loc_0bb127:
    cpy #$0000
    bne loc_0bb130
    jml loc_0bb143

loc_0bb130:
    lda $002b,y
    cmp #$08
    bpl loc_0bb13b
    jml loc_0bb143

loc_0bb13b:
    lda #$04
    jsl sub_03b7f9
    bra loc_0bb149

loc_0bb143:
    lda #$07
    jsl sub_03b7f9

loc_0bb149:
    cpy #$0000
    bne loc_0bb152
    jml loc_0bb18f

loc_0bb152:
    lda $002b,y
    bne loc_0bb15b
    jml loc_0bb25f

loc_0bb15b:
    ldy $1238
    lda $0014,y
    bpl loc_0bb16e
    lda $1231
    clc
    adc #$f8
    sta $1231
    bra loc_0bb18f

loc_0bb16e:
    lda $1231
    clc
    adc #$08
    sta $1231
    rep #$20
.a16
    lda $000c,y
    clc
    adc #$000a
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$f800
    sta $1503
    sep #$20

loc_0bb18f:
.a8
    rep #$20
.a16
    lda #$b212
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    rep #$20
.a16
    lda $1b,x
    sta $155d
    sep #$20
.a8
    rep #$20
.a16
    lda #$b221
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd8,x
    lda $14d6
    ora #$02
    sta $14d6
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    lda $14da
    and #$04
    beq loc_0bb1d6
    jml loc_0bb212

loc_0bb1d6:
    rep #$20
.a16
    lda #$b289
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0bb1ea
    jml loc_0bb212

loc_0bb1ea:
    lda $0009,y
    and #$f7
    sta $0009,y
    lda $001e,y
    ora #$01
    sta $001e,y
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
    sty $26,x

loc_0bb212:
    lda $14d6
    bit #$08
    beq loc_0bb21d
    jml loc_0bacdf

loc_0bb21d:
    jml loc_0bad18
    rep #$20
.a16
    lda #$0000
    sta $155d
    sep #$20
.a8
    rep #$20
.a16
    lda #$b110
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    ldy $1238
    lda $14d6
    and #$fd
    sta $14d6
    ldy $26,x
    cpy #$0000
    bne loc_0bb252
    jml loc_0bb25f

loc_0bb252:
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    jsl sub_1fd540

loc_0bb25f:
    jml loc_0bb039
    lda #$05
    jsl sub_03b7f9
    lda #$ff
    sta $2a,x
    lda #$00
    sta $2b,x
    lda $14d6
    and #$fd
    sta $14d6
    lda $14d6
    ora #$08
    sta $14d6
    ldy $1567
    lda #$0a
    sta $002d,y
    jsl sub_06eefd
    rep #$20
.a16
    lda $14f4
    sta $0033,y
    sep #$20
.a8
    jml loc_1fdc25
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$b2da
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$b3af
    sta $1cd3,x
    lda #$b502
    sta $1cd0,x
    sep #$20
.a8
    lda #$05
    sta $2a,x
    lda #$03
    sta $2b,x
    stx $1565
    lda $1e,x
    ora #$01
    sta $1e,x
    rtl

loc_0bb2da:
    ldy $1238
    jsl sub_1fdaed
    jsl sub_1fdb11
    lda #$21
    sta $02
    sta $04
    bit #$80
    beq loc_0bb2f5
    lda #$ff
    sta $05
    bra loc_0bb2f7

loc_0bb2f5:
    stz $05

loc_0bb2f7:
    lda #$0d
    sta $08
    sta $0a
    bit #$80
    beq loc_0bb307
    lda #$ff
    sta $0b
    bra loc_0bb309

loc_0bb307:
    stz $0b

loc_0bb309:
    lda #$00
    sta $90
    sta $15c2
    bit #$80
    beq loc_0bb31b
    lda #$ff
    sta $15c3
    bra loc_0bb31e

loc_0bb31b:
    stz $15c3

loc_0bb31e:
    lda $14,x
    jsl sub_1fcc78
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
    rep #$20
.a16
    lda $0c,x
    clc
    adc $04
    sta $0c,x
    lda $10,x
    clc
    adc $15c2
    sta $10,x
    lda $0e,x
    clc
    adc $0a
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    cmp $1571
    sep #$20
.a8
    bpl loc_0bb35a
    jml loc_0bb36f

loc_0bb35a:
    rep #$20
.a16
    lda $1571
    sec
    sbc $0c,x
    sta $158d
    sep #$20
.a8
    lda $14de
    ora #$02
    sta $14de

loc_0bb36f:
    rep #$20
.a16
    lda $0e,x
    cmp $157b
    sep #$20
.a8
    beq loc_0bb380
    bmi loc_0bb380
    jml loc_0bb388

loc_0bb380:
    lda $14de
    ora #$10
    sta $14de

loc_0bb388:
    rep #$20
.a16
    lda $0e,x
    cmp $157d
    sep #$20
.a8
    bpl loc_0bb397
    jml loc_0bb3ae

loc_0bb397:
    lda $14de
    ora #$20
    sta $14de
    lda $14da
    and #$04
    bne loc_0bb3aa
    jml loc_0bb3ae

loc_0bb3aa:
    jsl sub_068c31

loc_0bb3ae:
    rtl
    lda #$02
    sta $1527
    lda #$01
    sta $1528
    ldy $1b,x
    lda $14d7
    and #$02
    beq loc_0bb3c6
    jml loc_0bb3e8

loc_0bb3c6:
    cpy #$0000
    bne loc_0bb3cf
    jml loc_0bb3e2

loc_0bb3cf:
    lda $002b,y
    cmp #$08
    bpl loc_0bb3da
    jml loc_0bb3e2

loc_0bb3da:
    lda #$04
    jsl sub_03b7f9
    bra loc_0bb3e8

loc_0bb3e2:
    lda #$08
    jsl sub_03b7f9

loc_0bb3e8:
    cpy #$0000
    bne loc_0bb3f1
    jml loc_0bb42e

loc_0bb3f1:
    lda $002b,y
    bne loc_0bb3fa
    jml loc_0bb4fe

loc_0bb3fa:
    ldy $1238
    lda $0014,y
    bmi loc_0bb40d
    lda $1231
    clc
    adc #$f8
    sta $1231
    bra loc_0bb42e

loc_0bb40d:
    lda $1231
    clc
    adc #$08
    sta $1231
    rep #$20
.a16
    lda $000c,y
    clc
    adc #$fff6
    sta $000c,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$0800
    sta $1503
    sep #$20

loc_0bb42e:
.a8
    rep #$20
.a16
    lda #$b4b1
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    rep #$20
.a16
    lda $1b,x
    sta $155f
    sep #$20
.a8
    rep #$20
.a16
    lda #$b4c0
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd8,x
    lda $14d6
    ora #$04
    sta $14d6
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    lda $14da
    and #$04
    beq loc_0bb475
    jml loc_0bb4b1

loc_0bb475:
    rep #$20
.a16
    lda #$b289
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0bb489
    jml loc_0bb4b1

loc_0bb489:
    lda $0009,y
    and #$f7
    sta $0009,y
    lda $001e,y
    ora #$01
    sta $001e,y
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
    sty $26,x

loc_0bb4b1:
    lda $14d6
    bit #$10
    beq loc_0bb4bc
    jml loc_0bacdf

loc_0bb4bc:
    jml loc_0bad18
    rep #$20
.a16
    lda #$0000
    sta $155f
    sep #$20
.a8
    rep #$20
.a16
    lda #$b3af
    sta $7e1cd3,x
    sep #$20
.a8
    lda #$0b
    sta $7e1cd5,x
    ldy $1238
    lda $14d6
    and #$fb
    sta $14d6
    ldy $26,x
    cpy #$0000
    bne loc_0bb4f1
    jml loc_0bb4fe

loc_0bb4f1:
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    jsl sub_1fd540

loc_0bb4fe:
    jml loc_0bb2da
    lda #$06
    jsl sub_03b7f9
    lda #$ff
    sta $2a,x
    lda #$00
    sta $2b,x
    lda $14d6
    and #$fb
    sta $14d6
    lda $14d6
    ora #$10
    sta $14d6
    ldy $1567
    lda #$0a
    sta $002d,y
    jsl sub_06eefd
    rep #$20
.a16
    lda $14f4
    sta $0033,y
    sep #$20
.a8
    jml loc_1fdc25
    jsr sub_0bd1fd
    jsl sub_0bb566
    lda $20,x
    and #$f7
    sta $20,x
    lda $1e,x
    and #$fe
    sta $1e,x
    stz $14c2
    rtl

sub_0bb551:
    sep #$20
    rep #$10
    ldx $1238
    rep #$20
.a16
    lda #$b566
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    rtl

sub_0bb566:
    lda #$01
    sta $14c2
    rep #$20
.a16
    lda #$0000
    sta $16ff
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $c5
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $152a
    sep #$20
.a8
    lda $14d0
    and #$fe
    sta $14d0
    rep #$20
.a16
    lda #$0000
    sta $0c,x
    lda #$0000
    sta $0e,x
    lda #$0000
    sta $10,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $18c5
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $18c7
    sep #$20
.a8
    rep #$20
.a16
    lda #$0078
    sta $18cb
    sep #$20
.a8
    rep #$20
.a16
    lda #$0078
    sta $1598
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $14f6
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $14f8
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $14fa
    sep #$20
.a8
    lda #$00
    sta $15ca
    lda $14d6
    ora #$60
    sta $14d6
    rep #$20
.a16
    lda #$ffc4
    sta $1589
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff10
    sta $156f
    sep #$20
.a8
    rep #$20
.a16
    lda #$00f0
    sta $1571
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff10
    sta $1573
    sep #$20
.a8
    rep #$20
.a16
    lda #$00f0
    sta $1575
    sep #$20
.a8
    rep #$20
.a16
    lda #$2710
    sta $157f
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff42
    sta $157b
    sep #$20
.a8
    rep #$20
.a16
    lda #$0055
    sta $157d
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff42
    sta $1577
    sep #$20
.a8
    rep #$20
.a16
    lda #$003c
    sta $1579
    sep #$20
.a8
    lda #$12
    sta $14da
    lda #$00
    sta $14df
    lda #$00
    sta $14d5
    lda $14d0
    ora #$20
    sta $14d0
    lda $14d0
    and #$ff
    sta $14d0
    lda $14dd
    and #$fb
    sta $14dd
    lda $14d8
    ora #$02
    sta $14d8
    lda $14d7
    and #$fb
    sta $14d7
    lda $14dd
    and #$d7
    sta $14dd
    lda $14d8
    and #$fe
    sta $14d8
    lda $14da
    and #$ef
    sta $14da
    rep #$20
.a16
    lda #$b6ea
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    jsl sub_1fd450
    lda $20,x
    ora #$08
    sta $20,x
    lda $14d8
    and #$fd
    sta $14d8
    lda #$41
    sta $15,x
    rep #$20
.a16
    lda #$0041
    sta $14f4
    sep #$20
.a8
    lda #$41
    sta $150c
    lda #$41
    sta $150b
    rep #$20
.a16
    lda #$0000
    sta $1234
    sep #$20
.a8
    jsr sub_0be884
    jsr sub_0bd083
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$0000
    sta $18c9
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1234
    sep #$20
.a8
    rep #$20
.a16
    lda $14cd
    clc
    adc #$0010
    sta $14cd
    sep #$20
.a8
    rtl
    .incbin "data/05b719-05b9b1.bin"
    lda $14d6
    and #$1f
    sta $14d6
    rep #$20
.a16
    lda #$ffce
    sta $1589
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $156f
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1571
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1573
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1575
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffce
    sta $157f
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffce
    sta $157b
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffd3
    sta $157d
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffce
    sta $1577
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffba
    sta $1579
    sep #$20
.a8
    lda #$02
    sta $14da
    lda #$00
    sta $14df
    lda #$00
    sta $14d5
    lda $14d0
    ora #$20
    sta $14d0
    lda $14d0
    and #$ff
    sta $14d0
    lda $14dd
    and #$fb
    sta $14dd
    lda $14d8
    ora #$02
    sta $14d8
    lda $14d7
    and #$fb
    sta $14d7
    lda $14dd
    and #$d7
    sta $14dd
    lda $14d8
    and #$fe
    sta $14d8
    lda $14dd
    ora #$20
    sta $14dd
    rep #$20
.a16
    lda #$ba9d
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$e729
    sta $1cd3,x
    lda #$e215
    sta $1cd0,x
    sep #$20
.a8
    rep #$20
.a16
    lda #$0041
    sta $14f4
    sep #$20
.a8
    jsr sub_0be884
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
    jsr sub_0bd083
    rep #$20
.a16
    lda #$0000
    sta $18c5
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $18c7
    sep #$20
.a8
    rep #$20
.a16
    lda #$00c8
    sta $18cb
    sep #$20
.a8
    rep #$20
.a16
    lda #$00c8
    sta $1598
    sep #$20
.a8
    rep #$20
.a16
    lda #$bcb4
    sta $04,x
    sep #$20
.a8
    lda $14d8
    and #$fd
    sta $14d8
    rtl

sub_0bbaef:
    sep #$20
    rep #$10
    ldx $1238
    rep #$20
.a16
    lda #$bb03
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x

loc_0bbb03:
    lda $14d6
    and #$1f
    sta $14d6
    rep #$20
.a16
    lda #$ffce
    sta $1589
    sep #$20
.a8
    rep #$20
.a16
    lda #$fe0c
    sta $156f
    sep #$20
.a8
    rep #$20
.a16
    lda #$01f4
    sta $1571
    sep #$20
.a8
    rep #$20
.a16
    lda #$fe0c
    sta $1573
    sep #$20
.a8
    rep #$20
.a16
    lda #$01f4
    sta $1575
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $157f
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff01
    sta $157b
    sep #$20
.a8
    rep #$20
.a16
    lda #$0005
    sta $157d
    sep #$20
.a8
    rep #$20
.a16
    lda #$ff01
    sta $1577
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffec
    sta $1579
    sep #$20
.a8
    lda #$1b
    sta $14da
    lda #$a8
    sta $14df
    lda #$08
    sta $14d5
    lda $14d0
    ora #$20
    sta $14d0
    lda $14d0
    and #$ff
    sta $14d0
    lda $14dd
    and #$fb
    sta $14dd
    lda $14d8
    ora #$02
    sta $14d8
    lda $14d7
    and #$fb
    sta $14d7
    lda $14dd
    and #$d7
    sta $14dd
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $14d8
    and #$fe
    sta $14d8
    rep #$20
.a16
    lda #$bbe3
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$e729
    sta $1cd3,x
    lda #$e215
    sta $1cd0,x
    sep #$20

loc_0bbbe3:
.a8
    jsr sub_0be8aa
    rep #$20
.a16
    lda $0c,x
    jsl sub_1fd4c8
    bra loc_0bbbf6
    .db $b5,$0c,$22,$df,$d4,$1f

loc_0bbbf6:
    sta $14f6
    lda $0e,x
    sec
    sbc $1589
    jsl sub_1fd4ba
    clc
    adc $1589
    sta $14f8
    sep #$20
.a8
    jsr sub_0bd083
    rtl
    .incbin "data/05bc10-05c87e.bin"

sub_0bc87e:
    sep #$20
    rep #$10
    ldx $1238
    rep #$20
.a16
    lda #$c893
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    rtl
    .incbin "data/05c893-05cc7c.bin"

sub_0bcc7c:
    sep #$20
    rep #$10
    ldx $1238
    rep #$20
.a16
    lda #$cc91
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    rtl
    .incbin "data/05cc91-05d083.bin"

sub_0bd083:
    lda #$04
    sta $1f43
    lda $23,x
    bne loc_0bd090
    jml loc_0bd0b2

loc_0bd090:
    lda $14d7
    and #$20
    bne loc_0bd09b
    jml loc_0bd0a2

loc_0bd09b:
    lda #$08
    sta $1f43
    bra loc_0bd0b2

loc_0bd0a2:
    lda $14d7
    and #$40
    bne loc_0bd0ad
    jml loc_0bd0b2

loc_0bd0ad:
    lda #$0c
    sta $1f43

loc_0bd0b2:
    lda $14dd
    and #$04
    beq loc_0bd0bd
    jml loc_0bd1ef

loc_0bd0bd:
    lda $14dd
    and #$01
    beq loc_0bd0c8
    jml loc_0bd111

loc_0bd0c8:
    rep #$20
.a16
    lda $1598
    cmp $18cb
    beq loc_0bd10c
    sec
    sbc $18cb
    cmp #$0000
    bmi loc_0bd0e5
    cmp #$0008
    bpl loc_0bd0ed
    lda #$0008
    bra loc_0bd0ed

loc_0bd0e5:
    cmp #$fff8
    bmi loc_0bd0ed
    lda #$fff8

loc_0bd0ed:
    cmp #$8000
    ror a
    bpl loc_0bd0f6
    adc #$0000

loc_0bd0f6:
    cmp #$8000
    ror a
    bpl loc_0bd0ff
    adc #$0000

loc_0bd0ff:
    cmp #$8000
    ror a
    bpl loc_0bd108
    adc #$0000

loc_0bd108:
    clc
    adc $18cb

loc_0bd10c:
    sta $18cb
    sep #$20

loc_0bd111:
.a8
    rep #$20
.a16
    lda $14fa
    clc
    adc $14f4
    sta $14fa
    sep #$20
.a8
    rep #$20
.a16
    lda $14f4
    cmp $33,x
    beq loc_0bd134
    bmi loc_0bd130
    sec
    sbc #$0001
    bra loc_0bd134

loc_0bd130:
    clc
    adc #$0001

loc_0bd134:
    sta $14f4
    sep #$20
.a8
    rep #$20
.a16
    lda $14fa
    sec
    sbc $1511
    cmp #$0000
    bmi loc_0bd151
    cmp #$0032
    bmi loc_0bd159
    lda #$0032
    bra loc_0bd159

loc_0bd151:
    cmp #$ff38
    bpl loc_0bd159
    lda #$ff38

loc_0bd159:
    clc
    adc $1511
    sta $14fa
    sep #$20
.a8
    lda $23,x
    cmp #$0a
    beq loc_0bd16e
    bmi loc_0bd16e
    jml loc_0bd1bd

loc_0bd16e:
    lda $150c
    sta $150b
    rep #$20
.a16
    lda $1511
    cmp $14fa
    beq loc_0bd1b8
    sec
    sbc $14fa
    cmp #$0000
    bmi loc_0bd191
    cmp #$0008
    bpl loc_0bd199
    lda #$0008
    bra loc_0bd199

loc_0bd191:
    cmp #$fff8
    bmi loc_0bd199
    lda #$fff8

loc_0bd199:
    cmp #$8000
    ror a
    bpl loc_0bd1a2
    adc #$0000

loc_0bd1a2:
    cmp #$8000
    ror a
    bpl loc_0bd1ab
    adc #$0000

loc_0bd1ab:
    cmp #$8000
    ror a
    bpl loc_0bd1b4
    adc #$0000

loc_0bd1b4:
    clc
    adc $14fa

loc_0bd1b8:
    sta $14fa
    sep #$20

loc_0bd1bd:
.a8
    lda $150b
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    lda $14db
    cmp #$03
    beq loc_0bd1d4
    jml loc_0bd1ef

loc_0bd1d4:
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
    lda $10,x
    sta $14fa
    sep #$20

loc_0bd1ef:
.a8
    rep #$20
.a16
    lda $c5
    sta $14fc
    sep #$20
.a8
    rts
    .db $20,$fd,$d1,$6b

sub_0bd1fd:
    sep #$20
    lda #$01
    sta $701a28
    sta $701a29
    lda #$00
    sta $15ca
    stx $1236
    stx $1238
    stx $159e
    stx $15a2
    rep #$20
.a16
    lda #$0078
    sta $1598
    sep #$20
.a8
    rep #$20
.a16
    lda #$0078
    sta $18cb
    sep #$20
.a8
    lda $09,x
    and #$f7
    sta $09,x
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $1d,x
    ora #$08
    sta $1d,x
    rep #$20
.a16
    lda #$0000
    sta $1230
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1232
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $1234
    sep #$20
.a8
    lda #$00
    sta $15a1
    lda #$00
    sta $14dd
    rep #$20
.a16
    lda #$0000
    sta $152a
    sep #$20
.a8
    lda #$00
    sta $1507
    rep #$20
.a16
    lda #$0000
    sta $1503
    sep #$20
.a8
    lda #$00
    sta $1508
    lda #$00
    sta $1501
    lda #$00
    sta $1502
    lda #$00
    sta $14f3
    lda #$00
    sta $1523
    lda #$01
    sta $1526
    rep #$20
.a16
    lda #$0000
    sta $14fa
    sep #$20
.a8
    lda #$80
    sta $14ec
    rep #$20
.a16
    lda #$0041
    sta $14f4
    sep #$20
.a8
    lda #$41
    sta $150b
    lda #$41
    sta $150c
    rep #$20
.a16
    lda #$0041
    sta $14ea
    sep #$20
.a8
    lda #$e2
    sta $156e
    lda #$00
    sta $14cc
    stz $1f0c
    jsr sub_0beb28
    lda $14d8
    and #$f2
    sta $14d8
    lda $14d8
    ora #$02
    sta $14d8
    rts

sub_0bd2ef:
.i8
    sep #$20
    rep #$20
.a16
    lda #$0003
    sta $15ad
    sep #$20
.a8
    lda #$00
    sta $14d6
    lda #$00
    sta $14d7
    lda #$00
    sta $14d8
    stz $16cd
    lda #$00
    sta $15a0
    jsl sub_06818d
    rtl
    .db $a9,$41,$95,$15,$c2,$20,$a9,$41,$00,$8d,$f4,$14,$e2,$20,$a9,$41
    .db $8d,$0c,$15,$a9,$41,$8d,$0b,$15,$c2,$20,$a9,$41,$00,$8d,$ea,$14
    .db $e2,$20,$60

sub_0bd33a:
.i16
    lda $14d7
    and #$02
    bne loc_0bd345
    jml loc_0bd3a6

loc_0bd345:
    lda $14f3
    cmp #$02
    bne loc_0bd350
    jml loc_0bd3a1

loc_0bd350:
    bpl loc_0bd356
    jml loc_0bd3a1

loc_0bd356:
    lda $14f2
    bne loc_0bd35f
    jml loc_0bd38d

loc_0bd35f:
    dec $14f2
    lda $14f2
    and #$03
    beq loc_0bd36d
    jml loc_0bd37c

loc_0bd36d:
    stz $16cd
    lda #$00
    sta $15a0
    jsl sub_06818d
    brl loc_0bd3a6

loc_0bd37c:
    lda #$01
    sta $16cd
    lda #$01
    sta $15a0
    jsl sub_06818d
    brl loc_0bd3a6

loc_0bd38d:
    stz $16cd
    lda #$00
    sta $15a0
    jsl sub_06818d
    lda $14d7
    and #$fd
    sta $14d7

loc_0bd3a1:
    lda #$32
    sta $14f2

loc_0bd3a6:
    lda $22,x
    bne loc_0bd3ae
    jml loc_0bd3ff

loc_0bd3ae:
    dec $22,x
    jsl sub_02fc58
    and #$0f
    sta $1595
    lda $1595
    sec
    sbc #$07
    sta $1595
    jsl sub_02fc58
    and #$0f
    sta $1596
    lda $1596
    sec
    sbc #$07
    sta $1596
    jsl sub_02fc58
    and #$0f
    sta $1597
    lda $1597
    sec
    sbc #$07
    sta $1597
    lda $15bb
    and #$01
    beq loc_0bd3f1
    jml loc_0bd40e

loc_0bd3f1:
    lda $1d,x
    ora #$02
    sta $1d,x
    lda $1f,x
    ora #$20
    sta $1f,x
    bra loc_0bd40e

loc_0bd3ff:
    lda $1f,x
    and #$df
    sta $1f,x
    stz $1595
    stz $1596
    stz $1597

loc_0bd40e:
    rep #$20
.a16
    lda $1579
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    sec
    sbc $31,x
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    cmp $151b
    sep #$20
.a8
    bpl loc_0bd434
    jml loc_0bd44b

loc_0bd434:
    rep #$20
.a16
    lda $0e,x
    cmp $151b
    sep #$20
.a8
    bne loc_0bd443
    jml loc_0bd44b

loc_0bd443:
    lda $14de
    ora #$80
    sta $14de

loc_0bd44b:
    lda $14de
    and $14df
    sta $14de
    jsr sub_0beb28
    lda $15,x
    sta $1509
    bit #$80
    beq loc_0bd467
    lda #$ff
    sta $150a
    bra loc_0bd46a

loc_0bd467:
    stz $150a

loc_0bd46a:
    lda $14de
    bit #$80
    bne loc_0bd475
    jml loc_0bd4d6

loc_0bd475:
    rep #$20
.a16
    lda $31,x
    sep #$20
.a8
    bpl loc_0bd481
    jml loc_0bd4d6

loc_0bd481:
    lda $15,x
    cmp $150c
    beq loc_0bd48e
    bmi loc_0bd48e
    jml loc_0bd4ae

loc_0bd48e:
    lda $1202
    and #$04
    beq loc_0bd499
    jml loc_0bd4a3

loc_0bd499:
    rep #$20
.a16
    lda #$0000
    sta $1230
    sep #$20

loc_0bd4a3:
.a8
    rep #$20
.a16
    lda $1579
    sta $0e,x
    sep #$20
.a8
    bra loc_0bd4d6

loc_0bd4ae:
    rep #$20
.a16
    lda $1579
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $1230
    eor #$ffff
    inc a
    cmp #$8000
    ror a
    sta $1230
    sep #$20
.a8
    lda $14de
    ora #$28
    sta $14de
    lda #$04
    sta $1529

loc_0bd4d6:
    lda $1fc7
    and #$fc
    sta $1fc7
    lda $14df
    bit #$80
    beq loc_0bd4e9
    jml loc_0bd509

loc_0bd4e9:
    rep #$20
.a16
    lda $0e,x
    cmp $1579
    sep #$20
.a8
    bpl loc_0bd4f8
    jml loc_0bd509

loc_0bd4f8:
    rep #$20
.a16
    lda $1579
    sta $0e,x
    sep #$20
.a8
    lda $1fc7
    ora #$02
    sta $1fc7

loc_0bd509:
    rep #$20
.a16
    lda $0e,x
    cmp $1577
    sep #$20
.a8
    beq loc_0bd51a
    bmi loc_0bd51a
    jml loc_0bd52b

loc_0bd51a:
    rep #$20
.a16
    lda $1577
    sta $0e,x
    sep #$20
.a8
    lda $1fc7
    ora #$01
    sta $1fc7

loc_0bd52b:
    lda $14d0
    bit #$20
    bne loc_0bd536
    jml loc_0bd687

loc_0bd536:
    lda $14d6
    bit #$a0
    beq loc_0bd541
    jml loc_0bd5f5

loc_0bd541:
    lda $1202
    and #$08
    bne loc_0bd54c
    jml loc_0bd55a

loc_0bd54c:
    rep #$20
.a16
    lda $18c5
    clc
    adc #$ff00
    sta $18c5
    sep #$20

loc_0bd55a:
.a8
    lda $1202
    and #$04
    bne loc_0bd565
    jml loc_0bd573

loc_0bd565:
    rep #$20
.a16
    lda $18c5
    sec
    sbc #$ff00
    sta $18c5
    sep #$20

loc_0bd573:
.a8
    rep #$20
.a16
    lda $156f
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    clc
    adc #$012c
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $1571
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $151d
    sec
    sbc #$012c
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    cmp $151b
    sep #$20
.a8
    beq loc_0bd5b4
    bmi loc_0bd5b4
    jml loc_0bd5cd

loc_0bd5b4:
    lda $1202
    and #$02
    bne loc_0bd5bf
    jml loc_0bd5cd

loc_0bd5bf:
    rep #$20
.a16
    lda $18c7
    sec
    sbc #$00c8
    sta $18c7
    sep #$20

loc_0bd5cd:
.a8
    rep #$20
.a16
    lda $0c,x
    cmp $151d
    sep #$20
.a8
    bpl loc_0bd5dc
    jml loc_0bd5f5

loc_0bd5dc:
    lda $1202
    and #$01
    bne loc_0bd5e7
    jml loc_0bd5f5

loc_0bd5e7:
    rep #$20
.a16
    lda $18c7
    clc
    adc #$00c8
    sta $18c7
    sep #$20

loc_0bd5f5:
.a8
    rep #$20
.a16
    lda #$0000
    cmp $18c5
    beq loc_0bd639
    sec
    sbc $18c5
    cmp #$0000
    bmi loc_0bd612
    cmp #$0008
    bpl loc_0bd61a
    lda #$0008
    bra loc_0bd61a

loc_0bd612:
    cmp #$fff8
    bmi loc_0bd61a
    lda #$fff8

loc_0bd61a:
    cmp #$8000
    ror a
    bpl loc_0bd623
    adc #$0000

loc_0bd623:
    cmp #$8000
    ror a
    bpl loc_0bd62c
    adc #$0000

loc_0bd62c:
    cmp #$8000
    ror a
    bpl loc_0bd635
    adc #$0000

loc_0bd635:
    clc
    adc $18c5

loc_0bd639:
    sta $18c5
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    cmp $18c7
    beq loc_0bd682
    sec
    sbc $18c7
    cmp #$0000
    bmi loc_0bd65b
    cmp #$0008
    bpl loc_0bd663
    lda #$0008
    bra loc_0bd663

loc_0bd65b:
    cmp #$fff8
    bmi loc_0bd663
    lda #$fff8

loc_0bd663:
    cmp #$8000
    ror a
    bpl loc_0bd66c
    adc #$0000

loc_0bd66c:
    cmp #$8000
    ror a
    bpl loc_0bd675
    adc #$0000

loc_0bd675:
    cmp #$8000
    ror a
    bpl loc_0bd67e
    adc #$0000

loc_0bd67e:
    clc
    adc $18c7

loc_0bd682:
    sta $18c7
    sep #$20

loc_0bd687:
.a8
    lda $14de
    bit #$14
    bne loc_0bd692
    jml loc_0bd6a0

loc_0bd692:
    rep #$20
.a16
    lda $1230
    clc
    adc #$0300
    sta $1230
    sep #$20

loc_0bd6a0:
.a8
    lda $14de
    bit #$28
    bne loc_0bd6ab
    jml loc_0bd6c2

loc_0bd6ab:
    rep #$20
.a16
    lda $1230
    eor #$ffff
    inc a
    sec
    sbc #$0a00
    sta $1230
    sep #$20
.a8
    lda #$04
    sta $1529

loc_0bd6c2:
    ldy $1563
    lda $14de
    bit #$04
    beq loc_0bd6d0
    jml loc_0bd6db

loc_0bd6d0:
    lda $14de
    bit #$08
    bne loc_0bd6db
    jml loc_0bd6e3

loc_0bd6db:
    lda $001d,y
    ora #$80
    sta $001d,y

loc_0bd6e3:
    ldy $1565
    lda $14de
    bit #$10
    beq loc_0bd6f1
    jml loc_0bd6fc

loc_0bd6f1:
    lda $14de
    bit #$20
    bne loc_0bd6fc
    jml loc_0bd704

loc_0bd6fc:
    lda $001d,y
    ora #$80
    sta $001d,y

loc_0bd704:
    lda $14de
    bit #$01
    bne loc_0bd70f
    jml loc_0bd729

loc_0bd70f:
    rep #$20
.a16
    lda $0c,x
    clc
    adc $158d
    sta $0c,x
    sep #$20
.a8
    ldy $1563
    lda $001d,y
    ora #$80
    sta $001d,y
    brl loc_0bd74b

loc_0bd729:
    lda $14de
    bit #$02
    bne loc_0bd734
    jml loc_0bd74b

loc_0bd734:
    rep #$20
.a16
    lda $0c,x
    clc
    adc $158d
    sta $0c,x
    sep #$20
.a8
    ldy $1565
    lda $001d,y
    ora #$80
    sta $001d,y

loc_0bd74b:
    lda $14d6
    bit #$04
    bne loc_0bd755
    brl loc_0bd7dc

loc_0bd755:
    rep #$20
.a16
    lda #$0200
    sta $1503
    sep #$20
.a8
    rep #$20
.a16
    lda #$2000
    cmp $1234
    beq loc_0bd7ac
    sec
    sbc $1234
    cmp #$0000
    bmi loc_0bd77c
    cmp #$0010
    bpl loc_0bd784
    lda #$0010
    bra loc_0bd784

loc_0bd77c:
    cmp #$fff0
    bmi loc_0bd784
    lda #$fff0

loc_0bd784:
    cmp #$8000
    ror a
    bpl loc_0bd78d
    adc #$0000

loc_0bd78d:
    cmp #$8000
    ror a
    bpl loc_0bd796
    adc #$0000

loc_0bd796:
    cmp #$8000
    ror a
    bpl loc_0bd79f
    adc #$0000

loc_0bd79f:
    cmp #$8000
    ror a
    bpl loc_0bd7a8
    adc #$0000

loc_0bd7a8:
    clc
    adc $1234

loc_0bd7ac:
    sta $1234
    sep #$20
.a8
    lda #$10
    cmp $1507
    beq loc_0bd7d9
    sec
    sbc $1507
    cmp #$00
    bmi loc_0bd7c8
    cmp #$02
    bpl loc_0bd7ce
    lda #$02
    bra loc_0bd7ce

loc_0bd7c8:
    cmp #$fe
    bmi loc_0bd7ce
    lda #$fe

loc_0bd7ce:
    cmp #$80
    ror a
    bpl loc_0bd7d5
    adc #$00

loc_0bd7d5:
    clc
    adc $1507

loc_0bd7d9:
    sta $1507

loc_0bd7dc:
    lda $14d6
    and #$02
    bne loc_0bd7e6
    brl loc_0bd86d

loc_0bd7e6:
    rep #$20
.a16
    lda #$fe00
    sta $1503
    sep #$20
.a8
    rep #$20
.a16
    lda #$e000
    cmp $1234
    beq loc_0bd83d
    sec
    sbc $1234
    cmp #$0000
    bmi loc_0bd80d
    cmp #$0010
    bpl loc_0bd815
    lda #$0010
    bra loc_0bd815

loc_0bd80d:
    cmp #$fff0
    bmi loc_0bd815
    lda #$fff0

loc_0bd815:
    cmp #$8000
    ror a
    bpl loc_0bd81e
    adc #$0000

loc_0bd81e:
    cmp #$8000
    ror a
    bpl loc_0bd827
    adc #$0000

loc_0bd827:
    cmp #$8000
    ror a
    bpl loc_0bd830
    adc #$0000

loc_0bd830:
    cmp #$8000
    ror a
    bpl loc_0bd839
    adc #$0000

loc_0bd839:
    clc
    adc $1234

loc_0bd83d:
    sta $1234
    sep #$20
.a8
    lda #$f0
    cmp $1507
    beq loc_0bd86a
    sec
    sbc $1507
    cmp #$00
    bmi loc_0bd859
    cmp #$02
    bpl loc_0bd85f
    lda #$02
    bra loc_0bd85f

loc_0bd859:
    cmp #$fe
    bmi loc_0bd85f
    lda #$fe

loc_0bd85f:
    cmp #$80
    ror a
    bpl loc_0bd866
    adc #$00

loc_0bd866:
    clc
    adc $1507

loc_0bd86a:
    sta $1507

loc_0bd86d:
    lda $23,x
    bne loc_0bd875
    jml loc_0bd885

loc_0bd875:
    dec $23,x
    beq loc_0bd87d
    jml loc_0bd885

loc_0bd87d:
    lda $14d7
    and #$9f
    sta $14d7

loc_0bd885:
    lda $14d7
    and #$10
    bne loc_0bd890
    jml loc_0bd89b

loc_0bd890:
    lda $14d7
    and #$ef
    sta $14d7
    brl loc_0bd904

loc_0bd89b:
    lda $14d8
    and #$04
    bne loc_0bd8a6
    jml loc_0bd8b1

loc_0bd8a6:
    lda $14d8
    and #$fb
    sta $14d8
    brl loc_0bd978

loc_0bd8b1:
    lda $1962
    cmp #$ff
    beq loc_0bd8bc
    jml loc_0bdc58

loc_0bd8bc:
    lda $1fd1
    beq loc_0bd8c5
    jml loc_0bdc58

loc_0bd8c5:
    lda $14d6
    bit #$20
    beq loc_0bd8d0
    jml loc_0bdc58

loc_0bd8d0:
    lda $1529
    beq loc_0bd8db
    dec $1529
    brl loc_0bdc58

loc_0bd8db:
    lda $23,x
    beq loc_0bd8e3
    jml loc_0bd995

loc_0bd8e3:
    lda $7001bc
    cmp #$28
    bcs loc_0bd8ee
    brl loc_0bd995

loc_0bd8ee:
    lda $1204
    and #$40
    bne loc_0bd8f9
    jml loc_0bd962

loc_0bd8f9:
    lda $1202
    and #$80
    beq loc_0bd904
    jml loc_0bd962

loc_0bd904:
    lda $14d7
    ora #$20
    sta $14d7
    lda #$01
    sta $7001ba
    stx $158b
    lda #$55
    sta $15,x
    lda #$55
    sta $150b
    lda #$14
    sta $23,x
    lda $14db
    cmp #$03
    bne loc_0bd92d
    jml loc_0bd958

loc_0bd92d:
    rep #$20
.a16
    lda #$b219
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0bd941
    jml loc_0bd958

loc_0bd941:
    rep #$20
.a16
    lda #$8671
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y
    lda $0020,y
    ora #$08
    sta $0020,y

loc_0bd958:
    lda #$32
    jsl sub_03b7f9
    jml loc_0bd995

loc_0bd962:
    lda $1202
    and #$80
    bne loc_0bd96d
    jml loc_0bd995

loc_0bd96d:
    lda $1204
    and #$40
    beq loc_0bd978
    jml loc_0bd995

loc_0bd978:
    lda $14d7
    ora #$40
    sta $14d7
    lda #$33
    jsl sub_03b7f9
    lda #$01
    sta $7001ba
    lda #$14
    sta $150b
    lda #$1e
    sta $23,x

loc_0bd995:
    lda $14d6
    bit #$20
    beq loc_0bd9a0
    jml loc_0bdc58

loc_0bd9a0:
    stz $14c5
    stz $14c6
    lda $1202
    and #$03
    bne loc_0bd9b1
    jml loc_0bd9cf

loc_0bd9b1:
    lda $1507
    cmp #$80
    ror a
    cmp #$80
    ror a
    cmp #$80
    ror a
    rep #$20
.a16
    bit #$0080
    beq loc_0bd9c9
    ora #$ff00
    bra loc_0bd9cc

loc_0bd9c9:
    and #$00ff

loc_0bd9cc:
    sta $14c5

loc_0bd9cf:
.a8
    rep #$20
.a16
    lda $1234
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
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    bpl loc_0bd9f9
    adc #$0000

loc_0bd9f9:
    clc
    adc $14c5
    eor #$ffff
    inc a
    sta $151b
    sep #$20
.a8
    lda $14d7
    and #$08
    bne loc_0bda11
    jml loc_0bda20

loc_0bda11:
    rep #$20
.a16
    lda $0c,x
    sec
    sbc $151b
    sta $0c,x
    sep #$20
.a8
    brl loc_0bda2c

loc_0bda20:
    rep #$20
.a16
    lda $0c,x
    clc
    adc $151b
    sta $0c,x
    sep #$20

loc_0bda2c:
.a8
    rep #$20
.a16
    lda $1579
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151b
    sec
    sbc #$001e
    sta $151b
    sep #$20
.a8
    lda $14de
    bit #$01
    beq loc_0bda4f
    jml loc_0bda95

loc_0bda4f:
    lda $1202
    and #$02
    bne loc_0bda5a
    jml loc_0bda95

loc_0bda5a:
    lda $14df
    bit #$80
    beq loc_0bda70
    rep #$20
.a16
    lda $0e,x
    cmp $151b
    sep #$20
.a8
    bmi loc_0bda70
    jml loc_0bda79

loc_0bda70:
    lda $1507
    clc
    adc #$02
    sta $1507

loc_0bda79:
    rep #$20
.a16
    lda $1234
    clc
    adc #$0200
    sta $1234
    sep #$20
.a8
    rep #$20
.a16
    lda $1232
    clc
    adc #$0200
    sta $1232
    sep #$20

loc_0bda95:
.a8
    lda $14de
    bit #$02
    beq loc_0bdaa0
    jml loc_0bdae6

loc_0bdaa0:
    lda $1202
    and #$01
    bne loc_0bdaab
    jml loc_0bdae6

loc_0bdaab:
    lda $14df
    bit #$80
    beq loc_0bdac1
    rep #$20
.a16
    lda $0e,x
    cmp $151b
    sep #$20
.a8
    bmi loc_0bdac1
    jml loc_0bdaca

loc_0bdac1:
    lda $1507
    sec
    sbc #$02
    sta $1507

loc_0bdaca:
    rep #$20
.a16
    lda $1234
    sec
    sbc #$0200
    sta $1234
    sep #$20
.a8
    rep #$20
.a16
    lda $1232
    sec
    sbc #$0200
    sta $1232
    sep #$20

loc_0bdae6:
.a8
    lda $14d6
    bit #$80
    beq loc_0bdaf1
    jml loc_0bdb23

loc_0bdaf1:
    lda $1202
    and #$08
    bne loc_0bdafc
    jml loc_0bdb0a

loc_0bdafc:
    rep #$20
.a16
    lda $1230
    clc
    adc #$0200
    sta $1230
    sep #$20

loc_0bdb0a:
.a8
    lda $1202
    and #$04
    bne loc_0bdb15
    jml loc_0bdb23

loc_0bdb15:
    rep #$20
.a16
    lda $1230
    sec
    sbc #$0200
    sta $1230
    sep #$20

loc_0bdb23:
.a8
    lda $1501
    beq loc_0bdb2c
    jml loc_0bdb7d

loc_0bdb2c:
    lda $1500
    bne loc_0bdb35
    jml loc_0bdb6d

loc_0bdb35:
    dec $1500
    lda $1204
    and #$30
    bne loc_0bdb43
    jml loc_0bdb7d

loc_0bdb43:
    lda $15a5
    and #$30
    beq loc_0bdb4e
    jml loc_0bdb7d

loc_0bdb4e:
    lda #$e0
    sta $1501
    lda #$00
    sta $1502
    lda $1204
    and #$20
    bne loc_0bdb63
    jml loc_0bdb6d

loc_0bdb63:
    lda #$20
    sta $1501
    lda #$00
    sta $1502

loc_0bdb6d:
    lda $1204
    and #$30
    bne loc_0bdb78
    jml loc_0bdb7d

loc_0bdb78:
    lda #$03
    sta $1500

loc_0bdb7d:
    lda $14e0
    and #$fd
    sta $14e0
    lda $1204
    and #$20
    bne loc_0bdb90
    jml loc_0bdbae

loc_0bdb90:
    lda $14e0
    ora #$02
    sta $14e0
    lda $15a5
    and #$20
    beq loc_0bdba3
    jml loc_0bdbc1

loc_0bdba3:
    lda $14e0
    ora #$01
    sta $14e0
    brl loc_0bdbc1

loc_0bdbae:
    lda $1204
    and #$10
    bne loc_0bdbb9
    jml loc_0bdbc1

loc_0bdbb9:
    lda $14e0
    and #$fe
    sta $14e0

loc_0bdbc1:
    lda $1204
    and #$10
    bne loc_0bdbcc
    jml loc_0bdbea

loc_0bdbcc:
    lda $14e0
    ora #$02
    sta $14e0
    lda $15a5
    and #$10
    beq loc_0bdbdf
    jml loc_0bdbfd

loc_0bdbdf:
    lda $14e0
    and #$fe
    sta $14e0
    brl loc_0bdbfd

loc_0bdbea:
    lda $1204
    and #$20
    bne loc_0bdbf5
    jml loc_0bdbfd

loc_0bdbf5:
    lda $14e0
    ora #$01
    sta $14e0

loc_0bdbfd:
    lda $14e0
    and #$02
    bne loc_0bdc08
    jml loc_0bdc58

loc_0bdc08:
    lda $14e0
    and #$01
    bne loc_0bdc13
    jml loc_0bdc30

loc_0bdc13:
    lda $1507
    clc
    adc #$0a
    sta $1507
    lda $1507
    cmp #$40
    bpl loc_0bdc27
    jml loc_0bdc91

loc_0bdc27:
    lda #$40
    sta $1507
    jml loc_0bdc91

loc_0bdc30:
    lda $1204
    and #$10
    bne loc_0bdc3b
    jml loc_0bdc58

loc_0bdc3b:
    lda $1507
    sec
    sbc #$0a
    sta $1507
    lda $1507
    cmp #$c0
    bmi loc_0bdc4f
    jml loc_0bdc91

loc_0bdc4f:
    lda #$c0
    sta $1507
    jml loc_0bdc91

loc_0bdc58:
    lda #$00
    cmp $1507
    beq loc_0bdc8e
    sec
    sbc $1507
    cmp #$00
    bmi loc_0bdc6f
    cmp #$08
    bpl loc_0bdc75
    lda #$08
    bra loc_0bdc75

loc_0bdc6f:
    cmp #$f8
    bmi loc_0bdc75
    lda #$f8

loc_0bdc75:
    cmp #$80
    ror a
    bpl loc_0bdc7c
    adc #$00

loc_0bdc7c:
    cmp #$80
    ror a
    bpl loc_0bdc83
    adc #$00

loc_0bdc83:
    cmp #$80
    ror a
    bpl loc_0bdc8a
    adc #$00

loc_0bdc8a:
    clc
    adc $1507

loc_0bdc8e:
    sta $1507

loc_0bdc91:
    rep #$20
.a16
    lda #$0000
    cmp $1232
    beq loc_0bdcd5
    sec
    sbc $1232
    cmp #$0000
    bmi loc_0bdcae
    cmp #$0008
    bpl loc_0bdcb6
    lda #$0008
    bra loc_0bdcb6

loc_0bdcae:
    cmp #$fff8
    bmi loc_0bdcb6
    lda #$fff8

loc_0bdcb6:
    cmp #$8000
    ror a
    bpl loc_0bdcbf
    adc #$0000

loc_0bdcbf:
    cmp #$8000
    ror a
    bpl loc_0bdcc8
    adc #$0000

loc_0bdcc8:
    cmp #$8000
    ror a
    bpl loc_0bdcd1
    adc #$0000

loc_0bdcd1:
    clc
    adc $1232

loc_0bdcd5:
    sta $1232
    sep #$20
.a8
    lda $1e,x
    and #$fe
    sta $1e,x
    rep #$20
.a16
    lda #$0000
    cmp $1234
    beq loc_0bdd2d
    sec
    sbc $1234
    cmp #$0000
    bmi loc_0bdcfd
    cmp #$0010
    bpl loc_0bdd05
    lda #$0010
    bra loc_0bdd05

loc_0bdcfd:
    cmp #$fff0
    bmi loc_0bdd05
    lda #$fff0

loc_0bdd05:
    cmp #$8000
    ror a
    bpl loc_0bdd0e
    adc #$0000

loc_0bdd0e:
    cmp #$8000
    ror a
    bpl loc_0bdd17
    adc #$0000

loc_0bdd17:
    cmp #$8000
    ror a
    bpl loc_0bdd20
    adc #$0000

loc_0bdd20:
    cmp #$8000
    ror a
    bpl loc_0bdd29
    adc #$0000

loc_0bdd29:
    clc
    adc $1234

loc_0bdd2d:
    sta $1234
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    cmp $1230
    beq loc_0bdd76
    sec
    sbc $1230
    cmp #$0000
    bmi loc_0bdd4f
    cmp #$0008
    bpl loc_0bdd57
    lda #$0008
    bra loc_0bdd57

loc_0bdd4f:
    cmp #$fff8
    bmi loc_0bdd57
    lda #$fff8

loc_0bdd57:
    cmp #$8000
    ror a
    bpl loc_0bdd60
    adc #$0000

loc_0bdd60:
    cmp #$8000
    ror a
    bpl loc_0bdd69
    adc #$0000

loc_0bdd69:
    cmp #$8000
    ror a
    bpl loc_0bdd72
    adc #$0000

loc_0bdd72:
    clc
    adc $1230

loc_0bdd76:
    sta $1230
    sep #$20
.a8
    stz $14de
    lda $15,x
    cmp #$14
    bcs loc_0bdd86
    lda #$14

loc_0bdd86:
    cmp #$55
    bcc loc_0bdd8c
    lda #$55

loc_0bdd8c:
    sta $15,x
    rep #$20
.a16
    lda $1234
    cmp #$0000
    bmi loc_0bdda2
    cmp #$0600
    bmi loc_0bddaa
    lda #$0600
    bra loc_0bddaa

loc_0bdda2:
    cmp #$fa00
    bpl loc_0bddaa
    lda #$fa00

loc_0bddaa:
    sta $1234
    sep #$20
.a8
    lda $1231
    sta $12,x
    lda $1233
    sta $13,x
    lda $13,x
    clc
    adc $152b
    sta $13,x
    lda $1235
    sta $14,x
    lda $14,x
    clc
    adc $1507
    sta $14,x
    lda $14,x
    clc
    adc $1504
    sta $14,x
    lda $14,x
    clc
    adc $1508
    sta $14,x
    lda $1501
    beq loc_0bdde7
    jml loc_0bde23

loc_0bdde7:
    lda #$00
    cmp $1502
    beq loc_0bde1d
    sec
    sbc $1502
    cmp #$00
    bmi loc_0bddfe
    cmp #$08
    bpl loc_0bde04
    lda #$08
    bra loc_0bde04

loc_0bddfe:
    cmp #$f8
    bmi loc_0bde04
    lda #$f8

loc_0bde04:
    cmp #$80
    ror a
    bpl loc_0bde0b
    adc #$00

loc_0bde0b:
    cmp #$80
    ror a
    bpl loc_0bde12
    adc #$00

loc_0bde12:
    cmp #$80
    ror a
    bpl loc_0bde19
    adc #$00

loc_0bde19:
    clc
    adc $1502

loc_0bde1d:
    sta $1502
    brl loc_0bde4a

loc_0bde23:
    lda $1501
    clc
    adc $1502
    sta $1502
    lda $1501
    bmi loc_0bde36
    jml loc_0bde41

loc_0bde36:
    lda $1501
    clc
    adc #$02
    sta $1501
    bra loc_0bde4a

loc_0bde41:
    lda $1501
    sec
    sbc #$02
    sta $1501

loc_0bde4a:
    lda $14,x
    clc
    adc $1502
    sta $14,x
    lda $14da
    and #$10
    bne loc_0bde5d
    jml loc_0bdebb

loc_0bde5d:
    lda $14d6
    and #$18
    bne loc_0bde68
    jml loc_0bde7f

loc_0bde68:
    phx
    rep #$20
.a16
    lda $14ee
    and #$00ff
    tax
    sep #$20
.a8
    lda $0beb8f,x
    plx
    sta $14f0
    brl loc_0bde9a

loc_0bde7f:
    phx
    rep #$20
.a16
    lda $14ee
    and #$00ff
    tax
    sep #$20
.a8
    lda $0beb8f,x
    plx
    cmp #$80
    ror a
    bpl loc_0bde97
    adc #$00

loc_0bde97:
    sta $14f0

loc_0bde9a:
    lda $14,x
    clc
    adc $14f0
    sta $14,x
    lda $14ee
    clc
    adc #$01
    sta $14ee
    lda $14ee
    cmp #$1c
    beq loc_0bdeb6
    jml loc_0bdebb

loc_0bdeb6:
    lda #$00
    sta $14ee

loc_0bdebb:
    lda $14db
    cmp #$03
    beq loc_0bdec6
    jml loc_0bdee1

loc_0bdec6:
    rep #$20
.a16
    lda $1507
    bit #$0080
    beq loc_0bded5
    ora #$ff00
    bra loc_0bded8

loc_0bded5:
    and #$00ff

loc_0bded8:
    clc
    adc $1503
    sta $18c9
    sep #$20

loc_0bdee1:
.a8
    lda $14d6
    bit #$06
    beq loc_0bdeec
    jml loc_0bdf1b

loc_0bdeec:
    rep #$20
.a16
    lda $1503
    eor #$ffff
    inc a
    clc
    adc $1505
    sta $1505
    clc
    adc $1503
    sta $1503
    lda $1503
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    eor #$ffff
    inc a
    clc
    adc $1503
    sta $1503
    sep #$20

loc_0bdf1b:
.a8
    lda $14,x
    sta $14c3
    rts

sub_0bdf21:
    lda $1fc7
    and #$f3
    sta $1fc7
    rep #$20
.a16
    lda $0c,x
    cmp $156f
    sep #$20
.a8
    beq loc_0bdf3a
    bmi loc_0bdf3a
    jml loc_0bdf4b

loc_0bdf3a:
    rep #$20
.a16
    lda $156f
    sta $0c,x
    sep #$20
.a8
    lda $1fc7
    ora #$04
    sta $1fc7

loc_0bdf4b:
    rep #$20
.a16
    lda $0c,x
    cmp $1571
    sep #$20
.a8
    bpl loc_0bdf5a
    jml loc_0bdf6b

loc_0bdf5a:
    rep #$20
.a16
    lda $1571
    sta $0c,x
    sep #$20
.a8
    lda $1fc7
    ora #$08
    sta $1fc7

loc_0bdf6b:
    rts

sub_0bdf6c:
    lda $14d6
    and #$18
    bne loc_0bdf77
    jml loc_0bdf87

loc_0bdf77:
    lda $14d7
    and #$fe
    sta $14d7
    lda $14d8
    and #$ef
    sta $14d8

loc_0bdf87:
    lda $14db
    cmp #$03
    beq loc_0bdf92
    jml loc_0bdfeb

loc_0bdf92:
    rep #$20
.a16
    lda $0c,x
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    sta $151f
    sep #$20
.a8
    rep #$20
.a16
    lda $14f6
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $14f8
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$0032
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $14fa
    sta $10,x
    sep #$20
.a8
    lda $14d8
    and #$10
    bne loc_0bdfdf
    jml loc_0bdfeb

loc_0bdfdf:
    rep #$20
.a16
    lda $10,x
    clc
    adc #$00c8
    sta $10,x
    sep #$20

loc_0bdfeb:
.a8
    lda $1e,x
    and #$bf
    sta $1e,x
    lda $14d6
    bit #$40
    beq loc_0bdffc
    jml loc_0be1e2

loc_0bdffc:
    lda $1962
    cmp #$ff
    beq loc_0be007
    jml loc_0be1e2

loc_0be007:
    lda $1fd1
    beq loc_0be010
    jml loc_0be1e2

loc_0be010:
    dec $1526
    beq loc_0be019
    jml loc_0be086

loc_0be019:
    lda #$01
    sta $1526
    lda $1204
    and #$80
    bne loc_0be029
    jml loc_0be086

loc_0be029:
    lda $15a5
    and #$80
    beq loc_0be034
    jml loc_0be086

loc_0be034:
    lda #$32
    sta $1526
    rep #$20
.a16
    lda $15ad
    sep #$20
.a8
    bne loc_0be046
    jml loc_0be086

loc_0be046:
    rep #$20
.a16
    dec $15ad
    sep #$20
.a8
    lda #$31
    jsl sub_03b7f9
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$14
    sta $1549
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$2a
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be081
    jml loc_0be086

loc_0be081:
    lda #$02
    sta $0025,y

loc_0be086:
    lda $1202
    and #$40
    bne loc_0be091
    jml loc_0be1e4

loc_0be091:
    dec $1525
    beq loc_0be09a
    jml loc_0be1e2

loc_0be09a:
    lda #$02
    sta $1525
    lda $1524
    bne loc_0be0a8
    jml loc_0be1e2

loc_0be0a8:
    dec $1524
    lda #$03
    sta $152c
    lda $14d8
    and #$10
    beq loc_0be0bb
    jml loc_0be0c6

loc_0be0bb:
    lda $14d7
    and #$01
    bne loc_0be0c6
    jml loc_0be0cb

loc_0be0c6:
    lda #$07
    sta $152c

loc_0be0cb:
    lda $1523
    cmp $152c
    beq loc_0be0d9
    bmi loc_0be0d9
    jml loc_0be1e2

loc_0be0d9:
    lda $1e,x
    ora #$40
    sta $1e,x
    lda $14d8
    and #$10
    beq loc_0be0ea
    jml loc_0be18a

loc_0be0ea:
    lda $14d7
    and #$01
    beq loc_0be0f5
    jml loc_0be12f

loc_0be0f5:
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$50
    sta $1549
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$04
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be123
    jml loc_0be1e2

loc_0be123:
    lda #$35
    jsl sub_03b7f9
    inc $1523
    brl loc_0be1e2

loc_0be12f:
    lda #$f7
    sta $1545
    lda #$03
    sta $1547
    lda #$50
    sta $1549
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$04
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be15d
    jml loc_0be1e2

loc_0be15d:
    inc $1523
    lda #$08
    sta $1545
    lda #$03
    sta $1547
    lda #$50
    sta $1549
    lda #$04
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be17e
    jml loc_0be1e2

loc_0be17e:
    inc $1523
    lda #$34
    jsl sub_03b7f9
    brl loc_0be1e2

loc_0be18a:
    lda #$f7
    sta $1545
    lda #$03
    sta $1547
    lda #$0a
    sta $1549
    lda #$00
    sta $154c
    lda #$00
    sta $154b
    stz $154d
    stz $154e
    lda #$3e
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be1b8
    jml loc_0be1e2

loc_0be1b8:
    inc $1523
    lda #$08
    sta $1545
    lda #$03
    sta $1547
    lda #$0a
    sta $1549
    lda #$3e
    jsl sub_1fd146
    cpy #$0000
    bne loc_0be1d9
    jml loc_0be1e2

loc_0be1d9:
    inc $1523
    lda #$36
    jsl sub_03b7f9

loc_0be1e2:
    bra loc_0be1ee

loc_0be1e4:
    lda #$03
    sta $1524
    lda #$01
    sta $1525

loc_0be1ee:
    lda $14db
    cmp #$03
    beq loc_0be1f9
    jml loc_0be214

loc_0be1f9:
    rep #$20
.a16
    lda $151b
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $151d
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $151f
    sta $10,x
    sep #$20

loc_0be214:
.a8
    rts
    stz $1fc7
    lda $1f0c
    bne loc_0be226
    lda #$01
    sta $1f0c
    jsl sub_02f7a2

loc_0be226:
    ldy $156b
    sty $1238
    jsr sub_0beb28
    ldy $1567
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$00
    sta $7e1cd8,x
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $0016,y
    sep #$20
.a8
    lda #$00
    sta $0018,y
    jsl sub_1fd464
    lda $001e,y
    ora #$01
    sta $001e,y
    lda $0009,y
    and #$f7
    sta $0009,y
    ldy $1563
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$00
    sta $7e1cd8,x
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $0016,y
    sep #$20
.a8
    lda #$00
    sta $0018,y
    jsl sub_1fd464
    lda $001e,y
    ora #$01
    sta $001e,y
    lda $0009,y
    and #$f7
    sta $0009,y
    ldy $1565
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $7e1cd6,x
    sep #$20
.a8
    lda #$00
    sta $7e1cd8,x
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $0016,y
    sep #$20
.a8
    lda #$00
    sta $0018,y
    jsl sub_1fd464
    lda $001e,y
    ora #$01
    sta $001e,y
    lda $0009,y
    and #$f7
    sta $0009,y
    lda #$0a
    sta $2a,x
    lda #$00
    sta $2b,x
    lda $2e,x
    ora #$40
    sta $2e,x
    lda $14db
    cmp #$03
    beq loc_0be2ff
    jml loc_0be33e

loc_0be2ff:
    lda #$11
    sta $1f47
    stz $1f46
    lda $14d1
    and #$f7
    sta $14d1
    lda #$03
    jsl sub_03b7f9
    lda $14d1
    ora #$08
    sta $14d1
    lda $14d7
    ora #$80
    sta $14d7
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$04
    sta $14db
    rep #$20
.a16
    lda #$cc91
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    rtl

loc_0be33e:
    phx
    ldx $1563
    cpx #$0000
    bne loc_0be34b
    jml loc_0be363

loc_0be34b:
    ldy $26,x
    cpy #$0000
    bne loc_0be356
    jml loc_0be363

loc_0be356:
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    jsl sub_1fd540

loc_0be363:
    ldx $1565
    cpx #$0000
    bne loc_0be36f
    jml loc_0be387

loc_0be36f:
    ldy $26,x
    cpy #$0000
    bne loc_0be37a
    jml loc_0be387

loc_0be37a:
    rep #$20
.a16
    lda #$0000
    sta $26,x
    sep #$20
.a8
    jsl sub_1fd540

loc_0be387:
    plx
    lda $14d0
    ora #$02
    sta $14d0
    lda $1ffd
    cmp #$01
    beq loc_0be39b
    jml loc_0be3ab

loc_0be39b:
    lda $16d6
    cmp #$01
    beq loc_0be3a6
    jml loc_0be3ab

loc_0be3a6:
    lda #$2a
    sta $14ec

loc_0be3ab:
    lda $1e,x
    and #$fe
    sta $1e,x
    rep #$20
.a16
    lda #$e41b
    sta $16,x
    sep #$20
.a8
    lda #$0b
    sta $18,x
    lda #$0b
    sta $1cd5,x
    lda #$0b
    sta $1cd2,x
    rep #$20
.a16
    lda #$e627
    sta $1cd3,x
    lda #$e62b
    sta $1cd0,x
    sep #$20
.a8
    lda #$00
    sta $22,x
    lda $14d7
    and #$80
    beq loc_0be3e7
    jml loc_0be40d

loc_0be3e7:
    lda $14d7
    ora #$80
    sta $14d7
    lda $14d1
    and #$f7
    sta $14d1
    lda #$03
    jsl sub_03b7f9
    lda $14d1
    ora #$08
    sta $14d1
    lda #$11
    sta $1f47
    stz $1f46

loc_0be40d:
    lda $1e,x
    and #$ef
    sta $1e,x
    lda $14d6
    ora #$60
    sta $14d6
    rep #$20
.a16
    lda $c5
    sta $14fc
    sep #$20
.a8
    lda $22,x
    clc
    adc #$01
    sta $22,x
    lda $22,x
    cmp #$3c
    bne loc_0be435
    jml loc_0be62b

loc_0be435:
    lda $22,x
    cmp #$0f
    bmi loc_0be43f
    jml loc_0be454

loc_0be43f:
    lda $15bb
    and #$01
    beq loc_0be44a
    jml loc_0be454

loc_0be44a:
    lda $1d,x
    ora #$02
    sta $1d,x
    jml loc_0be478

loc_0be454:
    lda $14da
    and #$02
    bne loc_0be45f
    jml loc_0be478

loc_0be45f:
    lda $08,x
    and #$40
    beq loc_0be469
    jml loc_0be478

loc_0be469:
    lda $15bb
    and #$03
    beq loc_0be474
    jml loc_0be478

loc_0be474:
    jsl sub_068ea8

loc_0be478:
    lda $14da
    and #$01
    bne loc_0be483
    jml loc_0be51f

loc_0be483:
    lda $14da
    and #$04
    bne loc_0be48e
    jml loc_0be4ab

loc_0be48e:
    rep #$20
.a16
    lda $0e,x
    cmp #$ffec
    sep #$20
.a8
    bpl loc_0be49d
    jml loc_0be4ab

loc_0be49d:
    jsl sub_068c31
    rep #$20
.a16
    lda #$0014
    sta $000e,y
    sep #$20

loc_0be4ab:
.a8
    rep #$20
.a16
    lda $0e,x
    cmp #$0000
    sep #$20
.a8
    bmi loc_0be4ba
    jml loc_0be536

loc_0be4ba:
    lda $1e,x
    and #$ef
    sta $1e,x
    lda $15bb
    and #$01
    beq loc_0be4cb
    jml loc_0be529

loc_0be4cb:
    rep #$20
.a16
    lda #$1388
    cmp $1230
    beq loc_0be518
    sec
    sbc $1230
    cmp #$0000
    bmi loc_0be4e8
    cmp #$0010
    bpl loc_0be4f0
    lda #$0010
    bra loc_0be4f0

loc_0be4e8:
    cmp #$fff0
    bmi loc_0be4f0
    lda #$fff0

loc_0be4f0:
    cmp #$8000
    ror a
    bpl loc_0be4f9
    adc #$0000

loc_0be4f9:
    cmp #$8000
    ror a
    bpl loc_0be502
    adc #$0000

loc_0be502:
    cmp #$8000
    ror a
    bpl loc_0be50b
    adc #$0000

loc_0be50b:
    cmp #$8000
    ror a
    bpl loc_0be514
    adc #$0000

loc_0be514:
    clc
    adc $1230

loc_0be518:
    sta $1230
    sep #$20
.a8
    bra loc_0be529

loc_0be51f:
    rep #$20
.a16
    lda #$0000
    sta $1230
    sep #$20

loc_0be529:
.a8
    lda $1508
    clc
    adc #$04
    sta $1508
    jml loc_0be569

loc_0be536:
    rep #$20
.a16
    lda #$f830
    sta $1230
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $0e,x
    sep #$20
.a8
    lda $1e,x
    and #$10
    beq loc_0be553
    jml loc_0be569

loc_0be553:
    lda $1e,x
    ora #$10
    sta $1e,x
    jsl sub_0bac5e
    jsl sub_0bac5e
    jsl sub_0bac5e
    jsl sub_0bac5e

loc_0be569:
    lda $15bb
    and #$03
    beq loc_0be574
    jml loc_0be58f

loc_0be574:
    rep #$20
.a16
    lda $1509
    cmp #$0000
    beq loc_0be58a
    bmi loc_0be586
    sec
    sbc #$0001
    bra loc_0be58a

loc_0be586:
    clc
    adc #$0001

loc_0be58a:
    sta $1509
    sep #$20

loc_0be58f:
.a8
    lda $1231
    sta $12,x
    lda $1233
    sta $13,x
    lda $1235
    sta $14,x
    lda $1509
    sta $15,x
    lda $14,x
    clc
    adc $1508
    sta $14,x
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    lda $14da
    and #$02
    bne loc_0be5c8
    jml loc_0be610

loc_0be5c8:
    rep #$20
.a16
    lda $0e,x
    cmp $14f8
    beq loc_0be60b
    sec
    sbc $14f8
    cmp #$0000
    bmi loc_0be5e4
    cmp #$0008
    bpl loc_0be5ec
    lda #$0008
    bra loc_0be5ec

loc_0be5e4:
    cmp #$fff8
    bmi loc_0be5ec
    lda #$fff8

loc_0be5ec:
    cmp #$8000
    ror a
    bpl loc_0be5f5
    adc #$0000

loc_0be5f5:
    cmp #$8000
    ror a
    bpl loc_0be5fe
    adc #$0000

loc_0be5fe:
    cmp #$8000
    ror a
    bpl loc_0be607
    adc #$0000

loc_0be607:
    clc
    adc $14f8

loc_0be60b:
    sta $14f8
    sep #$20

loc_0be610:
.a8
    rep #$20
.a16
    lda #$0000
    sta $2f,x
    sep #$20
.a8
    jsl sub_1fc7bb
    rep #$20
.a16
    lda $10,x
    sta $14fa
    sep #$20
.a8
    rtl
    jml loc_0689a3

loc_0be62b:
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0be63f
    jml loc_0be698

loc_0be63f:
    lda $001f,y
    and #$f7
    sta $001f,y
    lda $0020,y
    ora #$01
    sta $0020,y
    sty $1236
    sty $1238
    sty $159e
    sty $15a2
    jsl sub_1fdad9
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
    phx
    tyx
    ply
    jsl sub_1fc7bb
    phx
    tyx
    ply
    rep #$20
.a16
    lda #$0000
    sta $0016,y
    sep #$20
.a8
    lda #$00
    sta $0018,y
    sty $16a9
    rep #$20
.a16
    lda #$00bc
    sta $16ab
    sep #$20

loc_0be698:
.a8
    jsl sub_1fdb45
    rep #$20
.a16
    lda #$f45f
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
    lda #$f45f
    sta $1cd3,x
    lda #$f45f
    sta $1cd0,x
    sep #$20
.a8
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $2a,x
    rep #$20
.a16
    lda #$aca1
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0be6e1
    jml loc_0be6f4

loc_0be6e1:
    jsl sub_1fdad9
    rep #$20
.a16
    lda #$f89c
    sta $0016,y
    sep #$20
.a8
    lda #$06
    sta $0018,y

loc_0be6f4:
    lda $14d1
    and #$f7
    sta $14d1
    lda #$03
    jsl sub_03b7f9
    lda $14d1
    ora #$08
    sta $14d1
    lda $14d0
    ora #$40
    sta $14d0
    dec $16ec
    bne loc_0be723
    lda #$01
    sta $15b6
    lda #$14
    sta $155c
    bra loc_0be728

loc_0be723:
    lda #$14
    sta $155c

loc_0be728:
    rtl
    lda $14d8
    and #$08
    beq loc_0be734
    jml loc_0be876

loc_0be734:
    inc $14f3
    lda $14d7
    and #$02
    bne loc_0be742
    jml loc_0be755

loc_0be742:
    lda #$14
    jsl sub_03b7f9
    ldy $1b,x
    lda $002a,y
    cmp #$ff
    beq loc_0be755
    jml loc_0be876

loc_0be755:
    lda $1f,x
    and #$20
    beq loc_0be75f
    jml loc_0be876

loc_0be75f:
    lda $1501
    bne loc_0be768
    jml loc_0be804

loc_0be768:
    ldy $1b,x
    lda $002e,y
    and #$08
    bne loc_0be775
    jml loc_0be804

loc_0be775:
    lda $002a,y
    cmp #$ff
    bne loc_0be780
    jml loc_0be804

loc_0be780:
    phx
    tyx
    jsl sub_02fc58
    and #$3f
    sta $12,x
    lda $12,x
    sec
    sbc #$1f
    sta $12,x
    lda #$3c
    sta $15,x
    jsl sub_02fc58
    and #$1f
    sta $13,x
    jsl sub_02fc58
    cmp #$7f
    bcs loc_0be7a9
    jml loc_0be7b3

loc_0be7a9:
    lda $13,x
    sec
    sbc #$18
    sta $13,x
    brl loc_0be7ba

loc_0be7b3:
    lda $13,x
    clc
    adc #$18
    sta $13,x

loc_0be7ba:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fc7bb
    jsl sub_1fc7bb
    jsl sub_1fc7bb
    lda $1d,x
    and #$7f
    sta $1d,x
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$9c4b
    sta $16,x
    sep #$20
.a8
    lda #$06
    sta $18,x
    lda #$1e
    sta $0a,x
    lda #$14
    jsl sub_03b7f9
    plx
    jml loc_0be876

loc_0be804:
    lda $35,x
    and #$01
    bne loc_0be80e
    jml loc_0be82a

loc_0be80e:
    ldy $1567
    lda $001d,y
    ora #$80
    sta $001d,y
    lda $001d,y
    ora #$02
    sta $001d,y
    rep #$20
.a16
    lda $1b,x
    sta $001b,y
    sep #$20

loc_0be82a:
.a8
    lda $35,x
    and #$02
    bne loc_0be834
    jml loc_0be850

loc_0be834:
    ldy $1563
    lda $001d,y
    ora #$80
    sta $001d,y
    lda $001d,y
    ora #$02
    sta $001d,y
    rep #$20
.a16
    lda $1b,x
    sta $001b,y
    sep #$20

loc_0be850:
.a8
    lda $35,x
    and #$04
    bne loc_0be85a
    jml loc_0be876

loc_0be85a:
    ldy $1565
    lda $001d,y
    ora #$80
    sta $001d,y
    lda $001d,y
    ora #$02
    sta $001d,y
    rep #$20
.a16
    lda $1b,x
    sta $001b,y
    sep #$20

loc_0be876:
.a8
    lda #$00
    sta $35,x
    lda $1d,x
    and #$7f
    sta $1d,x
    jml loc_1fdc25

sub_0be884:
    jsr sub_0bd33a
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsr sub_0bea9a
    jsl sub_1fc7bb
    jsr sub_0bdf21
    jsr sub_0bdf6c
    jsr sub_0be9d0
    rts

sub_0be8aa:
    jsr sub_0bd33a
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    rep #$20
.a16
    lda $31,x
    sta $14c5
    cmp #$8000
    ror a
    cmp #$8000
    ror a
    sta $02
    cmp #$8000
    ror a
    clc
    adc $02
    clc
    adc $14c5
    sta $31,x
    sep #$20
.a8
    jsr sub_0bea9a
    jsl sub_1fc7bb
    jsr sub_0bdf21
    jsr sub_0bdf6c
    jsr sub_0be9d0
    rts

loc_0be8f0:
    jsr sub_0bd33a
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsr sub_0bea9a
    jsl sub_1fc7bb
    jsr sub_0bdf6c
    jsr sub_0be9d0
    rts
    .db $20,$3a,$d3,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6
    .db $15,$22,$a7,$d5,$1f,$c2,$20,$b5,$2f,$22,$a8,$d4,$1f,$95,$2f,$b5
    .db $31,$c9,$00,$80,$6a,$10,$03,$69,$00,$00,$95,$31,$e2,$20,$20,$9a
    .db $ea,$22,$bb,$c7,$1f,$20,$21,$df,$20,$6c,$df,$20,$d0,$e9,$60,$20
    .db $3a,$d3,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6,$15
    .db $22,$a7,$d5,$1f,$c2,$20,$b5,$2f,$22,$a8,$d4,$1f,$95,$2f,$b5,$31
    .db $c9,$00,$80,$6a,$10,$03,$69,$00,$00,$95,$31,$e2,$20,$20,$9a,$ea
    .db $22,$bb,$c7,$1f,$20,$21,$df,$20,$6c,$df,$20,$d0,$e9,$60,$20,$3a
    .db $d3,$b5,$15,$85,$7e,$b5,$13,$8d,$a7,$15,$b5,$12,$8d,$a6,$15,$22
    .db $a7,$d5,$1f,$c2,$20,$b5,$2f,$22,$a8,$d4,$1f,$95,$2f,$b5,$31,$c9
    .db $00,$80,$6a,$10,$03,$69,$00,$00,$95,$31,$e2,$20,$20,$9a,$ea,$22
    .db $bb,$c7,$1f,$20,$21,$df,$20,$6c,$df,$20,$d0,$e9,$60

sub_0be9d0:
    sep #$20
    lda $14dd
    and #$08
    beq loc_0be9dd
    jml loc_0bea56

loc_0be9dd:
    lda $1202
    and #$04
    bne loc_0be9e8
    jml loc_0be9f3

loc_0be9e8:
    lda $14df
    and #$40
    bne loc_0be9f3
    jml loc_0be9fb

loc_0be9f3:
    lda $1fc7
    and #$fe
    sta $1fc7

loc_0be9fb:
    lda $1202
    and #$08
    bne loc_0bea06
    jml loc_0bea11

loc_0bea06:
    lda $14df
    and #$80
    bne loc_0bea11
    jml loc_0bea19

loc_0bea11:
    lda $1fc7
    and #$fd
    sta $1fc7

loc_0bea19:
    lda $1202
    and #$02
    bne loc_0bea24
    jml loc_0bea2f

loc_0bea24:
    lda $14df
    and #$01
    bne loc_0bea2f
    jml loc_0bea37

loc_0bea2f:
    lda $1fc7
    and #$fb
    sta $1fc7

loc_0bea37:
    lda $1202
    and #$01
    bne loc_0bea42
    jml loc_0bea4d

loc_0bea42:
    lda $14df
    and #$02
    bne loc_0bea4d
    jml loc_0bea55

loc_0bea4d:
    lda $1fc7
    and #$f7
    sta $1fc7

loc_0bea55:
    rts

loc_0bea56:
    stz $1fc7
    rts
    .db $20,$5e,$ea,$6b,$c2,$20,$a9,$a1,$ac,$8d,$c5,$14,$e2,$20,$22,$4b
    .db $d5,$1f,$b0,$04,$5c,$99,$ea,$0b,$c2,$20,$b5,$04,$99,$04,$00,$e2
    .db $20,$22,$d9,$da,$1f,$22,$01,$db,$1f,$b9,$1e,$00,$09,$01,$99,$1e
    .db $00,$b9,$1d,$00,$09,$08,$99,$1d,$00,$b5,$20,$09,$08,$95,$20,$60

sub_0bea9a:
    phb
    lda #$00
    pha
    plb
    lda $2f,x
    sta $03
    stz $02
    lda $31,x
    sta $09
    stz $08
    lda $14e3
    sta $3a
    phx
    sep #$10
.i8
    lda $02
    sta $63
    lda $03
    sta $64
    lda $3a
    sta $65
    jsl sub_02fc70
    lda $66
    sta $02
    lda $67
    sta $03
    lda $08
    sta $63
    lda $09
    sta $64
    lda $3a
    sta $65
    jsl sub_02fc70
    lda $66
    sta $08
    lda $67
    sta $09
    rep #$30
.a16
.i16
    plx
    lda $02
    cmp #$8000
    ror a
    bpl loc_0beaf1
    adc #$0000

loc_0beaf1:
    cmp #$8000
    ror a
    bpl loc_0beafa
    adc #$0000

loc_0beafa:
    cmp #$8000
    ror a
    bpl loc_0beb03
    adc #$0000

loc_0beb03:
    sta $2f,x
    lda $08
    cmp #$8000
    ror a
    bpl loc_0beb10
    adc #$0000

loc_0beb10:
    cmp #$8000
    ror a
    bpl loc_0beb19
    adc #$0000

loc_0beb19:
    cmp #$8000
    ror a
    bpl loc_0beb22
    adc #$0000

loc_0beb22:
    sta $31,x
    sep #$20
.a8
    plb
    rts

sub_0beb28:
    sep #$20
    lda $14d6
    rep #$20
.a16
    and #$0018
    beq loc_0beb6b
    bit #$0008
    beq loc_0beb4d
    bit #$0010
    bne loc_0beb5c
    lda #$0001
    sta $702b26
    lda $7e3188
    sta $04,x
    bra loc_0beb78

loc_0beb4d:
    lda #$0002
    sta $702b26
    lda $7e318a
    sta $04,x
    bra loc_0beb78

loc_0beb5c:
    lda #$0003
    sta $702b26
    lda $7e318c
    sta $04,x
    bra loc_0beb78

loc_0beb6b:
    lda #$0000
    sta $702b26
    lda $7e3186
    sta $04,x

loc_0beb78:
    sep #$20
.a8
    lda $14db
    cmp #$03
    beq loc_0beb85
    jml loc_0beb8e

loc_0beb85:
    rep #$20
.a16
    lda #$d2cc
    sta $04,x
    sep #$20

loc_0beb8e:
.a8
    rts
    .incbin "data/05eb8f-060000.bin"
