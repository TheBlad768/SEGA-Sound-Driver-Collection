
; =============== S U B R O U T I N E =======================================

		align $8000
   if MOMPASS=1
		message "Varie Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicBank_Varie:		binclude "Sound/Varie/Music.bin"
	even

; =============== S U B R O U T I N E =======================================

   if MOMPASS=1
		message " Varie Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

Varie_LoadData:
		waitZ80time $1F00
		stopZ80
		lea	$1F00(a1),a1
		move.b	#1,(a1)+
		move.b	#(MusicBank_Varie>>12),(a1)		; Music Data offset(Only $8000-$F8000)
		startZ80
		waitZ80time $1F00
		rts
; End of function SndZ80VarieDrvInit

; =============== S U B R O U T I N E =======================================

PlaySound_Varie:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1F01).l
		move.b	#3,(Z80_RAM+$1F00).l
		startZ80
		enableInts2
		rts
; End of function PlaySound_Varie

; =============== S U B R O U T I N E =======================================

StopSound_Varie:
		disableInts2
		stopZ80
		move.b	#4,(Z80_RAM+$1F00).l
		startZ80
		enableInts2
		rts
; End of function PlaySound_Varie

; =============== S U B R O U T I N E =======================================

Z80VarieDriver:		binclude "Sound/Varie/Sound Driver.bin"
	even