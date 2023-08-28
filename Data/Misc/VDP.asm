VDP_register_values:
		dc.w $8004						; H-int disabled
		dc.w $8174						; V-int enabled, display enabled, DMA enabled, PAL off
		dc.w $8200+(vram_fg>>10)		; Scroll A PNT base $E000
		dc.w $8300+(vram_window>>10)	; Window PNT base $E000
		dc.w $8400+(vram_bg>>13)		; Scroll B PNT base $E000
		dc.w $8500+(vram_sprites>>9)		; Sprite attribute table base $E000
		dc.w $8600						; Sprite Pattern Generator Base Address: low 64KB VRAM
		dc.w $8700+(0<<4)				; Backdrop color is color 0 of the first palette line
		dc.w $8800						; Null
		dc.w $8900						; Null
		dc.w $8A00						; H-int
		dc.w $8B00						; Full-screen horizontal and vertical scrolling
		dc.w $8C81						; 40 cell wide display, no interlace
		dc.w $8D00+(vram_hscroll>>10)	; Horizontal scroll table base $E000
		dc.w $8E00						; Nametable Pattern Generator Base Address: low 64KB VRAM
		dc.w $8F02						; Auto-ncrement is 2
		dc.w $9011						; Scroll planes are 64x64 cells
		dc.w $9100						; Window H left side, Base Point 0
		dc.w $9200						; Window V upside, Base Point 0

; =============== S U B R O U T I N E =======================================

VDP_Init:
		moveq	#0,d0
		moveq	#18,d7
		lea	VDP_register_values(pc),a2

-		move.w	(a2)+,VDP_control_port-VDP_control_port(a5)
		dbf	d7,-

; Cleaning of vertical scrolling
		move.l	#vdpComm($0000,VSRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		move.w	d0,VDP_data_port-VDP_data_port(a6)		; FG
		move.w	#256,VDP_data_port-VDP_data_port(a6)	; BG

; Cleaning the palette
		move.l	#vdpComm($0000,CRAM,WRITE),VDP_control_port-VDP_control_port(a5)
		move.w	#64-1,d7

-		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d7,-

; Clearing VRAM
		dmaFillVRAM 0,$0000,($1000<<4)		; clear entire VRAM
		rts