; ---------------------------------------------------------------------------
; Copies a plane map to a plane PNT
; Inputs:
; d1 = VDP command to write to the PNT
; d3 = number of cells in a row - 1
; d7 = number of cell rows - 1
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SetPlaneMap:
		move.l	#$800000,d2
-		move.l	d1,VDP_control_port-VDP_control_port(a5)
		move.w	d3,d6
-		move.w	(a1)+,VDP_data_port-VDP_data_port(a6)
		dbf	d6,-
		add.l	d2,d1
		dbf	d7,--
		rts

; =============== S U B R O U T I N E =======================================

ClearPlaneMap:
		dmaFillVRAM 0,$E000,(256<<4)	; Clear plane A PNT
		rts