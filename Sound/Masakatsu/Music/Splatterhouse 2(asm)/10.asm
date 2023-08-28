; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_66C7E	; 0
		MasakatsuLoadChannel Channel_66C9C	; 1
		MasakatsuLoadChannel Channel_66CBA	; 2
		MasakatsuLoadChannel Channel_66CD7	; 3
		MasakatsuLoadChannel Channel_66CF7	; 4
		MasakatsuLoadChannel Channel_66D11	; 5
		MasakatsuLoadChannel Channel_66D2D	; 6
		MasakatsuLoadChannel Channel_66D30	; 7
		MasakatsuLoadChannel Channel_66D33	; 8
; ---------------------------------------------------------------------------

Channel_66C7E:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D5

byte_66C91:
		dc.b $EB
		dc.b  $C
		dc.b $53
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $AF
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66C9C:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $12
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D4
		dc.b $EB
		dc.b  $C
		dc.b $43
		dc.b $E4
		dc.b $FF
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $8F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66CBA:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $12
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D4
		dc.b  $F
		dc.b $EB
		dc.b   8
		dc.b $33
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $4F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66CD7:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $12
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b  $F
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $23
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $2F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66CF7:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $20
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D4
		dc.b $E5
		dc.b $FD
		dc.b   0
		MasakatsuJumpChannel byte_66C91
		MasakatsuStopChannel

Channel_66D11:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D5
		dc.b $EB
		dc.b   3
		dc.b  $F
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $8F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66D2D:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_66D30:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_66D33:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel