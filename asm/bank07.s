.rombank $07

    .db $a9,$7e,$48,$ab,$c2,$20,$a9,$17,$80,$95,$16,$e2,$20,$a9,$07,$95
    .db $18,$b5,$1e,$09,$01,$95,$1e,$b5,$22,$d0,$04,$5c,$22,$80,$07,$d6
    .db $22,$6b,$c2,$20,$a9,$41,$80,$95,$16,$e2,$20,$a9,$07,$95,$18,$22
    .db $ee,$ee,$06,$c2,$20,$b9,$0e,$00,$18,$69,$c4,$ff,$99,$0e,$00,$e2
    .db $20,$b5,$23,$c9,$06,$d0,$04,$5c,$58,$80,$07,$ad,$bb,$15,$29,$01
    .db $f0,$04,$5c,$58,$80,$07,$f6,$23,$b5,$12,$c9,$40,$f0,$06,$30,$04
    .db $5c,$6c,$80,$07,$b5,$12,$18,$7d,$23,$00,$95,$12,$6b
.cpu
.a8
.i16
    lda $09,x
    and #$f7
    sta $09,x
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$8092
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda #$46
    sta $0a,x
    lda #$1e
    sta $15,x
    lda #$c0
    sta $14,x
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    cmp $0010,x
    sep #$20
.a8
    bmi loc_0780a5
    jml loc_07810c

loc_0780a5:
    lda $1e,x
    and #$10
    beq loc_0780af
    jml loc_0780e9

loc_0780af:
    lda $1e,x
    ora #$10
    sta $1e,x
    stx $158b
    rep #$20
.a16
    lda #$b219
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0780cc
    jml loc_0780e3

loc_0780cc:
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

loc_0780e3:
    lda #$32
    jsl sub_03b7f9

loc_0780e9:
    lda $14,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $14,x
    lda $15bb
    and #$03
    beq loc_078100
    jml loc_07810c

loc_078100:
    lda $12,x
    sta $3a
    lda #$c0
    jsl sub_1fd8f7
    sta $12,x

loc_07810c:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    dec $0a,x
    beq loc_07812e
    jml loc_078132

loc_07812e:
    jsl sub_1fd501

loc_078132:
    rtl
    .db $5c,$5f,$f4,$06
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$1e
    sta $0a,x
    rep #$20
.a16
    lda #$815e
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $20,x
    ora #$08
    sta $20,x
    lda #$0b
    sta $23,x
    dec $22,x
    beq loc_078166
    jml loc_07819d

loc_078166:
    lda #$01
    sta $22,x
    lda $23,x
    bne loc_078172
    jml loc_078179

loc_078172:
    dec $23,x
    lda #$b1
    brl loc_07817b

loc_078179:
    lda #$51

loc_07817b:
    sta $7e1ce8,x
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0032
    sta $10,x
    sep #$20
.a8
    lda $20,x
    and #$f7
    sta $20,x
    dec $0a,x
    beq loc_078199
    jml loc_07819d

loc_078199:
    jsl sub_1fd501

loc_07819d:
    rtl
    .incbin "data/03819e-038673.bin"
    rep #$20
.a16
    lda #$86ad
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    jsl sub_02fc58
    and #$0f
    sta $24,x
    jsl sub_02fc58
    and #$07
    sta $25,x
    lda $23,x
    asl a
    sta $23,x
    lda $14d0
    and #$ef
    sta $14d0
    lda $1d,x
    ora #$08
    sta $1d,x
    lda #$28
    sta $0a,x
    lda $09,x
    and #$f7
    sta $09,x
    lda $14d0
    and #$10
    bne loc_0786b8
    jml loc_0786e4

loc_0786b8:
    lda $22,x
    bpl loc_0786c0
    jml loc_0786d8

loc_0786c0:
    dec $22,x
    beq loc_0786c8
    jml loc_0786e4

loc_0786c8:
    lda #$01
    sta $22,x
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0032
    sta $10,x
    sep #$20

loc_0786d8:
.a8
    dec $0a,x
    beq loc_0786e0
    jml loc_0786e4

loc_0786e0:
    jsl sub_1fd501

loc_0786e4:
    lda $22,x
    cmp #$02
    beq loc_0786ee
    jml loc_078722

loc_0786ee:
    stx $158b
    rep #$20
.a16
    lda #$b219
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_078705
    jml loc_07871c

loc_078705:
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

loc_07871c:
    lda #$32
    jsl sub_03b7f9

loc_078722:
    jsl sub_06e915
    rep #$20
.a16
    lda $0e,x
    clc
    adc $0026,x
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0041
    sta $10,x
    sep #$20
.a8
    rtl
    lda $20,x
    ora #$08
    sta $20,x
    rep #$20
.a16
    lda #$8792
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    rep #$20
.a16
    lda $0c,x
    clc
    adc #$fb50
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    clc
    adc #$f830
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0dac
    sta $10,x
    sep #$20
.a8
    lda #$80
    sta $13,x
    lda #$04
    sta $12,x
    lda #$5a
    sta $22,x
    lda $14d0
    and #$f7
    sta $14d0
    lda $14d8
    and #$fd
    sta $14d8
    rep #$20
.a16
    lda $150d
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda #$ffe2
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $1511
    sta $151f
    sep #$20
.a8
    lda $1cdc,x
    cmp #$00
    beq loc_0787bb
    jml loc_07883b

loc_0787bb:
    rep #$20
.a16
    lda $151b
    clc
    adc #$fe70
    sta $151b
    sep #$20
.a8
    rep #$20
.a16
    lda $151d
    clc
    adc #$fd44
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $151f
    clc
    adc #$fd44
    sta $151f
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda $151b
    jsl sub_1fd73e
    sta $0c,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda $151d
    jsl sub_1fd73e
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    sta $3a
    lda $151f
    jsl sub_1fd73e
    sta $10,x
    sep #$20
.a8
    dec $22,x
    beq loc_078820
    jml loc_07883b

loc_078820:
    lda $1cdc,x
    inc a
    sta $1cdc,x
    lda #$50
    sta $22,x
    lda $14d0
    ora #$10
    sta $14d0
    lda $14d8
    ora #$02
    sta $14d8

loc_07883b:
    lda $1cdc,x
    cmp #$01
    beq loc_078846
    jml loc_0788c5

loc_078846:
    dec $22,x
    beq loc_07884e
    jml loc_078856

loc_07884e:
    lda $14d0
    ora #$08
    sta $14d0

loc_078856:
    lda $14d0
    and #$fe
    sta $14d0
    rep #$20
.a16
    lda $151d
    clc
    adc #$0014
    sta $151d
    sep #$20
.a8
    rep #$20
.a16
    lda $151f
    clc
    adc #$fed4
    sta $151f
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $3a
    lda $151d
    jsl sub_1fd6f0
    sta $0e,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    sta $3a
    lda $151b
    jsl sub_1fd6ab
    sta $0c,x
    sep #$20
.a8
    bcc loc_0788a2
    jml loc_0788a5

loc_0788a2:
    brl loc_0788b4

loc_0788a5:
    rep #$20
.a16
    lda $10,x
    clc
    adc #$000a
    sta $10,x
    sep #$20
.a8
    brl loc_0788c5

loc_0788b4:
    rep #$20
.a16
    lda $10,x
    sta $3a
    lda $151f
    jsl sub_1fd6f0
    sta $10,x
    sep #$20

loc_0788c5:
.a8
    rep #$20
.a16
    lda $10,x
    clc
    adc #$0041
    sta $10,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0c,x
    sta $c1
    sep #$20
.a8
    rep #$20
.a16
    lda $0e,x
    sta $c3
    sep #$20
.a8
    rep #$20
.a16
    lda $10,x
    sta $c5
    sep #$20
.a8
    rtl
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$10
    sta $12,x
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$8933
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $13,x
    sta $24,x
    lda $12,x
    sta $25,x
    lda #$21
    sta $22,x
    lda #$10
    sta $28,x
    rep #$20
.a16
    lda #$e60c
    sta $1ce4,x
    sep #$20
.a8
    lda #$78
    sta $15,x
    lda #$01
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$01
    sta $7e1ce9,x
    lda $1cdc,x
    cmp #$00
    beq loc_07893e
    jml loc_078961

loc_07893e:
    lda $22,x
    bne loc_078946
    jml loc_1fdb66

loc_078946:
    dec $22,x
    lda $14,x
    clc
    adc #$01
    sta $14,x
    lda $15bb
    and #$03
    beq loc_07895a
    jml loc_078961

loc_07895a:
    lda $12,x
    clc
    adc #$ff
    sta $12,x

loc_078961:
    lda $1cdc,x
    cmp #$01
    beq loc_07896c
    jml loc_078989

loc_07896c:
    lda #$14
    sta $28,x
    jsl sub_06eeee
    lda $1d,x
    ora #$02
    sta $1d,x
    lda $001e,y
    and #$f7
    sta $001e,y
    lda $1cdc,x
    inc a
    sta $1cdc,x

loc_078989:
    lda $1cdc,x
    cmp #$02
    beq loc_078994
    jml loc_078a5d

loc_078994:
    lda $28,x
    bne loc_07899c
    jml loc_06f157

loc_07899c:
    dec $28,x
    lda $15bb
    clc
    adc $123a
    and #$00
    beq loc_0789ad
    jml loc_078a39

loc_0789ad:
    jsl sub_068ea8
    rep #$20
.a16
    lda #$0028
    sta $002f,y
    sep #$20
.a8
    jsl sub_02fc58
    and #$7f
    sta $1538
    lda #$00
    sta $1539
    rep #$20
.a16
    lda $1538
    sec
    sbc #$003f
    sta $1538
    sep #$20
.a8
    rep #$20
.a16
    lda $000c,y
    clc
    adc $1538
    sta $000c,y
    sep #$20
.a8
    jsl sub_02fc58
    and #$7f
    sta $1538
    lda #$00
    sta $1539
    rep #$20
.a16
    lda $1538
    sec
    sbc #$003f
    sta $1538
    sep #$20
.a8
    rep #$20
.a16
    lda $000e,y
    clc
    adc $1538
    sta $000e,y
    sep #$20
.a8
    jsl sub_02fc58
    and #$7f
    sta $1538
    lda #$00
    sta $1539
    rep #$20
.a16
    lda $1538
    sec
    sbc #$003f
    sta $1538
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    clc
    adc $1538
    sta $0010,y
    sep #$20

loc_078a39:
.a8
    lda $13,x
    sta $3a
    lda #$40
    jsl sub_1fd8f7
    sta $13,x
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $12,x
    lda $14,x
    sta $3a
    lda #$20
    jsl sub_1fd8bd
    sta $14,x

loc_078a5d:
    lda $24,x
    sta $3a
    lda $13,x
    jsl sub_1fd938
    sta $24,x
    lda $25,x
    sta $3a
    lda $12,x
    jsl sub_1fd938
    sta $25,x
    lda $15,x
    sta $7e
    lda $24,x
    sta $15a7
    lda $25,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    rtl
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$10
    sta $12,x
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$8acf
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $13,x
    sta $24,x
    lda $12,x
    sta $25,x
    lda #$1e
    sta $22,x
    lda #$78
    sta $15,x
    lda #$08
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$46
    sta $0a,x
    lda #$01
    sta $7e1ce9,x
    dec $0a,x
    beq loc_078ad7
    jml loc_078adb

loc_078ad7:
    jsl sub_1fd501

loc_078adb:
    lda $1cdc,x
    cmp #$00
    beq loc_078ae6
    jml loc_078b09

loc_078ae6:
    lda $22,x
    bne loc_078aee
    jml loc_1fdb66

loc_078aee:
    dec $22,x
    lda $15bb
    and #$03
    beq loc_078afb
    jml loc_078b09

loc_078afb:
    lda $12,x
    clc
    adc #$ff
    sta $12,x
    lda $13,x
    clc
    adc #$01
    sta $13,x

loc_078b09:
    lda $1cdc,x
    cmp #$01
    beq loc_078b14
    jml loc_078b38

loc_078b14:
    lda $13,x
    sta $3a
    lda #$40
    jsl sub_1fd8f7
    sta $13,x
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $12,x
    lda $14,x
    sta $3a
    lda #$20
    jsl sub_1fd8bd
    sta $14,x

loc_078b38:
    brl loc_078a5d
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$10
    sta $12,x
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$8b7a
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $13,x
    sta $24,x
    lda $12,x
    sta $25,x
    lda #$1e
    sta $22,x
    lda #$78
    sta $15,x
    lda #$08
    sta $2a,x
    lda #$08
    sta $2b,x
    lda #$46
    sta $0a,x
    lda #$01
    sta $7e1ce9,x
    dec $0a,x
    beq loc_078b82
    jml loc_078b86

loc_078b82:
    jsl sub_1fd501

loc_078b86:
    lda $1cdc,x
    cmp #$00
    beq loc_078b91
    jml loc_078bb4

loc_078b91:
    lda $22,x
    bne loc_078b99
    jml loc_1fdb66

loc_078b99:
    dec $22,x
    lda $15bb
    and #$03
    beq loc_078ba6
    jml loc_078bb4

loc_078ba6:
    lda $12,x
    clc
    adc #$ff
    sta $12,x
    lda $13,x
    sec
    sbc #$01
    sta $13,x

loc_078bb4:
    lda $1cdc,x
    cmp #$01
    beq loc_078bbf
    jml loc_078be3

loc_078bbf:
    lda $13,x
    sta $3a
    lda #$c0
    jsl sub_1fd8f7
    sta $13,x
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $12,x
    lda $14,x
    sta $3a
    lda #$e0
    jsl sub_1fd8bd
    sta $14,x

loc_078be3:
    brl loc_078a5d
    rep #$20
.a16
    lda #$8bfd
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $09,x
    and #$f7
    sta $09,x
    lda #$23
    sta $0a,x
    dec $0a,x
    beq loc_078c05
    jml loc_078c09

loc_078c05:
    jsl sub_1fd501

loc_078c09:
    lda $15bb
    clc
    adc $123a
    and #$03
    beq loc_078c18
    jml loc_078c9e

loc_078c18:
    ldy $26,x
    lda #$ce
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    sty $154d
    stz $154c
    stz $154b
    lda #$0e
    jsl sub_1fd146
    cpy #$0000
    bne loc_078c40
    ldy $156b

loc_078c40:
    lda $0009,y
    and #$f7
    sta $0009,y
    lda #$3c
    sta $000a,y
    rep #$20
.a16
    lda $000c,y
    clc
    adc #$fea2
    sta $000c,y
    sep #$20
.a8
    ldy $26,x
    lda #$32
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    sty $154d
    stz $154c
    stz $154b
    lda #$0e
    jsl sub_1fd146
    cpy #$0000
    bne loc_078c83
    ldy $156b

loc_078c83:
    lda $0009,y
    and #$f7
    sta $0009,y
    lda #$3c
    sta $000a,y
    rep #$20
.a16
    lda $000c,y
    clc
    adc #$015e
    sta $000c,y
    sep #$20

loc_078c9e:
.a8
    jsl sub_1fdc69
    rtl
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda #$8d4e
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $09,x
    and #$f7
    sta $09,x
    rep #$20
.a16
    lda #$0000
    sta $2f,x
    lda #$0005
    sta $31,x
    lda #$000f
    sta $33,x
    sep #$20
.a8
    lda #$01
    sta $1cdf,x
    rep #$20
.a16
    lda #$e628
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_078ce8
    jml loc_078d08

loc_078ce8:
    lda #$01
    jsl sub_1fd56f
    rep #$20
.a16
    lda #$8dfb
    sta $0016,y
    sep #$20
.a8
    lda #$07
    sta $0018,y
    lda $002e,y
    ora #$10
    sta $002e,y
    brl loc_078d0c

loc_078d08:
    jml loc_1fbdee

loc_078d0c:
    lda #$01
    sta $1cdf,y
    rep #$20
.a16
    lda #$c8a0
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_078d25
    jml loc_078d45

loc_078d25:
    lda #$02
    jsl sub_1fd56f
    rep #$20
.a16
    lda #$8dfb
    sta $0016,y
    sep #$20
.a8
    lda #$07
    sta $0018,y
    lda $002e,y
    ora #$10
    sta $002e,y
    brl loc_078d49

loc_078d45:
    jml loc_1fbdee

loc_078d49:
    lda #$01
    sta $1cdf,y
    rep #$20
.a16
    lda $169c
    cmp #$00a0
    sep #$20
.a8
    bpl loc_078d5e
    jml loc_078db8

loc_078d5e:
    rep #$20
.a16
    lda $169c
    cmp #$00c8
    sep #$20
.a8
    bpl loc_078d6e
    jml loc_078d9c

loc_078d6e:
    rep #$20
.a16
    lda $169c
    cmp #$00e8
    sep #$20
.a8
    beq loc_078d80
    bmi loc_078d80
    jml loc_078dc6

loc_078d80:
    lda $15bb
    and #$03
    beq loc_078d8b
    jml loc_078dc6

loc_078d8b:
    rep #$20
.a16
    lda $169c
    clc
    adc #$0001
    sta $169c
    sep #$20
.a8
    brl loc_078dc6

loc_078d9c:
    lda $15bb
    and #$01
    beq loc_078da7
    jml loc_078dc6

loc_078da7:
    rep #$20
.a16
    lda $169c
    clc
    adc #$0001
    sta $169c
    sep #$20
.a8
    brl loc_078dc6

loc_078db8:
    rep #$20
.a16
    lda $169c
    clc
    adc #$0001
    sta $169c
    sep #$20

loc_078dc6:
.a8
    rep #$20
.a16
    lda $0e,x
    cmp #$fe34
    sep #$20
.a8
    bpl loc_078dd5
    jml loc_078df2

loc_078dd5:
    lda $15bb
    and #$03
    beq loc_078de0
    jml loc_078df2

loc_078de0:
    rep #$20
.a16
    lda $31,x
    sep #$20
.a8
    bne loc_078dec
    jml loc_078df2

loc_078dec:
    rep #$20
.a16
    dec $31,x
    sep #$20

loc_078df2:
.a8
    jsl sub_1fc7bb
    jsl sub_1fdc69
    rtl
    lda $1e,x
    ora #$01
    sta $1e,x
    ldy $06,x
    cpy #$0000
    bne loc_078e0c
    jml loc_078ec4

loc_078e0c:
    lda $1ce1,x
    sta $1532
    lda $1ce2,x
    sta $1534
    lda $1ce3,x
    sta $1536
    lda $1532
    sta $02
    sta $04
    bit #$80
    beq loc_078e2f
    lda #$ff
    sta $05
    bra loc_078e31

loc_078e2f:
    stz $05

loc_078e31:
    lda $1534
    sta $08
    sta $0a
    bit #$80
    beq loc_078e42
    lda #$ff
    sta $0b
    bra loc_078e44

loc_078e42:
    stz $0b

loc_078e44:
    lda $1536
    sta $90
    sta $15c2
    bit #$80
    beq loc_078e57
    lda #$ff
    sta $15c3
    bra loc_078e5a

loc_078e57:
    stz $15c3

loc_078e5a:
    lda $0014,y
    jsl sub_1fcc78
    lda $04
    sta $02
    lda $0a
    sta $08
    lda $15c2
    sta $90
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
    lda $04
    asl a
    asl a
    asl a
    asl a
    sta $04
    lda $0a
    asl a
    asl a
    asl a
    asl a
    sta $0a
    lda $15c2
    asl a
    asl a
    asl a
    asl a
    sta $15c2
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
    jsl sub_1fdb11

loc_078ec4:
    rtl
    rep #$20
.a16
    lda #$8f0c
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $1e,x
    ora #$01
    sta $1e,x
    jsl sub_02fc58
    and #$0f
    sta $12,x
    lda $12,x
    clc
    adc #$39
    sta $12,x
    jsl sub_02fc58
    sta $13,x
    jsl sub_02fc58
    sta $14,x
    lda #$0a
    sta $22,x
    lda #$3c
    sta $15,x
    lda #$3c
    sta $0a,x
    lda #$03
    sta $7e1ce9,x
    lda #$00
    ora #$80
    sta $1ce7,x
    lda $1ce7,x
    clc
    adc #$01
    bmi loc_078f17
    clc
    adc #$0c

loc_078f17:
    and #$7f
    cmp #$0c
    bcc loc_078f20
    sec
    sbc #$0c

loc_078f20:
    ora #$80
    sta $1ce7,x
    dec $0a,x
    beq loc_078f2d
    jml loc_078f31

loc_078f2d:
    jsl sub_1fd501

loc_078f31:
    dec $22,x
    beq loc_078f39
    jml loc_078f6f

loc_078f39:
    lda #$01
    sta $22,x
    lda $13,x
    sta $3a
    lda #$00
    jsl sub_1fd8bd
    sta $13,x
    lda $12,x
    sta $3a
    lda #$00
    jsl sub_1fd8bd
    sta $12,x
    lda $14,x
    sta $3a
    lda #$00
    jsl sub_1fd8f7
    sta $14,x
    lda #$78
    sta $14c5
    lda #$02
    jsl sub_1fd60d
    brl loc_078f76

loc_078f6f:
    lda $14,x
    clc
    adc #$06
    sta $14,x

loc_078f76:
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
    rep #$20
.a16
    lda #$8fc1
    sta $16,x
    sep #$20
.a8
    lda #$07
    sta $18,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$2d
    sta $15,x
    lda #$40
    sta $12,x
    lda #$1e
    sta $22,x
    lda #$06
    sta $23,x
    lda #$03
    sta $7e1ce9,x
    lda #$00
    ora #$80
    sta $1ce7,x
    lda $1ce7,x
    clc
    adc #$01
    bmi loc_078fcc
    clc
    adc #$0c

loc_078fcc:
    and #$7f
    cmp #$0c
    bcc loc_078fd5
    sec
    sbc #$0c

loc_078fd5:
    ora #$80
    sta $1ce7,x
    lda $1cdc,x
    cmp #$00
    beq loc_078fe5
    jml loc_078fff

loc_078fe5:
    lda $14,x
    clc
    adc #$06
    sta $14,x
    dec $22,x
    beq loc_078ff4
    jml loc_078fff

loc_078ff4:
    lda $1cdc,x
    inc a
    sta $1cdc,x
    lda #$2a
    sta $22,x

loc_078fff:
    lda $1cdc,x
    cmp #$01
    beq loc_07900a
    jml loc_079032

loc_07900a:
    lda $12,x
    clc
    adc #$04
    sta $12,x
    lda $13,x
    clc
    adc #$09
    sta $13,x
    lda $14,x
    clc
    adc #$06
    sta $14,x
    dec $22,x
    beq loc_079027
    jml loc_079032

loc_079027:
    lda $1cdc,x
    inc a
    sta $1cdc,x
    lda #$14
    sta $22,x

loc_079032:
    lda $1cdc,x
    cmp #$02
    beq loc_07903d
    jml loc_079162

loc_07903d:
    lda $14,x
    clc
    adc #$06
    sta $14,x
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_079055
    eor #$ffff
    inc a

loc_079055:
    cmp #$0032
    sep #$20
.a8
    bpl loc_079060
    jml loc_0790da

loc_079060:
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_07906e
    eor #$ffff
    inc a

loc_07906e:
    cmp #$03e8
    sep #$20
.a8
    bmi loc_079079
    jml loc_0790da

loc_079079:
    lda $15bb
    and #$03
    beq loc_079084
    jml loc_079162

loc_079084:
    lda #$00
    sta $1545
    lda #$00
    sta $1547
    lda #$00
    sta $1549
    jsl sub_02fc58
    and #$07
    sta $152c
    lda $152c
    sec
    sbc #$03
    sta $152c
    jsl sub_02fc58
    and #$07
    sta $152d
    lda $152d
    sec
    sbc #$03
    sta $152d
    lda $152c
    sta $154c
    lda $152d
    sta $154b
    stz $154d
    stz $154e
    sty $154d
    lda #$0e
    jsl sub_1fd146
    cpy #$0000
    bne loc_0790da
    ldy $156b

loc_0790da:
    ldy $1238
    rep #$20
.a16
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0790eb
    eor #$ffff
    inc a

loc_0790eb:
    cmp #$01f4
    sep #$20
.a8
    bpl loc_0790f6
    jml loc_079162

loc_0790f6:
    stz $1532
    jsl sub_1fd03e
.a16
    sep #$20
.a8
    xba
    cmp $12,x
    beq loc_07912a
    sec
    sbc $12,x
    cmp #$00
    bmi loc_079113
    cmp #$04
    bpl loc_079119
    lda #$04
    bra loc_079119

loc_079113:
    cmp #$fc
    bmi loc_079119
    lda #$fc

loc_079119:
    cmp #$80
    ror a
    bpl loc_079120
    adc #$00

loc_079120:
    cmp #$80
    ror a
    bpl loc_079127
    adc #$00

loc_079127:
    clc
    adc $12,x

loc_07912a:
    sta $12,x
    jsl sub_1fd021
.a16
    sep #$20
.a8
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_079160
    sec
    sbc $13,x
    cmp #$00
    bmi loc_079149
    cmp #$04
    bpl loc_07914f
    lda #$04
    bra loc_07914f

loc_079149:
    cmp #$fc
    bmi loc_07914f
    lda #$fc

loc_07914f:
    cmp #$80
    ror a
    bpl loc_079156
    adc #$00

loc_079156:
    cmp #$80
    ror a
    bpl loc_07915d
    adc #$00

loc_07915d:
    clc
    adc $13,x

loc_079160:
    sta $13,x

loc_079162:
    lda $15,x
    sta $7e
    lda $13,x
    sta $15a7
    lda $12,x
    sta $15a6
    jsl sub_1fd5a7
    jsl sub_1fc7bb
    jsl sub_1fdc69
    ldy $1238
    rep #$20
.a16
    lda $10,x
    cmp $0010,y
    sep #$20
.a8
    bmi loc_07918e
    jml loc_079193

loc_07918e:
    lda #$01
    sta $1ffc

loc_079193:
    rtl
    .incbin "data/039194-040000.bin"
