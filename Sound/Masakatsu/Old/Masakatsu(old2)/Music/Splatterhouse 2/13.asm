; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_66F1E	; 0
		dc.l Channel_66F52	; 1
		dc.l Channel_66F99	; 2
		dc.l Channel_66FB8	; 3
		dc.l Channel_66FD7	; 4
		dc.l Channel_67010	; 5
		dc.l Channel_6705D	; 6
		dc.l Channel_67060	; 7
		dc.l Channel_67063	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_66F1E:
		dc.b $DB
		dc.b   8
		dc.b $EA
		MasakatsuCallChannel byte_66F40
		dc.b $EA
		MasakatsuCallChannel byte_66F2E
		dc.b   0
		MasakatsuStopChannel

byte_66F2E:
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $1B
		dc.b $D9
		dc.b $81
		dc.b $A1
		dc.b $C3
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $C3
		dc.b $83
		dc.b $AF
		dc.b $DA
		dc.b $A9
		dc.b   4
		MasakatsuReturnChannel
byte_66F40:	dc.b $DD
		dc.b  $A
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $12
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel
Channel_66F52:	dc.b $DB
		dc.b   8
		dc.b $EA
		MasakatsuCallChannel byte_66F8A
		dc.b $D4
		dc.b   3
		dc.b $51
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $C1
		dc.b $A1
		dc.b $81
		dc.b $61
		dc.b $81
		dc.b $A1
		dc.b $C1
		dc.b $A7
		dc.b $D8
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $90
		dc.b $60
		dc.b $DF
		dc.b $40
		dc.b $C0
		dc.b $D8
		dc.b $E4
		dc.b $FB
		dc.b $10
		dc.b $DA
		dc.b $19
		dc.b   5
		dc.b $E4
		dc.b   5
		MasakatsuStopChannel
byte_66F8A:	dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $12
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		MasakatsuReturnChannel
Channel_66F99:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $1A
		MasakatsuCallChannel byte_66FAA
		dc.b $63
		dc.b $5F
		dc.b $3F
		dc.b $2F
		dc.b $DA
		dc.b $29
		dc.b   5
		MasakatsuStopChannel
byte_66FAA:	dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel
Channel_66FB8:	dc.b $DB
		dc.b   8
		dc.b $E0
		dc.b $12
		dc.b $EA
		MasakatsuCallChannel byte_66FC9
		dc.b   2
		MasakatsuCallChannel byte_66F2E
		MasakatsuStopChannel
byte_66FC9:	dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel
Channel_66FD7:	dc.b $DB
		dc.b   8
		MasakatsuCallChannel byte_67000
		dc.b   3
		dc.b $D9
		dc.b $A1
		dc.b $51
		dc.b $C1
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $A1
		dc.b $C3
		dc.b $A1
		dc.b $A1
		dc.b $81
		dc.b $A1
		dc.b $61
		dc.b $C1
		dc.b $81
		dc.b $D8
		dc.b $51
		dc.b $21
		dc.b $61
		dc.b $71
		dc.b $E4
		dc.b $FE
		dc.b $79
		dc.b   5
		dc.b $E4
		dc.b   2
		MasakatsuStopChannel
byte_67000:	dc.b $E3
		dc.b $16
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   1
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D2
		MasakatsuReturnChannel
Channel_67010:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b   3
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_67026
		dc.b $EC
		MasakatsuCallChannel byte_67032
		dc.b  $F
		MasakatsuStopChannel
byte_67026:	dc.b $EB
		dc.b   2
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $EC
		MasakatsuReturnChannel
byte_67032:	dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		MasakatsuReturnChannel

Channel_6705D:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_67060:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_67063:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b   7
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b   3
		dc.b $EB
		dc.b   4
		dc.b $F1
		dc.b   2
		dc.b $C3
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b   4
		dc.b $C0
		dc.b $EC
		dc.b $EC
		dc.b $F1
		dc.b   2
		dc.b $C3
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b  $B
		dc.b $C0
		dc.b $EC
		dc.b   0
		dc.b $E3
		dc.b   5
		dc.b $F1
		dc.b   2
		dc.b $C3
		dc.b  $B
		MasakatsuStopChannel