; Start
		dc.b 1
		dc.b $FF
		MasakatsuLoadChannel Channel_6807E	; 0
		MasakatsuLoadChannel Channel_680E2	; 1
		MasakatsuLoadChannel Channel_68136	; 2
		MasakatsuLoadChannel Channel_681A4	; 3
		MasakatsuLoadChannel Channel_681FA	; 4
		MasakatsuLoadChannel Channel_68210	; 5
		MasakatsuLoadChannel Channel_68278	; 6
		MasakatsuLoadChannel Channel_68294	; 7
		MasakatsuLoadChannel Channel_682A8	; 8
; ---------------------------------------------------------------------------

Channel_6807E:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
		dc.b $E5
		dc.b $FE
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $28

byte_6808C:
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   4
byte_68092:
		dc.b $D5
		dc.b   0
		dc.b $1F
		dc.b   0
		dc.b $7F
		dc.b   0
		dc.b $BF
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $BF
		dc.b   0
		dc.b $1F
		dc.b   0
		dc.b $7F
		dc.b   0
		dc.b $BF
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $BF
		dc.b   0
		dc.b $B7
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $47
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $47
		dc.b   0
		dc.b $C7
		dc.b   0
		dc.b $BF
		dc.b   0
		dc.b $4F
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $47
		dc.b   0
		dc.b $C7
		dc.b   0
		dc.b $B7
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $B7
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $97
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $3F
		dc.b   0
		MasakatsuJumpChannel2 byte_68092
Channel_680E2:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $17
		dc.b $E5
		dc.b $FE
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $28
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   6
byte_680F4:	dc.b $D3
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b  $F
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b $13
		dc.b   0
		dc.b $11
		dc.b   0
		dc.b   1
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b  $F
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b $43
		dc.b   0
		dc.b $41
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b   2
		dc.b  $F
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b $31
		dc.b   0
		dc.b $33
		dc.b   0
		dc.b $31
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b $EC
		dc.b   0
		MasakatsuJumpChannel2 byte_680F4
Channel_68136:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $1B
		dc.b $E5
		dc.b $FE
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   3
		dc.b $DE
		dc.b $28
		dc.b $DF
		dc.b $C0
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $21
byte_68148:	dc.b $D3
		dc.b   0
		dc.b $8F
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $1F
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $8F
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $1F
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $3F
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $47
		dc.b   0
		dc.b $4F
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $AF
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $A7
		dc.b   0
		dc.b $D8
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $9F
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $9F
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $37
		dc.b   0
		dc.b $D9
		dc.b   0
		dc.b $97
		dc.b   0
		dc.b $DA
		dc.b   0
		dc.b $9F
		dc.b   0
		MasakatsuJumpChannel2 byte_68148
Channel_681A4:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $21
		dc.b $E5
		dc.b $FE
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   3
		dc.b $DE
		dc.b $28
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $21
byte_681B4:	dc.b $D3
		dc.b   0
		dc.b $EB
		dc.b  $A
		MasakatsuCallChannel2 byte_681E0
		dc.b $E4
		dc.b $FC
		MasakatsuCallChannel2 byte_681E0
		dc.b $E4
		dc.b $FC
		MasakatsuCallChannel2 byte_681E0
		dc.b $E4
		dc.b   4
		MasakatsuCallChannel2 byte_681E0
		dc.b $E4
		dc.b   4
		dc.b $EC
		dc.b   0
		MasakatsuJumpChannel2 byte_681B4
byte_681E0:	dc.b $DF
		dc.b $40
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $DF
		dc.b $80
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $DF
		dc.b $C0
		dc.b $30
		dc.b   0
		dc.b $40
		dc.b   0
		dc.b $E9
		dc.b   0

Channel_681FA:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b $23
		dc.b $E5
		dc.b   2
		dc.b   1
		dc.b   0
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $DE
		dc.b $50
		MasakatsuJumpChannel2 byte_6808C
		dc.b $F0
		dc.b   0

Channel_68210:
		dc.b $DB
		dc.b   8
		dc.b $DF
		dc.b $C0
		dc.b $E3
		dc.b $12

byte_68216:
		dc.b $EB
		dc.b   2
		dc.b $EB
		dc.b $30
		dc.b $E0
		dc.b $1D
		dc.b $D3
		dc.b   0
		dc.b $10
		dc.b   0
		dc.b $EC
		dc.b   0
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
		dc.b $E4
		dc.b $FB
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
		dc.b $E4
		dc.b   5
		dc.b $EC
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b  $B
		dc.b   0
		dc.b $EB
		dc.b   3
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b   7
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b   3
		dc.b   0
		dc.b $EC
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $E0
		dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $E0
		dc.b $1C
		dc.b $D4
		dc.b   0
		dc.b $C3
		dc.b   0
		dc.b  $B
		dc.b   0
		MasakatsuJumpChannel2 byte_68216
Channel_68278:	dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2

byte_68280:
		dc.b $D4
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b $EB
		dc.b $50
		MasakatsuCallChannel2 byte_681E0
		dc.b $EC
		dc.b   0
		MasakatsuJumpChannel2 byte_68280

Channel_68294:
		dc.b $DB
		dc.b   8
		dc.b $E3
		dc.b   7
		dc.b $E1
		dc.b   0
		dc.b $F1
		dc.b   2
		dc.b $D4
		dc.b   0
		dc.b   0
		dc.b   0
		MasakatsuJumpChannel2 byte_680F4
		dc.b $F0
		dc.b   0

Channel_682A8:
		dc.b $F1
		dc.b   0
		dc.b $F0
		dc.b   0