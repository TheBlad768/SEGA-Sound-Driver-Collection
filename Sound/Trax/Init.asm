
			align $8000
   if MOMPASS=1
		message " Trax Sound Driver Music Data ROM offset is $\{*}"
    endif
SndMusicData:		binclude "Sound/Trax/Music Data.bin"
	even
; ---------------------------------------------------------------------------
; C7Eh, C80h - Music bank offset - X, XX(0Fh, 80h)
; C85h, 0C87h - Samples bank offset. - X, XX(0Fh, 00h)
; ---------------------------------------------------------------------------

		include "Sound/Trax/Macros.asm"

   if MOMPASS=1
		message "Trax Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

Trax_LoadData:
		stopZ80
		lea	LoadTraxBank_Index(pc),a0
		lea	$C7E(a1),a1	; Music bank pointer
		move.b	(a0)+,(a1)+
		move.b	(a0)+,1(a1)
		startZ80
		rts
; End of function SndZ80TraxDrvInit
; ---------------------------------------------------------------------------

LoadTraxBank_Index:
		setSndTrax_OffsetData SndMusicData

; =============== S U B R O U T I N E =======================================

StopSound_Trax:
		moveq	#1,d1				; Setting
		bsr.s	PlaySound_TraxStart
		move.w	#$F0,d0
		moveq	#5,d1				; Setting
		bsr.s	PlaySound_TraxStart
		moveq	#1,d1				; Setting
		bra.s	PlaySound_TraxStart

; =============== S U B R O U T I N E =======================================

PlaySound_Trax:
		move.w	d0,-(sp)
		moveq	#1,d1				; Setting
		bsr.s	PlaySound_TraxStart
		move.w	#$F0,d0
		moveq	#5,d1				; Setting
		bsr.s	PlaySound_TraxStart
		move.w  (sp)+,d0
		moveq	#0,d1

PlaySound_TraxStart:
		stopZ80a
		resetZ80
		waitZ80
		movem.l	d0-d2/a0,-(sp)
		lea	(Z80_RAM+$E0).l,a0
		moveq	#0,d2
		move.b	(Z80_RAM+9).l,d2
		move.b	d0,(a0,d2.w)			; Current song
		move.b	d1,1(a0,d2.w)
		addq.b	#2,(Z80_RAM+9).l
		andi.b	#$1E,(Z80_RAM+9).l
		movem.l	(sp)+,d0-d2/a0
		startZ80
		rts
; End of function PlaySound_Trax

; =============== S U B R O U T I N E =======================================

SndZ80TraxDriver:	binclude "Sound/Trax/Z80 Sound Driver.bin"
	even