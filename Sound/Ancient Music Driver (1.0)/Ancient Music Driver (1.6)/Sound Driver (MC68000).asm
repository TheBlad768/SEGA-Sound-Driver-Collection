; Ancient Music Driver -MD- 68000 Program Version 1.6.
; Copyright (C) 1994 Ancient corp., Programmed By Hideki Koyama.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

UpdateMusic:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		tst.b	($FFFF9010).l
		beq.w	loc_60110
		lea	($FFFF91B6).l,a1
		lea	($FFFF9628).l,a6
		bset	#6,1(a1)
		move.b	($FFFF900E).l,d0
		move.b	d0,d7
		btst	#4,d0
		beq.w	loc_600CC
		ori.b	#$F0,d0
		bra.s	loc_600D0
; ---------------------------------------------------------------------------

loc_600CC:
		andi.b	#$F,d0

loc_600D0:
		move.b	d0,$74(a6)
		lea	Music_Bank(pc),a0
		adda.l	($FFFF9006).l,a0
		move.l	a0,d1
		moveq	#0,d3
		move.b	1(a0),d3
		lsl.w	#8,d3
		move.b	(a0),d3
		addq.l	#2,a0
		add.l	d1,d3
		move.l	d3,$C(a6)
		move.l	a0,2(a6)
		clr.l	$1E(a6)
		bsr.w	sub_60FB2
		not.b	d7
		andi.b	#$C0,d7
		rol.b	#2,d7
		move.b	d7,$13(a6)
		sf	($FFFF9010).l

loc_60110:
		tst.b	($FFFF9011).l
		beq.w	loc_6016A
		lea	($FFFF9528).l,a1
		lea	($FFFF96F2).l,a6
		bset	#6,1(a1)
		lea	Music_Bank(pc),a0
		adda.l	($FFFF900A).l,a0
		move.l	a0,2(a6)
		move.b	($FFFF900F).l,d0
		btst	#4,d0
		beq.w	loc_6014E
		ori.b	#$F0,d0
		bra.s	loc_60152
; ---------------------------------------------------------------------------

loc_6014E:
		andi.b	#$F,d0

loc_60152:
		move.b	d0,$74(a6)
		clr.l	$1E(a6)
		bsr.w	sub_61054
		bset	#2,$75(a6)
		sf	($FFFF9011).l

loc_6016A:
		tst.b	($FFFF9012).l
		beq.w	loc_60182
		bsr.w	sub_60352
		tst.b	($FFFF9012).l
		bne.w	loc_6027E

loc_60182:
		lea	($FFFF901A).l,a5
		tst.b	($FFFF9014).l
		beq.w	loc_601D4
		sf	($FFFF9014).l
		move.b	($FFFF9016).l,d0
		cmp.b	7(a5),d0
		bcs.w	loc_601CE
		move.b	d0,7(a5)
		lea	($FFFF95B2).l,a6
		move.b	($FFFF9015).l,$72(a6)
		move.b	($FFFF9017).l,$74(a6)
		move.b	($FFFF9018).l,$13(a6)
		st	($FFFF9013).l

loc_601CE:
		sf	($FFFF9016).l

loc_601D4:
		lea	($FFFF977C).l,a4
		moveq	#6,d7
		lea	($FFFF95B2).l,a6
		bsr.w	sub_62AE0
		moveq	#0,d7
		lea	($FFFF9022).l,a6
		bsr.w	sub_61934
		addq.w	#1,d7
		lea	($FFFF90EC).l,a6
		bsr.w	sub_61934
		addq.w	#1,d7
		lea	($FFFF91B6).l,a6
		bsr.w	sub_61934
		moveq	#4,d7
		lea	($FFFF9280).l,a6
		bsr.w	sub_61934
		addq.w	#1,d7
		lea	($FFFF934A).l,a6
		bsr.w	sub_61934
		lea	(PSG_input).l,a3
		moveq	#0,d7
		move.b	#$80,d7
		lea	($FFFF9414).l,a6
		bsr.w	sub_623AC
		move.b	#$A0,d7
		lea	($FFFF949E).l,a6
		bsr.w	sub_623AC
		move.b	#$C0,d7
		lea	($FFFF9528).l,a6
		bsr.w	sub_623AC
		move.l	#$80000002,d7
		lea	($FFFF9628).l,a6
		bsr.w	sub_61934
		lea	(PSG_input).l,a3
		move.l	#$800000C0,d7
		lea	($FFFF96F2).l,a6
		bsr.w	sub_623AC
		bsr.w	sub_60286

loc_6027E:
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function UpdateMusic

; =============== S U B R O U T I N E =======================================

sub_60286:
		move.w	#$100,(Z80_bus_request).l

loc_6028E:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_6028E
		tst.b	($FFFF9013).l
		beq.w	loc_602B2
		sf	($FFFF9013).l
		st	($A00005).l
		bra.s	loc_602D0
; ---------------------------------------------------------------------------

loc_602B2:
		tst.b	($A00005).l
		bne.w	loc_602D0
		tst.b	($A00006).l
		bne.w	loc_602D0
		lea	($FFFF95B2).l,a6
		sf	$15(a6)

loc_602D0:
		btst	#0,($A00004).l
		beq.w	loc_602FE
		btst	#1,($A00004).l
		beq.w	loc_60328
		st	($FFFF9012).l
		move.l	a4,($FFFF9000).l
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_602FE:
		lea	($FFFF977C).l,a0
		suba.l	a0,a4
		move.w	a4,d0
		lea	($A00017).l,a1
		subq.w	#1,d0

loc_60310:
		move.b	(a0)+,(a1)+
		dbf	d0,loc_60310
		bset	#0,($A00004).l
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_60328:
		lea	($FFFF977C).l,a0
		suba.l	a0,a4
		move.w	a4,d0
		lea	($A001D9).l,a1
		subq.w	#1,d0

loc_6033A:
		move.b	(a0)+,(a1)+
		dbf	d0,loc_6033A
		bset	#1,($A00004).l
		move.w	#0,(Z80_bus_request).l
		rts
; End of function sub_60286

; =============== S U B R O U T I N E =======================================

sub_60352:
		move.w	#$100,(Z80_bus_request).l

loc_6035A:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_6035A
		tst.b	($FFFF9013).l
		beq.w	loc_6037E
		sf	($FFFF9013).l
		st	($A00005).l
		bra.s	loc_6039C
; ---------------------------------------------------------------------------

loc_6037E:
		tst.b	($A00005).l
		bne.w	loc_6039C
		tst.b	($A00006).l
		bne.w	loc_6039C
		lea	($FFFF95B2).l,a6
		sf	$15(a6)

loc_6039C:
		btst	#0,($A00004).l
		beq.w	loc_603BE
		btst	#1,($A00004).l
		beq.w	loc_603F4
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_603BE:
		movea.l	($FFFF9000).l,a4
		lea	($FFFF977C).l,a0
		suba.l	a0,a4
		move.w	a4,d0
		lea	($A00017).l,a1
		subq.w	#1,d0

loc_603D6:
		move.b	(a0)+,(a1)+
		dbf	d0,loc_603D6
		bset	#0,($A00004).l
		move.w	#0,(Z80_bus_request).l
		sf	($FFFF9012).l
		rts
; ---------------------------------------------------------------------------

loc_603F4:
		movea.l	($FFFF9000).l,a4
		lea	($FFFF977C).l,a0
		suba.l	a0,a4
		move.w	a4,d0
		lea	($A001D9).l,a1
		subq.w	#1,d0

loc_6040C:
		move.b	(a0)+,(a1)+
		dbf	d0,loc_6040C
		bset	#1,($A00004).l
		move.w	#0,(Z80_bus_request).l
		sf	($FFFF9012).l
		rts
; End of function sub_60352

; =============== S U B R O U T I N E =======================================

Play_Sound:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d1-a6,-(sp)
		lea	($FFFF901A).l,a5
		move.w	d0,d2
		andi.w	#$FF00,d2
		tst.w	d2
		bne.w	loc_60490
		tst.b	d0
		beq.w	loc_604E6
		cmpi.b	#1,d0
		beq.w	loc_60A8A
		cmpi.b	#2,d0
		beq.w	loc_6064C
		cmpi.b	#3,d0
		beq.w	loc_6074E
		cmpi.b	#4,d0
		beq.w	loc_60884
		cmpi.b	#5,d0
		beq.w	loc_609BC
		cmpi.b	#6,d0
		beq.w	loc_609C6
		cmpi.b	#7,d0
		beq.w	loc_60516
		cmpi.b	#8,d0
		beq.w	loc_60D10
		bra.w	loc_611E0
; ---------------------------------------------------------------------------

loc_60490:
		cmpi.w	#$100,d2
		beq.w	loc_60B50
		cmpi.w	#$200,d2
		beq.w	loc_6112E
		cmpi.w	#$300,d2
		beq.w	loc_60F1C
		cmpi.w	#$400,d2
		beq.w	loc_60F54
		cmpi.w	#$500,d2
		beq.w	loc_60CDA
		bra.w	loc_611E0
; End of function Play_Sound

; =============== S U B R O U T I N E =======================================

sub_604BC:
		lea	($FFFF9628).l,a6
		bset	#4,(a6)
		lea	($FFFF96F2).l,a6
		bset	#4,(a6)
		lea	5(a5),a0
		sf	(a0)+
		sf	(a0)+
		sf	(a0)+
		sf	($FFFF9016).l
		rts
; End of function sub_604BC
; ---------------------------------------------------------------------------

loc_604E6:
		bsr.w	sub_611EA
		bset	#0,(a5)
		sf	($FFFF9012).l
		bsr.w	sub_604BC
		sf	($FFFF9010).l
		sf	($FFFF9011).l
		sf	($FFFF9013).l
		sf	($FFFF9014).l
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60516:
		move.b	#2,1(a5)
		move.b	#$7E,2(a5)
		bclr	#1,(a5)
		move.b	3(a5),d1
		move.b	1(a5),d2
		lea	($FFFF9022).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF90EC).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF91B6).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9280).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF934A).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9414).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF949E).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9528).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF95B2).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#4,$75(a6)
		lea	($FFFF9628).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF96F2).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_6064C:
		move.b	#2,1(a5)
		move.b	#$7E,2(a5)
		bset	#1,(a5)
		move.b	3(a5),d1
		move.b	1(a5),d2
		lea	($FFFF9022).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF90EC).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF91B6).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9280).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF934A).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9414).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF949E).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF9528).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		lea	($FFFF95B2).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#4,$75(a6)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_6074E:
		move.b	#2,1(a5)
		clr.b	2(a5)
		bclr	#1,(a5)
		move.b	3(a5),d1
		move.b	1(a5),d2
		lea	($FFFF9022).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF90EC).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF91B6).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF9280).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF934A).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF9414).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF949E).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF9528).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		lea	($FFFF95B2).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,$75(a6)
		bclr	#4,$75(a6)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60884:
		move.b	#2,1(a5)
		move.b	#$1A,2(a5)
		bset	#1,(a5)
		move.b	3(a5),d1
		move.b	1(a5),d2
		lea	($FFFF9022).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF90EC).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF91B6).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF9280).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF934A).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF9414).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF949E).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF9528).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#3,1(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		lea	($FFFF95B2).l,a6
		move.b	d1,$6D(a6)
		move.b	d2,$6E(a6)
		bset	#4,$75(a6)
		bclr	#3,$75(a6)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_609BC:
		bset	#2,(a5)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_609C6:
		moveq	#0,d0
		btst	#0,(a5)
		beq.w	loc_609D6
		move.w	#$1FF,d0

loc_609D6:
		btst	#4,($FFFF9022).l
		beq.w	loc_609E6
		ori.w	#1,d0

loc_609E6:
		btst	#4,($FFFF90EC).l
		beq.w	loc_609F6
		ori.w	#2,d0

loc_609F6:
		btst	#4,($FFFF91B6).l
		beq.w	loc_60A06
		ori.w	#4,d0

loc_60A06:
		btst	#4,($FFFF9414).l
		beq.w	loc_60A16
		ori.w	#8,d0

loc_60A16:
		btst	#4,($FFFF949E).l
		beq.w	loc_60A26
		ori.w	#$10,d0

loc_60A26:
		btst	#4,($FFFF9528).l
		beq.w	loc_60A36
		ori.w	#$20,d0

loc_60A36:
		btst	#4,($FFFF9280).l
		beq.w	loc_60A46
		ori.w	#$40,d0

loc_60A46:
		btst	#4,($FFFF934A).l
		beq.w	loc_60A56
		ori.w	#$80,d0

loc_60A56:
		btst	#4,($FFFF95B2).l
		beq.w	loc_60A66
		ori.w	#$100,d0

loc_60A66:
		btst	#4,($FFFF9628).l
		beq.w	loc_60A76
		ori.w	#$200,d0

loc_60A76:
		btst	#4,($FFFF96F2).l
		beq.w	loc_60A86
		ori.w	#$400,d0

loc_60A86:
		bra.w	loc_611D8
; ---------------------------------------------------------------------------

loc_60A8A:
		move.b	#$F0,d1
		move.b	#4,d2
		move.b	#2,d3
		move.b	#$F7,d4
		move.b	#2,d5
		lea	($FFFF9022).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		lea	($FFFF90EC).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		lea	($FFFF91B6).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		lea	($FFFF9280).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		lea	($FFFF934A).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		lea	($FFFF9414).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		lea	($FFFF949E).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		lea	($FFFF9528).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		lea	($FFFF95B2).l,a6
		ori.b	#4,1(a6)
		sf	$15(a6)
		bclr	#0,(a5)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60B50:
		lea	Music_Bank(pc),a0
		andi.w	#$FF,d0
		lsl.w	#2,d0
		move.l	(a0,d0.w),d1
		tst.l	d1
		beq.w	loc_611E0
		adda.l	d1,a0
		move.l	a0,-(sp)
		move.w	#$100,(Z80_bus_request).l

loc_60B70:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_60B70
		move.b	#$83,($A00003).l
		move.w	#0,(Z80_bus_request).l
		bsr.w	sub_6121A

loc_60B90:
		move.w	#$100,(Z80_bus_request).l

loc_60B98:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_60B98
		tst.b	($A00003).l
		beq.w	loc_60BC4
		move.w	#0,(Z80_bus_request).l
		nop
		nop
		nop
		nop
		nop
		nop
		bra.s	loc_60B90
; ---------------------------------------------------------------------------

loc_60BC4:
		move.w	#0,(Z80_bus_request).l
		bsr.w	sub_604BC
		movea.l	(sp)+,a0
		sf	($FFFF9012).l
		sf	(a5)
		sf	($FFFF9010).l
		sf	($FFFF9011).l
		sf	($FFFF9013).l
		sf	($FFFF9014).l
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
		lea	($FFFF9022).l,a6
		bsr.w	sub_60F8C
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF90EC).l,a6
		bsr.w	sub_60F8C
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF91B6).l,a6
		bsr.w	sub_60F8C
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF9414).l,a6
		bsr.w	sub_61032
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF949E).l,a6
		bsr.w	sub_61032
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF9528).l,a6
		bsr.w	sub_61032
		bset	#2,$75(a6)
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF9280).l,a6
		bsr.w	sub_60F8C
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF934A).l,a6
		bsr.w	sub_60F8C
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.l	#2,a0
		lea	($FFFF95B2).l,a6
		bsr.w	sub_610C8
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60CDA:
		move.w	#$100,(Z80_bus_request).l

loc_60CE2:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_60CE2
		lea	($FFFF9022).l,a0
		lea	($A01000).l,a1
		move.w	#$605,d1

loc_60CFE:
		move.b	(a0)+,(a1)+
		dbf	d1,loc_60CFE
		move.w	#0,(Z80_bus_request).l
		bra.w	loc_60B50
; ---------------------------------------------------------------------------

loc_60D10:
		move.w	#$100,(Z80_bus_request).l

loc_60D18:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_60D18
		move.b	#$83,($A00003).l
		lea	($FFFF9022).l,a0
		lea	($A01000).l,a1
		move.w	#$605,d1

loc_60D3C:
		move.b	(a1)+,(a0)+
		dbf	d1,loc_60D3C
		move.w	#0,(Z80_bus_request).l
		bsr.w	sub_6121A

loc_60D4E:
		move.w	#$100,(Z80_bus_request).l

loc_60D56:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_60D56
		tst.b	($A00003).l
		beq.w	loc_60D82
		move.w	#0,(Z80_bus_request).l
		nop
		nop
		nop
		nop
		nop
		nop
		bra.s	loc_60D4E
; ---------------------------------------------------------------------------

loc_60D82:
		move.w	#0,(Z80_bus_request).l
		bsr.w	sub_604BC
		sf	($FFFF9012).l
		sf	(a5)
		sf	($FFFF9010).l
		sf	($FFFF9011).l
		sf	($FFFF9013).l
		sf	($FFFF9014).l
		clr.b	2(a5)
		move.b	#$B0,d1
		move.b	#$C,d2
		move.b	#2,d3
		move.b	#$F7,d4
		move.b	#2,d5
		move.b	3(a5),d6
		move.b	#$7F,d7
		move.b	#6,d0
		lea	($FFFF9022).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		lea	($FFFF90EC).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		lea	($FFFF91B6).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		lea	($FFFF9280).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		lea	($FFFF934A).l,a6
		and.b	d1,1(a6)
		or.b	d2,1(a6)
		and.b	d3,$75(a6)
		or.b	d2,$75(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		lea	($FFFF9414).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		lea	($FFFF949E).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		lea	($FFFF9528).l,a6
		and.b	d4,1(a6)
		or.b	d5,1(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		bset	#3,1(a6)
		bset	#3,$75(a6)
		bset	#2,$75(a6)
		lea	($FFFF95B2).l,a6
		ori.b	#4,1(a6)
		sf	$15(a6)
		move.b	d6,$6D(a6)
		move.b	d7,$6C(a6)
		move.b	d0,$6E(a6)
		bset	#3,$75(a6)
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60F1C:
		lea	Music_Bank(pc),a0
		andi.w	#$FF,d0
		lsl.w	#2,d0
		move.l	(a0,d0.w),d1
		beq.w	loc_611E0
		swap	d0
		cmp.b	5(a5),d0
		bcs.w	loc_611E0
		move.b	d0,5(a5)
		st	($FFFF9010).l
		move.l	d1,($FFFF9006).l
		ror.w	#8,d0
		move.b	d0,($FFFF900E).l
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_60F54:
		lea	Music_Bank(pc),a0
		andi.w	#$FF,d0
		lsl.w	#2,d0
		move.l	(a0,d0.w),d1
		beq.w	loc_611E0
		swap	d0
		cmp.b	6(a5),d0
		bcs.w	loc_611E0
		move.b	d0,6(a5)
		st	($FFFF9011).l
		move.l	d1,($FFFF900A).l
		ror.w	#8,d0
		move.b	d0,($FFFF900F).l
		bra.w	loc_611D6

; =============== S U B R O U T I N E =======================================

sub_60F8C:
		add.l	d1,d2
		move.l	d2,2(a6)
		move.l	d3,$C(a6)
		clr.l	$1E(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.w	sub_60FB2
		add.l	d1,d0
		move.l	d0,$1E(a6)
; End of function sub_60F8C

; =============== S U B R O U T I N E =======================================

sub_60FB2:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	#4,1(a6)
		move.b	d0,$75(a6)
		move.b	d0,$70(a6)
		move.w	#$101,6(a6)
		move.w	d0,$1C(a6)
		move.w	d0,$76(a6)
		move.w	d0,8(a6)
		st	$73(a6)
		move.b	d0,$72(a6)
		move.b	#3,$13(a6)
		move.b	d0,$17(a6)
		move.b	d0,$14(a6)
		move.b	d0,$11(a6)
		move.b	#8,$12(a6)
		move.b	d0,$16(a6)
		move.b	d0,$23(a6)
		move.l	d0,$24(a6)
		move.l	d0,$28(a6)
		move.b	d0,$87(a6)
		move.b	d0,$88(a6)
		move.b	d0,$15(a6)
		move.b	d0,$6C(a6)
		move.b	d0,$B6(a6)
		move.b	d0,$C0(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.w	locret_61030
		bset	#4,(a6)

locret_61030:
		rts
; End of function sub_60FB2

; =============== S U B R O U T I N E =======================================

sub_61032:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$1E(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.w	sub_61054
		add.l	d1,d0
		move.l	d0,$1E(a6)
; End of function sub_61032

; =============== S U B R O U T I N E =======================================

sub_61054:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	d0,1(a6)
		move.b	d0,$75(a6)
		move.w	#$101,6(a6)
		move.b	d0,$70(a6)
		st	$18(a6)
		move.w	d0,$1C(a6)
		move.w	d0,$76(a6)
		move.w	d0,8(a6)
		move.b	#4,$71(a6)
		st	$73(a6)
		move.b	d0,$72(a6)
		move.b	d0,$14(a6)
		move.b	d0,$10(a6)
		move.b	#7,$11(a6)
		move.b	#8,$12(a6)
		move.b	d0,$16(a6)
		move.b	d0,$17(a6)
		move.b	d0,$23(a6)
		move.l	d0,$24(a6)
		move.l	d0,$28(a6)
		move.b	d0,$6C(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.w	locret_610C6
		bset	#4,(a6)

locret_610C6:
		rts
; End of function sub_61054

; =============== S U B R O U T I N E =======================================

sub_610C8:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$1E(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.w	d0
		beq.w	loc_610EA
		add.l	d1,d0
		move.l	d0,$1E(a6)

loc_610EA:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	d0,1(a6)
		move.b	d0,$75(a6)
		move.w	#$101,6(a6)
		move.b	#3,$13(a6)
		move.b	d0,$14(a6)
		move.b	d0,$6C(a6)
		move.b	d0,$15(a6)
		move.b	d0,$23(a6)
		move.l	d0,$24(a6)
		move.l	d0,$28(a6)
		movea.l	2(a6),a3
		tst.b	(a3)
		bne.w	locret_6112C
		bset	#4,(a6)

locret_6112C:
		rts
; End of function sub_610C8
; ---------------------------------------------------------------------------

loc_6112E:
		tst.b	($FFFF9012).l
		bne.w	loc_611A2
		lea	($FFFF95B2).l,a6
		tst.b	$15(a6)
		bne.w	loc_61174
		tst.b	($FFFF9013).l
		bne.w	loc_61174
		move.b	d0,$72(a6)
		swap	d0
		move.b	d0,7(a5)
		ror.w	#8,d0
		move.b	d0,$74(a6)
		not.b	d0
		andi.b	#$C0,d0
		move.b	d0,$13(a6)
		st	($FFFF9013).l
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_61174:
		swap	d0
		cmp.b	7(a5),d0
		bcs.w	loc_611D6
		move.b	d0,7(a5)
		lsr.w	#8,d0
		move.b	d0,$74(a6)
		not.b	d0
		andi.b	#$C0,d0
		move.b	d0,$13(a6)
		swap	d0
		move.b	d0,$72(a6)
		st	($FFFF9013).l
		bra.w	loc_611D6
; ---------------------------------------------------------------------------

loc_611A2:
		swap	d0
		cmp.b	($FFFF9016).l,d0
		bcs.w	loc_611D6
		move.b	d0,($FFFF9016).l
		lsr.w	#8,d0
		move.b	d0,($FFFF9017).l
		not.b	d0
		andi.b	#$C0,d0
		move.b	d0,($FFFF9018).l
		swap	d0
		move.b	d0,($FFFF9015).l
		st	($FFFF9014).l

loc_611D6:
		moveq	#0,d0

loc_611D8:
		movem.l	(sp)+,d1-a6
		move	(sp)+,sr
		rts
; ---------------------------------------------------------------------------

loc_611E0:
		moveq	#-1,d0
		movem.l	(sp)+,d1-a6
		move	(sp)+,sr
		rts

; =============== S U B R O U T I N E =======================================

sub_611EA:
		bsr.w	sub_611F4
		bsr.w	sub_6121A
		rts
; End of function sub_611EA

; =============== S U B R O U T I N E =======================================

sub_611F4:
		move.w	#$100,(Z80_bus_request).l

loc_611FC:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_611FC
		move.b	#$81,($A00003).l
		move.w	#0,(Z80_bus_request).l
		rts
; End of function sub_611F4

; =============== S U B R O U T I N E =======================================

sub_6121A:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)
		move.b	#$BF,(a0)
		move.b	#$DF,(a0)
		move.b	#$FF,(a0)
		rts
; End of function sub_6121A

; =============== S U B R O U T I N E =======================================

SndDrvInit:
		sf	($FFFF9012).l
		sf	($FFFF9010).l
		sf	($FFFF9011).l
		sf	($FFFF9013).l
		sf	($FFFF9014).l
		move.w	#$1972,($FFFF9004).l
		lea	($FFFF901A).l,a5
		move.l	a5,-(sp)
		move.l	#$761,d0

loc_61266:
		clr.b	(a5)+
		dbf	d0,loc_61266
		movea.l	(sp)+,a5
		bset	#0,(a5)
		move.b	#3,3(a5)
		lea	($FFFF9628).l,a0
		bset	#4,(a0)
		lea	($FFFF96F2).l,a0
		bset	#4,(a0)
		bsr.w	SndZ80DrvInit
		move.w	#$100,(Z80_bus_request).l

loc_6129E:
		btst	#0,(Z80_bus_request).l
		bne.w	loc_6129E

loc_612AA:
		tst.b	($A04000).l
		bmi.w	loc_612AA
		move.b	#$2B,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_612C6:
		tst.b	($A04000).l
		bmi.w	loc_612C6
		move.b	#0,($A04001).l
		nop
		nop
		nop
		nop
		nop

loc_612E2:
		tst.b	($A04000).l
		bmi.w	loc_612E2
		move.b	#$27,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_612FE:
		tst.b	($A04000).l
		bmi.w	loc_612FE
		move.b	#$3F,($A04001).l
		nop
		nop
		nop
		nop
		nop
		move.w	#0,(Z80_bus_request).l
		bsr.w	sub_611EA
		rts
; End of function SndDrvInit

; =============== S U B R O U T I N E =======================================

SndZ80DrvInit:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	a1-a2,-(sp)
		move.w	#$100,(Z80_bus_request).l
		move.w	#$100,(Z80_reset).l
-		btst	#0,(Z80_bus_request).l
		bne.w	-
		lea	(Z80Driver).l,a0
		lea	(Z80_RAM).l,a1
		jsr	(Kos_Decomp).l
-		move.b	(a0)+,(a1)+
		dbf	d0,-
		moveq	#0,d0
-		move.b	d0,(a1)+
		cmpa.l	#(Z80_RAM_end),a1
		bne.s	-
		move.w	#0,(Z80_reset).l
		move.w	#0,(Z80_bus_request).l
		nop
		nop
		nop
		nop
		nop
		move.w	#$100,(Z80_reset).l
		movem.l	(sp)+,a1-a2
		move	(sp)+,sr
		rts
; End of function SndZ80DrvInit

; =============== S U B R O U T I N E =======================================

sub_6138E:
		move.b	$78(a6),$7E(a6)
		move.b	$79(a6),$7F(a6)
		move.w	$7C(a6),$80(a6)
		move.w	$7A(a6),d6
		lsr.w	#1,d6
		move.w	d6,$82(a6)
		move.w	#0,$76(a6)
		rts
; End of function sub_6138E

; =============== S U B R O U T I N E =======================================

sub_613B2:
		btst	#6,(a6)
		beq.w	locret_613F6
		tst.b	$7E(a6)
		beq.w	loc_613CA
		subq.b	#1,$7E(a6)
		bra.s	locret_613F6
; ---------------------------------------------------------------------------

loc_613CA:
		subq.b	#1,$7F(a6)
		bne.w	locret_613F6
		move.b	$79(a6),$7F(a6)
		tst.w	$82(a6)
		bne.w	loc_613EA
		neg.w	$80(a6)
		move.w	$7A(a6),$82(a6)

loc_613EA:
		subq.w	#1,$82(a6)
		move.w	$80(a6),d0
		add.w	d0,$76(a6)

locret_613F6:
		rts
; End of function sub_613B2

; =============== S U B R O U T I N E =======================================

sub_613F8:
		movem.l	d0/a0-a1,-(sp)
		lea	$B6(a6),a0
		btst	#4,(a0)
		beq.w	loc_61418
		btst	#5,(a0)
		beq.w	loc_61418
		bsr.w	sub_6143A

loc_61418:
		lea	$C0(a6),a0
		btst	#4,(a0)
		beq.w	loc_61434
		btst	#5,(a0)
		beq.w	loc_61434
		bsr.w	sub_6143A

loc_61434:
		movem.l	(sp)+,d0/a0-a1
		rts
; End of function sub_613F8

; =============== S U B R O U T I N E =======================================

sub_6143A:
		move.b	(a0),d0
		andi.b	#$F,d0
		move.b	d0,5(a0)
		sf	6(a0)
		sf	7(a0)
		move.b	3(a0),6(a0)
		sf	4(a0)
		lea	$9D(a6),a1
		move.b	8(a0),d0
		cmpi.b	#$B0,d0
		bcs.w	loc_61470
		move.b	$18(a1),9(a0)
		rts
; ---------------------------------------------------------------------------

loc_61470:
		lsr.b	#2,d0
		andi.w	#$FF,d0
		move.b	(a1,d0.w),9(a0)
		rts
; End of function sub_6143A

; =============== S U B R O U T I N E =======================================

sub_6147E:
		movem.l	d0-d2/a0-a1,-(sp)
		lea	$B6(a6),a0
		btst	#4,(a0)
		beq.w	loc_614A8
		bsr.w	sub_6163E
		lea	$C0(a6),a0
		btst	#4,(a0)
		beq.w	loc_614E6
		bsr.w	sub_6163E
		bra.s	loc_61512
; ---------------------------------------------------------------------------

loc_614A8:
		lea	$C0(a6),a0
		btst	#4,(a0)
		beq.w	loc_61582
		bsr.w	sub_6163E
		btst	#6,1(a6)
		bne.w	loc_61582
		lea	$C0(a6),a0
		bclr	#6,(a0)
		beq.w	loc_61582
		move.b	8(a0),d0
		move.b	#1,(a4)+
		add.b	d7,d0
		move.b	d0,(a4)+
		move.b	9(a0),(a4)+
		bra.w	loc_61582
; ---------------------------------------------------------------------------

loc_614E6:
		btst	#6,1(a6)
		bne.w	loc_61582
		lea	$B6(a6),a0
		bclr	#6,(a0)
		beq.w	loc_61582
		move.b	8(a0),d0
		move.b	#1,(a4)+
		add.b	d7,d0
		move.b	d0,(a4)+
		move.b	9(a0),(a4)+
		bra.w	loc_61582
; ---------------------------------------------------------------------------

loc_61512:
		lea	$B6(a6),a0
		lea	$C0(a6),a1
		move.b	8(a0),d0
		move.b	8(a1),d1
		cmp.b	d0,d1
		beq.w	loc_61556
		bclr	#6,(a0)
		beq.w	loc_6153E
		move.b	#1,(a4)+
		add.b	d7,d0
		move.b	d0,(a4)+
		move.b	9(a0),(a4)+

loc_6153E:
		bclr	#6,(a1)
		beq.w	loc_61582
		move.b	#1,(a4)+
		add.b	d7,d1
		move.b	d1,(a4)+
		move.b	9(a1),(a4)+
		bra.s	loc_61582
; ---------------------------------------------------------------------------

loc_61556:
		bclr	#6,(a0)
		bclr	#6,(a1)
		move.b	1(a0),d0
		andi.w	#$F,d0
		add.w	d0,d0
		lea	off_61588(pc,d0.w),a1
		adda.w	(a1),a1
		jsr	(a1)
		move.b	8(a0),d1
		add.b	d7,d1
		move.b	#1,(a4)+
		move.b	d1,(a4)+
		move.b	d0,(a4)+

loc_61582:
		movem.l	(sp)+,d0-d2/a0-a1
		rts
; End of function sub_6147E
; ---------------------------------------------------------------------------

off_61588:
		dc.w loc_6159E-off_61588
		dc.w locret_615B0-off_61588
		dc.w off_61588-off_61588
		dc.w loc_615BE+2-off_61588
		dc.w loc_615D2-off_61588
		dc.w off_61588-off_61588
		dc.w off_61588-off_61588
		dc.w loc_615DE+2-off_61588
		dc.w loc_615F2-off_61588
		dc.w loc_61602+2-off_61588
		dc.w loc_61616-off_61588
; ---------------------------------------------------------------------------

loc_6159E:
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#$70,d0
		andi.b	#$F,d1
		or.b	d1,d0

locret_615B0:
		rts
; ---------------------------------------------------------------------------
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#$F,d0

loc_615BE:
		andi.b	#$70,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#$C0,d0

loc_615D2:
		andi.b	#$1F,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------
		move.b	9(a0),d0

loc_615DE:
		move.b	$13(a0),d1
		andi.b	#$1F,d0
		andi.b	#$C0,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------
		move.b	9(a0),d0

loc_615F2:
		move.b	$13(a0),d1
		andi.b	#$F0,d0
		andi.b	#$F,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------

loc_61602:
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#$F,d0
		andi.b	#$F0,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------

loc_61616:
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#$38,d0
		andi.b	#7,d1
		or.b	d1,d0
		rts
; ---------------------------------------------------------------------------
		move.b	9(a0),d0
		move.b	$13(a0),d1
		andi.b	#7,d0
		andi.b	#$38,d1
		or.b	d1,d0
		rts

; =============== S U B R O U T I N E =======================================

sub_6163E:
		subq.b	#1,5(a0)
		bpl.w	locret_616B2
		bset	#6,(a0)
		move.b	(a0),d0
		andi.b	#$F,d0
		move.b	d0,5(a0)
		subq.b	#1,6(a0)
		bpl.w	loc_6166E
		neg.b	4(a0)
		move.b	3(a0),d0
		add.b	d0,d0
		move.b	d0,6(a0)

loc_6166E:
		move.b	2(a0),d0
		add.b	d0,7(a0)
		bcc.w	loc_61680
		move.b	#$FF,7(a0)

loc_61680:
		move.b	8(a0),d0
		cmpi.b	#$B0,d0
		bcs.w	loc_61692
		lea	$B5(a6),a1
		bra.s	loc_6169E
; ---------------------------------------------------------------------------

loc_61692:
		lea	$9D(a6),a1
		lsr.b	#2,d0
		andi.w	#$FF,d0
		adda.w	d0,a1

loc_6169E:
		move.b	(a1),d1
		move.b	1(a0),d0
		andi.w	#$F,d0
		add.w	d0,d0
		lea	off_616B4(pc,d0.w),a1
		adda.w	(a1),a1
		jmp	(a1)
; ---------------------------------------------------------------------------

locret_616B2:
		rts
; End of function sub_6163E
; ---------------------------------------------------------------------------

off_616B4:
		dc.w loc_616CA-off_616B4
		dc.w locret_61704-off_616B4
		dc.w loc_61736+2-off_616B4
		dc.w loc_61762-off_616B4
		dc.w loc_617A0-off_616B4
		dc.w loc_617D6+2-off_616B4
		dc.w loc_61810-off_616B4
		dc.w loc_6183A-off_616B4
		dc.w loc_61872+2-off_616B4
		dc.w loc_618AA+2-off_616B4
		dc.w loc_618E4+2-off_616B4
; ---------------------------------------------------------------------------

loc_616CA:
		move.b	d1,d0
		andi.b	#$F,d0
		lsr.b	#4,d1
		tst.b	4(a0)
		bne.w	loc_616F0
		add.b	7(a0),d1
		bcc.w	loc_616E6
		move.b	#$FF,d1

loc_616E6:
		andi.b	#7,d1
		lsl.b	#4,d1
		or.b	d0,d1
		bra.s	loc_61700
; ---------------------------------------------------------------------------

loc_616F0:
		sub.b	7(a0),d1
		bcc.w	loc_616FC
		move.b	#0,d1

loc_616FC:
		lsl.b	#4,d1
		or.b	d0,d1

loc_61700:
		move.b	d1,9(a0)

locret_61704:
		rts

; =============== S U B R O U T I N E =======================================


sub_61706:
		move.b	d1,d0
		andi.b	#$70,d0
		tst.b	4(a0)
		bne.w	loc_61728
		add.b	7(a0),d1
		bcc.w	loc_61720
		move.b	#$FF,d1

loc_61720:
		andi.b	#$F,d1
		or.b	d0,d1
		bra.s	loc_61736
; ---------------------------------------------------------------------------

loc_61728:
		sub.b	7(a0),d1
		bcc.w	loc_61734
		move.b	#0,d1

loc_61734:
		or.b	d0,d1

loc_61736:
		move.b	d1,9(a0)
		rts
; End of function sub_61706


; =============== S U B R O U T I N E =======================================


sub_6173C:
		tst.b	4(a0)
		bne.w	loc_61756
		add.b	7(a0),d1
		bcc.w	loc_61750
		move.b	#$FF,d1

loc_61750:
		andi.b	#$7F,d1
		bra.s	loc_61762
; ---------------------------------------------------------------------------

loc_61756:
		sub.b	7(a0),d1
		bcc.w	loc_61762
		move.b	#0,d1

loc_61762:
		move.b	d1,9(a0)
		rts
; End of function sub_6173C


; =============== S U B R O U T I N E =======================================


sub_61768:
		move.b	d1,d0
		andi.b	#$1F,d0
		rol.b	#2,d1
		andi.b	#3,d1
		tst.b	4(a0)
		bne.w	loc_61792
		add.b	7(a0),d1
		bcc.w	loc_61788
		move.b	#$FF,d1

loc_61788:
		andi.b	#3,d1
		ror.b	#2,d1
		or.b	d0,d1
		bra.s	loc_617A2
; ---------------------------------------------------------------------------

loc_61792:
		sub.b	7(a0),d1
		bcc.w	loc_6179E
		move.b	#0,d1

loc_6179E:
		ror.b	#2,d1

loc_617A0:
		or.b	d0,d1

loc_617A2:
		move.b	d1,9(a0)
		rts
; End of function sub_61768


; =============== S U B R O U T I N E =======================================


sub_617A8:
		move.b	d1,d0
		andi.b	#$C0,d0
		andi.b	#$1F,d1
		tst.b	4(a0)
		bne.w	loc_617CE
		add.b	7(a0),d1
		bcc.w	loc_617C6
		move.b	#$FF,d1

loc_617C6:
		andi.b	#$1F,d1
		or.b	d0,d1
		bra.s	loc_617DC
; ---------------------------------------------------------------------------

loc_617CE:
		sub.b	7(a0),d1
		bcc.w	loc_617DA

loc_617D6:
		move.b	#0,d1

loc_617DA:
		or.b	d0,d1

loc_617DC:
		move.b	d1,9(a0)
		rts
; End of function sub_617A8

; =============== S U B R O U T I N E =======================================

sub_617E2:
		move.b	d1,d0
		andi.b	#$80,d0
		andi.b	#$1F,d1
		tst.b	4(a0)
		bne.w	loc_61808
		add.b	7(a0),d1
		bcc.w	loc_61800
		move.b	#$FF,d1

loc_61800:
		andi.b	#$1F,d1
		or.b	d0,d1
		bra.s	loc_61816
; ---------------------------------------------------------------------------

loc_61808:
		sub.b	7(a0),d1
		bcc.w	loc_61814

loc_61810:
		move.b	#0,d1

loc_61814:
		or.b	d0,d1

loc_61816:
		move.b	d1,9(a0)
		rts
; End of function sub_617E2

; =============== S U B R O U T I N E =======================================

sub_6181C:
		tst.b	4(a0)
		bne.w	loc_61836
		add.b	7(a0),d1
		bcc.w	loc_61830
		move.b	#$FF,d1

loc_61830:
		andi.b	#$1F,d1
		bra.s	loc_61842
; ---------------------------------------------------------------------------

loc_61836:
		sub.b	7(a0),d1

loc_6183A:
		bcc.w	loc_61842
		move.b	#0,d1

loc_61842:
		move.b	d1,9(a0)
		rts
; End of function sub_6181C

; =============== S U B R O U T I N E =======================================

sub_61848:
		move.b	d1,d0
		andi.b	#$F,d0
		lsr.b	#4,d1
		tst.b	4(a0)
		bne.w	loc_6186E
		add.b	7(a0),d1
		bcc.w	loc_61864
		move.b	#$FF,d1

loc_61864:
		andi.b	#$F,d1
		lsl.b	#4,d1
		or.b	d0,d1
		bra.s	loc_6187E
; ---------------------------------------------------------------------------

loc_6186E:
		sub.b	7(a0),d1

loc_61872:
		bcc.w	loc_6187A
		move.b	#0,d1

loc_6187A:
		lsl.b	#4,d1
		or.b	d0,d1

loc_6187E:
		move.b	d1,9(a0)
		rts
; End of function sub_61848
; ---------------------------------------------------------------------------
		move.b	d1,d0
		andi.b	#$F0,d0
		andi.b	#$F,d1
		tst.b	4(a0)
		bne.w	loc_618AA
		add.b	7(a0),d1
		bcc.w	loc_618A2
		move.b	#$FF,d1

loc_618A2:
		andi.b	#$F,d1
		or.b	d0,d1
		bra.s	loc_618B8
; ---------------------------------------------------------------------------

loc_618AA:
		sub.b	7(a0),d1
		bcc.w	loc_618B6
		move.b	#0,d1

loc_618B6:
		or.b	d0,d1

loc_618B8:
		move.b	d1,9(a0)
		rts
; ---------------------------------------------------------------------------
		move.b	d1,d0
		andi.b	#7,d0
		lsr.b	#3,d1
		tst.b	4(a0)
		bne.w	loc_618E4
		add.b	7(a0),d1
		bcc.w	loc_618DA
		move.b	#$FF,d1

loc_618DA:
		andi.b	#7,d1
		lsl.b	#3,d1
		or.b	d0,d1
		bra.s	loc_618F4
; ---------------------------------------------------------------------------

loc_618E4:
		sub.b	7(a0),d1
		bcc.w	loc_618F0
		move.b	#0,d1

loc_618F0:
		lsl.b	#3,d1
		or.b	d0,d1

loc_618F4:
		move.b	d1,9(a0)
		rts
; ---------------------------------------------------------------------------
		move.b	d1,d0
		andi.b	#$38,d0
		andi.b	#7,d1
		tst.b	4(a0)
		bne.w	loc_61920
		add.b	7(a0),d1
		bcc.w	loc_61918
		move.b	#$FF,d1

loc_61918:
		andi.b	#7,d1
		or.b	d0,d1
		bra.s	loc_6192E
; ---------------------------------------------------------------------------

loc_61920:
		sub.b	7(a0),d1
		bcc.w	loc_6192C
		move.b	#0,d1

loc_6192C:
		or.b	d0,d1

loc_6192E:
		move.b	d1,9(a0)
		rts

; =============== S U B R O U T I N E =======================================

sub_61934:
		btst	#$1F,d7
		bne.w	loc_61946
		btst	#0,(a5)
		bne.w	loc_61954

loc_61946:
		move.b	d7,4(a5)
		btst	#4,(a6)
		beq.w	loc_6195A

loc_61954:
		move.b	#$FF,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_6195A:
		btst	#2,d7
		beq.w	loc_61964
		subq.w	#4,d7

loc_61964:
		bsr.w	sub_61E48
		subq.b	#1,7(a6)
		bne.w	loc_619B6
		btst	#1,(a6)
		bne.w	loc_619B6
		bclr	#2,(a6)
		btst	#5,$70(a6)
		bne.w	loc_6199E
		btst	#6,1(a6)
		bne.w	loc_619B6
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+
		bra.s	loc_619B6
; ---------------------------------------------------------------------------

loc_6199E:
		moveq	#0,d0
		move.b	$12(a6),d0
		add.b	$6F(a6),d0
		lsr.b	#1,d0
		lea	FMInstrumentOperatorTableA(pc),a1
		move.b	(a1,d0.w),d0
		bsr.w	sub_61EF4

loc_619B6:
		subq.b	#1,6(a6)
		bne.w	loc_61AC2
		andi.b	#$F2,(a6)

loc_619C4:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_61F56
		tst.b	d2
		bne.w	loc_619E2
		bsr.w	sub_62156
		bra.w	loc_61F64
; ---------------------------------------------------------------------------

loc_619E2:
		bclr	#7,d2
		bne.w	loc_61A66
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	$73(a6),$72(a6)
		move.b	d0,$73(a6)
		move.b	$72(a6),d3
		cmp.b	d0,d3
		bne.w	loc_61A12
		btst	#1,(a6)
		bne.w	loc_61A1A

loc_61A12:
		bsr.w	sub_6138E
		bsr.w	sub_613F8

loc_61A1A:
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
		move.b	$14(a6),d6
		cmp.b	d6,d2
		bhi.w	loc_61A48
		moveq	#1,d2
		bra.s	loc_61A4A
; ---------------------------------------------------------------------------

loc_61A48:
		sub.b	d6,d2

loc_61A4A:
		move.b	d2,7(a6)
		bset	#5,1(a6)
		btst	#5,$70(a6)
		beq.w	loc_61AAA
		bset	#1,1(a6)
		bra.s	loc_61AAA
; ---------------------------------------------------------------------------

loc_61A66:
		btst	#1,(a6)
		bne.w	loc_61AA2
		btst	#4,$70(a6)
		bne.w	loc_61A84
		btst	#5,$70(a6)
		bne.w	loc_61A96

loc_61A84:
		btst	#6,1(a6)
		bne.w	loc_61A96
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_61A96:
		bclr	#2,(a6)
		bset	#3,(a6)

loc_61AA2:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_61AAA:
		bclr	#1,(a6)
		beq.w	loc_61ABA
		bset	#0,(a6)

loc_61ABA:
		bsr.w	sub_626BC
		move.l	a0,2(a6)

loc_61AC2:
		bsr.w	sub_613B2
		bsr.w	sub_6147E
		btst	#3,$75(a6)
		beq.w	loc_61B08
		subq.b	#1,$6D(a6)
		bne.w	loc_61B74
		move.b	$6E(a6),d0
		sub.b	d0,$6C(a6)
		bcc.w	loc_61AEE
		move.b	#0,$6C(a6)

loc_61AEE:
		move.b	2(a5),d0
		cmp.b	$6C(a6),d0
		bne.w	loc_61B68
		bclr	#3,$75(a6)
		bclr	#3,1(a6)
		bra.s	loc_61B68
; ---------------------------------------------------------------------------

loc_61B08:
		btst	#4,$75(a6)
		beq.w	loc_61B74
		subq.b	#1,$6D(a6)
		bne.w	loc_61B74
		move.b	$6E(a6),d0
		add.b	d0,$6C(a6)
		move.b	$6C(a6),d0
		cmp.b	2(a5),d0
		bcs.w	loc_61B68
		move.b	2(a5),$6C(a6)
		btst	#1,(a5)
		beq.w	loc_61B46
		bclr	#4,$75(a6)
		bra.s	loc_61B68
; ---------------------------------------------------------------------------

loc_61B46:
		clr.l	$1E(a6)
		bset	#4,(a6)
		btst	#6,1(a6)
		bne.w	loc_61B62
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_61B62:
		move.b	#$FF,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_61B68:
		move.b	3(a5),$6D(a6)
		bset	#1,1(a6)

loc_61B74:
		bclr	#0,1(a6)
		bne.w	loc_61CEE

loc_61B7E:
		bclr	#7,(a6)
		bne.w	loc_61DDE

loc_61B88:
		bclr	#2,$75(a6)
		bne.w	loc_61D86

loc_61B92:
		bclr	#1,1(a6)
		bne.w	loc_61EE0

loc_61B9C:
		bclr	#2,1(a6)
		bne.w	loc_61E20

loc_61BA6:
		move.w	$A(a6),d0
		add.w	$1C(a6),d0
		add.w	$76(a6),d0
		move.w	d0,8(a6)
		btst	#6,1(a6)
		bne.w	loc_61C74
		tst.b	$16(a6)
		beq.w	loc_61C56
		move.b	d7,d1
		andi.b	#3,d1
		cmpi.b	#2,d1
		bne.w	loc_61C56
		lea	$18(a6),a0
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
		bra.s	loc_61C74
; ---------------------------------------------------------------------------

loc_61C56:
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

loc_61C74:
		move.b	#3,(a4)+
		move.b	#$27,(a4)+
		move.b	$16(a6),(a4)+
		bclr	#5,1(a6)
		beq.w	loc_61CC8
		move.b	4(a5),d6
		ori.b	#$F0,d6
		btst	#0,(a6)
		bne.w	loc_61CC8
		btst	#5,$70(a6)
		beq.w	loc_61CB8
		btst	#6,1(a6)
		bne.w	loc_61CC8
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_61CB8:
		btst	#6,1(a6)
		bne.w	loc_61CC8
		move.b	#0,(a4)+
		move.b	d6,(a4)+

loc_61CC8:
		move.b	4(a5),d7
		move.b	#$FF,(a4)+
		rts
; End of function sub_61934

; =============== S U B R O U T I N E =======================================

sub_61CD2:
		addi.w	#$80,d7
		moveq	#-1,d1
		moveq	#3,d0

loc_61CDA:
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d1,(a4)+
		addq.w	#4,d7
		dbf	d0,loc_61CDA
		subi.w	#$90,d7
		rts
; End of function sub_61CD2
; ---------------------------------------------------------------------------

loc_61CEE:
		btst	#6,1(a6)
		bne.w	loc_61D2C
		btst	#7,(a6)
		bne.w	loc_61D2C
		btst	#5,$70(a6)
		beq.w	loc_61D28
		btst	#4,$70(a6)
		bne.w	loc_61D28
		btst	#0,(a6)
		bne.w	loc_61D28
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_61D28:
		bsr.w	sub_61CD2

loc_61D2C:
		moveq	#0,d1
		move.b	$10(a6),d1
		movea.l	$C(a6),a0
		mulu.w	#$19,d1
		lea	(a0,d1.w),a0
		movea.l	a0,a1
		lea	$9D(a6),a2
		moveq	#$18,d5

loc_61D46:
		move.b	(a1)+,(a2)+
		dbf	d5,loc_61D46
		btst	#6,1(a6)
		bne.w	loc_61B7E
		btst	#7,(a6)
		bne.w	loc_61B7E
		addi.w	#$30,d7
		move.b	#2,(a4)+
		move.b	d7,(a4)+
		subi.w	#$30,d7
		moveq	#$18,d5

loc_61D70:
		move.b	(a0)+,(a4)+
		dbf	d5,loc_61D70
		bset	#1,1(a6)
		bclr	#2,$75(a6)
		bra.w	loc_61B7E
; ---------------------------------------------------------------------------

loc_61D86:
		btst	#6,1(a6)
		bne.w	loc_61B92
		btst	#5,$70(a6)
		beq.w	loc_61DB6
		btst	#4,$70(a6)
		bne.w	loc_61DB6
		btst	#0,(a6)
		bne.w	loc_61DB6
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_61DB6:
		bsr.w	sub_61CD2
		lea	$9D(a6),a0
		addi.w	#$30,d7
		move.b	#2,(a4)+
		move.b	d7,(a4)+
		subi.w	#$30,d7
		moveq	#$18,d5

loc_61DCE:
		move.b	(a0)+,(a4)+
		dbf	d5,loc_61DCE
		bset	#1,1(a6)
		bra.w	loc_61B92
; ---------------------------------------------------------------------------

loc_61DDE:
		moveq	#0,d2
		move.b	$15(a6),d2
		subq.w	#1,d2
		moveq	#0,d0
		lea	$8A(a6),a1
		lea	$9D(a6),a2

loc_61DF0:
		move.b	(a1)+,d0
		cmpi.b	#$B0,d0
		bcs.w	loc_61E00
		move.b	(a1)+,$18(a2)
		bra.s	loc_61E0C
; ---------------------------------------------------------------------------

loc_61E00:
		sub.b	d7,d0
		subi.b	#$30,d0
		lsr.b	#2,d0
		move.b	(a1)+,(a2,d0.w)

loc_61E0C:
		dbf	d2,loc_61DF0
		move.b	#0,$15(a6)
		bset	#2,$75(a6)
		bra.w	loc_61B88
; ---------------------------------------------------------------------------

loc_61E20:
		btst	#6,1(a6)
		bne.w	loc_61BA6
		move.b	$13(a6),d2
		ror.b	#2,d2
		or.b	$17(a6),d2
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7
		bra.w	loc_61BA6

; =============== S U B R O U T I N E =======================================

sub_61E48:
		btst	#1,$75(a6)
		beq.w	locret_61EDE
		subq.b	#1,$9C(a6)
		bne.w	locret_61EDE
		move.b	$9B(a6),$9C(a6)
		cmpi.b	#4,$9A(a6)
		beq.w	loc_61E98
		cmpi.b	#5,$9A(a6)
		beq.w	loc_61EAC
		lea	($FFFF9004).l,a1

loc_61E7A:
		move.w	(a1),d0
		move.w	d0,d1
		lsl.w	#2,d0
		add.w	d1,d0
		addi.w	#$1993,d0
		move.w	d0,(a1)
		ror.w	#8,d0
		andi.b	#3,d0
		beq.w	loc_61E7A
		move.b	d0,$13(a6)
		bra.s	loc_61EBA
; ---------------------------------------------------------------------------

loc_61E98:
		cmpi.b	#3,$13(a6)
		bcs.w	loc_61EA6
		clr.b	$13(a6)

loc_61EA6:
		addq.b	#1,$13(a6)
		bra.s	loc_61EBA
; ---------------------------------------------------------------------------

loc_61EAC:
		subq.b	#1,$13(a6)
		bne.w	loc_61EBA
		move.b	#3,$13(a6)

loc_61EBA:
		btst	#6,1(a6)
		bne.w	locret_61EDE
		move.b	$13(a6),d2
		ror.b	#2,d2
		or.b	$17(a6),d2
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

locret_61EDE:
		rts
; End of function sub_61E48
; ---------------------------------------------------------------------------

loc_61EE0:
		move.b	$11(a6),d0
		bsr.w	sub_61EF4
		bra.w	loc_61B9C
; ---------------------------------------------------------------------------

byte_61EEC:
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 3
		dc.b 7
		dc.b 7
		dc.b $F

; =============== S U B R O U T I N E =======================================

sub_61EF4:
		btst	#6,1(a6)
		bne.w	locret_61F54
		lea	$9D(a6),a1
		move.b	$18(a1),d2
		lea	4(a1),a1
		andi.w	#7,d2
		move.b	byte_61EEC(pc,d2.w),d2
		ror.b	#3,d2
		moveq	#3,d3
		moveq	#$40,d4
		add.b	d7,d4

loc_61F1A:
		move.b	(a1)+,d1
		btst	#0,d2
		beq.w	loc_61F4C
		move.b	d0,d1
		btst	#3,1(a6)
		beq.w	loc_61F38
		add.b	$6C(a6),d1
		bcs.w	loc_61F40

loc_61F38:
		btst	#7,d1
		beq.w	loc_61F44

loc_61F40:
		move.b	#$7F,d1

loc_61F44:
		move.b	#1,(a4)+
		move.b	d4,(a4)+
		move.b	d1,(a4)+

loc_61F4C:
		addq.b	#4,d4
		rol.b	#1,d2
		dbf	d3,loc_61F1A

locret_61F54:
		rts
; End of function sub_61EF4
; ---------------------------------------------------------------------------

loc_61F56:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_61F84(pc,d2.w),d2
		jsr	off_61F84(pc,d2.w)

loc_61F64:
		btst	#4,(a6)
		bne.w	loc_61F76
		move.l	a0,2(a6)
		bra.w	loc_619C4
; ---------------------------------------------------------------------------

loc_61F76:
		move.l	a0,2(a6)
		move.b	4(a5),d7
		move.b	#$FF,(a4)+
		rts
; ---------------------------------------------------------------------------

off_61F84:
		dc.w loc_6202C-off_61F84
		dc.w loc_62048-off_61F84
		dc.w loc_62084-off_61F84
		dc.w loc_620A8-off_61F84
		dc.w loc_6228A-off_61F84
		dc.w loc_621F8-off_61F84
		dc.w loc_62218-off_61F84
		dc.w loc_6238A-off_61F84
		dc.w loc_620B0-off_61F84
		dc.w loc_61FC4-off_61F84
		dc.w loc_6211A-off_61F84
		dc.w loc_621C8-off_61F84
		dc.w loc_6232E-off_61F84
		dc.w loc_6214E-off_61F84
		dc.w loc_62260-off_61F84
		dc.w sub_61FA4-off_61F84

; =============== S U B R O U T I N E =======================================

sub_61FA4:
		moveq	#0,d2
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_61FB8(pc,d2.w),d2
		jsr	off_61FB8(pc,d2.w)
		rts
; End of function sub_61FA4
; ---------------------------------------------------------------------------

off_61FB8:
		dc.w loc_628D8-off_61FB8
		dc.w loc_628D8-off_61FB8
		dc.w loc_628DC-off_61FB8
		dc.w loc_61FF4-off_61FB8
		dc.w loc_62016-off_61FB8
		dc.w loc_62002-off_61FB8
; ---------------------------------------------------------------------------

loc_61FC4:
		move.b	(a0)+,d0
		lea	($B6).l,a1
		tst.b	d0
		beq.w	loc_61FD8
		lea	($C0).l,a1

loc_61FD8:
		move.b	(a0)+,(a1)
		move.b	(a0)+,1(a1)
		move.b	(a0)+,2(a1)
		move.b	(a0)+,3(a1)
		move.b	(a0)+,8(a1)
		bset	#4,(a1)
		rts
; ---------------------------------------------------------------------------

loc_61FF4:
		move.b	(a0)+,d0
		move.b	d0,$6F(a6)

loc_61FFA:
		bset	#5,$70(a6)
		rts
; ---------------------------------------------------------------------------

loc_62002:
		move.b	(a0)+,d0
		bne.w	loc_61FFA
		bclr	#5,$70(a6)
		bset	#1,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_62016:
		move.b	(a0)+,d0
		beq.w	loc_62024
		bset	#4,$70(a6)
		rts
; ---------------------------------------------------------------------------

loc_62024:
		bclr	#4,$70(a6)
		rts
; ---------------------------------------------------------------------------

loc_6202C:
		move.b	(a0)+,d0
		move.b	d0,$10(a6)
		bset	#0,1(a6)
		lea	$B6(a6),a1
		bclr	#4,(a1)
		bclr	#4,$A(a1)
		rts
; ---------------------------------------------------------------------------

loc_62048:
		moveq	#0,d0
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.w	loc_62058
		add.b	$74(a6),d0

loc_62058:
		tst.b	d0
		bpl.w	loc_62062
		moveq	#0,d0
		bra.s	loc_6206C
; ---------------------------------------------------------------------------

loc_62062:
		cmpi.b	#$13,d0
		bls.w	loc_6206C
		moveq	#$13,d0

loc_6206C:
		move.b	d0,$12(a6)

loc_62070:
		lea	FMInstrumentOperatorTableA(pc),a1
		move.b	(a1,d0.w),d0
		move.b	d0,$11(a6)
		bset	#1,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_62084:
		sf	$73(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		bsr.w	sub_6231E
		tst.b	(a0)+
		bne.w	loc_620A2
		move.w	d0,$1C(a6)
		rts
; ---------------------------------------------------------------------------

loc_620A2:
		add.w	d0,$1C(a6)
		rts
; ---------------------------------------------------------------------------

loc_620A8:
		move.b	(a0)+,d0
		move.b	d0,$14(a6)
		rts
; ---------------------------------------------------------------------------

loc_620B0:
		move.b	(a0)+,d0
		cmpi.b	#4,d0
		bcc.w	loc_620CC
		move.b	d0,$13(a6)
		bset	#2,1(a6)
		bclr	#1,$75(a6)
		rts
; ---------------------------------------------------------------------------

loc_620CC:
		move.b	d0,$9A(a6)
		move.b	(a0)+,d1
		move.b	d1,$9B(a6)
		move.b	d1,$9C(a6)
		bset	#1,$75(a6)
		cmpi.b	#4,d0
		bne.w	loc_620F6
		move.b	#2,$13(a6)
		bset	#2,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_620F6:
		cmpi.b	#5,d0
		bne.w	loc_6210C
		move.b	#1,$13(a6)
		bset	#2,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_6210C:
		move.b	#3,$13(a6)
		bset	#2,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_6211A:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		cmpi.b	#8,$15(a6)
		beq.w	locret_6214C
		cmpi.b	#$26,d0
		beq.w	locret_6214C
		lea	$8A(a6),a1
		moveq	#0,d2
		move.b	$15(a6),d2
		add.w	d2,d2
		adda.w	d2,a1
		move.b	d0,(a1)+
		move.b	d1,(a1)
		bset	#7,(a6)
		addq.b	#1,$15(a6)

locret_6214C:
		rts
; ---------------------------------------------------------------------------

loc_6214E:
		bset	#1,(a6)
		rts

; =============== S U B R O U T I N E =======================================


sub_62156:
		tst.l	$1E(a6)
		beq.w	loc_62176
		btst	#$1F,d7
		bne.w	loc_62176
		btst	#2,(a5)
		bne.w	loc_62176
		movea.l	$1E(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_62176:
		btst	#6,1(a6)
		bne.w	loc_62188
		move.b	#0,(a4)+
		move.b	4(a5),(a4)+

loc_62188:
		bset	#4,(a6)
		clr.b	$16(a6)
		btst	#$1F,d7
		beq.w	locret_621C6
		bsr.w	sub_61CD2
		lea	($FFFF91B6).l,a1
		bclr	#6,1(a1)
		bset	#2,1(a1)
		bset	#2,$75(a1)
		clr.b	5(a5)
		move.b	#3,(a4)+
		move.b	#$27,(a4)+
		move.b	#0,(a4)+

locret_621C6:
		rts
; End of function sub_62156

; ---------------------------------------------------------------------------

loc_621C8:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$12(a6)
		bpl.w	loc_621DA
		sf	$12(a6)
		bra.s	loc_621EA
; ---------------------------------------------------------------------------

loc_621DA:
		cmpi.b	#$13,$12(a6)
		bls.w	loc_621EA
		move.b	#$13,$12(a6)

loc_621EA:
		move.b	$12(a6),d0
		bra.w	loc_62070
; ---------------------------------------------------------------------------
		move.l	a0,$1E(a6)
		rts
; ---------------------------------------------------------------------------

loc_621F8:
		addq.l	#2,a0
		moveq	#0,d0
		move.b	$23(a6),d0
		lea	$24(a6),a1
		lea	$2C(a6),a2
		clr.b	(a1,d0.w)
		lsl.w	#2,d0
		move.l	a0,(a2,d0.w)
		addq.b	#1,$23(a6)
		rts
; ---------------------------------------------------------------------------

loc_62218:
		moveq	#0,d0
		move.b	$23(a6),d0
		subq.b	#1,d0
		lea	$24(a6),a1
		lea	$2C(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		tst.b	(a1,d0.w)
		bne.w	loc_6224A
		addq.l	#1,a0
		move.b	(a0)+,(a1,d0.w)
		addq.l	#2,a0
		move.l	a2,-(sp)
		lea	$4C(a6),a2
		move.l	a0,(a2,d1.w)
		movea.l	(sp)+,a2
		subq.l	#4,a0

loc_6224A:
		subq.b	#1,(a1,d0.w)
		beq.w	loc_62258
		movea.l	(a2,d1.w),a0
		bra.s	locret_6225E
; ---------------------------------------------------------------------------

loc_62258:
		addq.l	#4,a0
		subq.b	#1,$23(a6)

locret_6225E:
		rts
; ---------------------------------------------------------------------------

loc_62260:
		addq.l	#2,a0
		moveq	#0,d0
		move.b	$23(a6),d0
		subq.b	#1,d0
		lea	$24(a6),a1
		lea	$4C(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		cmpi.b	#1,(a1,d0.w)
		bne.w	locret_62288
		movea.l	(a2,d1.w),a0
		subq.b	#1,$23(a6)

locret_62288:
		rts
; ---------------------------------------------------------------------------

loc_6228A:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.w	d0,d0
		move.w	off_6229A(pc,d0.w),d0
		jsr	off_6229A(pc,d0.w)
		rts
; ---------------------------------------------------------------------------

off_6229A:
		dc.w loc_622A8-off_6229A
		dc.w loc_622C0-off_6229A
		dc.w loc_622C8-off_6229A
		dc.w sub_622D0-off_6229A
		dc.w sub_622DC-off_6229A
		dc.w loc_622E8-off_6229A
		dc.w sub_6230E-off_6229A
; ---------------------------------------------------------------------------

loc_622A8:
		bsr.w	sub_622D0
		bsr.w	sub_622DC
		bsr.w	sub_622F4
		bsr.w	sub_6230E
		bset	#6,(a6)
		rts
; ---------------------------------------------------------------------------

loc_622C0:
		bclr	#6,(a6)
		rts
; ---------------------------------------------------------------------------

loc_622C8:
		bset	#6,(a6)
		rts

; =============== S U B R O U T I N E =======================================

sub_622D0:
		move.b	(a0)+,d0
		move.b	d0,$78(a6)
		move.b	d0,$7E(a6)
		rts
; End of function sub_622D0

; =============== S U B R O U T I N E =======================================

sub_622DC:
		move.b	(a0)+,d0
		move.b	d0,$79(a6)
		move.b	d0,$7F(a6)
		rts
; End of function sub_622DC

; ---------------------------------------------------------------------------

loc_622E8:
		bsr.w	sub_622F4
		move.b	$79(a6),$7F(a6)
		rts

; =============== S U B R O U T I N E =======================================

sub_622F4:
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		bsr.w	sub_6231E
		move.w	d0,$7C(a6)
		move.w	d0,$80(a6)
		rts
; End of function sub_622F4

; =============== S U B R O U T I N E =======================================

sub_6230E:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$7A(a6)
		lsr.w	#1,d0
		move.w	d0,$82(a6)
		rts
; End of function sub_6230E

; =============== S U B R O U T I N E =======================================

sub_6231E:
		cmpi.b	#$80,d7
		bcs.w	locret_6232C
		muls.w	#$10A,d0
		asr.l	#8,d0

locret_6232C:
		rts
; End of function sub_6231E
; ---------------------------------------------------------------------------

loc_6232E:
		lea	$84(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		lea	$84(a6),a1
		move.b	(a1)+,d0
		ori.b	#8,d0
		btst	#6,1(a6)
		bne.w	loc_62356
		move.b	#3,(a4)+
		move.b	#$22,(a4)+
		move.b	d0,(a4)+

loc_62356:
		move.b	(a1)+,d0
		move.b	(a1)+,d1
		lsl.b	#4,d1
		or.b	d1,d0
		move.b	d0,$17(a6)
		move.b	$13(a6),d2
		ror.b	#2,d2
		andi.b	#$C0,d2
		or.b	d0,d2
		btst	#6,1(a6)
		bne.w	locret_62388
		addi.b	#-$4C,d7
		move.b	#1,(a4)+
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

locret_62388:
		rts
; ---------------------------------------------------------------------------

loc_6238A:
		lea	$18(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)
		tst.l	$18(a6)
		beq.w	loc_623A6
		move.b	#$40,$16(a6)
		rts
; ---------------------------------------------------------------------------

loc_623A6:
		clr.b	$16(a6)
		rts

; =============== S U B R O U T I N E =======================================

sub_623AC:
		btst	#$1F,d7
		bne.w	loc_623BE
		btst	#0,(a5)
		bne.w	locret_623E6

loc_623BE:
		move.b	d7,4(a5)
		btst	#6,1(a6)
		beq.w	loc_623D0
		bsr.w	sub_62732

loc_623D0:
		tst.b	$16(a6)
		beq.w	loc_623DC
		move.b	$16(a6),d7

loc_623DC:
		btst	#4,(a6)
		beq.w	loc_623E8

locret_623E6:
		rts
; ---------------------------------------------------------------------------

loc_623E8:
		subq.b	#1,7(a6)
		bne.w	loc_62440
		btst	#1,(a6)
		bne.w	loc_62440
		bclr	#2,(a6)
		btst	#4,1(a6)
		bne.w	loc_62436
		btst	#5,$70(a6)
		bne.w	loc_6241E
		sf	$18(a6)
		bsr.w	sub_62722
		bra.s	loc_62440
; ---------------------------------------------------------------------------

loc_6241E:
		move.b	$12(a6),d0
		sub.b	$6F(a6),d0
		lsr.b	#1,d0
		eori.b	#$F,d0
		move.b	d0,$11(a6)
		bsr.w	sub_6273A
		bra.s	loc_62440
; ---------------------------------------------------------------------------

loc_62436:
		andi.b	#$F8,$70(a6)
		bsr.w	sub_6281A

loc_62440:
		subq.b	#1,6(a6)
		bne.w	loc_6254C
		andi.b	#$F2,(a6)

loc_6244E:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_6286E
		tst.b	d2
		bne.w	loc_6246C
		bsr.w	sub_62A78
		bra.w	loc_6287C
; ---------------------------------------------------------------------------

loc_6246C:
		bclr	#7,d2
		bne.w	loc_62508
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d3
		move.b	(a0)+,d3
		move.b	$73(a6),$72(a6)
		move.b	d3,$73(a6)
		cmp.b	$72(a6),d3
		bne.w	loc_624A0
		btst	#1,(a6)
		bne.w	loc_624D0

loc_624A0:
		bsr.w	sub_6138E
		btst	#1,(a6)
		bne.w	loc_624D0
		btst	#4,1(a6)
		beq.w	loc_624D0
		ori.b	#1,$70(a6)
		move.b	$84(a6),$18(a6)
		movem.l	d2-d3,-(sp)
		bsr.w	sub_6282E
		movem.l	(sp)+,d2-d3

loc_624D0:
		move.w	d3,d4
		lea	PSGFrequencies(pc),a2
		andi.b	#$F,d3
		add.w	d3,d3
		move.w	(a2,d3.w),d0
		lsr.w	#4,d4
		lsr.w	d4,d0
		move.b	d4,$71(a6)
		move.w	d0,$A(a6)
		move.b	d2,6(a6)
		move.b	$14(a6),d6
		cmp.b	d6,d2
		bhi.w	loc_62500
		move.b	6(a6),d2
		bra.s	loc_62502
; ---------------------------------------------------------------------------

loc_62500:
		sub.b	d6,d2

loc_62502:
		move.b	d2,7(a6)
		bra.s	loc_6253E
; ---------------------------------------------------------------------------

loc_62508:
		btst	#1,(a6)
		bne.w	loc_62536
		btst	#4,$70(a6)
		bne.w	loc_62526
		btst	#5,$70(a6)
		bne.w	loc_62530

loc_62526:
		bsr.w	sub_62722
		move.w	#$FFFF,8(a6)

loc_62530:
		bset	#3,(a6)

loc_62536:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_6253E:
		bclr	#1,(a6)
		bsr.w	sub_626BC
		move.l	a0,2(a6)

loc_6254C:
		btst	#4,1(a6)
		beq.w	loc_6255C
		bsr.w	sub_62788
		bra.s	loc_62576
; ---------------------------------------------------------------------------

loc_6255C:
		btst	#2,(a6)
		beq.w	loc_62576
		move.b	$12(a6),d0
		eori.b	#$F,d0
		move.b	d0,$11(a6)
		bsr.w	sub_6273A

loc_62576:
		bsr.w	sub_613B2
		btst	#3,$75(a6)
		beq.w	loc_625B8
		subq.b	#1,$6D(a6)
		bne.w	loc_62624
		move.b	$6E(a6),d0
		sub.b	d0,$6C(a6)
		bcc.w	loc_6259E
		move.b	#0,$6C(a6)

loc_6259E:
		move.b	2(a5),d0
		cmp.b	$6C(a6),d0
		bne.w	loc_62610
		bclr	#3,$75(a6)
		bclr	#3,1(a6)
		bra.s	loc_62610
; ---------------------------------------------------------------------------

loc_625B8:
		btst	#4,$75(a6)
		beq.w	loc_62624
		subq.b	#1,$6D(a6)
		bne.w	loc_62624
		move.b	$6E(a6),d0
		add.b	d0,$6C(a6)
		move.b	$6C(a6),d0
		cmp.b	2(a5),d0
		bcs.w	loc_62610
		move.b	2(a5),$6C(a6)
		btst	#1,(a5)
		beq.w	loc_625F6
		bclr	#4,$75(a6)
		bra.s	loc_62610
; ---------------------------------------------------------------------------

loc_625F6:
		clr.l	$1E(a6)
		bset	#4,(a6)
		btst	#6,1(a6)
		bne.w	locret_6260E
		bsr.w	sub_62732

locret_6260E:
		rts
; ---------------------------------------------------------------------------

loc_62610:
		move.b	3(a5),$6D(a6)
		btst	#2,(a6)
		bne.w	loc_62624
		bsr.w	sub_6273A

loc_62624:
		bclr	#2,$75(a6)
		beq.w	loc_62634
		move.b	#$FF,d0
		move.b	d0,(a3)

loc_62634:
		move.w	$1C(a6),d0
		add.w	$76(a6),d0
		moveq	#0,d1
		move.b	$71(a6),d1
		asr.w	d1,d0
		add.w	$A(a6),d0
		cmpi.w	#1,d0
		bge.w	loc_62654
		moveq	#1,d0
		bra.s	loc_62660
; ---------------------------------------------------------------------------

loc_62654:
		cmpi.w	#$3FF,d0
		ble.w	loc_62660
		move.w	#$3FF,d0

loc_62660:
		cmp.w	8(a6),d0
		beq.w	locret_62692
		move.w	d0,8(a6)
		cmpi.b	#$E0,d7
		beq.w	loc_62694
		btst	#6,1(a6)
		bne.w	locret_62692
		move.w	d0,d1
		andi.b	#$F,d0
		or.b	4(a5),d0
		move.b	d0,(a3)
		lsr.w	#4,d1
		andi.b	#$3F,d1
		move.b	d1,(a3)

locret_62692:
		rts
; ---------------------------------------------------------------------------

loc_62694:
		move.b	$17(a6),d1
		andi.b	#3,d1
		cmpi.b	#3,d1
		beq.w	loc_626A6
		rts
; ---------------------------------------------------------------------------

loc_626A6:
		move.w	d0,d1
		andi.b	#$F,d0
		or.b	4(a5),d0
		move.b	d0,(a3)
		lsr.w	#4,d1
		andi.b	#$3F,d1
		move.b	d1,(a3)
		rts
; End of function sub_623AC

; =============== S U B R O U T I N E =======================================

sub_626BC:
		cmpi.b	#$FD,(a0)
		bne.w	loc_626CE
		bset	#1,(a6)
		addq.l	#1,a0
		rts
; ---------------------------------------------------------------------------

loc_626CE:
		cmpi.b	#$F4,(a0)
		beq.w	loc_626D8
		rts
; ---------------------------------------------------------------------------

loc_626D8:
		tst.b	1(a0)
		beq.w	loc_62700
		cmpi.b	#1,1(a0)
		beq.w	loc_626EC
		rts
; ---------------------------------------------------------------------------

loc_626EC:
		cmpi.b	#$FD,2(a0)
		beq.w	loc_626F8
		rts
; ---------------------------------------------------------------------------

loc_626F8:
		bset	#1,(a6)
		rts
; ---------------------------------------------------------------------------

loc_62700:
		cmpi.b	#$FD,7(a0)
		beq.w	loc_626F8
		cmpi.b	#$F4,7(a0)
		beq.w	loc_62716
		rts
; ---------------------------------------------------------------------------

loc_62716:
		cmpi.b	#$FD,9(a0)
		beq.w	loc_626F8
		rts
; End of function sub_626BC

; =============== S U B R O U T I N E =======================================

sub_62722:
		cmpi.b	#$E0,d7
		beq.w	locret_62730
		moveq	#$1F,d0
		or.b	d7,d0
		move.b	d0,(a3)

locret_62730:
		rts
; End of function sub_62722

; =============== S U B R O U T I N E =======================================

sub_62732:
		moveq	#$1F,d0
		or.b	d7,d0
		move.b	d0,(a3)
		rts
; End of function sub_62732

; =============== S U B R O U T I N E =======================================

sub_6273A:
		btst	#6,1(a6)
		bne.w	loc_6277E
		btst	#3,(a6)
		bne.w	loc_6277E
		move.b	$11(a6),d0
		btst	#3,1(a6)
		beq.w	loc_62764
		move.b	$6C(a6),d1
		lsr.b	#3,d1
		add.b	d1,d0

loc_62764:
		cmpi.b	#$10,d0
		bcs.w	loc_6276E
		moveq	#$F,d0

loc_6276E:
		ori.b	#$10,d0
		move.b	d7,d1
		andi.b	#$F0,d1
		or.b	d1,d0
		move.b	d0,(a3)
		rts
; ---------------------------------------------------------------------------

loc_6277E:
		move.b	d7,d0
		ori.b	#$1F,d0
		move.b	d0,(a3)
		rts
; End of function sub_6273A

; =============== S U B R O U T I N E =======================================

sub_62788:
		btst	#0,$70(a6)
		beq.w	loc_627B8
		move.b	$18(a6),d0
		move.b	$85(a6),d1
		add.b	d1,d0
		bcc.w	loc_627A4
		move.b	#$FF,d0

loc_627A4:
		move.b	d0,$18(a6)
		cmpi.b	#$FF,d0
		bne.w	sub_6282E
		eori.b	#3,$70(a6)
		bra.s	sub_6282E
; ---------------------------------------------------------------------------

loc_627B8:
		btst	#1,$70(a6)
		beq.w	loc_627EE
		move.b	$18(a6),d0
		move.b	$86(a6),d1
		move.b	$87(a6),d2
		sub.b	d1,d0
		bcs.w	loc_627DA
		cmp.b	d2,d0
		bcc.w	loc_627DC

loc_627DA:
		move.b	d2,d0

loc_627DC:
		move.b	d0,$18(a6)
		cmp.b	d2,d0
		bne.w	sub_6282E
		eori.b	#6,$70(a6)
		bra.s	sub_6282E
; ---------------------------------------------------------------------------

loc_627EE:
		btst	#2,$70(a6)
		beq.w	sub_6281A
		move.b	$18(a6),d0
		move.b	$88(a6),d1
		sub.b	d1,d0
		bcc.w	loc_62808
		moveq	#0,d0

loc_62808:
		move.b	d0,$18(a6)
		tst.b	d0
		bne.w	sub_6282E
		andi.b	#$F8,$70(a6)
		bra.s	sub_6282E
; End of function sub_62788

; =============== S U B R O U T I N E =======================================

sub_6281A:
		move.b	$18(a6),d0
		move.b	$89(a6),d1
		sub.b	d1,d0
		bcc.w	loc_6282A
		moveq	#0,d0

loc_6282A:
		move.b	d0,$18(a6)
; End of function sub_6281A

; =============== S U B R O U T I N E =======================================

sub_6282E:
		moveq	#0,d0
		move.b	$18(a6),d0
		moveq	#0,d2
		move.b	$12(a6),d2
		addq.b	#1,d2
		mulu.w	d2,d0
		lsr.w	#8,d0
		btst	#2,(a6)
		bne.w	loc_6285A
		btst	#5,$70(a6)
		beq.w	loc_6285A
		add.b	$6F(a6),d0
		lsr.b	#1,d0

loc_6285A:
		eori.b	#$F,d0
		move.b	d0,$11(a6)
		bsr.w	sub_6273A
		move.b	$18(a6),$13(a6)
		rts
; End of function sub_6282E
; ---------------------------------------------------------------------------

loc_6286E:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_62894(pc,d2.w),d2
		jsr	off_62894(pc,d2.w)

loc_6287C:
		btst	#4,(a6)
		bne.w	loc_6288E
		move.l	a0,2(a6)
		bra.w	loc_6244E
; ---------------------------------------------------------------------------

loc_6288E:
		move.l	a0,2(a6)
		rts
; ---------------------------------------------------------------------------

off_62894:
		dc.w loc_62900-off_62894
		dc.w loc_6293A-off_62894
		dc.w loc_628B6-off_62894
		dc.w loc_620A8-off_62894
		dc.w loc_6228A-off_62894
		dc.w loc_621F8-off_62894
		dc.w loc_62218-off_62894
		dc.w loc_629BA-off_62894
		dc.w loc_62A24-off_62894
		dc.w loc_628D8-off_62894
		dc.w loc_628E8-off_62894
		dc.w loc_62986-off_62894
		dc.w locret_62D82-off_62894
		dc.w locret_628B4-off_62894
		dc.w loc_62260-off_62894
		dc.w sub_61FA4-off_62894
; ---------------------------------------------------------------------------

locret_628B4:
		rts
; ---------------------------------------------------------------------------

loc_628B6:
		move.w	#0,8(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.l	#2,a0
		tst.b	(a0)+
		bne.w	loc_628D2
		move.w	d0,$1C(a6)
		rts
; ---------------------------------------------------------------------------

loc_628D2:
		add.w	d0,$1C(a6)
		rts
; ---------------------------------------------------------------------------

loc_628D8:
		addq.l	#1,a0
		rts
; ---------------------------------------------------------------------------

loc_628DC:
		addq.l	#2,a0
		rts
; ---------------------------------------------------------------------------

loc_628E0:
		addq.l	#3,a0
		rts
; ---------------------------------------------------------------------------

loc_628E4:
		addq.l	#4,a0
		rts
; ---------------------------------------------------------------------------

loc_628E8:
		lea	$84(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		bset	#4,1(a6)
		rts
; ---------------------------------------------------------------------------

loc_62900:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	d0,$10(a6)
		lea	PSG_Tone(pc),a1
		lea	$84(a6),a2
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
		beq.w	locret_62938
		move.w	d0,8(a6)

locret_62938:
		rts
; ---------------------------------------------------------------------------

loc_6293A:
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.w	loc_62964
		move.b	$74(a6),d1
		btst	#7,d1
		bne.w	loc_62954
		add.b	d1,d0
		bra.s	loc_6296E
; ---------------------------------------------------------------------------

loc_62954:
		not.b	d1
		andi.b	#$F,d1
		sub.b	d1,d0
		bcc.w	loc_6296E
		moveq	#0,d0
		bra.s	loc_62978
; ---------------------------------------------------------------------------

loc_62964:
		subq.b	#1,d0
		bcc.w	loc_6296E
		moveq	#0,d0
		bra.s	loc_62978
; ---------------------------------------------------------------------------

loc_6296E:
		cmpi.b	#$F,d0
		bls.w	loc_62978
		moveq	#$F,d0

loc_62978:
		move.b	d0,$12(a6)
		eori.b	#$F,d0
		move.b	d0,$11(a6)
		rts
; ---------------------------------------------------------------------------

loc_62986:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$12(a6)
		cmpi.b	#$F,$12(a6)
		ble.w	loc_629A0
		move.b	#$F,$12(a6)
		bra.s	loc_629AC
; ---------------------------------------------------------------------------

loc_629A0:
		tst.b	$12(a6)
		bge.w	loc_629AC
		sf	$12(a6)

loc_629AC:
		move.b	$12(a6),d0
		eori.b	#$F,d0
		move.b	d0,$11(a6)
		rts
; ---------------------------------------------------------------------------

loc_629BA:
		move.b	(a0)+,d0
		cmpi.b	#8,d0
		beq.w	loc_62A0C
		move.b	#$E0,d1
		move.b	d1,$16(a6)
		move.b	d1,d7
		tst.b	d0
		bne.w	loc_629EE
		move.b	$17(a6),d0
		andi.b	#3,d0
		move.b	d0,$17(a6)
		or.b	d1,d0
		btst	#6,1(a6)
		bne.s	locret_629EC
		move.b	d0,(a3)

locret_629EC:
		rts
; ---------------------------------------------------------------------------

loc_629EE:
		move.b	$17(a6),d0
		andi.b	#3,d0
		ori.b	#4,d0
		move.b	d0,$17(a6)
		or.b	d1,d0
		btst	#6,1(a6)
		bne.s	locret_62A0A
		move.b	d0,(a3)

locret_62A0A:
		rts
; ---------------------------------------------------------------------------

loc_62A0C:
		sf	$16(a6)
		move.b	4(a5),d7
		move.b	#$FF,d0
		btst	#6,1(a6)
		bne.s	locret_62A22
		move.b	d0,(a3)

locret_62A22:
		rts
; ---------------------------------------------------------------------------

loc_62A24:
		move.b	(a0)+,d0
		tst.b	$16(a6)
		beq.w	locret_62A76
		cmpi.b	#$20,d0
		bne.w	loc_62A3A
		moveq	#3,d1
		bra.s	loc_62A52
; ---------------------------------------------------------------------------

loc_62A3A:
		moveq	#0,d1
		cmpi.b	#$B,d0
		bcs.w	loc_62A52
		cmpi.b	#$16,d0
		bcc.w	loc_62A50
		moveq	#1,d1
		bra.s	loc_62A52
; ---------------------------------------------------------------------------

loc_62A50:
		moveq	#2,d1

loc_62A52:
		move.b	$17(a6),d0
		andi.b	#$64,d0
		or.b	d0,d1
		move.b	d1,$17(a6)
		move.b	$16(a6),d0
		or.b	$17(a6),d0
		btst	#6,1(a6)
		bne.s	loc_62A72
		move.b	d0,(a3)

loc_62A72:
		move.b	$16(a6),d7

locret_62A76:
		rts

; =============== S U B R O U T I N E =======================================

sub_62A78:
		tst.l	$1E(a6)
		beq.w	loc_62A98
		btst	#$1F,d7
		bne.w	loc_62A98
		btst	#2,(a5)
		bne.w	loc_62A98
		movea.l	$1E(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_62A98:
		bset	#4,(a6)
		bsr.w	sub_62722
		btst	#$1F,d7
		beq.w	locret_62ADE
		sf	$16(a6)
		lea	($FFFF9528).l,a2
		bclr	#6,1(a2)
		move.b	$16(a2),d0
		beq.w	loc_62ACE
		move.b	$16(a2),d0
		or.b	$17(a2),d0
		move.b	d0,(a3)
		bra.s	loc_62ADA
; ---------------------------------------------------------------------------

loc_62ACE:
		move.w	#0,8(a2)
		bset	#2,$75(a2)

loc_62ADA:
		sf	6(a5)

locret_62ADE:
		rts
; End of function sub_62A78

; =============== S U B R O U T I N E =======================================

sub_62AE0:
		tst.b	($FFFF9013).l
		beq.w	loc_62AFE
		move.b	#$11,(a4)+
		move.b	$72(a6),(a4)+
		move.b	$74(a6),(a4)+
		move.b	$13(a6),(a4)+
		st	$15(a6)

loc_62AFE:
		btst	#0,(a5)
		bne.w	loc_62B16
		move.b	d7,4(a5)
		btst	#4,(a6)
		beq.w	loc_62B1C

loc_62B16:
		move.b	#$FF,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_62B1C:
		btst	#2,d7
		beq.w	loc_62B26
		subq.b	#4,d7

loc_62B26:
		subq.b	#1,7(a6)
		subq.b	#1,6(a6)
		bne.w	loc_62BB2
		andi.b	#$F0,(a6)

loc_62B38:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_62CE2
		tst.b	d2
		bne.w	loc_62B56
		bsr.w	sub_62D4C
		bra.w	loc_62CF0
; ---------------------------------------------------------------------------

loc_62B56:
		bclr	#7,d2
		bne.w	loc_62B9A
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$A(a6)
		move.b	d2,6(a6)
		move.b	$14(a6),d6
		cmp.b	d6,d2
		bhi.w	loc_62B88
		move.b	#1,7(a6)
		bra.s	loc_62B8E
; ---------------------------------------------------------------------------

loc_62B88:
		sub.b	d6,d2
		move.b	d2,7(a6)

loc_62B8E:
		move.l	a0,2(a6)
		bset	#5,1(a6)
		bra.s	loc_62BB2
; ---------------------------------------------------------------------------

loc_62B9A:
		bset	#3,(a6)
		bclr	#2,(a6)
		move.b	d2,6(a6)
		move.b	d2,7(a6)
		move.l	a0,2(a6)

loc_62BB2:
		btst	#3,$75(a6)
		beq.w	loc_62BEA
		subq.b	#1,$6D(a6)
		bne.w	loc_62C3E
		move.b	$6E(a6),d0
		sub.b	d0,$6C(a6)
		bcc.w	loc_62BD6
		move.b	#0,$6C(a6)

loc_62BD6:
		move.b	2(a5),d0
		cmp.b	$6C(a6),d0
		bne.w	loc_62C38
		bclr	#3,$75(a6)
		bra.s	loc_62C38
; ---------------------------------------------------------------------------

loc_62BEA:
		btst	#4,$75(a6)
		beq.w	loc_62C3E
		subq.b	#1,$6D(a6)
		bne.w	loc_62C3E
		move.b	$6E(a6),d0
		add.b	d0,$6C(a6)
		move.b	$6C(a6),d0
		cmp.b	2(a5),d0
		bcs.w	loc_62C38
		move.b	2(a5),$6C(a6)
		btst	#1,(a5)
		beq.w	loc_62C28
		bclr	#4,$75(a6)
		bra.s	loc_62C38
; ---------------------------------------------------------------------------

loc_62C28:
		clr.l	$1E(a6)
		bset	#4,(a6)
		move.b	#$FF,(a4)+
		rts
; ---------------------------------------------------------------------------

loc_62C38:
		move.b	3(a5),$6D(a6)

loc_62C3E:
		bclr	#2,1(a6)
		bne.w	loc_62CBE

loc_62C48:
		nop
		bclr	#5,1(a6)
		beq.w	loc_62CB4
		btst	#6,1(a6)
		bne.w	loc_62CB4
		btst	#1,(a6)
		bne.w	loc_62CB4
		cmpi.b	#$50,$6C(a6)
		bcc.w	loc_62CB4
		cmpi.b	#$30,$6C(a6)
		bcs.w	loc_62C84
		move.b	#2,$73(a6)
		bra.s	loc_62C9C
; ---------------------------------------------------------------------------

loc_62C84:
		cmpi.b	#$10,$6C(a6)
		bcs.w	loc_62C96
		move.b	#1,$73(a6)
		bra.s	loc_62C9C
; ---------------------------------------------------------------------------

loc_62C96:
		move.b	#0,$73(a6)

loc_62C9C:
		tst.b	$15(a6)
		bne.w	loc_62CB4
		move.b	#$10,(a4)+
		move.b	$10(a6),d0
		subq.b	#1,d0
		move.b	d0,(a4)+
		move.b	$73(a6),(a4)+

loc_62CB4:
		move.b	#$FF,(a4)+
		move.b	4(a5),d7
		rts
; ---------------------------------------------------------------------------

loc_62CBE:
		btst	#6,1(a6)
		bne.w	loc_62CDE
		move.b	$13(a6),d2
		ror.b	#2,d2
		move.b	#1,(a4)+
		addi.b	#-$4C,d7
		move.b	d7,(a4)+
		move.b	d2,(a4)+
		subi.b	#$B4,d7

loc_62CDE:
		bra.w	loc_62C48
; ---------------------------------------------------------------------------

loc_62CE2:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_62D0C(pc,d2.w),d2
		jsr	off_62D0C(pc,d2.w)

loc_62CF0:
		btst	#4,(a6)
		bne.w	loc_62D02
		move.l	a0,2(a6)
		bra.w	loc_62B38
; ---------------------------------------------------------------------------

loc_62D02:
		move.l	a0,2(a6)
		move.b	#$FF,(a4)+
		rts
; End of function sub_62AE0
; ---------------------------------------------------------------------------

off_62D0C:
		dc.w loc_6202C-off_62D0C
		dc.w loc_62048-off_62D0C
		dc.w loc_628E0-off_62D0C
		dc.w loc_620A8-off_62D0C
		dc.w loc_6228A-off_62D0C
		dc.w loc_621F8-off_62D0C
		dc.w loc_62218-off_62D0C
		dc.w loc_628E4-off_62D0C
		dc.w loc_620B0-off_62D0C
		dc.w loc_628D8-off_62D0C
		dc.w loc_62D6C-off_62D0C
		dc.w loc_621C8-off_62D0C
		dc.w locret_62D82-off_62D0C
		dc.w loc_6214E-off_62D0C
		dc.w loc_62260-off_62D0C
		dc.w loc_62D2C-off_62D0C
; ---------------------------------------------------------------------------

loc_62D2C:
		moveq	#0,d2
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_62D40(pc,d2.w),d2
		jsr	off_62D40(pc,d2.w)
		rts
; ---------------------------------------------------------------------------

off_62D40:
		dc.w loc_628D8-off_62D40
		dc.w loc_628D8-off_62D40
		dc.w loc_628DC-off_62D40
		dc.w loc_628D8-off_62D40
		dc.w loc_628D8-off_62D40
		dc.w loc_628D8-off_62D40

; =============== S U B R O U T I N E =======================================

sub_62D4C:
		tst.l	$1E(a6)
		beq.w	loc_62D64
		btst	#2,(a5)
		bne.w	loc_62D64
		movea.l	$1E(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_62D64:
		bset	#4,(a6)
		rts
; End of function sub_62D4C
; ---------------------------------------------------------------------------

loc_62D6C:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		tst.b	$15(a6)
		bne.w	locret_62D80
		move.b	#3,(a4)+
		move.b	d0,(a4)+
		move.b	d1,(a4)+

locret_62D80:
		rts
; ---------------------------------------------------------------------------

locret_62D82:
		rts

; =============== S U B R O U T I N E =======================================

			include "Sound/Ancient Music Driver (1.6)/Music/Misc.asm"
			include "Sound/Ancient Music Driver (1.6)/Music/Music Pointer.asm"
Z80Driver:	binclude "Sound/Ancient Music Driver (1.6)/DAC Driver (Z80).bin"
	even

; =============== S U B R O U T I N E =======================================

		align $80000
			include "Sound/Ancient Music Driver (1.6)/DAC/Samples.asm"
	even