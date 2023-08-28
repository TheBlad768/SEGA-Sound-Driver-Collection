; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_6423E	; 0
		MasakatsuLoadChannel Channel_64296	; 1
		MasakatsuLoadChannel Channel_642DA	; 2
		MasakatsuLoadChannel Channel_64330	; 3
		MasakatsuLoadChannel Channel_64390	; 4
		MasakatsuLoadChannel Channel_643A9	; 5
		MasakatsuLoadChannel Channel_643D4	; 6
		MasakatsuLoadChannel Channel_643D7	; 7
		MasakatsuLoadChannel Channel_643DA	; 8
; ---------------------------------------------------------------------------

Channel_6423E:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $19
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b  $B
		dc.b $D5

byte_64251:
		MasakatsuCallChannel byte_64280

byte_64256:
		dc.b $DB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_64280
		dc.b $DB
		dc.b   1
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $28
		dc.b $A8
		dc.b $99
		dc.b $D8
		dc.b $28
		dc.b $D9
		dc.b $A8
		dc.b $99
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $38
		dc.b $D9
		dc.b $A8
		dc.b $99
		dc.b $88
		dc.b $78
		dc.b $D8
		dc.b $19
		dc.b $EC
		dc.b $EC
		MasakatsuJumpChannel byte_64256

byte_64280:
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $91
		dc.b $D8
		dc.b $EC
		dc.b $EC
		MasakatsuReturnChannel

Channel_64296:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $13
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   1
		dc.b $D3
		dc.b $EB
		dc.b   4
		dc.b  $F
		dc.b $EC

byte_642A9:
		dc.b $D3
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $41
		dc.b $A1
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $41
		dc.b $A1
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   3
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $A1
		dc.b $91
		dc.b $81
		dc.b $71
		MasakatsuExtraJumpChannel byte_642D1
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $EC

byte_642D1:
		dc.b $C1
		dc.b $B1
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_642A9

Channel_642DA:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1E
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $D6
		dc.b $EB
		dc.b   2
		dc.b  $F
		dc.b $EC
		dc.b $D5
		dc.b $EB
		dc.b   4
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $68
		dc.b $58
		dc.b $DF
		dc.b $C0
		dc.b $49
		dc.b $38
		dc.b $DF
		dc.b $40
		dc.b $28
		dc.b $19
		dc.b $EC

byte_642FD:
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $80
		dc.b $68
		dc.b $58
		dc.b $DF
		dc.b $C0
		dc.b $49
		dc.b $38
		dc.b $DF
		dc.b $40
		dc.b $28
		dc.b $19
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $80
		dc.b $88
		dc.b $78
		dc.b $DF
		dc.b $C0
		dc.b $69
		dc.b $58
		dc.b $DF
		dc.b $40
		dc.b $48
		dc.b $39
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $A8
		dc.b $98
		dc.b $DF
		dc.b $C0
		dc.b $89
		dc.b $78
		dc.b $DF
		dc.b $40
		dc.b $68
		dc.b $59
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_642FD

Channel_64330:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1E
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   9
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $E3
		dc.b $2D
		dc.b  $B
		dc.b $E3
		dc.b $1E
		dc.b $50
		dc.b $60
		dc.b $51
		dc.b $E3
		dc.b $2D
		dc.b  $B
		dc.b $E3
		dc.b $1E
		dc.b $40
		dc.b $50
		dc.b $41
		dc.b $EC

byte_64350:
		dc.b $F3
		dc.b   0
		dc.b $F4
		dc.b   0
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b  $B
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b  $B
		dc.b $DF
		dc.b $40
		dc.b $60
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $60
		dc.b $EC
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $5B
		dc.b $DF
		dc.b $80
		dc.b $50
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $DF
		dc.b $40
		dc.b $3F
		dc.b $DF
		dc.b $C0
		dc.b $2B
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $20
		dc.b $DF
		dc.b $40
		dc.b $1F
		dc.b $EA
		MasakatsuJumpChannel byte_64350

Channel_64390:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $23
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b  $B
		dc.b $D5
		dc.b $E5
		dc.b $FD
		dc.b   1
		dc.b $EA
		MasakatsuJumpChannel byte_64251
		MasakatsuStopChannel

Channel_643A9:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0
		dc.b $EB
		dc.b   4
		dc.b  $F
		dc.b $EC

byte_643B3:
		dc.b $EB
		dc.b   8
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_643B3

Channel_643D4:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_643D7:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_643DA:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $A
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $EB
		dc.b   8
		MasakatsuCallChannel byte_64402
		dc.b $EC
		dc.b $E3
		dc.b   9
		dc.b $EB
		dc.b   8
		MasakatsuCallChannel byte_64402
		dc.b $EC

byte_643F5:
		dc.b $EB
		dc.b $20
		MasakatsuCallChannel byte_64402
		dc.b $EC
		MasakatsuJumpChannel byte_643F5

byte_64402:
		dc.b $F1
		dc.b   2
		dc.b $C1
		dc.b $F1
		dc.b   1
		dc.b $C0
		dc.b $C0
		MasakatsuReturnChannel