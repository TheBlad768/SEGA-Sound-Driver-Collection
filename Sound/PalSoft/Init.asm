
	align $8000
   if MOMPASS=1
		message " PalSoft Sound Driver Samples Data ROM offset is $\{*}"
    endif
				binclude "Sound/PalSoft/Samples.bin"

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message "PalSoft Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_PalSoft:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+4).l
		move.b	#1,(Z80_RAM+3).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

StopSound_PalSoft:
		disableInts2
		stopZ80
		move.b	#2,(Z80_RAM+3).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

	align $8000
   if MOMPASS=1
		message " PalSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
SndZ80PalSoftDrv:	binclude "Sound/PalSoft/Z80 Sound Driver.bin"
	even