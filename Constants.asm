; ===========================================================================
; Address equates
; ===========================================================================

; Z80 addresses
Z80_RAM =					$A00000 ; start of Z80 RAM
Z80_RAM_end =				$A02000 ; end of non-reserved Z80 RAM
Z80_bus_request =			$A11100
Z80_reset =					$A11200
; ---------------------------------------------------------------------------

; SRAM addresses
Security_addr =				$A14000
; ---------------------------------------------------------------------------

; I/O Area
HW_Version =				$A10001
HW_Port_1_Data =			$A10003
HW_Port_2_Data =			$A10005
HW_Expansion_Data =		$A10007
HW_Port_1_Control =			$A10009
HW_Port_2_Control =			$A1000B
HW_Expansion_Control =		$A1000D
HW_Port_1_TxData =			$A1000F
HW_Port_1_RxData =			$A10011
HW_Port_1_SCtrl =			$A10013
HW_Port_2_TxData =			$A10015
HW_Port_2_RxData =			$A10017
HW_Port_2_SCtrl =			$A10019
HW_Expansion_TxData =		$A1001B
HW_Expansion_RxData =		$A1001D
HW_Expansion_SCtrl =		$A1001F
; ---------------------------------------------------------------------------

; VDP addresses
VDP_data_port =				$C00000
VDP_control_port =			$C00004
PSG_input =					$C00011
; ---------------------------------------------------------------------------

; Buttons bit numbers
button_Up:					EQU	0
button_Down:				EQU	1
button_Left:					EQU	2
button_Right:				EQU	3
button_B:					EQU	4
button_C:					EQU	5
button_A:					EQU	6
button_Start:					EQU	7
; ---------------------------------------------------------------------------

; Buttons masks
JoyUp:						EQU	1
JoyDown:					EQU	2
JoyUpDown:					EQU	3
JoyLeft:						EQU	4
JoyRight:					EQU	8
JoyLeftRight:					EQU	$C
JoyCursor:					EQU	$F
JoyB:						EQU	$10
JoyC:						EQU	$20
JoyA:						EQU	$40
JoyAB:						EQU	$50
JoyAC:						EQU	$60
JoyABC:						EQU	$70
JoyStart:						EQU	$80
JoyBStart:					EQU	$90
JoyABCS:					EQU	$F0
; ---------------------------------------------------------------------------

; VRAM data
vram_fg:						= $E000 ; foreground namespace
vram_window:				= $E000 ; window namespace
vram_bg:					= $E000 ; background namespace
vram_sprites:					= $D400 ; sprite table
vram_hscroll:					= $D000 ; horizontal scroll table