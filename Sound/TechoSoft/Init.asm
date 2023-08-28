; ---------------------------------------------------------------------------
; TechoSoft Sound Driver v1.31
; ---------------------------------------------------------------------------

    if MOMPASS=1
		message " TechoSoft Sound Driver ROM offset is $\{*}"
    endif

; =============== S U B R O U T I N E =======================================

PlaySound_TechoEM:
		move.w	d0,d1
		cmpi.w	#$10,d0
		bcc.s	+
		move.l	d0,-(sp)
		move.l	#MusEMBank1,d0
		bsr.s	Load_CurrentTechoBank
		move.l	(sp)+,d0
+		cmpi.w	#$F,d0
		bls.w	PlaySound_TechoStart
		move.l	d0,-(sp)
		move.l	#MusEMBank2,d0
		bsr.s	Load_CurrentTechoBank
		move.l	(sp)+,d0
		subi.w	#$10,d0
		bra.w	PlaySound_TechoStart

; =============== S U B R O U T I N E =======================================

Load_CurrentTechoBank:
		bsr.w	sub_6DDE
		move.l	a1,-(sp)
		movea.l	#Z80_RAM+3,a1
		move.b	#$A,(a1)+
	rept 4
		rol.l	#8,d0
		move.b	d0,(a1)+
	endm
		movea.l	(sp)+,a1
		startZ80
		rts
; End of function Load_CurrentTechoBank

; =============== S U B R O U T I N E =======================================

PlaySound_TechoDF:
		move.w	d0,d1
		move.l	d0,-(sp)
		move.l	#MusDFBank1,d0
		bsr.s	Load_CurrentTechoBank
		move.l	(sp)+,d0
		bra.s	PlaySound_TechoStart

; =============== S U B R O U T I N E =======================================

PlaySound_TechoTF3:
		move.w	d0,d1
		cmpi.w	#$C,d0
		bcc.s	+
		move.l	d0,-(sp)
		move.l	#MusTF3Bank2,d0
		bsr.s	Load_CurrentTechoBank
		move.l	(sp)+,d0
+		cmpi.w	#$B,d0
		bls.s		PlaySound_TechoStart
		move.l	d0,-(sp)
		move.l	#MusTF3Bank1,d0
		bsr.s	Load_CurrentTechoBank
		move.l	(sp)+,d0
		subi.w	#$C,d0
		bra.s	PlaySound_TechoStart

; =============== S U B R O U T I N E =======================================

PlaySound_TechoTF4:
		move.w	d0,d1
		cmpi.w	#$22,d0
		bls.s		+
		move.l	d0,-(sp)
		move.l	#MusTF4Bank3,d0
		bsr.w	Load_CurrentTechoBank
		move.l	(sp)+,d0
		subi.w	#$23,d0
		bra.s	PlaySound_TechoStart
; ---------------------------------------------------------------------------
+		cmpi.w	#$E,d0
		bls.s		+
		move.l	d0,-(sp)
		move.l	#MusTF4Bank2,d0
		bsr.w	Load_CurrentTechoBank
		move.l	(sp)+,d0
		subi.w	#$F,d0
		bra.s	PlaySound_TechoStart
; ---------------------------------------------------------------------------
+		move.l	d0,-(sp)
		move.l	#MusTF4Bank1,d0
		bsr.w	Load_CurrentTechoBank
		move.l	(sp)+,d0

PlaySound_TechoStart:
		bsr.w	sub_6DDE
		move.l	a1,-(sp)
		movea.l	#Z80_RAM+3,a1
		move.b	#9,(a1)+
	rept 2
		rol.w	#8,d0
		move.b	d0,(a1)+
	endm
		movea.l	(sp)+,a1
		startZ80
		moveq	#0,d0
		move.w	(Driver_SaveLine_Count).w,d0
		cmpi.w	#((LoadDriver_TechoDF_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		lea	DF_LoopIndex(pc),a1
+		cmpi.w	#((LoadDriver_TechoEM_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		lea	EM_LoopIndex(pc),a1
+		cmpi.w	#((LoadDriver_TechoTF3_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		lea	TF3_LoopIndex(pc),a1
+		cmpi.w	#((LoadDriver_TechoTF4_Index-LoadDrvData_Index)/$10),d0
		bne.s	+
		lea	TF4_LoopIndex(pc),a1
+		move.b	(a1,d1.w),d0	; Set loop
		bsr.w	sub_6DDE
		move.l	a1,-(sp)
		movea.l	#Z80_RAM+3,a1
		move.b	#1,(a1)+
		move.b	d0,(a1)+
		movea.l	(sp)+,a1
		startZ80
		rts
; End of function sub_6C42
; ---------------------------------------------------------------------------

DF_LoopIndex:	dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
				dc.b $FF, 0, 0, 0, $FF, $FF, $FF, $FF, $FF
EM_LoopIndex:	dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
				dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
TF3_LoopIndex:	dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
				dc.b $FF, $FF, 0, $FF, 0, 0, 0, $FF, 0
TF4_LoopIndex:	dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
				dc.b $FF, $FF, 0, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
				dc.b $FF, $FF, 0, $FF, $FF, $FF, $FF, 0, $FF, $FF, 0, 0, 0
				dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

; =============== S U B R O U T I N E =======================================

; Чем больше значение, тем дольше происходит остановка музыки.

SoundStopFade_Techo:
		bsr.s	sub_6DDE
		move.l	a1,-(sp)
		movea.l	#Z80_RAM+3,a1
		move.b	#3,(a1)+
		move.b	d0,(a1)+
		clr.b	(a1)+
		movea.l	(sp)+,a1
		startZ80
		rts
; End of function SoundStopFade_Techo

; =============== S U B R O U T I N E =======================================

sub_6DDE:
		nop
		stopZ80
		tst.b	(Z80_RAM+3).l
		beq.s	locret_6E0E
		startZ80
		move.l	d0,-(sp)
		moveq	#$63,d0
		dbf	d0,*
		move.l	(sp)+,d0
		bra.s	sub_6DDE
; ---------------------------------------------------------------------------

locret_6E0E:
		rts
; End of function sub_6DDE

; =============== S U B R O U T I N E =======================================

Snd_TechoZ80Driver:		binclude "Sound/TechoSoft/TechoSoft Sound Driver.bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusTF3Bank1:	binclude "Sound/TechoSoft/Data/Thunder Force III/Mus(70000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusTF3Bank2:	binclude "Sound/TechoSoft/Data/Thunder Force III/Mus(78000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusTF4Bank1:	binclude "Sound/TechoSoft/Data/Thunder Force IV/Mus(78000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusTF4Bank2:	binclude "Sound/TechoSoft/Data/Thunder Force IV/Mus(80000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusTF4Bank3:	binclude "Sound/TechoSoft/Data/Thunder Force IV/Mus(88000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusDFBank1:		binclude "Sound/TechoSoft/Data/Dragon's Fury/Mus(78000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusEMBank1:	binclude "Sound/TechoSoft/Data/Elemental Master/Mus(70000).bin"
		align $8000
   if MOMPASS=1
		message "TechoSoft Sound Driver Music Data ROM offset is $\{*}"
    endif
MusEMBank2:	binclude "Sound/TechoSoft/Data/Elemental Master/Mus(78000).bin"
	even