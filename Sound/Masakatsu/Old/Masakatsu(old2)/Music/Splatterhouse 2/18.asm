; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_67B97	; 0
		dc.l Channel_67BC1	; 1
		dc.l Channel_67BD3	; 2
		dc.l Channel_67BE7	; 3
		dc.l Channel_67BFB	; 4
		dc.l Channel_67C10	; 5
		dc.l Channel_67C2C	; 6
		dc.l Channel_67C2F	; 7
		dc.l Channel_67C32	; 8
		dc.b 0
; ---------------------------------------------------------------------------

Channel_67B97:
		dc.b $DD
		dc.b  $A
		dc.b $E3
		dc.b $13
		dc.b $E0
		dc.b $26
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b $DF
		dc.b $40
		dc.b   0
		dc.b $C0
		dc.b $B0
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $50
		dc.b $40
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $20
		dc.b $DA
		dc.b $2F
		MasakatsuStopChannel

byte_67BB6:
		dc.b $DB
		dc.b   7
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		MasakatsuReturnChannel

Channel_67BC1:
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $16
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b   0
		dc.b $C7
		dc.b $DA
		dc.b $CF
		MasakatsuStopChannel

Channel_67BD3:
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $16
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b   0
		dc.b $C0
		dc.b $B0
		dc.b $B5
		dc.b $DA
		dc.b $BF
		MasakatsuStopChannel

Channel_67BE7:
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $16
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b   0
		dc.b $C0
		dc.b $B0
		dc.b $95
		dc.b $DA
		dc.b $9F
		MasakatsuStopChannel

Channel_67BFB:
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $16
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b   0
		dc.b $C0
		dc.b $B0
		dc.b $90
		dc.b $84
		dc.b $DA
		dc.b $8F
		MasakatsuStopChannel

Channel_67C10:
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b  $E
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $26
		dc.b $EA
		MasakatsuCallChannel byte_67BB6
		dc.b $D6
		dc.b   0
		dc.b $90
		dc.b $80
		dc.b $50
		dc.b $40
		dc.b $30
		dc.b $20
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $DA
		dc.b $CF
		MasakatsuStopChannel

Channel_67C2C:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_67C2F:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_67C32:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel