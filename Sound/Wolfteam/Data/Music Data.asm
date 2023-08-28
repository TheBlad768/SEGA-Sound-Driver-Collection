; ===========================================================================
; Music Bank
; ===========================================================================

   if MOMPASS=1
		message " Wolfteam Sound Driver Music Data ROM offset is $\{*}"
    endif

MusicWolfteam_Index: offsetTable
		offsetTableEntry.l Mus_WolfSol01	; $01
		offsetTableEntry.l Mus_WolfSol02	; $02
		offsetTableEntry.l Mus_WolfSol03	; $03
		offsetTableEntry.l Mus_WolfSol04	; $04
		offsetTableEntry.l Mus_WolfSol05	; $05
		offsetTableEntry.l Mus_WolfSol06	; $06
		offsetTableEntry.l Mus_WolfSol07	; $07
		offsetTableEntry.l Mus_WolfSol08	; $08
		offsetTableEntry.l Mus_WolfSol09	; $09
		offsetTableEntry.l Mus_WolfSol0A	; $0A
		offsetTableEntry.l Mus_WolfSol0B	; $0B
		offsetTableEntry.l Mus_WolfSol0C	; $0C
		offsetTableEntry.l Mus_WolfSol0D	; $0D
		offsetTableEntry.l Mus_WolfSol0E	; $0E	; This slot ignores the playback of samples
		offsetTableEntry.l Mus_WolfSol0F	; $0F
		offsetTableEntry.l Mus_WolfSol10	; $10
		offsetTableEntry.l Mus_WolfSol11	; $11
; ---------------------------------------------------------------------------

Mus_WolfSol01:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/1.bin"
Mus_WolfSol02:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/2.bin"
Mus_WolfSol03:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/3.bin"
Mus_WolfSol04:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/4.bin"
Mus_WolfSol05:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/5.bin"
Mus_WolfSol06:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/6.bin"
Mus_WolfSol07:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/7.bin"
Mus_WolfSol08:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/8.bin"
Mus_WolfSol09:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/9.bin"
Mus_WolfSol0A:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/A.bin"
Mus_WolfSol0B:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/B.bin"
Mus_WolfSol0C:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/C.bin"
Mus_WolfSol0D:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/D.bin"
Mus_WolfSol0E:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/E.bin"
Mus_WolfSol0F:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/F.bin"
Mus_WolfSol10:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/10.bin"
Mus_WolfSol11:	binclude "Sound/Wolfteam/Data/Music/Sol-Deace/11.bin"
	even

	align $8000

; ===========================================================================
; Music Bank 2
; ===========================================================================

   if MOMPASS=1
		message " Wolfteam Sound Driver Music Data ROM offset is $\{*}"
    endif

MusicWolfteam2_Index: offsetTable
		offsetTableEntry.l Mus_WolfEE01	; $01
		offsetTableEntry.l Mus_WolfEE02	; $02
		offsetTableEntry.l Mus_WolfEE03	; $03
		offsetTableEntry.l Mus_WolfEE04	; $04
		offsetTableEntry.l Mus_WolfEE05	; $05
		offsetTableEntry.l Mus_WolfEE06	; $06
		offsetTableEntry.l Mus_WolfEE07	; $07
		offsetTableEntry.l Mus_WolfEE08	; $08
		offsetTableEntry.l Mus_WolfEE09	; $09
		offsetTableEntry.l Mus_WolfEE0A	; $0A
		offsetTableEntry.l Mus_WolfEE0B	; $0B
		offsetTableEntry.l Mus_WolfEE0C	; $0C
		offsetTableEntry.l Mus_WolfEE0D	; $0D
		offsetTableEntry.l Mus_WolfEE0E	; $0E	; This slot ignores the playback of samples
		offsetTableEntry.l Mus_WolfEE0F	; $0F
		offsetTableEntry.l Mus_WolfEE10	; $10
		offsetTableEntry.l Mus_WolfEE11	; $11
; ---------------------------------------------------------------------------

Mus_WolfEE01:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/1.bin"
Mus_WolfEE02:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/2.bin"
Mus_WolfEE03:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/3.bin"
Mus_WolfEE04:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/4.bin"
Mus_WolfEE05:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/5.bin"
Mus_WolfEE06:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/6.bin"
Mus_WolfEE07:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/7.bin"
Mus_WolfEE08:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/8.bin"
Mus_WolfEE09:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/9.bin"
Mus_WolfEE0A:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/A.bin"
Mus_WolfEE0B:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/B.bin"
Mus_WolfEE0C:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/C.bin"
Mus_WolfEE0D:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/D.bin"
Mus_WolfEE0E:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/E.bin"
Mus_WolfEE0F:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/F.bin"
Mus_WolfEE10:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/10.bin"
Mus_WolfEE11:	binclude "Sound/Wolfteam/Data/Music/EarnestEvans/11.bin"
	even