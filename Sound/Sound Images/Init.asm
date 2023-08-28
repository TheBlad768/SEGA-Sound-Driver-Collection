; ---------------------------------------------------------------------------
; Sound Images v1.2 and v1.5
; ---------------------------------------------------------------------------

			align $8000
   if MOMPASS=1
		message " Sound Images Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicDataImagesTH:		binclude "Sound/Sound Images/Music Data(TH).bin"
	even
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Sound Images Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

Images_LoadData:
		stopZ80
		waitZ80time $BF
		move.w	(Driver_SaveLine_Count).w,d1
		move.l	#MusicDataImagesTH,d0		; Music Data offset(Only $8000, $10000, $18000, etc...)
		cmpi.w	#((LoadDriver_ImagesRRR_Index-LoadDrvData_Index)/$10),d1
		bne.s	+
		move.l	#MusicDataImagesRRR,d0		; Music Data offset(Only $8000, $10000, $18000, etc...)
+		cmpi.w	#((LoadDriver_ImagesSMC_Index-LoadDrvData_Index)/$10),d1
		bne.s	+
		move.l	#MusicDataImagesSM,d0		; Music Data offset(Only $8000, $10000, $18000, etc...)
+		move.b	d0,$87(a1)
		lsr.l	#8,d0
		move.b	d0,$88(a1)
		lsr.l	#8,d0
		move.b	d0,$89(a1)
		lsr.l	#8,d0
		move.b	d0,$8A(a1)
		waitZ80time $BF
		startZ80
		rts
; End of function SndZ80DrvInit

; =============== S U B R O U T I N E =======================================

PlayImagesSound:
		disableInts2
		stopZ80
		move.b	d0,(Z80_RAM+$80).l
		move.b	#0,(Z80_RAM+$81).l
		startZ80
		enableInts2
		rts
; End of function PlayImagesSound

; =============== S U B R O U T I N E =======================================

Z80ImagesDriverRRR:		binclude "Sound/Sound Images/Sound Images Driver(RRR).bin"
	even
Z80ImagesDriverTH:		binclude "Sound/Sound Images/Sound Images Driver(TH).bin"
	even
; ---------------------------------------------------------------------------

			align $8000
   if MOMPASS=1
		message "Sound Images Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicDataImagesSM:		binclude "Sound/Sound Images/Music Data(SM).bin"
	even
			align $8000
   if MOMPASS=1
		message "Sound Images Sound Driver Music Data ROM offset is $\{*}"
    endif
MusicDataImagesRRR:		binclude "Sound/Sound Images/Music Data(RRR).bin"
	even