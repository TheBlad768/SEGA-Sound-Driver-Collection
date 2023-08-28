; ===========================================================================
; Sound Driver M68000 by Masakatsu Maekawa (Macros)
; ===========================================================================

offsetEntry macro ptr
	dc.\0 ptr-*
    endm

; Splatterhouse 2
MasakatsuCallChannel macro offset
	dc.b	$E8
	dc.w offset-*
	endm

; Splatterhouse 3
MasakatsuCallChannel2 macro offset
	dc.b	$E8, 0
	dc.w offset-*
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
	dc.w offset-*
	endm

; Splatterhouse 3
MasakatsuExtraJumpChannel2 macro offset
	dc.b	$ED, 0
	dc.w offset-*
	endm

; Splatterhouse 2
MasakatsuJumpChannel macro offset
	dc.b	$EE
	dc.w offset-*
	endm

; Splatterhouse 3
MasakatsuJumpChannel2 macro offset
	dc.b	$EE, 0
	dc.w offset-*
	endm

; Splatterhouse 2
MasakatsuStopChannel macro
	dc.b	$F0
	endm

; Splatterhouse 3
MasakatsuStopChannel2 macro
	dc.b	$F0, 0
	endm

	include "Splatterhouse 2/A.asm"