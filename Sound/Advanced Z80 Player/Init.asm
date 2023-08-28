; ===========================================================================
; Advanced Z80 Player (1824).
; (Without SFX).
; ===========================================================================
; Constants
; ===========================================================================

		include "Sound/Advanced Z80 Player/Macros.asm"
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Advanced Z80 Player ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

; Sound Driver control:
zCurrentTempo			= $3B
unk_ED					= $ED
unk_E61					= $E61
zCurrentVolume			= $E67
zFMChannelRAM			= $1480
unk_16EA				= $16EA
unk_17EA				= $17EA
zPauseFlag				= $180E
unk_1810				= $1810
; ---------------------------------------------------------------------------

; FM data
Size_FMData 			= $67 ; bytes

; =============== S U B R O U T I N E =======================================

Load_AdvancedCurrentMusic:
		stopZ80a
		resetZ80
		waitZ80
		move.l	a0,-(sp)
		lea	byte_1E7914(pc),a3
		movea.l	(a0),a0
		adda.w	d0,a0
		add.w	d0,d0
		adda.w	d0,a0		; Load Bank
		moveq	#0,d0
		move.b	(a0)+,d0
		lsl.w	#8,d0
		move.b	(a0)+,d0
		lsl.l	#8,d0
		move.b	(a0)+,d0
		movea.l	d0,a0		; Load Music Pointer
		lea	(Z80_RAM+zFMChannelRAM).l,a1
		moveq	#6-1,d7
-		bsr.s	loc_1E7BBE
		lea	Size_FMData(a1),a1
		dbf	d7,-
		bra.s	loc_1E7C70
; ---------------------------------------------------------------------------

loc_1E7BBE:
		moveq	#0,d1
		move.b	(a0),d1
		lsl.w	#2,d1
		beq.s	loc_1E7C56
		movea.l	d0,a2
		addq.l	#2,d0
		lsl.l	d0
		lsr.w	d0
		addi.w	#$8000,d0
		move.b	d0,$2F(a1)
		lsr.l	#8,d0
		move.b	d0,$2E(a1)
		lsr.w	#8,d0
		move.b	d0,$2D(a1)
		move.b	(a2)+,d0
		move.b	d0,$2B(a1)
		move.b	(a2),d0
		move.b	d0,$29(a1)
		move.b	(a3)+,d0
		move.b	d0,$2A(a1)
		move.b	(a3)+,d0
		move.b	d0,$20(a1)
		move.b	(a3)+,d0
		move.b	d0,$21(a1)
		move.b	#-1,d0
		move.b	d0,$1F(a1)
		move.b	d0,$3D(a1)
		adda.w	d1,a0

loc_1E7C50:
		addq.w	#2,a0
		move.l	a0,d0
		rts
; ---------------------------------------------------------------------------

loc_1E7C56:
		move.b	d1,d0
		move.b	d0,$1F(a1)
		move.b	d0,$3D(a1)
		bra.s	loc_1E7C50
; ---------------------------------------------------------------------------

loc_1E7C70:
		movea.l	(sp)+,a0
		lea	(Z80_RAM+$E61).l,a1
		movea.l	4(a0),a0
		addq.w	#7,a0
		moveq	#2-1,d6					; load Sequence and Voice bank
-		move.b	(a0)+,(a1)+				; First byte offset
		move.b	(a0)+,1(a1)				; Swap offset for Z80
		move.b	(a0)+,(a1)+
		addq.w	#3,a0					; Next bank
		addq.w	#1,a1
		dbf	d6,-
		resetZ80a
		nop
		nop
		nop
		nop
		startZ80
		resetZ80
		rts

; =============== S U B R O U T I N E =======================================

PlaySound_Advanced:
		disableInts2
		movem.l	d1/d6-a3,-(sp)
		bsr.s	Clear_AdvancedChannelData
		bsr.s	Return_AdvancedMusicVolume
		tst.w	d0
		beq.s	+
		bsr.s	Load_AdvancedMusicBanks
+		movem.l	(sp)+,d1/d6-a3
		enableInts2
		rts
; End of function PlaySound_Advanced

; =============== S U B R O U T I N E =======================================

Clear_AdvancedChannelData:
		stopZ80
		moveq	#0,d1
		moveq	#6-1,d7
		lea	(Z80_RAM+zFMChannelRAM).l,a1

-		move.b	d1,$1F(a1)
		lea	Size_FMData(a1),a1
		dbf	d7,-
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

Return_AdvancedMusicVolume:
		stopZ80
		clr.b	(Z80_RAM+zCurrentVolume).l
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

Load_AdvancedMusicBanks:
		add.w	d0,d0
		add.w	d0,d0
		lea	Music_Tbl1(pc),a0
		adda.w	MusicBanksAdvanced_Index+2(pc,d0.w),a0
		move.w	MusicBanksAdvanced_Index(pc,d0.w),d0
		jmp	Load_AdvancedCurrentMusic(pc)
; ---------------------------------------------------------------------------

MusicBanksAdvanced_Index:
		dc.w 0			; Current music
		dc.w 0*8			; Current bank
		dc.w 0			; Current music
		dc.w 0*8			; Current bank
		dc.w 1			; Current music
		dc.w 0*8			; Current bank
		dc.w 2			; Current music
		dc.w 0*8			; Current bank
		dc.w 5			; Current music
		dc.w 1*8			; Current bank
		dc.w 3			; Current music
		dc.w 0*8			; Current bank
		dc.w 4			; Current music
		dc.w 0*8			; Current bank
		dc.w 5			; Current music
		dc.w 0*8			; Current bank
		dc.w 6			; Current music
		dc.w 0*8			; Current bank
		dc.w 0			; Current music
		dc.w 1*8			; Current bank
		dc.w 1			; Current music
		dc.w 1*8			; Current bank
		dc.w 2			; Current music
		dc.w 1*8			; Current bank
		dc.w 3			; Current music
		dc.w 1*8			; Current bank
		dc.w 4			; Current music
		dc.w 1*8			; Current bank
		dc.w 0			; Current music
		dc.w 2*8			; Current bank
		dc.w 1			; Current music
		dc.w 2*8			; Current bank
		dc.w 4			; Current music
		dc.w 2*8			; Current bank
		dc.w 3			; Current music
		dc.w 2*8			; Current bank
		dc.w 2			; Current music
		dc.w 2*8			; Current bank
		dc.w 6			; Current music
		dc.w 1*8			; Current bank
		dc.w 0			; Current music
		dc.w 3*8			; Current bank
		dc.w 1			; Current music
		dc.w 3*8			; Current bank
		dc.w 0			; Current music
		dc.w 4*8			; Current bank
		dc.w 1			; Current music
		dc.w 4*8			; Current bank
		dc.w 0			; Current music
		dc.w 5*8			; Current bank
		dc.w 1			; Current music
		dc.w 5*8			; Current bank
		dc.w 0			; Current music
		dc.w 6*8			; Current bank
		dc.w 1			; Current music
		dc.w 6*8			; Current bank
		dc.w 2			; Current music
		dc.w 6*8			; Current bank
		dc.w 0			; Current music
		dc.w 7*8			; Current bank
		dc.w 1			; Current music
		dc.w 7*8			; Current bank
		dc.w 2			; Current music
		dc.w 7*8			; Current bank
		dc.w 3			; Current music
		dc.w 7*8			; Current bank
		dc.w 4			; Current music
		dc.w 7*8			; Current bank
		dc.w 0			; Current music
		dc.w 8*8			; Current bank
		dc.w 0			; Current music
		dc.w 9*8			; Current bank
		dc.w 0			; Current music
		dc.w 10*8		; Current bank
		dc.w 0			; Current music
		dc.w 11*8		; Current bank
		dc.w 1			; Current music
		dc.w 11*8		; Current bank
		dc.w 2			; Current music
		dc.w 11*8		; Current bank
		dc.w 3			; Current music
		dc.w 11*8		; Current bank
		dc.w 4			; Current music
		dc.w 11*8		; Current bank
		dc.w 5			; Current music
		dc.w 11*8		; Current bank
		dc.w 0			; Current music
		dc.w 12*8		; Current bank
		dc.w 1			; Current music
		dc.w 12*8		; Current bank
		dc.w 2			; Current music
		dc.w 12*8		; Current bank
		dc.w 3			; Current music
		dc.w 12*8		; Current bank
		dc.w 4			; Current music
		dc.w 12*8		; Current bank
		dc.w 5			; Current music
		dc.w 12*8		; Current bank
		dc.w 6			; Current music
		dc.w 12*8		; Current bank
		dc.w 7			; Current music
		dc.w 12*8		; Current bank
		dc.w 0			; Current music
		dc.w 13*8		; Current bank
		dc.w 1			; Current music
		dc.w 13*8		; Current bank
		dc.w 0			; Current music
		dc.w 14*8		; Current bank
		dc.w 0			; Current music
		dc.w 15*8		; Current bank
		dc.w 0			; Current music
		dc.w 16*8		; Current bank
		dc.w 1			; Current music
		dc.w 16*8		; Current bank
		dc.w 2			; Current music
		dc.w 16*8		; Current bank
		dc.w 0			; Current music
		dc.w 17*8		; Current bank
		dc.w 1			; Current music
		dc.w 17*8		; Current bank

; =============== S U B R O U T I N E =======================================

byte_1E7914:
		dc.b 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0, 0, $F3, $76, 0
AdvancedZ80_Player:		binclude "Sound/Advanced Z80 Player/Z80 Sound Driver.bin"
	even
						include "Sound/Advanced Z80 Player/Music/Music.asm"