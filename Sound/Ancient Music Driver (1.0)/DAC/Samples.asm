; ADPCM?

; =============== S U B R O U T I N E =======================================

DAC_Banks:
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Split/asm2bin/Samples Bank.bin"
	even