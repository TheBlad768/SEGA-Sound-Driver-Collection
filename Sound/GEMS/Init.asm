
   if MOMPASS=1
		message "GEMS Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

Gems_LoadData:
		link	a6,#0
		moveq	#-1,d0
		move.l	d0,-(sp)
		jsr	Gems_Put_CByte(pc)
		moveq	#11,d0
		move.l	d0,-(sp)
		jsr	Gems_Put_CByte(pc)
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	GEMS_LoadData_Index(pc),a1
		move.b	GEMS_LoadData_Line(pc,d0.w),d0
		beq.s	+
		subq.b	#1,d0

-		lea	$10(a1),a1
		dbf	d0,-
+		move.l	(a1)+,-(sp)
		jsr	Gems_Put_Ptr(pc)
		move.l	(a1)+,-(sp)
		jsr	Gems_Put_Ptr(pc)
		move.l	(a1)+,-(sp)
		jsr	Gems_Put_Ptr(pc)
		move.l	(a1)+,-(sp)
		jsr	Gems_Put_Ptr(pc)
		unlk	a6
		rts
; ---------------------------------------------------------------------------

GEMS_LoadData_Line:
	rept ((LoadDriver_GEMSAB_Index-LoadDrvData_Index)/$10)
		dc.b 0
	endm
		dc.b 0	; AB
	rept ((LoadDriver_GEMSAB2_Index-LoadDriver_GEMSAB_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; AB2
	rept ((LoadDriver_GEMSAladdin_Index-LoadDriver_GEMSAB2_Index)/$10)-1
		dc.b 0
	endm
		dc.b 2	; Aladdin
	rept ((LoadDriver_GEMSBR_Index-LoadDriver_GEMSAladdin_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; BR
	rept ((LoadDriver_GEMSBC_Index-LoadDriver_GEMSBR_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; BC
	rept ((LoadDriver_GEMSCZ_Index-LoadDriver_GEMSBC_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; CZ
	rept ((LoadDriver_GEMSCZB_Index-LoadDriver_GEMSCZ_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; CZB
	rept ((LoadDriver_GEMSDBC_Index-LoadDriver_GEMSCZB_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; DBC
	rept ((LoadDriver_GEMSDoom_Index-LoadDriver_GEMSDBC_Index)/$10)-1
		dc.b 0
	endm
		dc.b 2	; DBC
	rept ((LoadDriver_GEMSGCITA_Index-LoadDriver_GEMSDoom_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; GCITA
	rept ((LoadDriver_GEMSHA2_Index-LoadDriver_GEMSGCITA_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; HA2
	rept ((LoadDriver_GEMSPDW_Index-LoadDriver_GEMSHA2_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; PDW
	rept ((LoadDriver_GEMSPOP_Index-LoadDriver_GEMSPDW_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; POP
	rept ((LoadDriver_GEMSSHAQ_Index-LoadDriver_GEMSPOP_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; SHAQ
	rept ((LoadDriver_GEMSSS_Index-LoadDriver_GEMSSHAQ_Index)/$10)-1
		dc.b 0
	endm
		dc.b 0	; SS
	rept ((LoadDriver_GEMSTZ_Index-LoadDriver_GEMSSS_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; TZ
	rept ((LoadDriver_GEMSVectorman_Index-LoadDriver_GEMSTZ_Index)/$10)-1
		dc.b 0
	endm
		dc.b 2	; Vectorman
	rept ((LoadDriver_GEMSVectorman2_Index-LoadDriver_GEMSVectorman_Index)/$10)-1
		dc.b 0
	endm
		dc.b 2	; Vectorman2
	rept ((LoadDriver_GEMSZKS_Index-LoadDriver_GEMSVectorman2_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; ZKS
	even
GEMS_LoadData_Index:
		dc.l Load_Instruments		; 0
		dc.l Load_Envelopes		; 4
		dc.l Load_Sequences		; 8
		dc.l Load_Samples		; C
GEMS_LoadData2_Index:
		dc.l Load_Instruments2	; 10
		dc.l Load_Envelopes2		; 14
		dc.l Load_Sequences2		; 18
		dc.l Load_Samples2		; 1C
GEMS_LoadData3_Index:
		dc.l Load_Instruments3	; 10
		dc.l Load_Envelopes2		; 14
		dc.l Load_Sequences3		; 18
		dc.l Load_Samples3		; 1C
; ---------------------------------------------------------------------------

Gems_Put_CByte:
		jsr	Std_Setup(pc)
		move.l	8(a6),d0				; get command byte into d0
		jsr	Std_Write(pc)
		jmp	Std_Cleanup(pc)
; ---------------------------------------------------------------------------

Gems_Put_Ptr:
		jsr	Std_Setup(pc)
		move.l	8(a6),d0				; get ptr into d0
		jsr	Std_Write(pc)
		asr.l	#8,d0
		jsr	Std_Write(pc)
		asr.l	#8,d0
		jsr	Std_Write(pc)
		jmp	Std_Cleanup(pc)
; ---------------------------------------------------------------------------

Std_Setup:
		movea.l	(sp)+,a0				; get the return addr
		link	a6,#0					; set up the link
		movem.l	d1/a1,-(sp)			; save some regs
		move.l	a0,-(sp)				; push the return addr
		stopZ80
		lea	(Z80_RAM+$36).l,a0		; a0 points to wptr
		lea	(Z80_RAM+$1B40).l,a1	; a1 points to fifo
		move.b	(a0),d1				; d1 is write index into fifo
		ext.w	d1					; extend to 16 bits
		rts
; ---------------------------------------------------------------------------

Std_Cleanup:
		startZ80
		movem.l	(sp)+,d1/a1
		unlk	a6
		rts
; ---------------------------------------------------------------------------

Std_CMD_Write:
		move.b	#-1,(a1,d1.w)			; write into fifo
		addq.b	#1,d1				; increment write index mod 64
		andi.b	#$3F,d1

Std_Write:
		move.b	d0,(a1,d1.w)			; write into fifo
		addq.b	#1,d1				; increment write index mod 64
		andi.b	#$3F,d1
		move.b	d1,(a0)				; write it back
		rts

; =============== S U B R O U T I N E =======================================

Gems_Start_Song:
		jsr	Std_Setup(pc)
		moveq	#$10,d0
		jsr	Std_CMD_Write(pc)
		move.l	8(a6),d0
		jsr	Std_Write(pc)
		jmp	Std_Cleanup(pc)
; ---------------------------------------------------------------------------

Gems_Stop_All:
		jsr	Std_Setup(pc)
		moveq	#$16,d0
		jsr	Std_CMD_Write(pc)
		jmp	Std_Cleanup(pc)

; =============== S U B R O U T I N E =======================================

Play_GEMS_Music:
		disableInts2
		movem.l	d0/a0,-(sp)
		jsr	Gems_Stop_All(pc)
		jsr	Gems_Start_Song(pc)
		movem.l	(sp)+,d0/a0
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Z80_GEMS_SoundDriver:		binclude "Sound/GEMS/GEMS.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Envelopes Data ROM offset is $\{*}"
    endif
Load_Envelopes:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank1/Music/envelopes.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Envelopes2 Data ROM offset is $\{*}"
    endif
Load_Envelopes2:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank2/Music/envelopes.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Instruments Data ROM offset is $\{*}"
    endif
Load_Instruments:			binclude "Sound/GEMS/Other/Gems Combine/Data_Bank1/Music/patches.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Instruments2 Data ROM offset is $\{*}"
    endif
Load_Instruments2:			binclude "Sound/GEMS/Other/Gems Combine/Data_Bank2/Music/patches.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Instruments3 Data ROM offset is $\{*}"
    endif
Load_Instruments3:			binclude "Sound/GEMS/Other/Gems Combine/Data_Bank3/Music/patches.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Sequences Data ROM offset is $\{*}"
    endif
Load_Sequences:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank1/Music/sequences.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Sequences2 Data ROM offset is $\{*}"
    endif
Load_Sequences2:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank2/Music/sequences.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Sequences3 Data ROM offset is $\{*}"
    endif
Load_Sequences3:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank3/Music/sequences.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Samples Data ROM offset is $\{*}"
    endif
Load_Samples:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank1/Music/samples.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Samples2 Data ROM offset is $\{*}"
    endif
Load_Samples2:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank2/Music/samples.bin"
	even
   if MOMPASS=1
		message " GEMS Sound Driver Samples2 Data ROM offset is $\{*}"
    endif
Load_Samples3:				binclude "Sound/GEMS/Other/Gems Combine/Data_Bank3/Music/samples.bin"
	even