; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_6599E	; 0
		offsetEntry.w Channel_65A42	; 1
		offsetEntry.w Channel_65AD3	; 2
		offsetEntry.w Channel_65B8D	; 3
		offsetEntry.w Channel_65BEE	; 4
		offsetEntry.w Channel_65C0B	; 5
		offsetEntry.w Channel_65D7D	; 6
		offsetEntry.w Channel_65D9C	; 7
		offsetEntry.w Channel_65DBE	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_6599E:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $F
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b  $B

byte_659B0:
		dc.b $F

byte_659B1:
		dc.b $D3
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $21
		dc.b $71
		dc.b $81
		dc.b $A7
		dc.b   1
		dc.b $A1
		dc.b $D8
		dc.b $51
		dc.b $D9
		dc.b $A1
		dc.b   1
		dc.b $81
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $81
		dc.b $EC
		dc.b $E3
		dc.b $12
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $21
		dc.b $71
		dc.b $91
		dc.b $A5
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $23
		dc.b $D9
		dc.b $C1
		dc.b $A3
		dc.b $C1
		MasakatsuExtraJumpChannel byte_659DF
		dc.b $A1
		dc.b $81
		dc.b $EC

byte_659DF:
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $2F
		dc.b $6F
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $21
		dc.b $71
		dc.b $81
		dc.b $A7
		dc.b   1
		dc.b $A1
		dc.b $D8
		dc.b $51
		dc.b $D9
		dc.b $A1
		dc.b   1
		dc.b $81
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $81
		dc.b $EC
		dc.b $E3
		dc.b $17
		MasakatsuCallChannel byte_65A3A
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $81
		dc.b $51
		MasakatsuCallChannel byte_65A3A
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $91
		dc.b $51
		MasakatsuCallChannel byte_65A3A
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $91
		dc.b $61
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $21
		dc.b $51
		dc.b $A1
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $31
		dc.b $61
		dc.b $A1
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $D9
		dc.b $51
		dc.b $A1
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $61
		dc.b $B1
		dc.b $D8
		dc.b $31
		dc.b $EC
		MasakatsuJumpChannel byte_659B1

byte_65A3A:
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $B1
		dc.b $81
		dc.b $51
		dc.b $D8
		MasakatsuReturnChannel

Channel_65A42:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $14
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   1
		dc.b $D2
		dc.b $DF
		dc.b $C0
		dc.b $71
		dc.b $21
		dc.b $71
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $A1
		dc.b $81
byte_65A59:	dc.b $D2
		dc.b $EB
		dc.b   5
		dc.b $EA
		MasakatsuCallChannel byte_65AC2
		dc.b $EC
		dc.b $DF
		dc.b $C0
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $71
		dc.b $21
		dc.b $73
		dc.b $51
		dc.b $C1
		dc.b $51
		dc.b $EC
		dc.b $31
		dc.b $31
		dc.b $A1
		dc.b $33
		dc.b $51
		dc.b $C1
		dc.b $51
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $21
		dc.b $91
		dc.b $23
		dc.b $21
		dc.b $91
		dc.b $21
		dc.b $EC
		dc.b $EB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_65AC2
		dc.b $EC
		dc.b $DF
		dc.b $C0
		dc.b $A1
		dc.b $51
		dc.b $DF
		dc.b $40
		dc.b $21
		dc.b $D9
		dc.b $A1
		dc.b $DF
		dc.b $C0
		dc.b $81
		dc.b $B1
		dc.b $DF
		dc.b $80
		dc.b $D8
		dc.b $31
		dc.b $81
		dc.b $DF
		dc.b $C0
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $21
		dc.b $DF
		dc.b $40
		dc.b $51
		dc.b $A1
		dc.b $DF
		dc.b $C0
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $DF
		dc.b $80
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $A1
		dc.b $A1
		dc.b $DF
		dc.b $C0
		dc.b $C1
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $DF
		dc.b $40
		dc.b $51
		dc.b $71
		dc.b $91
		dc.b $EA
		MasakatsuJumpChannel byte_65A59
byte_65AC2:	dc.b $DF
		dc.b $C0
		dc.b $71
		dc.b $21
		dc.b $DF
		dc.b $40
		dc.b $71
		dc.b $81
		dc.b $DF
		dc.b $C0
		dc.b $A1
		dc.b $B1
		dc.b $DF
		dc.b $80
		dc.b $A1
		dc.b $81
		MasakatsuReturnChannel
Channel_65AD3:	dc.b $DB
		dc.b   7
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E3
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b  $F
byte_65ADE:	dc.b $D3
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   0
		MasakatsuCallChannel byte_65AFC
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D8
		dc.b $E0
		dc.b $16
		MasakatsuCallChannel byte_65B12
		dc.b $EA
		MasakatsuJumpChannel byte_65ADE
byte_65AFC:	dc.b $EB
		dc.b   2
		dc.b $7B
		dc.b $DB
		dc.b   1
		dc.b $A8
		dc.b $C8
		dc.b $D8
		dc.b $29
		dc.b $DB
		dc.b   7
		dc.b $D9
		dc.b $CB
		dc.b $DB
		dc.b   1
		dc.b $C8
		dc.b $A8
		dc.b $89
		dc.b $DB
		dc.b   7
		dc.b $EC
		MasakatsuReturnChannel
byte_65B12:	dc.b $D9
		dc.b $51
		dc.b $EB
		dc.b   5
		dc.b $71
		dc.b $EC
		dc.b $81
		dc.b $51
		dc.b $81
		dc.b $EB
		dc.b   5
		dc.b $91
		dc.b $EC
		dc.b $B1
		dc.b $81
		dc.b $C1
		dc.b $D8
		dc.b $EB
		dc.b   5
		dc.b $11
		dc.b $EC
		dc.b $31
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $81
		dc.b $EB
		dc.b   5
		dc.b $71
		dc.b $EC
		dc.b $81
		dc.b $51
		dc.b $71
		dc.b $71
		dc.b $61
		dc.b $81
		dc.b $81
		dc.b $81
		dc.b $71
		dc.b $A1
		dc.b $A1
		dc.b $A1
		dc.b $91
		dc.b $C1
		dc.b $B1
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $21
		dc.b $3B
		dc.b $23
		dc.b $D9
		dc.b $C1
		dc.b $61
		dc.b $C5
		dc.b $B1
		dc.b $C1
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $61
		dc.b $D8
		dc.b $35
		dc.b $41
		dc.b $51
		dc.b $61
		dc.b $9F
		dc.b $D9
		MasakatsuCallChannel byte_65B86
		dc.b $B3
		dc.b $B3
		dc.b $EA
		MasakatsuCallChannel byte_65B86
		dc.b $93
		dc.b $93
		dc.b $EA
		MasakatsuCallChannel byte_65B86
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $31
		dc.b $21
		dc.b $31
		dc.b $51
		dc.b $21
		dc.b $60
		dc.b $50
		dc.b $31
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $AD
		dc.b $DA
		dc.b $AF
		MasakatsuReturnChannel
byte_65B86:	dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $50
		dc.b $A1
		dc.b $EC
		MasakatsuReturnChannel
Channel_65B8D:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1E
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b $12
		dc.b  $F
byte_65B9C:	dc.b $D4
		dc.b $EB
		dc.b   4
		dc.b  $F
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $7F
		dc.b $A7
		dc.b $87
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b $B7
		dc.b $DF
		dc.b $C0
		dc.b $C7
		dc.b $D8
		dc.b $17
		dc.b $DF
		dc.b $40
		dc.b $27
		dc.b $DF
		dc.b $C0
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $7F
		dc.b $A7
		dc.b $87
		dc.b $EC
		dc.b $E3
		dc.b $15
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $B0
		dc.b $A0
		dc.b $80
		dc.b $DF
		dc.b $C0
		dc.b $A7
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $20
		dc.b $DF
		dc.b $40
		dc.b $40
		dc.b $20
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $57
		dc.b $67
		dc.b $A7
		dc.b $37
		dc.b $D9
		dc.b $AF
		dc.b $DA
		dc.b $AF
		MasakatsuJumpChannel byte_65B9C
Channel_65BEE:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $12
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
		dc.b $E5
		dc.b $FD
		dc.b $D4
		dc.b $DB
		dc.b   1
		dc.b   4
		dc.b $DB
		dc.b   7
		dc.b $EA
		MasakatsuJumpChannel byte_659B0
		MasakatsuStopChannel

Channel_65C0B:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0
		dc.b  $B
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
byte_65C32:	dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_65D68
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C2
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
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
		dc.b $EB
		dc.b   4
		MasakatsuCallChannel byte_65D68
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $61
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
		dc.b $C1
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
		dc.b $61
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
		dc.b $C1
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
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $EA
		MasakatsuCallChannel byte_65D68
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C4
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_65C32

byte_65D68:
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		MasakatsuReturnChannel

Channel_65D7D:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $D4
		dc.b  $F
byte_65D85:	dc.b $D4
		dc.b $E3
		dc.b   9
		dc.b $EA
		MasakatsuCallChannel byte_65AFC
		dc.b $E3
		dc.b   8
		dc.b $EA
		MasakatsuCallChannel byte_65B12
		dc.b $EA
		MasakatsuJumpChannel byte_65D85
Channel_65D9C:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E5
		dc.b $FE
		dc.b $D4
		dc.b   1
		dc.b  $F

byte_65DA7:
		dc.b $D4
		dc.b $E3
		dc.b   8
		dc.b $EA
		MasakatsuCallChannel byte_65AFC
		dc.b $E3
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_65B12
		dc.b $EA
		MasakatsuJumpChannel byte_65DA7

Channel_65DBE:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   9
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $EB
		dc.b   8
		dc.b $C1
		dc.b $EC

byte_65DCD:
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   9
		dc.b $EB
		dc.b $50
		dc.b $C1
		dc.b $EC
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b  $A
		dc.b $EB
		dc.b $20
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b  $A
		dc.b $EB
		dc.b $10
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   5
		dc.b $C1
		dc.b $EC
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   9
		dc.b $EB
		dc.b   3
		dc.b $C1
		dc.b $EC
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_65DCD