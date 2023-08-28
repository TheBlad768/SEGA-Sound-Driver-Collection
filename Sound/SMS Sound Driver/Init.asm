
; =============== S U B R O U T I N E =======================================

		align $8000

Z80SMS_MusicData:
   if MOMPASS=1
		message "SMS Sound Driver Music Data ROM offset is $\{*}"
    endif
Z80SMS_Music0:		binclude "Sound/SMS Sound Driver/Music/Stop.bin"
	even
Z80SMS_Music1:		binclude "Sound/SMS Sound Driver/Music/GHZ.bin"
	even
Z80SMS_Music2:		binclude "Sound/SMS Sound Driver/Music/BZ.bin"
	even
Z80SMS_Music3:		binclude "Sound/SMS Sound Driver/Music/JZ.bin"
	even
Z80SMS_Music4:		binclude "Sound/SMS Sound Driver/Music/MZ.bin"
	even
Z80SMS_Music5:		binclude "Sound/SMS Sound Driver/Music/LZ.bin"
	even
Z80SMS_Music6:		binclude "Sound/SMS Sound Driver/Music/SBZ.bin"
	even
Z80SMS_Music7:		binclude "Sound/SMS Sound Driver/Music/SkyBZ.bin"
	even
Z80SMS_Music8:		binclude "Sound/SMS Sound Driver/Music/Bonus.bin"
	even
Z80SMS_Music9:		binclude "Sound/SMS Sound Driver/Music/Ending.bin"
	even
Z80SMS_MusicA:		binclude "Sound/SMS Sound Driver/Music/Boss.bin"
	even
Z80SMS_MusicB:		binclude "Sound/SMS Sound Driver/Music/Title.bin"
	even
Z80SMS_MusicC:		binclude "Sound/SMS Sound Driver/Music/Map.bin"
	even
Z80SMS_MusicD:		binclude "Sound/SMS Sound Driver/Music/Invinc.bin"
	even
Z80SMS_MusicE:		binclude "Sound/SMS Sound Driver/Music/ActClear.bin"
	even
Z80SMS_MusicF:		binclude "Sound/SMS Sound Driver/Music/Death.bin"
	even
Z80SMS_Music10:	binclude "Sound/SMS Sound Driver/Music/GoodEnd.bin"
	even
Z80SMS_Music11:	binclude "Sound/SMS Sound Driver/Music/Emerald.bin"
	even

; =============== S U B R O U T I N E =======================================

    if MOMPASS=1
		message " SMS Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

PlaySound_SMS:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+7).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Z80SMS_Driver:		include "Sound/SMS Sound Driver/SMS Sound Driver (Z80).asm"
	even