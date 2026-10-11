.rombank $00

    .incbin "data/000000-00799f.bin"
.cpu
.a8
.i16
    rep #$20
.a16
    lda #$f9c5
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    jsl sub_1fd41a
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $1f,x
    ora #$20
    sta $1f,x
    lda #$00
    ora #$80
    sta $1ce7,x
    lda $1e,x
    and #$10
    beq loc_00f9cf
    jml loc_00fa1b

loc_00f9cf:
    lda $1e,x
    and #$ef
    sta $1e,x
    lda $1ce7,x
    and #$7f
    cmp #$00
    beq loc_00f9e2
    jml loc_00f9e6

loc_00f9e2:
    jsl sub_03b731

loc_00f9e6:
    lda $1ce7,x
    clc
    adc #$01
    bmi loc_00f9f1
    clc
    adc #$08

loc_00f9f1:
    and #$7f
    cmp #$08
    bcc loc_00fa02
    lda #$08
    dec a
    ora #$80
    sta $1ce7,x
    jmp loc_00fa08

loc_00fa02:
    ora #$80
    sta $1ce7,x
    rtl

loc_00fa08:
    inc $22,x
    lda $22,x
    cmp #$0a
    bne loc_00fa1a
    lda #$00
    sta $22,x
    lda $1e,x
    ora #$10
    sta $1e,x

loc_00fa1a:
    rtl

loc_00fa1b:
    lda $1ce7,x
    and #$7f
    cmp #$00
    bne loc_00fa28
    jml loc_00fa53

loc_00fa28:
    lda $1ce7,x
    and #$7f
    cmp #$07
    beq loc_00fa35
    jml loc_00fa39

loc_00fa35:
    jsl sub_03b719

loc_00fa39:
    lda $1ce7,x
    clc
    adc #$ff
    bmi loc_00fa44
    clc
    adc #$08

loc_00fa44:
    and #$7f
    cmp #$08
    bcc loc_00fa4d
    sec
    sbc #$08

loc_00fa4d:
    ora #$80
    sta $1ce7,x
    rtl

loc_00fa53:
    inc $22,x
    lda $22,x
    cmp #$0a
    bne loc_00fa1a
    lda #$00
    sta $22,x
    brl loc_00f9cf

loc_00fa62:
    rep #$20
.a16
    lda #$faa4
    sta $16,x
    sep #$20
.a8
    lda #$00
    sta $18,x
    jsl sub_1fd41a
    lda $1f,x
    ora #$20
    sta $1f,x
    lda #$ff
    sta $2a,x
    lda #$0c
    sta $2b,x
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
    jsl sub_02fc58
    and #$0f
    sta $22,x
    lda $22,x
    sec
    sbc #$08
    sta $22,x
    rtl

loc_00faa5:
    rep #$20
.a16
    lda #$459f
    sta $28,x
    sep #$20
.a8
    lda #$02
    sta $2a,x
    lda #$0c
    sta $2b,x
    jml loc_048022

loc_00faba:
    rep #$20
.a16
    lda #$459b
    sta $28,x
    sep #$20
.a8
    lda #$02
    sta $2a,x
    lda #$0c
    sta $2b,x
    jml loc_048022
    .incbin "data/007acf-007f96.bin"

loc_00ff96:
.i8
    clc
    xce
    jml loc_1fbdb1

sub_00ff9c:
    bra loc_00ff96
    .db $40,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .db $ff,$ff,$53,$54,$41,$52,$20,$46,$4f,$58,$20,$20,$20,$20,$20,$20
    .db $20,$20,$20,$20,$20,$20,$20,$20,$13,$0a,$00,$01,$01,$02,$cf,$06
    .db $30,$f9,$ff,$ff,$ff,$ff,$9e,$ff,$9e,$ff,$9e,$ff,$08,$01,$00,$00
    .db $0c,$01,$ff,$ff,$ff,$ff,$9e,$ff,$00,$00,$9e,$ff,$9e,$ff,$9c,$ff
    .db $9e,$ff
