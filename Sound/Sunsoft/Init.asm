
		align $8000
   if MOMPASS=1
		message " Sunsoft Sound Driver Music Data ROM offset is $\{*}"
    endif
			binclude "Sound/Sunsoft/Music Data(SKJ).bin"
	even

   if MOMPASS=1
		message "Sunsoft Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

Sunsoft_LoadData:
		stopZ80
		move.b	#MusicData_Sunsoft>>15,(Z80_RAM+$57).l
		startZ80

Sunsoft_LoadData2:
		waitZ80time $1F00
		rts
; End of function Sunsoft_LoadData

; =============== S U B R O U T I N E =======================================

PlaySunsoftSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$1FFC).l
		startZ80
		enableInts2
		rts
; End of function PlaySunsoftSound

; =============== S U B R O U T I N E =======================================

SndZ80SunsoftDriver:		binclude "Sound/Sunsoft/Sunsoft Sound Driver.bin"
	even

		align $8000
   if MOMPASS=1
		message " Sunsoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicData_Sunsoft:		binclude "Sound/Sunsoft/Music Data(MG).bin"
	even