; ===========================================================================
; Data East (Macros).
; Original macro written by Valley Bell.
; Macro AS version by Vladikcomper.
; ===========================================================================

DACEntA macro	Location, Size, Bank, Pitch
	dc.b	((Location&$0000FF)>>0)		; Start Offset LSB
	dc.b	((Location&$00FF00)>>8)		; Start Offset MSB
	dc.b	((Size&$0000FF)>>0)			; Length LSB
	dc.b	((Size&$00FF00)>>8)			; Length MSB
	dc.b	((Bank&$008000)>>15)		; Bank LSB
	dc.b	((Bank&$FF0000)>>16)		; Bank MSB
	dc.b	Pitch
	dc.b	$00
    endm

DACEntry macro	Location, Pitch
	dc.b	((Location&$0000FF)>>0)					; Start Offset LSB
	dc.b	((Location&$007F00)>>8)|$80				; Start Offset MSB
	dc.b	(((Location_End-Location)&$0000FF)>>0)	; Length LSB
	dc.b	(((Location_End-Location)&$007F00)>>8)	; Length MSB
	dc.b	((Location&$008000)>>15)				; Bank LSB
	dc.b	((Location&$FF0000)>>16)				; Bank MSB
	dc.b	Pitch
	dc.b	$00
    endm

incpcm macro	LblName, File 
LblName:	label	*
		binclude	File
LblName_End:	label	*
		if (LblName&$FF8000)<>((LblName_End-1)&$FF8000)
			error "Sample 'LblName' crosses $8000-byte boundary. Please add align $8000 before DACEnry LblName, File"
	    endif
	endm

FadeData macro	FMVol, DACVol
	dc.b	FMVol, DACVol
    endm

SFX_Data macro ChnID, SfxID, DACVol
	dc.b	ChnID, SfxID, DACVol, $00
    endm