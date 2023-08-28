
	; set the character
		CHARSET ' ','Z', 0

;PAL_ErrorText:		; (E) rom
;		dc.b "  DEVELOPED FOR USE ONLY WITH",$81
;		dc.b "PAL AND FRENCH SECAM MEGA DRIVE",$81
;		dc.b "           SYSTEMS.",-1
;NTSCU_ErrorText:	; (U) rom, JP setting
;		dc.b "  DEVELOPED FOR USE ONLY WITH",$81
;		dc.b "         NTSC GENESIS",$81
;		dc.b "           SYSTEMS.",-1
;NTSCJ_Error2Text:	; (J) rom, ENG setting
;		dc.b "  DEVELOPED FOR USE ONLY WITH",$81
;		dc.b "        NTSC MEGA DRIVE",$81
;		dc.b "           SYSTEMS.",-1
NTSCUJ_ErrorText:	; (UJ) rom, JP and ENG setting
		dc.b "  DEVELOPED FOR USE ONLY WITH",$81
		dc.b "     NTSC GENESIS SYSTEMS",$81
		dc.b "              AND",$81
		dc.b "    NTSC MEGA DRIVE SYSTEMS.",-1
CheckSum_ErrorText:	; CheckSum Error
		dc.b "   CHECKSUM INCORRECT.",$81
		dc.b "PLEASE DOWNLOAD ROM AGAIN.",-1
CheckSum_WaitText:	; CheckSum Wait
		dc.b "   THIS PRODUCT IS NOT PRODUCED",$81
		dc.b "     BY OR UNDER LICENSE FROM",$81
		dc.b "       SEGA ENTERPRISES LTD",$91
		dc.b "CHECKSUM IS CHECKED. PLEASE WAIT...",-1
	even

		CHARSET ; reset character set

ArtKosData_Index:
		dc.w ((ArtKosData_Index_End-ArtKosData_Index)/4)-1
		dc.w ArtKos_SystemText
		dc.w 0
		dc.w ArtKos_MainEQ
		dc.w $100*$20
		dc.w ArtKos_MainText
		dc.w $110*$20
		dc.w ArtKos_SelectBG
		dc.w $200*$20
		dc.w ArtKos_MainBG
		dc.w $280*$20
ArtKosData_Index_End

; =============== S U B R O U T I N E =======================================

System_Screen:
; Load Kosinski art
		lea	ArtKosData_Index(pc),a2
		bsr.w	Load_KosinskiData

; Load Checksum verification text
		lea	CheckSum_WaitText(pc),a1
		locVRAM	$E206,d1
		bsr.w	System_LoadText
		move.l	#vdpComm($0002,CRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		move.w	#$EEE,VDP_data_port-VDP_data_port(a6)

System_CheckSumCheck:
		movea.w	#$200,a0
		move.l	($1A4).w,d7
		sub.l	a0,d7
		lsr.l	#6,d7
		moveq	#0,d0
-	rept 32
		add.w	(a0)+,d0
	endm
		dbf	d7,-
		cmp.w	($18E).w,d0
		beq.s	System_CheckConsole
		lea	CheckSum_ErrorText(pc),a1
		locVRAM	$E70E,d1
		bra.s	System_CheckConsole_LoadText
; ---------------------------------------------------------------------------

System_CheckConsole:
		move.b	(HW_Version).l,d0
		andi.b	#$C0,d0
		move.b	d0,(Graphics_flags).w
		btst	#6,d0
		beq.s	System_LoadText_Return
		lea	NTSCUJ_ErrorText(pc),a1
		locVRAM	$E708,d1

System_CheckConsole_LoadText:
		bsr.s	System_LoadText
		bra.s	*