; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_6821D	; 0
		offsetEntry.w Channel_6823A	; 1
		offsetEntry.w Channel_68257	; 2
		offsetEntry.w Channel_68283	; 3
		offsetEntry.w Channel_682A6	; 4
		offsetEntry.w Channel_682E6	; 5
		offsetEntry.w Channel_682F4	; 6
		offsetEntry.w Channel_682F7	; 7
		offsetEntry.w Channel_682FA	; 8
		dc.b 0
; ---------------------------------------------------------------------------

Channel_6821D:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $2D
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $C
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $4F
		dc.b $4F
		dc.b $6F
		dc.b $47
		dc.b $47
		dc.b $4F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_6823A:
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $2D
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $C
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $1F
		dc.b $1F
		dc.b $1F
		dc.b $17
		dc.b $D9
		dc.b $C7
		dc.b $D8
		dc.b $1F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_68257:
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $11
		MasakatsuCallChannel byte_68264
		dc.b $DA
		dc.b $83
		dc.b $1F
		MasakatsuStopChannel

byte_68264:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E0
		dc.b  $A
		dc.b $D5
		dc.b $E1
		dc.b   0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b   3
		dc.b $13
		dc.b $33
		dc.b $43
		dc.b $D9
		dc.b $93
		dc.b $43
		dc.b $93
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $63
		dc.b $33
		dc.b $43
		dc.b $63
		dc.b $87
		dc.b $83
		MasakatsuReturnChannel

Channel_68283:
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $16
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $1B
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D4
		dc.b   3
		dc.b $43
		dc.b $63
		dc.b $83
		dc.b $13
		dc.b $13
		dc.b $33
		dc.b $43
		dc.b $93
		dc.b $63
		dc.b $83
		dc.b $93
		dc.b $D9
		dc.b $87
		dc.b $C7
		dc.b $D8
		dc.b $1F
		MasakatsuStopChannel

Channel_682A6:
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $2D
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   6
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3
		dc.b $EB
		dc.b   2
		dc.b $13
		dc.b $DB
		dc.b   1
		dc.b $1B
		dc.b $1B
		dc.b $1B
		dc.b $DB
		dc.b   9
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $93
		dc.b $DB
		dc.b   1
		dc.b $9B
		dc.b $9B
		dc.b $9B
		dc.b $DB
		dc.b   9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $63
		dc.b $DB
		dc.b   1
		dc.b $6B
		dc.b $6B
		dc.b $6B
		dc.b $DB
		dc.b   9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $83
		dc.b $DB
		dc.b   1
		dc.b $8B
		dc.b $8B
		dc.b $8B
		dc.b $DB
		dc.b   9
		dc.b $EC
		dc.b $1F
		MasakatsuStopChannel

Channel_682E6:
		dc.b $DB
		dc.b   9
		dc.b $E3
		dc.b $22
		dc.b $E5
		dc.b $FD
		dc.b   3
		MasakatsuCallChannel byte_68264
		dc.b $1F
		MasakatsuStopChannel

Channel_682F4:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_682F7:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_682FA:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel