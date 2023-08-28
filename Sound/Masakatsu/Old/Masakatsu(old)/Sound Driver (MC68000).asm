; ---------------------------------------------------------------------------
; Sound Driver M68000 by Masakatsu Maekawa(Without SFX).
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Masakatsu Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverMasakatsuRAM		= SoundDriverRAM
; ---------------------------------------------------------------------------

		include "Sound/Masakatsu/Macros.asm"

; =============== S U B R O U T I N E =======================================

PlaySound_Masakatsu:
		ori.b	#$80,d0
		move.b	d0,(SndDriverMasakatsuRAM+$630).l
		rts
; End of function PlaySound_Masakatsu

; =============== S U B R O U T I N E =======================================

StopSound_Masakatsu:
		move.b	d0,(SndDriverMasakatsuRAM+$632).l
		rts
; End of function StopSound_Masakatsu

; =============== S U B R O U T I N E =======================================

UpdateMusic_Masakatsu:
		moveq	#0,d0
		lea	(SndDriverMasakatsuRAM).l,a6
		move.b	$632(a6),d0
		bne.s	SoundExIndexLoad_Masakatsu

loc_60028:
		move.b	$630(a6),d0
		bmi.w	LoadMusic_Masakatsu
		tst.w	$630(a6)
		bne.s	loc_6005A
		rts
; ---------------------------------------------------------------------------

SoundExIndexLoad_Masakatsu:
		lea	$632(a6),a0
		lea	$633(a6),a1
		move.b	(a1)+,(a0)+
		move.b	(a1),(a0)+
		clr.b	(a0)
		lsl.b	#2,d0
		lea	SoundExIndex_Masakatsu(pc),a0
		movea.l	(a0,d0.w),a0
		jmp	(a0)
; ---------------------------------------------------------------------------

loc_6005A:
		moveq	#0,d7
		moveq	#$11,d6
		tst.b	$63C(a6)
		beq.s	loc_6006A
		move.w	#$318,d7
		moveq	#8,d6

loc_6006A:
		tst.b	(a6,d7.w)
		beq.w	loc_60256
		movea.l	a6,a5
		adda.l	d7,a5
		tst.b	1(a5)
		beq.s	loc_60098
		subq.b	#1,1(a5)
		tst.b	$16(a5)
		beq.s	loc_6008E
		subq.b	#1,$16(a5)
		bra.w	loc_60154
; ---------------------------------------------------------------------------

loc_6008E:
		move.b	#-1,4(a5)
		bra.w	loc_60154
; ---------------------------------------------------------------------------

loc_60098:
		movea.l	$2C(a5),a4

CoordFlag_Load_Masakatsu:	; Splatterhouse 3
		cmpi.w	#((LoadDriver_Masakatsu_Index-LoadDrvData_Index)/$10),(Driver_SaveLine_Count).w	; Current Driver
		bne.s	CoordFlag2_Load_Masakatsu
		moveq	#0,d0
		move.w	(a4)+,d0
		cmpi.w	#$D000,d0
		bcs.s	loc_600BA
		subi.w	#$D000,d0
		move.b	d0,d1
		lsr.w	#8,d0
		lea	CoordFlagIndex_Masakatsu(pc),a0
		bra.s	CoordFlag_Jump_Masakatsu
; ---------------------------------------------------------------------------

CoordFlag2_Load_Masakatsu:	; Splatterhouse 2
		moveq	#0,d0
		move.b	(a4)+,d0
		cmpi.b	#$D0,d0
		bcs.s	loc_600BC
		subi.b	#$D0,d0
		lea	CoordFlag2Index_Masakatsu(pc),a0

CoordFlag_Jump_Masakatsu:
		lsl.w	#2,d0
		movea.l	(a0,d0.w),a0
		jmp	(a0)
; ---------------------------------------------------------------------------

loc_600BA:
		lsr.w	#8,d0

loc_600BC:
		move.b	#-1,2(a5)
		tst.b	6(a5)
		seq	3(a5)
		bne.s	+
		move.b	$B(a5),$17(a5)
		andi.b	#$FE,$12(a5)
		andi.b	#$7F,$14(a5)
		clr.w	$22(a5)
+
		clr.w	4(a5)
		cmpi.b	#$DA,(a4)
		seq	6(a5)
		move.l	a4,$2C(a5)
		move.b	d0,d1
		andi.w	#$F,d1
		move.b	$10(a5),d2
		clr.b	d3

-		add.b	d2,d3
		dbf	d1,-
		subq.b	#1,d3
		move.b	d3,1(a5)
		tst.b	6(a5)
		bne.s	+
		move.b	7(a5),d2
		sub.b	d2,d3
		bcc.s	+
		moveq	#0,d3
+
		move.b	d3,$16(a5)
		andi.w	#$F0,d0
		bne.s	loc_6012C
		move.b	#-1,5(a5)
		bra.s	loc_60154
; ---------------------------------------------------------------------------

loc_6012C:
		subq.b	#1,d0
		lsr.b	#4,d0
		add.b	9(a5),d0
		add.b	$11(a5),d0
		move.b	d0,$18(a5)
		lsl.w	#1,d0
		tst.b	$15(a5)
		bne.s	loc_6014A
		lea	FMFrequencies_Masakatsu(pc),a0
		bra.s	loc_6014E
; ---------------------------------------------------------------------------

loc_6014A:
		lea	PSGFrequencies_Masakatsu(pc),a0

loc_6014E:
		move.w	(a0,d0.w),$20(a5)

loc_60154:
		tst.b	$15(a5)
		bne.w	loc_60184
		move.b	$C(a5),d0
		beq.s	loc_60180
		neg.b	d0
		bmi.s	loc_60172
		add.b	$23(a5),d0
		bcc.s	+
		addq.b	#1,$22(a5)
		bra.s	+
; ---------------------------------------------------------------------------

loc_60172:
		add.b	$23(a5),d0
		bcs.s	+
		subq.b	#1,$22(a5)
+
		move.b	d0,$23(a5)

loc_60180:
		bra.w	loc_60256
; ---------------------------------------------------------------------------

loc_60184:
		tst.b	3(a5)
		bne.s	loc_601AC
		move.b	$C(a5),d0
		beq.s	loc_601AC
		bmi.s	loc_6019E
		add.b	$23(a5),d0
		bcc.s	loc_601A8
		addq.b	#1,$22(a5)
		bra.s	loc_601A8
; ---------------------------------------------------------------------------

loc_6019E:
		add.b	$23(a5),d0
		bcs.s	loc_601A8
		subq.b	#1,$22(a5)

loc_601A8:
		move.b	d0,$23(a5)

loc_601AC:
		tst.b	$14(a5)
		bpl.w	loc_60232
		tst.b	$1E(a5)
		bne.w	loc_60256
		tst.b	$1F(a5)
		bne.w	loc_601F4
		movea.l	$30(a5),a0

loc_601C8:
		move.b	(a0)+,d0
		beq.s	loc_601D2
		subq.b	#1,d0
		beq.s	loc_601DA
		bra.s	loc_60228
; ---------------------------------------------------------------------------

loc_601D2:
		move.b	(a0)+,$D(a5)
		bra.w	loc_60252
; ---------------------------------------------------------------------------

loc_601DA:
		move.b	(a0)+,$1A(a5)
		move.b	(a0),$1C(a5)
		move.b	(a0)+,$1B(a5)
		move.b	(a0)+,$1D(a5)
		move.b	#-1,$1F(a5)
		move.l	a0,$30(a5)

loc_601F4:
		tst.b	$1C(a5)
		beq.s	loc_60200
		subq.b	#1,$1C(a5)
		bra.s	loc_60256
; ---------------------------------------------------------------------------

loc_60200:
		tst.b	$1D(a5)
		beq.s	loc_60222
		move.b	$1B(a5),$1C(a5)
		move.b	$1A(a5),d0
		add.b	$D(a5),d0
		andi.b	#$F,d0
		move.b	d0,$D(a5)
		subq.b	#1,$1D(a5)
		bra.s	loc_60256
; ---------------------------------------------------------------------------

loc_60222:
		clr.b	$1F(a5)
		bra.s	loc_60256
; ---------------------------------------------------------------------------

loc_60228:
		move.b	#-1,$1E(a5)
		bra.s	loc_60256
; ---------------------------------------------------------------------------

loc_60232:
		clr.b	3(a5)
		clr.w	$1E(a5)
		moveq	#0,d0
		move.b	$14(a5),d0
		ori.b	#$80,$14(a5)
		lea	PSGIndex_Masakatsu(pc),a0
		lsl.w	#2,d0
		movea.l	(a0,d0.w),a0
		bra.w	loc_601C8
; ---------------------------------------------------------------------------

loc_60252:
		move.l	a0,$30(a5)

loc_60256:
		addi.w	#$58,d7
		dbf	d6,loc_6006A
		tst.b	$63A(a6)
		beq.s	loc_6029C
		tst.b	$63C(a6)
		bne.s	loc_6029C
		move.b	$63F(a6),d0
		cmp.b	$63E(a6),d0
		bcs.s	loc_60298
		clr.b	$63F(a6)
		move.b	$638(a6),d0
		cmpi.b	#$7F,d0
		beq.s	loc_6029C
		move.b	#-1,$63B(a6)
		addq.b	#1,$638(a6)
		lsr.b	#1,d0
		cmpi.b	#$F,d0
		beq.s	loc_60298
		move.b	d0,$639(a6)

loc_60298:
		addq.b	#1,$63F(a6)

loc_6029C:
		moveq	#0,d7
		moveq	#0,d4
		moveq	#0,d3
		moveq	#0,d0
		move.l	#$318,d6
		stopZ80
		movea.l	#Z80_RAM+$905,a1
		tst.b	2(a5)
		beq.s	loc_602E2
		move.b	$635(a6),d0
		bmi.s	loc_602E2
		ori.b	#$80,$635(a6)
		move.b	#0,(a1)+
		move.b	#$22,(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3

loc_602E2:
		moveq	#5,d5

loc_602E4:
		move.w	d7,-(sp)
		tst.b	$63C(a6)
		bne.s	loc_602F2
		tst.b	(a6,d6.w)
		beq.s	loc_602F4

loc_602F2:
		move.w	d6,d7

loc_602F4:
		movea.l	a6,a5
		adda.l	d7,a5
		move.b	$E(a5),d0
		cmpi.b	#3,d0
		bne.s	loc_6033E
		tst.b	5(a5)
		bne.w	loc_6069C
		move.b	$18(a5),d0
		bmi.w	loc_6069C
		addq.b	#1,d0
		ori.b	#$80,$18(a5)
		lea	byte_612C0(pc),a0
		move.b	(a0,d0.w),d1
		move.b	(Z80_RAM+$803).l,d2
		andi.w	#$7F,d2
		cmp.b	(a0,d2.w),d1
		bcs.w	loc_6069C
		move.b	d0,(Z80_RAM+$803).l
		bra.w	loc_6069C
; ---------------------------------------------------------------------------

loc_6033E:
		tst.b	d5
		bne.s	loc_6034C
		tst.b	(Z80_RAM+$803).l
		bne.w	loc_6069C

loc_6034C:
		tst.b	2(a5)
		beq.w	loc_60512
		clr.b	2(a5)
		move.b	$13(a5),d0
		bmi.w	loc_60512
		andi.b	#$FE,$12(a5)
		andi.w	#$FF,d0
		ori.b	#$80,$13(a5)
		lea	InstrumentsBankSH2_Index(pc),a3
		cmpi.w	#((LoadDriver_Masakatsu_Index-LoadDrvData_Index)/$10),(Driver_SaveLine_Count).w	; Current Driver
		bne.s	+
		lea	InstrumentsBankSH3_Index(pc),a3
+		lsl.w	#2,d0
		movea.l	(a3,d0.w),a3
		lea	byte_60F60(pc),a4
		move.b	(a3)+,d0
		move.b	d4,(a1)+
		move.b	(a4,d4.w),(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3
		andi.w	#7,d0
		lea	byte_60F9C(pc),a4
		move.b	(a4,d0.w),$19(a5)
		lea	byte_60F66(pc),a4
		move.b	(a4,d4.w),d0
		lea	$24(a5),a4
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	(a3)+,(a4)+
		move.b	d0,(a4)+
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		subi.b	#$58,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	(a3)+,(a4)+
		move.b	d0,(a4)+
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		subi.b	#$64,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	(a3)+,(a4)+
		move.b	d0,(a4)+
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		subi.b	#$58,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	(a3)+,(a4)+
		move.b	d0,(a4)+
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3
		addi.b	#$10,d0
		move.b	d4,(a1)+
		move.b	d0,(a1)+
		move.b	(a3)+,(a1)+
		addi.b	#1,d3

loc_60512:
		tst.b	$63B(a6)
		bne.s	loc_60520
		tst.b	3(a5)
		beq.w	loc_605BC

loc_60520:
		clr.b	$63B(a6)
		lea	$24(a5),a4
		move.b	$19(a5),d1
		move.b	(a4)+,d0
		lsr.b	#1,d1
		bcc.s	loc_60546
		cmpi.w	#$318,d7
		bcc.s	loc_6053E
		add.b	$638(a6),d0
		bvs.s	loc_60544

loc_6053E:
		add.b	8(a5),d0
		bvc.s	loc_60546

loc_60544:
		moveq	#$7F,d0

loc_60546:
		move.b	d4,(a1)+
		move.b	(a4)+,(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3
		move.b	(a4)+,d0
		lsr.b	#1,d1
		bcc.s	loc_6056A
		cmpi.w	#$318,d7
		bcc.s	loc_60562
		add.b	$638(a6),d0
		bvs.s	loc_60568

loc_60562:
		add.b	8(a5),d0
		bvc.s	loc_6056A

loc_60568:
		moveq	#$7F,d0

loc_6056A:
		move.b	d4,(a1)+
		move.b	(a4)+,(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3
		move.b	(a4)+,d0
		lsr.b	#1,d1
		bcc.s	loc_6058E
		cmpi.w	#$318,d7
		bcc.s	loc_60586
		add.b	$638(a6),d0
		bvs.s	loc_6058C

loc_60586:
		add.b	8(a5),d0
		bvc.s	loc_6058E

loc_6058C:
		moveq	#$7F,d0

loc_6058E:
		move.b	d4,(a1)+
		move.b	(a4)+,(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3
		move.b	(a4)+,d0
		lsr.b	#1,d1
		bcc.s	loc_605B2
		cmpi.w	#$318,d7
		bcc.s	loc_605AA
		add.b	$638(a6),d0
		bvs.s	loc_605B0

loc_605AA:
		add.b	8(a5),d0
		bvc.s	loc_605B2

loc_605B0:
		moveq	#$7F,d0

loc_605B2:
		move.b	d4,(a1)+
		move.b	(a4)+,(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3

loc_605BC:
		tst.b	5(a5)
		beq.s	+
		clr.b	3(a5)
		bra.w	loc_60686
; ---------------------------------------------------------------------------
+		move.b	$12(a5),d0
		btst	#0,d0
		bne.s	loc_605FA
		tst.b	$17(a5)
		beq.s	+
		subq.b	#1,$17(a5)
		bra.s	loc_605EA
; ---------------------------------------------------------------------------
+		add.b	$F(a5),d0
		ori.b	#1,$12(a5)

loc_605EA:
		lea	byte_60F6C(pc),a4
		move.b	d4,(a1)+
		move.b	(a4,d4.w),(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3

loc_605FA:
		move.w	$20(a5),d1
		move.w	d1,d2
		andi.w	#$7FF,d1
		andi.w	#$3800,d2
		moveq	#0,d0
		move.b	$A(a5),d0
		neg.b	d0
		bpl.s	loc_60616
		ori.w	#$FF00,d0

loc_60616:
		add.w	d1,d0
		andi.w	#$7FF,d1
		move.w	$22(a5),d0
		add.w	d1,d0
		andi.w	#$7FF,d0
		add.w	d2,d0
		move.w	d0,d1
		andi.w	#$3F00,d1
		lsr.w	#8,d1
		lea	byte_60F72(pc),a3
		move.b	d4,(a1)+
		move.b	(a3,d4.w),(a1)+
		move.b	d1,(a1)+
		addi.b	#1,d3
		move.b	d4,(a1)+
		move.b	6(a3,d4.w),(a1)+
		move.b	d0,(a1)+
		addi.b	#1,d3
		moveq	#0,d0
		moveq	#0,d1
		moveq	#0,d2
		tst.b	3(a5)
		beq.s	loc_60680
		clr.b	3(a5)
		lea	byte_60F90(pc),a3
		move.b	#0,(a1)+
		move.b	#$28,(a1)+
		move.b	(a3,d4.w),(a1)+
		addi.b	#1,d3
		move.b	#0,(a1)+
		move.b	#$28,(a1)+
		move.b	6(a3,d4.w),(a1)+
		addi.b	#1,d3

loc_60680:
		tst.b	4(a5)
		beq.s	loc_6069C

loc_60686:
		lea	byte_60F90(pc),a3
		move.b	#0,(a1)+
		move.b	#$28,(a1)+
		move.b	(a3,d4.w),(a1)+
		addi.b	#1,d3

loc_6069C:
		move.w	(sp)+,d7
		addi.w	#$58,d7
		addi.w	#$58,d6
		addq.b	#1,d4
		dbf	d5,loc_602E4
		move.b	d3,(Z80_RAM+$800).l
		addq.b	#1,(Z80_RAM+$802).l
		tst.b	$640(a5)
		bne.s	loc_606C4
		startZ80

loc_606C4:
		moveq	#2,d5
		movea.l	#PSG_input,a0
		moveq	#0,d4

loc_606CE:
		move.w	d7,-(sp)
		tst.b	$63C(a6)
		bne.s	loc_606DC
		tst.b	(a6,d6.w)
		beq.s	loc_606DE

loc_606DC:
		move.w	d6,d7

loc_606DE:
		movea.l	a6,a5
		adda.l	d7,a5
		lea	byte_60FA4(pc),a2
		move.b	(a2,d5.w),d0
		move.b	$20(a5),d2
		move.b	$A(a5),d1
		bmi.s	loc_606FE
		add.b	$21(a5),d1
		bcc.s	loc_60706
		addq.b	#1,d2
		bra.s	loc_60706
; ---------------------------------------------------------------------------

loc_606FE:
		add.b	$21(a5),d1
		bcs.s	loc_60706
		subq.b	#1,d2

loc_60706:
		add.b	$23(a5),d1
		bcc.s	loc_6070E
		addq.b	#1,d2

loc_6070E:
		add.b	$22(a5),d2
		move.b	d1,d3
		andi.b	#$F,d1
		add.b	d0,d1
		move.b	d1,(a0)
		lsr.b	#4,d3
		lsl.b	#4,d2
		add.b	d3,d2
		andi.b	#$3F,d2
		move.b	d2,(a0)
		addi.b	#$10,d0
		tst.b	d5
		bne.s	loc_60740
		move.b	$E(a5),d1
		bpl.s	loc_6077C
		andi.b	#$7F,d1
		beq.s	loc_60740

loc_6073C:
		addi.b	#$20,d0

loc_60740:
		tst.b	5(a5)
		bne.s	loc_60764
		move.b	$D(a5),d1
		move.b	8(a5),d2
		cmpi.w	#$318,d7
		bcc.s	loc_60758
		add.b	$639(a6),d2

loc_60758:
		add.b	d1,d2
		bcc.s	loc_60760
		moveq	#0,d2
		bra.s	loc_60768
; ---------------------------------------------------------------------------

loc_60760:
		cmpi.b	#$10,d2
		bcs.s	loc_60768

loc_60764:
		moveq	#$F,d2

loc_60768:
		add.b	d0,d2
		move.b	d2,(a0)
		move.w	(sp)+,d7
		addi.w	#$58,d7
		addi.w	#$58,d6
		dbf	d5,loc_606CE
		rts
; ---------------------------------------------------------------------------

loc_6077C:
		move.b	#$DF,(a0)
		move.b	#-1,(a0)
		ori.b	#$80,$E(a5)
		tst.b	d1
		bne.s	+
		move.b	#$E4,(a0)
		bra.s	loc_60740
; ---------------------------------------------------------------------------
+		subq.b	#1,d1
		bne.s	+
		move.b	#$E3,(a0)
		bra.w	loc_6073C
; ---------------------------------------------------------------------------
+		move.b	#$E7,(a0)
		bra.w	loc_6073C

; =============== S U B R O U T I N E =======================================

loc_607A8:
		clr.b	$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607B0:
		move.b	#$C,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607BA:
		move.b	#$18,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607C4:
		move.b	#$24,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607CE:
		move.b	#$30,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607D8:
		move.b	#$3C,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607E2:
		move.b	#$48,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607EC:
		move.b	#$54,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607F6:
		addi.b	#$C,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60800:
		subi.b	#$C,$11(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6080A:
		move.b	#-1,6(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60814:
		clr.b	6(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6081C:
		move.b	d1,$10(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60824:
		move.b	d1,7(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6082C:
		move.b	d1,$635(a6)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60834:
		move.b	d1,$B(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6083C:
		move.b	d1,$12(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60844:
		move.b	d1,$13(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6084C:
		move.b	d1,9(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60854:
		move.b	d1,d0
		add.b	d0,9(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6085E:
		move.b	d1,8(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60866:
		move.b	d1,d0
		add.b	d0,8(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60870:
		move.b	d1,$A(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60878:
		move.b	d1,d0
		add.b	d0,$A(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

ChannelCall_Masakatsu:
		move.l	a4,-(sp)
		move.w	(a4),d4
		lea	(a4,d4.w),a4
		move.l	a4,$2C(a5)
		movea.l	(sp)+,a4
		addq.l	#2,a4
		movea.l	$34(a5),a0
		move.l	a4,(a0)+
		move.l	a0,$34(a5)
		movea.l	$2C(a5),a4
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

ChannelReturn_Masakatsu:
		movea.l	$34(a5),a0
		movea.l	-4(a0),a4
		subq.l	#4,$34(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608A8:
		move.b	d1,d0
		movea.l	$34(a5),a0
		move.l	a4,(a0)+
		move.w	d0,(a0)+
		move.l	a0,$34(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608BA:
		movea.l	$34(a5),a0
		subq.b	#1,-1(a0)
		bne.s	loc_608CC
		subq.l	#6,$34(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608CC:
		movea.l	-6(a0),a4
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608D4:
		movea.l	$34(a5),a0
		cmpi.b	#1,-1(a0)
		beq.s	loc_608E6
		addq.l	#2,a4
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608E6:
		subq.l	#6,$34(a5)

ChannelJump_Masakatsu:
		move.l	a4,-(sp)
		move.w	(a4),d4
		lea	(a4,d4.w),a4
		move.l	a4,$2C(a5)
		movea.l	(sp)+,a4
		addq.l	#2,a4
		movea.l	$2C(a5),a4
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608F6:
		move.b	d1,$C(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608FE:
		move.b	d1,$14(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60906:
		move.b	d1,$E(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6090E:
		andi.b	#7,$F(a5)
		move.b	d1,d0
		lsl.b	#4,d0
		add.b	d0,$F(a5)
		andi.b	#$FE,$12(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60926:
		andi.b	#$30,$F(a5)
		move.b	d1,d0
		add.b	d0,$F(a5)
		andi.b	#$FE,$12(a5)
		bra.w	CoordFlag_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6093C:
		bra.w	CoordFlag_Load_Masakatsu

; =============== S U B R O U T I N E =======================================

loc_607A2:
		clr.b	$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607AA:
		move.b	#$C,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607B4:
		move.b	#$18,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607BE:
		move.b	#$24,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607C8:
		move.b	#$30,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607D2:
		move.b	#$3C,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607DC:
		move.b	#$48,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607E6:
		move.b	#$54,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607F0:
		addi.b	#$C,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_607FA:
		subi.b	#$C,$11(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60806:
		move.b	#-1,6(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6080E:
		clr.b	6(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60816:
		move.b	(a4)+,$10(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6081E:
		move.b	(a4)+,7(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60826:
		move.b	(a4)+,$635(a6)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6082E:
		move.b	(a4)+,$B(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60836:
		move.b	(a4)+,$12(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6083E:
		move.b	(a4)+,$13(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60846:
		move.b	(a4)+,9(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6084E:
		move.b	(a4)+,d0
		add.b	d0,9(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60858:
		move.b	(a4)+,8(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60860:
		move.b	(a4)+,d0
		add.b	d0,8(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_6086A:
		move.b	(a4)+,$A(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60874:
		move.b	(a4)+,d0
		add.b	d0,$A(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

ChannelCall2_Masakatsu:
		move.l	a4,-(sp)
		move.w	(a4),d4
		lea	(a4,d4.w),a4
		move.l	a4,$2C(a5)
		movea.l	(sp)+,a4
		addq.l	#2,a4
		movea.l	$34(a5),a0
		move.l	a4,(a0)+
		move.l	a0,$34(a5)
		movea.l	$2C(a5),a4
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

ChannelReturn2_Masakatsu:
		movea.l	$34(a5),a0
		movea.l	-4(a0),a4
		subq.l	#4,$34(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608A2:
		move.b	(a4)+,d0
		movea.l	$34(a5),a0
		move.l	a4,(a0)+
		move.w	d0,(a0)+
		move.l	a0,$34(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608B4:
		movea.l	$34(a5),a0
		subq.b	#1,-1(a0)
		bne.s	+
		subq.l	#6,$34(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------
+		movea.l	-6(a0),a4
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608CE:
		movea.l	$34(a5),a0
		cmpi.b	#1,-1(a0)
		beq.s	+
		addq.l	#2,a4
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------
+		subq.l	#6,$34(a5)

ChannelJump2_Masakatsu:
		move.l	a4,-(sp)
		move.w	(a4),d4
		lea	(a4,d4.w),a4
		move.l	a4,$2C(a5)
		movea.l	(sp)+,a4
		addq.l	#2,a4
		movea.l	$2C(a5),a4
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608F0:
		move.b	(a4)+,$C(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_608F8:
		move.b	(a4)+,$14(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60900:
		move.b	(a4)+,$E(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60908:
		andi.b	#7,$F(a5)
		move.b	(a4)+,d0
		lsl.b	#4,d0
		add.b	d0,$F(a5)
		andi.b	#$FE,$12(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60920:
		andi.b	#$30,$F(a5)
		move.b	(a4)+,d0
		add.b	d0,$F(a5)
		andi.b	#$FE,$12(a5)
		bra.w	CoordFlag2_Load_Masakatsu
; ---------------------------------------------------------------------------

loc_60936:
		bra.w	CoordFlag2_Load_Masakatsu

; =============== S U B R O U T I N E =======================================

ChannelStop_Masakatsu:
		cmpi.w	#$318,d7
		bcc.s	loc_6096C
		subq.b	#1,$636(a6)
		bne.s	+
		clr.b	$630(a6)
+
		move.b	#-1,4(a6,d7.w)
		move.b	#$F,$D(a6,d7.w)
		clr.b	(a6,d7.w)
		clr.b	$E(a6,d7.w)
		clr.b	$13(a6,d7.w)
		bra.w	loc_60256
; ---------------------------------------------------------------------------

loc_6096C:
		subq.b	#1,$637(a6)
		bne.s	+
		clr.b	$631(a6)
+
		clr.b	(a6,d7.w)
		move.b	#$F,$D(a6,d7.w)
		move.b	#-1,4(a6,d7.w)
		move.w	d7,d0
		subi.w	#$318,d0
		move.b	#-1,4(a6,d0.w)
		andi.b	#$7F,$E(a6,d0.w)
		andi.b	#$7F,$13(a6,d0.w)
		andi.b	#$FE,$12(a6,d0.w)
		clr.b	2(a6,d0.w)
		bra.w	loc_60256
; ---------------------------------------------------------------------------

LoadMusic_Masakatsu:
		moveq	#0,d7
		andi.b	#$7F,$630(a6)
		move.l	d7,$638(a6)
		lea	(MusicIndex_Masakatsu).l,a4
		lea	$636(a6),a3
		moveq	#0,d2
		andi.b	#$7F,d0
		lsl.w	#2,d0
		movea.l	(a4,d0.w),a4
		moveq	#0,d0
		moveq	#8,d1
		move.w	(a4)+,d3

loc_609EC:
		movea.l	a6,a5
		adda.l	d7,a5
		lsr.w	#1,d3
		bcs.s	loc_609FC
		tst.b	(a5)
		beq.s	loc_60A18
		addq.b	#1,d2
		bra.s	loc_60A18
; ---------------------------------------------------------------------------

loc_609FC:
		movea.l	a5,a2
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.b	#-1,(a5)
		move.l	a4,-(sp)
		move.w	(a4),d4
		lea	(a4,d4.w),a4
		move.l	a4,$2C(a5)
		movea.l	(sp)+,a4
		addq.w	#2,a4
		lea	$38(a5),a2
		move.l	a2,$34(a5)
		addq.b	#1,d2

loc_60A18:
		addi.w	#$58,d7
		dbf	d1,loc_609EC
		move.b	d2,(a3)
		bra.w	loc_60028
; End of function ChannelStop_Masakatsu

; =============== S U B R O U T I N E =======================================

sub_60A26:
		stopZ80
		eori.b	#-1,(Z80_RAM+$804).l
		startZ80
		eori.b	#-1,$63C(a6)
		beq.s	+
		move.b	#$81,$631(a6)
		move.w	#$318,d7
		moveq	#5,d1

-		move.b	#-1,4(a6,d7.w)
		addi.w	#$58,d7
		dbf	d1,-
+
		bra.w	loc_60028
; End of function sub_60A26

; =============== S U B R O U T I N E =======================================

FadeMusic_Masakatsu:
		move.b	#-1,$63A(a6)
		clr.w	$638(a6)
		clr.b	$63F(a6)
		bra.w	loc_60028
; End of function FadeMusic_Masakatsu

; =============== S U B R O U T I N E =======================================

sub_60A80:
		clr.b	$631(a6)
		clr.b	$637(a6)
		moveq	#8,d1
		move.w	#$318,d7

-		clr.b	(a6,d7.w)
		move.b	#$F,$D(a6,d7.w)
		move.b	#-1,4(a6,d7.w)
		move.w	d7,d0
		subi.w	#$318,d0
		move.b	#-1,4(a6,d0.w)
		andi.b	#$7F,$E(a6,d0.w)
		andi.b	#$7F,$13(a6,d0.w)
		andi.b	#$FE,$12(a6,d0.w)
		addi.w	#$58,d7
		dbf	d1,-
		bra.w	loc_6029C
; End of function sub_60A80

; =============== S U B R O U T I N E =======================================

sub_60AC8:
		clr.b	$630(a6)
		clr.b	$636(a6)
		moveq	#8,d1
		moveq	#0,d7

-		move.b	#-1,4(a6,d7.w)
		move.b	#$F,$D(a6,d7.w)
		clr.b	(a6,d7.w)
		clr.b	$E(a6,d7.w)
		clr.b	$13(a6,d7.w)
		move.b	#-1,3(a6,d7.w)
		move.b	#-1,2(a6,d7.w)
		addi.w	#$58,d7
		dbf	d1,-
		bra.w	loc_6029C
; End of function sub_60AC8

; =============== S U B R O U T I N E =======================================

sub_60B04:
		stopZ80
		clr.b	(Z80_RAM+$803).l
		startZ80
		bra.w	loc_60028
; End of function sub_60B04

; =============== S U B R O U T I N E =======================================

Masakatsu_LoadData:
		movem.l	d0-a6,-(sp)
		bsr.s	Masakatsu_LoadData2
		movem.l	(sp)+,d0-a6
		rts
; End of function SndZ80DrvLoad_Masakatsu

; =============== S U B R O U T I N E =======================================

Masakatsu_LoadData2:
		lea	(SndDriverMasakatsuRAM).l,a6
		lea	byte_60F7E(pc),a5
		moveq	#0,d7
		moveq	#$11,d1

-		move.b	(a5)+,$15(a6,d7.w)
		addi.w	#$58,d7
		dbf	d1,-

StopMusic_Masakatsu:
		stopZ80
		clr.b	(Z80_RAM+$803).l
		startZ80
		lea	(SndDriverMasakatsuRAM).l,a6
		movea.l	a6,a5
		adda.l	#$630,a5
		moveq	#0,d7
		move.l	d7,(a5)+
		move.l	d7,(a5)+
		move.l	d7,(a5)+
		move.b	d7,(a5)+
		moveq	#8,d1

-		move.b	#-1,4(a6,d7.w)
		move.b	#$F,$D(a6,d7.w)
		clr.b	(a6,d7.w)
		clr.b	$E(a6,d7.w)
		clr.b	$13(a6,d7.w)
		move.b	#-1,3(a6,d7.w)
		move.b	#-1,2(a6,d7.w)
		addi.w	#$58,d7
		dbf	d1,-
		moveq	#8,d1

-		clr.b	(a6,d7.w)
		addi.w	#$58,d7
		dbf	d1,-
		bra.w	loc_6029C
; End of function StopMusic_Masakatsu

; =============== S U B R O U T I N E =======================================

SoundExIndex_Masakatsu:
		dc.l 0						; 0
		dc.l sub_60A26				; 1
		dc.l sub_60A26				; 2
		dc.l FadeMusic_Masakatsu		; 3 (Fade Sound)
		dc.l sub_60A80				; 4
		dc.l sub_60AC8				; 5
		dc.l sub_60B04				; 6
		dc.l StopMusic_Masakatsu		; 7 (Stop Sound)
CoordFlagIndex_Masakatsu:
		dc.l loc_607A8				; $D000
		dc.l loc_607B0				; $D100
		dc.l loc_607BA				; $D200
		dc.l loc_607C4				; $D300
		dc.l loc_607CE				; $D400
		dc.l loc_607D8				; $D500
		dc.l loc_607E2				; $D600
		dc.l loc_607EC				; $D700
		dc.l loc_607F6				; $D800
		dc.l loc_60800				; $D900
		dc.l loc_6080A				; $DA00
		dc.l loc_6081C				; $DB00
		dc.l loc_60824				; $DC00
		dc.l loc_6082C				; $DD00
		dc.l loc_60834				; $DE00
		dc.l loc_6083C				; $DF00
		dc.l loc_60844				; $E000
		dc.l loc_6084C				; $E100
		dc.l loc_60854				; $E200
		dc.l loc_6085E				; $E300
		dc.l loc_60866				; $E400
		dc.l loc_60870				; $E500
		dc.l loc_60878				; $E600
		dc.l loc_60814				; $E700
		dc.l ChannelCall_Masakatsu	; $E800
		dc.l ChannelReturn_Masakatsu	; $E900
		dc.l loc_6093C				; $EA00
		dc.l loc_608A8				; $EB00
		dc.l loc_608BA				; $EC00
		dc.l loc_608D4				; $ED00
		dc.l ChannelJump_Masakatsu	; $EE00
		dc.l loc_608F6				; $EF00
		dc.l ChannelStop_Masakatsu	; $F000
		dc.l loc_608FE				; $F100
		dc.l loc_60906				; $F200
		dc.l loc_6090E				; $F300
		dc.l loc_60926				; $F400
CoordFlag2Index_Masakatsu:
		dc.l loc_607A2				; $D0
		dc.l loc_607AA				; $D1
		dc.l loc_607B4				; $D2
		dc.l loc_607BE				; $D3
		dc.l loc_607C8				; $D4
		dc.l loc_607D2				; $D5
		dc.l loc_607DC				; $D6
		dc.l loc_607E6				; $D7
		dc.l loc_607F0				; $D8
		dc.l loc_607FA				; $D9
		dc.l loc_60806				; $DA
		dc.l loc_60816				; $DB
		dc.l loc_6081E				; $DC
		dc.l loc_60826				; $DD
		dc.l loc_6082E				; $DE
		dc.l loc_60836				; $DF
		dc.l loc_6083E				; $E0
		dc.l loc_60846				; $E1
		dc.l loc_6084E				; $E2
		dc.l loc_60858				; $E3
		dc.l loc_60860				; $E4
		dc.l loc_6086A				; $E5
		dc.l loc_60874				; $E6
		dc.l loc_6080E				; $E7
		dc.l ChannelCall2_Masakatsu	; $E8
		dc.l ChannelReturn2_Masakatsu	; $E9
		dc.l loc_60936				; $EA
		dc.l loc_608A2				; $EB
		dc.l loc_608B4				; $EC
		dc.l loc_608CE				; $ED
		dc.l ChannelJump2_Masakatsu	; $EE
		dc.l loc_608F0				; $EF
		dc.l ChannelStop_Masakatsu	; $F0
		dc.l loc_608F8				; $F1
		dc.l loc_60900				; $F2
		dc.l loc_60908				; $F3
		dc.l loc_60920				; $F4

; =============== S U B R O U T I N E =======================================

FMFrequencies_Masakatsu:	binclude "Sound/Masakatsu/Data/FM Frequencies.bin"
	even
PSGFrequencies_Masakatsu:	binclude "Sound/Masakatsu/Data/PSG Frequencies.bin"
	even
byte_612C0:					binclude "Sound/Masakatsu/Data/Data(612C0).bin"
	even
							include "Sound/Masakatsu/Data/Misc.asm"
							include "Sound/Masakatsu/Data/Instruments(Splatterhouse 2).asm"
							include "Sound/Masakatsu/Data/Instruments(Splatterhouse 3).asm"
							include "Sound/Masakatsu/Data/PSG.asm"
   if MOMPASS=1
		message " Masakatsu Sound Driver Music Data ROM offset is $\{*}"
    endif
							include "Sound/Masakatsu/Data/Music.asm"
   if MOMPASS=1
		message " Masakatsu Sound Driver Z80 Data ROM offset is $\{*}"
    endif
Z80DacDrv_Masakatsu:		binclude "Sound/Masakatsu/DAC Driver (Z80).bin"
	even