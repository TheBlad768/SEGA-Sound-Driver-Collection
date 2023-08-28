
; =============== S U B R O U T I N E =======================================

			align $8000
   if MOMPASS=1
		message "Konami TTA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonTTAMusicData:	binclude "Sound/Konami(TTA)/Music Data.bin"
	even

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message " Konami TTA Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_Kon:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1A00).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Snd_KonTTAZ80Driver:	binclude "Sound/Konami(TTA)/Z80 Sound Driver(TTA).bin"
	even