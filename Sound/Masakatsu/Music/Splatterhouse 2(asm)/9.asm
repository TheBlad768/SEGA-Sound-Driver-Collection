; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_649C1	; 0
		MasakatsuLoadChannel Channel_64AE4	; 1
		MasakatsuLoadChannel Channel_64B94	; 2
		MasakatsuLoadChannel Channel_64C88	; 3
		MasakatsuLoadChannel Channel_64E0E	; 4
		MasakatsuLoadChannel Channel_64E3C	; 5
		MasakatsuLoadChannel Channel_64F9A	; 6
		MasakatsuLoadChannel Channel_64FAE	; 7
		MasakatsuLoadChannel Channel_64FC6	; 8
; ---------------------------------------------------------------------------

Channel_649C1:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $18
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   2
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   4
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   2
byte_649D3:	dc.b $D4
		dc.b $E3
		dc.b $18
		dc.b $EA
		MasakatsuCallChannel byte_64A5A
		dc.b $E3
		dc.b $20
		dc.b $EB
		dc.b   2
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64A39
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $40
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $EC
byte_64A39:	dc.b $A0
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $90
		dc.b $60
		dc.b $80
		dc.b $40
		dc.b $60
		dc.b $30
		dc.b $40
		dc.b $D9
		dc.b $80
		dc.b $A0
		dc.b $C0
		MasakatsuJumpChannel byte_649D3
byte_64A5A:	dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $D9
		dc.b $83
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $43
		dc.b $63
		dc.b $3F
		dc.b $D9
		dc.b $95
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $13
		dc.b $33
		dc.b $D9
		dc.b $C5
		dc.b $91
		dc.b $87
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $83
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $43
		dc.b $83
		dc.b $6B
		dc.b $11
		dc.b $31
		dc.b $43
		dc.b $13
		dc.b $D9
		dc.b $B3
		dc.b $91
		dc.b $B1
		dc.b $D8
		dc.b $1F
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64AC8
		dc.b 0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $B0
		dc.b $80
		dc.b $90
		dc.b $60
		dc.b $80
		dc.b $40
		dc.b $60
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $90
		dc.b $83
		dc.b $A3
		dc.b $C3
		dc.b $D8
		dc.b $13
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C3
		dc.b $D8
		dc.b $EC
byte_64AC8:	dc.b $13
		dc.b $D8
		dc.b $15
		dc.b $D9
		dc.b $B1
		dc.b $91
		dc.b $81
		dc.b $63
		dc.b $D8
		dc.b $35
		dc.b $D9
		dc.b $C1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $83
		dc.b $D8
		dc.b $45
		dc.b $11
		dc.b $31
		dc.b $41
		dc.b $53
		dc.b $85
		dc.b $51
		dc.b $61
		dc.b $81
		MasakatsuReturnChannel
Channel_64AE4:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   4
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   1

byte_64AEC:
		dc.b $E3
		dc.b $16
		dc.b $EA
		MasakatsuCallChannel byte_64B6A
		dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $61
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $81
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $91
		dc.b $EC
		dc.b $81
		dc.b $81
		dc.b $41
		dc.b $41
		dc.b $EB
		dc.b   4
		dc.b $31
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $81
		dc.b $EC
		MasakatsuCallChannel byte_64B6A
		dc.b $91
		dc.b $93
		dc.b $91
		dc.b $61
		dc.b $63
		dc.b $61
		dc.b $EB
		dc.b   4
		dc.b $31
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $81
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $41
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $11
		dc.b $EC
		dc.b $E3
		dc.b $18
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   4
		dc.b $61
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $B1
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   4
		dc.b $41
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $91
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   4
		dc.b $31
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   4
		dc.b $81
		dc.b $EC
		MasakatsuExtraJumpChannel byte_64B5C
		dc.b $D8
		dc.b $EB
		dc.b   4
		dc.b $11
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $41
		dc.b $EC
		dc.b $EC
byte_64B5C:	dc.b $EB
		dc.b   4
		dc.b $11
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $41
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_64AEC
byte_64B6A:	dc.b $D3
		dc.b $EB
		dc.b   8
		dc.b $11
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   8
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $81
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   8
		dc.b $11
		dc.b $EC
		dc.b $D9
		dc.b $EB
		dc.b   8
		dc.b $B1
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $91
		dc.b $EC
		dc.b $EB
		dc.b   4
		dc.b $81
		dc.b $EC
		dc.b $D8
		dc.b $EB
		dc.b   8
		dc.b $11
		dc.b $EC
		MasakatsuReturnChannel
Channel_64B94:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $20
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   4
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   2
		dc.b $F4
		dc.b   6
byte_64BA2:	dc.b $EB
		dc.b   2
		dc.b $D4
		dc.b $41
		dc.b $13
		dc.b $40
		dc.b $60
		dc.b $83
		dc.b $93
		dc.b $6F
		dc.b $15
		dc.b $10
		dc.b $30
		dc.b $43
		dc.b $63
		dc.b $35
		dc.b $11
		dc.b $D9
		dc.b $C7
		dc.b $D8
		dc.b $41
		dc.b $13
		dc.b $40
		dc.b $60
		dc.b $83
		dc.b $B3
		dc.b $9B
		dc.b $63
		dc.b $83
		dc.b $43
		dc.b $37
		dc.b $4F
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64C03
		dc.b $D8
		dc.b   0
		dc.b $D9
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $B0
		dc.b $80
		dc.b $90
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $C0
		dc.b $C3
		dc.b $D8
		dc.b $13
		dc.b $33
		dc.b $43
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $33
		dc.b $EC
byte_64C03:	dc.b $D9
		dc.b $93
		dc.b $D8
		dc.b $95
		dc.b $81
		dc.b $61
		dc.b $41
		dc.b $33
		dc.b $C5
		dc.b $81
		dc.b $A1
		dc.b $C1
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $85
		dc.b $41
		dc.b $13
		dc.b $D8
		dc.b $13
		dc.b $D9
		dc.b $85
		dc.b $51
		dc.b $13
		dc.b $E3
		dc.b $22
		dc.b $D8
		dc.b $EB
		dc.b   2
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $60
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		MasakatsuExtraJumpChannel byte_64C6E
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $80
		dc.b $70
		dc.b $80
		dc.b $40
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $10
		dc.b $EC
byte_64C6E:	dc.b $33
		dc.b $D9
		dc.b $C3
		dc.b $D8
		dc.b $10
		dc.b $40
		dc.b $30
		dc.b $60
		dc.b $40
		dc.b $10
		dc.b $10
		dc.b $90
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $90
		dc.b $60
		dc.b $80
		dc.b $80
		dc.b $A0
		dc.b $C0
		MasakatsuJumpChannel byte_64BA2
Channel_64C88:	dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   4
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $1E
		dc.b $E0
		dc.b  $B
		dc.b $DE
		dc.b   5
		dc.b $F3
		dc.b   1
byte_64C96:	dc.b $D4
		MasakatsuCallChannel byte_64CA2
		dc.b $EA
		MasakatsuJumpChannel byte_64C96
byte_64CA2:	dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $11
		dc.b $41
		dc.b $31
		dc.b $41
		dc.b $EC
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $31
		dc.b $11
		dc.b $31
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $91
		dc.b $41
		dc.b $11
		dc.b $41
		dc.b $91
		dc.b $D8
		dc.b $11
		dc.b $D9
		dc.b $B1
		dc.b $91
		dc.b $C1
		dc.b $81
		dc.b $31
		dc.b $D9
		dc.b $C1
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $D8
		dc.b $11
		dc.b $41
		dc.b $31
		dc.b $11
		dc.b $11
		dc.b $81
		dc.b $61
		dc.b $41
		dc.b $31
		dc.b $41
		dc.b $31
		dc.b $11
		dc.b $D9
		dc.b $B1
		dc.b $91
		dc.b $81
		dc.b $61
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $41
		dc.b $11
		dc.b $31
		dc.b $D9
		dc.b $B1
		dc.b $D8
		dc.b $11
		dc.b $31
		dc.b $17
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64D4A
		dc.b $EB
		dc.b   2
		dc.b $90
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $B0
		dc.b $60
		dc.b $40
		dc.b $60
		dc.b $EC
		dc.b $80
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $A0
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $C0
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $EB
		dc.b   2
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $40
		dc.b $90
		dc.b $EC
		dc.b $80
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $30
		dc.b $80
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $60
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $10
		dc.b $90
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $10
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $A0
		dc.b $80
		dc.b $60
		dc.b $D8
		dc.b $EC
byte_64D4A:	dc.b 0
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b   0
		dc.b $30
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $90
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $40
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $80
		dc.b $60
		dc.b $50
		dc.b $30
		dc.b $50
		dc.b $30
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $B0
		dc.b $90
		dc.b $80
		dc.b $90
		dc.b $80
		dc.b $60
		dc.b $50
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b $90
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $30
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $80
		dc.b $40
		dc.b $D9
		dc.b $B0
		dc.b $D8
		dc.b $40
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $40
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $10
		dc.b $EC
		dc.b $EA
		MasakatsuExtraJumpChannel byte_64DE8
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $80
		dc.b $C0
		dc.b $D8
		dc.b $EC
		dc.b $40
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $10
		dc.b $80
		dc.b $40
		dc.b $10
		dc.b $40
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $40
		dc.b $80
		dc.b $D8
		dc.b $40
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $D8
		dc.b $10
		dc.b $EC
byte_64DE8:	dc.b $D9
		dc.b $EB
		dc.b   2
		dc.b $60
		dc.b $10
		dc.b $D9
		dc.b $90
		dc.b $D8
		dc.b $10
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $30
		dc.b $D9
		dc.b $C0
		dc.b $80
		dc.b $C0
		dc.b $D8
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $40
		dc.b $80
		dc.b $D8
		dc.b $EC
		dc.b $10
		dc.b $D9
		dc.b $80
		dc.b $90
		dc.b $60
		dc.b $80
		dc.b $80
		dc.b $A0
		dc.b $C0
		MasakatsuReturnChannel
Channel_64E0E:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $20
		dc.b $E5
		dc.b $FD
		dc.b $F4
		dc.b   6
		dc.b $DE
		dc.b $2A
		dc.b $E1
		dc.b   4
		dc.b $DF
		dc.b $C0
		dc.b $E0
		dc.b   2
		dc.b   0
byte_64E1F:	dc.b $D4
		dc.b $EA
		MasakatsuCallChannel byte_64A5A
		dc.b $E3
		dc.b $1D
		dc.b $9E
		dc.b $8F
		dc.b $6F
		dc.b $4F
		dc.b $97
		dc.b $B7
		dc.b $B7
		dc.b $D8
		dc.b $17
		dc.b $D9
		dc.b $97
		dc.b $87
		dc.b $8F
		dc.b   0
		dc.b $EA
		MasakatsuJumpChannel byte_64E1F
Channel_64E3C:	dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $C
		dc.b $DF
		dc.b $C0
byte_64E42:	dc.b $EA
		MasakatsuCallChannel byte_64ED8
		dc.b $EA
		MasakatsuCallChannel byte_64F33
		dc.b $EA
		MasakatsuCallChannel byte_64ED8
		dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_64F63
		dc.b $EC
		MasakatsuCallChannel byte_64F81
		dc.b $E0
		dc.b $18
		dc.b $D1
		dc.b $C1
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
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $EC
		MasakatsuCallChannel byte_64F33
		dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_64F6C
		dc.b $EC
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
		dc.b $19
		dc.b $D2
		dc.b $A0
		dc.b $DB
		dc.b   1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A2
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A3
		dc.b $DB
		dc.b   7
		MasakatsuJumpChannel byte_64E42
byte_64ED8:	dc.b $EB
		dc.b   3
		dc.b $EA
		MasakatsuCallChannel byte_64F63
		dc.b $EC
		MasakatsuCallChannel byte_64F81
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
		dc.b $A0
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b $1B
		dc.b $D3
		dc.b $30
		dc.b $EC
		dc.b $EB
		dc.b   3
		MasakatsuCallChannel byte_64F63
		dc.b $EC
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
		MasakatsuReturnChannel
byte_64F33:	dc.b $EB
		dc.b   3
		MasakatsuCallChannel byte_64F6C
		dc.b $EC
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
		dc.b $D4
		dc.b $EF
		dc.b $1E
		dc.b $A0
		dc.b $EF
		dc.b   0
		dc.b $EC
		MasakatsuReturnChannel

byte_64F63:
		dc.b $EB
		dc.b   2
		MasakatsuCallChannel byte_64F81
		dc.b $EC
		MasakatsuReturnChannel

byte_64F6C:
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
		dc.b $C3
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		dc.b $E0
		dc.b $19
		dc.b $D2
		dc.b $A1
		MasakatsuReturnChannel

byte_64F81:
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

Channel_64F9A:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   4
		dc.b $F1
		dc.b   2
		dc.b $E4
		dc.b   7

byte_64FA2:
		dc.b $D5
		MasakatsuCallChannel byte_64CA2
		dc.b $EA
		MasakatsuJumpChannel byte_64FA2

Channel_64FAE:
		dc.b $DB
		dc.b   7
		dc.b $E1
		dc.b   4
		dc.b $F1
		dc.b   2
		dc.b $E4
		dc.b   7
		dc.b $E5
		dc.b $FF
		dc.b   1

byte_64FB9:
		dc.b $D5
		dc.b $EA
		MasakatsuCallChannel byte_64CA2
		dc.b $EA
		MasakatsuJumpChannel byte_64FB9

Channel_64FC6:
		dc.b $F2
		dc.b   2
		dc.b $DB
		dc.b   7
		dc.b $F1
		dc.b   1
		dc.b $E3
		dc.b   7
		dc.b $D7
		dc.b $E1
		dc.b $24

byte_64FD1:
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b $40
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC
		dc.b $EC
		dc.b $EB
		dc.b $10
		dc.b $C1
		dc.b $C0
		dc.b $C0
		dc.b $EC
		dc.b $EB
		dc.b $40
		dc.b $C0
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel byte_64FD1