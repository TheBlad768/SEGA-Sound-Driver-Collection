; ---------------------------------------------------------------------------
; Object Status Table offsets
; ---------------------------------------------------------------------------

; sign-extends a 32-bit integer to 64-bit
; all RAM addresses are run through this function to allow them to work in both 16-bit and 32-bit addressing modes
ramaddr function x,(-(x&$80000000)<<1)|x

; Variables (v) and Flags (f)
	phase	ramaddr($FFFF0000)	; Pretend we're in the RAM
RAM_Start:

; Music
SoundDriverMusicRAM:		ds.b $7000

; Sound Driver
SoundDriverRAM:				ds.b $1000				; Sound Driver RAM
SoundDriverRAM_End

; Equalizer
EQ_Buffer_Values:			ds.b 16					; $10 bytes (Equalizer data)
EQ_Buffer_Values_End
EQ_Buffer_Keys:				ds.w 16					; $20 bytes (Driver data)
EQ_Buffer_Keys_End

; Controller
Ctrl_1:
Ctrl_1_held:					ds.b 1
Ctrl_1_pressed:				ds.b 1

; Driver
Driver_Control_Text:			ds.w 1
Driver_Line_Count:			ds.w 1
Driver_SaveLine_Count:		ds.w 1
Driver_CurrentLine_Count:		ds.w 1
MusicPlay_Count:				ds.w 1
MusicPlay_Current_Count:		ds.w 1
MusicPlay_SaveCurrent_Count:	ds.w 1
Driver_Equalizer_Pointer:		ds.w 1
Driver_MusicText_Pointer:		ds.l 1
Driver_MusicPlay_Pointer:		ds.w 1

; Plane Buffer
EnigmaDec_Buffer:			ds.b $4C

; Misc
V_int_DriverRAM:			ds.l 2					; For Equalizer
V_int_Music:					ds.l 1					; For Update Music
Graphics_flags:				ds.b 1

	if * > 0	; Don't declare more space than the RAM can contain!
		fatal "The RAM variable declarations are too large by $\{*} bytes."
	endif

	dephase		; Stop pretending
	!org	0		; Reset the program counter