; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_67132	; 0
		MasakatsuLoadChannel Channel_671D3	; 1
		MasakatsuLoadChannel Channel_67211	; 2
		MasakatsuLoadChannel Channel_67243	; 3
		MasakatsuLoadChannel Channel_6729A	; 4
		MasakatsuLoadChannel Channel_6730A	; 5
		MasakatsuLoadChannel Channel_6732B	; 6
		MasakatsuLoadChannel Channel_67359	; 7
		MasakatsuLoadChannel Channel_6735C	; 8
; ---------------------------------------------------------------------------

Channel_67132:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   7
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D4
		MasakatsuCallChannel byte_6716B
		dc.b $EA
		MasakatsuCallChannel byte_6718C
		dc.b $EA
		MasakatsuCallChannel byte_67196
		dc.b $EA
		MasakatsuCallChannel byte_671AC
		dc.b $31
		MasakatsuCallChannel byte_671B6
		dc.b $DA
		dc.b $41
		dc.b   5
		MasakatsuCallChannel byte_6735F
		MasakatsuStopChannel

byte_6716B:
		dc.b $41
		dc.b $41
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $71
		dc.b $71
		dc.b $A1
		dc.b $A1
		dc.b $C1
		dc.b $C1
		dc.b $81
		dc.b $81
		dc.b $41
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $EB
		dc.b   4
		dc.b $61
		dc.b $EC
		dc.b $77
		dc.b $91
		dc.b $91
		dc.b $81
		dc.b $81
		dc.b $71
		dc.b $71
		dc.b $61
		dc.b $61
		MasakatsuReturnChannel

byte_6718C:
		dc.b $41
		dc.b $41
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $91
		dc.b $91
		dc.b $A1
		dc.b $A1
		MasakatsuReturnChannel

byte_67196:
		dc.b $B1
		dc.b $B1
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $A1
		dc.b $A1
		dc.b $D8
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $41
		dc.b $41
		MasakatsuReturnChannel

byte_671AC:
		dc.b $31
		dc.b $31
		dc.b $D9
		dc.b $61
		dc.b $61
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $31
		MasakatsuReturnChannel

byte_671B6:
		dc.b $DB
		dc.b   1
		dc.b $18
		dc.b $28
		dc.b $39
		dc.b $48
		dc.b $38
		dc.b $29
		dc.b $DB
		dc.b   7
		dc.b $17
		dc.b $DB
		dc.b   1
		dc.b $E4
		dc.b   2
		dc.b $48
		dc.b $58
		dc.b $69
		dc.b $E4
		dc.b   2
		dc.b $78
		dc.b $68
		dc.b $59
		dc.b $DB
		dc.b   7
		dc.b $E4
		dc.b   2
		dc.b $43
		MasakatsuReturnChannel
Channel_671D3:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1A
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $DC
		dc.b   2
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b  $B
		dc.b $51
		dc.b $51
		dc.b $DF
		dc.b $40
		dc.b  $B
		dc.b $51
		dc.b $51
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b   3
		dc.b $51
		dc.b $51
		dc.b   7
		dc.b $DF
		dc.b $40
		dc.b   7
		dc.b $51
		dc.b $51
		dc.b   3
		dc.b $DF
		dc.b $80
		dc.b   3
		dc.b $51
		dc.b $51
		dc.b   7
		dc.b $DF
		dc.b $40
		dc.b  $B
		dc.b $51
		dc.b $51
		dc.b  $F
		dc.b  $D
		dc.b   5
		dc.b $DC
		dc.b   0
		MasakatsuCallChannel byte_673EB
		MasakatsuStopChannel
Channel_67211:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1C
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $DC
		dc.b   2
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $EB
		dc.b   4
		dc.b  $B
		dc.b $41
		dc.b $41
		dc.b $EC
		dc.b   3
		dc.b $41
		dc.b $41
		dc.b   7
		dc.b   7
		dc.b $41
		dc.b $41
		dc.b   3
		dc.b   3
		dc.b $41
		dc.b $41
		dc.b   7
		dc.b  $B
		dc.b $41
		dc.b $41
		dc.b  $F
		dc.b  $D
		dc.b   5
		dc.b $DC
		dc.b   0
		dc.b $EA
		MasakatsuCallChannel byte_6744F
		MasakatsuStopChannel

Channel_67243:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $11
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		MasakatsuCallChannel byte_6725F
		dc.b   5
		MasakatsuCallChannel byte_6750C
		MasakatsuStopChannel

byte_6725F:
		dc.b $D4
		dc.b $43
		dc.b $73
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $23
		dc.b $D9
		dc.b $83
		dc.b $D8
		dc.b $53
		dc.b $87
		dc.b $93
		dc.b $93
		dc.b $A3
		dc.b $43
		dc.b $CF
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $51
		dc.b $91
		dc.b $D8
		dc.b $57
		dc.b $DB
		dc.b   1
		dc.b $78
		dc.b $68
		dc.b $59
		dc.b $DB
		dc.b   7
		dc.b $4B
		dc.b $DB
		dc.b   1
		dc.b $78
		dc.b $D9
		dc.b $A8
		dc.b $D8
		dc.b $19
		dc.b $DB
		dc.b   7
		dc.b $AB
		dc.b $D9
		dc.b $DB
		dc.b   1
		dc.b $C8
		dc.b $38
		dc.b $69
		dc.b $DB
		dc.b   7
		dc.b $D8
		dc.b $3B
		dc.b $4F
		dc.b $DA
		dc.b $E4
		dc.b   2
		dc.b $4D
		MasakatsuReturnChannel
Channel_6729A:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   1
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3
		MasakatsuCallChannel byte_67301
		dc.b $D9
		dc.b $81
		dc.b $D8
		dc.b $83
		dc.b $D9
		dc.b $81
		dc.b $81
		dc.b $83
		dc.b $81
		dc.b $61
		dc.b $D8
		dc.b $63
		dc.b $D9
		dc.b $61
		dc.b $61
		dc.b $63
		dc.b $61
		dc.b $91
		dc.b $D8
		dc.b $93
		dc.b $D9
		dc.b $91
		dc.b $91
		dc.b $93
		dc.b $91
		dc.b $D8
		dc.b $EA
		MasakatsuCallChannel byte_67301
		dc.b $41
		dc.b $D8
		dc.b $43
		dc.b $D9
		dc.b $41
		dc.b $41
		dc.b $43
		dc.b $41
		dc.b $EA
		MasakatsuCallChannel byte_67301
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $C3
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $C3
		dc.b $C1
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $A3
		dc.b $A1
		dc.b $EC
		dc.b $D8
		dc.b $E4
		dc.b   2
		dc.b $11
		dc.b $13
		dc.b $E4
		dc.b   4
		dc.b $11
		dc.b $11
		dc.b $E4
		dc.b   4
		dc.b $13
		dc.b   5
		dc.b $EA
		MasakatsuCallChannel byte_67526
		MasakatsuStopChannel

byte_67301:
		dc.b $11
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $11
		dc.b $11
		dc.b $13
		dc.b $11
		MasakatsuReturnChannel

Channel_6730A:
		dc.b $DB
		dc.b   7
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E3
		dc.b $18
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $E5
		dc.b $FD
		dc.b   1
		dc.b $EA
		MasakatsuCallChannel byte_6725F
		dc.b   3
		MasakatsuCallChannel byte_67540
		MasakatsuStopChannel

Channel_6732B:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   7
		dc.b $D4
		dc.b   1
		MasakatsuCallChannel byte_6716B
		dc.b $D8
		MasakatsuCallChannel byte_6718C
		dc.b $D9
		MasakatsuCallChannel byte_67196
		dc.b $D8
		MasakatsuCallChannel byte_671AC
		dc.b $D9
		dc.b $DB
		dc.b   1
		dc.b   8
		dc.b $DB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_671B6
		MasakatsuStopChannel

Channel_67359:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_6735C:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

byte_6735F:
		dc.b $DB
		dc.b  $A
		dc.b $E3
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		MasakatsuCallChannel byte_67374
		dc.b $EA
		MasakatsuCallChannel byte_673A9
		dc.b   3
		MasakatsuReturnChannel

byte_67374:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $2A
		dc.b $E0
		dc.b $22
		dc.b $D4
		dc.b $83
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $83
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $87
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $81
		dc.b $61
		dc.b $41
		dc.b $31
		dc.b $41
		dc.b $31
		dc.b $41
		dc.b $11
		dc.b $D9
		dc.b $93
		dc.b $E4
		dc.b   1
		dc.b $DA
		dc.b $93
		dc.b   0
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $17
		dc.b $D9
		dc.b $C3
		dc.b $E4
		dc.b   1
		dc.b $DA
		dc.b $C2
		dc.b   1
		dc.b $D8
		dc.b $1E
		dc.b   0
		MasakatsuReturnChannel

byte_673A9:
		dc.b $E0
		dc.b  $B
		dc.b $E4
		dc.b   7
		dc.b $DB
		dc.b   7
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $10
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $EC
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $E4
		dc.b $FC
		dc.b $CF
		dc.b $DA
		dc.b $E4
		dc.b $FE
		dc.b $E0
		dc.b   0
		MasakatsuReturnChannel

byte_673EB:
		dc.b $DB
		dc.b  $A
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E0
		dc.b  $C
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $E5
		dc.b $FE
		dc.b $EA
		MasakatsuCallChannel byte_67443
		dc.b   0
		dc.b $E5
		dc.b   0
		dc.b $DB
		dc.b   7
		dc.b $E0
		dc.b   1
		dc.b $D3
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $10
		dc.b $10
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $EC
		dc.b $10
		dc.b $10
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $40
		dc.b $40
		dc.b $D8
		dc.b $40
		dc.b $D9
		dc.b $EC
		dc.b $40
		dc.b $40
		dc.b $EB
		dc.b   2
		dc.b $80
		dc.b $80
		dc.b $D8
		dc.b $80
		dc.b $D9
		dc.b $EC
		dc.b $80
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $90
		dc.b $90
		dc.b $D8
		dc.b $90
		dc.b $D9
		dc.b $EC
		dc.b $90
		dc.b $90
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $E0
		dc.b   6
		dc.b $8F
		dc.b $DA
		dc.b $E0
		dc.b   0
		dc.b   3
		MasakatsuReturnChannel

byte_67443:
		dc.b $17
		dc.b $D9
		dc.b $B7
		dc.b $97
		dc.b $87
		dc.b $67
		dc.b   0
		dc.b $97
		dc.b $8E
		dc.b   1
		dc.b $8E
		MasakatsuReturnChannel

byte_6744F:
		dc.b $DB
		dc.b  $A
		dc.b $E3
		dc.b  $D
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   0
		MasakatsuCallChannel byte_67464
		dc.b $EA
		MasakatsuCallChannel byte_67496
		dc.b   3
		MasakatsuReturnChannel

byte_67464:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E0
		dc.b $22
		dc.b $D4
		dc.b $43
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $43
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $47
		dc.b $E4
		dc.b $FF
		dc.b $DA
		dc.b $41
		dc.b $31
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $EC
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $63
		dc.b $E4
		dc.b   1
		dc.b $DA
		dc.b $63
		dc.b   0
		dc.b $61
		dc.b $81
		dc.b $91
		dc.b $C1
		dc.b $8A
		dc.b $E4
		dc.b   3
		dc.b $DA
		dc.b $83
		dc.b   1
		dc.b $4E
		dc.b   0
		MasakatsuReturnChannel

byte_67496:
		dc.b $E0
		dc.b  $B
		dc.b $DB
		dc.b   7
		dc.b $E4
		dc.b   1
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $90
		dc.b $DF
		dc.b $80
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $60
		dc.b $DF
		dc.b $40
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $B0
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $90
		dc.b $DF
		dc.b $40
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $80
		dc.b $40
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $40
		dc.b $80
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $C0
		dc.b $90
		dc.b $DF
		dc.b $80
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $40
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $60
		dc.b $DF
		dc.b $80
		dc.b $80
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $DF
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $80
		dc.b $DF
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $E4
		dc.b $FE
		dc.b $DF
		dc.b $C0
		dc.b $3E
		dc.b $DA
		dc.b $E4
		dc.b $FE
		dc.b $30
		dc.b $E0
		dc.b   0
		MasakatsuReturnChannel

byte_6750C:
		dc.b $DB
		dc.b  $A
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b $1D
		dc.b $F4
		dc.b   0
		dc.b $F3
		dc.b   0
		dc.b   0
		MasakatsuCallChannel byte_67374
		dc.b $E4
		dc.b $F6
		dc.b $EA
		MasakatsuCallChannel byte_673A9
		dc.b   2
		MasakatsuReturnChannel

byte_67526:
		dc.b $DB
		dc.b  $A
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b $1E
		dc.b $F4
		dc.b   0
		dc.b $F3
		dc.b   0
		dc.b   0
		MasakatsuCallChannel byte_67464
		dc.b $E4
		dc.b $F6
		dc.b $EA
		MasakatsuCallChannel byte_67496
		dc.b   2
		MasakatsuReturnChannel

byte_67540:
		dc.b $DB
		dc.b  $A
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b $1F
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E0
		dc.b  $C
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $4F
		dc.b $4F
		dc.b $17
		dc.b   8
		dc.b $6E
		dc.b   1
		dc.b $4F
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $13
		dc.b $EB
		dc.b   4
		dc.b $EB
		dc.b   2
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
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C0
		dc.b $EC
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
		dc.b $60
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
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
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
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $62
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $63
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $62
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $63
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   7
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A3
		dc.b $EF
		dc.b   0
		dc.b  $A
		dc.b   9
		MasakatsuReturnChannel