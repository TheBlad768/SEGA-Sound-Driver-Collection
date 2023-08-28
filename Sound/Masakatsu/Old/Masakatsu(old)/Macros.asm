; ===========================================================================
; Sound Driver M68000 by Masakatsu Maekawa (Macros)
; ===========================================================================

; Splatterhouse 2
MasakatsuCallChannel macro offset
	dc.b	$E8
	offsetEntry.w offset
	endm

; Splatterhouse 3
MasakatsuCallChannel2 macro offset
	dc.b	$E8, 0
	offsetEntry.w offset
	endm

; Splatterhouse 2
MasakatsuReturnChannel macro
	dc.b	$E9
	endm

; Splatterhouse 3
MasakatsuReturnChannel2 macro
	dc.b	$E9, 0
	endm

; Splatterhouse 2
MasakatsuExtraJumpChannel macro offset
	dc.b	$ED
	offsetEntry.w offset
	endm

; Splatterhouse 3
MasakatsuExtraJumpChannel2 macro offset
	dc.b	$ED, 0
	offsetEntry.w offset
	endm

; Splatterhouse 2
MasakatsuJumpChannel macro offset
	dc.b	$EE
	offsetEntry.w offset
	endm

; Splatterhouse 3
MasakatsuJumpChannel2 macro offset
	dc.b	$EE, 0
	offsetEntry.w offset
	endm

; Splatterhouse 2
MasakatsuStopChannel macro
	dc.b	$F0
	endm

; Splatterhouse 3
MasakatsuStopChannel2 macro
	dc.b	$F0, 0
	endm