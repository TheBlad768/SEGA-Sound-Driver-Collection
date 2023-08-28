
; =============== S U B R O U T I N E =======================================

Z80CubeDriver:		binclude "Sound/Cube/Cube Sound Driver.bin"
	even

		align $100

   if MOMPASS=1
		message "CUBE Sound Driver Instruments Data ROM offset is $\{*}"
    endif
			binclude "Sound/Cube/Instruments.bin"
	even

   if MOMPASS=1
		message " CUBE Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

PlayCubeSound:
		disableInts2
		stopZ80
		clr.b	(Z80_RAM+$1FFE).l
		move.b	d0,(Z80_RAM+$1FFF).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

		align $8000
   if MOMPASS=1
		message " CUBE Sound Driver Samples Data ROM offset is $\{*}"
    endif
			binclude "Sound/Cube/Samples.bin"
		align $8000
   if MOMPASS=1
		message " CUBE Sound Driver Music Data ROM offset is $\{*}"
    endif
			binclude "Sound/Cube/Music1.bin"
		align $8000
   if MOMPASS=1
		message " CUBE Sound Driver Music Data ROM offset is $\{*}"
    endif
			binclude "Sound/Cube/Music2.bin"
		align $8000
   if MOMPASS=1
		message " CUBE Sound Driver Music Data ROM offset is $\{*}"
    endif
			binclude "Sound/Cube/Music3.bin"
	even