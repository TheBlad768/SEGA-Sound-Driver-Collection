; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_66E12	; 0
		offsetEntry.w Channel_66E46	; 1
		offsetEntry.w Channel_66E7D	; 2
		offsetEntry.w Channel_66E9E	; 3
		offsetEntry.w Channel_66EE0	; 4
		offsetEntry.w Channel_66EF7	; 5
		offsetEntry.w Channel_66F15	; 6
		offsetEntry.w Channel_66F18	; 7
		offsetEntry.w Channel_66F1B	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_66E12:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b  $E
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $F
		dc.b $D3

byte_66E21:
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $70
		dc.b $40
		dc.b $70
		dc.b $DB
		dc.b   1
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $47
		dc.b $77
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $47
		dc.b $17
		dc.b $D9
		dc.b $A7
		dc.b $77
		dc.b $47
		dc.b $17
		dc.b $DB
		dc.b   6
		dc.b $5F
		dc.b $DA
		dc.b $E4
		dc.b $FD
		dc.b $53
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $55
		MasakatsuStopChannel

Channel_66E46:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $E
		dc.b $D4
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $DB
		dc.b   1
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $47
		dc.b $D9
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $47
		dc.b $77
		dc.b $47
		dc.b $17
		dc.b $D9
		dc.b $A7
		dc.b $77
		dc.b $47
		dc.b $DB
		dc.b   6
		dc.b $13
		dc.b $D9
		dc.b $CB
		dc.b $DA
		dc.b $E4
		dc.b $FD
		dc.b $C3
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $C5
		MasakatsuStopChannel

Channel_66E7D:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   1
		dc.b $D2
		dc.b $71
		dc.b $A3
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $73
		dc.b $33
		dc.b $5F
		dc.b $DA
		dc.b $E4
		dc.b $FE
		dc.b $53
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $55
		MasakatsuStopChannel

Channel_66E9E:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   7
		dc.b $D3
		dc.b $A0
		dc.b $70
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $DB
		dc.b   1
		dc.b $77
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $13
		dc.b $43
		dc.b $13
		dc.b $43
		dc.b $73
		dc.b $43
		dc.b $73
		dc.b $A3
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $73
		dc.b $A3
		dc.b $73
		dc.b $43
		dc.b $73
		dc.b $43
		dc.b $13
		dc.b $DB
		dc.b   6
		dc.b $D9
		dc.b $AF
		dc.b $DA
		dc.b $E4
		dc.b $FE
		dc.b $A3
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $A5
		MasakatsuStopChannel

Channel_66EE0:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $13
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $F
		dc.b $E5
		dc.b $FD
		dc.b $D3
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel byte_66E21
		MasakatsuStopChannel

Channel_66EF7:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $E
		dc.b $D3
		dc.b $45
		dc.b $77
		dc.b $A7
		dc.b $A3
		dc.b $73
		dc.b $87
		dc.b $DA
		dc.b $E4
		dc.b $FD
		dc.b $83
		dc.b $DA
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $85
		MasakatsuStopChannel

Channel_66F15:
		dc.b $E0
		dc.b   0
		MasakatsuStopChannel

Channel_66F18:
		dc.b $E0
		dc.b   0
		MasakatsuStopChannel

Channel_66F1B:
		dc.b $E0
		dc.b   0
		MasakatsuStopChannel