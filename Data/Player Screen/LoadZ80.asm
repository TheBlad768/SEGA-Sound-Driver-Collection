; ===========================================================================
; Universal code for loading sound driver
; ===========================================================================

; =============== S U B R O U T I N E =======================================

LoadZ80DrvData:
		stopZ80a
		resetZ80
		waitZ80
		clearZ80RAM
		clearM68KRAM
		movea.l	(a2)+,a0		; Get compressed sound driver
		lea	(Z80_RAM).l,a1
		bsr.w	Kos_Decomp
		cmpa.l	#(Z80_RAM_end),a1
		beq.s	+			; If memory is filled, skip padding
		paddingZ80RAM
+		resetZ80a
		waitZ80time	16
		startZ80
		resetZ80
		move.l	(a2)+,d0		; Get sound driver data(Music bank, etc...)
		beq.s	Load_DrvNameText_Return
		movea.l	d0,a0
		jmp	(a0)