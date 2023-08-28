; ---------------------------------------------------------------------------
; RARE Z80 Sound Driver
; ---------------------------------------------------------------------------

MUSIC_BANK 			equ ($1B0000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		!org	0
		CPU Z80
		listing on
		di
		im	1
		jp	loc_A2
; End of function Sound_Driver
; ---------------------------------------------------------------------------
		dw 0

; =============== S U B R O U T I N E =======================================

sub_8:
		bit	7, (iy+0)
		jr	nz, sub_8
		ld	(iy+0),	a
		ld	(iy+1),	c
		ret
; End of function sub_8
; ---------------------------------------------------------------------------
		db 0, 0, 0

; =============== S U B R O U T I N E =======================================

sub_18:
		bit	7, (iy+0)
		jr	nz, sub_18
		ld	(iy+2),	a
		ld	(iy+3),	c
		ret
; End of function sub_18

; ---------------------------------------------------------------------------
		db 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		db 0

; =============== S U B R O U T I N E =======================================

zVInt:
		di
		ex	af, af'
		exx
		ld	a, (byte_9C4)
		and	a
		jr	z, loc_64
		ld	a, (byte_9C3)
		and	a
		jr	nz, loc_8D
		ld	(byte_9C4), a
		ld	hl, 1900h
		ld	b, 6
		ld	a, 0

loc_51:
		ld	l, 2
		ld	(hl), 1
		ld	l, 4Bh
		ld	(hl), a
		inc	l
		ld	(hl), a
		ld	l, 7Ch
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	h
		djnz	loc_51
		jr	loc_8A
; ---------------------------------------------------------------------------

loc_64:
		ld	a, (byte_9C3)
		and	a
		jr	z, loc_8A
		ld	(byte_9C4), a
		ld	a, 0

loc_6F:
		ld	(byte_9B6), a
		cp	3
		jr	c, loc_77
		inc	a

loc_77:
		ld	(byte_9B7), a
		call	sub_70E
		call	sub_269
		ld	a, (byte_9B6)
		inc	a
		cp	6
		jr	c, loc_6F
		jr	loc_8D
; ---------------------------------------------------------------------------

loc_8A:
		call	sub_B2

loc_8D:
		call	sub_728
		ex	af, af'
		exx
		ei
		ret
; End of function zVInt

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, e
		ld	b, 8

loc_97:
		ld	(6000h), a
		rra
		djnz	loc_97
		ld	a, d
		ld	(6000h), a
		ret
; End of function LoadBank
; ---------------------------------------------------------------------------

loc_A2:
		ld	sp, 1FFFh
		ld	iy, 4000h
		ld	de, MUSIC_BANK
		call	LoadBank
		ei

loc_B0:
		jr	$

; =============== S U B R O U T I N E =======================================

sub_B2:
		ld	a, (byte_9BA)
		ld	e, a
		ld	a, (word_9BB)
		add	a, e
		ld	(byte_9BA), a
		rra
		ld	(word_9BB+1), a
		ld	a, (zMusicNumber)
		and	a
		jp	nz, loc_FB
		ld	hl, 1900h
		ld	a, 0

loc_CD:
		ld	(byte_9B6), a
		cp	3
		jr	c, loc_D5
		inc	a

loc_D5:
		ld	(byte_9B7), a
		and	3
		ld	(byte_9B8), a
		ld	l, 1Dh
		ld	a, (hl)
		and	a
		call	nz, sub_161
		ld	l, 4Bh
		ld	a, (hl)
		inc	l
		ld	b, (hl)
		cp	b
		call	nz, sub_4EF
		and	a
		call	nz, sub_521
		inc	h
		ld	a, (byte_9B6)
		inc	a
		cp	6
		jr	c, loc_CD
		ret
; ---------------------------------------------------------------------------

loc_FB:
		ld	c, a
		ld	b, 0
		ld	hl, 8DBBh	; Tempo offset
		add	hl, bc
		ld	a, (hl)
		ld	(word_9BB), a
		xor	a
		ld	(byte_9BA), a
		ld	l, c
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		ld	de, 8DC7h
		add	hl, de
		ld	e, l
		ld	d, h
		ld	hl, 1900h
		ld	a, 0
		ld	(zMusicNumber), a

loc_121:
		ld	(byte_9B6), a
		ld	l, 1Dh
		ld	(hl), c
		ld	l, 1Eh
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	a, (de)
		inc	l
		ld	(hl), a
		inc	de
		ld	l, 20h
		ld	(hl), 1
		ld	l, 22h
		ld	a, 0
		ld	(hl), a
		ld	l, 23h
		ld	(hl), a
		ld	l, 32h
		ld	(hl), a
		ld	l, 25h
		ld	(hl), a
		ld	l, 24h
		ld	(hl), a
		ld	l, 27h
		ld	(hl), a
		ld	l, 2Ch
		ld	(hl), a
		ld	l, 21h
		ld	(hl), 0FFh
		inc	h
		ld	a, (byte_9B6)
		inc	a
		cp	6
		jr	c, loc_121
		ld	(byte_9BE), a
		ld	a, 0
		ld	(byte_9BF), a
		ret
; End of function sub_B2

; =============== S U B R O U T I N E =======================================

sub_161:
		ld	a, (word_9BB+1)
		cp	80h
		jp	c, loc_471
		ld	l, 1Eh
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		ld	l, 20h
		ld	a, (hl)
		and	a
		jr	nz, loc_196
		ld	l, 22h
		dec	(hl)
		ret	nz
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		jr	nz, loc_181
		call	sub_70E

loc_181:
		ld	l, 21h
		ld	a, (hl)
		and	a
		jp	p, loc_18F
		ld	a, (de)
		inc	de
		ld	l, 1Eh
		ld	(hl), e
		inc	l
		ld	(hl), d

loc_18F:
		ld	l, 20h
		ld	(hl), a
		and	a
		jr	z, loc_198
		ret
; ---------------------------------------------------------------------------

loc_196:
		dec	(hl)
		ret	nz

loc_198:
		ld	a, (de)
		inc	de
		cp	80h
		jr	nc, loc_1A3
		call	sub_208
		jr	loc_198
; ---------------------------------------------------------------------------

loc_1A3:
		jr	z, loc_202
		ld	l, 24h
		add	a, (hl)
		add	a, a
		add	a, 0F4h
		ld	c, a
		ld	a, 0
		adc	a, 8
		ld	b, a
		ld	l, 25h
		ld	(hl), 0
		ld	a, (bc)
		ld	l, 0
		ld	(hl), a
		inc	bc
		ld	a, (bc)
		ld	l, 1
		ld	(hl), a
		call	sub_6E9
		ld	l, 2
		ld	a, (hl)
		and	a
		jr	z, loc_1CA
		call	sub_2A9

loc_1CA:
		ld	l, 23h
		ld	a, (hl)
		and	a
		jr	nz, loc_1D2
		ld	a, (de)
		inc	de

loc_1D2:
		ld	l, 22h
		ld	(hl), a
		ld	l, 2Ch
		ld	a, (hl)
		srl	a
		adc	a, 0
		ld	l, 2Dh
		ld	(hl), a
		ld	l, 31h
		ld	a, (hl)
		and	a
		jr	z, loc_1E8
		ld	l, 2Eh
		ld	(hl), a

loc_1E8:
		ld	l, 1Eh
		ld	(hl), e
		inc	l
		ld	(hl), d
		ld	l, 25h
		ld	a, (hl)
		and	a
		ret	nz
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		ret	nz

loc_1F7:
		ld	a, (byte_9B7)
		or	0F0h
		ld	c, a
		ld	a, 28h
		jp	sub_8
; ---------------------------------------------------------------------------

loc_202:
		ld	l, 25h
		ld	(hl), 1
		jr	loc_1CA
; End of function sub_161


; =============== S U B R O U T I N E =======================================


sub_208:
		push	hl
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_217
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		pop	hl
		push	bc
		ret
; End of function sub_208

; ---------------------------------------------------------------------------
off_217:	dw loc_245
		dw loc_27F
		dw loc_338
		dw loc_41D
		dw loc_424
		dw loc_443
		dw sub_454
		dw loc_46C
		dw loc_448
		dw loc_387
		dw loc_390
		dw loc_3AE
		dw loc_371
		dw loc_377
		dw loc_3D9
		dw loc_3DF
		dw loc_37C
		dw loc_382
		dw loc_3E7
		dw loc_3ED
		dw loc_3F8
		dw loc_40B
		dw loc_414
; ---------------------------------------------------------------------------

loc_245:
		ld	l, 1Dh
		ld	(hl), 0
		ld	a, (byte_9BE)
		dec	a
		ld	(byte_9BE), a
		ld	a, 7Fh
		ld	l, 6
		ld	(hl), a
		ld	l, 0Ch
		ld	(hl), a
		ld	l, 12h
		ld	(hl), a
		ld	l, 18h
		ld	(hl), a
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		jr	nz, loc_267
		call	sub_269

loc_267:
		pop	af
		ret

; =============== S U B R O U T I N E =======================================


sub_269:
		ld	b, 40h
		ld	c, 7Fh
		call	sub_717
		ld	b, 44h
		call	sub_717
		ld	b, 48h
		call	sub_717
		ld	b, 4Ch
		jp	sub_717
; End of function sub_269

; ---------------------------------------------------------------------------

loc_27F:
		ld	a, (de)
		inc	de
		push	de
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, 8000h
		add	hl, bc
		ld	c, l
		ld	b, h
		pop	hl
		ld	l, 3
		ld	a, (bc)
		ld	(hl), a
		inc	bc
		ld	l, 4
		ld	a, (bc)
		ld	(hl), a
		inc	bc
		ld	d, h
		ld	e, 5
		push	hl
		ld	a, (bc)
		ld	l, a
		inc	bc
		ld	a, (bc)
		ld	h, a
		ld	bc, 18h
		ldir
		pop	hl
		pop	de

; =============== S U B R O U T I N E =======================================


sub_2A9:
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		ret	nz
		ld	l, 2
		ld	(hl), 0
		ld	l, 3

loc_2B4:
		ld	c, (hl)
		ld	b, 0B0h
		call	sub_717
		inc	l
		ld	a, (byte_9B6)
		cp	5
		jr	nz, loc_2C8
		ld	a, (byte_9C2)
		and	a
		jr	nz, loc_2CE

loc_2C8:
		ld	c, (hl)
		ld	b, 0B4h
		call	sub_717

loc_2CE:
		inc	l
		ld	a, (byte_9B6)
		cp	3
		jr	nc, loc_307
		ld	a, (byte_9B8)

loc_2D9:
		add	a, 30h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	8
		inc	l
		add	a, 10h
		ld	c, 0
		rst	8
		add	a, 4
		ld	b, a
		and	0Ch
		ret	z
		ld	a, b
		and	0Fh
		jr	loc_2D9
; ---------------------------------------------------------------------------

loc_307:
		ld	a, (byte_9B8)

loc_30A:
		add	a, 30h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, (hl)
		rst	18h
		inc	l
		add	a, 10h
		ld	c, 0
		rst	18h
		add	a, 4
		ld	b, a
		and	0Ch
		ret	z
		ld	a, b
		and	0Fh
		jr	loc_30A
; End of function sub_2A9

; ---------------------------------------------------------------------------

loc_338:
		ld	l, 6
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	l, 0Ch
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	l, 12h
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	l, 18h
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		ret	nz
		ld	l, 6
		ld	b, 40h
		ld	c, (hl)
		call	sub_717
		ld	l, 0Ch
		ld	b, 44h
		ld	c, (hl)
		call	sub_717
		ld	l, 12h
		ld	b, 48h
		ld	c, (hl)
		call	sub_717
		ld	l, 18h
		ld	b, 4Ch
		ld	c, (hl)
		jp	sub_717
; ---------------------------------------------------------------------------

loc_371:
		ld	a, (de)
		inc	de
		ld	l, 23h
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_377:
		ld	l, 23h
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_37C:
		ld	a, (de)
		inc	de
		ld	l, 21h
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_382:
		ld	l, 21h
		ld	(hl), 0FFh
		ret
; ---------------------------------------------------------------------------

loc_387:
		ld	l, 1Eh
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	a, (de)
		ld	d, a
		ld	e, (hl)
		ret
; ---------------------------------------------------------------------------

loc_390:
		ld	l, 32h
		ld	c, (hl)
		ld	b, 0
		inc	(hl)
		ld	l, 33h
		add	hl, bc
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	l, 3Bh
		add	hl, bc
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, (de)
		ld	b, a
		inc	de
		ld	(hl), e
		ld	a, 8
		add	a, l
		ld	l, a
		ld	(hl), d
		ld	e, c
		ld	d, b
		ret
; ---------------------------------------------------------------------------

loc_3AE:
		ld	l, 32h
		ld	c, (hl)
		ld	b, 0
		dec	c
		ld	l, 33h
		add	hl, bc
		dec	(hl)
		ld	a, (hl)
		and	a
		jr	z, loc_3CD
		ld	l, 3Bh
		add	hl, bc
		ld	e, (hl)
		ld	l, 43h
		add	hl, bc
		ld	d, (hl)
		dec	de
		dec	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, (de)
		ld	d, a
		ld	e, c
		ret
; ---------------------------------------------------------------------------

loc_3CD:
		ld	l, 3Bh
		add	hl, bc
		ld	e, (hl)
		ld	l, 43h
		add	hl, bc
		ld	d, (hl)
		ld	l, 32h
		dec	(hl)
		ret
; ---------------------------------------------------------------------------

loc_3D9:
		ld	a, (de)
		inc	de
		ld	l, 24h
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_3DF:
		ld	l, 24h
		ld	b, (hl)
		ld	a, (de)
		add	a, b
		ld	(hl), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_3E7:
		ld	a, (de)
		ld	(word_9BB), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_3ED:
		ld	a, (de)
		ld	bc, (word_9BB)
		add	a, c
		ld	(word_9BB), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_3F8:
		ld	l, 4
		ld	a, (hl)
		and	3Fh
		or	0C0h

loc_3FF:
		ld	(hl), a
		ld	c, a
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		ret	nz
		ld	b, 0B4h
		jp	sub_717
; ---------------------------------------------------------------------------

loc_40B:
		ld	l, 4
		ld	a, (hl)
		and	3Fh
		or	80h
		jr	loc_3FF
; ---------------------------------------------------------------------------

loc_414:
		ld	l, 4
		ld	a, (hl)
		and	3Fh
		or	40h
		jr	loc_3FF
; ---------------------------------------------------------------------------

loc_41D:
		ld	l, 26h

loc_41F:
		call	sub_433
		jr	loc_42B
; ---------------------------------------------------------------------------

loc_424:
		ld	l, 26h

loc_426:
		call	sub_433
		dec	a
		cpl

loc_42B:
		inc	l
		ld	(hl), a
		inc	de
		ld	a, (de)
		inc	l
		ld	(hl), a
		inc	de
		ret

; =============== S U B R O U T I N E =======================================


sub_433:
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	a, (de)
		inc	a
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	de
		ld	a, (de)
		inc	l
		ld	(hl), a
		inc	de
		ld	a, (de)
		ret
; End of function sub_433

; ---------------------------------------------------------------------------

loc_443:
		ld	l, 27h
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_448:
		call	sub_454
		ld	a, (de)
		ld	l, 2Eh
		ld	(hl), a
		ld	l, 31h
		ld	(hl), a
		inc	de
		ret

; =============== S U B R O U T I N E =======================================


sub_454:
		ld	l, 2Ch

loc_456:
		ld	a, (de)
		ld	(hl), a
		srl	a
		inc	l
		ld	(hl), a
		inc	de
		ld	a, (de)
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	de
		ld	a, (de)
		dec	a
		cpl
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	de
		ret
; End of function sub_454
; ---------------------------------------------------------------------------

loc_46C:
		ld	l, 2Ch
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_471:
		call	sub_47A
		call	sub_4BD
		jp	sub_6E9

; =============== S U B R O U T I N E =======================================

sub_47A:
		ld	l, 27h
		ld	a, (hl)
		and	a
		ret	z
		ld	l, 26h
		ld	a, (hl)
		and	a
		jr	z, loc_487
		dec	(hl)
		ret	nz

loc_487:
		ld	l, 28h
		dec	(hl)
		ret	nz
		ld	l, 27h
		ld	a, (hl)
		ld	l, 28h
		ld	(hl), a
		ld	l, 29h
		dec	(hl)
		jr	nz, loc_49A
		ld	l, 27h
		ld	(hl), 0

loc_49A:
		ld	c, 0FFh
		ld	l, 2Bh
		ld	a, (hl)
		and	a
		jr	z, loc_4A9
		dec	(hl)
		xor	a
		ld	l, 2Ah
		sub	(hl)
		jr	loc_4AC
; ---------------------------------------------------------------------------

loc_4A9:
		ld	l, 2Ah
		ld	a, (hl)

loc_4AC:
		bit	7, a
		jr	nz, loc_4B1
		inc	c

loc_4B1:
		ld	l, 0
		add	a, (hl)
		ld	(hl), a
		ld	l, 1
		ld	a, (hl)
		adc	a, c
		and	3Fh
		ld	(hl), a
		ret
; End of function sub_47A


; =============== S U B R O U T I N E =======================================


sub_4BD:
		ld	l, 2Ch
		ld	a, (hl)
		and	a
		ret	z
		ld	l, 2Eh
		dec	(hl)
		ret	nz
		inc	l
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ld	l, 30h
		ld	a, (hl)
		ld	b, 0
		bit	7, a
		jr	z, loc_4D4
		dec	b

loc_4D4:
		ld	l, 0
		ld	c, (hl)
		add	a, c
		ld	(hl), a
		ld	l, 1
		ld	a, (hl)
		adc	a, b
		ld	(hl), a
		ld	l, 2Dh
		dec	(hl)
		ret	nz
		ld	l, 2Ch
		ld	a, (hl)
		ld	l, 2Dh
		ld	(hl), a
		ld	l, 30h
		ld	a, (hl)
		neg
		ld	(hl), a
		ret
; End of function sub_4BD


; =============== S U B R O U T I N E =======================================


sub_4EF:
		ld	(hl), a
		and	0FEh
		push	hl
		ld	c, a
		ld	b, 0
		ld	hl, 0F156h
		add	hl, bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		pop	hl
		ld	a, (de)
		ld	l, 4Dh
		ld	(hl), a
		inc	de
		inc	l
		ld	(hl), 0FFh
		ld	a, 0
		ld	l, 57h
		ld	(hl), a
		ld	l, 5Ch
		ld	(hl), a
		ld	l, 52h
		ld	(hl), a
		ld	l, 51h
		ld	(hl), 1
		call	sub_70E
		ld	l, 4Fh
		ld	(hl), e
		inc	l
		ld	(hl), d
		ld	l, 4Bh
		ld	a, (hl)
		ret
; End of function sub_4EF

; =============== S U B R O U T I N E =======================================

sub_521:
		ld	l, 4Dh
		ld	a, (hl)
		inc	l
		add	a, (hl)
		ld	(hl), a
		jp	nc, loc_66B
		ld	l, 4Fh
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		ld	l, 51h
		ld	a, (hl)
		and	a
		jr	z, loc_539
		dec	(hl)
		jr	z, loc_54E
		ret
; ---------------------------------------------------------------------------

loc_539:
		ld	l, 52h
		dec	(hl)
		ret	nz
		call	sub_70E
		ld	a, (de)
		inc	de
		and	a
		jr	z, loc_54E
		ld	l, 51h
		ld	(hl), a
; End of function sub_521

; =============== S U B R O U T I N E =======================================

sub_548:
		ld	l, 4Fh
		ld	(hl), e
		inc	l
		ld	(hl), d
		ret
; End of function sub_548
; ---------------------------------------------------------------------------

loc_54E:
		ld	a, (de)
		inc	de
		cp	80h
		jr	nc, loc_559
		call	sub_59B
		jr	loc_54E
; ---------------------------------------------------------------------------

loc_559:
		jr	z, loc_595
		add	a, a
		add	a, 0F4h
		ld	c, a
		ld	a, 0
		ld	l, 53h
		ld	(hl), a
		adc	a, 8
		ld	b, a
		ld	a, (bc)
		ld	l, 54h
		ld	(hl), a
		inc	bc
		ld	a, (bc)
		inc	l
		ld	(hl), a
		call	sub_6FE

loc_572:
		ld	a, (de)
		inc	de
		ld	l, 52h
		ld	(hl), a
		ld	l, 5Ch
		ld	a, (hl)
		srl	a
		adc	a, 0
		ld	l, 5Dh
		ld	(hl), a
		ld	l, 61h
		ld	a, (hl)
		and	a
		jr	z, loc_58A
		ld	l, 2Eh
		ld	(hl), a

loc_58A:
		call	sub_548
		ld	l, 53h
		ld	a, (hl)
		and	a
		jp	z, loc_1F7
		ret
; ---------------------------------------------------------------------------

loc_595:
		ld	l, 53h
		ld	(hl), 1
		jr	loc_572

; =============== S U B R O U T I N E =======================================

sub_59B:
		push	hl
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_5AA
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		pop	hl
		push	bc
		ret
; End of function sub_59B
; ---------------------------------------------------------------------------

off_5AA:
		dw loc_5D5
		dw loc_5E8
		dw sub_617
		dw loc_63B
		dw loc_640
		dw loc_645
		dw loc_658
		dw loc_65D
		dw loc_64A
		dw loc_662
		dw locret_5D4
		dw locret_5D4
		dw locret_5D4
		dw locret_5D4
		dw locret_5D4
		dw locret_5D4
		dw loc_5CC
; ---------------------------------------------------------------------------

loc_5CC:
		ld	l, 4Bh
		ld	a, (hl)
		and	0FEh
		ld	(hl), a
		inc	l
		ld	(hl), a

locret_5D4:
		ret
; ---------------------------------------------------------------------------

loc_5D5:
		ld	l, 4Bh
		ld	a, 0
		ld	(hl), a
		inc	l
		ld	(hl), a
		ld	l, 2
		ld	(hl), 1
		ld	de, byte_637
		call	sub_617
		pop	af
		ret
; ---------------------------------------------------------------------------

loc_5E8:
		ld	a, (de)
		inc	de
		push	de
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, 8000h
		add	hl, bc
		ld	c, l
		ld	b, h
		pop	hl
		ld	l, 62h
		ld	a, (bc)
		ld	(hl), a
		inc	bc
		ld	l, 63h
		ld	a, (bc)
		ld	(hl), a
		inc	bc
		ld	d, h
		ld	e, 64h
		push	hl
		ld	a, (bc)
		ld	l, a
		inc	bc
		ld	a, (bc)
		ld	h, a
		ld	bc, 18h
		ldir
		pop	hl
		pop	de
		ld	l, 62h
		jp	loc_2B4

; =============== S U B R O U T I N E =======================================

sub_617:
		ld	a, (de)
		inc	de
		ld	c, a
		ld	b, 40h
		call	sub_717
		ld	a, (de)
		inc	de
		ld	c, a
		ld	b, 44h
		call	sub_717
		ld	a, (de)
		inc	de
		ld	c, a
		ld	b, 48h
		call	sub_717
		ld	a, (de)
		inc	de
		ld	c, a
		ld	b, 4Ch
		jp	sub_717
; End of function sub_617
; ---------------------------------------------------------------------------

byte_637:
		db 7Fh
		db 7Fh
		db 7Fh
		db 7Fh
; ---------------------------------------------------------------------------

loc_63B:
		ld	l, 56h
		jp	loc_41F
; ---------------------------------------------------------------------------

loc_640:
		ld	l, 56h
		jp	loc_426
; ---------------------------------------------------------------------------

loc_645:
		ld	l, 57h
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_64A:
		ld	l, 5Ch
		call	loc_456
		ld	a, (de)
		ld	l, 5Eh
		ld	(hl), a
		ld	l, 61h
		ld	(hl), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_658:
		ld	l, 5Ch
		jp	loc_456
; ---------------------------------------------------------------------------

loc_65D:
		ld	l, 5Ch
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_662:
		ld	l, 4Fh
		ld	a, (de)
		ld	(hl), a
		inc	de
		ld	a, (de)
		ld	d, a
		ld	e, (hl)
		ret
; ---------------------------------------------------------------------------

loc_66B:
		call	sub_674
		call	sub_6B7
		jp	sub_6FE

; =============== S U B R O U T I N E =======================================

sub_674:
		ld	l, 57h
		ld	a, (hl)
		and	a
		ret	z
		ld	l, 56h
		ld	a, (hl)
		and	a
		jr	z, loc_681
		dec	(hl)
		ret	nz

loc_681:
		ld	l, 58h
		dec	(hl)
		ret	nz
		ld	l, 57h
		ld	a, (hl)
		ld	l, 58h
		ld	(hl), a
		ld	l, 59h
		dec	(hl)
		jr	nz, loc_694
		ld	l, 57h
		ld	(hl), 0

loc_694:
		ld	c, 0FFh
		ld	l, 5Bh
		ld	a, (hl)
		and	a
		jr	z, loc_6A3
		dec	(hl)
		xor	a
		ld	l, 5Ah
		sub	(hl)
		jr	loc_6A6
; ---------------------------------------------------------------------------

loc_6A3:
		ld	l, 5Ah
		ld	a, (hl)

loc_6A6:
		bit	7, a
		jr	nz, loc_6AB
		inc	c

loc_6AB:
		ld	l, 54h
		add	a, (hl)
		ld	(hl), a
		ld	l, 55h
		ld	a, (hl)
		adc	a, c
		and	3Fh
		ld	(hl), a
		ret
; End of function sub_674

; =============== S U B R O U T I N E =======================================

sub_6B7:
		ld	l, 5Ch
		ld	a, (hl)
		and	a
		ret	z
		ld	l, 5Eh
		dec	(hl)
		ret	nz
		inc	l
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ld	l, 60h
		ld	a, (hl)
		ld	b, 0
		bit	7, a
		jr	z, loc_6CE
		dec	b

loc_6CE:
		ld	l, 54h
		ld	c, (hl)
		add	a, c
		ld	(hl), a
		ld	l, 55h
		ld	a, (hl)
		adc	a, b
		ld	(hl), a
		ld	l, 5Dh
		dec	(hl)
		ret	nz
		ld	l, 5Ch
		ld	a, (hl)
		ld	l, 5Dh
		ld	(hl), a
		ld	l, 60h
		ld	a, (hl)
		neg
		ld	(hl), a
		ret
; End of function sub_6B7

; =============== S U B R O U T I N E =======================================

sub_6E9:
		ld	l, 4Bh
		ld	a, (hl)
		and	a
		ret	nz
		ld	l, 1
		ld	c, (hl)
		ld	b, 0A4h
		call	sub_717
		ld	l, 0
		ld	c, (hl)
		ld	b, 0A0h
		jp	sub_717
; End of function sub_6E9


; =============== S U B R O U T I N E =======================================


sub_6FE:
		ld	l, 55h
		ld	c, (hl)
		ld	b, 0A4h
		call	sub_717
		ld	l, 54h
		ld	c, (hl)
		ld	b, 0A0h
		jp	sub_717
; End of function sub_6FE


; =============== S U B R O U T I N E =======================================


sub_70E:
		ld	a, (byte_9B7)
		ld	c, a
		ld	a, 28h
		jp	sub_8
; End of function sub_70E


; =============== S U B R O U T I N E =======================================


sub_717:
		ld	a, (byte_9B6)
		cp	3
		jr	nc, loc_722
		add	a, b
		jp	sub_8
; ---------------------------------------------------------------------------

loc_722:
		sub	3
		add	a, b
		jp	sub_18
; End of function sub_717


; =============== S U B R O U T I N E =======================================


sub_728:
		ld	ix, byte_8E9
		ld	hl, 1900h
		ld	a, 0

loc_731:
		ld	(byte_9B6), a
		ld	l, 7Ch
		ld	a, (hl)
		inc	l
		ld	b, (hl)
		cp	b
		call	nz, sub_757
		and	a
		call	nz, sub_7C9
		inc	h
		ld	a, (byte_9B6)
		inc	a
		cp	3
		jr	c, loc_731
		ld	hl, byte_8E9
		ld	b, 0Bh

loc_74F:
		ld	a, (hl)
		ld	(7F11h), a
		inc	hl
		djnz	loc_74F
		ret
; End of function sub_728

; =============== S U B R O U T I N E =======================================

sub_757:
		cp	0FFh
		jr	nz, loc_787
		ld	ix, byte_8E9
		ld	(ix+2),	9Fh
		ld	(ix+5),	0BFh
		ld	(ix+8),	0DFh
		ld	(ix+0Ah), 0FFh
		ld	b, 4
		ld	a, 0
		ld	hl, 1900h
		ld	l, 7Ch

loc_778:
		ld	(hl), a
		inc	l
		ld	(hl), a
		dec	l
		inc	h
		djnz	loc_778
		ld	a, 3
		ld	(byte_9B6), a
		ld	a, 0
		ret
; ---------------------------------------------------------------------------

loc_787:
		push	hl
		ld	l, 7Dh
		ld	(hl), a
		and	0FEh
		ld	c, a
		ld	b, 0
		ld	hl, 0FF91h
		add	hl, bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		pop	hl
		ld	a, (de)
		inc	de
		ld	l, 81h
		ld	(hl), a
		ld	a, (de)
		inc	de
		ld	l, 82h
		ld	(hl), a
		srl	a
		srl	a
		srl	a
		srl	a
		and	7
		ld	c, a
		ld	b, 0
		push	hl
		ld	hl, byte_8E1
		add	hl, bc
		ld	a, (hl)
		pop	hl
		ld	l, 84h
		ld	(hl), a
		dec	l
		ld	(hl), 0
		ld	l, 7Eh
		ld	(hl), e
		inc	l
		ld	(hl), d
		ld	l, 80h
		ld	(hl), 1
		ld	l, 7Ch
		ld	a, (hl)
		ret
; End of function sub_757

; =============== S U B R O U T I N E =======================================

sub_7C9:
		ld	l, 80h
		dec	(hl)
		jr	nz, loc_848
		ld	l, 81h
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ld	l, 7Eh
		ld	e, (hl)
		inc	l
		ld	d, (hl)

loc_7D8:
		ld	a, (de)
		inc	de
		and	a
		jr	nz, loc_7EE
		ld	l, 87h
		ld	(hl), 0Fh
		ld	l, 7Ch
		ld	(hl), 0
		inc	l
		ld	(hl), 0
		ld	l, 82h
		ld	(hl), 0
		jr	loc_81C
; ---------------------------------------------------------------------------

loc_7EE:
		cp	10h
		jr	c, loc_7FE
		jr	nz, loc_817
		ld	l, 7Ch
		ld	a, (hl)
		and	0FEh
		ld	(hl), a
		inc	l
		ld	(hl), a
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_7FE:
		xor	0Fh
		ld	l, 87h
		ld	(hl), a
		ld	l, 83h
		ld	(hl), 0
		ld	a, (de)
		ld	l, 85h
		ld	(hl), a
		inc	de
		ld	a, (de)
		ld	l, 86h
		ld	(hl), a
		ld	l, 85h
		or	(hl)
		jr	nz, loc_817
		ld	(hl), 0Fh

loc_817:
		ld	l, 7Eh
		ld	(hl), e
		inc	l
		ld	(hl), d

loc_81C:
		ld	a, (ix+2)
		and	0F0h
		ld	l, 87h
		or	(hl)
		ld	(ix+2),	a
		ld	l, 86h
		ld	a, (hl)
		and	0Fh
		ld	b, a
		ld	a, (ix+0)
		and	0F0h
		or	b
		ld	(ix+0),	a
		ld	a, (hl)
		ld	l, 85h
		ld	b, (hl)
		srl	b
		rra
		srl	b
		rra
		srl	a
		srl	a
		ld	(ix+1),	a
		ret
; ---------------------------------------------------------------------------

loc_848:
		ld	l, 82h
		ld	a, (hl)
		bit	7, a
		ret	z
		and	7
		ret	z
		ld	l, 84h
		ld	a, (hl)
		and	a
		jr	z, loc_85C
		dec	l
		add	a, (hl)
		ld	(hl), a
		jr	nc, loc_862

loc_85C:
		call	sub_8AF
		call	sub_875

loc_862:
		ld	l, 84h
		ld	a, (hl)
		and	a
		jr	z, loc_86D
		dec	l
		add	a, (hl)
		ld	(hl), a
		jr	nc, loc_81C

loc_86D:
		call	sub_8AF
		call	sub_875
		jr	loc_81C
; End of function sub_7C9


; =============== S U B R O U T I N E =======================================


sub_875:
		ld	l, 82h
		ld	a, (hl)
		and	8
		jr	nz, loc_897
		ld	l, 86h
		ld	a, (hl)
		add	a, e
		ld	(hl), a
		ld	l, 85h
		ld	a, (hl)
		adc	a, d
		cp	4
		jr	c, loc_895
		ld	l, 87h
		ld	(hl), 0Fh
		ld	l, 86h
		ld	(hl), 0FFh
		ld	a, 3
		ld	l, 85h

loc_895:
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_897:
		ld	l, 86h
		ld	a, (hl)
		sub	e
		ld	(hl), a
		ld	l, 1
		ld	a, (hl)
		sbc	a, d
		jr	nc, loc_8AD
		ld	l, 87h
		ld	(hl), 0Fh
		ld	a, 0
		ld	l, 86h
		ld	(hl), a
		ld	l, 85h

loc_8AD:
		ld	(hl), a
		ret
; End of function sub_875

; =============== S U B R O U T I N E =======================================

sub_8AF:
		ld	l, 82h
		ld	a, (hl)
		and	7
		xor	7
		ld	b, a
		add	a, a
		add	a, b
		ld	e, a
		ld	d, 0
		ld	l, 86h
		ld	a, (hl)
		ld	l, 85h
		ld	b, (hl)
		push	hl
		ld	hl, loc_8C8
		add	hl, de
		jp	(hl)
; End of function sub_8AF
; ---------------------------------------------------------------------------

loc_8C8:
		srl	b
		rra
		srl	b
		rra
		srl	b
		rra
		srl	b
		rra
		srl	b
		rra
		srl	b
		rra
		srl	b
		rra
		ld	d, b
		ld	e, a
		pop	hl
		ret
; ---------------------------------------------------------------------------
byte_8E1:	db 0
		db  80h
		db  60h
		db  40h
		db  33h
		db  2Ah
		db  24h
		db  20h
byte_8E9:	db 80h
		db    0
		db  9Fh
		db 0A0h
		db    0
		db 0BFh
		db 0C0h
		db    0
		db 0DFh
		db 0E0h
		db 0FFh
		db    0
		db    0
		db  69h
		db    2
		db  8Dh
		db    2
		db 0B4h
		db    2
		db 0DDh
		db    2
		db    9
		db    3
		db  37h
		db    3
		db  68h
		db    3
		db  9Ch
		db    3
		db 0D3h
		db    3
		db  0Dh
		db    4
		db  4Bh
		db    4
		db  8Ch
		db    4
		db  69h
		db  0Ah
		db  8Dh
		db  0Ah
		db 0B4h
		db  0Ah
		db 0DDh
		db  0Ah
		db    9
		db  0Bh
		db  37h
		db  0Bh
		db  68h
		db  0Bh
		db  9Ch
		db  0Bh
		db 0D3h
		db  0Bh
		db  0Dh
		db  0Ch
		db  4Bh
		db  0Ch
		db  8Ch
		db  0Ch
		db  69h
		db  12h
		db  8Dh
		db  12h
		db 0B4h
		db  12h
		db 0DDh
		db  12h
		db    9
		db  13h
		db  37h
		db  13h
		db  68h
		db  13h
		db  9Ch
		db  13h
		db 0D3h
		db  13h
		db  0Dh
		db  14h
		db  4Bh
		db  14h
		db  8Ch
		db  14h
		db  69h
		db  1Ah
		db  8Dh
		db  1Ah
		db 0B4h
		db  1Ah
		db 0DDh
		db  1Ah
		db    9
		db  1Bh
		db  37h
		db  1Bh
		db  68h
		db  1Bh
		db  9Ch
		db  1Bh
		db 0D3h
		db  1Bh
		db  0Dh
		db  1Ch
		db  4Bh
		db  1Ch
		db  8Ch
		db  1Ch
		db  69h
		db  22h
		db  8Dh
		db  22h
		db 0B4h
		db  22h
		db 0DDh
		db  22h
		db    9
		db  23h
		db  37h
		db  23h
		db  68h
		db  23h
		db  9Ch
		db  23h
		db 0D3h
		db  23h
		db  0Dh
		db  24h
		db  4Bh
		db  24h
		db  8Ch
		db  24h
		db  69h
		db  2Ah
		db  8Dh
		db  2Ah
		db 0B4h
		db  2Ah
		db 0DDh
		db  2Ah
		db    9
		db  2Bh
		db  37h
		db  2Bh
		db  68h
		db  2Bh
		db  9Ch
		db  2Bh
		db 0D3h
		db  2Bh
		db  0Dh
		db  2Ch
		db  4Bh
		db  2Ch
		db  8Ch
		db  2Ch
		db  69h
		db  32h
		db  8Dh
		db  32h
		db 0B4h
		db  32h
		db 0DDh
		db  32h
		db    9
		db  33h
		db  37h
		db  33h
		db  68h
		db  33h
		db  9Ch
		db  33h
		db 0D3h
		db  33h
		db  0Dh
		db  34h
		db  4Bh
		db  34h
		db  8Ch
		db  34h
		db  69h
		db  3Ah
		db  8Dh
		db  3Ah
		db 0B4h
		db  3Ah
		db 0DDh
		db  3Ah
		db    9
		db  3Bh
		db  37h
		db  3Bh
		db  68h
		db  3Bh
		db  9Ch
		db  3Bh
		db 0D3h
		db  3Bh
		db  0Dh
		db  3Ch
		db  4Bh
		db  3Ch
		db  8Ch
		db  3Ch
byte_9B6:	db 0
byte_9B7:	db 0
byte_9B8:	db 0
		db 0
byte_9BA:	db 0
word_9BB:	dw 0
zMusicNumber:	db 0
byte_9BE:	db 0
byte_9BF:	db 0
		db 0
		db 0
byte_9C2:	db 0
byte_9C3:	db 0
byte_9C4:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
