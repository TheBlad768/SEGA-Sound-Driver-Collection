; ---------------------------------------------------------------------------
; Wolfteam Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($10000>>15)
Music_Bank2_Offset:			equ ($18000>>15)
Samples_Bank_Offset:			equ ($20000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		!org	0
		CPU Z80
		listing on

		jp	loc_1A4
; ---------------------------------------------------------------------------
		db 0
		db 0
		db 0
		db 0
		db 0
; ---------------------------------------------------------------------------
		jp	loc_1A4
; ---------------------------------------------------------------------------
byte_B:		db 0
byte_C:		db 0
byte_D:		db 0
byte_E:		db 0
byte_F:		db 0
; ---------------------------------------------------------------------------
		jp	loc_1A4
; ---------------------------------------------------------------------------
byte_13:	db 0
word_14:	dw 0
byte_16:	db 0
		db 0
; ---------------------------------------------------------------------------
		jp	loc_1A4
; ---------------------------------------------------------------------------
byte_1B:	db 0
byte_1C:	db 0
byte_1D:	db 0
		db 0
		db 0
; ---------------------------------------------------------------------------
		jp	loc_1A4
; ---------------------------------------------------------------------------
		nop
		nop
		nop
		nop
		nop
		jp	loc_1A4
; ---------------------------------------------------------------------------
		nop
		nop
		nop
		nop
		nop
		jp	loc_1A4
; ---------------------------------------------------------------------------
		db 0
		db 0
		db 0
		db 0
		db 0
; ---------------------------------------------------------------------------
		push	af
		xor	a
		ld	(byte_1B), a
		pop	af
		ei
		ret
; ---------------------------------------------------------------------------
word_40:	dw 0
byte_42:	db 0
byte_43:	db 0
byte_44:	db 0FFh
word_45:	dw 0
		db    0
byte_48:	db 0
byte_49:	db 0
byte_4A:	db 0
byte_4B:	db 0
byte_4C:	db 0
byte_4D:	db 0
		db    0
		db    0
		db    1
		db    2
		db    3
		db    4
		db 0FFh
		db 0FFh
		db 0FFh
		db    5
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
byte_133:	db 0
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_178:	db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
; ---------------------------------------------------------------------------

loc_1A4:
		di
		im	1
		ld	sp, 2000h
		ld	d, 27h
		ld	e, 0
		call	sub_E89
		xor	a
		ld	(byte_49), a
		ld	(byte_42), a
		ld	(byte_43), a
		call	sub_457
		ld	a, 7
		ld	(byte_4B), a
		ld	hl, word_1241
		ld	de, UniBank
		call	sub_F95
		ei
		ld	a, (byte_1D)
		ld	c, a
		call	LoadBank
		jp	loc_23F
; End of function start

; =============== S U B R O U T I N E =======================================

sub_1D7:
		ld	a, 1
		ld	(byte_1B), a
		call	sub_A59
		call	sub_DE3
		call	sub_FCD
		ld	a, (byte_48)
		ld	b, a
		or	a
		jr	z, loc_21E
		cp	0FFh
		jr	nz, loc_1FC
		xor	a
		ld	(byte_48), a
		ld	(byte_F7C), a
		call	sub_1125
		jr	loc_21E
; ---------------------------------------------------------------------------

loc_1FC:
		ld	a, (byte_F7C)
		or	a
		jr	z, loc_20C
		ld	a, (byte_B)
		ld	c, a
		ld	a, (byte_4C)
		cp	c
		jr	c, loc_21E

loc_20C:
		ld	a, (byte_4C)
		ld	(byte_B), a
		xor	a
		ld	(byte_4C), a
		ld	(byte_48), a
		ld	a, b
		dec	a
		call	sub_FA1

loc_21E:
		ld	a, (byte_E)
		or	a
		jr	z, loc_22E
		ld	a, (byte_E)
		ld	(byte_4D), a
		xor	a
		ld	(byte_E), a

loc_22E:
		ld	a, (byte_4D)
		or	a
		jr	z, locret_23E
		ld	(byte_C), a
		ld	(byte_397), a
		xor	a
		ld	(byte_4D), a

locret_23E:
		ret
; End of function sub_1D7
; ---------------------------------------------------------------------------

loc_23F:
		ld	iy, 60h
		ld	hl, 0
		ld	de, 0
		call	sub_424
		call	sub_3FE

loc_24F:
		ld	a, (byte_42)
		or	a
		jr	nz, loc_25E
		ld	a, (byte_1B)
		or	a
		jp	z, loc_3B9
		jr	loc_24F
; ---------------------------------------------------------------------------

loc_25E:
		di
		ld	d, 2Bh
		ld	e, 80h
		call	sub_1095
		ld	hl, 50h
		ld	(word_14), hl
		ld	a, (byte_42)
		cp	1Fh
		jp	nz, loc_281
		ld	d, 2Bh
		ld	e, 0
		call	sub_E89
		ld	hl, 50h
		ld	(word_14), hl

loc_281:
		ld	a, (byte_42)
		dec	a
		ld	h, 0
		ld	l, a
		add	hl, hl
		ld	de, MusicIndex
		add	hl, de
		ld	a, (hl)
		cp	0FFh
		jp	z, loc_23F
		push	af
		inc	hl
		ld	a, (hl)
		ld	(byte_1C), a
		ld	c, a
		call	LoadBank
		ld	b, 80h
		ei
		pop	af
		add	a, a
		add	a, a
		ld	e, a
		ld	d, 0
		ld	hl, 8002h
		add	hl, de
		ld	a, (hl)
		add	a, b
		inc	hl
		ld	(word_40+1), a
		ld	a, (hl)
		ld	(word_40), a
		xor	a
		ld	(byte_49), a
		ld	(byte_42), a
		ld	(byte_43), a
		call	sub_48E
		call	sub_5AD
		ld	d, 27h
		ld	e, 2Ah
		call	sub_E89
		ld	a, (byte_1D)
		ld	c, a
		call	LoadBank
		call	sub_411

loc_2D5:
		ld	a, (4000h)
		rrca
		rrca
		jp	c, loc_398

loc_2DD:
		ld	a, (byte_1B)
		or	a
		jp	z, loc_3B9

loc_2E4:
		ld	a, (byte_397)
		or	a
		jp	nz, loc_308

loc_2EB:
		call	sub_3D3
		ld	a, (byte_43)
		or	a
		jr	z, loc_2D5
		call	sub_3FE
		ld	a, (byte_1C)
		ld	c, a
		call	LoadBank
		xor	a
		ld	(byte_43), a
		call	sub_457
		jp	loc_23F
; ---------------------------------------------------------------------------

loc_308:
		push	hl
		push	de
		ld	a, (byte_49)
		or	a
		jp	nz, loc_392
		ld	a, (byte_397)
		ld	l, a
		xor	a
		ld	(byte_397), a
		ld	a, l
		cp	0FFh
		jp	nz, loc_327
		pop	bc
		pop	bc
		ld	de, 0
		jp	loc_2EB
; ---------------------------------------------------------------------------

loc_327:
		dec	a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	de, SamplesIndex
		add	hl, de
		ld	a, (hl)
		inc	hl
		or	a
		jp	z, loc_392
		pop	bc
		pop	bc
		ld	(byte_1D), a
		ld	c, a
		call	LoadBank
		ld	a, (hl)
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		add	a, a
		add	a, a
		add	a, a
		ld	h, 0
		ld	l, a
		add	hl, bc
		ld	a, (hl)
		ld	(loc_3D9+1), a
		inc	a
		jp	nz, loc_378
		inc	hl
		ld	a, (byte_F)
		ld	e, a
		ld	d, 0B6h
		call	sub_E9C
		push	hl
		ld	d, 0
		ld	e, (hl)
		ld	a, (byte_D)
		add	a, e
		sub	39h
		and	7Fh
		ld	e, a
		ld	hl, byte_1173
		add	hl, de
		ld	a, (hl)
		ld	(loc_3D9+1), a
		pop	hl
		inc	hl
		jp	loc_380
; ---------------------------------------------------------------------------

loc_378:
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, 0B6h
		call	sub_E9C

loc_380:
		inc	hl
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	l, (hl)
		ld	h, a
		add	hl, bc
		dec	de
		dec	de
		dec	de
		dec	de
		jp	loc_2EB
; ---------------------------------------------------------------------------

loc_392:
		pop	de
		pop	hl
		jp	loc_2EB
; END OF FUNCTION CHUNK	FOR start
; ---------------------------------------------------------------------------
byte_397:	db 0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_398:
		call	sub_3FE
		ld	d, 27h
		ld	e, 2Ah
		call	sub_E89
		ld	a, (byte_1C)
		ld	c, a
		call	LoadBank
		call	sub_5AD
		ld	a, (byte_1D)
		ld	c, a
		call	LoadBank
		call	sub_411
		jp	loc_2DD
; ---------------------------------------------------------------------------

loc_3B9:
		call	sub_3FE
		ld	a, (byte_1C)
		ld	c, a
		call	LoadBank
		call	sub_1D7
		ld	a, (byte_1D)
		ld	c, a
		call	LoadBank
		call	sub_411
		jp	loc_2E4
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_3D3:
		ld	a, d
		or	e
		jp	z, loc_3F2
		dec	de

loc_3D9:
		ld	b, 0

loc_3DB:
		djnz	$

loc_3DD:
		ld	a, (4000h)
		rlca
		jr	c, loc_3DD
		ld	a, 2Ah
		ld	(4000h), a
		nop
		nop
		nop
		nop
		ld	a, (hl)
		inc	hl
		ld	(4001h), a
		ret
; ---------------------------------------------------------------------------

loc_3F2:
		xor	a
		ld	(byte_C), a
		ret
; End of function sub_3D3

; ---------------------------------------------------------------------------
		call	sub_437
		call	sub_3FE
		ret

; =============== S U B R O U T I N E =======================================


sub_3FE:
		ld	(iy+0),	l
		ld	(iy+1),	h
		ld	(iy+2),	c
		ld	(iy+3),	b
		ld	(iy+4),	e
		ld	(iy+5),	d
		ret
; End of function sub_3FE


; =============== S U B R O U T I N E =======================================


sub_411:
		ld	l, (iy+0)
		ld	h, (iy+1)
		ld	c, (iy+2)
		ld	b, (iy+3)
		ld	e, (iy+4)
		ld	d, (iy+5)
		ret
; End of function sub_411

; =============== S U B R O U T I N E =======================================

sub_424:
		ld	(iy+6),	l
		ld	(iy+7),	h
		ld	(iy+8),	c
		ld	(iy+9),	b
		ld	(iy+0Ah), e
		ld	(iy+0Bh), d
		ret
; End of function sub_424

; =============== S U B R O U T I N E =======================================

sub_437:
		ld	l, (iy+6)
		ld	h, (iy+7)
		ld	c, (iy+8)
		ld	b, (iy+9)
		ld	e, (iy+0Ah)
		ld	d, (iy+0Bh)
		ret
; End of function sub_437

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	b, 9

loc_44C:
		ld	a, c
		and	1
		ld	(6000h), a
		srl	c
		djnz	loc_44C
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_457:
		xor	a
		ld	(byte_DD9), a
		ld	hl, 70h
		ld	de, 2Ch
		xor	a
		ld	b, 7

loc_464:
		ld	(hl), a
		add	hl, de
		djnz	loc_464
		ld	b, 3

loc_46A:
		ld	d, 28h
		ld	e, b
		dec	e
		call	sub_E89
		ld	a, e
		add	a, 4
		ld	e, a
		call	sub_E89
		djnz	loc_46A
		ld	a, 9Fh
		call	sub_EAF
		ld	a, 0BFh
		call	sub_EAF
		ld	a, 0DFh
		call	sub_EAF
		ld	a, 0FFh
		jp	sub_EAF
; End of function sub_457

; =============== S U B R O U T I N E =======================================

sub_48E:
		ld	hl, 70h
		ld	de, 71h
		ld	bc, byte_133
		ld	(hl), 0
		ldir
		ld	hl, 1
		ld	(word_45), hl
		ld	a, 7
		ld	(byte_4B), a
		ld	hl, (word_40)
		inc	hl
		ld	a, (hl)
		dec	hl
		ld	(byte_13), a
		ld	de, 16h
		add	hl, de
		ld	a, (hl)
		push	hl
		ld	l, a
		ld	h, 0
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		ex	de, hl
		ld	hl, 32C8h
		xor	a

loc_4C1:
		sbc	hl, de
		dec	a
		jr	nc, loc_4C1
		inc	a
		pop	hl
		ld	(byte_16), a
		ld	b, 8
		ld	de, 8
		add	hl, de
		ld	ix, 70h
		ex	de, hl
		ld	hl, (word_14)
		ex	de, hl

loc_4DA:
		ld	a, (de)
		inc	de
		inc	a
		jr	nz, loc_4E8

loc_4DF:
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		djnz	loc_4DA
		jp	loc_552
; ---------------------------------------------------------------------------

loc_4E8:
		dec	a
		ld	(ix+0Dh), a
		ld	a, (hl)
		or	a
		jr	z, loc_4DF
		push	de
		inc	hl
		ld	a, (hl)
		and	3
		inc	hl
		ld	(ix+1),	a
		ld	a, (ix+0Dh)
		cp	3
		ld	a, (ix+1)
		jr	nc, loc_512
		rrca
		rrca
		ld	e, a
		ld	a, (ix+0Dh)
		add	a, 0B4h
		ld	d, a
		call	sub_E89
		jp	loc_51E
; ---------------------------------------------------------------------------

loc_512:
		rrca
		rrca
		ld	e, a
		ld	a, (ix+0Dh)
		add	a, 0B1h
		ld	d, a
		call	sub_E9C

loc_51E:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		push	hl
		ld	hl, (word_40)
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+2),	l
		ld	(ix+3),	h
		ld	(ix+4),	l
		ld	(ix+5),	h
		ld	hl, (word_40)
		add	hl, de
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	(ix+0Ah), 0
		ld	(ix+0),	0FFh
		pop	hl
		ld	de, 2Ch
		add	ix, de
		pop	de
		djnz	loc_4DA

loc_552:
		ld	ix, byte_178
		ld	(ix+0Dh), 12h
		ld	hl, (word_40)
		ld	de, 3Eh
		add	hl, de
		ld	a, (hl)
		or	a
		jr	z, loc_590
		inc	hl
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_40)
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+2),	l
		ld	(ix+3),	h
		ld	(ix+4),	l
		ld	(ix+5),	h
		ld	hl, (word_40)
		add	hl, de
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	(ix+0Ah), 0
		ld	(ix+0),	0FFh

loc_590:
		ld	a, 9Fh
		call	sub_EAF
		ld	a, 0BFh
		call	sub_EAF
		ld	a, 0DFh
		call	sub_EAF
		ld	a, 0FFh
		call	sub_EAF
		ld	d, 26h
		ld	a, (byte_16)
		ld	e, a
		jp	sub_E89
; End of function sub_48E


; =============== S U B R O U T I N E =======================================


sub_5AD:
		ld	ix, 70h
		ld	b, 6

loc_5B3:
		push	bc
		ld	a, (ix+0)
		or	a
		jr	z, loc_5D9
		ld	a, (ix+9)
		or	(ix+0Eh)
		call	z, sub_66F
		call	sub_69B
		ld	a, (ix+8)
		or	a
		call	z, sub_6E1
		dec	(ix+8)
		dec	(ix+9)
		dec	(ix+11h)
		call	z, sub_5F1

loc_5D9:
		ld	de, 2Ch
		add	ix, de
		pop	bc
		djnz	loc_5B3
		ld	a, (ix+0)
		or	a
		ret	z
		ld	a, (ix+8)
		or	a
		call	z, sub_C35
		dec	(ix+8)
		ret
; End of function sub_5AD


; =============== S U B R O U T I N E =======================================


sub_5F1:
		ld	(ix+10h), 0FFh
		ld	(ix+11h), 1
		dec	(ix+12h)
		ret	nz
		ld	(ix+12h), 6
		ld	a, (ix+13h)
		cp	5
		ret	nc
		inc	(ix+13h)
		ret
; End of function sub_5F1


; =============== S U B R O U T I N E =======================================


sub_60B:
		ld	(ix+1Bh), 0FFh
		ld	(ix+14h), c
		ld	(ix+15h), b
		ld	(ix+11h), 48h
		ld	(ix+12h), 1
		ld	(ix+13h), 0
		ld	(ix+16h), 0
		ld	(ix+1Eh), 0
		ld	(ix+1Fh), 0
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_63C
		ld	d, 28h
		add	a, 0F0h
		ld	e, a
		jp	sub_E89
; ---------------------------------------------------------------------------

loc_63C:
		cp	5
		call	z, sub_64A
		ld	d, 28h
		add	a, 0F1h
		ld	e, a
		jp	sub_E89
; End of function sub_60B

; ---------------------------------------------------------------------------
		ret

; =============== S U B R O U T I N E =======================================


sub_64A:
		push	af
		ld	a, (ix+0Bh)
		and	3
		add	a, 0Ch
		ld	(byte_E), a
		ld	a, (ix+2Bh)
		and	0Fh
		ld	b, a
		ld	a, (ix+2Bh)
		rrca
		rrca
		rrca
		rrca
		and	7
		add	a, a
		add	a, a
		ld	c, a
		add	a, a
		add	a, c
		add	a, b
		ld	(byte_D), a
		pop	af
		ret
; End of function sub_64A


; =============== S U B R O U T I N E =======================================


sub_66F:
		ld	(ix+10h), 0
		ld	(ix+11h), 0
		ld	(ix+1Bh), 0
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_68A
		ld	d, 28h
		ld	e, (ix+0Dh)
		jp	sub_E89
; ---------------------------------------------------------------------------

loc_68A:
		cp	5
		call	z, sub_698
		ld	d, 28h
		ld	e, (ix+0Dh)
		inc	e
		jp	sub_E89
; End of function sub_66F


; =============== S U B R O U T I N E =======================================


sub_698:
		push	af
		pop	af
		ret
; End of function sub_698


; =============== S U B R O U T I N E =======================================


sub_69B:
		ld	a, (ix+1Dh)
		or	a
		ret	z
		ld	e, a
		ld	d, 0
		rlca
		jr	nc, loc_6A8
		ld	d, 0FFh

loc_6A8:
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		add	hl, de
		ld	(ix+1Eh), l
		ld	(ix+1Fh), h
		ld	e, (ix+14h)
		ld	d, (ix+15h)
		add	hl, de
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_6D2
		add	a, 0A4h
		ld	d, a
		ld	e, h
		call	sub_E89
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		jp	sub_E89
; ---------------------------------------------------------------------------

loc_6D2:
		add	a, 0A1h
		ld	d, a
		ld	e, h
		call	sub_E9C
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		jp	sub_E9C
; End of function sub_69B


; =============== S U B R O U T I N E =======================================


sub_6E1:

; FUNCTION CHUNK AT 0B1C SIZE 00000119 BYTES

		ld	a, (ix+0Ch)
		or	a
		jp	nz, loc_8B5
		ld	a, (ix+19h)
		or	a
		jr	z, loc_6F4
		ld	a, (ix+1Ch)
		ld	(ix+0Fh), a

loc_6F4:
		ld	l, (ix+6)
		ld	h, (ix+7)
		ld	a, (hl)
		inc	hl
		cp	0FDh
		jr	nz, loc_758

loc_700:
		ld	a, (ix+0Dh)
		cp	1
		jr	nz, loc_70E
		ld	hl, (word_45)
		inc	hl
		ld	(word_45), hl

loc_70E:
		ld	l, (ix+4)
		ld	h, (ix+5)
		ld	a, (hl)
		inc	hl
		ld	e, a
		cp	0FFh
		jr	nz, loc_743
		cp	(hl)
		jr	nz, loc_743
		ld	a, (byte_44)
		ld	(ix+0),	a
		or	a
		jr	nz, loc_734
		ld	a, (ix+0Dh)
		or	a
		jr	nz, loc_731
		dec	a
		ld	(byte_43), a

loc_731:
		jp	sub_66F
; ---------------------------------------------------------------------------

loc_734:
		ld	l, (ix+2)
		ld	h, (ix+3)
		ld	(ix+4),	l
		ld	(ix+5),	h
		jp	loc_700
; ---------------------------------------------------------------------------

loc_743:
		ld	d, (hl)
		inc	hl
		ld	(ix+4),	l
		ld	(ix+5),	h
		ld	hl, (word_40)
		add	hl, de
		ld	(ix+6),	l
		ld	(ix+7),	h
		jp	loc_6F4
; ---------------------------------------------------------------------------

loc_758:
		ld	c, a
		ld	a, (byte_13)
		cp	42h
		jp	z, loc_7AC
		cp	46h
		jp	z, loc_769

loc_766:
		jp	$
; ---------------------------------------------------------------------------

loc_769:
		ld	a, c
		cp	0DCh
		jp	z, loc_79A
		cp	0ECh
		jp	z, loc_88C
		cp	0EDh
		jp	z, loc_94A
		cp	0EEh
		jp	z, loc_B1C
		cp	0EFh
		jp	z, loc_B6C
		bit	7, a
		jp	z, loc_7C1
		and	7Fh
		push	af
		ld	a, (ix+27h)
		ld	(ix+8),	a
		ld	a, (ix+28h)
		ld	(ix+9),	a
		jp	loc_7DE
; ---------------------------------------------------------------------------

loc_79A:
		ld	a, (hl)
		inc	hl
		push	af
		ld	a, (ix+29h)
		ld	(ix+8),	a
		ld	a, (ix+2Ah)
		ld	(ix+9),	a
		jp	loc_7DE
; ---------------------------------------------------------------------------

loc_7AC:
		ld	a, c
		cp	0E0h
		jp	z, loc_88C
		cp	0E1h
		jp	z, loc_94A
		cp	0E2h
		jp	z, loc_B1C
		cp	0E4h
		jp	z, loc_B6C

loc_7C1:
		push	af
		ld	a, (ix+27h)
		ld	(ix+29h), a
		ld	a, (ix+28h)
		ld	(ix+2Ah), a
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	(ix+27h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+9),	a
		ld	(ix+28h), a

loc_7DE:
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	a, (ix+8)
		or	a
		jr	z, loc_80D
		ld	a, (ix+9)
		or	a
		jr	nz, loc_80D
		ld	(ix+19h), 0
		pop	af
		ld	(ix+20h), 0
		ld	(ix+21h), 0
		ld	(ix+0Eh), 0
		ld	(ix+11h), 0
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ret
; ---------------------------------------------------------------------------

loc_80D:
		pop	af
		ld	(ix+20h), a
		ld	(ix+2Bh), a
		ld	(ix+19h), 0
		push	af
		and	0Fh
		rlca
		ld	e, a
		ld	d, 0
		push	hl
		ld	hl, word_EB7
		add	hl, de
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		pop	hl
		pop	af
		and	70h
		rrca
		or	b
		ld	b, a
		ld	a, (ix+21h)
		xor	(ix+20h)
		ld	a, (ix+20h)
		ld	(ix+21h), a
		jr	nz, loc_844
		ld	a, (ix+0Eh)
		or	(ix+1Bh)
		jr	nz, loc_875

loc_844:
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_860
		ld	a, 0A4h
		add	a, (ix+0Dh)
		ld	d, a
		ld	e, b
		call	sub_E89
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, c
		call	sub_E89
		jp	loc_872
; ---------------------------------------------------------------------------

loc_860:
		ld	a, 0A1h
		add	a, (ix+0Dh)
		ld	d, a
		ld	e, b
		call	sub_E9C
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, c
		call	sub_E9C

loc_872:
		call	sub_60B

loc_875:
		ld	(ix+0Eh), 0
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ld	a, (ix+8)
		cp	(ix+9)
		ret	nz
		ld	(ix+0Eh), 0FFh
		ret
; ---------------------------------------------------------------------------

loc_88C:
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	(ix+9),	0
		ld	a, (hl)
		inc	hl
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	(ix+0Bh), a
		ld	(ix+0Ch), 0FFh
		ld	(ix+10h), 0
		ld	(ix+11h), 0
		ld	(ix+19h), 0
		ld	a, (ix+8)
		or	a
		ret	nz

loc_8B5:
		ld	(ix+0Ch), 0
		ld	l, (ix+0Bh)
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, UniBank
		add	hl, bc
		ld	a, (ix+0Dh)
		cp	3
		jp	nc, loc_90A
		add	a, 0B0h
		ld	d, a
		ld	e, (hl)
		ld	a, e
		push	af
		inc	hl
		call	sub_E89
		ld	a, 30h
		add	a, (ix+0Dh)
		ld	d, a
		ld	b, 4

loc_8E1:
		ld	e, (hl)
		call	sub_E89
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_8E1
		pop	af
		call	sub_9A7
		ld	b, 10h

loc_8F2:
		ld	e, (hl)
		call	sub_E89
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_8F2
		inc	hl
		ld	a, (hl)
		ld	(ix+0Fh), a
		inc	hl
		ld	a, (hl)
		ld	(ix+1Dh), a
		jp	loc_942
; ---------------------------------------------------------------------------

loc_90A:
		add	a, 0ADh
		ld	d, a
		ld	e, (hl)
		ld	a, e
		push	af
		inc	hl
		call	sub_E9C
		ld	a, 2Dh
		add	a, (ix+0Dh)
		ld	d, a
		ld	b, 4

loc_91C:
		ld	e, (hl)
		call	sub_E9C
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_91C
		pop	af
		call	sub_A00
		ld	b, 10h

loc_92D:
		ld	e, (hl)
		call	sub_E9C
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_92D
		inc	hl
		ld	a, (hl)
		ld	(ix+0Fh), a
		inc	hl
		ld	a, (hl)
		ld	(ix+1Dh), a

loc_942:
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ret
; ---------------------------------------------------------------------------

loc_94A:
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	(ix+9),	0
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ah), a
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	a, (byte_49)
		or	a
		ret	nz
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_986
		add	a, 40h
		ld	d, a
		ld	l, (ix+0Bh)
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, UniBank
		add	hl, bc
		ld	a, (hl)
		ld	bc, 5
		add	hl, bc
		call	sub_9A7
		jp	loc_99F
; ---------------------------------------------------------------------------

loc_986:
		add	a, 3Dh
		ld	d, a
		ld	l, (ix+0Bh)
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, UniBank
		add	hl, bc
		ld	a, (hl)
		ld	bc, 5
		add	hl, bc
		call	sub_A00

loc_99F:
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ret
; End of function sub_6E1


; =============== S U B R O U T I N E =======================================


sub_9A7:
		push	hl
		and	7
		ld	c, a
		ld	b, 0
		ld	hl, byte_EF3
		add	hl, bc
		ld	a, (hl)
		ld	(ix+22h), a
		pop	hl
		exx
		push	ix
		pop	hl
		ld	de, 23h
		add	hl, de
		exx
		ld	b, 4

loc_9C1:
		push	bc
		ld	e, (hl)
		rrca
		push	af
		jr	nc, loc_9EE
		ld	a, (ix+0Ah)
		and	78h
		srl	e
		srl	e
		srl	e
		srl	e
		add	a, e
		ld	c, a
		ld	b, 0
		push	hl
		ld	hl, byte_EFB
		add	hl, bc
		ld	e, (hl)
		pop	hl
		ld	a, 12h
		add	a, e
		ld	e, a
		ld	a, (byte_49)
		add	a, e
		ld	e, a
		cp	80h
		jr	c, loc_9EE
		ld	e, 7Fh

loc_9EE:
		ld	a, e
		exx
		ld	(hl), a
		inc	hl
		exx
		call	sub_E89
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		pop	af
		pop	bc
		djnz	loc_9C1
		ret
; End of function sub_9A7


; =============== S U B R O U T I N E =======================================


sub_A00:
		push	hl
		and	7
		ld	c, a
		ld	b, 0
		ld	hl, byte_EF3
		add	hl, bc
		ld	a, (hl)
		ld	(ix+22h), a
		pop	hl
		exx
		push	ix
		pop	hl
		ld	de, 23h
		add	hl, de
		exx
		ld	b, 4

loc_A1A:
		push	bc
		ld	e, (hl)
		rrca
		push	af
		jr	nc, loc_A47
		ld	a, (ix+0Ah)
		and	78h
		srl	e
		srl	e
		srl	e
		srl	e
		add	a, e
		ld	c, a
		ld	b, 0
		push	hl
		ld	hl, byte_EFB
		add	hl, bc
		ld	e, (hl)
		pop	hl
		ld	a, 12h
		add	a, e
		ld	e, a
		ld	a, (byte_49)
		add	a, e
		ld	e, a
		cp	80h
		jr	c, loc_A47
		ld	e, 7Fh

loc_A47:
		ld	a, e
		exx
		ld	(hl), a
		inc	hl
		exx
		call	sub_E9C
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		pop	af
		pop	bc
		djnz	loc_A1A
		ret
; End of function sub_A00


; =============== S U B R O U T I N E =======================================


sub_A59:
		ld	a, (byte_49)
		or	a
		ret	z
		ld	a, (byte_4B)
		ld	b, a
		ld	a, (byte_4A)
		inc	a
		inc	a
		and	b
		ld	(byte_4A), a
		ret	nz
		ld	ix, 70h
		ld	b, 6

loc_A72:
		push	bc
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_A83
		add	a, 40h
		ld	d, a
		call	sub_AC6
		jp	loc_A89
; ---------------------------------------------------------------------------

loc_A83:
		add	a, 3Dh
		ld	d, a
		call	sub_AF1

loc_A89:
		ld	de, 2Ch
		add	ix, de
		pop	bc
		djnz	loc_A72
		ld	a, (byte_49)
		inc	a
		ld	(byte_49), a
		cp	10h
		ret	c
		ld	a, 1
		ld	(byte_4B), a
		xor	a
		ld	(byte_DD9), a
		ld	(byte_178), a
		ld	a, 9Fh
		call	sub_EAF
		ld	a, 0FFh
		call	sub_EAF
		ld	a, (byte_49)
		cp	20h
		ret	c
		ld	a, 1
		ld	(byte_4B), a
		ld	a, (byte_49)
		cp	80h
		ret	c
		ld	(byte_43), a
		ret
; End of function sub_A59


; =============== S U B R O U T I N E =======================================


sub_AC6:
		ld	a, (ix+22h)
		push	ix
		pop	hl
		ld	bc, 23h
		add	hl, bc
		ld	b, 4

loc_AD2:
		push	bc
		ld	e, (hl)
		rrca
		push	af
		jr	nc, loc_AE3
		ld	a, (byte_49)
		add	a, e
		ld	e, a
		cp	80h
		jr	c, loc_AE3
		ld	e, 7Fh

loc_AE3:
		ld	a, e
		call	sub_E89
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		pop	af
		pop	bc
		djnz	loc_AD2
		ret
; End of function sub_AC6


; =============== S U B R O U T I N E =======================================


sub_AF1:
		ld	a, (ix+22h)
		push	ix
		pop	hl
		ld	bc, 23h
		add	hl, bc
		ld	b, 4

loc_AFD:
		push	bc
		ld	e, (hl)
		rrca
		push	af
		jr	nc, loc_B0E
		ld	a, (byte_49)
		add	a, e
		ld	e, a
		cp	80h
		jr	c, loc_B0E
		ld	e, 7Fh

loc_B0E:
		ld	a, e
		call	sub_E9C
		inc	hl
		inc	d
		inc	d
		inc	d
		inc	d
		pop	af
		pop	bc
		djnz	loc_AFD
		ret
; End of function sub_AF1

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_6E1

loc_B1C:
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	(ix+9),	0
		ld	a, (hl)
		inc	hl
		ld	(ix+1),	a
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	a, (ix+0Dh)
		cp	5
		jr	z, loc_B61
		cp	3
		ld	a, (ix+1)
		jr	nc, loc_B4D
		rrca
		rrca
		ld	e, a
		ld	a, (ix+0Dh)
		add	a, 0B4h
		ld	d, a
		call	sub_E89
		jp	loc_B59
; ---------------------------------------------------------------------------

loc_B4D:
		rrca
		rrca
		ld	e, a
		ld	a, (ix+0Dh)
		add	a, 0B1h
		ld	d, a
		call	sub_E9C

loc_B59:
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ret
; ---------------------------------------------------------------------------

loc_B61:
		ld	a, (ix+1)
		rrca
		rrca
		ld	(byte_F), a
		jp	loc_B59
; ---------------------------------------------------------------------------

loc_B6C:
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	b, (hl)
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	(ix+6),	l
		ld	(ix+7),	h
		ld	a, (ix+0Fh)
		ld	(ix+1Ch), a
		ld	(ix+0Fh), 0
		ld	(ix+10h), 0
		ld	(ix+11h), 0
		ld	(ix+0Eh), 0
		ld	a, (ix+19h)
		or	a
		jr	nz, loc_BC4
		inc	(ix+9)
		ld	hl, word_EB7
		ld	a, (ix+20h)
		and	0Fh
		rlca
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		dec	hl
		bit	7, c
		jr	nz, loc_BB6
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		jp	loc_BBA
; ---------------------------------------------------------------------------

loc_BB6:
		dec	hl
		dec	hl
		dec	hl
		dec	hl

loc_BBA:
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		or	a
		sbc	hl, de
		ld	(ix+1Ah), l

loc_BC4:
		ld	a, c
		or	b
		jr	z, loc_BCC
		ld	(ix+19h), 0FFh

loc_BCC:
		ld	e, (ix+1Ah)
		ld	d, 0
		bit	7, c
		jr	z, loc_BDB
		ld	d, 0FFh
		ld	a, b
		neg
		ld	b, a

loc_BDB:
		ld	hl, 0
		ld	a, b
		or	a
		jr	z, loc_BE5

loc_BE2:
		add	hl, de
		djnz	loc_BE2

loc_BE5:
		ex	de, hl
		sra	d
		rr	e
		sra	d
		rr	e
		sra	d
		rr	e
		sra	d
		rr	e
		sra	d
		rr	e
		sra	d
		rr	e
		ld	l, (ix+14h)
		ld	h, (ix+15h)
		add	hl, de
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_C1E
		add	a, 0A4h
		ld	d, a
		ld	e, h
		call	sub_E89
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		call	sub_E89
		jp	loc_C2D
; ---------------------------------------------------------------------------

loc_C1E:
		add	a, 0A1h
		ld	d, a
		ld	e, h
		call	sub_E9C
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		call	sub_E9C

loc_C2D:
		ld	a, (ix+8)
		or	a
		jp	z, loc_6F4
		ret
; END OF FUNCTION CHUNK	FOR sub_6E1

; =============== S U B R O U T I N E =======================================


sub_C35:
		ld	l, (ix+6)
		ld	h, (ix+7)
		ld	a, (hl)
		inc	hl
		cp	0FDh
		jr	nz, loc_C7D

loc_C41:
		ld	l, (ix+4)
		ld	h, (ix+5)
		ld	a, (hl)
		inc	hl
		ld	e, a
		cp	0FFh
		jr	nz, loc_C68
		cp	(hl)
		jr	nz, loc_C68
		ld	a, (byte_44)
		ld	(ix+0),	a
		or	a
		ret	z
		ld	l, (ix+2)
		ld	h, (ix+3)
		ld	(ix+4),	l
		ld	(ix+5),	h
		jp	loc_C41
; ---------------------------------------------------------------------------

loc_C68:
		ld	d, (hl)
		inc	hl
		ld	(ix+4),	l
		ld	(ix+5),	h
		ld	hl, (word_40)
		add	hl, de
		ld	(ix+6),	l
		ld	(ix+7),	h
		jp	sub_C35
; ---------------------------------------------------------------------------

loc_C7D:
		or	a
		jr	z, loc_CA9
		push	hl
		ld	e, a
		ld	a, (byte_C)
		or	a
		jr	nz, loc_C8C
		ld	a, e
		ld	(byte_397), a

loc_C8C:
		ld	a, e
		rlca
		ld	e, a
		ld	d, 0
		ld	hl, byte_F79
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	(ix+15h), a
		ld	a, (hl)
		ld	(ix+16h), a
		pop	hl
		ld	a, 1
		ld	(ix+9),	a
		ld	a, 0FFh
		ld	(byte_DD9), a

loc_CA9:
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		ld	(ix+6),	l
		ld	(ix+7),	h
		ret
; End of function sub_C35

; ---------------------------------------------------------------------------
		ld	ix, byte_178
		ld	a, (byte_DD9)
		or	a
		ret	z
		dec	(ix+9)
		jp	z, loc_D29
		ld	hl, (word_DDA)
		ld	b, 0
		ld	a, (byte_DE2)
		bit	7, a
		jr	z, loc_CD2
		ld	b, 0FFh

loc_CD2:
		ld	c, a
		add	hl, bc
		ld	a, h
		and	3
		ld	h, a
		ld	(word_DDA), hl
		ld	a, l
		and	0Fh
		or	80h
		call	sub_EAF
		srl	h
		rr	l
		srl	h
		rr	l
		srl	h
		rr	l
		srl	h
		rr	l
		ld	a, l
		and	3Fh
		call	sub_EAF
		ld	a, (byte_DE0)
		bit	3, a
		jr	z, loc_D02
		or	0F0h

loc_D02:
		ld	b, a
		ld	a, (byte_DDE)
		sub	b
		and	0Fh
		ld	(byte_DDE), a
		or	90h
		call	sub_EAF
		ld	a, (byte_DE1)
		bit	3, a
		jr	z, loc_D1A
		or	0F0h

loc_D1A:
		ld	b, a
		ld	a, (byte_DDF)
		sub	b
		and	0Fh
		ld	(byte_DDE), a
		or	0F0h
		jp	sub_EAF
; ---------------------------------------------------------------------------

loc_D29:
		ld	l, (ix+15h)
		ld	h, (ix+16h)
		ld	a, (hl)
		inc	hl
		ld	(ix+9),	a
		or	a
		jr	nz, loc_D45
		xor	a
		ld	(byte_DD9), a
		ld	a, 9Fh
		call	sub_EAF
		ld	a, 0FFh
		jp	sub_EAF
; ---------------------------------------------------------------------------

loc_D45:
		ld	a, (hl)
		inc	hl
		ld	(byte_DE2), a
		ld	b, (hl)
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	(word_DDA), bc
		ld	a, c
		and	0Fh
		or	80h
		call	sub_EAF
		srl	b
		rr	c
		srl	b
		rr	c
		srl	b
		rr	c
		srl	b
		rr	c
		ld	a, c
		and	3Fh
		call	sub_EAF
		ld	b, (hl)
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	(word_DDC), bc
		ld	a, c
		and	0Fh
		or	0C0h
		call	sub_EAF
		srl	b
		rr	c
		srl	b
		rr	c
		srl	b
		rr	c
		srl	b
		rr	c
		ld	a, c
		and	3Fh
		call	sub_EAF
		ld	b, (hl)
		srl	b
		srl	b
		srl	b
		srl	b
		ld	a, 0Fh
		sub	b
		ld	(byte_DDE), a
		or	90h
		call	sub_EAF
		ld	a, 0E7h
		call	sub_EAF
		ld	a, (hl)
		inc	hl
		and	0Fh
		ld	b, a
		ld	a, 0Fh
		sub	b
		ld	(byte_DDF), a
		or	0F0h
		call	sub_EAF
		ld	a, (hl)
		srl	a
		srl	a
		srl	a
		srl	a
		ld	(byte_DE0), a
		ld	a, (hl)
		inc	hl
		and	0Fh
		ld	(byte_DE1), a
		ld	(ix+15h), l
		ld	(ix+16h), h
		ret
; ---------------------------------------------------------------------------
byte_DD9:	db 0
word_DDA:	dw 0
word_DDC:	dw 0
byte_DDE:	db 0
byte_DDF:	db 0
byte_DE0:	db 0
byte_DE1:	db 0
byte_DE2:	db 0

; =============== S U B R O U T I N E =======================================


sub_DE3:
		ld	ix, 70h
		ld	b, 6

loc_DE9:
		ld	a, (ix+10h)
		or	a
		jr	nz, loc_DFE
		ld	a, (ix+0Fh)
		or	a
		jr	z, loc_E51
		ld	hl, byte_E81
		ld	e, (ix+16h)
		jp	loc_E0C
; ---------------------------------------------------------------------------

loc_DFE:
		ld	a, (ix+16h)
		ld	c, a
		rlca
		rlca
		add	a, c
		add	a, (ix+13h)
		ld	e, a
		ld	hl, locret_E58

loc_E0C:
		ld	d, 0
		add	hl, de
		ld	e, (hl)
		bit	7, e
		jr	z, loc_E16
		ld	d, 0FFh

loc_E16:
		ld	l, (ix+14h)
		ld	h, (ix+15h)
		add	hl, de
		ld	a, (ix+0Dh)
		cp	3
		jr	nc, loc_E36
		add	a, 0A4h
		ld	d, a
		ld	e, h
		call	sub_E89
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		call	sub_E89
		jp	loc_E45
; ---------------------------------------------------------------------------

loc_E36:
		add	a, 0A1h
		ld	d, a
		ld	e, h
		call	sub_E9C
		dec	d
		dec	d
		dec	d
		dec	d
		ld	e, l
		call	sub_E9C

loc_E45:
		ld	a, (ix+16h)
		inc	a
		cp	8
		jr	c, loc_E4E
		xor	a

loc_E4E:
		ld	(ix+16h), a

loc_E51:
		ld	de, 2Ch
		add	ix, de
		djnz	loc_DE9

locret_E58:
		ret
; End of function sub_DE3

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    2
		db    3
		db    6
		db    2
		db    2
		db    4
		db    6
		db  0Ch
		db    1
		db    1
		db    2
		db    3
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db 0FEh
		db 0FDh
		db 0FAh
		db 0FEh
		db 0FEh
		db 0FCh
		db 0FAh
		db 0F4h
		db 0FFh
		db 0FFh
		db 0FEh
		db 0FDh
		db 0FAh
byte_E81:	db 0
		db 1
		db 2
		db 1
		db 0
		db 0FFh
		db 0FEh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_E89:
		ld	a, (4000h)
		rlca
		jr	c, sub_E89
		ld	a, d
		ld	(4000h), a
		nop
		nop
		nop
		nop
		ld	a, e
		ld	(4001h), a
		ret
; End of function sub_E89

; =============== S U B R O U T I N E =======================================

sub_E9C:
		ld	a, (4000h)
		rlca
		jr	c, sub_E9C
		ld	a, d
		ld	(4002h), a
		nop
		nop
		nop
		nop
		ld	a, e
		ld	(4003h), a
		ret
; End of function sub_E9C

; =============== S U B R O U T I N E =======================================

sub_EAF:
		ld	(7F11h), a
		ret
; End of function sub_EAF
; ---------------------------------------------------------------------------
		dw 227h
		dw 247h
word_EB7:
		dw 26Ah
		dw 28Fh
		dw 2B6h
		dw 2DFh
		dw 30Bh
		dw 339h
		dw 36Ah
		dw 39Eh
		dw 3D5h
		dw 410h
		dw 44Eh
		dw 48Fh
		dw 4D4h
		dw 51Eh
		dw 3B0Fh
		dw 3809h
		dw 3505h
		dw 3206h
		dw 2F0Ah
		dw 2C0Eh
		dw 2A06h
		dw 2800h
		dw 250Ch
		dw 230Ah
		dw 210Ah
		dw 1F0Ch
		dw 1D0Fh
		dw 1C04h
		dw 1A0Bh
		dw 1903h
byte_EF3:	db 8, 8, 8, 8, 0Ch, 0Eh, 0Eh, 0Fh
byte_EFB:	db 7Fh
		db  7Fh
		db  7Fh
		db  7Fh
		db  7Fh
		db  7Fh
		db  7Fh
		db  7Fh
		db  20h
		db  21h
		db  22h
		db  25h
		db  29h
		db  2Dh
		db  4Bh
		db  7Fh
		db  18h
		db  1Ah
		db  1Ch
		db  1Fh
		db  23h
		db  29h
		db  45h
		db  7Fh
		db  10h
		db  13h
		db  17h
		db  19h
		db  1Eh
		db  26h
		db  40h
		db  7Fh
		db  0Dh
		db  0Fh
		db  13h
		db  15h
		db  1Ah
		db  23h
		db  3Ch
		db  7Fh
		db  0Ah
		db  0Ch
		db  0Eh
		db  11h
		db  16h
		db  20h
		db  38h
		db  7Fh
		db    8
		db  0Ah
		db  0Ch
		db  0Eh
		db  13h
		db  1Eh
		db  34h
		db  7Fh
		db    7
		db    8
		db    9
		db  0Bh
		db  10h
		db  1Ch
		db  30h
		db  7Fh
		db    6
		db    7
		db    8
		db    9
		db  0Eh
		db  1Ah
		db  2Dh
		db  7Fh
		db    5
		db    6
		db    7
		db    8
		db  0Dh
		db  18h
		db  2Ah
		db  7Fh
		db    4
		db    5
		db    5
		db    7
		db  0Ch
		db  16h
		db  28h
		db  7Fh
		db    3
		db    4
		db    4
		db    7
		db  0Bh
		db  14h
		db  26h
		db  7Fh
		db    2
		db    3
		db    4
		db    6
		db  0Ah
		db  13h
		db  24h
		db  7Fh
		db    2
		db    2
		db    3
		db    6
		db    9
		db  12h
		db  22h
		db  7Fh
		db    1
		db    2
		db    3
		db    5
		db    9
		db  11h
		db  21h
		db  7Fh
		db    1
		db    1
		db    2
		db    4
		db    8
		db  10h
byte_F79:	db 20h
		db 7Fh
		db 0
byte_F7C:	db 0
word_F7D:	dw 0
byte_F7F:	db 0
word_F80:	dw 0
word_F82:	dw 0
byte_F84:	db 0
word_F85:	dw 0
byte_F87:	db 0
byte_F88:	db 0
byte_F89:	db 0
byte_F8A:	db 0
byte_F8B:	db 0
byte_F8C:	db 0
byte_F8D:	db 8
		db 8
		db 8
		db 8
		db 0Ch
		db 0Eh
		db 0Eh
		db 0Fh

; =============== S U B R O U T I N E =======================================


sub_F95:
		ld	(word_F80), hl
		ld	(word_F82), de
		xor	a
		ld	(byte_F7C), a
		ret
; End of function sub_F95


; =============== S U B R O U T I N E =======================================


sub_FA1:
		ld	(byte_F84), a
		add	a, a
		ld	d, 0
		ld	e, a
		ld	hl, (word_F80)
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_F80)
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	(word_F7D), hl
		call	sub_1031
		ld	hl, 0
		ld	(word_F85), hl
		xor	a
		ld	(byte_F7F), a
		ld	(byte_F8C), a
		cpl
		ld	(byte_F7C), a
		ret
; End of function sub_FA1


; =============== S U B R O U T I N E =======================================


sub_FCD:
		ld	a, (byte_F7C)
		or	a
		ret	z
		ld	a, (byte_F7F)
		or	a
		jp	nz, loc_FF3

loc_FD9:
		call	sub_1125
		ld	hl, (word_F7D)
		ld	a, (hl)
		cp	0FFh
		call	z, sub_1020
		inc	hl
		ld	(byte_F7F), a
		or	a
		jp	z, loc_FFB
		call	sub_1098
		call	sub_1119

loc_FF3:
		ld	a, (byte_F7F)
		dec	a
		ld	(byte_F7F), a

locret_FFA:
		ret
; ---------------------------------------------------------------------------

loc_FFB:
		ld	hl, (word_F85)
		ld	a, h
		or	l
		jp	nz, loc_1017
		xor	a
		ld	(byte_F7C), a
		cpl
		ld	(byte_F8C), a
		ld	a, (byte_F89)
		ld	a, (byte_F8A)
		ld	a, (byte_F8B)
		jp	locret_FFA
; ---------------------------------------------------------------------------

loc_1017:
		ld	hl, (word_F85)
		ld	(word_F7D), hl
		jp	loc_FD9
; End of function sub_FCD


; =============== S U B R O U T I N E =======================================


sub_1020:
		ld	de, 7
		add	hl, de
		ld	(word_F85), hl
		ld	a, (hl)
		or	a
		ret	nz
		ld	(byte_F7C), a
		pop	af
		jp	locret_FFA
; End of function sub_1020


; =============== S U B R O U T I N E =======================================


sub_1031:
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	de, (word_F82)
		add	hl, de
		ld	c, (hl)
		inc	hl
		ld	a, (byte_F87)
		add	a, 30h
		ld	d, a
		ld	b, 8

loc_1048:
		ld	e, (hl)
		inc	hl
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_1048
		ld	b, 4

loc_1055:
		ld	e, (hl)
		inc	hl
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_1055
		ld	b, 4

loc_1062:
		ld	e, (hl)
		set	7, e
		inc	hl
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_1062
		ld	b, 8

loc_1071:
		ld	e, (hl)
		inc	hl
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_1071
		ld	a, (byte_F87)
		add	a, 0B0h
		ld	d, a
		ld	e, c
		call	sub_1095
		ld	a, c
		and	7
		ld	c, a
		ld	b, 0
		ld	hl, byte_F8D
		add	hl, bc
		ld	a, (hl)
		ld	(byte_F88), a
		ret
; End of function sub_1031


; =============== S U B R O U T I N E =======================================

; Attributes: thunk

sub_1095:
		jp	sub_E89
; End of function sub_1095


; =============== S U B R O U T I N E =======================================


sub_1098:
		ld	a, (byte_F87)
		ld	c, a
		ld	b, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	a, 0A4h
		add	a, c
		ld	d, a
		call	sub_1095
		ld	e, b
		ld	a, 0A0h
		add	a, c
		ld	d, a
		call	sub_1095
		ld	a, (hl)
		inc	hl
		ld	e, a
		ld	a, 90h
		add	a, c
		ld	d, a
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		call	sub_1095
		inc	d
		inc	d
		inc	d
		inc	d
		call	sub_1095
		ld	a, (hl)
		push	af
		inc	hl
		rrca
		rrca
		rrca
		rrca
		and	7
		or	8
		ld	e, a
		ld	d, 22h
		call	sub_1095
		pop	af
		and	7
		ld	e, a
		ld	a, (hl)
		inc	hl
		and	3
		rlca
		rlca
		rlca
		rlca
		or	e
		or	0C0h
		ld	e, a
		ld	a, 0B4h
		add	a, c
		ld	d, a
		call	sub_1095
		ld	a, (hl)
		inc	hl
		ld	(word_F7D), hl
		call	sub_10FF
		ret
; End of function sub_1098


; =============== S U B R O U T I N E =======================================


sub_10FF:
		ld	e, a
		ld	a, c
		add	a, 40h
		ld	d, a
		ld	a, (byte_F88)
		ld	c, a
		ld	b, 4

loc_110A:
		rrc	c
		jp	nc, loc_1112
		call	sub_1095

loc_1112:
		inc	d
		inc	d
		inc	d
		inc	d
		djnz	loc_110A
		ret
; End of function sub_10FF


; =============== S U B R O U T I N E =======================================


sub_1119:
		ld	d, 28h
		ld	a, (byte_F87)
		add	a, 0F0h
		ld	e, a
		call	sub_1095
		ret
; End of function sub_1119

; =============== S U B R O U T I N E =======================================

sub_1125:
		ld	d, 28h
		ld	a, (byte_F87)
		ld	e, a
		call	sub_1095
		ret
; End of function sub_1125
; ---------------------------------------------------------------------------

SamplesIndex:
		db Samples_Bank_Offset,	0, 0, 80h
		db Samples_Bank_Offset,	1, 0, 80h
		db Samples_Bank_Offset,	2, 0, 80h
		db Samples_Bank_Offset,	3, 0, 80h
		db Samples_Bank_Offset,	4, 0, 80h
		db 0, 0, 0, 0
		db Samples_Bank_Offset,	5, 0, 80h
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
		db 0, 0, 0, 0
byte_1173:
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0EEh
		db 0E1h
		db 0D3h
		db 0C6h
		db 0B3h
		db 0AAh
		db  9Ch
		db  95h
		db  88h
		db  7Eh
		db  76h
		db  6Dh
		db  64h
		db  5Eh
		db  56h
		db  4Fh
		db  4Bh
		db  45h
		db  41h
		db  3Bh
		db  36h
		db  31h
		db  2Eh
		db  2Ah
		db  26h
		db  23h
		db  20h
		db  1Ch
		db  1Ah
		db  17h
		db  14h
		db  12h
		db  10h
		db  0Eh
		db  0Ch
		db  0Ah
		db    8
		db    7
		db    5
		db    4
		db    2
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
MusicIndex:
		db 0, Music_Bank_Offset
		db 1, Music_Bank_Offset
		db 2, Music_Bank_Offset
		db 3, Music_Bank_Offset
		db 4, Music_Bank_Offset
		db 5, Music_Bank_Offset
		db 6, Music_Bank_Offset
		db 7, Music_Bank_Offset
		db 8, Music_Bank_Offset
		db 9, Music_Bank_Offset
		db 0Ah,	Music_Bank_Offset
		db 0Bh,	Music_Bank_Offset
		db 0Ch,	Music_Bank_Offset
		db 0Dh,	Music_Bank_Offset
		db 0Eh,	Music_Bank_Offset
		db 0Fh,	Music_Bank_Offset
		db 10h,	Music_Bank_Offset
		db 0, Music_Bank2_Offset
		db 1, Music_Bank2_Offset
		db 2, Music_Bank2_Offset
		db 3, Music_Bank2_Offset
		db 4, Music_Bank2_Offset
		db 5, Music_Bank2_Offset
		db 6, Music_Bank2_Offset
		db 7, Music_Bank2_Offset
		db 8, Music_Bank2_Offset
		db 9, Music_Bank2_Offset
		db 0Ah, Music_Bank2_Offset
		db 0Bh, Music_Bank2_Offset
		db 0Ch, Music_Bank2_Offset
		db 0Dh, Music_Bank2_Offset
		db 0Eh, Music_Bank2_Offset
		db 0Fh, Music_Bank2_Offset
		db 010h, Music_Bank2_Offset
		db 011h, Music_Bank2_Offset
		dw 0FFh
		dw 0FFh
word_1241:
		dw 80h
		dw 0DDh
		dw 0F4h
		dw 119h
		dw 129h
		dw 155h
		dw 15Eh
		dw 167h
		dw 170h
		dw 1C6h
		dw 21Ch
		dw 29Ch
		dw 2E4h
		dw 2FBh
		dw 312h
		dw 353h
		dw 37Fh
		dw 3C0h
		dw 416h
		dw 45Eh
		dw 49Fh
		dw 4CBh
		dw 4E2h
		dw 507h
		dw 572h
		dw 57Bh
		dw 5A0h
		dw 5B7h
		dw 5F1h
		dw 65Ch
		dw 67Ah
		dw 6D7h
		dw 6FCh
		dw 759h
		dw 785h
		dw 7BFh
		dw 7D6h
		dw 7D8h
		dw 7DAh
		dw 7DCh
		dw 7DEh
		dw 7E0h
		dw 7E2h
		dw 7E4h
		dw 7E6h
		dw 7E8h
		dw 7EAh
		dw 7ECh
		dw 7EEh
		dw 7F0h
		dw 7F9h
		dw 7FBh
		dw 7FDh
		dw 7FFh
		dw 801h
		dw 803h
		dw 805h
		dw 807h
		dw 809h
		dw 80Bh
		dw 80Dh
		dw 80Fh
		dw 811h
		dw 813h
		db 0
		db 0A1h
		db  4Ch
		db    4
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db  4Ch
		db    4
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db  4Ch
		db    4
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db  4Ch
		db    4
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    5
		db 0E8h
		db    3
		db    1
		db  77h
		db    7
		db    0
		db    0
		db    9
		db    3
		db    4
		db  10h
		db    0
		db  66h
		db    7
		db  21h
		db    2
		db 0E4h
		db  0Ch
		db    0
		db    7
		db    7
		db  7Fh
		db    3
		db 0CCh
		db  10h
		db    0
		db  66h
		db    7
		db  21h
		db    0
		db  1Eh
		db    2
		db 0CCh
		db  10h
		db    0
		db  76h
		db    7
		db  0Fh
		db    2
		db 0CCh
		db  10h
		db    0
		db  76h
		db    7
		db  19h
		db    2
		db 0CCh
		db  10h
		db    0
		db  76h
		db    7
		db  23h
		db    2
		db 0CCh
		db  10h
		db    0
		db  76h
		db    7
		db  2Dh
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db    9
		db    1
		db  88h
		db  13h
		db    8
		db  77h
		db    0
		db  10h
		db    1
		db  97h
		db  11h
		db    0
		db  77h
		db    0
		db  10h
		db    0
		db    9
		db    1
		db 0E8h
		db    3
		db    0
		db  77h
		db    7
		db  0Fh
		db    1
		db    0
		db    0
		db    0
		db  77h
		db    7
		db  7Fh
		db    1
		db 0E8h
		db    3
		db    0
		db  77h
		db    7
		db  0Fh
		db    1
		db 0B8h
		db  0Bh
		db    0
		db  77h
		db    7
		db  0Fh
		db    1
		db 0D0h
		db    7
		db    0
		db  77h
		db    7
		db  0Fh
		db  1Eh
		db 0B8h
		db  0Bh
		db    0
		db  77h
		db    7
		db  0Fh
		db    0
		db  0Ah
		db  96h
		db  80h
		db  0Ch
		db    2
		db  77h
		db    7
		db  0Ah
		db    0
		db    3
		db  96h
		db  4Ch
		db    4
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db  0Ch
		db  96h
		db 0E8h
		db    3
		db    0
		db  40h
		db    1
		db  0Ah
		db    0
		db    5
		db    1
		db  80h
		db  3Eh
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db 0B0h
		db  36h
		db    0
		db    0
		db    0
		db  7Fh
		db    1
		db  80h
		db  3Eh
		db    0
		db  37h
		db    0
		db  0Ah
		db    1
		db 0B0h
		db  36h
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db  80h
		db  3Eh
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db 0B0h
		db  36h
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db  80h
		db  3Eh
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db 0B0h
		db  36h
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db  98h
		db  3Ah
		db    0
		db  27h
		db    0
		db  0Ah
		db    1
		db 0E0h
		db  2Eh
		db    0
		db  37h
		db    0
		db  0Ah
		db    1
		db  98h
		db  3Ah
		db    0
		db  27h
		db    0
		db  0Ah
		db    5
		db  80h
		db  3Eh
		db    0
		db  27h
		db    0
		db  0Ah
		db    0
		db  0Bh
		db    2
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db  0Ah
		db  20h
		db  1Ch
		db    7
		db  73h
		db    7
		db  0Fh
		db    1
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db  0Ah
		db  20h
		db  1Ch
		db    7
		db  73h
		db    7
		db  0Fh
		db    1
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db  0Ah
		db  20h
		db  1Ch
		db    7
		db  73h
		db    7
		db  0Fh
		db    1
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db  0Ah
		db  20h
		db  1Ch
		db    7
		db  73h
		db    7
		db  0Fh
		db    1
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db  0Ah
		db  20h
		db  1Ch
		db    7
		db  73h
		db    7
		db  0Fh
		db    1
		db  20h
		db  1Ch
		db    8
		db  73h
		db    7
		db  0Fh
		db    1
		db 0E8h
		db    3
		db    0
		db  60h
		db    0
		db  7Fh
		db    0
		db    9
		db    2
		db  6Ch
		db  20h
		db    0
		db  67h
		db    7
		db  28h
		db    2
		db  3Ah
		db  20h
		db    0
		db  67h
		db    7
		db  23h
		db    2
		db    8
		db  20h
		db    0
		db  67h
		db    7
		db  1Eh
		db    2
		db 0D6h
		db  1Fh
		db    0
		db  67h
		db    7
		db  19h
		db    2
		db 0A4h
		db  1Fh
		db    0
		db  67h
		db    7
		db  14h
		db    2
		db  72h
		db  1Fh
		db    0
		db  67h
		db    7
		db  0Fh
		db    2
		db  40h
		db  1Fh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db  0Eh
		db  1Fh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db 0DCh
		db  1Eh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db 0AAh
		db  1Eh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db  78h
		db  1Eh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db  46h
		db  1Eh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db  14h
		db  1Eh
		db    0
		db  67h
		db    7
		db  0Ah
		db    2
		db 0E2h
		db  1Dh
		db    0
		db  67h
		db    7
		db  0Ah
		db    3
		db 0B0h
		db  1Dh
		db    0
		db  67h
		db    7
		db  0Ah
		db    3
		db  7Eh
		db  1Dh
		db    0
		db  67h
		db    7
		db  0Ah
		db    3
		db  4Ch
		db  1Dh
		db    0
		db  67h
		db    7
		db  0Ah
		db    7
		db  1Ah
		db  1Dh
		db    0
		db  67h
		db    7
		db  0Ah
		db    0
		db    9
		db    3
		db  40h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  40h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  54h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  68h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  7Ch
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  90h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0A4h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0B8h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0CCh
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db    9
		db    2
		db 0E8h
		db    3
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0E8h
		db    3
		db    0
		db    0
		db    0
		db  7Fh
		db  28h
		db 0E8h
		db    3
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db    9
		db    3
		db  80h
		db  0Ch
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  88h
		db  13h
		db    0
		db  77h
		db    7
		db  7Fh
		db  19h
		db  80h
		db  0Ch
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db  12h
		db    3
		db 0FCh
		db  30h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0E0h
		db  2Eh
		db    0
		db  77h
		db    7
		db  7Fh
		db    2
		db  64h
		db  32h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db    0
		db  32h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  9Ch
		db  31h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  38h
		db  31h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0D4h
		db  30h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  70h
		db  30h
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  3Eh
		db  30h
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db    2
		db    1
		db 0F8h
		db  11h
		db    0
		db  77h
		db    7
		db  0Dh
		db    2
		db  5Ch
		db  12h
		db    0
		db  77h
		db    7
		db  0Dh
		db    1
		db 0C0h
		db  12h
		db    0
		db  77h
		db    7
		db  0Dh
		db    2
		db  24h
		db  13h
		db    0
		db  77h
		db    7
		db  17h
		db    1
		db  24h
		db  13h
		db    0
		db  77h
		db    7
		db  21h
		db    2
		db  24h
		db  13h
		db    0
		db  77h
		db    7
		db  7Fh
		db    0
		db    9
		db    2
		db 0F8h
		db  2Ah
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  5Ch
		db  2Bh
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0C0h
		db  2Bh
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  24h
		db  2Ch
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  88h
		db  2Ch
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0ECh
		db  2Ch
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  50h
		db  2Dh
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db 0B4h
		db  2Dh
		db    0
		db  77h
		db    7
		db  0Ah
		db    2
		db  18h
		db  2Eh
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db    9
		db    3
		db  28h
		db  23h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0C4h
		db  22h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  60h
		db  22h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0FFh
		db  21h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  98h
		db  21h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  34h
		db  21h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0D0h
		db  20h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  6Ch
		db  20h
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db    8
		db  20h
		db  0Fh
		db  77h
		db    7
		db  0Ah
		db    3
		db 0A4h
		db  1Fh
		db    0
		db  77h
		db    7
		db  0Ah
		db    1
		db  40h
		db  1Fh
		db    0
		db  77h
		db    0
		db  7Fh
		db    3
		db  40h
		db  1Fh
		db    0
		db  77h
		db    0
		db    0
		db    0
		db    9
		db    3
		db  28h
		db  23h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db  8Ch
		db  23h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db 0F0h
		db  23h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db  54h
		db  24h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db 0B8h
		db  24h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db  1Ch
		db  25h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db  80h
		db  25h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db 0E4h
		db  25h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db  48h
		db  26h
		db    0
		db  77h
		db    7
		db  11h
		db    3
		db 0ACh
		db  26h
		db    0
		db  77h
		db    7
		db  11h
		db    0
		db    9
		db    3
		db 0F8h
		db  2Ah
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db  5Ch
		db  2Bh
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db 0C0h
		db  2Bh
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db  24h
		db  2Ch
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db 0FFh
		db  2Ch
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db 0ECh
		db  2Ch
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db  50h
		db  2Dh
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db 0B4h
		db  2Dh
		db    0
		db  77h
		db    7
		db  10h
		db    3
		db  18h
		db  2Eh
		db    0
		db  77h
		db    7
		db  10h
		db    0
		db    2
		db    4
		db  6Ch
		db    7
		db    2
		db  11h
		db    5
		db  0Dh
		db    5
		db 0D0h
		db    7
		db    2
		db  11h
		db    5
		db  0Dh
		db    4
		db  6Ch
		db    7
		db    2
		db  11h
		db    5
		db  12h
		db    5
		db 0D0h
		db    7
		db    2
		db  11h
		db    5
		db  12h
		db    4
		db  6Ch
		db    7
		db    2
		db  11h
		db    5
		db  17h
		db    5
		db 0D0h
		db    7
		db    2
		db  11h
		db    5
		db  17h
		db    0
		db    9
		db    2
		db  28h
		db  23h
		db  0Ah
		db  77h
		db    2
		db  12h
		db    1
		db  24h
		db  13h
		db  0Ah
		db    0
		db    0
		db  7Fh
		db    5
		db  80h
		db  25h
		db  0Ah
		db  77h
		db    2
		db  0Dh
		db    0
		db  17h
		db    2
		db 0E4h
		db  0Ch
		db    0
		db    0
		db    0
		db  14h
		db    1
		db 0E4h
		db  0Ch
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  88h
		db  13h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  88h
		db  13h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  88h
		db  13h
		db    0
		db    0
		db    0
		db  14h
		db    0
		db    2
		db    3
		db 0EAh
		db  24h
		db    0
		db  67h
		db    5
		db  0Ah
		db    3
		db 0E0h
		db  24h
		db    0
		db  67h
		db    5
		db  0Ah
		db    3
		db  54h
		db  24h
		db    0
		db  67h
		db    5
		db  0Ah
		db    3
		db  86h
		db  24h
		db    0
		db  67h
		db    5
		db  0Ah
		db    3
		db 0F0h
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    4
		db 0BEh
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    5
		db  8Ch
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    6
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    7
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    8
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Ah
		db    4
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  14h
		db    5
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  28h
		db    4
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  32h
		db    3
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  50h
		db    1
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  7Fh
		db    0
		db  0Eh
		db  3Ch
		db 0B8h
		db  0Bh
		db    0
		db  77h
		db    7
		db  0Eh
		db    0
		db    9
		db    3
		db 0E8h
		db    3
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  84h
		db    3
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  20h
		db    3
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db 0BCh
		db    2
		db    0
		db  77h
		db    7
		db  0Ah
		db    3
		db  58h
		db    2
		db    0
		db  77h
		db    7
		db  0Ah
		db    0
		db    0
		db    1
		db 0F0h
		db  23h
		db    0
		db    0
		db    0
		db    0
		db    3
		db  4Ch
		db  22h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db  0Ch
		db    5
		db 0A0h
		db  0Fh
		db    0
		db  77h
		db    7
		db  11h
		db    5
		db  3Ch
		db  0Fh
		db    0
		db  77h
		db    7
		db  0Fh
		db    5
		db 0D8h
		db  0Eh
		db    0
		db  77h
		db    7
		db  0Dh
		db    5
		db  74h
		db  0Eh
		db    0
		db  77h
		db    7
		db  0Bh
		db    5
		db  10h
		db  0Eh
		db    0
		db  77h
		db    7
		db    9
		db    5
		db 0ACh
		db  0Dh
		db    0
		db  77h
		db    7
		db  0Bh
		db    5
		db  48h
		db  0Dh
		db    0
		db  77h
		db    7
		db  0Dh
		db    5
		db 0E4h
		db  0Ch
		db    0
		db  77h
		db    7
		db  0Fh
		db    0
		db    2
		db    3
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    3
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    3
		db  28h
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    3
		db  5Ah
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    3
		db  8Ch
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    4
		db 0BEh
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    5
		db 0F0h
		db  23h
		db    0
		db  67h
		db    5
		db  0Dh
		db    6
		db  22h
		db  24h
		db    0
		db  67h
		db    5
		db  0Dh
		db    7
		db  54h
		db  24h
		db    0
		db  67h
		db    5
		db  0Dh
		db    8
		db  86h
		db  24h
		db    0
		db  67h
		db    5
		db  0Dh
		db    4
		db 0B8h
		db  24h
		db    0
		db  67h
		db    5
		db  14h
		db    4
		db 0B8h
		db  24h
		db    0
		db  67h
		db    5
		db  28h
		db    4
		db 0B8h
		db  24h
		db    0
		db  67h
		db    5
		db  32h
		db    4
		db 0B8h
		db  24h
		db    0
		db  67h
		db    5
		db  3Ch
		db    4
		db 0B8h
		db  24h
		db    0
		db  67h
		db    5
		db  7Fh
		db    0
		db    9
		db    5
		db  9Ch
		db  3Fh
		db    0
		db  66h
		db    7
		db  0Ah
		db    2
		db 0E0h
		db  2Eh
		db    0
		db    0
		db    0
		db  7Fh
		db  28h
		db  9Ch
		db  3Fh
		db    0
		db    6
		db    7
		db  0Ah
		db    1
		db    0
		db  32h
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db  12h
		db    3
		db  34h
		db  3Ah
		db    0
		db  72h
		db    3
		db  0Ah
		db    2
		db  78h
		db  37h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db 0E8h
		db  35h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db  74h
		db  27h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db  34h
		db  3Ah
		db    0
		db  72h
		db    3
		db  0Ah
		db    2
		db 0B0h
		db  36h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db  14h
		db  37h
		db    0
		db  72h
		db    3
		db  0Ah
		db    2
		db  74h
		db  27h
		db    0
		db  72h
		db    3
		db  0Ah
		db    2
		db 0B0h
		db  36h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db 0B0h
		db  36h
		db    0
		db  72h
		db    3
		db  0Ah
		db    3
		db  4Ch
		db  36h
		db    0
		db  72h
		db    3
		db  0Ah
		db    2
		db  94h
		db  2Ah
		db    0
		db  72h
		db    3
		db  0Ah
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db    9
		db    3
		db 0B8h
		db  0Bh
		db    0
		db  76h
		db    6
		db  0Ah
		db    1
		db 0B8h
		db  0Bh
		db    0
		db  76h
		db    6
		db  7Fh
		db    3
		db  1Ch
		db  0Ch
		db    0
		db  76h
		db    6
		db  0Ah
		db    3
		db  48h
		db  0Dh
		db    0
		db  76h
		db    6
		db  0Ah
		db    1
		db  1Ch
		db  0Ch
		db    0
		db  76h
		db    6
		db  7Fh
		db    0
		db    9
		db    3
		db 0B8h
		db  0Bh
		db    0
		db  76h
		db    6
		db  0Ah
		db    1
		db 0B8h
		db  0Bh
		db    0
		db  76h
		db    6
		db  7Fh
		db    3
		db  1Ch
		db  0Ch
		db    0
		db  76h
		db    6
		db  0Ah
		db    3
		db  1Ch
		db  0Ch
		db    0
		db  76h
		db    6
		db  0Ah
		db    2
		db 0E4h
		db  0Ch
		db    0
		db  76h
		db    6
		db  0Ah
		db    2
		db 0E4h
		db  0Ch
		db    0
		db  76h
		db    6
		db  0Ah
		db    2
		db 0ACh
		db  0Dh
		db    0
		db  76h
		db    6
		db  0Ah
		db    2
		db 0ACh
		db  0Dh
		db    0
		db  76h
		db    6
		db  14h
		db    2
		db  10h
		db  0Eh
		db    0
		db  76h
		db    6
		db  1Eh
		db    2
		db  10h
		db  0Eh
		db    0
		db  76h
		db    6
		db  28h
		db    2
		db  10h
		db  0Eh
		db    0
		db  76h
		db    6
		db  32h
		db    2
		db  10h
		db  0Eh
		db    0
		db  76h
		db    6
		db  3Ch
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db  11h
		db    1
		db 0F0h
		db  23h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  8Ch
		db  23h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  28h
		db  23h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db 0C4h
		db  22h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db  60h
		db  22h
		db    0
		db    0
		db    0
		db  14h
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
		db    0
		db    9
		db    2
		db 0F8h
		db  2Ah
		db    0
		db  70h
		db    7
		db  16h
		db    2
		db  2Ah
		db  2Bh
		db    0
		db  70h
		db    7
		db  0Dh
		db    2
		db  5Ch
		db  2Bh
		db    0
		db  70h
		db    7
		db  10h
		db    2
		db  8Eh
		db  2Bh
		db    0
		db  70h
		db    7
		db  13h
		db    2
		db 0C0h
		db  2Bh
		db    0
		db  70h
		db    7
		db  16h
		db    2
		db 0F2h
		db  2Bh
		db    0
		db  70h
		db    7
		db  14h
		db    2
		db  24h
		db  2Ch
		db    0
		db  70h
		db    7
		db  14h
		db    2
		db  56h
		db  2Ch
		db    0
		db  70h
		db    7
		db  14h
		db    0
		db    6
		db    1
		db 0E0h
		db  2Eh
		db    0
		db    0
		db    0
		db  16h
		db    1
		db  98h
		db  3Ah
		db    0
		db    0
		db    0
		db  16h
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh
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
		db  80h
		db  40h
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

UniBank:	binclude "Z80 Driver/Data/Instruments.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
