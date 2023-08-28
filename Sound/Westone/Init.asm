
	align $8000
   if MOMPASS=1
		message "Westone Sound Driver Music Data ROM offset is $\{*}"
    endif
Z80WestoneMWDriver:	binclude "Sound/Westone/Z80 Westone Driver(MW).bin"
	even

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message " Westone Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_Westone:
		move.w	d0,d2
		moveq	#-1,d0	; Stop sound
		bsr.s	PlaySound2_Westone
		move.w	d2,d0

PlaySound2_Westone:
		disableInts2
		stopZ80
		lea	(Z80_RAM+$1C2E).l,a0
		move.b	(a0)+,d1
		add.b	(a0),d1
		addq.b	#1,(a0)+
		andi.w	#$F,d1
		move.b	d0,(a0,d1.w)
		startZ80
		enableInts2
		rts
; End of function PlaySound_Westone

; =============== S U B R O U T I N E =======================================

	align $8000
   if MOMPASS=1
		message "Westone Sound Driver Music Data ROM offset is $\{*}"
    endif
Z80WestoneMBDriver:		binclude "Sound/Westone/Z80 Westone Driver(MB).bin"
	even