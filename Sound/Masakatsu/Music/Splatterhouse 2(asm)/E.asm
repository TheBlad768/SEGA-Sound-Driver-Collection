; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_6622E	; 0
		MasakatsuLoadChannel Channel_662E8	; 1
		MasakatsuLoadChannel Channel_663B8	; 2
		MasakatsuLoadChannel Channel_66418	; 3
		MasakatsuLoadChannel Channel_664CE	; 4
		MasakatsuLoadChannel Channel_6659D	; 5
		MasakatsuLoadChannel Channel_665BA	; 6
		MasakatsuLoadChannel Channel_665D0	; 7
		MasakatsuLoadChannel Channel_665E8	; 8
; ---------------------------------------------------------------------------

Channel_6622E:
		dc.b $DD
		dc.b  $A
		dc.b $E3
		dc.b $14
		dc.b $DB
		dc.b   5
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6

byte_6623E:
		dc.b $D4
		MasakatsuCallChannel byte_6624A
		dc.b $EA
		MasakatsuJumpChannel byte_6623E

byte_6624A:
		dc.b $DC
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $A3
		dc.b $51
		dc.b $51
		dc.b $61
		dc.b $61
		dc.b $71
		dc.b $71
		dc.b $81
		dc.b $81
		MasakatsuExtraJumpChannel byte_66263
		dc.b $71
		dc.b $71
		dc.b $61
		dc.b $61
		dc.b $51
		dc.b $11
		dc.b $EC

byte_66263:
		dc.b $91
		dc.b $91
		dc.b $A1
		dc.b $A1
		dc.b $B1
		dc.b $B1
		dc.b $EB
		dc.b   2
		dc.b $C3
		dc.b $61
		dc.b $61
		dc.b $71
		dc.b $71
		dc.b $81
		dc.b $81
		dc.b $91
		dc.b $91
		dc.b $EA
		MasakatsuExtraJumpChannel byte_66281
		dc.b $81
		dc.b $81
		dc.b $71
		dc.b $71
		dc.b $61
		dc.b $51
		dc.b $EC
byte_66281:	dc.b $A1
		dc.b $A1
		dc.b $B1
		dc.b $B1
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $51
		dc.b $11
		dc.b $D9
		dc.b $91
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $31
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $21
		dc.b $31
		dc.b $41
		dc.b $EC
		dc.b $D8
		dc.b $21
		dc.b $51
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $91
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $A1
		dc.b $51
		dc.b $91
		dc.b $EC
		dc.b $D8
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $31
		dc.b $D9
		dc.b $C1
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $71
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $11
		dc.b $31
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $71
		dc.b $61
		dc.b $31
		dc.b $41
		dc.b $11
		dc.b $31
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $91
		dc.b $81
		dc.b $D9
		dc.b $83
		dc.b $C1
		dc.b $D8
		dc.b $91
		dc.b $D9
		dc.b $93
		dc.b $D8
		dc.b $11
		dc.b $A1
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $21
		dc.b $B3
		dc.b $C3
		MasakatsuReturnChannel
Channel_662E8:	dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   6
byte_662F6:	dc.b $D2
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $D9
		dc.b $A1
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $D9
		dc.b $EC
		dc.b $A1
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $D9
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $C1
		dc.b $EB
		dc.b   2
		dc.b $C1
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $C1
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $EC
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $C1
		dc.b $EC
		dc.b $D8
		dc.b $11
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $11
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $EC
		dc.b $11
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $11
		dc.b $21
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $21
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $EC
		dc.b $21
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $21
		dc.b $31
		dc.b $31
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $31
		dc.b $EB
		dc.b   2
		dc.b $31
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $D8
		dc.b $41
		dc.b $D9
		dc.b $EC
		dc.b $41
		dc.b $41
		dc.b $D8
		dc.b $41
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $D8
		dc.b $61
		dc.b $D9
		dc.b $61
		dc.b $61
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $D8
		dc.b $61
		dc.b $D9
		dc.b $EC
		dc.b $71
		dc.b $D8
		dc.b $71
		dc.b $D9
		dc.b $71
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $D8
		dc.b $71
		dc.b $D9
		dc.b $EC
		dc.b $71
		dc.b $71
		dc.b $D8
		dc.b $71
		dc.b $D9
		dc.b $71
		dc.b $71
		dc.b $81
		dc.b $D8
		dc.b $81
		dc.b $D9
		dc.b $81
		dc.b $81
		dc.b $91
		dc.b $D8
		dc.b $91
		dc.b $D9
		dc.b $91
		dc.b $91
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $D9
		dc.b $71
		dc.b $D8
		dc.b $71
		MasakatsuJumpChannel byte_662F6
Channel_663B8:	dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $14
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $D
		dc.b $E5
		dc.b $FE
byte_663C8:	dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $1F
		dc.b $DA
		dc.b $1C
		dc.b $D9
		dc.b $50
		dc.b $70
		dc.b $90
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $3F
		dc.b $DA
		dc.b $3C
		dc.b $D9
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $D8
		dc.b $EC
		dc.b $57
		dc.b $17
		dc.b $D9
		dc.b $A7
		dc.b $57
		dc.b $D8
		dc.b $67
		dc.b $27
		dc.b $D9
		dc.b $A7
		dc.b $67
		dc.b $D8
		dc.b $67
		dc.b $37
		dc.b $D9
		dc.b $C7
		dc.b $A7
		dc.b $A3
		dc.b $73
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $73
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $73
		dc.b $81
		dc.b $C1
		dc.b $D8
		dc.b $31
		dc.b $81
		dc.b $D9
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $41
		dc.b $91
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $21
		dc.b $51
		dc.b $A1
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $31
		dc.b $61
		dc.b $C1
		dc.b $EA
		MasakatsuJumpChannel byte_663C8
Channel_66418:	dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $E5
		dc.b $FD
byte_66428:	dc.b $D4
		MasakatsuCallChannel byte_66434
		dc.b $EA
		MasakatsuJumpChannel byte_66428
byte_66434:	dc.b $EB
		dc.b   2
		dc.b $53
		dc.b $11
		dc.b $11
		dc.b $31
		dc.b $31
		dc.b $41
		dc.b $41
		dc.b $51
		dc.b $51
		MasakatsuExtraJumpChannel byte_6644B
		dc.b $41
		dc.b $41
		dc.b $31
		dc.b $31
		dc.b $11
		dc.b $11
		dc.b $EC
byte_6644B:	dc.b $61
		dc.b $61
		dc.b $71
		dc.b $71
		dc.b $81
		dc.b $81
		dc.b $EB
		dc.b   2
		dc.b $93
		dc.b $31
		dc.b $31
		dc.b $41
		dc.b $41
		dc.b $51
		dc.b $51
		dc.b $61
		dc.b $61
		dc.b $EA
		MasakatsuExtraJumpChannel byte_66469
		dc.b $51
		dc.b $51
		dc.b $41
		dc.b $41
		dc.b $31
		dc.b $31
		dc.b $EC
byte_66469:	dc.b $71
		dc.b $71
		dc.b $81
		dc.b $81
		dc.b $91
		dc.b $91
		dc.b $51
		dc.b $11
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $71
		dc.b $81
		dc.b $91
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $91
		dc.b $81
		dc.b $71
		dc.b $EC
		dc.b $51
		dc.b $21
		dc.b $41
		dc.b $51
		dc.b $61
		dc.b $71
		dc.b $81
		dc.b $91
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $41
		dc.b $51
		dc.b $21
		dc.b $EC
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $C1
		dc.b $91
		dc.b $51
		dc.b $A1
		dc.b $71
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $91
		dc.b $61
		dc.b $71
		dc.b $41
		dc.b $61
		dc.b $71
		dc.b $EA
		MasakatsuExtraJumpChannel byte_664A8
		dc.b $31
		dc.b $EC
byte_664A8:	dc.b $41
		dc.b $41
		dc.b $81
		dc.b $31
		dc.b $61
		dc.b $13
		dc.b $31
		dc.b $41
		dc.b $D9
		dc.b $81
		dc.b $81
		dc.b $C1
		dc.b $81
		dc.b $91
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $91
		dc.b $A1
		dc.b $A1
		dc.b $C1
		dc.b $A1
		dc.b $B1
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $20
		dc.b $30
		dc.b $EA
		MasakatsuJumpChannel byte_66428
Channel_664CE:	dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $23
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   3
byte_664DA:	dc.b $D4
		MasakatsuCallChannel byte_664E6
		dc.b $EA
		MasakatsuJumpChannel byte_664DA
byte_664E6:	dc.b $EB
		dc.b $10
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $DF
		dc.b $80
		dc.b $C0
		dc.b $DF
		dc.b $C0
		dc.b $60
		dc.b $30
		dc.b $DF
		dc.b $40
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $DF
		dc.b $40
		dc.b $10
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $D9
		dc.b $DF
		dc.b $C0
		dc.b $B0
		dc.b $60
		dc.b $DF
		dc.b $40
		dc.b $20
		dc.b $D8
		dc.b $EC
		dc.b $E4
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $DF
		dc.b $40
		dc.b $30
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $70
		dc.b $DF
		dc.b $40
		dc.b $10
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $DF
		dc.b $40
		dc.b $10
		dc.b $D8
		dc.b $EC
		dc.b $E4
		dc.b   4
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b $C0
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $C0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $10
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b $20
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $A0
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $20
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $DF
		dc.b $40
		dc.b $30
		dc.b $D8
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $DF
		dc.b $C0
		dc.b $C0
		dc.b $80
		dc.b $DF
		dc.b $40
		dc.b $30
		dc.b $E4
		dc.b $FA
		MasakatsuReturnChannel
Channel_6659D:	dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $15
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $E5
		dc.b $FD
		dc.b   1
byte_665AE:	dc.b $D4
		MasakatsuCallChannel byte_6624A
		dc.b $EA
		MasakatsuJumpChannel byte_665AE
Channel_665BA:	dc.b $DB
		dc.b   5
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b   9
		dc.b   1

byte_665C3:
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_66434
		dc.b $EA
		MasakatsuJumpChannel byte_665C3

Channel_665D0:
		dc.b $DB
		dc.b   5
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b   9
		dc.b   1

byte_665DB:
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_664E6
		dc.b $EA
		MasakatsuJumpChannel byte_665DB

Channel_665E8:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   5
		dc.b $D7

byte_665ED:
		dc.b $E3
		dc.b   6
		dc.b $EB
		dc.b   4
		dc.b $F1
		dc.b   3
		dc.b $E1
		dc.b $24
		dc.b $C3
		dc.b $F1
		dc.b   2
		dc.b $E1
		dc.b $1E
		dc.b $C3
		MasakatsuCallChannel byte_666CF
		dc.b $E1
		dc.b $1E
		dc.b $C3
		MasakatsuExtraJumpChannel byte_66623
		dc.b $EA
		MasakatsuCallChannel byte_666CF
		dc.b $EA
		MasakatsuCallChannel byte_666D4
		dc.b $EA
		MasakatsuCallChannel byte_666CF
		dc.b $C1
		MasakatsuCallChannel byte_666D4
		dc.b $70
		dc.b $70
		dc.b $EC

byte_66623:
		MasakatsuCallChannel byte_666CF
		dc.b $EA
		MasakatsuCallChannel byte_666D4
		dc.b $70
		dc.b $70
		dc.b $EA
		MasakatsuCallChannel byte_666CF
		dc.b $E1
		dc.b $24
		dc.b $C0
		dc.b $70
		dc.b $71
		dc.b $E3
		dc.b   5
		dc.b $F1
		dc.b   5
		dc.b $EB
		dc.b   3
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_666D8
		dc.b $E1
		dc.b $24
		dc.b $C1
		MasakatsuCallChannel byte_666D4
		dc.b $E1
		dc.b $24
		dc.b $C1
		MasakatsuExtraJumpChannel byte_6666B
		dc.b $EA
		MasakatsuCallChannel byte_666CF
		dc.b $EA
		MasakatsuCallChannel byte_666D4
		dc.b $EA
		MasakatsuCallChannel byte_666D8
		dc.b $EC

byte_6666B:
		MasakatsuCallChannel byte_666D8
		dc.b $EA
		MasakatsuCallChannel byte_666D4
		dc.b $C1
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b 3
		MasakatsuCallChannel byte_666C8
		dc.b $EC
		dc.b $C1
		dc.b $EA
		MasakatsuCallChannel byte_666D8
		dc.b $EA
		MasakatsuCallChannel byte_666C8
		dc.b $EA
		MasakatsuCallChannel byte_666C8
		dc.b $E1
		dc.b $24
		dc.b $71
		dc.b $71
		dc.b $C1
		dc.b $50
		dc.b $50
		MasakatsuCallChannel byte_666C8
		dc.b $EA
		MasakatsuCallChannel byte_666C8
		dc.b $EA
		MasakatsuCallChannel byte_666D8
		dc.b $E1
		dc.b $24
		dc.b $71
		dc.b $71
		dc.b $C1
		MasakatsuCallChannel byte_666C8
		dc.b $C1
		MasakatsuCallChannel byte_666D8
		dc.b $E1
		dc.b $24
		dc.b $71
		dc.b $C1
		dc.b $51
		dc.b $50
		dc.b $30
		MasakatsuJumpChannel byte_665ED

byte_666C8:
		dc.b $E1
		dc.b $30
		dc.b $C1
		dc.b $E1
		dc.b $1E
		dc.b $C1
		MasakatsuReturnChannel

byte_666CF:
		dc.b $E1
		dc.b $30
		dc.b $C1
		dc.b $C1
		MasakatsuReturnChannel

byte_666D4:
		dc.b $E1
		dc.b $1E
		dc.b $C1
		MasakatsuReturnChannel

byte_666D8:
		dc.b $E1
		dc.b $30
		dc.b $C1
		MasakatsuReturnChannel