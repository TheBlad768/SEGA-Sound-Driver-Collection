; ===========================================================================
; Sound Driver M68000 by Masakatsu Maekawa (Macros)
; ===========================================================================

; Splatterhouse 2
MasakatsuCallChannel macro offset
	dc.b	$E8
	dc.l offset
	endm

; Splatterhouse 2
MasakatsuReturnChannel macro
	dc.b	$E9
	endm

; Splatterhouse 2
MasakatsuJumpChannel macro offset
	dc.b	$EE
	dc.l offset
	endm

; Splatterhouse 2
MasakatsuStopChannel macro
	dc.b	$F0
	endm