
   if MOMPASS=1
		message "Capcom Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

PlayCapcomSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1300).l
		clr.b	(Z80_RAM+$1303).l
		startZ80
		enableInts2
		rts
; End of function PlayCapcomSound

; =============== S U B R O U T I N E =======================================

StopCapcomSound:
		disableInts2
		stopZ80
		lea	(Z80_RAM+$1300).l,a1
		move.b	d0,(a1)+
		move.b	d0,(a1)+
		clr.b	(a1)+
		clr.b	(a1)
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

	align $8000
   if MOMPASS=1
		message " Capcom Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicCupcom_Data:		include "Sound/Capcom/Data/Music Data.asm"
Z80CapcomDriver:		binclude "Sound/Capcom/Capcom Sound Driver.bin"
	even