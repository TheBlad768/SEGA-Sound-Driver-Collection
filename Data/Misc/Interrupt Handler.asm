; ---------------------------------------------------------------------------
; Vertical interrupt handler
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

VInt:
		movem.l	d0-a6,-(sp)					; save all the registers to the stack
		bsr.w	Poll_Controller
		move.l	(V_int_Music).w,d0			; load current offset update music to d0
		beq.s	VInt_Equalizer				; skip, if zero
		movea.l	d0,a0						; move current offset update music to a0
		jsr	(a0)								; jump

VInt_Equalizer:
		bsr.s	Equalizer_CopyData
		movem.l	(sp)+,d0-a6					; return saved registers from the stack

HInt:
		rte

; =============== S U B R O U T I N E =======================================

Equalizer_CopyData:
		tst.w	(Driver_SaveLine_Count).w
		bmi.s	+
		stopZ80
		lea	(EQ_Buffer_Keys).w,a2
		lea	(V_int_DriverRAM).w,a3
		move.w	(a3)+,d7		; Number
		movea.l	(a3)+,a1		; RAM
		move.w	(a3),d1		; Size

-		move.b	(a1),1(a2)	; Swap data
		move.b	1(a1),(a2)
		adda.w	d1,a1		; Next channel
		addq.w	#2,a2
		dbf	d7,-
		startZ80
+		rts

; =============== S U B R O U T I N E =======================================

Equalizer_GetRAM:
		move.w	d0,d1
		add.w	d1,d1
		move.w	d1,d2
		add.w	d1,d1
		add.w	d2,d1
		lea	(V_int_DriverRAM).w,a2
		lea	Load_DriverRAM_Index(pc,d1.w),a1
		moveq	#0,d1
		move.b	(a1),d1
		move.w	d1,(a2)+			; Number
		move.l	(a1)+,d1
		andi.l	#$FFFFFF,d1
		movea.l	d1,(a2)+			; RAM
		move.w	(a1)+,(a2)		; Size
		rts
; ---------------------------------------------------------------------------

Load_DriverRAM_Index:	; RAM, Size, Number of channels
		SetDriverRAM Z80_RAM+$14A1, $67, 6-1			; Advanced Z80 Player (ABR)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (AE)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (AE2)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (Aladdin)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (A3)
		SetDriverRAM Z80_RAM+$14A1, $67, 6-1			; Advanced Z80 Player (AWS)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (BR)
		SetDriverRAM Z80_RAM+$1921, $100, 6-1			; RARE
		SetDriverRAM SoundDriverRAM+$D4, $28, 10-1		; GRC (BMD)
		SetDriverRAM SoundDriverRAM+$24, $A4, 10-1		; Ancient Music Driver (SOT)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (BC)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (BM)
		SetDriverRAM Z80_RAM+$1A1D, $80, 6-1			; Konami (Castlevania)
		SetDriverRAM SndDriverDataEastRAM+$133, $60, 6-1	; Data East (CF)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (CZ)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (CZB)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (DBC)
		SetDriverRAM Z80_RAM+$C0C, $48, 6-1			; Terp (Devilish)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (Doom)
		SetDriverRAM Z80_RAM+$B8F, $48, 6-1				; Terp (DD2)
		SetDriverRAM SoundDriverRAM+$1CD, $22, 6-1		; Falcom (DS)
		SetDriverRAM SoundDriverRAM+$1CD, $22, 6-1		; Falcom (DS2)
		SetDriverRAM Z80_RAM+$19B1, $54, 10-1			; Techo (DF)
		SetDriverRAM Z80_RAM+$77, $2C, 6-1				; Wolfteam (EE)
		SetDriverRAM Z80_RAM+$19B1, $54, 10-1			; Techo (EM)
		SetDriverRAM Z80_RAM+$1A00, $100, 6-1			; Varie (ED)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (GCITA)
		SetDriverRAM SndDriverDataEastRAM+$133, $60, 6-1	; Data East (HSH)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (HA2)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (JB)
		SetDriverRAM Z80_RAM+$1811, $30, 10-1			; Cube (LII)
		SetDriverRAM Z80_RAM+$1000, $30, 6-1			; Sunsoft (MG)
		SetDriverRAM Z80_RAM+$DCA, $48, 7-1			; Terp (MM)
		SetDriverRAM Z80_RAM+$1CBB, $40, 9-1			; Westone (MB)
		SetDriverRAM SoundDriverRAM+6, $20, 16-1			; Audios (MT)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (MM)
		SetDriverRAM Z80_RAM+$1430, $50, 10-1			; Capcom (MMGCM)
		SetDriverRAM Z80_RAM+$D18, $48, 7-1				; Terp (MR)
		SetDriverRAM Z80_RAM+$1CBB, $40, 9-1			; Westone (MW)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (MK2)
		SetDriverRAM SndDriverDataEastRAM+$133, $60, 6-1	; Data East (MK5)
		SetDriverRAM SoundDriverRAM+$58, $C, 6-1			; Shaun Hollingworth (MN)
		SetDriverRAM Z80_RAM+$5B2, $40, 6-1				; PLE-PLE (Musha)
		SetDriverRAM SoundDriverRAM+$462, $64, 10-1		; Shigeharu Isoda
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (PDW)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (POP)
		SetDriverRAM Z80_RAM+$14A1, $67, 6-1			; Advanced Z80 Player (RZ)
		SetDriverRAM Z80_RAM+$104, $100, 5-1			; Sound Images (RRR)
		SetDriverRAM Z80_RAM+$1B5B, $60, 10-1			; Konami (RKA)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (SHAQ)
		SetDriverRAM Z80_RAM+$1000, $30, 6-1			; Sunsoft (Shi-Kin-Joh)
		SetDriverRAM SndDriverDataEastRAM+$133, $60, 6-1	; Data East (SHFYZ)
		SetDriverRAM SoundDriverRAM+$D4, $28, 10-1		; GRC (Socket)
		SetDriverRAM Z80_RAM+$77, $2C, 6-1				; Wolfteam (Sol)
		SetDriverRAM SoundDriverRAM+$53, $2C, 10-1		; SMPS M68K (S1)
		SetDriverRAM SoundDriverRAM+$53, $2C, 10-1		; SMPS M68K (S2)
		SetDriverRAM Z80_RAM+$1C27, $2D, 4-1			; SMS Z80 (S1SMS)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (SS)
		SetDriverRAM Z80_RAM+$104, $100, 6-1			; Sound Images (SMC)
		SetDriverRAM SoundDriverRAM, $58, 9-1			; Masakatsu (SH2)
		SetDriverRAM SoundDriverRAM, $58, 9-1			; Masakatsu (SH3)
		SetDriverRAM SoundDriverRAM+$4D, $30, 10-1		; Mucom SMPS (SOR1)
		SetDriverRAM SoundDriverRAM+$1A, $A0, 10-1		; Mucom (SOR2)
		SetDriverRAM SoundDriverRAM+$4D, $30, 10-1		; Mucom SMPS (SOR2)
		SetDriverRAM SoundDriverRAM+$24, $A4, 10-1		; Ancient Music Driver (SOR3)
		SetDriverRAM Z80_RAM+$14A1, $67, 6-1			; Advanced Z80 Player (ST)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (TZ)
		SetDriverRAM Z80_RAM+$19B1, $54, 10-1			; Techo (TF3)
		SetDriverRAM Z80_RAM+$19B1, $54, 10-1			; Techo (TF4)
		SetDriverRAM Z80_RAM+$308, $7A, 6-1				; Trax
		SetDriverRAM Z80_RAM+$104, $100, 6-1			; Sound Images (TH)
		SetDriverRAM Z80_RAM+$106A, $14, 9-1			; Maxmus (TL)
		SetDriverRAM Z80_RAM+$1A5B, $60, 10-1			; Konami (TTA)
		SetDriverRAM SoundDriverRAM+$1E1, $40, 6-1		; Twinkle (TT)
		SetDriverRAM Z80_RAM+$B5C, $48, 7-1				; Terp (CB)
		SetDriverRAM Z80_RAM+$1218, $27, 6-1			; PalSoft (UL)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (Vectorman)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (Vectorman2)
		SetDriverRAM Z80_RAM+$D18, $48, 6-1				; Terp (Verytex)
		SetDriverRAM Z80_RAM+$14A1, $67, 6-1			; Advanced Z80 Player (XM)
		SetDriverRAM Z80_RAM+$1B87, $20, 16-1			; GEMS (ZKS)