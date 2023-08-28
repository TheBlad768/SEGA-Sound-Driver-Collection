; ---------------------------------------------------------------------------
; Display text on the plan
; Inputs:
; d0 = vram shift
; d1 = plane address
; d3 = vram shift(unused)
; a1 = source address
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

System_LoadText:
		move.l	#$800000,d2

System_LoadText_SetPos:
		move.l	d1,VDP_control_port-VDP_control_port(a5)

System_LoadText_Loop:
		moveq	#0,d0
		move.b	(a1)+,d0
		bmi.s	System_LoadText_Options
;		add.w	d3,d0						; VRAM shift
		move.w	d0,VDP_data_port-VDP_data_port(a6)
		bra.s	System_LoadText_Loop
; ---------------------------------------------------------------------------

System_LoadText_Options:
		cmpi.b	#-1,d0						; If $FF flag, stop loading letters
		beq.s	System_LoadText_Return

System_LoadText_NextLine:
		andi.w	#$1F,d0						; If $80-$9F flag, load letters to the next line

-		add.l	d2,d1
		dbf	d0,-
		bra.s	System_LoadText_SetPos
; ---------------------------------------------------------------------------

System_LoadText_Return:
		rts
; ---------------------------------------------------------------------------
; Calculates the position to display text in the middle of the screen
; Inputs:
; d3 = plane address
; a1 = source address
; Outputs:
; d1 = calculated data
; d3 = calculated plane address
; d6 = text size
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

Calculate_TextPosition:
		movem.l	d0/d2/d4,-(sp)
		moveq	#0,d0
		moveq	#1,d4
		moveq	#304/8,d1	; Max 38 characters
		move.w	d1,d6
		move.l	d3,VDP_control_port-VDP_control_port(a5)

-		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d6,-
		move.l	d3,VDP_control_port-VDP_control_port(a5)
		move.b	(a1)+,d0
		move.w	d0,d6
		add.w	d4,d0
		sub.w	d0,d1
		move.w	d1,d2
		and.w	d4,d2
		lsr.w	d1
		add.w	d2,d1
		add.w	d4,d1
		add.w	d1,d1
		swap	d1
		clr.w	d1
		add.l	d1,d3
		movem.l	(sp)+,d0/d2/d4
		rts