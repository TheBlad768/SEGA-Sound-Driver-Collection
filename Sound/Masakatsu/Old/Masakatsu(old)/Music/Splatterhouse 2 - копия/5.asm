; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_638A4	; 0
		offsetEntry.w Channel_63937	; 1
		offsetEntry.w Channel_639B2	; 2
		offsetEntry.w Channel_63A2A	; 3
		offsetEntry.w Channel_63AD1	; 4
		offsetEntry.w Channel_63AF0	; 5
		offsetEntry.w Channel_63B5C	; 6
		offsetEntry.w Channel_63B70	; 7
		offsetEntry.w Channel_63B88	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_638A4:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $12
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
		dc.b $E5
		dc.b   2
		dc.b $E0
		dc.b $B

byte_638B6:
		dc.b $D3
		MasakatsuCallChannel byte_638C2
		dc.b $EA
		MasakatsuJumpChannel byte_638B6

byte_638C2:
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $D8
		dc.b $51
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $51
		dc.b $11
		dc.b $51
		MasakatsuExtraJumpChannel byte_638D6
		dc.b $D9
		dc.b $C1
		dc.b   1
		dc.b $EC

byte_638D6:
		dc.b $31
		dc.b   1
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $D8
		dc.b $A1
		dc.b $61
		dc.b $41
		dc.b $61
		dc.b $21
		dc.b $EA
		MasakatsuExtraJumpChannel byte_638EC
		dc.b $D9
		dc.b $C1
		dc.b   1
		dc.b $EC

byte_638EC:
		dc.b $41
		dc.b   1
		dc.b $EB
		dc.b   2
		dc.b $91
		dc.b $81
		dc.b $91
		dc.b $A1
		dc.b $91
		MasakatsuExtraJumpChannel byte_63900
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $B1
		dc.b $EC
byte_63900:	dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $51
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $41
		dc.b $51
		dc.b $41
		dc.b $81
		dc.b $71
		dc.b $61
		dc.b $41
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $41
		dc.b $51
		dc.b $61
		dc.b $71
		dc.b $A1
		dc.b $91
		dc.b $EB
		dc.b   2
		dc.b $A3
		dc.b $13
		dc.b $A3
		dc.b $13
		dc.b $73
		dc.b $D9
		dc.b $A3
		MasakatsuExtraJumpChannel byte_6392C
		dc.b $D8
		dc.b $73
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $EC

byte_6392C:
		dc.b $B3
		dc.b $D8
		dc.b $83
		dc.b $93
		dc.b $D9
		dc.b $C3
		dc.b $D8
		dc.b $13
		dc.b $A3
		dc.b $BF
		MasakatsuReturnChannel

Channel_63937:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $21
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
		dc.b  $B

byte_63949:
		dc.b $D3
		dc.b $DB
		dc.b   1
		dc.b   1
		dc.b $DB
		dc.b   6
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $81
		dc.b $D8
		dc.b $81
		dc.b $EB
		dc.b   3
		dc.b $51
		dc.b $81
		dc.b $EC
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $21
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $C1
		dc.b $A1
		dc.b $C1
		dc.b $81
		dc.b $61
		dc.b   1
		dc.b $EC
		dc.b $51
		dc.b $21
		dc.b $51
		dc.b $61
		dc.b $51
		dc.b $81
		dc.b $71
		dc.b $61
		dc.b $51
		dc.b $21
		dc.b $51
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $71
		dc.b $81
		dc.b $91
		dc.b $61
		dc.b $91
		dc.b $A1
		dc.b $91
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $91
		dc.b $61
		dc.b $91
		dc.b $A1
		dc.b $91
		dc.b $A1
		dc.b $B1
		dc.b $C0
		dc.b $DB
		dc.b   1
		dc.b   3
		dc.b $DB
		dc.b   6
		dc.b $D8
		dc.b $E3
		dc.b $1C
		dc.b $EB
		dc.b   2
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $A3
		dc.b $93
		dc.b $73
		MasakatsuExtraJumpChannel byte_639A4
		dc.b $93
		dc.b $73
		dc.b $D8
		dc.b $EC

byte_639A4:
		dc.b $83
		dc.b $B3
		dc.b $C3
		dc.b $93
		dc.b $A3
		dc.b $D8
		dc.b $23
		dc.b $3F
		dc.b $EA
		MasakatsuJumpChannel byte_63949

Channel_639B2:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $17
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   7
		dc.b $D4

byte_639C1:
		dc.b $DF
		dc.b $C0
		dc.b   7
		dc.b $D9
		dc.b $51
		dc.b $81
		dc.b $71
		dc.b $81
		dc.b   7
		dc.b $31
		dc.b $81
		dc.b $71
		dc.b $81
		dc.b $EB
		dc.b   2
		dc.b   7
		dc.b $21
		dc.b $A1
		dc.b $91
		dc.b $A1
		dc.b $EC
		dc.b   7
		dc.b $31
		dc.b $81
		dc.b $71
		dc.b $81
		dc.b   7
		dc.b $31
		dc.b $81
		dc.b $71
		dc.b $A1
		dc.b $EB
		dc.b   2
		dc.b   7
		dc.b $11
		dc.b $81
		dc.b $71
		dc.b $81
		dc.b $EC
		dc.b  $B
		dc.b   0
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $80
		dc.b $DF
		dc.b $80
		dc.b $7B
		dc.b $70
		dc.b $70
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $90
		dc.b $DF
		dc.b $40
		dc.b $AB
		dc.b $A0
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $80
		dc.b $DF
		dc.b $80
		dc.b $7B
		dc.b $70
		dc.b $80
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $A0
		dc.b $DF
		dc.b $40
		dc.b $9B
		dc.b $90
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $A0
		dc.b $DF
		dc.b $80
		dc.b $B9
		dc.b $DF
		dc.b $C0
		dc.b $B0
		dc.b $A0
		dc.b $DF
		dc.b $40
		dc.b $90
		dc.b $80
		dc.b $DF
		dc.b $C0
		dc.b $70
		dc.b $60
		MasakatsuJumpChannel byte_639C1

Channel_63A2A:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $17
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
		dc.b   1

byte_63A3A:
		dc.b $D2
		MasakatsuCallChannel byte_63A9A
		dc.b $EA
		MasakatsuCallChannel byte_63A9A
		dc.b $D8
		MasakatsuCallChannel byte_63AA5
		dc.b $EA
		MasakatsuCallChannel byte_63AB0
		dc.b $EA
		MasakatsuCallChannel byte_63ABB
		dc.b $EA
		MasakatsuCallChannel byte_63AC6
		dc.b $EA
		MasakatsuCallChannel byte_63AA5
		dc.b $D9
		MasakatsuCallChannel byte_63A9A
		dc.b $D8
		MasakatsuCallChannel byte_63AA5
		dc.b $D9
		dc.b $EB
		dc.b   3
		dc.b $91
		dc.b $90
		dc.b $90
		dc.b $EC
		dc.b $D8
		dc.b $91
		dc.b $D9
		dc.b $91
		dc.b $D8
		dc.b $EA
		MasakatsuCallChannel byte_63AA5
		dc.b $EA
		MasakatsuCallChannel byte_63AB0
		dc.b $EA
		MasakatsuCallChannel byte_63AC6
		dc.b $EA
		MasakatsuCallChannel byte_63ABB
		dc.b $EA
		MasakatsuJumpChannel byte_63A3A

byte_63A9A:
		dc.b $EB
		dc.b   3
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC
		dc.b $D8
		dc.b $C1
		dc.b $D9
		dc.b $C1
		MasakatsuReturnChannel

byte_63AA5:
		dc.b $EB
		dc.b   3
		dc.b $11
		dc.b $10
		dc.b $10
		dc.b $EC
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $11
		MasakatsuReturnChannel

byte_63AB0:
		dc.b $EB
		dc.b   3
		dc.b $41
		dc.b $40
		dc.b $40
		dc.b $EC
		dc.b $D8
		dc.b $41
		dc.b $D9
		dc.b $41
		MasakatsuReturnChannel

byte_63ABB:
		dc.b $EB
		dc.b   3
		dc.b $31
		dc.b $30
		dc.b $30
		dc.b $EC
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $31
		MasakatsuReturnChannel

byte_63AC6:
		dc.b $EB
		dc.b   3
		dc.b $21
		dc.b $20
		dc.b $20
		dc.b $EC
		dc.b $D8
		dc.b $21
		dc.b $D9
		dc.b $21
		MasakatsuReturnChannel

Channel_63AD1:
		dc.b $E3
		dc.b $1C
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
		dc.b $DB
		dc.b   6
		dc.b $E0
		dc.b  $B
		dc.b $E5
		dc.b $FD
		dc.b   1

byte_63AE4:
		dc.b $D3
		MasakatsuCallChannel byte_638C2
		dc.b $EA
		MasakatsuJumpChannel byte_63AE4

Channel_63AF0:
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0
		dc.b $DB
		dc.b   6

byte_63AF6:
		dc.b $EB
		dc.b $18
		dc.b   1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   3
		dc.b   1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b $EC
		dc.b $EB
		dc.b   5
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b   1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $11
		dc.b   1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $EC
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $10
		dc.b   0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b $10
		dc.b   0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EA
		MasakatsuJumpChannel byte_63AF6

Channel_63B5C:
		dc.b $DB
		dc.b   6
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b  $A

byte_63B64:
		dc.b $D4
		MasakatsuCallChannel byte_63A9A
		dc.b $EA
		MasakatsuJumpChannel byte_63B64

Channel_63B70:
		dc.b $DB
		dc.b   6
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b  $C
		dc.b $E5
		dc.b $FE
		dc.b   1

byte_63B7B:
		dc.b $D3
		dc.b $EA
		MasakatsuCallChannel byte_63A9A
		dc.b $EA
		MasakatsuJumpChannel byte_63B7B

Channel_63B88:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   6
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   7
		dc.b $D7
		dc.b $E1
		dc.b $24

byte_63B93:
		dc.b $EB
		dc.b $10
		dc.b $C2
		dc.b $C0
		dc.b $EC
		dc.b $EB
		dc.b $12
		dc.b $C2
		dc.b $C0
		dc.b $F1
		dc.b   2
		dc.b $C2
		dc.b $F1
		dc.b   1
		dc.b $C0
		dc.b $EC
		dc.b $C2
		dc.b $C0
		dc.b $F1
		dc.b   2
		dc.b $C2
		dc.b $F1
		dc.b   1
		dc.b $C0
		dc.b   7
		dc.b $EA
		MasakatsuJumpChannel byte_63B93