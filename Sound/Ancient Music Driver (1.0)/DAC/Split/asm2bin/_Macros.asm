; ===========================================================================
; Ancient Music Driver (Macros)
; ===========================================================================

IncludeSample macro offset
	dc.b offset&$FF,offset>>8&$FF|$80		; Offset
	dc.b ((\offset\_End)-(\offset))&$FF,((\offset\_End)-(\offset))>>8&$FF	; Size
	endm

	include "Samples Bank.asm"