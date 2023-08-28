; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_62BC5	; 0
		MasakatsuLoadChannel Channel_62C48	; 1
		MasakatsuLoadChannel Channel_62CB0	; 2
		MasakatsuLoadChannel Channel_62D33	; 3
		MasakatsuLoadChannel Channel_62D76	; 4
		MasakatsuLoadChannel Channel_62D94	; 5
		MasakatsuLoadChannel Channel_62DE2	; 6
		MasakatsuLoadChannel Channel_62DFE	; 7
		MasakatsuLoadChannel Channel_62E1C	; 8
; ---------------------------------------------------------------------------

Channel_62BC5:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1B
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5

byte_62BD5:
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_62BE2
		dc.b $EA
		MasakatsuJumpChannel byte_62BD5

byte_62BE2:
		dc.b $EB
		dc.b   2
		dc.b $B1
		dc.b $A1
		dc.b $41
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $41
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $B1
		dc.b $A1
		dc.b $41
		dc.b $EC
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $41
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $41
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $61
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $B1
		dc.b $D8
		dc.b $51
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $31
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $71
		dc.b $61
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $51
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $31
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $61
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $71
		dc.b $61
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $51
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $31
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $51
		dc.b $91
		dc.b $EC
		MasakatsuReturnChannel

Channel_62C48:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $14
		dc.b $E0
		dc.b   1

byte_62C52:
		dc.b $D1
		dc.b $EB
		dc.b   2
		dc.b $81
		dc.b $83
		dc.b $81
		dc.b $83
		dc.b $A1
		dc.b $A3
		dc.b $A1
		dc.b $A3
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $B1
		dc.b $B1
		dc.b $D8
		dc.b $B1
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $31
		dc.b $31
		dc.b $D8
		dc.b $31
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $11
		dc.b $11
		dc.b $D8
		dc.b $11
		dc.b $EC
		dc.b $D9
		dc.b $C1
		dc.b $C3
		dc.b $D8
		dc.b $11
		dc.b $13
		dc.b $21
		dc.b $23
		dc.b $31
		dc.b $33
		dc.b $41
		dc.b $43
		dc.b $51
		dc.b $53
		dc.b $61
		dc.b $63
		dc.b $71
		dc.b $73
		dc.b $D9
		dc.b $C1
		dc.b $C1
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $B1
		dc.b $B1
		dc.b $D8
		dc.b $B1
		dc.b $D9
		dc.b $A1
		dc.b $A3
		dc.b $91
		dc.b $93
		dc.b $A1
		dc.b $A3
		dc.b $B1
		dc.b $B3
		dc.b $C1
		dc.b $C3
		dc.b $D8
		dc.b $11
		dc.b $13
		dc.b $EA
		MasakatsuJumpChannel byte_62C52

Channel_62CB0:
		dc.b $DB
		dc.b   7
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0

byte_62CB8:
		dc.b $F4
		dc.b   4
		dc.b $F3
		dc.b   0
		dc.b $E3
		dc.b $17
		dc.b $E0
		dc.b  $B
		dc.b $D4
		MasakatsuCallChannel byte_62CE2
		dc.b $E0
		dc.b   8
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $E3
		dc.b $13
		dc.b $DB
		dc.b   1
		dc.b   1
		dc.b $DB
		dc.b   7
		MasakatsuCallChannel byte_62D01
		dc.b $DB
		dc.b   1
		dc.b   4
		dc.b $DB
		dc.b   7
		MasakatsuJumpChannel byte_62CB8

byte_62CE2:
		dc.b 3
		dc.b $C1
		dc.b $B3
		dc.b   1
		dc.b $EB
		dc.b   3
		dc.b   3
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C3
		dc.b   1
		dc.b   3
		MasakatsuExtraJumpChannel byte_62CF8
		dc.b $C1
		dc.b $B3
		dc.b   1
		dc.b $EC

byte_62CF8:
		dc.b $61
		dc.b $53
		dc.b   1
		dc.b   3
		dc.b $71
		dc.b $63
		dc.b $D9
		dc.b   1
		MasakatsuReturnChannel

byte_62D01:
		dc.b $D8
		dc.b $33
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $41
		dc.b $31
		dc.b $41
		dc.b $A1
		dc.b $91
		dc.b $81
		dc.b $71
		dc.b $61
		dc.b $A1
		dc.b $91
		dc.b $D8
		dc.b $15
		dc.b $33
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $31
		dc.b $31
		dc.b $21
		dc.b $91
		dc.b $91
		dc.b $A1
		dc.b $B1
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $91
		dc.b $C1
		dc.b $B1
		dc.b $D8
		dc.b $34
		dc.b $DA
		MasakatsuReturnChannel

Channel_62D33:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $2A

byte_62D3B:
		dc.b $D4
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1B
		dc.b $F4
		dc.b   3
		dc.b $3B
		dc.b $4B
		dc.b $3B
		dc.b $4B
		dc.b $5B
		dc.b $6B
		dc.b $9B
		dc.b $8B
		dc.b $E0
		dc.b  $C
		dc.b $E3
		dc.b $10
		dc.b $65
		dc.b $75
		dc.b $85
		dc.b $A5
		dc.b $B5
		dc.b $C5
		dc.b $D8
		dc.b $15
		dc.b $25
		dc.b $F4
		dc.b   3
		dc.b $33
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $31
		dc.b $31
		dc.b $21
		dc.b $91
		dc.b $91
		dc.b $A1
		dc.b $B1
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $91
		dc.b $C1
		dc.b $B1
		dc.b $D8
		dc.b $35
		MasakatsuJumpChannel byte_62D3B

Channel_62D76:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $23
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $E5
		dc.b $FD
		dc.b   1

byte_62D87:
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_62BE2
		dc.b $EA
		MasakatsuJumpChannel byte_62D87

Channel_62D94:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0

byte_62D9A:
		dc.b $EB
		dc.b   8
		dc.b   3
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $EC
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $13
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $EC
		dc.b   3
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b   1
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b   1
		dc.b $E0
		dc.b $1E
		dc.b $D3
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b   1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $EC
		dc.b $EC
		MasakatsuJumpChannel byte_62D9A

Channel_62DE2:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E5
		dc.b $FD
		dc.b $E3
		dc.b  $A

byte_62DEC:
		dc.b $D5
		MasakatsuCallChannel byte_62CE2
		dc.b $EA
		MasakatsuCallChannel byte_62D01
		dc.b 0
		MasakatsuJumpChannel byte_62DEC

Channel_62DFE:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E5
		dc.b $FF
		dc.b $E3
		dc.b  $B
		dc.b   0

byte_62E09:
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_62CE2
		dc.b $EA
		MasakatsuCallChannel byte_62D01
		dc.b 0
		MasakatsuJumpChannel byte_62E09

Channel_62E1C:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $E3
		dc.b   6

byte_62E25:
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b  $C
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b  $C
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   3
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $C1
		dc.b $EC
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $C0
		dc.b $C0
		dc.b $EB
		dc.b   2
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b   4
		dc.b $E3
		dc.b   4
		dc.b $C0
		dc.b $E3
		dc.b   6
		dc.b $EB
		dc.b   5
		dc.b $C0
		dc.b $EC
		dc.b $EC
		dc.b $F1
		dc.b   4
		dc.b $EB
		dc.b   4
		dc.b $E3
		dc.b   5
		dc.b $C0
		dc.b $E3
		dc.b   7
		dc.b $EB
		dc.b   5
		dc.b $C0
		dc.b $EC
		dc.b $EC
		dc.b $EC
		MasakatsuJumpChannel byte_62E25