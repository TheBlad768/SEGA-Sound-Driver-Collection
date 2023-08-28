; ---------------------------------------------------------------------------
; GRC Sound Driver.
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "GRC Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverGRCRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

sub_6009C:
		clr.w	(SndDriverGRCRAM+$A).l
		bsr.s	sub_600BE
		bsr.s	sub_600AC
		bra.w	sub_6016A
; End of function sub_6009C

; =============== S U B R O U T I N E =======================================

sub_600AC:
		lea	(SndDriverGRCRAM+$AA).l,a0
		move.w	#$18F,d7

-		clr.w	(a0)+
		dbf	d7,-
		rts
; End of function sub_600AC

; =============== S U B R O U T I N E =======================================

sub_600BE:
		lea	(SndDriverGRCRAM+$5A).l,a0
		lea	(SndDriverGRCRAM+$82).l,a1
		lea	(SndDriverGRCRAM+$14).l,a2
		moveq	#9,d7

-		clr.l	(a0)+
		clr.l	(a1)+
		clr.l	(a2)+
		dbf	d7,-
		rts
; End of function sub_600BE

; =============== S U B R O U T I N E =======================================

PlaySound_GRC:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		clr.w	(SndDriverGRCRAM+6).l
		move.w	d0,(SndDriverGRCRAM+4).l
		bsr.s	sub_6009C
		move.w	(SndDriverGRCRAM+4).l,d0
		bsr.w	sub_602D8
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function PlaySound_GRC

; =============== S U B R O U T I N E =======================================

UpdateMusic_GRC:
		bsr.s	sub_60130
		bne.s	locret_6012E
		bsr.w	sub_60408

locret_6012E:
		rts
; End of function UpdateMusic_GRC

; =============== S U B R O U T I N E =======================================

sub_60130:
		move.w	(SndDriverGRCRAM+$A).l,d1
		beq.s	loc_60148
		cmpi.w	#1,d1
		beq.s	loc_6014C
		cmpi.w	#2,d1
		beq.s	loc_6015E

loc_60144:
		moveq	#1,d1
		rts
; ---------------------------------------------------------------------------

loc_60148:
		clr.w	d1
		rts
; ---------------------------------------------------------------------------

loc_6014C:
		bsr.w	sub_601EE
		bsr.w	PSGSilenceAll_GRCDrv
		move.w	#$10,(SndDriverGRCRAM+$A).l
		bra.s	loc_60144
; ---------------------------------------------------------------------------

loc_6015E:
		bsr.w	sub_6025C
		clr.w	(SndDriverGRCRAM+$A).l
		bra.s	loc_60144
; End of function sub_60130

; =============== S U B R O U T I N E =======================================

sub_6016A:
		lea	(SndDriverGRCRAM+$AA).l,a1
		lea	byte_604CC(pc),a5
		clr.w	(SndDriverGRCRAM+$E).l

loc_6017C:
		move.b	(a5)+,(SndDriverGRCRAM+$C).l
		movem.l	a1/a5,-(sp)
		moveq	#$40,d1
		moveq	#$7F,d0
		bsr.w	sub_60904
		moveq	#$48,d1
		moveq	#$7F,d0
		bsr.w	sub_60904
		moveq	#$44,d1
		moveq	#$7F,d0
		bsr.w	sub_60904
		moveq	#$4C,d1
		moveq	#$7F,d0
		bsr.w	sub_60904
		clr.b	d0
		move.b	#$B4,d1
		bsr.w	sub_60904
		clr.b	d0
		moveq	#$28,d1
		bsr.w	sub_60988
		movem.l	(sp)+,a1/a5
		adda.w	#$28,a1
		addq.w	#1,(SndDriverGRCRAM+$E).l
		cmpi.w	#6,(SndDriverGRCRAM+$E).l
		bne.s	loc_6017C
		bsr.w	PSGSilenceAll_GRCDrv
		rts
; End of function sub_6016A

; =============== S U B R O U T I N E =======================================

PSGSilenceAll_GRCDrv:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)	; Silence PSG 1
		move.b	#$BF,(a0)	; Silence PSG 2
		move.b	#$DF,(a0)	; Silence PSG 3
		move.b	#$FF,(a0)	; Silence noise channel
		rts
; End of function PSGSilenceAll_GRCDrv

; =============== S U B R O U T I N E =======================================

sub_601EE:
		move.l	d0,-(sp)
		move.b	#$42,(SndDriverGRCRAM+8).l
		lea	(SndDriverGRCRAM+$AA).l,a1
		bsr.w	sub_60218
		move.b	#$53,(SndDriverGRCRAM+8).l
		lea	(SndDriverGRCRAM+$23A).l,a1
		bsr.w	sub_60218
		move.l	(sp)+,d0
		rts
; End of function sub_601EE

; =============== S U B R O U T I N E =======================================

sub_60218:
		lea	(SndDriverGRCRAM+$AA).l,a1
		lea	byte_604CC(pc),a5
		lea	(SndDriverGRCRAM+$14).l,a6
		clr.w	(SndDriverGRCRAM+$E).l

loc_60230:
		move.b	(a5)+,(SndDriverGRCRAM+$C).l
		movem.l	a0-a6,-(sp)
		moveq	#$7F,d0
		bsr.w	sub_6084C
		movem.l	(sp)+,a0-a6
		addq.l	#4,a6
		adda.w	#$28,a1
		addq.w	#1,(SndDriverGRCRAM+$E).l
		cmpi.w	#$A,(SndDriverGRCRAM+$E).l
		bne.s	loc_60230
		rts
; End of function sub_60218

; =============== S U B R O U T I N E =======================================

sub_6025C:
		move.l	d0,-(sp)
		move.b	#$42,(SndDriverGRCRAM+8).l
		lea	(SndDriverGRCRAM+$AA).l,a1
		bsr.w	sub_60286
		move.b	#$53,(SndDriverGRCRAM+8).l
		lea	(SndDriverGRCRAM+$23A).l,a1
		bsr.w	sub_60286
		move.l	(sp)+,d0
		rts
; End of function sub_6025C

; =============== S U B R O U T I N E =======================================

sub_60286:
		lea	(SndDriverGRCRAM+$AA).l,a1
		lea	(SndDriverGRCRAM+$5A).l,a2
		lea	byte_604CC(pc),a5
		lea	(SndDriverGRCRAM+$14).l,a6
		clr.w	(SndDriverGRCRAM+$E).l

loc_602A4:
		move.b	(a5)+,(SndDriverGRCRAM+$C).l
		movem.l	a0-a6,-(sp)
		move.l	(a2),d0
		beq.s	loc_602BA
		move.b	$A(a1),d0
		bsr.w	sub_6084C

loc_602BA:
		movem.l	(sp)+,a0-a6
		adda.w	#$28,a1
		addq.l	#4,a2
		addq.l	#4,a6
		addq.w	#1,(SndDriverGRCRAM+$E).l
		cmpi.w	#$A,(SndDriverGRCRAM+$E).l
		bne.s	loc_602A4
		rts
; End of function sub_60286

; =============== S U B R O U T I N E =======================================

sub_602D8:
		bsr.w	sub_6035C
		lea	(SndDriverGRCRAM+$5A).l,a1
		lea	(SndDriverGRCRAM+$14).l,a2
		moveq	#10-1,d3

-		bsr.w	sub_60378
		move.b	#$42,(a2)+
		move.b	d0,(a2)+
		move.b	#$42,(a2)+
		move.b	d0,(a2)+
		move.l	d1,(a1)+
		dbf	d3,-

		clr.w	(SndDriverGRCRAM+$10).l
		clr.b	(SndDriverGRCRAM+$12).l
		bsr.w	sub_60392
		moveq	#$22,d1
		clr.b	d0
		bra.w	sub_609C8
; End of function sub_602D8

; =============== S U B R O U T I N E =======================================

sub_6031A:
		bsr.s	sub_6035C
		lea	(SndDriverGRCRAM+$82).l,a1
		lea	(SndDriverGRCRAM+$14).l,a2
		lea	(SndDriverGRCRAM+$23A).l,a4
		movea.l	#SndDriverGRCRAM+$480,a5
		moveq	#10-1,d3

loc_60336:
		bsr.s	sub_60378
		cmp.b	1(a2),d0
		bcs.s	loc_6034A
		move.b	#$53,(a2)
		move.b	d0,1(a2)
		move.l	d1,(a1)
		bsr.s	sub_603B0

loc_6034A:
		addq.l	#4,a1
		addq.l	#4,a2
		adda.w	#$28,a4
		adda.w	#$10,a5
		dbf	d3,loc_60336
		rts
; End of function sub_6031A

; =============== S U B R O U T I N E =======================================

sub_6035C:
		andi.w	#$FF,d0
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		add.w	d0,d0
		lea	GRCBank_Music(pc),a0
		move.w	(a0,d0.l),d0
		lea	(a0,d0.l),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		lea	(SoundDriverMusicRAM).l,a0
		move.l	a0,(SndDriverGRCRAM+$500).l
		rts
; End of function sub_6035C

; =============== S U B R O U T I N E =======================================

sub_60378:
		move.b	(a0),d0
		moveq	#0,d1
		move.b	2(a0),d1
		rol.w	#8,d1
		move.b	1(a0),d1
		move.l	(SndDriverGRCRAM+$500).l,d2
		add.l	d2,d1
		addq.w	#3,a0
		rts
; End of function sub_60378

; =============== S U B R O U T I N E =======================================

sub_603B0:
		move.b	#7,(a4)
		clr.w	2(a4)
		clr.b	4(a4)
		clr.w	6(a4)
		clr.b	$A(a4)
		clr.b	$B(a4)
		clr.w	$C(a4)
		clr.w	$E(a4)
		clr.b	$10(a4)
		clr.b	$12(a4)
		move.l	a5,$14(a4)
		clr.b	$1C(a4)
		clr.b	$21(a4)
		clr.b	$22(a4)
		clr.b	$27(a4)
		clr.w	$18(a4)
		clr.b	$1A(a4)
		clr.b	$1B(a4)
		move.b	#$80,8(a4)
		move.b	#$E7,9(a4)
		rts
; End of function sub_603B0

; =============== S U B R O U T I N E =======================================

sub_60392:
		lea	(SndDriverGRCRAM+$AA).l,a4
		movea.l	#SndDriverGRCRAM+$3DC,a5
		moveq	#9,d3

-		bsr.s	sub_603B0
		adda.w	#$28,a4
		adda.w	#$10,a5
		dbf	d3,-
		rts
; End of function sub_60392
; ---------------------------------------------------------------------------

byte_604CC:
		dc.b 0
		dc.b 1
		dc.b 2
		dc.b $10
		dc.b $11
		dc.b $12
		dc.b $80
		dc.b $A0
		dc.b $C0
		dc.b $E0

; =============== S U B R O U T I N E =======================================

sub_60408:
		bsr.w	sub_604D6
		move.w	(SndDriverGRCRAM+4).l,d0
		beq.s	loc_60462
		move.b	#$42,(SndDriverGRCRAM+8).l
		lea	byte_604CC(pc),a0
		lea	(SndDriverGRCRAM+$AA).l,a1
		lea	(SndDriverGRCRAM+$5A).l,a2
		lea	(SndDriverGRCRAM+$14).l,a6
		clr.w	(SndDriverGRCRAM+$E).l

loc_6043A:
		move.b	(a0)+,(SndDriverGRCRAM+$C).l
		move.l	a0,-(sp)
		movea.l	(a2),a0
		bsr.w	sub_604F4
		move.l	a0,(a2)+
		movea.l	(sp)+,a0
		addq.l	#4,a6
		adda.w	#$28,a1
		addq.w	#1,(SndDriverGRCRAM+$E).l
		cmpi.w	#$A,(SndDriverGRCRAM+$E).l
		bne.s	loc_6043A

loc_60462:
		move.w	(SndDriverGRCRAM+$10).l,(SndDriverGRCRAM+$3CA).l
		clr.w	(SndDriverGRCRAM+$10).l
		move.b	#$53,(SndDriverGRCRAM+8).l
		lea	byte_604CC(pc),a0
		lea	(SndDriverGRCRAM+$23A).l,a1
		lea	(SndDriverGRCRAM+$82).l,a2
		lea	(SndDriverGRCRAM+$14).l,a6
		clr.w	(SndDriverGRCRAM+$E).l

loc_60498:
		move.b	(a0)+,(SndDriverGRCRAM+$C).l
		move.l	a0,-(sp)
		movea.l	(a2),a0
		bsr.w	sub_604F4
		move.l	a0,(a2)+
		movea.l	(sp)+,a0
		addq.l	#4,a6
		adda.w	#$28,a1
		addq.w	#1,(SndDriverGRCRAM+$E).l
		cmpi.w	#$A,(SndDriverGRCRAM+$E).l
		bne.s	loc_60498
		move.w	(SndDriverGRCRAM+$3CA).l,(SndDriverGRCRAM+$10).l
		rts
; End of function sub_60408

; =============== S U B R O U T I N E =======================================

sub_604D6:
		move.b	(SndDriverGRCRAM+$12).l,d0
		bne.s	loc_604E0
		rts
; ---------------------------------------------------------------------------

loc_604E0:
		ext.w	d0
		add.w	d0,(SndDriverGRCRAM+$10).l
		bpl.s	locret_604F2
		move.w	#$7FFF,(SndDriverGRCRAM+$10).l

locret_604F2:
		rts
; End of function sub_604D6

; =============== S U B R O U T I N E =======================================

sub_604F4:
		cmpa.l	#0,a0
		beq.w	locret_6055C
		subq.w	#1,2(a1)
		moveq	#0,d0
		move.b	4(a1),d0
		cmp.w	2(a1),d0
		bcs.s	loc_60522
		cmpi.b	#$26,6(a1)
		beq.s	loc_6051C
		bsr.w	sub_60736
		bra.s	loc_60522
; ---------------------------------------------------------------------------

loc_6051C:
		move.w	#1,6(a1)

loc_60522:
		cmpi.w	#0,2(a1)
		bgt.s	loc_6052E
		bsr.w	sub_6055E

loc_6052E:
		move.b	(a1),d0
		cmpi.b	#7,d0
		beq.s	locret_6055C
		cmpi.b	#$FF,d0
		beq.s	locret_6055C
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60550
		tst.b	$1B(a1)
		beq.s	loc_60550
		rts
; ---------------------------------------------------------------------------

loc_60550:
		bsr.w	sub_6058E
		bsr.w	sub_607DE
		bsr.w	sub_605D2

locret_6055C:
		rts
; End of function sub_604F4

; =============== S U B R O U T I N E =======================================

sub_6055E:
		bsr.w	sub_60B0C
		move.b	(a1),d0
		cmpi.b	#7,d0
		beq.s	loc_60580
		cmpi.b	#$FF,d0
		beq.s	locret_6057E
		move.b	(a1),d4
		bsr.w	sub_60778
		bsr.w	sub_60634

locret_6057E:
		rts
; ---------------------------------------------------------------------------

loc_60580:
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.w	loc_60766
		rts
; End of function sub_6055E

; =============== S U B R O U T I N E =======================================

sub_6058E:
		tst.b	$21(a1)
		beq.s	loc_6059E
		subq.b	#1,$21(a1)
		move.b	$20(a1),d0
		bra.s	loc_605CA
; ---------------------------------------------------------------------------

loc_6059E:
		clr.w	d1
		move.b	$1C(a1),d1
		beq.s	locret_605D0
		add.w	d1,d1
		lea	GRCMod_Index(pc),a4
		move.w	-2(a4,d1.w),d1
		lea	(a4,d1.w),a4
		move.w	$1E(a1),d1
		move.b	(a4,d1.w),d0
		move.b	d0,$20(a1)
		move.b	1(a4,d1.w),$21(a1)
		addq.w	#2,$1E(a1)

loc_605CA:
		ext.w	d0
		add.w	d0,$18(a1)

locret_605D0:
		rts
; End of function sub_6058E

; =============== S U B R O U T I N E =======================================

sub_605D2:
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_605E0
		rts
; ---------------------------------------------------------------------------

loc_605E0:
		tst.b	$27(a1)
		beq.s	loc_605F2
		subq.b	#1,$27(a1)
		move.b	$26(a1),d0
		bra.w	sub_6084C
; ---------------------------------------------------------------------------

loc_605F2:
		clr.w	d1
		move.b	$12(a1),d1
		add.w	d1,d1
		lea	GRCPSG_Index(pc),a4
		move.w	(a4,d1.w),d1
		lea	(a4,d1.w),a4
		move.w	$24(a1),d1
		addq.w	#2,$24(a1)
		clr.w	d0
		move.b	(a4,d1.w),d0
		move.b	1(a4,d1.w),$27(a1)
		lea	(byte_60AE6).l,a4
		move.b	(a4,d0.w),d0
		add.b	$A(a1),d0
		bpl.s	loc_6062C
		moveq	#$7F,d0

loc_6062C:
		move.b	d0,$26(a1)
		bra.w	sub_6084C
; End of function sub_605D2

; =============== S U B R O U T I N E =======================================

sub_60634:
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_606A0
		tst.b	$1B(a1)
		beq.s	loc_606A0
		tst.b	(SndDriverGRCRAM+$12).l
		bne.s	locret_60698
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_60698
		move.b	$1A(a1),d0
		move.b	#$B4,d1
		bsr.w	sub_60904
		move.b	$12(a1),d0
		addq.b	#1,d0
		bsr.w	sub_60D74
		tst.b	7(a1)
		bne.s	loc_6069A
		lea	(SndDriverGRCRAM+$46).l,a4
		move.w	(SndDriverGRCRAM+$E).l,d0
		move.b	#0,(a4,d0.w)
		lea	(SndDriverGRCRAM+$50).l,a4
		move.b	2(a1),d1
		add.b	(SndDriverGRCRAM+$10).l,d1
		move.b	d1,(a4,d0.w)

locret_60698:
		rts
; ---------------------------------------------------------------------------

loc_6069A:
		clr.b	7(a1)
		rts
; ---------------------------------------------------------------------------

loc_606A0:
		tst.b	7(a1)
		bne.s	loc_606BC
		clr.b	$21(a1)
		clr.w	$1E(a1)
		clr.b	$27(a1)
		clr.w	$24(a1)
		move.b	$B(a1),$A(a1)

loc_606BC:
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_6071A
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_6071C
		move.b	$A(a1),d0
		bsr.w	sub_6084C
		move.b	$1A(a1),d0
		move.b	#$B4,d1
		bsr.w	sub_60904
		move.b	#$F0,d0
		moveq	#$28,d1
		bsr.w	sub_60988

loc_606EE:
		tst.b	7(a1)
		bne.s	loc_6069A
		lea	(SndDriverGRCRAM+$46).l,a4
		move.w	(SndDriverGRCRAM+$E).l,d0
		move.b	$B(a1),(a4,d0.w)
		lea	(SndDriverGRCRAM+$50).l,a4
		move.b	2(a1),d1
		add.b	(SndDriverGRCRAM+$10).l,d1
		move.b	d1,(a4,d0.w)

locret_6071A:
		rts
; ---------------------------------------------------------------------------

loc_6071C:
		cmpi.b	#$E0,(SndDriverGRCRAM+$C).l
		bne.s	loc_606EE
		move.b	9(a1),d0
		ori.b	#$E0,d0
		move.b	d0,(PSG_input).l
		bra.s	loc_606EE
; End of function sub_60634

; =============== S U B R O U T I N E =======================================

sub_60736:
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60748
		tst.b	$1B(a1)
		beq.s	loc_60748
		rts
; ---------------------------------------------------------------------------

loc_60748:
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_60764
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_60766
		clr.b	d0
		moveq	#$28,d1
		bra.w	sub_60988
; ---------------------------------------------------------------------------

locret_60764:
		rts
; ---------------------------------------------------------------------------

loc_60766:
		move.b	(SndDriverGRCRAM+$C).l,d0
		ori.b	#$1F,d0
		move.b	d0,(PSG_input).l
		rts
; End of function sub_60736

; =============== S U B R O U T I N E =======================================

sub_60778:
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_607B6
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60794
		tst.b	$1B(a1)
		beq.s	loc_60794
		rts
; ---------------------------------------------------------------------------

loc_60794:
		add.b	d4,d4
		ext.w	d4
		lea	word_60A96(pc),a3
		move.w	(a3,d4.w),d2
		move.w	$E(a1),d0
		lsl.w	#8,d0
		lsl.w	#3,d0
		or.w	d0,d2
		add.w	$C(a1),d2
		move.w	d2,$18(a1)
		rts
; ---------------------------------------------------------------------------

loc_607B6:
		cmpi.b	#$E0,(SndDriverGRCRAM+$C).l
		beq.s	locret_607DC
		add.b	d4,d4
		ext.w	d4
		lea	word_60AB6(pc),a3
		move.w	(a3,d4.w),d2
		move.w	$E(a1),d0
		lsr.w	d0,d2
		add.w	$C(a1),d2
		move.w	d2,$18(a1)

locret_607DC:
		rts
; End of function sub_60778

; =============== S U B R O U T I N E =======================================

sub_607DE:
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_6081E
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_60820
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60804
		tst.b	$1B(a1)
		beq.s	loc_60804
		rts
; ---------------------------------------------------------------------------

loc_60804:
		move.w	$18(a1),d2
		move.w	d2,d0
		lsr.w	#8,d0
		move.b	#$A4,d1
		bsr.w	sub_60904
		move.b	d2,d0
		move.b	#$A0,d1
		bra.w	sub_60904
; ---------------------------------------------------------------------------

locret_6081E:
		rts
; ---------------------------------------------------------------------------

loc_60820:
		cmpi.b	#$E0,(SndDriverGRCRAM+$C).l
		beq.s	locret_6084A
		move.w	$18(a1),d0
		andi.b	#$F,d0
		or.b	(SndDriverGRCRAM+$C).l,d0
		move.b	d0,(PSG_input).l
		move.w	$18(a1),d0
		lsr.w	#4,d0
		move.b	d0,(PSG_input).l

locret_6084A:
		rts
; End of function sub_607DE

; =============== S U B R O U T I N E =======================================

sub_6084C:
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_60870
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_60872
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60890
		tst.b	$1B(a1)
		beq.s	loc_60890

locret_60870:
		rts
; ---------------------------------------------------------------------------

loc_60872:
		add.b	(SndDriverGRCRAM+$10).l,d0
		bpl.s	loc_6087C
		moveq	#$7F,d0

loc_6087C:
		lsr.b	#3,d0
		ori.b	#$10,d0
		or.b	(SndDriverGRCRAM+$C).l,d0
		move.b	d0,(PSG_input).l
		rts
; ---------------------------------------------------------------------------

loc_60890:
		add.b	(SndDriverGRCRAM+$10).l,d0
		bpl.s	loc_6089A
		moveq	#$7F,d0

loc_6089A:
		move.b	d0,d5
		bsr.w	sub_60DFA
		lea	(SndDriverGRCRAM+$3C).l,a3
		move.w	(SndDriverGRCRAM+$E).l,d4
		move.b	(a3,d4.w),d0
		andi.b	#7,d0
		cmpi.b	#7,d0
		bcc.s	loc_608C8
		cmpi.b	#5,d0
		bcc.s	loc_608D0
		cmpi.b	#4,d0
		bcc.s	loc_608F2
		bra.s	loc_608E0
; ---------------------------------------------------------------------------

loc_608C8:
		moveq	#$40,d1
		move.b	d5,d0
		bsr.w	sub_6094C

loc_608D0:
		moveq	#$48,d1
		move.b	d5,d0
		bsr.w	sub_6094C
		moveq	#$44,d1
		move.b	d5,d0
		bsr.w	sub_6094C

loc_608E0:
		moveq	#$4C,d1
		move.b	d5,d0
		bsr.w	sub_6094C

loc_608E8:
		startZ80
		rts
; ---------------------------------------------------------------------------

loc_608F2:
		moveq	#$48,d1
		move.b	d5,d0
		bsr.w	sub_6094C
		moveq	#$4C,d1
		move.b	d5,d0
		bsr.w	sub_6094C
		bra.s	loc_608E8
; End of function sub_6084C

; =============== S U B R O U T I N E =======================================

sub_60904:
		movem.l	d0-d2/a4,-(sp)
		move.b	(SndDriverGRCRAM+$C).l,d2
		andi.b	#$F,d2
		add.b	d2,d1
		lea	(ym2612_a0).l,a4
		cmpi.b	#$30,d1
		bcs.s	loc_60930
		btst	#4,(SndDriverGRCRAM+$C).l
		beq.s	loc_60930
		lea	(ym2612_a1).l,a4

loc_60930:
		bsr.w	sub_60DFA
		move.b	d1,(a4)
		nop
		nop
		move.b	d0,1(a4)
		startZ80
		movem.l	(sp)+,d0-d2/a4
		rts
; End of function sub_60904

; =============== S U B R O U T I N E =======================================

sub_6094C:
		movem.l	d0-d2/a4,-(sp)
		move.b	(SndDriverGRCRAM+$C).l,d2
		andi.b	#$F,d2
		add.b	d2,d1
		lea	(ym2612_a0).l,a4
		cmpi.b	#$30,d1
		bcs.s	loc_60978
		btst	#4,(SndDriverGRCRAM+$C).l
		beq.s	loc_60978
		lea	(ym2612_a1).l,a4

loc_60978:
		move.b	d1,(a4)
		nop
		nop
		move.b	d0,1(a4)
		movem.l	(sp)+,d0-d2/a4
		rts
; End of function sub_6094C

; =============== S U B R O U T I N E =======================================

sub_60988:
		movem.l	d0-d2,-(sp)
		move.b	(SndDriverGRCRAM+$C).l,d2
		andi.b	#$F,d2
		or.b	d2,d0
		btst	#4,(SndDriverGRCRAM+$C).l
		beq.s	loc_609A6
		ori.b	#4,d0

loc_609A6:
		bsr.w	sub_60DFA
		move.b	d1,(ym2612_a0).l
		nop
		nop
		move.b	d0,(ym2612_d0).l
		startZ80
		movem.l	(sp)+,d0-d2
		rts
; End of function sub_60988

; =============== S U B R O U T I N E =======================================

sub_609C8:
		bsr.w	sub_60DFA
		move.b	d1,(ym2612_a0).l
		nop
		nop
		move.b	d0,(ym2612_d0).l
		startZ80
		rts
; End of function sub_609C8

; =============== S U B R O U T I N E =======================================

sub_60A04:
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	locret_60A1E
		cmpi.b	#$12,(SndDriverGRCRAM+$C).l
		bne.s	loc_60A20
		tst.b	$1B(a1)
		beq.s	loc_60A20

locret_60A1E:
		rts
; ---------------------------------------------------------------------------

loc_60A20:
		andi.w	#$FF,d3
		mulu.w	#$19,d3
		movea.l	#GRCBMD_Instruments,a3
		cmpi.w	#((LoadDriver_GRC2_Index-LoadDrvData_Index)/$10),(Driver_SaveLine_Count).w
		bne.s	+
		movea.l	#GRCSocket_Instruments,a3
+		lea	(a3,d3.w),a3
		lea	(SndDriverGRCRAM+$3C).l,a4
		move.w	(SndDriverGRCRAM+$E).l,d4
		move.b	(a3)+,d0
		move.b	d0,(a4,d4.w)
		move.b	(SndDriverGRCRAM+8).l,d7
		cmp.b	(a6),d7
		bne.s	locret_60A94
		move.b	#$B0,d1
		bsr.w	sub_60904
		bsr.w	sub_60DFA
		clr.w	d0
		move.b	#$B4,d1
		bsr.w	sub_6094C
		moveq	#$30,d1
		moveq	#5,d4

-		move.b	(a3)+,d0
		bsr.w	sub_6094C
		addq.b	#8,d1
		move.b	(a3)+,d0
		bsr.w	sub_6094C
		subq.b	#4,d1
		move.b	(a3)+,d0
		bsr.w	sub_6094C
		addq.b	#8,d1
		move.b	(a3)+,d0
		bsr.w	sub_6094C
		addq.b	#4,d1
		dbf	d4,-
		startZ80

locret_60A94:
		rts
; End of function sub_60A04
; ---------------------------------------------------------------------------

word_60A96:
		dc.w $28E
		dc.w $2DE
		dc.w $337
		dc.w $368
		dc.w $3D3
		dc.w $44C
		dc.w $4D2
		dc.w 0
		dc.w $2B4
		dc.w $309
		dc.w $337
		dc.w $39C
		dc.w $40E
		dc.w $48D
		dc.w $4D2
		dc.w 0
word_60AB6:
		dc.w $D48
		dc.w $BD5
		dc.w $A8A
		dc.w $9F3
		dc.w $8DD
		dc.w $7E6
		dc.w $709
		dc.w 0
		dc.w $C89
		dc.w $B2B
		dc.w $A8A
		dc.w $964
		dc.w $85E
		dc.w $774
		dc.w $709
		dc.w 0
byte_60AD6:
		dc.b $7F, $1F, $1E, $1D, $1C, $1B, $1A,	$18, $16, $14
		dc.b $12, $10, $E, $C, $B, 0
byte_60AE6:
		dc.b $7F, $70, $68, $60, $58, $50, $48,	$40, $38, $30
		dc.b $28, $20, $18, $10, 8, 0

; =============== S U B R O U T I N E =======================================

sub_60AF6:
		moveq	#0,d1
		btst	#4,d0
		beq.s	loc_60B02
		move.b	(a0)+,d1
		bra.s	loc_60B06
; ---------------------------------------------------------------------------

loc_60B02:
		move.b	$10(a1),d1

loc_60B06:
		move.w	d1,2(a1)
		rts
; End of function sub_60AF6

; =============== S U B R O U T I N E =======================================

sub_60B0C:
		move.b	(a0),d0
		cmpi.b	#$FF,d0
		beq.s	loc_60B4A
		btst	#7,d0
		beq.s	loc_60B1E
		bsr.s	sub_60B82
		bra.s	sub_60B0C
; ---------------------------------------------------------------------------

loc_60B1E:
		move.b	d0,d1
		andi.b	#$F,d1
		move.b	d1,(a1)
		andi.b	#$60,d0
		add.b	d0,d0
		move.b	$1A(a1),d1
		andi.b	#$3F,d1
		or.b	d1,d0
		move.b	d0,$1A(a1)
		move.b	(a0)+,d0
		bsr.s	sub_60AF6
		cmpi.b	#$FE,(a0)
		beq.w	loc_60CC8
		rts
; ---------------------------------------------------------------------------

loc_60B4A:
		bsr.w	sub_60736
		cmpi.b	#$53,(SndDriverGRCRAM+8).l
		beq.s	loc_60B64
		move.b	#-1,(a1)
		clr.l	(a6)
		suba.l	a0,a0
		rts
; ---------------------------------------------------------------------------

loc_60B64:
		move.l	a1,-(sp)
		suba.w	#$190,a1
		move.b	$12(a1),d3
		bsr.w	sub_60A04
		movea.l	(sp)+,a1
		move.b	#-1,(a1)
		move.w	2(a6),(a6)
		suba.l	a0,a0
		rts
; End of function sub_60B0C

; =============== S U B R O U T I N E =======================================

sub_60B82:
		move.b	d0,d1
		cmpi.b	#$E0,d0
		bcc.s	loc_60BA6
		andi.b	#$F0,d0
		cmpi.b	#$80,d0
		beq.w	loc_60CDE
		cmpi.b	#$90,d0
		beq.w	loc_60D22

loc_60BA0:
		bra.s	*
; ---------------------------------------------------------------------------

loc_60BA6:
		andi.w	#$FF,d0
		subi.w	#$E0,d0
		add.w	d0,d0
		move.w	off_60BB8(pc,d0.w),d0
		lea	off_60BB8(pc,d0.w),a4
		jmp	(a4)
; ---------------------------------------------------------------------------

off_60BB8: offsetTable
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60C38
		offsetTableEntry.w loc_60C40
		offsetTableEntry.w loc_60C48
		offsetTableEntry.w loc_60C78
		offsetTableEntry.w loc_60D6A
		offsetTableEntry.w loc_60D0A
		offsetTableEntry.w loc_60D54
		offsetTableEntry.w loc_60C84
		offsetTableEntry.w loc_60BA0
		offsetTableEntry.w loc_60D18
		offsetTableEntry.w loc_60D4C
		offsetTableEntry.w loc_60D42
		offsetTableEntry.w loc_60C8E
		offsetTableEntry.w loc_60CAC
		offsetTableEntry.w loc_60C9A
		offsetTableEntry.w loc_60D38
		offsetTableEntry.w loc_60CD2
		offsetTableEntry.w loc_60D30
		offsetTableEntry.w loc_60CC8
		offsetTableEntry.w loc_60BA0
; ---------------------------------------------------------------------------

loc_60C38:
		addq.l	#1,a0
		move.b	(a0)+,4(a1)
		rts
; ---------------------------------------------------------------------------

loc_60C40:
		addq.l	#1,a0
		move.b	(a0)+,9(a1)
		rts
; ---------------------------------------------------------------------------

loc_60C48:
		addq.l	#1,a0
		tst.b	8(a1)
		beq.s	loc_60C6E
		bpl.s	loc_60C56
		move.b	(a0),8(a1)

loc_60C56:
		subq.b	#1,8(a1)
		beq.s	loc_60C6E
		addq.l	#1,a0
		clr.w	d0
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		lsl.w	#8,d1
		or.w	d1,d0
		lea	-4(a0,d0.w),a0
		rts
; ---------------------------------------------------------------------------

loc_60C6E:
		move.b	#$80,8(a1)
		addq.l	#3,a0
		rts
; ---------------------------------------------------------------------------

loc_60C78:
		addq.l	#1,a0
		move.b	(a0)+,d0
		ext.w	d0
		move.w	d0,$C(a1)
		rts
; ---------------------------------------------------------------------------

loc_60C84:
		addq.l	#1,a0
		move.b	(a0)+,(SndDriverGRCRAM+$12).l
		rts
; ---------------------------------------------------------------------------

loc_60C8E:
		movea.l	$14(a1),a4
		movea.l	(a4)+,a0
		move.l	a4,$14(a1)
		rts
; ---------------------------------------------------------------------------

loc_60C9A:
		addq.l	#1,a0
		clr.w	d0
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		lsl.w	#8,d1
		or.w	d1,d0
		lea	-3(a0,d0.w),a0
		rts
; ---------------------------------------------------------------------------

loc_60CAC:
		addq.l	#1,a0
		clr.w	d3
		move.b	(a0)+,d3
		move.b	(a0)+,d4
		lsl.w	#8,d4
		or.w	d3,d4
		movea.l	$14(a1),a4
		move.l	a0,-(a4)
		move.l	a4,$14(a1)
		lea	-3(a0,d4.w),a0
		rts
; ---------------------------------------------------------------------------

loc_60CC8:
		addq.l	#1,a0
		move.b	#$26,6(a1)
		rts
; ---------------------------------------------------------------------------

loc_60CD2:
		addq.l	#1,a0
		move.b	(a0)+,d3
		move.b	d3,$12(a1)
		bra.w	sub_60A04
; ---------------------------------------------------------------------------

loc_60CDE:
		move.b	(a0)+,d0
		andi.w	#$F,d0
		cmpi.b	#$80,(SndDriverGRCRAM+$C).l
		bcc.s	loc_60D02
		lea	byte_60AD6(pc),a3

loc_60CF4:
		move.b	(a3,d0.w),d0
		move.b	d0,$A(a1)
		move.b	d0,$B(a1)
		rts
; ---------------------------------------------------------------------------

loc_60D02:
		lea	byte_60AE6(pc),a3
		bra.s	loc_60CF4
; ---------------------------------------------------------------------------

loc_60D0A:
		addq.l	#1,a0
		move.b	(a0)+,d0
		move.b	d0,$A(a1)
		move.b	d0,$B(a1)
		rts
; ---------------------------------------------------------------------------

loc_60D18:
		addq.l	#1,a0
		move.b	(a0)+,d0
		moveq	#$26,d1
		bra.w	sub_609C8
; ---------------------------------------------------------------------------

loc_60D22:
		move.b	(a0)+,d0
		subq.b	#1,d0
		andi.w	#$F,d0
		move.w	d0,$E(a1)
		rts
; End of function sub_60B82
; ---------------------------------------------------------------------------

loc_60D30:
		addq.l	#1,a0
		move.b	(a0)+,$10(a1)
		rts
; ---------------------------------------------------------------------------

loc_60D38:
		addq.l	#1,a0
		move.b	(a0)+,d0
		move.b	d0,$1C(a1)
		rts
; ---------------------------------------------------------------------------

loc_60D42:
		addq.l	#1,a0
		move.b	(a0)+,d0
		moveq	#$22,d1
		bra.w	sub_609C8
; ---------------------------------------------------------------------------

loc_60D4C:
		addq.l	#1,a0
		move.b	(a0)+,$1A(a1)
		rts
; ---------------------------------------------------------------------------

loc_60D54:
		addq.l	#1,a0
		clr.w	d0
		move.b	(a0)+,d0
		move.b	d0,$1B(a1)
		beq.s	loc_60D64
		move.w	#$80,d0

loc_60D64:
		moveq	#$2B,d1
		bra.w	sub_609C8
; ---------------------------------------------------------------------------

loc_60D6A:
		addq.l	#1,a0
		clr.w	(SndDriverGRCRAM+6).l
		rts

; =============== S U B R O U T I N E =======================================

sub_60D74:
		cmpi.b	#1,$1B(a1)
		beq.s	loc_60D9C
		cmpi.b	#2,$1B(a1)
		beq.s	loc_60DB0
		cmpi.b	#3,$1B(a1)
		beq.s	loc_60DC4
		addq.b	#1,(SndDriverGRCRAM+2).l
		btst	#0,(SndDriverGRCRAM+2).l
		bne.s	loc_60DB0

loc_60D9C:
		stopZ80
		move.b	d0,($A01FF0).l
		startZ80
		rts
; ---------------------------------------------------------------------------

loc_60DB0:
		stopZ80
		move.b	d0,($A01FF1).l
		startZ80
		rts
; ---------------------------------------------------------------------------

loc_60DC4:
		stopZ80
		move.b	d0,($A01FF0).l
		move.b	d0,($A01FF1).l
		startZ80
		rts
; End of function sub_60D74

; =============== S U B R O U T I N E =======================================

sub_60DFA:
		stopZ80
		btst	#7,($A01FFF).l
		bne.s	loc_60E08
		rts
; ---------------------------------------------------------------------------

loc_60E08:
		startZ80
	rept 8
		nop
	endm
		bra.s	sub_60DFA
; End of function sub_60DFA

; =============== S U B R O U T I N E =======================================

Z80GRCDac_Driver:		binclude "Sound/GRC/DAC Driver (Z80).bin"
	even
						include "Sound/GRC/Misc/Modulations.asm"
						include "Sound/GRC/Misc/PSG.asm"
GRCBMD_Instruments:	binclude "Sound/GRC/Misc/Instruments(BMD).bin"
	even
GRCSocket_Instruments:	binclude "Sound/GRC/Misc/Instruments(Socket).bin"
	even

   if MOMPASS=1
		message " GRC Driver Music Data ROM offset is $\{*}"
    endif
					include "Sound/GRC/Data/Music Pointer.asm"