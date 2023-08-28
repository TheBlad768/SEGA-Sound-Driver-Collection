; ---------------------------------------------------------------------------
; Krisalis/Shaun Hollingworth(1994).
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Shaun Hollingworth ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverShaunRAM	= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

SndShaunDrvInit:
		movem.l	d0-a6,-(sp)
		lea	(SndDriverShaunRAM+$1A).l,a0
		lea	(SndDriverShaunRAM+$C0).l,a1
		move.w	#$A5,d7
-		clr.b	(a0)+
		dbf	d7,-
		nop
		bsr.s	SndZ80ShaunDrvInit
		move.w	#$400,d7
		dbf	d7,*
		bsr.w	sub_98A10
		clr.w	(SndDriverShaunRAM+$20).l
		btst	#6,(Graphics_flags).w
		bne.s	+
		addq.w	#1,(SndDriverShaunRAM+$20).l
+		moveq	#0,d0
		move.b	(Z80_RAM+5).l,d0
		rol.l	#8,d0
		move.b	(Z80_RAM+4).l,d0
		addi.l	#Z80_RAM,d0
		move.l	d0,(SndDriverShaunRAM+$1A).l
		bsr.w	sub_98A30
		bsr.w	sub_98A40
		movem.l	(sp)+,d0-a6
		rts
; End of function SndShaunDrvInit

; =============== S U B R O U T I N E =======================================

SndZ80ShaunStopZ80:
		stopZ80a
		resetZ80a
		moveq	#9,d0
-		nop
		dbf	d0,-
		resetZ80
		rts
; End of function SndZ80ShaunStopZ80

; =============== S U B R O U T I N E =======================================

SndZ80ShaunDrvInit:
		bsr.s	SndZ80ShaunStopZ80
		clearZ80RAM
		clearM68KRAM
		lea	(Z80_RAM).l,a0
		lea	Z80ShaunDriver(pc),a1
		moveq	#5,d7
-		move.b	(a1)+,(a0)+
		dbf	d7,-
		moveq	#0,d0
		move.b	d0,(a0)+
		lsr.w	#8,d0
		move.b	d0,(a0)+
		moveq	#$14,d7
-		move.b	(a1)+,(a0)+
		dbf	d7,-
		bsr.s	SndZ80ShaunStartZ80
-		moveq	#$63,d7
		dbf	d7,*
		stopZ80
		move.b	(Z80_RAM+$1000).l,d0
		bne.s	loc_989AC
		startZ80
		bra.s	--
; ---------------------------------------------------------------------------

loc_989AC:
		bsr.w	SndZ80ShaunStopZ80
		lea	Z80ShaunDriver2(pc),a0
		lea	(Z80_RAM+$C00).l,a1
		jsr	(Kos_Decomp).l
		move.b	#$F3,(Z80_RAM).l
		move.b	#$C3,(Z80_RAM+1).l
		move.b	#0,(Z80_RAM+2).l
		move.b	#$C,(Z80_RAM+3).l
		bsr.s	SndZ80ShaunStartZ80
		sf	(SndDriverShaunRAM+$B8).l
		rts
; End of function SndZ80ShaunDrvInit

; =============== S U B R O U T I N E =======================================

SndZ80ShaunStartZ80:
		resetZ80a
		startZ80
		moveq	#9,d0
-		nop
		dbf	d0,-
		resetZ80
		rts
; End of function SndZ80ShaunStartZ80

; =============== S U B R O U T I N E =======================================

PlayShaunSound:
		disableInts2
		addq.w	#1,d0
		move.w	d0,(SndDriverShaunRAM+$28).l
		st	(SndDriverShaunRAM+$BA).l
		sf	(SndDriverShaunRAM+$8C).l
		clr.w	(SndDriverShaunRAM+$24).l
		clr.w	(SndDriverShaunRAM+$26).l
		sf	(SndDriverShaunRAM+$48).l
		enableInts2
		rts
; End of function PlayShaunSound

; =============== S U B R O U T I N E =======================================

UpdateShaunMusic:
		btst	#0,(Z80_bus_request).l
		move	sr,-(sp)
		bne.s	loc_981E2
		startZ80

loc_981E2:
		bsr.s	sub_981FC
		move	(sp)+,sr
		bne.s	locret_981FA
		stopZ80

locret_981FA:
		rts
; End of function UpdateShaunMusic

; =============== S U B R O U T I N E =======================================

sub_981FC:
		tst.w	(SndDriverShaunRAM+$20).l
		beq.s	loc_9821C
		addq.w	#1,(SndDriverShaunRAM+$22).l
		cmpi.w	#6,(SndDriverShaunRAM+$22).l
		bcs.s	loc_9821C
		clr.w	(SndDriverShaunRAM+$22).l
		rts
; ---------------------------------------------------------------------------

loc_9821C:
		tst.b	(SndDriverShaunRAM+$48).l
		bne.s	locret_98266
		tst.w	(SndDriverShaunRAM+$24).l
		beq.s	loc_9829E
		movem.l	d0-a6,-(sp)
		move.w	(SndDriverShaunRAM+$24).l,d0
		subq.w	#1,d0
		beq.s	loc_98268
		bsr.w	sub_98D24
		move.b	#7,(a6)
		move.w	(SndDriverShaunRAM+$BC).l,d0
		move.b	d0,1(a6)
		bsr.w	sub_98A30
		sf	(SndDriverShaunRAM+$48).l
		clr.w	(SndDriverShaunRAM+$24).l
		movem.l	(sp)+,d0-a6

locret_98266:
		rts
; ---------------------------------------------------------------------------

loc_98268:
		st	(SndDriverShaunRAM+$48).l
		clr.w	(SndDriverShaunRAM+$24).l
		bsr.w	sub_98D24
		move.b	1(a6),d0
		move.w	d0,(SndDriverShaunRAM+$BC).l
		clr.b	1(a6)
		bsr.w	sub_98A92
		bsr.w	sub_98A30
		clr.w	(SndDriverShaunRAM+$30).l
		bsr.w	sub_98A30
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

loc_9829E:
		movem.l	d0-a6,-(sp)
		st	(SndDriverShaunRAM+$48).l
		move.w	(SndDriverShaunRAM+$52).l,d0
		beq.s	loc_98300
		subq.w	#1,d0
		cmpi.w	#$FF,d0
		bne.s	loc_982BA
		moveq	#0,d0

loc_982BA:
		move.w	d0,(SndDriverShaunRAM+$40).l
		clr.w	(SndDriverShaunRAM+$52).l
		clr.w	(SndDriverShaunRAM+$50).l
		clr.w	(SndDriverShaunRAM+$42).l
		clr.w	(SndDriverShaunRAM+$4E).l
		bsr.w	sub_986F2
		st	(SndDriverShaunRAM+$4C).l
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		bsr.w	sub_98A10
		move.b	(SndDriverShaunRAM+$B6).l,$3C(a6)
		st	1(a6)
		sf	$F(a6)
		bsr.w	sub_98A30

loc_98300:
		move.w	(SndDriverShaunRAM+$28).l,d0
		beq.s	loc_9835E
		subq.w	#1,d0
		move.w	d0,(SndDriverShaunRAM+$2C).l
		clr.w	(SndDriverShaunRAM+$2E).l
		move.w	#6,(SndDriverShaunRAM+$46).l
		bsr.w	sub_986A8
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		bsr.w	sub_98A10
		sf	1(a6)
		sf	(SndDriverShaunRAM+$8C).l
		sf	$3A(a6)
		bsr.w	sub_98A30
		bsr.w	sub_98A84
		bsr.w	sub_98A92
		bsr.w	sub_986A8
		clr.w	(SndDriverShaunRAM+$28).l
		bsr.w	sub_98A10
		sf	$E(a6)
		bsr.w	sub_98A30
		bra.s	loc_983CE
; ---------------------------------------------------------------------------

loc_9835E:
		move.w	(SndDriverShaunRAM+$30).l,d0
		beq.s	loc_9836A
		bsr.w	sub_9870E

loc_9836A:
		tst.w	(SndDriverShaunRAM+$38).l
		beq.s	loc_98376
		bsr.w	sub_988B2

loc_98376:
		addq.w	#1,(SndDriverShaunRAM+$2A).l
		move.w	(SndDriverShaunRAM+$46).l,d0
		cmp.w	(SndDriverShaunRAM+$2A).l,d0
		bcc.s	loc_983BE
		clr.w	(SndDriverShaunRAM+$2A).l
		bsr.w	sub_98506
		addq.w	#1,(SndDriverShaunRAM+$2E).l
		cmpi.w	#$40,(SndDriverShaunRAM+$2E).l
		bcs.s	loc_983B4
		clr.w	(SndDriverShaunRAM+$2E).l
		addq.w	#1,(SndDriverShaunRAM+$2C).l
		bsr.w	sub_986A8

loc_983B4:
		bsr.s	sub_983DA
		bsr.w	sub_98AFA
		bra.s	loc_983CE
; ---------------------------------------------------------------------------

loc_983BE:
		bsr.s	sub_983EE
		beq.s	loc_983CA
		bsr.w	sub_98AFA
		bra.s	loc_983CE
; ---------------------------------------------------------------------------

loc_983CA:
		bsr.w	sub_98AA0

loc_983CE:
		sf	(SndDriverShaunRAM+$48).l
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_981FC

; =============== S U B R O U T I N E =======================================

sub_983DA:
		bsr.s	sub_98416
		beq.s	locret_983EA

loc_983E0:
		move.w	(SndDriverShaunRAM+$A0).l,(SndDriverShaunRAM+$88).l
		moveq	#1,d0

locret_983EA:
		rts
; End of function sub_983DA

; =============== S U B R O U T I N E =======================================

sub_983EE:
		bsr.s	sub_98416
		beq.s	locret_983EA
		clr.w	(SndDriverShaunRAM+$58).l
		clr.w	(SndDriverShaunRAM+$64).l
		clr.w	(SndDriverShaunRAM+$70).l
		clr.w	(SndDriverShaunRAM+$7C).l
		clr.w	(SndDriverShaunRAM+$94).l
		bra.s	loc_983E0

; =============== S U B R O U T I N E =======================================

sub_98416:
		lea	(SndDriverShaunRAM+$9C).l,a5
		lea	(SndDriverShaunRAM+$84).l,a3
		tst.w	(SndDriverShaunRAM+$BA).l
		bne.w	loc_984C6
		tst.w	(SndDriverShaunRAM+$4C).l
		beq.s	locret_983EA
		clr.w	4(a5)
		move.b	5(a3),d1
		lsr.b	#1,d1
		cmpi.b	#$7C,d1
		bcc.s	loc_9844A
		clr.w	4(a3)

loc_9844A:
		st	(SndDriverShaunRAM+$4A).l
		st	$A(a3)
		move.w	(SndDriverShaunRAM+$40).l,d0
		move.w	(SndDriverShaunRAM+$42).l,(SndDriverShaunRAM+$44).l
		move.l	d0,-(sp)
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a0
		move.b	(a0,d0.w),d0
		lsl.w	#3,d0
		lea	SndShaunOtherMusicData_Index(pc),a0		; Load Music Data
		movea.l	(a0,d0.w),a0
		move.l	(sp)+,d0
		move.w	#0,d7
		addq.w	#1,(SndDriverShaunRAM+$4E).l
		move.w	(SndDriverShaunRAM+$50).l,d4
		cmp.w	(SndDriverShaunRAM+$4E).l,d4
		bcc.s	loc_984FC
		clr.w	(SndDriverShaunRAM+$4E).l
		bsr.w	sub_98526
		addq.w	#1,(SndDriverShaunRAM+$42).l
		cmpi.w	#$40,(SndDriverShaunRAM+$42).l
		bcs.s	loc_984F2
		bsr.w	sub_986F2
		clr.w	(SndDriverShaunRAM+$42).l
		addq.w	#1,(SndDriverShaunRAM+$40).l
		tst.w	(SndDriverShaunRAM+$40).l
		bne.s	loc_984F2
		st	8(a3)

loc_984C6:
		sf	(SndDriverShaunRAM+$BA).l
		sf	$A(a3)
		clr.w	(SndDriverShaunRAM+$4C).l
		bsr.w	sub_98A10
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		sf	1(a6)
		bsr.w	sub_98A30
		moveq	#0,d0
		sf	(SndDriverShaunRAM+$4A).l
		rts
; ---------------------------------------------------------------------------

loc_984F2:
		sf	(SndDriverShaunRAM+$4A).l
		moveq	#1,d0
		rts
; ---------------------------------------------------------------------------

loc_984FC:
		sf	(SndDriverShaunRAM+$4A).l
		moveq	#0,d0

locret_98504:
		rts
; End of function sub_98416

; =============== S U B R O U T I N E =======================================

sub_98506:
		move.w	(SndDriverShaunRAM+$2C).l,d0
		move.w	(SndDriverShaunRAM+$2E).l,(SndDriverShaunRAM+$44).l
		lea	(SndDriverShaunRAM+$54).l,a5
		move.w	#5,d7
		move.l	d0,-(sp)
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a0
		move.b	(a0,d0.w),d0
		add.w	d0,d0
		add.w	d0,d0
		lea	SndShaunOtherMusicData3_Index(pc),a0	; Load Music Data
		movea.l	(a0,d0.w),a0
		move.l	(sp)+,d0

sub_98526:
		add.w	d0,d0
		andi.l	#$FFFF,d0
		mulu.w	#6,d0
		adda.w	d0,a0

-		move.w	(a0)+,d0
		bsr.s	sub_98558
		lea	$C(a5),a5
		dbf	d7,-
		rts
; End of function sub_98526

; =============== S U B R O U T I N E =======================================

sub_98558:
		tst.w	2(a5)
		beq.s	loc_98568
		subq.w	#1,2(a5)
		addq.w	#1,(a5)
		rts
; ---------------------------------------------------------------------------

loc_98568:
		add.w	d0,d0
		moveq	#0,d1
		move.w	(Driver_SaveLine_Count).w,d1
		lea	SndShaunBankStart_Index(pc),a1
		move.b	(a1,d1.w),d1
		lsl.w	#2,d1
		lea	SndShaunMusicData_Index(pc),a1	; Load Music Data
		movea.l	(a1,d1.w),a1
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	(SndDriverShaunRAM+$44).l,d0
		sub.w	(a5),d0
		add.w	d0,d0
		adda.w	d0,a1
		moveq	#0,d0
		moveq	#0,d1
		move.b	(a1)+,d0
		move.b	(a1)+,d1
		cmpi.b	#-1,d1
		bne.s	loc_9859C
		tst.b	d0
		beq.s	loc_98598
		move.w	d0,2(a5)

loc_98598:
		moveq	#0,d0
		moveq	#0,d1

loc_9859C:
		tst.w	$A(a5)
		bne.s	loc_985DC
		tst.w	8(a5)
		beq.s	loc_985D4
		move.b	d1,d2
		lsr.b	#1,d2
		cmpi.b	#$7C,d2
		bcc.s	loc_985D4
		moveq	#0,d3
		move.b	d0,d2
		move.b	d1,d3
		lsl.w	#8,d3
		or.b	d2,d3
		andi.w	#$1F0,d3
		bne.s	loc_985D0
		moveq	#0,d2
		move.b	6(a5),d2
		lsl.w	#1,d2
		or.b	d2,d0
		lsr.w	#8,d2
		or.b	d2,d1

loc_985D0:
		clr.w	8(a5)

loc_985D4:
		move.b	d0,4(a5)
		move.b	d1,5(a5)

loc_985DC:
		move.b	d1,d2
		lsr.b	#1,d1
		cmpi.b	#$7C,d1
		bcc.s	loc_985F6
		roxr.b	#1,d2
		roxr.b	#1,d0
		andi.b	#$F8,d0
		beq.s	locret_985F4
		move.b	d0,6(a5)

locret_985F4:
		rts
; ---------------------------------------------------------------------------

loc_985F6:
		cmpi.b	#$7C,d1
		beq.s	locret_985F4
		cmpi.b	#$7D,d1
		beq.s	loc_98650
		cmpi.b	#$7E,d1
		beq.s	loc_98626
		tst.w	(SndDriverShaunRAM+$4A).l
		beq.s	loc_9861C
		move.w	#$3F,(SndDriverShaunRAM+$42).l
		rts
; ---------------------------------------------------------------------------

loc_9861C:
		move.w	#$3F,(SndDriverShaunRAM+$2E).l
		rts
; ---------------------------------------------------------------------------

loc_98626:
		subq.w	#1,d0
		tst.w	(SndDriverShaunRAM+$4A).l
		beq.s	loc_98640
		move.w	#$3F,(SndDriverShaunRAM+$42).l
		move.w	d0,(SndDriverShaunRAM+$40).l
		rts
; ---------------------------------------------------------------------------

loc_98640:
		move.w	d0,(SndDriverShaunRAM+$2C).l
		move.w	#$3F,(SndDriverShaunRAM+$2E).l
		rts
; ---------------------------------------------------------------------------

loc_98650:
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		bsr.w	sub_98A10
		tst.w	(SndDriverShaunRAM+$4A).l
		beq.s	loc_98686
		clr.b	$F(a6)
		btst	#7,d0
		beq.s	loc_98670
		st	$F(a6)

loc_98670:
		bsr.w	sub_98A30
		andi.w	#$7F,d0
		move.w	d0,(SndDriverShaunRAM+$50).l
		move.w	d0,(SndDriverShaunRAM+$4E).l
		rts
; ---------------------------------------------------------------------------

loc_98686:
		clr.b	$E(a6)
		btst	#7,d0
		sf	$E(a6)
		beq.s	loc_98698
		st	$E(a6)

loc_98698:
		bsr.w	sub_98A30
		andi.w	#$7F,d0
		move.w	d0,(SndDriverShaunRAM+$46).l

locret_986A6:
		rts
; End of function sub_98558

; =============== S U B R O U T I N E =======================================

sub_986A8:
		clr.w	(SndDriverShaunRAM+$56).l
		clr.w	(SndDriverShaunRAM+$54).l
		clr.w	(SndDriverShaunRAM+$62).l
		clr.w	(SndDriverShaunRAM+$60).l
		clr.w	(SndDriverShaunRAM+$6E).l
		clr.w	(SndDriverShaunRAM+$6C).l
		clr.w	(SndDriverShaunRAM+$7A).l
		clr.w	(SndDriverShaunRAM+$78).l
		clr.w	(SndDriverShaunRAM+$86).l
		clr.w	(SndDriverShaunRAM+$84).l
		clr.w	(SndDriverShaunRAM+$92).l
		clr.w	(SndDriverShaunRAM+$90).l
		rts
; End of function sub_986A8

; =============== S U B R O U T I N E =======================================

sub_986F2:
		clr.w	(SndDriverShaunRAM+$9E).l
		clr.w	(SndDriverShaunRAM+$9C).l
		rts
; End of function sub_986F2

; =============== S U B R O U T I N E =======================================

sub_98700:
		clr.w	(SndDriverShaunRAM+$AA).l
		clr.w	(SndDriverShaunRAM+$A8).l
		rts
; End of function sub_98700

; =============== S U B R O U T I N E =======================================

sub_9870E:
		subq.w	#1,d0
		lea	(SndDriverShaunRAM+$A8).l,a5
		move.l	d0,-(sp)
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a0
		move.b	(a0,d0.w),d0
		lsl.w	#3,d0
		lea	SndShaunOtherMusicData2_Index(pc),a0	; Load Music Data
		movea.l	(a0,d0.w),a0
		move.l	(sp)+,d0
		addq.w	#1,(SndDriverShaunRAM+$34).l
		move.w	(SndDriverShaunRAM+$36).l,d4
		cmp.w	(SndDriverShaunRAM+$34).l,d4
		bcc.s	locret_987C8
		clr.w	(SndDriverShaunRAM+$34).l
		bsr.w	sub_9879A
		addq.w	#1,(SndDriverShaunRAM+$32).l
		cmpi.w	#$40,(SndDriverShaunRAM+$32).l
		bcs.s	locret_987C8
		clr.w	(SndDriverShaunRAM+$AA).l
		clr.w	(SndDriverShaunRAM+$A8).l
		bsr.w	sub_98700
		clr.w	(SndDriverShaunRAM+$32).l
		addq.w	#1,(SndDriverShaunRAM+$30).l
		tst.w	(SndDriverShaunRAM+$30).l
		bne.s	locret_987C8
		bsr.w	sub_98A10
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		clr.b	$38(a6)
		bra.w	sub_98A30
; End of function sub_9870E

; =============== S U B R O U T I N E =======================================

sub_9879A:
		add.w	d0,d0
		mulu.w	#6,d0
		adda.w	d0,a0
		move.w	(a0)+,d0
		tst.w	2(a5)
		beq.s	loc_987CA
		subq.w	#1,2(a5)
		addq.w	#1,(a5)

locret_987C8:
		rts
; ---------------------------------------------------------------------------

loc_987CA:
		add.w	d0,d0
		moveq	#0,d1
		move.w	(Driver_SaveLine_Count).w,d1
		lea	SndShaunBankStart_Index(pc),a1
		move.b	(a1,d1.w),d1
		lsl.w	#2,d1
		lea	SndShaunMusicData_Index(pc),a1	; Load Music Data
		movea.l	(a1,d1.w),a1
		move.w	(a1,d0.w),d0
		lea	(a1,d0.w),a1
		move.w	(SndDriverShaunRAM+$32).l,d0
		sub.w	(a5),d0
		add.w	d0,d0
		adda.w	d0,a1
		moveq	#0,d0
		moveq	#0,d1
		move.b	(a1)+,d0
		move.b	(a1)+,d1
		cmpi.b	#-1,d1
		bne.s	loc_987FE
		tst.b	d0
		beq.s	loc_987FA
		move.w	d0,2(a5)

loc_987FA:
		moveq	#0,d0
		moveq	#0,d1

loc_987FE:
		move.b	d1,d2
		lsr.b	#1,d1
		cmpi.b	#$7C,d1
		bcc.s	loc_98836
		subi.b	#$6D,d1
		bcs.s	locret_98852
		cmpi.b	#8,d1
		bcc.s	locret_98852
		move.l	d0,-(sp)
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a1
		move.b	(a1,d0.w),d0
		add.w	d0,d0
		add.w	d0,d0
		lea	SndShaunSamplesPointer_Index(pc),a1	; Load Samples Pointers
		movea.l	(a1,d0.w),a1
		move.l	(sp)+,d0
		andi.w	#$FF,d1
		add.w	d1,d1
		add.w	d1,d1
		adda.w	d1,a1
		move.w	d0,d1
		move.w	(a1),d0
		ori.w	#$8000,d0
		move.w	2(a1),d2
		bra.w	sub_988DE
; ---------------------------------------------------------------------------

loc_98836:
		cmpi.b	#$7C,d1
		beq.s	locret_98852
		cmpi.b	#$7D,d1
		beq.s	loc_98866
		cmpi.b	#$7E,d1
		beq.s	loc_98854
		move.w	#$3F,(SndDriverShaunRAM+$32).l

locret_98852:
		rts
; ---------------------------------------------------------------------------

loc_98854:
		subq.w	#1,d0
		move.w	#$3F,(SndDriverShaunRAM+$32).l
		move.w	d0,(SndDriverShaunRAM+$30).l
		rts
; ---------------------------------------------------------------------------

loc_98866:
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		bsr.w	sub_98A10
		andi.w	#$7F,d0
		move.w	d0,(SndDriverShaunRAM+$36).l
		move.w	d0,(SndDriverShaunRAM+$34).l
		rts
; End of function sub_9879A

; =============== S U B R O U T I N E =======================================

sub_988B2:
		clr.w	(SndDriverShaunRAM+$30).l
		clr.w	(SndDriverShaunRAM+$32).l
		move.w	(SndDriverShaunRAM+$38).l,d1
		move.w	(SndDriverShaunRAM+$3C).l,d0
		move.w	(SndDriverShaunRAM+$3A).l,d2
		move.w	(SndDriverShaunRAM+$3E).l,d3
		clr.w	(SndDriverShaunRAM+$38).l
		bra.s	loc_988E2
; End of function sub_988B2

; =============== S U B R O U T I N E =======================================

sub_988DE:
		move.b	#4,d3

loc_988E2:
		tst.w	(SndDriverShaunRAM+$26).l
		bne.s	locret_98A2E
		movea.l	(SndDriverShaunRAM+$1A).l,a6
		bsr.s	sub_98A10
		move.b	d0,$10(a6)
		lsr.w	#8,d0
		move.b	d0,$11(a6)
		move.b	d1,$12(a6)
		move.b	d2,$14(a6)
		lsr.w	#8,d2
		move.b	d2,$15(a6)
		st	$16(a6)
		move.b	d3,$42(a6)
		bra.s	sub_98A30
; End of function sub_988DE

; =============== S U B R O U T I N E =======================================

sub_98A10:
		move.b	#1,(Z80_bus_request).l
		move.l	d0,-(sp)
-		move.b	(Z80_bus_request).l,d0
		andi.b	#1,d0
		bne.s	-
		st	(SndDriverShaunRAM+$B8).l
		move.l	(sp)+,d0

locret_98A2E:
		rts
; End of function sub_98A10

; =============== S U B R O U T I N E =======================================

sub_98A30:
		startZ80
		sf	(SndDriverShaunRAM+$B8).l
		rts
; End of function sub_98A30

; =============== S U B R O U T I N E =======================================

sub_98A40:
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a1
		move.b	(a1,d0.w),d0
		add.w	d0,d0
		add.w	d0,d0
		movea.l	SndShaunInstruments_Index(pc,d0.w),a1				; Load Instruments
		bsr.w	sub_98D24
		lea	(Z80_RAM+$400).l,a0
		move.w	#$7FF,d7
-		move.b	(a1)+,(a0)+
		dbf	d7,-
		move.b	#2,(a6)
		lea	$18(a6),a6
		move.w	(Driver_SaveLine_Count).w,d0
		lea	SndShaunBankStart_Index(pc),a1
		move.b	(a1,d0.w),d0
		add.w	d0,d0
		add.w	d0,d0
		movea.l	SndShaunSamplesPointer_Index(pc,d0.w),a0			; Load Samples Pointer
		move.w	#$1F,d7
-		move.b	(a0)+,(a6)+
		dbf	d7,-
		movea.l	(SndDriverShaunRAM+$1A).l,a0
		move.w	(Driver_SaveLine_Count).w,d0
		move.b	SndShaunBankStart_Index(pc,d0.w),d0
		move.b	SndShaunSamplesOffset_Index(pc,d0.w),$44(a0)		; Samples offset(1 - $8000, 2 - $10000, etc...)
		bra.w	sub_98A30
; End of function sub_98A40
; ---------------------------------------------------------------------------

SndShaunSamplesOffset_Index:
		SetSnd_OffsetData.b Samples_70000	; A3
		SetSnd_OffsetData.b Samples_20000	; BM
		SetSnd_OffsetData.b Samples_40000	; JB
		SetSnd_OffsetData.b Samples_1D0000	; MM
		SetSnd_OffsetData.b Samples_30000	; MK
		SetSnd_OffsetData.b Samples_F0000	; MN
	even
SndShaunInstruments_Index:
		dc.l Snd_ShaunA3_Instruments
		dc.l Snd_ShaunBM_Instruments
		dc.l Snd_ShaunJB_Instruments
		dc.l Snd_ShaunMM_Instruments
		dc.l Snd_ShaunMK_Instruments
		dc.l Snd_ShaunMN_Instruments
SndShaunBankStart_Index:
	rept ((LoadDrvData_ShaunA3_Index-LoadDrvData_Index)/$10)
		dc.b 0
	endm
		dc.b 0	; A3
	rept ((LoadDrvData_ShaunBM_Index-LoadDrvData_ShaunA3_Index)/$10)-1
		dc.b 0
	endm
		dc.b 1	; BM
	rept ((LoadDrvData_ShaunJB_Index-LoadDrvData_ShaunBM_Index)/$10)-1
		dc.b 0
	endm
		dc.b 2	; JB
	rept ((LoadDrvData_ShaunMM_Index-LoadDrvData_ShaunJB_Index)/$10)-1
		dc.b 0
	endm
		dc.b 3	; MM
	rept ((LoadDrvData_ShaunMK_Index-LoadDrvData_ShaunMM_Index)/$10)-1
		dc.b 0
	endm
		dc.b 4	; MK
	rept ((LoadDrvData_ShaunMN_Index-LoadDrvData_ShaunMK_Index)/$10)-1
		dc.b 0
	endm
		dc.b 5	; MN
	even
SndShaunSamplesPointer_Index:
		dc.l SamplesShaunA3_Pointer
		dc.l SamplesShaunBM_Pointer
		dc.l SamplesShaunJB_Pointer
		dc.l SamplesShaunMM_Pointer
		dc.l SamplesShaunMK_Pointer
		dc.l SamplesShaunMN_Pointer
SndShaunMusicData_Index:
		dc.l MusicDataA3_Index
		dc.l MusicDataBM_Index
		dc.l MusicDataJB_Index
		dc.l MusicDataMM_Index
		dc.l MusicDataMK_Index
		dc.l MusicDataMN_Index
SndShaunOtherMusicData_Index:
		dc.l Snd_ShaunA3_MusicData+8
		dc.l Snd_ShaunBM_MusicData+8
		dc.l Snd_ShaunJB_MusicData+8
		dc.l Snd_ShaunMM_MusicData+8
		dc.l Snd_ShaunMK_MusicData+8
		dc.l Snd_ShaunMN_MusicData+8
SndShaunOtherMusicData2_Index:
		dc.l Snd_ShaunA3_MusicData+$A
		dc.l Snd_ShaunBM_MusicData+$A
		dc.l Snd_ShaunJB_MusicData+$A
		dc.l Snd_ShaunMM_MusicData+$A
		dc.l Snd_ShaunMK_MusicData+$A
		dc.l Snd_ShaunMN_MusicData+$A
SndShaunOtherMusicData3_Index:
		dc.l Snd_ShaunA3_MusicData
		dc.l Snd_ShaunBM_MusicData
		dc.l Snd_ShaunJB_MusicData
		dc.l Snd_ShaunMM_MusicData
		dc.l Snd_ShaunMK_MusicData
		dc.l Snd_ShaunMN_MusicData

; =============== S U B R O U T I N E =======================================

sub_98A84:
		bsr.w	sub_98D24
		move.b	#2,(a6)
		bra.w	sub_98A30
; End of function sub_98A84

; =============== S U B R O U T I N E =======================================

sub_98A92:
		bsr.w	sub_98D24
		move.b	#4,(a6)
		bra.w	sub_98A30
; End of function sub_98A92

; =============== S U B R O U T I N E =======================================

sub_98AA0:
		bsr.w	sub_98D24
		move.b	(SndDriverShaunRAM+$B4).l,$3A(a6)
		move.w	(SndDriverShaunRAM+$2C).l,d0
		cmpi.w	#2,d0
		bcc.s	loc_98AC6
		tst.b	(SndDriverShaunRAM+$4C).l
		bne.s	loc_98AC6
		bra.s	loc_98ACA
; ---------------------------------------------------------------------------

loc_98AC6:
		move.b	#1,(a6)

loc_98ACA:
		move.b	$38(a6),(SndDriverShaunRAM+$BE).l
		moveq	#0,d0
		btst	#6,(Graphics_flags).w
		bne.s	loc_98AE0
		addq.w	#1,d0

loc_98AE0:
		cmp.w	(SndDriverShaunRAM+$20).l,d0
		beq.s	loc_98AF4
		move.w	d0,(SndDriverShaunRAM+$20).l
		clr.w	(SndDriverShaunRAM+$22).l

loc_98AF4:
		bra.w	sub_98A30
; End of function sub_98AA0

; =============== S U B R O U T I N E =======================================

sub_98AFA:
		tst.b	(SndDriverShaunRAM+$4C).l
		bne.s	loc_98B38
		cmpi.w	#1,(SndDriverShaunRAM+$2C).l
		beq.s	locret_98B36
		lea	(SndDriverShaunRAM+$54).l,a0
		moveq	#0,d0
		or.w	4(a0),d0
		or.w	$10(a0),d0
		or.w	$1C(a0),d0
		or.w	$28(a0),d0
		or.w	$34(a0),d0
		or.w	$40(a0),d0
		bne.s	loc_98B38

locret_98B36:
		rts
; ---------------------------------------------------------------------------

loc_98B38:
		bsr.s	sub_98D24
		lea	2(a6),a5
		move.b	$38(a6),(SndDriverShaunRAM+$BE).l
		move.w	#5,d7
		lea	(SndDriverShaunRAM+$54).l,a0
-		move.b	4(a0),(a5)+
		move.b	5(a0),(a5)+
		lea	$C(a0),a0
		dbf	d7,-
		move.b	#$A,(a6)
		bra.w	sub_98A30
; End of function sub_98AFA

; =============== S U B R O U T I N E =======================================

sub_98D24:
		movea.l	(SndDriverShaunRAM+$1A).l,a6
-		bsr.w	sub_98A10
		move.b	(a6),d0
		beq.s	locret_98D52
		bsr.w	sub_98A30
	rept 11
		nop
	endm
		bra.s	-
; ---------------------------------------------------------------------------

locret_98D52:
		rts
; End of function sub_98D24

; =============== S U B R O U T I N E =======================================

Z80ShaunDriver:		binclude "Sound/Shaun Hollingworth/Z80 Data.bin"
	even
Z80ShaunDriver2:		binclude "Sound/Shaun Hollingworth/Z80 Sound Driver.bin"
	even

; =============== S U B R O U T I N E =======================================

					include "Sound/Shaun Hollingworth/Data/Alien 3/Data.asm"
					include "Sound/Shaun Hollingworth/Data/James Bond/Data.asm"
					include "Sound/Shaun Hollingworth/Data/Mickey Mania/Data.asm"
					include "Sound/Shaun Hollingworth/Data/Boogerman/Data.asm"
					include "Sound/Shaun Hollingworth/Data/Mr. Nutz/Data.asm"
					include "Sound/Shaun Hollingworth/Data/Mortal Kombat II/Data.asm"

; =============== S U B R O U T I N E =======================================

; ---------------------------------------------------------------------------
; PCM(Signed data)
; 8000Hz
; ---------------------------------------------------------------------------
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_70000:		binclude "Sound/Shaun Hollingworth/Data/Alien 3/Samples.bin"
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_40000:		binclude "Sound/Shaun Hollingworth/Data/James Bond/Samples.bin"
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_1D0000:		binclude "Sound/Shaun Hollingworth/Data/Mickey Mania/Samples.bin"
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_20000:		binclude "Sound/Shaun Hollingworth/Data/Boogerman/Samples.bin"
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_F0000:		binclude "Sound/Shaun Hollingworth/Data/Mr. Nutz/Samples.bin"
				align $8000
   if MOMPASS=1
		message " Shaun Hollingworth Samples Data ROM offset is $\{*}"
    endif
Samples_30000:		binclude "Sound/Shaun Hollingworth/Data/Mortal Kombat II/Samples.bin"
	even