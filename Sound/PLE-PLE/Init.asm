; ---------------------------------------------------------------------------
; PLE-PLE Sound Driver?
; ---------------------------------------------------------------------------

	align $8000
   if MOMPASS=1
		message " PLE-PLE Sound Driver Music Data ROM offset is $\{*}"
    endif

		binclude "Sound/PLE-PLE/Music.bin"
	even

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message "PLE-PLE Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_Musha:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$19).l
		startZ80
		enableInts2
		rts
; End of function PlaySound_Musha

; =============== S U B R O U T I N E =======================================

SndZ80PLEPLEDriver:		binclude "Sound/PLE-PLE/PLE-PLE Sound Driver.bin"
	even