
; =============== S U B R O U T I N E =======================================

Startup:
		movea.l	SetupValues.VDP(pc),a6
		lea	VDP_control_port-VDP_data_port(a6),a5
-		move.w	VDP_control_port-VDP_control_port(a5),d0
		btst	#1,d0
		bne.s	-
		lea	((RAM_start&$FFFFFF)).l,a1
		moveq	#0,d0
		move.w	#bytesToLcnt($FFF0),d1
-		move.l	d0,(a1)+
		dbf	d1,-
		bsr.w	VDP_Init
		lea	(Z80Falcom_Load).l,a2
		bsr.w	LoadZ80DrvData
		bsr.w	Controller_Init
		bsr.w	System_Screen

; Reset RAM value
		move.w	#-1,(Driver_SaveLine_Count).w

; Clear Plane
		bsr.w	ClearPlaneMap

; Load Plane
		LoadTileMap	MapEni_MainBG(pc),(RAM_start).l,0
		CopyTileMap	$F000,320,224

; Load Palette
		LoadTileMap	PalEni_MainScreen(pc),(RAM_start).l,0
		move.l	#vdpComm($0000,CRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		moveq	#((64/4)/2)-1,d0

-	rept 4
		move.l	(a1)+,VDP_data_port-VDP_data_port(a6)
	endm
		dbf	d0,-

; Clear Plane
Load_DriverText_Clear:
		disableInts								; Disable interrupts
		bsr.w	ClearPlaneMap

; Load Plane
		LoadTileMap	MapEni_SelectBG(pc),(EnigmaDec_Buffer).w,0
		CopyTileMap	$F196,152,16
		enableInts								; Enable interrupts

; Reset RAM values
		moveq	#-1,d0
		move.w	d0,(Driver_CurrentLine_Count).w
		move.w	d0,(MusicPlay_Current_Count).w

; Driver select menu
Load_DriverText_Loop:
		stopCPU
		disableInts
		bsr.w	Load_DrvNameText
		enableInts
		move.w	(Driver_Line_Count).w,d0
		move.b	(Ctrl_1_pressed).w,d1
		move.w	#((LoadDrvData_Index_End-LoadDrvData_Index)/$10)-1,d2
		lea	Control_UpDown(pc),a1
		bsr.w	Control_Text
		move.w	d0,(Driver_Line_Count).w
		andi.b	#JoyABCS,d1
		beq.s	Load_DriverText_Loop

; Clear Plane
		disableInts								; Disable interrupts
		bsr.w	ClearPlaneMap

; Load Plane
		LoadTileMap	MapEni_MusicBG(pc),(EnigmaDec_Buffer).w,0
		CopyTileMap	$F196,152,16
		enableInts								; Enable interrupts

; Load of the Z80 driver in memory Z80, M68K to vertical interrupt
		move.w	(Driver_Line_Count).w,d0
		cmp.w	(Driver_SaveLine_Count).w,d0
		beq.s	Load_MusicDriver_Loop
		move.w	d0,(Driver_SaveLine_Count).w		; set Sound Driver flag
		clr.w	(MusicPlay_Count).w
		move.w	#-1,(MusicPlay_SaveCurrent_Count).w
		disableInts
		bsr.w	PSGSilenceAll_GRCDrv			; Silence PSG
		bsr.w	Equalizer_GetRAM
		lea	(Driver_Equalizer_Pointer).w,a1
		add.w	d0,d0
		lea	Equalizer_CurrentKeys_Index(pc),a0
		adda.w	(a0,d0.w),a0
		move.w	a0,(a1)+							; Load Equalizer
		lea	(Off_CurrentDriver_Text).l,a0
		move.w	(a0,d0.w),d1
		lea	(a0,d1.w),a0
		move.l	a0,(a1)+							; Load Name
		add.w	d0,d0
		add.w	d0,d0
		lea	LoadPlaySound_Index(pc),a0
		lea	(a0,d0.w),a0
		move.w	a0,(a1)							; Load Play
		add.w	d0,d0
		lea	LoadDrvData_Index(pc,d0.w),a2
		move.l	(a2)+,(V_int_Music).w
		movea.l	(a2)+,a0
		jsr	(a0)
		enableInts
		stopCPU
		clearRAM EQ_Buffer_Values, EQ_Buffer_Keys_End
		waitZ80time	$FFF
		bsr.w	Load_DriverText_StartMusic		; Play Music

; Driver menu
Load_MusicDriver_Loop:
		stopCPU
		bsr.w	Equalizer_Process
		disableInts
		bsr.w	Equalizer_Update
		bsr.w	Load_DriverText
		enableInts
		bsr.w	LoadPlaySound_MusicTest
		tst.b	(Ctrl_1_pressed).w
		bpl.s	Load_MusicDriver_Loop
		bra.w	Load_DriverText_Clear
; ---------------------------------------------------------------------------

		include "Data/Player Screen/ConfZ80.asm"
		include "Data/Player Screen/Music Test.asm"
		include "Data/Player Screen/Control.asm"
		include "Data/Player Screen/Equalizer.asm"
		include "Data/Player Screen/LoadZ80.asm"
		include "Data/Player Screen/Scroll Text.asm"
		include "Data/Player Screen/Name Game.asm"