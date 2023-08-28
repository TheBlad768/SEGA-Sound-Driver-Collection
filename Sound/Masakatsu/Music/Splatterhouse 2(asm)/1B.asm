; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_681C3	; 0
		MasakatsuLoadChannel Channel_681CF	; 1
		MasakatsuLoadChannel Channel_681DB	; 2
		MasakatsuLoadChannel Channel_681E7	; 3
		MasakatsuLoadChannel Channel_681F3	; 4
		MasakatsuLoadChannel Channel_681FF	; 5
		MasakatsuLoadChannel Channel_6820B	; 6
		MasakatsuLoadChannel Channel_68211	; 7
		MasakatsuLoadChannel Channel_68217	; 8
; ---------------------------------------------------------------------------

Channel_681C3:
		MasakatsuCallChannel byte_63C96
		dc.b $EA
		MasakatsuJumpChannel byte_63BDA
		MasakatsuStopChannel

Channel_681CF:
		MasakatsuCallChannel byte_63D22
		dc.b $EA
		MasakatsuJumpChannel byte_63CE2
		MasakatsuStopChannel

Channel_681DB:
		MasakatsuCallChannel byte_63E7E
		dc.b $EA
		MasakatsuJumpChannel byte_63E21
		MasakatsuStopChannel

Channel_681E7:
		MasakatsuCallChannel byte_63F42
		dc.b $EA
		MasakatsuJumpChannel byte_63EB4
		MasakatsuStopChannel

Channel_681F3:
		MasakatsuCallChannel byte_63FF4
		dc.b $EA
		MasakatsuJumpChannel byte_63FA0
		MasakatsuStopChannel

Channel_681FF:
		MasakatsuCallChannel byte_64118
		dc.b $EA
		MasakatsuJumpChannel byte_64012
		MasakatsuStopChannel

Channel_6820B:
		MasakatsuJumpChannel byte_64185
		MasakatsuStopChannel

Channel_68211:
		MasakatsuJumpChannel byte_641AC
		MasakatsuStopChannel

Channel_68217:
		MasakatsuJumpChannel byte_641D6
		MasakatsuStopChannel

byte_63BDA:	dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $40
		dc.b $A7
		dc.b $47
		dc.b $DF
		dc.b $C0
		dc.b $17
		dc.b $D9
		dc.b $97
		dc.b $D8
		dc.b $DF
		dc.b $80
		dc.b $17
		dc.b $47
		dc.b $DF
		dc.b $C0
		dc.b $97
		dc.b $47
		dc.b $DF
		dc.b $40
		dc.b $17
		dc.b $D9
		dc.b $97
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $17
		dc.b $47
		dc.b $DF
		dc.b $40
		dc.b $87
		dc.b $47
		dc.b $DF
		dc.b $C0
		dc.b $17
		dc.b $D9
		dc.b $97
		dc.b $D8
		dc.b $DF
		dc.b $80
		dc.b $17
		dc.b $47
		dc.b $DF
		dc.b $C0
		dc.b $97
		dc.b $47
		dc.b $DF
		dc.b $40
		dc.b $17
		dc.b $D9
		dc.b $97
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $17
		dc.b $47
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $97
		dc.b $D8
		dc.b $17
		dc.b $DF
		dc.b $C0
		dc.b $47
		dc.b $97
		dc.b $DF
		dc.b $80
		dc.b $47
		dc.b $17
		dc.b $D9
		dc.b $DF
		dc.b $C0
		dc.b $97
		dc.b $D8
		dc.b $17
		dc.b $DF
		dc.b $40
		dc.b $47
		dc.b $77
		dc.b $DF
		dc.b $C0
		dc.b $47
		dc.b $17
		dc.b $EC
byte_63C34:	dc.b $DB
		dc.b   6
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b   0
		dc.b $D4
		dc.b  $F
		dc.b $EC
		dc.b $E0
		dc.b   5
		MasakatsuCallChannel byte_63CA6
		dc.b $DF
		dc.b $80
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $70
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $A0
		dc.b $C0
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $20
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $50
		dc.b $40
		MasakatsuCallChannel byte_63CA6
		dc.b $DF
		dc.b $80
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $70
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $A0
		dc.b $C0
		dc.b $A0
		dc.b $90
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $10
		dc.b $20
		dc.b $40
		MasakatsuCallChannel byte_63CA6
		dc.b $DF
		dc.b $80
		dc.b $40
		dc.b $20
		dc.b $10
		dc.b $20
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $A0
		dc.b $90
		dc.b $70
		dc.b $90
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $20
		dc.b $40
		MasakatsuJumpChannel byte_63C34

byte_63C96:
		dc.b $E3
		dc.b $1B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $D4
		dc.b $DB
		dc.b   1
		MasakatsuReturnChannel

byte_63CA6:	dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $70
		dc.b $DF
		dc.b $40
		dc.b $90
		dc.b $70
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b $40
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $70
		dc.b $90
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $70
		dc.b $50
		dc.b $EC
		MasakatsuReturnChannel

byte_63CE2:	dc.b $9F
		dc.b $DA
		dc.b $9F
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $91
		dc.b $A1
		dc.b $D8
		dc.b $E4
		dc.b $FF
		dc.b $11
		dc.b $21
		dc.b $E4
		dc.b $FF
		dc.b $41
		dc.b $51
		dc.b $81
		dc.b $DF
		dc.b $C0
		dc.b $91
		dc.b $A1
		dc.b $D8
		dc.b $11
		dc.b $21
		dc.b $41
		dc.b $51
		dc.b $81
		dc.b $91
		dc.b $9F
		dc.b $D9
		dc.b $91
		dc.b $91
		dc.b $71
		dc.b $E4
		dc.b   1
		dc.b $71
		dc.b $31
		dc.b $31
		dc.b $11
		dc.b $11
byte_63D0B:	dc.b $D4
		dc.b $E3
		dc.b $12
		dc.b $EA
		MasakatsuCallChannel byte_63D34
		dc.b $E3
		dc.b $10
		dc.b $EA
		MasakatsuCallChannel byte_63D60
		dc.b $EA
		MasakatsuJumpChannel byte_63D0B
byte_63D22:	dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $13
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $12
		dc.b $D3
		MasakatsuReturnChannel

byte_63E21:	dc.b $D8
		dc.b $E0
		dc.b  $D
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $91
		dc.b $A1
		dc.b $E4
		dc.b $FF
		dc.b $D8
		dc.b $11
		dc.b $21
		dc.b $E4
		dc.b $FF
		dc.b $41
		dc.b $51
		dc.b $81
		dc.b $DF
		dc.b $C0
		dc.b $EC
		dc.b $91
		dc.b $9F
		dc.b $DA
		dc.b $E4
		dc.b $FE
		dc.b $9F
		dc.b $DA
		dc.b $93
		dc.b $73
		dc.b $33
		dc.b $13
		dc.b $E4
		dc.b   2
		dc.b $D9
		dc.b $9F
		dc.b $E4
		dc.b   1
byte_63E49:	dc.b $D3
		dc.b $E3
		dc.b $1B
		dc.b $9F
		dc.b $2F
		dc.b $2F
		dc.b $1F
		dc.b $D4
		dc.b $E3
		dc.b $19
		MasakatsuCallChannel byte_63E92
		dc.b $A7
		dc.b $77
		dc.b $9F
		dc.b $D8
		dc.b $EA
		MasakatsuCallChannel byte_63E92
		dc.b $A7
		dc.b $87
		dc.b $93
		dc.b $73
		dc.b $93
		dc.b $D8
		dc.b $13
		MasakatsuCallChannel byte_63E92
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $21
		dc.b $11
		dc.b $21
		dc.b $41
		dc.b $51
		dc.b $41
		dc.b $2F
		dc.b $EA
		MasakatsuJumpChannel byte_63E49
byte_63E7E:	dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $12
		dc.b $D2
		dc.b $E5
		dc.b $FE
		MasakatsuReturnChannel
byte_63E92:	dc.b $27
		dc.b $17
		dc.b $D9
		dc.b $C7
		dc.b $B7
		MasakatsuReturnChannel

byte_63EB4:	dc.b $EB
		dc.b   2
		dc.b $91
		dc.b $91
		dc.b   7
		dc.b $A1
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $91
		dc.b $93
		dc.b $91
		dc.b $A1
		dc.b $D8
		dc.b $A3
		dc.b $D9
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b   3
		dc.b $91
		dc.b $91
		dc.b $D8
		dc.b $91
		dc.b $D9
		dc.b $91
		dc.b $EC
		dc.b $D8
		dc.b $B1
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $11
		dc.b $E0
		dc.b   1
byte_63EDA:	dc.b $D3
		MasakatsuCallChannel byte_63F54
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $B0
		dc.b $B0
		dc.b $A1
		dc.b $A1
		dc.b $21
		dc.b $EA
		MasakatsuExtraJumpChannel byte_63EF3
		dc.b $90
		dc.b $90
		dc.b $81
		dc.b $81
		dc.b $EC
byte_63EF3:	dc.b $A0
		dc.b $A0
		dc.b $91
		dc.b $91
		MasakatsuCallChannel byte_63F54
		dc.b $21
		dc.b $A0
		dc.b $A0
		dc.b $71
		dc.b $71
		dc.b $21
		dc.b $A0
		dc.b $A0
		dc.b $81
		dc.b $81
		dc.b $41
		dc.b $D8
		dc.b $20
		dc.b $20
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $41
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $EA
		MasakatsuCallChannel byte_63F6C
		dc.b $EA
		MasakatsuCallChannel byte_63F82
		dc.b $21
		dc.b $91
		dc.b $91
		dc.b $71
		dc.b $71
		dc.b $41
		dc.b $41
		dc.b $11
		dc.b $EA
		MasakatsuCallChannel byte_63F6C
		dc.b $EA
		MasakatsuCallChannel byte_63F79
		dc.b $21
		dc.b $21
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $A1
		dc.b $A1
		dc.b $91
		dc.b $91
		MasakatsuJumpChannel byte_63EDA
byte_63F42:	dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $1A
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   6
		dc.b $D2
		MasakatsuReturnChannel

byte_63FA0:	dc.b $E0
		dc.b  $B
		dc.b $D9
		dc.b $97
		dc.b $A7
		dc.b $D8
		dc.b $17
		dc.b $27
		dc.b $47
		dc.b $57
		dc.b $87
		dc.b $97
		dc.b $9F
		dc.b $97
		dc.b $A7
		dc.b $D8
byte_63FB0:	dc.b $D4
		dc.b $E3
		dc.b $16
		dc.b $F4
		dc.b   6
		dc.b $E0
		dc.b $10
		dc.b $27
		dc.b $D9
		dc.b $C7
		dc.b $B7
		dc.b $A7
		dc.b $97
		dc.b $57
		dc.b $77
		dc.b $97
		dc.b $E5
		dc.b $FC
		dc.b $D8
		dc.b $27
		dc.b $17
		dc.b $D9
		dc.b $C7
		dc.b $B7
		dc.b $A7
		dc.b $87
		dc.b $9F
		dc.b $E5
		dc.b   0
		dc.b $E3
		dc.b $1B
		MasakatsuCallChannel byte_64004
		dc.b $EB
		dc.b   8
		dc.b $71
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $91
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_64004
		dc.b $EB
		dc.b   4
		dc.b $71
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $91
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   8
		dc.b $21
		dc.b $EC
		MasakatsuJumpChannel byte_63FB0
byte_63FF4:	dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $16
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $13
		dc.b $D3
		MasakatsuReturnChannel

byte_64012:
		dc.b $EB
		dc.b   7
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $EC
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $EB
		dc.b   7
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $EC
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64081
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $EC
byte_64081:	dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $E3
		dc.b $10
byte_6409B:	dc.b $E1
		dc.b $FC
		dc.b $EB
		dc.b   4
		dc.b $EB
		dc.b   3
		MasakatsuCallChannel byte_6411F
		dc.b $EC
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_6412D
		dc.b $EC
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_64148
		dc.b $EC
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_6412D
		dc.b $EC
		MasakatsuCallChannel byte_64148
		dc.b $EB
		dc.b   2
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EC
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		MasakatsuJumpChannel byte_6409B

byte_64118:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0
		MasakatsuReturnChannel

byte_64185:
		dc.b $DB
		dc.b   6
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $EB
		dc.b   6
		dc.b  $F
		dc.b $EC

byte_6418F:
		dc.b $D6
		dc.b $E3
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_63D34
		dc.b $E3
		dc.b   9
		dc.b $EA
		MasakatsuCallChannel byte_63D60
		dc.b $EA
		MasakatsuJumpChannel byte_6418F

byte_641AC:
		dc.b $DB
		dc.b   6
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E5
		dc.b $FE
		dc.b   1
		dc.b $EB
		dc.b   6
		dc.b  $F
		dc.b $EC

byte_641B9:
		dc.b $D6
		dc.b $E3
		dc.b   9
		dc.b $EA
		MasakatsuCallChannel byte_63D34
		dc.b $E3
		dc.b  $B
		dc.b $EA
		MasakatsuCallChannel byte_63D60
		dc.b $EA
		MasakatsuJumpChannel byte_641B9

byte_641D6:
		dc.b $DB
		dc.b   6
		dc.b $F2
		dc.b   2
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   5
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $EB
		dc.b   5
		dc.b  $F
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC

byte_641EB:
		dc.b $E3
		dc.b   5
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b $40
		dc.b $C1
		dc.b $EC
		dc.b $F1
		dc.b   5
		dc.b $E3
		dc.b   6
		MasakatsuCallChannel byte_64222
		dc.b $EA
		MasakatsuCallChannel byte_64231
		dc.b $EA
		MasakatsuCallChannel byte_64231
		dc.b $EA
		MasakatsuCallChannel byte_64222
		dc.b $EA
		MasakatsuCallChannel byte_64231
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $C1
		dc.b $EB
		dc.b  $A
		dc.b $C0
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_641EB

byte_64222:
		dc.b $EB
		dc.b   2
		dc.b $C0
		dc.b $C1
		dc.b $C0
		dc.b $C1
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $C1
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC
		MasakatsuReturnChannel

byte_64231:
		dc.b $EB
		dc.b   2
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC
		dc.b $C0
		dc.b $C0
		dc.b $C1
		dc.b $C1
		dc.b $C0
		dc.b $C0
		MasakatsuReturnChannel

byte_63D34:
		dc.b $EA
		MasakatsuCallChannel byte_63DC8
		dc.b $A1
		dc.b $91
		dc.b $81
		dc.b $93
		dc.b $91
		dc.b $51
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $11
		dc.b $21
		dc.b $43
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $91
		dc.b $D8
		dc.b $EA
		MasakatsuCallChannel byte_63DC8
		dc.b $71
		dc.b $61
		dc.b $71
		dc.b $93
		dc.b $A1
		dc.b $D8
		dc.b $11
		dc.b $21
		dc.b $15
		dc.b $20
		dc.b $30
		dc.b $47
		dc.b $D9
		MasakatsuReturnChannel
byte_63D60:	dc.b $EA
		MasakatsuCallChannel byte_63DD7
		dc.b $DF
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $EC
		dc.b $DF
		dc.b $C0
		dc.b $70
		dc.b $50
		dc.b $40
		dc.b $90
		dc.b $70
		dc.b $50
		dc.b $40
		dc.b $50
		dc.b $40
		dc.b $20
		dc.b $10
		dc.b $20
		dc.b $40
		dc.b $D9
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		MasakatsuCallChannel byte_63DD7
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $A0
		dc.b $DF
		dc.b $40
		dc.b $90
		dc.b $70
		dc.b $50
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $20
		dc.b $10
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $20
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $E3
		dc.b $18
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $20
		dc.b $40
		dc.b $50
		dc.b $70
		dc.b $90
		MasakatsuReturnChannel
byte_63DC8:	dc.b 1
		dc.b $23
		dc.b $41
		dc.b $51
		dc.b $21
		dc.b $81
		dc.b $51
		dc.b $41
		dc.b $21
		dc.b $11
		dc.b $23
		dc.b $41
		dc.b $51
		dc.b $81
		MasakatsuReturnChannel
byte_63DD7:	dc.b $DF
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $20
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $20
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $20
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $20
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $20
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $EC
		MasakatsuReturnChannel

byte_63F54:
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $B0
		dc.b $B0
		dc.b $A1
		dc.b $A1
		dc.b $21
		dc.b $EA
		MasakatsuExtraJumpChannel byte_63F67
		dc.b $A0
		dc.b $A0
		dc.b $91
		dc.b $91
		dc.b $EC

byte_63F67:
		dc.b $90
		dc.b $90
		dc.b $81
		dc.b $81
		MasakatsuReturnChannel

byte_63F6C:
		dc.b $EA
		MasakatsuCallChannel byte_63F79
		dc.b $EA
		MasakatsuCallChannel byte_63F82
		MasakatsuReturnChannel

byte_63F79:
		dc.b $21
		dc.b $B1
		dc.b $A1
		dc.b $A1
		dc.b $21
		dc.b $A1
		dc.b $91
		dc.b $91
		MasakatsuReturnChannel

byte_63F82:
		dc.b $21
		dc.b $B1
		dc.b $A1
		dc.b $A1
		dc.b $21
		dc.b $91
		dc.b $81
		dc.b $81
		MasakatsuReturnChannel

byte_64004:
		dc.b $EB
		dc.b $10
		dc.b $51
		dc.b $EC
		MasakatsuReturnChannel

byte_6411F:
		MasakatsuCallChannel byte_64172
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		MasakatsuReturnChannel

byte_6412D:
		MasakatsuCallChannel byte_64172
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $EB
		dc.b   2
		dc.b $EA
		MasakatsuCallChannel byte_64172
		dc.b $EC
		MasakatsuReturnChannel

byte_64148:
		dc.b $EB
		dc.b   2
		dc.b $EA
		MasakatsuCallChannel byte_64172
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		MasakatsuReturnChannel

byte_64172:
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		MasakatsuReturnChannel














