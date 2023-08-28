; Mucom-MD- 68000 Program Version 0.85.
; Copyright (C) (M.N.M Software)., Programmed By T.Maruyam.
; Updated driver version the SMPS Mucom.
; ---------------------------------------------------------------------------

   if MOMPASS=1
		message "Mucom Sound Driver v0.85 ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverMucomRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

UpdateMusic_Mucom:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		lea	(SndDriverMucomRAM).l,a5
		btst	#0,$C(a5)
		bne.w	loc_400FE
		lea	($A04000).l,a3
		lea	(a3),a4
		moveq	#0,d7
		lea	(SndDriverMucomRAM+$14).l,a6
		bsr.w	sub_40E46
		addq.w	#1,d7
		lea	(SndDriverMucomRAM+$B4).l,a6
		bsr.w	sub_40E46
		addq.w	#1,d7
		lea	(SndDriverMucomRAM+$154).l,a6
		bsr.w	sub_40E46
		addq.l	#2,a3
		moveq	#4,d7
		lea	(SndDriverMucomRAM+$3D4).l,a6
		bsr.w	sub_40E46
		addq.w	#1,d7
		lea	(SndDriverMucomRAM+$474).l,a6
		bsr.w	sub_40E46
		addq.w	#1,d7
		lea	(SndDriverMucomRAM+$514).l,a6
		bsr.w	sub_4262E
		lea	(PSG_input).l,a3
		moveq	#0,d7
		move.b	#$80,d7
		lea	(SndDriverMucomRAM+$1F4).l,a6
		bsr.w	sub_42030
		move.b	#$A0,d7
		lea	(SndDriverMucomRAM+$294).l,a6
		bsr.w	sub_42030
		move.b	#$C0,d7
		lea	(SndDriverMucomRAM+$334).l,a6
		bsr.w	sub_42030

loc_400FE:
		stopZ80
		tst.b	(Z80_RAM+$1FF6).l
		bne.s	loc_40122
		lea	(SndDriverMucomRAM+$514).l,a6
		sf	$19(a6)

loc_40122:
		startZ80
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function UpdateMusic

; =============== S U B R O U T I N E =======================================

sub_40132:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		lea	(SndDriverMucomRAM).l,a5
		lea	($A04000).l,a3
		lea	(a3),a4
		move.l	#$80000001,d7
		lea	(SndDriverMucomRAM+$5B4).l,a6
		bsr.w	sub_40E46
		addq.w	#1,d7
		lea	(SndDriverMucomRAM+$654).l,a6
		bsr.w	sub_40E46
		lea	(PSG_input).l,a3
		move.l	#$800000A0,d7
		lea	(SndDriverMucomRAM+$6F4).l,a6
		bsr.w	sub_42030
		move.b	#$C0,d7
		lea	(SndDriverMucomRAM+$794).l,a6
		bsr.w	sub_42030
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function sub_40132

; =============== S U B R O U T I N E =======================================

Play_Music_Mucom:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d1-a6,-(sp)
		andi.w	#$FF,d0
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		add.w	d0,d0
		lea	Music_Bank_Mucom(pc),a0
		move.w	(a0,d0.l),d0
		lea	(a0,d0.l),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		lea	(SndDriverMucomRAM).l,a5
		bra.w	loc_40488
; End of function Play_Music_Mucom

; =============== S U B R O U T I N E =======================================

Play_Sound_Mucom:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d1-a6,-(sp)
		lea	(SndDriverMucomRAM).l,a5
		tst.w	d0
		beq.w	loc_40262
		move.w	d0,d2
		andi.w	#$FF00,d2
		bne.s	loc_401EE
		cmpi.b	#1,d0
		beq.w	loc_40270
		cmpi.b	#2,d0
		beq.w	loc_40406
		cmpi.b	#3,d0
		beq.w	loc_40292
		cmpi.b	#4,d0
		beq.w	loc_402B4
		cmpi.b	#5,d0
		beq.w	loc_402CE
		cmpi.b	#6,d0
		beq.w	loc_402D8
		cmpi.b	#$E0,d0
		bcc.w	loc_4035C
		bra.w	loc_409F2
; ---------------------------------------------------------------------------

loc_401EE:
		cmpi.w	#$100,d2		; Play Music
		beq.w	loc_40488
		cmpi.w	#$200,d2		; Play Sample
		beq.w	loc_409AC
		bra.w	loc_409F2
; End of function Play_Sound_Mucom

; =============== S U B R O U T I N E =======================================

sub_4022A:
		lea	(SndDriverMucomRAM+$5B4).l,a6
		bset	#4,(a6)
		lea	$A0(a6),a6
		bset	#4,(a6)
		lea	$A0(a6),a6
		bset	#4,(a6)
		lea	$A0(a6),a6
		bset	#4,(a6)
		lea	$D(a5),a0
		clr.b	(a0)+
		clr.b	(a0)+
		clr.b	(a0)+
		clr.b	(a0)+
		rts
; End of function sub_4022A
; ---------------------------------------------------------------------------

loc_40262:
		bsr.w	sub_409F6
		bset	#0,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_40270:
		move.b	#2,8(a5)
		move.b	#$7E,9(a5)
		bset	#1,$C(a5)
		bclr	#2,$C(a5)
		bclr	#3,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_40292:
		move.b	#2,8(a5)
		move.b	#$A,9(a5)
		bset	#1,$C(a5)
		bclr	#2,$C(a5)
		bset	#3,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_402B4:
		clr.b	9(a5)
		bclr	#1,$C(a5)
		bset	#2,$C(a5)
		bclr	#3,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_402CE:
		bset	#4,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_402D8:
		moveq	#0,d0
		btst	#4,(SndDriverMucomRAM+$14).l
		bne.s	loc_402E8
		or.w	#1,d0

loc_402E8:
		btst	#4,(SndDriverMucomRAM+$B4).l
		bne.s	loc_402F6
		or.w	#2,d0

loc_402F6:
		btst	#4,(SndDriverMucomRAM+$154).l
		bne.s	loc_40304
		or.w	#4,d0

loc_40304:
		btst	#4,(SndDriverMucomRAM+$1F4).l
		bne.s	loc_40312
		or.w	#8,d0

loc_40312:
		btst	#4,(SndDriverMucomRAM+$294).l
		bne.s	loc_40320
		ori.w	#$10,d0

loc_40320:
		btst	#4,(SndDriverMucomRAM+$334).l
		bne.s	loc_4032E
		ori.w	#$20,d0

loc_4032E:
		btst	#4,(SndDriverMucomRAM+$3D4).l
		bne.s	loc_4033C
		ori.w	#$40,d0

loc_4033C:
		btst	#4,(SndDriverMucomRAM+$474).l
		bne.s	loc_4034A
		ori.w	#$80,d0

loc_4034A:
		btst	#4,(SndDriverMucomRAM+$514).l
		bne.s	loc_40358
		ori.w	#$100,d0

loc_40358:
		bra.w	loc_409EA
; ---------------------------------------------------------------------------

loc_4035C:
		lea	(SndDriverMucomRAM+$14).l,a6
		subi.b	#$E0,d0
		andi.w	#$FF,d0
		move.w	d0,d2
		cmpi.b	#8,d2
		bne.s	loc_4037A
		lea	(SndDriverMucomRAM+$514).l,a6
		bra.s	loc_40380
; ---------------------------------------------------------------------------

loc_4037A:
		mulu.w	#$A0,d0
		adda.l	d0,a6

loc_40380:
		tst.w	d1
		bne.s	loc_40394
		bset	#0,1(a6)
		bclr	#6,1(a6)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_40394:
		cmpi.b	#8,d2
		bne.s	loc_4039C
		bra.s	loc_403FC
; ---------------------------------------------------------------------------

loc_4039C:
		moveq	#0,d7
		move.b	d2,d7

loc_403A0:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_403CC
		startZ80
		nop
		nop
		nop
		bra.s	loc_403A0
; ---------------------------------------------------------------------------

loc_403CC:
		tst.b	(a4)
		bmi.s	loc_403CC
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_403DE:
		tst.b	(a4)
		bmi.s	loc_403DE
		move.b	d7,1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80
		bsr.w	sub_41646

loc_403FC:
		bset	#6,1(a6)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_40406:
		move.b	#3,d1
		move.b	#$F7,d2
		move.b	#2,d3
		lea	(SndDriverMucomRAM+$14).l,a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d3,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	$A0(a6),a6
		and.b	d2,1(a6)
		or.b	d1,1(a6)
		lea	$A0(a6),a6
		ori.b	#4,1(a6)
		bclr	#0,$C(a5)
		bra.w	loc_409E8
; ---------------------------------------------------------------------------

loc_40488:
		bsr.w	sub_409F6
		bsr.w	sub_4022A

loc_40490:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_404BC
		startZ80
		nop
		nop
		nop
		bra.s	loc_40490
; ---------------------------------------------------------------------------

loc_404BC:
		tst.b	($A04000).l
		bmi.s	loc_404BC
		move.b	#$22,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_404D6:
		tst.b	($A04000).l
		bmi.s	loc_404D6
		move.b	#0,($A04001).l
		nop
		nop
		nop
		nop
		nop
		startZ80
		lea	(SoundDriverMusicRAM).l,a0
		sf	$C(a5)
		sf	$13(a5)
		addq.w	#5,a0
		move.l	a0,d1
		moveq	#0,d3
		move.b	1(a0),d3
		lsl.w	#8,d3
		move.b	(a0),d3
		addq.w	#2,a0
		add.l	d1,d3
		addq.w	#2,a0
		move.l	a0,d1
		addq.w	#1,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$14).l,a6
		bsr.w	sub_4085E
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$B4).l,a6
		bsr.w	sub_4085E
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$154).l,a6
		bsr.w	sub_4085E
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$1F4).l,a6
		bsr.w	sub_408DE
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$294).l,a6
		bsr.w	sub_408DE
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$334).l,a6
		bsr.w	sub_408DE
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$3D4).l,a6
		bsr.w	sub_4085E
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$474).l,a6
		bsr.w	sub_4085E
		addq.l	#4,a0
		moveq	#0,d2
		move.b	1(a0),d2
		lsl.w	#8,d2
		move.b	(a0),d2
		addq.w	#2,a0
		lea	(SndDriverMucomRAM+$514).l,a6
		bsr.w	sub_4095C
		bra.w	loc_409E8

; =============== S U B R O U T I N E =======================================

sub_4085E:
		add.l	d1,d2
		move.l	d2,2(a6)
		move.l	d3,$C(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		tst.w	d0
		beq.s	loc_40882
		add.l	d1,d0
		move.l	d0,$22(a6)

loc_40882:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	#5,1(a6)
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
		rts
; End of function sub_4085E

; =============== S U B R O U T I N E =======================================

sub_408DE:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		tst.w	d0
		beq.s	loc_408FE
		add.l	d1,d0
		move.l	d0,$22(a6)

loc_408FE:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	#2,1(a6)
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
		rts
; End of function sub_408DE

; =============== S U B R O U T I N E =======================================

sub_4095C:
		add.l	d1,d2
		move.l	d2,2(a6)
		clr.l	$22(a6)
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		tst.w	d0
		beq.s	loc_4097C
		add.l	d1,d0
		move.l	d0,$22(a6)

loc_4097C:
		moveq	#0,d0
		move.b	d0,(a6)
		move.b	#3,1(a6)
		move.w	#$101,6(a6)
		move.b	#3,$17(a6)
		move.b	#4,$86(a6)
		move.b	d0,$18(a6)
		move.b	d0,$27(a6)
		move.l	d0,$28(a6)
		move.l	d0,$2C(a6)
		rts
; End of function sub_4095C
; ---------------------------------------------------------------------------

loc_409AC:
		andi.w	#$FF,d0
		move.w	d0,d6
		lea	(SndDriverMucomRAM).l,a5
		lea	(SndDriverMucomRAM+$514).l,a6
		move.b	#$80,$19(a6)
		addi.b	#-$76,d6
		stopZ80
		move.b	d6,(Z80_RAM+$1FFF).l
		startZ80

loc_409E8:
		moveq	#0,d0

loc_409EA:
		movem.l	(sp)+,d1-a6
		move	(sp)+,sr
		rts
; ---------------------------------------------------------------------------

loc_409F2:
		moveq	#-1,d0
		bra.s	loc_409EA

; =============== S U B R O U T I N E =======================================

sub_409F6:
		bsr.s	sub_409FE
		bra.w	sub_40C16
; End of function sub_409F6

; =============== S U B R O U T I N E =======================================

sub_409FE:
		movem.l	d0-d1/d6-a0,-(sp)
		moveq	#7,d1

loc_40A04:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40A30
		startZ80
		nop
		nop
		nop
		bra.s	loc_40A04
; ---------------------------------------------------------------------------

loc_40A30:
		tst.b	($A04000).l
		bmi.s	loc_40A30
		move.b	#$28,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_40A4A:
		tst.b	($A04000).l
		bmi.s	loc_40A4A
		move.b	d1,($A04001).l
		nop
		nop
		nop
		nop
		nop
		startZ80
		dbf	d1,loc_40A04
		moveq	#$E,d0
		moveq	#$4E,d7
		move.w	#$8E,d6
		moveq	#-1,d1

loc_40A78:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40AA4
		startZ80
		nop
		nop
		nop
		bra.s	loc_40A78
; ---------------------------------------------------------------------------

loc_40AA4:
		tst.b	($A04000).l
		bmi.s	loc_40AA4
		move.b	d7,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_40ABC:
		tst.b	($A04000).l
		bmi.s	loc_40ABC
		move.b	d1,($A04001).l
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_40ADC:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40B08
		startZ80
		nop
		nop
		nop
		bra.s	loc_40ADC
; ---------------------------------------------------------------------------

loc_40B08:
		tst.b	($A04000).l
		bmi.s	loc_40B08
		move.b	d6,($A04000).l
		nop
		nop
		nop
		nop
		nop

loc_40B20:
		tst.b	($A04000).l
		bmi.s	loc_40B20
		move.b	d1,($A04001).l
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_40B40:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40B6C
		startZ80
		nop
		nop
		nop
		bra.s	loc_40B40
; ---------------------------------------------------------------------------

loc_40B6C:
		tst.b	($A04000).l
		bmi.s	loc_40B6C
		move.b	d7,($A04002).l
		nop
		nop
		nop
		nop
		nop

loc_40B84:
		tst.b	($A04000).l
		bmi.s	loc_40B84
		move.b	d1,($A04003).l
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_40BA4:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40BD0
		startZ80
		nop
		nop
		nop
		bra.s	loc_40BA4
; ---------------------------------------------------------------------------

loc_40BD0:
		tst.b	($A04000).l
		bmi.s	loc_40BD0
		move.b	d6,($A04002).l
		nop
		nop
		nop
		nop
		nop

loc_40BE8:
		tst.b	($A04000).l
		bmi.s	loc_40BE8
		move.b	d1,($A04003).l
		nop
		nop
		nop
		nop
		nop
		startZ80
		subq.w	#1,d6
		subq.w	#1,d7
		dbf	d0,loc_40A78
		movem.l	(sp)+,d0-d1/d6-a0
		rts
; End of function sub_409FE

; =============== S U B R O U T I N E =======================================

sub_40C16:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)
		move.b	#$BF,(a0)
		move.b	#$DF,(a0)
		move.b	#$FF,(a0)
		rts
; End of function sub_40C16

; =============== S U B R O U T I N E =======================================

sub_40DE4:
		move.b	$7E(a6),$84(a6)
		move.b	$7F(a6),$85(a6)
		move.w	$82(a6),$86(a6)
		move.w	$80(a6),d6
		lsr.w	#1,d6
		move.w	d6,$88(a6)
		move.w	#0,$7C(a6)
		rts
; End of function sub_40DE4

; =============== S U B R O U T I N E =======================================

sub_40E08:
		btst	#6,(a6)
		beq.s	locret_40E44
		tst.b	$84(a6)
		beq.s	loc_40E1C
		subq.b	#1,$84(a6)
		bra.s	locret_40E44
; ---------------------------------------------------------------------------

loc_40E1C:
		subq.b	#1,$85(a6)
		bne.s	locret_40E44
		move.b	$7F(a6),$85(a6)
		tst.w	$88(a6)
		bne.s	loc_40E38
		neg.w	$86(a6)
		move.w	$80(a6),$88(a6)

loc_40E38:
		subq.w	#1,$88(a6)
		move.w	$86(a6),d0
		add.w	d0,$7C(a6)

locret_40E44:
		rts
; End of function sub_40E08

; =============== S U B R O U T I N E =======================================

sub_40E46:
		move.b	d7,$12(a5)
		btst	#4,(a6)
		beq.s	loc_40E54
		rts
; ---------------------------------------------------------------------------

loc_40E54:
		btst	#2,d7
		beq.s	loc_40E5C
		subq.w	#4,d7

loc_40E5C:
		subq.b	#1,7(a6)
		bne.w	loc_40EF8
		btst	#1,(a6)
		bne.w	loc_40EF8
		bclr	#2,(a6)
		btst	#5,$74(a6)
		bne.s	loc_40EE0
		btst	#6,1(a6)
		bne.s	loc_40EDE

loc_40E84:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40EB0
		startZ80
		nop
		nop
		nop
		bra.s	loc_40E84
; ---------------------------------------------------------------------------

loc_40EB0:
		tst.b	(a4)
		bmi.s	loc_40EB0
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_40EC2:
		tst.b	(a4)
		bmi.s	loc_40EC2
		move.b	$12(a5),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_40EDE:
		bra.s	loc_40EF8
; ---------------------------------------------------------------------------

loc_40EE0:
		moveq	#0,d0
		move.b	$16(a6),d0
		add.b	$73(a6),d0
		lsr.b	#1,d0
		lea	FMInstrumentOperatorTableM(pc),a1
		move.b	(a1,d0.w),d0
		bsr.w	sub_41A9A

loc_40EF8:
		subq.b	#1,6(a6)
		bne.w	loc_41054
		andi.b	#$F2,(a6)

loc_40F06:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_41B4C
		tst.b	d2
		bne.s	loc_40F22
		bsr.w	sub_41CA4
		bra.w	loc_41B5A
; ---------------------------------------------------------------------------

loc_40F22:
		bclr	#7,d2
		bne.s	loc_40F9E
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	$77(a6),$76(a6)
		move.b	d0,$77(a6)
		move.b	$76(a6),d3
		cmp.b	$77(a6),d3
		bne.s	loc_40F4E
		btst	#1,(a6)
		bne.s	loc_40F52

loc_40F4E:
		bsr.w	sub_40DE4

loc_40F52:
		move.w	d0,d3
		andi.b	#$F,d0
		add.w	d0,d0
		lea	FMFrequenciesM(pc),a2
		move.w	(a2,d0.w),d1
		andi.w	#$F0,d3
		lsl.w	#7,d3
		or.w	d3,d1
		move.w	d1,$A(a6)
		move.b	d2,6(a6)
		move.b	$18(a6),d6
		cmp.b	d6,d2
		bhi.s	loc_40F7E
		moveq	#1,d2
		bra.s	loc_40F80
; ---------------------------------------------------------------------------

loc_40F7E:
		sub.b	d6,d2

loc_40F80:
		move.b	d2,7(a6)
		bset	#5,1(a6)
		btst	#5,$74(a6)
		beq.w	loc_41034
		bset	#1,1(a6)
		bra.w	loc_41034
; ---------------------------------------------------------------------------

loc_40F9E:
		btst	#1,(a6)
		bne.w	loc_4102C
		btst	#4,$74(a6)
		bne.s	loc_40FB8
		btst	#5,$74(a6)
		bne.s	loc_41020

loc_40FB8:
		btst	#6,1(a6)
		bne.s	loc_4101A

loc_40FC0:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_40FEC
		startZ80
		nop
		nop
		nop
		bra.s	loc_40FC0
; ---------------------------------------------------------------------------

loc_40FEC:
		tst.b	(a4)
		bmi.s	loc_40FEC
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_40FFE:
		tst.b	(a4)
		bmi.s	loc_40FFE
		move.b	$12(a5),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_4101A:
		move.w	#$FFFF,8(a6)

loc_41020:
		bclr	#2,(a6)
		bset	#3,(a6)

loc_4102C:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_41034:
		bclr	#1,(a6)
		beq.s	loc_41042
		bset	#0,(a6)

loc_41042:
		cmpi.b	#$FD,(a0)
		bne.s	loc_41050
		bset	#1,(a6)
		addq.w	#1,a0

loc_41050:
		move.l	a0,2(a6)

loc_41054:
		bsr.w	sub_40E08
		btst	#$1F,d7
		bne.w	loc_410F4
		btst	#2,$C(a5)
		beq.s	loc_41090
		subq.b	#1,$71(a6)
		bne.w	loc_410F4
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.s	loc_410E8
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.s	loc_410E8
; ---------------------------------------------------------------------------

loc_41090:
		btst	#1,$C(a5)
		beq.s	loc_410F4
		bset	#3,1(a6)
		bne.s	loc_410B0
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_410B0:
		subq.b	#1,$71(a6)
		bne.s	loc_410F4
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.s	loc_410E8
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.s	loc_410E8
		clr.l	$22(a6)
		bset	#4,(a6)
		bset	#0,$C(a5)
		bra.s	loc_410F4
; ---------------------------------------------------------------------------

loc_410E8:
		move.b	$A(a5),$71(a6)
		bset	#1,1(a6)

loc_410F4:
		bclr	#0,1(a6)
		bne.w	loc_416B0

loc_410FE:
		bclr	#2,1(a6)
		bne.w	loc_41A14

loc_41108:
		bclr	#1,1(a6)
		bne.w	loc_41A90

loc_41112:
		bclr	#7,(a6)
		bne.w	loc_41996

loc_4111C:
		move.w	$A(a6),d0
		add.w	$20(a6),d0
		add.w	$7C(a6),d0
		cmp.w	8(a6),d0
		beq.w	loc_41500
		move.w	d0,8(a6)
		btst	#6,1(a6)
		bne.w	loc_41500
		tst.b	$1A(a6)
		beq.w	loc_41446
		move.b	d7,d1
		andi.b	#3,d1
		cmpi.b	#2,d1
		bne.w	loc_41446
		lea	$1C(a6),a0
		moveq	#0,d2
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		lsr.w	#8,d3

loc_41164:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41190
		startZ80
		nop
		nop
		nop
		bra.s	loc_41164
; ---------------------------------------------------------------------------

loc_41190:
		tst.b	(a4)
		bmi.s	loc_41190
		move.b	#$A6,(a3)
		nop
		nop
		nop
		nop
		nop

loc_411A2:
		tst.b	(a4)
		bmi.s	loc_411A2
		move.b	d3,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_411BC:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_411E8
		startZ80
		nop
		nop
		nop
		bra.s	loc_411BC
; ---------------------------------------------------------------------------

loc_411E8:
		tst.b	(a4)
		bmi.s	loc_411E8
		move.b	#$A2,(a3)
		nop
		nop
		nop
		nop
		nop

loc_411FA:
		tst.b	(a4)
		bmi.s	loc_411FA
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		ror.w	#8,d3

loc_4121E:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4124A
		startZ80
		nop
		nop
		nop
		bra.s	loc_4121E
; ---------------------------------------------------------------------------

loc_4124A:
		tst.b	(a4)
		bmi.s	loc_4124A
		move.b	#$AC,(a3)
		nop
		nop
		nop
		nop
		nop

loc_4125C:
		tst.b	(a4)
		bmi.s	loc_4125C
		move.b	d3,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41276:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_412A2
		startZ80
		nop
		nop
		nop
		bra.s	loc_41276
; ---------------------------------------------------------------------------

loc_412A2:
		tst.b	(a4)
		bmi.s	loc_412A2
		move.b	#$A8,(a3)
		nop
		nop
		nop
		nop
		nop

loc_412B4:
		tst.b	(a4)
		bmi.s	loc_412B4
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		ror.w	#8,d3

loc_412D8:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41304
		startZ80
		nop
		nop
		nop
		bra.s	loc_412D8
; ---------------------------------------------------------------------------

loc_41304:
		tst.b	(a4)
		bmi.s	loc_41304
		move.b	#$AE,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41316:
		tst.b	(a4)
		bmi.s	loc_41316
		move.b	d3,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41330:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4135C
		startZ80
		nop
		nop
		nop
		bra.s	loc_41330
; ---------------------------------------------------------------------------

loc_4135C:
		tst.b	(a4)
		bmi.s	loc_4135C
		move.b	#$AA,(a3)
		nop
		nop
		nop
		nop
		nop

loc_4136E:
		tst.b	(a4)
		bmi.s	loc_4136E
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		move.w	d0,d1
		move.b	(a0)+,d2
		add.w	d2,d1
		move.w	d1,d3
		lsr.w	#8,d3

loc_41392:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_413BE
		startZ80
		nop
		nop
		nop
		bra.s	loc_41392
; ---------------------------------------------------------------------------

loc_413BE:
		tst.b	(a4)
		bmi.s	loc_413BE
		move.b	#$AD,(a3)
		nop
		nop
		nop
		nop
		nop

loc_413D0:
		tst.b	(a4)
		bmi.s	loc_413D0
		move.b	d3,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_413EA:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41416
		startZ80
		nop
		nop
		nop
		bra.s	loc_413EA
; ---------------------------------------------------------------------------

loc_41416:
		tst.b	(a4)
		bmi.s	loc_41416
		move.b	#$A9,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41428:
		tst.b	(a4)
		bmi.s	loc_41428
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		bra.w	loc_41500
; ---------------------------------------------------------------------------

loc_41446:
		move.w	d0,d1
		ror.w	#8,d0
		addi.b	#-$5C,d7

loc_4144E:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4147A
		startZ80
		nop
		nop
		nop
		bra.s	loc_4144E
; ---------------------------------------------------------------------------

loc_4147A:
		tst.b	(a4)
		bmi.s	loc_4147A
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_4148A:
		tst.b	(a4)
		bmi.s	loc_4148A
		move.b	d0,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		subq.b	#4,d7

loc_414A6:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_414D2
		startZ80
		nop
		nop
		nop
		bra.s	loc_414A6
; ---------------------------------------------------------------------------

loc_414D2:
		tst.b	(a4)
		bmi.s	loc_414D2
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_414E2:
		tst.b	(a4)
		bmi.s	loc_414E2
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		subi.b	#$A0,d7

loc_41500:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4152C
		startZ80
		nop
		nop
		nop
		bra.s	loc_41500
; ---------------------------------------------------------------------------

loc_4152C:
		tst.b	(a4)
		bmi.s	loc_4152C
		move.b	#$27,(a4)
		nop
		nop
		nop
		nop
		nop

loc_4153E:
		tst.b	(a4)
		bmi.s	loc_4153E
		move.b	$1A(a6),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80
		bclr	#5,1(a6)
		beq.w	loc_41640
		move.b	$12(a5),d6
		ori.b	#$F0,d6
		btst	#5,$74(a6)
		beq.s	loc_415E0
		btst	#0,(a6)
		bne.w	loc_41640
		btst	#6,1(a6)
		bne.s	loc_415E0

loc_41586:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_415B2
		startZ80
		nop
		nop
		nop
		bra.s	loc_41586
; ---------------------------------------------------------------------------

loc_415B2:
		tst.b	(a4)
		bmi.s	loc_415B2
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_415C4:
		tst.b	(a4)
		bmi.s	loc_415C4
		move.b	$12(a5),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_415E0:
		btst	#6,1(a6)
		bne.s	loc_41640

loc_415E8:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41614
		startZ80
		nop
		nop
		nop
		bra.s	loc_415E8
; ---------------------------------------------------------------------------

loc_41614:
		tst.b	(a4)
		bmi.s	loc_41614
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_41626:
		tst.b	(a4)
		bmi.s	loc_41626
		move.b	d6,1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41640:
		move.b	$12(a5),d7
		rts
; End of function sub_40E46

; =============== S U B R O U T I N E =======================================

sub_41646:
		add.w	#$80,d7
		moveq	#-1,d1
		moveq	#3,d0

loc_4164E:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4167A
		startZ80
		nop
		nop
		nop
		bra.s	loc_4164E
; ---------------------------------------------------------------------------

loc_4167A:
		tst.b	(a4)
		bmi.s	loc_4167A
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_4168A:
		tst.b	(a4)
		bmi.s	loc_4168A
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		dbf	d0,loc_4164E
		subi.w	#$90,d7
		rts
; End of function sub_41646
; ---------------------------------------------------------------------------

loc_416B0:
		btst	#6,1(a6)
		bne.w	loc_41984
		btst	#5,$74(a6)
		beq.s	loc_41724
		btst	#4,$74(a6)
		bne.s	loc_41724

loc_416CA:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_416F6
		startZ80
		nop
		nop
		nop
		bra.s	loc_416CA
; ---------------------------------------------------------------------------

loc_416F6:
		tst.b	(a4)
		bmi.s	loc_416F6
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_41708:
		tst.b	(a4)
		bmi.s	loc_41708
		move.b	$12(a5),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41724:
		bsr.w	sub_41646
		moveq	#0,d1
		move.b	$14(a6),d1
		movea.l	$C(a6),a0
		mulu.w	#$19,d1
		lea	(a0,d1.w),a0
		move.l	a0,$10(a6)
		bra.s	loc_41744

; =============== S U B R O U T I N E =======================================

sub_41740:
		movea.l	$10(a6),a0

loc_41744:
		addi.w	#$30,d7
		move.b	(a0)+,d1

loc_4174A:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41776
		startZ80
		nop
		nop
		nop
		bra.s	loc_4174A
; ---------------------------------------------------------------------------

loc_41776:
		tst.b	(a4)
		bmi.s	loc_41776
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41786:
		tst.b	(a4)
		bmi.s	loc_41786
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		move.b	(a0)+,d1

loc_417A4:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_417D0
		startZ80
		nop
		nop
		nop
		bra.s	loc_417A4
; ---------------------------------------------------------------------------

loc_417D0:
		tst.b	(a4)
		bmi.s	loc_417D0
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_417E0:
		tst.b	(a4)
		bmi.s	loc_417E0
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		move.b	(a0)+,d1

loc_417FE:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_4182A
		startZ80
		nop
		nop
		nop
		bra.s	loc_417FE
; ---------------------------------------------------------------------------

loc_4182A:
		tst.b	(a4)
		bmi.s	loc_4182A
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_4183A:
		tst.b	(a4)
		bmi.s	loc_4183A
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		move.b	(a0)+,d1

loc_41858:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41884
		startZ80
		nop
		nop
		nop
		bra.s	loc_41858
; ---------------------------------------------------------------------------

loc_41884:
		tst.b	(a4)
		bmi.s	loc_41884
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41894:
		tst.b	(a4)
		bmi.s	loc_41894
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		addq.l	#4,a0
		moveq	#$F,d5
		addi.w	#$10,d7

loc_418B8:
		move.b	(a0)+,d1

loc_418BA:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_418E6
		startZ80
		nop
		nop
		nop
		bra.s	loc_418BA
; ---------------------------------------------------------------------------

loc_418E6:
		tst.b	(a4)
		bmi.s	loc_418E6
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_418F6:
		tst.b	(a4)
		bmi.s	loc_418F6
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.w	#4,d7
		dbf	d5,loc_418B8
		subi.w	#$90,d7
		move.b	(a0)+,d1
		move.b	d1,$19(a6)
		addi.w	#$B0,d7

loc_41924:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41950
		startZ80
		nop
		nop
		nop
		bra.s	loc_41924
; ---------------------------------------------------------------------------

loc_41950:
		tst.b	(a4)
		bmi.s	loc_41950
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41960:
		tst.b	(a4)
		bmi.s	loc_41960
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		subi.w	#$B0,d7
		ori.b	#6,1(a6)

loc_41984:
		bclr	#7,1(a6)
		beq.w	loc_410FE
		move.w	d0,8(a6)
		bra.w	loc_410FE
; ---------------------------------------------------------------------------

loc_41996:
		btst	#6,1(a6)
		bne.s	loc_41A0A
		move.w	$7A(a6),d2
		subq.w	#1,d2
		lea	$90(a6),a1

loc_419A8:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_419D4
		startZ80
		nop
		nop
		nop
		bra.s	loc_419A8
; ---------------------------------------------------------------------------

loc_419D4:
		tst.b	(a4)
		bmi.s	loc_419D4
		move.b	(a1)+,(a3)
		nop
		nop
		nop
		nop
		nop

loc_419E4:
		tst.b	(a4)
		bmi.s	loc_419E4
		move.b	(a1)+,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		dbf	d2,loc_419A8
		move.w	#0,$7A(a6)
		bra.s	loc_41A10
; ---------------------------------------------------------------------------

loc_41A0A:
		bset	#7,(a6)

loc_41A10:
		bra.w	loc_4111C
; ---------------------------------------------------------------------------

loc_41A14:
		move.b	$17(a6),d2
		ror.b	#2,d2
		or.b	$1B(a6),d2
		addi.b	#-$4C,d7
		btst	#6,1(a6)
		bne.s	loc_41A80

loc_41A2A:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41A56
		startZ80
		nop
		nop
		nop
		bra.s	loc_41A2A
; ---------------------------------------------------------------------------

loc_41A56:
		tst.b	(a4)
		bmi.s	loc_41A56
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41A66:
		tst.b	(a4)
		bmi.s	loc_41A66
		move.b	d2,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41A80:
		subi.b	#$B4,d7
		bra.w	loc_41108
; ---------------------------------------------------------------------------

byte_41A88:
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 3
		dc.b 7
		dc.b 7
		dc.b $F
; ---------------------------------------------------------------------------

loc_41A90:
		move.b	$15(a6),d0
		bsr.s	sub_41A9A
		bra.w	loc_41112

; =============== S U B R O U T I N E =======================================

sub_41A9A:
		btst	#6,1(a6)
		bne.w	locret_41B4A
		movea.l	$10(a6),a1
		addq.l	#4,a1
		move.b	$19(a6),d2
		andi.w	#7,d2
		move.b	byte_41A88(pc,d2.w),d2
		ror.b	#3,d2
		moveq	#3,d3
		moveq	#$40,d4
		add.b	d7,d4

loc_41ABE:
		move.b	(a1)+,d1
		btst	#0,d2
		beq.s	loc_41AEC
		move.b	d0,d1
		add.b	(a5),d1
		bcs.s	loc_41AE8
		btst	#7,d1
		bne.s	loc_41AE8
		btst	#3,1(a6)
		beq.s	loc_41AE2
		add.b	$70(a6),d1
		bcs.s	loc_41AE8

loc_41AE2:
		btst	#7,d1
		beq.s	loc_41AEC

loc_41AE8:
		move.b	#$7F,d1

loc_41AEC:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41B18
		startZ80
		nop
		nop
		nop
		bra.s	loc_41AEC
; ---------------------------------------------------------------------------

loc_41B18:
		tst.b	(a4)
		bmi.s	loc_41B18
		move.b	d4,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41B28:
		tst.b	(a4)
		bmi.s	loc_41B28
		move.b	d1,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80
		addq.b	#4,d4
		rol.b	#1,d2
		dbf	d3,loc_41ABE

locret_41B4A:
		rts
; End of function sub_41A9A
; ---------------------------------------------------------------------------

loc_41B4C:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_41B74(pc,d2.w),d2
		jsr	off_41B74(pc,d2.w)

loc_41B5A:
		btst	#4,(a6)
		bne.s	loc_41B6A
		move.l	a0,2(a6)
		bra.w	loc_40F06
; ---------------------------------------------------------------------------

loc_41B6A:
		move.l	a0,2(a6)
		move.b	$12(a5),d7
		rts
; ---------------------------------------------------------------------------

off_41B74:
		dc.w cfSetVoiceM-off_41B74			; $F0
		dc.w cfChangeFMVolumeM-off_41B74	; $F1
		dc.w sub_41C3C-off_41B74				; $F2
		dc.w sub_41C5E-off_41B74				; $F3
		dc.w cfModulationM-off_41B74			; $F4
		dc.w sub_41DEC-off_41B74				; $F5
		dc.w sub_41E0C-off_41B74				; $F6
		dc.w sub_42002-off_41B74				; $F7
		dc.w sub_41C66-off_41B74				; $F8
		dc.w sub_42428-off_41B74				; $F9
		dc.w sub_41C74-off_41B74				; $FA
		dc.w sub_41DC0-off_41B74				; $FB
		dc.w sub_41F0E-off_41B74				; $FC
		dc.w cfPreventAttackM-off_41B74		; $FD
		dc.w sub_41E50-off_41B74				; $FE
		dc.w sub_41B94-off_41B74				; $FF

; =============== S U B R O U T I N E =======================================

sub_41B94:
		moveq   #0,d2
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_41BA8(pc,d2.w),d2
		jmp	off_41BA8(pc,d2.w)
; End of function sub_41B94
; ---------------------------------------------------------------------------

off_41BA8:
		dc.w sub_42428-off_41BA8
		dc.w sub_42428-off_41BA8
		dc.w sub_4242C-off_41BA8
		dc.w sub_41BB4-off_41BA8
		dc.w sub_41BD4-off_41BA8
		dc.w sub_41BC2-off_41BA8

; =============== S U B R O U T I N E =======================================

sub_41BB4:
		move.b	(a0)+,d0
		move.b	d0,$73(a6)

loc_41BBA:
		bset	#5,$74(a6)
		rts
; End of function sub_41BB4

; =============== S U B R O U T I N E =======================================

sub_41BC2:
		move.b	(a0)+,d0
		bne.s	loc_41BBA
		bclr	#5,$74(a6)
		bset	#1,1(a6)
		rts
; End of function sub_41BC2

; =============== S U B R O U T I N E =======================================

sub_41BD4:
		move.b	(a0)+,d0
		beq.s	loc_41BE0
		bset	#4,$74(a6)
		rts
; ---------------------------------------------------------------------------

loc_41BE0:
		bclr	#4,$74(a6)
		rts
; End of function sub_41BD4

; =============== S U B R O U T I N E =======================================

sub_41BE8:
		move.b	(a0)+,d0
		move.w	d0,2(a5)
		rts
; End of function sub_41BE8

; =============== S U B R O U T I N E =======================================

sub_41BF0:
		move.b	(a0)+,d0
		rts
; End of function sub_41BF0

; =============== S U B R O U T I N E =======================================

cfSetVoiceM:
		move.b	(a0)+,d0
		move.b	d0,$14(a6)
		bset	#0,1(a6)
		rts
; End of function cfSetVoiceM

; =============== S U B R O U T I N E =======================================

cfChangeFMVolumeM:
		moveq	#0,d0
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.s	loc_41C12
		add.b	$78(a6),d0
		bra.s	loc_41C14
; ---------------------------------------------------------------------------

loc_41C12:
		subq.b	#2,d0

loc_41C14:
		tst.b	d0
		bcc.s	loc_41C1C
		moveq	#0,d0
		bra.s	loc_41C24
; ---------------------------------------------------------------------------

loc_41C1C:
		cmpi.b	#$13,d0
		bls.s		loc_41C24
		moveq	#$13,d0

loc_41C24:
		move.b	d0,$16(a6)

loc_41C28:
		lea	FMInstrumentOperatorTableM(pc),a1
		move.b	(a1,d0.w),d0
		move.b	d0,$15(a6)
		bset	#1,1(a6)
		rts
; End of function cfChangeFMVolumeM

; =============== S U B R O U T I N E =======================================

sub_41C3C:
		sf	$77(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		bsr.w	sub_41F00
		tst.b	(a0)+
		bne.s	loc_41C58
		move.w	d0,$20(a6)
		rts
; ---------------------------------------------------------------------------

loc_41C58:
		add.w	d0,$20(a6)
		rts
; End of function sub_41C3C

; =============== S U B R O U T I N E =======================================

sub_41C5E:
		move.b	(a0)+,d0
		move.b	d0,$18(a6)
		rts
; End of function sub_41C5E

; =============== S U B R O U T I N E =======================================

sub_41C66:
		move.b	(a0)+,d0
		move.b	d0,$17(a6)
		bset	#2,1(a6)
		rts
; End of function sub_41C66

; =============== S U B R O U T I N E =======================================

sub_41C74:
		cmpi.w	#8,$7A(a6)
		beq.s	locret_41C9A
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		lea	$90(a6),a1
		move.w	$7A(a6),d2
		add.w	d2,d2
		adda.w	d2,a1
		move.b	d0,(a1)+
		move.b	d1,(a1)+
		bset	#7,(a6)
		addq.w	#1,$7A(a6)

locret_41C9A:
		rts
; End of function sub_41C74

; =============== S U B R O U T I N E =======================================

cfPreventAttackM:
		bset	#1,(a6)
		rts
; End of function cfPreventAttackM

; =============== S U B R O U T I N E =======================================

sub_41CA4:
		tst.l	$22(a6)
		beq.s	loc_41CBE
		btst	#$1F,d7
		bne.s	loc_41CB8
		btst	#4,$C(a5)
		bne.s	loc_41CBE

loc_41CB8:
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_41CBE:
		btst	#6,1(a6)
		bne.s	loc_41D20

loc_41CC6:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41CF2
		startZ80
		nop
		nop
		nop
		bra.s	loc_41CC6
; ---------------------------------------------------------------------------

loc_41CF2:
		tst.b	(a4)
		bmi.s	loc_41CF2
		move.b	#$28,(a4)
		nop
		nop
		nop
		nop
		nop

loc_41D04:
		tst.b	(a4)
		bmi.s	loc_41D04
		move.b	$12(a5),1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41D20:
		bset	#4,(a6)
		clr.b	$1A(a6)
		btst	#$1F,d7
		beq.w	locret_41DBE
		bsr.w	sub_41646
		lea	-$500(a6),a1
		bclr	#6,1(a1)
		bset	#0,1(a1)
		bset	#7,1(a1)
		lea	$D(a5),a1
		move.w	d7,d0
		subq.w	#1,d0
		clr.b	(a1,d0.w)
		move.b	d7,d0
		andi.b	#3,d0
		cmpi.b	#2,d0
		bne.s	locret_41DBE

loc_41D64:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41D90
		startZ80
		nop
		nop
		nop
		bra.s	loc_41D64
; ---------------------------------------------------------------------------

loc_41D90:
		tst.b	(a4)
		bmi.s	loc_41D90
		move.b	#$27,(a4)
		nop
		nop
		nop
		nop
		nop

loc_41DA2:
		tst.b	(a4)
		bmi.s	loc_41DA2
		move.b	#$F,1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

locret_41DBE:
		rts
; End of function sub_41CA4

; =============== S U B R O U T I N E =======================================

sub_41DC0:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$16(a6)
		bpl.s	loc_41DD0
		sf	$16(a6)
		bra.s	loc_41DDE
; ---------------------------------------------------------------------------

loc_41DD0:
		cmpi.b	#$13,$16(a6)
		bls.s	loc_41DDE
		move.b	#$13,$16(a6)

loc_41DDE:
		move.b	$16(a6),d0
		bra.w	loc_41C28
; End of function sub_41DC0

; =============== S U B R O U T I N E =======================================

sub_41DE6:
		move.l	a0,$22(a6)
		rts
; End of function sub_41DE6

; =============== S U B R O U T I N E =======================================

sub_41DEC:
		addq.w	#2,a0
		moveq	#0,d0
		move.b	$27(a6),d0
		lea	$28(a6),a1
		lea	$30(a6),a2
		clr.b	(a1,d0.w)
		lsl.w	#2,d0
		move.l	a0,(a2,d0.w)
		addq.b	#1,$27(a6)
		rts
; End of function sub_41DEC

; =============== S U B R O U T I N E =======================================

sub_41E0C:
		moveq	#0,d0
		move.b	$27(a6),d0
		subq.b	#1,d0
		lea	$28(a6),a1
		lea	$30(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		tst.b	(a1,d0.w)
		bne.s	loc_41E3C
		addq.w	#1,a0
		move.b	(a0)+,(a1,d0.w)
		addq.w	#2,a0
		move.l	a2,-(sp)
		lea	$50(a6),a2
		move.l	a0,(a2,d1.w)
		movea.l	(sp)+,a2
		subq.l	#4,a0

loc_41E3C:
		subq.b	#1,(a1,d0.w)
		beq.s	loc_41E48
		movea.l	(a2,d1.w),a0
		bra.s	locret_41E4E
; ---------------------------------------------------------------------------

loc_41E48:
		addq.l	#4,a0
		subq.b	#1,$27(a6)

locret_41E4E:
		rts
; End of function sub_41E0C

; =============== S U B R O U T I N E =======================================

sub_41E50:
		addq.w	#2,a0
		moveq	#0,d0
		move.b	$27(a6),d0
		subq.b	#1,d0
		lea	$28(a6),a1
		lea	$50(a6),a2
		move.w	d0,d1
		lsl.w	#2,d1
		cmpi.b	#1,(a1,d0.w)
		bne.s	locret_41E76
		movea.l	(a2,d1.w),a0
		subq.b	#1,$27(a6)

locret_41E76:
		rts
; End of function sub_41E50

; =============== S U B R O U T I N E =======================================

cfModulationM:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.w	d0,d0
		move.w	off_41E88(pc,d0.w),d0
		jmp	off_41E88(pc,d0.w)
; End of function cfModulationM
; ---------------------------------------------------------------------------

off_41E88:
		dc.w sub_41E96-off_41E88				; 0
		dc.w cfDisableModulationM-off_41E88	; 1
		dc.w cfEnableModulationM-off_41E88	; 2
		dc.w sub_41EB6-off_41E88				; 3
		dc.w sub_41EC2-off_41E88				; 4
		dc.w sub_41ECE-off_41E88				; 5
		dc.w sub_41EF0-off_41E88				; 6

; =============== S U B R O U T I N E =======================================

sub_41E96:
		bsr.s	sub_41EB6
		bsr.s	sub_41EC2
		bsr.s	sub_41ED8
		bsr.s	sub_41EF0
		bset	#6,(a6)
		rts
; End of function sub_41E96

; =============== S U B R O U T I N E =======================================

cfDisableModulationM:
		bclr	#6,(a6)
		rts
; End of function cfDisableModulationM

; =============== S U B R O U T I N E =======================================

cfEnableModulationM:
		bset	#6,(a6)
		rts
; End of function cfEnableModulationM

; =============== S U B R O U T I N E =======================================

sub_41EB6:
		move.b	(a0)+,d0
		move.b	d0,$7E(a6)
		move.b	d0,$84(a6)
		rts
; End of function sub_41EB6

; =============== S U B R O U T I N E =======================================

sub_41EC2:
		move.b	(a0)+,d0
		move.b	d0,$7F(a6)
		move.b	d0,$85(a6)
		rts
; End of function sub_41EC2

; =============== S U B R O U T I N E =======================================

sub_41ECE:
		bsr.s	sub_41ED8
		move.b	$7F(a6),$85(a6)
		rts
; End of function sub_41ECE

; =============== S U B R O U T I N E =======================================

sub_41ED8:
		moveq	#0,d0
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		bsr.s	sub_41F00
		move.w	d0,$82(a6)
		move.w	d0,$86(a6)
		rts
; End of function sub_41ED8

; =============== S U B R O U T I N E =======================================

sub_41EF0:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$80(a6)
		lsr.w	#1,d0

loc_41EFA:
		move.w	d0,$88(a6)
		rts
; End of function sub_41EF0

; =============== S U B R O U T I N E =======================================

sub_41F00:
		cmpi.b	#$80,d7
		bcs.s	locret_41F0C
		muls.w	#$10A,d0
		asr.l	#8,d0

locret_41F0C:
		rts
; End of function sub_41F00

; =============== S U B R O U T I N E =======================================

sub_41F0E:
		lea	$8A(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		lea	$8A(a6),a1
		move.b	(a1)+,d0
		ori.b	#8,d0
		btst	#6,1(a6)
		bne.s	loc_41F82

loc_41F2A:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41F56
		startZ80
		nop
		nop
		nop
		bra.s	loc_41F2A
; ---------------------------------------------------------------------------

loc_41F56:
		tst.b	(a4)
		bmi.s	loc_41F56
		move.b	#$22,(a4)
		nop
		nop
		nop
		nop
		nop

loc_41F68:
		tst.b	(a4)
		bmi.s	loc_41F68
		move.b	d0,1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41F82:
		move.b	(a1)+,d0
		move.b	(a1)+,d1
		lsl.b	#4,d1
		or.b	d1,d0
		move.b	d0,$1B(a6)
		move.b	$17(a6),d2
		ror.b	#2,d2
		andi.b	#$C0,d2
		or.b	d0,d2
		addi.b	#-$4C,d7
		btst	#6,1(a6)
		bne.s	loc_41FFC

loc_41FA6:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_41FD2
		startZ80
		nop
		nop
		nop
		bra.s	loc_41FA6
; ---------------------------------------------------------------------------

loc_41FD2:
		tst.b	(a4)
		bmi.s	loc_41FD2
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_41FE2:
		tst.b	(a4)
		bmi.s	loc_41FE2
		move.b	d2,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_41FFC:
		subi.b	#$B4,d7
		rts
; End of function sub_41F0E

; =============== S U B R O U T I N E =======================================

sub_42002:
		lea	$1C(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	d7,d1
		andi.b	#3,d1
		cmpi.b	#2,d1
		bne.s	locret_42026
		tst.l	$1C(a6)
		beq.s	loc_42028
		move.b	#$40,$1A(a6)

locret_42026:
		rts
; ---------------------------------------------------------------------------

loc_42028:
		clr.b	$1A(a6)
		rts
; End of function sub_42002

; =============== S U B R O U T I N E =======================================

nullsub_1:
		rts
; End of function nullsub_1

; =============== S U B R O U T I N E =======================================

sub_42030:
		move.b	d7,$12(a5)
		tst.b	$1A(a6)
		beq.s	loc_4203E
		move.b	$1A(a6),d7

loc_4203E:
		btst	#4,(a6)
		beq.s	loc_42048
		rts
; ---------------------------------------------------------------------------

loc_42048:
		subq.b	#1,7(a6)
		bne.s	loc_42098
		btst	#1,(a6)
		bne.s	loc_42098
		bclr	#2,(a6)
		btst	#4,1(a6)
		bne.s	loc_4208E
		btst	#5,$74(a6)
		bne.s	loc_42076
		sf	$1C(a6)
		bsr.w	sub_422B4
		bra.s	loc_42098
; ---------------------------------------------------------------------------

loc_42076:
		move.b	$16(a6),d0
		sub.b	$73(a6),d0
		lsr.b	#1,d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_422C4
		bra.s	loc_42098
; ---------------------------------------------------------------------------

loc_4208E:
		andi.b	#$F8,$74(a6)
		bsr.w	sub_42376

loc_42098:
		subq.b	#1,6(a6)
		bne.w	loc_42194
		andi.b	#$F2,(a6)

loc_420A6:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_423C4
		tst.b	d2
		bne.s	loc_420C2
		bsr.w	sub_425A0
		bra.w	loc_423D2
; ---------------------------------------------------------------------------

loc_420C2:
		bclr	#7,d2
		bne.w	loc_4214C
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d3
		move.b	(a0)+,d3
		move.b	$77(a6),$76(a6)
		move.b	d3,$77(a6)
		cmp.b	$76(a6),d3
		bne.s	loc_420F2
		btst	#1,(a6)
		bne.s	loc_42116

loc_420F2:
		bsr.w	sub_40DE4
		btst	#4,1(a6)
		beq.s	loc_42116
		move.b	#1,$74(a6)
		move.b	$8A(a6),$1C(a6)
		movem.l	d2-d3,-(sp)
		bsr.w	sub_42388
		movem.l	(sp)+,d2-d3

loc_42116:
		move.w	d3,d4
		lea	PSGFrequenciesM(pc),a2
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
		bhi.s	loc_42144
		move.b	6(a6),d2
		bra.s	loc_42146
; ---------------------------------------------------------------------------

loc_42144:
		sub.b	d6,d2

loc_42146:
		move.b	d2,7(a6)
		bra.s	loc_4217C
; ---------------------------------------------------------------------------

loc_4214C:
		btst	#1,(a6)
		bne.s	loc_42174
		btst	#4,$74(a6)
		bne.s	loc_42164
		btst	#5,$74(a6)
		bne.s	loc_4216E

loc_42164:
		bsr.w	sub_422B4
		move.w	#-1,8(a6)

loc_4216E:
		bset	#3,(a6)

loc_42174:
		move.b	d2,6(a6)
		move.b	d2,7(a6)

loc_4217C:
		bclr	#1,(a6)
		cmpi.b	#$FD,(a0)
		bne.s	loc_42190
		bset	#1,(a6)
		addq.w	#1,a0

loc_42190:
		move.l	a0,2(a6)

loc_42194:
		btst	#4,1(a6)
		beq.s	loc_421A2
		bsr.w	sub_422F8
		bra.s	loc_421BA
; ---------------------------------------------------------------------------

loc_421A2:
		btst	#2,(a6)
		beq.s	loc_421BA
		move.b	$16(a6),d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_422C4

loc_421BA:
		bsr.w	sub_40E08
		btst	#$1F,d7
		bne.w	loc_4225E
		btst	#2,$C(a5)
		beq.s	loc_421F6
		subq.b	#1,$71(a6)
		bne.w	loc_4225E
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.s	loc_4224E
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.s	loc_4224E
; ---------------------------------------------------------------------------

loc_421F6:
		btst	#1,$C(a5)
		beq.s	loc_4225E
		bset	#3,1(a6)
		bne.s	loc_42216
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_42216:
		subq.b	#1,$71(a6)
		bne.s	loc_4225E
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.s	loc_4224E
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.s	loc_4224E
		clr.l	$22(a6)
		bset	#4,(a6)
		bset	#0,$C(a5)
		bra.s	loc_4225E
; ---------------------------------------------------------------------------

loc_4224E:
		move.b	$A(a5),$71(a6)
		btst	#2,(a6)
		bne.s	loc_4225E
		bsr.s	sub_422C4

loc_4225E:
		move.w	$20(a6),d0
		add.w	$7C(a6),d0
		moveq	#0,d1
		move.b	$75(a6),d1
		asr.w	d1,d0
		add.w	$A(a6),d0
		cmpi.w	#1,d0
		bge.s	loc_4227C
		moveq	#1,d0
		bra.s	loc_42286
; ---------------------------------------------------------------------------

loc_4227C:
		cmpi.w	#$3FF,d0
		ble.s	loc_42286
		move.w	#$3FF,d0

loc_42286:
		cmp.w	8(a6),d0
		beq.s	locret_422B2
		move.w	d0,8(a6)
		tst.b	$1A(a6)
		bne.s	locret_422B2
		btst	#6,1(a6)
		bne.s	locret_422B2
		move.w	d0,d1
		andi.b	#$F,d0
		or.b	$12(a5),d0
		move.b	d0,(a3)
		lsr.w	#4,d1
		andi.b	#$3F,d1
		move.b	d1,(a3)

locret_422B2:
		rts
; End of function sub_42030

; =============== S U B R O U T I N E =======================================

sub_422B4:
		moveq	#$1F,d0
		or.b	d7,d0
		btst	#6,1(a6)
		bne.s	locret_422C2
		move.b	d0,(a3)

locret_422C2:
		rts
; End of function sub_422B4

; =============== S U B R O U T I N E =======================================

sub_422C4:
		move.b	$15(a6),d0
		btst	#3,1(a6)
		beq.s	loc_422D8
		move.b	$70(a6),d1
		lsr.b	#3,d1
		add.b	d1,d0

loc_422D8:
		btst	#4,d0
		beq.s	loc_422E0
		moveq	#$F,d0

loc_422E0:
		ori.b	#$10,d0
		move.b	d7,d1
		andi.b	#$F0,d1
		or.b	d1,d0
		btst	#6,1(a6)
		bne.s	locret_422F6
		move.b	d0,(a3)

locret_422F6:
		rts
; End of function sub_422C4

; =============== S U B R O U T I N E =======================================

sub_422F8:
		btst	#0,$74(a6)
		beq.s	loc_42322
		move.b	$1C(a6),d0
		move.b	$8B(a6),d1
		add.b	d1,d0
		bcc.s	loc_42310
		move.b	#$FF,d0

loc_42310:
		move.b	d0,$1C(a6)
		cmpi.b	#$FF,d0
		bne.s	sub_42388
		eori.b	#3,$74(a6)
		bra.s	sub_42388
; ---------------------------------------------------------------------------

loc_42322:
		btst	#1,$74(a6)
		beq.s	loc_42350
		move.b	$1C(a6),d0
		move.b	$8C(a6),d1
		move.b	$8D(a6),d2
		sub.b	d1,d0
		bcs.s	loc_4233E
		cmp.b	d2,d0
		bcc.s	loc_42340

loc_4233E:
		move.b	d2,d0

loc_42340:
		move.b	d0,$1C(a6)
		cmp.b	d2,d0
		bne.s	sub_42388
		eori.b	#6,$74(a6)
		bra.s	sub_42388
; ---------------------------------------------------------------------------

loc_42350:
		btst	#2,$74(a6)
		beq.s	sub_42376
		move.b	$1C(a6),d0
		move.b	$8E(a6),d1
		sub.b	d1,d0
		bcc.s	loc_42366
		moveq	#0,d0

loc_42366:
		move.b	d0,$1C(a6)
		tst.b	d0
		bne.s	sub_42388
		andi.b	#$F8,$74(a6)
		bra.s	sub_42388
; End of function sub_422F8

; =============== S U B R O U T I N E =======================================

sub_42376:
		move.b	$1C(a6),d0
		move.b	$8F(a6),d1
		sub.b	d1,d0
		bcc.s	loc_42384
		moveq	#0,d0

loc_42384:
		move.b	d0,$1C(a6)
; End of function sub_42376

; =============== S U B R O U T I N E =======================================

sub_42388:
		moveq	#0,d0
		move.b	$1C(a6),d0
		moveq	#0,d2
		move.b	$16(a6),d2
		addq.b	#1,d2
		mulu.w	d2,d0
		lsr.w	#8,d0
		btst	#2,(a6)
		bne.s	loc_423B0
		btst	#5,$74(a6)
		beq.s	loc_423B0
		add.b	$73(a6),d0
		lsr.b	#1,d0

loc_423B0:
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		bsr.w	sub_422C4
		move.b	$1C(a6),$17(a6)
		rts
; End of function sub_42388
; ---------------------------------------------------------------------------

loc_423C4:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	CoordFlagPSGM(pc,d2.w),d2
		jsr	CoordFlagPSGM(pc,d2.w)

loc_423D2:
		btst	#4,(a6)
		bne.s	loc_423E2
		move.l	a0,2(a6)
		bra.w	loc_420A6
; ---------------------------------------------------------------------------

loc_423E2:
		move.l	a0,2(a6)
		rts
; ---------------------------------------------------------------------------

CoordFlagPSGM:
		dc.w sub_4245C-CoordFlagPSGM			; $F0
		dc.w sub_42494-CoordFlagPSGM			; $F1
		dc.w sub_42408-CoordFlagPSGM			; $F2
		dc.w sub_41C5E-CoordFlagPSGM			; $F3
		dc.w cfModulationM-CoordFlagPSGM		; $F4
		dc.w sub_41DEC-CoordFlagPSGM			; $F5
		dc.w sub_41E0C-CoordFlagPSGM			; $F6
		dc.w sub_424E4-CoordFlagPSGM			; $F7
		dc.w sub_42560-CoordFlagPSGM			; $F8
		dc.w sub_42428-CoordFlagPSGM			; $F9
		dc.w sub_42444-CoordFlagPSGM			; $FA
		dc.w sub_424B4-CoordFlagPSGM			; $FB
		dc.w nullsub_1-CoordFlagPSGM				; $FC
		dc.w cfPreventAttackM-CoordFlagPSGM		; $FD
		dc.w sub_41E50-CoordFlagPSGM			; $FE
		dc.w sub_41B94-CoordFlagPSGM			; $FF

; =============== S U B R O U T I N E =======================================

sub_42408:
		move.w	#0,8(a6)
		move.b	1(a0),d0
		lsl.w	#8,d0
		move.b	(a0),d0
		addq.w	#2,a0
		tst.b	(a0)+
		bne.s	loc_42422
		move.w	d0,$20(a6)
		rts
; ---------------------------------------------------------------------------

loc_42422:
		add.w	d0,$20(a6)
		rts
; End of function sub_42408

; =============== S U B R O U T I N E =======================================

sub_42428:
		move.b	(a0)+,d0
		rts
; End of function sub_42428

; =============== S U B R O U T I N E =======================================

sub_4242C:
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		rts
; End of function sub_4242C

; =============== S U B R O U T I N E =======================================

sub_42432:
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		rts
; End of function sub_42432

; =============== S U B R O U T I N E =======================================

sub_4243A:
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		move.b	(a0)+,d0
		rts
; End of function sub_4243A

; =============== S U B R O U T I N E =======================================

sub_42444:
		lea	$8A(a6),a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		bset	#4,1(a6)
		rts
; End of function sub_42444

; =============== S U B R O U T I N E =======================================

sub_4245C:
		moveq	#0,d0
		move.b	(a0)+,d0
		move.b	d0,$14(a6)
		lea	PSG_Tone2(pc),a1
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
		beq.s	locret_42492
		move.w	d0,8(a6)

locret_42492:
		rts
; End of function sub_4245C

; =============== S U B R O U T I N E =======================================

sub_42494:
		move.b	(a0)+,d0
		btst	#$1F,d7
		beq.s	loc_424A0
		add.b	$78(a6),d0

loc_424A0:
		tst.b	d0
		bpl.s	loc_424A6
		moveq	#0,d0

loc_424A6:
		move.b	d0,$16(a6)
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		rts
; End of function sub_42494

; =============== S U B R O U T I N E =======================================

sub_424B4:
		moveq	#0,d0
		move.b	(a0)+,d0
		add.b	d0,$16(a6)
		cmpi.b	#$F,$16(a6)
		ble.s		loc_424CC
		move.b	#$F,$16(a6)
		bra.s	loc_424D6
; ---------------------------------------------------------------------------

loc_424CC:
		tst.b	$16(a6)
		bge.s	loc_424D6
		sf	$16(a6)

loc_424D6:
		move.b	$16(a6),d0
		eori.b	#$F,d0
		move.b	d0,$15(a6)
		rts
; End of function sub_424B4

; =============== S U B R O U T I N E =======================================

sub_424E4:
		move.b	(a0)+,d0
		cmpi.b	#8,d0
		beq.s	loc_42542
		btst	#6,1(a6)
		bne.s	loc_424F6
		move.b	d7,(a3)

loc_424F6:
		btst	#$1F,d7
		bne.s	loc_42508
		move.w	d7,d0
		lsr.w	#5,d0
		subq.w	#3,d0
		move.b	d0,$13(a5)
		bra.s	loc_42528
; ---------------------------------------------------------------------------

loc_42508:
		tst.b	$13(a5)
		beq.s	loc_42528
		moveq	#0,d0
		move.b	$13(a5),d0
		subq.w	#1,d0
		mulu.w	#$A0,d0
		lea	(SndDriverMucomRAM+$1F4).l,a1
		adda.w	d0,a1
		bset	#6,1(a1)

loc_42528:
		move.b	#$E0,d0
		move.b	d0,$1A(a6)
		move.b	d0,d7
		or.b	#4,d0
		btst	#6,1(a6)
		bne.s	locret_42540
		move.b	d0,(a3)

locret_42540:
		rts
; ---------------------------------------------------------------------------

loc_42542:
		btst	#$1F,d7
		bne.s	loc_4254C
		sf	$13(a5)

loc_4254C:
		sf	$1A(a6)
		move.b	$12(a5),d7
		btst	#6,1(a6)
		bne.s	locret_4255E
		move.b	d7,(a3)

locret_4255E:
		rts
; End of function sub_424E4

; =============== S U B R O U T I N E =======================================

sub_42560:
		move.b	(a0)+,d0
		moveq	#0,d1
		cmpi.b	#$B,d0
		bls.s	loc_42576
		cmpi.b	#$16,d0
		bhi.s	loc_42574
		moveq	#1,d1
		bra.s	loc_42576
; ---------------------------------------------------------------------------

loc_42574:
		moveq	#2,d1

loc_42576:
		btst	#6,1(a6)
		bne.s	loc_42580
		move.b	d7,(a3)

loc_42580:
		move.b	d1,$1B(a6)
		move.b	$1A(a6),d0
		or.b	$1B(a6),d0
		or.b	#4,d0
		btst	#6,1(a6)
		bne.s	loc_4259A
		move.b	d0,(a3)

loc_4259A:
		move.b	$1A(a6),d7
		rts
; End of function sub_42560

; =============== S U B R O U T I N E =======================================

sub_425A0:
		tst.l	$22(a6)
		beq.s	loc_425BA
		btst	#$1F,d7
		bne.s	loc_425BA
		btst	#4,$C(a5)
		bne.s	loc_425BA
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_425BA:
		bset	#4,(a6)
		btst	#$1F,d7
		beq.s	locret_4262C
		tst.b	$1A(a6)
		cmpi.b	#$E0,d7
		bne.s	loc_4260E
		sf	$1A(a6)
		moveq	#0,d1
		move.b	$13(a5),d1
		beq.s	locret_4262C
		subq.w	#1,d1
		mulu.w	#$A0,d1
		lea	(SndDriverMucomRAM+$1F4).l,a2
		adda.w	d1,a2
		bclr	#6,1(a2)
		move.b	$1A(a2),d0
		beq.s	loc_42608
		or.b	$1B(a2),d0
		or.b	#4,d0
		btst	#6,1(a6)
		bne.s	loc_42608
		move.b	d0,(a3)

loc_42608:
		sf	$10(a5)
		bra.s	locret_4262C
; ---------------------------------------------------------------------------

loc_4260E:
		lea	-$500(a6),a1
		move.w	#0,8(a1)
		bclr	#6,1(a1)
		lea	$F(a5),a1
		move.w	d7,d0
		lsr.w	#5,d0
		subq.w	#5,d0
		sf	(a1,d0.w)

locret_4262C:
		rts
; End of function sub_425A0

; =============== S U B R O U T I N E =======================================

sub_4262E:
		move.b	d7,$12(a5)
		btst	#4,(a6)
		beq.s	loc_4263C
		rts
; ---------------------------------------------------------------------------

loc_4263C:
		btst	#2,d7
		beq.s	loc_42644
		subq.b	#4,d7

loc_42644:
		subq.b	#1,7(a6)
		bne.w	*+4

loc_4264C:
		subq.b	#1,6(a6)
		bne.s	loc_426CC
		andi.b	#$F0,(a6)

loc_42658:
		movea.l	2(a6),a0
		moveq	#0,d2
		move.b	(a0)+,d2
		cmpi.b	#$F0,d2
		bcc.w	loc_42836
		tst.b	d2
		bne.s	loc_42674
		bsr.w	sub_4289A
		bra.w	loc_42844
; ---------------------------------------------------------------------------

loc_42674:
		bclr	#7,d2
		bne.s	loc_426B4
		bclr	#3,(a6)
		bset	#2,(a6)
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,$A(a6)
		move.b	d2,6(a6)
		move.b	$18(a6),d6
		cmp.b	d6,d2
		bhi.s	loc_426A2
		move.b	#1,7(a6)
		bra.s	loc_426A8
; ---------------------------------------------------------------------------

loc_426A2:
		sub.b	d6,d2
		move.b	d2,7(a6)

loc_426A8:
		move.l	a0,2(a6)
		bset	#5,1(a6)
		bra.s	loc_426CC
; ---------------------------------------------------------------------------

loc_426B4:
		bset	#3,(a6)
		bclr	#2,(a6)
		move.b	d2,6(a6)
		move.b	d2,7(a6)
		move.l	a0,2(a6)

loc_426CC:
		btst	#2,$C(a5)
		beq.s	loc_426FC
		subq.b	#1,$71(a6)
		bne.w	loc_42760
		move.b	$72(a6),d0
		sub.b	d0,$70(a6)
		move.b	9(a5),d0
		cmp.b	$70(a6),d0
		bne.s	loc_42754
		bclr	#3,$C(a5)
		bclr	#2,$C(a5)
		bra.s	loc_42754
; ---------------------------------------------------------------------------

loc_426FC:
		btst	#1,$C(a5)
		beq.s	loc_42760
		bset	#3,1(a6)
		bne.s	loc_4271C
		clr.b	$70(a6)
		move.b	8(a5),$72(a6)
		move.b	$A(a5),$71(a6)

loc_4271C:
		subq.b	#1,$71(a6)
		bne.s	loc_42760
		move.b	$72(a6),d0
		add.b	d0,$70(a6)
		move.b	$70(a6),d0
		cmp.b	9(a5),d0
		bcs.s	loc_42754
		move.b	9(a5),$70(a6)
		btst	#3,$C(a5)
		bne.s	loc_42754
		clr.l	$22(a6)
		bset	#4,(a6)
		bset	#0,$C(a5)
		bra.s	loc_42760
; ---------------------------------------------------------------------------

loc_42754:
		move.b	$A(a5),$71(a6)
		bset	#1,1(a6)

loc_42760:
		bclr	#2,1(a6)
		bne.s	loc_427C6

loc_42768:
		nop
		bclr	#5,1(a6)
		beq.s	loc_427C0
		btst	#6,1(a6)
		bne.s	loc_427C0
		btst	#1,(a6)
		bne.s	loc_427C0
		btst	#3,1(a6)
		beq.s	loc_42792
		cmpi.b	#$20,$70(a6)
		bcc.s	loc_427C0

loc_42792:
		tst.b	$19(a6)
		bne.s	loc_427C0
		move.b	$14(a6),d6
		addi.b	#-$80,d6
		stopZ80
		move.b	d6,(Z80_RAM+$1FFF).l
		startZ80

loc_427C0:
		move.b	$12(a5),d7
		rts
; ---------------------------------------------------------------------------

loc_427C6:
		move.b	$17(a6),d2
		ror.b	#2,d2
		addi.b	#-$4C,d7
		btst	#6,1(a6)
		bne.s	loc_4282E

loc_427D8:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_42804
		startZ80
		nop
		nop
		nop
		bra.s	loc_427D8
; ---------------------------------------------------------------------------

loc_42804:
		tst.b	(a4)
		bmi.s	loc_42804
		move.b	d7,(a3)
		nop
		nop
		nop
		nop
		nop

loc_42814:
		tst.b	(a4)
		bmi.s	loc_42814
		move.b	d2,1(a3)
		nop
		nop
		nop
		nop
		nop
		startZ80

loc_4282E:
		subi.b	#$B4,d7
		bra.w	loc_42768
; ---------------------------------------------------------------------------

loc_42836:
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_4285A(pc,d2.w),d2
		jsr	off_4285A(pc,d2.w)

loc_42844:
		btst	#4,(a6)
		bne.s	loc_42854
		move.l	a0,2(a6)
		bra.w	loc_42658
; ---------------------------------------------------------------------------

loc_42854:
		move.l	a0,2(a6)
		rts
; End of function sub_4262E
; ---------------------------------------------------------------------------

off_4285A:
		dc.w cfSetVoiceM-off_4285A			; $F0
		dc.w cfChangeFMVolumeM-off_4285A	; $F1
		dc.w sub_42432-off_4285A				; $F2
		dc.w sub_41C5E-off_4285A				; $F3
		dc.w cfModulationM-off_4285A			; $F4
		dc.w sub_41DEC-off_4285A			; $F5
		dc.w sub_41E0C-off_4285A				; $F6
		dc.w sub_4243A-off_4285A				; $F7
		dc.w sub_41C66-off_4285A				; $F8
		dc.w sub_42428-off_4285A				; $F9
		dc.w sub_428B6-off_4285A				; $FA
		dc.w sub_41DC0-off_4285A			; $FB
		dc.w nullsub_1-off_4285A				; $FC
		dc.w cfPreventAttackM-off_4285A		; $FD
		dc.w sub_41E50-off_4285A				; $FE
		dc.w sub_4287A-off_4285A				; $FF

; =============== S U B R O U T I N E =======================================

sub_4287A:
		move.b	(a0)+,d2
		subi.b	#$F0,d2
		add.w	d2,d2
		move.w	off_4288E(pc,d2.w),d2
		jmp	off_4288E(pc,d2.w)
; End of function sub_4287A
; ---------------------------------------------------------------------------

off_4288E:
		dc.w sub_42428-off_4288E
		dc.w sub_42428-off_4288E
		dc.w sub_4242C-off_4288E
		dc.w sub_42428-off_4288E
		dc.w sub_42428-off_4288E
		dc.w sub_42428-off_4288E

; =============== S U B R O U T I N E =======================================

sub_4289A:
		tst.l	$22(a6)
		beq.s	loc_428AE
		btst	#4,$C(a5)
		bne.s	loc_428AE
		movea.l	$22(a6),a0
		rts
; ---------------------------------------------------------------------------

loc_428AE:
		bset	#4,(a6)
		rts
; End of function sub_4289A

; =============== S U B R O U T I N E =======================================

sub_428B6:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		btst	#6,1(a6)
		bne.s	locret_42918

loc_428C2:
		stopZ80
		btst	#7,(Z80_RAM+$1FFD).l
		beq.s	loc_428EE
		startZ80
		nop
		nop
		nop
		bra.s	loc_428C2
; ---------------------------------------------------------------------------

loc_428EE:
		tst.b	(a4)
		bmi.s	loc_428EE
		move.b	d0,(a4)
		nop
		nop
		nop
		nop
		nop

loc_428FE:
		tst.b	(a4)
		bmi.s	loc_428FE
		move.b	d1,1(a4)
		nop
		nop
		nop
		nop
		nop
		startZ80

locret_42918:
		rts
; End of function sub_428B6

; =============== S U B R O U T I N E =======================================

			include "Sound/Mucom Music Driver (0.85)/Music/Misc.asm"
   if MOMPASS=1
		message " Mucom Sound Driver v0.85 Music Data ROM offset is $\{*}"
    endif
			include "Sound/Mucom Music Driver (0.85)/Music/Music Pointer.asm"
Z80DriverM:	binclude "Sound/Mucom Music Driver (0.85)/DAC Driver (Z80).bin"
	even