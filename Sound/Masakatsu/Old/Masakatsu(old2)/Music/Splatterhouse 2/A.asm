; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_64FEE	; 0
		dc.l Channel_65032	; 1
		dc.l Channel_65098	; 2
		dc.l Channel_650E4	; 3
		dc.l Channel_65140	; 4
		dc.l Channel_65159	; 5
		dc.l Channel_6515C	; 6
		dc.l Channel_65170	; 7
		dc.l Channel_65181	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_64FEE:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1A
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   4

byte_64FFE:
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $13
		dc.b $23
		dc.b $11
		dc.b $11
		dc.b $23
		dc.b $13
		dc.b $33
		dc.b $11
		dc.b $11
		dc.b $43
		dc.b $13
		dc.b $53
		dc.b $11
		dc.b $11
		dc.b $63
		dc.b $13
		dc.b $ED
		dc.l byte_65020
		dc.b $73
		dc.b $63
		dc.b $51
		dc.b $41
		dc.b $33
		dc.b $4B
		dc.b $DA
		dc.b $4F
		dc.b $D8
		dc.b $EC
byte_65020:	dc.b $75
		dc.b $61
		dc.b $51
		dc.b $41
		dc.b $33
		dc.b $95
		dc.b $81
		dc.b $71
		dc.b $61
		dc.b $53
		dc.b $6B
		dc.b $DA
		dc.b $6F
		MasakatsuJumpChannel byte_64FFE
Channel_65032:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $17
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   1
byte_65040:	dc.b $D3
		dc.b $EB
		dc.b   6
		MasakatsuCallChannel byte_6508E
		dc.b $EC
		dc.b $EB
		dc.b   4
		MasakatsuCallChannel byte_65093
		dc.b $EC
		dc.b $41
		dc.b $11
		dc.b $D9
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $C1
		dc.b $91
		dc.b $C1
		dc.b $EB
		dc.b   4
		dc.b $EA
		MasakatsuCallChannel byte_6508E
		dc.b $EC
		dc.b $EB
		dc.b   4
		MasakatsuCallChannel byte_65093
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $31
		dc.b $61
		dc.b $91
		dc.b $61
		dc.b $EC
		dc.b $61
		dc.b $91
		dc.b $31
		dc.b $61
		dc.b $11
		dc.b $61
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $61
		dc.b $31
		dc.b $61
		dc.b $21
		dc.b $61
		dc.b $11
		dc.b $61
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $61
		dc.b $EA
		MasakatsuJumpChannel byte_65040
byte_6508E:	dc.b $11
		dc.b $51
		dc.b $91
		dc.b $51
		MasakatsuReturnChannel
byte_65093:	dc.b $51
		dc.b $11
		dc.b $91
		dc.b $51
		MasakatsuReturnChannel
Channel_65098:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $19
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   5
byte_650A6:	dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $83
		dc.b $93
		dc.b $81
		dc.b $81
		dc.b $93
		dc.b $83
		dc.b $A3
		dc.b $81
		dc.b $81
		dc.b $B3
		dc.b $83
		dc.b $C3
		dc.b $81
		dc.b $81
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $83
		dc.b $D8
		dc.b $EA
		dc.b $ED
		dc.l byte_650CD
		dc.b $23
		dc.b $13
		dc.b $D9
		dc.b $C1
		dc.b $B1
		dc.b $A3
		dc.b $BB
		dc.b $DA
		dc.b $BF
		dc.b $D8
		dc.b $EC
byte_650CD:	dc.b $25
		dc.b $11
		dc.b $D9
		dc.b $C1
		dc.b $B1
		dc.b $A3
		dc.b $D8
		dc.b $45
		dc.b $31
		dc.b $21
		dc.b $11
		dc.b $D9
		dc.b $C3
		dc.b $D8
		dc.b $1B
		dc.b $DA
		dc.b $1F
		dc.b $EA
		MasakatsuJumpChannel byte_650A6
Channel_650E4:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $17
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
byte_650F2:	dc.b $D4
		MasakatsuCallChannel byte_650FE
		dc.b $EA
		MasakatsuJumpChannel byte_650F2
byte_650FE:	dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_65127
		dc.b $EC
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_65127
		dc.b $EC
		dc.b  $B
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $40
		dc.b $40
		dc.b  $B
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b $DF
		dc.b $C0
		dc.b $50
		dc.b $40
		dc.b $DF
		dc.b $40
		dc.b $50
		dc.b  $F
		MasakatsuReturnChannel
byte_65127:	dc.b $B
		dc.b $DF
		dc.b $80
		dc.b $10
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $40
		dc.b $40
		dc.b  $B
		dc.b $D9
		dc.b $DF
		dc.b $80
		dc.b $C0
		dc.b $D8
		dc.b $DF
		dc.b $C0
		dc.b $40
		dc.b $30
		dc.b $DF
		dc.b $40
		dc.b $40
		MasakatsuReturnChannel
Channel_65140:	dc.b $E3
		dc.b $1F
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $E5
		dc.b $FD
		dc.b $E0
		dc.b   5
		dc.b $DB
		dc.b   1
		dc.b   2
		dc.b $DB
		dc.b   7
		MasakatsuJumpChannel byte_64FFE
		MasakatsuStopChannel
Channel_65159:	dc.b $E0
		dc.b   0
		MasakatsuStopChannel
Channel_6515C:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   3
		dc.b $E3
		dc.b   8
byte_65164:	dc.b $D6
		MasakatsuCallChannel byte_650FE
		dc.b $EA
		MasakatsuJumpChannel byte_65164
Channel_65170:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $E3
		dc.b   9
		dc.b $E5
		dc.b $FF
		dc.b   2
		MasakatsuJumpChannel byte_65164
		MasakatsuStopChannel

Channel_65181:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   6
		dc.b $D7
		dc.b $E1
		dc.b $24

byte_6518C:
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $C3
		dc.b $F1
		dc.b   2
		dc.b $C5
		dc.b $F1
		dc.b   1
		dc.b $C1
		dc.b $C3
		dc.b $C3
		dc.b $F1
		dc.b   2
		dc.b $C5
		dc.b $F1
		dc.b   1
		dc.b $C1
		dc.b $C1
		dc.b $C1
		dc.b $EC
		dc.b $C3
		dc.b $F1
		dc.b   2
		dc.b $C3
		dc.b $F1
		dc.b   1
		dc.b $C1
		dc.b $C1
		dc.b $F1
		dc.b   2
		dc.b $C1
		dc.b $C1
		dc.b $EA
		dc.b $ED
		dc.l byte_651BC
		dc.b $F1
		dc.b   1
		dc.b $C3
		dc.b $EB
		dc.b  $C
		dc.b $C0
		dc.b $EC
		dc.b $EC

byte_651BC:
		dc.b $C3
		dc.b $F1
		dc.b   2
		dc.b $C3
		dc.b $F1
		dc.b   1
		dc.b $C1
		dc.b $C1
		dc.b $F1
		dc.b   2
		dc.b $C1
		dc.b $C1
		dc.b $F1
		dc.b   1
		dc.b $C3
		dc.b $EB
		dc.b  $C
		dc.b $C0
		dc.b $EC
		MasakatsuJumpChannel byte_6518C