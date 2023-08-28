; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_67C35	; 0
		MasakatsuLoadChannel Channel_67CAE	; 1
		MasakatsuLoadChannel Channel_67CCF	; 2
		MasakatsuLoadChannel Channel_67D05	; 3
		MasakatsuLoadChannel Channel_67D47	; 4
		MasakatsuLoadChannel Channel_67D65	; 5
		MasakatsuLoadChannel Channel_67D86	; 6
		MasakatsuLoadChannel Channel_67D99	; 7
		MasakatsuLoadChannel Channel_67DA9	; 8
; ---------------------------------------------------------------------------

Channel_67C35:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $11
		dc.b $E0
		dc.b $23
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $38
		dc.b $E1
		dc.b   0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D3
		dc.b  $F
		dc.b  $F

byte_67C4A:
		dc.b $6D
		dc.b $50
		dc.b $60
		dc.b $83
		dc.b $67
		dc.b $83
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $AB
		dc.b $D8
		dc.b $33
		dc.b $63
		dc.b $51
		dc.b $61
		dc.b $83
		dc.b $63
		dc.b $57
		dc.b $37
		dc.b $DA
		dc.b $3F
		dc.b $6F
		dc.b $DA
		dc.b $63
		dc.b $51
		dc.b $31
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $11
		dc.b $DA
		dc.b $17
		dc.b $37
		dc.b $DA
		dc.b $37
		dc.b $D9
		dc.b $DB
		dc.b   1
		dc.b $A8
		dc.b $D8
		dc.b $38
		dc.b $69
		dc.b $DB
		dc.b   7
		dc.b $F4
		dc.b   6
		dc.b $A7
		dc.b $D8
		dc.b $37
		dc.b $DA
		dc.b $3F
		dc.b $6F
		dc.b $DB
		dc.b   1
		dc.b $58
		dc.b $68
		dc.b $89
		dc.b $DB
		dc.b   7
		dc.b $EB
		dc.b   3
		dc.b $60
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $EC
		dc.b $3F
		dc.b $DA
		dc.b $3B
		dc.b $13
		dc.b $3F
		dc.b $AF
		dc.b $D8
		dc.b $3F
		dc.b $DA
		dc.b $3F
		dc.b $6F
		dc.b $DA
		dc.b $6F
		dc.b $6F
		dc.b $DA
		dc.b $6F
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $E4
		dc.b   2
		dc.b $DA
		dc.b $A7
		dc.b $DA
		dc.b $E4
		dc.b   2
		dc.b $A5
		dc.b $DA
		dc.b $E4
		dc.b   4
		dc.b $A1
		MasakatsuStopChannel

Channel_67CAE:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1C
		dc.b $EA
		MasakatsuCallChannel byte_67A5C
		dc.b $EB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_67A6A
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $30
		dc.b $B0
		dc.b $A0
		dc.b $80
		dc.b $A0
		dc.b $60
		dc.b $80
		dc.b $50
		dc.b $E4
		dc.b   5
		dc.b $EC
		MasakatsuStopChannel

Channel_67CCF:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $18
		MasakatsuCallChannel byte_67ABA

byte_67CD8:
		dc.b $EB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_67AC8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $D8
		dc.b $30
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $80
		dc.b $E4
		dc.b   4
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $E4
		dc.b   5
		dc.b $EC
		dc.b $EC
		MasakatsuStopChannel

Channel_67D05:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $18
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $24
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D4
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $D8
		dc.b $30
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $EC
		dc.b $E3
		dc.b $1D
		dc.b $E0
		dc.b $23
		dc.b $DE
		dc.b $38
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D3
		dc.b $E5
		dc.b $FB
		dc.b   1
		MasakatsuJumpChannel byte_67C4A
		MasakatsuStopChannel

Channel_67D47:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1B
		MasakatsuCallChannel byte_67B04

byte_67D50:
		dc.b $EB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_67B12
		dc.b $EC
		dc.b $3F
		dc.b $E4
		dc.b   4
		dc.b $6F
		dc.b $E4
		dc.b   4
		dc.b $BF
		dc.b $DA
		dc.b $E4
		dc.b   4
		dc.b $BF
		MasakatsuStopChannel

Channel_67D65:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1B
		dc.b $E5
		dc.b $FD
		MasakatsuCallChannel byte_67B35
		dc.b $EB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_67B43
		dc.b $EC
		dc.b $AF
		dc.b $E4
		dc.b   4
		dc.b $D8
		dc.b $3F
		dc.b $E4
		dc.b   4
		dc.b $6F
		dc.b $DA
		dc.b $E4
		dc.b   4
		dc.b $6F
		MasakatsuStopChannel

Channel_67D86:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   8
		dc.b $E5
		dc.b $FE
		dc.b $D4
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel byte_67D50
		MasakatsuStopChannel

Channel_67D99:
		dc.b $DB
		dc.b   7

byte_67D9B:	dc.b $E3
		dc.b   9
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $D4
		dc.b $EA
		MasakatsuJumpChannel byte_67CD8
		MasakatsuStopChannel

Channel_67DA9:
		dc.b $DB
		dc.b   7
		dc.b $E5
		dc.b $FE
		dc.b   1
		dc.b $EA
		MasakatsuJumpChannel byte_67D9B
		MasakatsuStopChannel

byte_67A5C:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $24
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D5
		MasakatsuReturnChannel

byte_67A6A:
		dc.b $EB
		dc.b   8
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $B0
		dc.b $DF
		dc.b $C0
		dc.b $A0
		dc.b $80
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $50
		dc.b $EC
		MasakatsuReturnChannel

byte_67ABA:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $24
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D4
		MasakatsuReturnChannel

byte_67AC8:
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $D8
		dc.b $30
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $D8
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $EC
		dc.b $EC
		MasakatsuReturnChannel

byte_67B04:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D3
		MasakatsuReturnChannel

byte_67B12:
		dc.b $3F
		dc.b $6F
		dc.b $BF
		dc.b $DA
		dc.b $BF
		MasakatsuReturnChannel

byte_67B35:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $D3
		MasakatsuReturnChannel

byte_67B43:
		dc.b $AF
		dc.b $D8
		dc.b $3F
		dc.b $6F
		dc.b $DA
		dc.b $6F
		dc.b $D9
		MasakatsuReturnChannel
