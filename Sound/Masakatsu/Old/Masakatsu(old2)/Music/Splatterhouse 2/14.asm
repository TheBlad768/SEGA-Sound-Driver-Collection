; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_6708A	; 0
		dc.l Channel_670A8	; 1
		dc.l Channel_670BF	; 2
		dc.l Channel_670DC	; 3
		dc.l Channel_670F7	; 4
		dc.l Channel_6710F	; 5
		dc.l Channel_67129	; 6
		dc.l Channel_6712C	; 7
		dc.l Channel_6712F	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_6708A:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $16
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

byte_6709D:
		dc.b $71
		dc.b $D8
		dc.b $21
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $1B
		dc.b $DA
		dc.b $19
		MasakatsuStopChannel

Channel_670A8:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
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
		dc.b $73
		dc.b $DA
		dc.b $7B
		dc.b $DA
		dc.b $79
		MasakatsuStopChannel

Channel_670BF:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
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
		dc.b $71
		dc.b $D8
		dc.b $21
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $2B
		dc.b $DA
		dc.b $29
		MasakatsuStopChannel

Channel_670DC:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
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
		dc.b $23
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $2B
		dc.b $DA
		dc.b $29
		MasakatsuStopChannel

Channel_670F7:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3
		dc.b $EA
		MasakatsuJumpChannel byte_6709D
		MasakatsuStopChannel

Channel_6710F:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3
		dc.b $E5
		dc.b $FD
		dc.b   0
		MasakatsuJumpChannel byte_6709D
		MasakatsuStopChannel

Channel_67129:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_6712C:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_6712F:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel