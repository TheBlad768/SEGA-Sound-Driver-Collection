; Start
		dc.b 1
		dc.b $FF
		offsetEntry.w Channel_66D36	; 0
		offsetEntry.w Channel_66D5C	; 1
		offsetEntry.w Channel_66D75	; 2
		offsetEntry.w Channel_66D92	; 3
		offsetEntry.w Channel_66DCA	; 4
		offsetEntry.w Channel_66DEC	; 5
		offsetEntry.w Channel_66E09	; 6
		offsetEntry.w Channel_66E0C	; 7
		offsetEntry.w Channel_66E0F	; 8
;		dc.b 0
; ---------------------------------------------------------------------------

Channel_66D36:
		dc.b $DD
		dc.b  $A
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $12
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $14
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D5
		MasakatsuCallChannel byte_66D54
		dc.b $DA
		dc.b $81
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

byte_66D54:
		dc.b $C7
		dc.b $B7
		dc.b $77
		dc.b $A7
		dc.b $8F
		dc.b $DA
		dc.b $8D
		MasakatsuReturnChannel

Channel_66D5C:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $20
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $E
		dc.b $F4
		dc.b   7
		dc.b $D5
		dc.b $87
		dc.b $77
		dc.b $D9
		dc.b $C7
		dc.b $D8
		dc.b $47
		dc.b $5F
		dc.b $DA
		dc.b $5F
		MasakatsuStopChannel

Channel_66D75:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $19
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $24
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b $14
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $E5
		dc.b $FD
		dc.b   1
		MasakatsuCallChannel byte_66D54
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66D92:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $22
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   9
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   1
		dc.b $D4
		dc.b $EB
		dc.b   2
		dc.b $51
		dc.b $81
		dc.b $A1
		dc.b $C1
		dc.b $EC
		dc.b $EB
		dc.b   2
		dc.b $41
		dc.b $81
		dc.b $A1
		dc.b $C1
		dc.b $EC
		dc.b $E4
		dc.b $FB
		dc.b   7
		dc.b $D8
		dc.b $DF
		dc.b $40
		dc.b $C0
		dc.b $B0
		dc.b $A0
		dc.b $DF
		dc.b $C0
		dc.b $90
		dc.b $80
		dc.b $70
		dc.b $DF
		dc.b $80
		dc.b $60
		dc.b $50
		dc.b $E4
		dc.b   4
		dc.b $5E
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66DCA:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $1B
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $18
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b   6
		dc.b $F4
		dc.b   7
		dc.b $F3
		dc.b   2
		dc.b $D2
		dc.b $51
		dc.b $55
		dc.b $51
		dc.b $55
		dc.b $41
		dc.b $45
		dc.b $41
		dc.b $45
		dc.b $51
		dc.b $55
		dc.b $51
		dc.b $55
		dc.b $5F
		dc.b $E0
		dc.b   0
		dc.b   0
		MasakatsuStopChannel

Channel_66DEC:
		dc.b $DB
		dc.b   6
		dc.b $E3
		dc.b $17
		dc.b $DF
		dc.b $C0
		dc.b $DE
		dc.b $1E
		dc.b $E1
		dc.b   0
		dc.b $E0
		dc.b  $C
		dc.b $F4
		dc.b   6
		dc.b $F3
		dc.b   1
		dc.b $D5
		dc.b $57
		dc.b $57
		dc.b $47
		dc.b $77
		dc.b $E0
		dc.b $14
		dc.b $E3
		dc.b $1B
		dc.b $CF
		dc.b $DA
		dc.b $CE
		MasakatsuStopChannel

Channel_66E09:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_66E0C:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel

Channel_66E0F:
		dc.b $F1
		dc.b   0
		MasakatsuStopChannel