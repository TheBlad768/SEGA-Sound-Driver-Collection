; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_67DB5	; 0
		MasakatsuLoadChannel Channel_67E36	; 1
		MasakatsuLoadChannel Channel_67EA7	; 2
		MasakatsuLoadChannel Channel_67F29	; 3
		MasakatsuLoadChannel Channel_67F3F	; 4
		MasakatsuLoadChannel Channel_67FB1	; 5
		MasakatsuLoadChannel Channel_68197	; 6
		MasakatsuLoadChannel Channel_681A7	; 7
		MasakatsuLoadChannel Channel_681AA	; 8
; ---------------------------------------------------------------------------

Channel_67DB5:
		dc.b $DB
		dc.b   7
		MasakatsuCallChannel byte_66F40
		dc.b $EA
		MasakatsuCallChannel byte_67DCB
		dc.b $DA
		dc.b $C1
		dc.b 3
		MasakatsuJumpChannel Channel_62E66
		MasakatsuStopChannel

byte_67DCB:
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $C0
		dc.b $B0
		dc.b $A0
		dc.b $90
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $50
		dc.b $40
		dc.b $30
		dc.b $EC
		dc.b $EC
		dc.b $20
		dc.b $50
		dc.b $20
		dc.b $50
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $50
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $50
		dc.b $EC
		dc.b $20
		dc.b $40
		dc.b $50
		dc.b $20
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $50
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $50
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $50
		dc.b $EC
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $20
		dc.b $40
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $50
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $50
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $40
		dc.b $70
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $40
		dc.b $70
		dc.b $DF
		dc.b $40
		dc.b $60
		dc.b $90
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $40
		dc.b $90
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $D9
		dc.b $C7
		dc.b $DA
		dc.b $C3
		MasakatsuReturnChannel
Channel_67E36:	dc.b $DB
		dc.b   7
		dc.b $EA
		MasakatsuCallChannel byte_66F8A
		dc.b $D5
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $40
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $DF
		dc.b $40
		dc.b $C0
		dc.b $DF
		dc.b $C0
		dc.b $B0
		dc.b $A0
		dc.b $DF
		dc.b $80
		dc.b $90
		dc.b $EC
		dc.b $EC
		dc.b $DF
		dc.b $C0
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $50
		dc.b $80
		dc.b $50
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $EB
		dc.b   4
		dc.b $20
		dc.b $80
		dc.b $EC
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b $90
		dc.b $50
		dc.b $40
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $C0
		dc.b $80
		dc.b $C0
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $A0
		dc.b $D8
		dc.b $10
		dc.b $40
		dc.b $DF
		dc.b $C0
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $60
		dc.b $20
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $60
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $60
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $97
		dc.b $DA
		dc.b $E4
		dc.b $FB
		dc.b $95
		dc.b   3
		dc.b $EA
		MasakatsuJumpChannel Channel_62F4D
		MasakatsuStopChannel
Channel_67EA7:	dc.b $DB
		dc.b   7
		MasakatsuCallChannel byte_66FAA
		dc.b $E3
		dc.b $1D
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $90
		dc.b $A0
		dc.b $B0
		dc.b $C0
		dc.b $EC
		dc.b $D8
		dc.b $37
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $40
		dc.b $50
		dc.b $60
		dc.b $EC
		dc.b $C7
		dc.b $87
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $83
		dc.b $B2
		dc.b $D8
		dc.b $23
		dc.b $52
		dc.b $D9
		dc.b $B3
		dc.b $DF
		dc.b $C0
		dc.b $D8
		dc.b $22
		dc.b $53
		dc.b $82
		dc.b $23
		dc.b $52
		dc.b $83
		dc.b $DF
		dc.b $40
		dc.b $B2
		dc.b $53
		dc.b $82
		dc.b $B3
		dc.b $D8
		dc.b $22
		dc.b $DB
		dc.b   7
		dc.b $D9
		dc.b $87
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $80
		dc.b $B3
		dc.b $D8
		dc.b $22
		dc.b $53
		dc.b $82
		dc.b $23
		dc.b $DF
		dc.b $C0
		dc.b $52
		dc.b $83
		dc.b $B2
		dc.b $53
		dc.b $82
		dc.b $B3
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $22
		dc.b $D9
		dc.b $83
		dc.b $B2
		dc.b $D8
		dc.b $23
		dc.b $52
		dc.b $DB
		dc.b   7
		dc.b $D9
		dc.b $23
		dc.b $53
		dc.b $13
		dc.b $DB
		dc.b   1
		dc.b $DF
		dc.b $40
		dc.b $72
		dc.b $43
		dc.b $22
		dc.b $DF
		dc.b $C0
		dc.b $13
		dc.b $D9
		dc.b $A2
		dc.b $DF
		dc.b $80
		dc.b $93
		dc.b $72
		dc.b $63
		dc.b $DB
		dc.b   7
		dc.b $DF
		dc.b $C0
		dc.b $D8
		dc.b $C7
		dc.b $D8
		dc.b $37
		dc.b $DA
		dc.b $35
		dc.b   3
		dc.b $EA
		MasakatsuJumpChannel Channel_630FF
		MasakatsuStopChannel
Channel_67F29:	dc.b $DB
		dc.b   7
		MasakatsuCallChannel byte_66FC9
		dc.b $E0
		dc.b $10
		dc.b   1
		MasakatsuCallChannel byte_67DCB
		dc.b   3
		MasakatsuJumpChannel Channel_631BA
		MasakatsuStopChannel
Channel_67F3F:	dc.b $DB
		dc.b 7
		MasakatsuCallChannel byte_67000
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $D8
		dc.b $80
		dc.b $EC
		dc.b $D9
		dc.b $80
		dc.b $80
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
		dc.b $EB
		dc.b   2
		dc.b $50
		dc.b $50
		dc.b $D8
		dc.b $50
		dc.b $D9
		dc.b $EC
		dc.b $50
		dc.b $50
		dc.b $EB
		dc.b   2
		dc.b $20
		dc.b $20
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $EC
		dc.b $20
		dc.b $20
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
		dc.b $50
		dc.b $50
		dc.b $D8
		dc.b $50
		dc.b $D9
		dc.b $EC
		dc.b $50
		dc.b $50
		dc.b $20
		dc.b $20
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $20
		dc.b $30
		dc.b $D8
		dc.b $30
		dc.b $D9
		dc.b $30
		dc.b $30
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
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $30
		dc.b $D8
		dc.b $30
		dc.b $D9
		dc.b $EC
		dc.b $30
		dc.b $30
		dc.b $67
		dc.b $DA
		dc.b $65
		dc.b   3
		dc.b $EA
		MasakatsuJumpChannel Channel_6324C
		MasakatsuStopChannel
Channel_67FB1:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $D
		dc.b $DF
		dc.b $C0
		dc.b $EB
		dc.b   2
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
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C2
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C3
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   7
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
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
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $64
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $64
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
		dc.b $A6
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A6
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $66
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $66
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C6
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C2
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $DB
		dc.b   7
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
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $61
		dc.b $EF
		dc.b   0
		dc.b   5
		dc.b $EB
		dc.b   2
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $64
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $64
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C3
		dc.b $EF
		dc.b   0
		dc.b $DB
		dc.b   7
		dc.b $EC
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
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A2
		dc.b $E0
		dc.b $1F
		dc.b $D2
		dc.b $A3
		dc.b $DB
		dc.b   7
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
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b   5
		dc.b   9
		MasakatsuJumpChannel Channel_6335A
		MasakatsuStopChannel

Channel_6335A:
		dc.b $DB
		dc.b   5
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b  $C
		dc.b $EB
		dc.b   2
		dc.b $EA
		MasakatsuCallChannel byte_634E8
		dc.b $EC
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
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A1
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
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
		dc.b $61
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
		dc.b $19
		dc.b $D2
		dc.b $A1
		MasakatsuCallChannel byte_634FD
byte_633A2:	dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_634E8
		dc.b $EA
		MasakatsuCallChannel byte_635C0
		dc.b $EC
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
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		MasakatsuCallChannel byte_634FD
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   6
		MasakatsuCallChannel byte_63526
		dc.b $EC
		MasakatsuCallChannel byte_6353F
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_6358B
		dc.b $EC
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C1
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
		dc.b $18
		dc.b $D1
		dc.b $C3
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
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EC
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_6353F
		dc.b   1
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
		dc.b $A0
		dc.b $EF
		dc.b   0
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
		MasakatsuJumpChannel byte_633A2

byte_634E8:
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
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		MasakatsuReturnChannel

byte_634FD:	dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $60
		dc.b $EF
		dc.b   0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $EC
		MasakatsuReturnChannel

byte_635C0:
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		MasakatsuReturnChannel

byte_63526:
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
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
		MasakatsuReturnChannel

byte_6358B:
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C1
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
		dc.b $18
		dc.b $D1
		dc.b $C3
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
		dc.b $D3
		dc.b $EF
		dc.b $1E
		dc.b $C0
		dc.b $EF
		dc.b   0
		MasakatsuReturnChannel

byte_6353F:
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $EC
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
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
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
		MasakatsuReturnChannel








Channel_68197:
		dc.b $DB
		dc.b   7
		dc.b $F1
		dc.b   0
		dc.b $EB
		dc.b   6
		dc.b  $F
		dc.b $EC
		dc.b   9
		dc.b $EA
		MasakatsuJumpChannel Channel_635D5
		MasakatsuStopChannel

Channel_681A7:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_681AA:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b   7
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $F1
		dc.b   2
		dc.b $EB
		dc.b $20
		dc.b $C1
		dc.b $EC
		dc.b  $F
		dc.b  $F
		dc.b   9
		dc.b $EA
		MasakatsuJumpChannel Channel_635F1
		MasakatsuStopChannel

byte_66F40:
		dc.b $DD
		dc.b  $A
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $12
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel

Channel_62E66:
		dc.b $DB
		dc.b   5
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $1A
		dc.b $E0
		dc.b  $B
		dc.b $DE
		dc.b   5
		dc.b $F4
		dc.b   0
		dc.b $F3
		dc.b   1
		dc.b $D3
		dc.b $67
		dc.b $87
		dc.b $A7
		dc.b $B7
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $E3
		dc.b $10

byte_62E80:
		dc.b $D3
		MasakatsuCallChannel byte_62E8C
		dc.b $EA
		MasakatsuJumpChannel byte_62E80

byte_62E8C:
		dc.b $D8
		dc.b $33
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		MasakatsuCallChannel byte_62F44
		dc.b $33
		dc.b $D9
		dc.b $B3
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		dc.b $EA
		MasakatsuCallChannel byte_62F44
		dc.b $33
		dc.b $D9
		dc.b $93
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		dc.b $EA
		MasakatsuCallChannel byte_62F44
		dc.b $23
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $DF
		dc.b $C0
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $A1
		dc.b $DF
		dc.b $40
		dc.b $81
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $21
		dc.b $DF
		dc.b $C0
		dc.b $D9
		dc.b $33
		dc.b $D9
		dc.b $B3
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		dc.b $EA
		MasakatsuCallChannel byte_62F44
		dc.b $33
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		dc.b $31
		dc.b $A1
		dc.b $81
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $33
		dc.b $D9
		dc.b $93
		dc.b $D8
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $31
		dc.b $EA
		MasakatsuCallChannel byte_62F44
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $31
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $30
		dc.b $50
		dc.b $67
		dc.b $31
		dc.b $D9
		dc.b $93
		dc.b $D8
		dc.b $30
		dc.b $50
		dc.b $67
		dc.b $31
		dc.b $D9
		dc.b $B3
		dc.b $D8
		dc.b $30
		dc.b $50
		dc.b $67
		MasakatsuExtraJumpChannel byte_62F1E
		dc.b $5F
		dc.b $EC

byte_62F1E:
		dc.b $8B
		dc.b $D9
		dc.b $A3
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $55
		dc.b $35
		dc.b $D9
		dc.b $A3
		dc.b $EC
		dc.b $D8
		dc.b $55
		dc.b $39
		dc.b $63
		dc.b $33
		dc.b $13
		dc.b $D9
		dc.b $B3
		dc.b $D8
		dc.b $55
		dc.b $65
		dc.b $33
		dc.b $55
		dc.b $65
		dc.b $33
		dc.b $55
		dc.b $69
		dc.b $A3
		dc.b $83
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $B3
		dc.b $5F
		dc.b $DA
		dc.b $5F
		MasakatsuReturnChannel

byte_62F44:
		dc.b $31
		dc.b $A1
		dc.b $81
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $A1
		MasakatsuReturnChannel

byte_66F8A:
		dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $12
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		MasakatsuReturnChannel

Channel_62F4D:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $10
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b  $D
		dc.b $F4
		dc.b   0
		dc.b $F3
		dc.b   0
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_630BA
		dc.b $E3
		dc.b  $E
		dc.b $AB
		dc.b $DA
		dc.b $E3
		dc.b  $C
		dc.b $A4
		dc.b $DA
		dc.b $E3
		dc.b  $A
		dc.b $A4
		dc.b $DA
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $E3
		dc.b  $C
		dc.b $A5
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1

byte_62F7D:
		dc.b $D3
		dc.b $E5
		dc.b $FD
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $A3
		dc.b $63
		dc.b $A1
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $A3
		dc.b $EA
		MasakatsuCallChannel byte_630D3
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $B3
		dc.b $63
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $B3
		dc.b $EA
		MasakatsuCallChannel byte_630D3
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $93
		dc.b $33
		dc.b $91
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $93
		dc.b $EA
		MasakatsuCallChannel byte_630D3
		dc.b $DF
		dc.b $40
		dc.b $EB
		dc.b   2
		dc.b $31
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $EC
		dc.b $DF
		dc.b $80
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $B1
		dc.b $A1
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $EC
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $B3
		dc.b $63
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $B3
		dc.b $EA
		MasakatsuCallChannel byte_630EB
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $A3
		dc.b $63
		dc.b $A1
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $A3
		dc.b $EA
		MasakatsuCallChannel byte_630EB
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $1A
		dc.b $93
		dc.b $33
		dc.b $91
		dc.b $D8
		dc.b $21
		dc.b $31
		dc.b $D9
		dc.b $93
		dc.b $E0
		dc.b   7
		dc.b $E3
		dc.b $12
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $91
		dc.b $C1
		dc.b $D8
		dc.b $31
		dc.b $61
		dc.b $E3
		dc.b $1C
		dc.b $DF
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $80
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $80
		dc.b $50
		dc.b $DF
		dc.b $40
		dc.b $B0
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $D9
		dc.b $B0
		dc.b $DF
		dc.b $C0
		dc.b $B3
		dc.b $D8
		dc.b $13
		dc.b $33
		dc.b $63
		dc.b $5F
		dc.b $D8
		dc.b $E3
		dc.b $12
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $61
		dc.b $A1
		dc.b $D8
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $91
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $61
		dc.b $91
		dc.b $D8
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $81
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $20
		dc.b $30
		dc.b $DF
		dc.b $40
		dc.b $20
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $60
		dc.b $DF
		dc.b $80
		dc.b $50
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $A0
		dc.b $DF
		dc.b $40
		dc.b $B0
		dc.b $80
		dc.b $DF
		dc.b $C0
		dc.b $60
		dc.b $50
		dc.b $EC
		dc.b $E3
		dc.b $1A
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $40
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $60
		dc.b $D8
		dc.b $EC
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $40
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $90
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $D8
		dc.b $EC
		dc.b $EC
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b $DF
		dc.b $40
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $20
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $D8
		dc.b $EC
		dc.b $EC
		MasakatsuJumpChannel byte_62F7D

byte_630BA:
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $31
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $51
		dc.b $61
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $61
		dc.b $A1
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $81
		dc.b $A0
		dc.b $B0
		dc.b $A1
		dc.b $DA
		MasakatsuReturnChannel

byte_630D3:
		dc.b $E0
		dc.b   7
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $80
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $E3
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b $51
		dc.b $31
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $40
		dc.b $21
		dc.b $31
		dc.b $DF
		dc.b $C0
		MasakatsuReturnChannel

byte_630EB:
		dc.b $E0
		dc.b   7
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $40
		dc.b $31
		dc.b $51
		dc.b $61
		dc.b $DF
		dc.b $C0
		dc.b $91
		dc.b $61
		dc.b $DF
		dc.b $80
		dc.b $51
		dc.b $31
		dc.b $DF
		dc.b $C0
		MasakatsuReturnChannel

byte_66FAA:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel

Channel_630FF:
		dc.b $DB
		dc.b   5
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $17
		dc.b $E0
		dc.b   6
		dc.b $F4
		dc.b   0
		dc.b $F3
		dc.b   0
		dc.b $D3
		dc.b $A7
		dc.b $B7
		dc.b $D8
		dc.b $37
		dc.b $33
		dc.b   3
		dc.b $D9
		dc.b $EB
		dc.b $10
		dc.b $51
		dc.b $EC

byte_63119:
		dc.b $E3
		dc.b $15
		dc.b $D3
		dc.b $EB
		dc.b $10
		dc.b $31
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b $10
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $A1
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $A1
		dc.b $EC
		dc.b $E3
		dc.b $17
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $31
		dc.b $30
		dc.b $31
		dc.b $31
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $B1
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $80
		dc.b $81
		dc.b $80
		dc.b $81
		dc.b $81
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $A1
		dc.b $A0
		dc.b $A1
		dc.b $A1
		dc.b $EC
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $31
		dc.b $30
		dc.b $31
		dc.b $31
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $10
		dc.b $11
		dc.b $10
		dc.b $11
		dc.b $11
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $B1
		dc.b $B1
		dc.b $EC
		dc.b $EA
		MasakatsuExtraJumpChannel byte_6319A
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $B1
		dc.b $B1
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $D8
		dc.b $11
		dc.b $11
		dc.b $EC

byte_6319A:
		dc.b $EB
		dc.b   2
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $B1
		dc.b $B1
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $20
		dc.b $21
		dc.b $20
		dc.b $21
		dc.b $21
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $A1
		dc.b $A0
		dc.b $A1
		dc.b $A1
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_63119

byte_66FC9:
		dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4
		MasakatsuReturnChannel

Channel_631BA:
		dc.b $DB
		dc.b   5
		dc.b $E3
		dc.b $17
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b  $D
		dc.b $F3
		dc.b   0
		dc.b $F4
		dc.b   4
		dc.b $D4
		dc.b $37
		dc.b $57
		dc.b $31
		dc.b $D9
		dc.b $61
		dc.b $D8
		dc.b $31
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $51
		dc.b $20
		dc.b $30
		dc.b $2D
		dc.b $DA
		dc.b $E3
		dc.b $1A
		dc.b $2F

byte_631DE:
		dc.b $E3
		dc.b $17
		dc.b $D4
		dc.b $EB
		dc.b   3
		dc.b $D9
		dc.b   1
		dc.b $D8
		dc.b $33
		dc.b $31
		dc.b $DA
		dc.b $37
		dc.b $DA
		dc.b $3F
		dc.b $EC
		dc.b $3F
		dc.b $2F
		dc.b $EB
		dc.b   3
		dc.b $D9
		dc.b   1
		dc.b $D8
		dc.b $33
		dc.b $31
		dc.b $DA
		dc.b $37
		dc.b $DA
		dc.b $3F
		dc.b $EC
		dc.b  $F
		dc.b  $B
		dc.b $B3
		dc.b $AF
		dc.b $DA
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $61
		dc.b $A1
		dc.b $D8
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $91
		dc.b $61
		dc.b $51
		dc.b $31
		dc.b $61
		dc.b $91
		dc.b $D8
		dc.b $51
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $81
		dc.b $61
		dc.b $51
		dc.b $61
		dc.b $81
		dc.b $DF
		dc.b $80
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $21
		dc.b $DF
		dc.b $C0
		dc.b $31
		dc.b $21
		dc.b $31
		dc.b $DF
		dc.b $40
		dc.b $51
		dc.b $61
		dc.b $DF
		dc.b $C0
		dc.b $EC
		dc.b $3F
		dc.b $6F
		dc.b $BF
		dc.b $63
		dc.b $33
		dc.b $13
		dc.b $D9
		dc.b $B3
		dc.b $D8
		dc.b $3F
		dc.b $6F
		dc.b $BF
		dc.b $A3
		dc.b $83
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $B3
		dc.b $AF
		dc.b $DA
		dc.b $AF
		MasakatsuJumpChannel byte_631DE

byte_67000:
		dc.b $E3
		dc.b $16
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   1
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D2
		MasakatsuReturnChannel

Channel_6324C:
		dc.b $DB
		dc.b   5
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $1A
		dc.b $F4
		dc.b   3
		dc.b $F3
		dc.b   0
		dc.b $E5
		dc.b $FD
		dc.b $E0
		dc.b  $D
		dc.b $D4
		dc.b   0
		dc.b $EA
		MasakatsuCallChannel byte_630BA
		dc.b $AA
		dc.b $E0
		dc.b   3
		dc.b $E3
		dc.b $20
		dc.b $D3
		dc.b $F4
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $DF
		dc.b $40
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $30
		dc.b $50
byte_63284:	dc.b $E0
		dc.b  $D
		dc.b $D3
		dc.b $EB
		dc.b   3
		dc.b   1
		dc.b $A3
		dc.b $A9
		dc.b $DA
		dc.b $AF
		dc.b $EC
		dc.b $AF
		dc.b $AF
		dc.b $EB
		dc.b   3
		dc.b   1
		dc.b $A3
		dc.b $A9
		dc.b $DA
		dc.b $AF
		dc.b $EC
		dc.b  $F
		dc.b $E0
		dc.b   3
		dc.b $DF
		dc.b $80
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $50
		dc.b $DF
		dc.b $C0
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $B0
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $DF
		dc.b $80
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $30
		dc.b $20
		dc.b $D9
		dc.b $C0
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $E4
		dc.b $FE
		dc.b $EB
		dc.b   2
		dc.b   7
		dc.b $DF
		dc.b $80
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $A0
		dc.b $97
		dc.b $DF
		dc.b $80
		dc.b $D8
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $B7
		dc.b $DF
		dc.b $80
		dc.b $80
		dc.b $A0
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $DF
		dc.b $C0
		dc.b $B0
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $DF
		dc.b $40
		dc.b $A0
		dc.b $80
		dc.b $50
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $50
		dc.b $20
		dc.b $D9
		dc.b $A0
		dc.b $D8
		dc.b $EC
		dc.b $E4
		dc.b $FE
		dc.b $D9
		dc.b $35
		dc.b $D9
		dc.b $A5
		dc.b $63
		dc.b $A5
		dc.b $A5
		dc.b $63
		dc.b $A5
		dc.b $B9
		dc.b $DA
		dc.b $BF
		dc.b $E4
		dc.b   1
		dc.b $D8
		dc.b $25
		dc.b $35
		dc.b $D9
		dc.b $A3
		dc.b $A5
		dc.b $D8
		dc.b $35
		dc.b $D9
		dc.b $A3
		dc.b $B5
		dc.b $B9
		dc.b $DA
		dc.b $BF
		dc.b $DA
		dc.b $BF
		dc.b $E4
		dc.b   3
		dc.b $DF
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $20
		dc.b $30
		dc.b $50
		dc.b $EA
		MasakatsuJumpChannel byte_63284

Channel_635D5:
		dc.b $DB
		dc.b   5
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b   8
		dc.b   0
		dc.b $EB
		dc.b   4
		dc.b  $F
		dc.b $EC

byte_635E2:
		dc.b $D4
		MasakatsuCallChannel byte_62E8C
		dc.b $EA
		MasakatsuJumpChannel byte_635E2

Channel_635F1:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   5
		dc.b $F1
		dc.b   5
		dc.b $E3
		dc.b   6
		dc.b $D7
		dc.b $E1
		dc.b $24
		dc.b $EB
		dc.b $18
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $C1
		dc.b $EC
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   7
		dc.b $EB
		dc.b   4
		dc.b $C1
		dc.b $EC
		dc.b $F1
		dc.b   5

byte_6360E:
		dc.b $E3
		dc.b   6
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b $38
		dc.b $C1
		dc.b $EC
		dc.b  $F
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $C1
		dc.b $EC
		dc.b $E3
		dc.b   5
		dc.b $EB
		dc.b $90
		dc.b $C1
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_6360E