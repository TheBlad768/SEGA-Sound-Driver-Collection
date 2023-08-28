
; =============== S U B R O U T I N E =======================================

Equalizer_Process:
		lea	(EQ_Buffer_Values).w,a0
		lea	EQ_Buffer_Keys-EQ_Buffer_Values(a0),a1
		movea.w	(Driver_Equalizer_Pointer).w,a2
		moveq	#16-1,d7

Equalizer_CurrentKeys:
		jmp	(a2)
; ---------------------------------------------------------------------------

Equalizer_CurrentKeys_Index: offsetTable
		offsetTableEntry.w Do_AdvancedKey			; 0 (Advanced Z80 Player ABR)
		offsetTableEntry.w Do_GEMSKey			; 1 (GEMS AB)
		offsetTableEntry.w Do_GEMSKey			; 2 (GEMS AB2)
		offsetTableEntry.w Do_GEMSKey			; 3 (GEMS Aladdin)
		offsetTableEntry.w Do_RareShaunKey		; 4 (Shaun Hollingworth A3)
		offsetTableEntry.w Do_AdvancedKey			; 5 (Advanced Z80 Player AWS)
		offsetTableEntry.w Do_GEMSKey			; 6 (GEMS BR)
		offsetTableEntry.w Do_RareShaunKey		; 7 (RARE BDD)
		offsetTableEntry.w Do_IsodaKey				; 8 (GRC BMD)
		offsetTableEntry.w Do_AncientMucomKey	; 9 (Ancient Music Driver SOT)
		offsetTableEntry.w Do_GEMSKey			; A (GEMS BC)
		offsetTableEntry.w Do_RareShaunKey		; B (Shaun Hollingworth BM)
		offsetTableEntry.w Do_ImagesKey			; C (Konami Castlevania)
		offsetTableEntry.w Do_RareShaunKey		; D (Data East CF)
		offsetTableEntry.w Do_GEMSKey			; E (GEMS CZ)
		offsetTableEntry.w Do_GEMSKey			; F (GEMS CZB)
		offsetTableEntry.w Do_GEMSKey			; 10 (GEMS DBC)
		offsetTableEntry.w Do_IsodaKey				; 11 (Terp Devilish)
		offsetTableEntry.w Do_GEMSKey			; 12 (GEMS Doom)
		offsetTableEntry.w Do_IsodaKey				; 13 (Terp DD2)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 14 (Falcom DS)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 15 (Falcom DS2)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 16 (Techo DF)
		offsetTableEntry.w Do_IsodaKey				; 17 (Wolfteam EE)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 18 (Techo EM)
		offsetTableEntry.w Do_AncientMucomKey	; 19 (Varie ED)
		offsetTableEntry.w Do_GEMSKey			; 1A (GEMS GCITA)
		offsetTableEntry.w Do_RareShaunKey		; 1B (Data East HSH)
		offsetTableEntry.w Do_GEMSKey			; 1C (GEMS HA2)
		offsetTableEntry.w Do_RareShaunKey		; 1D (Shaun Hollingworth JB)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 1E (Cube LII)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 1F (Sunsoft MG)
		offsetTableEntry.w Do_IsodaKey				; 20 (Terp MM)
		offsetTableEntry.w Do_WestoneKey			; 21 (Westone MB)
		offsetTableEntry.w Do_AudiosKey			; 22 (Audios MT)
		offsetTableEntry.w Do_RareShaunKey		; 23 (Shaun Hollingworth MM)
		offsetTableEntry.w Do_RareShaunKey		; 24 (Capcom MMGCM)
		offsetTableEntry.w Do_IsodaKey				; 25 (Terp MR)
		offsetTableEntry.w Do_WestoneKey			; 26 (Westone MW)
		offsetTableEntry.w Do_RareShaunKey		; 27 (Shaun Hollingworth MK2)
		offsetTableEntry.w Do_RareShaunKey		; 28 (Data East MK5)
		offsetTableEntry.w Do_RareShaunKey		; 29 (Shaun Hollingworth MN)
		offsetTableEntry.w Do_RareShaunKey		; 2A (PLE-PLE Musha)
		offsetTableEntry.w Do_IsodaKey				; 2B (Shigeharu Isoda)
		offsetTableEntry.w Do_GEMSKey			; 2C (GEMS PDW)
		offsetTableEntry.w Do_GEMSKey			; 2D (GEMS POP)
		offsetTableEntry.w Do_AdvancedKey			; 2E (Advanced Z80 Player RZ)
		offsetTableEntry.w Do_ImagesKey			; 2F (Sound Images RRR)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 30 (Konami RKA)
		offsetTableEntry.w Do_GEMSKey			; 31 (GEMS SHAQ)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 32 (Sunsoft Shi-Kin-Joh)
		offsetTableEntry.w Do_RareShaunKey		; 33 (Data East SHFYZ)
		offsetTableEntry.w Do_IsodaKey				; 34 (GRC Socket)
		offsetTableEntry.w Do_IsodaKey				; 35 (Wolfteam Sol)
		offsetTableEntry.w Do_IsodaKey				; 36 (SMPS M68K S1)
		offsetTableEntry.w Do_IsodaKey				; 37 (SMPS M68K S2)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 38 (SMS Z80 S1SMS)
		offsetTableEntry.w Do_GEMSKey			; 39 (GEMS SS)
		offsetTableEntry.w Do_ImagesKey			; 3A (Sound Images SMC)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 3B (Masakatsu SH2)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 3C (Masakatsu SH3)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 3D (Mucom SMPS SOR1)
		offsetTableEntry.w Do_AncientMucomKey	; 3E (Mucom SOR2)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 3F (Mucom SMPS SOR1)
		offsetTableEntry.w Do_AncientMucomKey	; 40 (Ancient Music Driver SOR3)
		offsetTableEntry.w Do_AdvancedKey			; 41 (Advanced Z80 Player ST)
		offsetTableEntry.w Do_GEMSKey			; 42 (GEMS TZ)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 43 (Techo TF3)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 44 (Techo TF4)
		offsetTableEntry.w Do_AncientMucomKey	; 45 (Trax)
		offsetTableEntry.w Do_ImagesKey			; 46 (Sound Images TH)
		offsetTableEntry.w Do_RareShaunKey		; 47 (Maxmus TL)
		offsetTableEntry.w Do_SMPSMucomKonKey	; 48 (Konami TTA)
		offsetTableEntry.w Do_RareShaunKey		; 49 (Twinkle TT)
		offsetTableEntry.w Do_IsodaKey				; 4A (Terp CB)
		offsetTableEntry.w Do_RareShaunKey		; 4B (PalSoft UL)
		offsetTableEntry.w Do_GEMSKey			; 4C (GEMS Vectorman)
		offsetTableEntry.w Do_GEMSKey			; 4D (GEMS Vectorman2)
		offsetTableEntry.w Do_IsodaKey				; 4E (Terp Verytex)
		offsetTableEntry.w Do_AdvancedKey			; 4F (Advanced Z80 Player XM)
		offsetTableEntry.w Do_GEMSKey			; 50 (GEMS ZKS)
; ---------------------------------------------------------------------------

Do_AdvancedKey:
		tst.w (a1)
		beq.s	KeyOff
		cmpi.w	#$FF00,(a1)
		bge.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_AncientMucomKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.b	#6,(a1)
		bcs.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_AudiosKey:
		tst.b (a1)
		bpl.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_GEMSKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.w	#-6,(a1)
		bge.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_RareShaunKey:
		tst.b (a1)
		beq.s	KeyOff
		bra.s	KeyOn
; ---------------------------------------------------------------------------

Do_SMPSMucomKonKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.b	#8,(a1)
		bcs.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_IsodaKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.b	#12,(a1)
		bcs.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_WestoneKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.b	#-12,(a1)
		bge.s	KeyOn
		bra.s	KeyOff
; ---------------------------------------------------------------------------

Do_ImagesKey:
		tst.b (a1)
		beq.s	KeyOff
		cmpi.b	#4,(a1)
		bcs.s	KeyOn

KeyOff:
		subq.b	#2*4,(a0)
		cmpi.b	#2,(a0)
		bge.s	NextKey
		move.b	#2,(a0)
		bra.s	NextKey
; ---------------------------------------------------------------

KeyOn:
		addq.b	#2*4,(a0)
		cmpi.b	#80,(a0)
		ble.s		NextKey
		move.b	#80,(a0)

NextKey:
		addq.w	#1,a0
		addq.w	#2,a1
		dbf	d7,Equalizer_CurrentKeys
		rts

; =============== S U B R O U T I N E =======================================

Equalizer_Update:
		lea	(EQ_Buffer_Values).w,a1
		locVRAM	$E686,d1
		move.l	#$800000,d2
		move.w	#$6100,d3	; VRAM
		moveq	#8*9,d7

DoVertLine:
		movea.w	a1,a0
		move.l	d1,VDP_control_port-VDP_control_port(a5)
		moveq	#16-1,d6

DoChannel:
		moveq	#0,d0
		move.b	(a0)+,d0
		sub.b	d7,d0
		bpl.s	+
		moveq	#0,d0
		bra.s	DispTile
; ---------------------------------------------------------------
+		cmpi.b	#8,d0
		bcs.s	+
		moveq	#4,d0
		bra.s	DispTile
; ---------------------------------------------------------------
+		andi.w	#6,d0
		move.w	EQ_Tiles(pc,d0.w),d0

DispTile:
		add.w	d3,d0
		move.l	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d6,DoChannel
		add.l	d2,d1
		subq.w	#8,d7
		bpl.s	DoVertLine
		rts
; ---------------------------------------------------------------

EQ_Tiles:	dc.w 0, 1, 2, 3