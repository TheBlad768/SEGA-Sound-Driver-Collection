; ---------------------------------------------------------------------------
; Audios Wave Slave MD
; Mega Turrican version
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Audios Wave Slave MD Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverAudiosRAM		= $FFFF7000

; =============== S U B R O U T I N E =======================================

SndZ80AudiosDrvInit:
		stopZ80a
		resetZ80
		waitZ80
		clearZ80RAM
		clearM68KRAM
		clr.w	(SndDriverAudiosRAM+$24E).l
		clr.w	(SndDriverAudiosRAM+$250).l
		sf	(SndDriverAudiosRAM+$252).l
		move.w	#-1,(SndDriverAudiosRAM+$256).l
		lea	Z80DACDrv_Audios(pc),a0
		lea	(Z80_RAM).l,a1
		jsr	(Kos_Decomp).l
		moveq	#0,d0
-		move.b	d0,(a1)+
		cmpa.l	#(Z80_RAM_end),a1
		bne.s	-
		move.w	#1,(SndDriverAudiosRAM+$45C).l
		move.w	#$8000,(SndDriverAudiosRAM+$45E).l
		move.w	#$100,(SndDriverAudiosRAM+$460).l
		move.w	#1,(SndDriverAudiosRAM+$462).l
		move.w	#$8000,(SndDriverAudiosRAM+$464).l
		move.w	#$100,(SndDriverAudiosRAM+$466).l
		clr.w	(SndDriverAudiosRAM+$25C).l
		clr.w	(SndDriverAudiosRAM+$35C).l
		waitZ80time $1B00
		bsr.w	sub_D1180
		waitZ80time $1B00
		resetZ80a
	rept 4
		nop
	endm
		startZ80
		resetZ80
	rept 11
		nop
	endm
		bra.w	StopSound_Audios
; End of function SndZ80AudiosDrvInit

; =============== S U B R O U T I N E =======================================

UpdateMusic_Audios:
		tst.b	(SndDriverAudiosRAM+$252).l
		beq.w	locret_D00EA
		movem.l	d0-a6,-(sp)
		stopZ80
		bsr.w	sub_D1180
		startZ80
		tst.w	(SndDriverAudiosRAM+$256).l
		bmi.s	loc_D00C0
		cmpi.w	#5,(SndDriverAudiosRAM+$248).l
		bne.s	loc_D00A2
		subq.w	#1,(SndDriverAudiosRAM+$256).l

loc_D00A2:
		subq.w	#1,(SndDriverAudiosRAM+$256).l
		bpl.s	loc_D00C0
		move.l	(SndDriverAudiosRAM+$258).l,(SndDriverAudiosRAM+$240).l
		move.w	(SndDriverAudiosRAM+$254).l,d0
		bsr.w	PlaySong_Audios
		bra.s	loc_D00E6
; ---------------------------------------------------------------------------

loc_D00C0:
		bsr.w	sub_D070E
		tst.w	(SndDriverAudiosRAM+$248).l
		beq.s	loc_D00E2
		subi.w	#1,(SndDriverAudiosRAM+$248).l
		bne.s	loc_D00E2
		move.w	#5,(SndDriverAudiosRAM+$248).l
		bsr.w	sub_D04BC

loc_D00E2:
		bsr.w	sub_D04BC

loc_D00E6:
		movem.l	(sp)+,d0-a6

locret_D00EA:
		rts
; End of function UpdateMusic_Audios

; =============== S U B R O U T I N E =======================================

LoadFile_Audios:
		disableInts2
		movem.l	a0-a1,-(sp)
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		add.w	d0,d0
		lea	MusIndex_Audios(pc),a0
		move.w	(a0,d0.l),d0
		lea	(a0,d0.l),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		movem.l	(sp)+,a0-a1
		enableInts2
		rts
; End of function LoadFile_Audios

; =============== S U B R O U T I N E =======================================

PlaySound_Audios:
		bsr.s	StopSound_Audios
		move.w	d0,-(sp)
		lsr.w	#4,d0
		bsr.s	LoadFile_Audios
		move.w	(sp)+,d0
		andi.w	#$F,d0
; End of function PlaySound_Audios

; =============== S U B R O U T I N E =======================================

PlaySong_Audios:
		movem.l	d7/a4-a5,-(sp)
		sf	(SndDriverAudiosRAM+$252).l
		move.w	d0,-(sp)
		bsr.s	StopSound_Audios
		move.b	#0,(SndDriverAudiosRAM+$253).l
		move.w	(sp)+,d0
		lea	(SoundDriverMusicRAM).l,a0
		adda.w	$1C(a0),a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		lsl.w	#4,d0
		move.w	d0,(SndDriverAudiosRAM+$244).l
		bsr.w	sub_D0638
		tst.w	(SndDriverAudiosRAM+$248).l
		beq.s	+
		move.w	#5,(SndDriverAudiosRAM+$248).l
+
		st	(SndDriverAudiosRAM+$252).l
		movem.l	(sp)+,d7/a4-a5
		rts
; End of function PlaySong_Audios

; =============== S U B R O U T I N E =======================================

StopSound_Audios:
		movem.l	d0-a6,-(sp)
		move.b	(SndDriverAudiosRAM+$252).l,-(sp)
		sf	(SndDriverAudiosRAM+$252).l
		move.w	#-1,(SndDriverAudiosRAM+$244).l
		stopZ80
		lea	(ym2612_a0).l,a0
		lea	(ym2612_a1).l,a1
		move.b	#$80,d0
		move.b	#$FF,d1
		moveq	#3,d6

-		moveq	#2,d7

-		bsr.w	sub_D04A0
		bsr.w	sub_D04AE
		addq.b	#1,d0
		dbf	d7,-
		addq.b	#1,d0
		dbf	d6,--
		move.b	#$28,d0
		move.b	#0,d1
		moveq	#1,d6

-		moveq	#2,d7

-		btst	#7,(a0)
		bne.s	-
		move.b	d0,(a0)
		move.b	d1,1(a0)
		addq.b	#1,d1
		dbf	d7,-
		addq.b	#1,d1
		dbf	d6,--
		move.b	#$B4,d0
		moveq	#2,d7

-		btst	#7,(a0)
		bne.s	-
		move.b	d0,(a0)
		move.b	#0,1(a0)

-		btst	#7,(a0)
		bne.s	-
		move.b	d0,(a1)
		move.b	#0,1(a1)
		addq.b	#1,d0
		dbf	d7,--
		move.b	#$22,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$27,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$B6,d0
		move.b	#$C0,d1
		bsr.w	sub_D04AE
		move.b	#$90,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$91,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$92,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$94,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$95,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$96,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$98,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$99,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$9A,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$9C,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$9D,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$9E,d0
		move.b	#0,d1
		bsr.w	sub_D04A0
		move.b	#$90,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$91,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$92,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$94,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$95,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$96,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$98,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$99,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$9A,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$9C,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$9D,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.b	#$9E,d0
		move.b	#0,d1
		bsr.w	sub_D04AE
		move.w	#1,(SndDriverAudiosRAM+$45C).l
		move.w	#$8000,(SndDriverAudiosRAM+$45E).l
		move.w	#$80,(SndDriverAudiosRAM+$460).l
		move.w	#1,(SndDriverAudiosRAM+$462).l
		move.w	#$8000,(SndDriverAudiosRAM+$464).l
		move.w	#$80,(SndDriverAudiosRAM+$466).l
		clr.w	(SndDriverAudiosRAM+$25C).l
		clr.w	(SndDriverAudiosRAM+$35C).l
		bsr.w	sub_D1180
		startZ80
		move.b	#$9F,(PSG_input).l
		move.b	#$BF,(PSG_input).l
		move.b	#$DF,(PSG_input).l
		move.b	#$FF,(PSG_input).l
		lea	(SndDriverAudiosRAM).l,a1
		lea	byte_D14FA(pc),a0
		move.w	#$1FF,d7

-		move.b	(a0)+,(a1)+
		dbf	d7,-
		lea	(SndDriverAudiosRAM+$200).l,a1
		moveq	#7,d6

-		lea	dword_D16FA(pc),a0
		move.w	#7,d7

-		move.b	(a0)+,(a1)+
		dbf	d7,-
		dbf	d6,--
		move.b	(sp)+,(SndDriverAudiosRAM+$252).l
		movem.l	(sp)+,d0-a6

locret_D049E:
		rts
; End of function StopSound_Audios

; =============== S U B R O U T I N E =======================================

sub_D04A0:
		btst	#7,(a0)
		bne.s	sub_D04A0
		move.b	d0,(a0)
		move.b	d1,1(a0)
		rts
; End of function sub_D04A0

; =============== S U B R O U T I N E =======================================

sub_D04AE:
		btst	#7,(a1)
		bne.s	sub_D04AE
		move.b	d0,(a1)
		move.b	d1,1(a1)
		rts
; End of function sub_D04AE

; =============== S U B R O U T I N E =======================================

sub_D04BC:
		tst.w	(SndDriverAudiosRAM+$244).l
		bmi.s	locret_D049E
		lea	(SndDriverAudiosRAM+$200).l,a0
		lea	(SndDriverAudiosRAM).l,a3
		lea	(SoundDriverMusicRAM).l,a1
		moveq	#7,d7

loc_D04D8:
		tst.w	2(a0)
		bmi.w	loc_D05C0
		subq.w	#1,(a0)
		bpl.w	loc_D05C0

loc_D04E8:
		move.w	4(a0),d0
		add.w	$16(a1),d0
		move.w	(a1,d0.w),d0
		add.w	2(a0),d0
		lea	(a1,d0.w),a2

loc_D04FC:
		moveq	#0,d1
		move.b	(a2),d1
		cmpi.w	#$F0,d1
		bge.w	loc_D056A
		cmpi.w	#$40,d1
		blt.w	loc_D054A
		cmpi.w	#$80,d1
		blt.w	loc_D05B6
		subi.w	#$80,d1
		add.b	6(a0),d1
		moveq	#0,d0
		moveq	#0,d2
		move.b	2(a2),d0
		move.b	d0,d2
		andi.b	#$F,d0
		lsr.b	#4,d2
		move.b	1(a2),d3
		bsr.w	sub_D06C0
		moveq	#0,d0
		move.b	3(a2),d0
		move.w	d0,(a0)
		addq.w	#4,2(a0)
		bra.w	loc_D05C0
; ---------------------------------------------------------------------------

loc_D054A:
		add.b	6(a0),d1
		moveq	#0,d0
		moveq	#0,d2
		move.b	2(a2),d0
		move.b	d0,d2
		andi.b	#$F,d0
		lsr.b	#4,d2
		move.b	1(a2),d3
		bsr.w	sub_D06C0
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------

loc_D056A:
		subi.b	#$F0,d1
		add.w	d1,d1
		add.w	d1,d1
		jmp	loc_D0576(pc,d1.w)
; ---------------------------------------------------------------------------

loc_D0576:
		bra.w	loc_D0628
; ---------------------------------------------------------------------------
		bra.w	loc_D05CA
; ---------------------------------------------------------------------------
		bra.w	loc_D05F0
; ---------------------------------------------------------------------------
		bra.w	loc_D0618
; ---------------------------------------------------------------------------
		bra.w	loc_D0610
; ---------------------------------------------------------------------------
		bra.w	loc_D05F2
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	loc_D05B6
; ---------------------------------------------------------------------------
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_D05B6:
		addq.w	#4,2(a0)
		addq.l	#4,a2
		bra.w	loc_D04FC
; ---------------------------------------------------------------------------

loc_D05C0:
		lea	8(a0),a0
		dbf	d7,loc_D04D8
		rts
; ---------------------------------------------------------------------------

loc_D05CA:
		tst.b	7(a0)
		beq.s	loc_D05E0
		subq.b	#1,7(a0)
		beq.s	loc_D05B6
		move.w	2(a2),2(a0)
		bra.w	loc_D04E8
; ---------------------------------------------------------------------------

loc_D05E0:
		move.b	1(a2),7(a0)
		move.w	2(a2),2(a0)
		bra.w	loc_D04E8
; ---------------------------------------------------------------------------

loc_D05F0:
		bra.s	loc_D05B6
; ---------------------------------------------------------------------------

loc_D05F2:
		moveq	#0,d0
		move.b	2(a2),d0
		andi.w	#$F,d0
		mulu.w	#$20,d0
		lea	(SndDriverAudiosRAM).l,a3
		lea	(a3,d0.w),a3
		st	2(a3)
		bra.s	loc_D05B6
; End of function sub_D04BC
; ---------------------------------------------------------------------------

loc_D0610:
		move.w	#-1,2(a0)
		bra.s	loc_D05C0
; ---------------------------------------------------------------------------

loc_D0618:
		moveq	#0,d0
		move.b	1(a2),d0
		move.w	d0,(a0)
		addq.w	#4,2(a0)
		bra.s	loc_D05C0
; ---------------------------------------------------------------------------

loc_D0628:
		addi.w	#$10,(SndDriverAudiosRAM+$244).l
		bsr.w	sub_D0638
		bra.w	sub_D04BC

; =============== S U B R O U T I N E =======================================

sub_D0638:
		lea	(SoundDriverMusicRAM).l,a4
		move.w	(SndDriverAudiosRAM+$244).l,d0
		bmi.s	locret_D06A0
		add.w	$18(a4),d0
		lea	(SndDriverAudiosRAM+$200).l,a5
		lea	(a4,d0.w),a4
		cmpi.w	#$EFFE,(a4)
		beq.w	loc_D06A2
		moveq	#7,d7

loc_D065E:
		moveq	#0,d0
		move.b	(a4),d0
		bpl.s	loc_D0674
		cmpi.b	#$80,d0
		beq.w	loc_D0694
		move.w	#-1,2(a5)
		bra.s	loc_D0694
; ---------------------------------------------------------------------------

loc_D0674:
		add.w	d0,d0
		move.w	d0,4(a5)
		clr.w	2(a5)
		move.w	#0,(a5)
		clr.b	7(a5)
		move.b	1(a4),d0
		addi.b	#$1E,d0
		move.b	d0,6(a5)

loc_D0694:
		lea	8(a5),a5
		lea	2(a4),a4
		dbf	d7,loc_D065E

locret_D06A0:
		rts
; ---------------------------------------------------------------------------

loc_D06A2:
		move.w	2(a4),d0
		beq.s	loc_D06B6
		move.w	4(a4),d0
		lsl.w	#4,d0
		move.w	d0,(SndDriverAudiosRAM+$244).l
		bra.s	sub_D0638
; ---------------------------------------------------------------------------

loc_D06B6:
		move.w	#-1,(SndDriverAudiosRAM+$244).l
		rts
; End of function sub_D0638

; =============== S U B R O U T I N E =======================================

sub_D06C0:
		movem.l	d4-d6/a0,-(sp)
		lea	(SndDriverAudiosRAM).l,a0
		andi.l	#$F,d0
		mulu.w	#$20,d0
		lea	(a0,d0.w),a0
		tst.b	d3
		bmi.s	loc_D06E2
		tst.b	9(a0)
		bne.s	loc_D0708

loc_D06E2:
		andi.w	#$7F,d3
		add.b	d3,d3
		move.b	d3,(SndDriverAudiosRAM+$250).l
		moveq	#0,d0
		andi.w	#$FF,d1
		andi.w	#$FF,d2
		moveq	#0,d3
		move.w	(SndDriverAudiosRAM+$250).l,d4
		moveq	#-1,d5
		moveq	#0,d6
		movem.w	d0-d6,(a0)

loc_D0708:
		movem.l	(sp)+,d4-d6/a0
		rts
; End of function sub_D06C0

; =============== S U B R O U T I N E =======================================

sub_D070E:
		lea	(SndDriverAudiosRAM).l,a0
		lea	word_D1354(pc),a3
		lea	(SndDriverAudiosRAM+$35C).l,a6
		lea	(SndDriverAudiosRAM+$25C).l,a5
		lea	loc_D08A6(pc),a4
		bsr.w	sub_D07BA
		bsr.w	sub_D0FFE
		bsr.w	sub_D07BA
		bsr.w	sub_D0FFE
		clr.b	(a6)
		lea	(a5),a6
		lea	loc_D0826(pc),a4
		bsr.w	sub_D07BA
		bsr.w	sub_D0FFE
		bsr.w	sub_D07BA
		bsr.w	sub_D0FFE
		bsr.w	sub_D07BA
		bsr.w	sub_D0FFE
		lea	$20(a0),a0
		bsr.w	sub_D07BA
		lea	$20(a0),a0
		lea	$20(a0),a0
		clr.b	(a6)
		lea	loc_D0926(pc),a4
		lea	(SndDriverAudiosRAM+$45C).l,a3
		bsr.w	sub_D07BA
		bsr.w	sub_D111C
		lea	(SndDriverAudiosRAM+$462).l,a3
		bsr.w	sub_D07BA
		bsr.w	sub_D111C
		lea	$40(a0),a0
		lea	word_D12DC(pc),a3
		lea	loc_D09A6(pc),a4
		bsr.w	sub_D07BA
		bsr.w	sub_D0F02
		bsr.w	sub_D07BA
		bsr.w	sub_D0F02
		bsr.w	sub_D07BA
		bsr.w	sub_D0F02
		bsr.w	sub_D07BA
		bsr.w	sub_D0FA8

locret_D07B8:
		rts
; End of function sub_D070E

; =============== S U B R O U T I N E =======================================

sub_D07BA:
		lea	(SoundDriverMusicRAM).l,a1
		tst.b	$D(a0)
		beq.s	loc_D07DE
		bmi.s	loc_D07CE
		lea	(Mus_Audios0).l,a1

loc_D07CE:
		tst.w	$A(a0)
		bmi.s	loc_D07DE
		subq.w	#1,$A(a0)
		bpl.s	loc_D07DE
		clr.b	9(a0)

loc_D07DE:
		tst.w	6(a0)
		bmi.s	locret_D07B8
		tst.w	(a0)
		beq.s	loc_D07F0
		subq.w	#1,(a0)
		bra.s	locret_D07B8
; ---------------------------------------------------------------------------

loc_D07F0:
		moveq	#0,d0
		move.b	8(a0),d0
		add.w	$14(a1),d0
		move.w	(a1,d0.w),d0
		add.w	6(a0),d0
		lea	(a1,d0.w),a2

loc_D0806:
		moveq	#0,d1
		move.b	(a2),d1
		add.w	d1,d1
		add.w	d1,d1
		jmp	(a4,d1.w)
; End of function sub_D07BA
; ---------------------------------------------------------------------------

loc_D0812:
		clr.b	4(a0)

loc_D0816:
		addq.w	#4,6(a0)
		lea	4(a2),a2
		bra.s	loc_D0806
; ---------------------------------------------------------------------------

loc_D0820:
		addq.w	#4,6(a0)
		rts
; ---------------------------------------------------------------------------

loc_D0826:
		bra.w	loc_D0A2E
; ---------------------------------------------------------------------------
		bra.w	loc_D0D76
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A36
; ---------------------------------------------------------------------------
		bra.w	loc_D0A6A
; ---------------------------------------------------------------------------
		bra.w	loc_D0AB0
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0BD4
; ---------------------------------------------------------------------------
		bra.w	loc_D0BCC
; ---------------------------------------------------------------------------
		bra.w	loc_D0B22
; ---------------------------------------------------------------------------
		bra.w	loc_D0CF0
; ---------------------------------------------------------------------------
		bra.w	loc_D0EE6
; ---------------------------------------------------------------------------
		bra.w	loc_D0B7E
; ---------------------------------------------------------------------------
		bra.w	loc_D0B32
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0B6C
; ---------------------------------------------------------------------------
		bra.w	loc_D0D50
; ---------------------------------------------------------------------------
		bra.w	loc_D0B60
; ---------------------------------------------------------------------------
		bra.w	loc_D0BA6
; ---------------------------------------------------------------------------
		bra.w	loc_D0A42
; ---------------------------------------------------------------------------
		bra.w	loc_D0A62
; ---------------------------------------------------------------------------
		bra.w	loc_D0A9E
; ---------------------------------------------------------------------------
		bra.w	loc_D0BC2
; ---------------------------------------------------------------------------
		bra.w	loc_D0C1E
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0C88
; ---------------------------------------------------------------------------
		bra.w	loc_D0ACC
; ---------------------------------------------------------------------------
		bra.w	loc_D0AE8
; ---------------------------------------------------------------------------
		bra.w	loc_D0B0C
; ---------------------------------------------------------------------------
		bra.w	loc_D0A26
; ---------------------------------------------------------------------------

loc_D08A6:
		bra.w	loc_D0A2E
; ---------------------------------------------------------------------------
		bra.w	loc_D0D88
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A36
; ---------------------------------------------------------------------------
		bra.w	loc_D0A6A
; ---------------------------------------------------------------------------
		bra.w	loc_D0AB0
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0BD4
; ---------------------------------------------------------------------------
		bra.w	loc_D0BCC
; ---------------------------------------------------------------------------
		bra.w	loc_D0B22
; ---------------------------------------------------------------------------
		bra.w	loc_D0CF0
; ---------------------------------------------------------------------------
		bra.w	loc_D0EE6
; ---------------------------------------------------------------------------
		bra.w	loc_D0B7E
; ---------------------------------------------------------------------------
		bra.w	loc_D0B32
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0B6C
; ---------------------------------------------------------------------------
		bra.w	loc_D0D50
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0BA6
; ---------------------------------------------------------------------------
		bra.w	loc_D0A42
; ---------------------------------------------------------------------------
		bra.w	loc_D0A62
; ---------------------------------------------------------------------------
		bra.w	loc_D0A9E
; ---------------------------------------------------------------------------
		bra.w	loc_D0BC2
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0C88
; ---------------------------------------------------------------------------
		bra.w	loc_D0ACC
; ---------------------------------------------------------------------------
		bra.w	loc_D0AE8
; ---------------------------------------------------------------------------
		bra.w	loc_D0B0C
; ---------------------------------------------------------------------------
		bra.w	loc_D0A26
; ---------------------------------------------------------------------------

loc_D0926:
		bra.w	loc_D0A2E
; ---------------------------------------------------------------------------
		bra.w	loc_D0DE2
; ---------------------------------------------------------------------------
		bra.w	loc_D0DCA
; ---------------------------------------------------------------------------
		bra.w	loc_D0DD4
; ---------------------------------------------------------------------------
		bra.w	loc_D0A36
; ---------------------------------------------------------------------------
		bra.w	loc_D0A6A
; ---------------------------------------------------------------------------
		bra.w	loc_D0AB0
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0DAC
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0B22
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0EE6
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0DEC
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A42
; ---------------------------------------------------------------------------
		bra.w	loc_D0A62
; ---------------------------------------------------------------------------
		bra.w	loc_D0A9E
; ---------------------------------------------------------------------------
		bra.w	loc_D0DAC
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0D9A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0ACC
; ---------------------------------------------------------------------------
		bra.w	loc_D0AE8
; ---------------------------------------------------------------------------
		bra.w	loc_D0B0C
; ---------------------------------------------------------------------------
		bra.w	loc_D0A26
; ---------------------------------------------------------------------------

loc_D09A6:
		bra.w	loc_D0A2E
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A36
; ---------------------------------------------------------------------------
		bra.w	loc_D0A6A
; ---------------------------------------------------------------------------
		bra.w	loc_D0AB0
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0E1C
; ---------------------------------------------------------------------------
		bra.w	loc_D0E22
; ---------------------------------------------------------------------------
		bra.w	loc_D0E02
; ---------------------------------------------------------------------------
		bra.w	loc_D0E86
; ---------------------------------------------------------------------------
		bra.w	loc_D0EE6
; ---------------------------------------------------------------------------
		bra.w	loc_D0E52
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0EB8
; ---------------------------------------------------------------------------
		bra.w	loc_D0E7A
; ---------------------------------------------------------------------------
		bra.w	loc_D0D50
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A42
; ---------------------------------------------------------------------------
		bra.w	loc_D0A62
; ---------------------------------------------------------------------------
		bra.w	loc_D0A9E
; ---------------------------------------------------------------------------
		bra.w	loc_D0E16
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0A2A
; ---------------------------------------------------------------------------
		bra.w	loc_D0ACC
; ---------------------------------------------------------------------------
		bra.w	loc_D0AE8
; ---------------------------------------------------------------------------
		bra.w	loc_D0B0C
; ---------------------------------------------------------------------------
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_D0A26:
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0A2A:
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0A2E:
		move.w	#-1,6(a0)
		rts
; ---------------------------------------------------------------------------

loc_D0A36:
		move.w	2(a2),(a0)
		addq.w	#4,6(a0)
		rts
; ---------------------------------------------------------------------------

loc_D0A42:
		tst.b	2(a0)
		bne.w	loc_D0812
		tst.b	4(a0)
		beq.s	loc_D0A5A
		subq.b	#1,4(a0)
		beq.w	loc_D0816
		rts
; ---------------------------------------------------------------------------

loc_D0A5A:
		move.b	3(a2),4(a0)
		rts
; ---------------------------------------------------------------------------

loc_D0A62:
		tst.b	2(a0)
		bne.w	loc_D0812

loc_D0A6A:
		tst.b	4(a0)
		beq.s	loc_D0A88
		subq.b	#1,4(a0)
		beq.w	loc_D0816
		move.w	2(a2),d1
		add.w	d1,d1
		add.w	d1,d1
		move.w	d1,6(a0)
		bra.w	loc_D07F0
; ---------------------------------------------------------------------------

loc_D0A88:
		move.b	1(a2),4(a0)
		move.w	2(a2),d1
		add.w	d1,d1
		add.w	d1,d1
		move.w	d1,6(a0)
		bra.w	loc_D07F0
; ---------------------------------------------------------------------------

loc_D0A9E:
		move.b	8(a0),d0
		cmp.b	$10(a0),d0
		beq.s	loc_D0ABC
		move.b	d0,$10(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0AB0:
		moveq	#0,d0
		move.b	1(a2),d0
		add.b	d0,d0
		move.b	d0,8(a0)

loc_D0ABC:
		move.w	2(a2),d1
		add.w	d1,d1
		add.w	d1,d1
		move.w	d1,6(a0)
		bra.w	loc_D07F0
; ---------------------------------------------------------------------------

loc_D0ACC:
		move.b	2(a2),d0
		andi.b	#$F,d0
		move.b	3(a0),d1
		move.b	5(a0),d2
		move.b	1(a2),d3
		bsr.w	sub_D06C0
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0AE8:
		moveq	#0,d0
		move.b	2(a2),d0
		andi.w	#$F,d0
		mulu.w	#$20,d0
		move.l	a1,-(sp)
		lea	(SndDriverAudiosRAM).l,a1
		lea	(a1,d0.w),a1
		st	2(a1)
		movea.l	(sp)+,a1
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0B0C:
		move.b	1(a2),9(a0)
		move.w	2(a2),$A(a0)
		move.b	#-1,$D(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0B22:
		clr.b	$18(a0)
		clr.w	$1C(a0)
		clr.w	$16(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0B32:
		move.w	2(a2),d1
		move.w	d1,d2
		add.w	d1,d1
		add.w	d1,d1
		subq.w	#1,d2

loc_D0B3E:
		lea	4(a2),a2
		move.b	1(a2),d0
		add.b	$E(a0),d0
		move.b	d0,(a6)+
		move.b	3(a2),(a6)+
		dbf	d2,loc_D0B3E
		lea	4(a2),a2
		add.w	d1,6(a0)
		bra.w	loc_D0806
; ---------------------------------------------------------------------------

loc_D0B60:
		move.b	1(a2),(a6)+
		move.b	3(a2),(a6)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0B6C:
		move.b	1(a2),d0
		add.b	$E(a0),d0
		move.b	d0,(a6)+
		move.b	3(a2),(a6)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0B7E:
		moveq	#0,d1
		moveq	#0,d2
		move.b	5(a0),d2
		move.b	3(a2),d0
		move.b	2(a2),d1
		ext.w	d1
		mulu.w	d1,d2
		lsr.w	#4,d2
		add.b	d2,d0
		move.b	1(a2),d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	d0,(a6)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0BA6:
		move.b	#$B0,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	3(a2),d0
		move.b	1(a2),d1
		lsl.b	#3,d1
		or.b	d1,d0
		move.b	d0,(a6)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0BC2:
		move.w	2(a2),(SndDriverAudiosRAM+$24A).l
		bra.s	loc_D0BEA
; ---------------------------------------------------------------------------

loc_D0BCC:
		moveq	#0,d0
		move.b	1(a2),d0
		bra.s	loc_D0BDE
; ---------------------------------------------------------------------------

loc_D0BD4:
		moveq	#0,d0
		move.b	1(a2),d0
		add.b	3(a0),d0

loc_D0BDE:
		ext.w	d0
		add.w	d0,d0
		move.w	(a3,d0.w),(SndDriverAudiosRAM+$24A).l

loc_D0BEA:
		move.w	2(a2),d0
		add.w	d0,(SndDriverAudiosRAM+$24A).l
		move.w	(SndDriverAudiosRAM+$24A).l,$14(a0)
		move.b	#$A4,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A+1).l,(a6)+
		clr.w	$1C(a0)
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0C1E:
		move.w	#$20,d7
		moveq	#0,d0
		move.b	1(a2),d0
		bsr.w	sub_D0C4A
		add.w	d7,d7
		moveq	#0,d0
		move.b	2(a2),d0
		bsr.w	sub_D0C4A
		addi.w	#$20,d7
		moveq	#0,d0
		move.b	3(a2),d0
		bsr.w	sub_D0C4A
		bra.w	loc_D0816

; =============== S U B R O U T I N E =======================================

sub_D0C4A:
		cmpi.b	#$80,d0
		beq.s	locret_D0C86
		add.b	3(a0),d0
		ext.w	d0
		add.w	d0,d0
		move.w	(a3,d0.w),(SndDriverAudiosRAM+$24A).l
		move.w	(SndDriverAudiosRAM+$24A).l,$14(a0,d7.w)
		move.b	#$A4,d1
		clr.w	$1C(a0,d7.w)
		add.b	$E(a0,d7.w),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A+1).l,(a6)+

locret_D0C86:
		rts
; End of function sub_D0C4A
; ---------------------------------------------------------------------------

loc_D0C88:
		moveq	#0,d0
		move.b	1(a2),d0
		add.b	3(a0),d0
		ext.w	d0
		add.w	d0,d0
		move.l	a1,-(sp)
		lea	byte_D1454(pc),a1
		move.w	(a1,d0.w),d0
		move.w	d0,$14(a0)
		move.w	d0,d1
		andi.w	#$7000,d1
		lsr.w	#1,d1
		andi.w	#$FFF,d0
		move.l	#$606800,d2
		move.w	#$3800,d3
		sub.w	d0,d3
		divu.w	d3,d2
		mulu.w	d2,d0
		lsr.l	#8,d0
		lsr.w	#4,d0
		addi.w	#$269,d0
		or.w	d1,d0
		move.w	d0,(SndDriverAudiosRAM+$24A).l
		move.b	#$A4,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A+1).l,(a6)+
		movea.l	(sp)+,a1
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0CF0:
		moveq	#0,d0
		move.b	1(a2),d0
		add.b	3(a0),d0
		ext.w	d0
		add.w	d0,d0
		move.l	a1,-(sp)
		lea	byte_D1454(pc),a1
		move.w	(a1,d0.w),d0
		move.w	d0,$1E(a0)
		move.w	d0,d1
		andi.w	#$7000,d1
		lsr.w	#1,d1
		andi.w	#$FFF,d0
		move.l	#$606800,d2
		move.w	#$3800,d3
		sub.w	d0,d3
		divu.w	d3,d2
		mulu.w	d2,d0
		lsr.l	#8,d0
		lsr.w	#4,d0
		addi.w	#$269,d0
		or.w	d1,d0
		move.w	2(a2),d0
		move.w	$14(a0),d3
		sub.w	$1E(a0),d3
		bpl.s	loc_D0D42
		neg.w	d3

loc_D0D42:
		mulu.w	d0,d3
		lsr.l	#8,d3
		move.w	d3,$1C(a0)
		movea.l	(sp)+,a1
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0D50:
		moveq	#0,d0
		move.b	1(a2),d0
		bpl.s	loc_D0D60
		andi.b	#$7F,d0
		add.b	3(a0),d0

loc_D0D60:
		ext.w	d0
		add.w	d0,d0
		move.w	(a3,d0.w),d0
		move.w	d0,$14(a0)
		move.w	2(a2),$1C(a0)
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0D76:
		move.b	$F(a0),d0
		or.b	3(a2),d0
		move.b	#$28,(a6)+
		move.b	d0,(a6)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0D88:
		move.b	$F(a0),d0
		or.b	3(a2),d0
		move.b	#$28,(a5)+
		move.b	d0,(a5)+
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0D9A:
		move.w	2(a2),d0
		andi.w	#1,d0
		move.b	d0,(SndDriverAudiosRAM+$253).l
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0DAC:
		move.b	3(a2),(a3)
		moveq	#0,d0
		move.b	3(a2),d0
		add.w	d0,d0
		add.w	d0,d0
		move.w	d0,$14(a0)
		clr.b	$18(a0)
		clr.w	$16(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0DCA:
		move.w	2(a2),2(a3)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0DD4:
		move.w	2(a2),4(a3)
		clr.w	$1C(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0DE2:
		move.b	#1,1(a3)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0DEC:
		move.w	2(a2),$1C(a0)
		move.b	1(a2),$11(a0)
		move.b	1(a2),$13(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0E02:
		clr.b	$12(a0)
		clr.b	$18(a0)
		clr.w	$1C(a0)
		clr.w	$16(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0E16:
		move.w	2(a2),d0
		bra.s	loc_D0E46
; ---------------------------------------------------------------------------

loc_D0E1C:
		move.b	3(a0),d0
		bra.s	loc_D0E24
; ---------------------------------------------------------------------------

loc_D0E22:
		moveq	#0,d0

loc_D0E24:
		add.b	1(a2),d0
		ext.w	d0
		add.w	d0,d0
		move.w	(a3,d0.w),d0
		move.w	d0,d2
		move.w	2(a2),d1
		beq.s	loc_D0E46
		addi.w	#$100,d1
		mulu.w	d1,d0
		lsr.l	#8,d0
		cmp.w	d0,d2
		bne.s	loc_D0E46
		subq.w	#1,d0

loc_D0E46:
		andi.w	#$3FF,d0
		move.w	d0,$14(a0)
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0E52:
		moveq	#0,d1
		moveq	#0,d2
		move.b	3(a2),d0
		move.b	2(a2),d1
		move.b	5(a0),d2
		mulu.w	d1,d2
		lsr.w	#4,d2
		add.b	d2,d0
		andi.b	#$F,d0
		eori.b	#$F,d0
		lsl.b	#4,d0
		move.b	d0,$11(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0E7A:
		move.b	3(a2),(PSG_input).l
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0E86:
		moveq	#0,d0
		move.b	1(a2),d0
		add.b	3(a0),d0
		ext.w	d0
		add.w	d0,d0
		move.w	(a3,d0.w),d0
		move.w	d0,$1E(a0)
		move.w	2(a2),d0
		move.w	$14(a0),d3
		sub.w	$1E(a0),d3
		bpl.s	loc_D0EAC
		neg.w	d3

loc_D0EAC:
		mulu.w	d0,d3
		lsr.l	#8,d3
		move.w	d3,$1C(a0)
		bra.w	loc_D0820
; ---------------------------------------------------------------------------

loc_D0EB8:
		moveq	#0,d1
		moveq	#0,d2
		move.b	3(a2),d0
		move.b	2(a2),d1
		move.b	5(a0),d2
		mulu.w	d1,d2
		lsr.w	#4,d2
		add.b	d2,d0
		andi.b	#$F,d0
		eori.b	#$F,d0
		lsl.b	#4,d0
		move.b	d0,$13(a0)
		move.b	1(a2),$12(a0)
		bra.w	loc_D0816
; ---------------------------------------------------------------------------

loc_D0EE6:
		move.b	3(a2),$18(a0)
		move.b	1(a2),d0
		move.b	d0,$1B(a0)
		lsr.b	#1,d0
		move.b	d0,$1A(a0)
		clr.w	$16(a0)
		bra.w	loc_D0816

; =============== S U B R O U T I N E =======================================

sub_D0F02:
		move.w	$1C(a0),d0
		beq.w	loc_D0F4A
		bmi.w	loc_D0F44
		moveq	#0,d2
		moveq	#0,d1
		move.w	$1E(a0),d2
		move.w	$14(a0),d1
		cmp.w	d2,d1
		blt.s	loc_D0F22
		bgt.s	loc_D0F2E
		bra.s	loc_D0F3A
; ---------------------------------------------------------------------------

loc_D0F22:
		add.w	d0,d1
		cmp.w	d2,d1
		bge.s	loc_D0F3A
		move.w	d1,$14(a0)
		bra.s	loc_D0F6E
; ---------------------------------------------------------------------------

loc_D0F2E:
		sub.w	d0,d1
		cmp.w	d2,d1
		ble.s		loc_D0F3A
		move.w	d1,$14(a0)
		bra.s	loc_D0F6E
; ---------------------------------------------------------------------------

loc_D0F3A:
		clr.w	$1C(a0)
		move.w	d2,$14(a0)
		bra.s	loc_D0F4A
; ---------------------------------------------------------------------------

loc_D0F44:
		lsl.w	#1,d0
		add.w	d0,$14(a0)

loc_D0F4A:
		moveq	#0,d0
		move.b	$18(a0),d0
		beq.s	loc_D0F6E
		ext.w	d0
		add.w	d0,$16(a0)
		subq.b	#1,$1A(a0)
		bne.s	loc_D0F6E
		move.b	$1B(a0),$1A(a0)
		eori.b	#$FF,d0
		addq.b	#1,d0
		move.b	d0,$18(a0)

loc_D0F6E:
		move.w	$14(a0),d0
		move.w	$16(a0),d1
		beq.s	loc_D0F88
		andi.l	#$FFFF,d0
		addi.w	#$800,d1
		muls.w	d1,d0
		lsl.l	#5,d0
		swap	d0

loc_D0F88:
		moveq	#0,d1
		move.b	$F(a0),d1
		move.w	d0,d2
		andi.b	#$F,d0
		or.b	d1,d0
		move.b	d0,(PSG_input).l
		lsr.w	#4,d2
		andi.b	#$3F,d2
		move.b	d2,(PSG_input).l
; End of function sub_D0F02

; =============== S U B R O U T I N E =======================================

sub_D0FA8:
		move.b	$12(a0),d0
		beq.s	loc_D0FE2
		moveq	#0,d2
		moveq	#0,d1
		move.b	$13(a0),d2
		move.b	$11(a0),d1
		cmp.w	d2,d1
		blt.s		loc_D0FC2
		bgt.s	loc_D0FCE
		bra.s	loc_D0FDA
; ---------------------------------------------------------------------------

loc_D0FC2:
		add.b	d0,d1
		cmp.w	d2,d1
		bge.s	loc_D0FDA
		move.b	d1,$11(a0)
		bra.s	loc_D0FE2
; ---------------------------------------------------------------------------

loc_D0FCE:
		sub.b	d0,d1
		cmp.w	d2,d1
		ble.s		loc_D0FDA
		move.b	d1,$11(a0)
		bra.s	loc_D0FE2
; ---------------------------------------------------------------------------

loc_D0FDA:
		clr.b	$12(a0)
		move.b	d2,$11(a0)

loc_D0FE2:
		move.b	$11(a0),d0
		lsr.b	#4,d0
		move.b	$F(a0),d1
		ori.b	#$10,d1
		or.b	d1,d0
		move.b	d0,(PSG_input).l
		lea	$20(a0),a0
		rts
; End of function sub_D0FA8

; =============== S U B R O U T I N E =======================================

sub_D0FFE:
		move.w	$1C(a0),d0
		beq.w	loc_D10B8
		bmi.w	loc_D108A
		moveq	#0,d2
		moveq	#0,d1
		move.w	$1E(a0),d2
		move.w	$14(a0),d1
		cmp.w	d2,d1
		blt.s		loc_D101E
		bgt.s	loc_D102A
		bra.s	loc_D1036
; ---------------------------------------------------------------------------

loc_D101E:
		add.w	d0,d1
		cmp.w	d2,d1
		bge.s	loc_D1036
		move.w	d1,$14(a0)
		bra.s	loc_D103E
; ---------------------------------------------------------------------------

loc_D102A:
		sub.w	d0,d1
		cmp.w	d2,d1
		ble.s		loc_D1036
		move.w	d1,$14(a0)
		bra.s	loc_D103E
; ---------------------------------------------------------------------------

loc_D1036:
		clr.w	$1C(a0)
		move.w	d2,$14(a0)

loc_D103E:
		move.w	$14(a0),d0
		andi.w	#$7000,d1
		lsr.w	#1,d1
		andi.w	#$FFF,d0
		move.l	#$606800,d2
		move.w	#$3800,d3
		sub.w	d0,d3
		divu.w	d3,d2
		mulu.w	d2,d0
		lsr.l	#8,d0
		lsr.w	#4,d0
		addi.w	#$269,d0
		or.w	d1,d0
		move.w	d0,(SndDriverAudiosRAM+$24A).l
		move.b	#$A4,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24B).l,(a6)+
		bra.w	loc_D1116
; ---------------------------------------------------------------------------

loc_D108A:
		lsl.w	#1,d0
		add.w	d0,$14(a0)
		tst.b	$18(a0)
		bne.s	loc_D10B8
		move.w	$14(a0),(SndDriverAudiosRAM+$24A).l
		move.b	#$A4,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24B).l,(a6)+

loc_D10B8:
		moveq	#0,d0
		move.b	$18(a0),d0
		beq.s	loc_D1116
		ext.w	d0
		add.w	d0,$16(a0)
		subq.b	#1,$1A(a0)
		bne.s	loc_D10DC
		move.b	$1B(a0),$1A(a0)
		eori.b	#$FF,d0
		addq.b	#1,d0
		move.b	d0,$18(a0)

loc_D10DC:
		move.w	$14(a0),d0
		move.w	$16(a0),d1
		beq.s	loc_D10F6
		andi.l	#$FFFF,d0
		addi.w	#$800,d1
		muls.w	d1,d0
		lsl.l	#5,d0
		swap	d0

loc_D10F6:
		move.w	d0,(SndDriverAudiosRAM+$24A).l
		move.b	#$A4,d1
		add.b	$E(a0),d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24A).l,(a6)+
		subq.b	#4,d1
		move.b	d1,(a6)+
		move.b	(SndDriverAudiosRAM+$24B).l,(a6)+

loc_D1116:
		lea	$20(a0),a0
		rts
; End of function sub_D0FFE

; =============== S U B R O U T I N E =======================================

sub_D111C:
		move.w	$1C(a0),d0
		beq.w	loc_D114A
		add.w	d0,2(a3)
		move.w	2(a3),d0
		cmpi.w	#$8000,d0
		bcc.s	loc_D113A
		andi.w	#$1FFF,d0
		move.w	d0,2(a3)

loc_D113A:
		subq.b	#1,$11(a0)
		bne.s	loc_D114A
		move.b	$13(a0),$11(a0)
		neg.w	$1C(a0)

loc_D114A:
		moveq	#0,d0
		move.b	$18(a0),d0
		beq.s	loc_D117A
		ext.w	d0
		add.w	d0,$16(a0)
		subq.b	#1,$1A(a0)
		bne.s	loc_D116E
		move.b	$1B(a0),$1A(a0)
		eori.b	#$FF,d0
		addq.b	#1,d0
		move.b	d0,$18(a0)

loc_D116E:
		move.w	$14(a0),d0
		add.w	$16(a0),d0
		lsr.w	#2,d0
		move.b	d0,(a3)

loc_D117A:
		lea	$20(a0),a0
		rts
; End of function sub_D111C

; =============== S U B R O U T I N E =======================================

sub_D1180:
		lea	(SndDriverAudiosRAM+$25C).l,a0
		lea	(Z80_RAM+$200).l,a1

loc_D118C:
		move.b	(a0)+,(a1)+
		beq.s	loc_D1194
		move.b	(a0)+,(a1)+
		bra.s	loc_D118C
; ---------------------------------------------------------------------------

loc_D1194:
		lea	(SndDriverAudiosRAM+$35C).l,a0
		lea	(Z80_RAM+$300).l,a1

loc_D11A0:
		move.b	(a0)+,(a1)+
		beq.s	loc_D11AA
		move.b	(a0)+,(a1)+
		bra.s	loc_D11A0
; ---------------------------------------------------------------------------

loc_D11AA:
		lea	(SndDriverAudiosRAM+$45C).l,a0
		lea	(Z80_RAM+$400).l,a1
		move.b	(a0),(a1)
		move.b	1(a0),1(a1)
		move.b	2(a0),3(a1)
		move.b	3(a0),2(a1)
		move.b	4(a0),5(a1)
		move.b	5(a0),4(a1)
		move.b	6(a0),6(a1)
		move.b	7(a0),7(a1)
		move.b	8(a0),9(a1)
		move.b	9(a0),8(a1)
		move.b	$A(a0),$B(a1)
		move.b	$B(a0),$A(a1)
		move.b	(SndDriverAudiosRAM+$253).l,$C(a1)
		move.b	#1,$D(a1)
		clr.b	1(a0)
		clr.b	7(a0)
		rts
; End of function sub_D1180

; =============== S U B R O U T I N E =======================================

dword_D16FA:	dc.b 0, 0, $FF, $FF, 0, 0, 0, 0
word_D12DC:	binclude "Sound/Audio Slave/Unk(D12DC).bin"
	even
word_D1354:		binclude "Sound/Audio Slave/Unk(D1354).bin"
	even
byte_D1454:		binclude "Sound/Audio Slave/Unk(D1454).bin"
	even
byte_D14FA:		binclude "Sound/Audio Slave/Unk(D14FA).bin"
	even
Z80DACDrv_Audios:		binclude "Sound/Audio Slave/DAC Driver (Z80).bin"
	even
MusIndex_Audios: offsetTable
		offsetTableEntry.w Mus_Audios0	; 0
		offsetTableEntry.w Mus_Audios1	; 1
		offsetTableEntry.w Mus_Audios2	; 2
		offsetTableEntry.w Mus_Audios3	; 3
		offsetTableEntry.w Mus_Audios4	; 4
		offsetTableEntry.w Mus_Audios5	; 5
Mus_Audios0:	binclude "Sound/Audio Slave/Music/Mega Turrican/0.bin"
	even
Mus_Audios1:	binclude "Sound/Audio Slave/Music/Mega Turrican/1.bin"
	even
Mus_Audios2:	binclude "Sound/Audio Slave/Music/Mega Turrican/2.bin"
	even
Mus_Audios3:	binclude "Sound/Audio Slave/Music/Mega Turrican/3.bin"
	even
Mus_Audios4:	binclude "Sound/Audio Slave/Music/Mega Turrican/4.bin"
	even
Mus_Audios5:	binclude "Sound/Audio Slave/Music/Mega Turrican/5.bin"
	even
		align $8000
   if MOMPASS=1
		message "Audios Wave Slave MD Samples Data ROM offset is $\{*}"
    endif
				binclude "Sound/Audio Slave/Samples1.bin"
   if MOMPASS=1
		message "Audios Wave Slave MD Samples Data ROM offset is $\{*}"
    endif
				binclude "Sound/Audio Slave/Samples2.bin"