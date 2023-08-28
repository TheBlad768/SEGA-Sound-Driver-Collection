; ---------------------------------------------------------------------------
; Ancient Music Driver -MD- Z80 Program Version 1.00.
; Copyright (C) 1993-1994 Ancient corp., Programmed By Hideki Koyama.
; ---------------------------------------------------------------------------

DAC_Bank_Offset:			equ ($2D0000>>15)

; =============== S U B R O U T I N E =======================================

DAC_Driver:
		!org	0
		CPU Z80
		listing on
		jp	DAC_Driver_Init
; ---------------------------------------------------------------------------
byte_3:	db 0
byte_4:	db 0
byte_5:	db 0
byte_6:	db 0
byte_7:	db 3, 0, 1, 2, 6, 0Ch, 18h, 30h, 60h, 0A0h, 0D0h, 0E8h
		db 0F4h, 0FAh, 0FEh, 0FFh
z80_stack_top:	ds 2C1h
z80_stack:

; =============== S U B R O U T I N E =======================================

DAC_Driver_Init:
		di
		ld	sp, z80_stack
		call	LoadBank
		ld	iy, 4000h

loc_2E8:
		call	sub_678
		xor	a
		ld	(byte_3), a
		ld	(byte_4), a
		ld	(byte_5), a
		ld	(byte_6), a
		ld	b, a
		ld	c, a
		exx

loc_2FB:
		ld	a, (byte_3)
		or	a
		jr	nz, loc_31C
		call	sub_54B
		call	sub_54B
		call	sub_54B
		ld	a, (byte_4)
		or	a
		jr	nz, loc_331

loc_310:
		call	sub_54B
		call	sub_54B
		call	sub_54B
		jr	loc_2FB
; ---------------------------------------------------------------------------

loc_31C:
		bit	0, a
		call	nz, sub_6DC
		bit	1, a
		call	nz, sub_70A
		bit	7, a
		jr	nz, loc_2E8
		xor	a
		ld	(byte_3), a
		jr	loc_2FB
; ---------------------------------------------------------------------------

loc_331:
		ld	hl, 17h
		ld	ix, 4002h
		call	sub_430
		ld	ix, 4000h
		call	sub_360
		call	sub_360
		call	sub_360
		ld	ix, 4002h
		call	sub_360
		call	sub_360
		ld	ix, 4000h
		call	sub_360
		xor	a
		ld	(byte_4), a
		jr	loc_310
; End of function DAC_Driver

; =============== S U B R O U T I N E =======================================

sub_360:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jr	nz, loc_36D
		call	sub_54B
		call	sub_54B
		ret
; ---------------------------------------------------------------------------

loc_36D:
		or	a
		jr	z, loc_37B
		cp	1
		jr	z, loc_3A5
		cp	2
		jr	z, loc_3D7
		jr	loc_3BE
; ---------------------------------------------------------------------------

loc_37B:
		call	sub_54B
		call	sub_54B
		call	sub_54B

loc_384:
		bit	7, (iy+0)
		jr	nz, loc_384
		ld	(iy+0),	28h
		ld	a, (hl)
		inc	hl

loc_390:
		bit	7, (iy+0)
		jr	nz, loc_390
		ld	(iy+1),	a
		call	sub_54B
		call	sub_54B
		call	sub_54B
		jr	sub_360
; ---------------------------------------------------------------------------

loc_3A5:
		ld	a, (hl)
		inc	hl

loc_3A7:
		bit	7, (iy+0)
		jr	nz, loc_3A7
		ld	(ix+0),	a
		ld	a, (hl)
		inc	hl

loc_3B2:
		bit	7, (iy+0)
		jr	nz, loc_3B2
		ld	(ix+1),	a
		jr	sub_360
; ---------------------------------------------------------------------------

loc_3BE:
		ld	a, (hl)
		inc	hl

loc_3C0:
		bit	7, (iy+0)
		jr	nz, loc_3C0
		ld	(iy+0),	a
		ld	a, (hl)
		inc	hl

loc_3CB:
		bit	7, (iy+0)
		jr	nz, loc_3CB
		ld	(iy+1),	a
		jr	sub_360
; ---------------------------------------------------------------------------

loc_3D7:
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		ld	a, (hl)
		inc	hl
		ld	b, 18h

loc_3ED:
		bit	7, (iy+0)
		jr	nz, loc_3ED
		ld	(ix+0),	a
		ld	d, (hl)
		inc	hl

loc_3F8:
		bit	7, (iy+0)
		jr	nz, loc_3F8
		ld	(ix+1),	d
		add	a, 4
		djnz	loc_3ED
		add	a, 20h

loc_407:
		bit	7, (iy+0)
		jr	nz, loc_407
		ld	(ix+0),	a
		ld	d, (hl)
		inc	hl

loc_412:
		bit	7, (iy+0)
		jr	nz, loc_412
		ld	(ix+1),	d
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		call	sub_54B
		jp	sub_360
; End of function sub_360

; =============== S U B R O U T I N E =======================================

sub_430:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jr	nz, loc_437
		ret
; ---------------------------------------------------------------------------

loc_437:
		cp	10h
		jr	z, loc_478
		cp	11h
		jr	z, loc_484
		cp	1
		jr	z, loc_446
		jr	loc_45F
; ---------------------------------------------------------------------------

loc_446:
		ld	a, (hl)
		inc	hl

loc_448:
		bit	7, (iy+0)
		jr	nz, loc_448
		ld	(ix+0),	a
		ld	a, (hl)
		inc	hl

loc_453:
		bit	7, (iy+0)
		jr	nz, loc_453
		ld	(ix+1),	a
		jr	sub_430
; ---------------------------------------------------------------------------

loc_45F:
		ld	a, (hl)
		inc	hl

loc_461:
		bit	7, (iy+0)
		jr	nz, loc_461
		ld	(iy+0),	a
		ld	a, (hl)
		inc	hl

loc_46C:
		bit	7, (iy+0)
		jr	nz, loc_46C
		ld	(iy+1),	a
		jr	sub_430
; ---------------------------------------------------------------------------

loc_478:
		call	sub_54B
		call	sub_54B
		call	PlaySample_490
		jr	sub_430
; ---------------------------------------------------------------------------

loc_484:
		call	sub_54B
		call	sub_54B
		call	PlaySample_4E5
		jr	sub_430
; End of function sub_430

; =============== S U B R O U T I N E =======================================

PlaySample_490:
		ld	a, (hl)
		inc	hl
		cp	60h
		jr	nc, locret_4E4
		push	hl
		push	hl
		ex	af, af'
		call	LoadBank
		ex	af, af'
		ld	h, 80h
		add	a, a
		add	a, a
		ld	l, a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		jr	z, loc_4D6
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ex	de, hl
		ld	d, 80h
		exx
		ld	hl, sub_555
		ld	(loc_550+1), hl
		pop	hl
		pop	hl
		call	sub_54B
		call	sub_54B
		call	sub_54B
		ret
; ---------------------------------------------------------------------------

loc_4D6:
		pop	hl
		call	LoadBank
		pop	hl
		call	sub_54B
		call	sub_54B
		call	sub_54B

locret_4E4:
		ret
; End of function PlaySample_490

; =============== S U B R O U T I N E =======================================

PlaySample_4E5:
		ld	a, (hl)
		inc	hl
		cp	60h
		jr	nc, loc_546
		push	hl
		push	hl
		ex	af, af'
		call	LoadBank
		ex	af, af'
		ld	h, 80h
		add	a, a
		add	a, a
		ld	l, a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		jr	z, loc_538
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ex	de, hl
		ld	d, 80h
		exx
		call	sub_68F
		ld	hl, sub_5D5
		ld	(loc_550+1), hl
		pop	hl
		pop	hl
		ld	a, 0FFh
		ld	(byte_6), a
		xor	a
		ld	(byte_5), a
		call	sub_54B
		call	sub_54B
		call	sub_54B
		ret
; ---------------------------------------------------------------------------

loc_538:
		pop	hl
		call	LoadBank
		pop	hl
		call	sub_54B
		call	sub_54B
		call	sub_54B

loc_546:
		xor	a
		ld	(byte_5), a
		ret
; End of function PlaySample_4E5

; =============== S U B R O U T I N E =======================================

sub_54B:
		exx
		ld	a, c
		or	b
		jr	z, loc_553

loc_550:
		jp	DAC_Driver
; ---------------------------------------------------------------------------

loc_553:
		exx
		ret
; End of function sub_54B

; =============== S U B R O U T I N E =======================================

sub_555:
		ld	a, (hl)
		and	0F0h
		jr	nz, loc_581
		ld	a, 3
		ld	(loc_56B+1), a
		push	hl
		ld	hl, loc_568
		ld	(loc_550+1), hl
		pop	hl

loc_568:
		call	sub_661

loc_56B:
		ld	a, 0
		dec	a
		jr	z, loc_576
		ld	(loc_56B+1), a
		jr	loc_553
; ---------------------------------------------------------------------------

loc_576:
		push	hl
		ld	hl, sub_59C
		ld	(loc_550+1), hl
		pop	hl
		jr	loc_553
; ---------------------------------------------------------------------------

loc_581:
		rrca
		rrca
		rrca
		rrca
		add	a, 7
		ld	(loc_58A+1), a

loc_58A:
		ld	a, (byte_7)
		ld	e, a
		call	loc_662
		push	hl
		ld	hl, sub_59C
		ld	(loc_550+1), hl
		pop	hl
		jr	loc_553
; End of function sub_555

; =============== S U B R O U T I N E =======================================

sub_59C:
		ld	a, (hl)
		and	0Fh
		jr	nz, loc_5BC
		ld	a, 3
		ld	(loc_5B1+1), a
		push	hl
		ld	hl, loc_5AE
		ld	(loc_550+1), hl
		pop	hl

loc_5AE:
		call	sub_661

loc_5B1:
		ld	a, 0
		dec	a
		jr	z, loc_5C8
		ld	(loc_5B1+1), a
		jr	loc_553
; ---------------------------------------------------------------------------

loc_5BC:
		add	a, 7
		ld	(loc_5C1+1), a

loc_5C1:
		ld	a, (byte_7)
		ld	e, a
		call	loc_662

loc_5C8:
		inc	hl
		dec	bc
		push	hl
		ld	hl, sub_555
		ld	(loc_550+1), hl
		pop	hl
		jr	loc_553
; End of function sub_59C

; =============== S U B R O U T I N E =======================================

sub_5D5:
		ld	a, (hl)
		and	0F0h
		jr	nz, loc_601
		ld	a, 3
		ld	(loc_5EB+1), a
		push	hl
		ld	hl, loc_5E8
		ld	(loc_550+1), hl
		pop	hl

loc_5E8:
		call	sub_661

loc_5EB:
		ld	a, 0
		dec	a
		jr	z, loc_5F6
		ld	(loc_5EB+1), a
		jp	loc_553
; ---------------------------------------------------------------------------

loc_5F6:
		push	hl
		ld	hl, sub_61C
		ld	(loc_550+1), hl
		pop	hl
		jp	loc_553
; ---------------------------------------------------------------------------

loc_601:
		rrca
		rrca
		rrca
		rrca
		add	a, 7
		ld	(loc_60A+1), a

loc_60A:
		ld	a, (byte_7)
		ld	e, a
		call	loc_662
		push	hl
		ld	hl, sub_61C
		ld	(loc_550+1), hl
		pop	hl
		jp	loc_553
; End of function sub_5D5

; =============== S U B R O U T I N E =======================================

sub_61C:
		ld	a, (hl)
		and	0Fh
		jr	nz, loc_63C
		ld	a, 3
		ld	(loc_631+1), a
		push	hl
		ld	hl, loc_62E
		ld	(loc_550+1), hl
		pop	hl

loc_62E:
		call	sub_661

loc_631:
		ld	a, 0
		dec	a
		jr	z, loc_648
		ld	(loc_631+1), a
		jp	loc_553
; ---------------------------------------------------------------------------

loc_63C:
		add	a, 7
		ld	(loc_641+1), a

loc_641:
		ld	a, (byte_7)
		ld	e, a
		call	loc_662

loc_648:
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jr	z, loc_65A
		push	hl
		ld	hl, sub_5D5
		ld	(loc_550+1), hl
		pop	hl
		jp	loc_553
; ---------------------------------------------------------------------------

loc_65A:
		xor	a
		ld	(byte_6), a
		jp	loc_553
; End of function sub_61C

; =============== S U B R O U T I N E =======================================

sub_661:
		ld	a, e

loc_662:
		bit	7, (iy+0)
		jr	nz, loc_662
		ld	(iy+0),	2Ah
		add	a, d
		ld	d, a

loc_66E:
		bit	7, (iy+0)
		jr	nz, loc_66E
		ld	(iy+1),	a
		ret
; End of function sub_661

; =============== S U B R O U T I N E =======================================

sub_678:
		bit	7, (iy+0)
		jr	nz, sub_678
		ld	(iy+0),	2Bh
		nop
		nop

loc_684:
		bit	7, (iy+0)
		jr	nz, loc_684
		ld	(iy+1),	80h
		ret
; End of function sub_678

; =============== S U B R O U T I N E =======================================

sub_68F:
		bit	7, (iy+0)
		jr	nz, sub_68F
		ld	(iy+2),	0B6h
		nop
		nop

loc_69B:
		bit	7, (iy+0)
		jr	nz, loc_69B
		ld	(iy+3),	0C0h
		ret
; End of function sub_68F

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, 0
		ld	b, 7
		ld	a, DAC_Bank_Offset
		ld	hl, 6000h

-		ld	(hl), a
		rrca
		djnz	-
		ld	(hl), a
		xor	a
		ld	(hl), a
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_6DC:
		ld	hl, 4000h
		ld	b, 8
		ld	d, 28h
		ld	e, 7

loc_6E5:
		call	sub_714
		dec	e
		djnz	loc_6E5
		ld	b, 0Fh
		ld	c, 4Eh
		ld	d, 8Eh
		ld	e, 0FFh

loc_6F3:
		ld	hl, 4000h
		call	sub_714
		call	sub_725
		ld	hl, 4002h
		call	sub_714
		call	sub_725
		dec	c
		dec	d
		djnz	loc_6F3
		ret
; End of function sub_6DC

; =============== S U B R O U T I N E =======================================

sub_70A:
		ld	hl, 4000h
		ld	d, 22h
		ld	e, 0
		jr	sub_714
; End of function sub_70A

; =============== S U B R O U T I N E =======================================

sub_714:
		bit	7, (iy+0)
		jr	nz, sub_714
		ld	(hl), d
		inc	hl

loc_71C:
		bit	7, (iy+0)
		jr	nz, loc_71C
		ld	(hl), e
		dec	hl
		ret
; End of function sub_714

; =============== S U B R O U T I N E =======================================

sub_725:
		bit	7, (iy+0)
		jr	nz, sub_725
		ld	(hl), c
		inc	hl

loc_72D:
		bit	7, (iy+0)
		jr	nz, loc_72D
		ld	(hl), e
		dec	hl
		ret
; End of function sub_725

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
