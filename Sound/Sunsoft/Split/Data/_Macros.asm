; ===========================================================================
; Ancient Music Driver (Macros)
; ===========================================================================

IncludeMusic macro offset
	dc.b offset&$FF,offset>>8&$FF|$80
	endm

	include "Music Data.asm"