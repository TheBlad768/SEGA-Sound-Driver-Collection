; ===========================================================================
; Data East(Without SFX).
; ===========================================================================

    if MOMPASS=1
		message "Data East Driver ROM offset is $\{*}"
    endif
; ---------------------------------------------------------------------------

		include "Sound/Data East/Macros.asm"
; ---------------------------------------------------------------------------

SndDriverDataEastRAM		= SoundDriverRAM

; =============== S U B R O U T I N E =======================================

SndZ80DrvLoad_DataEast:
		bsr.s	SndZ80DrvInit_DataEast
		bra.w	SndDriverInit_DataEast
; End of function SndZ80DrvLoad_DataEast

; =============== S U B R O U T I N E =======================================

PlaySound_DataEast:
		move.w	d0,(SndDriverDataEastRAM).l
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		lsl.w	#2,d0
		lea	MusicDataEast_Index(pc),a0
		movea.l	(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		moveq	#0,d0
		move.b	(SndDriverDataEastRAM+$01).l,d0
		move.w	d0,(SndDriverDataEastRAM+$100).l
		bra.w	PlaySound_Start_DataEast
; End of function PlaySound_DataEast

; =============== S U B R O U T I N E =======================================

SndZ80DrvInit_DataEast:
		stopZ80a
		resetZ80
		waitZ80
		clearZ80RAM
		clearM68KRAM
		lea	Z80_DACDriver_DataEast(pc),a0
		lea	(Z80_RAM).l,a1
		move.w	#(Z80_DACDriver_DataEast_End-Z80_DACDriver_DataEast),d0

-		move.b	(a0)+,(a1)+
		dbf	d0,-
		resetZ80a
		nop
		nop
		nop
		nop
		resetZ80
		startZ80
		rts
; End of function SndZ80DrvInit_DataEast

; =============== S U B R O U T I N E =======================================

UpdateMusic_DataEast:
		movem.l	d0-a6,-(sp)
		stopZ80
		bsr.s	DoFading_DataEast
		bsr.w	Snd_ModeSelect_DataEast
		move.b	#$2A,(ym2612_a0).l
		startZ80
		movem.l	(sp)+,d0-a6
		rts
; End of function UpdateMusic_DataEast

; =============== S U B R O U T I N E =======================================

DoFading_DataEast:
		tst.b	(SndDriverDataEastRAM+$108).l
		beq.s	locret_D5FFC
		subq.b	#1,(SndDriverDataEastRAM+$10A).l
		bne.s	locret_D5FFC
		move.b	(SndDriverDataEastRAM+$109).l,(SndDriverDataEastRAM+$10A).l
		move.b	(SndDriverDataEastRAM+$10B).l,d0
		ext.w	d0
		move.b	FadeVals(pc,d0.w),(SndDriverDataEastRAM+$107).l
		bmi.s	loc_D5FEA
		move.b	FadeVals+1(pc,d0.w),(SndDriverDataEastRAM+$10D).l
		addq.b	#2,(SndDriverDataEastRAM+$10B).l
		bra.s	locret_D5FFC
; ---------------------------------------------------------------------------

loc_D5FEA:
		clr.b	(SndDriverDataEastRAM+$108).l
		clr.b	(SndDriverDataEastRAM+$104).l
		st	(SndDriverDataEastRAM+$105).l

locret_D5FFC:
		rts
; End of function DoFading_DataEast
; ---------------------------------------------------------------------------

FadeVals:
		FadeData $00, $00
		FadeData $02, $00
		FadeData $05, $00
		FadeData $08, $00
		FadeData $0A, $01
		FadeData $0D, $01
		FadeData $10, $01
		FadeData $12, $01
		FadeData $15, $02
		FadeData $18, $02
		FadeData $1A, $02
		FadeData $1D, $02
		FadeData $20, $03
		FadeData $22, $03
		FadeData $25, $03
		FadeData $28, $04
		FadeData $7F, $04
		FadeData $FF, $FF

; =============== S U B R O U T I N E =======================================

SndDriverInit_DataEast:
		clr.b	(SndDriverDataEastRAM+$102).l
		bsr.s	InitYMChip_DataEast
		bra.s	PSGSilenceAll_DataEast
; End of function SndDriverInit_DataEast

; =============== S U B R O U T I N E =======================================

PlaySound_Start_DataEast:
		move	sr,-(sp)
		ori	#$700,sr
		movem.l	d0-a6,-(sp)
		stopZ80
		move.w	(SndDriverDataEastRAM+$100).l,d0
		bsr.w	PlayMusic_DataEast
		startZ80
		movem.l	(sp)+,d0-a6
		move	(sp)+,sr
		rts
; End of function PlaySound_Start_DataEast

; =============== S U B R O U T I N E =======================================

PSGSilenceAll_DataEast:
		lea	(PSG_input).l,a0
		move.b	#$9F,(a0)	; Silence PSG 1
		move.b	#$BF,(a0)	; Silence PSG 2
		move.b	#$DF,(a0)	; Silence PSG 3
		move.b	#-1,(a0)		; Silence noise channel
		move.b	#$E7,(a0)
		rts
; End of function PSGSilenceAll_DataEast

; =============== S U B R O U T I N E =======================================

InitYMChip_DataEast:
		stopZ80
		clr.b	(SndDriverDataEastRAM+$104).l
		bsr.w	ClearSndRAM_DataEast
		move.b	#$26,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#-1,(ym2612_d0).l

loc_D60AA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D60AA
		move.b	#$27,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$2F,(ym2612_d0).l

loc_D60CA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D60CA
		move.b	#$2B,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$80,(ym2612_d0).l

loc_D60EA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D60EA
		clr.b	(Z80_RAM+$20).l
		clr.b	(Z80_RAM+$22).l
		startZ80
		rts
; End of function InitYMChip_DataEast

; =============== S U B R O U T I N E =======================================

ClearSndRAM_DataEast:
		lea	(SndDriverDataEastRAM+$104).l,a0
		move.w	#$250,d7

-		clr.b	(a0)+
		dbf	d7,-
		rts
; End of function ClearSndRAM_DataEast

; =============== S U B R O U T I N E =======================================

PlayMusic_DataEast:
		move.b	#1,(SndDriverDataEastRAM+$104).l
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#0,(ym2612_d0).l

loc_D613A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D613A
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#1,(ym2612_d0).l

loc_D615A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D615A
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#2,(ym2612_d0).l

loc_D617A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D617A
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#4,(ym2612_d0).l

loc_D619A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D619A
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#5,(ym2612_d0).l

loc_D61BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D61BA
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#6,(ym2612_d0).l

loc_D61DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D61DA
		move.b	#$40,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D61FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D61FA
		move.b	#$41,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D621A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D621A
		move.b	#$42,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D623A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D623A
		move.b	#$44,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D625A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D625A
		move.b	#$45,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D627A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D627A
		move.b	#$46,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D629A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D629A
		move.b	#$48,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D62BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D62BA
		move.b	#$49,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D62DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D62DA
		move.b	#$4A,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D62FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D62FA
		move.b	#$4C,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D631A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D631A
		move.b	#$4D,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D633A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D633A
		move.b	#$4E,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d0).l

loc_D635A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D635A
		move.b	#$40,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D637A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D637A
		move.b	#$41,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D639A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D639A
		move.b	#$42,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D63BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D63BA
		move.b	#$44,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D63DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D63DA
		move.b	#$45,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D63FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D63FA
		move.b	#$46,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D641A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D641A
		move.b	#$48,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D643A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D643A
		move.b	#$49,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D645A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D645A
		move.b	#$4A,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D647A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D647A
		move.b	#$4C,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D649A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D649A
		move.b	#$4D,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D64BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D64BA
		move.b	#$4E,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$7F,(ym2612_d1).l

loc_D64DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D64DA
		move.b	#$80,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D64FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D64FA
		move.b	#$81,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D651A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D651A
		move.b	#$82,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D653A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D653A
		move.b	#$84,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D655A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D655A
		move.b	#$85,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D657A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D657A
		move.b	#$86,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D659A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D659A
		move.b	#$88,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D65BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D65BA
		move.b	#$89,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D65DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D65DA
		move.b	#$8A,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D65FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D65FA
		move.b	#$8C,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D661A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D661A
		move.b	#$8D,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D663A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D663A
		move.b	#$8E,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d0).l

loc_D665A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D665A
		move.b	#$80,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D667A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D667A
		move.b	#$81,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D669A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D669A
		move.b	#$82,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D66BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D66BA
		move.b	#$84,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D66DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D66DA
		move.b	#$85,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D66FA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D66FA
		move.b	#$86,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D671A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D671A
		move.b	#$88,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D673A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D673A
		move.b	#$89,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D675A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D675A
		move.b	#$8A,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D677A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D677A
		move.b	#$8C,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D679A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D679A
		move.b	#$8D,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D67BA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D67BA
		move.b	#$8E,(ym2612_a1).l
		nop
		nop
		nop
		nop
		move.b	#$FF,(ym2612_d1).l

loc_D67DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D67DA
		move.b	#1,(Z80_RAM+$20).l
		bsr.w	ClearSndRAM_DataEast
		lea	(SoundDriverMusicRAM).l,a0
		move.l	(a0)+,(SndDriverDataEastRAM+$114).l
		move.l	(a0)+,(SndDriverDataEastRAM+$174).l
		move.l	(a0)+,(SndDriverDataEastRAM+$1D4).l
		move.l	(a0)+,(SndDriverDataEastRAM+$234).l
		move.l	(a0)+,(SndDriverDataEastRAM+$294).l
		move.l	(a0)+,(SndDriverDataEastRAM+$2F4).l
		move.b	(a0)+,(SndDriverDataEastRAM+$118).l
		move.b	(a0)+,(SndDriverDataEastRAM+$178).l
		move.b	(a0)+,(SndDriverDataEastRAM+$1D8).l
		move.b	(a0)+,(SndDriverDataEastRAM+$238).l
		move.b	(a0)+,(SndDriverDataEastRAM+$298).l
		move.b	(a0)+,(SndDriverDataEastRAM+$2F8).l
		move.l	(SndDriverDataEastRAM+$114).l,d0		; FIX by Valley Ball
		sub.l	a0,d0
		sub.l	d0,(SndDriverDataEastRAM+$114).l
		sub.l	d0,(SndDriverDataEastRAM+$174).l
		sub.l	d0,(SndDriverDataEastRAM+$1D4).l
		sub.l	d0,(SndDriverDataEastRAM+$234).l
		sub.l	d0,(SndDriverDataEastRAM+$294).l
		sub.l	d0,(SndDriverDataEastRAM+$2F4).l
		move.b	#3,(SndDriverDataEastRAM+$104).l
		tst.b	(SndDriverDataEastRAM+$102).l
		beq.s	locret_D685C
		clr.b	(SndDriverDataEastRAM+$104).l

locret_D685C:
		rts
; End of function PlayMusic_DataEast
; ---------------------------------------------------------------------------

loc_D6884:
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#0,(ym2612_d0).l

loc_D689C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D689C
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#1,(ym2612_d0).l

loc_D68BC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D68BC
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#2,(ym2612_d0).l

loc_D68DC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D68DC
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#4,(ym2612_d0).l

loc_D68FC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D68FC
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#5,(ym2612_d0).l

loc_D691C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D691C
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#6,(ym2612_d0).l

loc_D693C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D693C
		move.b	#$7F,(SndDriverDataEastRAM+$106).l
		lea	(ym2612_a0).l,a6
		lea	(SndDriverDataEastRAM+$114).l,a5
		moveq	#0,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#4,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	(ym2612_a1).l,a6
		lea	$60(a5),a5
		moveq	#0,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.w	Snd_FM_SendVol_DataEast
		move.b	#1,(Z80_RAM+$20).l
		clr.b	(SndDriverDataEastRAM+$108).l
		move.b	#1,(SndDriverDataEastRAM+$104).l
		rts
; ---------------------------------------------------------------------------

loc_D69CA:
		clr.b	(SndDriverDataEastRAM+$106).l
		lea	(ym2612_a0).l,a6
		lea	(SndDriverDataEastRAM+$114).l,a5
		moveq	#0,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#4,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	(ym2612_a1).l,a6
		lea	$60(a5),a5
		moveq	#0,d5
		bsr.w	Snd_FM_SendVol_DataEast
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.w	Snd_FM_SendVol_DataEast
		move.b	#3,(SndDriverDataEastRAM+$104).l
		rts
; ---------------------------------------------------------------------------

Snd_Mode4_DataEast:
		move.b	#$26,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	(SndDriverDataEastRAM+$11).l,(ym2612_d0).l

loc_D6A34:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D6A34
		move.b	#3,(SndDriverDataEastRAM+$104).l

locret_D6A58:
		rts

; =============== S U B R O U T I N E =======================================

Snd_ModeSelect_DataEast:
		moveq	#0,d0
		move.b	(SndDriverDataEastRAM+$104).l,d0
		add.w	d0,d0
		move.w	off_D6A5A(pc,d0.w),d0
		jmp	off_D6A5A(pc,d0.w)
; End of function Snd_ModeSelect_DataEast
; ---------------------------------------------------------------------------

off_D6A5A:
		dc.w loc_D6884-off_D6A5A
		dc.w locret_D6A58-off_D6A5A
		dc.w loc_D69CA-off_D6A5A
		dc.w loc_D6A64-off_D6A5A
		dc.w Snd_Mode4_DataEast-off_D6A5A
; ---------------------------------------------------------------------------

loc_D6A64:
		move.b	(ym2612_a0).l,d0
		andi.b	#2,d0
		beq.w	locret_D6AE2
		move.b	#$27,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#$2F,(ym2612_d0).l

loc_D6A8A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D6A8A
		lea	(ym2612_a0).l,a6
		lea	(SndDriverDataEastRAM+$114).l,a5
		moveq	#0,d5
		bsr.s	sub_D6AE4
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.s	sub_D6AE4
		lea	$60(a5),a5
		moveq	#4,d5
		bsr.s	sub_D6AE4
		lea	(ym2612_a1).l,a6
		lea	$60(a5),a5
		moveq	#0,d5
		bsr.s	sub_D6AE4
		lea	$60(a5),a5
		moveq	#2,d5
		bsr.s	sub_D6AE4
		lea	$60(a5),a5
		moveq	#4,d5
		bsr.w	sub_D88D0
		addq.w	#1,(SndDriverDataEastRAM+$10E).l

locret_D6AE2:
		rts

; =============== S U B R O U T I N E =======================================

sub_D6AE4:
		tst.b	4(a5)
		bmi.w	locret_D6BAA
		movea.l	(a5),a4
		tst.b	5(a5)
		bne.w	loc_D6B92
		tst.b	$E(a5)
		bne.s	loc_D6B08
		andi.b	#$C0,$F(a5)
		bsr.w	sub_D8898

loc_D6B08:
		clr.b	$E(a5)
		clr.b	$17(a5)

loc_D6B10:
		move.b	(a4)+,d4
		bpl.s	loc_D6B60
		andi.w	#$7F,d4
		add.w	d4,d4
		move.w	off_D6B2C(pc,d4.w),d4
		jsr	off_D6B2C(pc,d4.w)
		tst.b	4(a5)
		bmi.w	locret_D6BAA
		bra.s	loc_D6B10
; ---------------------------------------------------------------------------

off_D6B2C:
		dc.w loc_D8970-off_D6B2C
		dc.w loc_D8996-off_D6B2C
		dc.w loc_D89B0-off_D6B2C
		dc.w loc_D9342-off_D6B2C
		dc.w locret_D934C-off_D6B2C
		dc.w locret_D934C-off_D6B2C
		dc.w loc_D934E-off_D6B2C
		dc.w loc_D9354-off_D6B2C
		dc.w loc_D935A-off_D6B2C
		dc.w loc_D9372-off_D6B2C
		dc.w locret_D9396-off_D6B2C
		dc.w locret_D9396-off_D6B2C
		dc.w locret_D9396-off_D6B2C
		dc.w loc_D9398-off_D6B2C
		dc.w loc_D93AC-off_D6B2C
		dc.w loc_D93D8-off_D6B2C
		dc.w loc_D93FA-off_D6B2C
		dc.w loc_D9404-off_D6B2C
		dc.w loc_D940A-off_D6B2C
		dc.w loc_D941C-off_D6B2C
		dc.w loc_D9424-off_D6B2C
		dc.w loc_D942A-off_D6B2C
		dc.w loc_D9456-off_D6B2C
		dc.w loc_D945E-off_D6B2C
		dc.w loc_D9466-off_D6B2C
		dc.w loc_D9470-off_D6B2C
; ---------------------------------------------------------------------------

loc_D6B60:
		move.b	(a4)+,5(a5)
		cmpi.b	#$7F,d4
		beq.s	loc_D6B9E
		bsr.w	sub_D8880
		bsr.w	sub_D8864
		bsr.w	sub_D6C6A
		bsr.w	sub_D6C96
		bsr.w	FM_SendNoteFreq
		tst.b	$21(a5)
		beq.w	loc_D6B8E
		bsr.w	FM_NoteOff
		bra.w	loc_D6B92
; ---------------------------------------------------------------------------

loc_D6B8E:
		bsr.w	FM_NoteOn

loc_D6B92:
		bsr.w	sub_D6BBA
		bsr.w	sub_D6C0A
		bsr.w	sub_D6C20

loc_D6B9E:
		bsr.w	sub_D6BAC
		subq.b	#1,5(a5)
		move.l	a4,(a5)

locret_D6BAA:
		rts
; End of function sub_D6AE4

; =============== S U B R O U T I N E =======================================

sub_D6BAC:
		tst.b	(SndDriverDataEastRAM+$108).l
		beq.s	locret_D6BB8
		bsr.w	Snd_FM_SendVol_DataEast

locret_D6BB8:
		rts
; End of function sub_D6BAC

; =============== S U B R O U T I N E =======================================

sub_D6BBA:
		move.b	$F(a5),d1
		tst.b	$10(a5)
		beq.s	loc_D6BDC
		move.b	$13(a5),d0
		cmp.b	5(a5),d0
		bne.s	loc_D6BDC
		move.b	$10(a5),d0
		andi.b	#$F8,$F(a5)
		or.b	d0,$F(a5)

loc_D6BDC:
		tst.b	$11(a5)
		beq.s	loc_D6BFC
		move.b	$15(a5),d0
		cmp.b	5(a5),d0
		bne.s	loc_D6BFC
		move.b	$11(a5),d0
		lsl.b	#4,d0
		andi.b	#$CF,$F(a5)
		or.b	d0,$F(a5)

loc_D6BFC:
		cmp.b	$F(a5),d1
		beq.w	locret_D6C08
		bsr.w	sub_D8898

locret_D6C08:
		rts
; End of function sub_D6BBA

; =============== S U B R O U T I N E =======================================

sub_D6C0A:
		move.b	$D(a5),d0
		cmp.b	5(a5),d0
		bne.s	locret_D6C1E
		tst.b	$E(a5)
		bne.s	locret_D6C1E
		bsr.w	FM_NoteOff

locret_D6C1E:
		rts
; End of function sub_D6C0A

; =============== S U B R O U T I N E =======================================

sub_D6C20:
		tst.b	$17(a5)
		beq.s	locret_D6C2A
		bsr.s	sub_D6C2C

locret_D6C2A:
		rts
; End of function sub_D6C20

; =============== S U B R O U T I N E =======================================

sub_D6C2C:
		move.w	$1C(a5),d0
		bmi.s	loc_D6C4C
		add.w	d0,$18(a5)
		move.w	$18(a5),d0
		cmp.w	$1A(a5),d0
		bcs.s	loc_D6C64
		move.w	$1A(a5),$18(a5)
		clr.b	$17(a5)
		bra.s	loc_D6C64
; ---------------------------------------------------------------------------

loc_D6C4C:
		add.w	d0,$18(a5)
		move.w	$18(a5),d0
		cmp.w	$1A(a5),d0
		bcc.s	loc_D6C64
		move.w	$1A(a5),$18(a5)
		clr.b	$17(a5)

loc_D6C64:
		bsr.w	FM_SendNoteFreq
		rts
; End of function sub_D6C2C

; =============== S U B R O U T I N E =======================================

sub_D6C6A:
		tst.b	$17(a5)
		beq.s	locret_D6C94
		moveq	#0,d1
		move.b	5(a5),d1
		beq.s	locret_D6C94
		move.b	$1E(a5),d0
		sub.b	d4,d0
		ext.w	d0
		lsl.w	#5,d0
		ext.l	d0
		divs.w	d1,d0
		bpl.s	loc_D6C8C
		subq.w	#1,d0
		bra.s	loc_D6C8E
; ---------------------------------------------------------------------------

loc_D6C8C:
		addq.w	#1,d0

loc_D6C8E:
		add.w	d0,d0
		move.w	d0,$1C(a5)

locret_D6C94:
		rts
; End of function sub_D6C6A

; =============== S U B R O U T I N E =======================================

sub_D6C96:
		move.b	d4,d0
		ext.w	d0
		lsl.w	#6,d0
		move.w	d0,$18(a5)
		rts
; End of function sub_D6C96

; =============== S U B R O U T I N E =======================================

FM_SendNoteFreq:
		moveq	#0,d0
		move.w	$18(a5),d0
		move.w	FMFreqVals(pc,d0.w),d0
		move.b	$16(a5),d1
		ext.w	d1
		add.w	d1,d0
		rol.w	#8,d0
		move.w	off_D6CC0(pc,d5.w),d1
		jmp	off_D6CC0(pc,d1.w)
; End of function FM_SendNoteFreq
; ---------------------------------------------------------------------------

off_D6CC0:
		dc.w Snd_SendFM1Freq-off_D6CC0
		dc.w Snd_SendFM2Freq-off_D6CC0
		dc.w Snd_SendFM3Freq-off_D6CC0
; ---------------------------------------------------------------------------

FMFreqVals:		binclude "Sound/Data East/Misc/FreqVals.bin"
	even
; ---------------------------------------------------------------------------

Snd_SendFM1Freq:
		move.b	#$A4,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rol.w	#8,d0
		move.b	#$A0,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rts
; ---------------------------------------------------------------------------

Snd_SendFM2Freq:
		move.b	#$A5,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rol.w	#8,d0
		move.b	#$A1,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rts
; ---------------------------------------------------------------------------

Snd_SendFM3Freq:
		move.b	#$A6,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rol.w	#8,d0
		move.b	#$A2,(a6)
		nop
		nop
		nop
		nop
		move.b	d0,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rts

; =============== S U B R O U T I N E =======================================

FM_NoteOn:
		st	$20(a5)
		move.b	4(a5),d0
		ori.b	#$F0,d0
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	d0,(ym2612_d0).l

loc_D85F0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D85F0
		rts
; End of function FM_NoteOn

; =============== S U B R O U T I N E =======================================

FM_NoteOff:
		clr.b	$20(a5)
		move.b	4(a5),d0
		andi.b	#$F,d0
		move.b	#$28,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	d0,(ym2612_d0).l

loc_D861C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D861C
		rts
; End of function FM_NoteOff

; =============== S U B R O U T I N E =======================================

Snd_FM_SendVol_DataEast:
		move.b	4(a5),d0
		andi.b	#3,d0
		addi.b	#$40,d0
		move.b	$A(a5),d1
		andi.w	#7,d1
		add.w	d1,d1
		move.w	Snd_FM_VolJmp(pc,d1.w),d1
		jmp	Snd_FM_VolJmp(pc,d1.w)
; End of function Snd_FM_SendVol_DataEast
; ---------------------------------------------------------------------------

Snd_FM_VolJmp:
		dc.w Snd_FM_VolOp1-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp1-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp1-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp1-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp2-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp3-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp3-Snd_FM_VolJmp
		dc.w Snd_FM_VolOp4-Snd_FM_VolJmp
; ---------------------------------------------------------------------------

Snd_FM_VolOp1:
		addi.b	#$C,d0
		move.b	9(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D8672
		move.b	#$7F,d1

loc_D8672:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D8682:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8682
		rts
; ---------------------------------------------------------------------------

Snd_FM_VolOp2:
		addq.b	#8,d0
		move.b	8(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D86A8
		move.b	#$7F,d1

loc_D86A8:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D86B8:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D86B8
		addq.b	#4,d0
		move.b	9(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D86DC
		move.b	#$7F,d1

loc_D86DC:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D86EC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D86EC
		rts
; ---------------------------------------------------------------------------

Snd_FM_VolOp3:
		addq.b	#4,d0
		move.b	7(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D8712
		move.b	#$7F,d1

loc_D8712:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D8722:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8722
		addq.b	#4,d0
		move.b	8(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D8746
		move.b	#$7F,d1

loc_D8746:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D8756:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8756
		addq.b	#4,d0
		move.b	9(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D877A
		move.b	#$7F,d1

loc_D877A:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D878A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D878A
		rts
; ---------------------------------------------------------------------------

Snd_FM_VolOp4:
		move.b	6(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D87AE
		move.b	#$7F,d1

loc_D87AE:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D87BE:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D87BE
		addq.b	#4,d0
		move.b	7(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D87E2
		move.b	#$7F,d1

loc_D87E2:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D87F2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D87F2
		addq.b	#4,d0
		move.b	8(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D8816
		move.b	#$7F,d1

loc_D8816:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D8826:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8826
		addq.b	#4,d0
		move.b	9(a5),d1
		add.b	$B(a5),d1
		add.b	(SndDriverDataEastRAM+$106).l,d1
		add.b	(SndDriverDataEastRAM+$107).l,d1
		bpl.s	loc_D884A
		move.b	#$7F,d1

loc_D884A:
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	d1,1(a6)

loc_D885A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D885A
		rts

; =============== S U B R O U T I N E =======================================

sub_D8864:
		move.b	5(a5),d0
		andi.w	#$FF,d0
		move.b	$C(a5),d1
		ext.w	d1
		mulu.w	d0,d1
		lsr.w	#3,d1
		sub.b	d1,d0
		addq.b	#1,d0
		move.b	d0,$D(a5)
		rts
; End of function sub_D8864

; =============== S U B R O U T I N E =======================================

sub_D8880:
		move.b	5(a5),d0
		move.b	d0,d1
		sub.b	$12(a5),d0
		move.b	d0,$13(a5)
		sub.b	$14(a5),d1
		move.b	d1,$15(a5)
		rts
; End of function sub_D8880

; =============== S U B R O U T I N E =======================================

sub_D8898:
		move.b	4(a5),d0
		andi.b	#3,d0
		addi.b	#-$4C,d0
		move.b	d0,(a6)
		nop
		nop
		nop
		nop
		move.b	$F(a5),1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		rts
; End of function sub_D8898

; =============== S U B R O U T I N E =======================================

sub_D88D0:
		tst.b	4(a5)
		bmi.w	locret_D896E
		movea.l	(a5),a4
		tst.b	5(a5)
		bne.w	loc_D8966

loc_D88E4:
		move.b	(a4)+,d4
		bpl.s	loc_D892C
		andi.w	#$7F,d4
		add.w	d4,d4
		move.w	off_D88F8(pc,d4.w),d4
		jsr	off_D88F8(pc,d4.w)
		bra.s	loc_D88E4
; ---------------------------------------------------------------------------

off_D88F8:
		dc.w loc_D8970-off_D88F8
		dc.w loc_D8996-off_D88F8
		dc.w loc_D89B0-off_D88F8
		dc.w loc_D9342-off_D88F8
		dc.w locret_D934C-off_D88F8
		dc.w locret_D934C-off_D88F8
		dc.w loc_D934E-off_D88F8
		dc.w loc_D9354-off_D88F8
		dc.w loc_D935A-off_D88F8
		dc.w loc_D9372-off_D88F8
		dc.w locret_D9396-off_D88F8
		dc.w locret_D9396-off_D88F8
		dc.w locret_D9396-off_D88F8
		dc.w loc_D9398-off_D88F8
		dc.w loc_D93AC-off_D88F8
		dc.w loc_D93D8-off_D88F8
		dc.w loc_D93FA-off_D88F8
		dc.w loc_D9404-off_D88F8
		dc.w loc_D940A-off_D88F8
		dc.w loc_D941C-off_D88F8
		dc.w loc_D9424-off_D88F8
		dc.w loc_D942A-off_D88F8
		dc.w loc_D9456-off_D88F8
		dc.w loc_D945E-off_D88F8
		dc.w loc_D9466-off_D88F8
		dc.w loc_D9470-off_D88F8
; ---------------------------------------------------------------------------

loc_D892C:
		move.b	(a4)+,5(a5)
		move.b	(SndDriverDataEastRAM+$10C).l,d0
		add.b	(SndDriverDataEastRAM+$10D).l,d0
		cmpi.b	#4,d0
		bls.s	loc_D8946
		move.b	#4,d0

loc_D8946:
		move.b	d0,(Z80_RAM+$22).l
		cmpi.b	#$7F,d4
		beq.s	loc_D8966
		tst.b	$21(a5)
		bne.w	loc_D8966
		move.b	d4,(SndDriverDataEastRAM+$112).l
		move.b	d4,(Z80_RAM+$20).l

loc_D8966:
		subq.b	#1,5(a5)
		move.l	a4,(a5)

locret_D896E:
		rts
; End of function sub_D88D0

; ---------------------------------------------------------------------------

loc_D8970:
		move.b	(a4),(SndDriverDataEastRAM+$111).l
		move.b	#$26,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	(a4)+,(ym2612_d0).l

loc_D898C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D898C
		rts
; ---------------------------------------------------------------------------

loc_D8996:
		move.b	(a4)+,(a6)
		nop
		nop
		nop
		nop
		move.b	(a4)+,1(a6)

loc_D89A6:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D89A6
		rts
; ---------------------------------------------------------------------------

loc_D89B0:
		moveq	#0,d0
		move.b	(a4)+,d0
		move.b	d0,$1F(a5)
		lsl.w	#5,d0
		lea	Snd_East_Instruments(pc),a0
		cmpi.w	#((LoadDriver_DataEast3_Index-LoadDrvData_Index)/$10),(Driver_SaveLine_Count).w
		bne.s	+
		lea	Snd_East_Instruments2(pc),a0
+		lea	(a0,d0.w),a0
		move.b	(a0),$A(a5)
		move.b	5(a0),6(a5)
		move.b	6(a0),7(a5)
		move.b	7(a0),8(a5)
		move.b	8(a0),9(a5)
		move.w	off_D89E8(pc,d5.w),d0
		jmp	off_D89E8(pc,d0.w)
; ---------------------------------------------------------------------------

off_D89E8:
		dc.w loc_D89EE-off_D89E8
		dc.w loc_D8D0A-off_D89E8
		dc.w loc_D9026-off_D89E8
; ---------------------------------------------------------------------------

loc_D89EE:
		move.b	#$80,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8A02:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8A02
		move.b	#$84,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8A1E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8A1E
		move.b	#$88,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8A3A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8A3A
		move.b	#$8C,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8A56:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8A56
		move.b	#$B0,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		move.b	#$30,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8A9A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8A9A
		move.b	#$34,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8AB4:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8AB4
		move.b	#$38,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8ACE:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8ACE
		move.b	#$3C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8AE8:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8AE8
		move.b	#$40,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B02:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B02
		move.b	#$44,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B1C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B1C
		move.b	#$48,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B36:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B36
		move.b	#$4C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B50:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B50
		move.b	#$50,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B6A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B6A
		move.b	#$54,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B84:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B84
		move.b	#$58,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8B9E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8B9E
		move.b	#$5C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8BB8:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8BB8
		move.b	#$60,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8BD2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8BD2
		move.b	#$64,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8BEC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8BEC
		move.b	#$68,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C06:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C06
		move.b	#$6C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C20:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C20
		move.b	#$70,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C3A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C3A
		move.b	#$74,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C54:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C54
		move.b	#$78,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C6E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C6E
		move.b	#$7C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8C88:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8C88
		move.b	#$80,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8CA2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8CA2
		move.b	#$84,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8CBC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8CBC
		move.b	#$88,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8CD6:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8CD6
		move.b	#$8C,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8CF0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8CF0
		move.b	(a0)+,$10(a5)
		move.b	(a0)+,$12(a5)
		move.b	(a0)+,$11(a5)
		move.b	(a0)+,$14(a5)
		rts
; ---------------------------------------------------------------------------

loc_D8D0A:
		move.b	#$81,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8D1E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8D1E
		move.b	#$85,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8D3A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8D3A
		move.b	#$89,(a6)
		nop
		nop
		nop
		nop
		move.b	#-1,1(a6)

loc_D8D56:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8D56
		move.b	#$8D,(a6)
		nop
		nop
		nop
		nop
		move.b	#$FF,1(a6)

loc_D8D72:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8D72
		move.b	#$B1,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		move.b	#$31,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8DB6:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8DB6
		move.b	#$35,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8DD0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8DD0
		move.b	#$39,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8DEA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8DEA
		move.b	#$3D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E04:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E04
		move.b	#$41,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E1E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E1E
		move.b	#$45,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E38:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E38
		move.b	#$49,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E52:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E52
		move.b	#$4D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E6C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E6C
		move.b	#$51,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8E86:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8E86
		move.b	#$55,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8EA0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8EA0
		move.b	#$59,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8EBA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8EBA
		move.b	#$5D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8ED4:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8ED4
		move.b	#$61,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8EEE:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8EEE
		move.b	#$65,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F08:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F08
		move.b	#$69,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F22:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F22
		move.b	#$6D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F3C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F3C
		move.b	#$71,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F56:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F56
		move.b	#$75,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F70:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F70
		move.b	#$79,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8F8A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8F8A
		move.b	#$7D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8FA4:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8FA4
		move.b	#$81,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8FBE:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8FBE
		move.b	#$85,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8FD8:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8FD8
		move.b	#$89,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D8FF2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D8FF2
		move.b	#$8D,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D900C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D900C
		move.b	(a0)+,$10(a5)
		move.b	(a0)+,$12(a5)
		move.b	(a0)+,$11(a5)
		move.b	(a0)+,$14(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9026:
		move.b	#$82,(a6)
		nop
		nop
		nop
		nop
		move.b	#$FF,1(a6)

loc_D903A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D903A
		move.b	#$86,(a6)
		nop
		nop
		nop
		nop
		move.b	#$FF,1(a6)

loc_D9056:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9056
		move.b	#$8A,(a6)
		nop
		nop
		nop
		nop
		move.b	#$FF,1(a6)

loc_D9072:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9072
		move.b	#$8E,(a6)
		nop
		nop
		nop
		nop
		move.b	#$FF,1(a6)

loc_D908E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D908E
		move.b	#$B2,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		move.b	#$32,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D90D2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D90D2
		move.b	#$36,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D90EC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D90EC
		move.b	#$3A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9106:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9106
		move.b	#$3E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9120:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9120
		move.b	#$42,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D913A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D913A
		move.b	#$46,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9154:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9154
		move.b	#$4A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D916E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D916E
		move.b	#$4E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9188:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9188
		move.b	#$52,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D91A2:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D91A2
		move.b	#$56,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D91BC:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D91BC
		move.b	#$5A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D91D6:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D91D6
		move.b	#$5E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D91F0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D91F0
		move.b	#$62,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D920A:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D920A
		move.b	#$66,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9224:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9224
		move.b	#$6A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D923E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D923E
		move.b	#$6E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9258:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9258
		move.b	#$72,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9272:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9272
		move.b	#$76,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D928C:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D928C
		move.b	#$7A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D92A6:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D92A6
		move.b	#$7E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D92C0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D92C0
		move.b	#$82,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D92DA:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D92DA
		move.b	#$86,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D92F4:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D92F4
		move.b	#$8A,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D930E:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D930E
		move.b	#$8E,(a6)
		nop
		nop
		nop
		nop
		move.b	(a0)+,1(a6)

loc_D9328:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D9328
		move.b	(a0)+,$10(a5)
		move.b	(a0)+,$12(a5)
		move.b	(a0)+,$11(a5)
		move.b	(a0)+,$14(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9342:
		move.b	(a4)+,$B(a5)
		bra.w	Snd_FM_SendVol_DataEast
; ---------------------------------------------------------------------------

locret_D934C:
		rts
; ---------------------------------------------------------------------------

loc_D934E:
		move.b	(a4)+,$C(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9354:
		st	$E(a5)
		rts
; ---------------------------------------------------------------------------

loc_D935A:
		move.b	$2D(a5),d0
		ext.w	d0
		move.b	(a4)+,$2E(a5,d0.w)
		add.w	d0,d0
		add.w	d0,d0
		move.l	a4,$38(a5,d0.w)
		addq.b	#1,$2D(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9372:
		subq.b	#1,$2D(a5)
		move.b	$2D(a5),d0
		ext.w	d0
		tst.b	$2E(a5,d0.w)
		beq.s	loc_D9388
		subq.b	#1,$2E(a5,d0.w)
		beq.s	locret_D9394

loc_D9388:
		add.w	d0,d0
		add.w	d0,d0
		movea.l	$38(a5,d0.w),a4
		addq.b	#1,$2D(a5)

locret_D9394:
		rts
; ---------------------------------------------------------------------------

locret_D9396:
		rts
; ---------------------------------------------------------------------------

loc_D9398:
		st	$17(a5)
		move.b	(a4)+,d0
		move.b	d0,$1E(a5)
		ext.w	d0
		lsl.w	#6,d0
		move.w	d0,$1A(a5)
		rts
; ---------------------------------------------------------------------------

loc_D93AC:
		move.b	(a4)+,d0
		move.b	d0,(SndDriverDataEastRAM+$113).l
		ori.b	#8,d0
		move.b	#$22,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	d0,(ym2612_d0).l

loc_D93CE:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D93CE
		rts
; ---------------------------------------------------------------------------

loc_D93D8:
		move.b	#$22,(ym2612_a0).l
		nop
		nop
		nop
		nop
		move.b	#0,(ym2612_d0).l

loc_D93F0:
		tst.b	(ym2612_a0).l
		bmi.s	loc_D93F0
		rts
; ---------------------------------------------------------------------------

loc_D93FA:
		move.b	(a4)+,$10(a5)
		move.b	(a4)+,$12(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9404:
		clr.b	$10(a5)
		rts
; ---------------------------------------------------------------------------

loc_D940A:
		move.b	(a4)+,d0
		andi.b	#$3F,$F(a5)
		or.b	d0,$F(a5)
		bra.w	sub_D8898
; ---------------------------------------------------------------------------

loc_D941C:
		move.b	(a4)+,(SndDriverDataEastRAM+$105).l
		rts
; ---------------------------------------------------------------------------

loc_D9424:
		move.b	(a4)+,$16(a5)
		rts
; ---------------------------------------------------------------------------

loc_D942A:
		st	4(a5)
		move.l	a5,d0
		subi.l	#SndDriverDataEastRAM+$14,d0
		divu.w	#$60,d0
		bset	d0,(SndDriverDataEastRAM+$110).l
		cmpi.b	#$3F,(SndDriverDataEastRAM+$110).l
		bne.s	locret_D9454
		move.b	#1,(SndDriverDataEastRAM+$104).l

locret_D9454:
		rts
; ---------------------------------------------------------------------------

loc_D9456:
		move.b	(a4)+,(SndDriverDataEastRAM+$10C).l
		rts
; ---------------------------------------------------------------------------

loc_D945E:
		move.b	(a4)+,(Z80_RAM+$20).l
		rts
; ---------------------------------------------------------------------------

loc_D9466:
		move.b	(a4)+,$11(a5)
		move.b	(a4)+,$14(a5)
		rts
; ---------------------------------------------------------------------------

loc_D9470:
		clr.b	$11(a5)
		rts

; =============== S U B R O U T I N E =======================================

Z80_DACDriver_DataEast:		binclude "Sound/Data East/DAC Driver (Z80).bin"
		DACEntA	$0010, $0001, $0F8000, $01	; 01

		DACEntry	DAC02, $01	; 02
		DACEntry	DAC03, $01	; 03
		DACEntry	DAC04, $01	; 04
		DACEntry	DAC05, $01	; 05
		DACEntry	DAC06, $01	; 06
		DACEntry	DAC07, $01	; 07
		DACEntry	DAC08, $01	; 08
		DACEntry	DAC09, $01	; 09
		DACEntry	DAC0A, $01	; 0A
		DACEntry	DAC0A, $03	; 0B
		DACEntry	DAC0B, $01	; 0C
		DACEntry	DAC0B, $08	; 0D
		DACEntry	DAC0B, $0F	; 0E
		DACEntry	DAC0B, $18	; 0F
		DACEntry	DAC0B, $1F	; 10
		DACEntry	DAC0B, $28	; 11
		DACEntry	DAC0C, $01	; 12
		DACEntry	DAC0C, $08	; 13
		DACEntry	DAC0C, $0F	; 14
		DACEntry	DAC0C, $18	; 15
		DACEntry	DAC0C, $1F	; 16
		DACEntry	DAC0C, $28	; 17
		DACEntry	DAC0D, $04	; 18
		DACEntry	DAC0D, $08	; 19
		DACEntry	DAC0E, $01	; 1A
		DACEntry	DAC0F, $03	; 1B
		DACEntry	DAC10, $01	; 1C
		DACEntry	DAC11, $04	; 1D
		DACEntry	DAC11, $08	; 1E
		DACEntry	DAC12, $04	; 1F
		DACEntry	DAC12, $08	; 20
		DACEntry	DAC13, $02	; 21
		DACEntry	DAC13, $03	; 22
		DACEntry	DAC13, $04	; 23
		DACEntry	DAC13, $05	; 24
		DACEntry	DAC13, $07	; 25
		DACEntry	DAC13, $08	; 26
		DACEntry	DAC13, $0A	; 27
		DACEntry	DAC13, $0B	; 28
		DACEntry	DAC13, $0D	; 29
		DACEntry	DAC13, $0F	; 2A
		DACEntry	DAC13, $10	; 2B
		DACEntry	DAC13, $12	; 2C
		DACEntry	DAC13, $14	; 2D
		DACEntry	DAC13, $16	; 2E
		DACEntry	DAC13, $19	; 2F
		DACEntry	DAC13, $1B	; 30
		DACEntry	DAC13, $1D	; 31
		DACEntry	DAC13, $20	; 32
		DACEntry	DAC13, $24	; 33
		DACEntry	DAC13, $26	; 34
		DACEntry	DAC13, $29	; 35
		DACEntry	DAC13, $2D	; 36
		DACEntry	DAC13, $30	; 37
		DACEntry	DAC13, $34	; 38
		DACEntry	DAC13, $37	; 39
		DACEntry	DAC14, $02	; 3A
		DACEntry	DAC14, $03	; 3B
		DACEntry	DAC14, $04	; 3C
		DACEntry	DAC14, $05	; 3D
		DACEntry	DAC14, $07	; 3E
		DACEntry	DAC14, $08	; 3F
		DACEntry	DAC14, $0A	; 40
		DACEntry	DAC14, $0B	; 41
		DACEntry	DAC14, $0C	; 42
		DACEntry	DAC14, $0F	; 43
		DACEntry	DAC14, $10	; 44
		DACEntry	DAC14, $12	; 45
		DACEntry	DAC14, $14	; 46
		DACEntry	DAC14, $16	; 47
		DACEntry	DAC14, $19	; 48
		DACEntry	DAC14, $1B	; 49
		DACEntry	DAC14, $1D	; 4A
		DACEntry	DAC14, $20	; 4B
		DACEntry	DAC14, $24	; 4C
		DACEntry	DAC14, $26	; 4D
		DACEntry	DAC14, $29	; 4E
		DACEntry	DAC14, $2D	; 4F
		DACEntry	DAC14, $30	; 50
		DACEntry	DAC14, $34	; 51
		DACEntry	DAC14, $36	; 52
		DACEntry	DAC15, $01	; 53
		DACEntry	DAC16, $01	; 54
		even
Z80_DACDriver_DataEast_End

   if MOMPASS=1
		message " Data East Driver Sound Data ROM offset is $\{*}"
    endif
Snd_East_Instruments:	binclude "Sound/Data East/Instruments.bin"
	even
   if MOMPASS=1
		message " Data East Driver Sound Data ROM offset is $\{*}"
    endif
Snd_East_Instruments2:	binclude "Sound/Data East/Instruments(SHFYZ).bin"
	even
   if MOMPASS=1
		message " Data East Driver Music Data ROM offset is $\{*}"
    endif
Snd_MusicDataEast:		include "Sound/Data East/Music/Music Data.asm"
	even
		align $8000
   if MOMPASS=1
		message " Data East Driver Samples Data ROM offset is $\{*}"
    endif
	incpcm	DAC02, "Sound\Data East\DAC\DAC02.bin"
	incpcm	DAC03, "Sound\Data East\DAC\DAC03.bin"
	incpcm	DAC04, "Sound\Data East\DAC\DAC04.bin"
	incpcm	DAC05, "Sound\Data East\DAC\DAC05.bin"
	incpcm	DAC06, "Sound\Data East\DAC\DAC06.bin"
	incpcm	DAC07, "Sound\Data East\DAC\DAC07.bin"
	incpcm	DAC08, "Sound\Data East\DAC\DAC08.bin"
	incpcm	DAC09, "Sound\Data East\DAC\DAC09.bin"
	incpcm	DAC0A, "Sound\Data East\DAC\DAC0A.bin"
	incpcm	DAC0B, "Sound\Data East\DAC\DAC0B.bin"
	incpcm	DAC0C, "Sound\Data East\DAC\DAC0C.bin"
		align $8000
   if MOMPASS=1
		message " Data East Driver Samples Data ROM offset is $\{*}"
    endif
	incpcm	DAC0D, "Sound\Data East\DAC\DAC0D.bin"
	incpcm	DAC0E, "Sound\Data East\DAC\DAC0E.bin"
	incpcm	DAC0F, "Sound\Data East\DAC\DAC0F.bin"
	incpcm	DAC10, "Sound\Data East\DAC\DAC10.bin"
	incpcm	DAC11, "Sound\Data East\DAC\DAC11.bin"
	incpcm	DAC12, "Sound\Data East\DAC\DAC12.bin"
	incpcm	DAC13, "Sound\Data East\DAC\DAC13.bin"
	incpcm	DAC14, "Sound\Data East\DAC\DAC14.bin"
	incpcm	DAC15, "Sound\Data East\DAC\DAC15.bin"
	incpcm	DAC16, "Sound\Data East\DAC\DAC16.bin"
	even