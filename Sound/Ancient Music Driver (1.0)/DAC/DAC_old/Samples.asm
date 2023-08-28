; ADPCM?

; =============== S U B R O U T I N E =======================================

DAC_Banks:
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank1($1D0000).bin"
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank2($1D8000).bin"
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank3($1E0000).bin"
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank4($1E8000).bin"
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank5($1F0000).bin"
		align $8000
   if MOMPASS=1
		message " Ancient Music Driver Samples Data ROM offset is $\{*}"
    endif
		binclude "Sound/Ancient Music Driver (1.0)/DAC/Bank6($1F8000).bin"