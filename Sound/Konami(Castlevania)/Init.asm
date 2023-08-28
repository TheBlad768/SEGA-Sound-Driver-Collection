
; =============== S U B R O U T I N E =======================================

    if MOMPASS=1
		message "Konami(Castlevania) Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

Z80KonamiDriver:		binclude "Sound/Konami(Castlevania)/Z80 Sound Driver(Castlevania).bin"
	even

; =============== S U B R O U T I N E =======================================

PlayKonamiSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1E18).l
		startZ80
		enableInts2
		rts
; End of function PlayKonamiSound

; =============== S U B R O U T I N E =======================================

	align $8000
    if MOMPASS=1
		message " Konami(Castlevania) Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicKonami_Data:		binclude "Sound/Konami(Castlevania)/Music Data.bin"
	even
	align $8000
    if MOMPASS=1
		message " Konami(Castlevania) Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicKonami_Data2:		binclude "Sound/Konami(Castlevania)/Music Data2.bin"
	even