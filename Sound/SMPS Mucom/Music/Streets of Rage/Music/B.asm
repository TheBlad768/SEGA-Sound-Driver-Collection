Snd_Music_Header:
	smpsHeaderVoice Snd_Music_Voice		; Current Voice Bank
	smpsHeaderChan	$06, $00			; Current FM, PSG Channels

	smpsHeaderFM Snd_Music_FM1, 4		; FM1, Volume
	smpsHeaderFM Snd_Music_FM2, 0		; FM2, Volume
	smpsHeaderFM Snd_Music_FM3, 4		; FM3, Volume
	smpsHeaderFM Snd_Music_FM4, 4		; FM4, Volume
	smpsHeaderFM Snd_Music_FM5, 4		; FM5, Volume
	smpsHeaderFM Snd_Music_DAC, 0		; DAC, Volume

; FM1 Data
Snd_Music_FM1:
	dc.b $FA, $26, $C6
	smpsSetvoice        $00
	smpsAlterVol     $11
	dc.b $F3, $03
	dc.b $07
	dc.b $45
	dc.b $04
	dc.b $45
	dc.b $07
	dc.b $45
	dc.b $06
	dc.b $45
	dc.b $06
	dc.b $45
	dc.b $06
	dc.b $45

Snd_Music_Jump01:
	dc.b $F2, $C3, $00, $00
	dc.b $F5, $D9, $00
	dc.b $F5, $C7, $00
	dc.b $F5, $9C, $00
	smpsAlterVol     $0D
	dc.b $F3, $03
	smpsSetvoice        $01
	dc.b $FA, $6C, $10
	dc.b $FA, $7C, $12
	dc.b $FA, $68, $10
	dc.b $FA, $78, $12
	dc.b $F5, $0D, $00
	dc.b $07
	dc.b $7B
	dc.b $FB
	dc.b $FE
	dc.b $84
	dc.b 7
	dc.b $7B
	dc.b $FB
	dc.b 2
	dc.b $F6
	dc.b 2
	dc.b 2
	dc.b $C
	dc.b 0
	dc.b $F3, $02
	smpsSetvoice        $00
	smpsAlterVol     $11
	dc.b 7
	dc.b $45
	dc.b $84
	dc.b $F5, $2E, $00
	dc.b $F3, 2
	smpsSetvoice        $01
	dc.b $FA, $6C, $11
	dc.b $FA, $7C, $13
	dc.b $FA, $68, $11
	dc.b $FA, $78, $12
	smpsAlterVol     $0B
	dc.b $FE, $18, $00
	dc.b 7
	dc.b $7B
	dc.b 7
	dc.b $7B
	dc.b $84
	dc.b $F3, $00
	dc.b $FA, $6C, $0C
	dc.b $FA, $7C, $0F
	dc.b $FA, $68, $0C
	dc.b $FA, $78, $0E
	dc.b 7
	dc.b $7B
	dc.b $F6
	dc.b 1
	dc.b 2
	dc.b $2D
	dc.b 0
	dc.b $F5
	dc.b $D
	dc.b 0
	dc.b $FB
	dc.b 2
	dc.b 7
	dc.b $7B
	dc.b $FB
	dc.b $FE
	dc.b $84
	dc.b 7
	dc.b $7B
	dc.b $F6
	dc.b 2
	dc.b 2
	dc.b $C
	dc.b 0
	dc.b $F3, 2
	smpsSetvoice        $00
	smpsAlterVol     $11
	dc.b 7
	dc.b $45
	dc.b $FE
	dc.b $21
	dc.b 0
	smpsSetvoice        $01
	smpsAlterVol     $0B
	dc.b $F3, 3
	dc.b $FA
	dc.b $6C
	dc.b $10
	dc.b $FA
	dc.b $7C
	dc.b $13
	dc.b $FA
	dc.b $68
	dc.b $11
	dc.b $FA
	dc.b $78
	dc.b $12
	dc.b $84
	dc.b 7
	dc.b $7B
	dc.b $FB
	dc.b 2
	dc.b 7
	dc.b $7B
	dc.b $FB
	dc.b $FE
	dc.b $84
	dc.b 7
	dc.b $7B
	dc.b $F6
	dc.b 1
	dc.b 4
	dc.b $9B
	dc.b 0
	dc.b $FE
	dc.b $23
	dc.b 0
	smpsSetvoice        $01
	smpsAlterVol     $0B
	dc.b $F3, 3
	dc.b $FA
	dc.b $6C
	dc.b $10
	dc.b $FA
	dc.b $7C
	dc.b $13
	dc.b $FA
	dc.b $68
	dc.b $11
	dc.b $FA
	dc.b $78
	dc.b $12
	dc.b $84
	dc.b 7
	dc.b $7B
	smpsSetvoice        $00
	smpsAlterVol     $11
	dc.b $F3, 2
	dc.b 7
	dc.b $45
	dc.b $84
	dc.b 7
	dc.b $45
	dc.b $F6
	dc.b 2
	dc.b 2
	dc.b $C6
	dc.b 0
	dc.b 4
	dc.b $45
	dc.b 7
	dc.b $45
	dc.b 6
	dc.b $45
	dc.b 6
	dc.b $45
	dc.b 6
	dc.b $45
	dc.b $F6
	dc.b 4
	dc.b 4
	dc.b $D8
	dc.b 0
	smpsJump	Snd_Music_Jump01

; FM2 Data
Snd_Music_FM2:
	dc.b $A4

Snd_Music_Jump02:
	dc.b $F5, $63, 0
	dc.b $F3, $00
	smpsSetvoice        $02
	smpsModSet          $00, $14, $01, $D8, $FF, $FA
	smpsAlterVol     $0D
	smpsAlterVol     $11
	dc.b $18
	dc.b $39
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $39
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $39
	dc.b $FB
	dc.b $FF
	smpsSetvoice        $03
	dc.b $F4, $01
	dc.b $F3
	dc.b 8
	dc.b $12
	dc.b $54
	dc.b $12
	dc.b $50
	dc.b $1E
	dc.b $52
	dc.b $18
	dc.b $50
	dc.b $F3
	dc.b 3
	dc.b $C
	dc.b $47
	dc.b 6
	dc.b $49
	dc.b $92
	dc.b 6
	dc.b $49
	dc.b $8C
	dc.b 6
	dc.b $50
	dc.b $8C
	dc.b 6
	dc.b $50
	dc.b $8C
	dc.b 6
	dc.b $52
	dc.b $8C
	dc.b $C
	dc.b $52
	dc.b 6
	dc.b $53
	dc.b 6
	dc.b $52
	dc.b $86
	dc.b 6
	dc.b $50
	dc.b 6
	dc.b $49
	dc.b $B0
	dc.b $F3
	dc.b 2
	dc.b $F5
	dc.b 8
	dc.b 0
	dc.b 6
	dc.b $49
	dc.b 6
	dc.b $50
	dc.b $F6
	dc.b 9
	dc.b 9
	dc.b 7
	dc.b 0
	dc.b 6
	dc.b $42
	dc.b $8C
	dc.b 6
	dc.b $42
	dc.b $EF
	dc.b $89
	dc.b $F6
	dc.b 4
	dc.b 4
	dc.b $62
	dc.b 0
	smpsJump	Snd_Music_Jump02

; FM3 Data
Snd_Music_FM3:
	dc.b $A4

Snd_Music_Jump03:
	dc.b $F5, $2F, $00
	smpsSetvoice        $02
	smpsModSet          $00, $14, $01, $D8, $FF, $FA
	smpsAlterVol     $0D
	smpsAlterVol     $11
	dc.b $18
	dc.b $24
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $29
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $29
	dc.b $F4, $01
	smpsSetvoice        $04
	smpsAlterVol     $0C
	dc.b $6C
	dc.b $29
	dc.b $F5, $06, 0
	dc.b $EF
	dc.b $A1
	dc.b $F6
	dc.b 1
	dc.b 3
	dc.b 5
	dc.b 0
	dc.b $F6
	dc.b 4
	dc.b 4
	dc.b $2E
	dc.b 0
	smpsJump	Snd_Music_Jump03

; FM4 Data
Snd_Music_FM4:
	dc.b $A4

Snd_Music_Jump04:
	dc.b $F5, $2F, $00
	smpsSetvoice        $02
	smpsModSet          $00, $14, $01, $D8, $FF, $FA
	smpsAlterVol     $0D
	smpsAlterVol     $11
	dc.b $18
	dc.b $30
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $39
	dc.b $FD
	dc.b $FB
	dc.b $FE
	dc.b 6
	dc.b $39
	dc.b $F4, $01
	smpsSetvoice        $04
	smpsAlterVol     $0C
	dc.b $6C
	dc.b $39
	dc.b $F5
	dc.b 6
	dc.b 0
	dc.b $EF
	dc.b $A1
	dc.b $F6
	dc.b 1
	dc.b 3
	dc.b 5
	dc.b 0
	dc.b $F6
	dc.b 4
	dc.b 4
	dc.b $2E
	dc.b 0
	smpsJump	Snd_Music_Jump04

; FM5 Data
Snd_Music_FM5:
	dc.b $A4

Snd_Music_Jump05:
	smpsSetvoice        $05
	dc.b $FA
	dc.b $69
	dc.b 8
	smpsAlterVol     $10
	dc.b $F5
	dc.b $1D
	dc.b 0
	dc.b $F5
	dc.b $14
	dc.b 0
	dc.b $12
	dc.b $29
	dc.b $12
	dc.b $29
	dc.b $12
	dc.b $23
	dc.b $12
	dc.b $23
	dc.b $12
	dc.b $22
	dc.b $B0
	dc.b $FE
	dc.b 5
	dc.b 0
	dc.b 6
	dc.b $29
	dc.b $F6
	dc.b 1
	dc.b 2
	dc.b $13
	dc.b 0
	dc.b $86
	dc.b $F6
	dc.b 3
	dc.b 4
	dc.b $1C
	dc.b 0
	smpsJump	Snd_Music_Jump05

; DAC Data
Snd_Music_DAC:
	smpsAlterVol     $36
	smpsSetvoice        $02
	dc.b $F5, $10, $00
	dc.b $F3, $05
	dc.b 7
	dc.b 0
	dc.b $F3, $03
	dc.b 4
	dc.b 0
	dc.b $F3, $05
	dc.b 7
	dc.b 0
	dc.b $F6, $02, $02
	dc.b $F
	dc.b 0

Snd_Music_Jump06:
	dc.b $F5, $72, $00
	dc.b $F5, $56, $00
	dc.b $F3, $00
	smpsSetvoice        $01
	dc.b $12
	dc.b 0
	dc.b $FD
	dc.b $B
	dc.b 0
	dc.b 7
	dc.b 0
	dc.b $F3, $07
	smpsSetvoice        $02
	dc.b $C
	dc.b 0
	dc.b $86
	dc.b $F3, $00
	smpsSetvoice        $01
	dc.b $24
	dc.b 0
	dc.b $12
	dc.b 0
	dc.b $F3, $07
	smpsSetvoice        $02
	dc.b $C
	dc.b 0
	dc.b $98
	dc.b $F3, $00
	smpsSetvoice        $01
	dc.b $1E
	dc.b 0
	dc.b 6
	dc.b 0
	dc.b $F3, $07
	smpsSetvoice        $02
	dc.b $C
	dc.b 0
	dc.b $86
	dc.b $F3, $03
	smpsSetvoice        $01
	dc.b $C
	dc.b 0
	dc.b 6
	dc.b 0
	dc.b $C
	dc.b 0
	smpsSetvoice        $02
	dc.b 6
	dc.b 0
	smpsSetvoice        $01
	dc.b $12
	dc.b 0
	dc.b $FE, $10, $00
	smpsSetvoice        $02
	dc.b $C
	dc.b 0
	dc.b $86
	smpsSetvoice        $01
	dc.b $C
	dc.b 0
	smpsSetvoice        $02
	dc.b 6
	dc.b 0
	dc.b $F6, $03, $04
	dc.b $55
	dc.b 0
	dc.b $F5, $10, $00
	dc.b $F3, $05
	dc.b $F3, $03
	dc.b 7
	dc.b 0
	dc.b $F3, $05
	dc.b 4
	dc.b 0
	dc.b 7
	dc.b 0
	dc.b $F6, $02, $02
	dc.b $F
	dc.b 0
	dc.b $F6, $04, $04
	dc.b $71
	dc.b 0
	smpsJump	Snd_Music_Jump06

Snd_Music_Voice:
	dc.b		$3F,$30,$30,$30,$0E,$13,$11,$00,$1F,$1F,$1F,$1F,$80,$98,$8F,$93
	dc.b		$00,$00,$11,$10,$08,$B8,$2C,$2C,$3C;			Voice 00
	dc.b		$32,$73,$32,$73,$00,$00,$00,$00,$1F,$1F,$1F,$1F,$80,$80,$88,$88
	dc.b		$00,$1F,$04,$04,$3F,$2F,$2F,$4F,$3C;			Voice 01
	dc.b		$73,$34,$33,$74,$1A,$13,$0A,$0A,$4F,$50,$12,$1F,$89,$89,$8F,$8F
	dc.b		$08,$08,$01,$01,$28,$28,$38,$38,$3C;			Voice 02
	dc.b		$69,$35,$26,$31,$1E,$41,$19,$00,$5F,$9E,$DB,$9E,$90,$8C,$87,$85
	dc.b		$00,$0B,$0A,$0A,$BA,$F6,$85,$F5,$24;		Voice 03
	dc.b		$71,$33,$0C,$01,$25,$25,$2F,$00,$5F,$5F,$5F,$5F,$84,$84,$89,$8A
	dc.b		$00,$03,$01,$06,$15,$16,$12,$28,$3A;			Voice 04
	dc.b		$00,$01,$00,$02,$13,$07,$08,$10,$9F,$9F,$1F,$1F,$8B,$91,$8C,$94
	dc.b		$0E,$0E,$0A,$0E,$E8,$F8,$48,$F8,$16;			Voice 05
	even