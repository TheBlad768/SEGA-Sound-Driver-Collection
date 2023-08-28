; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_682FD	; 0
		dc.l Channel_68328	; 1
		dc.l Channel_68348	; 2
		dc.l Channel_68366	; 3
		dc.l Channel_68384	; 4
		dc.l Channel_683B0	; 5
		dc.l Channel_683BD	; 6
		dc.l Channel_683C0	; 7
		dc.l Channel_683C3	; 8
		dc.b 0
; ---------------------------------------------------------------------------

Channel_682FD:
		dc.b $DD, $A
		dc.b $DB, 7
		dc.b $E3, $1D
		dc.b $DF, $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4

ChannelJump_68310:
		dc.b $EB
		dc.b $10
		dc.b $10
		dc.b $30
		dc.b $40
		dc.b $80
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $50
		dc.b $80
		dc.b $A0
		dc.b $70
		dc.b $80
		dc.b $50
		dc.b $70
		dc.b $30
		dc.b $EC
		dc.b $EA
		MasakatsuJumpChannel ChannelJump_68310

Channel_68328:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b  $E

ChannelCall_6832C:
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $B
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4

ChannelJump_68339:
		dc.b $1F
		dc.b $D9
		dc.b $CF
		dc.b $BF
		dc.b $AF
		dc.b $D8
		dc.b $5F
		dc.b $4F
		dc.b $3F
		dc.b $2F
		MasakatsuJumpChannel ChannelJump_68339

Channel_68348:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3

ChannelJump_68359:
		dc.b $8F
		dc.b $8F
		dc.b $8F
		dc.b $8F
		dc.b $CF
		dc.b $CF
		dc.b $CF
		dc.b $CF
		MasakatsuJumpChannel ChannelJump_68359

Channel_68366:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1D
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $A
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D3

ChannelJump_68377:
		dc.b $4F
		dc.b $4F
		dc.b $4F
		dc.b $4F
		dc.b $8F
		dc.b $8F
		dc.b $8F
		dc.b $8F
		MasakatsuJumpChannel ChannelJump_68377

Channel_68384:
		dc.b $DB
		dc.b   7
		dc.b $E3
		dc.b $1E
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $23
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   5
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D4

ChannelJump_68395:
		dc.b $EB
		dc.b $10
		dc.b $40
		dc.b $60
		dc.b $80
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $EC
		dc.b $EB
		dc.b   8
		dc.b $80
		dc.b $C0
		dc.b $D8
		dc.b $10
		dc.b $D9
		dc.b $A0
		dc.b $C0
		dc.b $80
		dc.b $A0
		dc.b $70
		dc.b $EC
		MasakatsuJumpChannel ChannelJump_68395

Channel_683B0:
		dc.b $DB, 7
		dc.b $E3, $1D
		dc.b $E5
		dc.b $FD
		dc.b   3
		MasakatsuCallChannel ChannelCall_6832C
		MasakatsuStopChannel

Channel_683BD:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_683C0:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_683C3:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel