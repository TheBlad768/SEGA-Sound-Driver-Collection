
; =============== S U B R O U T I N E =======================================

LoadDrvData_Index:
		SetConf_LoadDriver 0,LoadZ80DrvData,AdvancedZ80_Player,0											; Advanced Z80 Player (ABR)
LoadDriver_GEMSAB_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (AB)
LoadDriver_GEMSAB2_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (AB2)
LoadDriver_GEMSAladdin_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (Aladdin)
LoadDrvData_ShaunA3_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (A3)
		SetConf_LoadDriver 0,LoadZ80DrvData,AdvancedZ80_Player,0											; Advanced Z80 Player (AWS)
LoadDriver_GEMSBR_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (BR)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80Rare_Driver,0												; RARE (BDD)
		SetConf_LoadDriver UpdateMusic_GRC,LoadZ80DrvData,Z80GRCDac_Driver,0							; GRC (BMD)
		SetConf_LoadDriver UpdateMusic_Ancient,LoadZ80DrvData,Z80AncientDriver,0							; Ancient Music Driver (SOT)
LoadDriver_GEMSBC_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (BC)
LoadDrvData_ShaunBM_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (BM)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80KonamiDriver,0											; Konami (Konami Castlevania)
		SetConf_LoadDriver UpdateMusic_DataEast,SndZ80DrvLoad_DataEast,0,0								; Data East (CF)
LoadDriver_GEMSCZ_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (CZ)
LoadDriver_GEMSCZB_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (CZB)
LoadDriver_GEMSDBC_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (DBC)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpDevilishDriver,Terp_LoadData							; Terp (Devilish)
LoadDriver_GEMSDoom_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (Doom)
LoadDriver_Terp2_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpDD2Driver,Terp_LoadData							; Terp (DD2)
		SetConf_LoadDriver UpdateMusic_Falcom,LoadZ80DrvData,Z80FalcomData,LoadFalcomData				; Falcom (DS)
		SetConf_LoadDriver UpdateMusic_Falcom,LoadZ80DrvData,Z80FalcomData,LoadFalcomData				; Falcom (DS2)
LoadDriver_TechoDF_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_TechoZ80Driver,0											; Techo (DF)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80WolfteamDriver,0											; Wolfteam (EE)
LoadDriver_TechoEM_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_TechoZ80Driver,0											; Techo (EM)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80VarieDriver,Varie_LoadData									; Varie (ED)
LoadDriver_GEMSGCITA_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (GCITA)
		SetConf_LoadDriver UpdateMusic_DataEast,SndZ80DrvLoad_DataEast,0,0								; Data East (HSH)
LoadDriver_GEMSHA2_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (HA2)
LoadDrvData_ShaunJB_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (JB)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80CubeDriver,0												; Cube (LII)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80SunsoftDriver,Sunsoft_LoadData							; Sunsoft (MG)
LoadDriver_Terp3_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpMMDriver,Terp_LoadData							; Terp (MM)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80WestoneMBDriver,0											; Westone (MB)
		SetConf_LoadDriver UpdateMusic_Audios,SndZ80AudiosDrvInit,0,0										; Audios (MT)
LoadDrvData_ShaunMM_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (MM)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80CapcomDriver,0											; Capcom (MMGCM)
LoadDriver_Terp4_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpVerytexDriver,Terp_LoadData							; Terp (MR)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80WestoneMWDriver,0										; Westone (MW)
LoadDrvData_ShaunMK_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (MK2)
		SetConf_LoadDriver UpdateMusic_DataEast,SndZ80DrvLoad_DataEast,0,0								; Data East (MK5)
LoadDrvData_ShaunMN_Index
		SetConf_LoadDriver UpdateShaunMusic,SndShaunDrvInit,0,0											; Shaun Hollingworth (MN)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80PLEPLEDriver,0											; PLE-PLE (Musha)
		SetConf_LoadDriver UpdateMusic_Isoda,LoadZ80DrvData,Z80_IsodaDriver,Isoda_LoadData				; Shigeharu Isoda
LoadDriver_GEMSPDW_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (PDW)
LoadDriver_GEMSPOP_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (POP)
		SetConf_LoadDriver 0,LoadZ80DrvData,AdvancedZ80_Player,0											; Advanced Z80 Player (RZ)
LoadDriver_ImagesRRR_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80ImagesDriverRRR,Images_LoadData							; Sound Images (RRR)
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_KonRKAZ80Driver,0										; Konami (RKA)
LoadDriver_GEMSSHAQ_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (SHAQ)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80SunsoftDriver,Sunsoft_LoadData2							; Sunsoft (Shi-Kin-Joh)
LoadDriver_DataEast3_Index
		SetConf_LoadDriver UpdateMusic_DataEast,SndZ80DrvLoad_DataEast,0,0								; Data East (SHFYZ)
LoadDriver_GRC2_Index
		SetConf_LoadDriver UpdateMusic_GRC,LoadZ80DrvData,Z80GRCDac_Driver,0							; GRC (Socket)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80WolfteamDriver,0											; Wolfteam (Sol-Deace)
		SetConf_LoadDriver UpdateMusic_SMPS,LoadZ80DrvData,MegaPCM,0									; SMPS M68K (S1)
		SetConf_LoadDriver UpdateMusic_SMPS,LoadZ80DrvData,MegaPCM,0									; SMPS M68K (S2)
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80SMS_Driver,0												; SMS Z80 (S1SMS)
LoadDriver_GEMSSS_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (SS)
LoadDriver_ImagesSMC_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80ImagesDriverRRR,Images_LoadData							; Sound Images (SMC)
		SetConf_LoadDriver UpdateMusic_Masakatsu,LoadZ80DrvData,Z80DacDrv_Masakatsu,Masakatsu_LoadData	; Masakatsu (SH2)
LoadDriver_Masakatsu_Index
		SetConf_LoadDriver UpdateMusic_Masakatsu,LoadZ80DrvData,Z80DacDrv_Masakatsu,Masakatsu_LoadData	; Masakatsu (SH3)
		SetConf_LoadDriver UpdateMusic_SMPSMucom,LoadZ80DrvData,Z80Driver_SMPSMucom,0				; Mucom SMPS (SOR1)
		SetConf_LoadDriver UpdateMusic_Mucom,LoadZ80DrvData,Z80DriverM,0								; Mucom (SOR2)
		SetConf_LoadDriver UpdateMusic_SMPSMucom,LoadZ80DrvData,Z80Driver_SMPSMucom,0				; Mucom SMPS (SOR2)
		SetConf_LoadDriver UpdateMusic_Ancient,LoadZ80DrvData,Z80AncientDriver,0							; Ancient Music Driver (SOR3)
		SetConf_LoadDriver 0,LoadZ80DrvData,AdvancedZ80_Player,0											; Advanced Z80 Player (ST)
LoadDriver_GEMSTZ_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (TZ)
LoadDriver_TechoTF3_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_TechoZ80Driver,0											; Techo (TF3)
LoadDriver_TechoTF4_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_TechoZ80Driver,0											; Techo (TF4)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TraxDriver,Trax_LoadData								; Trax
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80ImagesDriverTH,Images_LoadData							; Sound Images (TH)
		SetConf_LoadDriver UpdateMusic_Maxmus,LoadZ80DrvData,SndZ80Driver_Maxmus,Maxmus_LoadData		; Maxmus (TL)
		SetConf_LoadDriver 0,LoadZ80DrvData,Snd_KonTTAZ80Driver,0										; Konami (TTA)
		SetConf_LoadDriver UpdateMusic_Twinkle,LoadZ80DrvData,Z80TwinkleDriver,Twinkle_LoadData			; Twinkle (TT)
LoadDriver_Terp5_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpCBDriver,Terp_LoadData								; Terp (CB)
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80PalSoftDrv,0											; PalSoft (UL)
LoadDriver_GEMSVectorman_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (Vectorman)
LoadDriver_GEMSVectorman2_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (Vectorman2)
LoadDriver_Terp6_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,SndZ80TerpVerytexDriver,Terp_LoadData							; Terp (Verytex)
		SetConf_LoadDriver 0,LoadZ80DrvData,AdvancedZ80_Player,0											; Advanced Z80 Player (XM)
LoadDriver_GEMSZKS_Index
		SetConf_LoadDriver 0,LoadZ80DrvData,Z80_GEMS_SoundDriver,Gems_LoadData							; GEMS (ZKS)
LoadDrvData_Index_End