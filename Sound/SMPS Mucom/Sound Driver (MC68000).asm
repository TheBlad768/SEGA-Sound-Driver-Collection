; SMPS Mucom Driver -MD- 68000
; Copyright (C) ?, Programmed By ?.
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message "SMPS Mucom Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SndDriverSMPSMucomRAM		= SoundDriverRAM
; ---------------------------------------------------------------------------

;		include "Sound/SMPS Mucom/_s1smpsm2asm_inc.asm"

; =============== S U B R O U T I N E =======================================

PlaySound_SMPSMucom:
		move	sr,-(sp)
		ori	#$700,sr
		move.b	d0,(SndDriverSMPSMucomRAM+$A).l
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		subi.w	#$81,d0
		add.w	d0,d0
		lea	Music_Bank_SMPS(pc),a0
		adda.w	(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		move	(sp)+,sr
		rts
; End of function PlaySound_SMPSMucom

; =============== S U B R O U T I N E =======================================

StopSound_SMPSMucom:
		move	sr,-(sp)
		ori	#$700,sr
		move.b	d0,(SndDriverSMPSMucomRAM+$A).l
		move	(sp)+,sr
		rts
; End of function StopSound_SMPSMucom

; =============== S U B R O U T I N E =======================================

UpdateMusic_SMPSMucom:
		lea	(SndDriverSMPSMucomRAM+$40).l,a3
		tst.b	(SndDriverSMPSMucomRAM+7).l
		bne.w	loc_72A18

loc_72924:
		tst.b	(SndDriverSMPSMucomRAM+2).l
		bne.s	loc_72930
		jsr	sub_72D08(pc)

loc_72930:
		jsr	sub_73066(pc)
		tst.b	(SndDriverSMPSMucomRAM+7).l
		bne.w	loc_729A2
		move.b	#0,(SndDriverSMPSMucomRAM+6).l
		move.w	#4,d6
		lea	(SndDriverSMPSMucomRAM+$40).l,a3

loc_72950:
		movem.w	d6,-(sp)
		btst	#7,(a3)
		beq.w	loc_72960
		jsr	sub_72B08(pc)

loc_72960:
		adda.w	#$30,a3
		movem.w	(sp)+,d6
		dbf	d6,loc_72950
		lea	(SndDriverSMPSMucomRAM+$130).l,a3
		btst	#7,(a3)
		beq.s	loc_7297C
		jsr	sub_72A4E(pc)

loc_7297C:
		lea	(SndDriverSMPSMucomRAM+$160).l,a3
		move.w	#2,d6

loc_72986:
		movem.w d6,-(sp)
		btst	#7,(a3)
		beq.s	loc_72996
		jsr	sub_7388C(pc)

loc_72996:
		adda.w	#$30,a3
		movem.w (sp)+,d6
		dbf	d6,loc_72986

loc_729A2:
		move.b	#$80,(SndDriverSMPSMucomRAM+6).l
		move.w	#1,d6
		lea	(SndDriverSMPSMucomRAM+$1F0).l,a3

loc_729B4:
		movem.w	d6,-(sp)
		btst	#7,(a3)
		beq.s	loc_729C2
		jsr	sub_72B08(pc)

loc_729C2:
		adda.w	#$30,a3
		movem.w	(sp)+,d6
		dbf	d6,loc_729B4
		move.w	#1,d6
		lea	(SndDriverSMPSMucomRAM+$2B0).l,a3

loc_729D8:
		movem.w	d6,-(sp)
		btst	#7,(a3)
		beq.s	loc_729E6
		jsr	sub_7388C(pc)

loc_729E6:
		adda.w	#$30,a3
		movem.w	(sp)+,d6
		dbf	d6,loc_729D8
		move.b	#1,(SndDriverSMPSMucomRAM+6).l
		lea	(SndDriverSMPSMucomRAM+$340).l,a3
		movem.w	d6,-(sp)
		btst	#7,(a3)
		beq.s	loc_72A0E
		jsr	sub_72B08(pc)

loc_72A0E:
		adda.w	#$30,a3
		movem.w	(sp)+,d6
		rts
; ---------------------------------------------------------------------------

loc_72A18:
		bmi.w	loc_72A44
		jsr	sub_73298(pc)
		moveq	#2,d7
		moveq	#$28,d0

-		move.b	d7,d1
		jsr	WriteFMI_Mucom(pc)
		addq.b	#4,d1
		jsr	WriteFMI_Mucom(pc)
		dbf	d7,-
		startZ80
		jsr	PSGSilenceAll_Mucom(pc)
		bra.w	loc_72924
; ---------------------------------------------------------------------------

loc_72A44:
		move.b	#0,(SndDriverSMPSMucomRAM+7).l
		rts
; End of function UpdateMusic_SMPSMucom

; =============== S U B R O U T I N E =======================================

sub_72A4E:
		subq.b	#1,$E(a3)
		beq.s	loc_72A6A
		movea.l	4(a3),a4
		move.b	$E(a3),d0
		cmp.b	$D(a3),d0
		beq.w	loc_72AF2
		move.l	a4,4(a3)
		rts
; ---------------------------------------------------------------------------

loc_72A6A:
		move.b	#$80,(SndDriverSMPSMucomRAM+8).l
		jsr	sub_73298(pc)
		tst.b	($A01FF6).l
		beq.s	loc_72A82
		bset	#0,(a3)

loc_72A82:
		nop
		nop
		nop
		startZ80
		movea.l	4(a3),a4
		btst	#1,(a3)
		beq.s	loc_72AA4
		move.b	$11(a3),$10(a3)
		bclr	#1,(a3)

loc_72AA4:
		move.b	(a4)+,d5
		cmpi.b	#$F0,d5
		bcs.s	loc_72AB2
		jsr	CoordFlag_Mucom(pc)
		bra.s	loc_72AA4
; ---------------------------------------------------------------------------

loc_72AB2:
		move.b	d5,$E(a3)
		andi.b	#$7F,$E(a3)
		tst.b	d5
		bmi.w	loc_72AF2
		beq.w	loc_73730
		move.b	(a4)+,d5

loc_72AC8:
		jsr	sub_73298(pc)
		tst.b	($A01FF6).l
		bne.s	loc_72AE0
		move.b	$10(a3),($A01FFF).l
		bclr	#0,(a3)

loc_72AE0:
		nop
		nop
		nop
		startZ80
		bra.w	sub_72BC8
; ---------------------------------------------------------------------------

loc_72AF2:
		move.b	$10(a3),$11(a3)
		move.b	#$85,$10(a3)
		bset	#1,(a3)
		bra.w	loc_72AC8
; End of function sub_72A4E

; =============== S U B R O U T I N E =======================================

sub_72B08:
		movea.l	4(a3),a4
		btst	#6,(a3)
		bne.w	loc_73762
		subq.b	#1,$E(a3)
		bne.s	loc_72B40
		cmpi.b	#$FD,(a4)
		beq.s	loc_72B2A
		btst	#5,(a3)
		bne.s	loc_72B2A
		bclr	#1,(a3)

loc_72B2A:
		bclr	#5,(a3)
		move.b	#0,(SndDriverSMPSMucomRAM+8).l
		jsr	sub_72B5E(pc)
		jmp	FMNoteOn_Mucom(pc)
; ---------------------------------------------------------------------------

loc_72B40:
		btst	#1,(a3)
		bne.s	loc_72B54
		jsr	sub_72BFE(pc)
		jsr	sub_72C1A(pc)
		jmp	sub_72C74(pc)
; ---------------------------------------------------------------------------

loc_72B54:
		bclr	#5,(a3)
		jmp	FMNoteOff_Mucom(pc)
; End of function sub_72B08

; =============== S U B R O U T I N E =======================================

sub_72B5E:
		move.b	(a4)+,d5
		cmpi.b	#$F0,d5
		bcs.s	loc_72B6C
		jsr	CoordFlag_Mucom(pc)
		bra.s	sub_72B5E
; ---------------------------------------------------------------------------

loc_72B6C:
		jsr	FMNoteOff_Mucom(pc)
		move.b	d5,$E(a3)
		andi.b	#$7F,$E(a3)
		tst.b	d5
		beq.w	loc_73730
		bpl.s	loc_72B88
		bset	#1,(a3)
		bra.s	sub_72BC8
; ---------------------------------------------------------------------------

loc_72B88:
		move.b	(a4)+,d5
		move.b	d5,d0
		andi.w	#$F,d0
		lea	FMFrequencies_Mucom(pc),a0
		lsl.w	#1,d0
		move.w	(a0,d0.w),d1
		andi.w	#$70,d5
		lsl.w	#7,d5
		or.w	d5,d1
		btst	#5,(a3)
		beq.s	loc_72BB0
		cmp.w	$10(a3),d1
		beq.s	loc_72BC2

loc_72BB0:
		move.w	d1,$10(a3)
		move.l	a4,4(a3)
		jsr	sub_72BD4(pc)
		jmp	sub_72C64(pc)
; ---------------------------------------------------------------------------

loc_72BC2:
		move.l	a4,4(a3)
		rts
; End of function sub_72B5E

; =============== S U B R O U T I N E =======================================

sub_72BC8:
		move.l	a4,4(a3)
		btst	#5,(a3)
		bne.w	locret_72BFC
; End of function sub_72BC8

; =============== S U B R O U T I N E =======================================

sub_72BD4:
		btst	#3,(a3)
		beq.s	locret_72BFC
		move.b	$16(a3),$1C(a3)
		move.b	$17(a3),$1D(a3)
		move.w	$18(a3),$1E(a3)
		move.b	$1A(a3),d0
		lsr.b	#1,d0
		move.b	d0,$20(a3)
		move.w	#0,$22(a3)

locret_72BFC:
		rts
; End of function sub_72BD4

; =============== S U B R O U T I N E =======================================

sub_72BFE:
		movea.l	4(a3),a4
		cmpi.b	#$FD,(a4)
		beq.s	locret_72C18
		move.b	$E(a3),d0
		cmp.b	$D(a3),d0
		bne.s	locret_72C18
		jsr	FMNoteOff_Mucom(pc)
		move.l	(sp)+,d0

locret_72C18:
		rts
; End of function sub_72BFE

; =============== S U B R O U T I N E =======================================

sub_72C1A:
		addq.w	#4,sp
		btst	#3,(a3)
		beq.w	locret_72CAC
		tst.b	$1C(a3)
		beq.s	loc_72C30
		subq.b	#1,$1C(a3)
		rts
; ---------------------------------------------------------------------------

loc_72C30:
		subq.b	#1,$1D(a3)
		beq.s	loc_72C38
		rts
; ---------------------------------------------------------------------------

loc_72C38:
		move.b	$17(a3),$1D(a3)
		tst.b	$20(a3)
		beq.s	loc_72C4A
		subq.b	#1,$20(a3)
		bra.s	loc_72C54
; ---------------------------------------------------------------------------

loc_72C4A:
		move.b	$1A(a3),$20(a3)
		neg.w	$1E(a3)

loc_72C54:
		move.w	$1E(a3),d0
		add.w	d0,$22(a3)
		move.w	$10(a3),d4
		subq.w	#4,sp
		rts
; End of function sub_72C1A

; =============== S U B R O U T I N E =======================================

sub_72C64:
		move.w	$10(a3),d4
		btst	#3,(a3)
		beq.s	loc_72C78
		btst	#5,(a3)
		beq.s	loc_72C78
; End of function sub_72C64

; =============== S U B R O U T I N E =======================================

sub_72C74:
		add.w	$22(a3),d4

loc_72C78:
		add.w	$26(a3),d4
		btst	#0,(a3)
		bne.s	locret_72CAC
		btst	#2,(a3)
		bne.w	loc_72CAE
		move.w	d4,d1
		lsr.w	#8,d1
		move.b	#$A4,d0
		jsr	sub_73298(pc)
		jsr	WriteFMIorII_Mucom(pc)
		move.b	d4,d1
		move.b	#$A0,d0
		jsr	WriteFMIorII_Mucom(pc)
		startZ80

locret_72CAC:
		rts
; ---------------------------------------------------------------------------

loc_72CAE:
		cmpi.b	#2,1(a3)
		bne.w	loc_72CFA
		move.w	#3,d6
		tst.b	(SndDriverSMPSMucomRAM+6).l
		beq.s	loc_72CCC
		lea	(SndDriverSMPSMucomRAM+$30).l,a5
		bra.s	loc_72CD2
; ---------------------------------------------------------------------------

loc_72CCC:
		lea	(SndDriverSMPSMucomRAM+$10).l,a5

loc_72CD2:
		lea	byte_72D04(pc),a0
		jsr	sub_73298(pc)

loc_72CDC:
		move.w	d4,d3
		moveq	#0,d0
		move.b	(a5)+,d0
		add.w	d0,d3
		move.w	d3,d1
		lsr.w	#8,d1
		move.b	(a0)+,d0
		jsr	WriteFMI_Mucom(pc)
		move.b	d3,d1
		subq.b	#4,d0
		jsr	WriteFMI_Mucom(pc)
		dbf	d6,loc_72CDC

loc_72CFA:
		startZ80
		rts
; End of function sub_72C74
; ---------------------------------------------------------------------------

byte_72D04:
		dc.b $A6
		dc.b $AC
		dc.b $AE
		dc.b $AD

; =============== S U B R O U T I N E =======================================

sub_72D08:
		moveq	#0,d0
		moveq	#0,d1
		lea	(SndDriverSMPSMucomRAM+$A).l,a0
		lea	(SndDriverSMPSMucomRAM).l,a1
		lea	(SoundPriorities_Mucom).l,a2
		move.w	#2,d6

loc_72D22:
		move.b	(a0),d0
		bpl.s	loc_72D3E
		move.b	d0,d2
		subi.w	#$81,d0
		bmi.s	loc_72D3E
		move.b	(a2,d0.w),d1
		cmp.b	(a1),d1
		bcs.s	loc_72D3E
		move.b	d1,(a1)
		move.b	d2,(SndDriverSMPSMucomRAM+9).l

loc_72D3E:
		move.b	#0,(a0)+
		dbf	d6,loc_72D22
		tst.b	(a1)
		bpl.s	SoundMucom_ChkValue
		move.b	#0,(a1)

SoundMucom_ChkValue:
		moveq	#0,d0
		btst	#7,(SndDriverSMPSMucomRAM+9).l
		beq.w	loc_72F6E
		move.b	(SndDriverSMPSMucomRAM+9).l,d0
		cmpi.b	#$A0,d0
		bcs.w	loc_72EA0
		cmpi.b	#$E0,d0
		bcs.w	loc_72DA4
		cmpi.b	#$E4,d0
		bcs.w	Sound_E0toE4
		bra.w	loc_72F6E
; ---------------------------------------------------------------------------

Sound_E0toE4:
		subi.b	#$E0,d0
		lsl.w	#2,d0
		jmp	SoundMucom_ExIndex(pc,d0.w)
; ---------------------------------------------------------------------------

SoundMucom_ExIndex:
		bra.w	Sound_E0	; $E0
; ---------------------------------------------------------------------------
		bra.w	Sound_E1	; $E1
; ---------------------------------------------------------------------------
		bra.w	Sound_E2	; $E2
; ---------------------------------------------------------------------------
		bra.w	Sound_E1	; $E3
; ---------------------------------------------------------------------------
		bra.w	Sound_E1	; $E4
; ---------------------------------------------------------------------------

loc_72DA4:
		addi.b	#-$4A,d0
		jsr	sub_73298(pc)
		move.b	d0,($A01FFF).l
		nop
		nop
		nop
		startZ80
		move.b	#0,(SndDriverSMPSMucomRAM).l
		bra.w	loc_72F72
; ---------------------------------------------------------------------------

loc_72EA0:
		subi.b	#$81,d0
		bcs.w	loc_72F72
		move.l	d0,-(sp)
		jsr	Sound_E1(pc)
		move.l	(sp)+,d0
		lea	(SoundDriverMusicRAM).l,a0
		move.w	(a0),d0
		add.l	a0,d0
		move.l	d0,(SndDriverSMPSMucomRAM+$14).l
		moveq	#0,d6
		moveq	#0,d1
		movea.l	a0,a3
		addq.l	#4,a3
		move.l	#$80000000,d0
		ori.w	#$100,d0
		move.b	2(a0),d6
		subq.w	#1,d6
		movea.l	#(SndDriverSMPSMucomRAM+$40),a1
		lea	byte_72F7C(pc),a2

loc_72EEC:
		move.b	#$C0,$14(a1)
		move.b	#1,$E(a1)
		move.b	#$30,$C(a1)
		moveq	#0,d1
		move.b	(a2)+,d1
		swap	d1
		add.l	d1,d0
		move.l	d0,(a1)
		moveq	#0,d1
		move.b	(a3)+,d1
		lsl.w	#8,d1
		move.b	(a3)+,d1
		ext.l	d1
		add.l	a0,d1
		move.l	d1,4(a1)
		move.b	(a3)+,3(a1)
		adda.w	#$30,a1
		dbf	d6,loc_72EEC
		moveq	#0,d6
		move.b	3(a0),d6
		beq.w	loc_72F72
		subq.b	#1,d6
		andi.l	#$FFFF,d0
		ori.l	#$80C00000,d0

loc_72F3C:
		moveq	#0,d1
		move.b	#1,$E(a1)
		move.b	#$30,$C(a1)
		move.l	d0,(a1)
		move.w	(a3)+,d1
		add.l	a0,d1
		move.l	d1,4(a1)
		move.b	(a3)+,3(a1)
		move.b	(a3)+,$B(a1)
		adda.w	#$30,a1
		subi.l	#$200000,d0
		dbf	d6,loc_72F3C
		bra.w	loc_72F72
; ---------------------------------------------------------------------------

loc_72F6E:
		jsr	Sound_E1(pc)

loc_72F72:
		move.b	#$80,(SndDriverSMPSMucomRAM+9).l
		rts
; End of function sub_72D08
; ---------------------------------------------------------------------------

byte_72F7C:
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 2
		dc.b 1
		dc.b 1

; =============== S U B R O U T I N E =======================================

Sound_E1:
		move.b	#$2B,d0
		move.b	#$80,d1
		jsr	sub_73286(pc)
		move.b	#$27,d0
		move.b	#0,d1
		jsr	sub_73286(pc)
		jsr	sub_73298(pc)
		moveq	#2,d6
		move.b	#$B4,d0
		move.b	#$C0,d1

loc_72FB0:
		jsr	WriteFMI_Mucom(pc)
		jsr	WriteFMII_Mucom(pc)
		addq.b	#1,d0
		dbf	d6,loc_72FB0
		startZ80
		lea	(SndDriverSMPSMucomRAM).l,a3
		move.w	#$9B,d6

loc_72FD0:
		move.l	#0,(a3)+
		dbf	d6,loc_72FD0
		jsr	sub_73142(pc)
		jmp	PSGSilenceAll_Mucom(pc)
; End of function Sound_E1
; ---------------------------------------------------------------------------

Sound_E2:
		move.b	#$27,d0
		move.b	#0,d1
		jsr	sub_73286(pc)
		lea	(SndDriverSMPSMucomRAM+$1F0).l,a5
		exg	a5,a3
		moveq	#1,d7

loc_72FFA:
		tst.w	(a3)
		bpl.s	loc_7300A
		move.b	#0,(a3)
		jsr	FMNoteOff_Mucom(pc)
		jsr	sub_730BA(pc)

loc_7300A:
		adda.w	#$30,a3
		dbf	d7,loc_72FFA
		exg	a5,a3
		move.b	#0,(SndDriverSMPSMucomRAM).l
		move.b	#0,(SndDriverSMPSMucomRAM+1).l
		move.b	#$80,(SndDriverSMPSMucomRAM+9).l
		rts
; ---------------------------------------------------------------------------

Sound_E0:
		tst.b	(SndDriverSMPSMucomRAM+2).l
		bne.w	sub_73066
		move.b	#$10,(SndDriverSMPSMucomRAM+2).l
		move.b	#4,(SndDriverSMPSMucomRAM+3).l
		moveq	#0,d0
		move.b	d0,(SndDriverSMPSMucomRAM+$130).l
		move.b	d0,(SndDriverSMPSMucomRAM+$160).l
		move.b	d0,(SndDriverSMPSMucomRAM+$190).l
		move.b	d0,(SndDriverSMPSMucomRAM+$1C0).l
		bra.w	PSGSilenceAll_Mucom

; =============== S U B R O U T I N E =======================================

sub_73066:
		moveq	#0,d0
		move.b	(SndDriverSMPSMucomRAM+2).l,d0
		beq.w	locret_730B8
		move.b	(SndDriverSMPSMucomRAM+3).l,d0
		beq.s	loc_73082
		subq.b	#1,(SndDriverSMPSMucomRAM+3).l
		rts
; ---------------------------------------------------------------------------

loc_73082:
		subq.b	#1,(SndDriverSMPSMucomRAM+2).l
		beq.w	Sound_E1
		move.b	#4,(SndDriverSMPSMucomRAM+3).l
		lea	(SndDriverSMPSMucomRAM+$40).l,a3
		moveq	#4,d6

loc_7309C:
		movem.w	d6,-(sp)
		addq.b	#1,9(a3)
		move.b	9(a3),d3
		jsr	sub_736DA(pc)
		adda.w	#$30,a3
		movem.w	(sp)+,d6
		dbf	d6,loc_7309C

locret_730B8:
		rts
; End of function sub_73066

; =============== S U B R O U T I N E =======================================

sub_730BA:
		movea.l	a3,a6
		move.b	1(a3),d0
		bmi.s	loc_730C8
		subq.b	#2,d0
		lsl.b	#2,d0
		bra.s	loc_730CC
; ---------------------------------------------------------------------------

loc_730C8:
		lsr.b	#3,d0
		addq.b	#4,d0

loc_730CC:
		andi.w	#$FF,d0
		lea	dword_72E74(pc),a4
		movea.l	(a4,d0.w),a1
		bclr	#0,(a1)
		bset	#1,(a1)
		movea.l	a1,a3
		move.b	$B(a3),d0
		movea.l	(SndDriverSMPSMucomRAM+$14).l,a0
		jsr	sub_7367E(pc)
		move.b	$14(a3),d1
		move.b	#$B4,d0
		jsr	sub_7326E(pc)
		movea.l	a6,a3
		rts
; End of function sub_730BA
; ---------------------------------------------------------------------------

dword_72E74:
		dc.l (SndDriverSMPSMucomRAM+$A0)
		dc.l (SndDriverSMPSMucomRAM+$D0)
		dc.l (SndDriverSMPSMucomRAM+$D0)
		dc.l (SndDriverSMPSMucomRAM+$100)
		dc.l (SndDriverSMPSMucomRAM+$130)

; =============== S U B R O U T I N E =======================================

sub_73102:
		jsr	sub_73298(pc)
		move.b	#$28,d0
		move.b	1(a3),d1
		jsr	WriteFMI_Mucom(pc)
		moveq	#3,d4
		moveq	#$40,d3
		moveq	#$7F,d1

loc_73118:
		move.b	d3,d0
		jsr	WriteFMIorII_Mucom(pc)
		addq.b	#4,d3
		dbf	d4,loc_73118
		moveq	#3,d4
		move.b	#$80,d3
		moveq	#$F,d1

loc_7312C:
		move.b	d3,d0
		jsr	WriteFMIorII_Mucom(pc)
		addq.b	#4,d3
		dbf	d4,loc_7312C
		startZ80
		rts
; End of function sub_73102

; =============== S U B R O U T I N E =======================================

sub_73142:
		moveq	#2,d3
		moveq	#$28,d0
		jsr	sub_73298(pc)

loc_7314A:
		move.b	d3,d1
		jsr	WriteFMI_Mucom(pc)
		addq.b	#4,d1
		jsr	WriteFMI_Mucom(pc)
		dbf	d3,loc_7314A
		moveq	#$40,d0
		moveq	#$7F,d1
		moveq	#2,d3

loc_73160:
		moveq	#3,d4

loc_73162:
		jsr	WriteFMI_Mucom(pc)
		jsr	WriteFMII_Mucom(pc)
		addq.w	#4,d0
		dbf	d4,loc_73162
		subi.b	#$F,d0
		dbf	d3,loc_73160
		move.b	#$80,d0
		moveq	#$F,d1
		moveq	#2,d3

loc_73180:
		moveq	#3,d4

loc_73182:
		jsr	WriteFMI_Mucom(pc)
		jsr	WriteFMII_Mucom(pc)
		addq.w	#4,d0
		dbf	d4,loc_73182
		subi.b	#$F,d0
		dbf	d3,loc_73180
		startZ80
		rts
; End of function sub_73142

; =============== S U B R O U T I N E =======================================

PSGSilenceAll_Mucom:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)	; Silence PSG 1
		move.b	#$BF,(a0)	; Silence PSG 2
		move.b	#$DF,(a0)	; Silence PSG 3
		move.b	#$FF,(a0)	; Silence noise channel
		rts
; End of function PSGSilenceAll_Mucom

; =============== S U B R O U T I N E =======================================

FMNoteOn_Mucom:
		btst	#1,(a3)
		bne.s	locret_731DC
		btst	#5,(a3)
		bne.s	locret_731DC
		btst	#0,(a3)
		bne.s	locret_731DC
		move.b	#$28,d0
		move.b	1(a3),d1
		ori.b	#$F0,d1
		jsr	sub_73286(pc)

locret_731DC:
		rts
; End of function FMNoteOn_Mucom

; =============== S U B R O U T I N E =======================================

FMNoteOff_Mucom:
		btst	#5,(a3)
		bne.w	locret_731F8
		btst	#0,(a3)
		bne.s	locret_731F8
		move.b	#$28,d0
		move.b	1(a3),d1
		jsr	sub_73286(pc)

locret_731F8:
		rts
; End of function FMNoteOff_Mucom

; =============== S U B R O U T I N E =======================================

WriteFMIorII_Mucom:
		btst	#2,1(a3)
		bne.s	WriteFMIIPart_Mucom
		add.b	1(a3),d0
; End of function WriteFMIorII_Mucom

; =============== S U B R O U T I N E =======================================

WriteFMI_Mucom:
		lea	($A04000).l,a2

loc_7320C:
		btst	#7,(a2)
		bne.s	loc_7320C
		move.b	d0,(a2)
		nop
		nop
		nop
		nop
		nop

loc_7321E:
		btst	#7,(a2)
		bne.s	loc_7321E
		move.b	d1,1(a2)
		nop
		nop
		nop
		nop
		nop
		rts
; End of function WriteFMI_Mucom
; ---------------------------------------------------------------------------

WriteFMIIPart_Mucom:
		move.b	1(a3),d2
		bclr	#2,d2
		add.b	d2,d0

; =============== S U B R O U T I N E =======================================

WriteFMII_Mucom:
		lea	($A04000).l,a2

loc_73244:
		btst	#7,(a2)
		bne.s	loc_73244
		move.b	d0,2(a2)
		nop
		nop
		nop
		nop
		nop

loc_73258:
		btst	#7,(a2)
		bne.s	loc_73258
		move.b	d1,3(a2)
		nop
		nop
		nop
		nop
		nop
		rts
; End of function WriteFMII_Mucom

; =============== S U B R O U T I N E =======================================

sub_7326E:
		btst	#0,(a3)
		bne.s	locret_73284
		jsr	sub_73298(pc)
		jsr	WriteFMIorII_Mucom(pc)
		startZ80

locret_73284:
		rts
; End of function sub_7326E

; =============== S U B R O U T I N E =======================================

sub_73286:
		jsr	sub_73298(pc)
		jsr	WriteFMI_Mucom(pc)
		startZ80
		rts
; End of function sub_73286

; =============== S U B R O U T I N E =======================================

sub_73298:
		stopZ80
		btst	#7,($A01FFD).l
		beq.s	loc_732C4
		startZ80
		nop
		nop
		nop
		bra.s	sub_73298
; ---------------------------------------------------------------------------

loc_732C4:
		move.b	($A04000).l,d2
		btst	#7,d2
		bne.s	loc_732C4
		rts
; End of function sub_73298
; ---------------------------------------------------------------------------

FMFrequencies_Mucom:
		dc.w $284
		dc.w $2AB
		dc.w $2D3
		dc.w $2FE
		dc.w $32D
		dc.w $35C
		dc.w $38F
		dc.w $3C5
		dc.w $3FF
		dc.w $43C
		dc.w $47C
		dc.w $4C0

; =============== S U B R O U T I N E =======================================

CoordFlag_Mucom:
		subi.b	#$F0,d5
		andi.w	#$FF,d5
		lsl.w	#2,d5
		tst.b	1(a3)
		bmi.s	CoordFlag2
		jmp	CoordFlagFM_Index(pc,d5.w)
; ---------------------------------------------------------------------------

CoordFlag2:
		jmp	CoordFlagPSG_Index(pc,d5.w)
; ---------------------------------------------------------------------------

CoordFlagFM_Index:
		bra.w	cfSetVoice_Mucom			; $F0
; ---------------------------------------------------------------------------
		bra.w	cfChangeFMVolume_Mucom	; $F1
; ---------------------------------------------------------------------------
		bra.w	loc_733A0					; $F2
; ---------------------------------------------------------------------------
		bra.w	loc_733C2					; $F3
; ---------------------------------------------------------------------------
		bra.w	cfModulation_Mucom			; $F4
; ---------------------------------------------------------------------------
		bra.w	loc_73466					; $F5
; ---------------------------------------------------------------------------
		bra.w	loc_7348C					; $F6
; ---------------------------------------------------------------------------
		bra.w	loc_734D2					; $F7
; ---------------------------------------------------------------------------
		bra.w	loc_73512					; $F8
; ---------------------------------------------------------------------------
		bra.w	loc_73384					; $F9
; ---------------------------------------------------------------------------
		bra.w	loc_7353E					; $FA
; ---------------------------------------------------------------------------
		bra.w	loc_735BC					; $FB
; ---------------------------------------------------------------------------
		bra.w	loc_73588					; $FC
; ---------------------------------------------------------------------------
		bra.w	cfPreventAttack_Mucom		; $FD
; ---------------------------------------------------------------------------
		bra.w	loc_734AE					; $FE
; ---------------------------------------------------------------------------
		bra.w	cfJumpTo_Mucom			; $FF
; ---------------------------------------------------------------------------

CoordFlagPSG_Index:
		bra.w	loc_73832					; $F0
; ---------------------------------------------------------------------------
		bra.w	loc_73838					; $F1
; ---------------------------------------------------------------------------
		bra.w	loc_733A0					; $F2
; ---------------------------------------------------------------------------
		bra.w	loc_733C2					; $F3
; ---------------------------------------------------------------------------
		bra.w	cfModulation_Mucom			; $F4
; ---------------------------------------------------------------------------
		bra.w	loc_73466					; $F5
; ---------------------------------------------------------------------------
		bra.w	loc_7348C					; $F6
; ---------------------------------------------------------------------------
		bra.w	loc_7385E					; $F7
; ---------------------------------------------------------------------------
		bra.w	loc_7384A					; $F8
; ---------------------------------------------------------------------------
		bra.w	loc_7384E					; $F9
; ---------------------------------------------------------------------------
		bra.w	loc_7384E					; $FA
; ---------------------------------------------------------------------------
		bra.w	loc_73854					; $FB
; ---------------------------------------------------------------------------
		bra.w	loc_73382					; $FC
; ---------------------------------------------------------------------------
		bra.w	cfPreventAttack_Mucom		; $FD
; ---------------------------------------------------------------------------
		bra.w	loc_734AE					; $FE
; ---------------------------------------------------------------------------
		bra.w	cfJumpTo_Mucom			; $FF
; ---------------------------------------------------------------------------

loc_73382:
		bra.s	loc_73382
; ---------------------------------------------------------------------------

loc_73384:
		tst.b	(SndDriverSMPSMucomRAM+7).l
		beq.s	loc_73396
		move.b	#$80,(SndDriverSMPSMucomRAM+7).l
		rts
; ---------------------------------------------------------------------------

loc_73396:
		move.b	#1,(SndDriverSMPSMucomRAM+7).l
		rts
; ---------------------------------------------------------------------------

loc_733A0:
		move.b	(a4)+,$25(a3)
		move.b	(a4)+,$24(a3)
		move.b	(a4)+,$F(a3)
		move.w	$24(a3),d1
		tst.b	$F(a3)
		beq.s	loc_733BC
		add.w	d1,$26(a3)
		rts
; ---------------------------------------------------------------------------

loc_733BC:
		move.w	d1,$26(a3)
		rts
; ---------------------------------------------------------------------------

loc_733C2:
		move.b	(a4)+,d5
		move.b	d5,$D(a3)
		rts
; ---------------------------------------------------------------------------

cfModulation_Mucom:
		move.b	(a4)+,d5
		bne.s	loc_733FE
		bset	#3,(a3)
		move.b	(a4)+,$16(a3)
		move.b	(a4)+,$17(a3)
		move.b	(a4)+,$19(a3)
		move.b	(a4)+,$18(a3)
		move.b	(a4)+,$1A(a3)
		move.l	$16(a3),$1C(a3)
		move.b	$1A(a3),d0
		lsr.b	#1,d0
		move.b	d0,$20(a3)
		move.w	#0,$22(a3)
		rts
; ---------------------------------------------------------------------------

loc_733FE:
		subq.b	#1,d5
		andi.w	#$FF,d5
		lsl.w	#2,d5
		jmp	loc_7340A(pc,d5.w)
; ---------------------------------------------------------------------------

loc_7340A:
		bra.w	cfDisableModulation_Mucom	; 0
; ---------------------------------------------------------------------------
		bra.w	cfEnableModulation_Mucom	; 1
; ---------------------------------------------------------------------------
		bra.w	loc_7342E					; 2
; ---------------------------------------------------------------------------
		bra.w	loc_7343A					; 3
; ---------------------------------------------------------------------------
		bra.w	loc_73446					; 4
; ---------------------------------------------------------------------------
		bra.w	loc_73456					; 5
; ---------------------------------------------------------------------------

cfDisableModulation_Mucom:
		bclr	#3,(a3)
		rts
; ---------------------------------------------------------------------------

cfEnableModulation_Mucom:
		bset	#3,(a3)
		rts
; ---------------------------------------------------------------------------

loc_7342E:
		move.b	(a4)+,$16(a3)
		move.b	$16(a3),$1C(a3)
		rts
; ---------------------------------------------------------------------------

loc_7343A:
		move.b	(a4)+,$17(a3)
		move.b	$17(a3),$1D(a3)
		rts
; ---------------------------------------------------------------------------

loc_73446:
		move.b	(a4)+,$19(a3)
		move.b	(a4)+,$18(a3)
		move.w	$18(a3),$1E(a3)
		rts
; ---------------------------------------------------------------------------

loc_73456:
		move.b	(a4)+,$1A(a3)
		move.b	$1A(a3),d0
		lsr.b	#1,d0
		move.b	d0,$20(a3)
		rts
; ---------------------------------------------------------------------------

loc_73466:
		movea.l	a4,a0
		jsr	sub_7347E(pc)
		adda.l	d1,a0
		subq.b	#1,$C(a3)
		moveq	#0,d0
		move.b	$C(a3),d0
		move.b	(a0),(a3,d0.w)
		rts

; =============== S U B R O U T I N E =======================================

sub_7347E:
		moveq	#0,d0
		moveq	#0,d1
		move.b	(a4)+,d0
		move.b	(a4)+,d1
		lsl.w	#8,d1
		or.w	d0,d1
		rts
; End of function sub_7347E
; ---------------------------------------------------------------------------

loc_7348C:
		moveq	#0,d0
		move.b	$C(a3),d0
		subq.b	#1,(a3,d0.w)
		beq.s	loc_734A6
		addq.w	#2,a4
		movea.l	a4,a0
		jsr	sub_7347E(pc)
		suba.w	d1,a0
		movea.l	a0,a4
		rts
; ---------------------------------------------------------------------------

loc_734A6:
		addq.b	#1,$C(a3)
		addq.w	#4,a4
		rts
; ---------------------------------------------------------------------------

loc_734AE:
		moveq	#0,d0
		move.b	$C(a3),d0
		cmpi.b	#1,(a3,d0.w)
		bne.s	loc_734CA
		addq.b	#1,$C(a3)
		jsr	sub_7347E(pc)
		adda.l	d1,a4
		bclr	#5,(a3)

loc_734CA:
		addq.l	#2,a4
		rts
; ---------------------------------------------------------------------------

loc_734D2:
		tst.b	(SndDriverSMPSMucomRAM+6).l
		bne.s	loc_734E2
		lea	(SndDriverSMPSMucomRAM+$10).l,a5
		bra.s	loc_734E8
; ---------------------------------------------------------------------------

loc_734E2:
		lea	(SndDriverSMPSMucomRAM+$30).l,a5

loc_734E8:
		move.b	(a4)+,(a5)
		move.b	(a4)+,1(a5)
		move.b	(a4)+,2(a5)
		move.b	(a4)+,3(a5)
		tst.l	(a5)
		beq.s	locret_73510
		btst	#0,(a3)
		bne.s	locret_73510
		bset	#2,(a3)
		move.b	#$40,d1
		move.b	#$27,d0
		jsr	sub_73286(pc)

locret_73510:
		rts
; ---------------------------------------------------------------------------

loc_73512:
		move.b	#$B4,d0
		moveq	#0,d1
		move.b	$14(a3),d3
		andi.b	#$3F,d3
		moveq	#0,d2
		move.b	(a4)+,d2
		lea	byte_7353A(pc),a6
		move.b	(a6,d2.w),d1
		or.b	d3,d1
		move.b	d1,$14(a3)
		bra.w	sub_7326E
; ---------------------------------------------------------------------------

byte_7353A:
		dc.b $C0		; pan Center
		dc.b $80		; pan Left
		dc.b $40		; pan Right
		dc.b $C0		; pan Center
; ---------------------------------------------------------------------------

loc_7353E:
		move.b	(a4)+,d0
		move.b	(a4)+,d1
		move.b	d0,$28(a3)
		move.b	d1,$29(a3)

loc_7354A:
		move.b	1(a3),d2
		andi.b	#3,d2
		sub.b	d2,d0
		moveq	#0,d2
		move.b	d0,d2
		andi.b	#$F0,d2
		cmpi.b	#$40,d2
		bne.s	loc_73584
		move.b	d0,d2
		andi.b	#$F,d2
		lsr.w	#2,d2
		move.b	$1B(a3),d3
		andi.l	#7,d3
		lea	SMPSMucom_FMSlotMask(pc),a1
		btst	d2,(a1,d3.w)
		beq.s	loc_73584
		add.b	3(a3),d1

loc_73584:
		bra.w	sub_7326E
; ---------------------------------------------------------------------------

loc_73588:
		move.b	(a4)+,d1
		ori.b	#8,d1
		move.b	#$22,d0
		jsr	sub_73286(pc)
		move.b	(a4)+,d1
		move.b	(a4)+,d0
		lsl.b	#4,d0
		or.b	d0,d1
		move.b	$14(a3),d0
		andi.b	#$C0,d0
		or.b	d0,d1
		move.b	d1,$14(a3)
		move.b	#$B4,d0
		bra.w	sub_7326E
; ---------------------------------------------------------------------------

cfPreventAttack_Mucom:
		bset	#5,(a3)
		rts
; ---------------------------------------------------------------------------

loc_735BC:
		move.b	(a4)+,d3
		tst.b	(SndDriverSMPSMucomRAM+8).l
		bmi.s	locret_735FA
		tst.b	(SndDriverSMPSMucomRAM+2).l
		bne.s	locret_735FA
		add.b	$A(a3),d3
		bra.s	loc_735EA
; ---------------------------------------------------------------------------

cfChangeFMVolume_Mucom:
		move.b	(a4)+,d3
		tst.b	(SndDriverSMPSMucomRAM+2).l
		bne.s	locret_735FA
		tst.b	(SndDriverSMPSMucomRAM+8).l
		bmi.s	locret_735FA

loc_735EA:
		move.b	d3,$A(a3)
		ext.w	d3
		move.b	FMInstrumentOperatorTable_Mucom(pc,d3.w),9(a3)
		bra.w	sub_736DA
; ---------------------------------------------------------------------------

locret_735FA:
		rts
; ---------------------------------------------------------------------------

FMInstrumentTLTable_Mucom:	; Unused?
		dc.b $36		; Total level operator 1
		dc.b $33		; Total level operator 3
		dc.b $30		; Total level operator 2
		dc.b $2D		; Total level operator 4
FMInstrumentOperatorTable_Mucom:	; 20 bytes
		dc.b $36		; Detune/multiple operator 1
		dc.b $33		; Detune/multiple operator 3
		dc.b $30		; Detune/multiple operator 2
		dc.b $2D		; Detune/multiple operator 4
		dc.b $2A		; Rate scalling/attack rate operator 1
		dc.b $28		; Rate scalling/attack rate operator 3
		dc.b $25		; Rate scalling/attack rate operator 2
		dc.b $22		; Rate scalling/attack rate operator 4
		dc.b $20		; Amplitude modulation/first decay rate operator 1
		dc.b $1D		; Amplitude modulation/first decay rate operator 3
		dc.b $1A		; Amplitude modulation/first decay rate operator 2
		dc.b $18		; Amplitude modulation/first decay rate operator 4
		dc.b $15		; Secondary decay rate operator 1
		dc.b $12		; Secondary decay rate operator 3
		dc.b $10		; Secondary decay rate operator 2
		dc.b $D		; Secondary decay rate operator 4
		dc.b $A		; Secondary amplitude/release rate operator 1
		dc.b 8		; Secondary amplitude/release rate operator 3
		dc.b 5		; Secondary amplitude/release rate operator 2
		dc.b 2		; Secondary amplitude/release rate operator 4
; ---------------------------------------------------------------------------

loc_73614:
		ori.b	#$80,d0
		move.b	d0,$10(a3)
		rts
; ---------------------------------------------------------------------------

cfSetVoice_Mucom:
		move.b	(a4)+,d0
		tst.b	(SndDriverSMPSMucomRAM+8).l
		bmi.s	loc_73614
		move.b	d0,$B(a3)
		btst	#0,(a3)
		bne.w	locret_73726
		move.w	#0,$28(a3)
		cmpi.b	#2,1(a3)
		bne.s	SetVoice_Mucom
		btst	#2,(a3)
		bne.s	SetVoice_Mucom
		moveq	#0,d1
		move.b	#$27,d0
		jsr	sub_73286(pc)

SetVoice_Mucom:
		move.b	$B(a3),d0
		movea.l	(SndDriverSMPSMucomRAM+$14).l,a0
		tst.b	(SndDriverSMPSMucomRAM+6).l
		beq.s	sub_7367E
		movea.l	(SndDriverSMPSMucomRAM+$2C).l,a0
		tst.b	(SndDriverSMPSMucomRAM+6).l
		bpl.s	sub_7367E
		movea.l	(SndDriverSMPSMucomRAM+$18).l,a0

sub_7367E:
		ext.w	d0
		subq.b	#1,d0
		bmi.s	loc_7368C
		moveq	#$19,d1

loc_73686:
		adda.l	d1,a0
		dbf	d0,loc_73686

loc_7368C:
		btst	#0,(a3)
		bne.w	locret_73726
		btst	#7,(a3)
		beq.w	locret_73726
		jsr	sub_73298(pc)
		moveq	#$17,d5
		move.b	#$30,d7

loc_736AA:
		move.b	d7,d0
		move.b	(a0)+,d1
		jsr	WriteFMIorII_Mucom(pc)
		addq.b	#4,d7
		dbf	d5,loc_736AA
		move.b	(a0),d1
		move.b	d1,$1B(a3)
		move.b	#$B0,d0
		jsr	WriteFMIorII_Mucom(pc)
		move.b	$14(a3),d1
		move.b	#$B4,d0
		jsr	WriteFMIorII_Mucom(pc)
		startZ80

sub_736DA:
		move.b	$1B(a3),d1
		andi.l	#7,d1
		lea	SMPSMucom_FMSlotMask(pc),a1
		adda.l	d1,a1
		move.b	(a1),d6
		move.b	9(a3),d1
		add.b	3(a3),d1
		moveq	#$40,d7
		moveq	#3,d5

loc_736FA:
		move.b	d7,d0
		lsr.b	#1,d6
		bcc.s	loc_73704
		jsr	sub_7326E(pc)

loc_73704:
		addq.b	#4,d7
		dbf	d5,loc_736FA
		tst.b	(SndDriverSMPSMucomRAM+6).l
		bne.w	locret_73726
		tst.b	$28(a3)
		beq.s	locret_73726
		move.b	$28(a3),d0
		move.b	$29(a3),d1
		jsr	loc_7354A(pc)

locret_73726:
		rts
; End of function sub_736DA
; ---------------------------------------------------------------------------

SMPSMucom_FMSlotMask:
		dc.b 8
		dc.b 8
		dc.b 8
		dc.b 8
		dc.b $C
		dc.b $E
		dc.b $E
		dc.b $F
; ---------------------------------------------------------------------------

loc_73730:
		tst.b	1(a3)
		bmi.s	loc_73746
		tst.b	(SndDriverSMPSMucomRAM+8).l
		bmi.w	loc_7375A
		jsr	sub_73102(pc)
		bra.s	loc_7374A
; ---------------------------------------------------------------------------

loc_73746:
		jsr	PSGSilenceAll_Mucom(pc)

loc_7374A:
		tst.b	(SndDriverSMPSMucomRAM+6).l
		beq.w	loc_7375A
		bset	#6,(a3)
		bra.s	loc_7375E
; ---------------------------------------------------------------------------

loc_7375A:
		bclr	#7,(a3)

loc_7375E:
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

loc_73762:
		bclr	#6,(a3)
		bclr	#7,(a3)
		movea.l	a3,a5
		move.b	#0,(SndDriverSMPSMucomRAM).l
		move.b	#0,(SndDriverSMPSMucomRAM+1).l
		move.b	#0,(SndDriverSMPSMucomRAM+6).l
		moveq	#0,d0
		move.b	1(a3),d0
		lea	SFX_BGMChannelRAM_Mucom(pc),a1
		subq.b	#2,d0
		lsl.b	#2,d0
		movea.l	(a1,d0.w),a3
		bclr	#0,(a3)
		bset	#1,(a3)
		movea.l	(SndDriverSMPSMucomRAM+$14).l,a0
		move.b	$B(a3),d0
		jsr	sub_7367E(pc)
		cmpi.b	#2,1(a3)
		bne.w	loc_737E8
		btst	#2,(a3)
		beq.s	loc_737CA
		moveq	#$40,d1
		moveq	#$27,d0
		jsr	sub_73286(pc)
		bra.w	loc_737E8
; ---------------------------------------------------------------------------

loc_737CA:
		moveq	#0,d1
		moveq	#$27,d0
		jsr	sub_73286(pc)
		bra.w	loc_737E8

; =============== S U B R O U T I N E =======================================

sub_737D6:
		lea	SFX_BGMChannelRAM_Mucom(pc),a3
		lsr.b	#3,d0
		movea.l	(a1,d0.w),a3
		bclr	#0,(a3)
		bset	#1,(a3)

loc_737E8:
		movea.l	a5,a3
		rts
; ---------------------------------------------------------------------------

SFX_BGMChannelRAM_Mucom:
		dc.l (SndDriverSMPSMucomRAM+$A0)
		dc.l 0
		dc.l (SndDriverSMPSMucomRAM+$D0)
		dc.l (SndDriverSMPSMucomRAM+$100)
		dc.l (SndDriverSMPSMucomRAM+$160)
		dc.l (SndDriverSMPSMucomRAM+$190)
		dc.l (SndDriverSMPSMucomRAM+$1C0)
		dc.l (SndDriverSMPSMucomRAM+$1C0)
; ---------------------------------------------------------------------------

cfJumpTo_Mucom:
		moveq	#0,d1
		move.b	(a4)+,d0
		move.b	(a4),d1
		lsl.w	#8,d0
		or.w	d1,d0
		ext.l	d0
		adda.l	d0,a4
		btst	#7,1(a3)
		bne.s	loc_7382A
		bclr	#3,(a3)
		bclr	#5,(a3)

loc_7382A:
		move.b	#$C0,$14(a3)
		rts
; ---------------------------------------------------------------------------

loc_73832:
		move.b	(a4)+,$A(a3)
		rts
; ---------------------------------------------------------------------------

loc_73838:
		move.b	(a4)+,d0
		neg.b	d0
		andi.b	#$F,d0
		add.b	3(a3),d0
		move.b	d0,9(a3)
		rts
; ---------------------------------------------------------------------------

loc_7384A:
		move.b	(a4)+,d0
		rts
; ---------------------------------------------------------------------------

loc_7384E:
		move.b	(a4)+,$B(a3)
		rts
; ---------------------------------------------------------------------------

loc_73854:
		move.b	(a4)+,d0
		neg.b	d0
		add.b	d0,9(a3)
		rts
; ---------------------------------------------------------------------------

loc_7385E:
		move.b	(a4)+,d0
		bset	#2,(a3)
		move.b	#$C0,1(a3)
		move.b	#$DF,(PSG_input).l
		move.b	#$E7,(PSG_input).l
		move.b	#$C0,(PSG_input).l
		move.b	#0,(PSG_input).l
		rts

; =============== S U B R O U T I N E =======================================

sub_7388C:
		subq.b	#1,$E(a3)
		bne.s	loc_738A2
		bclr	#5,(a3)
		jsr	sub_738D8(pc)
		jmp	sub_739B6(pc)
; ---------------------------------------------------------------------------

loc_738A2:
		btst	#1,(a3)
		bne.s	locret_738BA
		jsr	sub_738BC(pc)
		jsr	sub_739AC(pc)
		jsr	sub_72C1A(pc)
		jsr	sub_73980(pc)

locret_738BA:
		rts
; End of function sub_7388C

; =============== S U B R O U T I N E =======================================

sub_738BC:
		movea.l	4(a3),a4
		cmpi.b	#$FD,(a4)
		beq.s	locret_738D6
		move.b	$E(a3),d0
		cmp.b	$D(a3),d0
		bne.s	locret_738D6
		jsr	sub_73A42(pc)
		move.l	(sp)+,d0

locret_738D6:
		rts
; End of function sub_738BC

; =============== S U B R O U T I N E =======================================

sub_738D8:
		bclr	#1,(a3)
		bclr	#4,(a3)
		movea.l	4(a3),a4

loc_738E8:
		move.b	(a4)+,d5
		cmpi.b	#$F0,d5
		bcs.s	loc_738F6
		jsr	CoordFlag_Mucom(pc)
		bra.s	loc_738E8
; ---------------------------------------------------------------------------

loc_738F6:
		move.b	d5,$E(a3)
		andi.b	#$7F,$E(a3)
		tst.b	d5
		beq.w	loc_73730
		bpl.w	loc_73916
		bset	#1,(a3)
		jsr	sub_73A42(pc)
		bra.w	sub_72BC8
; ---------------------------------------------------------------------------

loc_73916:
		moveq	#0,d0
		moveq	#0,d5
		move.b	(a4)+,d5
		move.b	d5,$14(a3)
		add.b	8(a3),d5
		move.b	d5,d0
		andi.b	#$F,d5
		lsr.w	#4,d0
		mulu.w	#$C,d0
		add.w	d5,d0
		add.w	d0,d0
		lea	(PSGFrequencies_Mucom).l,a0
		move.w	(a0,d0.w),d4
		move.b	#0,$12(a3)
		btst	#5,(a3)
		beq.s	loc_73950
		cmp.w	$10(a3),d4
		beq.s	loc_7395E

loc_73950:
		move.w	d4,$10(a3)
		jsr	sub_72BC8(pc)
		jmp	sub_73964(pc)
; ---------------------------------------------------------------------------

loc_7395E:
		move.l	a4,4(a3)
		rts
; End of function sub_738D8

; =============== S U B R O U T I N E =======================================

sub_73964:
		btst	#2,(a3)
		bne.s	locret_739AA
		btst	#1,(a3)
		bne.s	locret_739AA
		move.w	$10(a3),d4
		btst	#3,(a3)
		beq.s	loc_73988
		btst	#5,(a3)
		beq.s	loc_73988
; End of function sub_73964

; =============== S U B R O U T I N E =======================================

sub_73980:
		move.w	$22(a3),d5
		asr.w	#4,d5
		add.w	d5,d4

loc_73988:
		move.w	$26(a3),d5
		asr.w	#4,d5
		add.w	d5,d4
		move.b	1(a3),d0
		move.w	d4,d5
		andi.b	#$F,d5
		or.b	d5,d0
		move.b	d0,(PSG_input).l
		lsr.w	#4,d4
		move.b	d4,(PSG_input).l

locret_739AA:
		rts
; End of function sub_73980

; =============== S U B R O U T I N E =======================================

sub_739AC:
		btst	#4,(a3)
		bne.w	locret_73A28
; End of function sub_739AC

; =============== S U B R O U T I N E =======================================

sub_739B6:
		moveq	#0,d0
		move.b	9(a3),d1
		move.b	$B(a3),d0
		beq.w	loc_73A0E
		subq.b	#1,d0
		lea	PSG_Bank_SMPS(pc),a0
		add.w	d0,d0
		adda.w	(a0,d0.w),a0
		moveq	#0,d0
		move.b	$12(a3),d0

loc_739D6:
		move.b	(a0,d0.w),d1
		addq.w	#1,d0
		move.b	d0,$12(a3)
		btst	#7,d1
		beq.w	loc_73A00
		cmpi.b	#$83,d1
		beq.w	sub_73A42
		cmpi.b	#$81,d1
		beq.w	loc_73A36
		cmpi.b	#$80,d1
		beq.w	loc_73A3C

loc_73A00:
		add.b	9(a3),d1
		cmpi.b	#$F,d1
		bmi.s	loc_73A0E
		move.w	#$F,d1

loc_73A0E:
		btst	#4,(a3)
		bne.s	locret_73A28
		btst	#2,(a3)
		bne.s	loc_73A2A
		or.b	1(a3),d1
		addi.b	#$10,d1
		move.b	d1,(PSG_input).l

locret_73A28:
		rts
; ---------------------------------------------------------------------------

loc_73A2A:
		ori.b	#$F0,d1
		move.b	d1,(PSG_input).l
		rts
; ---------------------------------------------------------------------------

loc_73A36:
		bset	#4,(a3)
		rts
; ---------------------------------------------------------------------------

loc_73A3C:
		move.b	#0,d0
		bra.s	loc_739D6
; End of function sub_739B6

; =============== S U B R O U T I N E =======================================

sub_73A42:
		bset	#4,(a3)
		move.b	#$1F,d4
		add.b	1(a3),d4
		move.b	d4,(PSG_input).l
		btst	#2,(a3)
		beq.s	locret_73A62
		move.b	#-1,(PSG_input).l

locret_73A62:
		rts
; End of function sub_73A42

; =============== S U B R O U T I N E =======================================

							include "Sound/SMPS Mucom/Music/Misc.asm"
   if MOMPASS=1
		message " SMPS Mucom Driver Music Data ROM offset is $\{*}"
    endif
							include "Sound/SMPS Mucom/Music/Music Pointer.asm"
							include "Sound/SMPS Mucom/Music/PSG Pointer.asm"
Z80Driver_SMPSMucom:		binclude "Sound/SMPS Mucom/DAC Driver (Z80).bin"
	even