; ---------------------------------------------------------------------------
; Programmed by Shigeharu Isoda.
; ---------------------------------------------------------------------------

   if MOMPASS=1
		message "Isoda Shigeharu Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverIsodaRAM	= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

PlaySound_Isoda:
		disableInts2
		movem.l	d1-d2/a0/a5,-(sp)
		andi.w	#$FF,d0
		beq.s	+
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		lsl.w	#2,d0
		lea	MusicIsoda_Index(pc),a0
		adda.l	-4(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		lea	(SndDriverIsodaRAM).l,a5
		movea.l	a5,a0
		move.w	8(a5),d2
		beq.s	loc_6A7B0
		cmpi.w	#7,d2
		bcc.s	loc_6A7EE
		subq.w	#1,d2

-		cmp.b	(a0)+,d0
		dbeq	d2,-
		beq.s	loc_6A7EE
		move.w	8(a5),d2
		movea.l	a5,a0

loc_6A7B0:
		move.b	d0,(a0,d2.w)
		addq.w	#1,8(a5)
		cmpi.b	#-7,d0
		bne.s	loc_6A7C8
		andi.w	#$FF,d1
		move.w	d1,$7DE(a5)
		bra.s	loc_6A7EE
; ---------------------------------------------------------------------------

loc_6A7C8:
		cmpi.b	#-8,d0
		bne.s	loc_6A7D8
		andi.w	#$FF,d1
		move.w	d1,$7E0(a5)
		bra.s	loc_6A7EE
; ---------------------------------------------------------------------------

loc_6A7D8:
		cmpi.b	#-9,d0
		bne.s	loc_6A7E4
		move.w	d1,$7E6(a5)
		bra.s	loc_6A7EE
; ---------------------------------------------------------------------------

loc_6A7E4:
		cmpi.b	#-$A,d0
		bne.s	loc_6A7EE
		move.b	d1,$7EB(a5)

loc_6A7EE:
		movem.l	(sp)+,d1-d2/a0/a5
		enableInts2
		rts

; =============== S U B R O U T I N E =======================================

Isoda_LoadData:
		movem.l	d0-a5,-(sp)
		stopZ80
		lea	(SndDriverIsodaRAM).l,a5
		lea	(ym2612_a0).l,a4
		lea	$A(a5),a3
		movea.l	a5,a0
		moveq	#0,d0
		move.w	#$3F8,d1

-		move.w	d0,(a0)+
		dbf	d1,-
		lea	byte_6D1DA(pc),a2
		moveq	#6,d6
		moveq	#0,d5
		moveq	#2,d7

-		movea.l	a2,a0
		move.l	a2,$44(a3)
		bsr.w	sub_6CA6A

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		subq.b	#1,d6
		lea	$64(a3),a3
		dbf	d7,-
		moveq	#2,d5
		moveq	#2,d6

-		movea.l	a2,a0
		move.l	a2,$44(a3)
		bsr.w	sub_6CA6A

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		lea	$64(a3),a3
		dbf	d6,---
		move.b	#$9F,(PSG_input).l
		move.b	#$BF,(PSG_input).l
		move.b	#$DF,(PSG_input).l
		move.b	#-1,(PSG_input).l
		move.w	#$101,$7EC(a5)
		move.w	#8,$7DC(a5)
		move.w	#$96,$7E2(a5)
		startZ80
		movem.l	(sp)+,d0-a5
		rts
; ---------------------------------------------------------------------------

loc_6A8FE:
		move.b	$7EB(a5),d1
		move.b	d1,$7F0(a5)
		bne.s	+
		move.b	d1,$7F1(a5)
+		rts
; ---------------------------------------------------------------------------

loc_6A90E:
		st	$7EE(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A914:
		clr.b	$7EE(a5)
		st	$7EF(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A91E:
		st	$7E9(a5)
		clr.b	$7EA(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A928:
		move.b	#1,$7E9(a5)
		clr.b	$7EA(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A934:
		move.w	$7DE(a5),$7DA(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A93C:
		move.w	$7E0(a5),$7DC(a5)
		rts
; ---------------------------------------------------------------------------

loc_6A944:
		move.w	$7E6(a5),$7EC(a5)
		clr.b	$7EA(a5)
		rts
; ---------------------------------------------------------------------------
		dc.w locret_6A96E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
		dc.w loc_6A8FE-locret_6A96E
		dc.w loc_6A944-locret_6A96E
		dc.w loc_6A93C-locret_6A96E
		dc.w loc_6A934-locret_6A96E
		dc.w loc_6A928-locret_6A96E
		dc.w loc_6A91E-locret_6A96E
		dc.w loc_6A914-locret_6A96E
		dc.w loc_6A90E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
		dc.w locret_6A96E-locret_6A96E
; ---------------------------------------------------------------------------

locret_6A96E:
		rts

; =============== S U B R O U T I N E =======================================

UpdateMusic_Isoda:
		movem.l	d0-a5,-(sp)
		lea	(SndDriverIsodaRAM).l,a5
		lea	(ym2612_a0).l,a4
		tst.b	$7F1(a5)
		bne.s	loc_6A9A8

loc_6A984:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6A9A8
		startZ80
		nop
		bra.s	loc_6A984
; ---------------------------------------------------------------------------

loc_6A9A8:
		movea.l	a5,a0
		move.w	8(a5),d7
		bra.w	loc_6BA80
; ---------------------------------------------------------------------------

loc_6A9B2:
		lea	$A(a5),a3
		moveq	#0,d0
		move.b	(a0)+,d0
		beq.w	loc_6B6AE
		cmpi.b	#-$F,d0
		bcs.s	loc_6A9D4
		ext.w	d0
		add.w	d0,d0
		move.w	locret_6A96E(pc,d0.w),d0
		jsr	locret_6A96E(pc,d0.w)
		bra.w	loc_6B6AA
; ---------------------------------------------------------------------------

loc_6A9D4:
		lea	(SoundDriverMusicRAM).l,a2
		move.w	(a2)+,d0
		bmi.w	loc_6BA80
		bne.w	loc_6B05A
		tst.b	$7F1(a5)
		bne.w	loc_6AD8C
		moveq	#-1,d0
		moveq	#0,d5
		btst	#6,$3E8(a3)
		bne.w	loc_6AA82

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#0,1(a4)
		nop
		nop

loc_6AA82:
		btst	#6,$44C(a3)
		bne.w	loc_6AB0E

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#1,1(a4)
		nop
		nop

loc_6AB0E:
		btst	#6,$4B0(a3)
		bne.w	loc_6AB9A

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#2,1(a4)
		nop
		nop

loc_6AB9A:
		moveq	#2,d5
		btst	#6,$514(a3)
		bne.w	loc_6AC28

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#4,1(a4)
		nop
		nop

loc_6AC28:
		btst	#6,$578(a3)
		bne.w	loc_6ACB4

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#5,1(a4)
		nop
		nop

loc_6ACB4:
		btst	#6,$5DC(a3)
		bne.w	loc_6AD40

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#6,1(a4)
		nop
		nop

loc_6AD40:
		btst	#6,$640(a3)
		bne.s	loc_6AD50
		move.b	#$9F,(PSG_input).l

loc_6AD50:
		btst	#6,$6A4(a3)
		bne.s	loc_6AD60
		move.b	#$BF,(PSG_input).l

loc_6AD60:
		btst	#6,$708(a3)
		bne.s	loc_6AD70
		move.b	#$DF,(PSG_input).l

loc_6AD70:
		btst	#6,$76C(a3)
		bne.s	loc_6AD80
		move.b	#-1,(PSG_input).l

loc_6AD80:
		tst.w	$7E4(a5)
		bne.s	loc_6AD8C
		move.w	#-1,$7E4(a5)

loc_6AD8C:
		move.l	a2,d5
		subq.l	#2,d5
		lea	$3E8(a3),a3
		moveq	#0,d0
		move.l	#$7FFF,d2
		moveq	#-1,d3
		moveq	#1,d4
		swap	d4
		move.w	#$4000,d6
		move.w	d0,$7DA(a5)
		move.b	d0,$7E9(a5)
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6ADEE
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6ADEE:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AE32
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AE32:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AE76
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AE76:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AEBA
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AEBA:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AEFE
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AEFE:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AF42
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AF42:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AF86
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AF86:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6AFCA
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6AFCA:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6B00E
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6B00E:
		lea	$64(a3),a3
		and.w	d6,(a3)
		move.w	(a2)+,d1
		beq.s	loc_6B052
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		bset	#7,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)

loc_6B052:
		lea	$64(a3),a3
		bra.w	loc_6BA80
; ---------------------------------------------------------------------------

loc_6B05A:
		move.l	a2,d5
		subq.l	#2,d5
		moveq	#$1F,d1
		and.w	d0,d1
		move.b	$7E8(a5),d2
		beq.s	loc_6B07C
		btst	#6,d0
		bne.s	loc_6B076
		cmp.b	d2,d1
		bhi.w	loc_6BA80
		bra.s	loc_6B07C
; ---------------------------------------------------------------------------

loc_6B076:
		cmp.b	d2,d1
		bcc.w	loc_6BA80

loc_6B07C:
		move.b	d1,$7E8(a5)
		moveq	#0,d0
		move.w	$7DC(a5),d2
		swap	d2
		move.w	$7DC(a5),d2
		moveq	#-1,d3
		moveq	#1,d4
		swap	d4
		move.w	#$B000,d6
		move.w	(a2)+,d1
		beq.w	loc_6B162
		tst.b	$7F1(a5)
		bne.w	loc_6B124

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#0,1(a4)
		nop

loc_6B124:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B162:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.w	loc_6B232
		tst.b	$7F1(a5)
		bne.w	loc_6B1F4

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#1,1(a4)
		nop

loc_6B1F4:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B232:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.w	loc_6B302
		tst.b	$7F1(a5)
		bne.w	loc_6B2C4

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#2,1(a4)
		nop

loc_6B2C4:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B302:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.w	loc_6B3D2
		tst.b	$7F1(a5)
		bne.w	loc_6B394

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#4,1(a4)
		nop

loc_6B394:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B3D2:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.w	loc_6B4A2
		tst.b	$7F1(a5)
		bne.w	loc_6B464

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#5,1(a4)
		nop

loc_6B464:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B4A2:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.w	loc_6B572
		tst.b	$7F1(a5)
		bne.w	loc_6B534

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,2(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,3(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#6,1(a4)
		nop

loc_6B534:
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B572:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.s	loc_6B5C0
		move.b	#$9F,(PSG_input).l
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B5C0:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.s	loc_6B60E
		move.b	#$BF,(PSG_input).l
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B60E:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.s	loc_6B65C
		move.b	#$DF,(PSG_input).l
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B65C:
		lea	$64(a3),a3
		move.w	(a2)+,d1
		beq.s	loc_6B6AA
		move.b	#-1,(PSG_input).l
		movea.l	d5,a1
		adda.w	d1,a1
		move.l	a1,8(a3)
		move.w	d6,(a3)
		move.l	d3,$14(a3)
		move.l	d0,$18(a3)
		move.l	d2,2(a3)
		move.w	#$C0FF,6(a3)
		move.l	d0,$30(a3)
		move.l	d4,$10(a3)
		move.l	d4,$C(a3)
		move.l	d3,$58(a3)
		move.b	d0,$5B(a3)
		move.w	d0,$60(a3)
		move.w	d0,$48(a3)
		bset	#6,$3E8(a3)

loc_6B6AA:
		bra.w	loc_6BA80
; ---------------------------------------------------------------------------

loc_6B6AE:
		tst.b	$7F1(a5)
		bne.w	loc_6BA50
		moveq	#-1,d0
		moveq	#0,d5
		btst	#6,$3E8(a3)
		bne.w	loc_6B746

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#0,1(a4)
		nop
		nop

loc_6B746:
		btst	#6,$44C(a3)
		bne.w	loc_6B7D2

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#1,1(a4)
		nop
		nop

loc_6B7D2:
		btst	#6,$4B0(a3)
		bne.w	loc_6B85E

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#2,1(a4)
		nop
		nop

loc_6B85E:
		moveq	#2,d5
		btst	#6,$514(a3)
		bne.w	loc_6B8EC

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#4,1(a4)
		nop
		nop

loc_6B8EC:
		btst	#6,$578(a3)
		bne.w	loc_6B978

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#5,1(a4)
		nop
		nop

loc_6B978:
		btst	#6,$5DC(a3)
		bne.w	loc_6BA04

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#6,1(a4)
		nop
		nop

loc_6BA04:
		btst	#6,$640(a3)
		bne.s	loc_6BA14
		move.b	#$9F,(PSG_input).l

loc_6BA14:
		btst	#6,$6A4(a3)
		bne.s	loc_6BA24
		move.b	#$BF,(PSG_input).l

loc_6BA24:
		btst	#6,$708(a3)
		bne.s	loc_6BA34
		move.b	#$DF,(PSG_input).l

loc_6BA34:
		btst	#6,$76C(a3)
		bne.s	loc_6BA44
		move.b	#-1,(PSG_input).l

loc_6BA44:
		tst.w	$7E4(a5)
		bne.s	loc_6BA50
		move.w	#-1,$7E4(a5)

loc_6BA50:
		lea	$A(a5),a3
		move.w	#$4000,d0
		and.w	d0,$3E8(a3)
		and.w	d0,$44C(a3)
		and.w	d0,$4B0(a3)
		and.w	d0,$514(a3)
		and.w	d0,$578(a3)
		and.w	d0,$5DC(a3)
		and.w	d0,$640(a3)
		and.w	d0,$6A4(a3)
		and.w	d0,$708(a3)
		and.w	d0,$76C(a3)

loc_6BA80:
		dbf	d7,loc_6A9B2
		tst.b	$7F1(a5)
		bne.s	loc_6BA92
		startZ80

loc_6BA92:
		moveq	#0,d5
		move.w	d5,8(a5)
		move.b	$7E9(a5),d1
		beq.s	loc_6BADA
		subq.b	#1,$7EA(a5)
		bcc.s	loc_6BADA
		move.b	$7ED(a5),$7EA(a5)
		move.b	$7EC(a5),d0
		ext.w	d0
		tst.b	d1
		bpl.s	loc_6BACC
		add.w	d0,$7DA(a5)
		cmpi.w	#$7F,$7DA(a5)
		blt.s	loc_6BADA
		move.b	d5,$7E9(a5)
		move.w	#$7F,$7DA(a5)
		bra.s	loc_6BADA
; ---------------------------------------------------------------------------

loc_6BACC:
		sub.w	d0,$7DA(a5)
		bgt.s	loc_6BADA
		move.b	d5,$7E9(a5)
		move.w	d5,$7DA(a5)

loc_6BADA:
		lea	$A(a5),a3
		tst.b	$7EE(a5)
		bne.w	loc_6BC6A
		lea	byte_7031C(pc),a1
		moveq	#0,d5
		tst.b	(a3)
		bpl.s	loc_6BAF8
		moveq	#0,d7
		moveq	#0,d6
		bsr.w	sub_6C4D6

loc_6BAF8:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB08
		moveq	#1,d7
		moveq	#1,d6
		bsr.w	sub_6C4D6

loc_6BB08:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB18
		moveq	#2,d7
		moveq	#2,d6
		bsr.w	sub_6C4D6

loc_6BB18:
		lea	$64(a3),a3
		moveq	#2,d5
		tst.b	(a3)
		bpl.s	loc_6BB2A
		moveq	#0,d7
		moveq	#4,d6
		bsr.w	sub_6C4D6

loc_6BB2A:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB3A
		moveq	#1,d7
		moveq	#5,d6
		bsr.w	sub_6C4D6

loc_6BB3A:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB4A
		moveq	#2,d7
		moveq	#6,d6
		bsr.w	sub_6C4D6

loc_6BB4A:
		lea	$64(a3),a3
		lea	byte_71B1C(pc),a1
		tst.b	(a3)
		bpl.s	loc_6BB5E
		moveq	#-$80,d7
		moveq	#-$70,d6
		bsr.w	sub_6C4D6

loc_6BB5E:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB6E
		moveq	#-$60,d7
		moveq	#-$50,d6
		bsr.w	sub_6C4D6

loc_6BB6E:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB7E
		moveq	#-$40,d7
		moveq	#-$30,d6
		bsr.w	sub_6C4D6

loc_6BB7E:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BB8E
		moveq	#-$20,d7
		moveq	#-$10,d6
		bsr.w	sub_6C4D6

loc_6BB8E:
		lea	$64(a3),a3
		moveq	#0,d5
		lea	byte_7031C(pc),a1
		tst.b	(a3)
		bpl.s	loc_6BBA4
		moveq	#0,d7
		moveq	#0,d6
		bsr.w	sub_6C4D6

loc_6BBA4:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BBB4
		moveq	#1,d7
		moveq	#1,d6
		bsr.w	sub_6C4D6

loc_6BBB4:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BBC4
		moveq	#2,d7
		moveq	#2,d6
		bsr.w	sub_6C4D6

loc_6BBC4:
		lea	$64(a3),a3
		moveq	#2,d5
		tst.b	(a3)
		bpl.s	loc_6BBD6
		moveq	#0,d7
		moveq	#4,d6
		bsr.w	sub_6C4D6

loc_6BBD6:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BBE6
		moveq	#1,d7
		moveq	#5,d6
		bsr.w	sub_6C4D6

loc_6BBE6:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BBF6
		moveq	#2,d7
		moveq	#6,d6
		bsr.w	sub_6C4D6

loc_6BBF6:
		lea	$64(a3),a3
		lea	byte_71B1C(pc),a1
		tst.b	(a3)
		bpl.s	loc_6BC0A
		moveq	#-$80,d7
		moveq	#-$70,d6
		bsr.w	sub_6C4D6

loc_6BC0A:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BC1A
		moveq	#-$60,d7
		moveq	#-$50,d6
		bsr.w	sub_6C4D6

loc_6BC1A:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BC2A
		moveq	#-$40,d7
		moveq	#-$30,d6
		bsr.w	sub_6C4D6

loc_6BC2A:
		lea	$64(a3),a3
		tst.b	(a3)
		bpl.s	loc_6BC3A
		moveq	#-$20,d7
		moveq	#-$10,d6
		bsr.w	sub_6C4D6

loc_6BC3A:
		lea	$64(a3),a3
		clr.b	$7EF(a5)

loc_6BC42:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6BC66
		startZ80
		nop
		bra.s	loc_6BC42
; ---------------------------------------------------------------------------

loc_6BC66:
		bra.w	loc_6BFCC
; ---------------------------------------------------------------------------

loc_6BC6A:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6BC8E
		startZ80
		nop
		bra.s	loc_6BC6A
; ---------------------------------------------------------------------------

loc_6BC8E:
		moveq	#-1,d0
		moveq	#0,d5

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#0,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#1,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#2,1(a4)
		nop
		nop
		moveq	#2,d5

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#4,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#5,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#6,1(a4)
		nop
		nop
		move.b	#$9F,(PSG_input).l
		move.b	#$BF,(PSG_input).l
		move.b	#$DF,(PSG_input).l
		move.b	#-1,(PSG_input).l
		tst.w	$7E4(a5)
		bne.s	loc_6BFCC
		move.w	#-1,$7E4(a5)

loc_6BFCC:
		lea	(Z80_RAM).l,a1
		tst.b	$7EE(a5)
		beq.s	loc_6BFE4
		clr.b	$C29(a1)
		st	$C20(a1)
		bra.w	loc_6C098
; ---------------------------------------------------------------------------

loc_6BFE4:
		move.w	$7E4(a5),d0
		beq.w	loc_6C098
		cmpi.w	#-1,d0
		bne.s	loc_6C004
		tst.b	$C25(a1)
		bne.s	loc_6C000
		clr.b	$C29(a1)
		st	$C20(a1)

loc_6C000:
		bra.w	loc_6C098
; ---------------------------------------------------------------------------

loc_6C004:
		move.b	$7E4(a5),d1
		bne.s	loc_6C014
		cmpi.w	#$18,$7DA(a5)
		bcc.w	loc_6C098

loc_6C014:
		cmp.b	$C25(a1),d1
		bcs.w	loc_6C098
		move.b	d1,$C25(a1)
		andi.w	#$FF,d0
		lsl.w	#4,d0
		lea	(IsodaDAC_Index).l,a0
		movem.l	-$10(a0,d0.w),d0-d3
		add.l	a0,d1
		lea	$C29(a1),a1
		move.b	#4,(a1)+
		move.b	#$A,(a1)+
		move.b	$62(a5),(a1)+
		move.b	#$C,(a1)+
		move.b	d2,(a1)+
		rol.l	#8,d2
		move.b	d2,(a1)+
		rol.l	#8,d2
		bra.s	loc_6C08C
; ---------------------------------------------------------------------------

loc_6C04E:
		move.b	#6,(a1)+
		move.l	d1,d4
		lsr.l	#8,d4
		move.b	d4,(a1)+
		lsr.w	#8,d4
		move.b	d4,(a1)+
		move.b	d2,(a1)+
		move.l	d1,d4
		andi.l	#$7FFF,d4
		move.l	#$8000,d3
		sub.l	d4,d3
		cmp.l	d3,d0
		bge.s	loc_6C074
		move.l	d0,d3

loc_6C074:
		sub.l	d3,d0
		move.w	d3,d4
		move.b	d4,(a1)+
		lsr.w	#8,d4
		move.b	d4,(a1)+
		move.w	d1,d4
		ori.w	#$8000,d4
		move.b	d4,(a1)+
		lsr.w	#8,d4
		move.b	d4,(a1)+
		add.l	d3,d1

loc_6C08C:
		tst.l	d0
		bgt.s	loc_6C04E
		clr.b	(a1)+
		st	(Z80_RAM+$C20).l

loc_6C098:
		clr.w	$7E4(a5)
		tst.b	$7F0(a5)
		beq.w	loc_6C4C8
		tst.b	$7F1(a5)
		bne.w	loc_6C3F0
		move.b	$C25(a1),$7F1(a5)
		beq.w	loc_6C3EC
		lea	$A(a5),a3
		moveq	#-1,d0
		moveq	#0,d5

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#0,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#1,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#2,1(a4)
		nop
		nop
		moveq	#2,d5

-		tst.b	(a4)
		bmi.s	-
		move.b	#$80,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$84,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$88,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8C,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#4,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$81,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$85,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$89,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8D,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#5,1(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$82,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$86,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8A,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$8E,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,1(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	#6,1(a4)
		nop
		nop
		move.b	#$9F,(PSG_input).l
		move.b	#$BF,(PSG_input).l
		move.b	#$DF,(PSG_input).l
		move.b	#-1,(PSG_input).l

loc_6C3EC:
		bra.w	loc_6C4C8
; ---------------------------------------------------------------------------

loc_6C3F0:
		move.b	$C25(a1),$7F1(a5)
		bne.w	loc_6C4C8
		lea	$A(a5),a3
		moveq	#-1,d0
		bset	#4,(a3)
		move.w	d0,$16(a3)
		bset	#4,$64(a3)
		move.w	d0,$7A(a3)
		bset	#4,$C8(a3)
		move.w	d0,$DE(a3)
		bset	#4,$12C(a3)
		move.w	d0,$142(a3)
		bset	#4,$190(a3)
		move.w	d0,$1A6(a3)
		bset	#4,$1F4(a3)
		move.w	d0,$20A(a3)
		bset	#4,$258(a3)
		move.w	d0,$26E(a3)
		bset	#4,$2BC(a3)
		move.w	d0,$2D2(a3)
		bset	#4,$320(a3)
		move.w	d0,$336(a3)
		bset	#4,$384(a3)
		move.w	d0,$39A(a3)
		bset	#4,$3E8(a3)
		move.w	d0,$3FE(a3)
		bset	#4,$44C(a3)
		move.w	d0,$462(a3)
		bset	#4,$4B0(a3)
		move.w	d0,$4C6(a3)
		bset	#4,$514(a3)
		move.w	d0,$52A(a3)
		bset	#4,$578(a3)
		move.w	d0,$58E(a3)
		bset	#4,$5DC(a3)
		move.w	d0,$5F2(a3)
		bset	#4,$640(a3)
		move.w	d0,$656(a3)
		bset	#4,$6A4(a3)
		move.w	d0,$6BA(a3)
		bset	#4,$708(a3)
		move.w	d0,$71E(a3)
		bset	#4,$76C(a3)
		move.w	d0,$782(a3)

loc_6C4C8:
		startZ80
		movem.l	(sp)+,d0-a5
		rts
; End of function SndIsodaDrvInit

; =============== S U B R O U T I N E =======================================

sub_6C4D6:
		tst.b	$7EF(a5)
		beq.s	loc_6C4E0
		bset	#4,(a3)

loc_6C4E0:
		move.l	$10(a3),d0
		sub.l	d0,$C(a3)
		bgt.s	loc_6C504

loc_6C4EA:
		move.w	(a3),$60(a3)
		bclr	#3,1(a3)
		bsr.w	sub_6C838
		move.l	$C(a3),d0
		bmi.s	loc_6C4EA
		move.l	d0,$5C(a3)

loc_6C504:
		tst.b	d7
		bmi.s	loc_6C510
		btst	#4,(a3)
		beq.s	loc_6C510
		rts
; ---------------------------------------------------------------------------

loc_6C510:
		move.w	$14(a3),d2
		move.w	d2,d3
		btst	#2,1(a3)
		beq.s	loc_6C544
		movea.l	$34(a3),a0

loc_6C522:
		move.w	(a0)+,d0
		cmpi.w	#$8000,d0
		beq.s	loc_6C538
		cmpi.w	#$8001,d0
		beq.s	loc_6C53E
		add.w	d0,d2
		move.l	a0,$34(a3)
		bra.s	loc_6C544
; ---------------------------------------------------------------------------

loc_6C538:
		move.l	a0,$38(a3)
		bra.s	loc_6C522
; ---------------------------------------------------------------------------

loc_6C53E:
		movea.l	$38(a3),a0
		bra.s	loc_6C522
; ---------------------------------------------------------------------------

loc_6C544:
		btst	#3,1(a3)
		beq.s	loc_6C568
		move.w	$48(a3),d0
		move.w	$5C(a3),d1
		sub.w	$C(a3),d1
		blt.s		loc_6C566
		tst.w	$5C(a3)
		ble.s		loc_6C566
		muls.w	d1,d0
		divs.w	$5C(a3),d0

loc_6C566:
		add.w	d0,d2

loc_6C568:
		tst.b	d7
		bmi.w	loc_6C6FE
		tst.b	$7F1(a5)
		bne.w	locret_6C618
		btst	#6,(a3)
		bne.w	locret_6C618

loc_6C580:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6C5A4
		startZ80
		nop
		bra.s	loc_6C580
; ---------------------------------------------------------------------------

loc_6C5A4:
		move.w	d3,$14(a3)
		bmi.s	loc_6C5EC
		cmp.w	$16(a3),d2
		beq.s	loc_6C5EC
		move.w	d2,$16(a3)
		add.w	d2,d2
		moveq	#-$5C,d1
		or.b	d7,d1

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a1,d2.w),1(a4,d5.w)
		nop
		subq.b	#4,d1

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	1(a1,d2.w),1(a4,d5.w)
		nop

loc_6C5EC:
		bsr.s	sub_6C61A
		tst.b	$5B(a3)
		bne.s	loc_6C610
		moveq	#-$4C,d0
		or.b	d7,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	6(a3),1(a4,d5.w)
		nop

loc_6C610:
		startZ80

locret_6C618:
		rts
; End of function sub_6C4D6

; =============== S U B R O U T I N E =======================================

sub_6C61A:
		move.w	2(a3),d1
		btst	#5,(a3)
		bne.s	loc_6C62A
		add.w	$7DA(a5),d1

loc_6C62A:
		cmp.w	4(a3),d1
		beq.w	locret_6C6FC
		move.w	d1,4(a3)
		move.b	7(a3),d4
		moveq	#$40,d0
		or.b	d7,d0
		moveq	#0,d3
		move.b	$40(a3),d3
		add.b	d4,d4
		bcc.s	loc_6C656
		add.w	d1,d3
		bpl.s	loc_6C64E
		moveq	#0,d3

loc_6C64E:
		cmpi.w	#$80,d3
		bcs.s	loc_6C656
		moveq	#$7F,d3

loc_6C656:
		tst.b	(a4)
		bmi.s	loc_6C656
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4,d5.w)
		nop
		addq.b	#4,d0
		moveq	#0,d3
		move.b	$41(a3),d3
		add.b	d4,d4
		bcc.s	loc_6C686
		add.w	d1,d3
		bpl.s	loc_6C67E
		moveq	#0,d3

loc_6C67E:
		cmpi.w	#$80,d3
		bcs.s	loc_6C686
		moveq	#$7F,d3

loc_6C686:
		tst.b	(a4)
		bmi.s	loc_6C686
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4,d5.w)
		nop
		addq.b	#4,d0
		moveq	#0,d3
		move.b	$42(a3),d3
		add.b	d4,d4
		bcc.s	loc_6C6B6
		add.w	d1,d3
		bpl.s	loc_6C6AE
		moveq	#0,d3

loc_6C6AE:
		cmpi.w	#$80,d3
		bcs.s	loc_6C6B6
		moveq	#$7F,d3

loc_6C6B6:
		tst.b	(a4)
		bmi.s	loc_6C6B6
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4,d5.w)
		nop
		addq.b	#4,d0
		moveq	#0,d3
		move.b	$43(a3),d3
		add.b	d4,d4
		bcc.s	loc_6C6E6
		add.w	d1,d3
		bpl.s	loc_6C6DE
		moveq	#0,d3

loc_6C6DE:
		cmpi.w	#$80,d3
		bcs.s	loc_6C6E6
		moveq	#$7F,d3

loc_6C6E6:
		tst.b	(a4)
		bmi.s	loc_6C6E6
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d3,1(a4,d5.w)
		nop

locret_6C6FC:
		rts
; End of function sub_6C61A
; ---------------------------------------------------------------------------

loc_6C6FE:
		cmpi.b	#$E0,d7
		bne.s	loc_6C730
		move.b	$59(a3),d0
		bmi.s	loc_6C76A
		or.b	$5A(a3),d0
		cmp.b	$58(a3),d0
		beq.s	loc_6C76A
		move.b	d0,$58(a3)
		tst.b	$7F1(a5)
		bne.s	loc_6C72E
		or.b	d7,d0
		btst	#6,(a3)
		bne.s	loc_6C72E
		move.b	d0,(PSG_input).l

loc_6C72E:
		bra.s	loc_6C76A
; ---------------------------------------------------------------------------

loc_6C730:
		move.w	d3,$14(a3)
		bmi.s	loc_6C76A
		cmp.w	$16(a3),d2
		beq.s	loc_6C76A
		move.w	d2,$16(a3)
		btst	#6,(a3)
		bne.s	loc_6C76A
		add.w	d2,d2
		move.b	(a1,d2.w),d1
		or.b	d7,d1
		moveq	#$11,d0
		and.b	1(a3),d0
		beq.s	loc_6C76A
		tst.b	$7F1(a5)
		bne.s	loc_6C76A
		move.b	d1,(PSG_input).l
		move.b	1(a1,d2.w),(PSG_input).l

loc_6C76A:
		move.w	2(a3),d0
		btst	#5,(a3)
		bne.s	loc_6C77A
		add.w	$7DA(a5),d0

loc_6C77A:
		lsr.b	#3,d0
		btst	#0,1(a3)
		beq.s	loc_6C7C8
		tst.b	$32(a3)
		bmi.s	loc_6C7A0
		subq.b	#1,$32(a3)
		bcc.s	loc_6C7A0
		movea.l	$4E(a3),a0
		move.b	(a0)+,$32(a3)
		move.b	(a0)+,$33(a3)
		move.l	a0,$4E(a3)

loc_6C7A0:
		add.b	$33(a3),d0
		bpl.s	loc_6C7A8
		moveq	#0,d0

loc_6C7A8:
		cmpi.b	#$10,d0
		bcs.s	loc_6C7B0
		moveq	#$F,d0

loc_6C7B0:
		tst.b	$7F1(a5)
		bne.s	locret_6C7C6
		or.b	d6,d0
		btst	#6,(a3)
		bne.s	locret_6C7C6
		move.b	d0,(PSG_input).l

locret_6C7C6:
		rts
; ---------------------------------------------------------------------------

loc_6C7C8:
		btst	#4,1(a3)
		beq.s	loc_6C81E
		move.b	$56(a3),d1
		subq.b	#1,$55(a3)
		bcc.s	loc_6C7F2
		move.b	$54(a3),$55(a3)
		add.b	$53(a3),d1
		cmpi.b	#$F,d1
		bcs.s	loc_6C7F2
		bclr	#4,1(a3)
		bra.s	loc_6C81E
; ---------------------------------------------------------------------------

loc_6C7F2:
		add.b	d1,d0
		cmpi.b	#$F,d0
		bcs.s	loc_6C802
		bclr	#4,1(a3)
		moveq	#$F,d0

loc_6C802:
		move.b	d1,$56(a3)
		tst.b	$7F1(a5)
		bne.s	locret_6C81C
		or.b	d6,d0
		btst	#6,(a3)
		bne.s	locret_6C81C
		move.b	d0,(PSG_input).l

locret_6C81C:
		rts
; ---------------------------------------------------------------------------

loc_6C81E:
		tst.b	$7F1(a5)
		bne.s	locret_6C836
		moveq	#$F,d0
		or.b	d6,d0
		btst	#6,(a3)
		bne.s	locret_6C836
		move.b	d0,(PSG_input).l

locret_6C836:
		rts

; =============== S U B R O U T I N E =======================================

sub_6C838:
		movea.l	8(a3),a2

loc_6C83C:
		bclr	#5,1(a3)
		bne.w	loc_6C8EE
		moveq	#0,d0
		move.b	(a2)+,d0
		beq.w	loc_6C8EE
		cmpi.b	#$C0,d0
		bcc.w	loc_6C9E8
		cmpi.b	#$60,d0
		bcs.s	loc_6C866
		subi.b	#$60,d0
		bset	#5,1(a3)

loc_6C866:
		add.w	$1A(a3),d0
		asl.w	#5,d0
		add.w	$18(a3),d0
		move.w	d0,$14(a3)
		tst.b	d7
		bmi.w	loc_6C982
		moveq	#-$10,d0
		bset	#0,1(a3)
		beq.s	loc_6C8E6
		bclr	#1,1(a3)
		bne.w	loc_6C974
		move.l	$3C(a3),$34(a3)
		btst	#6,(a3)
		bne.s	loc_6C8E4
		tst.b	$7F1(a5)
		bne.s	loc_6C8E4

loc_6C8A2:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6C8C6
		startZ80
		nop
		bra.s	loc_6C8A2
; ---------------------------------------------------------------------------

loc_6C8C6:
		tst.b	(a4)
		bmi.s	loc_6C8C6
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		startZ80

loc_6C8E4:
		bra.s	loc_6C90C
; ---------------------------------------------------------------------------

loc_6C8E6:
		move.l	$3C(a3),$34(a3)
		bra.s	loc_6C90C
; ---------------------------------------------------------------------------

loc_6C8EE:
		bclr	#3,$61(a3)
		beq.s	loc_6C8FE
		move.w	$48(a3),d0
		add.w	d0,$14(a3)

loc_6C8FE:
		tst.b	d7
		bmi.w	loc_6C9B4
		moveq	#0,d0
		bclr	#0,1(a3)

loc_6C90C:
		btst	#6,(a3)
		bne.s	loc_6C974
		tst.b	$7F1(a5)
		bne.s	loc_6C974

loc_6C91A:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6C93E
		startZ80
		nop
		bra.s	loc_6C91A
; ---------------------------------------------------------------------------

loc_6C93E:
		move.b	d0,d2
		beq.s	loc_6C954
		bclr	#4,(a3)
		beq.s	loc_6C954
		movea.l	$44(a3),a0
		bsr.w	sub_6CA6A
		bsr.w	sub_6C61A

loc_6C954:
		or.w	d6,d2

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d2,1(a4)
		nop
		startZ80

loc_6C974:
		moveq	#0,d0
		move.b	(a2)+,d0
		add.w	d0,$C(a3)
		move.l	a2,8(a3)
		rts
; ---------------------------------------------------------------------------

loc_6C982:
		bclr	#4,1(a3)
		bclr	#1,1(a3)
		bne.s	loc_6C9A0
		move.l	$3C(a3),$34(a3)
		move.l	$4A(a3),$4E(a3)
		clr.b	$32(a3)

loc_6C9A0:
		bset	#0,1(a3)
		moveq	#0,d0
		move.b	(a2)+,d0
		add.w	d0,$C(a3)
		move.l	a2,8(a3)
		rts
; ---------------------------------------------------------------------------

loc_6C9B4:
		moveq	#0,d0
		move.b	(a2)+,d0
		add.w	d0,$C(a3)
		move.l	a2,8(a3)
		bclr	#0,1(a3)
		bne.s	loc_6C9CA
		rts
; ---------------------------------------------------------------------------

loc_6C9CA:
		bset	#4,1(a3)
		clr.b	$55(a3)
		move.b	$52(a3),d0
		cmp.b	$33(a3),d0
		bcc.s	loc_6C9E2
		move.b	$33(a3),d0

loc_6C9E2:
		move.b	d0,$56(a3)
		rts
; ---------------------------------------------------------------------------

loc_6C9E8:
		andi.w	#$3F,d0
		add.w	d0,d0
		move.w	off_6C9F6(pc,d0.w),d0
		jmp	off_6C9F6(pc,d0.w)
; End of function sub_6C838
; ---------------------------------------------------------------------------

off_6C9F6:
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6CA3A-off_6C9F6
		dc.w loc_6CA48-off_6C9F6
		dc.w loc_6CC78-off_6C9F6
		dc.w loc_6CC94-off_6C9F6
		dc.w loc_6CCA0-off_6C9F6
		dc.w loc_6CCAC-off_6C9F6
		dc.w loc_6CCB8-off_6C9F6
		dc.w loc_6CCC4-off_6C9F6
		dc.w loc_6CCE0-off_6C9F6
		dc.w loc_6CCF6-off_6C9F6
		dc.w loc_6CD08-off_6C9F6
		dc.w loc_6CD2C-off_6C9F6
		dc.w loc_6CD36-off_6C9F6
		dc.w loc_6CD66-off_6C9F6
		dc.w loc_6CD7C-off_6C9F6
		dc.w loc_6CD88-off_6C9F6
		dc.w loc_6CD9C-off_6C9F6
		dc.w loc_6D13A-off_6C9F6
		dc.w loc_6D166-off_6C9F6
		dc.w loc_6D18A-off_6C9F6
		dc.w loc_6D192-off_6C9F6
		dc.w loc_6D19A-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6D1D0-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6CA36-off_6C9F6
		dc.w loc_6D1A2-off_6C9F6
		dc.w loc_6CFD2-off_6C9F6
; ---------------------------------------------------------------------------

loc_6CA36:
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CA3A:
		move.b	(a2),d0
		lsl.w	#8,d0
		move.b	1(a2),d0
		adda.w	d0,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CA48:
		lea	InstrumentsIsoda(pc),a0
		moveq	#0,d0
		move.b	(a2)+,d0
		lsl.w	#5,d0
		adda.w	d0,a0
		move.l	a0,$44(a3)
		move.l	(a0),$40(a3)
		move.b	$1A(a0),7(a3)
		bset	#4,(a3)
		bra.w	loc_6C83C

; =============== S U B R O U T I N E =======================================

sub_6CA6A:
		move.l	(a0)+,$40(a3)
		moveq	#$30,d0
		or.b	d7,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		add.b	#$14,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		add.b	#$24,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	(a0)+,1(a4,d5.w)
		nop
		move.b	(a0)+,7(a3)
		move.w	#$8000,4(a3)
		rts
; End of function sub_6CA6A
; ---------------------------------------------------------------------------

loc_6CC78:
		moveq	#0,d0
		move.b	(a2)+,d0
		moveq	#$C,d1
		lsl.l	d1,d0
		divu.w	$7E2(a5),d0
		andi.l	#$FFFF,d0
		lsl.l	#4,d0
		move.l	d0,$10(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CC94:
		move.b	(a2)+,d0
		ext.w	d0
		move.w	d0,$18(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCA0:
		move.b	(a2)+,d0
		ext.w	d0
		add.w	d0,$18(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCAC:
		move.b	(a2)+,d0
		ext.w	d0
		move.w	d0,$1A(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCB8:
		move.b	(a2)+,d0
		ext.w	d0
		add.w	d0,$1A(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCC4:
		moveq	#0,d1
		move.b	$31(a3),d1
		addq.b	#4,$31(a3)
		move.b	(a2)+,d0
		lsl.w	#8,d0
		move.b	(a2)+,d0
		move.l	a2,$1C(a3,d1.w)
		adda.w	d0,a2
		subq.l	#2,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCE0:
		subq.b	#4,$31(a3)
		bmi.w	loc_6CD9C
		moveq	#0,d0
		move.b	$31(a3),d0
		movea.l	$1C(a3,d0.w),a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CCF6:
		moveq	#0,d1
		move.b	$30(a3),d1
		addq.b	#1,$30(a3)
		move.b	(a2)+,$2C(a3,d1.w)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD08:
		moveq	#0,d1
		move.b	$30(a3),d1
		subq.b	#1,$2B(a3,d1.w)
		bcs.s	loc_6CD22
		move.b	(a2),d0
		lsl.w	#8,d0
		move.b	1(a2),d0
		adda.w	d0,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD22:
		subq.b	#1,$30(a3)
		addq.l	#2,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD2C:
		bset	#1,1(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD36:
		moveq	#0,d0
		move.b	(a2)+,d0
		beq.s	loc_6CD5C
		bset	#2,1(a3)
		lea	word_6D576(pc),a0
		add.w	d0,d0
		adda.w	-2(a0,d0.w),a0
		move.l	a0,$3C(a3)
		move.l	a0,$34(a3)
		move.l	a0,$38(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD5C:
		bclr	#2,1(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD66:
		moveq	#$7F,d0
		sub.b	(a2)+,d0
		btst	#5,(a3)
		beq.s	loc_6CD74
		add.w	$7DC(a5),d0

loc_6CD74:
		move.w	d0,2(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD7C:
		move.b	(a2)+,d0
		ext.w	d0
		sub.w	d0,2(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD88:
		move.b	(a2)+,d0
		ext.w	d0
		asl.w	#5,d0
		move.w	d0,$48(a3)
		bset	#3,1(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6CD9C:
		move.w	#$7F,2(a3)
		move.b	#$F,$56(a3)
		clr.w	$C(a3)
		btst	#5,(a3)
		bne.w	loc_6CE98
		andi.w	#$4000,(a3)
		beq.s	loc_6CDBC
		rts
; ---------------------------------------------------------------------------

loc_6CDBC:
		tst.b	d7
		bmi.w	loc_6CE76
		moveq	#-$80,d0
		or.b	d7,d0
		moveq	#-1,d1
		tst.b	$7F1(a5)
		bne.w	locret_6CE72

loc_6CDD0:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6CDF4
		startZ80
		nop
		bra.s	loc_6CDD0
; ---------------------------------------------------------------------------

loc_6CDF4:
		tst.b	(a4)
		bmi.s	loc_6CDF4
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		startZ80

locret_6CE72:
		rts
; ---------------------------------------------------------------------------

loc_6CE76:
		tst.b	$7F1(a5)
		bne.s	loc_6CE86
		moveq	#$F,d0
		or.b	d6,d0
		move.b	d0,(PSG_input).l

loc_6CE86:
		lea	dword_6D1F4(pc),a0
		move.l	a0,$4E(a3)
		move.l	a0,$4A(a3)
		rts
; ---------------------------------------------------------------------------

loc_6CE98:
		clr.w	(a3)
		move.w	#-1,$3FE(a3)
		st	$440(a3)
		bclr	#6,$3E8(a3)
		lea	$A(a5),a0
		btst	#5,(a0)
		bne.s	loc_6CF02
		btst	#5,$64(a0)
		bne.s	loc_6CF02
		btst	#5,$C8(a0)
		bne.s	loc_6CF02
		btst	#5,$12C(a0)
		bne.s	loc_6CF02
		btst	#5,$190(a0)
		bne.s	loc_6CF02
		btst	#5,$1F4(a0)
		bne.s	loc_6CF02
		btst	#5,$258(a0)
		bne.s	loc_6CF02
		btst	#5,$2BC(a0)
		bne.s	loc_6CF02
		btst	#5,$320(a0)
		bne.s	loc_6CF02
		btst	#5,$384(a0)
		bne.s	loc_6CF02
		clr.b	$7E8(a5)

loc_6CF02:
		tst.b	d7
		bmi.w	loc_6CFC0
		moveq	#-$80,d0
		or.b	d7,d0
		moveq	#-1,d1
		tst.b	$7F1(a5)
		bne.w	loc_6CFB8

loc_6CF16:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6CF3A
		startZ80
		nop
		bra.s	loc_6CF16
; ---------------------------------------------------------------------------

loc_6CF3A:
		tst.b	(a4)
		bmi.s	loc_6CF3A
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	d0,(a4,d5.w)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d1,1(a4,d5.w)
		nop
		addq.b	#4,d0

-		tst.b	(a4)
		bmi.s	-
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		startZ80

loc_6CFB8:
		bset	#4,$3E8(a3)
		bra.s	locret_6CFD0
; ---------------------------------------------------------------------------

loc_6CFC0:
		tst.b	$7F1(a5)
		bne.s	locret_6CFD0
		moveq	#$F,d0
		or.b	d6,d0
		move.b	d0,(PSG_input).l

locret_6CFD0:
		rts
; ---------------------------------------------------------------------------

loc_6CFD2:
		clr.w	$C(a3)
		btst	#5,(a3)
		bne.w	loc_6D05E
		andi.w	#$4000,(a3)
		bset	#4,(a3)
		btst	#6,(a3)
		beq.s	loc_6CFEE
		rts
; ---------------------------------------------------------------------------

loc_6CFEE:
		tst.b	d7
		bmi.s	loc_6D03C
		tst.b	$7F1(a5)
		bne.s	locret_6D03A

loc_6CFF8:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6D01C
		startZ80
		nop
		bra.s	loc_6CFF8
; ---------------------------------------------------------------------------

loc_6D01C:
		tst.b	(a4)
		bmi.s	loc_6D01C
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		startZ80

locret_6D03A:
		rts
; ---------------------------------------------------------------------------

loc_6D03C:
		tst.b	$7F1(a5)
		bne.s	loc_6D04C
		moveq	#$F,d0
		or.b	d6,d0
		move.b	d0,(PSG_input).l

loc_6D04C:
		lea	dword_6D1F4(pc),a0
		move.l	a0,$4E(a3)
		move.l	a0,$4A(a3)
		rts
; ---------------------------------------------------------------------------

loc_6D05E:
		move.w	#-1,$3FE(a3)
		st	$440(a3)
		bclr	#6,$3E8(a3)
		bclr	#5,(a3)
		lea	$A(a5),a0
		btst	#5,(a0)
		bne.s	loc_6D0CC
		btst	#5,$64(a0)
		bne.s	loc_6D0CC
		btst	#5,$C8(a0)
		bne.s	loc_6D0CC
		btst	#5,$12C(a0)
		bne.s	loc_6D0CC
		btst	#5,$190(a0)
		bne.s	loc_6D0CC
		btst	#5,$1F4(a0)
		bne.s	loc_6D0CC
		btst	#5,$258(a0)
		bne.s	loc_6D0CC
		btst	#5,$2BC(a0)
		bne.s	loc_6D0CC
		btst	#5,$320(a0)
		bne.s	loc_6D0CC
		btst	#5,$384(a0)
		bne.s	loc_6D0CC
		clr.b	$7E8(a5)

loc_6D0CC:
		move.w	#$1000,(a3)
		tst.b	d7
		bmi.s	loc_6D126
		tst.b	$7F1(a5)
		bne.s	loc_6D11C

loc_6D0DA:
		stopZ80
		tst.b	-$33DF(a4)
		beq.s	loc_6D0FE
		startZ80
		nop
		bra.s	loc_6D0DA
; ---------------------------------------------------------------------------

loc_6D0FE:
		tst.b	(a4)
		bmi.s	loc_6D0FE
		move.b	#$28,(a4)
		nop
		nop

-		tst.b	(a4)
		bmi.s	-
		move.b	d6,1(a4)
		nop
		startZ80

loc_6D11C:
		bset	#4,$3E8(a3)
		rts
; ---------------------------------------------------------------------------

loc_6D126:
		tst.b	$7F1(a5)
		bne.s	locret_6D136
		moveq	#$F,d0
		or.b	d6,d0
		move.b	d0,(PSG_input).l

locret_6D136:
		rts
; ---------------------------------------------------------------------------

loc_6D13A:
		moveq	#0,d0
		move.b	(a2)+,d0
		lea	word_6DB94(pc),a0
		add.w	d0,d0
		adda.w	(a0,d0.w),a0
		move.b	(a0)+,$52(a3)
		move.b	(a0)+,$53(a3)
		move.b	(a0)+,$54(a3)
		move.l	a0,$4A(a3)
		move.l	a0,$4E(a3)
		bclr	#4,1(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D166:
		moveq	#0,d1
		move.b	$30(a3),d1
		tst.b	$2B(a3,d1.w)
		bne.s	loc_6D184
		subq.b	#1,$30(a3)
		move.b	(a2),d0
		lsl.w	#8,d0
		move.b	1(a2),d0
		adda.w	d0,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D184:
		addq.l	#2,a2
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D18A:
		move.b	(a2)+,6(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D192:
		move.b	(a2)+,$59(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D19A:
		move.b	(a2)+,$5A(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D1A2:
		move.b	(a2)+,d0
		lsl.w	#8,d0
		move.b	(a2)+,d0
		btst	#5,(a3)
		bne.s	loc_6D1BE
		tst.w	$7E4(a5)
		beq.s	loc_6D1BE
		cmpi.w	#-1,$7E4(a5)
		bne.w	loc_6C83C

loc_6D1BE:
		move.w	d0,$7E4(a5)
		move.b	6(a3),$62(a5)
		st	$5B(a3)
		bra.w	loc_6C83C
; ---------------------------------------------------------------------------

loc_6D1D0:
		move.b	(a2)+,d0
		lsl.w	#8,d0
		move.b	(a2)+,d0
		bra.w	loc_6C83C

; =============== S U B R O U T I N E =======================================

byte_6D1DA:
		dc.b 7, 0, 0, 0, 0, 0, 0, 0, 0,	0, $1F, $1F, $1F, $1F
		dc.b $1F, $1F, $1F, $1F, $1F, $1F, $1F, $1F, $FF, $FF
		dc.b $FF, $FF
dword_6D1F4:
		dc.w $F10
		dc.w $1FF
		dc.w $F00

; =============== S U B R O U T I N E =======================================

Z80_IsodaDriver:		binclude "Sound/Isoda Shigeharu/DAC Driver (Z80).bin"
	even
					include "Sound/Isoda Shigeharu/Data/Music.asm"
					include "Sound/Isoda Shigeharu/Data/Samples.asm"
	even