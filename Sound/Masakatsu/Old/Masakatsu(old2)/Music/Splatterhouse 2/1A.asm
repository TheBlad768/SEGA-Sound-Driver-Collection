; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_67DB5	; 0
		dc.l Channel_67E36	; 1
		dc.l Channel_67EA7	; 2
		dc.l Channel_67F29	; 3
		dc.l Channel_67F3F	; 4
		dc.l Channel_67FB1	; 5
		dc.l Channel_68197	; 6
		dc.l Channel_681A7	; 7
		dc.l Channel_681AA	; 8
		dc.b 0
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