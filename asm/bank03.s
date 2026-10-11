.rombank $03

    .incbin "data/018000-01905f.bin"
.cpu
.a8
.i16
    sep #$20
    jsr sub_03ab12
    jsr sub_03ab95
    .db $6e,$db,$14,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $0e,$dc,$14,$00,$70,$00,$20
    jsr sub_03abfe
    .db $e0,$00,$7f,$e0,$00
    lda #$10
    sta $00
    lda $120e
    ora #$04
    sta $120e
    lda #$02
    sta $1785
    ldx #$8004
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$00
    sta $14db
    jsl sub_06ba91
    lda #$02
    sta $14dc
    lda #$08
    sta $1fe2
    rep #$20
.a16
    lda #$8fae
    sta $700050
    sep #$20
.a8
    rep #$10
    jsl sub_03ad94
    lda #$00
    sta $70021c
    rep #$20
.a16
    lda #$0000
    sta $195f
    sep #$20
.a8
    lda #$01
    sta $16c9
    lda $120e
    ora #$10
    sta $120e
    stz $194f
    stz $1950
    stz $18c2
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_0390fa:
    lda $00
    beq loc_039102
    cmp #$20
    bne loc_0390fa

loc_039102:
    rtl
    .db $5c,$ee,$bd,$1f,$5c,$ee,$bd,$1f
    sep #$20
    jsr sub_03ab12
    jsr sub_03ab95
    .db $ce,$fe,$14,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $e4,$81,$15,$00,$70,$00,$20
    jsr sub_03abfe
    .db $60,$03,$7f,$e0,$00
    lda #$03
    sta $1897
    jsl sub_02f492
    lda #$10
    sta $00
    rep #$20
.a16
    lda #$8fb6
    sta $700050
    sep #$20
.a8
    rep #$10
    lda $120e
    ora #$04
    sta $120e
    lda #$0f
    sta $1785
    lda #$00
    sta $1fe2
    rep #$20
.a16
    lda #$0000
    sta $195f
    sep #$20
.a8
    rep #$20
.a16
    lda #$00e8
    sta $169c
    sta $194d
    sep #$20
.a8
    jsl sub_03ad9f
    lda #$01
    sta $70021c
    stz $16c9
    stz $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_039197:
    lda $00
    beq loc_03919f
    cmp #$20
    bne loc_039197

loc_03919f:
    rtl
    sep #$20
    jsr sub_03ab12
    jsr sub_03ab95
    .db $ce,$fe,$14,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $e4,$81,$15,$00,$70,$00,$20
    jsr sub_03abfe
    .db $40,$06,$7f,$e0,$00
    lda #$02
    sta $1897
    jsl sub_02f492
    lda #$10
    sta $00
    rep #$20
.a16
    lda #$8fb6
    sta $700050
    sep #$20
.a8
    rep #$10
    lda $120e
    ora #$04
    sta $120e
    lda #$0f
    sta $1785
    lda #$00
    sta $1fe2
    rep #$20
.a16
    lda #$0000
    sta $195f
    sep #$20
.a8
    rep #$20
.a16
    lda #$00e8
    sta $169c
    sta $194d
    sep #$20
.a8
    jsl sub_03ad9f
    lda #$01
    sta $70021c
    stz $16c9
    stz $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8d
    sta $70004f
    lda $120e
    sta HDMAEN

loc_03922c:
    lda $00
    beq loc_039234
    cmp #$20
    bne loc_03922c

loc_039234:
    rtl
    sep #$20
    jsr sub_03ab12
    jsr sub_03ab95
    .db $ce,$fe,$14,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $e4,$81,$15,$00,$70,$00,$20
    jsr sub_03abfe
    .db $60,$03,$7f,$e0,$00
    lda #$03
    sta $1897
    jsl sub_02f492
    lda #$10
    sta $00
    ldx #$bb03
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$00
    sta $14db
    jsl sub_06ba91
    lda #$02
    sta $14dc
    rep #$20
.a16
    lda #$8fb6
    sta $700050
    sep #$20
.a8
    rep #$10
    lda $120e
    ora #$04
    sta $120e
    lda #$0f
    sta $1785
    lda #$00
    sta $1fe2
    rep #$20
.a16
    lda #$0000
    sta $195f
    sep #$20
.a8
    rep #$20
.a16
    lda #$00e8
    sta $169c
    sta $194d
    sep #$20
.a8
    jsl sub_03ad7e
    stz $16c9
    stz $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_0392d6:
    lda $00
    beq loc_0392de
    cmp #$20
    bne loc_0392d6

loc_0392de:
    rtl
    .incbin "data/0192df-01a85b.bin"
    sep #$20
    jsr sub_03aaf9
    jsr sub_03ab95
    .db $fc,$93,$17,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $a8,$96,$17,$00,$70,$00,$20
    jsr sub_03abfe
    .db $40,$04,$7f,$e0,$00
    lda #$10
    sta $00
    lda #$10
    sta $1785
    ldx #$b9b1
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$01
    sta $14db
    jsl sub_06ba91
    lda #$02
    sta $14dc
    lda #$0a
    sta $1fe2
    rep #$20
.a16
    lda #$0000
    sta $169c
    sta $194d
    sep #$20
.a8
    stz $16c9
    lda #$01
    sta $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_03a8d2:
    lda $00
    beq loc_03a8da
    cmp #$20
    bne loc_03a8d2

loc_03a8da:
    rtl
    sep #$20
    jsr sub_03ab12
    jsr sub_03ab95
    .db $aa,$d5,$14,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $96,$d8,$14,$00,$70,$00,$20
    jsr sub_03abfe
    .db $e0,$00,$7f,$e0,$00
    lda #$10
    sta $00
    lda $120e
    ora #$04
    sta $120e
    lda #$17
    sta $1785
    ldx #$b566
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$01
    sta $14db
    jsl sub_06ba91
    lda #$05
    sta $14dc
    lda #$00
    sta $1fe2
    rep #$20
.a16
    lda #$0018
    sta $169c
    sta $194d
    sep #$20
.a8
    stz $16c9
    lda #$01
    sta $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_03a95a:
    lda $00
    beq loc_03a962
    cmp #$20
    bne loc_03a95a

loc_03a962:
    rtl

sub_03a963:
    sep #$20
    jsr sub_03aaf9
    jsr sub_03ab95
    .db $cd,$fe,$05,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $96,$ff,$00,$00,$70,$00,$20
    jsr sub_03abfe
    .db $40,$04,$7f,$e0,$00
    lda #$10
    sta $00
    lda $120e
    ora #$04
    sta $120e
    lda #$17
    sta $1785
    ldx #$b566
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$01
    sta $14db
    jsl sub_06ba91
    lda #$05
    sta $14dc
    lda #$0a
    sta $1fe2
    rep #$20
.a16
    lda #$ff80
    sta $169e
    sep #$20
.a8
    rep #$20
.a16
    lda #$0000
    sta $169c
    sta $194d
    sep #$20
.a8
    stz $16c9
    lda #$01
    sta $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_03a9ec:
    lda $00
    beq loc_03a9f4
    cmp #$20
    bne loc_03a9ec

loc_03a9f4:
    rtl
    sep #$20
    jsr sub_03aaf9
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0017
    sta $700064
    lda #$9ad8
    sta $700062
    lda #$7000
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    lda #$01
    sta $18b8
    lda #$17
    sta TM
    rep #$20
.a16
    lda #$0017
    sta $700064
    lda #$9c38
    sta $700062
    lda #$6800
    sta $188e
    lda #$1000
    sta $1890
    sep #$20
.a8
    jsl sub_03ab60
    lda #$16
    sta $00

loc_03aa53:
    lda $00
    beq loc_03aa5b
    cmp #$20
    bne loc_03aa53

loc_03aa5b:
    jsr sub_03ab95
    .db $a4,$b7,$17,$00,$5c,$00,$18
    jsr sub_03abcd
    .db $60,$82,$17,$00,$78,$00,$10
    jsr sub_03abfe
    .db $00,$0f,$7f,$e0,$00
    lda #$10
    sta $00
    lda #$07
    sta BG34NBA
    lda #$68
    sta BG3SC
    stz $1789
    stz $178a
    lda #$09
    sta BG3VOFS
    lda #$00
    sta BG3VOFS
    lda #$10
    sta $1785
    ldx #$b566
    stx $1786
    lda #$0b
    sta $1788
    sep #$20
    lda #$01
    sta $14db
    jsl sub_06ba91
    lda #$05
    sta $14dc
    lda #$00
    sta $1fe2
    rep #$20
.a16
    lda #$0101
    sta $169c
    sta $194d
    sep #$20
.a8
    jsl sub_03ad68
    lda #$07
    sta TM
    stz $16c9
    lda #$01
    sta $18c2
    stz $194f
    stz $1950
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    lda $120e
    sta HDMAEN

loc_03aaf0:
    lda $00
    beq loc_03aaf8
    cmp #$20
    bne loc_03aaf0

loc_03aaf8:
    rtl

sub_03aaf9:
    sep #$20
    rep #$10

loc_03aafd:
    lda $00
    beq loc_03ab05
    cmp #$20
    bne loc_03aafd

loc_03ab05:
    lda #$24
    sta $00

loc_03ab09:
    lda $00
    beq loc_03ab11
    cmp #$20
    bne loc_03ab09

loc_03ab11:
    rts

sub_03ab12:
    sep #$20
    rep #$10

loc_03ab16:
    lda $00
    beq loc_03ab1e
    cmp #$20
    bne loc_03ab16

loc_03ab1e:
    lda #$26
    sta $00

loc_03ab22:
    lda $00
    beq loc_03ab2a
    cmp #$20
    bne loc_03ab22

loc_03ab2a:
    rts

sub_03ab2b:
    php
    rep #$20
.a16
    lda #$2800
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b301
    jsl sub_7e4ee9
    plp
    rtl

sub_03ab42:
    php
    rep #$20
.a16
    lda #$00c0
    sta $700090
    lda #$4000
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b301
    jsl sub_7e4ee9
    plp
    rtl

sub_03ab60:
    php
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$4000
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b301
    jsl sub_7e4ee9
    plp
    rtl

sub_03ab7e:
    php
    rep #$20
.a16
    lda #$2800
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b301
    jsl sub_7e4ee9
    plp
    rtl

sub_03ab95:
    rep #$20
.a16
    pla
    tax
    clc
    adc #$0007
    pha
    lda #$0000
    sta $700090
    lda $030003,x
    and #$00ff
    sta $700064
    lda $030001,x
    sta $700062
    lda $030004,x
    sta $188a
    lda $030006,x
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    rts

sub_03abcd:
    rep #$20
.a16
    pla
    tax
    clc
    adc #$0007
    pha
    lda $030001,x
    sta $700062
    lda $030003,x
    and #$00ff
    sta $700064
    lda $030004,x
    sta $188e
    lda $030006,x
    sta $1890
    sep #$20
.a8
    jsl sub_03ab42
    rts

sub_03abfe:
    rep #$20
.a16
    pla
    tax
    clc
    adc #$0005
    pha
    lda $030001,x
    sta $1892
    sep #$20
.a8
    lda $030003,x
    sta $1894
    rep #$20
.a16
    lda $030004,x
    sta $1895
    lda $1892
    clc
    adc #$00df
    tay
    phy
    sep #$20
.a8
    phb
    lda $1894
    pha
    plb
    ldx #$00df

loc_03ac34:
    lda $0000,y
    sta $001789,x
    dey
    dex
    bpl loc_03ac34
    plb
    ply
    rts
    .db $00,$00,$00,$03,$5f,$90,$00,$00,$00,$03,$03,$91,$00,$00,$00,$03
    .db $07,$91,$00,$00,$00,$03,$a0,$91,$00,$00,$00,$03,$0b,$91,$00,$00
    .db $00,$03,$df,$92,$00,$00,$00,$03,$10,$94,$00,$00,$00,$03,$9c,$94
    .db $00,$00,$00,$03,$2f,$95,$00,$00,$00,$03,$c7,$95,$00,$00,$00,$03
    .db $5a,$96,$00,$00,$00,$03,$dc,$96,$00,$00,$00,$03,$5e,$97,$00,$00
    .db $00,$03,$d6,$97,$00,$00,$00,$03,$a4,$98,$00,$00,$00,$03,$30,$99
    .db $00,$00,$00,$03,$d0,$99,$00,$00,$00,$03,$73,$9a,$00,$00,$00,$03
    .db $1f,$9b,$00,$00,$00,$03,$c2,$9b,$00,$00,$00,$03,$5b,$9c,$00,$00
    .db $00,$03,$d3,$a7,$00,$00,$00,$03,$f1,$9c,$00,$00,$00,$03,$7d,$9d
    .db $00,$00,$00,$03,$4b,$9e,$00,$00,$00,$03,$4f,$9f,$00,$00,$00,$03
    .db $dc,$9f,$00,$00,$00,$03,$f4,$a0,$00,$00,$00,$03,$f2,$a1,$00,$00
    .db $00,$03,$88,$a2,$00,$00,$00,$03,$45,$a3,$00,$00,$00,$03,$d1,$a3
    .db $00,$00,$00,$03,$6e,$a4,$00,$00,$00,$03,$72,$a4,$00,$00,$00,$03
    .db $fe,$a4,$00,$00,$00,$03,$8b,$a5,$00,$00,$00,$03,$03,$a6,$00,$00
    .db $00,$03,$a7,$a6,$00,$00,$00,$03,$33,$a7,$00,$00,$00,$03,$ba,$8f
    .db $00,$00,$00,$03,$db,$a8,$00,$00,$00,$03,$f5,$a9,$00,$00,$00,$03
    .db $5b,$a8,$00,$00,$00,$03,$63,$a9,$00,$00,$00,$03,$6b,$93,$00,$00
    .db $00,$03,$35,$92,$00,$00,$00,$00,$00,$00,$00

sub_03ad5d:
    php
    rep #$10
    ldx #$0000
    jsr sub_03b109
.i8
    plp
.i16
    rtl

sub_03ad68:
    php
    rep #$10
    ldx #$001c
    jsr sub_03b109
.i8
    plp
.i16
    rtl

sub_03ad73:
    php
    rep #$10
    ldx #$0025
    jsr sub_03b109
.i8
    plp
.i16
    rtl

sub_03ad7e:
    php
    rep #$10
    ldx #$0033
    jsr sub_03b109
.i8
    plp
.i16
    rtl

sub_03ad89:
.i8
    php
    rep #$10
.i16
    ldx #$0041
    jsr sub_03b109
.i8
    plp
    rtl

sub_03ad94:
.i16
    php
    rep #$10
    ldx #$0061
    jsr sub_03b109
.i8
    plp
.i16
    rtl

sub_03ad9f:
    php
    rep #$10
    ldx #$0074
    jsr sub_03b109
.i8
    plp
.i16
    rtl

loc_03adaa:
    php
    rep #$10
    ldx #$008c
    jsr sub_03b109
    plp
    rtl

loc_03adb5:
    php
    rep #$10
    ldx #$009a
    jsr sub_03b109
    plp
    rtl

loc_03adc0:
    php
    rep #$10
    ldx #$00a8
    jsr sub_03b109
    plp
    rtl

loc_03adcb:
    php
    rep #$10
    ldx #$00b6
    jsr sub_03b109
    plp
    rtl

loc_03add6:
    php
    rep #$10
    ldx #$00ce
    jsr sub_03b109
    plp
    rtl

loc_03ade1:
    php
    rep #$10
    ldx #$00dc
    jsr sub_03b109
    plp
    rtl

loc_03adec:
    php
    rep #$10
    ldx #$00ef
    jsr sub_03b109
    plp
    rtl

loc_03adf7:
    php
    rep #$10
    ldx #$0102
    jsr sub_03b109
    plp
    rtl
    .db $08,$c2,$10,$a2,$10,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2,$1e
    .db $01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2,$36,$01,$20,$09,$b1,$28
    .db $6b,$08,$c2,$10,$a2,$44,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2
    .db $52,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2,$65,$01,$20,$09,$b1
    .db $28,$6b,$08,$c2,$10,$a2,$78,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10
    .db $a2,$86,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2,$94,$01,$20,$09
    .db $b1,$28,$6b,$08,$c2,$10,$a2,$ac,$01,$20,$09,$b1,$28,$6b,$08,$c2
    .db $10,$a2,$ba,$01,$20,$09,$b1,$28,$6b,$08,$c2,$10,$a2,$cd,$01,$20
    .db $09,$b1,$28,$6b,$08,$c2,$10,$a2,$db,$01,$20,$09,$b1,$28,$6b

sub_03ae91:
    php
    rep #$10
    ldx #$004f
    jsr sub_03b109
    plp
    rtl

loc_03ae9c:
    php
    rep #$10
    ldx #$0058
    jsr sub_03b109
    plp
    rtl

sub_03aea7:
    php
    rep #$10
    ldx #$0009
    jsr sub_03b109
.i8
    plp
.i16
    rtl

loc_03aeb2:
    php
    rep #$10
    ldx #$01ee
    jsr sub_03b109
    plp
    rtl

sub_03aebd:
    php
    rep #$10
    ldx #$01f7
    jsr sub_03b109
    plp
    rtl

sub_03aec8:
    php
    rep #$10
    ldx #$0200
    jsr sub_03b109
.i8
    plp
.i16
    rtl

loc_03aed3:
    php
    rep #$10
    ldx #$0209
    jsr sub_03b109
    plp
    rtl

loc_03aede:
    php
    rep #$10
    ldx #$0217
    jsr sub_03b109
    plp
    rtl
    .incbin "data/01aee9-01b109.bin"

sub_03b109:
    sep #$20
    sei
    lda $03aee9,x
    sta $1f47
    inx
    stx $1f63
    lda $1f65
    beq loc_03b121
    lda #$ff
    sta APUIO0

loc_03b121:
    lda #$01
    sta $1f65
    rep #$30
.a16
    ldy #$0000
    lda #$bbaa

loc_03b12e:
    cmp APUIO0
    bne loc_03b12e
    sep #$20
.a8
    lda #$cc
    pha
    jmp loc_03b1b7

loc_03b13b:
    lda [$fa],y
    iny
    bne loc_03b149
    inc $fc
    stz $fb
    stz $fa
    ldy #$8000

loc_03b149:
    xba
    lda #$00
    bra loc_03b164

loc_03b14e:
    xba
    lda [$fa],y
    iny
    bne loc_03b15d
    inc $fc
    stz $fb
    stz $fa
    ldy #$8000

loc_03b15d:
    xba

loc_03b15e:
    cmp APUIO0
    bne loc_03b15e
    inc a

loc_03b164:
    rep #$20
.a16
    sta APUIO0
    sep #$20
.a8
    dex
    bne loc_03b14e

loc_03b16e:
    cmp APUIO0
    bne loc_03b16e

loc_03b173:
    adc #$03
    beq loc_03b173
    pha

loc_03b178:
    rep #$20
.a16
    lda [$fa],y
    beq loc_03b1b7
    iny
    bne loc_03b185
    jml loc_1fbdee

loc_03b185:
    iny
    bne loc_03b18c
    jml loc_1fbdee

loc_03b18c:
    tax
    lda [$fa],y
    iny
    bne loc_03b196
    jml loc_1fbdee

loc_03b196:
    iny
    bne loc_03b19d
    jml loc_1fbdee

loc_03b19d:
    sta APUIO2
    sep #$20
.a8
    cpx #$0001
    lda #$00
    rol a
    sta APUIO1
    pla
    sta APUIO0

loc_03b1af:
    cmp APUIO0
    bne loc_03b1af
    jmp loc_03b13b

loc_03b1b7:
    rep #$20
.a16
    ldx $1f63
    lda $03aee9,x
    sta $1f3f
    lda $03aeec,x
    sta $1f41
    sep #$20
.a8
    lda $03aeeb,x
    sta $fc
    inx
    inx
    inx
    inx
    inx
    stx $1f63
    rep #$20
.a16
    stz $fa
    lda $1f3f
    beq loc_03b1ed
    tay
    clc
    adc $1f41
    bcc loc_03b240
    jmp loc_03b178

loc_03b1ed:
    rep #$20
    lda #$0400
    sta APUIO2
    sep #$30
.a8
.i8
    lda #$00
    xba
    pla
    rep #$20
.a16
    sta APUIO0
    sep #$20

loc_03b202:
.a8
    cmp APUIO0
    bne loc_03b202
    stz APUIO1
    stz APUIO2
    stz APUIO3
    stz $1f46
    lda $004211
    cli
    rts

loc_03b219:
.i16
    lda [$fa],y
    iny
    xba
    lda #$00
    bra loc_03b22c

loc_03b221:
    xba
    lda [$fa],y
    iny
    xba

loc_03b226:
    cmp APUIO0
    bne loc_03b226
    inc a

loc_03b22c:
    rep #$20
.a16
    sta APUIO0
    sep #$20
.a8
    dex
    bne loc_03b221

loc_03b236:
    cmp APUIO0
    bne loc_03b236

loc_03b23b:
    adc #$03
    beq loc_03b23b
    pha

loc_03b240:
    rep #$20
.a16
    lda [$fa],y
    bne loc_03b249
    brl loc_03b1b7

loc_03b249:
    iny
    iny
    tax
    lda [$fa],y
    iny
    iny
    sta APUIO2
    sep #$20
.a8
    cpx #$0001
    lda #$00
    rol a
    sta APUIO1
    pla
    sta APUIO0

loc_03b262:
    cmp APUIO0
    bne loc_03b262
    bra loc_03b219

sub_03b269:
.i8
    sep #$20
    lda $14d1
    and #$08
    beq loc_03b279
    lda $14d7
    and #$80
    bne loc_03b298

loc_03b279:
    lda $1fd2
    cmp #$10
    beq loc_03b298
    cmp #$0f
    beq loc_03b298
    cmp #$0b
    beq loc_03b298
    cmp #$0c
    beq loc_03b298
    cmp #$0d
    beq loc_03b298
    jsr sub_03b3d2
.i16
    jsr sub_03b350
    bra loc_03b29b

loc_03b298:
.i8
    stz APUIO2

loc_03b29b:
    jsr sub_03b29f
.i16
    rtl

sub_03b29f:
.i8
    sep #$20
    rep #$10
.i16
    ldx $15a2
    lda $2e,x
    and #$04
    beq loc_03b2b0
    jml loc_03b2c7

loc_03b2b0:
    lda $14d0
    and #$40
    bne loc_03b2c7
    lda $14d8
    and #$02
    beq loc_03b2c7
    lda $14d7
    and #$80
    bne loc_03b2d0
    bra loc_03b2d9

loc_03b2c7:
    lda #$00
    sta APUIO1
    sta $1fe1
    rts

loc_03b2d0:
    lda #$4b
    sta APUIO1
    sta $1fe1
    rts

loc_03b2d9:
    lda $16c9
    bne loc_03b2f1
    lda $18c2
    bit #$01
    bne loc_03b2ed
    lda #$c0
    bra loc_03b2f7

loc_03b2e9:
    lda #$c0
    bra loc_03b2f7

loc_03b2ed:
    lda #$00
    bra loc_03b2f7

loc_03b2f1:
    cmp #$02
    beq loc_03b2e9
    lda #$80

loc_03b2f7:
    ora $1f43
    sta $14c5
    lda $1204
    bit #$30
    beq loc_03b340
    rep #$30
.a16
    ldx $1238
    lda $0c,x
    tax
    sec
    sbc $1f44
    stx $1f44
    bpl loc_03b319
    eor #$ffff
    inc a

loc_03b319:
    cmp #$0002
    bcc loc_03b337
    cmp #$0004
    bcc loc_03b332
    cmp #$0008
    bcc loc_03b32d
    lda #$0003
    bra loc_03b33a

loc_03b32d:
    lda #$0002
    bra loc_03b33a

loc_03b332:
    lda #$0001
    bra loc_03b33a

loc_03b337:
    lda #$0000

loc_03b33a:
    ora $14c5
    sta $14c5

loc_03b340:
.a8
    sep #$20
    lda $14c5
    sta APUIO1
    sta $1fe1
    rts
    .db $8d,$42,$21,$60

sub_03b350:
    rep #$30
.a16
    ldx $121d

loc_03b355:
.a8
    sep #$20
    lda $2a,x
    cmp #$ff
    bne loc_03b395
    lda $1f,x
    and #$08
    bne loc_03b367
    jml loc_03b395

loc_03b367:
    lda $20,x
    and #$02
    beq loc_03b371
    jml loc_03b395

loc_03b371:
    rep #$20
.a16
    ldy $1238
    lda $14f6
    sec
    sbc $0c,x
    bmi loc_03b385
    cmp #$012c
    bcs loc_03b395
    bra loc_03b38a

loc_03b385:
    cmp #$fed4
    bcc loc_03b395

loc_03b38a:
    lda $10,x
    sec
    sbc $0010,y
    cmp #$0064
    bcc loc_03b39b

loc_03b395:
.a8
    ldy $00,x
    tyx
    bne loc_03b355
    rts

loc_03b39b:
.a16
    sep #$20
.a8
    lda $20,x
    ora #$02
    sta $20,x
    rep #$20
.a16
    lda $14f6
    sec
    sbc $0c,x
    bmi loc_03b3bb
    cmp #$0050
    bcc loc_03b3c9
    sep #$20
.a8
    lda #$6d
    jsl sub_03b7f9
    rts

loc_03b3bb:
.a16
    cmp #$ffb0
    bcs loc_03b3c9
    sep #$20
.a8
    lda #$6f
    jsl sub_03b7f9
    rts

loc_03b3c9:
.a16
    sep #$20
.a8
    lda #$6e
    jsl sub_03b7f9
    rts

sub_03b3d2:
.i8
    rep #$30
.a16
.i16
    ldx $121d
    lda #$7fff
    stz $1f3d

loc_03b3dd:
    ldy $04,x
    cpy #$c7c0
    bne loc_03b3e7
    brl loc_03b4cd

loc_03b3e7:
    cpy #$d9b0
    bne loc_03b3ef
    brl loc_03b4cd

loc_03b3ef:
    cpy #$d994
    bne loc_03b3f7
    brl loc_03b4cd

loc_03b3f7:
    cpy #$d95c
    bne loc_03b3ff
    brl loc_03b4cd

loc_03b3ff:
    cpy #$c050
    bne loc_03b407
    brl loc_03b4cd

loc_03b407:
    pha
    sep #$20
.a8
    lda $08,x
    bit #$01
    bne loc_03b441
    lda $7e1ce8,x
    bne loc_03b41c
    lda $7e1ce9,x
    beq loc_03b441

loc_03b41c:
    ldy $1238
    rep #$20
.a16
    lda $10,x
    sec
    sbc $0010,y
    bpl loc_03b42d
    eor #$ffff
    inc a

loc_03b42d:
    sta $1250
    pla
    cmp $1250
    bcc loc_03b444
    lda $1250
    stx $1f3d
    sta $1f3f
    bra loc_03b444

loc_03b441:
.a8
    rep #$20
.a16
    pla

loc_03b444:
    ldy $00,x
    tyx
    bne loc_03b3dd
    ldx $1f3d
    bne loc_03b451
    brl loc_03b4be

loc_03b451:
    cpx $1f66
    beq loc_03b459
    brl loc_03b4be

loc_03b459:
    lda $7e1ce8,x
    and #$00ff
    beq loc_03b465
    brl loc_03b4c7

loc_03b465:
    lda $7e1ce9,x
    and #$00ff
    sta $1f3d
    ldy $1236
    jsl sub_1fd021
    xba
    rep #$20
    and #$00ff
    tax
    lda $03b539,x
    and #$00ff
    ora $1f3d
    sta $1f3d
    lda $1f3f
    cmp #$00fa
    bcc loc_03b4b3
    cmp #$028a
    bcc loc_03b4ad
    cmp #$047e
    bcc loc_03b4a7
    cmp #$0c4e
    bcs loc_03b4be

loc_03b4a1:
    sep #$20
.a8
    lda #$30
    bra loc_03b4b7

loc_03b4a7:
.a16
    sep #$20
.a8
    lda #$20
    bra loc_03b4b7

loc_03b4ad:
.a16
    sep #$20
.a8
    lda #$10
    bra loc_03b4b7

loc_03b4b3:
.a16
    sep #$20
.a8
    lda #$00

loc_03b4b7:
    ora $1f3d
    sta APUIO2
    rts

loc_03b4be:
.a16
    sep #$20
.a8
    stz APUIO2
    stx $1f66
    rts

loc_03b4c7:
.a16
    sep #$20
.a8
    sta APUIO2
    rts

loc_03b4cd:
.a16
    rep #$20
    lda $7e1ce9,x
    and #$00ff
    sta $1f3d
    stx $1f66
    ldy $1238
    lda $10,x
    sec
    sbc $0010,y
    bmi loc_03b4be
    sta $1f3f
    lda $14f6
    sec
    sbc $0c,x
    bmi loc_03b4ff
    cmp #$0050
    bcc loc_03b50c
    lda $1f3d
    ora #$0040
    bra loc_03b512

loc_03b4ff:
    cmp #$ffb0
    bcs loc_03b50c
    lda $1f3d
    ora #$00c0
    bra loc_03b512

loc_03b50c:
    lda $1f3d
    ora #$0080

loc_03b512:
    sta $1f3d
    lda $1f3f
    cmp #$01f4
    bcc loc_03b4be
    cmp #$1388
    bcc loc_03b4b3
    cmp #$2710
    bcc loc_03b4ad
    cmp #$2710
    bcs loc_03b52f
    brl loc_03b4a7

loc_03b52f:
    cmp #$2af8
    bcs loc_03b537
    brl loc_03b4a1

loc_03b537:
    bra loc_03b4be
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
    .db $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$80,$80,$80
    .db $80,$80,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$c0
    .db $a9,$1e,$8d,$48,$1f,$8d,$49,$1f,$8d,$4a,$1f,$a9,$1f,$8d,$4b,$1f
    .db $a9,$20,$8d,$4c,$1f,$4c,$99,$b7,$a9,$21,$8d,$48,$1f,$8d,$49,$1f
    .db $8d,$4a,$1f,$a9,$22,$8d,$4b,$1f,$a9,$23,$8d,$4c,$1f,$4c,$99,$b7
    .db $a9,$24,$8d,$48,$1f,$8d,$49,$1f,$8d,$4a,$1f,$a9,$25,$8d,$4b,$1f
    .db $a9,$26,$8d,$4c,$1f,$4c,$99,$b7

sub_03b681:
.a8
    lda #$27
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$28
    sta $1f4b
    lda #$29
    sta $1f4c
    jmp loc_03b799

loc_03b699:
    lda #$3c
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$3d
    sta $1f4b
    lda #$3e
    sta $1f4c
    jmp loc_03b799

loc_03b6b1:
    lda #$3f
    sta $1f48
    lda #$40
    sta $1f49
    lda #$41
    sta $1f4a
    lda #$42
    sta $1f4b
    lda #$43
    sta $1f4c
    jmp loc_03b799

sub_03b6cd:
    lda #$44
    sta $1f48
    lda #$45
    sta $1f49
    lda #$46
    sta $1f4a
    lda #$47
    sta $1f4b
    lda #$48
    sta $1f4c
    jmp loc_03b799

sub_03b6e9:
    lda #$49
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$4a
    sta $1f4b
    lda #$4b
    sta $1f4c
    jmp loc_03b799

loc_03b701:
    lda #$5c
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$5d
    sta $1f4b
    lda #$5e
    sta $1f4c
    jmp loc_03b799

sub_03b719:
    lda #$54
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$55
    sta $1f4b
    lda #$55
    sta $1f4c
    jmp loc_03b799

sub_03b731:
    lda #$52
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$53
    sta $1f4b
    lda #$53
    sta $1f4c
    jmp loc_03b799

loc_03b749:
    lda #$68
    sta $1f48
    lda #$69
    sta $1f49
    lda #$6a
    sta $1f4a
    lda #$6b
    sta $1f4b
    lda #$6c
    sta $1f4c
    jmp loc_03b799

loc_03b765:
    lda #$74
    sta $1f48
    lda #$75
    sta $1f49
    lda #$76
    sta $1f4a
    lda #$77
    sta $1f4b
    lda #$78
    sta $1f4c
    jmp loc_03b799

loc_03b781:
    lda #$49
    sta $1f48
    sta $1f49
    sta $1f4a
    lda #$4a
    sta $1f4b
    lda #$4b
    sta $1f4c
    jmp loc_03b799

loc_03b799:
    phx
    phy
    php
    ldy $1238
    jsl sub_1fd0ab
    rep #$20
.a16
    lda $1250
    cmp #$07d0
    bcc loc_03b7bb
    cmp #$047e
    bcc loc_03b7e5
    cmp #$0c4e
    bcc loc_03b7ed

loc_03b7b7:
.a8
    plp
    ply
    plx
    rtl

loc_03b7bb:
.a16
    lda $14f6
    sec
    sbc $0c,x
    bmi loc_03b7d0
    cmp #$00aa
    bcc loc_03b7dd
    sep #$20
.a8
    lda $1f48
    jmp loc_03b7f2

loc_03b7d0:
.a16
    cmp #$ff56
    bcs loc_03b7dd
    sep #$20
.a8
    lda $1f4a
    jmp loc_03b7f2

loc_03b7dd:
.a16
    sep #$20
.a8
    lda $1f49
    jmp loc_03b7f2

loc_03b7e5:
.a16
    sep #$20
.a8
    lda $1f4b
    jmp loc_03b7f2

loc_03b7ed:
.a16
    sep #$20
.a8
    lda $1f4c

loc_03b7f2:
    jsl sub_03b7f9
    jmp loc_03b7b7

sub_03b7f9:
    php
    pha
    sep #$20
    lda $1fcf
    bne loc_03b824
    lda $14d1
    and #$08
    beq loc_03b810
    lda $14d7
    and #$80
    bne loc_03b824

loc_03b810:
    pla
    phx
    ldx $1f4d
    sta $1f53,x
    lda $1f4d
    inc a
    and #$0f
    sta $1f4d
    plx
    plp
    rtl

loc_03b824:
    pla
    plp
    rtl

sub_03b827:
.i8
    php
    bra loc_03b82d
    .db $08,$e2,$30

loc_03b82d:
    lda #$3a
    sta $ef
    lda #$a7
    sta $f0
    lda #$55
    sta $f1
    lda #$7f
    sta $f2
    stz $98
    stz $b9
    stz $95
    stz $9b
    stz $9c
    stz $9d
    stz $99
    stz $dc
    stz $1634
    stz $1636
    stz $1638
    stz $1249
    stz $124a
    lda #$00
    sta $15ca
    jsl sub_03b8b8
    jsl sub_03b89d
    jsl sub_03b86f
    plp
    rtl

sub_03b86f:
    lda #$ff
    sta $15bf
    jsl sub_03bce5
    lda $ca
    sta $700034
    lda $cc
    sta $700036
    lda $2a
    sta $700038
    lda $2e
    sta $70003a
    lda $2c
    sta $70003c
    lda $30
    sta $70003e
    rtl

sub_03b89d:
    php
    sep #$30
    ldy #$00
    ldx #$00
    lda #$80
    sta $60

loc_03b8a8:
    lda $9099,y
    sta $701a2c,x
    inx
    iny
    iny
    dec $60
    bne loc_03b8a8
    plp
    rtl

sub_03b8b8:
    php
    rep #$20
.a16
    stz $1633
    stz $1635
    stz $1637
    lda $1633
    sta $162d
    lda $1635
    sta $162f
    lda $1637
    sta $1631
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
    sep #$20
.a8
    lda #$7f
    sta $160a
    stz $160c
    stz $160e
    stz $1610
    sta $1612
    stz $1614
    stz $1616
    stz $1618
    sta $161a
    stz $1609
    stz $160b
    stz $160d
    stz $160f
    stz $1611
    stz $1613
    stz $1615
    stz $1617
    stz $1619
    plp
    rtl

sub_03b950:
    phx
    phy
    php
    rep #$30
.a16
.i16
    lda $02
    sta $700062
    lda $08
    sta $70002c
    lda $90
    sta $70002e
    sep #$20
.a8
    lda #$01
    ldx #$823e
    jsl sub_7e4ee9
    rep #$20
.a16
    lda $700026
    sta $b3
    lda $700028
    sta $b5
    lda $70002a
    sta $b7
    plp
.a8
.i8
    ply
    plx
    rtl

sub_03b98a:
    rep #$20
.a16
    lda $162d
    sta $700020
    lda $162f
    sta $700022
    lda $1631
    sta $700024
    sep #$20
.a8
    rep #$10
.i16
    lda #$01
    ldx #$8295
    jsl sub_7e4ee9
    rep #$20
.a16
    lda $7000d2
    sta $15d7
    lda $7000d4
    sta $15d9
    lda $7000d6
    sta $15db
    lda $7000d8
    sta $15dd
    lda $7000da
    sta $15df
    lda $7000dc
    sta $15e1
    lda $7000de
    sta $15e3
    lda $7000e0
    sta $15e5
    lda $7000e2
    sta $15e7
    sep #$30
.a8
.i8
    rtl

sub_03b9f2:
    lda $02
    sta $84
    lda $03
    sta $85
    lda $90
    sta $86
    lda $91
    sta $87
    jsl sub_03ba45
    lda $88
    sta $72
    lda $89
    sta $73
    lda $08
    sta $84
    lda $09
    sta $85
    lda $90
    sta $86
    lda $91
    sta $87
    jsl sub_03ba45
    lda $88
    sta $74
    lda $89
    sta $75
    clc
    lda $cc
    adc $74
    sta $74
    lda $cd
    adc $75
    sta $75
    sec
    lda $74
    sbc $ca
    sta $74
    lda $75
    sbc $cb
    sta $75
    rtl

sub_03ba45:
    ldx #$00
    lda $87
    beq loc_03ba57
    inx
    lsr a
    beq loc_03ba55

loc_03ba4f:
    ror $86
    inx
    lsr a
    bne loc_03ba4f

loc_03ba55:
    ror $86

loc_03ba57:
    stx $92
    ldx #$00
    lda $85
    sta $8b
    bpl loc_03ba6e
    lda #$00
    sec
    sbc $84
    sta $84
    lda #$00
    sbc $85
    sta $85

loc_03ba6e:
    beq loc_03ba7f
    inx
    lsr a
    beq loc_03ba7a

loc_03ba74:
    ror $84
    inx
    lsr a
    bne loc_03ba74

loc_03ba7a:
    ror $84
    jmp loc_03ba96

loc_03ba7f:
    lda $84
    bmi loc_03ba96
    bne loc_03ba90
    lda $ca
    sta $88
    lda $cb
    sta $89
    jmp loc_03baf6

loc_03ba90:
    dex
    asl a
    bpl loc_03ba90
    sta $84

loc_03ba96:
    lda $86
    cmp $84
    bcc loc_03baa4

loc_03ba9c:
    dex
    lsr a
    cmp $84
    bcs loc_03ba9c
    sta $86

loc_03baa4:
    txa
    sec
    sbc $92
    sta $8a
    ldx $84
    lda $83d5,x
    ldx $86
    sec
    sbc $83d5,x
    tax
    lda $82d5,x
    sta $89
    lda $81d5,x
    ldx $8a
    bmi loc_03bacd
    beq loc_03bad3

loc_03bac4:
    asl a
    rol $89
    dex
    bne loc_03bac4
    jmp loc_03bad3

loc_03bacd:
    lsr $89
    ror a
    inx
    bne loc_03bacd

loc_03bad3:
    sta $88
    bit $8b
    bpl loc_03bae9
    sec
    lda $ca
    sbc $88
    sta $88
    lda $cb
    sbc $89
    sta $89
    jmp loc_03baf6

loc_03bae9:
    clc
    lda $88
    adc $ca
    sta $88
    lda $89
    adc $cb
    sta $89

loc_03baf6:
    rtl

sub_03baf7:
.a16
.i16
    bpl loc_03bafc
    brl loc_03bcf5

loc_03bafc:
    rep #$30
    lda $c1
    and #$00ff
    eor #$00ff
    sec
    sbc #$0780
    sta $02
    lda $c5
    and #$00ff
    eor #$00ff
    sec
    sbc #$0780
    sta $90
    lda #$0000
    sec
    sbc $c3
    sta $08
    lda $c1
    and #$ff00
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    sep #$20
.a8
    sta $164b
    rep #$20
.a16
    lda $c5
    and #$ff00
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    lsr a
    sep #$20
.a8
    sta $164c
    jsl sub_03b950
    rep #$20
.a16
    lda $b3
    sta $02
    lda $b5
    sta $08
    lda $b7
    sta $90
    sep #$20
.a8
    rep #$20
.a16
    lda $161b
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
    sta $1639
    lda $161d
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
    sta $163b
    lda $161f
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
    sta $163d
    lda $1621
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
    sta $163f
    lda $1623
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
    sta $1641
    lda $1625
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
    sta $1643
    lda $1627
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
    sta $1645
    lda $1629
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
    sta $1647
    lda $162b
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
    sta $1649
    sep #$20
.a8
    rep #$20
.a16
    lda $02
    sta $700062
    lda $08
    sta $70002c
    lda $90
    sta $70002e
    lda $1639
    sta $700142
    lda $163b
    sta $700144
    lda $163d
    sta $700146
    lda $1645
    sta $700148
    lda $1647
    sta $70014a
    lda $1649
    sta $70014c
    sep #$20
.a8
    rep #$10
    lda $164b
    sta $700150
    lda $164c
    sta $700152
    sep #$30
.i8
    rtl

sub_03bce5:
    sep #$20
    rep #$10
.i16
    lda #$01
    ldx #$a861
    jsl sub_7e4ee9
    sep #$30
.i8
    rtl

loc_03bcf5:
.a16
.i16
    rep #$20
    lda $1f0d
    and #$00ff
    beq loc_03bd16
    lda $1fd4
    sta $7000c6
    lda $1fd6
    sta $7000c8
    lda $1fd8
    sta $7000ca
    bra loc_03bd38

loc_03bd16:
    lda $c1
    sta $7000c6
    lda $c3
    sta $7000c8
    lda $c5
    sta $7000ca
    lda $14c2
    and #$00ff
    beq loc_03bd38
    lda $0014cd
    sta $7000ca

loc_03bd38:
    lda $161b
    sta $7000d2
    lda $161d
    sta $7000d4
    lda $161f
    sta $7000d6
    lda $1621
    sta $7000d8
    lda $1623
    sta $7000da
    lda $1625
    sta $7000dc
    lda $1627
    sta $7000de
    lda $1629
    sta $7000e0
    lda $162b
    sta $7000e2
    sep #$30
.a8
.i8
    rtl

sub_03bd7a:
    php
    sep #$20
    lda #$de
    sta $16db
    jsl sub_03bd8d
    lda #$00

loc_03bd88:
    dec a
    bne loc_03bd88
    plp
    rts

sub_03bd8d:
    php
    rep #$30
.a16
.i16
    phx
    pha
    sep #$20
.a8
    stz $16dc

loc_03bd97:
    sep #$20
    lda SLHV
    lda OPVCT
    xba
    lda OPVCT
    xba
    cmp $16db
    bne loc_03bd97
    rep #$30
.a16
    pla
    plx
    plp
.a8
.i8
    rtl

sub_03bdaf:
    php
    sep #$20
    lda #$03
    sta $16ec
    stz $1898
    rep #$20
.a16
    lda #$00fc
    sta $16ce
    lda #$0092
    sta $16d0
    lda #$0018
    sta $16d2
    lda #$019a
    sta $16d4
    stz $16d6
    stz $16dd
    stz $16df
    plp
.a8
    rtl

loc_03bddf:
    sep #$20
    rep #$10
.i16
    jsr sub_03d11c
    stz $1f51
    ldx #$0000
    stx $1f4f
    stx $1f4d
    stz $1fcf
    sei
    rep #$20
.a16
    lda #$0000
    sta $7001d6
    sta $16e4
    lda #$0000
    sta $7001d8
    sta $16e6
    lda #$0096
    sta $16e8
    sta $7001da
    ldx #$1281
    stx $30
    stz $34
    lda #$0001
    sta $36
    jsl sub_03cd09
    jsr sub_03c511
    sep #$20
.a8
    lda $45
    lsr a
    lsr a
    sta GSU_SCBR
    lda #$ff
    sta $16d9
    lda #$06
    sta $70009a
    jsr sub_03ca7b
    jsr sub_03c71c
    jsr sub_03c891
    jsr sub_03c71c
    jsr sub_03c891
    jsl sub_03cb35
    rep #$30
.a16
    lda #$2020
    sta VMADDL
    ldx #$0000

loc_03be5b:
    lda $a08b,x
    sta VMDATAL
    inx
    inx
    cpx #$03c0
    bne loc_03be5b
    lda #$5020
    sta VMADDL
    ldx #$0000

loc_03be71:
    lda $a08b,x
    sta VMDATAL
    inx
    inx
    cpx #$03c0
    bne loc_03be71
    rep #$20
    stz $04
    lda #$0010
    sta $15c2
    dec $16d6
    bmi loc_03bea0
    inc $16d6
    jsl sub_03cc3e
    lda $16d9
    pha
    dec $16d6
    jsl sub_03cc3e
    pla

loc_03bea0:
    pha
    inc $16d6
    sep #$20
.a8
    rep #$10
    lda $16d9
    bpl loc_03beaf
    lda #$00

loc_03beaf:
    rep #$20
.a16
    asl a
    tax
    lda $03d408,x
    sta $32
    sta $38
    jsr sub_03c67f
    sep #$30
.a8
.i8
    lda #$08
    sta HDMAEN
    lda #$be
    sta $16db
    jsl sub_03bd8d
    sep #$30
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$30
    rep #$20
.a16
    pla
    sep #$20
.a8
    pha
    lda $004211
    cli
    jsl sub_03ad89
    pla
    cmp #$0e
    beq loc_03bef3
    cmp #$0a
    bne loc_03befb

loc_03bef3:
    lda #$0f
    sta $1f47
    stz $1f46

loc_03befb:
    lda #$ff

loc_03befd:
    pha
    lda #$c8
    sta $16db
    jsl sub_03bd8d
    sep #$30
    jsr sub_03bd7a
    pla
    inc a
    inc a
    sta $7e4608
    sta $7e460a
    sta $7e460c
    cmp #$0f
    bne loc_03befd
    sep #$20
    rep #$10
.i16
    lda $16d6
    beq loc_03bf2b
    brl loc_03bff1

loc_03bf2b:
    lda #$0a
    sta $16d6
    rep #$20
.a16
    lda #$0010
    sta $70009a

loc_03bf39:
    inc $15bb
    jsr sub_03c511
    jsr sub_03c58f
    lda $70009a
    pha
    lda #$0006
    sta $70009a
    lda #$fffe
    sta $16d9
    jsr sub_03ca7b
    pla
    sta $70009a
    jsr sub_03c78d
    lda $70009a
    beq loc_03bf6d
    sec
    sbc #$0004
    sta $70009a

loc_03bf6d:
    jsr sub_03c891
    lda $15bb
    bit #$0002
    beq loc_03bf7e
    jsl sub_03cc3e
    bra loc_03bf82

loc_03bf7e:
    jsl sub_03cc22

loc_03bf82:
    jsl sub_03cbfb
    lda $1209
    bit #$2f00
    beq loc_03bfcd
    lda #$0010
    sta $70009a
    jsr sub_03bd7a
    jsl sub_03cc22
    lda $1209
    bit #$2a00
    sep #$20
.a8
    bne loc_03bfb5
    lda $16d8
    inc a
    cmp #$03
    bne loc_03bfb0
    lda #$00

loc_03bfb0:
    sta $16d8
    bra loc_03bfc2

loc_03bfb5:
    lda $16d8
    dec a
    cmp #$ff
    bne loc_03bfbf
    lda #$02

loc_03bfbf:
    sta $16d8

loc_03bfc2:
    lda #$11
    jsl sub_03b7f9
    jsr sub_03c67f
    rep #$20

loc_03bfcd:
.a16
    lda $1209
    bit #$9080
    bne loc_03bfd8
    brl loc_03bf39

loc_03bfd8:
    stz $16d6
    stz $16d9
    jsl sub_03cc3e
    sep #$20
.a8
    lda #$f1
    sta $1f47
    stz $1f46
    rep #$20
.a16
    jmp loc_03c04c

loc_03bff1:
.a8
    sep #$20
    jsr sub_03c67f

loc_03bff6:
    ldx $02
    phx
    lda #$ff
    sta $16d9
    jsr sub_03c511
    jsr sub_03c58f
    jsr sub_03ca7b
    jsr sub_03c78d
    jsr sub_03c891
    plx
    stx $02
    jsr sub_03c484
    bcc loc_03bff6
    jsr sub_03bd7a
    jsl sub_03cc3e
    lda #$08
    sta $00
    lda $16d9
    pha
    lda #$fe
    sta $16d9

loc_03c029:
    jsr sub_03c511
    jsr sub_03c58f
    jsr sub_03ca7b
    jsr sub_03c78d
    jsr sub_03c891
    jsl sub_03cbfb
    rep #$20
.a16
    lda $1209
    bit #$d0c0
    sep #$20
.a8
    beq loc_03c029
    pla
    sta $16d9

loc_03c04c:
.a16
    sep #$20
.a8
    rep #$10
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$10
    jsl sub_03b7f9
    lda #$01
    sta $34
    lda #$53

loc_03c064:
    pha
    jsr sub_03bd7a
    pla
    dec a
    bne loc_03c064
    sei
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    jsr sub_03c611
    jsr sub_03bd7a
    jsr sub_03bd7a
    sep #$20
    rep #$10
    ldx #$0000

loc_03c08a:
    phx
    lda #$01

loc_03c08d:
    pha
    txa
    jsr sub_03cb4f
    pla
    dec a
    bne loc_03c08d
    plx
    txa
    ora #$e0
    sta COLDATA
    inx
    cpx #$0020
    bne loc_03c08a
    jsr sub_03c74d
    sep #$20
    jsr sub_03bd7a

loc_03c0ab:
    sep #$20
    lda SLHV
    lda OPHCT
    xba
    lda OPHCT
    xba
    rep #$20
.a16
    and #$01ff
    cmp #$0000
    bcc loc_03c0ab
    cmp #$000f
    bcs loc_03c0ab
    sep #$20
.a8
    lda #$01
    sta TM
    rep #$20
.a16
    jsr sub_03c5bf
    jsr sub_03c956
    sep #$20
.a8
    lda $004211
    rep #$20
.a16
    cli
    jsr sub_03c78d
    sei
    jsr sub_03c896
    jsr sub_03c5c0
    stz $10
    stz $12
    stz $14
    stz $16
    stz $1e
    stz $20
    ldx #$0020

loc_03c0f8:
.a8
    phx
    stx $1c
    jsr sub_03c8cb
    rep #$20
.a16
    lda $18
    clc
    adc $10
    sta $10
    lda $1a
    clc
    adc $12
    sta $12
    jsr sub_03bd7a
    sep #$20
.a8
    lda $10
    sta BG1HOFS
    lda $11
    sta BG1HOFS
    lda $12
    sta BG1VOFS
    lda $13
    sta BG1VOFS
    plx
    dex
    bne loc_03c0f8
    sep #$20
    rep #$10
    lda #$02
    sta HDMAEN
    lda #$64
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$62
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0011
    sta $700064
    lda #$fb89
    sta $700062
    lda #$6820
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    lda #$b8
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    jsl sub_7e33ba
    rep #$20
.a16
    lda #$0017
    sta $700064
    lda #$8718
    sta $700062
    lda #$7c00
    sta $188a
    lda #$0800
    sta $188c
    lda #$0002
    sta $700090
    sep #$20
.a8
    jsl sub_03ab7e
    lda #$b8
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    jsl sub_7e33ba
    jsr sub_03c5d4
    lda #$b8
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$03
    sta TM
    lda #$82
    sta CGADSUB
    stz CGWSEL
    lda #$ff
    sta COLDATA
    sta $7ef0c6
    ldx #$00ba
    stx VTIMEL
    lda #$22
    sta $00
    lda $004211
    cli
    jsr sub_03c777
    jsr sub_03c763
    jsr sub_03c74d
    rep #$20
.a16
    lda #$000f
    sta $7001f2
    lda #$7800
    sta $700030
    jsr sub_03ca1c
    jsr sub_03c87b
    sep #$20
.a8
    lda #$d8
    sta BG1VOFS
    stz BG1VOFS
    stz BG1HOFS
    stz BG1HOFS
    lda #$2c
    sta BG1SC
    rep #$20
.a16
    lda $16d9
    asl a
    tax
    sep #$20
.a8
    lda $03d391,x
    bit #$80
    bne loc_03c246
    lda #$0d
    sta $1f47
    stz $1f46
    bra loc_03c24e

loc_03c246:
    lda #$0b
    sta $1f47
    stz $1f46

loc_03c24e:
    ldx #$0028

loc_03c251:
    phx
    jsr sub_03c58f
    jsr sub_03ca1c
    jsr sub_03c87b
    rep #$20
.a16
    lda $16d9
    asl a
    tax
    lda $03d391,x
    bit #$0080
    bne loc_03c292
    lda $7001f2
    inc a
    cmp #$007e
    beq loc_03c2b1
    sta $7001f2
    bit #$0001
    beq loc_03c2b1
    plx
    cpx #$0014
    bne loc_03c28c
    sep #$20
.a8
    lda #$fe
    sta $7ef0c6

loc_03c28c:
    rep #$20
.a16
    inx
    phx
    bra loc_03c2b1

loc_03c292:
    plx
    cpx #$0005
    bne loc_03c2a0
    sep #$20
.a8
    lda #$fe
    sta $7ef0c6

loc_03c2a0:
    rep #$20
.a16
    phx
    lda $7001f2
    inc a
    cmp #$003a
    beq loc_03c2b1
    sta $7001f2

loc_03c2b1:
    lda $700022
    clc
    adc #$0400
    sta $700022
    lda $7001d6
    sec
    sbc #$000a
    sta $7001d6
    lda $7001da
    clc
    adc #$000a
    sta $7001da
    plx
    cpx #$0012
    bcs loc_03c2e6
    txy
    sep #$20
.a8
    dex
    lda $03d68c,x
    tyx
    rep #$20

loc_03c2e6:
.a16
    dex
    beq loc_03c2ec
    brl loc_03c251

loc_03c2ec:
    sep #$20
.a8
    rep #$10
    ldx #$00de
    stx VTIMEL
    lda #$01
    sta $1260
    lda #$00
    sta $7ef0c7
    lda #$22
    sta $7e4600
    lda #$dc
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    stz BG2VOFS
    stz BG2VOFS
    stz BG2HOFS
    stz BG2HOFS

loc_03c320:
    jsr sub_03c777
    jsr sub_03d1bb
    jsr sub_03c763
    rep #$20
.a16
    lda $7000bc
    sep #$20
.a8
    bne loc_03c34c
    lda $7000be
    cmp #$27
    beq loc_03c341
    lda #$89
    jsl sub_03b7f9

loc_03c341:
    lda $7ef0c7
    inc a
    sta $7ef0c7
    bra loc_03c320

loc_03c34c:
    lda #$00
    sta $7ef0c7

loc_03c352:
    jsr sub_03c777
    lda $7ef0c7
    pha
    lda #$ff
    sta $7ef0c7
    jsr sub_03d1bb
    pla
    sta $7ef0c7
    jsr sub_03d133
    jsr sub_03c763
    rep #$20
.a16
    lda $7000bc
    sep #$20
.a8
    bne loc_03c386
    lda $7000be
    cmp #$27
    beq loc_03c386
    lda #$89
    jsl sub_03b7f9

loc_03c386:
    lda #$32

loc_03c388:
    pha
    jsl sub_03cbe8
    lda #$78
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda $120a
    bit #$10
    bne loc_03c3c2
    lda $120a
    bit #$80
    bne loc_03c3c2
    lda $1209
    bit #$80
    bne loc_03c3c2
    pla
    dec a
    beq loc_03c388
    lda $7ef0c7
    cmp #$ff
    beq loc_03c3c3
    inc a
    sta $7ef0c7
    bra loc_03c352

loc_03c3c2:
    pla

loc_03c3c3:
    lda #$13
    jsl sub_03b7f9
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$de
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$de
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    sei
    sep #$20
    lda #$83
    sta CGADSUB
    stz CGWSEL
    lda #$e0
    sta COLDATA
    lda #$00

loc_03c40f:
    pha
    lda #$dd
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$dc
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    pla
    ora #$e0
    sta COLDATA
    and #$1f
    inc a
    cmp #$20
    bne loc_03c40f
    jsr sub_03d11c
    jsr sub_03bd7a
    rep #$30
.a16
    lda $1ff7
    sta $16fd
    sep #$20
.a8
    lda $1ff9
    sta $1ff4
    rep #$20
.a16
    jml loc_02e3c5

loc_03c453:
    php
    sep #$20
.a8
    rep #$10
    jsl sub_03cc3e
    lda $16d9
    rep #$20
.a16
    and #$00ff
    asl a
    asl a
    tax
    lda $03d3c6,x
    sta $38
    sta $32
    sep #$20
.a8
    lda $16d6
    pha
    lda #$14
    sta $16d6
    jsl sub_03cc3e
    pla
    sta $16d6
    plp
    rts

sub_03c484:
    php
    rep #$30
.a16
    lda $32
    cmp $38
    beq loc_03c490
    brl loc_03c50b

loc_03c490:
    sep #$20
.a8
    ldx $02
    beq loc_03c49c
    lda $03d69d,x
    bpl loc_03c4cc

loc_03c49c:
    jsl sub_03cc3e
    lda $16d9
    rep #$20
.a16
    stz $02
    asl a
    tax
    lda $03d42a,x
    sta $38
    cmp $32
    beq loc_03c50e
    sep #$20
.a8
    lda $39
    cmp $33
    bmi loc_03c50b
    lda $33
    sta $39
    rep #$20
.a16
    lda $32
    cmp $38
    beq loc_03c50e
    sep #$20
.a8
    jmp loc_03c50b

loc_03c4cc:
    cmp #$04
    beq loc_03c4dc
    cmp #$02
    beq loc_03c4d8
    lda #$02
    bra loc_03c4de

loc_03c4d8:
    lda #$01
    bra loc_03c4de

loc_03c4dc:
    lda #$00

loc_03c4de:
    sta $36
    rep #$20
.a16
    ldy $30
    lda $03d69d,x
    sta $0002,y
    lda $08
    sta $0000,y
    iny
    iny
    iny
    iny
    sty $30
    lda $08
    clc
    adc $03d69f,x
    sta $08
    sec
    sbc #$0810
    sta $38
    inx
    inx
    inx
    inx
    stx $02

loc_03c50b:
    plp
    clc
    rts

loc_03c50e:
    plp
    sec
    rts

sub_03c511:
    php
    sep #$20
.a8
    lda $56
    bne loc_03c523
    lda $16ed
    beq loc_03c523
    lda #$91
    jsl sub_03b7f9

loc_03c523:
    lda $16ed
    sta $56
    rep #$30
.a16
    lda $16e8
    sta $7001da
    lda $16ed
    and #$00ff
    bne loc_03c557
    lda $7001d6
    ldx $16e4
    jsr sub_03c575
    sta $7001d6
    lda $7001d8
    ldx $16e6
    jsr sub_03c575
    sta $7001d8
    plp
    rts

loc_03c557:
    lda $7001d6
    ldx $16e4
    jsr sub_03c57f
    sta $7001d6
    lda $7001d8
    ldx $16e6
    jsr sub_03c57f
    sta $7001d8
    plp
    rts

sub_03c575:
    stx $02
    cmp $02
    bmi loc_03c57d
    dec a
    rts

loc_03c57d:
    inc a
    rts

sub_03c57f:
    stx $02
    cmp $02
    bmi loc_03c58a
    sec
    sbc #$0010
    rts

loc_03c58a:
    clc
    adc #$0010
    rts

sub_03c58f:
.a8
    php
    rep #$30
.a16
    ldx #$0000

loc_03c595:
    lda $24,x
    clc
    adc $03c5a7,x
    sta $24,x
    inx
    inx
    cpx #$000c
    bne loc_03c595
    plp
.a8
    rts
    .db $00,$06,$00,$fd,$00,$04,$00,$03,$00,$fb,$00,$fb,$00,$1c,$00,$f6
    .db $00,$28,$00,$32,$00,$ec,$00,$e4

sub_03c5bf:
.a16
    rts

sub_03c5c0:
    php
    sep #$20
.a8
    jsr sub_03bd7a
    stz COLDATA
    stz CGWSEL
    stz CGADSUB
    stz WOBJSEL
    plp
.a16
    rts

sub_03c5d4:
.a8
    php
    rep #$30
.a16
    lda #$00b8
    sta $16db
    jsl sub_03bd8d
    rep #$30
    sei
    sep #$20
.a8
    lda #$80
    sta VMAIN
    rep #$20
.a16
    ldx #$5200
    ldy #$6c20

loc_03c5f3:
    stx VMADDL
    lda VMDATALREAD
    sty VMADDL
    sta VMDATAL
    inx
    iny
    cpx #$5340
    bne loc_03c5f3
    sep #$20
.a8
    lda $004211
    rep #$20
.a16
    cli
    plp
.a8
    rts

sub_03c611:
    php
    rep #$30
.a16
    lda #$00e0
    sta $16db
    jsl sub_03bd8d
    rep #$30
    lda $16d9
    asl a
    asl a
    tax
    sep #$20
.a8
    lda $03d3c6,x
    inc a
    sta WH0
    clc
    adc #$1d
    sta WH1
    lda $03d3c7,x
    lsr a
    sta $02
    sta $7e4610
    lda $03d3c7,x
    sec
    sbc $02
    sta $7e4612
    lda #$0c
    sta HDMAEN
    lda #$30
    sta WOBJSEL
    stz WBGLOG
    lda #$0c
    stz WOBJLOG
    lda #$03
    sta TM
    lda #$01
    sta TS
    stz TMW
    stz TSW
    lda #$20
    sta CGWSEL
    lda #$93
    sta CGADSUB
    lda #$e0
    sta COLDATA
    plp
    rts

sub_03c67f:
    php
    rep #$30
.a16
    phx
    lda $02
    pha
    lda $14c5
    pha
    jsl sub_02e8a8
    jsr sub_03bd7a
    lda #$7f38
    sta VMADDL
    lda $16d8
    and #$00ff
    asl a
    tax
    lda $03c716,x
    sta VMDATAL
    inc a
    sta VMDATAL
    inc a
    sta VMDATAL
    inc a
    sta VMDATAL
    inc a
    sta VMDATAL
    inc a
    sta VMDATAL
    lda #$7f18
    sta VMADDL
    lda #$0064
    jsr sub_03c6f9
    lda #$000a
    jsr sub_03c6f9
    lda #$0001
    jsr sub_03c6f9
    lda #$18a8
    sta VMDATAL
    sta VMDATAL
    ldy $1898
    beq loc_03c6ef
    lda #$7efb
    sta VMADDL
    lda #$18de

loc_03c6e9:
    sta VMDATAL
    dey
    bne loc_03c6e9

loc_03c6ef:
    pla
    sta $14c5
    pla
    sta $02
    plx
    plp
.a8
    rts

sub_03c6f9:
.a16
    sta $02
    ldx #$ffff
    lda $14c5

loc_03c701:
    inx
    sec
    sbc $02
    bpl loc_03c701
    clc
    adc $02
    sta $14c5
    txa
    clc
    adc #$18a8
    sta VMDATAL
    rts
    .db $94,$18,$8e,$18,$9a,$18

sub_03c71c:
.a8
    php
    sep #$20
    rep #$10
    ldx $4a
    lda #$80
    sta VMAIN
    lda #$18
    sta BBAD7
    stx VMADDL
    ldx #$2c00
    stx A1TL7
    lda #$70
    sta A1B7
    ldx #$4000
    stx DASL7
    lda #$01
    sta DMAP7
    lda #$80
    sta MDMAEN
    plp
    rts

sub_03c74d:
    php
    sep #$20
    rep #$10
    sep #$20
    lda #$01
    ldx #$b09b
    jsl sub_7e4ee9
    sep #$20
    rep #$10
    plp
    rts

sub_03c763:
    php
    sep #$20
    rep #$10

loc_03c768:
    lda $1fe5
    bne loc_03c768
    inc $1fe5

loc_03c770:
    lda $1fe5
    bne loc_03c770
    plp
    rts

sub_03c777:
    php
    sep #$20
    rep #$10
    sep #$20
    lda #$01
    ldx #$b0ab
    jsl sub_7e4ee9
    sep #$20
    rep #$10
    plp
    rts

sub_03c78d:
.a16
    php
    sep #$20
.a8
    rep #$10

loc_03c792:
    lda $1fe5
    bne loc_03c792
    lda #$01
    sta $1fe5

loc_03c79c:
    lda $1fe5
    bne loc_03c79c
    plp
.a16
    rts
    .db $08,$c2,$20,$ad,$bb,$15,$29,$07,$00,$2a,$aa,$e2,$20,$7c,$b3,$c7
    .db $c3,$c7,$f1,$c7,$1e,$c8,$4b,$c8,$4b,$c8,$1e,$c8,$f1,$c7,$c3,$c7
    .db $a2,$20,$5e,$a9,$80,$8d,$15,$21,$a9,$18,$8d,$01,$43,$8e,$16,$21
    .db $a2,$17,$d9,$8e,$02,$43,$a9,$03,$8d,$04,$43,$a2,$80,$00,$8e,$05
    .db $43,$a9,$01,$8d,$00,$43,$a9,$01,$8d,$0b,$42,$82,$85,$00,$a2,$20
    .db $5e,$a9,$80,$8d,$15,$21,$a9,$18,$8d,$01,$43,$8e,$16,$21,$a2,$97
    .db $d9,$8e,$02,$43,$a9,$03,$8d,$04,$43,$a2,$80,$00,$8e,$05,$43,$a9
    .db $01,$8d,$00,$43,$a9,$01,$8d,$0b,$42,$80,$58,$a2,$20,$5e,$a9,$80
    .db $8d,$15,$21,$a9,$18,$8d,$01,$43,$8e,$16,$21,$a2,$17,$da,$8e,$02
    .db $43,$a9,$03,$8d,$04,$43,$a2,$80,$00,$8e,$05,$43,$a9,$01,$8d,$00
    .db $43,$a9,$01,$8d,$0b,$42,$80,$2b,$a2,$20,$5e,$a9,$80,$8d,$15,$21
    .db $a9,$18,$8d,$01,$43,$8e,$16,$21,$a2,$97,$da,$8e,$02,$43,$a9,$03
    .db $8d,$04,$43,$a2,$80,$00,$8e,$05,$43,$a9,$01,$8d,$00,$43,$a9,$01
    .db $8d,$0b,$42,$ee,$bb,$15,$28,$60

sub_03c87b:
.a8
    php
    sep #$20
    rep #$10

loc_03c880:
    lda $1fe5
    bne loc_03c880
    lda #$04
    sta $1fe5

loc_03c88a:
    lda $1fe5
    bne loc_03c88a
    plp
    rts

sub_03c891:
    php
    rep #$20
.a16
    bra loc_03c8a5

sub_03c896:
    php
    rep #$20
    lda #$00e0
    sta $16db
    jsl sub_03bd8d
    rep #$30

loc_03c8a5:
    lda #$0000
    cmp $4a
    beq loc_03c8b5
    sta $4a
    lda #$3000
    sta $4c
    bra loc_03c8bc

loc_03c8b5:
    sta $4c
    lda #$3000
    sta $4a

loc_03c8bc:
    sep #$20
.a8
    lda $4b
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$50
    sta BG12NBA
    plp
    rts

sub_03c8cb:
    php
    rep #$30
.a16
    lda $16d9
    and #$00ff
    asl a
    asl a
    tax
    lda $1e
    sta $22
    lda $03d3c6,x
    and #$00ff
    sec
    sbc #$0070
    sec
    sbc $10
    beq loc_03c8ee
    jsr sub_03c913

loc_03c8ee:
    sta $18
    lda $22
    sta $1e
    lda $20
    sta $22
    lda $03d3c7,x
    and #$00ff
    sec
    sbc #$0058
    sec
    sbc $12
    beq loc_03c90b
    jsr sub_03c913

loc_03c90b:
    sta $1a
    lda $22
    sta $20
    plp
.a8
    rts

sub_03c913:
.a16
    php
    phx
    rep #$10
    cmp #$8000
    bcs loc_03c939
    ldx #$ffff

loc_03c91f:
    inx
    sec
    sbc $1c
    bcs loc_03c91f
    clc
    adc $1c
    clc
    adc $22
    cmp $1c
    bcc loc_03c933
    sec
    sbc $1c
    inx

loc_03c933:
    sta $22
    txa
    plx
    plp
    rts

loc_03c939:
    ldx #$0001

loc_03c93c:
    dex
    clc
    adc $1c
    bcc loc_03c93c
    sec
    sbc $1c
    clc
    adc $22
    cmp $1c
    bcc loc_03c950
    sec
    sbc $1c
    dex

loc_03c950:
    sta $22
    txa
    plx
    plp
    rts

sub_03c956:
    php
    rep #$30
    lda $16d9
    jsr sub_03c9c8
    lda $16d9
    and #$0003
    xba
    lsr a
    lsr a
    lsr a
    clc
    adc #$0010
    sta $7001f8
    lda $16d9
    and #$00fc
    asl a
    asl a
    asl a
    clc
    adc #$0010
    sta $7001fa
    lda #$0006
    sta $70009a
    lda #$7800
    sta $700030
    lda $16d9
    asl a
    tax
    lda $03d391,x
    sta $700098
    lda #$000f
    sta $7001f2
    sep #$20
.a8
    lda $700098
    bmi loc_03c9b7
    lda #$01
    ldx #$cbf6
    jsl sub_7e4ee9
    bra loc_03c9c6

loc_03c9b7:
    and #$7f
    sta $700098
    lda #$01
    ldx #$b807
    jsl sub_7e4ee9

loc_03c9c6:
    plp
.a16
    rts

sub_03c9c8:
    php
    rep #$30
    asl a
    pha
    asl a
    tax
    lda $03d3c6,x
    and #$00ff
    sta $700026
    lda $03d3c7,x
    and #$00ff
    sta $700028
    lda #$0000
    sta $70002a
    plx
    lda $03d392,x
    and #$00ff
    tax
    lda $000024,x
    sta $700022
    lda $03c5b3,x
    cmp #$ffff
    bne loc_03ca16
    tay
    lda $700022
    sta $700024
    tya
    sta $700022
    bra loc_03ca1a

loc_03ca16:
    sta $700024

loc_03ca1a:
    plp
    rts

sub_03ca1c:
.a8
    php
    rep #$30
.a16
    lda #$0040
    sta $7001f8
    sta $7001fa
    lda #$0006
    sta $70009a
    lda #$0020
    sta $7000b6
    lda $7001f2
    clc
    adc #$0011
    sta $7000bc
    lda $16d9
    jsr sub_03c9c8
    lda $16d9
    asl a
    tax
    lda $03d391,x
    sta $700098
    sep #$20
.a8
    lda $700098
    bmi loc_03ca6a
    lda #$01
    ldx #$cc59
    jsl sub_7e4ee9
    bra loc_03ca79

loc_03ca6a:
    and #$7f
    sta $700098
    lda #$01
    ldx #$b807
    jsl sub_7e4ee9

loc_03ca79:
    plp
    rts

sub_03ca7b:
    php
    rep #$30
.a16
    lda $70009a
    eor #$000f
    and #$000f
    xba
    asl a
    asl a
    asl a
    lda #$7800
    sta $700030
    ldx #$0000
    lda #$fff0
    sta $7001f8
    lda #$0010
    sta $7001fa

loc_03caa4:
    lda $7ef0da
    bne loc_03cab5
    cpx #$000e
    bne loc_03cab5
    jsr sub_03cb10
    jmp loc_03cb08

loc_03cab5:
    phx
    txa
    asl a
    tax
    lda $03d391,x
    and #$00ff
    sta $700098
    txa
    lsr a
    tax
    phx
    txa
    jsr sub_03c9c8
    plx
    jsr sub_03cb10
    lda #$000f
    sta $7001f2
    sep #$20
.a8
    cpx $16d9
    beq loc_03cb05
    lda $700098
    bmi loc_03caf6
    lda $16d9
    cmp #$fe
    beq loc_03cb05
    lda #$01
    ldx #$cbf6
    jsl sub_7e4ee9
    bra loc_03cb05

loc_03caf6:
    and #$7f
    sta $700098
    lda #$01
    ldx #$b807
    jsl sub_7e4ee9

loc_03cb05:
    rep #$20
.a16
    plx

loc_03cb08:
    inx
    cpx #$0010
    bne loc_03caa4
    plp
.a8
    rts

sub_03cb10:
.a16
    lda $7001f8
    clc
    adc #$0020
    sta $7001f8
    cmp #$0080
    bcc loc_03cb34
    lda #$0010
    sta $7001f8
    lda $7001fa
    clc
    adc #$0020
    sta $7001fa

loc_03cb34:
    rts

sub_03cb35:
.a8
    php
    sep #$20
    rep #$10
    stz CGADD
    ldx #$0000

loc_03cb40:
    lda $03d46c,x
    sta CGDATA
    inx
    cpx #$0200
    bne loc_03cb40
    plp
    rtl

sub_03cb4f:
    php
    sep #$20
    rep #$10
    pha
    jsr sub_03bd7a
    pla
    rep #$20
.a16
    and #$00fe
    tax
    sep #$20
.a8
    stz CGADD
    lda $03d44c,x
    sta CGDATA
    lda $03d44d,x
    sta CGDATA
    plp
    rts
    .db $60,$60,$08,$c2,$30,$ad,$c2,$15,$c9,$0e,$00,$b0,$27,$20,$75,$cb
    .db $ad,$c2,$15,$1a,$8d,$c2,$15,$c9,$0e,$00,$90,$12,$a6,$30,$a5,$0c
    .db $95,$00,$a5,$0a,$95,$02,$e8,$e8,$e8,$e8,$86,$30,$80,$00,$28,$18
    .db $60,$28,$38,$60,$20,$c1,$cb,$b0,$f8,$9c,$c2,$15,$80,$cf

sub_03cbb2:
.a16
    sep #$20
.a8
    asl a
    asl a
    asl a
    xba
    asl a
    asl a
    asl a
    xba
    rep #$20
.a16
    sta $0c
    rts
    .db $08,$c2,$30,$a6,$02,$a5,$08,$18,$7f,$9f,$d6,$03,$85,$08,$bf,$9d
    .db $d6,$03,$c9,$ff,$ff,$f0,$0d,$85,$0a,$e8,$e8,$e8,$e8,$86,$02,$e6
    .db $04,$28,$18,$60,$28,$38,$60

sub_03cbe8:
.a8
    php
    sep #$20

loc_03cbeb:
    lda HVBJOY
    bit #$01
    beq loc_03cbeb

loc_03cbf2:
    lda HVBJOY
    bit #$01
    bne loc_03cbf2
    bra loc_03cbfc

sub_03cbfb:
.a16
    php

loc_03cbfc:
.a8
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
    plp
.a8
    rtl

sub_03cc22:
.a16
    php
    sep #$20
.a8
    rep #$10
    ldx #$1281
    stx $30
    ldy #$0014
    lda #$f8

loc_03cc31:
    sta $00,x
    sta $01,x
    inx
    inx
    inx
    inx
    dey
    bne loc_03cc31
    plp
.a16
    rtl

sub_03cc3e:
    php
    rep #$30
    ldx #$1281
    stx $30
    sep #$20
.a8
    lda #$1e
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda $16d6
    sta $02
    stz $03
    rep #$30
.a16
    lda $16d8
    asl a
    and #$00ff
    tax
    lda $03d69d,x
    tax

loc_03cc6b:
    lda $03d69d,x
    and #$00ff
    bne loc_03cc77
    brl loc_03ccff

loc_03cc77:
    cmp #$0003
    beq loc_03cc93
    cmp #$0002
    beq loc_03cc88
    lda $03d69e,x
    tax
    bra loc_03cc6b

loc_03cc88:
    lda $03d69e,x
    tax
    lda $16ce,x
    tax
    bra loc_03cc6b

loc_03cc93:
    lda $03d69e,x
    jsr sub_03cbb2
    tay
    lda $03d6a0,x
    and #$00ff
    sta $16d9
    lda $03d6a1,x
    sta $1ff7
    lda $03d6a2,x
    sta $1ff8
    sep #$20
.a8
    lda $03d6a4,x
    sta $7ef0c8
    lda $03d6a5,x
    sta $1ffd
    rep #$20
.a16
    txa
    clc
    adc #$0009
    tax
    lda $02
    beq loc_03cd02

loc_03ccd0:
    tya
    phx
    ldx $30
    sta $00,x
    plx
    clc
    adc $03d69f,x
    tay
    lda $03d69d,x
    cmp #$ffff
    beq loc_03ccf8
    phx
    ldx $30
    sta $02,x
    inx
    inx
    inx
    inx
    stx $30
    plx
    inx
    inx
    inx
    inx
    bra loc_03ccd0

loc_03ccf8:
    inx
    inx
    dec $02
    brl loc_03cc6b

loc_03ccff:
    plp
    sec
    rtl

loc_03cd02:
    stx $02
    sty $08
    plp
    clc
    rtl

sub_03cd09:
    php
    sep #$30
.a8
.i8
    sei
    stz $00
    lda #$03
    sta $1260
    jsl sub_02f907
    stz CGADD
    stz VMADDL
    stz VMADDH
    lda #$80
    sta INIDISP
    sta VMAIN
    lda #$00
    ldx #$80

loc_03cd2d:
    ldy #$00

loc_03cd2f:
    sta VMDATAL
    sta VMDATAH
    dey
    bne loc_03cd2f
    dex
    bne loc_03cd2d
    lda #$00
    sta $2a
    lda #$00
    sta $2b
    lda #$7f
    sta $2e
    lda #$00
    sta $2f
    lda #$00
    sta $2c
    lda #$00
    sta $2d
    lda #$7f
    sta $30
    lda #$00
    sta $31
    lda #$40
    sta $ca
    lda #$00
    sta $cb
    lda #$40
    sta $cc
    lda #$00
    sta $cd
    jsl sub_03b827
    sep #$30
    lda #$80
    sta $9c
    lda #$ff
    sta $15bf
    rep #$30
.a16
.i16
    lda #$7800
    sta VMADDL
    lda #$0101
    ldx #$0400

loc_03cd88:
    sta VMDATAL
    dex
    bne loc_03cd88
    lda #$7c00
    sta VMADDL
    lda #$0000
    ldx #$0400

loc_03cd9a:
    sta VMDATAL
    dex
    bne loc_03cd9a
    sep #$20
.a8
    rep #$10
    jsl sub_03cfe7
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
    lda #$01
    sta OBSEL
    lda #$78
    sta BG1SC
    lda #$7c
    sta BG2SC
    lda #$03
    sta BGMODE
    stz W12SEL
    stz W34SEL
    stz WOBJSEL
    stz WBGLOG
    stz WOBJLOG
    stz TMW
    stz TSW
    stz WH0
    stz WH1
    stz CGWSEL
    lda #$13
    sta TM
    stz TS
    stz CGADSUB
    stz COLDATA
    rep #$20
.a16
    ldx #$0000

loc_03ce15:
    lda $028fd6,x
    sta $7e4169,x
    inx
    inx
    cpx #$0d80
    bcc loc_03ce15
    sep #$20
.a8
    lda #$00
    sta DMAP1
    lda #$00
    sta BBAD1
    ldx #$45fc
    stx A1TL1
    lda #$7e
    sta A1B1
    stz DASB1
    lda #$00
    sta DMAP2
    lda #$25
    sta BBAD2
    ldx #$4610
    stx A1TL2
    lda #$7e
    sta A1B2
    stz DASB2
    lda #$00
    sta DMAP3
    lda #$00
    sta BBAD3
    ldx #$4605
    stx A1TL3
    lda #$7e
    sta A1B3
    stz DASB3
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0015
    sta $700064
    lda #$d8c0
    sta $700062
    lda #$5200
    sta $188a
    lda #$1c00
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    rep #$20
.a16
    lda #$0016
    sta $700064
    lda #$b334
    sta $700062
    lda #$7c00
    sta $188a
    lda #$2000
    sta $188c
    lda #$0020
    sta $700090
    sep #$20
.a8
    jsl sub_03ab7e
    jsl sub_7e33ba
    jsr sub_03c74d
    jsl sub_03cf14
    sep #$20
    rep #$10
    jsl sub_02f42f
    lda #$80
    sta $7e4608
    sta $7e460a
    sta $7e460c
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$08
    sta $00
    lda #$31
    sta NMITIMEN
    stz $fd
    stz $1fe5
    rep #$20
.a16
    lda $038000
    sta VTIMEL
    lda $038002
    sta HTIMEL
    sep #$20
.a8
    plp
.a16
    rtl

sub_03cf14:
.a8
    php
    sep #$20
    rep #$10
    ldx #$021f

loc_03cf1c:
    stz $1261,x
    dex
    bpl loc_03cf1c
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0220
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    plp
    rtl

sub_03cf4a:
.a16
    stx VMADDL
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    pha
    txa
    clc
    adc #$0020
    tax
    pla
    sec
    sbc #$002f
    stx VMADDL
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    pha
    txa
    clc
    adc #$0020
    tax
    pla
    sec
    sbc #$002f
    stx VMADDL
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    pha
    txa
    clc
    adc #$0020
    tax
    pla
    sec
    sbc #$002f
    stx VMADDL
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    clc
    adc #$0010
    sta VMDATAL
    pha
    txa
    clc
    adc #$0020
    tax
    pla
    sec
    sbc #$002f
    rts

sub_03cfe7:
.a8
    php
    sep #$20
    lda #$80
    sta VMAIN
    rep #$30
.a16
    lda #$7800
    sta VMADDL
    lda #$0100
    ldx #$0400

loc_03cffd:
    sta VMDATAL
    dex
    bne loc_03cffd
    ldx #$0000
    txy

loc_03d007:
    phx
    lda $03d3c4,x
    tax
    tya
    jsr sub_03cf4a
    tya
    clc
    adc #$0040
    cmp #$0100
    bcc loc_03d01f
    sec
    sbc #$00fc

loc_03d01f:
    tay
    plx
    inx
    inx
    inx
    inx
    cpx #$0040
    bne loc_03d007
    ldx #$2000
    stx VMADDL
    ldx #$0000
    ldy #$0020

loc_03d036:
    stx VMDATAL
    dey
    bne loc_03d036
    ldx #$5000
    stx VMADDL
    ldx #$0000
    ldy #$0020

loc_03d048:
    stx VMDATAL
    dey
    bne loc_03d048
    lda #$2c00
    sta VMADDL
    sep #$20
.a8
    lda #$80
    sta VMAIN
    rep #$30
.a16
    lda #$2c00
    sta VMADDL
    lda #$0000
    ldy #$0000

loc_03d069:
    pha
    lda #$3900
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    pla
    ldx #$0000

loc_03d089:
    sta VMDATAL
    clc
    adc #$0010
    inx
    cpx #$0010
    bne loc_03d089
    pha
    lda #$3900
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    pla
    sec
    sbc #$00ff
    iny
    cpy #$0010
    bne loc_03d069
    lda #$3900
    ldx #$0080

loc_03d0c3:
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    sta VMDATAL
    dex
    bne loc_03d0c3
    plp
.a8
    rtl
    .db $28,$6b

sub_03d0d6:
    php
    rep #$20
.a16
    lda #$0224
    sta $16ce
    sta $7ef0da
    plp
    rtl
    .db $08,$c2,$20,$a9,$0a,$02,$8d,$d0,$16,$28,$6b,$08,$c2,$20,$a9,$6a
    .db $01,$8d,$d2,$16,$28,$6b

sub_03d0fb:
.a8
    php
    rep #$20
.a16
    lda #$019a
    sta $16d4
    plp
    rtl

sub_03d106:
.a8
    php
    rep #$20
.a16
    lda #$0184
    sta $16d4
    plp
    rtl

sub_03d111:
.a8
    php
    rep #$20
.a16
    lda #$01cc
    sta $16d4
    plp
    rtl

sub_03d11c:
.a8
    php
    sep #$20
    lda $16d8
    beq loc_03d12c
    cmp #$01
    bne loc_03d12e
    lda #$00
    bra loc_03d12e

loc_03d12c:
    lda #$01

loc_03d12e:
    sta $16d8
    plp
    rts

sub_03d133:
    php
    rep #$30
.a16
    lda $7ef0c8
    and #$00ff
    dec a
    cmp #$ffff
    beq loc_03d1b9
    asl a
    tax
    lda $01fbd9,x
    inc a
    inc a
    sta $7000a6
    lda #$0005
    sta $700206
    lda #$00c0
    sta $7000a8
    lda #$0002
    sta $700062
    sta $70002c
    lda $7ef0c7
    and #$00ff
    sta $7000bc
    txa
    sep #$20
.a8
    lda #$01
    ldx #$b509
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    rep #$30
    lda #$000d
    sta $700206
    lda #$00be
    sta $7000a8
    lda #$0000
    sta $700062
    sta $70002c
    lda $7ef0c7
    and #$00ff
    sta $7000bc
    txa
    sep #$20
.a8
    lda #$01
    ldx #$b509
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10

loc_03d1b9:
    plp
.a8
    rts

sub_03d1bb:
    php
    rep #$30
.a16
    lda $16d9
    and #$00ff
    tax
    lda $03d3b3,x
    and #$00ff
    dec a
    cmp #$ffff
    beq loc_03d24e
    asl a
    tax
    lda $01fbd9,x
    inc a
    inc a
    sta $7000a6
    lda #$0001
    sta $700206
    lda #$00c0
    sta $7000a8
    lda #$0002
    sta $700062
    lda #$0032
    sta $70002c
    lda $7ef0c7
    and #$00ff
    sta $7000bc
    txa
    sep #$20
.a8
    lda #$01
    ldx #$b509
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    rep #$30
    lda #$0004
    sta $700206
    lda #$00be
    sta $7000a8
    lda #$0000
    sta $700062
    lda #$0030
    sta $70002c
    lda $7ef0c7
    and #$00ff
    sta $7000bc
    txa
    sep #$20
.a8
    lda #$01
    ldx #$b509
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10

loc_03d24e:
    plp
.a8
    rts
    .incbin "data/01d250-01db17.bin"

sub_03db17:
    php
    sep #$20
    rep #$10
    stz $15ab
    stz $15b8
    stz $15b9
    stz $15b5
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0014
    sta $700064
    lda #$e0fe
    sta $700062
    lda #$6800
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    ldx #$021f

loc_03db58:
    stz $1261,x
    dex
    bpl loc_03db58
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0220
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    plp
    rtl

sub_03db86:
.a16
    sep #$20
.a8
    rep #$10
    lda $1f0d
    bne loc_03dbcf
    ldx #$0000
    stx $15af
    stx $15b1
    stx $15b3
    lda $1962
    inc a
    bne loc_03dbbc
    lda $70021c
    beq loc_03dbbc
    jsr sub_03e08a
    jsr sub_03e0f1
    jsr sub_03dc09
.a16
    jsr sub_03dc4c
    jsr sub_03e184
.a8
    jsr sub_03e1c6
.a16
    jsr sub_03dddf

loc_03dbbc:
.a8
    jsr sub_03e392
    sep #$20
    lda $1fd1
    bne loc_03dbc9
    jsr sub_03dd34

loc_03dbc9:
    jsr sub_03dd7f
.a16
    jsr sub_03dbd4

loc_03dbcf:
.a8
    rtl

sub_03dbd0:
.a16
    jsr sub_03dbd4
    rtl

sub_03dbd4:
    rep #$20
    lda #$0148
    sec
    sbc $15af
    bmi loc_03dbec
    ldx $15af

loc_03dbe2:
    stz $1261,x
    inx
    inx
    dec a
    dec a
    bpl loc_03dbe2
    rts

loc_03dbec:
    sep #$20
.a8
    sep #$20
    lda #$00
    sta $002100
    lda #$00

loc_03dbf8:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    dec a
    bne loc_03dbf8
    lda #$0f
    sta $002100
    rts

sub_03dc09:
    rep #$30
.a16
    ldx $15af
    lda #$20bd
    sta $1263,x
    lda #$1110
    sta $1261,x
    lda #$20e2
    sta $1267,x
    lda #$1118
    sta $1265,x
    lda $16ec
    and #$00ff
    bne loc_03dc31
    lda #$0001

loc_03dc31:
    dec a
    sta $02
    lda #$20e3
    clc
    adc $02
    sta $126b,x
    lda #$1120
    sta $1269,x
    txa
    clc
    adc #$000c
    sta $15af
    rts

sub_03dc4c:
    rep #$30
    ldx $15af
    lda #$b718
    sta $1261,x
    lda #$b720
    sta $1265,x
    lda #$b728
    sta $1269,x
    lda #$b730
    sta $126d,x
    lda #$20cb
    sta $1263,x
    lda #$20cc
    sta $1267,x
    lda #$20cd
    sta $126b,x
    lda #$20ce
    sta $126f,x
    txa
    clc
    adc #$0010
    sta $15af
    rts

sub_03dc8a:
    php
    rep #$20
    stz $02
    stz $08
    stz $90
    stz $04
    stz $0a
    stz $15c2
    sep #$20
.a8
    stz $02
    stz $08
    lda #$e2
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
    bit #$0080
    beq loc_03dccb
    ora #$ff00
    bra loc_03dcce

loc_03dccb:
    and #$00ff

loc_03dcce:
    clc
    adc $0c,x
    sec
    sbc $c1
    sta $700062
    lda $0a
    bit #$0080
    beq loc_03dce4
    ora #$ff00
    bra loc_03dce7

loc_03dce4:
    and #$00ff

loc_03dce7:
    clc
    adc $0e,x
    sec
    sbc $c3
    sta $70002c
    lda $15c2
    bit #$0080
    beq loc_03dcfe
    ora #$ff00
    bra loc_03dd01

loc_03dcfe:
    and #$00ff

loc_03dd01:
    clc
    adc $10,x
    sec
    sbc $c5
    sta $70002e
    sep #$20
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
.a16
.i16
    rtl

sub_03dd34:
.a8
    sep #$20
    lda $15b5
    and #$ff
    beq loc_03dd7e
    dec a
    sta $15b5
    lda $15bb
    and #$07
    cmp #$03
    beq loc_03dd7e
    bcc loc_03dd7e
    rep #$20
.a16
    ldy $15af
    sty $15b1
    lda #$4848
    sta $3a
    ldx $15af
    phx
    ldx #$000e
    jsr sub_03de1d
    plx
    rep #$20

loc_03dd66:
    lda $1263,x
    ora #$0400
    sta $1263,x
    inx
    inx
    inx
    inx
    cpx $15af
    bne loc_03dd66
    ldy $15af
    sty $15b3

loc_03dd7e:
.a8
    rts

sub_03dd7f:
    rep #$20
.a16
    lda $15b9
    bne loc_03dd87
    rts

loc_03dd87:
    dec a
    sta $15b9
    rep #$20
    lda $15b9
    and #$0007
    cmp #$0003
    bcs loc_03dd99
    rts

loc_03dd99:
    lda $1fde
    and #$00ff
    bne loc_03ddc7
    ldy $15af
    sty $15b1
    lda #$4850
    sta $3a
    ldx #$0000
    jsr sub_03de1d
    lda $16d6
    inc a
    asl a
    tax
    lda $03dee0,x
    tax
    jsr sub_03de1d
    ldy $15af
    sty $15b3
    rts

loc_03ddc7:
    ldy $15af
    sty $15b1
    lda #$4848
    sta $3a
    ldx #$0088
    jsr sub_03de1d
    ldy $15af
    sty $15b3
    rts

sub_03dddf:
    rep #$20
    lda $15b8
    and #$00ff
    beq loc_03de1c
    ldy $15af
    sty $15b1
    lda #$3020
    sta $3a
    ldx #$0000
    jsr sub_03de1d
    lda $16d6
    inc a
    asl a
    tax
    lda $03dee0,x
    tax
    jsr sub_03de1d
    lda $3a
    clc
    adc #$0008
    sta $3a
    ldx #$0020
    jsr sub_03de1d
    ldy $15af
    sty $15b3

loc_03de1c:
    rts

sub_03de1d:
    ldy $15af

loc_03de20:
    phx
    lda $03deb4,x
    cmp #$ffff
    bne loc_03de2d
    brl loc_03deaf

loc_03de2d:
    tax
    lda $03deb4,x
    cmp #$fffe
    bne loc_03de63
    lda $03deb6,x
    sta $1263,y
    lda $03deb8,x
    sta $1267,y
    lda $3a
    sta $1261,y
    lda $3a
    clc
    adc #$0800
    sta $1265,y
    tya
    clc
    adc #$0008
    tay
    lda $3a
    clc
    adc #$0008
    sta $3a
    bra loc_03dea9

loc_03de63:
    sta $1263,y
    lda $03deb6,x
    sta $1267,y
    lda $03deb8,x
    sta $126b,y
    lda $03deba,x
    sta $126f,y
    lda $3a
    sta $1261,y
    lda $3a
    clc
    adc #$0008
    sta $1265,y
    lda $3a
    clc
    adc #$0800
    sta $1269,y
    lda $3a
    clc
    adc #$0808
    sta $126d,y
    tya
    clc
    adc #$0010
    tay
    lda $3a
    clc
    adc #$0010
    sta $3a

loc_03dea9:
    plx
    inx
    inx
    jmp loc_03de20

loc_03deaf:
    sty $15af
    plx
    rts
    .db $ae,$01,$b6,$01,$58,$01,$78,$01,$70,$01,$02,$01,$ff,$ff,$ae,$01
    .db $68,$01,$a6,$01,$58,$01,$8e,$01,$60,$01,$86,$01,$70,$01,$ff,$ff
    .db $68,$01,$86,$01,$70,$01,$58,$01,$a6,$01,$ff,$ff,$48,$00,$4c,$00
    .db $50,$00,$54,$00,$58,$00,$5c,$00,$60,$00,$64,$00,$68,$00,$6c,$00
    .db $70,$00,$76,$00,$7c,$00,$82,$00,$50,$01,$ff,$ff,$08,$01,$ff,$ff
    .db $10,$01,$ff,$ff,$18,$01,$ff,$ff,$20,$01,$ff,$ff,$28,$01,$ff,$ff
    .db $30,$01,$ff,$ff,$38,$01,$ff,$ff,$40,$01,$ff,$ff,$48,$01,$ff,$ff
    .db $08,$01,$50,$01,$ff,$ff,$08,$01,$08,$01,$ff,$ff,$08,$01,$10,$01
    .db $ff,$ff,$08,$01,$18,$01,$ff,$ff,$b6,$01,$a6,$01,$58,$01,$80,$01
    .db $96,$01,$80,$01,$96,$01,$78,$01,$ff,$ff,$d0,$00,$d8,$00,$ff,$ff
    .db $de,$00,$e6,$00,$ee,$00,$f6,$00,$ff,$ff,$e7,$32,$e8,$32,$cf,$30
    .db $cf,$30,$e9,$32,$ea,$32,$cf,$30,$cf,$30,$eb,$32,$ec,$32,$cf,$30
    .db $cf,$30,$ed,$32,$ee,$32,$cf,$30,$cf,$30,$fe,$ff,$ef,$32,$cf,$30
    .db $f0,$32,$f1,$32,$cf,$32,$cf,$32,$fe,$ff,$f2,$32,$cf,$30,$f3,$32
    .db $f4,$32,$cf,$32,$cf,$32,$f5,$32,$f6,$32,$cf,$32,$cf,$32,$f7,$32
    .db $f8,$32,$cf,$32,$cf,$32,$fe,$ff,$f9,$32,$cf,$32,$fe,$ff,$cf,$30
    .db $cf,$30,$fe,$ff,$94,$30,$95,$30,$cf,$30,$96,$30,$cf,$30,$97,$30
    .db $98,$30,$99,$30,$9a,$30,$9b,$30,$9c,$30,$9d,$30,$9e,$30,$9f,$30
    .db $a0,$30,$a1,$30,$a2,$30,$a3,$30,$a4,$30,$a5,$30,$a6,$30,$a7,$30
    .db $a8,$30,$a9,$30,$aa,$30,$ab,$30,$ac,$30,$ad,$30,$ae,$30,$af,$30
    .db $b0,$30,$b1,$30,$b2,$30,$b3,$30,$b4,$30,$b5,$30,$b6,$30,$b7,$30
    .db $b8,$30,$b9,$30,$ba,$30,$bb,$30,$88,$30,$89,$30,$8a,$30,$8b,$30
    .db $d7,$30,$d8,$30,$df,$30,$e0,$30,$d0,$30,$d1,$30,$d2,$30,$d3,$30
    .db $90,$30,$91,$30,$92,$30,$93,$30,$8c,$30,$8d,$30,$8e,$30,$8f,$30
    .db $fe,$ff,$96,$30,$97,$30,$d4,$30,$cf,$30,$d5,$30,$d6,$30,$db,$30
    .db $dc,$30,$dd,$30,$de,$30,$c2,$30,$c3,$30,$c4,$30,$c5,$30,$b8,$30
    .db $b9,$30,$ba,$30,$bb,$30,$d7,$30,$d8,$30,$d9,$30,$da,$30,$80,$30
    .db $81,$30,$82,$30,$83,$30,$84,$30,$85,$30,$86,$30,$87,$30,$ed,$30
    .db $ee,$30,$ef,$30,$ef,$70,$b4,$30,$b5,$30,$c6,$30,$c7,$30,$b8,$30
    .db $c8,$30,$ba,$30,$c8,$b0

sub_03e08a:
.a8
    rep #$20
.a16
    lda #$b6e1
    sta $3a
    ldx $15af
    ldy $15ad
    beq loc_03e0ed
    sep #$20
.a8
    lda $1fc8
    beq loc_03e0a8
    dec $1fc8
    dey
    bne loc_03e0a8
    bra loc_03e0c4

loc_03e0a8:
    rep #$20

loc_03e0aa:
.a16
    lda $3a
    sta $1261,x
    lda #$20bc
    sta $1263,x
    lda $3a
    sec
    sbc #$0009
    sta $3a
    inx
    inx
    inx
    inx
    dey
    bne loc_03e0aa

loc_03e0c4:
    sep #$20
.a8
    lda $1fc8
    beq loc_03e0ed
    lda $15bb
    and #$07
    cmp #$03
    bcc loc_03e0ed
    rep #$20
.a16
    lda $3a
    sta $1261,x
    lda #$20bc
    sta $1263,x
    lda $3a
    sec
    sbc #$0009
    sta $3a
    inx
    inx
    inx
    inx

loc_03e0ed:
.a8
    stx $15af
    rts

sub_03e0f1:
    php
    sep #$20
    rep #$10
    lda $14db
    cmp #$03
    bne loc_03e102
    lda $15ab
    bne loc_03e104

loc_03e102:
    plp
    rts

loc_03e104:
    rep #$20
.a16
    lda $16f2
    sta $72
    lda $16f4
    sta $74
    rep #$20
    ldx $15af
    lda #$28e1
    sta $1263,x
    sep #$20
.a8
    lda $72
    clc
    adc #$74
    sta $1261,x
    lda $74
    clc
    adc #$5c
    sta $1262,x
    rep #$20
.a16
    lda #$68e1
    sta $1267,x
    sep #$20
.a8
    lda $72
    clc
    adc #$84
    sta $1265,x
    lda $74
    clc
    adc #$5c
    sta $1266,x
    rep #$20
.a16
    lda #$a8e1
    sta $126b,x
    sep #$20
.a8
    lda $72
    clc
    adc #$74
    sta $1269,x
    lda $74
    clc
    adc #$6c
    sta $126a,x
    rep #$20
.a16
    lda #$e8e1
    sta $126f,x
    sep #$20
.a8
    lda $72
    clc
    adc #$84
    sta $126d,x
    lda $74
    clc
    adc #$6c
    sta $126e,x
    txa
    clc
    adc #$10
    sta $15af
    plp
    rts

sub_03e184:
.a16
    sep #$20
.a8
    lda $70019a
    and #$ff
    bne loc_03e18f
    rts

loc_03e18f:
    bpl loc_03e192
    lsr a

loc_03e192:
    sta $02
    lda #$c8
    sec
    sbc $02
    rep #$20
.a16
    and #$00ff
    ora #$1000
    ldy #$20f1
    ldx #$0004
    stx $3a
    ldx $15af

loc_03e1ac:
    sta $1261,x
    pha
    tya
    sta $1263,x
    pla
    clc
    adc #$0008
    iny
    inx
    inx
    inx
    inx
    dec $3a
    bne loc_03e1ac
    stx $15af
    rts

sub_03e1c6:
.a8
    rep #$20
.a16
    stz $14c5
    jsr sub_03e201
    jsr sub_03e213
    jsr sub_03e225
    jsr sub_03e237
    lda $15bb
    and #$0001
    beq loc_03e200
    lda $1fcb
    clc
    adc #$0010
    cmp #$0040
    bne loc_03e1fd
    lda $14c5
    beq loc_03e1fa
    sep #$20
.a8
    lda #$8a
    jsl sub_03b7f9
    rep #$20

loc_03e1fa:
.a16
    lda #$0000

loc_03e1fd:
    sta $1fcb

loc_03e200:
    rts

sub_03e201:
    lda $1fc7
    bit #$0001
    bne loc_03e20a
    rts

loc_03e20a:
    inc $14c5
    lda #$0000
    jmp loc_03e249

sub_03e213:
    lda $1fc7
    bit #$0002
    bne loc_03e21c
    rts

loc_03e21c:
    inc $14c5
    lda #$0040
    jmp loc_03e249

sub_03e225:
    lda $1fc7
    bit #$0004
    bne loc_03e22e
    rts

loc_03e22e:
    inc $14c5
    lda #$00c0
    jmp loc_03e249

sub_03e237:
    lda $1fc7
    bit #$0008
    bne loc_03e240
    rts

loc_03e240:
    inc $14c5
    lda #$0080
    jmp loc_03e249

loc_03e249:
    clc
    adc $1fcb
    tax
    ldy $15af
    lda $03e292,x
    sta $1261,y
    lda $03e294,x
    sta $1263,y
    lda $03e296,x
    sta $1265,y
    lda $03e298,x
    sta $1267,y
    lda $03e29a,x
    sta $1269,y
    lda $03e29c,x
    sta $126b,y
    lda $03e29e,x
    sta $126d,y
    lda $03e2a0,x
    sta $126f,y
    tya
    clc
    adc #$0010
    sta $15af
    rts
    .db $77,$18,$be,$20,$7f,$18,$be,$60,$00,$00,$00,$00,$00,$00,$00,$00
    .db $77,$18,$be,$20,$7f,$18,$be,$60,$77,$21,$be,$20,$7f,$21,$be,$60
    .db $00,$00,$00,$00,$00,$00,$00,$00,$77,$21,$be,$20,$7f,$21,$be,$60
    .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .db $77,$c1,$be,$a0,$7f,$c1,$be,$e0,$00,$00,$00,$00,$00,$00,$00,$00
    .db $77,$c1,$be,$a0,$7f,$c1,$be,$e0,$77,$b8,$be,$a0,$7f,$b8,$be,$e0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$77,$b8,$be,$a0,$7f,$b8,$be,$e0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .db $e1,$68,$f0,$20,$e1,$70,$f0,$a0,$00,$00,$00,$00,$00,$00,$00,$00
    .db $e1,$68,$f0,$20,$e1,$70,$f0,$a0,$d8,$68,$f0,$20,$d8,$70,$f0,$a0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$d8,$68,$f0,$20,$d8,$70,$f0,$a0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    .db $18,$68,$f0,$60,$18,$70,$f0,$e0,$00,$00,$00,$00,$00,$00,$00,$00
    .db $18,$68,$f0,$60,$18,$70,$f0,$e0,$21,$68,$f0,$60,$21,$70,$f0,$e0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$21,$68,$f0,$60,$21,$70,$f0,$e0
    .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

sub_03e392:
.a8
    sep #$20
    lda $1fcd
    beq loc_03e3bf
    lda $1898
    rep #$20
.a16
    and #$00ff
    ldx #$24a0
    stx $14c5
    ldx $15af

loc_03e3aa:
    pha
    jsr sub_03e3c0
    lda $14c5
    clc
    adc #$0011
    sta $14c5
    pla
    dec a
    bne loc_03e3aa
    stx $15af

loc_03e3bf:
.a8
    rts

sub_03e3c0:
.a16
    lda $14c5
    sta $1261,x
    lda #$24c0
    sta $1263,x
    lda $14c5
    clc
    adc #$0008
    sta $1265,x
    lda #$64c0
    sta $1267,x
    lda $14c5
    clc
    adc #$0800
    sta $1269,x
    lda #$24c1
    sta $126b,x
    lda $14c5
    clc
    adc #$0808
    sta $126d,x
    lda #$64c1
    sta $126f,x
    txa
    clc
    adc #$0010
    tax
    rts

sub_03e403:
.a8
    php
    phb
    sep #$20
    rep #$10
    lda #$00
    pha
    plb
    lda $1898
    bne loc_03e415
    brl loc_03e77a

loc_03e415:
    stz $00
    stz HDMAEN
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
    lda #$80
    sta INIDISP
    jsl sub_02f8df
    sei
    lda #$22
    sta BBAD0
    lda #$00
    sta CGADD
    ldx #$00e0
    stx A1TL0
    lda #$7f
    sta A1B0
    ldx #$0200
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$01
    jsl sub_02f464
    jsl sub_03ae91
    lda #$e0
    sta COLDATA
    stz CGADSUB
    stz CGWSEL
    stz W12SEL
    stz W34SEL
    stz WOBJSEL
    stz TMW
    stz TSW
    lda #$03
    sta $16ec
    rep #$20
.a16
    stz $12
    stz $14
    stz $1c
    lda #$015e
    sta $70002a
    lda #$0004
    stz $16
    sta $18
    stz $1a
    lda #$0000
    sta $700020
    sta $700022
    sta $700024
    stz $1201
    stz $1205
    stz $1209
    stz $120b
    stz $1e
    lda #$bcd0
    sta $20
    sep #$20
.a8
    jsl sub_03e8b6
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0014
    sta $700064
    lda #$f28e
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
    lda #$0014
    sta $700064
    lda #$f456
    sta $700062
    lda #$7000
    sta $188a
    lda #$2000
    sta $188c
    lda #$00c0
    sta $700090
    sep #$20
.a8
    jsl sub_03ab7e
    jsl sub_7e33ba
    rep #$20
.a16
    lda #$0000
    sta $700090
    lda #$0016
    sta $700064
    lda #$e024
    sta $700062
    lda #$6800
    sta $188a
    lda #$1000
    sta $188c
    sep #$20
.a8
    jsl sub_03ab2b
    jsl sub_7e33ba
    lda #$01
    ldx #$b4df
    jsl sub_7e4ee9
    lda #$80
    sta VMAIN
    rep #$20
.a16
    lda #$731d
    sta VMADDL
    lda $1898
    clc
    adc #$354a
    sta VMDATAL
    sep #$20
.a8
    jsl sub_02dc16
    jsl sub_02dc26
    jsl sub_03e875
    jsl sub_03e8fe
    jsl sub_03e889
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
    ldx #$5400
    stx DASL0
    lda #$01
    sta DMAP0
    lda #$01
    sta MDMAEN
    lda #$8a
    sta $70004e
    lda #$8b
    sta $70004f
    rep #$20
.a16
    lda #$8faa
    sta $700050
    sep #$20
.a8
    rep #$10
    lda #$7f
    sta $7e45f3
    lda #$3a
    sta $7e45f5
    lda #$05
    sta $7e45f7
    stz BG2VOFS
    stz BG2VOFS
    stz BG2HOFS
    stz BG2HOFS
    lda #$01
    sta BGMODE
    lda #$13
    sta TM
    stz TS
    lda #$00
    jsl sub_02f8df
    lda #$f0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    lda #$02
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
    lda $004211
    cli
    jsl sub_03e7ae
    jsl sub_03e7ae
    lda #$00

loc_03e638:
    pha
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    pla
    inc a
    jsl sub_02f8df
    cmp #$0f
    bne loc_03e638

loc_03e650:
    jsl sub_03e7ae
    lda $14
    beq loc_03e664
    inc $14
    cmp #$20
    bne loc_03e661
    brl loc_03e782

loc_03e661:
    jmp loc_03e6ad

loc_03e664:
    lda $1208
    ora $1206
    beq loc_03e68e
    lda $22
    bne loc_03e690
    ldx $1e
    inx
    inx
    rep #$20
.a16
    lda $03ed30,x
    bne loc_03e682
    lda #$bcd0
    ldx #$0000

loc_03e682:
    sta $20
    stx $1e
    sep #$20
.a8
    lda #$01
    sta $22
    bra loc_03e690

loc_03e68e:
    stz $22

loc_03e690:
    lda $1202
    bit #$20
    beq loc_03e6ad
    lda $7ef0dc
    bne loc_03e6b3
    lda $12
    eor #$ff
    sta $12
    lda #$11
    jsl sub_03b7f9
    lda #$01
    bra loc_03e6af

loc_03e6ad:
    lda #$00

loc_03e6af:
    sta $7ef0dc

loc_03e6b3:
    lda $1202
    bit #$02
    beq loc_03e6bc
    inc $18

loc_03e6bc:
    lda $1202
    bit #$01
    beq loc_03e6c5
    dec $18

loc_03e6c5:
    lda $1202
    bit #$08
    beq loc_03e6ce
    inc $16

loc_03e6ce:
    lda $1202
    bit #$04
    beq loc_03e6d7
    dec $16

loc_03e6d7:
    lda $1201
    bit #$20
    beq loc_03e6f1
    rep #$20
.a16
    lda $70002a
    sec
    sbc #$0014
    cmp #$0096
    bcc loc_03e6f1
    sta $70002a

loc_03e6f1:
    sep #$20
.a8
    lda $1201
    bit #$10
    beq loc_03e70d
    rep #$20
.a16
    lda $70002a
    clc
    adc #$0014
    cmp #$03e8
    bcs loc_03e70d
    sta $70002a

loc_03e70d:
    sep #$20
.a8
    lda $1201
    bit #$80
    beq loc_03e71a
    lda #$00
    bra loc_03e71c

loc_03e71a:
    lda #$01

loc_03e71c:
    sta $7001b2
    lda $1209
    bit #$40
    beq loc_03e72d
    stz $16
    stz $18
    stz $1a

loc_03e72d:
    lda $120a
    bit #$10
    beq loc_03e74f
    lda $12
    bne loc_03e752
    lda $14
    bne loc_03e74f
    dec $1898
    inc $14
    lda #$67
    jsl sub_03b7f9
    lda #$f1
    sta $1f47
    stz $1f46

loc_03e74f:
    jmp loc_03e650

loc_03e752:
    lda #$10
    jsl sub_03b7f9
    lda #$f1
    sta $1f47
    stz $1f46
    lda #$0f

loc_03e762:
    pha
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    pla
    jsl sub_02f8df
    cmp #$0f
    dec a
    bpl loc_03e762

loc_03e77a:
    jsl sub_02f8f0
    jml loc_1fbdee

loc_03e782:
    sep #$20
    lda #$03
    sta $16ec
    jsl sub_0bd2ef
    lda #$0f

loc_03e78f:
    pha
    lda #$e0
    sta $16db
    jsl sub_03bd8d
    sep #$20
    rep #$10
    pla
    jsl sub_02f8df
    cmp #$0f
    dec a
    bpl loc_03e78f
    jsl sub_02f8f0
    plb
    plp
    rtl

sub_03e7ae:
    php
    sep #$20
    rep #$10

loc_03e7b3:
    lda $00
    bne loc_03e7b3
    lda #$0a
    sta $00

loc_03e7bb:
    lda $18bb
    beq loc_03e7bb
    jsl sub_02dc16

loc_03e7c4:
    lda $18bb
    cmp #$02
    bne loc_03e7c4
    stz $18bb
    jsl sub_02dc26
    jsl sub_03e8fe
    jsr sub_03e7db
    plp
    rtl

sub_03e7db:
    php
    rep #$20
.a16
    lda #$0000
    sta $700026
    sta $700028
    sta $7001a4
    lda $15bb
    sta $700044
    sta $700046
    inc $15bb
    lda $20
    sta $70001a
    lda #$004c
    sta $700034
    lda #$005c
    sta $700036
    lda #$0000
    sta $2a
    lda #$00df
    sta $2e
    lda #$0000
    sta $2c
    lda #$00bf
    sta $30
    lda #$0070
    sta $ca
    lda #$0060
    sta $cc
    sep #$20
.a8
    rep #$10
    lda $700024
    pha
    lda $700022
    pha
    lda $700020
    pha
    lda #$01
    ldx #$840a
    jsl sub_7e4ee9
    sep #$20
    pla
    clc
    adc $16
    sta $700020
    pla
    clc
    adc $18
    sta $700022
    pla
    clc
    adc $1a
    sta $700024
    lda #$00
    sta $700021
    sta $700023
    sta $700025
    rep #$20
.a16
    plp
    rts

sub_03e875:
.a8
    php
    sep #$20
    rep #$10
    ldx #$0220

loc_03e87d:
    stz $1261,x
    dex
    bpl loc_03e87d
    jsl sub_03e889
    plp
    rtl

sub_03e889:
    php
    sep #$20
    rep #$10
    lda #$04
    sta BBAD0
    ldx #$0000
    stx OAMADDL
    ldx #$1261
    stx A1TL0
    lda #$00
    sta A1B0
    ldx #$0220
    stx DASL0
    lda #$00
    sta DMAP0
    lda #$01
    sta MDMAEN
    plp
    rtl

sub_03e8b6:
    php
    sep #$20
    lda #$80
    sta VMAIN
    rep #$30
.a16
    lda #$2c40
    sta VMADDL
    lda #$1c00
    ldy #$0000

loc_03e8cc:
    pha
    lda #$1aa0
    sta VMDATAL
    sta VMDATAL
    pla
    ldx #$0000

loc_03e8da:
    sta VMDATAL
    clc
    adc #$0018
    inx
    cpx #$001c
    bne loc_03e8da
    pha
    lda #$1aa0
    sta VMDATAL
    sta VMDATAL
    pla
    sec
    sbc #$029f
    iny
    cpy #$0018
    bne loc_03e8cc
    plp
.a8
    rtl

sub_03e8fe:
    php
    sep #$20
    rep #$10
    lda #$b3
    sta $12f2
    lda $12
    bne loc_03e910
    lda #$2d
    bra loc_03e912

loc_03e910:
    lda #$5d

loc_03e912:
    sta $12f1
    lda #$bc
    sta $12f3
    lda #$30
    sta $12f4
    lda $14
    rep #$20
.a16
    and #$00fe
    cmp #$0008
    bcc loc_03e92e
    lda #$0006

loc_03e92e:
    tax
    lda $03ebc2,x
    tax
    sep #$20
.a8
    ldy #$1299
    jsr sub_03e9a3
    lda $14
    sec
    sbc #$08
    bmi loc_03e95e
    rep #$20
.a16
    and #$00fe
    cmp #$0008
    bmi loc_03e950
    lda #$0006

loc_03e950:
    tax
    lda $03ebba,x
    tax
    sep #$20
.a8
    ldy #$1261
    jsr sub_03e9a3

loc_03e95e:
    lda $1c
    rep #$20
.a16
    and #$0007
    asl a
    tax
    lda $03ebca,x
    tax
    sep #$20
.a8
    ldy #$12d9
    jsr sub_03e9a3
    lda $1c
    and #$07
    beq loc_03e97e
    inc $1c
    bra loc_03e9a1

loc_03e97e:
    lda $1c
    bit #$80
    beq loc_03e992
    jsl sub_02fc58
    and #$1f
    bne loc_03e9a1
    lda #$81
    sta $1c
    bra loc_03e9a1

loc_03e992:
    jsl sub_02fc58
    and #$7f
    bne loc_03e9a1
    lda $1c
    clc
    adc #$08
    sta $1c

loc_03e9a1:
    plp
    rtl

sub_03e9a3:
    php
    sep #$20

loc_03e9a6:
    lda sub_03e9a3,x
    cmp #$ff
    beq loc_03e9cd
    sta $0000,y
    lda $03e9a4,x
    sta $0001,y
    lda $03e9a5,x
    sta $0002,y
    lda #$30
    sta $0003,y
    iny
    iny
    iny
    iny
    inx
    inx
    inx
    bra loc_03e9a6

loc_03e9cd:
    plp
    rts

sub_03e9cf:
    php
    rep #$30
.a16
    and #$00ff
    dec a
    cmp #$ffff
    beq loc_03ea21
    asl a
    tax
    lda $01fbd9,x
    tax
    sep #$20
.a8
    lda $010000,x
    pha
    rep #$20
.a16
    and #$007f
    tay
    sep #$20
.a8
    lda $189f,y
    beq loc_03ea23
    lda $1ffb
    inc a
    bne loc_03ea06
    lda $189f,y
    ora #$80
    sta $1ffb
    bra loc_03ea09

loc_03ea06:
    stz $1ffb

loc_03ea09:
    pla
    sta $189a
    inx
    lda $010000,x
    sta $1ffa
    inx
    stx $189b
    lda #$32
    sta $189d
    stz $189e

loc_03ea21:
    plp
    rtl

loc_03ea23:
    pla
    plp
    rtl

sub_03ea26:
    php
    sep #$20
    lda $14d0
    and #$42
    beq loc_03ea34
    jml loc_03eb47

loc_03ea34:
    lda $189d
    bne loc_03ea3c
    brl loc_03eb11

loc_03ea3c:
    lda $189e
    cmp #$05
    bcs loc_03ea46
    brl loc_03eb1f

loc_03ea46:
    jsl sub_02fc58
    and #$1f
    bne loc_03ea52
    lda #$04
    bra loc_03ea6a

loc_03ea52:
    and #$01
    sta $02
    lda $189d
    cmp #$1e
    bcs loc_03ea5f
    stz $02

loc_03ea5f:
    lda $189a
    and #$7f
    asl a
    clc
    adc #$05
    adc $02

loc_03ea6a:
    jsr sub_03eb86
    dec $189d
    bne loc_03ea78
    lda #$64
    jsl sub_03b7f9

loc_03ea78:
    ldx $189b
    rep #$30
.a16
    lda #$0053
    sta $700062
    lda #$00aa
    sta $70002c
    txa
    sta $7000a6
    jsr sub_03eb49
    sep #$20
.a8
    lda #$01
    ldx #$b4ee
    jsl sub_7e4ee9
    ldx $189b
    rep #$30
.a16
    lda #$0052
    sta $700062
    lda #$00a9
    sta $70002c
    txa
    sta $7000a6
    jsr sub_03eb49
    sep #$20
.a8
    lda #$01
    ldx #$b529
    jsl sub_7e4ee9
    lda $1ffb
    beq loc_03eb0d
    and #$7f
    sta $02
    lda $189a
    rep #$20
.a16
    and #$007f
    tay
    sep #$20
.a8
    lda $189f,y
    cmp $02
    beq loc_03eae7
    lda $02
    dec a
    ora #$80
    sta $1ffb

loc_03eae7:
    rep #$20
.a16
    and #$007f
    sta $70002e
    lda #$0052
    sta $700062
    lda #$00b1
    sta $70002c
    sep #$20
.a8
    lda #$01
    ldx #$b7d1
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10

loc_03eb0d:
.a8
    sep #$20
    bra loc_03eb47

loc_03eb11:
    lda $189e
    dec a
    bmi loc_03eb47
    sta $189e
    jsr sub_03eb86
    bra loc_03eb47

loc_03eb1f:
    jsr sub_03eb86
    inc $189e
    lda $189e
    cmp #$05
    bcc loc_03eb47
    lda $189a
    and #$7f
    asl a
    asl a
    clc
    adc $1ffa
    rep #$20
.a16
    and #$00ff
    tax
    sep #$20
.a8
    lda $03eb6e,x
    jsl sub_03b7f9

loc_03eb47:
    plp
    rtl

sub_03eb49:
.a16
    php
    sep #$20
.a8
    lda $189a
    bit #$80
    bne loc_03eb5e
    and #$7f
    cmp #$05
    beq loc_03eb5e
    lda $1ffb
    beq loc_03eb6c

loc_03eb5e:
    rep #$20
.a16
    lda $70002c
    sec
    sbc #$0010
    sta $70002c

loc_03eb6c:
.a8
    plp
.a16
    rts
    .db $60,$60,$60,$60,$7c,$7d,$62,$62,$7a,$7b,$61,$61,$7e,$7f,$63,$63
    .db $5f,$5f,$5f,$5f,$8c,$8c,$8c,$8c

sub_03eb86:
.a8
    php
    rep #$20
.a16
    and #$00ff
    xba
    sta $02
    lsr $02
    asl a
    adc $02
    adc #$b7a4
    sta $700018
    lda #$0006
    sta $700026
    lda #$0098
    sta $700028
    sep #$20
.a8
    lda #$01
    ldx #$d15b
    jsl sub_7e4ee9
    rep #$20
.a16
    rep #$10
    plp
.a8
    rts
    .db $37,$02,$37,$02,$63,$02,$8f,$02,$bb,$02,$ed,$02,$1f,$03,$1f,$03
    .db $51,$03,$65,$03,$79,$03,$65,$03,$51,$03,$65,$03,$79,$03,$65,$03
    .db $c0,$37,$80,$c8,$37,$81,$d0,$37,$82,$d8,$37,$83,$b8,$3f,$84,$c0
    .db $3f,$85,$c8,$3f,$86,$d0,$3f,$87,$d8,$3f,$88,$b8,$47,$89,$c0,$47
    .db $8a,$c8,$47,$8b,$d0,$47,$8c,$d8,$47,$8d,$ff,$ff,$c0,$37,$80,$c8
    .db $37,$8e,$d0,$37,$8f,$d8,$37,$90,$b8,$3f,$84,$c0,$3f,$85,$c8,$3f
    .db $91,$d0,$3f,$92,$d8,$3f,$88,$b8,$47,$89,$c0,$47,$8a,$c8,$47,$93
    .db $d0,$47,$8c,$d8,$47,$8d,$ff,$ff,$c0,$37,$80,$c8,$37,$81,$d0,$37
    .db $94,$d8,$37,$95,$b8,$3f,$84,$c0,$3f,$85,$c8,$3f,$86,$d0,$3f,$87
    .db $d8,$3f,$96,$b8,$47,$89,$c0,$47,$8a,$c8,$47,$97,$d0,$47,$8c,$d8
    .db $47,$8d,$ff,$ff,$c0,$50,$9a,$b8,$58,$b3,$c0,$58,$9e,$b0,$60,$b4
    .db $b8,$60,$b5,$c0,$60,$b6,$b0,$68,$b7,$b8,$68,$b8,$c0,$68,$b9,$b8
    .db $70,$ba,$c0,$70,$bb,$c0,$78,$b1,$00,$d8,$d4,$00,$d8,$d4,$00,$d8
    .db $d4,$00,$d8,$d4,$ff,$ff,$c0,$50,$9a,$b0,$58,$a8,$b8,$58,$a9,$c0
    .db $58,$9e,$b0,$60,$aa,$b8,$60,$ab,$c0,$60,$ac,$b0,$68,$ad,$b8,$68
    .db $ae,$c0,$68,$af,$c0,$70,$b0,$c0,$78,$b1,$00,$d8,$e0,$00,$d8,$e0
    .db $00,$d8,$e0,$00,$d8,$e0,$ff,$ff,$a8,$50,$98,$b0,$50,$99,$c0,$50
    .db $9a,$a8,$58,$9b,$b0,$58,$9c,$b8,$58,$9d,$c0,$58,$9e,$a8,$60,$9f
    .db $b0,$60,$a0,$b8,$60,$a1,$c0,$60,$a2,$b0,$68,$a3,$b8,$68,$a4,$c0
    .db $68,$a5,$c0,$70,$a6,$c0,$78,$a7,$ff,$ff,$d7,$a7,$bd,$df,$a7,$be
    .db $e7,$a7,$bf,$d7,$af,$c0,$df,$af,$c1,$e7,$af,$c2,$ff,$ff,$d7,$a7
    .db $c3,$df,$a7,$c4,$e7,$a7,$c5,$d7,$af,$c6,$df,$af,$c7,$e7,$af,$c8
    .db $ff,$ff,$d7,$a7,$c9,$df,$a7,$ca,$e7,$a7,$cb,$d7,$af,$cc,$df,$af
    .db $cd,$e7,$af,$ce,$ff,$ff,$9c,$d0,$f0,$e5,$5c,$c4,$78,$c4,$cc,$c4
    .db $58,$c5,$b0,$c4,$3c,$c5,$94,$c4,$60,$e6,$a8,$db,$c4,$db,$24,$d9
    .db $2c,$c2,$f0,$c2,$0c,$c3,$dc,$c7,$88,$e3,$6c,$e3,$c4,$e2,$0c,$b7
    .db $d0,$e6,$50,$e3,$70,$e2,$c4,$cd,$9c,$de,$a0,$e4,$48,$de,$cc,$bd
    .db $38,$db,$f4,$e4,$a4,$e3,$dc,$e3,$2c,$e5,$50,$ce,$4c,$c8,$44,$df
    .db $d7,$b9,$00,$00

sub_03ed7e:
    rep #$30
.a16
    ldx $1238
    lda $10,x
    sec
    sbc $16ff
    sta $1701
    lda $10,x
    sta $16ff
    ldx $16fd
    lda $16fb
    sec
    sbc $1701
    bmi sub_03eda1
    sta $16fb
    rtl

sub_03eda1:
    php
    sep #$20
.a8
    phb
    jsr sub_03edab
.a16
    plb
    plp
    rtl

sub_03edab:
.a8
    sep #$20
    lda $1ff4
    pha
    plb
    rep #$20
.a16
    lda $8000,x
    and #$00ff
    txy
    tax
    jmp (tbl_03edbf,x)

tbl_03edbf:
    .db $9b,$f7,$bb,$f9,$c0,$f9,$0f,$fa,$13,$fa,$aa,$fa,$49,$fb,$91,$f5
    .db $3e,$f5,$69,$fb,$7c,$ee,$e8,$f4,$f0,$f4,$fb,$f4,$da,$f4,$78,$f4
    .db $9f,$f4,$c4,$f4,$d0,$f4,$02,$f9,$2b,$f4,$57,$f4,$dd,$f3,$cb,$f3
    .db $77,$f3,$93,$f3,$af,$f3,$7f,$f2,$a2,$f2,$c4,$f2,$ef,$f2,$15,$f3
    .db $3a,$f3,$4f,$f2,$5b,$f2,$f3,$f1,$21,$f2,$d1,$f1,$b1,$f1,$67,$f2
    .db $73,$f2,$85,$f1,$9b,$f1,$6f,$f1,$79,$f1,$35,$f1,$1b,$f1,$02,$f1
    .db $dd,$f0,$24,$f5,$06,$f5,$0d,$f0,$a9,$ef,$db,$ef,$5c,$ef,$76,$ef
    .db $9c,$f5,$cc,$f6,$4e,$f8,$9c,$f5,$a3,$ee,$c0,$ee,$e5,$ee,$0c,$ef
    .db $35,$ef,$94,$ee,$52,$f1,$17,$fa,$7c,$ee,$68,$ee,$4d,$ee

loc_03ee4d:
    tyx
    phx
    ldx $16f7
    bne loc_03ee58
    plx
    jmp loc_03ee62

loc_03ee58:
    plx
    ldy $16f7
    lda $8001,x
    sta $0028,y

loc_03ee62:
    inx
    inx
    inx
    jmp sub_03edab

loc_03ee68:
    tyx
    lda $8001,x
    and #$00ff
    asl a
    asl a
    asl a
    asl a
    sta $16fb
    inx
    inx
    stx $16fd
    rts

loc_03ee7c:
    tyx
    sep #$20
.a8
    lda $14d7
    and #$80
    bne loc_03ee8f
    lda $8001,x
    sta $1f47
    stz $1f46

loc_03ee8f:
    inx
    inx
    jmp sub_03edab

loc_03ee94:
.a16
    tyx
    phx
    lda $8001,x
    jsl sub_03e9cf
    plx
    inx
    inx
    jmp sub_03edab

loc_03eea3:
    tyx
    txa
    clc
    adc #$8000
    tax
    sep #$20
.a8
    lda #$00
    pha
    plb
    lda #$03
    pha
    ldy #$edaa
    phy
    lda $1ff4
    pha
    phx
    ldx $16f7
    rtl

loc_03eec0:
.a16
    tyx
    phx
    sep #$20
.a8
    lda #$03
    pha
    ldy #$eeda
    phy
    lda $8003,x
    pha
    ldy $8001,x
    phy
    ldx $16f7
    lda #$00
    pha
    plb
    rtl
    rep #$30
.a16
    plx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03eee5:
    tyx
    lda $8001,x
    sta $5d
    lda $8002,x
    sta $5e
    sep #$20
.a8
    lda [$5d]
    cmp $8004,x
    bpl loc_03ef02
    rep #$20
.a16
    lda $8005,x
    tax
    jmp sub_03edab

loc_03ef02:
.a8
    inx
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03ef0c:
.a16
    tyx
    lda $8001,x
    sta $5d
    lda $8002,x
    sta $5e
    sep #$20
.a8
    lda [$5d]
    cmp $8004,x
    beq loc_03ef2b
    bmi loc_03ef2b
    rep #$20
.a16
    lda $8005,x
    tax
    jmp sub_03edab

loc_03ef2b:
.a8
    inx
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03ef35:
.a16
    tyx
    lda $8001,x
    sta $5d
    lda $8002,x
    sta $5e
    sep #$20
.a8
    lda [$5d]
    cmp $8004,x
    bne loc_03ef52
    rep #$20
.a16
    lda $8005,x
    tax
    jmp sub_03edab

loc_03ef52:
.a8
    inx
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03ef5c:
.a16
    tyx
    inx
    ldy #$001e
    sty $1ee9
    sty $1eeb
    ldy #$0002
    sty $1eef
    lda #$001e
    sta $1eed
    jmp sub_03edab

loc_03ef76:
    tyx
    inx
    ldy #$003e
    sty $1ee9
    sty $1eeb
    ldy #$0002
    sty $1eef
    lda #$001e
    sta $1eed
    jmp sub_03edab
    .db $08,$c2,$30,$ad,$74,$17,$f0,$0f,$8d,$e9,$1e,$a0,$02,$00,$8c,$ef
    .db $1e,$a9,$1e,$00,$8d,$ed,$1e,$28,$6b

loc_03efa9:
    tyx
    phx
    ldx $16f7
    bne loc_03efb4
    plx
    jmp loc_03efd2

loc_03efb4:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $5d
    lda $8004,x
    sta $5e
    sep #$20
.a8
    lda [$5d]
    clc
    adc $0000,y
    sta $0000,y

loc_03efd2:
.a16
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03efdb:
    tyx
    phx
    ldx $16f7
    bne loc_03efe6
    plx
    jmp loc_03f004

loc_03efe6:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $5d
    lda $8004,x
    sta $5e
    rep #$20
    lda [$5d]
    clc
    adc $0000,y
    sta $0000,y

loc_03f004:
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f00d:
    tyx
    phx
    jsl sub_03f018
    plx
    inx
    jmp sub_03edab

sub_03f018:
    lda $1f13
    ora #$0008
    sta $1f13
    rtl

sub_03f022:
    php
    rep #$30
    ldx $1238
    beq loc_03f046
    lda $1786
    ora $1787
    beq loc_03f04a
    lda $1f05
    and #$00ff
    bne loc_03f04a
    lda $1786
    sta $16,x
    lda $1787
    sta $17,x
    bra loc_03f04a

loc_03f046:
    jml loc_1fbdee

loc_03f04a:
    sep #$20
.a8
    stz $1f05
    lda $16c9
    sta $1fe4
    lda $1785
    bit #$18
    beq loc_03f071
    bit #$08
    beq loc_03f067
    lda #$01
    sta $16f9
    bra loc_03f074

loc_03f067:
    lda #$ff
    sta $16f9
    sta $16fa
    bra loc_03f077

loc_03f071:
    stz $16f9

loc_03f074:
    stz $16fa

loc_03f077:
    lda $1785
    bit #$01
    beq loc_03f083
    jsr sub_03f484
    bra loc_03f086

loc_03f083:
    jsr sub_03f4ab

loc_03f086:
    lda $1785
    bit #$02
    beq loc_03f094
    lda #$01
    sta $1953
    bra loc_03f097

loc_03f094:
    stz $1953

loc_03f097:
    lda #$00
    sta $701a26
    sta $701a27
    lda $1785
    bit #$20
    beq loc_03f0b4
    lda #$01
    sta $701a26
    sta $701a27
    bra loc_03f0c2

loc_03f0b4:
    bit #$40
    beq loc_03f0ca
    lda #$02
    sta $701a26
    sta $701a27

loc_03f0c2:
    lda #$ff
    sta $16f9
    sta $16fa

loc_03f0ca:
    lda $1785
    bit #$04
    beq loc_03f0d8
    lda #$01
    sta $16f1
    bra loc_03f0db

loc_03f0d8:
    stz $16f1

loc_03f0db:
    plp
.a16
    rtl

loc_03f0dd:
    tyx
    lda $8001,x
    sta $5d
    lda $8002,x
    sta $5e
    lda $8004,x
    sta [$5d]
    inc $5d
    inc $5d
    sep #$20
.a8
    lda $8006,x
    sta [$5d]
    inx
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f102:
.a16
    tyx
    lda $8003,x
    sta $5d
    lda $8004,x
    sta $5e
    lda $8001,x
    sta [$5d]
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f11b:
    tyx
    lda $8002,x
    sta $5d
    lda $8003,x
    sta $5e
    sep #$20
.a8
    lda $8001,x
    sta [$5d]
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f135:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f140
    plx
    jmp loc_03f14e

loc_03f140:
    plx
    ldy $16f7
    sep #$20
.a8
    lda #$01
    sta $001d,y
    inc $173c

loc_03f14e:
    inx
    jmp sub_03edab

loc_03f152:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f15d
    plx
    jmp loc_03f16b

loc_03f15d:
    plx
    ldy $16f7
    sep #$20
.a8
    lda #$80
    sta $0020,y
    inc $173c

loc_03f16b:
    inx
    jmp sub_03edab

loc_03f16f:
.a16
    tyx
    sep #$20
.a8
    stz $16f1
    inx
    jmp sub_03edab

loc_03f179:
.a16
    tyx
    sep #$20
.a8
    lda #$01
    sta $16f1
    inx
    jmp sub_03edab

loc_03f185:
.a16
    tyx
    sep #$20
.a8
    stz $18b2
    stz $18b3
    lda #$80
    jsl sub_02f8df
    sta INIDISP
    inx
    jmp sub_03edab

loc_03f19b:
.a16
    tyx
    sep #$20
.a8
    stz $18b2
    lda #$0f
    sta $18b3
    jsl sub_02f8df
    sta INIDISP
    inx
    jmp sub_03edab

loc_03f1b1:
.a16
    tyx
    sep #$20
.a8
    lda $18b3
    bne loc_03f1c5
    lda $7e45f4
    cmp #$80
    bne loc_03f1c5
    inx
    jmp sub_03edab

loc_03f1c5:
    lda #$01
    sta $16fb
    stz $16fc
    stx $16fd
    rts

loc_03f1d1:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f1dc
    plx
    jmp loc_03f1ec

loc_03f1dc:
    plx
    lda $8001,x
    sta $5d
    lda $8002,x
    sta $5e
    lda $16f7
    sta [$5d]

loc_03f1ec:
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f1f3:
    tyx
    phx
    ldx $16f7
    bne loc_03f1fe
    plx
    jmp loc_03f218

loc_03f1fe:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $5d
    lda $8004,x
    sta $5e
    sep #$20
.a8
    lda [$5d]
    sta $0000,y

loc_03f218:
.a16
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f221:
    tyx
    phx
    ldx $16f7
    bne loc_03f22c
    plx
    jmp loc_03f246

loc_03f22c:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $5d
    lda $8004,x
    sta $5e
    rep #$20
    lda [$5d]
    sta $0000,y

loc_03f246:
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f24f:
    tyx
    sep #$20
.a8
    lda #$01
    sta $18b2
    inx
    jmp sub_03edab

loc_03f25b:
.a16
    tyx
    sep #$20
.a8
    lda #$ff
    sta $18b2
    inx
    jmp sub_03edab

loc_03f267:
.a16
    tyx
    sep #$20
.a8
    lda #$02
    sta $18b2
    inx
    jmp sub_03edab

loc_03f273:
.a16
    tyx
    sep #$20
.a8
    lda #$fe
    sta $18b2
    inx
    jmp sub_03edab

loc_03f27f:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f28a
    plx
    jmp loc_03f29b

loc_03f28a:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    sep #$20
.a8
    lda $8003,x
    sta $0000,y

loc_03f29b:
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f2a2:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f2ad
    plx
    jmp loc_03f2bc

loc_03f2ad:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $0000,y

loc_03f2bc:
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f2c4:
    tyx
    phx
    ldx $16f7
    bne loc_03f2cf
    plx
    jmp loc_03f2e6

loc_03f2cf:
    plx
    lda $8001,x
    clc
    adc $16f7
    tay
    lda $8003,x
    sta $0000,y
    sep #$20
.a8
    lda $8005,x
    sta $0002,y

loc_03f2e6:
.a16
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f2ef:
    tyx
    phx
    ldx $16f7
    bne loc_03f2fa
    plx
    jmp loc_03f30e

loc_03f2fa:
    plx
    lda $16f7
    clc
    adc $8001,x
    txy
    tax
    sep #$20
.a8
    lda $8003,y
    sta $7e2000,x
    tyx

loc_03f30e:
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f315:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f320
    plx
    jmp loc_03f332

loc_03f320:
    plx
    lda $16f7
    clc
    adc $8001,x
    txy
    tax
    lda $8003,y
    sta $7e2000,x
    tyx

loc_03f332:
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f33a:
    tyx
    phx
    ldx $16f7
    bne loc_03f345
    plx
    jmp loc_03f360

loc_03f345:
    plx
    lda $16f7
    clc
    adc $8001,x
    txy
    tax
    lda $8003,y
    sta $7e2000,x
    sep #$20
.a8
    lda $8005,y
    sta $7e2002,x
    tyx

loc_03f360:
.a16
    inx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab
    .db $bb,$bd,$01,$80,$8d,$fb,$16,$e8,$e8,$e8,$8e,$fd,$16,$60

loc_03f377:
    tyx
    sep #$20
.a8
    phx
    ldx $16f7
    bne loc_03f384
    plx
    jmp loc_03f38e

loc_03f384:
    plx
    lda $8001,x
    ldy $16f7
    sta $0012,y

loc_03f38e:
    inx
    inx
    jmp sub_03edab

loc_03f393:
.a16
    tyx
    phx
    ldx $16f7
    bne loc_03f39e
    plx
    jmp loc_03f3aa

loc_03f39e:
    plx
    sep #$20
.a8
    lda $8001,x
    ldy $16f7
    sta $0013,y

loc_03f3aa:
.a16
    inx
    inx
    jmp sub_03edab

loc_03f3af:
    tyx
    sep #$20
.a8
    phx
    ldx $16f7
    bne loc_03f3bc
    plx
    jmp loc_03f3c6

loc_03f3bc:
    plx
    lda $8001,x
    ldy $16f7
    sta $0014,y

loc_03f3c6:
    inx
    inx
    jmp sub_03edab

loc_03f3cb:
.a16
    tyx
    sep #$20
.a8
    lda $8003,x
    sta $1ff4
    rep #$20
.a16
    lda $8001,x
    tax
    jmp sub_03edab

loc_03f3dd:
    tyx
    phx
    sep #$20
.a8
    lda #$03
    pha
    rep #$20
.a16
    lda #$f3fd
    pha
    sep #$20
.a8
    lda $8003,x
    pha
    rep #$20
.a16
    lda $8001,x
    dec a
    pha
    sep #$20
.a8
    lda #$00
    pha
    plb
    rtl
    bcs loc_03f41a
    sep #$20
    lda $1ff4
    pha
    plb
    rep #$30
.a16
    plx
    inx
    inx
    inx
    inx
    inx
    inx
    stx $16fd
    lda #$0001
    sta $16fb
    rts

loc_03f41a:
.a8
    sep #$20
    lda $1ff4
    pha
    plb
    rep #$30
.a16
    plx
    lda $8004,x
    tax
    jmp sub_03edab

loc_03f42b:
    tyx
    ldy $1730
    txa
    sta $1703,y
    sep #$20
.a8
    lda $1ff4
    sta $1705,y
    rep #$20
.a16
    iny
    iny
    iny
    sty $1730
    sep #$20
.a8
    lda $8003,x
    sta $1ff4
    rep #$20
.a16
    lda $8001,x
    tax
    inc $1732
    jmp sub_03edab

loc_03f457:
    tyx
    ldy $1730
    dey
    sep #$20
.a8
    lda $1703,y
    sta $1ff4
    rep #$20
.a16
    dey
    dey
    ldx $1703,y
    sty $1730
    inx
    inx
    inx
    inx
    dec $1732
    jmp sub_03edab

loc_03f478:
    tyx
    jsr sub_03f484
    inx
    jmp sub_03edab
    .db $20,$84,$f4,$6b

sub_03f484:
.a8
    php
    sep #$20
    lda $194d
    sta BG2VOFS
    lda $194e
    sta BG2VOFS
    lda #$01
    sta $1954
    lda #$02
    sta BGMODE
    plp
    rts

loc_03f49f:
.a16
    tyx
    jsr sub_03f4ab
    inx
    jmp sub_03edab
    .db $20,$ab,$f4,$6b

sub_03f4ab:
.a8
    php
    sep #$20
    stz $1954
    lda #$01
    sta BGMODE
    lda $194d
    sta BG2VOFS
    lda $194e
    sta BG2VOFS
    plp
    rts

loc_03f4c4:
.a16
    tyx
    sep #$20
.a8
    lda #$01
    sta $1953
    inx
    jmp sub_03edab

loc_03f4d0:
.a16
    tyx
    sep #$20
.a8
    stz $1953
    inx
    jmp sub_03edab

loc_03f4da:
.a16
    tyx
    sep #$20
.a8
    lda $8001,x
    sta $1955
    inx
    inx
    jmp sub_03edab

loc_03f4e8:
.a16
    tyx
    stz $16f9
    inx
    jmp sub_03edab

loc_03f4f0:
    tyx
    lda #$0001
    sta $16f9
    inx
    jmp sub_03edab

loc_03f4fb:
    tyx
    lda #$ffff
    sta $16f9
    inx
    jmp sub_03edab

loc_03f506:
    tyx
    phx
    lda $16df
    tax
    lda $03ac42,x
    sta $02
    lda $03ac43,x
    ora $02
    beq loc_03f51f
    plx
    stx $16fd
    rts

loc_03f51f:
    plx
    inx
    jmp sub_03edab

loc_03f524:
    tyx
    lda $8001,x
    and #$00ff
    sta $16e1
    lda $8002,x
    sta $16df
    sta $1741
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03f53e:
    tyx
    phx
    rep #$20
    lda $8001,x
    jsl sub_03f550
    plx
    inx
    inx
    inx
    jmp sub_03edab

sub_03f550:
    sta $1741
    lda $1f13
    ora #$0004
    sta $1f13
    rtl

sub_03f55d:
    rep #$30
    ldx $1741

loc_03f562:
    lda $03ac42,x
    sta $02
    lda $03ac43,x
    sta $04
    ora $02
    beq loc_03f590
    phx
    sep #$20
.a8
    lda #$03
    pha
    rep #$20
.a16
    lda #$f587
    pha
    sep #$20
.a8
    lda $02
    pha
    ldx $04
    dex
    phx
    rtl
    rep #$20
.a16
    plx
    inx
    inx
    inx
    bra loc_03f562

loc_03f590:
    rtl

loc_03f591:
    tyx
    lda #$0032
    sta $15b9
    inx
    jmp sub_03edab

loc_03f59c:
    tyx
    lda $8001,x
    and #$00ff
    asl a
    asl a
    asl a
    asl a
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03f5b8
    tyx
    jmp loc_03f69f

loc_03f5b8:
    lda $00,x
    sta $121f
    tya
    bne loc_03f5cc
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03f5d5

loc_03f5cc:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03f5d5:
    ldy $00,x
    beq loc_03f5db
    stx $02,y

loc_03f5db:
    txy
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8002,x
    bit #$0080
    beq loc_03f5f2
    ora #$ff00
    bra loc_03f5f5

loc_03f5f2:
    and #$00ff

loc_03f5f5:
    asl a
    asl a
    sta $000c,y
    lda $8003,x
    bit #$0080
    beq loc_03f607
    ora #$ff00
    bra loc_03f60a

loc_03f607:
    and #$00ff

loc_03f60a:
    asl a
    asl a
    sta $000e,y
    lda $8004,x
    and #$00ff
    asl a
    asl a
    asl a
    asl a
    phy
    ldy $1238
    clc
    adc $0010,y
    ply
    sta $0010,y
    lda $8000,x
    and #$00ff
    cmp #$0076
    bne loc_03f65f
    lda $8005,x
    phx
    and #$00ff
    asl a
    asl a
    tax
    lda $00a83d,x
    sta $0016,y
    sep #$20
.a8
    lda $00a83f,x
    sta $0018,y
    lda $00a840,x
    rep #$20
.a16
    and #$00ff
    asl a
    tax
    lda $00a64b,x
    sta $0004,y
    plx
    bra loc_03f68b

loc_03f65f:
    lda $8005,x
    phx
    and #$00ff
    asl a
    tax
    lda $00a64b,x
    sta $0004,y
    plx
    lda $8006,x
    phx
    and #$00ff
    asl a
    asl a
    tax
    lda $00a83d,x
    sta $0016,y
    sep #$20
.a8
    lda $00a83f,x
    sta $0018,y
    plx

loc_03f68b:
    rep #$20
.a16
    sty $16f7
    jsr sub_03f6b3
    lda $16fb
    bne loc_03f69b
    jmp sub_03edab

loc_03f69b:
    stx $16fd
    rts

loc_03f69f:
    rep #$20
    ldx #$0000
    stx $16f7
    plx
    jsr sub_03f6b3
    lda $16fb
    bne loc_03f69b
    jmp sub_03edab

sub_03f6b3:
    lda $8000,x
    and #$00ff
    cmp #$0076
    beq loc_03f6c5
    txa
    clc
    adc #$0007
    tax
    rts

loc_03f6c5:
    txa
    clc
    adc #$0006
    tax
    rts

loc_03f6cc:
    tyx
    lda $8001,x
    and #$00ff
    asl a
    asl a
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03f6e6
    tyx
    jmp loc_03f788

loc_03f6e6:
    lda $00,x
    sta $121f
    tya
    bne loc_03f6fa
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03f703

loc_03f6fa:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03f703:
    ldy $00,x
    beq loc_03f709
    stx $02,y

loc_03f709:
    txy
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8002,x
    bit #$0080
    beq loc_03f720
    ora #$ff00
    bra loc_03f723

loc_03f720:
    and #$00ff

loc_03f723:
    asl a
    asl a
    sta $000c,y
    lda $8003,x
    bit #$0080
    beq loc_03f735
    ora #$ff00
    bra loc_03f738

loc_03f735:
    and #$00ff

loc_03f738:
    asl a
    asl a
    sta $000e,y
    lda $8004,x
    bit #$0080
    beq loc_03f74a
    ora #$ff00
    bra loc_03f74d

loc_03f74a:
    and #$00ff

loc_03f74d:
    asl a
    asl a
    asl a
    asl a
    phy
    ldy $1238
    clc
    adc $0010,y
    ply
    sta $0010,y
    lda $8005,x
    sta $0004,y
    lda $8006,x
    sta $0016,y
    sep #$20
.a8
    lda $8008,x
    sta $0018,y
    rep #$20
.a16
    sty $16f7
    txa
    clc
    adc #$0007
    tax
    lda $16fb
    bne loc_03f784
    jmp sub_03edab

loc_03f784:
    stx $16fd
    rts

loc_03f788:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$0007
    tax
    lda $16fb
    bne loc_03f784
    jmp sub_03edab

loc_03f79b:
    tyx
    lda $8001,x
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03f7b0
    tyx
    jmp loc_03f83b

loc_03f7b0:
    lda $00,x
    sta $121f
    tya
    bne loc_03f7c4
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03f7cd

loc_03f7c4:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03f7cd:
    ldy $00,x
    beq loc_03f7d3
    stx $02,y

loc_03f7d3:
    txy
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8003,x
    sta $000c,y
    lda $8005,x
    sta $000e,y
    phy
    ldy $1238
    lda $0010,y
    ply
    clc
    adc $8007,x
    sta $0010,y
    lda $8009,x
    phx
    and #$00ff
    asl a
    tax
    lda $00a64b,x
    sta $0004,y
    plx
    lda $800a,x
    phx
    and #$00ff
    asl a
    asl a
    tax
    lda $00a83d,x
    sta $0016,y
    sep #$20
.a8
    lda $00a83f,x
    sta $0018,y
    plx
    sty $16f7
    rep #$20
.a16
    txa
    clc
    adc #$000b
    tax
    lda $16fb
    bne loc_03f837
    jmp sub_03edab

loc_03f837:
    stx $16fd
    rts

loc_03f83b:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$000b
    tax
    lda $16fb
    bne loc_03f837
    jmp sub_03edab

loc_03f84e:
    tyx
    lda $8001,x
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03f863
    tyx
    jmp loc_03f8ef

loc_03f863:
    lda $00,x
    sta $121f
    tya
    bne loc_03f877
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03f880

loc_03f877:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03f880:
    ldy $00,x
    beq loc_03f886
    stx $02,y

loc_03f886:
    txy
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8003,x
    sta $000c,y
    lda $8005,x
    sta $000e,y
    phy
    ldy $1238
    lda $0010,y
    ply
    clc
    adc $8007,x
    sta $0010,y
    lda $8009,x
    phx
    and #$00ff
    asl a
    asl a
    tax
    lda $00a83d,x
    sta $0016,y
    sep #$20
.a8
    lda $00a83f,x
    sta $0018,y
    lda $00a840,x
    rep #$20
.a16
    and #$00ff
    asl a
    tax
    lda $00a64b,x
    sta $0004,y
    plx
    sty $16f7
    rep #$20
    txa
    clc
    adc #$000a
    tax
    lda $16fb
    bne loc_03f8eb
    jmp sub_03edab

loc_03f8eb:
    stx $16fd
    rts

loc_03f8ef:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$000a
    tax
    lda $16fb
    bne loc_03f8eb
    jmp sub_03edab

loc_03f902:
    tyx
    lda $8001,x
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03f917
    tyx
    jmp loc_03f9a8

loc_03f917:
    lda $00,x
    sta $121f
    tya
    bne loc_03f92b
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03f934

loc_03f92b:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03f934:
    ldy $00,x
    beq loc_03f93a
    stx $02,y

loc_03f93a:
    txy
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8003,x
    sta $000c,y
    lda $8005,x
    sta $000e,y
    phy
    ldy $1238
    lda $0010,y
    ply
    clc
    adc $8007,x
    sta $0010,y
    lda $8009,x
    phx
    and #$00ff
    asl a
    tax
    lda $00a64b,x
    sta $0004,y
    plx
    lda $800a,x
    phx
    and #$00ff
    asl a
    asl a
    tax
    lda $00a83d,x
    sta $0016,y
    sep #$20
.a8
    lda $00a83f,x
    sta $0018,y
    plx
    lda $800b,x
    sta $0014,y
    sty $16f7
    rep #$20
.a16
    txa
    clc
    adc #$000c
    tax
    lda $16fb
    bne loc_03f9a4
    jmp sub_03edab

loc_03f9a4:
    stx $16fd
    rts

loc_03f9a8:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$000c
    tax
    lda $16fb
    bne loc_03f9a4
    jmp sub_03edab

loc_03f9bb:
    tyx
    stx $16fd
    rts

loc_03f9c0:
    tya
    ldx #$0000

loc_03f9c4:
    cmp $174b,x
    beq loc_03f9e9
    inx
    inx
    cpx #$0008
    bne loc_03f9c4
    ldx $1753
    sta $174b,x
    lda $8003,y
    sta $1743,x
    inc $1753
    inc $1753
    lda $8001,y
    tax
    jmp sub_03edab

loc_03f9e9:
    lda $1743,x
    dec a
    beq loc_03f9fa
    sta $1743,x
    tyx
    lda $8001,x
    tax
    jmp sub_03edab

loc_03f9fa:
    stz $174b,x
    stz $1743,x
    dec $1753
    dec $1753
    tyx
    inx
    inx
    inx
    inx
    inx
    jmp sub_03edab

loc_03fa0f:
    jml loc_1fbdee

loc_03fa13:
    inx
    jmp sub_03edab

loc_03fa17:
    tyx
    lda $8001,x
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03fa2c
    tyx
    jmp loc_03fa9d

loc_03fa2c:
    lda $00,x
    sta $121f
    tya
    bne loc_03fa40
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03fa49

loc_03fa40:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03fa49:
    ldy $00,x
    beq loc_03fa4f
    stx $02,y

loc_03fa4f:
    txy
    sty $16f7
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8003,x
    sta $000c,y
    lda $8005,x
    sta $000e,y
    phy
    ldy $1238
    lda $0010,y
    ply
    clc
    adc $8007,x
    sta $0010,y
    lda $8009,x
    sta $0004,y
    lda $800b,x
    sta $0016,y
    lda $800c,x
    sta $0017,y
    rep #$20
    txa
    clc
    adc #$000e
    tax

loc_03fa91:
    lda $16fb
    bne loc_03fa99
    jmp sub_03edab

loc_03fa99:
    stx $16fd
    rts

loc_03fa9d:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$000e
    tax
    bra loc_03fa91

loc_03faaa:
    tyx
    lda $8001,x
    sta $16fb
    phx
    ldx $121d
    txy
    ldx $121f
    bne loc_03fabf
    tyx
    jmp loc_03fb3c

loc_03fabf:
    lda $00,x
    sta $121f
    tya
    bne loc_03fad3
    lda $121d
    sta $00,x
    stz $02,x
    stx $121d
    bra loc_03fadc

loc_03fad3:
    lda $0000,y
    sta $00,x
    stx $00,y
    sty $02,x

loc_03fadc:
    ldy $00,x
    beq loc_03fae2
    stx $02,y

loc_03fae2:
    txy
    sty $16f7
    plx
    sep #$20
.a8
    jsl sub_1fd36e
    rep #$20
.a16
    lda $8003,x
    sta $000c,y
    lda $8005,x
    sta $000e,y
    phy
    ldy $1238
    lda $0010,y
    ply
    clc
    adc $8007,x
    sta $0010,y
    lda $8009,x
    sta $0004,y
    lda $800b,x
    sta $0016,y
    lda $800c,x
    sta $0017,y
    lda $800e,x
    sta $0006,y
    lda #$0008
    sta $0009,y
    rep #$20
    txa
    clc
    adc #$0010
    tax

loc_03fb30:
    lda $16fb
    bne loc_03fb38
    jmp sub_03edab

loc_03fb38:
    stx $16fd
    rts

loc_03fb3c:
    rep #$20
    stz $16f7
    pla
    clc
    adc #$0010
    tax
    bra loc_03fb30

loc_03fb49:
    ldx $121d
    beq loc_03fb60

loc_03fb4e:
    lda $00,x
    tax
    beq loc_03fb60
    lda $8003,y
    cmp $04,x
    bne loc_03fb4e
    phy
    jsl sub_1fbfdc
    ply

loc_03fb60:
    tya
    clc
    adc #$0005
    tax
    jmp sub_03edab

loc_03fb69:
    tyx
    inx
    inx
    inx
    lda $7ffe,x
    beq loc_03fb79
    sta $16fb
    stx $16fd
    rts

loc_03fb79:
    jmp sub_03edab
    .incbin "data/01fb7c-020000.bin"
