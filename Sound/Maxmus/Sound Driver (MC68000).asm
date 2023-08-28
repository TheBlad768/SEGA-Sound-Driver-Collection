; ===========================================================================
; Maxmus v2.1a T Bardo 1993 (Beam Software/Trevor Nuridin)(Without SFX).
; ===========================================================================

    if MOMPASS=1
		message "Maxmus Sound Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

SoundDriverMaxmusRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

Maxmus_LoadData:
		move.l	#MusicData_Maxmus+$8000,(SoundDriverMaxmusRAM+2).l
		stopZ80
		st	(Z80_RAM+$1A58).l
		startZ80

Maxmus_LoadData_Return:
		rts
; End of function Maxmus_LoadData

; =============== S U B R O U T I N E =======================================

Play_Music_Maxmus:
		tst.b	(SoundDriverMaxmusRAM+$C7).l
		bne.s	Maxmus_LoadData_Return
		move.b	#1,(SoundDriverMaxmusRAM+$C7).l
		addq.w	#1,(SoundDriverMaxmusRAM+$BA).l
		stopZ80
		move.b	d0,(SoundDriverMaxmusRAM+$BC).l
		move.b	d0,(SoundDriverMaxmusRAM+$BF).l
		clr.b	(SoundDriverMaxmusRAM+$BD).l
		clr.b	(SoundDriverMaxmusRAM+$C0).l
		st	(SoundDriverMaxmusRAM+$BE).l	; set loop
		st	(SoundDriverMaxmusRAM+$C1).l	; set loop
		st	(Z80_RAM+$1A5C).l				; set vol	; set $FF - max vol
		st	(Z80_RAM+$1A5D).l				; set vol	; set $FF - max vol
		clr.b	(Z80_RAM+$1A5A).l
		move.b	#1,(Z80_RAM+$1A59).l
		move.b	#1,(Z80_RAM+$1A58).l
		subq.w	#1,(SoundDriverMaxmusRAM+$BA).l
		bne.s	+
		startZ80
+		clr.b	(SoundDriverMaxmusRAM+$C7).l
		rts
; End of function Play_Music_Maxmus

; =============== S U B R O U T I N E =======================================

UpdateMusic_Maxmus:
		tst.b	(SoundDriverMaxmusRAM+$C7).l
		bne.s	locret_134FA
		move.b	#1,(SoundDriverMaxmusRAM+$C7).l
		addq.w	#1,(SoundDriverMaxmusRAM+$BA).l
		stopZ80
		bsr.s	sub_134FC
		bsr.w	sub_137BA
		subq.w	#1,(SoundDriverMaxmusRAM+$BA).l
		bne.s	loc_134F6
		startZ80

loc_134F6:
		clr.b	(SoundDriverMaxmusRAM+$C7).l

locret_134FA:
		rts
; End of function UpdateMusic_Maxmus

; =============== S U B R O U T I N E =======================================

sub_134FC:
		move.b	(Z80_RAM+$1A58).l,d0
		beq.s	loc_13510
		cmpi.b	#2,d0
		bne.s	locret_1351C
		bsr.w	PlayMusic_Process

loc_13510:
		bsr.s	sub_1351E
		bsr.w	sub_135B4

locret_1351C:
		rts
; End of function sub_134FC

; =============== S U B R O U T I N E =======================================

sub_1351E:
		lea	(SoundDriverMaxmusRAM+$A6).l,a0
		lea	(Z80_RAM+$1179).l,a1
		lea	(Z80_RAM+$1040).l,a2
		clr.w	d2
		movea.l	(a0),a3
		move.b	3(a1),d1
		move.b	4(a1),d2
		move.w	6(a0),d3
		cmp.w	8(a0),d3
		beq.s	loc_13590
		cmp.b	d1,d2
		beq.s	loc_13558
		addq.b	#1,d2
		andi.b	#$1F,d2
		cmp.b	d1,d2
		beq.s	loc_135AE

loc_13558:
		move.b	(a3,d3.w),(a2,d2.w)
		addq.b	#1,d2
		andi.b	#$1F,d2
		addq.w	#1,d3
		cmp.w	8(a0),d3
		bne.s	loc_13580
		tst.b	(SoundDriverMaxmusRAM+$BE).l
		bne.s	loc_1357E
		cmp.b	d1,d2
		bne.s	loc_1358A
		subq.b	#1,d2
		andi.b	#$1F,d2
		bra.s	loc_1358A
; ---------------------------------------------------------------------------

loc_1357E:
		clr.w	d3

loc_13580:
		cmp.b	d1,d2
		bne.s	loc_13558
		subq.b	#1,d2
		andi.b	#$1F,d2

loc_1358A:
		move.b	d2,4(a1)
		bra.s	loc_135AE
; ---------------------------------------------------------------------------

loc_13590:
		move.b	d2,d7
		addq.b	#1,d7
		andi.w	#$1F,d7
		cmp.b	d1,d7
		beq.s	loc_135AE
		cmp.b	d1,d2
		bne.s	loc_135A8
		move.b	#$90,(a2,d2.w)
		bra.s	loc_135AE
; ---------------------------------------------------------------------------

loc_135A8:
		move.b	#$90,(a2,d7.w)

loc_135AE:
		move.w	d3,6(a0)
		rts
; End of function sub_1351E

; =============== S U B R O U T I N E =======================================

sub_135B4:
		moveq	#7,d0
		moveq	#8,d6
		lea	(SoundDriverMaxmusRAM+6).l,a0
		lea	(Z80_RAM+$1131).l,a1
		lea	(Z80_RAM+$F00).l,a2
		movea.l	(SoundDriverMaxmusRAM+2).l,a4
		clr.w	d2

loc_135CE:
		movea.l	(a0),a3
		move.w	4(a0),d4
		move.w	6(a0),d3
		move.w	(a3,d4.w),d5
		move.b	3(a1),d1
		move.b	4(a1),d2
		cmpi.w	#$7FFF,d5
		beq.s	loc_13656
		cmp.b	d1,d2
		beq.s	loc_135FE
		addq.b	#1,d2
		andi.b	#$1F,d2
		cmp.b	d1,d2
		beq.s	loc_13676

loc_135FE:
		lea	(a4,d5.w),a5

loc_13602:
		move.b	(a5,d3.w),(a2,d2.w)
		addq.b	#1,d2
		andi.b	#$1F,d2
		addq.w	#1,d3
		cmp.w	8(a0),d3
		bcs.s	loc_13646
		addq.w	#2,d4
		move.w	(a3,d4.w),d5
		cmpi.w	#$7FFF,d5
		bne.s	loc_1363A
		tst.b	(SoundDriverMaxmusRAM+$BE).l
		bne.s	loc_13634
		cmp.b	d1,d2
		bne.s	loc_13650
		subq.b	#1,d2
		andi.b	#$1F,d2
		bra.s	loc_13650
; ---------------------------------------------------------------------------

loc_13634:
		clr.w	d4
		move.w	(a3,d4.w),d5

loc_1363A:
		lea	(a4,d5.w),a5
		move.w	(a5),8(a0)
		move.w	#2,d3

loc_13646:
		cmp.b	d1,d2
		bne.s	loc_13602
		subq.b	#1,d2
		andi.b	#$1F,d2

loc_13650:
		move.b	d2,4(a1)
		bra.s	loc_13676
; ---------------------------------------------------------------------------

loc_13656:
		move.b	d2,d7
		addq.b	#1,d7
		andi.w	#$1F,d7
		cmp.b	d1,d7
		beq.s	loc_13676
		cmp.b	d1,d2
		bne.s	loc_1366E
		move.b	#-1,(a2,d2.w)
		bra.s	loc_13674
; ---------------------------------------------------------------------------

loc_1366E:
		move.b	#-1,(a2,d7.w)

loc_13674:
		subq.b	#1,d6

loc_13676:
		move.w	d3,6(a0)
		move.w	d4,4(a0)
		adda.w	#$A,a0
		adda.w	#9,a1
		adda.w	#$20,a2
		dbf	d0,loc_135CE
		move.b	d6,(SoundDriverMaxmusRAM+$C5).l
		move.b	#1,(Z80_RAM+$1A5A).l
		rts
; End of function sub_135B4

; =============== S U B R O U T I N E =======================================

sub_137BA:
		tst.b	(Z80_RAM+$1A58).l
		bne.s	locret_13832
		tst.b	(SoundDriverMaxmusRAM+$C4).l
		beq.s	locret_13832
		move.b	(Z80_RAM+$1A5C).l,d0
		cmp.b	(SoundDriverMaxmusRAM+$C2).l,d0
		bls.s		loc_137EC
		sub.b	(SoundDriverMaxmusRAM+$C3).l,d0
		bcs.s	loc_13800
		cmp.b	(SoundDriverMaxmusRAM+$C2).l,d0
		bls.s		loc_13800
		move.b	d0,(Z80_RAM+$1A5C).l
		bra.s	loc_1380C
; ---------------------------------------------------------------------------

loc_137EC:
		add.b	(SoundDriverMaxmusRAM+$C3).l,d0
		bcs.s	loc_13800
		cmp.b	(SoundDriverMaxmusRAM+$C2).l,d0
		bcc.s	loc_13800
		move.b	d0,(Z80_RAM+$1A5C).l
		bra.s	loc_1380C
; ---------------------------------------------------------------------------

loc_13800:
		move.b	(SoundDriverMaxmusRAM+$C2).l,(Z80_RAM+$1A5C).l
		clr.b	(SoundDriverMaxmusRAM+$C4).l

loc_1380C:
		moveq	#7,d0
		clr.w	d1
		clr.w	d2
		lea	(Z80_RAM+$1131).l,a0
		move.b	(Z80_RAM+$1A5C).l,d1

-		move.b	5(a0),d2
		mulu.w	d1,d2
		lsr.w	#8,d2
		move.b	d2,6(a0)
		adda.w	#9,a0
		dbf	d0,-

locret_13832:
		rts
; End of function sub_137BA

; =============== S U B R O U T I N E =======================================

PlayMusic_Process:
		moveq	#0,d0
		lea	MusicIndex_Maxmus(pc),a0
		move.b	(SoundDriverMaxmusRAM+$BC).l,d0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		lea	(a0,d0.w),a1
		move.w	(a1)+,d0
		move.b	d0,(Z80_RAM+$1A5B).l
		moveq	#8-1,d0
		lea	(SoundDriverMaxmusRAM+6).l,a0
		movea.l	(SoundDriverMaxmusRAM+2).l,a3

-		clr.w	4(a0)
		movea.l	a1,a2
		move.w	(a1)+,d1
		adda.w	d1,a2
		move.l	a2,(a0)
		move.w	(a2),d2
		cmpi.w	#$7FFF,d2
		beq.s	+
		move.w	(a3,d2.w),8(a0)
		move.w	#2,6(a0)
+		adda.w	#$A,a0
		dbf	d0,-
		lea	(SoundDriverMaxmusRAM+$A6).l,a0
		movea.l	a1,a2
		move.w	(a1)+,d1
		adda.w	d1,a2
		move.l	a2,(a0)
		move.w	#2,6(a0)
		move.w	(a2),d0
		addq.w	#2,d0
		move.w	d0,8(a0)
		lea	(Z80_RAM+$1179).l,a0
		move.b	#1,2(a0)
		move.b	#3,(Z80_RAM+$1A75).l
		lea	(Z80_RAM+$1131).l,a0
		moveq	#8-1,d0

-		move.b	(a1)+,1(a0)
		move.b	(a1)+,(a0)
		adda.w	#9,a0
		dbf	d0,-
		lea	(Z80_RAM+$1131).l,a0
		moveq	#8-1,d0

-		clr.b	3(a0)
		clr.b	4(a0)
		clr.b	7(a0)
		move.b	#1,2(a0)
		adda.w	#9,a0
		dbf	d0,-
		addq.w	#8,a1
		lea	(Z80_RAM+$1179).l,a2
		clr.b	(a2)
		clr.b	1(a2)
		clr.b	5(a2)
		clr.b	6(a2)
		clr.b	3(a2)
		clr.b	4(a2)
		clr.b	7(a2)
		bsr.s	sub_13A34
		move.b	#8,(SoundDriverMaxmusRAM+$C5).l
		clr.b	(Z80_RAM+$1A58).l

locret_13A60:
		rts
; End of function PlayMusic_Process

; =============== S U B R O U T I N E =======================================

sub_13A34:
		moveq	#0,d0
		lea	(Z80_RAM+$1182).l,a4
		lea	Instruments_Maxmus(pc),a2

-		move.b	(a1)+,d0
		cmpi.b	#-1,d0
		beq.s	locret_13A60
		add.w	d0,d0
		move.w	(a2,d0.w),d1
		lea	(a2,d1.w),a3
		move.w	#$2E,d1

-		move.b	(a3)+,(a4)+
		dbf	d1,-
		bra.s	--
; End of function sub_13A34
; ---------------------------------------------------------------------------

SndZ80Driver_Maxmus:	binclude "Sound/Maxmus/Maxmus Sound Driver.bin"
	even


   if MOMPASS=1
		message "Maxmus Sound Driver Music Data ROM offset is $\{*}"
    endif
				include "Sound/Maxmus/Data/Music Data.asm"
				include "Sound/Maxmus/Data/Instruments.asm"

MusicData_Maxmus:	binclude "Sound/Maxmus/Data/1A0000.bin"
	even