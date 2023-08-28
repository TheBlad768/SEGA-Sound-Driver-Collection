; ---------------------------------------------------------------------------
; Capcom Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($268000>>16)	; Music Data offset(Only $10000, $20000, $30000, etc...)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		!org	0
		CPU Z80
		listing on

		di
		im	1
		ld	sp, byte_17FF
		ld	a, 77h
		ld	(byte_1304), a
		ld	hl, byte_1380
		ld	de, byte_1381
		ld	bc, loc_47F
		ld	(hl), 0
		ldir
		call	sub_331

loc_1B:
		ld	a, (4000h)
		rlca
		jp	c, loc_1B
		ld	a, 2Bh
		ld	(4000h), a

loc_27:
		ld	a, (4000h)
		rlca
		jp	c, loc_27
		xor	a
		ld	(4001h), a

loc_32:
		ld	a, (4000h)
		rlca
		jp	c, loc_32
		ld	a, 2Ah
		ld	(4000h), a

loc_3E:
		ld	a, (4000h)
		rlca
		jp	c, loc_3E
		ld	a, 80h
		ld	(4001h), a

loc_4A:
		ld	a, (4000h)
		rlca
		jp	c, loc_4A
		ld	a, 26h
		ld	(4000h), a

loc_56:
		ld	a, (4000h)
		rlca
		jp	c, loc_56
		ld	a, 0C8h
		ld	(4001h), a

loc_62:
		ld	a, (4000h)
		rlca
		jp	c, loc_62
		ld	a, 27h
		ld	(4000h), a

loc_6E:
		ld	a, (4000h)
		rlca
		jp	c, loc_6E
		ld	a, 2Ah
		ld	(4001h), a
		ld	bc, 6000h
		ld	a, 0
		ld	(bc), a
		ld	a, Music_Bank_Offset
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		ld	a, (8001h)
		ld	(byte_138C), a
		ld	a, 0FFh
		ld	(byte_1303), a
		ld	(byte_1304), a

loc_9F:
		call	sub_159
		ld	a, (4000h)
		rrca
		rrca
		jp	nc, loc_9F

loc_AA:
		ld	a, (4000h)
		rlca
		jp	c, loc_AA
		ld	a, 26h
		ld	(4000h), a

loc_B6:
		ld	a, (4000h)
		rlca
		jp	c, loc_B6
		ld	a, 0C8h
		ld	(4001h), a

loc_C2:
		ld	a, (4000h)
		rlca
		jp	c, loc_C2
		ld	a, 27h
		ld	(4000h), a

loc_CE:
		ld	a, (4000h)
		rlca
		jp	c, loc_CE
		ld	a, 2Ah
		ld	(4001h), a
		ld	hl, (word_13A2)
		ld	de, (word_13A4)
		add	hl, de
		ld	(word_13A6), hl
		ld	ix, 1400h
		ld	b, 9

loc_EB:
		push	bc
		ld	a, b
		ld	(byte_1386), a
		xor	a
		ld	(byte_1387), a
		ld	(byte_1388), a
		ld	a, (ix+0)
		or	a
		jp	z, loc_114
		ld	h, (ix+24h)
		ld	l, (ix+25h)
		ld	(word_13A0), hl
		call	sub_5B0
		ld	a, (ix+0)
		or	a
		jp	z, loc_114
		ld	(byte_1388), a

loc_114:
		ld	bc, 28h
		add	ix, bc
		ld	a, (ix+0)
		or	a
		jp	z, loc_134
		ld	a, (byte_13AE)
		or	a
		jp	nz, loc_134
		dec	a
		ld	(byte_1387), a
		ld	hl, (word_13A6)
		ld	(word_13A0), hl
		call	sub_5B0

loc_134:
		ld	bc, 28h
		add	ix, bc
		pop	bc
		djnz	loc_EB
		ld	a, (byte_13AC)
		or	a
		jp	z, loc_9F
		ld	hl, (word_13AA)
		ld	de, (word_13A8)
		or	a
		sbc	hl, de
		jp	nc, loc_153
		ld	hl, 0

loc_153:
		ld	(word_13AA), hl
		jp	loc_9F
; End of function start

; =============== S U B R O U T I N E =======================================

sub_159:
		ld	hl, byte_1303
		ld	b, (hl)
		inc	b
		ret	z
		ld	(hl), 0FFh
		ld	a, (byte_1300)
		cp	0F0h
		jp	nc, loc_312
		ex	af, af'
		ld	bc, 6000h
		ld	a, 0
		ld	(bc), a
		ld	a, Music_Bank_Offset
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		ex	af, af'
		ld	hl, 8000h

loc_185:
		cp	(hl)
		jp	c, loc_18D
		sub	(hl)
		jp	loc_185
; ---------------------------------------------------------------------------

loc_18D:
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		ld	de, 8003h
		add	hl, de
		ld	d, h
		ld	e, l
		ld	a, (hl)
		inc	hl
		or	(hl)
		inc	hl
		or	(hl)
		ret	z
		ex	de, hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	l, (hl)
		ld	h, a
		ld	a, h
		rlca
		ld	(bc), a
		ld	a, d
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		ld	a, d
		ld	(byte_1389), a
		ld	(word_138A), hl
		set	7, h
		ld	a, (hl)
		inc	hl
		or	a
		jp	z, loc_238
		ld	(byte_138D), a
		ld	ix, byte_1400
		ld	b, 9

loc_1D0:
		ld	a, b
		ld	(byte_1386), a
		bit	7, h
		call	z, LoadBank
		ld	d, (hl)
		inc	hl
		bit	7, h
		call	z, LoadBank
		ld	e, (hl)
		inc	hl
		ld	a, d
		or	e
		jp	z, loc_230
		ld	a, (byte_138D)
		cp	(ix+26h)
		jp	c, loc_230
		exx
		push	ix
		pop	hl
		ld	d, h
		ld	e, l
		inc	de
		ld	bc, 27h
		ld	(hl), 0
		ldir
		call	sub_4F4
		exx
		ld	(ix+0),	0FFh
		ld	a, (byte_138D)
		ld	(ix+26h), a
		push	hl
		ld	hl, (word_138A)
		add	hl, de
		ld	a, (byte_1389)
		adc	a, 0
		ld	(ix+1),	a
		ld	(ix+2),	h
		ld	(ix+3),	l
		pop	hl
		set	0, (ix+20h)
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_230
		ld	(ix+1Bh), 7

loc_230:
		ld	de, 50h
		add	ix, de
		djnz	loc_1D0
		ret
; ---------------------------------------------------------------------------

loc_238:
		ld	ix, byte_1428
		ld	b, 9

loc_23E:
		ld	a, b
		ld	(byte_1386), a
		bit	7, h
		call	z, LoadBank
		ld	d, (hl)
		inc	hl
		bit	7, h
		call	z, LoadBank
		ld	e, (hl)
		inc	hl
		ld	a, d
		or	e
		jp	nz, loc_263
		ld	a, (ix+0)
		or	a
		jp	z, loc_2B4
		ld	(ix+0),	0
		jp	loc_2A2
; ---------------------------------------------------------------------------

loc_263:
		exx
		push	ix
		pop	hl
		ld	d, h
		ld	e, l
		inc	de
		ld	bc, 27h
		ld	(hl), 0
		ldir
		exx
		ld	(ix+0),	0FFh
		push	hl
		ld	hl, (word_138A)
		add	hl, de
		ld	a, (byte_1389)
		adc	a, 0
		ld	(ix+1),	a
		ld	(ix+2),	h
		ld	(ix+3),	l
		pop	hl
		set	0, (ix+20h)
		ld	(ix+27h), 0C0h
		ld	(ix+19h), 7Fh
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_2A2
		ld	(ix+1Bh), 7

loc_2A2:
		exx
		push	ix
		ld	bc, 0FFD8h
		add	ix, bc
		ld	a, (ix+0)
		or	a
		call	z, sub_4F4
		pop	ix
		exx

loc_2B4:
		ld	de, 50h
		add	ix, de
		djnz	loc_23E
		ld	a, (byte_138C)
		xor	7Fh
		ld	(byte_1390), a
		ld	h, 0FFh
		ld	a, (byte_138C)
		add	a, a
		inc	a
		ld	e, a
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_2D1:
		add	hl, hl
		jp	nc, loc_2D6
		add	hl, de

loc_2D6:
		djnz	loc_2D1
		ld	a, h
		ld	(byte_1391), a
		xor	a
		ld	(byte_13AD), a
		ld	(word_13A4), a
		ld	(word_13A4+1), a
		ld	(byte_13AC), a
		ret
; End of function sub_159


; =============== S U B R O U T I N E =======================================


LoadBank:
		exx
		ld	hl, (word_138A)
		ld	de, 8000h
		add	hl, de
		ld	a, (byte_1389)
		adc	a, 0
		ld	l, a
		ld	bc, 6000h
		ld	a, h
		rlca
		ld	(bc), a
		ld	a, l
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		exx
		set	7, h
		ret
; End of function LoadBank

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_159

loc_312:
		and	7
		add	a, a
		ld	bc, off_321
		ld	h, 0
		ld	l, a
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_159
; ---------------------------------------------------------------------------
off_321:	dw sub_331
		dw sub_359
		dw sub_3AE
		dw sub_406
		dw sub_42A
		dw sub_498
		dw sub_4B5
		dw sub_4CC

; =============== S U B R O U T I N E =======================================


sub_331:
		ld	ix, byte_1400
		ld	b, 9

loc_337:
		push	bc
		ld	a, b
		ld	(byte_1386), a
		ld	(ix+0),	0
		ld	(ix+26h), 0
		ld	bc, 28h
		add	ix, bc
		ld	(ix+0),	0
		ld	bc, 28h
		add	ix, bc
		call	sub_4F4
		pop	bc
		djnz	loc_337
		ret
; End of function sub_331


; =============== S U B R O U T I N E =======================================


sub_359:
		ld	ix, byte_1400
		ld	b, 9

loc_35F:
		push	bc
		ld	a, b
		ld	(byte_1386), a
		ld	a, (ix+0)
		ld	(ix+0),	0
		ld	(ix+26h), 0
		ld	bc, 28h
		add	ix, bc
		or	a
		jp	z, loc_3A5
		call	sub_4F4
		ld	a, (ix+0)
		or	a
		jp	z, loc_3A5
		ld	(ix+25h), 0FFh
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_3A5
		ld	h, 0
		ld	l, (ix+26h)
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, byte_1800
		add	hl, bc
		call	sub_C50
		ld	a, (ix+27h)
		call	sub_F08

loc_3A5:
		ld	bc, 28h
		add	ix, bc
		pop	bc
		djnz	loc_35F
		ret
; End of function sub_359


; =============== S U B R O U T I N E =======================================


sub_3AE:
		ld	a, (byte_1302)
		ld	(byte_1386), a
		ld	e, a
		ld	h, 50h
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_3BD:
		add	hl, hl
		jp	nc, loc_3C2
		add	hl, de

loc_3C2:
		djnz	loc_3BD
		ex	de, hl
		ld	ix, byte_1400
		add	ix, de
		ld	a, (ix+0)
		or	a
		ret	z
		ld	(ix+0),	0
		ld	(ix+26h), 0
		call	sub_4F4
		ld	de, 28h
		add	ix, de
		ld	a, (ix+0)
		or	a
		ret	z
		ld	(ix+25h), 0FFh
		ld	a, (byte_1386)
		cp	4
		ret	c
		ld	h, 0
		ld	l, (ix+26h)
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, byte_1800
		add	hl, bc
		call	sub_C50
		ld	a, (ix+27h)
		jp	sub_F08
; End of function sub_3AE


; =============== S U B R O U T I N E =======================================


sub_406:
		ld	ix, byte_1400
		ld	b, 9

loc_40C:
		push	bc
		ld	a, b
		ld	(byte_1386), a
		ld	a, (ix+0)
		ld	bc, 28h
		add	ix, bc
		ld	(ix+0),	0
		ld	bc, 28h
		add	ix, bc
		or	a
		call	z, sub_4F4
		pop	bc
		djnz	loc_40C
		ret
; End of function sub_406


; =============== S U B R O U T I N E =======================================


sub_42A:
		ld	a, 0FFh
		ld	(byte_13AE), a
		ld	ix, byte_1400
		ld	b, 9

loc_435:
		push	bc
		ld	a, b
		ld	(byte_1386), a
		ld	a, (ix+0)
		ld	bc, 28h
		add	ix, bc
		or	a
		jp	nz, loc_48F
		ld	a, (ix+0)
		or	a
		jp	z, loc_48F
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_45B
		call	loc_593
		jp	loc_48F
; ---------------------------------------------------------------------------

loc_45B:
		ld	a, (byte_1386)
		ld	d, 0
		ld	e, a
		ld	hl, byte_8CB
		add	hl, de
		ld	a, (hl)
		add	a, 40h
		ld	c, a
		ld	hl, byte_8D5
		add	hl, de
		ld	d, 0
		ld	e, (hl)
		ld	hl, 4000h
		add	hl, de
		ld	b, 4

loc_476:
		ld	a, (4000h)
		rlca
		jp	c, loc_476
		ld	(hl), c
		inc	hl

loc_47F:
		ld	a, (4000h)
		rlca
		jp	c, loc_47F
		ld	(hl), 7Fh
		dec	hl
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_476

loc_48F:
		ld	bc, 28h
		add	ix, bc
		pop	bc
		djnz	loc_435
		ret
; End of function sub_42A


; =============== S U B R O U T I N E =======================================


sub_498:
		xor	a
		ld	(byte_13AE), a
		ld	ix, byte_1428
		ld	b, 6

loc_4A2:
		ld	a, (ix+0)
		or	a
		jp	z, loc_4AD
		ld	(ix+25h), 0FFh

loc_4AD:
		ld	de, 50h
		add	ix, de
		djnz	loc_4A2
		ret
; End of function sub_498


; =============== S U B R O U T I N E =======================================


sub_4B5:
		ld	a, (byte_1301)
		ld	h, a
		ld	a, (byte_1302)
		ld	l, a
		ld	(word_13A8), hl
		ld	hl, 0FFFFh
		ld	(word_13AA), hl
		ld	a, 0FFh
		ld	(byte_13AC), a
		ret
; End of function sub_4B5


; =============== S U B R O U T I N E =======================================


sub_4CC:
		ld	a, (byte_1302)
		ld	e, a
		ld	h, 69h
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_4D8:
		add	hl, hl
		jp	nc, loc_4DD
		add	hl, de

loc_4DD:
		djnz	loc_4D8
		ld	c, h
		ld	h, 3
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_4E8:
		add	hl, hl
		jp	nc, loc_4ED
		add	hl, de

loc_4ED:
		djnz	loc_4E8
		add	hl, bc
		ld	(word_13A4), hl
		ret
; End of function sub_4CC


; =============== S U B R O U T I N E =======================================


sub_4F4:
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_593
		ld	d, 0
		ld	e, a
		ld	hl, byte_8CB
		add	hl, de
		ld	a, (hl)
		ld	(byte_1382), a
		ld	hl, byte_8D5
		add	hl, de
		ld	d, 0
		ld	e, (hl)
		ld	hl, 4000h
		add	hl, de
		ld	(word_1383), hl
		ld	a, (byte_1382)
		add	a, 40h
		ld	c, a
		ld	b, 4

loc_51D:
		ld	a, (4000h)
		rlca
		jp	c, loc_51D
		ld	(hl), c
		inc	hl

loc_526:
		ld	a, (4000h)
		rlca
		jp	c, loc_526
		ld	(hl), 7Fh
		dec	hl
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_51D
		ld	a, (byte_1382)
		add	a, 0B4h
		ld	c, a

loc_53C:
		ld	a, (4000h)
		rlca
		jp	c, loc_53C
		ld	(hl), c
		inc	hl

loc_545:
		ld	a, (4000h)
		rlca
		jp	c, loc_545
		ld	(hl), 0C0h
		dec	hl
		ld	a, (byte_1382)
		add	a, 80h
		ld	c, a
		ld	b, 4

loc_557:
		ld	a, (4000h)
		rlca
		jp	c, loc_557
		ld	(hl), c
		inc	hl

loc_560:
		ld	a, (4000h)
		rlca
		jp	c, loc_560
		ld	(hl), 0Fh
		dec	hl
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_557
		ld	a, (word_1383)
		rlca
		ld	hl, byte_1382
		or	(hl)
		and	7
		ld	b, a

loc_57B:
		ld	a, (4000h)
		rlca
		jp	c, loc_57B
		ld	a, 28h
		ld	(4000h), a

loc_587:
		ld	a, (4000h)
		rlca
		jp	c, loc_587
		ld	a, b
		ld	(4001h), a
		ret
; ---------------------------------------------------------------------------

loc_593:
		ld	a, (byte_1386)
		ld	d, 0
		ld	e, a
		ld	hl, byte_8DF
		add	hl, de
		ld	a, (hl)
		or	1Fh
		ld	(7F11h), a
		dec	e
		ret	nz
		ld	a, 0E3h
		ld	(7F11h), a
		ld	a, 0FFh
		ld	(7F11h), a
		ret
; End of function sub_4F4

; =============== S U B R O U T I N E =======================================

sub_5B0:
		ld	a, (byte_1386)
		ld	d, 0
		ld	e, a
		cp	4
		jp	c, loc_5D4
		ld	hl, byte_8CB
		add	hl, de
		ld	a, (hl)
		ld	(byte_1382), a
		ld	hl, byte_8D5
		add	hl, de
		ld	d, 0
		ld	e, (hl)
		ld	hl, 4000h
		add	hl, de
		ld	(word_1383), hl
		jp	loc_5DC
; ---------------------------------------------------------------------------

loc_5D4:
		ld	hl, byte_8DF
		add	hl, de
		ld	a, (hl)
		ld	(byte_1385), a

loc_5DC:
		ld	a, (ix+4)
		or	(ix+5)
		jp	z, loc_663
		ld	h, (ix+8)
		ld	l, (ix+9)
		ld	a, h
		or	l
		jp	z, loc_63E
		ld	de, (word_13A0)
		or	a
		sbc	hl, de
		jp	c, loc_5FD
		jp	nz, loc_638

loc_5FD:
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_631
		ld	a, (byte_1388)
		or	a
		jp	nz, loc_635
		ld	a, (word_1383)
		rlca
		ld	hl, byte_1382
		or	(hl)
		and	7
		ld	b, a

loc_617:
		ld	a, (4000h)
		rlca
		jp	c, loc_617
		ld	a, 28h
		ld	(4000h), a

loc_623:
		ld	a, (4000h)
		rlca
		jp	c, loc_623
		ld	a, b
		ld	(4001h), a
		jp	loc_635
; ---------------------------------------------------------------------------

loc_631:
		ld	(ix+1Bh), 3

loc_635:
		ld	hl, 0

loc_638:
		ld	(ix+8),	h
		ld	(ix+9),	l

loc_63E:
		ld	h, (ix+4)
		ld	l, (ix+5)
		ld	de, (word_13A0)
		or	a
		sbc	hl, de
		ld	(ix+4),	h
		ld	(ix+5),	l
		jp	c, loc_663
		jp	z, loc_663
		ld	de, 0C001h
		or	a
		sbc	hl, de
		jp	nc, loc_663
		jp	loc_FEB
; ---------------------------------------------------------------------------

loc_663:
		call	sub_AA3
		ld	b, a
		rrca
		rrca
		rrca
		rrca
		and	0Eh
		ld	e, a
		ld	a, (ix+6)
		and	30h
		res	4, (ix+6)
		or	e
		ld	d, 0
		ld	e, a
		ld	hl, byte_8E3
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	d, (hl)
		ld	e, a
		ld	h, (ix+4)
		ld	l, (ix+5)
		add	hl, de
		ld	(ix+4),	h
		ld	(ix+5),	l
		ld	a, b
		and	1Fh
		ret	z
		dec	a
		ld	b, a
		ld	hl, byte_913
		ld	d, 0
		ld	a, (ix+6)
		and	0Fh
		ld	e, a
		add	hl, de
		ld	a, b
		add	a, (hl)
		add	a, (ix+0Ah)
		ld	b, a
		ld	a, (byte_1387)
		or	a
		ld	a, b
		jp	z, loc_6B4
		ld	hl, byte_13AD
		add	a, (hl)

loc_6B4:
		cp	60h
		jp	c, loc_6BB
		ld	a, 5Fh

loc_6BB:
		ld	h, a
		ld	l, 0
		ld	b, h
		ld	c, l
		ld	(ix+10h), 0
		ld	a, (ix+11h)
		or	a
		jp	z, loc_6F3
		ld	e, a
		ld	d, 0
		ld	a, (ix+0Eh)
		or	a
		jp	z, loc_6F3
		cp	h
		jp	z, loc_6F3
		jp	c, loc_6E3
		ld	hl, 0
		or	a
		sbc	hl, de
		ex	de, hl

loc_6E3:
		ld	(ix+12h), d
		ld	(ix+13h), e
		ld	h, (ix+0Eh)
		ld	l, (ix+0Fh)
		ld	(ix+10h), 0FFh

loc_6F3:
		ld	(ix+0Eh), b
		ld	(ix+0Fh), c
		ld	(ix+0Ch), h
		ld	(ix+0Dh), l
		bit	0, (ix+20h)
		jp	z, loc_712
		ld	a, (ix+20h)
		and	3Fh
		ld	(ix+20h), a
		ld	(ix+22h), 0

loc_712:
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_784
		bit	7, (ix+6)
		jp	nz, loc_749
		ld	(ix+1Bh), 0
		ld	(ix+1Ah), 0
		ld	a, (byte_1388)
		or	a
		jp	nz, loc_887
		ld	a, (byte_1385)
		or	1Fh
		ld	(7F11h), a
		ld	a, (byte_1386)
		dec	a
		jp	nz, loc_749
		ld	a, 0E3h
		ld	(7F11h), a
		ld	a, 0FFh
		ld	(7F11h), a

loc_749:
		ld	a, (byte_1388)
		or	a
		jp	nz, loc_887
		ld	h, 0
		ld	l, (ix+0Ch)
		add	hl, hl
		ld	de, word_9E3
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	d, 0
		ld	e, (ix+0Bh)
		bit	7, (ix+0Bh)
		jp	z, loc_76B
		dec	d

loc_76B:
		add	hl, de
		ld	a, l
		and	0Fh
		ld	b, a
		ld	a, (byte_1385)
		or	b
		ld	(7F11h), a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	a, h
		and	3Fh
		ld	(7F11h), a
		jp	loc_887
; ---------------------------------------------------------------------------

loc_784:
		ld	a, (byte_1388)
		or	a
		jp	nz, loc_887
		ld	b, (ix+18h)
		ld	a, (byte_1387)
		or	a
		jp	z, loc_7A2
		ld	a, (byte_1390)
		add	a, b
		jp	c, loc_79F
		jp	p, loc_7A1

loc_79F:
		ld	a, 7Fh

loc_7A1:
		ld	b, a

loc_7A2:
		ld	(ix+19h), b
		push	ix
		pop	hl
		ld	de, 14h
		add	hl, de
		ex	de, hl
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 40h
		ld	c, a
		ld	b, 4

loc_7B8:
		ld	a, (de)
		or	a
		jp	m, loc_7F2
		add	a, (ix+19h)
		jp	c, loc_7C6
		jp	p, loc_7CB

loc_7C6:
		ld	a, 7Fh
		jp	loc_7F2
; ---------------------------------------------------------------------------

loc_7CB:
		exx
		xor	7Fh
		ld	h, a
		ld	a, (byte_1387)
		or	a
		jp	z, loc_7EE
		ld	a, (byte_13AC)
		or	a
		jp	z, loc_7EE
		ld	a, (word_13AA+1)
		ld	e, a
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_7E7:
		add	hl, hl
		jp	nc, loc_7EC
		add	hl, de

loc_7EC:
		djnz	loc_7E7

loc_7EE:
		ld	a, h
		xor	7Fh
		exx

loc_7F2:
		and	7Fh
		ex	af, af'

loc_7F5:
		ld	a, (4000h)
		rlca
		jp	c, loc_7F5
		ld	(hl), c
		inc	hl

loc_7FE:
		ld	a, (4000h)
		rlca
		jp	c, loc_7FE
		ex	af, af'
		ld	(hl), a
		dec	hl
		inc	de
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_7B8
		ld	h, 0
		ld	l, (ix+0Ch)
		add	hl, hl
		ld	de, word_923
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	d, 0
		ld	e, (ix+0Bh)
		bit	7, (ix+0Bh)
		jp	z, loc_82A
		dec	d

loc_82A:
		add	hl, de
		ex	de, hl
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 0A4h
		ld	b, a

loc_835:
		ld	a, (4000h)
		rlca
		jp	c, loc_835
		ld	(hl), b
		inc	hl

loc_83E:
		ld	a, (4000h)
		rlca
		jp	c, loc_83E
		ld	(hl), d
		dec	hl
		ld	a, b
		sub	4
		ld	b, a

loc_84B:
		ld	a, (4000h)
		rlca
		jp	c, loc_84B
		ld	(hl), b
		inc	hl

loc_854:
		ld	a, (4000h)
		rlca
		jp	c, loc_854
		ld	(hl), e
		bit	7, (ix+6)
		jp	nz, loc_887
		ld	a, (word_1383)
		rlca
		ld	hl, byte_1382
		or	(hl)
		and	7
		or	0F0h
		ld	b, a

loc_870:
		ld	a, (4000h)
		rlca
		jp	c, loc_870
		ld	a, 28h
		ld	(4000h), a

loc_87C:
		ld	a, (4000h)
		rlca
		jp	c, loc_87C
		ld	a, b
		ld	(4001h), a

loc_887:
		ld	a, (ix+6)
		ld	b, a
		and	7Fh
		ld	c, a
		ld	a, b
		and	40h
		rlca
		or	c
		ld	(ix+6),	a
		rlca
		jr	nc, loc_89F
		ld	hl, 0
		jp	loc_8C4
; ---------------------------------------------------------------------------

loc_89F:
		ld	e, (ix+7)
		ld	h, (ix+5)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_8AB:
		add	hl, hl
		jp	nc, loc_8B0
		add	hl, de

loc_8B0:
		djnz	loc_8AB
		ld	c, h
		ld	h, (ix+4)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_8BC:
		add	hl, hl
		jp	nc, loc_8C1
		add	hl, de

loc_8C1:
		djnz	loc_8BC
		add	hl, bc

loc_8C4:
		ld	(ix+8),	h
		ld	(ix+9),	l
		ret
; End of function sub_5B0

; ---------------------------------------------------------------------------
byte_8CB:	db 0
		db 0
		db 0
		db 0
		db 2
		db 1
		db 0
		db 2
		db 1
		db 0
byte_8D5:	db 0
		db 0
		db 0
		db 0
		db 2
		db 2
		db 2
		db 0
		db 0
		db 0
byte_8DF:	db 0
		db 0C0h
		db 0A0h
		db 80h
byte_8E3:	db 0
		db 0
		db 0
		db 3
		db 0
		db 6
		db 0
		db 0Ch
		db 0
		db 18h
		db 0
		db 30h
		db 0
		db 60h
		db 0
		db 0C0h
		db 0
		db 0
		db 0
		db 0
		db 0
		db 9
		db 0
		db 12h
		db 0
		db 24h
		db 0
		db 48h
		db 0
		db 90h
		db 0
		db 0
		db 0
		db 0
		db 0
		db 2
		db 0
		db 4
		db 0
		db 8
		db 0
		db 10h
		db    0
		db 20h
		db    0
		db 40h
		db 0
		db 80h
byte_913:	db 0
		db 0Ch
		db 18h
		db  24h
		db  30h
		db  3Ch
		db  48h
		db  54h
		db  18h
		db  24h
		db  30h
		db  3Ch
		db  48h
		db  54h
		db  60h
		db  6Ch
word_923:	dw 283h
		dw 2AAh
		dw 2D2h
		dw 2FDh
		dw 32Bh
		dw 35Bh
		dw 38Eh
		dw 3C4h
		dw 3FDh
		dw 43Ah
		dw 47Bh
		dw 4BFh
		dw 0A83h
		dw 0AAAh
		dw 0AD2h
		dw 0AFDh
		dw 0B2Bh
		dw 0B5Bh
		dw 0B8Eh
		dw 0BC4h
		dw 0BFDh
		dw 0C3Ah
		dw 0C7Bh
		dw 0CBFh
		dw 1283h
		dw 12AAh
		dw 12D2h
		dw 12FDh
		dw 132Bh
		dw 135Bh
		dw 138Eh
		dw 13C4h
		dw 13FDh
		dw 143Ah
		dw 147Bh
		dw 14BFh
		dw 1A83h
		dw 1AAAh
		dw 1AD2h
		dw 1AFDh
		dw 1B2Bh
		dw 1B5Bh
		dw 1B8Eh
		dw 1BC4h
		dw 1BFDh
		dw 1C3Ah
		dw 1C7Bh
		dw 1CBFh
		dw 2283h
		dw 22AAh
		dw 22D2h
		dw 22FDh
		dw 232Bh
		dw 235Bh
		dw 238Eh
		dw 23C4h
		dw 23FDh
		dw 243Ah
		dw 247Bh
		dw 24BFh
		dw 2A83h
		dw 2AAAh
		dw 2AD2h
		dw 2AFDh
		dw 2B2Bh
		dw 2B5Bh
		dw 2B8Eh
		dw 2BC4h
		dw 2BFDh
		dw 2C3Ah
		dw 2C7Bh
		dw 2CBFh
		dw 3283h
		dw 32AAh
		dw 32D2h
		dw 32FDh
		dw 332Bh
		dw 335Bh
		dw 338Eh
		dw 33C4h
		dw 33FDh
		dw 343Ah
		dw 347Bh
		dw 34BFh
		dw 3A83h
		dw 3AAAh
		dw 3AD2h
		dw 3AFDh
		dw 3B2Bh
		dw 3B5Bh
		dw 3B8Eh
		dw 3BC4h
		dw 3BFDh
		dw 3C3Ah
		dw 3C7Bh
		dw 3CBFh
word_9E3:	dw 1ACh
		dw 194h
		dw 17Dh
		dw 168h
		dw 153h
		dw 140h
		dw 12Eh
		dw 11Dh
		dw 10Dh
		dw 0FEh
		dw 0F0h
		dw 0E2h
		dw 0D6h
		dw 0CAh
		dw 0BEh
		dw 0B4h
		dw 0AAh
		dw 0A0h
		dw 97h
		dw 8Fh
		dw 87h
		dw 7Fh
		dw 78h
		dw 71h
		dw 6Bh
		dw 65h
		dw 5Fh
		dw 5Ah
		dw 55h
		dw 50h
		dw 4Ch
		dw 47h
		dw 43h
		dw 40h
		dw 3Ch
		dw 39h
		dw 357h
		dw 327h
		dw 2FAh
		dw 2CFh
		dw 2A7h
		dw 281h
		dw 25Dh
		dw 23Bh
		dw 21Bh
		dw 1FCh
		dw 1E0h
		dw 1C5h
		dw 1ACh
		dw 194h
		dw 17Dh
		dw 168h
		dw 153h
		dw 140h
		dw 12Eh
		dw 11Dh
		dw 10Dh
		dw 0FEh
		dw 0F0h
		dw 0E2h
		dw 0D6h
		dw 0CAh
		dw 0BEh
		dw 0B4h
		dw 0AAh
		dw 0A0h
		dw 97h
		dw 8Fh
		dw 87h
		dw 7Fh
		dw 78h
		dw 71h
		dw 6Bh
		dw 65h
		dw 5Fh
		dw 5Ah
		dw 55h
		dw 50h
		dw 4Ch
		dw 47h
		dw 43h
		dw 40h
		dw 3Ch
		dw 39h
		dw 36h
		dw 33h
		dw 30h
		dw 2Dh
		dw 2Bh
		dw 28h
		dw 26h
		dw 24h
		dw 22h
		dw 20h
		dw 1Eh
		dw 1Dh

; =============== S U B R O U T I N E =======================================


sub_AA3:
		ld	bc, 6000h
		ld	d, (ix+2)
		ld	e, (ix+3)
		ld	a, d
		rlca
		ld	(bc), a
		ld	a, (ix+1)
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		set	7, d
		ld	a, (de)
		inc	de
		cp	20h
		call	c, sub_AEE
		bit	7, d
		jp	nz, loc_ADF
		ld	h, (ix+1)
		ld	l, (ix+2)
		ld	bc, 80h
		add	hl, bc
		ld	(ix+1),	h
		ld	(ix+2),	l

loc_ADF:
		rl	d
		rl	(ix+2)
		rr	d
		ld	(ix+2),	d
		ld	(ix+3),	e
		ret
; End of function sub_AA3


; =============== S U B R O U T I N E =======================================


sub_AEE:
		add	a, a
		ld	bc, off_AFB
		ld	h, 0
		ld	l, a
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; End of function sub_AEE

; ---------------------------------------------------------------------------
off_AFB:	dw loc_B3C		; 0
		dw loc_B51		; 1
		dw loc_B66		; 2
		dw loc_B77		; 3
		dw loc_B8C		; 4
		dw loc_BAA		; 5
		dw loc_BDA		; 6
		dw loc_BF1		; 7
		dw loc_C15		; 8
		dw loc_D48		; 9
		dw loc_D66		; 0Ah
		dw loc_D7D		; 0Bh
		dw loc_D94		; 0Ch
		dw loc_DAB		; 0Dh
		dw loc_DC3		; 0Eh
		dw loc_DC9		; 0Fh
		dw loc_DCF		; 10h
		dw loc_DD5		; 11h
		dw loc_DF6		; 12h
		dw loc_DFC		; 13h
		dw loc_E02		; 14h
		dw loc_E08		; 15h
		dw loc_E37		; 16h
		dw loc_E86		; 17h
		dw loc_ED6		; 18h
		dw locret_B3B		; 19h
		dw loc_F24		; 1Ah
		dw loc_F74		; 1Bh
		dw locret_B3B		; 1Ch
		dw loc_F8B		; 1Dh
		dw loc_FA2		; 1Eh
		dw locret_B3B		; 1Fh
; ---------------------------------------------------------------------------

locret_B3B:
		ret
; ---------------------------------------------------------------------------

loc_B3C:
		ld	a, 20h
		xor	(ix+6)
		ld	(ix+6),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_B51:
		ld	a, 40h
		xor	(ix+6)
		ld	(ix+6),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_B66:
		set	4, (ix+6)
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_B77:
		ld	a, 8
		xor	(ix+6)
		ld	(ix+6),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_B8C:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (ix+6)
		and	97h
		or	b
		ld	(ix+6),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_BAA:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	h, a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	l, a
		ld	a, (byte_1387)
		or	a
		jp	nz, loc_BCA
		ld	(ix+24h), h
		ld	(ix+25h), l
		jp	loc_BCD
; ---------------------------------------------------------------------------

loc_BCA:
		ld	(word_13A2), hl

loc_BCD:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_BDA:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(ix+7),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_BF1:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_C05
		ld	a, b
		xor	7Fh
		ld	b, a

loc_C05:
		ld	(ix+18h), b
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_C15:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		ld	b, a
		inc	de
		ld	a, (byte_1387)
		or	a
		jp	z, loc_C27
		ld	(ix+26h), b

loc_C27:
		ld	h, 0
		ld	l, b
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, byte_1800
		add	hl, bc
		call	sub_C43
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret

; =============== S U B R O U T I N E =======================================


sub_C43:

; FUNCTION CHUNK AT 0CFD SIZE 0000002B BYTES

		ld	a, (byte_1386)
		cp	4
		jp	c, loc_CFD
		ld	a, (byte_1388)
		or	a
		ret	nz
; End of function sub_C43


; =============== S U B R O U T I N E =======================================


sub_C50:
		push	de
		push	hl
		ex	de, hl
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 30h
		ld	c, a
		ld	b, 14h

loc_C5E:
		ld	a, b
		cp	10h
		jp	nz, loc_C81

loc_C64:
		ld	a, (4000h)
		rlca
		jp	c, loc_C64
		ld	(hl), c
		inc	hl

loc_C6D:
		ld	a, (4000h)
		rlca
		jp	c, loc_C6D
		ld	(hl), 7Fh
		dec	hl
		inc	de
		ld	a, c
		add	a, 4
		ld	c, a
		and	10h
		jp	z, loc_C64

loc_C81:
		ld	a, (4000h)
		rlca
		jp	c, loc_C81
		ld	(hl), c
		inc	hl

loc_C8A:
		ld	a, (4000h)
		rlca
		jp	c, loc_C8A
		ld	a, (de)
		ld	(hl), a
		dec	hl
		inc	de
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_C5E
		add	a, 20h
		ld	c, a

loc_C9E:
		ld	a, (4000h)
		rlca
		jp	c, loc_C9E
		ld	(hl), c
		inc	hl

loc_CA7:
		ld	a, (4000h)
		rlca
		jp	c, loc_CA7
		ld	a, (de)
		ld	(hl), a
		and	7
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		ld	de, byte_CDD
		add	hl, de
		ex	de, hl
		pop	hl
		ld	bc, 4
		add	hl, bc
		ld	a, (de)
		or	(hl)
		ld	(ix+14h), a
		inc	de
		inc	hl
		ld	a, (de)
		or	(hl)
		ld	(ix+15h), a
		inc	de
		inc	hl
		ld	a, (de)
		or	(hl)
		ld	(ix+16h), a
		inc	de
		inc	hl
		ld	a, (de)
		or	(hl)
		ld	(ix+17h), a
		pop	de
		ret
; End of function sub_C50

; ---------------------------------------------------------------------------
byte_CDD:	db 80h
		db 80h
		db 80h
		db 0
		db 80h
		db 80h
		db 80h
		db 0
		db 80h
		db 80h
		db  80h
		db    0
		db  80h
		db 80h
		db 80h
		db 0
		db 80h
		db 80h
		db 0
		db 0
		db 80h
		db 0
		db    0
		db    0
		db  80h
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_C43

loc_CFD:
		push	hl
		pop	iy
		ld	bc, byte_D28
		ld	h, 0
		ld	l, (iy+1Ch)
		add	hl, bc
		ld	a, (hl)
		ld	(ix+14h), a
		ld	h, 0
		ld	l, (iy+1Dh)
		add	hl, bc
		ld	a, (hl)
		ld	(ix+15h), a
		ld	a, (iy+1Eh)
		ld	(ix+16h), a
		ld	h, 0
		ld	l, (iy+1Fh)
		add	hl, bc
		ld	a, (hl)
		ld	(ix+17h), a
		ret
; END OF FUNCTION CHUNK	FOR sub_C43
; ---------------------------------------------------------------------------
byte_D28:	db 0
		db    1
		db    2
		db    3
		db    4
		db    5
		db    6
		db    7
		db    8
		db    9
		db  0Ah
		db  0Bh
		db  0Ch
		db  0Eh
		db  0Fh
		db  10h
		db  12h
		db  13h
		db  14h
		db  16h
		db  18h
		db  1Bh
		db  1Eh
		db  23h
		db  28h
		db  30h
		db  3Ch
		db  50h
		db  7Eh
		db  7Fh
		db 0FEh
		db 0FFh
; ---------------------------------------------------------------------------

loc_D48:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (ix+6)
		and	0F8h
		or	b
		ld	(ix+6),	a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_D66:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(byte_13AD), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_D7D:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(ix+0Ah), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_D94:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(ix+0Bh), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_DAB:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		add	a, a
		ld	(ix+11h), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_DC3:
		ld	bc, 1Ch
		jp	loc_DD8
; ---------------------------------------------------------------------------

loc_DC9:
		ld	bc, 1Dh
		jp	loc_DD8
; ---------------------------------------------------------------------------

loc_DCF:
		ld	bc, 1Eh
		jp	loc_DD8
; ---------------------------------------------------------------------------

loc_DD5:
		ld	bc, 1Fh

loc_DD8:
		push	ix
		pop	hl
		add	hl, bc
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (hl)
		or	a
		jp	nz, loc_DED
		ld	(hl), b
		jp	loc_E37
; ---------------------------------------------------------------------------

loc_DED:
		dec	(hl)
		jp	nz, loc_E37
		inc	de
		inc	de
		jp	loc_E17
; ---------------------------------------------------------------------------

loc_DF6:
		ld	bc, 1Ch
		jp	loc_E0B
; ---------------------------------------------------------------------------

loc_DFC:
		ld	bc, 1Dh
		jp	loc_E0B
; ---------------------------------------------------------------------------

loc_E02:
		ld	bc, 1Eh
		jp	loc_E0B
; ---------------------------------------------------------------------------

loc_E08:
		ld	bc, 1Fh

loc_E0B:
		push	ix
		pop	hl
		add	hl, bc
		ld	a, (hl)
		dec	a
		jp	z, loc_E24
		inc	de
		inc	de
		inc	de

loc_E17:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_E24:
		ld	(hl), 0
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (ix+6)
		and	97h
		or	b
		ld	(ix+6),	a

loc_E37:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	h, a
		ld	c, a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	l, a
		add	hl, de
		ex	de, hl
		bit	7, d
		jp	nz, loc_E7E
		ld	b, 0FFh
		bit	7, c
		jp	nz, loc_E57
		inc	b

loc_E57:
		ld	c, 80h
		ld	h, (ix+1)
		ld	l, (ix+2)
		add	hl, bc
		ld	(ix+1),	h
		ld	(ix+2),	l
		ld	bc, 6000h
		ld	a, l
		rlca
		ld	(bc), a
		ld	a, h
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		set	7, d

loc_E7E:
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_E86:
		pop	hl
		pop	hl
		ld	(ix+0),	0
		ld	a, (byte_1387)
		or	a
		jp	nz, loc_ECE
		ld	(ix+26h), 0
		call	sub_4F4
		push	ix
		ld	bc, 28h
		add	ix, bc
		ld	a, (ix+0)
		or	a
		jp	z, loc_ECB
		ld	(ix+25h), 0FFh
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_ECB
		ld	h, 0
		ld	l, (ix+26h)
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, byte_1800
		add	hl, bc
		call	sub_C50
		ld	a, (ix+27h)
		call	sub_F08

loc_ECB:
		pop	ix
		ret
; ---------------------------------------------------------------------------

loc_ECE:
		ld	a, (byte_1388)
		or	a
		ret	nz
		jp	sub_4F4
; ---------------------------------------------------------------------------

loc_ED6:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (byte_1386)
		cp	4
		jp	c, loc_EFB
		ld	a, (byte_1387)
		or	a
		jp	z, loc_EF7
		ld	(ix+27h), b
		ld	a, (byte_1388)
		or	a
		jp	nz, loc_EFB

loc_EF7:
		ld	a, b
		call	sub_F08

loc_EFB:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret

; =============== S U B R O U T I N E =======================================


sub_F08:
		ld	c, a
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 0B4h
		ld	b, a

loc_F12:
		ld	a, (4000h)
		rlca
		jp	c, loc_F12
		ld	(hl), b
		inc	hl

loc_F1B:
		ld	a, (4000h)
		rlca
		jp	c, loc_F1B
		ld	(hl), c
		ret
; End of function sub_F08

; ---------------------------------------------------------------------------

loc_F24:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (byte_1387)
		or	a
		jp	z, loc_F67
		ld	a, b
		xor	7Fh
		ld	c, a
		ld	a, (byte_138C)
		xor	7Fh
		add	a, c
		jp	c, loc_F43
		jp	p, loc_F45

loc_F43:
		ld	a, 7Fh

loc_F45:
		ld	(byte_1390), a
		ld	a, b
		exx
		and	7Fh
		add	a, a
		inc	a
		ld	h, a
		ld	a, (byte_138C)
		add	a, a
		inc	a
		ld	e, a
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_F5B:
		add	hl, hl
		jp	nc, loc_F60
		add	hl, de

loc_F60:
		djnz	loc_F5B
		ld	a, h
		ld	(byte_1391), a
		exx

loc_F67:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_F74:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(ix+23h), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_F8B:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		ld	(ix+21h), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret
; ---------------------------------------------------------------------------

loc_FA2:
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		res	0, (ix+20h)
		or	(ix+20h)
		ld	(ix+20h), a
		bit	7, d
		call	z, LoadBank2
		ld	a, (de)
		inc	de
		cp	20h
		jp	c, sub_AEE
		ret

; =============== S U B R O U T I N E =======================================


LoadBank2:
		exx
		ld	h, (ix+1)
		ld	l, (ix+2)
		ld	bc, 80h
		add	hl, bc
		ld	(ix+1),	h
		ld	(ix+2),	l
		ld	bc, 6000h
		ld	a, l
		rlca
		ld	(bc), a
		ld	a, h
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		rrca
		ld	(bc), a
		exx
		set	7, d
		ret
; End of function LoadBank2

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_5B0

loc_FEB:
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_1066
		ld	a, (ix+1Bh)
		and	7
		add	a, a
		ld	bc, off_1005
		ld	h, 0
		ld	l, a
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_5B0
; ---------------------------------------------------------------------------
off_1005:	dw loc_1016
		dw loc_1029
		dw loc_1066
		dw loc_104D
		dw locret_1015
		dw locret_1015
		dw locret_1015
		dw locret_1015
; ---------------------------------------------------------------------------

locret_1015:
		ret
; ---------------------------------------------------------------------------

loc_1016:
		ld	a, (ix+14h)
		add	a, (ix+1Ah)
		ld	(ix+1Ah), a
		jp	nc, loc_1066
		ld	(ix+1Ah), 0FFh
		jp	loc_1063
; ---------------------------------------------------------------------------

loc_1029:
		ld	a, (ix+15h)
		or	a
		jp	z, loc_1044
		ld	b, a
		ld	a, (ix+1Ah)
		sub	b
		jp	c, loc_1044
		cp	(ix+16h)
		jp	c, loc_1044
		ld	(ix+1Ah), a
		jp	loc_1066
; ---------------------------------------------------------------------------

loc_1044:
		ld	a, (ix+16h)
		ld	(ix+1Ah), a
		jp	loc_1063
; ---------------------------------------------------------------------------

loc_104D:
		ld	a, (ix+17h)
		or	a
		jp	z, loc_1066
		ld	b, a
		ld	a, (ix+1Ah)
		sub	b
		ld	(ix+1Ah), a
		jp	nc, loc_1066
		ld	(ix+1Ah), 0

loc_1063:
		inc	(ix+1Bh)
; START	OF FUNCTION CHUNK FOR sub_5B0

loc_1066:
		ld	a, (ix+21h)
		add	a, (ix+22h)
		ld	(ix+22h), a
		jp	nc, loc_107A
		ld	a, 40h
		add	a, (ix+20h)
		ld	(ix+20h), a

loc_107A:
		ld	a, (ix+10h)
		or	a
		jp	z, loc_10BF
		dec	a
		jp	nz, loc_108C
		ld	(ix+10h), 0
		jp	loc_10BF
; ---------------------------------------------------------------------------

loc_108C:
		ld	b, (ix+12h)
		ld	c, (ix+13h)
		ld	h, (ix+0Ch)
		ld	l, (ix+0Dh)
		ld	d, (ix+0Eh)
		ld	e, (ix+0Fh)
		add	hl, bc
		xor	a
		bit	7, b
		jp	z, loc_10A6
		dec	a

loc_10A6:
		ld	b, h
		ld	c, l
		or	a
		sbc	hl, de
		jr	z, loc_10B4
		ld	h, b
		ld	l, c
		adc	a, 0
		jp	nz, loc_10B9

loc_10B4:
		ex	de, hl
		ld	(ix+10h), 1

loc_10B9:
		ld	(ix+0Ch), h
		ld	(ix+0Dh), l

loc_10BF:
		ld	a, (byte_1388)
		or	a
		ret	nz
		ld	a, (byte_1386)
		cp	4
		jp	nc, loc_11BF
		ld	a, (ix+22h)
		or	(ix+23h)
		jp	z, loc_1113
		ld	a, (ix+22h)
		bit	6, (ix+20h)
		jp	z, loc_10E0
		cpl

loc_10E0:
		ld	h, a
		ld	e, (ix+23h)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_10EA:
		add	hl, hl
		jp	nc, loc_10EF
		add	hl, de

loc_10EF:
		djnz	loc_10EA
		ld	e, 30h
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_10F9:
		add	hl, hl
		jp	nc, loc_10FE
		add	hl, de

loc_10FE:
		djnz	loc_10F9
		ld	c, h
		bit	7, (ix+20h)
		jp	z, loc_1126
		ld	hl, 0
		or	a
		sbc	hl, bc
		ld	b, h
		ld	c, l
		jp	loc_1126
; ---------------------------------------------------------------------------

loc_1113:
		ld	a, (byte_1387)
		or	a
		jp	z, loc_111D
		ld	a, (ix+25h)

loc_111D:
		or	(ix+10h)
		jp	z, loc_1158
		ld	bc, 0

loc_1126:
		ld	h, 0
		ld	l, (ix+0Ch)
		add	hl, hl
		ld	de, word_9E3
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	d, 0
		ld	e, (ix+0Bh)
		bit	7, (ix+0Bh)
		jp	z, loc_1141
		dec	d

loc_1141:
		add	hl, de
		add	hl, bc
		ld	a, l
		and	0Fh
		ld	b, a
		ld	a, (byte_1385)
		or	b
		ld	(7F11h), a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	a, h
		and	3Fh
		ld	(7F11h), a

loc_1158:
		ld	a, (byte_1391)
		ld	h, a
		ld	e, (ix+1Ah)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_1165:
		add	hl, hl
		jp	nc, loc_116A
		add	hl, de

loc_116A:
		djnz	loc_1165
		ld	e, (ix+18h)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_1175:
		add	hl, hl
		jp	nc, loc_117A
		add	hl, de

loc_117A:
		djnz	loc_1175
		ld	a, (byte_1387)
		or	a
		jp	z, loc_119F
		ld	(ix+25h), 0
		ld	a, (byte_13AC)
		or	a
		jp	z, loc_119F
		ld	a, (word_13AA+1)
		ld	e, a
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_1198:
		add	hl, hl
		jp	nc, loc_119D
		add	hl, de

loc_119D:
		djnz	loc_1198

loc_119F:
		ld	a, h
		xor	0Fh
		ld	hl, byte_1385
		or	(hl)
		or	10h
		ld	b, a
		ld	a, (byte_1386)
		dec	a
		jp	nz, loc_11BA
		ld	a, (ix+0Ch)
		cp	24h
		jp	nc, loc_11BA
		set	5, b

loc_11BA:
		ld	a, b
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_11BF:
		ld	a, (ix+22h)
		or	(ix+23h)
		jp	z, loc_1206
		ld	a, (ix+22h)
		bit	6, (ix+20h)
		jp	z, loc_11D3
		cpl

loc_11D3:
		ld	h, a
		ld	e, (ix+23h)
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_11DD:
		add	hl, hl
		jp	nc, loc_11E2
		add	hl, de

loc_11E2:
		djnz	loc_11DD
		ld	e, 0C0h
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_11EC:
		add	hl, hl
		jp	nc, loc_11F1
		add	hl, de

loc_11F1:
		djnz	loc_11EC
		ld	c, h
		bit	7, (ix+20h)
		jp	z, loc_1219
		ld	hl, 0
		or	a
		sbc	hl, bc
		ld	b, h
		ld	c, l
		jp	loc_1219
; ---------------------------------------------------------------------------

loc_1206:
		ld	a, (byte_1387)
		or	a
		jp	z, loc_1210
		ld	a, (ix+25h)

loc_1210:
		or	(ix+10h)
		jp	z, loc_1267
		ld	bc, 0

loc_1219:
		ld	h, 0
		ld	l, (ix+0Ch)
		add	hl, hl
		ld	de, word_923
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	d, 0
		ld	e, (ix+0Bh)
		bit	7, (ix+0Bh)
		jp	z, loc_1234
		dec	d

loc_1234:
		add	hl, de
		add	hl, bc
		ex	de, hl
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 0A4h
		ld	b, a

loc_1240:
		ld	a, (4000h)
		rlca
		jp	c, loc_1240
		ld	(hl), b
		inc	hl

loc_1249:
		ld	a, (4000h)
		rlca
		jp	c, loc_1249
		ld	(hl), d
		dec	hl
		ld	a, b
		sub	4
		ld	b, a

loc_1256:
		ld	a, (4000h)
		rlca
		jp	c, loc_1256
		ld	(hl), b
		inc	hl

loc_125F:
		ld	a, (4000h)
		rlca
		jp	c, loc_125F
		ld	(hl), e

loc_1267:
		ld	a, (byte_1387)
		or	a
		ret	z
		ld	a, (byte_13AC)
		or	(ix+25h)
		ret	z
		ld	(ix+25h), 0
		push	ix
		pop	hl
		ld	de, 14h
		add	hl, de
		ex	de, hl
		ld	hl, (word_1383)
		ld	a, (byte_1382)
		add	a, 40h
		ld	c, a
		ld	b, 4

loc_128A:
		ld	a, (de)
		or	a
		jp	m, loc_12BD
		add	a, (ix+19h)
		jp	c, loc_1298
		jp	p, loc_129D

loc_1298:
		ld	a, 7Fh
		jp	loc_12BD
; ---------------------------------------------------------------------------

loc_129D:
		exx
		xor	7Fh
		ld	h, a
		ld	a, (byte_13AC)
		or	a
		jp	z, loc_12B9
		ld	a, (word_13AA+1)
		ld	e, a
		ld	l, 0
		ld	d, 0
		ld	b, 8

loc_12B2:
		add	hl, hl
		jp	nc, loc_12B7
		add	hl, de

loc_12B7:
		djnz	loc_12B2

loc_12B9:
		ld	a, h
		xor	7Fh
		exx

loc_12BD:
		and	7Fh
		ex	af, af'

loc_12C0:
		ld	a, (4000h)
		rlca
		jp	c, loc_12C0
		ld	(hl), c
		inc	hl

loc_12C9:
		ld	a, (4000h)
		rlca
		jp	c, loc_12C9
		ex	af, af'
		ld	(hl), a
		dec	hl
		inc	de
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_128A
		ret
; END OF FUNCTION CHUNK	FOR sub_5B0
; ---------------------------------------------------------------------------
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1300:	ds 1
byte_1301:	ds 1
byte_1302:	ds 1
byte_1303:	ds 1
byte_1304:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1380:	ds 1
byte_1381:	ds 1
byte_1382:	ds 1
word_1383:	ds 2
byte_1385:	ds 1
byte_1386:	ds 1
byte_1387:	ds 1
byte_1388:	ds 1
byte_1389:	ds 1
word_138A:	ds 2
byte_138C:	ds 1
byte_138D:	ds 1
		ds 1
		ds 1
byte_1390:	ds 1
byte_1391:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_13A0:	ds 2
word_13A2:	ds 2
word_13A4:	ds 2
word_13A6:	ds 2
word_13A8:	ds 2
word_13AA:	ds 2
byte_13AC:	ds 1
byte_13AD:	ds 1
byte_13AE:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1400:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1428:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_17FF:	ds 1
byte_1800:

; =============== S U B R O U T I N E =======================================

		binclude "Z80 Driver/Data/Instruments.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
