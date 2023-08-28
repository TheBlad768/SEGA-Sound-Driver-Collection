; Start
		dc.b 1
		dc.b $FF
		dc.l Channel_681C3	; 0
		dc.l Channel_681CF	; 1
		dc.l Channel_681DB	; 2
		dc.l Channel_681E7	; 3
		dc.l Channel_681F3	; 4
		dc.l Channel_681FF	; 5
		dc.l Channel_6820B	; 6
		dc.l Channel_68211	; 7
		dc.l Channel_68217	; 8
		dc.b 0
; ---------------------------------------------------------------------------

Channel_681C3:
		MasakatsuCallChannel byte_63C96
		dc.b $EA
		MasakatsuJumpChannel byte_63BDA
		MasakatsuStopChannel

Channel_681CF:
		MasakatsuCallChannel byte_63D22
		dc.b $EA
		MasakatsuJumpChannel byte_63CE2
		MasakatsuStopChannel

Channel_681DB:
		MasakatsuCallChannel byte_63E7E
		dc.b $EA
		MasakatsuJumpChannel byte_63E21
		MasakatsuStopChannel

Channel_681E7:
		MasakatsuCallChannel byte_63F42
		dc.b $EA
		MasakatsuJumpChannel byte_63EB4
		MasakatsuStopChannel

Channel_681F3:
		MasakatsuCallChannel byte_63FF4
		dc.b $EA
		MasakatsuJumpChannel byte_63FA0
		MasakatsuStopChannel

Channel_681FF:
		MasakatsuCallChannel byte_64118
		dc.b $EA
		MasakatsuJumpChannel byte_64012
		MasakatsuStopChannel

Channel_6820B:
		MasakatsuJumpChannel byte_64185
		MasakatsuStopChannel

Channel_68211:
		MasakatsuJumpChannel byte_641AC
		MasakatsuStopChannel

Channel_68217:
		MasakatsuJumpChannel byte_641D6
		MasakatsuStopChannel