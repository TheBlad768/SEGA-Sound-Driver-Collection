; ===========================================================================
; Samples Bank
; ===========================================================================

SamplesIndex:
		IncludeSample Samples_01		; 1
		IncludeSample Samples_02		; 2
; ---------------------------------------------------------------------------

Samples_01:		incbin "Samples/1(Kick).bin"
Samples_01_End
Samples_02:		incbin "Samples/2(Snare).bin"
Samples_02_End
	even