; ===========================================================================
; Load game playlist text
; ===========================================================================

; =============== S U B R O U T I N E =======================================

Load_DriverText:
		move.w	(MusicPlay_Count).w,d0
		cmp.w	(MusicPlay_Current_Count).w,d0
		beq.s	Load_DriverText_Return
		move.w	d0,(MusicPlay_Current_Count).w
		movea.l	(Driver_MusicText_Pointer).w,a1
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		locVRAM	$ED80,d3
		bsr.w	Calculate_TextPosition
		move.l	d3,VDP_control_port-VDP_control_port(a5)

; Load Text
		move.w	#$100,d0	; VRAM

-		move.b	(a1)+,d0
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d6,-

Load_DriverText_Return:
		rts