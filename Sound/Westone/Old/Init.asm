
; =============== S U B R O U T I N E =======================================

SndZ80DrvInit:
		resetZ80
		stopZ80
		lea	(Z80WestoneMWDriver).l,a0
		lea	(Z80_RAM).l,a1
		jsr	(Kos_Decomp).l
		moveq	#0,d0
-		move.b	d0,(a1)+
		cmpa.l	#(Z80_RAM_end),a1
		bne.s	-
		resetZ80a
		nop
		nop
		nop
		nop
		startZ80
		resetZ80
		rts
; End of function SndZ80DrvInit

; =============== S U B R O U T I N E =======================================

PlaySound:
		lea	(Z80_RAM+$1C00).l,a0

-		stopZ80
		tst.b	(a0)
		beq.s	+
		startZ80
		moveq	#$1F,d1

		dbf	d1,*
		bra.s	--
; ---------------------------------------------------------------------------
+		move.b	$2E(a0),d1
		add.b	$2F(a0),d1
		andi.w	#$F,d1
		addi.w	#$30,d1
		move.b	d0,(a0,d1.w)
		addq.b	#1,$2F(a0)
		startZ80
		rts
; End of function PlaySound

; =============== S U B R O U T I N E =======================================

	align $8000

Z80WestoneMWDriver:	binclude "Sound/Westone/Z80 Westone Driver(MW).bin"
	even