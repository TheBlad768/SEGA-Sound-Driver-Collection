; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_67332	; 0
		MasakatsuLoadChannel Channel_6747E	; 1
		MasakatsuLoadChannel Channel_67608	; 2
		MasakatsuLoadChannel Channel_67646	; 3
		MasakatsuLoadChannel Channel_67674	; 4
		MasakatsuLoadChannel Channel_67780	; 5
		MasakatsuLoadChannel Channel_677D8	; 6
		MasakatsuLoadChannel Channel_677DC	; 7
		MasakatsuLoadChannel Channel_677E0	; 8
; ---------------------------------------------------------------------------

Channel_67332:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $16
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $D4
		dc.b   0
		dc.b $E0
		dc.b   7
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C1
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0

byte_67368:
		dc.b $E0
		dc.b   7
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $51
		dc.b   0
		dc.b $50
		dc.b   0
		dc.b $50
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C1
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $61
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $81
		dc.b   0
		dc.b $A1
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C1
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $10
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $E4
		dc.b $FE
		MasakatsuCallChannel2 byte_6741E
		dc.b $E4
		dc.b   2
		MasakatsuJumpChannel2 byte_67368
byte_6741E:	dc.b $13
		dc.b   0
		dc.b $93
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $93
		dc.b   0
		dc.b $8B
		dc.b   0
		dc.b $73
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $43
		dc.b   0
		dc.b $33
		dc.b   0
		dc.b $63
		dc.b   0
		dc.b $73
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $73
		dc.b   0
		dc.b $B3
		dc.b   0
		dc.b $A1
		dc.b   0
		dc.b $61
		dc.b   0
		dc.b $81
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b $61
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $23
		dc.b   0
		dc.b $15
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $E4
		dc.b $FE
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $12
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $52
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $DF
		dc.b $40
		dc.b $92
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $DB
		dc.b   6
		dc.b $DF
		dc.b $C0
		dc.b $E4
		dc.b   2
		dc.b $E9
		dc.b   0
Channel_6747E:	dc.b $DB
		dc.b   6
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $EB
		dc.b   2
		dc.b  $B
		dc.b   0
		dc.b $EC
		dc.b   0
byte_67492:	dc.b $D3
		dc.b   0
		dc.b $E3
		dc.b $12
		MasakatsuCallChannel2 byte_675A0
		dc.b $E4
		dc.b $FE
		dc.b $EB
		dc.b   2
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $D9
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $52
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $DF
		dc.b $40
		dc.b $92
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $DB
		dc.b   6
		dc.b $15
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $40
		dc.b $12
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $92
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $52
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $DB
		dc.b   6
		dc.b $15
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $DB
		dc.b   1
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $80
		dc.b $12
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $52
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $DF
		dc.b $40
		dc.b $92
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $92
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $52
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $32
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $52
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $DF
		dc.b $40
		dc.b $72
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $92
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $B2
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $92
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $72
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $52
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $12
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $92
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $52
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $DB
		dc.b   6
		dc.b $15
		dc.b   0
		dc.b $DF
		dc.b $C0
		MasakatsuJumpChannel2 byte_67492
byte_675A0:	dc.b $EB
		dc.b   2
		dc.b  $B
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $93
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $93
		dc.b   0
		dc.b $8B
		dc.b   0
		dc.b $73
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $43
		dc.b   0
		dc.b $33
		dc.b   0
		dc.b $63
		dc.b   0
		dc.b $73
		dc.b   0
		dc.b $93
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $B3
		dc.b   0
		dc.b $A1
		dc.b   0
		dc.b $61
		dc.b   0
		dc.b $81
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b $61
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $23
		dc.b   0
		dc.b $15
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $DB
		dc.b   1
		dc.b $E4
		dc.b $FB
		dc.b $DF
		dc.b $40
		dc.b $12
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C2
		dc.b   0
		dc.b $B2
		dc.b   0
		dc.b $A2
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $92
		dc.b   0
		dc.b $82
		dc.b   0
		dc.b $72
		dc.b   0
		dc.b $62
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $52
		dc.b   0
		dc.b $42
		dc.b   0
		dc.b $32
		dc.b   0
		dc.b $22
		dc.b   0
		dc.b $DB
		dc.b   6
		dc.b $DF
		dc.b $C0
		dc.b $E4
		dc.b   5
		dc.b $E9
		dc.b   0
Channel_67608:	dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $14
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   6
		dc.b $D3
		dc.b   0
byte_6761C:	dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $21
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $20
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C1
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0
		MasakatsuJumpChannel2 byte_6761C
Channel_67646:	dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $24
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $E5
		dc.b $FE
		dc.b $EB
		dc.b 2
		dc.b $B
		dc.b 0
		dc.b $EC
		dc.b 0
		dc.b 1
		dc.b 0
byte_67660:	dc.b $D3
		dc.b 0
		MasakatsuCallChannel2 byte_675A0
		MasakatsuCallChannel2 byte_6741E
		MasakatsuJumpChannel2 byte_67660
Channel_67674:	dc.b $DB
		dc.b 6
		dc.b $E3
		dc.b $14
		dc.b $F4
		dc.b 6
		dc.b $F3
		dc.b 1
		dc.b $DE
		dc.b $24
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b  $B
		dc.b   0
		dc.b $EC
		dc.b   0
byte_67688:	dc.b $E0
		dc.b $20
		dc.b $D3
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $90
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $70
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $B0
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $70
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $40
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $70
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $60
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $70
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $60
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $90
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $70
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $60
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $90
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $70
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $A0
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C0
		dc.b   0
		dc.b $90
		dc.b   0
		dc.b $80
		dc.b   0
		dc.b $60
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $1B
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $D9
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $1B
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $33
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $C1
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $91
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $83
		dc.b   0
		dc.b $63
		dc.b   0
		dc.b $4B
		dc.b   0
		MasakatsuJumpChannel2 byte_67688
Channel_67780:	dc.b $DB
		dc.b   6
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b  $B
		dc.b  $B
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
byte_67790:	dc.b $EB
		dc.b   8
		dc.b $EB
		dc.b   8
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b $EB
		dc.b   8
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b   0
		dc.b $A0
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   6
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b   0
		dc.b $A0
		dc.b   0
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b $EC
		dc.b   0
		MasakatsuJumpChannel2 byte_67790

Channel_677D8:
		dc.b $F1
		dc.b   0
		dc.b $F0
		dc.b   0

Channel_677DC:
		dc.b $F1
		dc.b   0
		dc.b $F0
		dc.b   0

Channel_677E0:
		dc.b $F1
		dc.b   0
		dc.b $F0
		dc.b   0