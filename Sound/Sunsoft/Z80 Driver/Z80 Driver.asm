; ---------------------------------------------------------------------------
; Sunsoft Z80 Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($2A8000>>15)

; =============== S U B R O U T I N E =======================================

start:
		!org	0
		CPU Z80
		listing on
		di
		jp	loc_41
; End of function start
; ---------------------------------------------------------------------------
		align 38h

; =============== S U B R O U T I N E =======================================

;zsub_38
zVInt:
		di
		push	af
		call	sub_2A4
		pop	af
		ei
		reti

; =============== S U B R O U T I N E =======================================

loc_41:
		di
		im	1
		ld	sp, byte_1D00
		ld	hl, byte_FE8
		ld	de, byte_FE9
		ld	bc, byte_1017
		xor	a
		ld	(hl), a
		ldir

; Load Bank
		ld	b, 7
		ld	a, Music_Bank_Offset
		ld	hl, 6000h

-		ld	(hl), a
		rrca
		djnz	-
		ld	(hl), a
		xor	a
		ld	(hl), a
		nop
		ld	b, 0Fh
		ld	c, 80h
		ld	a, 0FFh

loc_69:
		call	sub_D22
		call	sub_D2C
		inc	c
		djnz	loc_69
		ld	hl, word_D5D

loc_75:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jr	z, loc_83
		ld	c, a
		ld	a, (hl)
		inc	hl
		call	sub_D22
		jr	loc_75
; ---------------------------------------------------------------------------

loc_83:
		ld	hl, word_D7A

loc_86:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jr	z, loc_94
		ld	c, a
		ld	a, (hl)
		inc	hl
		call	sub_D2C
		jr	loc_86
; ---------------------------------------------------------------------------

loc_94:
		ld	hl, 7F11h
		ld	de, PSGSilence
		ld	a, (de)
		inc	de
		ld	b, a

loc_9D:
		ld	a, (de)
		inc	de
		ld	(hl), a
		djnz	loc_9D
		ei

loc_A3:
		jp	$
; End of function start
; ---------------------------------------------------------------------------

loc_A6:
		ld	hl, byte_FF7
		ld	b, 6
		xor	a

loc_AC:
		ld	(hl), a
		inc	hl
		djnz	loc_AC
		ld	b, 0Ah
		ld	hl, byte_101C
		ld	de, 30h

loc_B8:
		ld	(hl), a
		add	hl, de
		djnz	loc_B8
		ld	hl, byte_11DD
		xor	a
		ld	(hl), a
		inc	hl
		ld	(hl), a
		inc	hl
		ld	(hl), a
		inc	hl
		ld	(hl), a
		ld	b, 8
		ld	hl, byte_1200
		ld	de, 28h

loc_CF:
		ld	(hl), a
		add	hl, de
		djnz	loc_CF
		xor	a
		ld	(byte_FF3), a
		ld	(byte_FF4), a
		ld	(byte_FF5), a
		pop	hl
		pop	bc
		ret

; =============== S U B R O U T I N E =======================================

sub_E0:
		push	bc
		push	hl
		ld	b, a
		inc	a
		jp	z, loc_41
		inc	a
		jp	z, loc_A6
		inc	a
		jp	z, loc_21A
		inc	a
		jp	z, loc_256
		inc	a
		jp	z, loc_29C
		xor	a
		ld	(byte_FED), a
		ld	a, 0C0h
		ld	(byte_FEE), a
		ld	a, b
		ld	de, 8000h
		call	sub_10A
		pop	hl
		pop	bc
		ret
; End of function sub_E0

; =============== S U B R O U T I N E =======================================

sub_10A:
		dec	a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)

loc_113:
		ld	a, (de)
		or	a
		ret	m
		inc	de
		cp	0Ah
		jp	nc, loc_1A4
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	c, l
		ld	b, h
		ld	iy, byte_FFD
		add	iy, bc
		ld	a, (de)
		inc	de
		ld	c, (iy+1Fh)
		cp	c
		jr	c, loc_19E
		ld	(iy+1Fh), a
		ld	a, (de)
		inc	de
		cp	(iy+3)
		jr	z, loc_14E
		bit	7, c
		jr	z, loc_14E
		ld	l, a
		ld	h, 0
		ld	bc, byte_FF7
		add	hl, bc
		set	6, (hl)

loc_14E:
		ld	(iy+3),	a
		ld	a, (de)
		inc	de
		ld	(iy+1),	a
		ld	a, (de)
		inc	de
		ld	(iy+2),	a
		xor	a
		ld	(iy+0),	a
		ld	(iy+5),	a
		ld	(iy+7),	a
		ld	(iy+8),	a
		ld	(iy+9),	a
		ld	(iy+0Ah), a
		ld	(iy+0Bh), a
		ld	(iy+0Ch), a
		ld	(iy+0Fh), a
		ld	(iy+19h), a
		ld	(iy+14h), 7Fh
		ld	(iy+25h), a
		ld	(iy+26h), a
		ld	(iy+2Ah), a
		ld	(iy+4),	1
		ld	(iy+24h), 80h
		ld	a, (byte_FED)
		ld	(iy+1Eh), a
		ld	a, (byte_FEE)
		ld	(iy+29h), a
		jp	loc_113
; ---------------------------------------------------------------------------

loc_19E:
		inc	de
		inc	de
		inc	de
		jp	loc_113
; ---------------------------------------------------------------------------

loc_1A4:
		sub	0Ah
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, hl
		add	hl, bc
		ld	c, l
		ld	b, h
		ld	iy, byte_11E1
		add	iy, bc
		ld	a, (de)
		inc	de
		cp	(iy+1Fh)
		jr	c, loc_214
		ld	(iy+1Fh), a
		ld	a, (de)
		inc	de
		cp	(iy+3)
		jr	z, loc_1D3
		ld	l, a
		ld	h, 0
		ld	bc, byte_11DD
		add	hl, bc
		set	6, (hl)

loc_1D3:
		ld	(iy+3),	a
		ld	a, (de)
		inc	de
		ld	(iy+1),	a
		ld	a, (de)
		inc	de
		ld	(iy+2),	a
		xor	a
		ld	(iy+0),	a
		ld	(iy+5),	a
		ld	(iy+7),	a
		ld	(iy+8),	a
		ld	(iy+9),	a
		ld	(iy+0Ah), a
		ld	(iy+0Bh), a
		ld	(iy+0Ch), a
		ld	(iy+0Fh), a
		ld	(iy+19h), a
		ld	(iy+14h), 0Fh
		ld	(iy+4),	1
		ld	(iy+24h), 80h
		ld	a, (byte_FED)
		ld	(iy+1Eh), a
		jp	loc_113
; ---------------------------------------------------------------------------

loc_214:
		inc	de
		inc	de
		inc	de
		jp	loc_113
; End of function sub_10A

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_E0

loc_21A:
		ld	b, 0Ah
		ld	iy, byte_FFD
		ld	hl, byte_101C
		ld	de, 30h

loc_226:
		bit	7, (iy+1Fh)
		jr	z, loc_234
		set	0, (iy+0)
		res	7, (iy+1Fh)

loc_234:
		add	iy, de
		djnz	loc_226
		ld	b, 8
		ld	iy, byte_11E1
		ld	de, 28h

loc_241:
		bit	7, (iy+1Fh)
		jr	z, loc_24F
		set	0, (iy+0)
		res	7, (iy+1Fh)

loc_24F:
		add	iy, de
		djnz	loc_241
		pop	hl
		pop	bc
		ret
; ---------------------------------------------------------------------------

loc_256:
		ld	b, 0Ah
		ld	iy, byte_FFD
		ld	hl, byte_101C
		ld	de, 30h

loc_262:
		bit	0, (iy+0)
		jr	z, loc_276
		ld	a, (iy+0)
		or	0Ch
		and	0FEh
		ld	(iy+0),	a
		set	7, (iy+1Fh)

loc_276:
		add	iy, de
		djnz	loc_262
		ld	b, 8
		ld	iy, byte_11E1
		ld	de, 28h

loc_283:
		bit	0, (iy+0)
		jr	z, loc_295
		res	0, (iy+0)
		set	6, (iy+0)
		set	7, (iy+1Fh)

loc_295:
		add	iy, de
		djnz	loc_283
		pop	hl
		pop	bc
		ret
; ---------------------------------------------------------------------------

loc_29C:
		ld	a, 3
		ld	(byte_FF3), a
		pop	hl
		pop	bc
		ret

; =============== S U B R O U T I N E =======================================

sub_2A4:
		ld	hl, zMusicIndex
		ld	b, 4

loc_2A9:
		ld	a, (hl)
		or	a
		call	nz, sub_E0
		xor	a
		ld	(hl), a
		inc	hl
		djnz	loc_2A9
		ld	a, (byte_FF3)
		or	a
		jr	z, loc_2D9
		dec	a
		ld	(byte_FF3), a
		jr	nz, loc_2D9
		ld	a, 3
		ld	(byte_FF3), a
		ld	a, (byte_FF4)
		inc	a
		cp	80h
		jr	c, loc_2CE
		ld	a, 7Fh

loc_2CE:
		ld	(byte_FF4), a
		and	78h
		rra
		rra
		rra
		ld	(byte_FF5), a

loc_2D9:
		ld	a, 0Ah
		ld	(byte_FE8), a
		ld	ix, byte_11AD

loc_2E2:
		bit	7, (ix+1Fh)
		jp	z, loc_622
		ld	a, (ix+3)
		ld	(byte_FEA), a
		ld	l, a
		ld	h, 0
		ld	bc, byte_FF7
		add	hl, bc
		ld	a, (hl)
		ld	(byte_FE9), a
		set	7, (hl)
		and	40h
		jr	z, loc_308
		ld	a, (ix+0)
		or	0Ch
		ld	(ix+0),	a

loc_308:
		ld	e, (ix+1)
		ld	d, (ix+2)
		dec	(ix+4)
		jr	nz, loc_328

loc_313:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_378
		sub	0E0h
		add	a, a
		ld	l, a
		ld	h, 0
		ld	bc, Index_948
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

loc_328:
		ld	a, (ix+4)
		cp	(ix+0Ah)
		jr	nz, loc_340
		ld	c, (ix+16h)
		ld	b, (ix+17h)
		ld	(ix+12h), c
		ld	(ix+13h), b
		ld	(ix+15h), 1

loc_340:
		cp	(ix+25h)
		jp	nz, loc_400
		set	1, (ix+0)
		res	6, (ix+0)
		jp	loc_400
; ---------------------------------------------------------------------------

loc_351:
		ld	b, a
		ld	a, (ix+24h)
		or	a
		jp	p, loc_35B
		ld	a, (de)
		inc	de

loc_35B:
		add	a, (ix+1Eh)
		jp	p, loc_363
		ld	a, 7Fh

loc_363:
		ld	(byte_FED), a
		ld	a, (ix+29h)
		ld	(byte_FEE), a
		ld	a, b
		push	de
		ld	de, 8048h
		call	sub_10A
		pop	de
		jp	loc_3C3
; ---------------------------------------------------------------------------

loc_378:
		bit	4, (ix+0)
		jr	nz, loc_351
		res	7, (ix+0)

loc_382:
		add	a, (ix+0Ch)
		add	a, (ix+2Fh)
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	(ix+0Dh), l
		ld	(ix+0Eh), h
		ld	a, (ix+0)
		bit	5, a
		jr	nz, loc_3C3
		or	42h
		ld	(ix+0),	a
		ld	a, (ix+1Ch)
		ld	(ix+1Dh), a
		ld	a, (ix+18h)
		ld	(ix+1Ah), a
		ld	a, (ix+19h)
		ld	(ix+1Bh), a
		ld	a, (ix+10h)
		ld	(ix+12h), a
		ld	a, (ix+11h)
		ld	(ix+13h), a
		ld	(ix+15h), 1

loc_3C3:
		ld	a, (ix+5)
		or	a
		jr	nz, loc_3CB
		ld	a, (de)
		inc	de

loc_3CB:
		ld	(ix+4),	a
		ld	a, (ix+0Bh)
		sla	a
		cp	(ix+4)
		jr	c, loc_3DE
		ld	a, (ix+4)
		rra
		jr	loc_3E1
; ---------------------------------------------------------------------------

loc_3DE:
		ld	a, (ix+0Bh)

loc_3E1:
		ld	(ix+0Ah), a

loc_3E4:
		ld	a, (ix+26h)
		sla	a
		cp	(ix+4)
		jr	c, loc_3F4
		ld	a, (ix+4)
		rra
		jr	loc_3F7
; ---------------------------------------------------------------------------

loc_3F4:
		ld	a, (ix+26h)

loc_3F7:
		ld	(ix+25h), a
		ld	(ix+1),	e
		ld	(ix+2),	d

loc_400:
		ld	e, (ix+0Dh)
		ld	d, (ix+0Eh)
		bit	7, (ix+0)
		jr	z, loc_452
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		ld	c, l
		ld	b, h
		and	a
		sbc	hl, de
		jr	z, loc_44E
		push	de
		jr	c, loc_434
		ld	l, c
		ld	h, b
		and	a
		sbc	hl, de
		ld	e, (ix+4)
		ld	d, 0
		call	sub_D36
		pop	de
		add	hl, de
		ex	de, hl
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		jr	loc_452
; ---------------------------------------------------------------------------

loc_434:
		ex	de, hl
		and	a
		sbc	hl, bc
		ld	e, (ix+4)
		ld	d, 0
		call	sub_D36
		pop	de
		and	a
		ex	de, hl
		sbc	hl, de
		ex	de, hl
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		jr	loc_452
; ---------------------------------------------------------------------------

loc_44E:
		res	7, (ix+0)

loc_452:
		ld	a, (ix+1Bh)
		or	a
		jr	z, loc_479
		ld	h, a
		ld	a, (ix+1Dh)
		or	a
		jr	nz, loc_476
		ld	l, (ix+1Ah)

loc_462:
		ld	a, (hl)
		inc	hl
		cp	80h
		jr	nz, loc_46E
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_462
; ---------------------------------------------------------------------------

loc_46E:
		ld	(ix+1Ah), l
		ld	(ix+1Bh), h
		jr	loc_47A
; ---------------------------------------------------------------------------

loc_476:
		dec	(ix+1Dh)

loc_479:
		xor	a

loc_47A:
		ld	(byte_FEF), a
		dec	(ix+15h)
		jr	nz, loc_4B7
		ld	l, (ix+12h)
		ld	h, (ix+13h)

loc_488:
		ld	a, (hl)
		inc	hl
		or	a
		jp	m, loc_494
		ld	(ix+15h), 1
		jr	loc_4AE
; ---------------------------------------------------------------------------

loc_494:
		cp	0FFh
		jr	nz, loc_49E
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_488
; ---------------------------------------------------------------------------

loc_49E:
		and	7Fh
		ld	b, (ix+14h)
		add	a, b
		jp	p, loc_4A9
		ld	a, 7Fh

loc_4A9:
		ld	b, (hl)
		inc	hl
		ld	(ix+15h), b

loc_4AE:
		ld	(ix+14h), a
		ld	(ix+12h), l
		ld	(ix+13h), h

loc_4B7:
		ld	a, (byte_FE9)
		or	a
		jp	m, loc_61A
		ld	l, (ix+0Dh)
		ld	h, (ix+0Eh)
		ld	de, 0C0h
		call	sub_D36
		ex	de, hl
		add	hl, hl
		ld	bc, FMFrequencies
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	a, e
		rla
		rla
		rla
		or	(hl)
		ld	d, a
		ld	e, c
		ld	h, 0
		ld	a, (byte_FEF)
		or	a
		jp	p, loc_4E3
		dec	h

loc_4E3:
		ld	l, a
		add	hl, de
		ld	d, 0
		ld	a, (ix+0Fh)
		or	a
		jp	p, loc_4EF
		dec	d

loc_4EF:
		ld	e, a
		add	hl, de
		ld	(word_FEB), hl
		ld	hl, 4000h
		ld	a, (byte_FEA)
		cp	3
		jr	c, loc_502
		ld	l, 2
		sub	3

loc_502:
		ld	(byte_FEF), a
		bit	3, (ix+0)
		jp	z, loc_57C
		add	a, 30h
		ld	c, a
		ld	e, (ix+27h)
		ld	d, (ix+28h)
		ld	b, 4

loc_517:
		ld	a, (de)
		inc	de
		ld	(hl), c
		inc	l
		ld	(hl), a
		dec	l
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_517
		ld	b, 4
		ld	a, 7Fh

loc_527:
		ld	(hl), c
		inc	l
		ld	(hl), a
		dec	l
		inc	c
		inc	c
		inc	c
		inc	c
		djnz	loc_527
		ld	a, (de)
		ld	(ix+2Bh), a
		inc	de
		ld	a, (de)
		ld	(ix+2Ch), a
		inc	de
		ld	a, (de)
		ld	(ix+2Dh), a
		inc	de
		ld	a, (de)
		ld	(ix+2Eh), a
		inc	de
		ld	b, 14h

loc_547:
		ld	a, (de)
		inc	de
		ld	(hl), c
		inc	l
		ld	(hl), a
		dec	l
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_547
		ld	a, 10h
		add	a, c
		ld	(hl), a
		inc	l
		ld	a, (de)
		ld	(hl), a
		dec	l
		inc	de
		and	7
		cp	4
		jr	c, loc_574
		jr	z, loc_570
		cp	7
		jr	nz, loc_56C
		set	7, (ix+2Bh)

loc_56C:
		set	7, (ix+2Ch)

loc_570:
		set	7, (ix+2Dh)

loc_574:
		set	7, (ix+2Eh)
		ld	a, (de)
		ld	(ix+2Fh), a

loc_57C:
		bit	2, (ix+0)
		jr	z, loc_58E
		ld	a, (byte_FEF)
		add	a, 0B4h
		ld	(hl), a
		inc	l
		ld	a, (ix+29h)
		ld	(hl), a
		dec	l

loc_58E:
		ex	de, hl
		ld	a, (byte_FF4)
		ld	c, a
		ld	a, (ix+14h)
		or	80h
		add	a, (ix+2Ah)
		jr	c, loc_5A5
		add	a, (ix+1Eh)
		jr	c, loc_5A5
		add	a, c
		jr	nc, loc_5A7

loc_5A5:
		ld	a, 7Fh

loc_5A7:
		and	7Fh
		ld	(loc_5C2+1), a
		push	ix
		pop	hl
		ld	bc, 2Bh
		add	hl, bc
		ex	de, hl
		ld	a, (byte_FEF)
		add	a, 40h
		ld	c, a
		ld	b, 4

loc_5BC:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_5C8

loc_5C2:
		add	a, 0
		jr	nc, loc_5C8
		ld	a, 7Fh

loc_5C8:
		ld	(hl), c
		inc	l
		ld	(hl), a
		dec	l
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_5BC
		ld	a, 54h
		add	a, c
		ld	c, a
		ld	a, (word_FEB+1)
		ld	(hl), c
		inc	l
		ld	(hl), a
		dec	l
		ld	a, c
		sub	4
		ld	(hl), a
		inc	l
		ld	a, (word_FEB)
		ld	(hl), a
		ld	hl, 4000h
		ld	a, (byte_FEF)
		ld	b, a
		ld	a, (byte_FEA)
		cp	3
		jr	c, loc_5F6
		set	2, b

loc_5F6:
		bit	1, (ix+0)
		jr	z, loc_60D
		ld	(hl), 28h
		inc	l
		ld	(hl), b
		dec	l
		bit	6, (ix+0)
		jr	z, loc_61A
		res	1, (ix+0)
		jr	loc_613
; ---------------------------------------------------------------------------

loc_60D:
		bit	6, (ix+0)
		jr	z, loc_61A

loc_613:
		ld	(hl), 28h
		inc	l
		ld	a, 0F0h
		or	b
		ld	(hl), a

loc_61A:
		ld	a, (ix+0)
		and	0F3h
		ld	(ix+0),	a

loc_622:
		ld	de, 0FFD0h
		add	ix, de
		ld	a, (byte_FE8)
		dec	a
		ld	(byte_FE8), a
		jp	nz, loc_2E2
		ld	de, byte_FF7
		ld	hl, 4000h
		ld	c, 40h
		ld	b, 3

loc_63B:
		ld	a, (de)
		inc	de
		and	80h
		jr	nz, loc_650
		push	bc
		ld	b, 14h

loc_644:
		ld	(hl), c
		inc	l
		ld	(hl), 0FFh
		dec	l
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_644
		pop	bc

loc_650:
		inc	c
		djnz	loc_63B
		ld	l, 2
		ld	c, 40h
		ld	b, 3

loc_659:
		ld	a, (de)
		inc	de
		and	80h
		jr	nz, loc_66E
		push	bc
		ld	b, 4

loc_662:
		ld	(hl), c
		inc	l
		ld	(hl), 7Fh
		dec	l
		ld	a, c
		add	a, 4
		ld	c, a
		djnz	loc_662
		pop	bc

loc_66E:
		inc	c
		djnz	loc_659
		ld	hl, byte_FF7
		ld	b, 6
		xor	a

loc_677:
		ld	(hl), a
		inc	hl
		djnz	loc_677
		ld	a, 8
		ld	(byte_FE8), a
		ld	ix, byte_12F9

loc_684:
		bit	7, (ix+1Fh)
		jp	z, loc_8C8
		ld	a, (ix+3)
		ld	(byte_FEA), a
		ld	l, a
		ld	h, 0
		ld	bc, byte_11DD
		add	hl, bc
		ld	a, (hl)
		ld	(byte_FE9), a
		set	7, (hl)
		and	40h
		or	(ix+0)
		ld	(ix+0),	a
		ld	e, (ix+1)
		ld	d, (ix+2)
		dec	(ix+4)
		jr	nz, loc_6D6

loc_6B1:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_714
		cp	0A0h
		jr	nc, loc_6C7
		sub	80h
		ld	(ix+0Dh), a
		ld	(ix+0Eh), 0
		jp	loc_744
; ---------------------------------------------------------------------------

loc_6C7:
		sub	0E0h
		add	a, a
		ld	l, a
		ld	h, 0
		ld	bc, Index_908
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

loc_6D6:
		ld	a, (ix+0Ah)
		cp	(ix+4)
		jp	nz, loc_79A
		ld	c, (ix+16h)
		ld	b, (ix+17h)
		ld	(ix+12h), c
		ld	(ix+13h), b
		ld	(ix+15h), 1
		jp	loc_79A
; ---------------------------------------------------------------------------

loc_6F2:
		ld	b, a
		ld	a, (ix+24h)
		or	a
		jp	p, loc_6FC
		ld	a, (de)
		inc	de

loc_6FC:
		add	a, (ix+1Eh)
		cp	0Fh
		jr	c, loc_705
		ld	a, 0Fh

loc_705:
		ld	(byte_FED), a
		ld	a, b
		push	de
		ld	de, 8048h
		call	sub_10A
		pop	de
		jp	loc_770
; ---------------------------------------------------------------------------

loc_714:
		bit	4, (ix+0)
		jr	nz, loc_6F2
		res	7, (ix+0)

loc_71E:
		add	a, (ix+0Ch)
		ld	l, a
		ld	h, 0
		ld	a, (byte_FEA)
		cp	3
		jr	z, loc_73E
		add	hl, hl
		ld	bc, PSGFrequencies
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ld	h, 0
		ld	l, (ix+0Fh)
		bit	7, l
		jr	z, loc_73D
		dec	h

loc_73D:
		add	hl, bc

loc_73E:
		ld	(ix+0Dh), l
		ld	(ix+0Eh), h

loc_744:
		set	6, (ix+0)
		bit	5, (ix+0)
		jr	nz, loc_770
		ld	a, (ix+1Ch)
		ld	(ix+1Dh), a
		ld	a, (ix+18h)
		ld	(ix+1Ah), a
		ld	a, (ix+19h)
		ld	(ix+1Bh), a
		ld	a, (ix+10h)
		ld	(ix+12h), a
		ld	a, (ix+11h)
		ld	(ix+13h), a
		ld	(ix+15h), 1

loc_770:
		ld	a, (ix+5)
		or	a
		jr	nz, loc_778
		ld	a, (de)
		inc	de

loc_778:
		ld	(ix+4),	a
		ld	a, (ix+0Bh)
		or	a
		jr	z, loc_794
		sla	a
		cp	(ix+4)
		jr	c, loc_78E
		ld	a, (ix+4)
		rra
		jr	loc_791
; ---------------------------------------------------------------------------

loc_78E:
		ld	a, (ix+0Bh)

loc_791:
		ld	(ix+0Ah), a

loc_794:
		ld	(ix+1),	e
		ld	(ix+2),	d

loc_79A:
		ld	a, (byte_FEA)
		cp	3
		jp	z, loc_826
		ld	e, (ix+0Dh)
		ld	d, (ix+0Eh)
		bit	7, (ix+0)
		jr	z, loc_7F4
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		ld	c, l
		ld	b, h
		and	a
		sbc	hl, de
		jr	z, loc_7F0
		push	de
		jr	c, loc_7D6
		ld	l, c
		ld	h, b
		and	a
		sbc	hl, de
		ld	e, (ix+4)
		ld	d, 0
		call	sub_D36
		pop	de
		add	hl, de
		ex	de, hl
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		jr	loc_7F4
; ---------------------------------------------------------------------------

loc_7D6:
		ex	de, hl
		and	a
		sbc	hl, bc
		ld	e, (ix+4)
		ld	d, 0
		call	sub_D36
		pop	de
		and	a
		ex	de, hl
		sbc	hl, de
		ex	de, hl
		ld	(ix+0Dh), e
		ld	(ix+0Eh), d
		jr	loc_7F4
; ---------------------------------------------------------------------------

loc_7F0:
		res	7, (ix+0)

loc_7F4:
		ld	a, (ix+1Bh)
		or	a
		jr	z, loc_822
		ld	h, a
		ld	a, (ix+1Dh)
		or	a
		jr	nz, loc_81F
		ld	l, (ix+1Ah)

loc_804:
		ld	a, (hl)
		inc	hl
		cp	80h
		jr	nz, loc_810
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_804
; ---------------------------------------------------------------------------

loc_810:
		ld	(ix+1Ah), l
		ld	(ix+1Bh), h
		ld	l, a
		ld	h, 0
		jr	c, loc_81C
		dec	h

loc_81C:
		add	hl, de
		jr	loc_823
; ---------------------------------------------------------------------------

loc_81F:
		dec	(ix+1Dh)

loc_822:
		ex	de, hl

loc_823:
		ld	(word_FEB), hl

loc_826:
		dec	(ix+15h)
		jr	nz, loc_861
		ld	l, (ix+12h)
		ld	h, (ix+13h)

loc_831:
		ld	a, (hl)
		inc	hl
		or	a
		jp	m, loc_83D
		ld	(ix+15h), 1
		jr	loc_858
; ---------------------------------------------------------------------------

loc_83D:
		cp	0FFh
		jr	nz, loc_847
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_831
; ---------------------------------------------------------------------------

loc_847:
		and	7Fh
		ld	b, (ix+14h)
		add	a, b
		cp	0Fh
		jr	c, loc_853
		ld	a, 0Fh

loc_853:
		ld	b, (hl)
		inc	hl
		ld	(ix+15h), b

loc_858:
		ld	(ix+14h), a
		ld	(ix+12h), l
		ld	(ix+13h), h

loc_861:
		ld	a, (byte_FE9)
		or	a
		jp	m, loc_8C4
		ld	a, (byte_FEA)
		cp	3
		jr	z, loc_8A3
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, PanData
		add	hl, bc
		ex	de, hl
		ld	a, (de)
		inc	de
		ld	b, a
		ld	hl,  word_FEB+1
		ld	a, (hl)
		dec	hl
		and	3
		or	b
		rrd
		ld	(7F11h), a
		ld	a, (hl)
		ld	(7F11h), a
		ld	a, (byte_FF5)
		add	a, (ix+14h)
		add	a, (ix+1Eh)
		cp	10h
		jr	c, loc_89B
		ld	a, 0Fh

loc_89B:
		ld	b, a
		ld	a, (de)
		or	b
		ld	(7F11h), a
		jr	loc_8C4
; ---------------------------------------------------------------------------

loc_8A3:
		ld	hl, 7F11h
		bit	6, (ix+0)
		jr	z, loc_8B2
		ld	a, (ix+0Dh)
		or	0E0h
		ld	(hl), a

loc_8B2:
		ld	a, (byte_FF5)
		add	a, (ix+14h)
		add	a, (ix+1Eh)
		cp	10h
		jr	c, loc_8C1
		ld	a, 0Fh

loc_8C1:
		or	0F0h
		ld	(hl), a

loc_8C4:
		res	6, (ix+0)

loc_8C8:
		ld	de, 0FFD8h
		add	ix, de
		ld	a, (byte_FE8)
		dec	a
		ld	(byte_FE8), a
		jp	nz, loc_684
		ld	hl, 7F11h
		ld	de, byte_11DD
		ld	a, (de)
		inc	de
		and	80h
		jr	nz, loc_8E5
		ld	(hl), 9Fh

loc_8E5:
		ld	a, (de)
		inc	de
		and	80h
		jr	nz, loc_8ED
		ld	(hl), 0BFh

loc_8ED:
		ld	a, (de)
		inc	de
		and	80h
		jr	nz, loc_8F5
		ld	(hl), 0DFh

loc_8F5:
		ld	a, (de)
		and	80h
		jr	nz, loc_8FC
		ld	(hl), 0FFh

loc_8FC:
		ld	hl, byte_11DD
		xor	a
		ld	(hl), a
		inc	hl
		ld	(hl), a
		inc	hl
		ld	(hl), a
		inc	hl
		ld	(hl), a
		ret
; End of function sub_2A4
; ---------------------------------------------------------------------------

Index_908:
		dw loc_988		; 0
		dw loc_9AB		; 1
		dw loc_9B8		; 2
		dw loc_9C2		; 3
		dw loc_9D0		; 4
		dw loc_A00		; 5
		dw loc_A0E		; 6
		dw loc_A1E		; 7
		dw loc_A2C		; 8
		dw loc_A3A		; 9
		dw loc_A86		; 0Ah
		dw loc_A96		; 0Bh
		dw loc_AA6		; 0Ch
		dw loc_ABC		; 0Dh
		dw loc_ACA		; 0Eh
		dw loc_ADA		; 0Fh
		dw loc_AE0		; 10h
		dw loc_B06		; 11h
		dw loc_B22		; 12h
		dw loc_B30		; 13h
		dw loc_B6A		; 14h
		dw loc_BA4		; 15h
		dw loc_BB2		; 16h
		dw loc_BC0		; 17h
		dw loc_BD6		; 18h
		dw loc_BEC		; 19h
		dw loc_C22		; 1Ah
		dw loc_C66		; 1Bh
		dw loc_C80		; 1Ch
		dw loc_C96		; 1Dh
		dw loc_CB0		; 1Eh
		dw loc_CD6		; 1Fh
Index_948:
		dw loc_98C		; 0
		dw loc_9AD		; 1
		dw loc_9BA		; 2
		dw loc_9C4		; 3
		dw loc_9D4		; 4
		dw loc_A07		; 5
		dw loc_A16		; 6
		dw loc_A25		; 7
		dw loc_A33		; 8
		dw loc_A66		; 9
		dw loc_A8E		; 0Ah
		dw loc_A9E		; 0Bh
		dw loc_AB1		; 0Ch
		dw loc_AC3		; 0Dh
		dw loc_AD2		; 0Eh
		dw loc_ADD		; 0Fh
		dw loc_AF3		; 10h
		dw loc_B14		; 11h
		dw loc_B29		; 12h
		dw loc_B4D		; 13h
		dw loc_B87		; 14h
		dw loc_BAB		; 15h
		dw loc_BB9		; 16h
		dw loc_BCB		; 17h
		dw loc_BE1		; 18h
		dw loc_C07		; 19h
		dw loc_C44		; 1Ah
		dw loc_C73		; 1Bh
		dw loc_C8B		; 1Ch
		dw loc_CA3		; 1Dh
		dw loc_CC3		; 1Eh
		dw loc_CEF		; 1Fh
; ---------------------------------------------------------------------------

loc_988:
		inc	de
		jp	loc_9D0
; ---------------------------------------------------------------------------

loc_98C:
		set	3, (ix+0)
		set	1, (ix+0)
		ld	a, (de)
		inc	de
		ld	(ix+27h), a
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(ix+28h), a
		ld	h, a
		ld	bc, 1Dh
		add	hl, bc
		ld	a, (hl)
		ld	(ix+2Fh), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_9AB:
		jr	loc_9D0
; ---------------------------------------------------------------------------

loc_9AD:
		ld	a, (de)
		inc	de
		ld	(ix+25h), a
		ld	(ix+26h), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_9B8:
		jr	loc_9D0
; ---------------------------------------------------------------------------

loc_9BA:
		ld	a, (de)
		inc	de
		ld	(ix+2Ah), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_9C2:
		jr	loc_9D0
; ---------------------------------------------------------------------------

loc_9C4:
		set	2, (ix+0)
		ld	a, (de)
		ld	(ix+29h), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_9D0:
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_9D4:
		set	3, (ix+0)
		set	1, (ix+0)
		ld	a, (de)
		inc	de
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, hl
		add	hl, bc
		ld	bc, 2000h
		add	hl, bc
		ld	(ix+27h), l
		ld	(ix+28h), h
		ld	bc, 1Dh
		add	hl, bc
		ld	a, (hl)
		ld	(ix+2Fh), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A00:
		ld	(ix+24h), 80h
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A07:
		ld	(ix+24h), 80h
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A0E:
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A16:
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A1E:
		res	4, (ix+0)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A25:
		res	4, (ix+0)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A2C:
		set	4, (ix+0)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A33:
		set	4, (ix+0)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A3A:
		set	7, (ix+0)
		ld	a, (de)
		push	af
		inc	de
		ld	a, (de)
		inc	de
		add	a, (ix+0Ch)
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	bc, PSGFrequencies
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ld	h, 0
		ld	l, (ix+0Fh)
		bit	7, l
		jr	z, loc_A5B
		dec	h

loc_A5B:
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		pop	af
		jp	loc_71E
; ---------------------------------------------------------------------------

loc_A66:
		set	7, (ix+0)
		ld	a, (de)
		push	af
		inc	de
		ld	a, (de)
		inc	de
		add	a, (ix+0Ch)
		add	a, (ix+2Fh)
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	(ix+22h), l
		ld	(ix+23h), h
		pop	af
		jp	loc_382
; ---------------------------------------------------------------------------

loc_A86:
		ld	a, (de)
		inc	de
		ld	(ix+0Fh), a
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A8E:
		ld	a, (de)
		inc	de
		ld	(ix+0Fh), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_A96:
		ld	a, (de)
		inc	de
		ld	(ix+0Ch), a
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_A9E:
		ld	a, (de)
		inc	de
		ld	(ix+0Ch), a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_AA6:
		ld	(ix+0Bh), 0
		ld	(ix+0Ah), 0
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_AB1:
		ld	(ix+0Bh), 0
		ld	(ix+0Ah), 0
		jp	loc_313
; ---------------------------------------------------------------------------

loc_ABC:
		ld	(ix+5),	0
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_AC3:
		ld	(ix+5),	0
		jp	loc_313
; ---------------------------------------------------------------------------

loc_ACA:
		ld	a, (de)
		inc	de
		ld	(ix+5),	a
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_AD2:
		ld	a, (de)
		inc	de
		ld	(ix+5),	a
		jp	loc_313
; ---------------------------------------------------------------------------

loc_ADA:
		jp	loc_770
; ---------------------------------------------------------------------------

loc_ADD:
		jp	loc_3C3
; ---------------------------------------------------------------------------

loc_AE0:
		ld	l, (ix+6)
		ld	a, (ix+7)
		or	a
		jp	z, loc_6B1
		ld	h, a
		ex	de, hl
		ld	(ix+7),	0
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_AF3:
		ld	l, (ix+6)
		ld	a, (ix+7)
		or	a
		jp	z, loc_313
		ld	h, a
		ex	de, hl
		ld	(ix+7),	0
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B06:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+6),	l
		ld	(ix+7),	h
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B14:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+6),	l
		ld	(ix+7),	h
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B22:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B29:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B30:
		ld	a, (ix+9)
		or	a
		jr	z, loc_B41
		dec	(ix+9)
		jr	nz, loc_B45
		inc	de
		inc	de
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B41:
		ld	a, (de)
		ld	(ix+9),	a

loc_B45:
		inc	de
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B4D:
		ld	a, (ix+9)
		or	a
		jr	z, loc_B5E
		dec	(ix+9)
		jr	nz, loc_B62
		inc	de
		inc	de
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B5E:
		ld	a, (de)
		ld	(ix+9),	a

loc_B62:
		inc	de
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B6A:
		ld	a, (ix+8)
		or	a
		jr	z, loc_B7B
		dec	(ix+8)
		jr	nz, loc_B7F
		inc	de
		inc	de
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B7B:
		ld	a, (de)
		ld	(ix+8),	a

loc_B7F:
		inc	de
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_B87:
		ld	a, (ix+8)
		or	a
		jr	z, loc_B98
		dec	(ix+8)
		jr	nz, loc_B9C
		inc	de
		inc	de
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_B98:
		ld	a, (de)
		ld	(ix+8),	a

loc_B9C:
		inc	de
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_BA4:
		res	5, (ix+0)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_BAB:
		res	5, (ix+0)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_BB2:
		set	5, (ix+0)
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_BB9:
		set	5, (ix+0)
		jp	loc_313
; ---------------------------------------------------------------------------

loc_BC0:
		ld	(ix+19h), 0
		ld	(ix+1Bh), 0
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_BCB:
		ld	(ix+19h), 0
		ld	(ix+1Bh), 0
		jp	loc_313
; ---------------------------------------------------------------------------

loc_BD6:
		ld	a, (de)
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_BE1:
		ld	a, (de)
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_BEC:
		ld	a, (de)
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		inc	de
		ld	a, (de)
		ld	(ix+18h), a
		ld	(ix+1Ah), a
		inc	de
		ld	a, (de)
		ld	(ix+19h), a
		ld	(ix+1Bh), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_C07:
		ld	a, (de)
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		inc	de
		ld	a, (de)
		ld	(ix+18h), a
		ld	(ix+1Ah), a
		inc	de
		ld	a, (de)
		ld	(ix+19h), a
		ld	(ix+1Bh), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_C22:
		ld	a, (ix+20h)
		ld	(ix+12h), a
		ld	a, (ix+21h)
		ld	(ix+13h), a
		ld	(ix+15h), 1
		ld	a, (ix+5)
		or	a
		jr	nz, loc_C3A
		ld	a, (de)
		inc	de

loc_C3A:
		ld	(ix+4),	a
		ld	(ix+0Ah), 0
		jp	loc_794
; ---------------------------------------------------------------------------

loc_C44:
		ld	a, (ix+20h)
		ld	(ix+12h), a
		ld	a, (ix+21h)
		ld	(ix+13h), a
		ld	(ix+15h), 1
		ld	a, (ix+5)
		or	a
		jr	nz, loc_C5C
		ld	a, (de)
		inc	de

loc_C5C:
		ld	(ix+4),	a
		ld	(ix+0Ah), 0
		jp	loc_3E4
; ---------------------------------------------------------------------------

loc_C66:
		ld	a, (de)
		ld	(ix+20h), a
		inc	de
		ld	a, (de)
		ld	(ix+21h), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_C73:
		ld	a, (de)
		ld	(ix+20h), a
		inc	de
		ld	a, (de)
		ld	(ix+21h), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_C80:
		ld	a, (de)
		ld	(ix+0Bh), a
		ld	(ix+0Ah), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_C8B:
		ld	a, (de)
		ld	(ix+0Bh), a
		ld	(ix+0Ah), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_C96:
		ld	a, (de)
		ld	(ix+16h), a
		inc	de
		ld	a, (de)
		ld	(ix+17h), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_CA3:
		ld	a, (de)
		ld	(ix+16h), a
		inc	de
		ld	a, (de)
		ld	(ix+17h), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_CB0:
		ld	a, (de)
		ld	(ix+10h), a
		ld	(ix+12h), a
		inc	de
		ld	a, (de)
		ld	(ix+11h), a
		ld	(ix+13h), a
		inc	de
		jp	loc_6B1
; ---------------------------------------------------------------------------

loc_CC3:
		ld	a, (de)
		ld	(ix+10h), a
		ld	(ix+12h), a
		inc	de
		ld	a, (de)
		ld	(ix+11h), a
		ld	(ix+13h), a
		inc	de
		jp	loc_313
; ---------------------------------------------------------------------------

loc_CD6:
		ld	(ix+1Fh), 0
		ld	a, (byte_FE9)
		and	80h
		jr	nz, loc_CEC
		ld	c, (ix+3)
		ld	b, 0
		ld	hl, byte_11DD
		add	hl, bc
		ld	(hl), 40h

loc_CEC:
		jp	loc_8C8
; ---------------------------------------------------------------------------

loc_CEF:
		ld	(ix+1Fh), 0
		ld	a, (byte_FE9)
		and	80h
		jr	nz, loc_D1F
		ld	c, (ix+3)
		ld	b, 0
		ld	hl, byte_FF7
		add	hl, bc
		ld	(hl), 40h
		ld	hl, 4000h
		ld	a, c
		cp	3
		jr	c, loc_D11
		ld	l, 2
		sub	3

loc_D11:
		add	a, 40h
		ld	b, 4
		ld	c, 7Fh

loc_D17:
		ld	(hl), a
		inc	l
		ld	(hl), c
		dec	l
		add	a, 4
		djnz	loc_D17

loc_D1F:
		jp	loc_622

; =============== S U B R O U T I N E =======================================

sub_D22:
		push	af
		ld	a, c
		ld	(4000h), a
		pop	af
		ld	(4001h), a
		ret
; End of function sub_D22

; =============== S U B R O U T I N E =======================================

sub_D2C:
		push	af
		ld	a, c
		ld	(4002h), a
		pop	af
		ld	(4003h), a
		ret
; End of function sub_D2C

; =============== S U B R O U T I N E =======================================

sub_D36:
		ld	c, l
		ld	a, h
		ld	hl, 0
		ld	b, 10h
		and	a

loc_D3E:
		rl	c
		rla
		adc	hl, hl
		push	hl
		sbc	hl, de
		jr	nc, loc_D49
		ex	(sp), hl

loc_D49:
		inc	sp
		inc	sp
		ccf
		djnz	loc_D3E
		ex	de, hl
		rl	c
		ld	l, c
		rla
		ld	h, a
		ret
; End of function sub_D36
; ---------------------------------------------------------------------------
		ld	a, l
		cpl
		ld	l, a
		ld	a, h
		cpl
		ld	h, a
		inc	hl
		ret
; ---------------------------------------------------------------------------

word_D5D:
		dw 0C624h
		dw 125h
		dw 27h
		dw 28h
		dw 128h
		dw 228h
		dw 328h
		dw 428h
		dw 528h
		dw 22h
		dw 2Bh
		dw 0B4h
		dw 0B5h
		dw 0B6h
		db 0FFh
word_D7A:
		dw 0B4h
		dw 0B5h
		dw 0B6h
		db 0FFh
PSGSilence:	db 4, 9Fh, 0BFh, 0DFh, 0FFh
PanData:	db 80h,	90h, 0A0h, 0B0h, 0C0h, 0D0h
FMFrequencies:
		dw 284h, 286h, 288h, 28Bh, 28Dh, 28Fh, 292h, 294h, 297h
		dw 299h, 29Bh, 29Eh, 2A0h, 2A2h, 2A5h, 2A7h, 2AAh, 2ACh
		dw 2AFh, 2B1h, 2B4h, 2B6h, 2B9h, 2BBh, 2BEh, 2C1h, 2C3h
		dw 2C6h, 2C8h, 2CBh, 2CDh, 2D0h, 2D3h, 2D5h, 2D8h, 2DBh
		dw 2DDh, 2E0h, 2E3h, 2E5h, 2E8h, 2EBh, 2EDh, 2F0h, 2F3h
		dw 2F5h, 2F8h, 2FBh, 2FEh, 300h, 303h, 306h, 309h, 30Ch
		dw 30Eh, 311h, 314h, 317h, 31Ah, 31Ch, 31Fh, 322h, 325h
		dw 328h, 32Bh, 32Eh, 331h, 334h, 337h, 33Ah, 33Dh, 340h
		dw 343h, 346h, 349h, 34Ch, 34Fh, 352h, 355h, 358h, 35Bh
		dw 35Eh, 361h, 364h, 367h, 36Ah, 36Eh, 371h, 374h, 377h
		dw 37Ah, 37Eh, 381h, 384h, 387h, 38Ah, 38Eh, 391h, 394h
		dw 398h, 39Bh, 39Fh, 3A2h, 3A6h, 3A9h, 3ACh, 3B0h, 3B3h
		dw 3B7h, 3BAh, 3BEh, 3C1h, 3C5h, 3C8h, 3CCh, 3CFh, 3D3h
		dw 3D6h, 3DAh, 3DDh, 3E1h, 3E5h, 3E8h, 3ECh, 3EFh, 3F3h
		dw 3F6h, 3FAh, 3FEh, 401h, 405h, 409h, 40Dh, 411h, 414h
		dw 418h, 41Ch, 420h, 424h, 427h, 42Bh, 42Fh, 433h, 437h
		dw 43Bh, 43Fh, 443h, 447h, 44Bh, 44Fh, 453h, 457h, 45Bh
		dw 45Fh, 463h, 467h, 46Bh, 46Fh, 473h, 477h, 47Bh, 47Fh
		dw 483h, 487h, 48Ch, 490h, 494h, 498h, 49Dh, 4A1h, 4A5h
		dw 4A9h, 4AEh, 4B2h, 4B6h, 4BAh, 4BFh, 4C3h, 4C8h, 4CCh
		dw 4D1h, 4D5h, 4DAh, 4DEh, 4E3h, 4E8h, 4ECh, 4F1h, 4F5h
		dw 4FAh, 4FEh, 503h
PSGFrequencies:
		dw 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh
		dw 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh, 3FFh
		dw 3FEh, 3FCh, 3FAh, 3F9h, 3C0h, 38Ah, 357h, 327h, 2FAh
		dw 2CFh, 2A7h, 281h, 25Dh, 23Bh, 21Bh, 1FDh, 1E0h, 1C5h
		dw 1ACh, 194h, 17Dh, 168h, 153h, 140h, 12Eh, 11Dh, 10Dh
		dw 0FEh, 0F0h, 0E2h, 0D5h, 0CAh, 0BEh, 0B4h, 0AAh, 0A0h
		dw 97h,	8Fh, 87h, 7Fh, 78h, 71h, 6Bh, 65h, 5Fh,	5Ah, 55h
		dw 50h,	4Ch, 47h, 43h, 40h, 3Ch, 39h, 35h, 32h,	30h, 2Dh
		dw 2Ah,	28h, 26h, 24h, 22h, 20h, 1Eh, 1Ch, 1Bh,	19h, 18h
		dw 16h,	15h, 14h, 13h, 12h, 11h, 10h, 0Fh, 0Eh,	0Dh, 0Ch
		dw 0Bh,	0Ah, 9,	8, 7, 6, 5, 4, 3, 2, 1,	0
byte_FE8:	db 60h
byte_FE9:	db 0
byte_FEA:	db 0
word_FEB:	dw 6070h
byte_FED:	db 0
byte_FEE:	db 1
byte_FEF:	db 0D6h
		db 60h
		db 0
		db 2
byte_FF3:	db 10h
byte_FF4:	db 60h
byte_FF5:	db 0
		db 2
byte_FF7:	db 4Ah
		db 60h
		db 0
		db 2
		db 0CEh
		db 60h
byte_FFD:	db 0
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1017:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_101C:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_11AD:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_11DD:	ds 1
		ds 1
		ds 1
		ds 1
byte_11E1:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1200:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12F9:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1D00:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
zMusicIndex:		; 1FFCh
		ds 1
		ds 1
		ds 1
		ds 1

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
