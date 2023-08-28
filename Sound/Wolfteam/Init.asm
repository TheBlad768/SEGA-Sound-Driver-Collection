

	align $8000

MusicWolfteam_Data:		include "Sound/Wolfteam/Data/Music Data.asm"

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message "Wolfteam Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlayWolfteamSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$42).l
		move.b	d0,(Z80_RAM+$43).l
		move.b	#0,(Z80_RAM+$49).l
		startZ80
		enableInts2
		rts
; End of function PlayWolfteamSound
; ---------------------------------------------------------------------------

StopWolfteamSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$43).l
		startZ80
		enableInts2
		rts
; End of function StopWolfteamSound

; =============== S U B R O U T I N E =======================================

Z80WolfteamDriver:		binclude "Sound/Wolfteam/Wolfteam Sound Driver.bin"
	even

	align $8000

   if MOMPASS=1
		message " Wolfteam Sound Driver Samples Data ROM offset is $\{*}"
    endif

SamplesWolfteam_Data:	binclude "Sound/Wolfteam/Samples.bin"
	even