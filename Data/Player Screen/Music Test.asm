
; =============== S U B R O U T I N E =======================================

LoadPlaySound_MusicTest:
		moveq	#0,d2
		movea.w	(Driver_MusicPlay_Pointer).w,a2
		move.b	(a2),d2
		move.b	(Ctrl_1_pressed).w,d1
		bsr.w	Current_Music_Control
		andi.b	#JoyAC+JoyLeftRight,d1
		beq.w	Control_Text_Return
		move.l	#$FFFFFF,d3
		move.l	(a2)+,d1
		and.l	d3,d1
		beq.s	+
		movea.l	d1,a1
		move.b	(a1,d0.w),d0
+		add.b	(a2),d0
		move.l	(a2),d2
		and.l	d3,d2
		movea.l	d2,a2
		jmp	(a2)
; ---------------------------------------------------------------------------

LoadPlaySound_Index:		; Max, Index, Start, Method
		SetConf_PlaySound $12,0,1,PlaySound_Advanced							; 0 (Advanced Z80 Player ABR)
		SetConf_PlaySound $15,0,0,Play_GEMS_Music							; 1 (GEMS AB)
		SetConf_PlaySound $13,0,$16,Play_GEMS_Music							; 2 (GEMS AB2)
		SetConf_PlaySound $11,PlayGEMSASound_Index,$36,Play_GEMS_Music		; 3 (GEMS Aladdin)
		SetConf_PlaySound $10,PlayShaunA3Sound_Index,2,PlayShaunSound		; 4 (Shaun Hollingworth A3)
		SetConf_PlaySound 1,0,$35,PlaySound_Advanced							; 5 (Advanced Z80 Player AWS)
		SetConf_PlaySound $10,0,$2D,Play_GEMS_Music							; 6 (GEMS BR)
		SetConf_PlaySound $12,PlayRareBDDSound_Index,1,PlaySound_Rare			; 7 (RARE BDD)
		SetConf_PlaySound $21,0,1,PlaySound_GRC								; 8 (GRC BMD)
		SetConf_PlaySound $21,0,$1D,Play_Music_Ancient						; 9 (Ancient Music Driver SOT)
		SetConf_PlaySound $D,0,$43,Play_GEMS_Music							; A (GEMS BC)
		SetConf_PlaySound $F,PlayShaunBMSound_Index,2,PlayShaunSound		; B (Shaun Hollingworth BM)
		SetConf_PlaySound $1E,0,$BD,PlayKonamiSound							; C (Konami Castlevania)
		SetConf_PlaySound 6,0,$25,PlaySound_DataEast							; D (Data East CF)
		SetConf_PlaySound $18,0,$2A,Play_GEMS_Music							; E (GEMS CZ)
		SetConf_PlaySound 8,0,$8C,Play_GEMS_Music							; F (GEMS CZB)
		SetConf_PlaySound 7,0,$51,Play_GEMS_Music							; 10 (GEMS DBC)
		SetConf_PlaySound $E,PlayTerpDevilishSound_Index,0,PlaySound_Terp		; 11 (Terp Devilish)
		SetConf_PlaySound 8,PlayGEMSDoomSound_Index,$26,Play_GEMS_Music	; 12 (GEMS Doom)
		SetConf_PlaySound $E,0,0,PlaySound_Terp								; 13 (Terp DD2)
		SetConf_PlaySound $1C,0,1,Load_PlayMusic_Falcom						; 14 (Falcom DS)
		SetConf_PlaySound $2E,0,$1E,Load_PlayMusic_Falcom					; 15 (Falcom DS2)
		SetConf_PlaySound $15,0,0,PlaySound_TechoDF							; 16 (Techo DF)
		SetConf_PlaySound $10,0,$12,PlayWolfteamSound							; 17 (Wolfteam EE)
		SetConf_PlaySound $17,0,0,PlaySound_TechoEM							; 18 (Techo EM)
		SetConf_PlaySound $20,0,1,PlaySound_Varie								; 19 (Varie ED)
		SetConf_PlaySound $13,0,$5B,Play_GEMS_Music							; 1A (GEMS GCITA)
		SetConf_PlaySound $1C,0,8,PlaySound_DataEast							; 1B (Data East HSH)
		SetConf_PlaySound $B,0,$21,Play_GEMS_Music							; 1C (GEMS HA2)
		SetConf_PlaySound 8,PlayShaunJBSound_Index,2,PlayShaunSound			; 1D (Shaun Hollingworth JB)
		SetConf_PlaySound $1E,0,1,PlayCubeSound								; 1E (Cube LII)
		SetConf_PlaySound 8,0,1,PlaySunsoftSound								; 1F (Sunsoft MG)
		SetConf_PlaySound $A,0,0,PlaySound_Terp								; 20 (Terp MM)
		SetConf_PlaySound $1E,0,0,PlaySound_Westone							; 21 (Westone MB)
		SetConf_PlaySound $1D,PlayAudiosMTSound_Index,0,PlaySound_Audios		; 22 (Audios MT)
		SetConf_PlaySound $16,PlayShaunMMSound_Index,2,PlayShaunSound		; 23 (Shaun Hollingworth MM)
		SetConf_PlaySound $20,0,0,PlayCapcomSound							; 24 (Capcom MMGCM)
		SetConf_PlaySound 9,0,0,PlaySound_Terp								; 25 (Terp MR)
		SetConf_PlaySound $1F,0,0,PlaySound_Westone							; 26 (Westone MW)
		SetConf_PlaySound $1F,PlayShaunMKSound_Index,2,PlayShaunSound		; 27 (Shaun Hollingworth MK2)
		SetConf_PlaySound 6,0,1,PlaySound_DataEast								; 28 (Data East MK5)
		SetConf_PlaySound $E,PlayShaunMNSound_Index,2,PlayShaunSound		; 29 (Shaun Hollingworth MN)
		SetConf_PlaySound $F,0,1,PlaySound_Musha								; 2A (PLE-PLE Musha)
		SetConf_PlaySound $19,0,1,PlaySound_Isoda								; 2B (Shigeharu Isoda)
		SetConf_PlaySound $19,0,$59,Play_GEMS_Music							; 2C (GEMS PDW)
		SetConf_PlaySound $A,0,$73,Play_GEMS_Music							; 2D (GEMS POP)
		SetConf_PlaySound $F,0,$25,PlaySound_Advanced						; 2E (Advanced Z80 Player RZ)
		SetConf_PlaySound 5,0,$81,PlayImagesSound								; 2F (Sound Images RRR)
		SetConf_PlaySound $18,PlayKonamiRKASound_Index,$A0,PlaySound_Kon2	; 30 (Konami RKA)
		SetConf_PlaySound $1C,0,$3E,Play_GEMS_Music							; 31 (GEMS SHAQ)
		SetConf_PlaySound $B,0,1,PlaySunsoftSound								; 32 (Sunsoft Shi-Kin-Joh)
		SetConf_PlaySound $C,0,$2B,PlaySound_DataEast							; 33 (Data East SHFYZ)
		SetConf_PlaySound $15,0,$23,PlaySound_GRC							; 34 (GRC Socket)
		SetConf_PlaySound $10,0,1,PlayWolfteamSound							; 35 (Wolfteam Sol)
		SetConf_PlaySound $12,0,1,PlaySoundSMPS								; 36 (SMPS M68K S1)
		SetConf_PlaySound $23,0,$14,PlaySoundSMPS							; 37 (SMPS M68K S2)
		SetConf_PlaySound $10,0,1,PlaySound_SMS								; 38 (SMS Z80 S1SMS)
		SetConf_PlaySound $D,0,$7E,Play_GEMS_Music							; 39 (GEMS SS)
		SetConf_PlaySound $12,0,$81,PlayImagesSound							; 3A (Sound Images SMC)
		SetConf_PlaySound $1C,0,1,PlaySound_Masakatsu							; 3B (Masakatsu SH2)
		SetConf_PlaySound $1E,0,$1E,PlaySound_Masakatsu						; 3C (Masakatsu SH3)
		SetConf_PlaySound $F,0,$81,PlaySound_SMPSMucom						; 3D (Mucom SMPS SOR1)
		SetConf_PlaySound $19,0,0,Play_Music_Mucom							; 3E (Mucom SOR2)
		SetConf_PlaySound 0,0,$91,PlaySound_SMPSMucom						; 3F (Mucom SMPS SOR2)
		SetConf_PlaySound $1C,0,0,Play_Music_Ancient							; 40 (Ancient Music Driver SOR3)
		SetConf_PlaySound $10,0,$14,PlaySound_Advanced						; 41 (Advanced Z80 Player ST)
		SetConf_PlaySound $10,0,0,Play_GEMS_Music							; 42 (GEMS TZ)
		SetConf_PlaySound $15,0,0,PlaySound_TechoTF3							; 43 (Techo TF3)
		SetConf_PlaySound $2F,0,0,PlaySound_TechoTF4							; 44 (Techo TF4)
		SetConf_PlaySound 5,0,0,PlaySound_Trax								; 45 (Trax)
		SetConf_PlaySound $10,0,$81,PlayImagesSound							; 46 (Sound Images TH)
		SetConf_PlaySound 7,0,1,Play_Music_Maxmus							; 47 (Maxmus TL)
		SetConf_PlaySound $16,0,$81,PlaySound_Kon								; 48 (Konami TTA)
		SetConf_PlaySound $19,0,1,PlaySound_Twinkle							; 49 (Twinkle TT)
		SetConf_PlaySound $A,0,0,PlaySound_Terp								; 4A (Terp CB)
		SetConf_PlaySound $10,0,0,PlaySound_PalSoft							; 4B (PalSoft UL)
		SetConf_PlaySound $E,0,0,Play_GEMS_Music							; 4C (GEMS Vectorman)
		SetConf_PlaySound $16,0,$F,Play_GEMS_Music							; 4D (GEMS Vectorman2)
		SetConf_PlaySound $B,0,0,PlaySound_Terp								; 4E (Terp Verytex)
		SetConf_PlaySound 4,0,$37,PlaySound_Advanced							; 4F (Advanced Z80 Player XM)
		SetConf_PlaySound $F,0,$11,Play_GEMS_Music							; 50 (GEMS ZKS)
; ---------------------------------------------------------------------------

PlayGEMSASound_Index:
		dc.b 0, 1, 2, 3, 4, 5, 7, 8, 9, $B, $D, $10, $11
		dc.b $16, $18, $19, $1A, $1B
PlayRareBDDSound_Index:
		dc.b 0, 1, 3, 4, 5, 6, 7, 8, 9, $A, $B, $C, $D, $E, $F, $10, $11, $12, $13,0
PlayGEMSDoomSound_Index:
		dc.b 0, 2, 4, 5, 6, 8, 9, $C, $D,0
PlayKonamiRKASound_Index:
		dc.b 0, 1, 2, 3, 4, 5, 6, 8, 9, $A, $B, $D, $E, $F
		dc.b $10, $11, $13, $14, $15, $17, $18, $19, $1A, $1B, $1C,0
PlayShaunA3Sound_Index:
		dc.b 0, 4, 6, $B, $19, $1D, $1E, $1F, $20, $26, $32, $38, $4D
		dc.b $52, $5F, $6E, $A9,0
PlayShaunBMSound_Index:
		dc.b 0, $D, $15, $16, $1B, $25, $31, $38, $43, $49, $4A
		dc.b $5A, $62, $67, $6F, $90
PlayTerpDevilishSound_Index:
		dc.b 0, 1, 2, 3, 4, 5, 6, 7, 8, $A, $B, $C, $D, $E, $F,0
PlayShaunJBSound_Index:
		dc.b 0, $25, $27, $28, $2D, $3B, $51, $58, $68,0
PlayShaunMMSound_Index:
		dc.b 0, $95, $8E, $20, $53, $48, $D9, $5A, $9, $35, $9F, $3E
		dc.b $E9, $80, $E0, $D3, $2B, $7F, $68, $52, $59, $70, $71,0
PlayShaunMKSound_Index:
		dc.b 0, $B, $C, $1E, $1F, $2B, $2C, $2D, $2E
		dc.b $2F, $36, $3E, $3F, $40, $47, $4C, $4D, $50, $51, $53
		dc.b $54, $55, $56, $67, $68, $70, $71, $85, $86, $8E, $8F, $90
PlayShaunMNSound_Index:
		dc.b 0, $1F, $35, $47, $56, $57, $58, $61, $62, $70, $82, $86
		dc.b $99, $A9, $EF,0
PlayAudiosMTSound_Index:
		dc.b 0, 1, 2, 3, 4, 5, 6, 7, 9, $10, $11, $12, $13, $14, $15, $20, $21, $22, $25
		dc.b $30, $31, $32, $33, $40, $41, $42, $43, $50, $51, $52, $53,0