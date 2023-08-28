; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_67A39	; 0
		dc.l Channel_67A7E	; 1
		dc.l Channel_67AE8	; 2
		dc.l Channel_67B18	; 3
		dc.l Channel_67B4B	; 4
		dc.l Channel_67B59	; 5
		dc.l Channel_67B67	; 6
		dc.l Channel_67B79	; 7
		dc.l Channel_67B89	; 8
		dc.b 0
; ---------------------------------------------------------------------------

Channel_67A39:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1B

byte_67A3F:
		MasakatsuCallChannel byte_67A5C
		dc.b $EA
		MasakatsuCallChannel byte_67A6A
		dc.b $EB
		dc.b   8
		dc.b $30
		dc.b $B0
		dc.b $E4
		dc.b   1
		dc.b $A0
		dc.b $80
		dc.b $E4
		dc.b   2
		dc.b $A0
		dc.b $60
		dc.b $E4
		dc.b   2
		dc.b $80
		dc.b $50
		dc.b $EC
		MasakatsuStopChannel
byte_67A5C:	dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $24
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D5
		MasakatsuReturnChannel
byte_67A6A:	dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $B0
		dc.b $DF
		dc.b $C0
		dc.b $A0
		dc.b $80
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $50
		dc.b $EC
		MasakatsuReturnChannel
Channel_67A7E:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $15
byte_67A82:	dc.b $EA
		MasakatsuCallChannel byte_67ABA
		dc.b $EA
		MasakatsuCallChannel byte_67AC8
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $D8
		dc.b $30
		dc.b $E4
		dc.b   1
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $E4
		dc.b   2
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $E4
		dc.b   2
		dc.b $B0
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $E4
		dc.b   2
		dc.b $50
		dc.b $30
		dc.b $E4
		dc.b   2
		dc.b $50
		dc.b $10
		dc.b $E4
		dc.b   2
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $EC
		dc.b $EC
		MasakatsuStopChannel
byte_67ABA:	dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $24
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D4
		MasakatsuReturnChannel
byte_67AC8:	dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $D8
		dc.b $30
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $EC
		dc.b $EC
		MasakatsuReturnChannel
Channel_67AE8:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $18
		dc.b $EA
		MasakatsuCallChannel byte_67B04
byte_67AF2:	dc.b $EA
		MasakatsuCallChannel byte_67B12
		dc.b $3F
		dc.b $E4
		dc.b   5
		dc.b $6F
		dc.b $E4
		dc.b   6
		dc.b $BF
		dc.b $DA
		dc.b $E4
		dc.b   6
		dc.b $BF
		MasakatsuStopChannel
byte_67B04:	dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D3
		MasakatsuReturnChannel
byte_67B12:	dc.b $3F
		dc.b $6F
		dc.b $BF
		dc.b $DA
		dc.b $BF
		MasakatsuReturnChannel
Channel_67B18:	dc.b $DB
		dc.b 7
		dc.b $E3
		dc.b $16
		dc.b $EA
		MasakatsuCallChannel byte_67B35
byte_67B22:	dc.b $EA
		MasakatsuCallChannel byte_67B43
		dc.b $AF
		dc.b $E4
		dc.b   5
		dc.b $D8
		dc.b $3F
		dc.b $E4
		dc.b   6
		dc.b $6F
		dc.b $DA
		dc.b $E4
		dc.b   6
		dc.b $6F
		MasakatsuStopChannel
byte_67B35:	dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D3
		MasakatsuReturnChannel
byte_67B43:	dc.b $AF
		dc.b $D8
		dc.b $3F
		dc.b $6F
		dc.b $DA
		dc.b $6F
		dc.b $D9
		MasakatsuReturnChannel
Channel_67B4B:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1D
		dc.b $E5
		dc.b $FD
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel byte_67A3F
		MasakatsuStopChannel
Channel_67B59:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $17
		dc.b $E5
		dc.b $FD
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel byte_67A82
		MasakatsuStopChannel

Channel_67B67:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   8
		dc.b $E5
		dc.b $FE
		dc.b $D4
		dc.b   0
		MasakatsuJumpChannel byte_67AF2
		MasakatsuStopChannel

Channel_67B79:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   8
		dc.b $D4
		dc.b $EA
		MasakatsuJumpChannel byte_67B22
		MasakatsuStopChannel

Channel_67B89:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b   9
		dc.b $E5
		dc.b $FE
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel Channel_67B79
		MasakatsuStopChannel