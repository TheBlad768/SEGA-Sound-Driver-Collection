; Ancient Music Driver -MD- 68000 Program Version 1.0.
; Copyright (C) 1993-1994 Ancient corp., Programmed By Hideki Koyama.
; Updated driver version the Mucom Music Driver.
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Ancient Music Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverAncientRAM		= SoundDriverRAM
SndDriverAncientRAM2	= (SndDriverAncientRAM+$100)

; =============== S U B R O U T I N E =======================================

UpdateMusic_Ancient:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		tst.b	(SndDriverAncientRAM+6).l
		beq.s	loc_1A80EA
		stopZ80
		tst.b	(Z80_RAM+4).l
		bne.w	loc_1A8206
		movea.l	(SndDriverAncientRAM).l,a4
		bsr.w	sub_1A8216
		sf	(SndDriverAncientRAM+6).l
		startZ80

loc_1A80EA:
		lea	(SndDriverAncientRAM+$C).l,a5
		tst.b	(SndDriverAncientRAM+8).l
		beq.s	loc_1A812E
		sf	(SndDriverAncientRAM+8).l
		move.b	(SndDriverAncientRAM+$A).l,d0
		cmp.b	$10(a5),d0
		bcs.s	loc_1A8128
		move.b	d0,$10(a5)
		move.b	(SndDriverAncientRAM+9).l,d0
		lea	(SndDriverAncientRAM2+$43E).l,a6
		move.b	d0,$79(a6)
		st	(SndDriverAncientRAM+7).l

loc_1A8128:
		sf	(SndDriverAncientRAM+$A).l

loc_1A812E:
		lea	(SndDriverAncientRAM2+$600).l,a4
		moveq	#6,d7
		lea	(SndDriverAncientRAM2+$43E).l,a6
		bsr.w	sub_1A9C62
		moveq	#0,d7
		lea	(SndDriverAncientRAM+$1E).l,a6
		bsr.w	sub_1A8B14
		addq.w	#1,d7
		lea	(SndDriverAncientRAM+$C2).l,a6
		bsr.w	sub_1A8B14
		addq.w	#1,d7
		lea	(SndDriverAncientRAM2+$66).l,a6
		bsr.w	sub_1A8B14
		moveq	#4,d7
		lea	(SndDriverAncientRAM2+$2F6).l,a6
		bsr.w	sub_1A8B14
		addq.w	#1,d7
		lea	(SndDriverAncientRAM2+$39A).l,a6
		bsr.w	sub_1A8B14
		lea	(PSG_input).l,a3
		moveq	#0,d7
		move.b	#$80,d7
		lea	(SndDriverAncientRAM2+$10A).l,a6
		bsr.w	sub_1A951A
		move.b	#$A0,d7
		lea	(SndDriverAncientRAM2+$1AE).l,a6
		bsr.w	sub_1A951A
		move.b	#$C0,d7
		lea	(SndDriverAncientRAM2+$252).l,a6
		bsr.w	sub_1A951A
		move.l	#$80000002,d7
		lea	(SndDriverAncientRAM2+$4B8).l,a6
		bsr.w	sub_1A8B14
		lea	(PSG_input).l,a3
		move.l	#$800000C0,d7
		lea	(SndDriverAncientRAM2+$55C).l,a6
		bsr.w	sub_1A951A
		stopZ80
		tst.b	(Z80_RAM+4).l
		beq.s	loc_1A8202
		st	(SndDriverAncientRAM+6).l
		move.l	a4,(SndDriverAncientRAM).l
		bra.s	loc_1A8206
; ---------------------------------------------------------------------------

loc_1A8202:
		bsr.s	sub_1A8216

loc_1A8206:
		startZ80
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function UpdateMusic_Ancient

; =============== S U B R O U T I N E =======================================

sub_1A8216:
		tst.b	(SndDriverAncientRAM+7).l
		beq.s	loc_1A8230
		sf	(SndDriverAncientRAM+7).l
		st	(Z80_RAM+5).l
		bra.s	loc_1A824E
; ---------------------------------------------------------------------------

loc_1A8230:
		tst.b	(Z80_RAM+5).l
		bne.s	loc_1A824E
		tst.b	(Z80_RAM+6).l
		bne.s	loc_1A824E
		lea	(SndDriverAncientRAM2+$43E).l,a6
		sf	$19(a6)

loc_1A824E:
		lea	(SndDriverAncientRAM2+$600).l,a0
		suba.l	a0,a4
		move.w	a4,d0
		lea	(Z80_RAM+$17).l,a1
		subq.w	#1,d0

-		move.b	(a0)+,(a1)+
		dbf	d0,-
		st	(Z80_RAM+4).l
		rts
; End of function sub_1A8216

; =============== S U B R O U T I N E =======================================

Play_Music_Ancient:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d1-a6,-(sp)
		andi.w	#$FF,d0
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		lsl.w	#2,d0
		lea	MusicBank_Ancient(pc),a0
		adda.l	(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		lea	(SndDriverAncientRAM+$C).l,a5
		bra.w	loc_1A84F8
; End of function Play_Music_Ancient

; =============== S U B R O U T I N E =======================================

Play_Sound_Ancient:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d1-a6,-(sp)
		lea	(SndDriverAncientRAM+$C).l,a5
		move.w	d0,d2
		andi.w	#$FF00,d2
		bne.s	loc_1A82C4
		tst.b	d0
		beq.s	loc_1A8312
		cmpi.b	#1,d0
		beq.w	loc_1A8336
		cmpi.b	#2,d0
		beq.w	loc_1A8466
		cmpi.b	#3,d0
		beq.w	loc_1A8364
		cmpi.b	#4,d0
		beq.w	loc_1A8386
		cmpi.b	#5,d0
		beq.w	loc_1A83A0
		cmpi.b	#6,d0
		beq.w	loc_1A83AA
		bra.w	loc_1A88EC
; ---------------------------------------------------------------------------

loc_1A82C4:
		cmpi.w	#$100,d2		; Play Music
		beq.w	loc_1A84F8
		cmpi.w	#$200,d2		; Play Sample
		beq.w	loc_1A886E
		bra.w	loc_1A88EC
; End of function Play_Sound_Ancient

; =============== S U B R O U T I N E =======================================

sub_1A82E8:
		lea	(SndDriverAncientRAM2+$4B8).l,a6
		bset	#4,(a6)
		lea	(SndDriverAncientRAM2+$55C).l,a6
		bset	#4,(a6)
		lea	$E(a5),a0
		sf	(a0)+
		sf	(a0)+
		sf	(a0)+
		sf	(SndDriverAncientRAM+$A).l
		rts
; End of function sub_1A82E8
; ---------------------------------------------------------------------------

loc_1A8312:
		bsr.w	sub_1A88F6
		bset	#0,$C(a5)
		sf	(SndDriverAncientRAM+6).l
		bsr.s	sub_1A82E8
		sf	(SndDriverAncientRAM+7).l
		sf	(SndDriverAncientRAM+8).l
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A8336:
		move.b	#2,8(a5)
		move.b	#$7E,9(a5)
		bset	#1,$C(a5)
		bclr	#2,$C(a5)
		bclr	#3,$C(a5)
		bset	#5,$C(a5)
		bset	#6,$C(a5)
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A8364:
		move.b	#2,8(a5)
		move.b	#$1A,9(a5)
		bset	#1,$C(a5)
		bclr	#2,$C(a5)
		bset	#3,$C(a5)
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A8386:
		clr.b	9(a5)
		bclr	#1,$C(a5)
		bset	#2,$C(a5)
		bclr	#3,$C(a5)
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A83A0:
		bset	#4,$C(a5)
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A83AA:
		moveq	#0,d0
		btst	#4,(SndDriverAncientRAM+$1E).l
		bne.s	loc_1A83BC
		ori.w	#1,d0

loc_1A83BC:
		btst	#4,(SndDriverAncientRAM+$C2).l
		bne.s	loc_1A83CC
		ori.w	#2,d0

loc_1A83CC:
		btst	#4,(SndDriverAncientRAM2+$66).l
		bne.s	loc_1A83DC
		ori.w	#4,d0

loc_1A83DC:
		btst	#4,(SndDriverAncientRAM2+$10A).l
		bne.s	loc_1A83EC
		ori.w	#8,d0

loc_1A83EC:
		btst	#4,(SndDriverAncientRAM2+$1AE).l
		bne.s	loc_1A83FC
		ori.w	#$10,d0

loc_1A83FC:
		btst	#4,(SndDriverAncientRAM2+$252).l
		bne.s	loc_1A840C
		ori.w	#$20,d0

loc_1A840C:
		btst	#4,(SndDriverAncientRAM2+$2F6).l
		bne.s	loc_1A841C
		ori.w	#$40,d0

loc_1A841C:
		btst	#4,(SndDriverAncientRAM2+$39A).l
		bne.s	loc_1A842C
		ori.w	#$80,d0

loc_1A842C:
		btst	#4,(SndDriverAncientRAM2+$43E).l
		bne.s	loc_1A843E
		ori.l	#$100,d0

loc_1A843E:
		btst	#4,(SndDriverAncientRAM2+$4B8).l
		bne.s	loc_1A8450
		ori.l	#$200,d0

loc_1A8450:
		btst	#4,(SndDriverAncientRAM2+$55C).l
		bne.s	loc_1A8462
		ori.l	#$400,d0

loc_1A8462:
		bra.w	loc_1A88E4
; ---------------------------------------------------------------------------

loc_1A8466:
		move.b	#3,d1
		move.b	#$F7,d2
		move.b	#2,d3
		lea	(SndDriverAncientRAM+$1E).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	(SndDriverAncientRAM+$C2).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	(SndDriverAncientRAM2+$66).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	(SndDriverAncientRAM2+$10A).l,a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	(SndDriverAncientRAM2+$1AE).l,a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	(SndDriverAncientRAM2+$252).l,a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	(SndDriverAncientRAM2+$2F6).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	(SndDriverAncientRAM2+$39A).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	(SndDriverAncientRAM2+$43E).l,a6
		ori.b	#4,1(a6)
		bclr	#0,$C(a5)
		bra.w	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A84F8:
		lea	(SoundDriverMusicRAM).l,a0
		move.l	a0,-(sp)
		stopZ80
		move.b	#$83,(Z80_RAM+3).l
		startZ80
		bsr.w	PSGSilenceAll_Ancient
		bsr.w	sub_1A82E8
		movea.l	(sp)+,a0
		sf	(SndDriverAncientRAM+6).l
		sf	$C(a5)
		sf	(SndDriverAncientRAM+7).l
		sf	(SndDriverAncientRAM+8).l
		move.l	a0,d1
		addq.l	#2,a0
		moveq	#0,d3
		move.b	1(a0),d3
		lsl.w	#8,d3
		move.b	(a0),d3
		addq.l	#2,a0
		add.l	d1,d3
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM+$1E).l,a6
		bsr.w	sub_1A86E8
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM+$C2).l,a6
		bsr.w	sub_1A86E8
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$66).l,a6
		bsr.w	sub_1A86E8
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$10A).l,a6
		bsr.w	sub_1A8786
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$1AE).l,a6
		bsr.w	sub_1A8786
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$252).l,a6
		bsr.w	sub_1A8786
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$2F6).l,a6
		bsr.s	sub_1A86E8
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$39A).l,a6
		bsr.s	sub_1A86E8
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	(SndDriverAncientRAM2+$43E).l,a6
		bsr.w	sub_1A8814
		bra.w	loc_1A88E2

; =============== S U B R O U T I N E =======================================

sub_1A86E8:
		add.l	d1,d2
		move.l	d2,2(a6)
		move.l	d3,$C(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.s	sub_1A870E
		add.l	d1,d0
		move.l	d0,$22(a6)
; End of function sub_1A86E8

; =============== S U B R O U T I N E =======================================

sub_1A870E:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	#4,1(a6)
		move.b	d0,$79(a6)
		move.b	d0,$74(a6)
		move.w	#$101,6(a6)
		move.w	d0,$20(a6)
		move.w	d0,$7C(a6)
		move.w	d0,8(a6)
		st	$77(a6)
		move.b	d0,$76(a6)
		move.b	#3,$17(a6)
		move.b	d0,$1B(a6)
		move.b	d0,$18(a6)
		move.b	d0,$15(a6)
		move.b	#8,$16(a6)
		move.b	d0,$1A(a6)
		move.b	d0,$27(a6)
		move.l	d0,$28(a6)
		move.l	d0,$2C(a6)
		move.b	d0,$8D(a6)
		move.b	d0,$8E(a6)
		move.b	d0,$7A(a6)
		move.b	d0,$7B(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.s	locret_1A8784
		bset	#4,(a6)

locret_1A8784:
		rts
; End of function sub_1A870E

; =============== S U B R O U T I N E =======================================

sub_1A8786:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.s	sub_1A87A8
		add.l	d1,d0
		move.l	d0,$22(a6)
; End of function sub_1A8786

; =============== S U B R O U T I N E =======================================

sub_1A87A8:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	d0,1(a6)
		move.w	#$101,6(a6)
		move.b	d0,$74(a6)
		st	$1C(a6)
		move.w	d0,$20(a6)
		move.w	d0,$7C(a6)
		move.w	d0,8(a6)
		move.b	#4,$75(a6)
		st	$77(a6)
		move.b	d0,$76(a6)
		move.b	d0,$18(a6)
		move.b	d0,$14(a6)
		move.b	#7,$15(a6)
		move.b	#8,$16(a6)
		move.b	d0,$1A(a6)
		move.b	d0,$1B(a6)
		move.b	d0,$27(a6)
		move.l	d0,$28(a6)
		move.l	d0,$2C(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.s	locret_1A8812
		bset	#4,(a6)

locret_1A8812:
		rts
; End of function sub_1A87A8

; =============== S U B R O U T I N E =======================================

sub_1A8814:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.s	loc_1A8836
		add.l	d1,d0
		move.l	d0,$22(a6)

loc_1A8836:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	d0,1(a6)
		move.w	#$101,6(a6)
		move.b	#3,$17(a6)
		move.b	d0,$18(a6)
		move.b	d0,$27(a6)
		move.l	d0,$28(a6)
		move.l	d0,$2C(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.s	locret_1A886C
		bset	#4,(a6)

locret_1A886C:
		rts
; End of function sub_1A8814
; ---------------------------------------------------------------------------

loc_1A886E:
		tst.b	(SndDriverAncientRAM+6).l
		bne.s	loc_1A88C2
		lea	(SndDriverAncientRAM2+$43E).l,a6
		tst.b	$19(a6)
		bne.s	loc_1A88A4
		tst.b	(SndDriverAncientRAM+7).l
		bne.s	loc_1A88A4
		move.b	d0,$79(a6)
		swap	d0
		move.b	d0,$10(a5)
		st	(SndDriverAncientRAM+7).l
		bra.s	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A88A4:
		swap	d0
		cmp.b	$10(a5),d0
		bcs.s	loc_1A88E2
		move.b	d0,$10(a5)
		swap	d0
		move.b	d0,$79(a6)
		st	(SndDriverAncientRAM+7).l
		bra.s	loc_1A88E2
; ---------------------------------------------------------------------------

loc_1A88C2:
		swap	d0
		cmp.b	(SndDriverAncientRAM+$A).l,d0
		bcs.s	loc_1A88E2
		move.b	d0,(SndDriverAncientRAM+$A).l
		swap	d0
		move.b	d0,(SndDriverAncientRAM+9).l
		st	(SndDriverAncientRAM+8).l

loc_1A88E2:
		moveq	#0,d0

loc_1A88E4:
		movem.l	(sp)+,d1-a6
		move	(sp)+,sr
		rts
; ---------------------------------------------------------------------------

loc_1A88EC:
		moveq	#-1,d0
		movem.l	(sp)+,d1-a6
		move	(sp)+,sr
		rts

; =============== S U B R O U T I N E =======================================

sub_1A88F6:
		bsr.s	sub_1A8900
		bra.s	PSGSilenceAll_Ancient
; End of function sub_1A88F6

; =============== S U B R O U T I N E =======================================

sub_1A8900:
		stopZ80
		move.b	#$81,(Z80_RAM+3).l
		startZ80
		rts
; End of function sub_1A8900

; =============== S U B R O U T I N E =======================================

PSGSilenceAll_Ancient:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)
		move.b	#$BF,(a0)
		move.b	#$DF,(a0)
		move.b	#$FF,(a0)
		rts
; End of function PSGSilenceAll_Ancient

; =============== S U B R O U T I N E =======================================

sub_1A8AA8:
		move.b	$7E(a6),$84(a6)
		move.b	$7F(a6),$85(a6)
		move.w	$82(a6),$86(a6)
		move.w	$80(a6),d6
		lsr.w	#1,d6
		move.w	d6,$88(a6)
		move.w	#0,$7C(a6)
		rts
; End of function sub_1A8AA8

; =============== S U B R O U T I N E =======================================

sub_1A8ACC:
		btst	#6,(a6)
		beq.s	locret_1A8B12
		tst.b	$84(a6)
		beq.s	loc_1A8AE6
		subq.b	#1,$84(a6)
		bra.s	locret_1A8B12
; ---------------------------------------------------------------------------

loc_1A8AE6:
		subq.b	#1,$85(a6)
		bne.s	locret_1A8B12
		move.b	$7F(a6),$85(a6)
		tst.w	$88(a6)
		bne.s	loc_1A8B06
		neg.w	$86(a6)
		move.w	$80(a6),$88(a6)

loc_1A8B06:
		subq.w	#1,$88(a6)
		move.w	$86(a6),d0
		add.w	d0,$7C(a6)

locret_1A8B12:
		rts
; End of function sub_1A8ACC

; =============== S U B R O U T I N E =======================================

sub_1A8B14:
		btst	#$1F,d7
		bne.s	loc_1A8B26
		btst	#0,$C(a5)
		bne.s	loc_1A8B34

loc_1A8B26:
		move.b	d7,$D(a5)
		btst	#4,(a6)
		beq.s	loc_1A8B3A

loc_1A8B34:
		move.b	#-1,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_1A8B3A:
		btst	#2,d7
		beq.s	loc_1A8B44
		subq.w	#4,d7

loc_1A8B44:
		bsr.w	sub_1A8FDC
		subq.b	#1,7(a6)
		bne.s	loc_1A8B98
		btst	#1,(a6)
		bne.s	loc_1A8B98
		bclr	#2,(a6)
		btst	#5,$74(a6)
		bne.s	loc_1A8B80
		btst	#6,1(a6)
		bne.s	loc_1A8B98
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+
		bra.s	loc_1A8B98
; ---------------------------------------------------------------------------

loc_1A8B80:
		moveq	#0,d0
		move.b	$16(a6),d0
		add.b	$73(a6),d0
		lsr.b	#1,d0
		lea	FMInstrumentOperatorTableA(pc),a1
		move.b	(a1,d0.w),d0
		bsr.w	sub_1A908C

loc_1A8B98:
		subq.b	#1,6(a6)
		bne.w	loc_1A8CA6
		andi.b	#$F2,(a6)

loc_1A8BA6:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_1A90FC
		tst.b	d2
		bne.s	loc_1A8BC4
		bsr.w	sub_1A92C4
		bra.w	loc_1A910A
; ---------------------------------------------------------------------------

loc_1A8BC4:
		bclr	#7,d2
		bne.w	loc_1A8C46
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	$77(a6),$76(a6)
		move.b	d0,$77(a6)
		move.b	$76(a6),d3
		cmp.b	d0,d3
		bne.s	loc_1A8BF4
		btst	#1,(a6)
		bne.s	loc_1A8BF8

loc_1A8BF4:
		bsr.w	sub_1A8AA8

loc_1A8BF8:
		move.w	d0,d3
		andi.b	#$F,d0
		add.w	d0,d0
		lea	FMFrequenciesA(pc),a2
		move.w	(a2,d0.w),d1
		andi.w	#$F0,d3
		lsl.w	#7,d3
		or.w	d3,d1
		move.w	d1,$A(a6)
		move.b	d2,6(a6)
		move.b	$18(a6),d6
		cmp.b	d6,d2
		bhi.s	loc_1A8C26
		moveq	#1,d2
		bra.s	loc_1A8C28
; ---------------------------------------------------------------------------

loc_1A8C26:
		sub.b	d6,d2

loc_1A8C28:
		move.b	d2,7(a6)
		bset	#5,1(a6)
		btst	#5,$74(a6)
		beq.s	loc_1A8C8E
		bset	#1,1(a6)
		bra.s	loc_1A8C8E
; ---------------------------------------------------------------------------

loc_1A8C46:
		btst	#1,(a6)
		bne.s	loc_1A8C86
		btst	#4,$74(a6)
		bne.s	loc_1A8C64
		btst	#5,$74(a6)
		bne.s	loc_1A8C7A

loc_1A8C64:
		btst	#6,1(a6)
		bne.s	loc_1A8C74
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+

loc_1A8C74:
		move.w	#-1,8(a6)

loc_1A8C7A:
		bclr	#2,(a6)
		bset	#3,(a6)

loc_1A8C86:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_1A8C8E:
		bclr	#1,(a6)
		beq.s	loc_1A8C9E
		bset	#0,(a6)

loc_1A8C9E:
		bsr.w	sub_1A984A
		move.l	a0,2(a6)

loc_1A8CA6:
		bsr.w	sub_1A8ACC
		btst	#$1F,d7
		bne.s	loc_1A8CFE
		btst	#2,$C(a5)
		beq.s	loc_1A8CF2
		subq.b	#1,$71(a6)
		bne.w	loc_1A8D7A
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		bcc.s	loc_1A8CD6
		move.b	#0,$70(a6)

loc_1A8CD6:
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.w	loc_1A8D6E
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.w	loc_1A8D6E
; ---------------------------------------------------------------------------

loc_1A8CF2:
		btst	#1,$C(a5)
		beq.w	loc_1A8D7A
		bra.s	loc_1A8D08
; ---------------------------------------------------------------------------

loc_1A8CFE:
		btst	#5,$C(a5)
		beq.w	loc_1A8D7A

loc_1A8D08:
		bset	#3,1(a6)
		bne.s	loc_1A8D22
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_1A8D22:
		subq.b	#1,$71(a6)
		bne.w	loc_1A8D7A
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.w	loc_1A8D6E
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.w	loc_1A8D6E
		clr.l	$22(a6)
		bset	#4,(a6)
		btst	#6,1(a6)
		bne.s	loc_1A8D68
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+

loc_1A8D68:
		move.b	#-1,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_1A8D6E:
		move.b	$A(a5),$71(a6)
		bset	#1,1(a6)

loc_1A8D7A:
		bclr	#0,1(a6)
		bne.w	loc_1A8EE8

loc_1A8D84:
		bclr	#2,1(a6)
		bne.w	loc_1A8FB6

loc_1A8D8E:
		bclr	#1,1(a6)
		bne.w	loc_1A9078

loc_1A8D98:
		bclr	#7,(a6)
		bne.w	loc_1A8F60

loc_1A8DA2:
		move.w	$A(a6),d0
		add.w	$20(a6),d0
		add.w	$7C(a6),d0
		move.w	d0,8(a6)
		btst	#6,1(a6)
		bne.w	loc_1A8E72
		tst.b	$1A(a6)
		beq.w	loc_1A8E54
		move.b	d7,d1
		andi.b	#3,d1
		cmpi.b	#2,d1
		bne.w	loc_1A8E54
		lea	$1C(a6),a0
		moveq	#0,d2
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		lsr.w	#8,d3
		move.b	#1,(a4)+
		move.b	#$A6,(a4)+
		move.b	d3,(a4)+
		move.b	#1,(a4)+
		move.b	#$A2,(a4)+
		move.b	d1,(a4)+
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		ror.w	#8,d3
		move.b	#1,(a4)+
		move.b	#$AC,(a4)+
		move.b	d3,(a4)+
		move.b	#1,(a4)+
		move.b	#$A8,(a4)+
		move.b	d1,(a4)+
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		ror.w	#8,d3
		move.b	#1,(a4)+
		move.b	#$AD,(a4)+
		move.b	d3,(a4)+
		move.b	#1,(a4)+
		move.b	#$A9,(a4)+
		move.b	d1,(a4)+
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		lsr.w	#8,d3
		move.b	#1,(a4)+
		move.b	#$AE,(a4)+
		move.b	d3,(a4)+
		move.b	#1,(a4)+
		move.b	#$AA,(a4)+
		move.b	d1,(a4)+
		bra.s	loc_1A8E72
; ---------------------------------------------------------------------------

loc_1A8E54:
		move.w	d0,d1
		ror.w	#8,d0
		addi.b	#-$5C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d0,(a4)+
		subq.b	#4,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d1,(a4)+
		subi.b	#$A0,d7

loc_1A8E72:
		move.b	#3,(a4)+
		move.b	#$27,(a4)+
		move.b	$1A(a6),(a4)+
		bclr	#5,1(a6)
		beq.s	loc_1A8EC2
		move.b	$D(a5),d6
		ori.b	#$F0,d6
		btst	#5,$74(a6)
		beq.s	loc_1A8EB4
		btst	#0,(a6)
		bne.s	loc_1A8EC2
		btst	#6,1(a6)
		bne.s	loc_1A8EC2
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+

loc_1A8EB4:
		btst	#6,1(a6)
		bne.s	loc_1A8EC2
		move.b	#0,(a4)+
		move.b	d6,(a4)+

loc_1A8EC2:
		move.b	$D(a5),d7
		move.b	#-1,(a4)+
		rts
; End of function sub_1A8B14

; =============== S U B R O U T I N E =======================================

sub_1A8ECC:
		addi.w	#$80,d7
		moveq	#-1,d1
		moveq	#3,d0

-		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d1,(a4)+
		addq.w	#4,d7
		dbf	d0,-
		subi.w	#$90,d7
		rts
; End of function sub_1A8ECC
; ---------------------------------------------------------------------------

loc_1A8EE8:
		btst	#6,1(a6)
		bne.s	loc_1A8F4C
		btst	#5,$74(a6)
		beq.s	loc_1A8F0E
		btst	#4,$74(a6)
		bne.s	loc_1A8F0E
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+

loc_1A8F0E:
		bsr.s	sub_1A8ECC
		moveq	#0,d1
		move.b	$14(a6),d1
		movea.l	$C(a6),a0
		mulu.w	#$19,d1
		lea	(a0,d1.w),a0
		move.l	a0,$10(a6)
		addi.w	#$30,d7
		move.b	#2,(a4)+
		move.b	d7,(a4)+
		subi.w	#$30,d7
		moveq	#$17,d5

-		move.b	(a0)+,(a4)+
		dbf	d5,-
		move.b	(a0)+,d1
		move.b	d1,$19(a6)
		move.b	d1,(a4)+
		ori.b	#6,1(a6)

loc_1A8F4C:
		bclr	#7,1(a6)
		beq.w	loc_1A8D84
		move.w	#0,8(a6)
		bra.w	loc_1A8D84
; ---------------------------------------------------------------------------

loc_1A8F60:
		moveq	#0,d2
		move.b	$7A(a6),d2
		beq.s	loc_1A8F96
		move.b	d2,$7B(a6)
		btst	#6,1(a6)
		bne.s	loc_1A8F8C
		subq.w	#1,d2
		lea	$90(a6),a1

-		move.b	#1,(a4)+
		move.b	(a1)+,(a4)+
		move.b	(a1)+,(a4)+
		dbf	d2,-

loc_1A8F8C:
		move.b	#0,$7A(a6)
		bra.w	loc_1A8DA2
; ---------------------------------------------------------------------------

loc_1A8F96:
		move.b	$7B(a6),d2
		beq.w	loc_1A8DA2
		subq.w	#1,d2
		lea	$90(a6),a1

-		move.b	#1,(a4)+
		move.b	(a1)+,(a4)+
		move.b	(a1)+,(a4)+
		dbf	d2,-
		bra.w	loc_1A8DA2
; ---------------------------------------------------------------------------

loc_1A8FB6:
		btst	#6,1(a6)
		bne.s	loc_1A8FD8
		move.b	$17(a6),d2
		ror.b	#2,d2
		or.b	$1B(a6),d2
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

loc_1A8FD8:
		bra.w	loc_1A8D8E

; =============== S U B R O U T I N E =======================================

sub_1A8FDC:
		btst	#1,$79(a6)
		beq.w	locret_1A9076
		subq.b	#1,$A2(a6)
		bne.w	locret_1A9076
		move.b	$A1(a6),$A2(a6)
		cmpi.b	#4,$A0(a6)
		beq.s	loc_1A902E
		cmpi.b	#5,$A0(a6)
		beq.w	loc_1A9044
		lea	(SndDriverAncientRAM+4).l,a1

loc_1A900E:
		move.w	(a1),d0
		move.w	d0,d1
		lsl.w	#2,d0
		add.w	d1,d0
		addi.w	#$1993,d0
		move.w	d0,(a1)
		ror.w	#8,d0
		andi.b	#3,d0
		beq.s	loc_1A900E
		move.b	d0,$17(a6)
		bra.s	loc_1A9052
; ---------------------------------------------------------------------------

loc_1A902E:
		cmpi.b	#3,$17(a6)
		bcs.s	loc_1A903C
		clr.b	$17(a6)

loc_1A903C:
		addq.b	#1,$17(a6)
		bra.s	loc_1A9052
; ---------------------------------------------------------------------------

loc_1A9044:
		subq.b	#1,$17(a6)
		bne.s	loc_1A9052
		move.b	#3,$17(a6)

loc_1A9052:
		btst	#6,1(a6)
		bne.s	locret_1A9076
		move.b	$17(a6),d2
		ror.b	#2,d2
		or.b	$1B(a6),d2
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

locret_1A9076:
		rts
; End of function sub_1A8FDC
; ---------------------------------------------------------------------------

loc_1A9078:
		move.b	$15(a6),d0
		bsr.s	sub_1A908C
		bra.w	loc_1A8D98
; ---------------------------------------------------------------------------

byte_1A9084:
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 3
		dc.b 7
		dc.b 7
		dc.b $F

; =============== S U B R O U T I N E =======================================

sub_1A908C:
		btst	#6,1(a6)
		bne.w	locret_1A90FA
		movea.l	$10(a6),a1
		addq.l	#4,a1
		move.b	$19(a6),d2
		andi.w	#7,d2
		move.b	byte_1A9084(pc,d2.w),d2
		ror.b	#3,d2
		moveq	#3,d3
		moveq	#$40,d4
		add.b	d7,d4

loc_1A90B0:
		move.b	(a1)+,d1
		btst	#0,d2
		beq.s	loc_1A90F2
		move.b	d0,d1
		add.b	(a5),d1
		bcs.s	loc_1A90E6
		btst	#7,d1
		bne.s	loc_1A90E6
		btst	#3,1(a6)
		beq.s	loc_1A90DE
		add.b	$70(a6),d1
		bcs.s	loc_1A90E6

loc_1A90DE:
		btst	#7,d1
		beq.s	loc_1A90EA

loc_1A90E6:
		move.b	#$7F,d1

loc_1A90EA:
		move.b	#1,(a4)+
		move.b	d4,(a4)+
		move.b	d1,(a4)+

loc_1A90F2:
		addq.b	#4,d4
		rol.b	#1,d2
		dbf	d3,loc_1A90B0

locret_1A90FA:
		rts
; End of function sub_1A908C
; ---------------------------------------------------------------------------

loc_1A90FC:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_1A912A(pc,d2.w),d2
		jsr	off_1A912A(pc,d2.w)

loc_1A910A:
		btst	#4,(a6)
		bne.s	loc_1A911C
		move.l	a0,2(a6)
		bra.w	loc_1A8BA6
; ---------------------------------------------------------------------------

loc_1A911C:
		move.l	a0,2(a6)
		move.b	$D(a5),d7
		move.b	#-1,(a4)+
		rts
; ---------------------------------------------------------------------------

off_1A912A:
		dc.w sub_1A91A2-off_1A912A
		dc.w sub_1A91B6-off_1A912A
		dc.w sub_1A91F2-off_1A912A
		dc.w sub_1A9216-off_1A912A
		dc.w sub_1A93FC-off_1A912A
		dc.w sub_1A936A-off_1A912A
		dc.w sub_1A938A-off_1A912A
		dc.w sub_1A94F8-off_1A912A
		dc.w sub_1A921E-off_1A912A
		dc.w sub_1A9A62-off_1A912A
		dc.w sub_1A9288-off_1A912A
		dc.w sub_1A933A-off_1A912A
		dc.w sub_1A94A0-off_1A912A
		dc.w sub_1A92BC-off_1A912A
		dc.w sub_1A93D2-off_1A912A
		dc.w sub_1A914A-off_1A912A

; =============== S U B R O U T I N E =======================================

sub_1A914A:
		moveq	#0,d2
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_1A915E(pc,d2.w),d2
		jmp	off_1A915E(pc,d2.w)
; ---------------------------------------------------------------------------

off_1A915E:
		dc.w sub_1A9A62-off_1A915E
		dc.w sub_1A9A62-off_1A915E
		dc.w sub_1A9A66-off_1A915E
		dc.w sub_1A916A-off_1A915E
		dc.w sub_1A918C-off_1A915E
		dc.w sub_1A9178-off_1A915E

; =============== S U B R O U T I N E =======================================

sub_1A916A:
		move.b	(a0)+,d0
		move.b	d0,$73(a6)

loc_1A9170:
		bset	#5,$74(a6)
		rts

; =============== S U B R O U T I N E =======================================

sub_1A9178:
		move.b	(a0)+,d0
		bne.s	loc_1A9170
		bclr	#5,$74(a6)
		bset	#1,1(a6)
		rts
; End of function sub_1A9178

; =============== S U B R O U T I N E =======================================

sub_1A918C:
		move.b	(a0)+,d0
		beq.s	sub_1A919A
		bset	#4,$74(a6)
		rts
; End of function sub_1A918C

; =============== S U B R O U T I N E =======================================

sub_1A919A:
		bclr	#4,$74(a6)
		rts
; End of function sub_1A919A

; =============== S U B R O U T I N E =======================================

sub_1A91A2:
		move.b	(a0)+,d0
		move.b	d0,$14(a6)
		bset	#0,1(a6)
		move.b	#0,$7B(a6)
		rts
; End of function sub_1A91A2

; =============== S U B R O U T I N E =======================================

sub_1A91B6:
		moveq	#0,d0
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.s	loc_1A91C6
		add.b	$78(a6),d0

loc_1A91C6:
		tst.b	d0
		bcc.s	loc_1A91D0
		moveq	#0,d0
		bra.s	loc_1A91DA
; ---------------------------------------------------------------------------

loc_1A91D0:
		cmpi.b	#$13,d0
		bls.s		loc_1A91DA
		moveq	#$13,d0

loc_1A91DA:
		move.b	d0,$16(a6)

loc_1A91DE:
		lea	FMInstrumentOperatorTableA(pc),a1
		move.b	(a1,d0.w),d0
		move.b	d0,$15(a6)
		bset	#1,1(a6)
		rts

; =============== S U B R O U T I N E =======================================

sub_1A91F2:
		sf	$77(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		bsr.w	sub_1A9490
		tst.b	(a0)+
		bne.s	loc_1A9210
		move.w	d0,$20(a6)
		rts
; ---------------------------------------------------------------------------

loc_1A9210:
		add.w	d0,$20(a6)
		rts
; End of function sub_1A91F2

; =============== S U B R O U T I N E =======================================

sub_1A9216:
		move.b	(a0)+,d0
		move.b	d0,$18(a6)
		rts
; End of function sub_1A9216

; =============== S U B R O U T I N E =======================================

sub_1A921E:
		move.b	(a0)+,d0
		cmpi.b	#4,d0
		bcc.s	sub_1A923A
		move.b	d0,$17(a6)
		bset	#2,1(a6)
		bclr	#1,$79(a6)
		rts
; End of function sub_1A921E

; =============== S U B R O U T I N E =======================================

sub_1A923A:
		move.b	d0,$A0(a6)
		move.b	(a0)+,d1
		move.b	d1,$A1(a6)
		move.b	d1,$A2(a6)
		bset	#1,$79(a6)
		cmpi.b	#4,d0
		bne.s	sub_1A9264
		move.b	#2,$17(a6)
		bset	#2,1(a6)
		rts
; End of function sub_1A923A

; =============== S U B R O U T I N E =======================================

sub_1A9264:
		cmpi.b	#5,d0
		bne.s	loc_1A927A
		move.b	#1,$17(a6)
		bset	#2,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_1A927A:
		move.b	#3,$17(a6)
		bset	#2,1(a6)
		rts
; End of function sub_1A9264

; =============== S U B R O U T I N E =======================================

sub_1A9288:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		cmpi.b	#8,$7A(a6)
		beq.s	locret_1A92BA
		cmpi.b	#$26,d0
		beq.s	locret_1A92BA
		lea	$90(a6),a1
		moveq	#0,d2
		move.b	$7A(a6),d2
		add.w	d2,d2
		adda.w	d2,a1
		move.b	d0,(a1)+
		move.b	d1,(a1)
		bset	#7,(a6)
		addq.b	#1,$7A(a6)

locret_1A92BA:
		rts
; End of function sub_1A9288

; =============== S U B R O U T I N E =======================================

sub_1A92BC:
		bset	#1,(a6)
		rts
; End of function sub_1A92BC

; =============== S U B R O U T I N E =======================================

sub_1A92C4:
		tst.l	$22(a6)
		beq.s	loc_1A92E4
		btst	#$1F,d7
		bne.s	loc_1A92E4
		btst	#4,$C(a5)
		bne.s	loc_1A92E4
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_1A92E4:
		btst	#6,1(a6)
		bne.s	loc_1A92F4
		move.b	#0,(a4)+
		move.b	$D(a5),(a4)+

loc_1A92F4:
		bset	#4,(a6)
		clr.b	$1A(a6)
		btst	#$1F,d7
		beq.s	locret_1A9338
		bsr.w	sub_1A8ECC
		lea	(SndDriverAncientRAM2+$66).l,a1
		bclr	#6,1(a1)
		bset	#0,1(a1)
		bset	#7,(a1)
		bset	#7,1(a1)
		clr.b	$E(a5)
		move.b	#3,(a4)+
		move.b	#$27,(a4)+
		move.b	#0,(a4)+

locret_1A9338:
		rts
; End of function sub_1A92C4

; =============== S U B R O U T I N E =======================================

sub_1A933A:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$16(a6)
		bpl.s	loc_1A934C
		sf	$16(a6)
		bra.s	loc_1A935C
; ---------------------------------------------------------------------------

loc_1A934C:
		cmpi.b	#$13,$16(a6)
		bls.s		loc_1A935C
		move.b	#$13,$16(a6)

loc_1A935C:
		move.b	$16(a6),d0
		bra.w	loc_1A91DE
; End of function sub_1A933A

; =============== S U B R O U T I N E =======================================

sub_1A9364:
		move.l	a0,$22(a6)
		rts
; End of function sub_1A9364

; =============== S U B R O U T I N E =======================================

sub_1A936A:
		addq.l	#2,a0
		moveq	#0,d0
		move.b	$27(a6),d0
		lea	$28(a6),a1
		lea	$30(a6),a2
		clr.b	(a1,d0.w)
		lsl.w	#2,d0
		move.l	a0,(a2,d0.w)
		addq.b	#1,$27(a6)
		rts
; End of function sub_1A936A

; =============== S U B R O U T I N E =======================================

sub_1A938A:
		moveq	#0,d0
		move.b	$27(a6),d0
		subq.b	#1,d0
		lea	$28(a6),a1
		lea	$30(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		tst.b	(a1,d0.w)
		bne.s	loc_1A93BC
		addq.l	#1,a0
		move.b	(a0)+,(a1,d0.w)
		addq.l	#2,a0
		move.l	a2,-(sp)
		lea	$50(a6),a2
		move.l	a0,(a2,d1.w)
		movea.l	(sp)+,a2
		subq.l	#4,a0

loc_1A93BC:
		subq.b	#1,(a1,d0.w)
		beq.s	loc_1A93CA
		movea.l	(a2,d1.w),a0
		bra.s	locret_1A93D0
; ---------------------------------------------------------------------------

loc_1A93CA:
		addq.l	#4,a0
		subq.b	#1,$27(a6)

locret_1A93D0:
		rts
; End of function sub_1A938A

; =============== S U B R O U T I N E =======================================

sub_1A93D2:
		addq.l	#2,a0
		moveq	#0,d0
		move.b	$27(a6),d0
		subq.b	#1,d0
		lea	$28(a6),a1
		lea	$50(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		cmpi.b	#1,(a1,d0.w)
		bne.s	locret_1A93FA
		movea.l	(a2,d1.w),a0
		subq.b	#1,$27(a6)

locret_1A93FA:
		rts
; End of function sub_1A93D2

; =============== S U B R O U T I N E =======================================

sub_1A93FC:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.w	d0,d0
		move.w	off_1A940C(pc,d0.w),d0
		jmp	off_1A940C(pc,d0.w)
; End of function sub_1A93FC
; ---------------------------------------------------------------------------

off_1A940C:
		dc.w sub_1A941A-off_1A940C
		dc.w sub_1A9432-off_1A940C
		dc.w sub_1A943A-off_1A940C
		dc.w sub_1A9442-off_1A940C
		dc.w sub_1A944E-off_1A940C
		dc.w sub_1A945A-off_1A940C
		dc.w sub_1A9480-off_1A940C

; =============== S U B R O U T I N E =======================================

sub_1A941A:
		bsr.w	sub_1A9442
		bsr.w	sub_1A944E
		bsr.w	sub_1A9466
		bsr.w	sub_1A9480
		bset	#6,(a6)
		rts
; End of function sub_1A941A

; =============== S U B R O U T I N E =======================================

sub_1A9432:
		bclr	#6,(a6)
		rts
; End of function sub_1A9432

; =============== S U B R O U T I N E =======================================

sub_1A943A:
		bset	#6,(a6)
		rts
; End of function sub_1A943A

; =============== S U B R O U T I N E =======================================

sub_1A9442:
		move.b	(a0)+,d0
		move.b	d0,$7E(a6)
		move.b	d0,$84(a6)
		rts
; End of function sub_1A9442

; =============== S U B R O U T I N E =======================================

sub_1A944E:
		move.b	(a0)+,d0
		move.b	d0,$7F(a6)
		move.b	d0,$85(a6)
		rts
; End of function sub_1A944E

; =============== S U B R O U T I N E =======================================

sub_1A945A:
		bsr.s	sub_1A9466
		move.b	$7F(a6),$85(a6)
		rts
; End of function sub_1A945A

; =============== S U B R O U T I N E =======================================

sub_1A9466:
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		bsr.w	sub_1A9490
		move.w	d0,$82(a6)
		move.w	d0,$86(a6)
		rts
; End of function sub_1A9466

; =============== S U B R O U T I N E =======================================

sub_1A9480:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$80(a6)
		lsr.w	#1,d0
		move.w	d0,$88(a6)
		rts
; End of function sub_1A9480

; =============== S U B R O U T I N E =======================================

sub_1A9490:
		cmpi.b	#$80,d7
		bcs.s	locret_1A949E
		muls.w	#$10A,d0
		asr.l	#8,d0

locret_1A949E:
		rts
; End of function sub_1A9490

; =============== S U B R O U T I N E =======================================

sub_1A94A0:
		lea	$8A(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		lea	$8A(a6),a1
		move.b	(a1)+,d0
		ori.b	#8,d0
		btst	#6,1(a6)
		bne.s	loc_1A94C6
		move.b	#3,(a4)+
		move.b	#$22,(a4)+
		move.b	d0,(a4)+

loc_1A94C6:
		move.b	(a1)+,d0
		move.b	(a1)+,d1
		lsl.b	#4,d1
		or.b	d1,d0
		move.b	d0,$1B(a6)
		move.b	$17(a6),d2
		ror.b	#2,d2
		andi.b	#$C0,d2
		or.b	d0,d2
		btst	#6,1(a6)
		bne.s	locret_1A94F6
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

locret_1A94F6:
		rts
; End of function sub_1A94A0

; =============== S U B R O U T I N E =======================================

sub_1A94F8:
		lea	$1C(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)
		tst.l	$1C(a6)
		beq.s	loc_1A9514
		move.b	#$40,$1A(a6)
		rts
; ---------------------------------------------------------------------------

loc_1A9514:
		clr.b	$1A(a6)
		rts
; End of function sub_1A94F8

; =============== S U B R O U T I N E =======================================

sub_1A951A:
		btst	#$1F,d7
		bne.s	loc_1A952C
		btst	#0,$C(a5)
		bne.s	locret_1A9554

loc_1A952C:
		move.b	d7,$D(a5)
		btst	#6,1(a6)
		beq.s	loc_1A953E
		bsr.w	sub_1A98C0

loc_1A953E:
		tst.b	$1A(a6)
		beq.s	loc_1A954A
		move.b	$1A(a6),d7

loc_1A954A:
		btst	#4,(a6)
		beq.s	loc_1A9556

locret_1A9554:
		rts
; ---------------------------------------------------------------------------

loc_1A9556:
		subq.b	#1,7(a6)
		bne.s	loc_1A95B2
		btst	#1,(a6)
		bne.s	loc_1A95B2
		bclr	#2,(a6)
		btst	#4,1(a6)
		bne.s	loc_1A95A8
		btst	#5,$74(a6)
		bne.s	loc_1A958E
		sf	$1C(a6)
		bsr.w	sub_1A98B0
		bra.s	loc_1A95B2
; ---------------------------------------------------------------------------

loc_1A958E:
		move.b	$16(a6),d0
		sub.b	$73(a6),d0
		lsr.b	#1,d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_1A98C8
		bra.s	loc_1A95B2
; ---------------------------------------------------------------------------

loc_1A95A8:
		andi.b	#$F8,$74(a6)
		bsr.w	sub_1A99A4

loc_1A95B2:
		subq.b	#1,6(a6)
		bne.w	loc_1A96C0
		andi.b	#$F2,(a6)

loc_1A95C0:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_1A99F8
		tst.b	d2
		bne.s	loc_1A95DE
		bsr.w	sub_1A9BF8
		bra.w	loc_1A9A06
; ---------------------------------------------------------------------------

loc_1A95DE:
		bclr	#7,d2
		bne.w	loc_1A967C
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d3
		move.b	(a0)+,d3
		move.b	$77(a6),$76(a6)
		move.b	d3,$77(a6)
		cmp.b	$76(a6),d3
		bne.s	loc_1A9612
		btst	#1,(a6)
		bne.s	loc_1A9642

loc_1A9612:
		bsr.w	sub_1A8AA8
		btst	#1,(a6)
		bne.s	loc_1A9642
		btst	#4,1(a6)
		beq.s	loc_1A9642
		ori.b	#1,$74(a6)
		move.b	$8A(a6),$1C(a6)
		movem.l	d2-d3,-(sp)
		bsr.w	sub_1A99B8
		movem.l	(sp)+,d2-d3

loc_1A9642:
		move.w	d3,d4
		lea	PSGFrequenciesA(pc),a2
		andi.b	#$F,d3
		add.w	d3,d3
		move.w	(a2,d3.w),d0
		lsr.w	#4,d4
		lsr.w	d4,d0
		move.b	d4,$75(a6)
		move.w	d0,$A(a6)
		move.b	d2,6(a6)
		move.b	$18(a6),d6
		cmp.b	d6,d2
		bhi.s	loc_1A9672
		move.b	6(a6),d2
		bra.s	loc_1A9674
; ---------------------------------------------------------------------------

loc_1A9672:
		sub.b	d6,d2

loc_1A9674:
		move.b	d2,7(a6)
		bra.s	loc_1A96B2
; ---------------------------------------------------------------------------

loc_1A967C:
		btst	#1,(a6)
		bne.s	loc_1A96AA
		btst	#4,$74(a6)
		bne.s	loc_1A969A
		btst	#5,$74(a6)
		bne.s	loc_1A96A4

loc_1A969A:
		bsr.w	sub_1A98B0
		move.w	#-1,8(a6)

loc_1A96A4:
		bset	#3,(a6)

loc_1A96AA:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_1A96B2:
		bclr	#1,(a6)
		bsr.w	sub_1A984A
		move.l	a0,2(a6)

loc_1A96C0:
		btst	#4,1(a6)
		beq.s	loc_1A96D2
		bsr.w	sub_1A990C
		bra.s	loc_1A96EC
; ---------------------------------------------------------------------------

loc_1A96D2:
		btst	#2,(a6)
		beq.s	loc_1A96EC
		move.b	$16(a6),d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_1A98C8

loc_1A96EC:
		bsr.w	sub_1A8ACC
		btst	#$1F,d7
		bne.s	loc_1A9744
		btst	#2,$C(a5)
		beq.s	loc_1A9738
		subq.b	#1,$71(a6)
		bne.w	loc_1A97C2
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		bcc.s	loc_1A971C
		move.b	#0,$70(a6)

loc_1A971C:
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.s	loc_1A97AE
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.s	loc_1A97AE
; ---------------------------------------------------------------------------

loc_1A9738:
		btst	#1,$C(a5)
		beq.s	loc_1A97C2
		bra.s	loc_1A974E
; ---------------------------------------------------------------------------

loc_1A9744:
		btst	#6,$C(a5)
		beq.s	loc_1A97C2

loc_1A974E:
		bset	#3,1(a6)
		bne.s	loc_1A9768
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_1A9768:
		subq.b	#1,$71(a6)
		bne.s	loc_1A97C2
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.s	loc_1A97AE
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.s	loc_1A97AE
		clr.l	$22(a6)
		bset	#4,(a6)
		btst	#6,1(a6)
		bne.s	locret_1A97AC
		bsr.w	sub_1A98C0

locret_1A97AC:
		rts
; ---------------------------------------------------------------------------

loc_1A97AE:
		move.b	$A(a5),$71(a6)
		btst	#2,(a6)
		bne.s	loc_1A97C2
		bsr.w	sub_1A98C8

loc_1A97C2:
		move.w	$20(a6),d0
		add.w	$7C(a6),d0
		moveq	#0,d1
		move.b	$75(a6),d1
		asr.w	d1,d0
		add.w	$A(a6),d0
		cmpi.w	#1,d0
		bge.s	loc_1A97E2
		moveq	#1,d0
		bra.s	loc_1A97EE
; ---------------------------------------------------------------------------

loc_1A97E2:
		cmpi.w	#$3FF,d0
		ble.s		loc_1A97EE
		move.w	#$3FF,d0

loc_1A97EE:
		cmp.w	8(a6),d0
		beq.s	locret_1A9820
		move.w	d0,8(a6)
		cmpi.b	#$E0,d7
		beq.s	loc_1A9822
		btst	#6,1(a6)
		bne.s	locret_1A9820
		move.w	d0,d1
		andi.b	#$F,d0
		or.b	$D(a5),d0
		move.b	d0,(a3)
		lsr.w	#4,d1
		andi.b	#$3F,d1
		move.b	d1,(a3)

locret_1A9820:
		rts
; ---------------------------------------------------------------------------

loc_1A9822:
		move.b	$1B(a6),d1
		andi.b	#3,d1
		cmpi.b	#3,d1
		beq.s	loc_1A9834
		rts
; ---------------------------------------------------------------------------

loc_1A9834:
		move.w	d0,d1
		andi.b	#$F,d0
		or.b	$D(a5),d0
		move.b	d0,(a3)
		lsr.w	#4,d1
		andi.b	#$3F,d1
		move.b	d1,(a3)
		rts
; End of function sub_1A951A

; =============== S U B R O U T I N E =======================================

sub_1A984A:
		cmpi.b	#$FD,(a0)
		bne.s	loc_1A985C
		bset	#1,(a6)
		addq.l	#1,a0
		rts
; ---------------------------------------------------------------------------

loc_1A985C:
		cmpi.b	#$F4,(a0)
		beq.s	loc_1A9866
		rts
; ---------------------------------------------------------------------------

loc_1A9866:
		tst.b	1(a0)
		beq.s	loc_1A988E
		cmpi.b	#1,1(a0)
		beq.s	loc_1A987A
		rts
; ---------------------------------------------------------------------------

loc_1A987A:
		cmpi.b	#$FD,2(a0)
		beq.s	loc_1A9886
		rts
; ---------------------------------------------------------------------------

loc_1A9886:
		bset	#1,(a6)
		rts
; ---------------------------------------------------------------------------

loc_1A988E:
		cmpi.b	#$FD,7(a0)
		beq.s	loc_1A9886
		cmpi.b	#$F4,7(a0)
		beq.s	loc_1A98A4
		rts
; ---------------------------------------------------------------------------

loc_1A98A4:
		cmpi.b	#$FD,9(a0)
		beq.s	loc_1A9886
		rts
; End of function sub_1A984A

; =============== S U B R O U T I N E =======================================

sub_1A98B0:
		cmpi.b	#$E0,d7
		beq.s	locret_1A98BE
		moveq	#$1F,d0
		or.b	d7,d0
		move.b	d0,(a3)

locret_1A98BE:
		rts
; End of function sub_1A98B0

; =============== S U B R O U T I N E =======================================

sub_1A98C0:
		moveq	#$1F,d0
		or.b	d7,d0
		move.b	d0,(a3)
		rts
; End of function sub_1A98C0

; =============== S U B R O U T I N E =======================================

sub_1A98C8:
		btst	#6,1(a6)
		bne.s	loc_1A9902
		move.b	$15(a6),d0
		btst	#3,1(a6)
		beq.s	loc_1A98E8
		move.b	$70(a6),d1
		lsr.b	#3,d1
		add.b	d1,d0

loc_1A98E8:
		cmpi.b	#$10,d0
		bcs.s	loc_1A98F2
		moveq	#$F,d0

loc_1A98F2:
		ori.b	#$10,d0
		move.b	d7,d1
		andi.b	#$F0,d1
		or.b	d1,d0
		move.b	d0,(a3)
		rts
; ---------------------------------------------------------------------------

loc_1A9902:
		move.b	d7,d0
		ori.b	#$1F,d0
		move.b	d0,(a3)
		rts
; End of function sub_1A98C8

; =============== S U B R O U T I N E =======================================

sub_1A990C:
		btst	#0,$74(a6)
		beq.s	loc_1A993E
		move.b	$1C(a6),d0
		move.b	$8B(a6),d1
		add.b	d1,d0
		bcc.s	loc_1A9928
		move.b	#-1,d0

loc_1A9928:
		move.b	d0,$1C(a6)
		cmpi.b	#-1,d0
		bne.s	sub_1A99B8
		eori.b	#3,$74(a6)
		bra.s	sub_1A99B8
; ---------------------------------------------------------------------------

loc_1A993E:
		btst	#1,$74(a6)
		beq.s	loc_1A9976
		move.b	$1C(a6),d0
		move.b	$8C(a6),d1
		move.b	$8D(a6),d2
		sub.b	d1,d0
		bcs.s	loc_1A9960
		cmp.b	d2,d0
		bcc.s	loc_1A9962

loc_1A9960:
		move.b	d2,d0

loc_1A9962:
		move.b	d0,$1C(a6)
		cmp.b	d2,d0
		bne.s	sub_1A99B8
		eori.b	#6,$74(a6)
		bra.s	sub_1A99B8
; ---------------------------------------------------------------------------

loc_1A9976:
		btst	#2,$74(a6)
		beq.s	sub_1A99A4
		move.b	$1C(a6),d0
		move.b	$8E(a6),d1
		sub.b	d1,d0
		bcc.s	loc_1A9990
		moveq	#0,d0

loc_1A9990:
		move.b	d0,$1C(a6)
		tst.b	d0
		bne.s	sub_1A99B8
		andi.b	#$F8,$74(a6)
		bra.s	sub_1A99B8
; End of function sub_1A990C

; =============== S U B R O U T I N E =======================================

sub_1A99A4:
		move.b	$1C(a6),d0
		move.b	$8F(a6),d1
		sub.b	d1,d0
		bcc.s	loc_1A99B4
		moveq	#0,d0

loc_1A99B4:
		move.b	d0,$1C(a6)
; End of function sub_1A99A4

; =============== S U B R O U T I N E =======================================

sub_1A99B8:
		moveq	#0,d0
		move.b	$1C(a6),d0
		moveq	#0,d2
		move.b	$16(a6),d2
		addq.b	#1,d2
		mulu.w	d2,d0
		lsr.w	#8,d0
		btst	#2,(a6)
		bne.s	loc_1A99E4
		btst	#5,$74(a6)
		beq.s	loc_1A99E4
		add.b	$73(a6),d0
		lsr.b	#1,d0

loc_1A99E4:
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_1A98C8
		move.b	$1C(a6),$17(a6)
		rts
; End of function sub_1A99B8
; ---------------------------------------------------------------------------

loc_1A99F8:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_1A9A1E(pc,d2.w),d2
		jsr	off_1A9A1E(pc,d2.w)

loc_1A9A06:
		btst	#4,(a6)
		bne.s	loc_1A9A18
		move.l	a0,2(a6)
		bra.w	loc_1A95C0
; ---------------------------------------------------------------------------

loc_1A9A18:
		move.l	a0,2(a6)

locret_1A9A1C:
		rts
; ---------------------------------------------------------------------------

off_1A9A1E: offsetTable
		offsetTableEntry.w sub_1A9A90
		offsetTableEntry.w sub_1A9ACA
		offsetTableEntry.w sub_1A9A40
		offsetTableEntry.w sub_1A9216
		offsetTableEntry.w sub_1A93FC
		offsetTableEntry.w sub_1A936A
		offsetTableEntry.w sub_1A938A
		offsetTableEntry.w sub_1A9B3A
		offsetTableEntry.w sub_1A9BA4
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9A78
		offsetTableEntry.w sub_1A9B06
		offsetTableEntry.w locret_1A9A1C
		offsetTableEntry.w locret_1A9A1C
		offsetTableEntry.w sub_1A93D2
		offsetTableEntry.w sub_1A914A

; =============== S U B R O U T I N E =======================================

sub_1A9A40:
		move.w	#0,8(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.b	(a0)+
		bne.s	loc_1A9A5C
		move.w	d0,$20(a6)
		rts
; ---------------------------------------------------------------------------

loc_1A9A5C:
		add.w	d0,$20(a6)
		rts
; End of function sub_1A9A40

; =============== S U B R O U T I N E =======================================

sub_1A9A62:
		move.b	(a0)+,d0
		rts
; End of function sub_1A9A62

; =============== S U B R O U T I N E =======================================

sub_1A9A66:
		addq.l	#1,a0
		move.b	(a0)+,d0
		rts
; End of function sub_1A9A66

; =============== S U B R O U T I N E =======================================

sub_1A9A6C:
		addq.l	#2,a0
		move.b	(a0)+,d0
		rts
; End of function sub_1A9A6C

; =============== S U B R O U T I N E =======================================

sub_1A9A72:
		addq.l	#3,a0
		move.b	(a0)+,d0
		rts
; End of function sub_1A9A72

; =============== S U B R O U T I N E =======================================

sub_1A9A78:
		lea	$8A(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		bset	#4,1(a6)
		rts
; End of function sub_1A9A78

; =============== S U B R O U T I N E =======================================

sub_1A9A90:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	d0,$14(a6)
		lea	PSG_Tone(pc),a1
		lea	$8A(a6),a2
		add.w	d0,d0
		adda.w	d0,a1
		add.w	d0,d0
		adda.w	d0,a1
		move.b	(a1)+,(a2)+
		move.b	(a1)+,(a2)+
		move.b	(a1)+,(a2)+
		move.b	(a1)+,(a2)+
		move.b	(a1)+,(a2)+
		move.b	(a1)+,(a2)+
		bset	#4,1(a6)
		bclr	#7,1(a6)
		beq.s	locret_1A9AC8
		move.w	d0,8(a6)

locret_1A9AC8:
		rts
; End of function sub_1A9A90

; =============== S U B R O U T I N E =======================================

sub_1A9ACA:
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.s	loc_1A9ADA
		add.b	$78(a6),d0
		bra.s	loc_1A9AE4
; ---------------------------------------------------------------------------

loc_1A9ADA:
		subq.b	#1,d0
		bcc.s	loc_1A9AE4
		moveq	#0,d0
		bra.s	loc_1A9AF8
; ---------------------------------------------------------------------------

loc_1A9AE4:
		tst.b	d0
		bcc.s	loc_1A9AEE
		moveq	#0,d0
		bra.s	loc_1A9AF8
; ---------------------------------------------------------------------------

loc_1A9AEE:
		cmpi.b	#$F,d0
		bls.s		loc_1A9AF8
		moveq	#$F,d0

loc_1A9AF8:
		move.b	d0,$16(a6)
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		rts
; End of function sub_1A9ACA

; =============== S U B R O U T I N E =======================================

sub_1A9B06:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$16(a6)
		cmpi.b	#$F,$16(a6)
		ble.s		loc_1A9B20
		move.b	#$F,$16(a6)
		bra.s	loc_1A9B2C
; ---------------------------------------------------------------------------

loc_1A9B20:
		tst.b	$16(a6)
		bge.s	loc_1A9B2C
		sf	$16(a6)

loc_1A9B2C:
		move.b	$16(a6),d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		rts
; End of function sub_1A9B06

; =============== S U B R O U T I N E =======================================

sub_1A9B3A:
		move.b	(a0)+,d0
		cmpi.b	#8,d0
		beq.s	loc_1A9B8C
		move.b	#$E0,d1
		move.b	d1,$1A(a6)
		move.b	d1,d7
		tst.b	d0
		bne.s	loc_1A9B6E
		move.b	$1B(a6),d0
		andi.b	#3,d0
		move.b	d0,$1B(a6)
		or.b	d1,d0
		btst	#6,1(a6)
		bne.s	locret_1A9B6C
		move.b	d0,(a3)

locret_1A9B6C:
		rts
; ---------------------------------------------------------------------------

loc_1A9B6E:
		move.b	$1B(a6),d0
		andi.b	#3,d0
		ori.b	#4,d0
		move.b	d0,$1B(a6)
		or.b	d1,d0
		btst	#6,1(a6)
		bne.s	locret_1A9B8A
		move.b	d0,(a3)

locret_1A9B8A:
		rts
; ---------------------------------------------------------------------------

loc_1A9B8C:
		sf	$1A(a6)
		move.b	$D(a5),d7
		move.b	#-1,d0
		btst	#6,1(a6)
		bne.s	locret_1A9BA2
		move.b	d0,(a3)

locret_1A9BA2:
		rts
; End of function sub_1A9B3A

; =============== S U B R O U T I N E =======================================

sub_1A9BA4:
		move.b	(a0)+,d0
		tst.b	$1A(a6)
		beq.s	locret_1A9BF6
		cmpi.b	#$20,d0
		bne.s	loc_1A9BBA
		moveq	#3,d1
		bra.s	loc_1A9BD2
; ---------------------------------------------------------------------------

loc_1A9BBA:
		moveq	#0,d1
		cmpi.b	#$B,d0
		bcs.s	loc_1A9BD2
		cmpi.b	#$16,d0
		bcc.s	loc_1A9BD0
		moveq	#1,d1
		bra.s	loc_1A9BD2
; ---------------------------------------------------------------------------

loc_1A9BD0:
		moveq	#2,d1

loc_1A9BD2:
		move.b	$1B(a6),d0
		andi.b	#$64,d0
		or.b	d0,d1
		move.b	d1,$1B(a6)
		move.b	$1A(a6),d0
		or.b	$1B(a6),d0
		btst	#6,1(a6)
		bne.s	loc_1A9BF2
		move.b	d0,(a3)

loc_1A9BF2:
		move.b	$1A(a6),d7

locret_1A9BF6:
		rts
; End of function sub_1A9BA4

; =============== S U B R O U T I N E =======================================

sub_1A9BF8:
		tst.l	$22(a6)
		beq.s	loc_1A9C18
		btst	#$1F,d7
		bne.s	loc_1A9C18
		btst	#4,$C(a5)
		bne.s	loc_1A9C18
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_1A9C18:
		bset	#4,(a6)
		bsr.w	sub_1A98B0
		btst	#$1F,d7
		beq.s	locret_1A9C60
		sf	$1A(a6)
		lea	(SndDriverAncientRAM2+$252).l,a2
		bclr	#6,1(a2)
		move.b	$1A(a2),d0
		beq.s	loc_1A9C50
		or.b	$1B(a2),d0
		move.b	d0,(a3)
		bra.s	loc_1A9C5C
; ---------------------------------------------------------------------------

loc_1A9C50:
		move.w	#0,8(a2)
		move.b	#-1,d0
		move.b	d0,(a3)

loc_1A9C5C:
		sf	$F(a5)

locret_1A9C60:
		rts
; End of function sub_1A9BF8

; =============== S U B R O U T I N E =======================================

sub_1A9C62:
		tst.b	(SndDriverAncientRAM+7).l
		beq.s	loc_1A9C78
		move.b	#$11,(a4)+
		move.b	$79(a6),(a4)+
		st	$19(a6)

loc_1A9C78:
		btst	#0,$C(a5)
		bne.s	loc_1A9C90
		move.b	d7,$D(a5)
		btst	#4,(a6)
		beq.s	loc_1A9C96

loc_1A9C90:
		move.b	#-1,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_1A9C96:
		btst	#2,d7
		beq.s	loc_1A9CA0
		subq.b	#4,d7

loc_1A9CA0:
		subq.b	#1,7(a6)
		subq.b	#1,6(a6)
		bne.s	loc_1A9D2E
		andi.b	#$F0,(a6)

loc_1A9CB2:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_1A9E58
		tst.b	d2
		bne.s	loc_1A9CD0
		bsr.w	sub_1A9EC2
		bra.w	loc_1A9E66
; ---------------------------------------------------------------------------

loc_1A9CD0:
		bclr	#7,d2
		bne.s	loc_1A9D16
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$A(a6)
		move.b	d2,6(a6)
		move.b	$18(a6),d6
		cmp.b	d6,d2
		bhi.s	loc_1A9D02
		move.b	#1,7(a6)
		bra.s	loc_1A9D08
; ---------------------------------------------------------------------------

loc_1A9D02:
		sub.b	d6,d2
		move.b	d2,7(a6)

loc_1A9D08:
		move.l	a0,2(a6)
		bset	#5,1(a6)
		bra.s	loc_1A9D2E
; ---------------------------------------------------------------------------

loc_1A9D16:
		bset	#3,(a6)
		bclr	#2,(a6)
		move.b	d2,6(a6)
		move.b	d2,7(a6)
		move.l	a0,2(a6)

loc_1A9D2E:
		btst	#2,$C(a5)
		beq.s	loc_1A9D6E
		subq.b	#1,$71(a6)
		bne.w	loc_1A9DDA
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		bcc.s	loc_1A9D52
		move.b	#0,$70(a6)

loc_1A9D52:
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.s	loc_1A9DCE
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.s	loc_1A9DCE
; ---------------------------------------------------------------------------

loc_1A9D6E:
		btst	#1,$C(a5)
		beq.s	loc_1A9DDA
		bset	#3,1(a6)
		bne.s	loc_1A9D92
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_1A9D92:
		subq.b	#1,$71(a6)
		bne.s	loc_1A9DDA
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.s	loc_1A9DCE
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.s	loc_1A9DCE
		clr.l	$22(a6)
		bset	#4,(a6)
		move.b	#-1,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_1A9DCE:
		move.b	$A(a5),$71(a6)
		bset	#1,1(a6)

loc_1A9DDA:
		bclr	#2,1(a6)
		bne.s	loc_1A9E36

loc_1A9DE4:
		nop
		bclr	#5,1(a6)
		beq.s	loc_1A9E2C
		btst	#6,1(a6)
		bne.s	loc_1A9E2C
		btst	#1,(a6)
		bne.s	loc_1A9E2C
		btst	#3,1(a6)
		beq.s	loc_1A9E18
		cmpi.b	#$1A,$70(a6)
		bcc.s	loc_1A9E2C

loc_1A9E18:
		tst.b	$19(a6)
		bne.s	loc_1A9E2C
		move.b	#$10,(a4)+
		move.b	$14(a6),d0
		subq.b	#1,d0
		move.b	d0,(a4)+

loc_1A9E2C:
		move.b	#-1,(a4)+
		move.b	$D(a5),d7
		rts
; ---------------------------------------------------------------------------

loc_1A9E36:
		btst	#6,1(a6)
		bne.s	loc_1A9E54
		move.b	$17(a6),d2
		ror.b	#2,d2
		move.b	#1,(a4)+
		addi.b	#-$4C,d7
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

loc_1A9E54:
		bra.s	loc_1A9DE4
; ---------------------------------------------------------------------------

loc_1A9E58:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_1A9E82(pc,d2.w),d2
		jsr	off_1A9E82(pc,d2.w)

loc_1A9E66:
		btst	#4,(a6)
		bne.s	loc_1A9E78
		move.l	a0,2(a6)
		bra.w	loc_1A9CB2
; ---------------------------------------------------------------------------

loc_1A9E78:
		move.l	a0,2(a6)
		move.b	#-1,(a4)+

locret_1A9E82:
		rts
; End of function sub_1A9C62
; ---------------------------------------------------------------------------

off_1A9E82: offsetTable
		offsetTableEntry.w sub_1A91A2
		offsetTableEntry.w sub_1A91B6
		offsetTableEntry.w sub_1A9A6C
		offsetTableEntry.w sub_1A9216
		offsetTableEntry.w sub_1A93FC
		offsetTableEntry.w sub_1A936A
		offsetTableEntry.w sub_1A938A
		offsetTableEntry.w sub_1A9A72
		offsetTableEntry.w sub_1A921E
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9EE2
		offsetTableEntry.w sub_1A933A
		offsetTableEntry.w locret_1A9E82
		offsetTableEntry.w sub_1A92BC
		offsetTableEntry.w sub_1A93D2
		offsetTableEntry.w sub_1A9EA2

; =============== S U B R O U T I N E =======================================

sub_1A9EA2:
		moveq	#0,d2
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_1A9EB6(pc,d2.w),d2
		jmp	off_1A9EB6(pc,d2.w)
; End of function sub_1A9EA2
; ---------------------------------------------------------------------------

off_1A9EB6: offsetTable
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9A66
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9A62
		offsetTableEntry.w sub_1A9A62

; =============== S U B R O U T I N E =======================================

sub_1A9EC2:
		tst.l	$22(a6)
		beq.s	loc_1A9EDA
		btst	#4,$C(a5)
		bne.s	loc_1A9EDA
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_1A9EDA:
		bset	#4,(a6)
		rts
; End of function sub_1A9EC2

; =============== S U B R O U T I N E =======================================

sub_1A9EE2:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		btst	#6,1(a6)
		bne.s	locret_1A9EF6
		move.b	#3,(a4)+
		move.b	d0,(a4)+
		move.b	d1,(a4)+

locret_1A9EF6:
		rts
; End of function sub_1A9EE2

; =============== S U B R O U T I N E =======================================

			include "Sound/Ancient Music Driver (1.0)/Music/Misc.asm"
   if MOMPASS=1
		message " Ancient Music Driver Music Data ROM offset is $\{*}"
    endif
					include "Sound/Ancient Music Driver (1.0)/Music/Music Pointer.asm"
Z80AncientDriver:	binclude "Sound/Ancient Music Driver (1.0)/DAC Driver (Z80).bin"
	even

; =============== S U B R O U T I N E =======================================

			include "Sound/Ancient Music Driver (1.0)/DAC/Samples.asm"