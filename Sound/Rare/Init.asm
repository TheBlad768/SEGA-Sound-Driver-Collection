
; =============== S U B R O U T I N E =======================================

		align $8000
    if MOMPASS=1
		message " RARE Sound Driver Music Data ROM offset is $\{*}"
    endif
Z80Rare_Music:		binclude "Sound/Rare/Music(Bank).bin"
	even

; =============== S U B R O U T I N E =======================================

    if MOMPASS=1
		message "RARE Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_Rare:
		disableInts2
		stopZ80
		move.b   d0,(Z80_RAM+$9BD).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Z80Rare_Driver:		binclude "Sound/Rare/Z80 Rare Driver.bin"
	even