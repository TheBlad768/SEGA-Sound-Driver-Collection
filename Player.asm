; ===========================================================================
; SEGA Sound Driver Collection
; By TheBlad768 (2017-2019)
; ===========================================================================

; Assembler code:
		cpu 68000
		include "Macrosetup.asm"
		include "Constants.asm"
		include "Variables.asm"
		include "Macros.asm"
		include "Data/Debugger/ErrorHandler/Debugger.asm"
; ---------------------------------------------------------------------------

StartOfROM:
		dc.l $00000000, Security, BusError, AddressError
		dc.l IllegalInstr, ZeroDivide, ChkInstr, TrapvInstr
		dc.l PrivilegeViol, Trace, Line1010Emu, Line1111Emu
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l HInt, ErrorExcept, VInt, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.l ErrorExcept, ErrorExcept, ErrorExcept, ErrorExcept
		dc.b "SEGA GENESIS    "
		dc.b "(C)SEGA 2019.XXX"
		dc.b "SEGA SOUND DRIVER COLLECTION                    "
		dc.b "SEGA SOUND DRIVER COLLECTION                    "
		dc.b "GM T-00000 -00"
		dc.w 0
		dc.b "J               "
		dc.l StartOfROM
		dc.l EndOfROM-1
		dc.l (RAM_start&$FFFFFF)
		dc.l (RAM_start&$FFFFFF)+$FFFF
		dc.b "                                                                "
		dc.b "UJ              "

; ---------------------------------------------------------------------------
; Decompression Subroutine
; ---------------------------------------------------------------------------

		include "Data/Decompression/Enigma Decompression.asm"
		include "Data/Decompression/Kosinski Decompression.asm"

; ---------------------------------------------------------------------------
; VDP Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/VDP.asm"

; ---------------------------------------------------------------------------
; Controllers Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Controller.asm"

; ---------------------------------------------------------------------------
; Interrupt Handler Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Interrupt Handler.asm"

; ---------------------------------------------------------------------------
; DMA Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/DMA.asm"

; ---------------------------------------------------------------------------
; Plane Map To VRAM Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/PlaneMap.asm"

; ---------------------------------------------------------------------------
; Startup System Subroutine
; ---------------------------------------------------------------------------

		include "Data/System Screen/Main.asm"

; ---------------------------------------------------------------------------
; Load Text Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Load Text.asm"

; ---------------------------------------------------------------------------
; Security Subroutine
; ---------------------------------------------------------------------------

		include "Data/Misc/Security.asm"

; ---------------------------------------------------------------------------
; Startup Menu Subroutine
; ---------------------------------------------------------------------------

		include "Data/Player Screen/Main.asm"

; ---------------------------------------------------------------------------
; Art Data
; ---------------------------------------------------------------------------

ArtKos_MainBG:			binclude "Data/Compressed Data/Art - Main BG.bin"
	even
ArtKos_SelectBG:			binclude "Data/Compressed Data/Art - Select BG.bin"
	even
ArtKos_MainEQ:			binclude "Data/Compressed Data/Art - Main EQ.bin"
	even
ArtKos_MainText:		binclude "Data/Compressed Data/Art - Main Text.bin"
	even
ArtKos_SystemText:		binclude "Data/Compressed Data/Art - System Text.bin"
	even
MapEni_MainBG:			binclude "Data/Compressed Data/Map - Main BG.bin"
	even
MapEni_SelectBG:		binclude "Data/Compressed Data/Map - Select BG.bin"
	even
MapEni_MusicBG:		binclude "Data/Compressed Data/Map - Music BG.bin"
	even
PalEni_MainScreen:		binclude "Data/Compressed Data/Palette.bin"
	even

; ---------------------------------------------------------------------------
; Sound Driver Subroutine
; ---------------------------------------------------------------------------

		include "Sound/GRC/Sound Driver (MC68000).asm"
		include "Sound/Wolfteam/Init.asm"
		include "Sound/Falcom/Sound Driver (MC68000).asm"
		include "Sound/Terpsichorean/Init.asm"
		include "Sound/Data East/Sound Driver (MC68000).asm"
		include "Sound/Varie/Init.asm"
		include "Sound/SMPS Mucom/Sound Driver (MC68000).asm"
		include "Sound/Mucom Music Driver (0.85)/Sound Driver (MC68000).asm"
		include "Sound/Trax/Init.asm"
		include "Sound/Isoda Shigeharu/Sound Driver (MC68000).asm"
		include "Sound/Advanced Z80 Player/Init.asm"
		include "Sound/Audio Slave/Sound Driver (MC68000).asm"
		include "Sound/Sound Images/Init.asm"
		include "Sound/Konami(RKA)/Init.asm"
		include "Sound/TechoSoft/Init.asm"
		include "Sound/Rare/Init.asm"
		include "Sound/SMPS M68K/Sonic 2 Clone Driver v2.asm"
		include "Sound/SMS Sound Driver/Init.asm"
		include "Sound/Cube/Init.asm"
		include "Sound/PLE-PLE/Init.asm"
		include "Sound/Shaun Hollingworth/Sound Driver (MC68000).asm"
		include "Sound/PalSoft/Init.asm"
		include "Sound/Capcom/Init.asm"
		include "Sound/Konami(TTA)/Init.asm"
		include "Sound/Masakatsu/Sound Driver (MC68000).asm"
		include "Sound/Twinkle/Sound Driver (MC68000).asm"
		include "Sound/Konami(Castlevania)/Init.asm"
		include "Sound/Westone/Init.asm"
		include "Sound/Sunsoft/Init.asm"
		include "Sound/Ancient Music Driver (1.0)/Sound Driver (MC68000).asm"
		include "Sound/GEMS/Init.asm"
		include "Sound/Maxmus/Sound Driver (MC68000).asm"

; ---------------------------------------------------------------------------
; Music Text Data
; ---------------------------------------------------------------------------

		include "Data/Player Screen/Text Playlist.asm"

; ---------------------------------------------------------------------------
; Error handling module
; ---------------------------------------------------------------------------

		include "Data/Debugger/ErrorHandler/ErrorHandler.asm"

; end of 'ROM'
EndOfROM:

		message "               ROM END OFFSET IS $\{*}"

		END
