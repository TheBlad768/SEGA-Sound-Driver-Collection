; ---------------------------------------------------------------------------
; Sound Driver M68000 by Sega Falcom(Without SFX).
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Falcom Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverFalcomRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

UpdateMusic_Falcom:
		tst.b	(SndDriverFalcomRAM+$1C2).l
		beq.s	loc_CF52
		rts
; ---------------------------------------------------------------------------

loc_CF52:
		move.b	#1,(SndDriverFalcomRAM+$1C2).l
		addq.w	#1,(SndDriverFalcomRAM+$1B4).l
		move.b	(SndDriverFalcomRAM+$1BE).l,d0
		move.l	d0,-(sp)
		st	(SndDriverFalcomRAM+$1BE).l
		move.b	#3,(SndDriverFalcomRAM+$1BF).l
		clr.b	(SndDriverFalcomRAM+$1C0).l
		lea	(SndDriverFalcomRAM+$290).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$2B2).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		move.l	(sp)+,d0
		move.b	d0,(SndDriverFalcomRAM+$1BE).l
		tst.b	(SndDriverFalcomRAM+$1B7).l
		beq.s	loc_D036
		tst.b	(SndDriverFalcomRAM+$1B9).l
		bne.s	loc_D036
		move.b	(SndDriverFalcomRAM+$1BE).l,d0
		sub.b	(SndDriverFalcomRAM+$1B8).l,d0
		bcs.s	loc_CFE6
		cmpi.b	#$1E,d0
		bcc.s	loc_CFF0

loc_CFE6:
		bsr.w	sub_D226
		bra.w	loc_D0CA
; ---------------------------------------------------------------------------

loc_CFF0:
		move.b	d0,(SndDriverFalcomRAM+$1BE).l
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		moveq	#2,d3

-		move.l	d3,-(sp)
		bsr.w	sub_D8F0
		move.l	(sp)+,d3
		adda.l	#$22,a1
		dbf	d3,-
		lea	(SndDriverFalcomRAM+$22A).l,a1
		moveq	#2,d3

-		move.l	d3,-(sp)
		bsr.w	sub_D8F0
		move.l	(sp)+,d3
		adda.l	#$22,a1
		dbf	d3,-

loc_D036:
		clr.b	(SndDriverFalcomRAM+$1BF).l
		btst	#0,(SndDriverFalcomRAM+$1B6).l
		bne.s	loc_D0CA

loc_D056:
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$1E6).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$208).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$22A).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$24C).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		lea	(SndDriverFalcomRAM+$26E).l,a1
		bsr.w	sub_D54C
		bsr.w	sub_D624
		clr.b	(SndDriverFalcomRAM+$1C0).l

loc_D0CA:
		clr.b	(SndDriverFalcomRAM+$1C2).l
		rts
; End of function UpdateMusic_Falcom

; =============== S U B R O U T I N E =======================================

Load_PlayMusic_Falcom:
		disableInts2
		movem.l	d0-a6,-(sp)
		bsr.s	LoadMusic_Falcom
		bsr.w	PlayMusic_Falcom
		movem.l	(sp)+,d0-a6
		enableInts2
		rts
; End of function Load_PlayMusic_Falcom

; =============== S U B R O U T I N E =======================================

LoadMusic_Falcom:
		movem.l	d0-a6,-(sp)
		move.l	d0,-(sp)
		bsr.w	sub_D226
		move.l	(sp)+,d0
		andi.l	#$FF,d0
		move.b	d0,(SndDriverFalcomRAM+$1BD).l
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		lea	MusicFalcomIndex(pc),a0
		lsl.w	#2,d0
		adda.l	(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		movem.l	(sp)+,d0-a6
		rts
; End of function LoadMusic_Falcom

; =============== S U B R O U T I N E =======================================

PlayMusic_Falcom:
		clr.b	(SndDriverFalcomRAM+$2D5).l
		move.b	#1,(SndDriverFalcomRAM+$2D4).l
		move.b	#1,(SndDriverFalcomRAM+$1B6).l
		clr.b	(SndDriverFalcomRAM+$1B4).l
		bsr.w	sub_D244
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		eor.l	d0,d0
		moveq	#5,d4

-		move.l	#$20,d3
		lsr.l	#1,d3
		subq.l	#1,d3

-		move.w	d0,(a1)+
		dbf	d3,-
		addq.l	#2,a1
		dbf	d4,--
		lea	(SoundDriverMusicRAM).l,a1
		lea	(SndDriverFalcomRAM+$1C4).l,a2
		moveq	#0,d2
		moveq	#5,d3

loc_D15C:
		move.b	$21(a2),d0
		andi.b	#$40,d0
		ori.b	#$E,d0
		move.b	d0,$21(a2)
		move.b	#1,$A(a2)
		moveq	#0,d0
		move.b	1(a1),d0
		lsl.w	#8,d0
		move.b	(a1),d0
		addq.l	#2,a1
		addi.l	#SoundDriverMusicRAM,d0
		move.l	d0,(a2)
		move.b	#$7F,$E(a2)
		move.b	d2,d0
		cmpi.b	#3,d0
		bcs.s	loc_D1A0
		addq.b	#1,d0

loc_D1A0:
		move.b	d0,$20(a2)
		bsr.s	sub_CBD8
		addq.b	#1,d2
		adda.l	#$22,a2
		dbf	d3,loc_D15C
		bsr.s	sub_D1BE

locret_D1BC:
		rts
; End of function PlayMusic_Falcom

; =============== S U B R O U T I N E =======================================

sub_CBD8:
		movem.l	d0-a6,-(sp)
		movea.l	(a2),a4

loc_CBE0:
		move.b	(a4)+,d0
		cmpi.b	#$F0,d0
		bcc.s	loc_CBF6
		add.b	d0,d0
		bcs.s	loc_CBE0
		addq.l	#1,a4
		bra.s	loc_CBE0
; ---------------------------------------------------------------------------

loc_CBF6:
		cmpi.b	#$F6,d0
		beq.s	loc_CC1C
		cmpi.b	#-1,d0
		beq.s	loc_CC2C
		move.b	d0,d2
		andi.l	#$F,d2
		lea	byte_CC34(pc),a5
		adda.l	d2,a5
		move.b	(a5),d2
		adda.l	d2,a4
		bra.s	loc_CBE0
; ---------------------------------------------------------------------------

loc_CC1C:
		move.b	1(a4),d0
		move.b	d0,(a4)
		addq.l	#4,a4
		bra.s	loc_CBE0
; ---------------------------------------------------------------------------

loc_CC2C:
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_CBD8
; ---------------------------------------------------------------------------

byte_CC34:	dc.b 1, 1, 1, 1, 1, 1, 4, 5, 2, 6, 2, 0, 0, 2, 1, 2

; =============== S U B R O U T I N E =======================================

sub_D1BE:
		clr.b	(SndDriverFalcomRAM+$1B7).l
		st	(SndDriverFalcomRAM+$1BE).l
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		bsr.w	sub_D8F0
		lea	(SndDriverFalcomRAM+$1E6).l,a1
		bsr.w	sub_D8F0
		lea	(SndDriverFalcomRAM+$208).l,a1
		bsr.w	sub_D8F0
		lea	(SndDriverFalcomRAM+$22A).l,a1
		bsr.w	sub_D8F0
		lea	(SndDriverFalcomRAM+$24C).l,a1
		bsr.w	sub_D8F0
		lea	(SndDriverFalcomRAM+$26E).l,a1
		bsr.w	sub_D8F0
		clr.b	(SndDriverFalcomRAM+$1B6).l
		rts
; End of function sub_D1BE

; =============== S U B R O U T I N E =======================================

sub_D244:
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		moveq	#2,d3

-		move.b	$E(a1),d1
		move.b	#$7F,$E(a1)
		bsr.w	sub_D8F0
		move.b	d1,$E(a1)
		adda.l	#$22,a1
		dbf	d3,-
		lea	(SndDriverFalcomRAM+$22A).l,a1
		moveq	#2,d3

-		move.b	$E(a1),d1
		move.b	#$7F,$E(a1)
		bsr.w	sub_D8F0
		move.b	d1,$E(a1)
		adda.l	#$22,a1
		dbf	d3,-
		bra.s	sub_D376
; End of function sub_D244

; =============== S U B R O U T I N E =======================================

sub_D226:
		move.b	#1,(SndDriverFalcomRAM+$1B6).l
		bsr.s	sub_D244
		eor.w	d0,d0
		move.b	d0,(SndDriverFalcomRAM+$1B7).l
		move.b	d0,(SndDriverFalcomRAM+$1BE).l
		rts
; End of function sub_D226

; =============== S U B R O U T I N E =======================================

sub_D376:
		moveq	#$28,d0
		moveq	#2,d3
		bsr.w	sub_D510

loc_D37E:
		move.b	d3,d1
		bsr.w	sub_D47E
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		addq.b	#4,d1
		bsr.w	sub_D47E
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		dbf	d3,loc_D37E
		startZ80
		rts
; End of function sub_D376

; =============== S U B R O U T I N E =======================================

LoadFalcomData:
		bsr.w	sub_D226
		bra.s	Init_SoundDriver_Falcom
; End of function LoadFalcomData

; =============== S U B R O U T I N E =======================================

sub_D3E8:
		moveq	#$28,d0
		moveq	#0,d1
		move.b	$20(a1),d1
		bsr.s	sub_D434
		ori.b	#2,$21(a1)
		rts
; End of function sub_D3E8

; =============== S U B R O U T I N E =======================================

sub_D3FC:
		moveq	#$28,d0
		moveq	#0,d1
		move.b	$20(a1),d1
		ori.b	#$F0,d1
		bra.s	sub_D434
; End of function sub_D3FC

; =============== S U B R O U T I N E =======================================

Init_SoundDriver_Falcom:
		moveq	#$2B,d0
		move.b	#0,d1
		bsr.s	sub_D434
		st	(SndDriverFalcomRAM+$1BA).l
		lea	(SndDriverFalcomRAM+$1C4).l,a1
		moveq	#7,d3

-		move.b	#$80,$21(a1)
		adda.l	#$22,a1
		dbf	d3,-
		rts
; End of function Init_SoundDriver_Falcom

; =============== S U B R O U T I N E =======================================

sub_D434:
		movem.l	d0-d1,-(sp)
		bsr.w	sub_D510
		bsr.s	sub_D47E
		startZ80
		movem.l	(sp)+,d0-d1
		rts
; End of function sub_D434

; =============== S U B R O U T I N E =======================================

sub_D44E:
		movem.l	d0-d2,-(sp)
		btst	#2,$20(a1)
		bne.s	loc_D468
		add.b	$20(a1),d0
		bsr.s	sub_D47E
		bra.s	loc_D478
; ---------------------------------------------------------------------------

loc_D468:
		move.b	$20(a1),d2
		bclr	#2,d2
		add.b	d2,d0
		bsr.s	sub_D4C6

loc_D478:
		movem.l	(sp)+,d0-d2
		rts
; End of function sub_D44E

; =============== S U B R O U T I N E =======================================

sub_D47E:
		tst.b	(SndDriverFalcomRAM+$1C0).l
		bne.s	locret_D4C4
		lea	(ym2612_a0).l,a0
		move.l	d4,-(sp)
		moveq	#-1,d4

loc_D496:
		btst	#7,(a0)
		beq.s	loc_D4A2
		dbf	d4,loc_D496

loc_D4A2:
		move.l	(sp)+,d4
		move.b	d0,(a0)
		nop
		move.l	d4,-(sp)
		moveq	#-1,d4

-		btst	#7,(a0)
		beq.s	loc_D4BC
		dbf	d4,-

loc_D4BC:
		move.l	(sp)+,d4
		move.b	d1,1(a0)

locret_D4C4:
		rts
; End of function sub_D47E

; =============== S U B R O U T I N E =======================================

sub_D4C6:
		tst.b	(SndDriverFalcomRAM+$1C0).l
		bne.s	locret_D50E
		lea	(ym2612_a0).l,a0
		move.l	d4,-(sp)
		moveq	#-1,d4

-		btst	#7,(a0)
		beq.s	loc_D4EA
		dbf	d4,-

loc_D4EA:
		move.l	(sp)+,d4
		move.b	d0,2(a0)
		nop
		move.l	d4,-(sp)
		moveq	#-1,d4

-		btst	#7,(a0)
		beq.s	loc_D506
		dbf	d4,-

loc_D506:
		move.l	(sp)+,d4
		move.b	d1,3(a0)

locret_D50E:
		rts
; End of function sub_D4C6

; =============== S U B R O U T I N E =======================================

sub_D510:
		move.l	d4,-(sp)

-		move.w	#-1,d4
		stopZ80a

-		btst	#0,(Z80_bus_request).l
		beq.s	+
		dbf	d4,-
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		bra.s	--
; ---------------------------------------------------------------------------
+		move.l	(sp)+,d4
		rts
; End of function sub_D510

; =============== S U B R O U T I N E =======================================

sub_D54C:
		move.b	$21(a1),d0
		rol.b	#1,d0
		bcs.w	locret_D622
		move.b	#0,d1
		rol.b	#1,d0
		bcc.s	loc_D562
		subq.b	#1,d1

loc_D562:
		move.b	d1,(SndDriverFalcomRAM+$1C0).l
		btst	#0,$12(a1)
		bne.s	loc_D584
		move.b	$A(a1),d0
		cmp.b	$11(a1),d0
		bne.s	loc_D584
		bsr.w	sub_D3E8

loc_D584:
		subq.b	#1,$A(a1)
		bne.s	locret_D622
		btst	#0,$12(a1)
		bne.s	loc_D59C
		bsr.w	sub_D3E8

loc_D59C:
		movea.l	(a1),a2

loc_D5A0:
		move.b	(a2)+,d0
		cmpi.b	#$F0,d0
		bcs.s	loc_D5C2
		lea	CoordFlagFalcom_Index(pc),a4
		bsr.w	sub_CE22
		cmpi.l	#$12345678,d0
		bne.s	loc_D5A0
		rts
; ---------------------------------------------------------------------------

loc_D5C2:
		rol.b	#1,d0
		lsr.b	#1,d0
		bcs.s	loc_D60E
		move.b	d0,$A(a1)
		bsr.w	sub_D3FC
		move.b	(a2)+,d0
		move.l	a2,(a1)
		move.l	d2,-(sp)
		move.b	$12(a1),d1
		move.b	$12(a1),d2
		rol.b	#1,d0
		lsr.b	#1,d0
		roxl.b	#1,d2
		move.b	d2,$12(a1)
		move.l	(sp)+,d2
		ror.b	#1,d1
		bcc.s	loc_D602
		cmp.b	$F(a1),d0
		beq.s	loc_D608

loc_D602:
		ori.b	#1,$21(a1)

loc_D608:
		move.b	d0,$F(a1)
		rts
; ---------------------------------------------------------------------------

loc_D60E:
		move.b	d0,$A(a1)
		bsr.w	sub_D3E8
		clr.b	$12(a1)
		move.l	a2,(a1)

locret_D622:
		rts
; End of function sub_D54C

; =============== S U B R O U T I N E =======================================

sub_CDC4:
		move.b	$1B(a1),d0
		move.b	d0,$1D(a1)
		neg.w	6(a1)
		rts
; End of function sub_CDC4

; =============== S U B R O U T I N E =======================================

sub_CDD2:
		move.b	$1A(a1),d0
		btst	#1,$21(a1)
		beq.s	loc_CDF0
		move.w	4(a1),d0
		move.w	d0,6(a1)
		move.b	$19(a1),d0
		add.b	$1A(a1),d0

loc_CDF0:
		move.b	d0,$1C(a1)
		move.b	$1B(a1),d0
		lsr.b	#1,d0
		move.b	d0,$1D(a1)
		move.b	$21(a1),d0
		andi.b	#$FC,d0
		move.b	d0,$21(a1)
		rts
; End of function sub_CDD2

; =============== S U B R O U T I N E =======================================

sub_CE0C:
		move.b	$1A(a1),d0
		move.b	d0,$1C(a1)
		move.w	8(a1),d0
		add.w	6(a1),d0
		move.w	d0,8(a1)
		rts
; End of function sub_CE0C

; =============== S U B R O U T I N E =======================================

sub_CE22:
		andi.l	#$F,d0
		add.l	d0,d0
		move.w	(a4,d0.w),d0
		lea	(a4,d0.w),a4
		move.b	(a2)+,d0
		jmp	(a4)
; End of function sub_CE22
; ---------------------------------------------------------------------------

loc_CE34:
		move.b	d0,$11(a1)
		rts
; ---------------------------------------------------------------------------

loc_CE3A:
		move.b	d0,$10(a1)
		rts
; ---------------------------------------------------------------------------

loc_CE40:
		move.b	d0,(SndDriverFalcomRAM+$1C1).l
		rts
; ---------------------------------------------------------------------------

loc_CE4E:
		subq.l	#1,a2
		move.b	(a2),d0
		move.b	d0,$19(a1)
		move.b	1(a2),d0
		move.b	d0,$1A(a1)
		move.b	2(a2),d0
		move.b	d0,5(a1)
		move.b	3(a2),d0
		move.b	d0,4(a1)
		move.b	4(a2),d0
		move.b	d0,$1B(a1)
		addq.l	#5,a2
		andi.b	#$F7,$21(a1)
		ori.b	#1,$21(a1)
		ori.b	#2,$21(a1)
		rts
; ---------------------------------------------------------------------------

loc_CE96:
		cmpi.b	#$10,d0
		beq.s	loc_CEB4
		move.l	a1,-(sp)
		andi.l	#$FF,d0
		adda.l	d0,a1
		move.b	(a2)+,d0
		move.b	d0,(a1)
		movea.l	(sp)+,a1
		rts
; ---------------------------------------------------------------------------

loc_CEB4:
		move.b	(a2)+,d0
		and.b	d0,d0
		beq.s	loc_CECA
		andi.b	#$F7,$21(a1)
		ori.b	#2,$21(a1)
		rts
; ---------------------------------------------------------------------------

loc_CECA:
		ori.b	#8,$21(a1)
		rts
; ---------------------------------------------------------------------------

loc_CED2:
		move.b	(a2)+,d1
		bsr.w	sub_D434

locret_CEDA:
		rts
; ---------------------------------------------------------------------------

loc_CEDC:
		subq.l	#1,a2
		subq.b	#1,(a2)
		bne.s	loc_CEF6
		move.b	1(a2),d0
		move.b	d0,(a2)
		addq.l	#4,a2
		rts
; ---------------------------------------------------------------------------

loc_CEF6:
		moveq	#0,d0
		move.b	3(a2),d0
		lsl.w	#8,d0
		move.b	2(a2),d0
		addq.l	#4,a2
		suba.l	d0,a2
		rts
; ---------------------------------------------------------------------------

loc_CF0C:
		move.l	a2,-(sp)
		move.l	d0,-(sp)
		moveq	#0,d0
		move.b	(a2),d0
		lsl.w	#8,d0
		move.b	-1(a2),d0
		lea	(a2,d0.w),a2
		move.l	(sp)+,d0
		cmpi.b	#1,1(a2)
		bne.s	loc_CF38
		move.l	(sp)+,d7
		rts
; ---------------------------------------------------------------------------

loc_CF38:
		movea.l	(sp)+,a2
		addq.l	#1,a2
		rts

; =============== S U B R O U T I N E =======================================

sub_D624:
		btst	#7,$21(a1)
		bne.w	locret_D6DA
		btst	#0,$21(a1)
		beq.s	loc_D680
		move.b	$F(a1),d0
		bsr.w	sub_D96A
		move.w	d0,8(a1)
		move.l	#$A4,d0
		move.b	8(a1),d1
		bsr.w	sub_D510
		bsr.w	sub_D44E
		move.l	#$A0,d0
		move.b	9(a1),d1
		bsr.w	sub_D44E
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		bsr.w	sub_CDD2

loc_D680:
		btst	#3,$21(a1)
		bne.s	locret_D6DA
		subq.b	#1,$1C(a1)
		bne.s	locret_D6DA
		bsr.w	sub_CE0C
		move.l	#$A4,d0
		move.b	8(a1),d1
		bsr.w	sub_D510
		bsr.w	sub_D44E
		move.l	#$A0,d0
		move.b	9(a1),d1
		bsr.w	sub_D44E
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		subq.b	#1,$1D(a1)
		bne.s	locret_D6DA
		bsr.w	sub_CDC4

locret_D6DA:
		rts
; End of function sub_D624

; =============== S U B R O U T I N E =======================================

sub_D6DC:
		move.b	d0,$D(a1)
		bra.w	sub_D87C
; ---------------------------------------------------------------------------

loc_D6E8:
		move.l	a2,-(sp)
		lea	FMInstrumentOperatorTable_Falcom(pc),a2
		andi.l	#$FF,d0
		adda.l	d0,a2
		move.b	(a2),d0
		move.b	d0,$E(a1)
		movea.l	(sp)+,a2
		bra.w	sub_D8F0
; ---------------------------------------------------------------------------

loc_D70C:
		subq.l	#1,a2
		move.b	$E(a1),d0
		addq.b	#3,d0
		cmpi.b	#$80,d0
		bcs.s	loc_D724
		move.b	#$7F,d0

loc_D724:
		move.b	d0,$E(a1)
		bra.w	sub_D8F0
; ---------------------------------------------------------------------------

loc_D730:
		subq.l	#1,a2
		move.b	$E(a1),d0
		subq.b	#3,d0
		bcc.s	loc_D742
		moveq	#0,d0

loc_D742:
		move.b	d0,$E(a1)
		bra.w	sub_D8F0
; ---------------------------------------------------------------------------

loc_D74E:
		move.b	d0,$E(a1)
		bra.w	sub_D8F0
; ---------------------------------------------------------------------------

loc_D75A:
		tst.b	(SndDriverFalcomRAM+$1BF).l
		bne.s	loc_D7C8
		subq.l	#1,a2
		moveq	#0,d0
		move.b	1(a2),d0
		lsl.w	#8,d0
		move.b	(a2),d0
		and.w	d0,d0
		beq.s	loc_D788
		addq.l	#2,a2
		suba.l	d0,a2
		rts
; ---------------------------------------------------------------------------

loc_D788:
		ori.b	#$80,$21(a1)
		bsr.w	sub_D3E8
		lea	(SndDriverFalcomRAM+$1C4).l,a2
		moveq	#5,d3
		move.b	#-1,d0

-		and.b	$21(a2),d0
		adda.l	#$22,a2
		dbf	d3,-
		andi.b	#$80,d0
		beq.s	loc_D7BE
		move.b	#1,(SndDriverFalcomRAM+$1B6).l

loc_D7BE:
		move.l	#$12345678,d0
		rts
; ---------------------------------------------------------------------------

loc_D7C8:
		movem.l	a1-a3,-(sp)
		ori.b	#$80,$21(a1)
		suba.l	#$22,a1
		suba.l	#$22,a1
		andi.b	#$BF,$21(a1)
		btst	#0,(SndDriverFalcomRAM+$1B6).l
		bne.s	loc_D844
		clr.b	(SndDriverFalcomRAM+$1BF).l
		move.b	$1E(a1),d1
		bsr.w	sub_D9B8
		bsr.s	sub_D87C
		move.l	#$A4,d0
		move.b	8(a1),d1
		bsr.w	sub_D510
		bsr.w	sub_D44E
		move.l	#$A0,d0
		move.b	9(a1),d1
		bsr.w	sub_D44E
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		move.b	#3,(SndDriverFalcomRAM+$1BF).l

loc_D844:
		lea	(SndDriverFalcomRAM+$290).l,a2
		lea	(SndDriverFalcomRAM+$2B2).l,a3
		move.b	$21(a2),d0
		and.b	$21(a3),d0
		btst	#7,d0
		beq.s	loc_D870
		clr.b	(SndDriverFalcomRAM+$1B9).l
		clr.b	(SndDriverFalcomRAM+$1BC).l

loc_D870:
		movem.l	(sp)+,a1-a3
		move.l	#$12345678,d0

locret_D87A:
		rts

; =============== S U B R O U T I N E =======================================

sub_D87C:
		moveq	#0,d2
		move.b	$D(a1),d2
		lsl.l	#5,d2
		addi.l	#SoundDriverMusicRAM,d2
		addi.l	#$20,d2
		tst.b	(SndDriverFalcomRAM+$1BF).l
		beq.s	+
		addi.l	#$1000,d2
+		movea.l	d2,a4
		bsr.w	sub_D510
		moveq	#$30,d0
		moveq	#$17,d3

-		move.b	(a4)+,d1
		bsr.w	sub_D44E
		addq.l	#4,d0
		dbf	d3,-
		move.l	#$B0,d0
		move.b	(a4),d1
		move.b	d1,d4
		andi.b	#7,d4
		move.b	d4,$C(a1)
		bsr.w	sub_D44E
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		st	$1F(a1)
		bra.s	sub_D8F0
; End of function sub_D87C

; =============== S U B R O U T I N E =======================================

sub_D96A:
		movem.l	d2-d4/a2,-(sp)
		moveq	#0,d3
		move.b	d0,d3
		andi.b	#$70,d3
		lsr.b	#1,d3
		move.b	d0,d2
		andi.l	#$F,d2
		lsl.l	#1,d2
		lea	FMFrequencies_Falcom(pc),a2
		adda.l	d2,a2
		move.w	(a2),d4
		moveq	#0,d0
		move.b	$10(a1),d0
		btst	#7,d0
		beq.s	loc_D99E
		ori.w	#-$100,d0

loc_D99E:
		add.w	d4,d0
		lsl.w	#8,d3
		or.w	d3,d0
		movem.l	(sp)+,d2-d4/a2
		rts
; End of function sub_D96A

; =============== S U B R O U T I N E =======================================

sub_D8F0:
		movem.l	d0-d4/a2,-(sp)
		moveq	#0,d0
		moveq	#0,d1
		move.b	#$7F,d0
		move.b	#$48,d1
		sub.b	$E(a1),d1
		bcs.s	loc_D91A
		move.b	(SndDriverFalcomRAM+$1BE).l,d0
		muls.w	d1,d0
		move.w	d0,d1
		lsr.w	#8,d1
		move.b	#$48,d0
		sub.b	d1,d0

loc_D91A:
		cmp.b	$1F(a1),d0
		beq.s	loc_D964
		move.b	d0,d1
		move.b	d0,$1F(a1)
		moveq	#0,d2
		move.b	$C(a1),d2
		lea	Falcom_FMSlotMask(pc),a2
		adda.l	d2,a2
		move.b	(a2),d2
		moveq	#$40,d0
		moveq	#3,d3
		bsr.w	sub_D510

loc_D940:
		ror.b	#1,d2
		bcc.s	loc_D94A
		bsr.w	sub_D44E

loc_D94A:
		addq.l	#4,d0
		dbf	d3,loc_D940
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop

loc_D964:
		movem.l	(sp)+,d0-d4/a2
		rts
; End of function sub_D8F0

; =============== S U B R O U T I N E =======================================

sub_D9B8:
		move.b	$1E(a1),d1
		andi.b	#$3F,d1
		andi.b	#$C0,d0
		or.b	d0,d1
		move.b	d1,$1E(a1)
		move.l	#$B4,d0
		bsr.w	sub_D510
		bsr.w	sub_D44E
		startZ80
		nop
		nop
		nop
		nop
		nop
		nop
		bra.w	sub_D8F0
; End of function sub_D9B8
; ---------------------------------------------------------------------------

CoordFlagFalcom_Index: offsetTable
		offsetTableEntry.w sub_D6DC		; $F0
		offsetTableEntry.w loc_D6E8		; $F1
		offsetTableEntry.w loc_CE34		; $F2
		offsetTableEntry.w loc_CE3A		; $F3
		offsetTableEntry.w loc_D74E		; $F4
		offsetTableEntry.w loc_CE40		; $F5
		offsetTableEntry.w loc_CEDC		; $F6
		offsetTableEntry.w loc_CE4E		; $F7
		offsetTableEntry.w loc_CE96		; $F8
		offsetTableEntry.w locret_CEDA		; $F9
		offsetTableEntry.w loc_CED2		; $FA
		offsetTableEntry.w loc_D70C		; $FB
		offsetTableEntry.w loc_D730		; $FC
		offsetTableEntry.w loc_CF0C		; $FD
		offsetTableEntry.w sub_D9B8		; $FE
		offsetTableEntry.w loc_D75A		; $FF
FMFrequencies_Falcom:
		dc.w $284, $2AB, $2D3, $2FE, $32D, $35C, $38F, $3C5, $3FF
		dc.w $43C, $47C, $4C0, $28E, $2B4, $2DE, $309, $337, $368
		dc.w $39C, $3D3, $40E, $44B, $48D, $4D2, $26A, $28F, $2B6
		dc.w $2DF, $30B, $339, $36A, $39E, $3D5, $410, $44E, $48F
FMInstrumentOperatorTable_Falcom:
		dc.b $3B, $38, $34, $30, $2A, $28, $25,	$22, $20, $1D
		dc.b $1A, $18, $15, $12, $10, $D, $A, 8, 5, 2
Falcom_FMSlotMask:
		dc.b 8, 8, 8, 8, $C, $E, $E, $F
Z80Falcom_Load:
		dc.l Z80FalcomData,0
; ---------------------------------------------------------------------------

Z80FalcomData:	binclude "Sound/Falcom/Z80 Falcom Data.bin"
	even
; ---------------------------------------------------------------------------

   if MOMPASS=1
		message " Falcom Driver Sound Data ROM offset is $\{*}"
    endif
			include "Sound/Falcom/Data/Music Data.asm"