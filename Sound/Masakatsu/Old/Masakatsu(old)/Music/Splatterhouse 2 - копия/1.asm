; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_62323	; 0
		offsetEntry.w Channel_62473	; 1
		offsetEntry.w Channel_6255C	; 2
		offsetEntry.w Channel_62680	; 3
		offsetEntry.w Channel_6276E	; 4
		offsetEntry.w Channel_62826	; 5
		offsetEntry.w Channel_62A2B	; 6
		offsetEntry.w Channel_62AD6	; 7
		offsetEntry.w Channel_62B71	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_62323:
		dc.b $DD, $A
		dc.b $DB, 7
		dc.b $E3, $17
		dc.b $DF, $C0
		dc.b $F4, 7
		dc.b $F3, 1
		dc.b $DE, $2A
		dc.b $E1, 0
		dc.b $E0, $E
		dc.b $D3, $EA
		MasakatsuCallChannel byte_6264D
		dc.b $DB
		dc.b   1
		dc.b   3
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $23
		dc.b $E0
		dc.b   4
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $13
		dc.b $83
		dc.b $73
		dc.b $33
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_623EE
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   3
		dc.b $81
		dc.b $31
		dc.b $21
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		dc.b $83
		dc.b $81
		dc.b $81
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $80
		dc.b $80
		dc.b $30
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $B0
		dc.b $80
		dc.b $80
		dc.b $D8
		dc.b $EC
		dc.b $80
		dc.b $80
		dc.b $40
		dc.b $40
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $D8
		dc.b $83
		dc.b $81
		dc.b $81
		dc.b $EB
		dc.b   2
		dc.b $A0
		dc.b $A0
		dc.b $70
		dc.b $70
		dc.b $30
		dc.b $30
		dc.b $D9
		dc.b $A0
		dc.b $A0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $B0
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $B0
		dc.b $80
		dc.b $40
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $40
		dc.b $10
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $30
		dc.b $D9
		dc.b $A0
		dc.b $70
		dc.b $30
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $71
		dc.b $31
		dc.b $D8
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $D9
		dc.b $A1
		dc.b $61
		dc.b $51
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $61
		dc.b $D9
		dc.b $C1
		dc.b $91
		dc.b $61
		dc.b $D8
		dc.b $EC
		dc.b $D9
		dc.b $E0
		dc.b   4
		dc.b $E3
		dc.b $23
		dc.b $EA
		MasakatsuCallChannel byte_623EE
		dc.b $D8
		dc.b $81
		dc.b $31
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $A1
		dc.b $B1
		dc.b $E4
		dc.b $FF
		dc.b $8F
		dc.b $DA
		dc.b $89
		MasakatsuStopChannel

byte_623EE:
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $70
		dc.b $70
		dc.b $30
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $30
		dc.b $30
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $70
		dc.b $70
		dc.b $30
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $40
		dc.b $40
		dc.b $10
		dc.b $10
		dc.b $EC
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $80
		dc.b $70
		dc.b $70
		dc.b $30
		dc.b $30
		dc.b $D8
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $A0
		dc.b $70
		dc.b $70
		dc.b $30
		dc.b $30
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $30
		dc.b $D9
		dc.b $A0
		dc.b $80
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $70
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $A0
		dc.b $70
		dc.b $40
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $70
		dc.b $40
		dc.b $EC
		dc.b $D8
		dc.b $F4
		dc.b   5
		dc.b $F3
		dc.b   0
		dc.b $E0
		dc.b  $D
		dc.b $E3
		dc.b $1C
		dc.b $BB
		dc.b $D8
		dc.b $33
		dc.b $D9
		dc.b $BF
		dc.b $D8
		dc.b $1B
		dc.b $13
		dc.b $D9
		dc.b $D9
		dc.b $E0
		dc.b  $B
		dc.b $E3
		dc.b $19
		dc.b $EB
		dc.b   2
		dc.b $81
		dc.b $D8
		dc.b $31
		dc.b $21
		dc.b $D9
		dc.b $A1
		dc.b $EC
		MasakatsuReturnChannel

Channel_62473:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1B
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_624C7
		dc.b $E3
		dc.b $1B
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $83
		dc.b $73
		dc.b $33
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_624F9
		dc.b $8F
		dc.b $DA
		dc.b $EA
		MasakatsuCallChannel byte_62522
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		dc.b $1F
		dc.b $DA
		dc.b $3F
		dc.b $E0
		dc.b $10
		dc.b $EA
		MasakatsuCallChannel byte_624F9
		dc.b $EB
		dc.b 3
		dc.b $8F
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $EC
		dc.b $89
		MasakatsuStopChannel

byte_624C7:
		dc.b $47
		dc.b $B7
		dc.b $A7
		dc.b $77
		dc.b $97
		dc.b $87
		dc.b $37
		dc.b $67
		dc.b $4F
		dc.b $DA
		dc.b $4D
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b $E0
		dc.b $10
		dc.b $D9
		dc.b $C2
		dc.b $D8
		dc.b $32
		dc.b $62
		dc.b $92
		dc.b $82
		dc.b $D8
		dc.b $10
		dc.b $DA
		dc.b $11
		dc.b $D9
		dc.b $C2
		dc.b $D8
		dc.b $32
		dc.b $12
		dc.b $D9
		dc.b $82
		dc.b $61
		dc.b $DA
		dc.b $60
		dc.b $82
		dc.b $4B
		dc.b $DA
		dc.b $4F
		dc.b $DA
		dc.b $41
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b   3
		dc.b $E0
		dc.b $10
		MasakatsuReturnChannel

byte_624F9:
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_62522
		dc.b $E0
		dc.b  $D
		dc.b $E3
		dc.b $14
		dc.b  $B
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $37
		dc.b $D9
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $45
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $A5
		dc.b $A0
		dc.b $B0
		dc.b $A3
		dc.b $63
		MasakatsuReturnChannel

byte_62522:
		dc.b $E3
		dc.b $11
		dc.b  $B
		dc.b $D9
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $60
		dc.b $50
		dc.b $4B
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $A0
		dc.b $BB
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $4B
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $75
		dc.b $70
		dc.b $80
		dc.b $A3
		dc.b $B3
		dc.b $E3
		dc.b $12
		dc.b $8F
		dc.b $E3
		dc.b $2A
		dc.b $E0
		dc.b  $B
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		MasakatsuReturnChannel

Channel_6255C:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $F3
		dc.b   2
		dc.b $F4
		dc.b   7
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $D4
		dc.b $E5
		dc.b $FE
		MasakatsuCallChannel byte_6264D
		dc.b $DB
		dc.b   1
		dc.b   3
		dc.b $DB
		dc.b   7
		dc.b $E0
		dc.b  $F
		dc.b $D4
		dc.b $E5
		dc.b   0
		dc.b $E3
		dc.b $1E
		dc.b $EB
		dc.b   2
		dc.b $43
		dc.b $D8
		dc.b $43
		dc.b $D9
		dc.b $A3
		dc.b $73
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $D8
		dc.b $41
		dc.b $D9
		dc.b $A1
		dc.b $71
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_625F7
		dc.b $D9
		dc.b $D9
		dc.b $E0
		dc.b  $D
		dc.b $E3
		dc.b $11
		dc.b  $F
		dc.b   1
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $87
		dc.b   1
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $47
		dc.b   1
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $D8
		dc.b $37
		dc.b   1
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $B7
		dc.b   0
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $17
		dc.b   1
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $A1
		dc.b $81
		dc.b $71
		dc.b $A1
		dc.b $E0
		dc.b  $C
		dc.b $D8
		dc.b $D8
		dc.b $3F
		dc.b $4F
		dc.b $AF
		dc.b $DA
		dc.b $A7
		dc.b $D8
		dc.b $37
		dc.b $7F
		dc.b $DA
		dc.b $7F
		dc.b $D9
		dc.b $4D
		dc.b $40
		dc.b $50
		dc.b $6F
		dc.b $E0
		dc.b  $F
		dc.b $E3
		dc.b $1E
		dc.b $EA
		MasakatsuCallChannel byte_625F7
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $CF
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $CF
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $C9
		MasakatsuStopChannel

byte_625F7:
		dc.b $EB
		dc.b   4
		dc.b $41
		dc.b $41
		dc.b $A1
		dc.b $71
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_62610
		dc.b $AF
		dc.b $A7
		dc.b $D8
		dc.b $37
		dc.b $7F
		dc.b $DA
		dc.b $7F
		dc.b $8F
		dc.b $8F
		dc.b $AF
		dc.b $CF
		MasakatsuReturnChannel

byte_62610:
		dc.b $E3
		dc.b $11
		dc.b   1
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $87
		dc.b   1
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $47
		dc.b   1
		dc.b $81
		dc.b $A1
		dc.b $B1
		dc.b $D8
		dc.b $37
		dc.b   1
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $B7
		dc.b   0
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $17
		dc.b   1
		dc.b $D9
		dc.b $A0
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b   0
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $A1
		dc.b $81
		dc.b $71
		dc.b $A1
		dc.b $E0
		dc.b  $C
		dc.b $DE
		dc.b $4D
		dc.b $F3
		dc.b   1
		dc.b $E3
		dc.b $14
		dc.b $3F
		dc.b $E3
		dc.b $11
		dc.b $4F
		MasakatsuReturnChannel

byte_6264D:
		dc.b $17
		dc.b $87
		dc.b $77
		dc.b $37
		dc.b $67
		dc.b $47
		dc.b $D9
		dc.b $C7
		dc.b $D8
		dc.b $37
		dc.b $1F
		dc.b $DA
		dc.b $1D
		dc.b  $F
		dc.b $D9
		dc.b $C2
		dc.b $D8
		dc.b $32
		dc.b $62
		dc.b $92
		dc.b $82
		dc.b $D8
		dc.b $10
		dc.b $DA
		dc.b $11
		dc.b $D9
		dc.b $C2
		dc.b $D8
		dc.b $32
		dc.b $12
		dc.b $D9
		dc.b $82
		dc.b $61
		dc.b $DA
		dc.b $60
		dc.b $82
		dc.b $4B
		dc.b $DA
		dc.b $4F
		dc.b $DA
		dc.b $41
		dc.b $E0
		dc.b 0
		dc.b $E
		dc.b $DB
		dc.b   1
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b   3
		MasakatsuReturnChannel

Channel_62680:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $20
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $E
		dc.b $D2
		dc.b   0
		dc.b $EA
		MasakatsuCallChannel byte_628EE
		dc.b $E0
		dc.b   1
		dc.b $D2
		dc.b $E3
		dc.b $19
		dc.b $EB
		dc.b   8
		dc.b $10
		dc.b $11
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $10
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $10
		dc.b $EC
		MasakatsuCallChannel byte_626F3
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $81
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $40
		dc.b $41
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $81
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $B0
		dc.b $B1
		dc.b $B0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $10
		dc.b $11
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $30
		dc.b $31
		dc.b $30
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_62748
		dc.b $A3
		dc.b $45
		dc.b $A1
		dc.b $A1
		dc.b $41
		dc.b $C3
		dc.b $65
		dc.b $C1
		dc.b $C1
		dc.b $61
		dc.b $EA
		MasakatsuCallChannel byte_626F3
		dc.b $D9
		dc.b $E4
		dc.b $FF
		dc.b $8F
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $89
		MasakatsuStopChannel

byte_626F3:
		dc.b $D8
		dc.b $EB
		dc.b $10
		dc.b $10
		dc.b $D9
		dc.b $11
		dc.b $D8
		dc.b $10
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $40
		dc.b $41
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $81
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $10
		dc.b $11
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $30
		dc.b $31
		dc.b $30
		dc.b $EC
		dc.b $D9
		dc.b $EA
		MasakatsuCallChannel byte_62748
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $31
		dc.b $B0
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $41
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $A0
		dc.b $61
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $81
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $EB
		dc.b   3
		dc.b $C0
		dc.b $81
		dc.b $D8
		dc.b $20
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $81
		dc.b $80
		dc.b $EC
		MasakatsuReturnChannel

byte_62748:
		dc.b $83
		dc.b $35
		dc.b $81
		dc.b $81
		dc.b $31
		dc.b $B3
		dc.b $45
		dc.b $B1
		dc.b $B1
		dc.b $41
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $75
		dc.b $D8
		dc.b $11
		dc.b $11
		dc.b $D9
		dc.b $71
		dc.b $D8
		dc.b $33
		dc.b $D9
		dc.b $A5
		dc.b $D8
		dc.b $31
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $73
		dc.b $35
		dc.b $71
		dc.b $71
		dc.b $31
		dc.b $EC
		MasakatsuReturnChannel

Channel_6276E:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $27
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $10
		dc.b $D4
		dc.b $E5
		dc.b $FD
		MasakatsuCallChannel byte_624C7
		dc.b   1
		dc.b $E3
		dc.b $23
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $83
		dc.b $73
		dc.b $33
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b   0
		dc.b $EA
		MasakatsuCallChannel byte_627C3
		dc.b $8F
		dc.b $DA
		dc.b $EA
		MasakatsuCallChannel byte_627EC
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		dc.b $1F
		dc.b $DA
		dc.b $3F
		dc.b $E0
		dc.b $10
		dc.b $EA
		MasakatsuCallChannel byte_627C3
		dc.b $EB
		dc.b   3
		dc.b $8F
		dc.b $DA
		dc.b $EC
		dc.b $89
		MasakatsuStopChannel

byte_627C3:
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_627EC
		dc.b $E0
		dc.b  $D
		dc.b $E3
		dc.b $1C
		dc.b  $B
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $37
		dc.b $D9
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $45
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $A5
		dc.b $A0
		dc.b $B0
		dc.b $A3
		dc.b $63
		MasakatsuReturnChannel

byte_627EC:
		dc.b $E3
		dc.b $17
		dc.b  $B
		dc.b $D9
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $60
		dc.b $50
		dc.b $4B
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $A0
		dc.b $BB
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $4B
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $75
		dc.b $70
		dc.b $80
		dc.b $A3
		dc.b $B3
		dc.b $E3
		dc.b $1B
		dc.b $8F
		dc.b $E3
		dc.b $30
		dc.b $E0
		dc.b  $B
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		MasakatsuReturnChannel

Channel_62826:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1A
		dc.b $DF
		dc.b $C0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $E
		dc.b $D2
		dc.b $E5
		dc.b $FD
		MasakatsuCallChannel byte_628EE
		dc.b   0
		dc.b $E5
		dc.b   0
		dc.b $E3
		dc.b  $E
		dc.b $EB
		dc.b   8
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $EC
		dc.b $E3
		dc.b  $D
		dc.b $EB
		dc.b   4
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $EC
		dc.b $E3
		dc.b  $C
		dc.b $EB
		dc.b   8
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_6290F
		dc.b $D4
		dc.b $F4
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $E0
		dc.b  $D
		dc.b  $B
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $60
		dc.b $50
		dc.b $4B
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $A0
		dc.b $BB
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $4B
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $75
		dc.b $70
		dc.b $80
		dc.b $A3
		dc.b $B3
		dc.b $8F
		dc.b $E0
		dc.b  $E
		dc.b $D9
		dc.b $BF
		dc.b $D8
		dc.b $1F
		dc.b $37
		dc.b $77
		dc.b $AF
		dc.b $DA
		dc.b $AF
		dc.b $DA
		dc.b $AD
		dc.b $A0
		dc.b $B0
		dc.b $CF
		dc.b $E3
		dc.b  $F
		dc.b $EA
		MasakatsuCallChannel byte_629FE
		dc.b $EA
		MasakatsuCallChannel byte_6290F
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
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
		dc.b $61
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
		dc.b $C1
		dc.b $EF
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b $C1
		dc.b $E4
		dc.b   2
		dc.b $DA
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b $C1
		MasakatsuStopChannel

byte_628EE:
		dc.b $EB
		dc.b   5
		dc.b $1F
		dc.b $DA
		dc.b $EC
		dc.b $1D
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b $E0
		dc.b  $E
		dc.b $D9
		dc.b $C2
		dc.b $D8
		dc.b $35
		dc.b $12
		dc.b $D9
		dc.b $C3
		dc.b $C1
		dc.b $D8
		dc.b $35
		dc.b $17
		dc.b $DA
		dc.b $1F
		dc.b $DA
		dc.b $1F
		dc.b $DA
		dc.b $11
		dc.b $E0
		dc.b   0
		dc.b  $E
		dc.b   3
		MasakatsuReturnChannel

byte_6290F:
		dc.b $E3
		dc.b  $C
		MasakatsuCallChannel byte_629FE
		dc.b $EB
		dc.b   2
		dc.b $EA
		MasakatsuCallChannel byte_629FE
		dc.b $EA
		MasakatsuCallChannel byte_62A0E
		dc.b $EC
		MasakatsuCallChannel byte_629FE
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b   1
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
		dc.b $A1
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
		dc.b $E4
		dc.b $FE
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
		dc.b   1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
		dc.b $EC
		MasakatsuCallChannel byte_629FE
		dc.b $EA
		MasakatsuCallChannel byte_62A0E
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
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
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E3
		dc.b  $E
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $EC
		dc.b $E3
		dc.b  $C
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
		dc.b $1A
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A2
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
		dc.b $C1
		dc.b $EF
		dc.b   0
		MasakatsuReturnChannel

byte_629FE:
		dc.b $EB
		dc.b   2
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
		dc.b $EC
		MasakatsuReturnChannel

byte_62A0E:
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E4
		dc.b $FE
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C3
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
		dc.b $E4
		dc.b   2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $E4
		dc.b $FE
		MasakatsuReturnChannel

Channel_62A2B:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b  $B
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_624C7
		dc.b $E3
		dc.b   9
		dc.b $F1
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $83
		dc.b $73
		dc.b $33
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		dc.b $EA
		MasakatsuCallChannel byte_62A72
		dc.b $8F
		dc.b $DA
		dc.b $EA
		MasakatsuCallChannel byte_62A98
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		dc.b $1F
		dc.b $3F
		MasakatsuCallChannel byte_62A72
		dc.b $8F
		dc.b $DA
		dc.b $8F
		dc.b $DA
		dc.b $8F
		MasakatsuStopChannel

byte_62A72:
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $71
		dc.b $31
		dc.b $EC
		MasakatsuCallChannel byte_62A98
		dc.b $E4
		dc.b $FC
		dc.b  $B
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $37
		dc.b $D9
		dc.b $A1
		dc.b $B1
		dc.b $83
		dc.b $D8
		dc.b $45
		dc.b $D9
		dc.b $41
		dc.b $61
		dc.b $81
		dc.b $A5
		dc.b $A0
		dc.b $B0
		dc.b $A3
		dc.b $63
		MasakatsuReturnChannel

byte_62A98:
		dc.b $E4
		dc.b $FF
		dc.b $E5
		dc.b $FE
		dc.b  $B
		dc.b $D9
		dc.b $30
		dc.b $50
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $60
		dc.b $50
		dc.b $4B
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $70
		dc.b $8B
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $A0
		dc.b $BB
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $4B
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $75
		dc.b $70
		dc.b $80
		dc.b $A3
		dc.b $B3
		dc.b $F1
		dc.b   0
		dc.b $8F
		dc.b $F1
		dc.b   3
		dc.b $E4
		dc.b   3
		dc.b $E5
		dc.b   0
		dc.b $EB
		dc.b   8
		dc.b $D8
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $81
		dc.b $31
		dc.b $EC
		MasakatsuReturnChannel

Channel_62AD6:
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b  $C
		dc.b $E5
		dc.b $FF
		dc.b $DB
		dc.b   1
		dc.b   3
		dc.b $DB
		dc.b   7
		dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_6264D
		dc.b $E3
		dc.b   7
		dc.b $E5
		dc.b   0
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $83
		dc.b $13
		dc.b $33
		dc.b $D9
		dc.b $A3
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $81
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		MasakatsuCallChannel byte_62B19
		dc.b $EB
		dc.b  $F
		dc.b  $F
		dc.b $EC
		dc.b $D9
		MasakatsuCallChannel byte_62B19
		dc.b $DA
		dc.b $E4
		dc.b $FF
		dc.b $CF
		dc.b $DA
		dc.b $CF
		dc.b $DA
		dc.b $C9
		MasakatsuStopChannel

byte_62B19:
		dc.b $EB
		dc.b  $A
		dc.b $81
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $81
		dc.b $31
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $81
		dc.b $41
		dc.b $11
		dc.b $D9
		dc.b $81
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $A1
		dc.b $71
		dc.b $31
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $80
		dc.b $31
		dc.b $D8
		dc.b $30
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $B0
		dc.b $41
		dc.b $D8
		dc.b $40
		dc.b $D9
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   4
		dc.b $10
		dc.b $D9
		dc.b $71
		dc.b $D8
		dc.b $70
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $30
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $70
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $30
		dc.b $D9
		dc.b $A1
		dc.b $D8
		dc.b $A0
		dc.b $EC
		dc.b $BB
		dc.b $D8
		dc.b $33
		dc.b $D9
		dc.b $BF
		dc.b $D8
		dc.b $1B
		dc.b $13
		dc.b $D9
		dc.b $CF
		MasakatsuReturnChannel

Channel_62B71:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b $24
		dc.b $F1
		dc.b   5
		dc.b $E3
		dc.b   7
		dc.b $D7
		dc.b $EB
		dc.b  $C
		dc.b  $F
		dc.b $EC
		dc.b   3
		dc.b $EB
		dc.b   8
		dc.b $C3
		dc.b $EC
		dc.b $E3
		dc.b   6
		dc.b $EB
		dc.b   8
		dc.b $C3
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $E3
		dc.b   8
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b $50
		dc.b $C1
		dc.b $EC
		dc.b $E3
		dc.b   6
		dc.b $F1
		dc.b   5
		dc.b $EB
		dc.b $10
		dc.b $C1
		dc.b $EC
		dc.b $E3
		dc.b   5
		dc.b $EB
		dc.b   8
		dc.b $C1
		dc.b $EC
		dc.b $E3
		dc.b   7
		dc.b $F1
		dc.b   1
		dc.b $EB
		dc.b $20
		dc.b $C1
		dc.b $EC
		MasakatsuExtraJumpChannel byte_62BBB
		dc.b $EB
		dc.b  $F
		dc.b  $F
		dc.b $EC
		dc.b $E3
		dc.b   8
		dc.b $EB
		dc.b   8
		dc.b $C1
		dc.b $EC
		dc.b $EC

byte_62BBB:
		dc.b $EB
		dc.b   8
		dc.b $C1
		dc.b $EC
		dc.b $E3
		dc.b   7
		dc.b $F1
		dc.b   5
		dc.b $CF
		MasakatsuStopChannel