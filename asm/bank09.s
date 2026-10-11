.rombank $09

    .db $a9,$7e,$48,$ab

sub_098004:
.cpu
.a8
.i16
    jsl sub_1fdad9
    rts

loc_098009:
    stz $1532
    jsl sub_1fd03e
    sep #$20
    xba
    cmp $12,x
    beq loc_098017

loc_098017:
    sta $12,x
    jsl sub_1fd021
    sep #$20
    xba
    eor #$ff
    inc a
    cmp $13,x
    beq loc_098027

loc_098027:
    sta $13,x
    rts
    .db $ad,$c8,$18,$49,$ff,$1a,$18,$69,$80,$18,$6d,$2b,$15,$95,$13,$ad
    .db $c6,$18,$95,$12,$60,$22,$bb,$c7,$1f,$60,$20,$8b,$a9,$6b,$85,$02
    .db $bd,$e7,$1c,$18,$69,$01,$30,$03,$18,$65,$02,$29,$7f,$c5,$02,$90
    .db $03,$38,$e5,$02,$09,$80,$9d,$e7,$1c,$60,$85,$02,$bd,$e7,$1c,$18
    .db $69,$01,$30,$03,$18,$65,$02,$29,$7f,$c5,$02,$90,$0b,$a5,$02,$3a
    .db $09,$80,$9d,$e7,$1c,$4c,$89,$80,$09,$80,$9d,$e7,$1c,$18,$60,$38
    .db $60,$85,$02,$bd,$e7,$1c,$18,$69,$ff,$30,$03,$18,$65,$02,$29,$7f
    .db $c5,$02,$90,$03,$38,$e5,$02,$09,$80,$9d,$e7,$1c,$60

sub_0980a7:
.a16
    jsr sub_0980ab
.a8
    rtl

sub_0980ab:
.a16
    sta $02
    ldy $1238
    rep #$20
    lda $0010,y
    sec
    sbc $10,x
    bpl loc_0980be
    eor #$ffff
    inc a

loc_0980be:
    cmp $02
    sep #$20
.a8
    bpl loc_0980c8
    jml loc_0980cc

loc_0980c8:
    sep #$20
    clc
    rts

loc_0980cc:
    sep #$21
    rts
    .incbin "data/0480cf-04855b.bin"
    rep #$20
.a16
    lda #$858a
    sta $16,x
    sep #$20
.a8
    lda #$09
    sta $18,x
    lda #$06
    sta $1cd5,x
    lda #$06
    sta $1cd2,x
    rep #$20
.a16
    lda #$89a3
    sta $1cd3,x
    lda #$faac
    sta $1cd0,x
    sep #$20
.a8
    lda #$08
    sta $2a,x
    lda #$08
    sta $2b,x
    ldy $1238
    rep #$20
.a16
    jsl sub_1fd0ab
.a8
    rep #$20
.a16
    lda $1250
    cmp #$01f4
    sep #$20
.a8
    bpl loc_0985a3
    jml loc_0985b8

loc_0985a3:
    lda $2a,x
    cmp #$04
    bpl loc_0985ad
    jml loc_0985b8

loc_0985ad:
    lda $35,x
    and #$02
    beq loc_0985b7
    jml loc_0985b8

loc_0985b7:
    rtl

loc_0985b8:
    rep #$20
.a16
    lda #$8647
    sta $16,x
    sep #$20
.a8
    lda #$09
    sta $18,x
    lda $1f,x
    ora #$20
    sta $1f,x
    lda $1d,x
    ora #$08
    sta $1d,x
    lda #$04
    sta $22,x
    lda $08,x
    and #$04
    bne loc_0985df
    jml loc_0985e3

loc_0985df:
    lda #$fc
    sta $22,x

loc_0985e3:
    lda #$10
    sta $23,x
    rep #$20
.a16
    lda #$aeed
    sta $14c5
    sep #$20
.a8
    jsl sub_1fd54b
    bcs loc_0985fb
    jml loc_098646

loc_0985fb:
    jsr sub_098004
    jsl sub_1fdad9
    rep #$20
.a16
    lda $0010,y
    sec
    sbc #$000a
    sta $0010,y
    sep #$20
.a8
    rep #$20
.a16
    lda #$f45f
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
    lda #$f45f
    sta $1cd3,y
    lda #$f45f
    sta $1cd0,y
    sep #$20
.a8
    lda $001e,y
    ora #$01
    sta $001e,y
    lda #$00
    sta $002a,y

loc_098646:
    rtl
    lda $22,x
    sta $152c
    lda $14,x
    clc
    adc $152c
    sta $14,x
    dec $23,x
    bne loc_09865c
    jml loc_09865d

loc_09865c:
    rtl

loc_09865d:
    lda $1f,x
    and #$df
    sta $1f,x
    lda $1d,x
    and #$f7
    sta $1d,x
    rep #$20
.a16
    lda #$867c
    sta $16,x
    sep #$20
.a8
    lda #$09
    sta $18,x
    lda #$49
    jsl sub_03b7f9
    rtl
    .incbin "data/04867d-049382.bin"

sub_099382:
    stx $173d
    sta $1ff5
    ldx $1741
    stx $1772
    ldx $1eeb
    stx $1774
    phb
    lda #$7e
    pha
    plb
    ldx $1730
    stx $a061
    ldx $1732
    stx $a063
    ldx $1753
    stx $a0a2
    ldx #$002c

loc_0993ae:
    lda $1703,x
    sta $a065,x
    dex
    bpl loc_0993ae
    ldx #$0007

loc_0993ba:
    lda $174b,x
    sta $a092,x
    lda $1743,x
    sta $a09a,x
    dex
    bpl loc_0993ba
    plb
    rtl

sub_0993cb:
    php
    phb
    sep #$20
    lda #$00
    pha
    plb
    sei
    sep #$20
    rep #$10
    lda $1ff5
    sta $1ff4
    ldx $173d
    stx $16fd
    phb
    lda #$7e
    pha
    plb
    ldx $a061
    stx $1730
    ldx $a063
    stx $1732
    ldx $a0a2
    stx $1753
    ldx #$002c

loc_0993fe:
    lda $a065,x
    sta $1703,x
    dex
    bpl loc_0993fe
    ldx #$0007

loc_09940a:
    lda $a092,x
    sta $174b,x
    lda $a09a,x
    sta $1743,x
    dex
    bpl loc_09940a
    plb
    jsl sub_02e2cc
    jsl sub_02fd56
    jsl sub_02db27
    jsl sub_0bd2ef
    lda #$32
    sta $15b9
    rep #$20
.a16
    lda $1772
    jsl sub_03f550
    jsl sub_03f018
    sep #$20
.a8
    lda #$01
    sta $18b2
    stz $18b3
    plb
    plp
    lda $004211
    cli
    rtl
    .incbin "data/04944e-04ac7e.bin"

sub_09ac7e:
    php
    rep #$30
.a16
    txa
    ldy $121d

loc_09ac85:
    tyx
    cmp $06,x
    beq loc_09ac91
    ldy $00,x
    bne loc_09ac85
    ldx $156b

loc_09ac91:
    txy
    tax
    plp
    rtl
.a8
    php
    sep #$20
    rep #$10
    phb
    lda #$7e
    pha
    plb
    ldy #$bb9c
    jsl sub_09acb6
    cpy $156b
    beq loc_09acb3
    lda $0020,y
    ora #$20
    sta $0020,y

loc_09acb3:
    plb
    plp
    rtl

sub_09acb6:
    php
    phx
    rep #$30
.a16
    tya
    ldy $121d

loc_09acbe:
    tyx
    cmp $04,x
    beq loc_09acca
    ldy $00,x
    bne loc_09acbe
    ldx $156b

loc_09acca:
    txy
    plx
    plp
.a8
    rtl
    .incbin "data/04acce-04bade.bin"

loc_09bade:
    sty $1770
    lda $1cdc,x
    rep #$20
.a16
    and #$00ff
    asl a
    asl a
    tay
    sep #$20
.a8
    lda [$53],y
    pha
    iny
    rep #$20
.a16
    lda [$53],y
    pha
    sep #$20
.a8
    ldy $1770
    rtl
    .incbin "data/04bafd-04daf6.bin"

sub_09daf6:
    phy
    ldy $06,x
    rep #$20
.a16
    lda $1cf2,x
    beq loc_09db01
    tay

loc_09db01:
    sep #$20
.a8
    lda $1cec,x
    sta $02
    lda $1ced,x
    sta $08
    lda $1cee,x
    sta $90
    jsl sub_1fdb11
    lda $1cef,x
    clc
    adc $0012,y
    sta $12,x
    lda $1cf0,x
    clc
    adc $0013,y
    sta $13,x
    lda $1cf1,x
    clc
    adc $0014,y
    sta $14,x
    lda $02
    sta $02
    sta $04
    bit #$80
    beq loc_09db41
    lda #$ff
    sta $05
    bra loc_09db43

loc_09db41:
    stz $05

loc_09db43:
    lda $08
    sta $08
    sta $0a
    bit #$80
    beq loc_09db53
    lda #$ff
    sta $0b
    bra loc_09db55

loc_09db53:
    stz $0b

loc_09db55:
    lda $90
    sta $90
    sta $15c2
    bit #$80
    beq loc_09db67
    lda #$ff
    sta $15c3
    bra loc_09db6a

loc_09db67:
    stz $15c3

loc_09db6a:
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
    sta $04
    lda $0a
    asl a
    asl a
    asl a
    sta $0a
    lda $15c2
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
    ply
    rtl

sub_09dbcf:
    phy
    phx

loc_09dbd1:
    ldy $26,x
    beq loc_09dbdc
    tyx
    jsl sub_09daf6
    bra loc_09dbd1

loc_09dbdc:
    plx
    ply
    rtl

loc_09dbdf:
    rep #$20
.a16
    lda #$dc36
    sta $16,x
    sep #$20
.a8
    lda #$09
    sta $18,x
    lda #$09
    sta $1cd5,x
    lda #$09
    sta $1cd2,x
    rep #$20
.a16
    lda #$e2f5
    sta $1cd3,x
    lda #$e2ff
    sta $1cd0,x
    sep #$20
.a8
    lda #$ff
    sta $2a,x
    lda #$08
    sta $2b,x
    lda $1d,x
    ora #$08
    sta $1d,x
    lda $1f,x
    ora #$20
    sta $1f,x
    lda $2e,x
    ora #$10
    sta $2e,x
    lda $1e,x
    ora #$01
    sta $1e,x
    lda #$00
    sta $176e
    lda #$5b
    jsl sub_03b7f9
    lda #$00
    sta $1cdc,x
    rep #$20
.a16
    lda #$dc47
    sta $53
    sep #$20
.a8
    lda #$09
    sta $55
    jml loc_09bade
    .incbin "data/04dc47-04f30d.bin"
    lda $1e,x
    ora #$01
    sta $1e,x
    rep #$20
.a16
    lda $04,x
    cmp #$aca1
    sep #$20
.a8
    beq loc_09f322
    jml loc_09f328

loc_09f322:
    lda $20,x
    ora #$08
    sta $20,x

loc_09f328:
    rep #$20
.a16
    lda #$f350
    sta $16,x
    sep #$20
.a8
    lda #$09
    sta $18,x
    inc $f0c5
    rep #$20
.a16
    lda $26,x
    cmp #$0000
    sep #$20
.a8
    beq loc_09f347
    jml loc_09f350

loc_09f347:
    rep #$20
.a16
    lda #$0050
    sta $26,x
    sep #$20

loc_09f350:
.a8
    rep #$20
.a16
    lda #$00c8
    jsr sub_0980ab
.a8
    bcs loc_09f35e
    jml loc_09f38c

loc_09f35e:
    rep #$20
.a16
    lda $26,x
    sta $1757
    sep #$20
.a8
    rep #$20
.a16
    jsl sub_1fd115
.a8
    rep #$20
.a16
    lda $158f
    cmp #$0000
    bmi loc_09f37c
    cmp $1757
    bmi loc_09f382

loc_09f37c:
    sep #$20
.a8
    jml loc_09f38c

loc_09f382:
.a16
    sep #$20
.a8
    dec $f0c5

loc_09f387:
    jsl sub_1fd501
    rtl

loc_09f38c:
    ldy $1238
    rep #$20
.a16
    lda $10,x
    clc
    adc #$03e8
    sta $10,x
    sep #$20
.a8
    rep #$20
.a16
    lda $0010,y
    cmp $0010,x
    sep #$20
.a8
    bmi loc_09f3ab
    jml loc_09f387

loc_09f3ab:
    rep #$20
.a16
    lda $10,x
    sec
    sbc #$03e8
    sta $10,x
    sep #$20
.a8
    rtl

loc_09f3b8:
    rep #$20
.a16
    lda #$20f6
    sta $28,x
    sep #$20
.a8
    jsl sub_02fc58
    txy
    rep #$20
.a16
    and #$003e
    tax
    lda $09f3da,x
    sta $0004,y
    sep #$20
.a8
    tyx
    jml loc_048022
    .incbin "data/04f3da-050000.bin"
