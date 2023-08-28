; ---------------------------------------------------------------------------
; Terpsichorean Sound Driver
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndDD2MusicData:		binclude "Sound/Terpsichorean/Music(DD2).bin"
	even

; =============== S U B R O U T I N E =======================================

    if MOMPASS=1
		message " Terpsichorean Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

Terp_LoadData:
		stopZ80
		move.w	#0,d1
		lea	LoadTerpBank_Index(pc),a0
		move.w	(Driver_SaveLine_Count).w,d0
		cmpi.w	#((LoadDriver_Terp2_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		move.w	#1*4,d1
+		cmpi.w	#((LoadDriver_Terp3_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		move.w	#2*4,d1
+		cmpi.w	#((LoadDriver_Terp4_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		move.w	#3*4,d1
+		cmpi.w	#((LoadDriver_Terp5_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		move.w	#4*4,d1
+		cmpi.w	#((LoadDriver_Terp6_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		move.w	#5*4,d1
+		lea	(a0,d1.w),a0
		lea	$104(a1),a1	; Music bank pointer
		move.w	#4-1,d1	; load 4 bytes

-		move.b	(a0)+,(a1)+
		dbf	d1,-
		startZ80
		rts
; ---------------------------------------------------------------------------

LoadTerpBank_Index:
		dc.l SndDevilishMusicData
		dc.l SndDD2MusicData
		dc.l SndMMMusicData
		dc.l SndMRMusicData
		dc.l SndCBMusicData
		dc.l SndVerytexMusicData

; =============== S U B R O U T I N E =======================================

PlaySound_Terp:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$107).l
		move.b	#2,(Z80_RAM+$108).l		; Set play flag.
		startZ80
		enableInts2
		rts
; ---------------------------------------------------------------------------
; Sound Option.
; 0 - Null flag.
; 1 - Fade flag.
; 2 - Play flag.
; 3 - Stop flag.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SoundOption_Terp:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$108).l
		startZ80
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

SndZ80TerpDevilishDriver:	binclude "Sound/Terpsichorean/Z80 Sound Driver(Devilish).bin"
	even
SndZ80TerpVerytexDriver:	binclude "Sound/Terpsichorean/Z80 Sound Driver(Verytex).bin"
	even
SndZ80TerpCBDriver:		binclude "Sound/Terpsichorean/Z80 Sound Driver(CB).bin"
	even
SndZ80TerpMMDriver:	binclude "Sound/Terpsichorean/Z80 Sound Driver(MM).bin"
	even
; ---------------------------------------------------------------------------

		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndVerytexMusicData:		binclude "Sound/Terpsichorean/Music(Verytex).bin"
	even

; =============== S U B R O U T I N E =======================================

SndZ80TerpDD2Driver:	binclude "Sound/Terpsichorean/Z80 Sound Driver(DD2).bin"
	even
; ---------------------------------------------------------------------------
		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndDevilishMusicData:	binclude "Sound/Terpsichorean/Music(Devilish).bin"
	even
; ---------------------------------------------------------------------------
		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndMMMusicData:		binclude "Sound/Terpsichorean/Music(MM).bin"
	even
; ---------------------------------------------------------------------------
		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndCBMusicData:			binclude "Sound/Terpsichorean/Music(CB).bin"
	even
; ---------------------------------------------------------------------------
		align $8000
    if MOMPASS=1
		message "Terpsichorean Sound Driver Music Data ROM offset is $\{*}"
    endif
SndMRMusicData:		binclude "Sound/Terpsichorean/Music(MR).bin"
	even