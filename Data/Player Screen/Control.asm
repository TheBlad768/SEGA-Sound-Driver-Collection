
; =============== S U B R O U T I N E =======================================

Control_Text:
		move.b	d1,-(sp)
		moveq	#0,d4
		move.w	(Driver_Control_Text).w,d3
		andi.b	#JoyUpDown,d1
		beq.s	+
		move.w	#$10,d3
		bra.s	++
+		move.b	(Ctrl_1_held).w,d1
		andi.b	#JoyUpDown,d1
		beq.s	Control_Text_Wait
		subq.w	#1,d3
		bpl.s	Control_Text_Wait
		move.w	#3,d3
+		move.b	(a1)+,d4
		btst	d4,d1
		beq.s	+
		subq.w	#1,d0
		bpl.s	+
		move.w	d2,d0
+		move.b	(a1),d4
		btst	d4,d1
		beq.s	Control_Text_Wait
		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		Control_Text_Wait
		moveq	#0,d0

Control_Text_Wait:
		move.w	d3,(Driver_Control_Text).w
		move.b	(sp)+,d1

Control_Text_Return:
		rts
; ---------------------------------------------------------------------------

Control_UpDown:	dc.b button_Up, button_Down
Control_DownUp:	dc.b button_Down, button_Up

; =============== S U B R O U T I N E =======================================

Current_Music_Control:
		move.w	(MusicPlay_Count).w,d0
		btst	#button_Left,d1
		beq.s	+
		subq.w	#1,d0
		bpl.s	+
		move.w	d2,d0
+		btst	#button_Right,d1
		beq.s	+
		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		+
		moveq	#0,d0
+		lea	Control_DownUp(pc),a1
		bsr.s	Control_Text
		move.w	d0,(MusicPlay_Count).w
		btst	#button_B,d1
		beq.s	Control_Text_Return

Load_DriverText_StopMusic:
		moveq	#2,d2
		lea	Load_DriverText_StopMusic_Index(pc),a1
		bra.s	Load_DriverText_Play
; ---------------------------------------------------------------------------

Load_DriverText_StartMusic:
		moveq	#3,d2
		lea	LoadPlaySound_Index+4(pc),a1

Load_DriverText_Play:
		move.w	(Driver_SaveLine_Count).w,d0
		lsl.w	d2,d0
		lea	(a1,d0.w),a1
		moveq	#0,d0
		move.b	(a1),d0
		move.l	(a1),d2
		andi.l	#$FFFFFF,d2
		movea.l	d2,a0
		jmp	(a0)
; ---------------------------------------------------------------------------

Load_DriverText_StopMusic_Index:
		SetPlay_PlaySound 0,PlaySound_Advanced		; 0 (Advanced Z80 Player ABR)
		SetPlay_PlaySound 0,Gems_Stop_All			; 1 (GEMS AB)
		SetPlay_PlaySound 0,Gems_Stop_All			; 2 (GEMS AB2)
		SetPlay_PlaySound 0,Gems_Stop_All			; 3 (GEMS Aladdin)
		SetPlay_PlaySound 0,PlayShaunSound			; 4 (Shaun Hollingworth A3)
		SetPlay_PlaySound 0,PlaySound_Advanced		; 5 (Advanced Z80 Player AWS)
		SetPlay_PlaySound 0,Gems_Stop_All			; 6 (GEMS BR)
		SetPlay_PlaySound 3,PlaySound_Rare			; 7 (RARE BDD)
		SetPlay_PlaySound 0,PlaySound_GRC			; 8 (GRC BMD)
		SetPlay_PlaySound 0,Play_Sound_Ancient		; 9 (Ancient Music Driver SOT)
		SetPlay_PlaySound 0,Gems_Stop_All			; A (GEMS BC)
		SetPlay_PlaySound 0,PlayShaunSound			; B (Shaun Hollingworth BM)
		SetPlay_PlaySound $F1,PlayKonamiSound		; C (Konami Castlevania)
		SetPlay_PlaySound 0,PlaySound_DataEast		; D (Data East CF)
		SetPlay_PlaySound 0,Gems_Stop_All			; E (GEMS CZ)
		SetPlay_PlaySound 0,Gems_Stop_All			; F (GEMS CZB)
		SetPlay_PlaySound 0,Gems_Stop_All			; 10 (GEMS DBC)
		SetPlay_PlaySound 3,SoundOption_Terp			; 11 (Terp Devilish)
		SetPlay_PlaySound 0,Gems_Stop_All			; 12 (GEMS Doom)
		SetPlay_PlaySound 3,SoundOption_Terp			; 13 (Terp DD2)
		SetPlay_PlaySound 0,Load_PlayMusic_Falcom	; 14 (Falcom DS)
		SetPlay_PlaySound 0,Load_PlayMusic_Falcom	; 15 (Falcom DS2)
		SetPlay_PlaySound 0,SoundStopFade_Techo		; 16 (Techo DF)
		SetPlay_PlaySound $FF,StopWolfteamSound		; 17 (Wolfteam EE)
		SetPlay_PlaySound 0,SoundStopFade_Techo		; 18 (Techo EM)
		SetPlay_PlaySound 0,StopSound_Varie			; 19 (Varie ED)
		SetPlay_PlaySound 0,Gems_Stop_All			; 1A (GEMS GCITA)
		SetPlay_PlaySound 0,PlaySound_DataEast		; 1B (Data East HSH)
		SetPlay_PlaySound 0,Gems_Stop_All			; 1C (GEMS HA2)
		SetPlay_PlaySound 0,PlayShaunSound			; 1D (Shaun Hollingworth JB)
		SetPlay_PlaySound $30,PlayCubeSound			; 1E (Cube LII)
		SetPlay_PlaySound $FF,PlaySunsoftSound		; 1F (Sunsoft MG)
		SetPlay_PlaySound 3,SoundOption_Terp			; 20 (Terp MM)
		SetPlay_PlaySound $FF,PlaySound2_Westone		; 21 (Westone MB)
		SetPlay_PlaySound 0,StopSound_Audios			; 22 (Audios MT)
		SetPlay_PlaySound 0,PlayShaunSound			; 23 (Shaun Hollingworth MM)
		SetPlay_PlaySound $F0,StopCapcomSound		; 24 (Capcom MMGCM)
		SetPlay_PlaySound 3,SoundOption_Terp			; 25 (Terp MR)
		SetPlay_PlaySound $FF,PlaySound2_Westone		; 26 (Westone MW)
		SetPlay_PlaySound 0,PlayShaunSound			; 27 (Shaun Hollingworth MK2)
		SetPlay_PlaySound 0,PlaySound_DataEast		; 28 (Data East MK5)
		SetPlay_PlaySound 0,PlayShaunSound			; 29 (Shaun Hollingworth MN)
		SetPlay_PlaySound $FF,PlaySound_Musha		; 2A (PLE-PLE Musha)
		SetPlay_PlaySound 0,PlaySound_Isoda			; 2B (Shigeharu Isoda)
		SetPlay_PlaySound 0,Gems_Stop_All			; 2C (GEMS PDW)
		SetPlay_PlaySound 0,Gems_Stop_All			; 2D (GEMS POP)
		SetPlay_PlaySound 0,PlaySound_Advanced		; 2E (Advanced Z80 Player RZ)
		SetPlay_PlaySound $80,PlayImagesSound		; 2F (Sound Images RRR)
		SetPlay_PlaySound $FF,PlaySound_Kon2			; 30 (Konami RKA)
		SetPlay_PlaySound 0,Gems_Stop_All			; 31 (GEMS SHAQ)
		SetPlay_PlaySound $FF,PlaySunsoftSound		; 32 (Sunsoft Shi-Kin-Joh)
		SetPlay_PlaySound 0,PlaySound_DataEast		; 33 (Data East SHFYZ)
		SetPlay_PlaySound 0,PlaySound_GRC			; 34 (GRC Socket)
		SetPlay_PlaySound $FF,StopWolfteamSound		; 35 (Wolfteam Sol)
		SetPlay_PlaySound $FF,StopSoundSMPS			; 36 (SMPS M68K S1)
		SetPlay_PlaySound $FF,StopSoundSMPS			; 37 (SMPS M68K S2)
		SetPlay_PlaySound 0,PlaySound_SMS			; 38 (SMS Z80 S1SMS)
		SetPlay_PlaySound 0,Gems_Stop_All			; 39 (GEMS SS)
		SetPlay_PlaySound $80,PlayImagesSound		; 3A (Sound Images SMC)
		SetPlay_PlaySound 7,StopSound_Masakatsu		; 3B (Masakatsu SH2)
		SetPlay_PlaySound 7,StopSound_Masakatsu		; 3C (Masakatsu SH3)
		SetPlay_PlaySound $E4,StopSound_SMPSMucom	; 3D (Mucom SMPS SOR1)
		SetPlay_PlaySound 0,Play_Sound_Mucom		; 3E (Mucom SOR2)
		SetPlay_PlaySound $E4,StopSound_SMPSMucom	; 3F (Mucom SMPS SOR2)
		SetPlay_PlaySound 0,Play_Sound_Ancient		; 40 (Ancient Music Driver SOR3)
		SetPlay_PlaySound 0,PlaySound_Advanced		; 41 (Advanced Z80 Player ST)
		SetPlay_PlaySound 0,Gems_Stop_All			; 42 (GEMS TZ)
		SetPlay_PlaySound 0,SoundStopFade_Techo		; 43 (Techo TF3)
		SetPlay_PlaySound 0,SoundStopFade_Techo		; 44 (Techo TF4)
		SetPlay_PlaySound 0,StopSound_Trax			; 45 (Trax)
		SetPlay_PlaySound $80,PlayImagesSound		; 46 (Sound Images TH)
		SetPlay_PlaySound 0,Play_Music_Maxmus		; 47 (Maxmus TL)
		SetPlay_PlaySound $FF,PlaySound_Kon			; 48 (Konami TTA)
		SetPlay_PlaySound 0,PlaySound_Twinkle			; 49 (Twinkle TT)
		SetPlay_PlaySound 3,SoundOption_Terp			; 4A (Terp CB)
		SetPlay_PlaySound 0,StopSound_PalSoft			; 4B (PalSoft UL)
		SetPlay_PlaySound 0,Gems_Stop_All			; 4C (GEMS Vectorman)
		SetPlay_PlaySound 0,Gems_Stop_All			; 4D (GEMS Vectorman2)
		SetPlay_PlaySound 3,SoundOption_Terp			; 4E (Terp Verytex)
		SetPlay_PlaySound 0,PlaySound_Advanced		; 4F (Advanced Z80 Player XM)
		SetPlay_PlaySound 0,Gems_Stop_All			; 50 (GEMS ZKS)