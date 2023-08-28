; ---------------------------------------------------------------------------
; PLE-PLE Z80 Sound Driver?
; ---------------------------------------------------------------------------

Music_Bank_Offset:			= ($1F0000>>15)
Samples_Bank_Offset:			= ($1F0000>>15)

; =============== S U B R O U T I N E =======================================

EntryPoint:
		!org	0
		CPU Z80
		listing on
		di

loc_1:
		im	1

loc_3:
		jp	loc_800
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_10:	dw 0
word_12:	dw 0
word_14:	dw 0
word_16:	dw 0
byte_18:		db 0
byte_19:		db 0
byte_1A:		db 0
word_1B:	dw 0
byte_1D:		db 0
word_1E:	dw 0
word_20:	dw 0
byte_22:	db 0
byte_23:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_38:	db 0
word_39:	dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_110:	dw 0
		db    0
		db    0
word_114:	dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_11C:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_128:	dw 0
		db    0
		db    0
word_12C:	dw 0
		db    0
		db    0
word_130:	dw 0
		db    0
		db    0
word_134:	dw 0
		db    0
		db    0
word_138:	dw 0
		db    0
		db    0
word_13C:	dw 0
		db 0
		db 0
byte_140:	db 0
byte_141:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_150:	db 0
byte_151:	db 0
		db    0
		db    0
		db    0
		db    0
byte_156:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_160:	db 0
word_161:	dw 0
byte_163:	db 0
word_164:	dw 0
word_166:	dw 0
byte_168:	db 0
byte_169:	db 0
byte_16A:	db 0
byte_16B:	db 0
byte_16C:	db 0
byte_16D:	db 0
byte_16E:	db 0
byte_16F:	db 0
byte_170:	db 0
byte_171:	db 0
word_172:	dw 0
word_174:	dw 0
byte_176:	db 0
byte_177:	db 0
byte_178:	db 0
byte_179:	db 0
word_17A:	dw 0
word_17C:	dw 0
byte_17E:	db 0
			db 0
byte_180:	db 0
word_181:	dw 0
			db 0
word_184:	dw 0
word_186:	dw 0
word_188:	dw 0
word_18A:	dw 0
word_18C:	dw 0
byte_18E:	db 0
byte_18F:	db 0
word_190:	dw 0
			db 0
			db 0
byte_194:	db 0
byte_195:	db 0
byte_196:	db 0
			db 0
byte_198:	db 0
byte_199:
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0B2h
		db    2
		db 0DBh
		db    2
		db    6
		db    3
		db  34h
		db    3
		db  65h
		db    3
		db  99h
		db    3
		db 0CFh
		db    3
		db    9
		db    4
		db  47h
		db    4
		db  88h
		db    4
		db 0CDh
		db    4
		db  16h
		db    5
		db 0B2h
		db  0Ah
		db 0DBh
		db  0Ah
		db    6
		db  0Bh
		db  34h
		db  0Bh
		db  65h
		db  0Bh
		db  99h
		db  0Bh
		db 0CFh
		db  0Bh
		db    9
		db  0Ch
		db  47h
		db  0Ch
		db  88h
		db  0Ch
		db 0CDh
		db  0Ch
		db  16h
		db  0Dh
		db 0B2h
		db  12h
		db 0DBh
		db  12h
		db    6
		db  13h
		db  34h
		db  13h
		db  65h
		db  13h
		db  99h
		db  13h
		db 0CFh
		db  13h
		db    9
		db  14h
		db  47h
		db  14h
		db  88h
		db  14h
		db 0CDh
		db  14h
		db  16h
		db  15h
		db 0B2h
		db  1Ah
		db 0DBh
		db  1Ah
		db    6
		db  1Bh
		db  34h
		db  1Bh
		db  65h
		db  1Bh
		db  99h
		db  1Bh
		db 0CFh
		db  1Bh
		db    9
		db  1Ch
		db  47h
		db  1Ch
		db  88h
		db  1Ch
		db 0CDh
		db  1Ch
		db  16h
		db  1Dh
		db 0B2h
		db  22h
		db 0DBh
		db  22h
		db    6
		db  23h
		db  34h
		db  23h
		db  65h
		db  23h
		db  99h
		db  23h
		db 0CFh
		db  23h
		db    9
		db  24h
		db  47h
		db  24h
		db  88h
		db  24h
		db 0CDh
		db  24h
		db  16h
		db  25h
		db 0B2h
		db  2Ah
		db 0DBh
		db  2Ah
		db    6
		db  2Bh
		db  34h
		db  2Bh
		db  65h
		db  2Bh
		db  99h
		db  2Bh
		db 0CFh
		db  2Bh
		db    9
byte_28B:
		db 2Ch
		db  47h
		db  2Ch
		db  88h
		db  2Ch
		db 0CDh
		db  2Ch
		db  16h
		db  2Dh
		db 0B2h
		db  32h
		db 0DBh
		db  32h
		db    6
		db  33h
		db  34h
		db  33h
		db  65h
		db  33h
		db  99h
		db  33h
		db 0CFh
		db  33h
		db    9
		db  34h
		db  47h
		db  34h
		db  88h
		db  34h
		db 0CDh
		db  34h
		db  16h
		db  35h
		db 0B2h
		db  3Ah
		db 0DBh
		db  3Ah
		db    6
		db  3Bh
		db  34h
		db  3Bh
		db  65h
		db  3Bh
		db  99h
		db  3Bh
		db 0CFh
		db  3Bh
		db    9
		db  3Ch
		db  47h
		db  3Ch
		db  88h
		db  3Ch
		db 0CDh
		db  3Ch
		db  16h
		db  3Dh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db    3
		db 0C7h
		db    3
		db  90h
		db    3
		db  5Dh
		db    3
		db  2Dh
		db    3
		db 0FFh
		db    2
		db 0D4h
		db    2
		db 0ABh
		db    2
		db  85h
		db    2
		db  61h
		db    2
		db  3Fh
		db    2
		db  1Eh
		db    2
		db    0
		db    2
		db 0E3h
		db    1
		db 0C8h
		db    1
		db 0AFh
		db    1
		db  96h
		db    1
		db  80h
		db    1
		db  6Ah
		db    1
		db  56h
		db    1
		db  43h
		db    1
		db  30h
		db    1
		db  1Fh
		db    1
		db  0Fh
		db    1
		db    0
		db    1
		db 0F2h
		db    0
		db 0E4h
		db    0
		db 0D7h
		db    0
		db 0CBh
		db    0
		db 0C0h
		db    0
		db 0B5h
		db    0
		db 0ABh
		db    0
		db 0A1h
		db    0
		db  98h
		db    0
		db  90h
		db    0
		db  88h
		db    0
		db  80h
		db    0
		db  79h
		db    0
		db  72h
		db    0
		db  6Ch
		db    0
		db  66h
		db    0
		db  60h
		db    0
		db  5Bh
		db    0
		db  55h
		db    0
		db  51h
		db    0
		db  4Ch
		db    0
		db  48h
		db    0
		db  44h
		db    0
		db  40h
		db    0
		db  3Ch
		db    0
		db  39h
		db    0
		db  36h
		db    0
		db  33h
		db    0
		db  30h
		db    0
		db  2Dh
		db    0
		db  2Bh
		db    0
		db  28h
		db    0
		db  26h
		db    0
		db  24h
		db    0
		db  22h
		db    0
		db  20h
		db    0
		db  1Eh
		db    0
		db  1Ch
		db    0
		db  1Bh
		db    0
		db  19h
		db    0
		db  18h
		db    0
		db  16h
		db    0
		db  15h
		db    0
		db  14h
		db    0
		db  13h
		db    0
		db  12h
		db    0
		db  11h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_400:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_42D:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_500:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_563:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_7C0:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; ---------------------------------------------------------------------------

loc_800:
		di
		im	1
		ld	sp, 0FCh
		ld	hl, 10h
		ld	(word_1B), hl
		ld	a, 1
		ld	(byte_18), a
		ld	a, 0C3h
		ld	hl, sub_10E9
		ld	(byte_38), a
		ld	(word_39), hl
		ld	hl, 800h
		ld	(loc_1), a
		ld	(loc_1+1), hl
		ld	a, 0F3h
		ld	(EntryPoint), a
		ld	hl, 0
		ld	(word_12C), hl
		ld	(word_10), hl
		ld	(word_12), hl
		ld	(word_14), hl
		ld	(word_16), hl
		ld	(word_1E), hl
		ld	(word_20), hl
		xor	a
		ld	(byte_1D), a
		ld	(byte_19), a
		ld	(byte_23), a
		ld	(byte_18E), a
		ld	bc, 1000h

loc_852:
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_852
		call	sub_DD5
		ld	a, 0FFh
		ld	(word_181), a
		ld	d, Music_Bank_Offset		; Music Pointer
		ld	e, Samples_Bank_Offset	; Samples Pointer
		ld	(loc_3+1), de
		call	LoadBANK
		ld	hl, aPlePle
		ld	de, 88C8h				; Original 8000h. This fix for remove Samples.
		ld	b, 8

loc_873:
		ld	a, (de)
		cp	(hl)
		jp	nz, loc_89C
		inc	de
		inc	hl
		djnz	loc_873
		ld	e, Music_Bank_Offset		; Music Pointer
		call	LoadBANK
		ld	hl, aMaiko
		ld	de, 88C0h				; Music Bank offset
		ld	b, 8

loc_889:
		ld	a, (de)
		cp	(hl)
		jp	nz, loc_89C
		inc	de
		inc	hl
		djnz	loc_889
		xor	a
		ld	(byte_18), a
		call	sub_E36
		jp	loc_902
; ---------------------------------------------------------------------------

loc_89C:
		xor	a
		ld	(byte_18), a
		ld	(EntryPoint), a
		call	sub_E36
		ld	hl, 0AA55h
		ld	(word_10), hl
		ld	(word_12), hl
		ld	(word_14), hl
		ld	(word_16), hl
		ld	hl, 8000h
		ld	de, 20h
		ld	bc, 10h
		ldir
		ld	hl, 0C000h
		ld	de, 30h
		ld	bc, 10h
		ldir

loc_8CB:
		ld	a, 80h
		ld	(7F11h), a
		ld	a, 0Ah
		ld	(7F11h), a
		ld	a, 91h
		ld	(7F11h), a
		ld	bc, 2000h

loc_8DD:
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_8DD
		call	sub_DD5
		ld	bc, 1000h

loc_8E9:
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_8E9
		jp	loc_8CB
; ---------------------------------------------------------------------------
aPlePle:	db "PLE-PLE "
aMaiko:	db "MAIKO!  "
; ---------------------------------------------------------------------------

loc_902:
		ld	a, 0FFh
		ld	(byte_16F), a
		di
		ld	a, (word_20)
		dec	a
		jp	m, loc_922
		call	sub_1799
		xor	a
		ld	(word_20), a
		cpl
		ld	(word_20+1), a
		ld	a, (byte_18)
		or	20h
		ld	(byte_18), a

loc_922:
		ld	a, (word_1E)
		and	a
		jp	z, loc_93C
		ld	a, (byte_168)
		and	a
		jp	nz, loc_951
		ld	de, (word_1E)
		xor	a
		ld	(word_1E), a
		ld	a, e
		jp	loc_B51
; ---------------------------------------------------------------------------

loc_93C:
		ld	a, (byte_19)
		and	a
		jp	z, loc_951
		jp	p, loc_947
		xor	a

loc_947:
		ld	(word_1E), a
		xor	a
		ld	(byte_19), a
		jp	loc_EC8
; ---------------------------------------------------------------------------

loc_951:
		ld	hl, 10h
		ld	b, 8

loc_956:
		ld	a, (hl)
		cp	0FCh
		jp	z, loc_969
		cp	0F5h
		jp	z, loc_969
		inc	hl
		djnz	loc_956

loc_964:
		ld	b, 8

loc_966:
		ld	hl, (word_1B)

loc_969:
		ld	e, (hl)
		ld	(hl), 0
		inc	l
		ld	a, l
		and	17h
		ld	l, a
		ld	(word_1B), hl
		ld	a, e
		and	a
		jp	z, loc_98D
		cp	0F0h
		jp	c, loc_B51
		sub	0F0h
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, off_9A2
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

loc_98D:
		djnz	loc_966
		ei
		ld	a, (byte_170)
		and	a
		jp	nz, loc_9C2
		ei

loc_998:
		ld	a, (byte_16F)
		and	a
		jp	nz, loc_998
		jp	loc_902
; ---------------------------------------------------------------------------
off_9A2:	dw loc_98D
		dw loc_98D
		dw loc_98D
		dw loc_98D
		dw loc_98D
		dw loc_F06
		dw loc_EDA
		dw loc_AFD
		dw loc_AEE
		dw loc_AF6
		dw loc_B03
		dw loc_B00
		dw loc_F12
		dw loc_EE6
		dw loc_E0E
		dw loc_EC8
; ---------------------------------------------------------------------------

loc_9C2:
		di
		ld	a, (byte_18)
		rla
		jp	c, loc_902
		ld	e, Samples_Bank_Offset		; Samples Pointer
		call	LoadBANK
		ld	a, (byte_180)
		and	a
		jp	z, loc_9FE
		ld	hl, byte_170
		ld	de, byte_178
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ld	hl,  word_181+1
		ld	de, word_188
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi

loc_9FE:
		xor	a
		ld	(byte_180), a
		ei
		ld	ix, byte_7C0
		ld	a, (byte_178)
		cp	4
		jp	z, loc_A59
		cp	8
		jp	z, loc_A1E
		ld	bc, 0FFFFh
		ld	(word_188), bc
		jp	loc_AB3
; ---------------------------------------------------------------------------

loc_A1E:
		ld	hl, (word_17A)
		ld	bc, (word_17C)
		ld	a, (hl)
		dec	bc
		inc	hl
		ld	e, a
		ld	a, 2Ah
		di
		ld	(4000h), a
		jp	loc_A32
; ---------------------------------------------------------------------------

loc_A32:
		nop
		ld	a, e
		ld	(4001h), a
		ei
		ld	(word_17C), bc
		ld	(word_17A), hl
		ld	a, b
		and	a
		jp	m, loc_AA5
		or	c
		jp	z, loc_AA5
		ld	a, (byte_16F)
		and	a
		jp	z, loc_902
		ld	a, (byte_179)

loc_A52:
		dec	a
		jp	nz, loc_A52
		jp	loc_A1E
; ---------------------------------------------------------------------------

loc_A59:
		ld	hl, (word_17A)
		ld	bc, (word_17C)
		ld	a, (byte_17E)
		xor	0FFh
		ld	(byte_17E), a
		ld	a, (hl)
		jp	nz, loc_A72
		rlca
		rlca
		rlca
		rlca
		dec	bc
		inc	hl

loc_A72:
		and	0F0h
		ld	e, a
		ld	a, 2Ah
		di
		ld	(4000h), a
		jp	loc_A7E
; ---------------------------------------------------------------------------

loc_A7E:
		nop
		ld	a, e
		ld	(4001h), a
		ei
		ld	(word_17C), bc
		ld	(word_17A), hl
		ld	a, b
		and	a
		jp	m, loc_AA5
		or	c
		jp	z, loc_AA5
		ld	a, (byte_16F)
		and	a
		jp	z, loc_902
		ld	a, (byte_179)

loc_A9E:
		dec	a
		jp	nz, loc_A9E
		jp	loc_A59
; ---------------------------------------------------------------------------

loc_AA5:
		di
		ld	bc, (word_17C)
		ld	a, b
		and	a
		jp	m, loc_AB3
		or	c
		jp	nz, loc_902

loc_AB3:
		ld	bc, (word_188)
		inc	bc
		ld	a, b
		or	c
		jp	nz, loc_ADA
		ld	a, 2Bh
		ld	(4000h), a
		ld	a, (byte_18)
		and	0DFh
		ld	(byte_18), a
		xor	a
		ld	(word_20+1), a
		ld	(byte_170), a
		ld	(byte_178), a
		ld	(4001h), a
		jp	loc_902
; ---------------------------------------------------------------------------

loc_ADA:
		dec	bc
		ld	hl, (word_18A)
		add	hl, bc
		ld	(word_17A), hl
		ld	hl, (word_18C)
		xor	a
		sbc	hl, bc
		ld	(word_17C), hl
		jp	loc_902
; ---------------------------------------------------------------------------

loc_AEE:
		ld	a, 0FFh
		ld	(word_12C), a
		jp	loc_902
; ---------------------------------------------------------------------------

loc_AF6:
		xor	a
		ld	(word_12C), a
		jp	loc_902
; ---------------------------------------------------------------------------

loc_AFD:
		jp	loc_B03
; ---------------------------------------------------------------------------

loc_B00:
		jp	loc_98D
; ---------------------------------------------------------------------------

loc_B03:
		di
		ld	a, (byte_178)
		and	a
		jp	z, loc_B25
		ld	a, 2Bh
		ld	(4000h), a
		ld	a, (byte_18)
		and	0DFh
		ld	(byte_18), a
		xor	a
		ld	(word_20+1), a
		ld	(byte_170), a
		ld	(byte_178), a
		ld	(4001h), a

loc_B25:
		ld	a, (byte_18)
		or	80h
		ld	(byte_18), a
		call	sub_DD5

loc_B30:
		ld	hl, 10h
		ld	b, 7

loc_B35:
		ld	a, (hl)
		inc	hl
		cp	0F7h
		jp	z, loc_B46
		cp	0FBh
		jp	z, loc_B46
		djnz	loc_B35
		jp	loc_B30
; ---------------------------------------------------------------------------

loc_B46:
		ld	a, (byte_18)
		and	7Fh
		ld	(byte_18), a
		jp	loc_902
; ---------------------------------------------------------------------------

loc_B51:
		call	sub_B57
		jp	loc_902
; End of function EntryPoint

; =============== S U B R O U T I N E =======================================

sub_B57:
		di
		push	af
		ld	a, (byte_195)
		and	a
		jp	z, loc_B63
		ld	(byte_168), a

loc_B63:
		xor	a
		ld	(byte_195), a
		pop	af
		ld	e, Music_Bank_Offset		; Music Pointer
		call	LoadBANK
		ld	hl, 0
		ld	(word_114), hl
		ld	(byte_11C), a
		ld	hl, 8893h
		cp	(hl)
		ret	nc
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, 8900h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		ret	z
		push	de
		pop	iy
		ld	hl, byte_198
		ld	de, byte_199
		ld	bc, 0Fh
		ld	(hl), 0FFh
		ldir
		ld	a, (iy+0)
		and	a
		call	m, sub_D98
		ld	a, (iy+0)
		and	0Fh
		ld	b, a
		inc	iy

loc_BA8:
		push	bc
		ld	e, 0
		ld	a, 0Bh
		sub	(iy+0)
		ld	d, a
		ld	ix, byte_7C0
		ld	a, (byte_11C)
		cp	0FFh
		jp	z, loc_BD5
		push	de
		srl	d
		rr	e
		srl	d
		rr	e
		ld	ix, 400h
		add	ix, de
		pop	de
		ld	a, (ix+2Dh)
		and	40h
		jp	nz, loc_CCA

loc_BD5:
		ld	a, (ix+0)
		ld	(byte_18F), a
		ld	(ix+36h), d
		ld	l, (ix+1Ah)
		ld	h, (ix+0)
		ld	(word_110), hl
		ld	a, 5
		ld	(ix+35h), a
		ld	a, 0Fh
		ld	(ix+39h), a
		xor	a
		ld	(ix+14h), a
		ld	(ix+2Eh), a
		ld	(ix+1),	a
		ld	(ix+2),	a
		ld	(ix+3),	a
		ld	(ix+4),	a
		ld	(ix+5),	a
		ld	(ix+0Ch), a
		ld	(ix+24h), a
		ld	(ix+30h), a
		ld	(ix+37h), a
		ld	(ix+38h), a
		ld	(ix+3Ah), a
		ld	(ix+33h), a
		ld	(ix+1Bh), a
		ld	(ix+1Dh), a
		ld	(ix+1Eh), a
		ld	(ix+1Bh), a
		inc	a
		ld	(ix+21h), a
		ld	(ix+0Eh), a
		ld	a, (byte_11C)
		ld	(ix+32h), a
		ld	a, 3
		ld	(ix+22h), a
		ld	a, (ix+2Dh)
		ld	(ix+20h), a
		ld	a, (iy+1)
		ld	(ix+2Dh), a
		ld	hl, (word_114)
		or	l
		ld	(word_114), a
		ld	a, (iy+2)
		ld	(ix+0Bh), a
		ld	l, (iy+3)
		ld	h, 0
		add	hl, hl
		ld	de, 8840h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+10h), e
		ld	(ix+11h), d
		ld	hl, byte_D4A
		ld	(ix+12h), l
		ld	(ix+13h), h
		ld	l, (iy+4)
		ld	h, 0
		add	hl, hl
		ld	de, 8800h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+27h), e
		ld	(ix+28h), d
		ld	a, (iy+5)
		ld	(ix+1Fh), a
		ld	a, (iy+6)
		ld	(ix+0Ah), a
		ld	a, (iy+7)
		cp	3
		jp	c, loc_C97
		inc	a

loc_C97:
		ld	(ix+0),	a
		ld	a, (iy+8)
		ld	(ix+6),	a
		ld	a, (iy+9)
		ld	(ix+7),	a
		ld	a, (iy+0Ah)
		ld	e, 1Fh
		ld	(ix+0Fh), a
		and	a
		jp	nz, loc_CBC
		ld	a, (ix+0)
		ld	e, 0Fh
		or	8
		ld	(ix+0),	a

loc_CBC:
		call	sub_D77
		ld	a, (iy+0Bh)
		and	18h
		rlca
		rlca
		rlca
		ld	(ix+2Fh), a

loc_CCA:
		ld	de, 0Ch
		add	iy, de
		ld	a, (ix+0)
		ld	hl, 198h
		add	a, l
		ld	l, a
		jp	nc, loc_CDB
		inc	h

loc_CDB:
		ld	(hl), a
		call	sub_D4C
		pop	bc
		dec	b
		jp	nz, loc_BA8
		ld	a, (byte_11C)
		cp	0FFh
		jp	z, sub_DD5
		ld	a, (word_114)
		and	20h
		jp	nz, sub_DD5
		ld	ix, byte_400
		ld	iy, byte_198
		ld	hl, byte_140
		ld	b, 10h
		ld	a, (iy+0)
		and	a
		jp	m, loc_D3F
		cp	(hl)
		jp	nz, loc_D3F
		ld	a, (ix+0)
		cp	8
		jp	nc, loc_D22
		ld	a, 28h
		ld	(4000h), a
		ld	a, (ix+0)
		ld	(4001h), a
		jp	loc_D3F
; ---------------------------------------------------------------------------

loc_D22:
		and	3
		rrca
		rrca
		rrca
		bit	0, (ix+2Dh)
		jp	z, loc_D33
		or	9Fh
		ld	(7F11h), a

loc_D33:
		bit	1, (ix+2Dh)
		jp	z, loc_D3F
		or	0FFh
		ld	(7F11h), a

loc_D3F:
		inc	iy
		inc	hl
		ld	de, 40h
		add	ix, de
		djnz	loc_D3F
		ret
; End of function sub_B57
; ---------------------------------------------------------------------------

byte_D4A:
		db 0
		db 81h

; =============== S U B R O U T I N E =======================================

sub_D4C:
		ld	a, (ix+0)
		cp	8
		ret	nc
		ld	hl, byte_150
		add	a, l
		ld	l, a
		jp	nc, loc_D5B
		inc	h

loc_D5B:
		ld	a, (hl)
		cp	(ix+0Fh)
		jp	z, loc_103A
		ld	e, (ix+0)
		ld	d, 0
		ld	hl, byte_140
		add	hl, de
		ld	a, (hl)
		and	a
		jp	p, loc_103A
		ld	a, (ix+0Fh)
		ld	(hl), a
		jp	sub_FC0
; End of function sub_D4C

; =============== S U B R O U T I N E =======================================

sub_D77:
		ld	a, (ix+1Ah)
		and	a
		ret	z
		ld	a, (byte_18F)
		cp	8
		ret	c
		and	3
		rrca
		rrca
		rrca
		or	9Fh
		ld	(7F11h), a
		ld	a, (ix+20h)
		and	2
		ret	z
		ld	a, 0FFh
		ld	(7F11h), a
		ret
; End of function sub_D77

; =============== S U B R O U T I N E =======================================

sub_D98:
		ld	de, 40h
		ld	a, 0
		ld	bc, (87FEh)
		ld	b, 0Dh
		ld	ix, byte_400

loc_DA7:
		cp	c
		jp	c, loc_DCC
		ld	(ix+0Ah), d
		ld	(ix+2Eh), d
		ld	(ix+0Bh), d
		ld	(ix+21h), d
		inc	(ix+21h)
		ld	hl, byte_DD2
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	hl, byte_DD3
		ld	(ix+12h), l
		ld	(ix+13h), h

loc_DCC:
		inc	a
		add	ix, de
		djnz	loc_DA7
		ret
; End of function sub_D98
; ---------------------------------------------------------------------------

byte_DD2:
		db 82h
byte_DD3:
		db 0
		db 81h

; =============== S U B R O U T I N E =======================================

sub_DD5:
		ld	a, 2Bh
		ld	(4000h), a
		xor	a
		ld	(4001h), a
		ld	a, 28h
		ld	(4000h), a
		ld	a, (byte_178)
		and	a
		ld	a, 6
		jp	z, loc_DED
		dec	a

loc_DED:
		push	af
		ld	(4001h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		pop	af
		dec	a
		jp	p, loc_DED
		ld	a, 9Fh
		ld	b, 4

loc_E06:
		ld	(7F11h), a
		add	a, 20h
		djnz	loc_E06
		ret
; End of function sub_DD5
; ---------------------------------------------------------------------------

loc_E0E:
		ld	ix, byte_400
		ld	bc, byte_500

loc_E15:
		push	bc
		ld	(ix+0),	c
		inc	c
		ld	a, 3
		cp	c
		jp	nz, loc_E21
		inc	c

loc_E21:
		xor	a
		ld	(ix+0Fh), a
		call	sub_FC0
		ld	bc, 40h
		add	ix, bc
		pop	bc
		djnz	loc_E15
		call	sub_E36
		jp	loc_902

; =============== S U B R O U T I N E =======================================

sub_E36:
		di
		xor	a
		ld	(byte_194), a
		ld	(byte_195), a
		ld	(byte_16D), a
		ld	(byte_16E), a
		ld	(byte_196), a
		ld	(word_166), a
		ld	(word_166+1), a
		ld	(byte_168), a
		ld	(byte_170), a
		ld	(byte_180), a
		ld	(byte_176), a
		ld	(byte_1A), a
		ld	(byte_18), a
		ld	a, 10h
		ld	(byte_169), a
		ld	hl, byte_150
		ld	de, byte_151
		ld	bc, 0Fh
		ld	(hl), 0FFh
		ldir
		ld	ix, byte_400
		ld	de, 40h
		ld	l, 0
		ld	a, 0FFh
		ld	b, 0Dh

loc_E7E:
		ld	(ix+0),	a
		ld	(ix+1Ah), l
		ld	(ix+2Dh), l
		add	ix, de
		djnz	loc_E7E
		ld	a, 28h
		ld	(4000h), a
		ld	a, 7

loc_E92:
		push	af
		ld	(4001h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		pop	af
		dec	a
		jp	p, loc_E92
		ld	a, 9Fh
		ld	b, 4

loc_EAB:
		ld	(7F11h), a
		add	a, 20h
		djnz	loc_EAB
		ld	a, 2Bh
		ld	(4000h), a
		xor	a
		ld	(4001h), a
		ld	a, 27h
		ld	(4000h), a
		xor	a
		ld	(4001h), a
		ld	(byte_18), a
		ret
; End of function sub_E36
; ---------------------------------------------------------------------------

loc_EC8:
		ld	a, 0Eh
		ld	(word_166+1), a
		ld	a, 1Eh
		ld	(word_166), a
		ld	a, 0FFh
		ld	(byte_16A), a
		jp	loc_EEF
; ---------------------------------------------------------------------------

loc_EDA:
		ld	a, (byte_168)
		and	a
		jp	nz, loc_902
		ld	a, 10h
		jp	loc_EEF
; ---------------------------------------------------------------------------

loc_EE6:
		ld	a, (byte_168)
		and	a
		jp	nz, loc_902
		ld	a, 40h

loc_EEF:
		ld	(byte_169), a
		ld	a, 0FFh
		ld	(byte_168), a
		ld	a, (byte_18)
		or	40h
		ld	(byte_18), a
		xor	a
		ld	(byte_195), a
		jp	loc_902
; ---------------------------------------------------------------------------

loc_F06:
		ld	a, (byte_168)
		and	a
		jp	nz, loc_902
		ld	a, 10h
		jp	loc_F1B
; ---------------------------------------------------------------------------

loc_F12:
		ld	a, (byte_168)
		and	a
		jp	nz, loc_902
		ld	a, 40h

loc_F1B:
		ld	(byte_169), a
		ld	a, 1
		ld	(byte_195), a
		ld	a, (byte_18)
		or	40h
		ld	(byte_18), a
		ld	a, 0Bh
		ld	(word_166+1), a
		rlca
		ld	(word_166), a
		jp	loc_964

; =============== S U B R O U T I N E =======================================

LoadBANK:
		push	af
		di
		ld	a, (word_181)
		cp	e
		jp	z, loc_F4D
		ld	a, e
		ld	(word_181), a
		ld	b, 9

loc_F46:
		ld	(6000h), a
		srl	a
		djnz	loc_F46

loc_F4D:
		pop	af
		ret
; End of function LoadBANK

; =============== S U B R O U T I N E =======================================

sub_F4F:
		push	af

loc_F50:
		ld	a, (4000h)
		rla
		jp	c, loc_F50
		pop	af
		ld	(4000h), a
		ret
; End of function sub_F4F

; =============== S U B R O U T I N E =======================================

sub_F5C:
		ld	(4001h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		ret
; End of function sub_F5C

; =============== S U B R O U T I N E =======================================

sub_F6C:
		ld	a, (4000h)
		rla
		jp	c, sub_F6C
		push	hl
		ld	hl, 4000h
		ld	a, (ix+0)
		ld	a, (ix+0)
		cp	4
		jp	c, loc_F87
		ld	hl, 4002h
		and	3

loc_F87:
		or	d
		ld	(hl), a
		inc	hl
		jr	loc_F8C
; ---------------------------------------------------------------------------

loc_F8C:
		ld	(hl), e
		bit	0, (ix+0)
		bit	0, (ix+0)
		pop	hl
		ret
; End of function sub_F6C
; ---------------------------------------------------------------------------
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)

; =============== S U B R O U T I N E =======================================

sub_FBB:
		bit	0, (ix+0)
		ret
; End of function sub_FBB

; =============== S U B R O U T I N E =======================================

sub_FC0:
		ld	a, (ix+0)
		cp	8
		ret	nc
		ld	a, (byte_160)
		and	a
		jp	z, loc_FD3
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_FD3:
		push	hl
		ld	l, (ix+0Fh)
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	de, (word_164)
		inc	de
		inc	de
		add	hl, de
		ld	e, (hl)
		ld	d, 0B0h
		ld	(ix+15h), e
		inc	hl
		call	sub_F6C
		ld	a, (ix+2Fh)
		and	0C0h
		ld	e, (hl)
		ld	d, 0B4h
		or	e
		ld	e, a
		ld	(ix+2Fh), a
		inc	hl
		call	sub_F6C
		ld	a, 16h
		ld	(loc_100E+2), a
		ld	d, 30h
		ld	b, 4

loc_1009:
		push	bc
		push	de
		inc	hl
		ld	a, (hl)
		dec	hl

loc_100E:
		ld	(ix+7Dh), a
		ld	a, (loc_100E+2)
		inc	a
		ld	(loc_100E+2), a
		ld	b, 7

loc_101A:
		ld	e, (hl)
		inc	hl
		call	sub_F6C
		call	sub_FBB
		ld	a, 10h
		add	a, d
		ld	d, a
		djnz	loc_101A
		pop	de
		pop	bc
		ld	a, 4
		add	a, d
		ld	d, a
		djnz	loc_1009
		ld	a, (ix+15h)
		and	7
		ld	(ix+15h), a
		pop	hl
		ret
; End of function sub_FC0
; ---------------------------------------------------------------------------

loc_103A:
		ld	a, (ix+0)
		cp	8
		ret	nc
		ld	a, (byte_160)
		and	a
		jp	z, loc_104D
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_104D:
		push	hl
		ld	l, (ix+0Fh)
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	de, (word_164)
		inc	de
		inc	de
		add	hl, de
		ld	a, (hl)
		and	7
		ld	(ix+15h), a
		inc	hl
		ld	a, (ix+2Fh)
		and	0C0h
		or	(hl)
		ld	(ix+2Fh), a
		inc	hl
		inc	hl
		ld	b, 4
		ld	a, 16h
		ld	de, 7

loc_1078:
		ld	(loc_107C+2), a
		ld	c, (hl)

loc_107C:
		ld	(ix+7Bh), c
		inc	a
		add	hl, de
		djnz	loc_1078
		pop	hl
		ret

; =============== S U B R O U T I N E =======================================

sub_1085:
		ld	d, 0
		ld	hl, byte_10C9
		add	hl, de
		ld	e, (hl)
		ld	c, (ix+15h)
		ld	b, 0
		ld	hl, byte_10C1
		add	hl, bc
		ld	c, (hl)
		ld	b, 4
		ld	l, e
		ld	d, 40h
		push	ix
		pop	iy

loc_109F:
		rlc	c
		jp	nc, loc_10B8
		push	de
		ld	a, (iy+16h)
		add	a, l
		jp	c, loc_10AF
		jp	p, loc_10B1

loc_10AF:
		ld	a, 7Fh

loc_10B1:
		add	a, 0
		ld	e, a
		call	sub_F6C
		pop	de

loc_10B8:
		inc	d
		inc	d
		inc	d
		inc	d
		inc	iy
		djnz	loc_109F
		ret
; End of function sub_1085
; ---------------------------------------------------------------------------

byte_10C1:
		db 10h,	10h, 10h, 10h, 30h, 70h, 70h, 0F0h
byte_10C9:
		db 7Fh,	58h, 54h, 50h, 4Ch, 48h, 44h, 40h, 3Ch,	38h, 34h
		db 30h,	2Ch, 28h, 24h, 20h, 1Eh, 1Ch, 1Ah, 18h,	16h, 14h
		db 12h,	10h, 0Eh, 0Ch, 0Ah, 8, 6, 4, 2,	0

; =============== S U B R O U T I N E =======================================

sub_10E9:
		di
		push	af
		push	iy
		ld	(word_130), bc
		ld	(word_134), de
		ld	(word_138), hl
		ld	(word_13C), ix
		ld	a, (byte_18E)
		and	a
		jp	nz, loc_12AF
		dec	a
		ld	(byte_18E), a
		ld	a, 0FFh
		ld	hl, byte_140
		ld	de, byte_141
		ld	bc, 0Fh
		ld	(hl), a
		ldir
		ld	hl, 0FFECh
		ld	(word_161), hl
		ld	hl, 8000h
		ld	(word_164), hl
		ld	a, (byte_16D)
		ld	hl, byte_16E
		or	(hl)
		jp	z, loc_1138
		ld	ix, byte_7C0
		ld	a, (byte_7C0)
		call	sub_152C
		jp	loc_129D
; ---------------------------------------------------------------------------

loc_1138:
		ld	hl, byte_42D

loc_113B:
		ld	de, 40h
		ld	b, 0Ch
		ld	c, 0

loc_1142:
		ld	a, (hl)
		and	20h
		or	c
		ld	c, a
		add	hl, de
		djnz	loc_1142
		ld	(byte_160), a

loc_114D:
		ld	hl, byte_16C
		dec	(hl)
		xor	a
		ld	(byte_16B), a
		ld	a, (byte_168)
		and	a
		jp	z, loc_1262
		ld	(byte_16B), a
		ld	hl, byte_169
		ld	a, (byte_16A)
		add	a, (hl)
		ld	(byte_16A), a
		jp	nc, loc_1262
		ld	a, (byte_168)
		and	a
		jp	m, loc_1191
		ld	a, (word_166+1)
		dec	a
		ld	(word_166+1), a
		rlca
		ld	(word_166), a
		and	a
		jp	nz, loc_1262
		xor	a
		ld	(byte_168), a
		ld	a, (byte_18)
		and	0BFh
		ld	(byte_18), a
		jp	loc_1262
; ---------------------------------------------------------------------------

loc_1191:
		ld	a, (word_166+1)
		inc	a
		ld	(word_166+1), a
		rlca
		ld	(word_166), a
		cp	1Eh
		jp	c, loc_1262
		xor	a
		ld	(byte_168), a
		ld	a, 1Fh
		ld	(word_166), a
		rra
		ld	(word_166+1), a
		ld	(byte_194), a
		ld	de, (word_181)
		push	de
		ld	e, Music_Bank_Offset		; Music Pointer
		call	LoadBANK
		ld	bc, (8892h)				; Unknown
		pop	de
		call	LoadBANK
		ld	de, 40h
		ld	a, 0
		ld	b, 0Ch
		ld	ix, byte_400

loc_11CE:
		cp	c
		jp	c, loc_1253
		ld	(ix+0Ah), d
		ld	(ix+2Eh), d
		ld	(ix+24h), d
		ld	(ix+0Bh), d
		ld	(ix+21h), d
		inc	(ix+21h)
		ld	hl, byte_12C7
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	hl, byte_12C8
		ld	(ix+12h), l
		ld	(ix+13h), h
		push	af
		push	bc
		push	de
		push	hl
		ld	a, (ix+0)
		cp	9
		jp	nc, loc_124F
		ld	d, 80h
		ld	e, 0FFh
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 84h
		ld	e, 0FFh
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 88h
		ld	e, 0FFh
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 8Ch
		ld	e, 0FFh
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	a, (ix+0)
		ld	hl, 150h
		add	a, l
		ld	l, a
		jp	nc, loc_124A
		inc	h

loc_124A:
		xor	a
		ld	(hl), a
		ld	(ix+0Fh), a

loc_124F:
		pop	hl
		pop	de
		pop	bc
		pop	af

loc_1253:
		inc	a
		add	ix, de
		dec	b
		jp	nz, loc_11CE
		ld	a, (byte_18)
		and	0BFh
		ld	(byte_18), a

loc_1262:
		ld	de, (word_181)
		push	de
		ld	e, Music_Bank_Offset		; Music Pointer
		call	LoadBANK
		ld	ix, byte_400
		ld	bc, 0D00h				; Music offset

loc_1273:
		push	bc
		ld	(word_128), bc
		ld	a, (ix+0)
		and	a
		call	p, sub_152C
		ld	de, 40h
		add	ix, de
		pop	bc
		inc	c
		djnz	loc_1273
		pop	de
		call	LoadBANK
		ld	a, (byte_194)
		and	a
		jp	z, loc_129D
		xor	a
		ld	(byte_194), a
		ld	(word_166), a
		ld	(word_166+1), a

loc_129D:
		ld	a, (byte_16C)
		rra
		jp	nc, loc_12AB
		ld	a, (word_12C)
		and	a
		jp	nz, loc_114D

loc_12AB:
		xor	a
		ld	(byte_18E), a

loc_12AF:
		xor	a
		ld	(byte_16F), a
		ld	ix, (word_13C)
		ld	hl, (word_138)
		ld	de, (word_134)
		ld	bc, (word_130)

loc_12C2:
		pop	iy
		pop	af
		reti
; End of function sub_10E9
; ---------------------------------------------------------------------------

byte_12C7:
		db 82h
byte_12C8:
		db 0
		db 81h

; =============== S U B R O U T I N E =======================================

sub_12CA:
		ld	a, (ix+1Bh)
		and	a
		ret	z
		ld	l, (ix+12h)
		ld	h, (ix+13h)

loc_12D5:
		ld	a, (hl)
		inc	hl
		and	a
		jp	p, loc_12EE
		and	1
		jp	nz, loc_12EA
		ld	a, (ix+33h)
		and	a
		jp	nz, loc_12EA
		jp	loc_12D5
; ---------------------------------------------------------------------------

loc_12EA:
		ld	a, (ix+34h)
		dec	hl

loc_12EE:
		ld	(ix+34h), a
		ld	(ix+12h), l
		ld	(ix+13h), h
		ld	e, a
		ld	a, (ix+0Bh)
		and	a
		jp	nz, loc_1300
		ld	e, a

loc_1300:
		ld	a, (word_110)
		and	a
		ret	p
		ld	a, (8892h)
		dec	a
		cp	(ix+36h)
		jp	nc, loc_1326
		ld	a, e
		ld	de, (word_166)
		ld	b, (ix+0)
		bit	3, b
		jp	z, loc_1320
		ld	de, (word_166+1)

loc_1320:
		sub	e
		jp	nc, loc_1325
		xor	a

loc_1325:
		ld	e, a

loc_1326:
		ld	a, (ix+0)
		and	8
		jp	nz, loc_134B
		ld	a, 1Fh
		xor	e
		ld	e, a
		ld	a, (ix+0Bh)
		sub	e
		jp	p, loc_133A
		xor	a

loc_133A:
		ld	e, a
		ld	a, (byte_160)
		and	a
		jp	z, sub_1085
		ld	a, (ix+2Dh)
		and	20h
		jp	nz, sub_1085
		ret
; ---------------------------------------------------------------------------

loc_134B:
		ld	a, 0Fh
		xor	e
		ld	e, a
		ld	a, (ix+0Bh)
		sub	e
		jp	p, loc_1357
		xor	a

loc_1357:
		ld	e, a
		ld	a, (ix+0)
		and	3
		rrca
		rrca
		rrca
		or	9Fh
		xor	e
		ld	e, a
		ld	a, (byte_160)
		and	a
		jp	z, loc_1371
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_1371:
		ld	a, e
		ld	e, (ix+2Dh)
		bit	0, e
		jp	z, loc_137D
		ld	(7F11h), a

loc_137D:
		bit	1, e
		ret	z
		or	0F0h
		ld	(7F11h), a
		ld	a, (ix+35h)
		cp	(ix+39h)
		ret	z
		ld	(ix+39h), a
		or	0E0h
		ld	(7F11h), a
		ret
; End of function sub_12CA

; =============== S U B R O U T I N E =======================================

sub_1395:
		ld	a, (ix+1Bh)
		ld	b, a
		and	a
		ret	z
		ld	l, (ix+1Dh)
		ld	h, (ix+1Eh)
		push	bc
		ld	a, (ix+37h)
		and	a
		jp	z, loc_13E4
		ld	c, a
		ld	b, 0
		ld	e, (ix+3Bh)
		ld	d, (ix+3Ch)
		xor	a
		push	hl
		sbc	hl, de
		pop	hl
		jp	z, loc_13E4
		jp	c, loc_13D1
		sbc	hl, bc
		push	de
		call	sub_14D9
		pop	de
		xor	a
		push	hl
		sbc	hl, de
		pop	hl
		jp	nc, loc_13E1
		ld	l, e
		ld	h, d
		jp	loc_13E1
; ---------------------------------------------------------------------------

loc_13D1:
		add	hl, bc
		push	de
		call	sub_14D9
		pop	de
		xor	a
		push	hl
		sbc	hl, de
		pop	hl
		jp	c, loc_13E1
		ld	l, e
		ld	h, d

loc_13E1:
		call	sub_14D9

loc_13E4:
		pop	bc
		ld	a, (ix+38h)
		and	a
		jp	z, loc_141A
		jp	p, loc_13F3
		and	7Fh
		cpl
		inc	a

loc_13F3:
		add	a, (ix+1Bh)
		jp	p, loc_13FA
		ld	a, b

loc_13FA:
		ld	(ix+1Bh), a
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, 200h
		ld	a, (ix+0)
		cp	8
		jp	c, loc_140F
		ld	hl, 2F4h

loc_140F:
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		ld	a, b
		jp	z, loc_13FA
		ex	de, hl

loc_141A:
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h
		ld	l, (ix+29h)
		ld	h, (ix+2Ah)

loc_1426:
		ld	a, (hl)
		inc	hl
		cp	80h
		jp	nz, loc_1436
		ld	l, (ix+27h)
		ld	h, (ix+28h)
		jp	loc_1426
; ---------------------------------------------------------------------------

loc_1436:
		cp	81h
		jp	nz, loc_1448
		ld	e, (hl)
		ld	d, 0
		ld	l, (ix+27h)
		ld	h, (ix+28h)
		add	hl, de
		jp	loc_1426
; ---------------------------------------------------------------------------

loc_1448:
		ld	(ix+29h), l
		ld	(ix+2Ah), h
		ld	l, (ix+1Dh)
		ld	h, (ix+1Eh)
		ld	e, a
		ld	d, 0
		and	a
		jp	p, loc_145C
		dec	d

loc_145C:
		add	hl, de
		call	sub_14D9
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h
		ld	a, (word_110)
		and	a
		ret	p
		ld	a, (byte_160)
		and	a
		jp	z, loc_1478
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_1478:
		ld	a, (ix+0)
		cp	8
		jp	c, loc_149A
		and	3
		rrca
		rrca
		rrca
		or	80h
		ld	c, a
		ld	a, l
		and	0Fh
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		or	c
		ld	(7F11h), a
		ld	a, h
		and	3Fh
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_149A:
		ld	d, 0A4h
		ld	e, h
		call	sub_F6C
		ld	d, 0A0h
		ld	e, l
		call	sub_F6C
		ret
; End of function sub_1395

; =============== S U B R O U T I N E =======================================

sub_14A7:
		ld	a, (ix+0Ch)
		and	a
		ret	z
		ld	a, (ix+0Eh)
		add	a, (ix+0Dh)
		ld	(ix+0Eh), a
		ret	nc
		ld	c, 1
		ld	a, (ix+0Ch)
		and	a
		jp	p, loc_14C3
		and	7Fh
		ld	c, 0FFh

loc_14C3:
		ld	e, a
		ld	a, (ix+0Bh)
		add	a, c
		ld	(ix+0Bh), a
		cp	e
		ret	nz
		xor	a
		ld	(ix+0Ch), a
		ret
; End of function sub_14A7

; =============== S U B R O U T I N E =======================================

sub_14D2:
		push	hl
		xor	a
		sbc	hl, de
		ex	de, hl
		pop	hl
		ret
; End of function sub_14D2

; =============== S U B R O U T I N E =======================================

sub_14D9:
		ld	a, (ix+0)
		and	8
		jp	z, loc_14F3
		ld	de, 11h
		call	sub_14D2
		jp	c, loc_14F1
		ld	de, byte_400
		call	sub_14D2
		ret	c

loc_14F1:
		ex	de, hl
		ret
; ---------------------------------------------------------------------------

loc_14F3:
		push	hl
		ld	a, h
		and	38h
		rrca
		rrca
		rrca
		ld	c, a
		ld	a, h
		and	7
		ld	h, a
		ld	de, byte_28B
		call	sub_14D2
		jp	nc, loc_1512
		ld	hl, byte_563
		xor	a
		sbc	hl, de
		dec	c
		jp	loc_1520
; ---------------------------------------------------------------------------

loc_1512:
		ld	de, byte_563
		call	sub_14D2
		jp	c, loc_152A
		ld	hl, byte_28B
		add	hl, de
		inc	c

loc_1520:
		ld	a, c
		and	7
		rlca
		rlca
		rlca
		or	h
		ld	h, a
		pop	af
		ret
; ---------------------------------------------------------------------------

loc_152A:
		pop	hl
		ret
; End of function sub_14D9

; =============== S U B R O U T I N E =======================================

sub_152C:
		di
		ld	(word_190), sp
		xor	a
		ld	(ix+1Ah), a
		ld	a, (byte_170)
		ld	hl, byte_178
		or	(hl)
		jp	z, loc_154C
		ld	a, (ix+0)
		cp	6
		jp	nz, loc_154C
		ld	a, 7Fh
		jp	loc_1556
; ---------------------------------------------------------------------------

loc_154C:
		ld	e, (ix+0)
		ld	d, 0
		ld	hl, 140h
		add	hl, de
		ld	a, (hl)

loc_1556:
		ld	(word_110), a
		and	a
		jp	p, loc_1563
		xor	a
		ld	(hl), a
		dec	a
		ld	(ix+1Ah), a

loc_1563:
		ld	a, (word_110)
		and	a
		jp	p, loc_1589
		ld	a, (ix+0)
		cp	8
		jp	nc, loc_1589
		ld	hl, 150h
		add	a, l
		ld	l, a
		jp	nc, loc_157B
		inc	h

loc_157B:
		ld	a, (hl)
		cp	(ix+0Fh)
		jp	z, loc_1589
		ld	a, (ix+0Fh)
		ld	(hl), a
		call	sub_FC0

loc_1589:
		call	sub_1395
		call	sub_14A7
		call	sub_12CA
		ld	a, (ix+0Ah)
		and	a
		jp	z, loc_15A1
		ld	c, (ix+2Eh)
		add	a, c
		ld	(ix+2Eh), a
		ret	nc

loc_15A1:
		ld	a, (ix+22h)
		and	a
		jp	p, loc_15B3
		and	7Fh
		ld	e, a
		ld	a, (ix+20h)
		sub	e
		jp	p, loc_15B3
		xor	a

loc_15B3:
		ld	e, a
		ld	a, (ix+21h)
		dec	a
		ld	(ix+21h), a
		push	af
		cp	e
		jp	z, loc_15C3
		jp	nc, loc_15E8

loc_15C3:
		ld	a, (ix+24h)
		and	a
		jp	nz, loc_15E8
		xor	a
		ld	(ix+33h), a
		ld	a, (word_110)
		and	a
		jp	p, loc_15E8
		ld	a, (ix+0)
		and	8
		jp	nz, loc_15E8
		ld	a, 28h
		ld	(4000h), a
		ld	a, (ix+0)
		ld	(4001h), a

loc_15E8:
		pop	af
		ret	nz
		ld	a, (ix+1Bh)
		ld	(ix+3Ah), a
		ld	l, (ix+6)
		ld	h, (ix+7)
		ld	a, 0FFh
		ld	(byte_163), a

loc_15FB:
		ld	a, (hl)
		inc	hl
		cp	0C0h
		jp	c, loc_1607
		cp	0DEh
		jp	c, sub_1799

loc_1607:
		cp	80h
		jp	c, loc_1616
		call	sub_18B7
		ld	a, (byte_163)
		and	a
		jp	m, loc_15FB

loc_1616:
		push	af
		ld	a, (hl)
		cp	0EFh
		jp	c, loc_1623
		call	sub_18E7
		jp	loc_1628
; ---------------------------------------------------------------------------

loc_1623:
		cp	0DEh
		call	nc, sub_18CD

loc_1628:
		ld	a, (hl)
		cp	99h
		jp	nz, loc_163B
		ld	a, (ix+24h)
		and	a
		jp	z, loc_163B
		xor	0FFh
		ld	(ix+24h), a
		inc	hl

loc_163B:
		pop	af
		ld	e, (ix+20h)
		ld	(ix+21h), e
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	(ix+33h), a
		and	a
		jp	z, loc_1652
		add	a, (ix+1Fh)

loc_1652:
		ld	(ix+1Bh), a
		rlca
		ld	l, a
		ld	h, 0
		ld	a, (ix+3Ah)
		and	a
		jp	z, loc_1667
		ld	a, (ix+24h)
		and	a
		jp	nz, loc_167F

loc_1667:
		ld	a, (ix+10h)
		ld	(ix+12h), a
		ld	a, (ix+11h)
		ld	(ix+13h), a
		ld	a, (ix+27h)
		ld	(ix+29h), a
		ld	a, (ix+28h)
		ld	(ix+2Ah), a

loc_167F:
		ld	a, (ix+0)
		cp	8
		jp	c, loc_1710
		ld	a, (ix+0)
		and	3
		rrca
		rrca
		rrca
		or	9Fh
		ld	(7F11h), a
		ld	de, 2F4h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, (ix+14h)
		and	a
		ld	l, a
		ld	h, 0
		jp	p, loc_16A6
		dec	h

loc_16A6:
		add	hl, de
		ld	a, (ix+37h)
		and	a
		jp	nz, loc_16B7
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h
		jp	loc_16CA
; ---------------------------------------------------------------------------

loc_16B7:
		ld	(ix+3Bh), l
		ld	(ix+3Ch), h
		ld	a, (ix+3Ah)
		and	a
		jp	nz, loc_16CA
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h

loc_16CA:
		ld	a, (word_110)
		and	a
		ret	p
		ld	a, (8892h)
		dec	a
		cp	(ix+36h)
		jp	nc, loc_16DF
		ld	a, (word_166+1)
		cp	0Fh
		ret	nc

loc_16DF:
		ld	a, (ix+1Bh)
		and	a
		ret	z
		ld	a, (byte_160)
		and	a
		jp	z, loc_16F1
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_16F1:
		ld	a, (ix+0)
		and	3
		rrca
		rrca
		rrca
		or	80h
		ld	c, a
		ld	a, l
		and	0Fh
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		or	c
		ld	(7F11h), a
		ld	a, h
		and	3Fh
		ld	(7F11h), a
		jp	sub_12CA
; ---------------------------------------------------------------------------

loc_1710:
		ld	de, 200h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, (ix+14h)
		and	a
		ld	l, a
		ld	h, 0
		jp	p, loc_1722
		dec	h

loc_1722:
		add	hl, de
		ld	de, (word_161)
		add	hl, de
		ld	a, (ix+37h)
		and	a
		jp	nz, loc_1738
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h
		jp	loc_174B
; ---------------------------------------------------------------------------

loc_1738:
		ld	(ix+3Bh), l
		ld	(ix+3Ch), h
		ld	a, (ix+3Ah)
		and	a
		jp	nz, loc_174B
		ld	(ix+1Dh), l
		ld	(ix+1Eh), h

loc_174B:
		ld	a, (word_110)
		and	a
		ret	p
		ld	a, (8892h)
		dec	a
		cp	(ix+36h)
		jp	nc, loc_1760
		ld	a, (word_166)
		cp	1Eh
		ret	nc

loc_1760:
		ld	a, (ix+1Bh)
		and	a
		ret	z
		ld	a, (byte_160)
		and	a
		jp	z, loc_1772
		ld	a, (ix+2Dh)
		and	20h
		ret	z

loc_1772:
		push	hl
		ld	d, 0B4h
		ld	e, (ix+2Fh)
		call	sub_F6C
		pop	hl
		ld	d, 0A4h
		ld	e, h
		call	sub_F6C
		ld	d, 0A0h
		ld	e, l
		call	sub_F6C
		call	sub_12CA
		ld	a, 28h
		ld	(4000h), a
		ld	a, (ix+0)
		or	0F0h
		ld	(4001h), a
		ret

; =============== S U B R O U T I N E =======================================

sub_1799:
		push	af
		push	ix
		push	af
		ld	ix, 780h
		ld	(ix+0),	6
		ld	(ix+2Dh), 1
		ld	(ix+15h), 7
		xor	a
		ld	(ix+0Fh), a
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	(ix+18h), a
		ld	(ix+19h), a
		pop	af
		ld	de, (word_181)
		push	de
		ld	e, Samples_Bank_Offset		; Samples Pointer
		call	LoadBANK
		cp	0C0h
		jp	c, loc_17D2
		ld	(word_20+1), a
		sub	0C0h

loc_17D2:
		ld	e, a
		ld	a, (byte_170)
		and	a
		jp	z, loc_17EA
		ld	a, (byte_177)
		ld	d, a
		ld	a, (word_128)
		cp	d
		ld	a, 0
		jp	z, loc_17EA
		jp	nc, loc_18AA

loc_17EA:
		ld	a, (word_128)
		ld	(byte_177), a
		ld	a, e
		push	hl
		ld	hl, 8010h
		rlca
		rlca
		rlca
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_172), de
		ld	(word_184), de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_174), de
		ld	(word_186), de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_181+1), de
		ld	a, (byte_23)
		add	a, (hl)
		inc	hl
		ld	(byte_171), a
		ld	a, (hl)
		ld	(byte_170), a
		call	sub_FC0
		ld	a, (byte_156)
		ld	(byte_22), a
		xor	a
		ld	(byte_156), a
		ld	e, 0
		call	sub_1085
		ld	a, 28h
		ld	(4000h), a
		bit	0, (ix+0)
		ld	a, 6
		ld	(4001h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	a, 0B6h
		ld	(4002h), a
		bit	0, (ix+0)
		ld	a, 0C0h
		ld	(4003h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	a, 2Ah
		ld	(4000h), a
		xor	a
		ld	(4001h), a
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	a, 2Bh
		ld	(4000h), a
		bit	0, (ix+0)
		ld	a, 80h
		ld	(4001h), a
		ld	a, (byte_18)
		or	20h
		ld	(byte_18), a
		ld	(byte_180), a
		xor	a
		pop	hl

loc_18AA:
		pop	de
		call	LoadBANK
		pop	ix
		pop	af
		cp	0C0h
		jp	nc, loc_1616
		ret
; End of function sub_1799

; =============== S U B R O U T I N E =======================================

sub_18B7:
		cp	0B0h
		jp	nc, loc_1C02
		and	7Fh
		rlca
		push	hl
		ld	e, a
		ld	d, 0
		ld	hl, off_1908
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		pop	hl
		push	de
		ret
; End of function sub_18B7

; =============== S U B R O U T I N E =======================================

sub_18CD:
		inc	hl
		sub	0DFh
		jp	p, loc_18D9
		ld	a, (hl)
		inc	hl
		ld	(ix+20h), a
		ret
; ---------------------------------------------------------------------------

loc_18D9:
		push	hl
		ld	e, a
		ld	d, 0
		ld	hl, 8880h
		add	hl, de
		ld	a, (hl)
		ld	(ix+20h), a
		pop	hl
		ret
; End of function sub_18CD

; =============== S U B R O U T I N E =======================================

sub_18E7:
		inc	hl
		sub	0F0h
		jp	p, loc_18F5
		ld	a, (hl)
		inc	hl
		ld	(ix+20h), a
		jp	loc_1902
; ---------------------------------------------------------------------------

loc_18F5:
		push	hl
		ld	e, a
		ld	d, 0
		ld	hl, 8880h
		add	hl, de
		ld	a, (hl)
		ld	(ix+20h), a
		pop	hl

loc_1902:
		ld	a, (hl)
		inc	hl
		ld	(ix+22h), a
		ret
; End of function sub_18E7
; ---------------------------------------------------------------------------

off_1908:
		dw loc_1969
		dw loc_196E
		dw loc_198A
		dw loc_1A28
		dw loc_1A41
		dw locret_1968
		dw loc_1A48
		dw loc_1A4E
		dw loc_1A54
		dw loc_1A6D
		dw loc_1A76
		dw loc_1AB3
		dw locret_1968
		dw loc_1ABE
		dw loc_1ACB
		dw loc_1AD9
		dw loc_1ADB
		dw loc_1AE1
		dw locret_1968
		dw loc_1AE7
		dw loc_1AF6
		dw loc_1AFE
		dw loc_1B0D
		dw loc_1B13
		dw loc_1B19
		dw loc_1B21
		dw loc_1B2A
		dw loc_1B35
		dw loc_1B3E
		dw loc_1B53
		dw loc_1B59
		dw loc_1B5C
		dw loc_1B61
		dw loc_1B66
		dw loc_1B76
		dw loc_1B86
		dw locret_1968
		dw loc_1BB3
		dw loc_1BBC
		dw locret_1968
		dw locret_1968
		dw loc_1BC5
		dw loc_1BD7
		dw locret_1968
		dw locret_1968
		dw loc_1BF0
		dw 0
		dw 0
; ---------------------------------------------------------------------------

locret_1968:
		ret
; ---------------------------------------------------------------------------

loc_1969:
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_196E:
		ld	a, (hl)
		inc	hl
		add	a, 25h
		ld	(loc_1978+2), a
		ld	(loc_197C+2), a

loc_1978:
		ld	a, (ix+7Dh)
		dec	a

loc_197C:
		ld	(ix+7Dh), a
		jp	z, loc_1987
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1987:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_198A:
		ld	a, (byte_196)
		and	a
		jp	z, loc_1995
		xor	a
		ld	(byte_16D), a

loc_1995:
		ld	a, (word_110)
		and	a
		jp	p, loc_1A1B
		ld	a, (ix+0)
		cp	8
		jp	c, loc_19C3
		ld	b, (ix+2Dh)
		bit	0, b
		jp	z, loc_19B6
		and	3
		rrca
		rrca
		rrca
		or	9Fh
		ld	(7F11h), a

loc_19B6:
		bit	1, b
		jp	z, loc_1A1B
		ld	a, 0FFh
		ld	(7F11h), a
		jp	loc_1A1B
; ---------------------------------------------------------------------------

loc_19C3:
		ld	a, 28h
		call	sub_F4F
		ld	a, (ix+0)
		call	sub_F5C
		ld	d, 50h
		ld	e, 0
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 54h
		ld	e, 0
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 58h
		ld	e, 0
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	d, 5Ch
		ld	e, 0
		call	sub_F6C
		bit	0, (ix+0)
		bit	0, (ix+0)
		ld	a, (ix+0)
		ld	hl, 150h
		add	a, l
		ld	l, a
		jp	nc, loc_1A16
		inc	h

loc_1A16:
		xor	a
		ld	(hl), a
		ld	(ix+0Fh), a

loc_1A1B:
		xor	a
		ld	(ix+2Dh), a
		dec	a
		ld	(ix+0),	a
		ld	sp, (word_190)
		ret
; ---------------------------------------------------------------------------

loc_1A28:
		ld	a, (hl)
		inc	hl
		ld	(ix+2Bh), a
		push	hl
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, 8800h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+27h), e
		ld	(ix+28h), d
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1A41:
		ld	a, (hl)
		ld	(ix+37h), a
		inc	hl
		and	a
		ret
; ---------------------------------------------------------------------------

loc_1A48:
		ld	a, 0FFh
		ld	(byte_1A), a
		ret
; ---------------------------------------------------------------------------

loc_1A4E:
		ld	a, (hl)
		inc	hl
		ld	(ix+0Bh), a
		ret
; ---------------------------------------------------------------------------

loc_1A54:
		ld	a, (hl)
		inc	hl
		ld	(ix+2Ch), a
		push	hl
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, 8840h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+10h), e
		ld	(ix+11h), d
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1A6D:
		ld	a, (hl)
		inc	hl
		add	a, (ix+1Fh)
		ld	(ix+1Fh), a
		ret
; ---------------------------------------------------------------------------

loc_1A76:
		ld	a, (ix+0)
		cp	8
		jp	nc, loc_1A9E
		ld	a, (hl)
		inc	hl
		and	a
		jp	m, loc_1A92
		ld	e, (ix+0Bh)
		add	a, e
		cp	20h
		jp	c, loc_1A9A
		ld	a, 1Fh
		jp	loc_1A9A
; ---------------------------------------------------------------------------

loc_1A92:
		ld	e, (ix+0Bh)
		add	a, e
		jp	p, loc_1A9A
		xor	a

loc_1A9A:
		ld	(ix+0Bh), a
		ret
; ---------------------------------------------------------------------------

loc_1A9E:
		ld	a, (hl)
		inc	hl
		and	a
		jp	m, loc_1A92
		ld	e, (ix+0Bh)
		add	a, e
		cp	10h
		jp	c, loc_1A9A
		ld	a, 0Fh
		ld	(ix+0Bh), a
		ret
; ---------------------------------------------------------------------------

loc_1AB3:
		ld	a, (hl)
		ld	(loc_3+2), a
		inc	hl
		ld	a, 9
		ld	(loc_3), a
		ret
; ---------------------------------------------------------------------------

loc_1ABE:
		ld	a, (hl)
		inc	hl
		add	a, 25h
		ld	(loc_1AC7+2), a
		ld	a, (hl)
		inc	hl

loc_1AC7:
		ld	(ix+7Dh), a
		ret
; ---------------------------------------------------------------------------

loc_1ACB:
		ld	a, (hl)
		inc	hl
		ld	(ix+35h), a
		ld	(ix+39h), a
		or	0E0h
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_1AD9:
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1ADB:
		ld	a, (hl)
		inc	hl
		ld	(ix+2Dh), a
		ret
; ---------------------------------------------------------------------------

loc_1AE1:
		ld	a, (hl)
		inc	hl
		ld	(byte_1A), a
		ret
; ---------------------------------------------------------------------------

loc_1AE7:
		inc	a
		ld	(ix+0Eh), a
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ch), a
		ld	a, (hl)
		inc	hl
		ld	(ix+0Dh), a
		ret
; ---------------------------------------------------------------------------

loc_1AF6:
		ld	a, (hl)
		xor	80h
		ld	(ix+38h), a
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1AFE:
		ld	a, (ix+0Ch)
		and	a
		jp	z, loc_1B0A
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1B0A:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B0D:
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ah), a
		ret
; ---------------------------------------------------------------------------

loc_1B13:
		ld	a, (hl)
		inc	hl
		ld	(ix+14h), a
		ret
; ---------------------------------------------------------------------------

loc_1B19:
		ld	a, (hl)
		inc	hl
		add	a, 8
		ld	(ix+0),	a
		ret
; ---------------------------------------------------------------------------

loc_1B21:
		ld	a, (ix+24h)
		xor	0FFh
		ld	(ix+24h), a
		ret
; ---------------------------------------------------------------------------

loc_1B2A:
		ld	(ix+8),	l
		ld	(ix+9),	h
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1B35:
		ld	l, (ix+8)
		ld	h, (ix+9)
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B3E:
		ld	a, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		push	hl
		ld	c, (ix+25h)
		sub	c
		ld	l, a
		ld	h, 0
		add	hl, de
		ld	a, (hl)
		ld	(ix+1Fh), a
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1B53:
		ld	a, (hl)
		ld	(ix+22h), a
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B59:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B5C:
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B61:
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B66:
		ld	a, (ix+0)
		cp	8
		jp	nc, loc_1B73
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1B73:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B76:
		ld	a, (ix+0)
		cp	8
		jp	c, loc_1B83
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1B83:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1B86:
		ld	a, (hl)
		ld	(ix+0Fh), a
		inc	hl
		ld	a, (word_110)
		and	a
		ret	p
		ld	e, (ix+0)
		ld	d, 0
		push	hl
		ld	hl, byte_150
		add	hl, de
		ld	a, (hl)
		ex	de, hl
		pop	hl
		cp	(ix+0Fh)
		jp	z, loc_1BAD
		ld	a, (ix+0Fh)
		ld	(de), a
		push	hl
		call	sub_FC0
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1BAD:
		push	hl
		call	loc_103A
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1BB3:
		ld	a, (ix+0)
		cp	8
		ret	nc
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1BBC:
		ld	a, (ix+0)
		cp	8
		ret	c
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1BC5:
		ld	a, (ix+0)
		and	7
		cp	4
		jp	c, loc_1BD0
		dec	a

loc_1BD0:
		ld	e, (hl)
		inc	hl
		cp	a
		ret	z
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1BD7:
		ld	a, (ix+0)
		and	7
		cp	4
		jp	c, loc_1BE2
		dec	a

loc_1BE2:
		ld	e, (hl)
		inc	hl
		cp	a
		jp	nz, loc_1BED
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_1BED:
		inc	hl
		inc	hl
		ret
; ---------------------------------------------------------------------------

loc_1BF0:
		ld	a, (ix+2Fh)
		and	3Fh
		ld	e, a
		ld	a, (hl)
		inc	hl
		and	18h
		rlca
		rlca
		rlca
		or	e
		ld	(ix+2Fh), a
		ret
; ---------------------------------------------------------------------------

loc_1C02:
		push	hl
		and	0Fh
		rlca
		rlca
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, byte_1E9C
		add	hl, de
		ld	a, (hl)
		ld	(ix+0Fh), a
		inc	hl
		ld	a, (hl)
		ld	(byte_163), a
		inc	hl
		ld	a, (ix+2Fh)
		and	3Fh
		ld	c, (hl)
		or	c
		ld	(ix+2Fh), a
		inc	hl
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+27h), e
		ld	(ix+28h), d
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+10h), e
		ld	(ix+11h), d
		ld	a, (byte_160)
		and	a
		jp	z, loc_1C4F
		ld	a, (ix+2Dh)
		and	20h
		jp	z, loc_1C4F
		ld	d, 0B4h
		ld	e, (ix+2Fh)
		call	sub_F6C

loc_1C4F:
		pop	hl
		ld	a, (word_110)
		and	a
		ret	p
		ld	e, (ix+0)
		ld	d, 0
		push	hl
		ld	hl, byte_150
		add	hl, de
		ld	a, (hl)
		ex	de, hl
		pop	hl
		cp	(ix+0Fh)
		ret	z
		ld	a, (ix+0Fh)
		ld	(de), a
		push	hl
		ld	hl, byte_1C7C
		ld	(word_164), hl
		call	sub_FC0
		ld	hl, 8000h
		ld	(word_164), hl
		pop	hl
		ret
; ---------------------------------------------------------------------------

byte_1C7C:
		db 0
		db    0
		db  24h
		db    0
		db    0
		db    5
		db  9Fh
		db  13h
		db  0Fh
		db  79h
		db    0
		db    0
		db  0Dh
		db  5Fh
		db  11h
		db  0Fh
		db  79h
		db    0
		db    0
		db    3
		db  1Fh
		db  0Fh
		db    1
		db  59h
		db    0
		db    0
		db  0Dh
		db  5Ch
		db  10h
		db    1
		db  39h
		db    0
		db    0
		db    0
		db  3Ch
		db    0
		db  71h
		db    2
		db  1Fh
		db  0Ch
		db  19h
		db 0A6h
		db    0
		db    1
		db  0Eh
		db 0DFh
		db  17h
		db  17h
		db 0F6h
		db    0
		db    0
		db  0Ch
		db  1Fh
		db  12h
		db  0Fh
		db 0F8h
		db    0
		db    2
		db    0
		db  5Fh
		db  12h
		db  14h
		db  58h
		db    0
		db    0
		db    0
		db  3Ch
		db    0
		db  71h
		db    2
		db  1Fh
		db  0Ch
		db  19h
		db 0A6h
		db    0
		db    3
		db  0Fh
		db 0DFh
		db  10h
		db  17h
		db  56h
		db    0
		db    1
		db  0Ah
		db  1Fh
		db  11h
		db  0Fh
		db 0F8h
		db    0
		db    1
		db  0Ah
		db  5Fh
		db  0Eh
		db  14h
		db  95h
		db    0
		db    0
		db    0
		db  3Ch
		db    0
		db  78h
		db    0
		db  1Fh
		db  0Ch
		db  19h
		db 0A6h
		db    0
		db    0
		db    7
		db  9Fh
		db  13h
		db  11h
		db 0A9h
		db    0
		db  32h
		db    2
		db  54h
		db  10h
		db  0Eh
		db  58h
		db    0
		db    0
		db    0
		db  1Fh
		db  11h
		db  0Fh
		db  57h
		db    0
		db    0
		db    0
		db    2
		db    0
		db  7Bh
		db    4
		db  99h
		db  0Ah
		db    1
		db  18h
		db    0
		db  0Ah
		db    0
		db  1Fh
		db  15h
		db  0Fh
		db  78h
		db    0
		db  3Fh
		db    0
		db  1Fh
		db    1
		db    1
		db    8
		db    0
		db  7Bh
		db    0
		db  1Fh
		db  1Ch
		db  14h
		db  3Ah
		db    0
		db    0
		db    0
		db  3Eh
		db    0
		db  0Dh
		db  14h
		db  1Fh
		db    0
		db    0
		db  20h
		db    0
		db  30h
		db    0
		db  1Fh
		db    0
		db  0Fh
		db    6
		db    0
		db    2
		db    0
		db  1Fh
		db  18h
		db  0Fh
		db  9Dh
		db    0
		db  40h
		db  2Bh
		db  1Fh
		db    0
		db  0Fh
		db    8
		db    0
		db    0
		db    0
		db  3Eh
		db    0
		db  0Dh
		db  14h
		db  1Fh
		db    0
		db    0
		db  20h
		db    0
		db  30h
		db    6
		db  1Fh
		db    0
		db  0Fh
		db    6
		db    0
		db    2
		db    6
		db  1Fh
		db  18h
		db  0Fh
		db  9Dh
		db    0
		db  40h
		db  2Bh
		db  1Fh
		db    0
		db  0Fh
		db    8
		db    0
		db    0
		db    0
		db    3
		db    0
		db  77h
		db  19h
		db  5Fh
		db  1Bh
		db  19h
		db 0D6h
		db    0
		db  78h
		db    4
		db  1Fh
		db  0Ah
		db    7
		db  56h
		db    0
		db  36h
		db    4
		db  5Fh
		db    5
		db    8
		db  25h
		db    0
		db    3
		db    2
		db  5Fh
		db  10h
		db    8
		db  66h
		db    0
		db    0
		db    0
		db  3Bh
		db    0
		db  78h
		db    7
		db  5Fh
		db  19h
		db  19h
		db 0D6h
		db    0
		db  7Ah
		db    4
		db  1Fh
		db  0Ah
		db    7
		db    6
		db    0
		db  38h
		db    4
		db  5Fh
		db    5
		db    8
		db  25h
		db    0
		db    0
		db    0
		db  5Fh
		db    6
		db    8
		db  66h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db  7Fh
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    0
		db    0
		db  3Bh
		db    0
		db    0
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h
		db  28h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h
		db 0FCh
		db 0FCh
		db 0FCh
		db 0FCh
		db 0FCh
		db  80h
		db 0E2h
		db 0E2h
		db 0E2h
		db 0E2h
		db  80h
		db 0CEh
		db 0CEh
		db 0CEh
		db 0CEh
		db  80h
		db  1Fh
		db  81h
		db  1Dh
		db  81h
		db  1Bh
		db  81h
byte_1E9C:
		db 0
		db  1Bh
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    0
		db    0
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    2
		db  25h
		db 0C0h
		db    0
		db  8Ch
		db  1Eh
		db  96h
		db  1Eh
		db    0
		db    0
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    4
		db  1Eh
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    5
		db  30h
		db 0C0h
		db    0
		db  8Ch
		db  1Eh
		db  96h
		db  1Eh
		db    6
		db  39h
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    7
		db  4Dh
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    5
		db  43h
		db  40h
		db    0
		db  91h
		db  1Eh
		db  96h
		db  1Eh
		db    5
		db  40h
		db  40h
		db    0
		db  91h
		db  1Eh
		db  96h
		db  1Eh
		db    0
		db    0
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    6
		db  3Dh
		db 0C0h
		db    0
		db  91h
		db  1Eh
		db  96h
		db  1Eh
		db    5
		db  3Ah
		db  80h
		db    0
		db  91h
		db  1Eh
		db  96h
		db  1Eh
		db    5
		db  37h
		db  80h
		db    0
		db  91h
		db  1Eh
		db  96h
		db  1Eh
		db    8
		db  41h
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh
		db    0
		db    0
		db 0C0h
		db    0
		db  7Ch
		db  1Eh
		db  96h
		db  1Eh

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
