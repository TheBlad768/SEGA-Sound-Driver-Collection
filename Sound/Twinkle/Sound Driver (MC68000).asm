; ---------------------------------------------------------------------------
; Sound Driver M68000 (Twinkle).
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "Twinkle Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------
SndDriverTwinkleRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

Twinkle_LoadData:
		movem.l	d0-a6,-(sp)
		stopZ80
		bsr.s	sub_301B6
		bsr.s	sub_301F6
		bsr.w	sub_3038A
		bsr.w	sub_307E0
		bsr.w	sub_30284
		startZ80
		movem.l	(sp)+,d0-a6
		rts
; End of function Twinkle_LoadData

; =============== S U B R O U T I N E =======================================

sub_301B6:
		clr.w	d1
		move.w	#4,d2

-		bsr.w	sub_310A2
		addq.w	#1,d1
		dbf	d2,-
		move.w	#$2200,d1
		bsr.w	sub_31130
		move.w	#$2400,d1
		bsr.w	sub_31130
		move.w	#$2500,d1
		bsr.w	sub_31130
		move.w	#$2600,d1
		bsr.w	sub_31130
		move.w	#$2700,d1
		bsr.w	sub_31130
		move.w	#$2B00,d1
		bra.w	sub_31130
; End of function sub_301B6

; =============== S U B R O U T I N E =======================================

sub_301F6:
		move.b	#$8F,(PSG_input).l
		move.b	#$3F,(PSG_input).l
		move.b	#$AF,(PSG_input).l
		move.b	#$3F,(PSG_input).l
		move.b	#$CF,(PSG_input).l
		move.b	#$3F,(PSG_input).l
		move.b	#$9F,(PSG_input).l
		move.b	#$BF,(PSG_input).l
		move.b	#$DF,(PSG_input).l
		move.b	#$FF,(PSG_input).l
		move.b	#$E3,(PSG_input).l
		rts
; End of function sub_301F6

; =============== S U B R O U T I N E =======================================

UpdateMusic_Twinkle:
		movem.l	d0-a6,-(sp)
		stopZ80
		bsr.s	sub_3028C
		bsr.w	sub_303CA
		bsr.w	sub_30818
		bsr.w	sub_31164
		move.b	#$2A,(ym2612_a0).l
		startZ80
		movem.l	(sp)+,d0-a6
		rts
; End of function UpdateMusic_Twinkle

; =============== S U B R O U T I N E =======================================

sub_30284:
		clr.l	(SndDriverTwinkleRAM+$102).l
		rts
; End of function sub_30284

; =============== S U B R O U T I N E =======================================

sub_3028C:
		lea	(SndDriverTwinkleRAM+2).l,a0
		move.w	(SndDriverTwinkleRAM+$102).l,d0

loc_30298:
		cmp.w	(SndDriverTwinkleRAM+$104).l,d0
		beq.s	loc_302CE
		movem.l	d0/a0,-(sp)
		clr.l	d1
		move.b	1(a0,d0.w),d1
		move.b	(a0,d0.w),d0
		andi.w	#$F,d0
		asl.w	#2,d0
		movea.l	off_30304(pc,d0.w),a0
		jsr	(a0)
		movem.l	(sp)+,d0/a0
		addq.w	#2,d0
		andi.w	#$FF,d0
		bra.s	loc_30298
; ---------------------------------------------------------------------------

loc_302CE:
		move.w	d0,(SndDriverTwinkleRAM+$102).l
		rts
; End of function sub_3028C
; ---------------------------------------------------------------------------

off_30304:
		dc.l locret_302DE		; 0
		dc.l sub_3063A		; 1
		dc.l sub_3070C		; 2
		dc.l sub_30758		; 3
		dc.l sub_3079A		; 4
		dc.l locret_302DE		; 5
		dc.l locret_302DE		; 6
		dc.l locret_302DE		; 7
		dc.l locret_302DE		; 8
		dc.l sub_302E0		; 9
		dc.l sub_302F6		; $A
		dc.l locret_302DE		; $B
		dc.l locret_302DE		; $C
		dc.l locret_302DE		; $D
		dc.l sub_302D8		; $E
		dc.l locret_302DE		; $F

; =============== S U B R O U T I N E =======================================

sub_302D8:
		move.b	d1,(SndDriverTwinkleRAM+$1DB).l

locret_302DE:
		rts
; End of function sub_302D8

; =============== S U B R O U T I N E =======================================

sub_302E0:
		addi.w	#$A0,d1
		addi.w	#$400,d1
		move.w	#$3054,d2
		move.w	#$FFFF,d3
		bra.w	sub_30BF6
; End of function sub_302E0

; =============== S U B R O U T I N E =======================================

sub_302F6:
		addi.w	#$A0,d1
		addi.w	#$400,d1
		bra.w	sub_30EF0
; End of function sub_302F6

; =============== S U B R O U T I N E =======================================

PlaySound_Twinkle:
		move	sr,-(sp)
		ori	#$700,sr
		move.w	d0,d1
		move.w	(SndDriverTwinkleRAM+$104).l,d0
		addq.w	#2,d0
		andi.w	#$FF,d0
		cmp.w	(SndDriverTwinkleRAM+$102).l,d0
		beq.s	loc_30384
		move.w	(SndDriverTwinkleRAM+$104).l,d0
		lea	(SndDriverTwinkleRAM+2).l,a0
		ori.w	#$100,d1		; Fix
		move.w	d1,(a0,d0.w)
		addq.w	#2,d0
		andi.w	#$FF,d0
		move.w	d0,(SndDriverTwinkleRAM+$104).l
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d1
		beq.s	+
		move.w	d1,(MusicPlay_SaveCurrent_Count).w
		lea	MusicIndex_Twinkle(pc),a0
		andi.w	#$FF,d1
		add.w	d1,d1
		move.w	(a0,d1.w),d1
		beq.s	+
		lea	(a0,d1.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		move	(sp)+,sr
		andi	#$FE,ccr
		rts
; ---------------------------------------------------------------------------

loc_30384:
		move	(sp)+,sr
		ori	#1,ccr
		rts
; End of function PlaySound_Twinkle

; =============== S U B R O U T I N E =======================================

sub_3038A:
		lea	(SndDriverTwinkleRAM+$106).l,a6
		clr.l	d0
		move.b	d0,d3
		move.w	#5,d2

-		move.l	a6,-(sp)
		move.w	#7,d1

-		move.l	d0,(a6)+
		dbf	d1,-
		movea.l	(sp)+,a6
		move.b	d3,2(a6)
		addq.b	#1,d3
		lea	$20(a6),a6
		dbf	d2,--
		move.w	d0,(SndDriverTwinkleRAM+$1C6).l
		move.w	d0,(SndDriverTwinkleRAM+$1C8).l
		move.b	#-1,(SndDriverTwinkleRAM+$1DB).l

locret_303C8:
		rts
; End of function sub_3038A

; =============== S U B R O U T I N E =======================================

sub_303CA:
		tst.w	(SndDriverTwinkleRAM+$1E0).l
		bne.s	locret_303C8
		tst.w	(SndDriverTwinkleRAM+$1C6).l
		beq.s	locret_303C8
		move.w	(SndDriverTwinkleRAM+$1CA).l,d0
		sub.w	d0,(SndDriverTwinkleRAM+$1CC).l
		bgt.s	locret_303C8

loc_303EE:
		lea	(SndDriverTwinkleRAM+$106).l,a6
		move.w	#5,d7
		clr.b	d6
		move.b	d6,(SndDriverTwinkleRAM+$1DA).l

loc_30400:
		or.b	(a6),d6
		tst.b	(a6)
		bpl.s	loc_30492
		tst.b	$F(a6)
		beq.s	loc_3041C
		subq.b	#1,$F(a6)
		bne.s	loc_3041C
		bsr.w	sub_305EC

loc_3041C:
		tst.b	$E(a6)
		beq.s	loc_3042C
		subq.b	#1,$E(a6)
		bne.s	loc_30492

loc_3042C:
		addq.b	#1,$10(a6)
		movea.l	6(a6),a1
		btst	#6,(a6)
		bne.w	loc_304DA

loc_3043E:
		move.b	(a1)+,d1
		bpl.s	loc_3044A
		bsr.w	sub_30512
		bra.s	loc_3043E
; ---------------------------------------------------------------------------

loc_3044A:
		tst.b	$F(a6)
		beq.s	loc_30460
		bset	#0,(a6)
		cmp.b	4(a6),d1
		beq.s	loc_30466

loc_30460:
		bclr	#0,(a6)

loc_30466:
		move.b	d1,4(a6)
		move.b	(a1)+,$E(a6)
		move.b	(a1)+,$F(a6)
		move.l	a1,6(a6)
		tst.b	$F(a6)
		beq.s	loc_3048C
		btst	#0,(a6)
		bne.s	loc_3048C
		bsr.w	sub_305CC

loc_3048C:
		tst.b	$E(a6)
		beq.s	loc_3042C

loc_30492:
		addq.b	#1,(SndDriverTwinkleRAM+$1DA).l
		lea	$20(a6),a6
		dbf	d7,loc_30400
		addi.w	#$4B,(SndDriverTwinkleRAM+$1CC).l
		bmi.w	loc_303EE
		tst.w	(SndDriverTwinkleRAM+$1DC).l
		beq.s	loc_304BC
		tst.b	d6
		bne.s	locret_304D8

loc_304BC:
		move.w	(SndDriverTwinkleRAM+$1C8).l,-(sp)
		clr.w	d1
		bsr.w	sub_3070C
		move.w	(sp)+,d1
		beq.s	locret_304D8
		bsr.w	sub_3063A
		clr.w	(SndDriverTwinkleRAM+$1C8).l

locret_304D8:
		rts
; ---------------------------------------------------------------------------

loc_304DA:
		move.b	(a1)+,d1
		bpl.s	loc_304E6
		bsr.s	sub_30512
		bra.s	loc_304DA
; ---------------------------------------------------------------------------

loc_304E6:
		move.b	d1,4(a6)
		beq.s	loc_304F2
		addi.b	#$5D,d1

loc_304F2:
		move.b	d1,3(a6)
		move.b	(a1)+,$E(a6)
		move.l	a1,6(a6)
		tst.b	$E(a6)
		beq.s	loc_304DA
		tst.b	4(a6)
		beq.s	loc_30510
		bsr.w	sub_305CC

loc_30510:
		bra.s	loc_30492
; End of function sub_303CA

; =============== S U B R O U T I N E =======================================

sub_30512:
		cmpi.b	#$FD,d1
		beq.s	loc_30544
		cmpi.b	#$80,d1
		beq.s	loc_3055E
		cmpi.b	#$81,d1
		beq.s	loc_30570
		cmpi.b	#$EC,d1
		beq.s	loc_30580
		cmpi.b	#$F8,d1
		beq.s	loc_30586
		cmpi.b	#$F9,d1
		beq.s	loc_305BA
		rts
; ---------------------------------------------------------------------------

loc_30544:
		bsr.w	sub_305F4
		bcs.s	loc_3054E
		rts
; ---------------------------------------------------------------------------

loc_3054E:
		move.w	2(a6),d1
		bsr.w	sub_305EC
		clr.b	(a6)
		addq.l	#4,sp
		bra.w	loc_30492
; ---------------------------------------------------------------------------

loc_3055E:
		move.b	(a1)+,d0
		subi.b	#$54,d0
		asr.b	#2,d0
		addi.b	#$54,d0
		move.b	d0,5(a6)
		rts
; ---------------------------------------------------------------------------

loc_30570:
		bset	#6,(a6)
		move.b	#5,2(a6)
		addq.l	#4,sp
		bra.w	loc_304DA
; ---------------------------------------------------------------------------

loc_30580:
		move.b	(a1)+,3(a6)
		rts
; ---------------------------------------------------------------------------

loc_30586:
		tst.b	1(a6)
		bne.s	loc_305A0
		move.b	(a1)+,1(a6)
		beq.s	loc_305A8
		cmpi.b	#$64,1(a6)
		beq.s	loc_305A8

loc_305A0:
		subq.b	#1,1(a6)
		beq.s	locret_305B8

loc_305A8:
		movea.l	$A(a6),a1
		move.w	$18(a6),$16(a6)
		move.w	$1A(a6),$10(a6)

locret_305B8:
		rts
; ---------------------------------------------------------------------------

loc_305BA:
		move.l	a1,$A(a6)
		move.w	$16(a6),$18(a6)
		move.w	$10(a6),$1A(a6)
		rts
; End of function sub_30512

; =============== S U B R O U T I N E =======================================

sub_305CC:
		move.w	2(a6),d1
		move.w	4(a6),d2
		move.w	#$A,d3
		move.b	(SndDriverTwinkleRAM+$1DA).l,d0
		btst	d0,(SndDriverTwinkleRAM+$1DB).l
		beq.s	sub_305EC
		bra.w	sub_30BF6
; End of function sub_305CC

; =============== S U B R O U T I N E =======================================

sub_305EC:
		move.w	2(a6),d1
		bra.w	sub_30EF0
; End of function sub_305EC

; =============== S U B R O U T I N E =======================================

sub_305F4:
		clr.b	$10(a6)
		movea.l	$12(a6),a1
		move.w	$16(a6),d1
		move.b	(a1,d1.w),d1
		move.b	d1,$11(a6)
		beq.s	loc_30632
		subq.b	#1,d1
		andi.w	#$FF,d1
		asl.w	#1,d1
		movea.l	(SndDriverTwinkleRAM+$1D2).l,a1
		move.w	(a1,d1.w),d1
		movea.l	(SndDriverTwinkleRAM+$1CE).l,a1
		lea	(a1,d1.w),a1
		addq.w	#1,$16(a6)
		andi	#$FE,ccr
		rts
; ---------------------------------------------------------------------------

loc_30632:
		clr.b	(a6)
		ori	#1,ccr
		rts
; End of function sub_305F4

; =============== S U B R O U T I N E =======================================

sub_3063A:
		move.w	d1,-(sp)
		andi.w	#$FF,d1
		cmpi.w	#$40,d1
		bcc.w	loc_30708
;		cmpi.w	#$17,(SndDriverTwinkleRAM+$1C6).l
;		beq.w	loc_30708
;		cmpi.w	#$18,(SndDriverTwinkleRAM+$1C6).l
;		beq.w	loc_30708
		clr.w	d1
		bsr.w	sub_3070C
		move.w	(sp),d1
		beq.w	loc_30708
		lea	(SoundDriverMusicRAM).l,a1
		move.l	a1,(SndDriverTwinkleRAM+$1CE).l
		move.w	(a1)+,d1
		move.w	(a1)+,(SndDriverTwinkleRAM+$1CA).l
		clr.w	(SndDriverTwinkleRAM+$1CC).l
		move.l	a1,(SndDriverTwinkleRAM+$1D6).l
		move.w	d1,d6
		subq.w	#1,d6
		asl.w	#1,d1
		lea	(a1,d1.w),a1
		move.l	a1,(SndDriverTwinkleRAM+$1D2).l
		lea	(SndDriverTwinkleRAM+$106).l,a6
		movea.l	(SndDriverTwinkleRAM+$1D6).l,a5
		move.w	#5,d7
		clr.b	d5

loc_306B6:
		move.w	(a5)+,d0
		beq.s	loc_306F8
		movea.l	(SndDriverTwinkleRAM+$1CE).l,a1
		lea	(a1,d0.w),a1
		move.l	a1,$12(a6)
		move.b	#-1,4(a6)
		move.b	d5,2(a6)
		addq.b	#1,d5
		bsr.w	sub_305F4
		bcs.s	loc_306F8
		move.l	a1,6(a6)
		move.l	a1,$A(a6)
		move.b	#$80,(a6)
		lea	$20(a6),a6
		dbf	d7,loc_306F8
		bra.s	loc_306FC
; ---------------------------------------------------------------------------

loc_306F8:
		dbf	d6,loc_306B6

loc_306FC:
		move.w	(sp)+,d1
		addq.w	#1,d1
		move.w	d1,(SndDriverTwinkleRAM+$1C6).l
		rts
; ---------------------------------------------------------------------------

loc_30708:
		addq.l	#2,sp
		rts
; End of function sub_3063A

; =============== S U B R O U T I N E =======================================

sub_3070C:
		tst.b	d1
		bne.s	loc_30750
		tst.w	(SndDriverTwinkleRAM+$1C6).l
		beq.s	loc_30738
		lea	(SndDriverTwinkleRAM+$106).l,a6
		move.w	#5,d7

loc_30726:
		tst.b	(a6)
		bpl.s	loc_30730
		bsr.w	sub_305EC

loc_30730:
		lea	$20(a6),a6
		dbf	d7,loc_30726

loc_30738:
		bsr.w	sub_301B6
		bsr.w	sub_301F6
		bsr.s	sub_307E0
		bsr.w	sub_3038A
		clr.w	(SndDriverTwinkleRAM+$1C6).l
		rts
; ---------------------------------------------------------------------------

loc_30750:
		move.w	d1,(SndDriverTwinkleRAM+$1DE).l
		rts
; End of function sub_3070C

; =============== S U B R O U T I N E =======================================

sub_30758:
		tst.w	(SndDriverTwinkleRAM+$1C6).l
		beq.w	sub_3063A
;		cmpi.w	#$17,d1
;		beq.s	loc_3078A
;		cmpi.w	#$18,d1
;		beq.s	loc_3078A
;		cmpi.w	#$17,(SndDriverTwinkleRAM+$1C6).l
;		beq.s	locret_30798
;		cmpi.w	#$18,(SndDriverTwinkleRAM+$1C6).l
;		beq.s	locret_30798

loc_3078A:
		move.w	#4,(SndDriverTwinkleRAM+$1DE).l
		move.w	d1,(SndDriverTwinkleRAM+$1C8).l

locret_30798:
		rts
; End of function sub_30758

; =============== S U B R O U T I N E =======================================

sub_3079A:
		eori.w	#1,(SndDriverTwinkleRAM+$1E0).l
		move.w	(SndDriverTwinkleRAM+$1E0).l,d0
		move.b	d0,(Z80_RAM+$1FF6).l
		bsr.w	sub_301B6
		bsr.w	sub_301F6
		move.w	(SndDriverTwinkleRAM+$1DC).l,-(sp)
		move.w	(SndDriverTwinkleRAM+$1DE).l,-(sp)
		move.w	(SndDriverTwinkleRAM+$1E0).l,-(sp)
		bsr.s	sub_307E0
		move.w	(sp)+,(SndDriverTwinkleRAM+$1E0).l
		move.w	(sp)+,(SndDriverTwinkleRAM+$1DE).l
		move.w	(sp)+,(SndDriverTwinkleRAM+$1DC).l
		rts
; End of function sub_3079A

; =============== S U B R O U T I N E =======================================

sub_307E0:
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		clr.l	d0
		move.w	#9,d2

-		move.l	a6,-(sp)
		move.w	#$F,d1

-		move.l	d0,(a6)+
		dbf	d1,-
		movea.l	(sp)+,a6
		lea	$40(a6),a6
		dbf	d2,--
		move.w	#$1FF,(SndDriverTwinkleRAM+$1DC).l
		clr.w	(SndDriverTwinkleRAM+$1DE).l
		clr.w	(SndDriverTwinkleRAM+$1E0).l
		rts
; End of function sub_307E0

; =============== S U B R O U T I N E =======================================

sub_30818:
		tst.w	(SndDriverTwinkleRAM+$1E0).l
		bne.s	locret_30880
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		move.w	#9,d7

loc_3082C:
		tst.b	(a6)
		bpl.s	loc_30858
		move.l	8(a6),d0
		beq.s	loc_30858
		movea.l	d0,a5
		clr.w	d0
		move.b	3(a6),d0
		bclr	#7,d0
		asl.w	#2,d0
		movea.l	off_30882(pc,d0.w),a0
		jsr	(a0)
		move.l	a5,8(a6)

loc_30858:
		lea	$40(a6),a6
		dbf	d7,loc_3082C
		move.w	(SndDriverTwinkleRAM+$1DE).l,d0
		beq.s	locret_30880
		sub.w	d0,(SndDriverTwinkleRAM+$1DC).l
		bpl.s	locret_30880
		clr.w	(SndDriverTwinkleRAM+$1DE).l
		clr.w	(SndDriverTwinkleRAM+$1DC).l

locret_30880:
		rts
; End of function sub_30818
; ---------------------------------------------------------------------------

off_30882:
		dc.l locret_30880	; 0
		dc.l loc_30896	; 1
		dc.l sub_30BEA	; 2
		dc.l sub_30BEA	; 3
		dc.l sub_30BEA	; 4
; ---------------------------------------------------------------------------

loc_30896:
		clr.w	d0
		move.b	(a5),d0
		asl.w	#2,d0
		movea.l	off_308AC(pc,d0.w),a0
		jsr	(a0)
		bcs.s	loc_30896
		rts
; ---------------------------------------------------------------------------

off_308AC:
		dc.l sub_308E8		; 0
		dc.l sub_30902		; 1
		dc.l sub_30956		; 2
		dc.l sub_30974		; 3
		dc.l sub_30984		; 4
		dc.l sub_309A8		; 5
		dc.l sub_309CC		; 6
		dc.l sub_309F0		; 7
		dc.l sub_309F8		; 8
		dc.l sub_30A14		; 9
		dc.l sub_30A8E		; $A
		dc.l sub_30AF0		; $B
		dc.l sub_30B32		; $C
		dc.l sub_30BC8		; $D
		dc.l sub_30BDC		; $E

; =============== S U B R O U T I N E =======================================

sub_308E8:
		btst	#7,3(a6)
		beq.s	loc_308F6
		bsr.s	sub_30902

loc_308F6:
		suba.l	a5,a5
		bclr	#7,(a6)
		andi	#$FE,ccr
		rts
; End of function sub_308E8

; =============== S U B R O U T I N E =======================================

sub_30902:
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		addi.w	#$1000,d1
		move.b	#$7F,d1
		move.b	d1,$20(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	d1,$21(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	d1,$22(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	d1,$23(a6)
		jsr	(a1)
		move.w	#$2800,d1
		move.b	1(a6),d1
		cmpi.b	#3,d1
		bcs.s	loc_3094A
		addq.b	#1,d1

loc_3094A:
		bsr.w	sub_31130
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30902

; =============== S U B R O U T I N E =======================================

sub_30956:
		tst.b	$19(a6)
		bne.s	loc_30964
		move.b	1(a5),$19(a6)

loc_30964:
		subq.b	#1,$19(a6)
		bne.s	loc_3096E
		addq.l	#2,a5

loc_3096E:
		andi	#$FE,ccr
		rts
; End of function sub_30956

; =============== S U B R O U T I N E =======================================

sub_30974:
		move.b	1(a5),d0

loc_30978:
		ext.w	d0
		lea	(a5,d0.w),a5
		ori	#1,ccr
		rts
; End of function sub_30974

; =============== S U B R O U T I N E =======================================

sub_30984:
		tst.b	$1B(a6)
		bne.s	loc_30992
		move.b	1(a5),$1B(a6)

loc_30992:
		subq.b	#1,$1B(a6)
		beq.s	loc_309A0
		move.b	2(a5),d0
		bra.s	loc_30978
; ---------------------------------------------------------------------------

loc_309A0:
		addq.l	#4,a5
		ori	#1,ccr
		rts
; End of function sub_30984

; =============== S U B R O U T I N E =======================================

sub_309A8:
		tst.b	$1C(a6)
		bne.s	loc_309B6
		move.b	1(a5),$1C(a6)

loc_309B6:
		subq.b	#1,$1C(a6)
		beq.s	loc_309C4
		move.b	2(a5),d0
		bra.s	loc_30978
; ---------------------------------------------------------------------------

loc_309C4:
		addq.l	#4,a5
		ori	#1,ccr
		rts
; End of function sub_309A8

; =============== S U B R O U T I N E =======================================

sub_309CC:
		tst.b	$1D(a6)
		bne.s	loc_309DA
		move.b	1(a5),$1D(a6)

loc_309DA:
		subq.b	#1,$1D(a6)
		beq.s	loc_309E8
		move.b	2(a5),d0
		bra.s	loc_30978
; ---------------------------------------------------------------------------

loc_309E8:
		addq.l	#4,a5
		ori	#1,ccr
		rts
; End of function sub_309CC

; =============== S U B R O U T I N E =======================================

sub_309F0:
		addq.l	#6,a5
		ori	#1,ccr
		rts
; End of function sub_309F0

; =============== S U B R O U T I N E =======================================

sub_309F8:
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		move.b	1(a5),$16(a6)
		bsr.w	sub_30E20
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_309F8

; =============== S U B R O U T I N E =======================================

sub_30A14:
		movea.l	$C(a6),a1
		move.b	$1C(a1),d0
		andi.w	#7,d0
		lea	Twinkle_FMSlotMask(pc),a1
		move.b	(a1,d0.w),d2
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		move.b	1(a5),d1
		not.b	d1
		andi.b	#$7F,d1
		addi.w	#$1000,d1
		ror.b	#1,d2
		bcc.s	loc_30A4E
		move.b	d1,$20(a6)
		jsr	(a1)

loc_30A4E:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30A5E
		move.b	d1,$21(a6)
		jsr	(a1)

loc_30A5E:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30A6E
		move.b	d1,$22(a6)
		jsr	(a1)

loc_30A6E:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30A7E
		move.b	d1,$23(a6)
		jsr	(a1)

loc_30A7E:
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30A14
; ---------------------------------------------------------------------------

Twinkle_FMSlotMask:	dc.b 8, 8, 8, 8, $C, $E, $E, $F

; =============== S U B R O U T I N E =======================================

sub_30A8E:
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		addi.w	#$1000,d1
		move.b	1(a5),d1
		not.b	d1
		andi.b	#$7F,d1
		move.b	d1,$20(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	2(a5),d1
		not.b	d1
		andi.b	#$7F,d1
		move.b	d1,$21(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	3(a5),d1
		not.b	d1
		andi.b	#$7F,d1
		move.b	d1,$22(a6)
		jsr	(a1)
		addi.w	#$400,d1
		move.b	4(a5),d1
		not.b	d1
		andi.b	#$7F,d1
		move.b	d1,$23(a6)
		jsr	(a1)
		addq.l	#6,a5
		ori	#1,ccr
		rts
; End of function sub_30A8E

; =============== S U B R O U T I N E =======================================

sub_30AF0:
		move.w	$14(a6),d1
		move.b	1(a5),d0
		ext.w	d0
		add.w	d1,d0
		andi.w	#$7FF,d0
		andi.w	#$F800,d1
		or.w	d0,d1
		move.w	d1,$14(a6)
		move.w	d1,d2
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		addi.w	#$7400,d1
		ror.w	#8,d2
		move.b	d2,d1
		jsr	(a1)
		subi.w	#$400,d1
		ror.w	#8,d2
		move.b	d2,d1
		jsr	(a1)
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30AF0

; =============== S U B R O U T I N E =======================================

sub_30B32:
		movea.l	$C(a6),a1
		move.b	$1C(a1),d0
		andi.w	#7,d0
		lea	Twinkle_FMSlotMask(pc),a1
		move.b	(a1,d0.w),d2
		clr.w	d1
		move.b	1(a6),d1
		bsr.w	sub_3110C
		move.b	1(a5),d3
		neg.b	d3
		addi.w	#$1000,d1
		ror.b	#1,d2
		bcc.s	loc_30B72
		add.b	d3,$20(a6)
		andi.b	#$7F,$20(a6)
		move.b	$20(a6),d1
		jsr	(a1)

loc_30B72:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30B8C
		add.b	d3,$21(a6)
		andi.b	#$7F,$21(a6)
		move.b	$21(a6),d1
		jsr	(a1)

loc_30B8C:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30BA6
		add.b	d3,$22(a6)
		andi.b	#$7F,$22(a6)
		move.b	$22(a6),d1
		jsr	(a1)

loc_30BA6:
		addi.w	#$400,d1
		ror.b	#1,d2
		bcc.s	loc_30BC0
		add.b	d3,$23(a6)
		andi.b	#$7F,$23(a6)
		move.b	$23(a6),d1
		jsr	(a1)

loc_30BC0:
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30B32

; =============== S U B R O U T I N E =======================================

sub_30BC8:
		move.b	1(a5),d0
		add.b	d0,$16(a6)
		bsr.w	sub_30E20
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30BC8

; =============== S U B R O U T I N E =======================================

sub_30BDC:
		move.b	1(a5),2(a6)
		addq.l	#2,a5
		ori	#1,ccr
		rts
; End of function sub_30BDC

; =============== S U B R O U T I N E =======================================

sub_30BEA:
		suba.l	a5,a5
		rts
; End of function sub_30BEA

; =============== S U B R O U T I N E =======================================

sub_30BF6:
		movem.l	d0-d4/a0-a2/a6,-(sp)
		move.w	d1,(SndDriverTwinkleRAM+$462).l
		move.w	d2,(SndDriverTwinkleRAM+$464).l
		move.b	d3,(SndDriverTwinkleRAM+$467).l
		lea	(UniBank_Index).l,a2
		clr.w	d0
		move.b	d1,d0
		add.w	d0,d0
		move.w	(a2,d0.w),d0
		lea	(a2,d0.w),a2
		tst.b	(a2)
		beq.s	loc_30C58
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		clr.b	d1
		lsr.w	#2,d1
		lea	(a6,d1.w),a6
		tst.b	(SndDriverTwinkleRAM+$467).l
		bpl.s	loc_30C42
		move.b	1(a2),(SndDriverTwinkleRAM+$467).l

loc_30C42:
		clr.w	d0
		move.b	(a2),d0
		bclr	#7,d0
		asl.w	#2,d0
		movea.l	dword_30C5E(pc,d0.w),a0
		jsr	(a0)

loc_30C58:
		movem.l	(sp)+,d0-d4/a0-a2/a6

locret_30C5C:
		rts
; End of function sub_30BF6
; ---------------------------------------------------------------------------

dword_30C5E:
		dc.l 0
		dc.l loc_30C6E
		dc.l sub_30E6E
		dc.l locret_30EEC
; ---------------------------------------------------------------------------

loc_30C6E:
		clr.w	d0
		move.b	2(a2),d0
		beq.s	loc_30C8E
		subq.b	#1,d0
		move.b	d0,(SndDriverTwinkleRAM+$462).l
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		mulu.w	#$40,d0
		lea	(a6,d0.w),a6

loc_30C8E:
		bsr.w	sub_30F9E
		bcs.s	locret_30C5C
		move.l	a2,$C(a6)
		move.b	(SndDriverTwinkleRAM+$464).l,$16(a6)
		move.b	$1F(a2),d0
		beq.s	loc_30CAE
		move.b	d0,$16(a6)

loc_30CAE:
		move.b	(a2),3(a6)
		move.b	(SndDriverTwinkleRAM+$467).l,2(a6)
		move.b	3(a2),$17(a6)
		clr.w	d1
		move.b	(SndDriverTwinkleRAM+$462).l,d1
		move.b	d1,1(a6)
		bsr.w	sub_3110C
		move.w	d1,(SndDriverTwinkleRAM+$468).l
		move.b	(SndDriverTwinkleRAM+$462+1).l,d1
		cmp.b	5(a6),d1
		beq.s	loc_30D3C
		move.b	d1,5(a6)
		movea.l	$C(a6),a2
		addq.l	#4,a2
		move.w	(SndDriverTwinkleRAM+$468).l,d1
		move.w	#3,d2

-		move.b	(a2)+,d1
		jsr	(a1)
		addi.w	#$400,d1
		dbf	d2,-
		addq.l	#4,a2
		addi.w	#$1000,d1
		move.w	#$F,d2

-		move.b	(a2)+,d1
		jsr	(a1)
		addi.w	#$400,d1
		dbf	d2,-
		move.w	(SndDriverTwinkleRAM+$468).l,d1
		addi.w	#-$8000,d1
		move.b	(a2)+,d1
		jsr	(a1)
		addi.w	#$400,d1
		move.b	(a2)+,d1
		jsr	(a1)
		move.w	#$2200,d1
		move.b	(a2)+,d1
		beq.s	loc_30D3C
		jsr	(a1)

loc_30D3C:
		movea.l	$C(a6),a2
		lea	Twinkle_FMSlotMask(pc),a0
		move.b	$1C(a2),d2
		andi.w	#7,d2
		move.b	(a0,d2.w),d2
		move.b	(SndDriverTwinkleRAM+$464+1).l,d3
		ext.w	d3
		subi.w	#$54,d3
		btst	#7,3(a6)
		bne.s	loc_30D76
		move.w	(SndDriverTwinkleRAM+$1DC).l,d0
		subi.w	#$1FF,d0
		asr.w	#3,d0
		add.w	d0,d3

loc_30D76:
		neg.w	d3
		move.w	d4,-(sp)
		lea	8(a2),a2
		lea	$20(a6),a0
		move.w	(SndDriverTwinkleRAM+$468).l,d1
		addi.w	#$1000,d1
		move.w	#3,d4

loc_30D90:
		clr.w	d0
		move.b	(a2)+,d0
		ror.b	#1,d2
		bcc.s	loc_30DB2
		add.w	d3,d0
		bmi.s	loc_30DB0
		cmpi.w	#$80,d0
		bcs.s	loc_30DB2
		move.b	#$7F,d0
		bra.s	loc_30DB2
; ---------------------------------------------------------------------------

loc_30DB0:
		clr.b	d0

loc_30DB2:
		move.b	d0,d1
		move.b	d0,(a0)+
		jsr	(a1)
		addi.w	#$400,d1
		dbf	d4,loc_30D90
		move.w	(sp)+,d4
		move.w	(SndDriverTwinkleRAM+$468).l,d1
		bsr.s	sub_30E20
		move.w	#$2800,d1
		move.b	(SndDriverTwinkleRAM+$462).l,d1
		cmpi.b	#3,d1
		bcs.s	loc_30DE0
		addq.b	#1,d1

loc_30DE0:
		btst	#0,(a6)
		bne.s	loc_30DEC
		bsr.w	sub_31130

loc_30DEC:
		ori.w	#$F0,d1
		bsr.w	sub_31130
		move.l	$C(a6),d0
		addi.l	#$20,d0
		move.l	d0,8(a6)
		clr.b	$1B(a6)
		clr.b	$1C(a6)
		clr.b	$1D(a6)
		clr.b	$19(a6)
		clr.b	$1A(a6)
		bclr	#0,(a6)
		bset	#7,(a6)

locret_30E1E:
		rts

; =============== S U B R O U T I N E =======================================

sub_30E20:
		movem.l	d1,-(sp)
		clr.w	d0
		move.b	$16(a6),d0
		add.b	$17(a6),d0
		clr.w	d1

loc_30E30:
		subi.w	#$C,d0
		bcs.s	loc_30E3E
		addi.w	#$800,d1
		bra.s	loc_30E30
; ---------------------------------------------------------------------------

loc_30E3E:
		addi.w	#$C,d0
		asl.w	#1,d0
		or.w	FMFrequencies_Twinkle(pc,d0.w),d1
		move.w	d1,$14(a6)
		move.w	d1,d2
		movem.l	(sp)+,d1
		addi.w	#$7400,d1
		ror.w	#8,d2
		move.b	d2,d1
		jsr	(a1)
		subi.w	#$400,d1
		ror.w	#8,d2
		move.b	d2,d1
		jsr	(a1)
		rts
; End of function sub_30E20
; ---------------------------------------------------------------------------

FMFrequencies_Twinkle:	binclude "Sound/Twinkle/Data/Frequencies.bin"
	even

; =============== S U B R O U T I N E =======================================

sub_30E6E:
		lea	(SndDriverTwinkleRAM+$322).l,a6
		bsr.w	sub_30F9E
		bcs.s	locret_30EEC
		move.l	a2,$C(a6)
		move.b	(a2)+,3(a6)
		addq.l	#1,a2
		move.b	(SndDriverTwinkleRAM+$467).l,2(a6)
		move.b	(a2)+,4(a6)
		move.b	(a2)+,6(a6)
		move.b	(a2)+,$10(a6)
		move.b	(a2)+,$11(a6)
		move.b	(a2)+,$12(a6)
		move.b	(a2)+,$13(a6)
		lea	(Z80_RAM+$1FF0).l,a0
		subq.l	#3,a2
		move.b	(a2)+,(a0)+
		move.b	(a2)+,(a0)+
		move.b	(a2)+,(a0)+
		move.l	a2,8(a6)
		move.b	6(a6),(a0)+
		move.b	#1,(a0)+
		move.b	#1,(a0)+
		addq.l	#1,a0
		move.w	#$1FF,d0
		sub.w	(SndDriverTwinkleRAM+$1DC).l,d0
		lsr.w	#6,d0
		move.b	d0,(a0)+
		move.w	#$2B80,d1
		bsr.w	sub_31130
		move.w	#$B600,d1
		move.b	4(a6),d1
		bsr.w	sub_3114A
		bset	#7,(a6)

locret_30EEC:
		rts
; End of function sub_30E6E

; =============== S U B R O U T I N E =======================================

sub_30EF0:
		movem.l	d0-d4/a0-a2/a6,-(sp)
		move.w	d1,(SndDriverTwinkleRAM+$462).l
		lea	(UniBank_Index).l,a2
		clr.w	d0
		move.b	d1,d0
		add.w	d0,d0
		move.w	(a2,d0.w),d0
		lea	(a2,d0.w),a2
		tst.b	(a2)
		beq.s	loc_30F34
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		clr.b	d1
		lsr.w	#2,d1
		lea	(a6,d1.w),a6
		clr.w	d0
		move.b	(a2),d0
		bclr	#7,d0
		asl.w	#2,d0
		movea.l	dword_30F3A(pc,d0.w),a0
		jsr	(a0)

loc_30F34:
		movem.l	(sp)+,d0-d4/a0-a2/a6
		rts
; End of function sub_30EF0
; ---------------------------------------------------------------------------

dword_30F3A:
		dc.l 0
		dc.l loc_30F4E
		dc.l locret_30F96
		dc.l locret_30F96
		dc.l locret_30F96
; ---------------------------------------------------------------------------

loc_30F4E:
		clr.w	d0
		move.b	2(a2),d0
		beq.s	loc_30F6C
		move.b	d0,(SndDriverTwinkleRAM+$462).l
		lea	(SndDriverTwinkleRAM+$1E2).l,a6
		mulu.w	#$40,d0
		lea	(a6,d0.w),a6

loc_30F6C:
		move.b	(SndDriverTwinkleRAM+$462+1).l,d0
		cmp.b	5(a6),d0
		bne.s	locret_30F96
		move.w	#$2800,d1
		move.b	(SndDriverTwinkleRAM+$462).l,d1
		cmpi.b	#3,d1
		bcs.s	loc_30F8E
		addq.b	#1,d1

loc_30F8E:
		bsr.w	sub_31130
		bset	#0,(a6)

locret_30F96:
		rts

; =============== S U B R O U T I N E =======================================

sub_30F9E:
		tst.b	(a6)
		bpl.s	locret_30FAE
		move.b	(SndDriverTwinkleRAM+$467).l,d0
		cmp.b	2(a6),d0

locret_30FAE:
		rts
; End of function sub_30F9E

; =============== S U B R O U T I N E =======================================

sub_310A2:
		movem.l	d1/a1,-(sp)
		move.w	d1,-(sp)
		bsr.s	sub_3110C
		addi.w	#$1000,d1
		move.b	#$7F,d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		addi.w	#$4000,d1
		clr.b	d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		jsr	(a1)
		addi.w	#$400,d1
		addi.w	#$1000,d1
		clr.b	d1
		jsr	(a1)
		move.w	(sp)+,d1
		addi.w	#$2800,d1
		cmpi.b	#3,d1
		bcs.s	loc_31102
		addq.b	#1,d1

loc_31102:
		bsr.s	sub_31130
		movem.l	(sp)+,d1/a1
		rts
; End of function sub_310A2

; =============== S U B R O U T I N E =======================================

sub_3110C:
		cmpi.b	#3,d1
		bcc.s	loc_31122
		addi.b	#$30,d1
		lsl.w	#8,d1
		lea	sub_31130(pc),a1
		rts
; ---------------------------------------------------------------------------

loc_31122:
		addi.b	#$2D,d1
		lsl.w	#8,d1
		lea	sub_3114A(pc),a1
		rts
; End of function sub_3110C

; =============== S U B R O U T I N E =======================================

sub_31130:
		bsr.s	sub_31164
		ror.w	#8,d1
		move.b	d1,(ym2612_a0).l
		bsr.s	sub_31164
		ror.w	#8,d1
		move.b	d1,(ym2612_d0).l
		rts
; End of function sub_31130

; =============== S U B R O U T I N E =======================================

sub_3114A:
		bsr.s	sub_31164
		ror.w	#8,d1
		move.b	d1,(ym2612_a1).l
		bsr.s	sub_31164
		ror.w	#8,d1
		move.b	d1,(ym2612_d1).l
		rts
; End of function sub_3114A

; =============== S U B R O U T I N E =======================================

sub_31164:
		move.b	(ym2612_a0).l,d0
		bmi.s	sub_31164
		rts
; End of function sub_31164

; =============== S U B R O U T I N E =======================================

Z80TwinkleDriver:	binclude "Sound/Twinkle/Twinkle DAC Driver.bin"
	even

   if MOMPASS=1
		message " Twinkle Sound Driver Music Data ROM offset is $\{*}"
    endif
		include "Sound/Twinkle/Data/Music Data.asm"
		include "Sound/Twinkle/Data/Universal Data.asm"