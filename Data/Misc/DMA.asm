; ---------------------------------------------------------------------------
; DMA
; Inputs:
; d1 = source address
; d2 = destination VRAM address
; d3 = number of words to transfer
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

DMA_Transfer:
		move.w	#$9300,d0
		move.b	d3,d0
		move.w	d0,VDP_control_port-VDP_control_port(a5)		; command to specify transfer length in words & $00FF
		move.w	#$9400,d0
		lsr.w	#8,d3
		move.b	d3,d0
		move.w	d0,VDP_control_port-VDP_control_port(a5)		; command to specify transfer length in words & $FF00
		move.w	#$9500,d0
		lsr.l	#1,d1
		move.b	d1,d0
		move.w	d0,VDP_control_port-VDP_control_port(a5)		; command to specify transfer source & $0001FE
		move.w	#$9600,d0
		lsr.l	#8,d1
		move.b	d1,d0
		move.w	d0,VDP_control_port-VDP_control_port(a5)		; command to specify transfer source & $01FE00
		move.w	#$9700,d0
		lsr.l	#8,d1
		andi.b	#$7F,d1
		move.b	d1,d0
		move.w	d0,VDP_control_port-VDP_control_port(a5)		; command to specify transfer source & $FE0000
		andi.l	#$FFFF,d2
		lsl.l	#2,d2
		lsr.w	#2,d2
		swap	d2
		ori.l	#vdpComm($0000,VRAM,DMA),d2
		move.l	d2,VDP_control_port-VDP_control_port(a5)		; command to specify transfer destination and begin DMA
		rts
; End of function DMA_Transfer