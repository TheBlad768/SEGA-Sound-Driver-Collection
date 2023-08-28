
; =============== S U B R O U T I N E =======================================

Play_MusicAMP:
		move.w	d0,(Sound_test_sound).w
		movem.l	a1-a6,-(sp)
		bsr.w	sub_1E5082
		bsr.w	sub_1E500E
		move.w	(Sound_test_sound).w,d0
		beq.s	+
		bsr.w	sub_1E6012
+		movem.l	(sp)+,a1-a6
		rts
; End of function Play_MusicAMP

; =============== S U B R O U T I N E =======================================

sub_1E5000:
		move.l	a1,-(sp)
		lea	(loc_1E792A).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5000

; =============== S U B R O U T I N E =======================================

sub_1E500E:
		move.l	a1,-(sp)
		lea	($FFFFF6D4).l,a0
		lea	(loc_1E799A).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E500E

; =============== S U B R O U T I N E =======================================

sub_1E5022:
		move.l	a1,-(sp)
		lea	(sub_1E79A4).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5022

; =============== S U B R O U T I N E =======================================

sub_1E5030:
		move.l	a1,-(sp)
		lea	($FFFFF6D4).l,a0
		lea	(loc_1E79D4).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5030

; =============== S U B R O U T I N E =======================================

sub_1E5044:
		move.l	a1,-(sp)
		lea	($FFFFF6D6).l,a0
		lea	(loc_1E7AF8).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5044

; =============== S U B R O U T I N E =======================================

sub_1E5058:
		move.l	a1,-(sp)
		lea	(loc_1E7B6C).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5058
; ---------------------------------------------------------------------------

loc_1E5066:
		move.l	a1,-(sp)
		lea	(loc_1E7B70).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts

; =============== S U B R O U T I N E =======================================

sub_1E5074:
		move.l	a1,-(sp)
		lea	(loc_1E7CAC).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5074

; =============== S U B R O U T I N E =======================================

sub_1E5082:
		move.l	a1,-(sp)
		lea	(loc_1E7D52).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5082

; =============== S U B R O U T I N E =======================================

sub_1E5090:
		move.l	a1,-(sp)
		lea	(loc_1E7D8C).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E5090

; =============== S U B R O U T I N E =======================================

sub_1E509E:
		move.l	a1,-(sp)
		lea	(loc_1E7DB8).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E509E

; =============== S U B R O U T I N E =======================================

sub_1E50AC:
		move.l	a1,-(sp)
		lea	(loc_1E7E60).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E50AC

; =============== S U B R O U T I N E =======================================

sub_1E50BA:
		move.l	a1,-(sp)
		lea	(loc_1E7E90).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E50BA

; =============== S U B R O U T I N E =======================================

sub_1E50C8:
		move.l	a1,-(sp)
		lea	(loc_1E7EC0).l,a1
		jsr	(a1)
		movea.l	(sp)+,a1
		rts
; End of function sub_1E50C8

; =============== S U B R O U T I N E =======================================

Play_SoundAMP:
		subq.w	#1,d0
		bmi.s	locret_1E5FB8
		movem.l	a0-a1,-(sp)
		lsl.w	#3,d0
		lea	byte_1E50D6(pc),a0
		adda.w	d0,a0
		lea	($FFFFF6D6).l,a1
		moveq	#0,d0
		move.b	(a0)+,d0
		adda.w	d0,a1
		move.b	(a0)+,d0
		cmp.b	(a1),d0
		bcs.s	loc_1E5FB4
		move.b	(a0)+,(a1)
		move.b	(a0)+,1(a1)
		move.l	(a0)+,2(a1)

loc_1E5FB4:
		movem.l	(sp)+,a0-a1

locret_1E5FB8:
		rts
; End of function Play_SoundAMP

; =============== S U B R O U T I N E =======================================

sub_1E5FBA:
		clr.b	($408000).l
		movea.l	(sp),a0
		move.l	#sub_1E5FFA,-4(a0)
		lea	(Music_Pointer1_Index).l,a0
		lea	(Music_Tbl1).l,a1
		bsr.w	sub_1E6078
		lea	(Music_Pointer2_Index).l,a0
		lea	(Music_Tbl2).l,a1
		bsr.w	sub_1E6078
		lea	(Music_Pointer3_Index).l,a0
		lea	(Music_Tbl3).l,a1
		bsr.w	sub_1E6078
; End of function sub_1E5FBA

; =============== S U B R O U T I N E =======================================

sub_1E5FFA:
		move.w	#$100,(Z80_reset).l
		move.w	#$E4,d1
		bsr.w	sub_1E5074
		bsr.w	sub_1E5082
		bra.w	sub_1E500E
; End of function sub_1E5FFA

; =============== S U B R O U T I N E =======================================

sub_1E6012:
		lea	(Music_Tbl1).l,a0
		add.w	d0,d0
		add.w	d0,d0
		adda.w	word_1E602A(pc,d0.w),a0
		move.w	word_1E6028(pc,d0.w),d0
		jmp	loc_1E5066(pc)
; End of function sub_1E6012
; ---------------------------------------------------------------------------

word_1E6028:
		dc.w 0
word_1E602A:
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 1
		dc.w 0
		dc.w 2
		dc.w 0
		dc.w 5
		dc.w 8
		dc.w 3
		dc.w 0
		dc.w 4
		dc.w 0
		dc.w 5
		dc.w 0
		dc.w 6
		dc.w 0
		dc.w 0
		dc.w 8
		dc.w 1
		dc.w 8
		dc.w 2
		dc.w 8
		dc.w 3
		dc.w 8
		dc.w 4
		dc.w 8
		dc.w 0
		dc.w $10
		dc.w 1
		dc.w $10
		dc.w 4
		dc.w $10
		dc.w 3
		dc.w $10
		dc.w 2
		dc.w $10
		dc.w 6
		dc.w 8

; =============== S U B R O U T I N E =======================================

sub_1E6078:
		move.l	a0,4(a1)
		move.l	a0,d2
		add.l	d2,(a0)
		add.l	d2,6(a0)
		add.l	d2,$C(a0)
		subi.l	#-$12,d2
		moveq	#1,d7
		movea.l	(a0)+,a2
		move.l	a2,(a1)
		move.w	(a0)+,d0
		subq.w	#1,d0

loc_1E6098:
		moveq	#0,d1
		move.b	(a2),d1
		lsl.l	#8,d1
		move.b	1(a2),d1
		lsl.l	#8,d1
		move.b	2(a2),d1
		add.l	d2,d1
		move.b	d1,2(a2)
		lsr.l	#8,d1
		move.b	d1,1(a2)
		lsr.l	#8,d1
		move.b	d1,(a2)
		addq.w	#3,a2
		dbf	d0,loc_1E6098

loc_1E60BE:
		move.l	(a0),d0
		movea.l	d0,a2
		lsl.l	#1,d0
		lsr.w	#1,d0
		addi.w	#-$8000,d0
		move.l	d0,(a0)+
		move.w	(a0)+,d0
		subq.w	#1,d0

loc_1E60D0:
		moveq	#0,d1
		move.b	(a2),d1
		lsl.l	#8,d1
		move.b	1(a2),d1
		lsl.l	#8,d1
		move.b	2(a2),d1
		add.l	d2,d1
		lsl.l	#1,d1
		lsr.w	#1,d1
		addi.w	#-$8000,d1
		move.b	d1,2(a2)
		lsr.l	#8,d1
		move.b	d1,1(a2)
		lsr.l	#8,d1
		move.b	d1,(a2)
		addq.w	#3,a2
		dbf	d0,loc_1E60D0
		dbf	d7,loc_1E60BE
		rts
; End of function sub_1E6078
; ---------------------------------------------------------------------------

AdvancedZ80_Player:		binclude "Sound/Advanced Z80 Player/Sound Driver (Z80).bin"
	even
byte_1E7914:
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, $F3
	even

; =============== S U B R O U T I N E =======================================

sub_1E7928:
		moveq	#0,d3

loc_1E792A:
		movem.l	d0-d1/a1,-(sp)

loc_1E792E:
		move.w	#$100,(Z80_bus_request).l

loc_1E7936:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7936
		lea	($A01810).l,a1

loc_1E7946:
		move.b	(a1),d0
		cmp.b	(a1),d0
		bne.s	loc_1E7946
		tst.b	d0
		beq.s	loc_1E797A
		move.w	#0,(Z80_bus_request).l
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
		nop
		nop
		nop
		nop
		bra.s	loc_1E792E
; ---------------------------------------------------------------------------

loc_1E797A:
		addq.w	#1,a1
		moveq	#$11,d1

loc_1E797E:
		move.b	(a1),d0
		cmp.b	(a1),d0
		bne.s	loc_1E797E
		move.b	d0,(a0)+
		addq.w	#1,a1
		dbf	d1,loc_1E797E
		move.w	#0,(Z80_bus_request).l
		movem.l	(sp)+,d0-d1/a1
		rts
; End of function sub_1E7928

; ---------------------------------------------------------------------------

loc_1E799A:
		clr.w	(a0)
		moveq	#0,d0
		bsr.w	sub_1E79A4
		rts

; =============== S U B R O U T I N E =======================================

sub_1E79A4:
		movem.l	a1,-(sp)
		move.w	#$100,(Z80_bus_request).l

loc_1E79B0:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E79B0
		lea	($A00E67).l,a1

loc_1E79C0:
		move.b	d0,(a1)
		cmp.b	(a1),d0
		bne.s	loc_1E79C0
		move.w	#0,(Z80_bus_request).l
		movem.l	(sp)+,a1
		rts
; End of function sub_1E79A4

; ---------------------------------------------------------------------------

loc_1E79D4:
		movem.l	d0-d1,-(sp)
		add.w	d0,(a0)
		move.w	(a0),d1
		cmpi.w	#$FF,d1
		beq.s	loc_1E79F2
		bcs.s	loc_1E79EA
		move.w	#$FF,d1
		move.w	d1,(a0)

loc_1E79EA:
		move.b	byte_1E79F8(pc,d1.w),d0
		bsr.w	sub_1E79A4

loc_1E79F2:
		movem.l	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

byte_1E79F8:
		dc.b 0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   0
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   1
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   2
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   3
		dc.b   4
		dc.b   4
		dc.b   4
		dc.b   4
		dc.b   4
		dc.b   4
		dc.b   5
		dc.b   5
		dc.b   5
		dc.b   5
		dc.b   5
		dc.b   6
		dc.b   6
		dc.b   6
		dc.b   6
		dc.b   6
		dc.b   7
		dc.b   7
		dc.b   7
		dc.b   7
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b   8
		dc.b   9
		dc.b   9
		dc.b   9
		dc.b   9
		dc.b  $A
		dc.b  $A
		dc.b  $A
		dc.b  $A
		dc.b  $B
		dc.b  $B
		dc.b  $B
		dc.b  $C
		dc.b  $C
		dc.b  $C
		dc.b  $D
		dc.b  $D
		dc.b  $D
		dc.b  $E
		dc.b  $E
		dc.b  $E
		dc.b  $F
		dc.b  $F
		dc.b  $F
		dc.b $10
		dc.b $10
		dc.b $11
		dc.b $11
		dc.b $11
		dc.b $12
		dc.b $12
		dc.b $13
		dc.b $13
		dc.b $14
		dc.b $14
		dc.b $14
		dc.b $15
		dc.b $15
		dc.b $16
		dc.b $16
		dc.b $17
		dc.b $17
		dc.b $18
		dc.b $18
		dc.b $19
		dc.b $19
		dc.b $1A
		dc.b $1A
		dc.b $1B
		dc.b $1B
		dc.b $1C
		dc.b $1D
		dc.b $1D
		dc.b $1E
		dc.b $1E
		dc.b $1F
		dc.b $1F
		dc.b $20
		dc.b $21
		dc.b $21
		dc.b $22
		dc.b $23
		dc.b $23
		dc.b $24
		dc.b $25
		dc.b $25
		dc.b $26
		dc.b $27
		dc.b $27
		dc.b $28
		dc.b $29
		dc.b $29
		dc.b $2A
		dc.b $2B
		dc.b $2C
		dc.b $2C
		dc.b $2D
		dc.b $2E
		dc.b $2F
		dc.b $2F
		dc.b $30
		dc.b $31
		dc.b $32
		dc.b $33
		dc.b $33
		dc.b $34
		dc.b $35
		dc.b $36
		dc.b $37
		dc.b $38
		dc.b $39
		dc.b $39
		dc.b $3A
		dc.b $3B
		dc.b $3C
		dc.b $3D
		dc.b $3E
		dc.b $3F
		dc.b $40
		dc.b $41
		dc.b $42
		dc.b $43
		dc.b $44
		dc.b $45
		dc.b $46
		dc.b $47
		dc.b $48
		dc.b $49
		dc.b $4A
		dc.b $4B
		dc.b $4C
		dc.b $4D
		dc.b $4E
		dc.b $4F
		dc.b $50
		dc.b $52
		dc.b $53
		dc.b $54
		dc.b $55
		dc.b $56
		dc.b $57
		dc.b $58
		dc.b $5A
		dc.b $5B
		dc.b $5C
		dc.b $5D
		dc.b $5F
		dc.b $60
		dc.b $61
		dc.b $62
		dc.b $64
		dc.b $65
		dc.b $66
		dc.b $67
		dc.b $69
		dc.b $6A
		dc.b $6B
		dc.b $6D
		dc.b $6E
		dc.b $70
		dc.b $71
		dc.b $72
		dc.b $74
		dc.b $75
		dc.b $77
		dc.b $78
		dc.b $7A
		dc.b $7B
		dc.b $7C
		dc.b $7E
		dc.b $7F

		include "Sound/Advanced Z80 Player/SFX.asm"

; =============== S U B R O U T I N E =======================================

loc_1E7AF8:
		move.w	#$100,(Z80_bus_request).l

loc_1E7B00:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7B00
		lea	($A017EA).l,a1
		moveq	#5,d7

loc_1E7B12:
		tst.l	2(a0)
		beq.s	loc_1E7B3A
		moveq	#5,d6

loc_1E7B1A:
		move.b	(a0)+,d0

loc_1E7B1C:
		move.b	d0,(a1)
		cmp.b	(a1),d0
		bne.s	loc_1E7B1C
		addq.w	#1,a1
		dbf	d6,loc_1E7B1A
		clr.l	-4(a0)
		dbf	d7,loc_1E7B12
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7B3A:
		tst.b	1(a0)
		beq.s	loc_1E7B56
		subq.b	#1,1(a0)
		addq.w	#6,a0
		addq.w	#6,a1
		dbf	d7,loc_1E7B12
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7B56:
		clr.b	0(a0)
		addq.w	#6,a0
		addq.w	#6,a1
		dbf	d7,loc_1E7B12
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7B6C:
		move.l	a0,-(sp)
		bra.s	loc_1E7B76
; ---------------------------------------------------------------------------

loc_1E7B70:
		move.l	a0,-(sp)
		lea	byte_1E7914(pc),a3

loc_1E7B76:
		move.w	#$100,(Z80_bus_request).l
		move.w	#$100,(Z80_reset).l

loc_1E7B86:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7B86
		movea.l	(a0),a0
		adda.w	d0,a0
		add.w	d0,d0
		adda.w	d0,a0
		moveq	#0,d0
		move.b	(a0)+,d0
		lsl.w	#8,d0
		move.b	(a0)+,d0
		lsl.l	#8,d0
		move.b	(a0)+,d0
		movea.l	d0,a0
		lea	($A01480).l,a1
		moveq	#5,d7

loc_1E7BAE:
		bsr.w	sub_1E7BBE
		adda.w	#$67,a1
		dbf	d7,loc_1E7BAE
		bra.w	loc_1E7C70

; =============== S U B R O U T I N E =======================================

sub_1E7BBE:
		moveq	#0,d1
		move.b	(a0),d1
		lsl.w	#2,d1
		beq.w	loc_1E7C56
		movea.l	d0,a2
		addq.l	#2,d0
		lsl.l	#1,d0
		lsr.w	#1,d0
		addi.w	#-$8000,d0

loc_1E7BD4:
		move.b	d0,$2F(a1)
		cmp.b	$2F(a1),d0
		bne.s	loc_1E7BD4
		lsr.l	#8,d0

loc_1E7BE0:
		move.b	d0,$2E(a1)
		cmp.b	$2E(a1),d0
		bne.s	loc_1E7BE0
		lsr.w	#8,d0

loc_1E7BEC:
		move.b	d0,$2D(a1)
		cmp.b	$2D(a1),d0
		bne.s	loc_1E7BEC
		move.b	(a2)+,d0

loc_1E7BF8:
		move.b	d0,$2B(a1)
		cmp.b	$2B(a1),d0
		bne.s	loc_1E7BF8
		move.b	(a2),d0

loc_1E7C04:
		move.b	d0,$29(a1)
		cmp.b	$29(a1),d0
		bne.s	loc_1E7C04
		move.b	(a3)+,d0

loc_1E7C10:
		move.b	d0,$2A(a1)
		cmp.b	$2A(a1),d0
		bne.s	loc_1E7C10
		move.b	(a3)+,d0

loc_1E7C1C:
		move.b	d0,$20(a1)
		cmp.b	$20(a1),d0
		bne.s	loc_1E7C1C
		move.b	(a3)+,d0

loc_1E7C28:
		move.b	d0,$21(a1)
		cmp.b	$21(a1),d0
		bne.s	loc_1E7C28
		move.b	#$FF,d0

loc_1E7C36:
		move.b	d0,$3D(a1)
		cmp.b	$3D(a1),d0
		bne.s	loc_1E7C36
		move.b	#$FF,d0

loc_1E7C44:
		move.b	d0,$1F(a1)
		cmp.b	$1F(a1),d0
		bne.s	loc_1E7C44
		adda.w	d1,a0

loc_1E7C50:
		addq.w	#2,a0
		move.l	a0,d0
		rts
; ---------------------------------------------------------------------------

loc_1E7C56:
		move.b	d1,d0

loc_1E7C58:
		move.b	d0,$1F(a1)
		cmp.b	$1F(a1),d0
		bne.s	loc_1E7C58
		move.b	d1,d0

loc_1E7C64:
		move.b	d0,$3D(a1)
		cmp.b	$3D(a1),d0
		bne.s	loc_1E7C64
		bra.s	loc_1E7C50
; End of function sub_1E7BBE
; ---------------------------------------------------------------------------

loc_1E7C70:
		movea.l	(sp)+,a0
		lea	($A00E61).l,a1
		movea.l	4(a0),a0
		addq.w	#7,a0
		move.b	(a0)+,(a1)+
		move.b	(a0)+,1(a1)
		move.b	(a0)+,(a1)
		addq.w	#3,a0
		addq.w	#2,a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,1(a1)
		move.b	(a0)+,(a1)
		move.w	#0,(Z80_reset).l
		move.w	#0,(Z80_bus_request).l
		move.w	#$100,(Z80_reset).l
		rts
; ---------------------------------------------------------------------------

loc_1E7CAC:
		lea	AdvancedZ80_Player(pc),a5
		lea	(Z80_RAM).l,a0
		move.w	#$100,(Z80_bus_request).l
		move.w	#$100,(Z80_reset).l

loc_1E7CC6:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7CC6
		move.w	#$1824,d2

loc_1E7CD4:
		move.b	(a5)+,d0

loc_1E7CD6:
		move.b	d0,(a0)
		cmp.b	(a0),d0
		bne.s	loc_1E7CD6
		addq.w	#1,a0
		dbf	d2,loc_1E7CD4
		lea	($A0003B).l,a0

loc_1E7CE8:
		move.b	d1,(a0)
		cmp.b	(a0),d1
		bne.s	loc_1E7CE8
		move.w	#0,(Z80_reset).l
		move.w	#0,(Z80_bus_request).l
		move.w	#$100,(Z80_reset).l
		rts
; ---------------------------------------------------------------------------

loc_1E7D52:
		move.w	#$100,(Z80_bus_request).l

loc_1E7D5A:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7D5A
		lea	($A01480).l,a1
		moveq	#5,d7

loc_1E7D6C:
		move.b	#0,d0

loc_1E7D70:
		move.b	d0,$1F(a1)
		cmp.b	$1F(a1),d0
		bne.s	loc_1E7D70
		adda.w	#$67,a1
		dbf	d7,loc_1E7D6C
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7D8C:
		move.w	#$100,(Z80_bus_request).l

loc_1E7D94:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7D94
		lea	($A000ED).l,a1

loc_1E7DA4:
		move.b	d0,(a1)
		cmp.b	(a1),d0
		bne.s	loc_1E7DA4
		nop
		nop
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7DB8:
		move.w	#$100,(Z80_bus_request).l

loc_1E7DC0:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7DC0
		lea	($A016EA).l,a1

loc_1E7DD0:
		move.b	d0,(a1)
		cmp.b	(a1),d0
		bne.s	loc_1E7DD0
		add.l	d2,d5
		andi.w	#$7FFF,d5
		addi.w	#-$8000,d5
		addq.w	#1,a1
		move.l	d2,d4
		andi.w	#$7FFF,d2
		addi.w	#-$8000,d2
		ror.w	#8,d2

loc_1E7DEE:
		move.b	d2,(a1)
		cmp.b	(a1),d2
		bne.s	loc_1E7DEE
		addq.w	#1,a1
		ror.w	#8,d2

loc_1E7DF8:
		move.b	d2,(a1)
		cmp.b	(a1),d2
		bne.s	loc_1E7DF8
		addq.w	#1,a1
		ror.w	#8,d3

loc_1E7E02:
		move.b	d3,(a1)
		cmp.b	(a1),d3
		bne.s	loc_1E7E02
		addq.w	#1,a1
		ror.w	#8,d3

loc_1E7E0C:
		move.b	d3,(a1)
		cmp.b	(a1),d3
		bne.s	loc_1E7E0C
		addq.w	#1,a1
		lsr.l	#8,d4
		lsr.l	#7,d4

loc_1E7E18:
		move.b	d4,(a1)
		cmp.b	(a1),d4
		bne.s	loc_1E7E18
		addq.w	#1,a1
		ror.w	#8,d5

loc_1E7E22:
		move.b	d5,(a1)
		cmp.b	(a1),d5
		bne.s	loc_1E7E22
		addq.w	#1,a1
		ror.w	#8,d5

loc_1E7E2C:
		move.b	d5,(a1)
		cmp.b	(a1),d5
		bne.s	loc_1E7E2C
		addq.w	#1,a1
		ror.w	#8,d6

loc_1E7E36:
		move.b	d6,(a1)
		cmp.b	(a1),d6
		bne.s	loc_1E7E36
		addq.w	#1,a1
		ror.w	#8,d6

loc_1E7E40:
		move.b	d6,(a1)
		cmp.b	(a1),d6
		bne.s	loc_1E7E40
		addq.w	#1,a1

loc_1E7E48:
		move.b	#$80,(a1)
		cmpi.b	#$80,(a1)
		bne.s	loc_1E7E48
		nop
		nop
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7E60:
		move.w	#$100,(Z80_bus_request).l

loc_1E7E68:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7E68
		lea	($A0180E).l,a1
		move.b	#$FF,d0

loc_1E7E7C:
		move.b	d0,0(a1)
		cmp.b	0(a1),d0
		bne.s	loc_1E7E7C
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7E90:
		move.w	#$100,(Z80_bus_request).l

loc_1E7E98:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7E98
		lea	($A0180E).l,a1
		move.b	#0,d0

loc_1E7EAC:
		move.b	d0,0(a1)
		cmp.b	0(a1),d0
		bne.s	loc_1E7EAC
		move.w	#0,(Z80_bus_request).l
		rts
; ---------------------------------------------------------------------------

loc_1E7EC0:
		move.w	#$100,(Z80_bus_request).l

loc_1E7EC8:
		btst	#0,(Z80_bus_request).l
		bne.s	loc_1E7EC8
		lea	($A0003B).l,a0
		move.b	d1,(a0)
		move.w	#0,(Z80_bus_request).l
		rts

; =============== S U B R O U T I N E =======================================

Music_Tbl1:
		dc.l Music_Pointer1
		dc.l Music_Pointer1_Index
Music_Tbl2:
		dc.l Music_Pointer2
		dc.l Music_Pointer2_Index
Music_Tbl3:
		dc.l Music_Pointer3
		dc.l Music_Pointer3_Index

; =============== S U B R O U T I N E =======================================

		align $1E8000
		include "Sound/Advanced Z80 Player/Music.asm"
	even