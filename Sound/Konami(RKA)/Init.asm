
; =============== S U B R O U T I N E =======================================

				align $8000
   if MOMPASS=1
		message "Konami RKA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonRKAMusicData:		binclude "Sound/Konami(RKA)/Data/Data RKA(0xD0000).bin"
	even
				align $8000
   if MOMPASS=1
		message "Konami RKA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonRKAMusicData2:		binclude "Sound/Konami(RKA)/Data/Data RKA(0xD8000).bin"
	even
				align $8000
   if MOMPASS=1
		message "Konami RKA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonRKAMusicData3:		binclude "Sound/Konami(RKA)/Data/Data RKA(0xE0000).bin"
	even
				align $8000
   if MOMPASS=1
		message "Konami RKA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonRKAMusicData4:		binclude "Sound/Konami(RKA)/Data/Data RKA(0xE8000).bin"
	even
				align $8000
   if MOMPASS=1
		message "Konami RKA Sound Driver Music Data ROM offset is $\{*}"
    endif
Snd_KonRKAMusicData5:		binclude "Sound/Konami(RKA)/Data/Data RKA(0xF0000).bin"
	even

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message " Konami RKA Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_Kon2:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1B00).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Snd_KonRKAZ80Driver:		binclude "Sound/Konami(RKA)/Z80 Sound Driver(RKA).bin"
	even