; ---------------------------------------------------------------------------
; Konami (RKA) Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($148000>>15)
Music_Bank2_Offset:			equ ($150000>>15)
Music_Bank3_Offset:			equ ($158000>>15)
Music_Bank4_Offset:			equ ($160000>>15)
Music_Bank5_Offset:			equ ($168000>>15)
Music_Bank6_Offset:			equ ($170000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		!org	0
		CPU Z80
		listing on

		di
		ld	sp, 1FFFh
		jp	loc_39
; End of function start

; ---------------------------------------------------------------------------
		db 0

; =============== S U B R O U T I N E =======================================


sub_8:
		ld	hl, 4000h
; End of function sub_8


; =============== S U B R O U T I N E =======================================


sub_B:
		bit	7, (hl)
		jr	nz, sub_B
		ld	(hl), a
		ex	af, af'

loc_11:
		bit	7, (hl)
		jr	nz, loc_11
		inc	l
		ld	(hl), a
		ret
; End of function sub_B


; =============== S U B R O U T I N E =======================================


sub_18:
		exx

loc_19:
		bit	7, (hl)
		jr	nz, loc_19
		ld	(de), a
		ex	af, af'
		inc	e

loc_20:
		bit	7, (hl)
		jr	nz, loc_20
		ld	(de), a
		dec	e
		exx
		ret
; End of function sub_18


; =============== S U B R O U T I N E =======================================


sub_28:
		exx
		or	b

loc_2A:
		bit	7, (hl)
		jr	nz, loc_2A
		ld	(de), a
		ex	af, af'
		inc	e

loc_31:
		bit	7, (hl)
		jr	nz, loc_31
		ld	(de), a
		dec	e
		exx
		ret
; End of function sub_28

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_39:
		xor	a
		ld	(byte_1B40), a
		inc	a
		ld	(byte_1BA0), a
		inc	a
		ld	(byte_1C00), a
		ld	a, 4
		ld	(byte_1C60), a
		ld	(byte_1EA0), a
		inc	a
		ld	(byte_1CC0), a
		ld	(byte_1F00), a
		inc	a
		ld	(byte_1D20), a
		ld	a, 80h
		ld	(byte_1D80), a
		ld	a, 0A0h
		ld	(byte_1DE0), a
		ld	a, 0C0h
		ld	(byte_1E40), a
		xor	a
		ld	(byte_1B16), a
		ex	af, af'
		ld	a, 2Bh
		rst	8
		ld	(byte_1B00), a
		ld	(byte_1B01), a
		ld	(byte_1B02), a
		ld	(byte_1B03), a
		ld	(byte_1B20), a
		ld	(byte_1B21), a
		dec	l
		exx
		call	sub_BD
		ld	a, Music_Bank_Offset
		call	LoadBank
		ld	hl, 4000h
		jp	loc_284
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================

sub_91:
		cp	0A0h
		jp	c, sub_1AB
; End of function sub_91

; =============== S U B R O U T I N E =======================================

sub_96:
		cp	0C0h
		jp	c, loc_22A
		cp	0E0h
		jp	c, locret_27B
		cp	0F0h
		jp	c, loc_145
		jp	z, loc_158
		cp	0F1h
		jp	z, loc_169
		cp	0F2h
		jp	z, loc_19E
		cp	0FEh
		jp	z, sub_BD
		cp	0FFh
		jp	z, sub_CD
		ret
; End of function sub_96

; =============== S U B R O U T I N E =======================================

sub_BD:
		xor	a
		ld	(byte_1B18), a
		ld	(byte_1EA1), a
		ld	(byte_1F01), a
		ld	(byte_1EA4), a
		ld	(byte_1F04), a
; End of function sub_BD


; =============== S U B R O U T I N E =======================================


sub_CD:
		xor	a
		ld	(byte_1B41), a
		ld	(byte_1BA1), a
		ld	(byte_1C01), a
		ld	(byte_1C61), a
		ld	(byte_1CC1), a
		ld	(byte_1D21), a
		ld	(byte_1D81), a
		ld	(byte_1DE1), a
		ld	(byte_1E41), a
		call	sub_25D

loc_EC:
		ld	ix, byte_1B40
		ld	de, 60h
		exx
		ld	de, 4000h
		ld	bc, 0

loc_FA:
		exx
		call	sub_1466
		add	ix, de
		exx
		inc	b
		ld	a, b
		cp	3
		jp	nz, loc_FA
		inc	e
		inc	e
		ld	b, 0
		ld	a, (byte_1EA1)
		or	a
		jp	nz, loc_118
		exx
		call	sub_1466
		exx

loc_118:
		inc	b
		ld	a, (byte_1F01)
		or	a
		jp	nz, loc_129
		exx
		ld	ix, byte_1CC0
		call	sub_1466
		exx

loc_129:
		inc	b
		exx
		ld	a, (byte_1B18)
		or	a
		jp	nz, loc_139
		ld	ix, byte_1D20
		call	sub_1466

loc_139:
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		ret
; End of function sub_CD

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_96

loc_145:
		and	0Fh
		inc	a
		add	a, a
		add	a, a
		ld	(byte_1B09), a
		ld	(byte_1B0A), a
		xor	a
		ld	(byte_1B0C), a
		ld	(byte_1B0B), a
		ret
; ---------------------------------------------------------------------------

loc_158:
		ld	a, 0FFh
		ld	(byte_1B20), a
		xor	a
		ld	(byte_1B18), a
		ld	a, 6Eh
		call	sub_1AB
		jp	loc_EC
; ---------------------------------------------------------------------------

loc_169:
		xor	a
		ld	(byte_1B20), a
		ld	ix, byte_1B40
		ld	de, 60h
		exx
		ld	bc, 0
		ld	de, 4000h

loc_17B:
		exx
		call	sub_1449
		add	ix, de
		exx
		inc	b
		ld	a, b
		cp	3
		jp	nz, loc_17B
		inc	e
		inc	e
		dec	b
		exx
		ld	ix, byte_1D20
		call	sub_1449
		exx
		ld	a, 81h
		ld	(byte_1CAE), a
		ld	(byte_1D0E), a
		ret
; ---------------------------------------------------------------------------

loc_19E:
		ld	a, 0FFh
		ld	(byte_1B20), a
		ld	a, 0
		call	sub_1AB
		jp	loc_EC
; END OF FUNCTION CHUNK	FOR sub_96

; =============== S U B R O U T I N E =======================================


sub_1AB:
		cp	9Bh
		ret	nc
		ld	c, a
		ld	hl, byte_18B6
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		ld	b, a
		ld	(byte_1B1E), a
		ld	a, c
		ld	hl, byte_1EA1
		cp	68h
		jp	nc, loc_1E3
		cp	(hl)
		jp	z, loc_1FD
		ld	hl, byte_1F01
		cp	(hl)
		jp	z, loc_1FD
		ld	a, (byte_1F04)
		cp	b
		jp	c, loc_1FD
		ld	hl, byte_1EA1
		ld	a, (byte_1EA4)
		cp	b
		jp	c, loc_1FD
		jp	z, loc_1FD
		ret
; ---------------------------------------------------------------------------

loc_1E3:
		cp	(hl)
		jp	z, loc_1EF
		ld	a, (byte_1EA4)
		cp	b
		jp	z, loc_1EF
		ret	nc

loc_1EF:
		ld	b, 2
		ld	de, 8458h
		ld	a, c
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		jp	loc_207
; ---------------------------------------------------------------------------

loc_1FD:
		ld	b, 1
		ld	de, 8528h
		ld	a, c
		push	hl
		ld	l, a
		ld	h, 0

loc_207:
		add	hl, hl
		add	hl, de
		ex	de, hl
		pop	hl
; End of function sub_1AB


; =============== S U B R O U T I N E =======================================


sub_20B:
		ld	(hl), c
		inc	l
		ld	a, (de)
		ld	(hl), a
		inc	de
		inc	l
		ld	a, (de)
		or	80h
		ld	(hl), a
		inc	l
		ld	a, (byte_1B1E)
		ld	(hl), a
		inc	hl
		ld	a, 1
		ld	(hl), a
		dec	b
		ret	z
		inc	de
		push	bc
		ld	bc, 5Ch
		add	hl, bc
		pop	bc
		jp	sub_20B
; End of function sub_20B

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_96

loc_22A:
		cp	0C0h
		ret	nc
		ld	c, a
		sub	0A0h
		ld	hl, MusicOffset
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	a, (hl)
		ld	(MusBank), a
		call	LoadBank2
		ld	a, c
		sub	0A0h
		add	a, a
		ld	e, a
		ld	d, 0
		add	a, a
		ld	l, a
		ld	h, d
		add	hl, hl
		add	hl, hl
		add	hl, de
		ld	de, 82F8h
		add	hl, de
		ld	de, byte_1B41
		ex	de, hl
		ld	a, 2
		ld	(byte_1B08), a
		ld	b, 9
		call	sub_20B
; END OF FUNCTION CHUNK	FOR sub_96

; =============== S U B R O U T I N E =======================================


sub_25D:
		xor	a
		ld	(byte_1B09), a
		ld	(byte_1B0A), a
		ld	(byte_1B0C), a
		ld	(byte_1B0B), a
		ld	(byte_1B0D), a
		ld	(byte_1B0E), a
		ld	(byte_1B0F), a
		ld	(byte_1D5A), a
		dec	a
		ld	(7F11h), a
		ret
; End of function sub_25D

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_96

locret_27B:
		ret
; END OF FUNCTION CHUNK	FOR sub_96
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_27C:
		ld	hl, 4000h

loc_27F:
		bit	1, (hl)
		jp	z, loc_27F

loc_284:
		ld	a, 3Ch
		ex	af, af'
		ld	a, 27h
		call	sub_B
		dec	l
		ld	a, 0F2h
		ex	af, af'
		dec	a
		call	sub_B
		dec	l
		ld	a, 3Ah
		ex	af, af'
		inc	a
		call	sub_B
		dec	l

loc_29D:
		exx
		ld	a, (byte_1B21)
		add	a, 80h
		ld	(byte_1B21), a
		jp	nz, loc_2E1
		ld	a, (byte_1B00)
		or	a
		jp	z, loc_2B7
		call	sub_91
		xor	a
		ld	(byte_1B00), a

loc_2B7:
		ld	a, (byte_1B01)
		or	a
		jp	z, loc_2C5
		call	sub_91
		xor	a
		ld	(byte_1B01), a

loc_2C5:
		ld	a, (byte_1B02)
		or	a
		jp	z, loc_2D3
		call	sub_91
		xor	a
		ld	(byte_1B02), a

loc_2D3:
		ld	a, (byte_1B03)
		or	a
		jp	z, loc_2E1
		call	sub_96
		xor	a
		ld	(byte_1B03), a

loc_2E1:
		ld	hl, 8000h
		ld	a, (byte_1B1D)
		ld	c, a
		inc	a
		ld	(byte_1B1D), a
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		ld	(byte_1B1B), a
		inc	l
		ld	a, (hl)
		ld	(byte_1B1C), a
		xor	a
		ld	(byte_1B1F), a
		ld	ix, byte_1EA0
		exx
		ld	bc, 1
		ld	de, 4002h
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_FC3
		ld	ix, byte_1F00
		exx
		inc	b
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_FC3
		ld	a, (byte_1B20)
		or	a
		jp	nz, loc_27C
		ld	a, (byte_1B18)
		or	a
		jp	z, loc_374
		call	sub_468
		ld	a, (byte_1B41)
		or	a
		jp	nz, loc_33A
		ld	b, 60h
		jp	loc_35C
; ---------------------------------------------------------------------------

loc_33A:
		ld	a, (byte_1B21)
		or	a
		jp	nz, loc_346
		ld	b, 18h
		jp	loc_35C
; ---------------------------------------------------------------------------

loc_346:
		ld	b, 0Bh

loc_348:
		ld	a, (byte_1B18)
		or	a
		jp	z, loc_36E
		call	sub_47E
		djnz	loc_348
		call	sub_37E
		call	sub_468
		ld	b, 0Bh

loc_35C:
		ld	a, (byte_1B18)
		or	a
		jp	z, loc_368
		call	sub_47E
		djnz	loc_35C

loc_368:
		ld	hl, 4000h
		jp	loc_29D
; ---------------------------------------------------------------------------

loc_36E:
		call	sub_37E
		jp	loc_27C
; ---------------------------------------------------------------------------

loc_374:
		ld	a, (byte_1B21)
		or	a
		call	nz, sub_37E
		jp	loc_27C
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_37E:
		ld	hl, byte_1B09
		ld	a, (hl)
		or	a
		jp	z, loc_3AC
		inc	l
		inc	l
		ld	(hl), 0
		dec	l
		dec	(hl)
		jp	nz, loc_3AC
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		inc	(hl)
		ld	a, (hl)
		cp	4
		jp	c, loc_3AC
		inc	(hl)
		cp	10h
		jp	c, loc_3AC
		inc	(hl)
		cp	20h
		jp	c, loc_3AC
		inc	(hl)
		cp	38h
		call	nc, sub_CD

loc_3AC:
		ld	ix, byte_1B40
		exx
		ld	bc, 0
		ld	de, 4000h
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	ix, byte_1BA0
		exx
		inc	b
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	ix, byte_1C00
		exx
		inc	b
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	ix, byte_1C60
		exx
		ld	b, 0
		inc	e
		inc	e
		ld	a, (byte_1EA1)
		call	sub_448
		ld	ix, byte_1CC0
		exx
		inc	b
		ld	a, (byte_1F01)
		call	sub_448
		ld	a, (byte_1B18)
		ld	(byte_1B1F), a
		ld	ix, byte_1D20
		exx
		inc	b
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		xor	a
		ld	(byte_1B1F), a
		ld	ix, byte_1D80
		exx
		ld	b, 80h
		ld	de, 7F11h
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	ix, byte_1DE0
		exx
		ld	b, 0A0h
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	ix, byte_1E40
		exx
		ld	b, 0C0h
		exx
		ld	a, (ix+1)
		or	a
		call	nz, sub_524
		ld	a, (byte_1B08)
		or	a
		ret	z
		dec	a
		ld	(byte_1B08), a
		ret
; End of function sub_37E


; =============== S U B R O U T I N E =======================================


sub_448:
		exx
		ex	af, af'
		ld	a, (ix+1)
		or	a
		ret	z
		ex	af, af'
		or	a
		ld	a, 81h
		jp	nz, loc_45B
		ld	a, (ix+4Eh)
		and	1

loc_45B:
		ld	(byte_1B1F), a
		call	sub_524
		ld	a, (byte_1B1F)
		ld	(ix+4Eh), a
		ret
; End of function sub_448


; =============== S U B R O U T I N E =======================================


sub_468:
		ld	a, (byte_1B19)
		cp	1Ch
		jp	z, loc_475
		ld	a, Music_Bank_Offset
		call	LoadBank2

loc_475:
		ld	a, 2Ah
		exx

loc_478:
		bit	7, (hl)
		jr	nz, loc_478
		ld	(hl), a
		exx
; End of function sub_468


; =============== S U B R O U T I N E =======================================


sub_47E:
		ld	hl, (word_1B12)
		ld	a, (hl)
		ld	c, a
		inc	hl
		ld	(word_1B12), hl
		and	0F0h
		ld	h, a
		ld	a, (byte_1B41)
		or	a
		ld	a, h
		jp	nz, loc_49B
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a

loc_49B:
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	de, (word_1B14)
		dec	de
		ld	(word_1B14), de
		ld	a, c
		and	0Fh
		rlca
		rlca
		rlca
		rlca
		ld	h, a
		ld	a, (byte_1B41)
		or	a
		ld	a, h
		jp	nz, loc_4DB
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a

loc_4DB:
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	(4001h), a
		ld	a, d
		or	e
		ret	nz
		ld	(byte_1B18), a
		exx
		ld	de, 4002h
		exx
		ld	a, (byte_1D4F)
		ex	af, af'
		ld	a, 0B6h
		jp	sub_18
; End of function sub_47E


; =============== S U B R O U T I N E =======================================


LoadBank2:
		push	af
		ld	a, (byte_1B19)
		ld	b, a
		pop	af
		cp	b
		jp	z, locret_523
; End of function LoadBank2


; =============== S U B R O U T I N E =======================================


LoadBank:
		ld	(byte_1B19), a
		ld	hl, 6000h
		ld	b, 8

loc_513:
		rrca
		jp	c, loc_51E
		ld	(hl), 0
		djnz	loc_513
		jp	loc_522
; ---------------------------------------------------------------------------

loc_51E:
		ld	(hl), 1
		djnz	loc_513

loc_522:
		ld	(hl), b

locret_523:
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_524:
		ld	a, (byte_1B08)
		or	a
		jp	z, loc_56E
		cp	2
		jp	nz, loc_543
		ld	a, (byte_1B1F)
		or	a
		ret	nz
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_1611
		ld	(ix+2Fh), 0C0h
		jp	sub_1466
; ---------------------------------------------------------------------------

loc_543:
		xor	a
		push	ix
		pop	hl
		ld	bc, 4Eh
		add	hl, bc
		ld	b, 12h

loc_54D:
		ld	(hl), a
		inc	hl
		djnz	loc_54D
		ld	(ix+0Fh), a
		ld	(ix+10h), a
		ld	(ix+11h), a
		inc	a
		ld	(ix+1Ch), a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), 0FFh
		ld	(ix+2Fh), 0C0h
		ld	(ix+42h), 0Fh
		ret
; ---------------------------------------------------------------------------

loc_56E:
		ld	(byte_1B1E), a
		ld	a, (ix+1Bh)
		add	a, (ix+1Ah)
		ld	(ix+1Bh), a
		jp	nc, loc_5CF
		dec	(ix+1Ch)
		jp	z, loc_7D2
		ld	a, (byte_1B1F)
		or	a
		jp	z, loc_58E
		jp	p, loc_5D7
		ret
; ---------------------------------------------------------------------------

loc_58E:
		bit	0, (ix+50h)
		ret	nz
		ld	a, (ix+4Fh)
		or	a
		jp	z, loc_5A4
		dec	(ix+4Fh)
		jp	nz, loc_5A4
		set	1, (ix+38h)

loc_5A4:
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_685
		bit	7, (ix+51h)
		jp	nz, loc_61A
		ld	a, (ix+3Ch)
		cp	(ix+1Ch)
		call	z, sub_1440
		ld	a, (ix+59h)
		or	a
		jp	z, loc_621
		dec	(ix+59h)
		jp	nz, loc_621
		set	0, (ix+38h)
		jp	loc_621
; ---------------------------------------------------------------------------

loc_5CF:
		ld	a, (byte_1B1F)
		or	a
		jp	z, loc_607
		ret	m

loc_5D7:
		set	0, (ix+50h)
		xor	a
		ld	(byte_1B1F), a
		exx
		ld	a, b
		exx
		or	a
		ret	m
; End of function sub_524


; =============== S U B R O U T I N E =======================================


sub_5E4:
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		ld	l, (ix+4Ah)
		ld	h, (ix+4Bh)
		call	sub_1487
; End of function sub_5E4


; =============== S U B R O U T I N E =======================================


sub_5F4:
		ld	a, (byte_1B0E)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)
		ld	hl, byte_1B0C
		add	a, (hl)
		jp	sub_159F
; End of function sub_5F4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_607:
		bit	0, (ix+50h)
		ret	nz
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_685
		bit	7, (ix+51h)
		jp	z, loc_621

loc_61A:
		ld	l, (ix+1Dh)
		ld	h, (ix+1Eh)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_621:
		ld	a, (byte_1B0B)
		or	a
		call	nz, sub_5F4
		call	sub_6A9
		bit	0, d
		call	nz, sub_1558
		bit	0, (ix+38h)
		ret	z
		dec	(ix+41h)
		ret	nz
		ld	a, (ix+42h)
		add	a, 11h
		jp	m, loc_680
		ld	(ix+42h), a
		ld	b, 11h
		ld	c, a
		and	0F0h
		rrca
		cp	(ix+3Eh)
		jp	c, loc_655
		ld	b, 1
		ld	a, (ix+3Eh)

loc_655:
		ld	e, a
		ld	a, c
		and	0Fh
		cp	(ix+3Fh)
		jp	c, loc_664
		res	0, b
		ld	a, (ix+3Fh)

loc_664:
		or	e
		or	(ix+2Fh)
		ex	af, af'
		ld	a, b
		or	a
		ld	a, 0B4h
		jp	z, loc_679
		ld	c, (ix+40h)
		ld	(ix+41h), c
		jp	sub_28
; ---------------------------------------------------------------------------

loc_679:
		res	0, (ix+38h)
		jp	sub_28
; ---------------------------------------------------------------------------

loc_680:
		res	0, (ix+38h)
		ret
; ---------------------------------------------------------------------------

loc_685:
		call	sub_6A9
		bit	0, d
		call	nz, sub_15EA
		ld	a, (ix+3Ch)
		cp	(ix+1Ch)
		jp	c, loc_9CE
		dec	(ix+3Fh)
		jp	nz, loc_A1B
		ld	a, (ix+3Eh)
		ld	(ix+3Fh), a
		ld	a, (ix+41h)
		inc	a
		jp	loc_A05
; END OF FUNCTION CHUNK	FOR sub_524

; =============== S U B R O U T I N E =======================================


sub_6A9:
		ld	d, 0
		bit	2, (ix+38h)
		jp	z, loc_6D3
		call	sub_773
		ld	d, 0FFh
		bit	4, (ix+50h)
		ret	z
		bit	1, (ix+38h)
		jp	z, loc_6C9
		dec	(ix+2Ah)
		jp	z, loc_6E2

loc_6C9:
		ld	c, (ix+21h)
		ld	b, (ix+22h)
		add	hl, bc
		ld	d, 0FFh
		ret
; ---------------------------------------------------------------------------

loc_6D3:
		bit	1, (ix+38h)
		ret	z
		dec	(ix+2Ah)
		ret	nz
		ld	l, (ix+1Dh)
		ld	h, (ix+1Eh)

loc_6E2:
		ld	a, (ix+29h)
		ld	(ix+2Ah), a
		ld	e, (ix+23h)
		ld	d, (ix+24h)

loc_6EE:
		ld	a, (de)
		inc	de
		cp	0F0h
		jp	nc, loc_720
		ld	(ix+23h), e
		ld	(ix+24h), d
		ld	d, 0
		or	a
		jp	p, loc_707
		and	7Fh
		neg
		ld	d, 0FFh

loc_707:
		ld	e, a
		ld	a, (ix+2Dh)
		or	a
		jp	z, loc_716
		ex	de, hl

loc_710:
		add	hl, hl
		dec	a
		jp	nz, loc_710
		ex	de, hl

loc_716:
		ld	(ix+21h), e
		ld	(ix+22h), d
		add	hl, de
		ld	d, 0FFh
		ret
; ---------------------------------------------------------------------------

loc_720:
		and	0Fh
		jp	z, loc_733
		cp	0Fh
		jp	z, loc_765
		ld	(ix+29h), a
		ld	(ix+2Ah), a
		jp	loc_6EE
; ---------------------------------------------------------------------------

loc_733:
		ld	a, (ix+2Bh)
		or	a
		jp	nz, loc_747
		ld	(ix+2Bh), 1
		ld	(ix+27h), e
		ld	(ix+28h), d
		jp	loc_6EE
; ---------------------------------------------------------------------------

loc_747:
		ld	c, a
		ld	a, (de)
		or	a
		jp	z, loc_754
		cp	c
		jp	z, loc_75D
		inc	(ix+2Bh)

loc_754:
		ld	e, (ix+27h)
		ld	d, (ix+28h)
		jp	loc_6EE
; ---------------------------------------------------------------------------

loc_75D:
		inc	de
		ld	(ix+2Bh), 0
		jp	loc_6EE
; ---------------------------------------------------------------------------

loc_765:
		res	1, (ix+38h)
		ld	e, (ix+21h)
		ld	d, (ix+22h)
		add	hl, de
		ld	d, 0FFh
		ret
; End of function sub_6A9


; =============== S U B R O U T I N E =======================================


sub_773:
		ld	l, (ix+1Dh)
		ld	h, (ix+1Eh)
		ld	c, (ix+1Fh)
		ld	b, (ix+20h)
		push	bc
		xor	a
		sbc	hl, bc
		jp	z, loc_7CC
		jp	p, loc_792
		ex	de, hl
		ld	hl, byte_1B1E
		ld	(hl), d
		ld	l, a
		ld	h, a
		sbc	hl, de

loc_792:
		ex	de, hl
		ld	l, a
		ld	h, a
		ld	bc, 800h
		ex	af, af'
		ld	a, (ix+54h)

loc_79C:
		srl	d
		rr	e
		rr	c
		rlca
		jp	nc, loc_7AE
		add	hl, de
		ex	af, af'
		add	a, c
		ex	af, af'
		jp	nc, loc_7AE
		inc	hl

loc_7AE:
		djnz	loc_79C
		ld	a, l
		or	h
		jp	nz, loc_7B6
		inc	l

loc_7B6:
		pop	de
		ld	a, (byte_1B1E)
		or	a
		jp	nz, loc_7C2
		add	hl, de
		jp	loc_7C5
; ---------------------------------------------------------------------------

loc_7C2:
		ex	de, hl
		sbc	hl, de

loc_7C5:
		ld	(ix+1Fh), l
		ld	(ix+20h), h
		ret
; ---------------------------------------------------------------------------

loc_7CC:
		pop	hl
		res	2, (ix+38h)
		ret
; End of function sub_773

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_7D2:
		ld	e, (ix+2)
		ld	d, (ix+3)

loc_7D8:
		ld	a, (de)
		inc	de
		cp	0D0h
		jp	nc, loc_B05

loc_7DF:
		ld	c, a
		and	0Fh
		jp	nz, loc_7E7
		ld	a, 10h

loc_7E7:
		ld	h, (ix+50h)
		bit	2, h
		jp	nz, loc_7F2
		ld	l, a
		add	a, l
		add	a, l

loc_7F2:
		bit	1, h
		jp	nz, loc_7F8
		add	a, a

loc_7F8:
		bit	3, h
		jp	z, loc_804
		res	3, (ix+50h)
		sub	(ix+3Dh)

loc_804:
		ld	(ix+1Ch), a

loc_807:
		ld	(ix+2),	e
		ld	(ix+3),	d
		ld	(ix+38h), 0
		ld	d, a
		ld	a, (ix+3Bh)
		or	a
		jp	z, loc_830
		ld	l, 0
		ld	h, l
		ld	e, l
		ld	b, 8

loc_81F:
		srl	d
		rr	e
		rlca
		jp	nc, loc_828
		add	hl, de

loc_828:
		djnz	loc_81F
		ld	a, h
		or	a
		jp	nz, loc_830
		inc	a

loc_830:
		ld	(ix+3Ch), a
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_8BA
		bit	0, (ix+51h)
		jp	nz, loc_A75
		ld	a, (byte_1B1F)
		or	a
		jp	z, loc_863
		jp	p, loc_857
		ld	a, (ix+57h)
		or	a
		ret	p
		dec	(ix+35h)
		ret	nz
		jp	sub_959
; ---------------------------------------------------------------------------

loc_857:
		xor	a
		ld	(byte_1B1F), a
		push	bc
		call	sub_5E4
		pop	bc
		jp	loc_877
; ---------------------------------------------------------------------------

loc_863:
		ld	a, (byte_1B0B)
		or	a
		jp	z, loc_870
		call	sub_5F4
		jp	loc_877
; ---------------------------------------------------------------------------

loc_870:
		ld	a, (byte_1B1E)
		or	a
		call	nz, sub_5F4

loc_877:
		ld	a, c
		and	0F0h
		jp	nz, loc_884
		set	0, (ix+50h)
		jp	sub_1440
; ---------------------------------------------------------------------------

loc_884:
		ld	c, a
		ld	a, (ix+57h)
		or	a
		jp	p, loc_892
		dec	(ix+35h)
		call	z, sub_959

loc_892:
		ld	a, c
		ld	de, 8146h
		call	sub_8EA
		call	sub_1558
		ld	a, (ix+58h)
		or	a
		jp	z, loc_1435
		ld	(ix+59h), a
		ld	a, (ix+40h)
		ld	(ix+41h), a
		ld	(ix+42h), 0
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		jp	loc_1435
; ---------------------------------------------------------------------------

loc_8BA:
		ld	a, c
		and	0F0h
		jp	nz, loc_8C7
		set	0, (ix+50h)
		jp	loc_1611
; ---------------------------------------------------------------------------

loc_8C7:
		ld	de, 821Eh
		call	sub_8EA
		call	sub_15EA
		ld	a, (ix+3Eh)
		ld	(ix+3Fh), a
		ld	a, (ix+58h)
		or	a
		jp	z, loc_9F8
		ld	e, (ix+36h)
		ld	d, (ix+37h)
		ld	(ix+35h), 0
		jp	loc_9E7
; END OF FUNCTION CHUNK	FOR sub_524

; =============== S U B R O U T I N E =======================================


sub_8EA:
		res	0, (ix+50h)
		rrca
		rrca
		rrca
		add	a, (ix+3Ah)
		add	a, (ix+55h)
		add	a, (ix+5Fh)
		ld	hl, byte_1B0D
		add	a, (hl)
		ld	l, a
		ld	h, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+1Dh), e
		ld	(ix+1Eh), d
		ld	a, (ix+54h)
		or	a
		jp	nz, loc_91B
		ld	(ix+1Fh), e
		ld	(ix+20h), d
		jp	loc_925
; ---------------------------------------------------------------------------

loc_91B:
		ld	(ix+38h), 4

loc_91F:
		ld	e, (ix+1Fh)
		ld	d, (ix+20h)

loc_925:
		ex	de, hl
		bit	4, (ix+50h)
		ret	z
		ld	e, (ix+25h)
		ld	d, (ix+26h)
		ld	(ix+2Bh), 0
		ld	a, (ix+2Ch)
		ld	(ix+4Fh), a
		or	a
		jp	nz, loc_946
		set	1, (ix+38h)
		jp	loc_6EE
; ---------------------------------------------------------------------------

loc_946:
		ld	(ix+23h), e
		ld	(ix+24h), d
		ld	(ix+2Ah), 1
		ld	(ix+21h), 0
		ld	(ix+22h), 0
		ret
; End of function sub_8EA


; =============== S U B R O U T I N E =======================================


sub_959:
		ld	a, (ix+34h)
		ld	(ix+35h), a
		ld	e, (ix+30h)
		ld	d, (ix+31h)

loc_965:
		ld	a, (de)
		inc	de
		cp	0F0h
		jp	nc, loc_984
		ld	(ix+30h), e
		ld	(ix+31h), d
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, (byte_1B1F)
		or	a
		ret	nz
		ld	a, 0B4h
		jp	sub_28
; ---------------------------------------------------------------------------

loc_984:
		and	0Fh
		jp	z, loc_997
		cp	0Fh
		jp	z, loc_9C9
		ld	(ix+34h), a
		ld	(ix+35h), a
		jp	loc_965
; ---------------------------------------------------------------------------

loc_997:
		ld	a, (ix+36h)
		or	a
		jp	nz, loc_9AB
		ld	(ix+36h), 1
		ld	(ix+32h), e
		ld	(ix+33h), d
		jp	loc_965
; ---------------------------------------------------------------------------

loc_9AB:
		ld	l, a
		ld	a, (de)
		or	a
		jp	z, loc_9B8
		cp	l
		jp	z, loc_9C1
		inc	(ix+36h)

loc_9B8:
		ld	e, (ix+32h)
		ld	d, (ix+33h)
		jp	loc_965
; ---------------------------------------------------------------------------

loc_9C1:
		inc	de
		ld	(ix+36h), 0
		jp	loc_965
; ---------------------------------------------------------------------------

loc_9C9:
		ld	(ix+57h), 0
		ret
; End of function sub_959

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_9CE:
		ld	a, (ix+59h)
		or	a
		jp	z, loc_A1B
		dec	(ix+59h)
		jp	nz, loc_A1B
		ld	a, (ix+34h)
		ld	(ix+59h), a
		ld	e, (ix+30h)
		ld	d, (ix+31h)

loc_9E7:
		ld	a, (de)
		inc	de
		cp	0F0h
		jp	nc, loc_A2B
		ld	(ix+30h), e
		ld	(ix+31h), d
		and	0Fh
		xor	0Fh

loc_9F8:
		ld	hl, 1B0Fh
		add	a, (hl)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)

loc_A05:
		cp	(ix+42h)
		jp	c, loc_A0E
		ld	a, (ix+42h)

loc_A0E:
		ld	(ix+41h), a
		ld	c, a
		ld	a, (byte_1B0C)
		srl	a
		add	a, c
		jp	loc_1607
; ---------------------------------------------------------------------------

loc_A1B:
		ld	a, (byte_1B0B)
		or	a
		ret	z
		ld	a, (byte_1B0C)
		srl	a
		add	a, (ix+41h)
		jp	loc_1607
; ---------------------------------------------------------------------------

loc_A2B:
		and	0Fh
		jp	z, loc_A3E
		cp	0Fh
		jp	z, loc_A70
		ld	(ix+34h), a
		ld	(ix+59h), a
		jp	loc_9E7
; ---------------------------------------------------------------------------

loc_A3E:
		ld	a, (ix+35h)
		or	a
		jp	nz, loc_A52
		ld	(ix+35h), 1
		ld	(ix+32h), e
		ld	(ix+33h), d
		jp	loc_9E7
; ---------------------------------------------------------------------------

loc_A52:
		ld	l, a
		ld	a, (de)
		or	a
		jp	z, loc_A5F
		cp	l
		jp	z, loc_A68
		inc	(ix+35h)

loc_A5F:
		ld	e, (ix+32h)
		ld	d, (ix+33h)
		jp	loc_9E7
; ---------------------------------------------------------------------------

loc_A68:
		inc	de
		ld	(ix+35h), 0
		jp	loc_9E7
; ---------------------------------------------------------------------------

loc_A70:
		ld	(ix+59h), 0
		ret
; ---------------------------------------------------------------------------

loc_A75:
		ld	a, (byte_1B1F)
		or	a
		jp	z, loc_A93
		jp	p, loc_A8F
		set	0, (ix+50h)
		ld	a, (ix+57h)
		or	a
		ret	p
		dec	(ix+35h)
		ret	nz
		jp	sub_959
; ---------------------------------------------------------------------------

loc_A8F:
		xor	a
		ld	(byte_1B1F), a

loc_A93:
		ld	a, c
		and	0F0h
		jp	nz, loc_AA0
		set	0, (ix+50h)
		jp	sub_1440
; ---------------------------------------------------------------------------

loc_AA0:
		ld	c, a
		ld	a, (ix+57h)
		or	a
		jp	p, loc_AAE
		dec	(ix+35h)
		call	z, sub_959

loc_AAE:
		ld	a, c
		rrca
		rrca
		rrca
		ld	c, a
		ld	a, (ix+0)
		cp	6
		jp	nz, loc_ACA
		ld	a, (byte_1B16)
		or	a
		jp	z, loc_ACA
		xor	a
		ld	(byte_1B16), a
		ex	af, af'
		ld	a, 2Bh
		rst	8

loc_ACA:
		ld	a, (byte_1E41)
		or	a
		jp	nz, loc_AD8
		ld	hl, 7F11h
		ld	(hl), 0DFh
		ld	(hl), 0FFh

loc_AD8:
		res	0, (ix+50h)
		ld	(ix+51h), 81h
		ld	hl, loc_161C
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		ld	(ix+1Dh), a
		inc	hl
		ld	a, (hl)
		ld	(ix+1Eh), a
		ld	a, (byte_1B0E)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)
		ld	hl, 1B0Ch
		add	a, (hl)
		ld	(ix+23h), a
		jp	sub_1440
; ---------------------------------------------------------------------------

loc_B05:
		sub	0D8h
		jp	c, loc_B9F
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_B17
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_524
; ---------------------------------------------------------------------------
off_B17:	dw loc_BBF		; 0
		dw loc_BCA		; 1
		dw loc_BEA		; 2
		dw loc_C2F		; 3
		dw loc_C39		; 4
		dw loc_C39		; 5
		dw loc_C4E		; 6
		dw loc_C60		; 7
		dw loc_C75		; 8
		dw loc_CA7		; 9
		dw loc_CC5		; 0Ah
		dw loc_CD2		; 0Bh
		dw loc_D21		; 0Ch
		dw loc_D2E		; 0Dh
		dw loc_D63		; 0Eh
		dw loc_D85		; 0Fh
		dw loc_D8F		; 10h
		dw loc_D94		; 11h
		dw loc_D94		; 12h
		dw loc_D94		; 13h
		dw loc_DBD		; 14h
		dw loc_DC6		; 15h
		dw loc_DE4		; 16h
		dw loc_E4F		; 17h
		dw loc_B67		; 18h
		dw loc_B6E		; 19h
		dw loc_B75		; 1Ah
		dw loc_B7C		; 1Bh
		dw loc_B83		; 1Ch
		dw loc_B8A		; 1Dh
		dw loc_B91		; 1Eh
		dw loc_B98		; 1Fh
		dw loc_E72		; 20h
		dw loc_E86		; 21h
		dw loc_E97		; 22h
		dw loc_ECA		; 23h
		dw loc_EFD		; 24h
		dw loc_F26		; 25h
		dw loc_F4F		; 26h
		dw loc_FB0		; 27h
; ---------------------------------------------------------------------------

loc_B67:
		ld	(ix+3Ah), 0
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B6E:
		ld	(ix+3Ah), 18h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B75:
		ld	(ix+3Ah), 30h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B7C:
		ld	(ix+3Ah), 48h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B83:
		ld	(ix+3Ah), 60h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B8A:
		ld	(ix+3Ah), 78h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B91:
		ld	(ix+3Ah), 90h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_B98:
		ld	(ix+3Ah), 0A8h
		jp	loc_7D8
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_B9F:
		and	7
		ld	c, a
		jp	z, loc_BB5
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_BB5
		ld	c, a
		ld	b, 0
		ld	hl, 8100h
		add	hl, bc
		ld	c, (hl)

loc_BB5:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1B1E), a
		jp	loc_7D8
; END OF FUNCTION CHUNK	FOR sub_524
; ---------------------------------------------------------------------------

loc_BBF:
		ld	a, (de)
		inc	de
		add	a, a
		add	a, a
		add	a, a
		ld	(ix+53h), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_BCA:
		ld	b, 10h

loc_BCC:
		ld	a, (de)
		inc	de
		cp	0D9h
		jp	nz, loc_BDA
		ld	a, b
		add	a, 10h
		ld	b, a
		jp	loc_BCC
; ---------------------------------------------------------------------------

loc_BDA:
		ld	c, a
		and	0Fh
		jp	nz, loc_BE2
		ld	a, 10h

loc_BE2:
		add	a, b
		jp	loc_7E7
; ---------------------------------------------------------------------------

loc_BE6:
		inc	de
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_BEA:
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_BE6
		ld	a, (de)
		inc	de
		ld	(ix+57h), a
		or	a
		jp	m, loc_C0F
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, (byte_1B1F)
		or	a
		jp	nz, loc_7D8
		ld	a, 0B4h
		rst	28h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C0F:
		and	7Fh
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, 0A058h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+30h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+31h), a
		ld	(ix+35h), 1
		ld	(ix+36h), 0
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C2F:
		ld	a, (de)
		inc	de
		neg
		ld	(ix+3Bh), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C39:
		bit	2, (ix+50h)
		jp	nz, loc_C47
		set	2, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C47:
		res	2, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C4E:
		set	3, (ix+50h)
		ld	a, (de)
		inc	de
		ld	c, a
		and	0Fh
		ld	(ix+1Ch), a
		ld	(ix+3Dh), a
		jp	loc_807
; ---------------------------------------------------------------------------

loc_C60:
		bit	1, (ix+50h)
		jp	nz, loc_C6E
		set	1, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C6E:
		res	1, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_C75:
		ld	(ix+51h), 0
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		ld	(byte_1B1E), a
		ld	a, (ix+1)
		cp	97h
		exx
		ld	a, b
		exx
		or	a
		jp	p, loc_C95
		ld	a, (de)
		inc	de
		ld	(ix+3Eh), a
		jp	loc_C98
; ---------------------------------------------------------------------------

loc_C95:
		call	sub_CEE

loc_C98:
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	a, (de)
		inc	de
		neg
		ld	(ix+3Bh), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_CA7:
		ld	(ix+56h), 0
		ld	(ix+51h), 1
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		ld	a, (ix+1)
		cp	97h
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	(ix+3Bh), 0
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_CC5:
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		ld	a, (ix+1)
		cp	97h
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_CD2:
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_CDF
		call	sub_CEE
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_CDF:
		ld	a, (de)
		inc	de
		neg
		ld	(ix+3Bh), a
		ld	a, (de)
		inc	de
		ld	(ix+3Eh), a
		jp	loc_7D8

; =============== S U B R O U T I N E =======================================


sub_CEE:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_CF8
		cp	(ix+56h)
		ret	z

loc_CF8:
		ld	(ix+56h), a
		and	7Fh
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	bc, 0A448h
		add	hl, bc
		ld	(ix+4Ah), l
		ld	(ix+4Bh), h
		ld	a, (byte_1B1F)
		or	a
		ret	nz
		inc	a
		ld	(byte_1B1E), a
		jp	sub_1487
; End of function sub_CEE

; ---------------------------------------------------------------------------

loc_D21:
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	a, 0FFh
		ld	(byte_1B1E), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_D2E:
		ld	a, (de)
		inc	de
		add	a, a
		jp	z, loc_D5C
		ld	c, a
		ld	b, 0
		ld	hl, 0A058h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+25h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+26h), a
		ld	a, (de)
		and	0F0h
		rrca
		rrca
		ld	(ix+2Ch), a
		ld	a, (de)
		inc	de
		and	0Fh
		ld	(ix+2Dh), a
		set	4, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_D5C:
		res	4, (ix+50h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_D63:
		ld	a, (de)
		inc	de
		ld	(ix+58h), a
		ld	(ix+59h), 0
		add	a, a
		jp	z, loc_7D8
		ld	c, a
		ld	b, 0
		ld	hl, 0A058h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+36h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+37h), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_D85:
		ld	a, (de)
		inc	de
		neg
		ld	(ix+54h), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_D8F:
		ld	a, (de)
		inc	de
		jp	loc_7DF
; ---------------------------------------------------------------------------

loc_D94:
		call	sub_D9D
		ld	(byte_1B0D), a
		jp	loc_7D8

; =============== S U B R O U T I N E =======================================


sub_D9D:
		ld	a, (de)
		inc	de

loc_D9F:
		ld	c, a
		and	0Fh
		ld	l, a
		ld	a, c
		and	70h
		jp	z, loc_DB5
		rrca
		rrca
		rrca
		rrca
		ld	b, a
		xor	a

loc_DAF:
		add	a, 0Ch
		djnz	loc_DAF
		add	a, l
		ld	l, a

loc_DB5:
		ld	a, l
		add	a, a
		bit	7, c
		ret	z
		neg
		ret
; End of function sub_D9D

; ---------------------------------------------------------------------------

loc_DBD:
		call	sub_D9D
		ld	(ix+55h), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_DC6:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_DDA
		and	7Fh
		neg
		ld	(ix+5Ah), a
		ld	(ix+5Bh), 0FFh
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_DDA:
		ld	(ix+5Ah), a
		ld	(ix+5Bh), 0
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_DE4:
		ld	a, (ix+5Dh)
		or	a
		jp	nz, loc_E05
		ld	(ix+5Dh), 1
		ld	(ix+5Eh), a
		ld	(ix+5Fh), a
		ld	(ix+48h), e
		ld	(ix+49h), d
		inc	de
		inc	de
		inc	de
		inc	a
		ld	(byte_1B1E), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E05:
		ld	(byte_1B1E), a
		ld	l, (ix+48h)
		ld	h, (ix+49h)
		ld	a, (ix+5Dh)
		cp	(hl)
		jp	z, loc_E42
		inc	(ix+5Dh)
		ex	de, hl
		inc	de
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_E29
		call	loc_D9F
		add	a, (ix+5Fh)
		ld	(ix+5Fh), a

loc_E29:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_7D8
		jp	m, loc_E37
		neg
		jp	loc_E39
; ---------------------------------------------------------------------------

loc_E37:
		and	7Fh

loc_E39:
		add	a, (ix+5Eh)
		ld	(ix+5Eh), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E42:
		xor	a
		ld	(ix+5Dh), a
		ld	(ix+5Eh), a
		ld	(ix+5Fh), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E4F:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_E5A
		and	7Fh
		jp	loc_E5C
; ---------------------------------------------------------------------------

loc_E5A:
		neg

loc_E5C:
		ld	(byte_1B0E), a
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_E6A
		and	7Fh
		jp	loc_E6C
; ---------------------------------------------------------------------------

loc_E6A:
		neg

loc_E6C:
		ld	(byte_1B0F), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E72:
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_E7E
		inc	de
		inc	de
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E7E:
		ld	a, (de)
		inc	de
		ld	(ix+42h), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E86:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	a, (hl)
		or	80h
		ld	d, a

loc_E8D:
		exx
		ld	a, c
		exx
		or	a
		jp	nz, loc_108B
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_E97:
		ld	a, (ix+0Fh)
		or	a
		jp	nz, loc_EAB
		ld	(ix+0Fh), 1
		ld	(ix+12h), e
		ld	(ix+13h), d
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_EAB:
		ex	de, hl
		cp	(hl)
		jp	z, loc_EC1
		ld	a, (hl)
		or	a
		jp	z, loc_EB8
		inc	(ix+0Fh)

loc_EB8:
		ld	e, (ix+12h)
		ld	d, (ix+13h)
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_EC1:
		ld	(ix+0Fh), 0
		ex	de, hl
		inc	de
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_ECA:
		ld	a, (ix+10h)
		or	a
		jp	nz, loc_EDE
		ld	(ix+10h), 1
		ld	(ix+14h), e
		ld	(ix+15h), d
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_EDE:
		ex	de, hl
		cp	(hl)
		jp	z, loc_EF4
		ld	a, (hl)
		or	a
		jp	z, loc_EEB
		inc	(ix+10h)

loc_EEB:
		ld	e, (ix+14h)
		ld	d, (ix+15h)
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_EF4:
		ld	(ix+10h), 0
		ex	de, hl
		inc	de
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_EFD:
		bit	0, (ix+11h)
		jp	nz, loc_F19
		set	0, (ix+11h)
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	a, (hl)
		or	80h
		ld	d, a
		inc	hl
		ld	(ix+16h), l
		ld	(ix+17h), h
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_F19:
		res	0, (ix+11h)
		ld	e, (ix+16h)
		ld	d, (ix+17h)
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_F26:
		bit	4, (ix+11h)
		jp	nz, loc_F42
		set	4, (ix+11h)
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	a, (hl)
		or	80h
		ld	d, a
		inc	hl
		ld	(ix+18h), l
		ld	(ix+19h), h
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_F42:
		res	4, (ix+11h)
		ld	e, (ix+18h)
		ld	d, (ix+19h)
		jp	loc_E8D
; ---------------------------------------------------------------------------

loc_F4F:
		ld	a, (ix+5Ch)
		or	a
		jp	nz, loc_F63
		ld	(ix+5Ch), 1
		ld	(ix+44h), e
		ld	(ix+45h), d
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_F63:
		bit	0, a
		jp	nz, loc_F75
		ld	(ix+5Ch), 0
		ld	e, (ix+46h)
		ld	d, (ix+47h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_F75:
		bit	1, a
		jp	nz, loc_F8F
		or	2
		bit	2, a
		jp	z, loc_F87
		ld	e, (ix+46h)
		ld	d, (ix+47h)

loc_F87:
		and	0FBh
		ld	(ix+5Ch), a
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_F8F:
		and	0FDh
		or	4
		ld	c, a
		ld	a, (de)
		cp	0FEh
		ld	a, c
		jp	nz, loc_F9E
		inc	de
		and	0FEh

loc_F9E:
		ld	(ix+5Ch), a
		ld	(ix+46h), e
		ld	(ix+47h), d
		ld	e, (ix+44h)
		ld	d, (ix+45h)
		jp	loc_7D8
; ---------------------------------------------------------------------------

loc_FB0:
		ld	(ix+1),	0
		ld	a, (byte_1B1F)
		or	a
		ret	nz
		exx
		ld	a, b
		exx
		or	a
		jp	m, loc_1611
		jp	sub_1466

; =============== S U B R O U T I N E =======================================


sub_FC3:

; FUNCTION CHUNK AT 1179 SIZE 00000012 BYTES
; FUNCTION CHUNK AT 1213 SIZE 00000020 BYTES

		ld	a, (ix+5)
		or	a
		jp	z, loc_FF4
		xor	a
		ld	(ix+5),	a
		ld	(ix+2Fh), 0C0h
		call	sub_1466
		xor	a
		push	ix
		pop	hl
		ld	bc, 4Eh
		add	hl, bc
		ld	b, 12h

loc_FDF:
		ld	(hl), a
		inc	hl
		djnz	loc_FDF
		ld	(ix+0Fh), a
		ld	(ix+10h), a
		ld	(ix+11h), a
		inc	a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

loc_FF4:
		xor	a
		ld	(byte_1B1E), a
		ld	a, (ix+55h)
		or	a
		jp	z, loc_1014
		dec	(ix+2Ch)
		jp	nz, loc_1014
		ld	(byte_1B1E), a
		ld	(ix+2Ch), a
		ld	a, (ix+2Bh)
		add	a, (ix+56h)
		ld	(ix+56h), a

loc_1014:
		dec	(ix+1Bh)
		jp	z, loc_107E
		bit	0, (ix+50h)
		ret	nz
		ld	d, 0
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		ld	a, (ix+57h)
		or	a
		jp	z, loc_1045
		dec	(ix+2Dh)
		jp	nz, loc_1045
		dec	d
		ld	(ix+2Dh), a
		ld	c, (ix+20h)
		ld	b, (ix+21h)
		add	hl, bc
		ld	(ix+1Eh), l
		ld	(ix+1Fh), h

loc_1045:
		ld	a, (ix+54h)
		or	a
		jp	z, loc_1065
		dec	(ix+26h)
		jp	nz, loc_1059
		dec	d
		call	sub_115B
		jp	loc_1064
; ---------------------------------------------------------------------------

loc_1059:
		bit	7, d
		jp	z, loc_1065
		ld	c, (ix+22h)
		ld	b, (ix+23h)

loc_1064:
		add	hl, bc

loc_1065:
		bit	7, d
		call	nz, sub_158F
		ld	a, (byte_1B1E)
		or	a
		ret	z
		ld	a, (ix+24h)
		add	a, (ix+52h)
		add	a, (ix+5Ah)
		add	a, (ix+56h)
		jp	sub_159F
; ---------------------------------------------------------------------------

loc_107E:
		bit	4, (ix+51h)
		call	z, sub_1440
		ld	e, (ix+2)
		ld	d, (ix+3)

loc_108B:
		ld	a, (de)
		inc	de
		cp	0D0h
		jp	nc, loc_1179
		ld	c, (ix+1Ah)
		ld	(ix+1Bh), c
		bit	0, (ix+51h)
		jp	z, loc_10AB
		ld	h, a
		ld	a, (de)
		inc	de
		ld	(ix+2),	e
		ld	(ix+3),	d
		jp	loc_10EE
; ---------------------------------------------------------------------------

loc_10AB:
		ld	(ix+2),	e
		ld	(ix+3),	d
		ld	c, a
		and	0F0h
		jp	nz, loc_10BE
		set	0, (ix+50h)
		jp	sub_1440
; ---------------------------------------------------------------------------

loc_10BE:
		ld	e, a
		ld	a, c
		and	0Fh
		ld	c, a
		jp	z, loc_10D6
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_10D6
		ld	c, a
		ld	b, 0
		ld	hl, 8100h
		add	hl, bc
		ld	c, (hl)

loc_10D6:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1B1E), a
		ld	a, e
		rrca
		rrca
		rrca
		add	a, (ix+25h)
		ld	c, a
		ld	b, 0
		ld	hl, 8146h
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)

loc_10EE:
		ld	l, a
		res	0, (ix+50h)
		ld	c, (ix+5Dh)
		ld	b, (ix+5Eh)
		add	hl, bc
		ld	c, (ix+4Eh)
		ld	b, (ix+4Fh)
		add	hl, bc
		ld	c, (ix+5Bh)
		ld	b, (ix+5Ch)
		add	hl, bc
		ld	(ix+1Eh), l
		ld	(ix+1Fh), h
		ld	a, (ix+54h)
		or	a
		jp	z, loc_1128
		dec	(ix+26h)
		jp	nz, loc_1121
		call	sub_115B
		jp	loc_1127
; ---------------------------------------------------------------------------

loc_1121:
		ld	c, (ix+22h)
		ld	b, (ix+23h)

loc_1127:
		add	hl, bc

loc_1128:
		ld	a, (ix+57h)
		or	a
		jp	z, loc_1132
		ld	(ix+2Dh), a

loc_1132:
		call	sub_158F
		ld	a, (ix+58h)
		or	a
		jp	p, loc_1142
		dec	(ix+35h)
		call	z, sub_959

loc_1142:
		ld	a, (byte_1B1E)
		or	a
		jp	z, loc_1435
		ld	a, (ix+24h)
		add	a, (ix+52h)
		add	a, (ix+5Ah)
		add	a, (ix+56h)
		call	sub_159F
		jp	loc_1435
; End of function sub_FC3


; =============== S U B R O U T I N E =======================================


sub_115B:
		ld	(ix+26h), a
		ld	a, (byte_1B1B)
		and	(ix+28h)
		or	(ix+2Ah)
		ld	b, a
		ld	a, (byte_1B1C)
		and	(ix+27h)
		or	(ix+29h)
		ld	c, a
		ld	(ix+22h), c
		ld	(ix+23h), b
		ret
; End of function sub_115B

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_FC3

loc_1179:
		sub	0D8h
		jp	c, loc_1213
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_118B
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_FC3
; ---------------------------------------------------------------------------
off_118B:	dw loc_1233		; 0
		dw loc_123B		; 1
		dw loc_123E		; 2
		dw loc_1272		; 3
		dw loc_1272		; 4
		dw loc_1275		; 5
		dw loc_1272		; 6
		dw loc_1272		; 7
		dw loc_127F		; 8
		dw loc_1294		; 9
		dw loc_129C		; 0Ah
		dw loc_12A4		; 0Bh
		dw loc_12C8		; 0Ch
		dw loc_12D2		; 0Dh
		dw loc_12D5		; 0Eh
		dw loc_12F6		; 0Fh
		dw loc_12F9		; 10h
		dw loc_131C		; 11h
		dw loc_131C		; 12h
		dw loc_131C		; 13h
		dw loc_131F		; 14h
		dw loc_134F		; 15h
		dw loc_136D		; 16h
		dw loc_13F7		; 17h
		dw loc_11DB		; 18h
		dw loc_11E2		; 19h
		dw loc_11E9		; 1Ah
		dw loc_11F0		; 1Bh
		dw loc_11F7		; 1Ch
		dw loc_11FE		; 1Dh
		dw loc_1205		; 1Eh
		dw loc_120C		; 1Fh
		dw loc_1425		; 20h
		dw loc_E86		; 21h
		dw loc_E97		; 22h
		dw loc_ECA		; 23h
		dw loc_EFD		; 24h
		dw loc_F26		; 25h
		dw loc_F4F		; 26h
		dw loc_142B		; 27h
; ---------------------------------------------------------------------------

loc_11DB:
		ld	(ix+25h), 0
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_11E2:
		ld	(ix+25h), 18h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_11E9:
		ld	(ix+25h), 30h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_11F0:
		ld	(ix+25h), 48h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_11F7:
		ld	(ix+25h), 60h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_11FE:
		ld	(ix+25h), 78h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1205:
		ld	(ix+25h), 90h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_120C:
		ld	(ix+25h), 0A8h
		jp	loc_108B
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_FC3

loc_1213:
		and	7
		ld	c, a
		jp	z, loc_1229
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_1229
		ld	c, a
		ld	b, 0
		ld	hl, 8100h
		add	hl, bc
		ld	c, (hl)

loc_1229:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1B1E), a
		jp	loc_108B
; END OF FUNCTION CHUNK	FOR sub_FC3
; ---------------------------------------------------------------------------

loc_1233:
		ld	a, (de)
		inc	de
		add	a, a
		add	a, a
		add	a, a
		ld	(ix+53h), a

loc_123B:
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_123E:
		ld	a, (de)
		inc	de
		ld	(ix+58h), a
		or	a
		jp	m, loc_1255
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1255:
		and	7Fh
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, 0A058h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+30h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+31h), a
		ld	(ix+35h), 1
		ld	(ix+36h), 0

loc_1272:
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1275:
		ld	a, (ix+1Ah)
		ld	(ix+1Bh), a
		xor	a
		jp	loc_10AB
; ---------------------------------------------------------------------------

loc_127F:
		ld	a, (de)
		inc	de
		ld	(ix+51h), a
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		call	sub_12AA
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1294:
		ld	a, (de)
		inc	de
		ld	(ix+51h), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_129C:
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_12A4:
		call	sub_12AA
		jp	loc_108B

; =============== S U B R O U T I N E =======================================


sub_12AA:
		call	sub_1440
		ld	a, (de)
		inc	de
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	bc, 0AA24h
		add	hl, bc
		inc	a
		ld	(byte_1B1E), a
		jp	sub_1487
; End of function sub_12AA

; ---------------------------------------------------------------------------

loc_12C8:
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		ld	a, 0FFh
		ld	(byte_1B1E), a

loc_12D2:
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_12D5:
		ld	a, (de)
		inc	de
		ld	(ix+54h), a
		or	a
		jp	z, loc_108B
		ld	(ix+26h), 1
		ld	a, (de)
		inc	de
		ld	(ix+28h), a
		ld	a, (de)
		inc	de
		ld	(ix+27h), a
		ld	a, (de)
		inc	de
		ld	(ix+2Ah), a
		ld	a, (de)
		inc	de
		ld	(ix+29h), a

loc_12F6:
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_12F9:
		ld	(ix+56h), 0
		ld	a, (de)
		inc	de
		ld	(ix+55h), a
		or	a
		jp	z, loc_108B
		ld	(ix+2Ch), a
		ld	a, (de)
		inc	de
		or	a
		jp	m, loc_1317
		neg
		ld	(ix+2Bh), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1317:
		and	7Fh
		ld	(ix+2Bh), a

loc_131C:
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_131F:
		ld	a, (de)
		inc	de
		ld	c, a
		and	7Fh
		ld	b, 0
		rlca
		rlca
		rl	b
		rlca
		rl	b
		rlca
		rl	b
		and	0F0h
		bit	7, c
		jp	nz, loc_1340
		ld	(ix+5Dh), a
		ld	(ix+5Eh), b
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1340:
		ld	c, a
		xor	a
		ld	l, a
		ld	h, a
		sbc	hl, bc
		ld	(ix+5Dh), l
		ld	(ix+5Eh), h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_134F:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_1363
		and	7Fh
		neg
		ld	(ix+4Eh), a
		ld	(ix+4Fh), 0FFh
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1363:
		ld	(ix+4Eh), a
		ld	(ix+4Fh), 0
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_136D:
		ld	a, (ix+59h)
		or	a
		jp	nz, loc_1391
		ld	(ix+59h), 1
		ld	(ix+5Ah), a
		ld	(ix+5Bh), a
		ld	(ix+5Ch), a
		ld	(ix+38h), e
		ld	(ix+39h), d
		inc	de
		inc	de
		inc	de
		inc	a
		ld	(byte_1B1E), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1391:
		ld	(byte_1B1E), a
		ld	l, (ix+38h)
		ld	h, (ix+39h)
		ld	a, (ix+59h)
		cp	(hl)
		jp	z, loc_13E7
		inc	(ix+59h)
		ex	de, hl
		inc	de
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_13C8
		jp	p, loc_13B8
		and	7Fh
		neg
		ld	b, 0FFh
		jp	loc_13BA
; ---------------------------------------------------------------------------

loc_13B8:
		ld	b, 0

loc_13BA:
		ld	c, a
		ld	l, (ix+5Bh)
		ld	h, (ix+5Ch)
		add	hl, bc
		ld	(ix+5Bh), l
		ld	(ix+5Ch), h

loc_13C8:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_108B
		jp	m, loc_13DC
		neg
		add	a, (ix+5Ah)
		ld	(ix+5Ah), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_13DC:
		and	7Fh
		add	a, (ix+5Ah)
		ld	(ix+5Ah), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_13E7:
		xor	a
		ld	(ix+59h), a
		ld	(ix+5Ah), a
		ld	(ix+5Bh), a
		ld	(ix+5Ch), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_13F7:
		ld	a, (de)
		inc	de
		ld	(ix+57h), a
		or	a
		jp	z, loc_108B
		ld	a, (de)
		inc	de
		or	a
		jp	m, loc_1411
		ld	(ix+21h), a
		ld	a, (de)
		inc	de
		ld	(ix+20h), a
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1411:
		and	7Fh
		ld	b, a
		ld	a, (de)
		inc	de
		ld	c, a
		xor	a
		ld	l, a
		ld	h, a
		sbc	hl, bc
		ld	(ix+20h), l
		ld	(ix+21h), h
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_1425:
		call	loc_1474
		jp	loc_108B
; ---------------------------------------------------------------------------

loc_142B:
		xor	a
		ld	(ix+1),	a
		ld	(ix+4),	a
		jp	sub_1466
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_1435:
		ld	a, (ix+0)
		or	0F0h
		ex	af, af'
		ld	a, 28h
		jp	sub_8
; END OF FUNCTION CHUNK	FOR sub_524

; =============== S U B R O U T I N E =======================================


sub_1440:
		ld	a, (ix+0)
		ex	af, af'
		ld	a, 28h
		jp	sub_8
; End of function sub_1440


; =============== S U B R O U T I N E =======================================


sub_1449:
		ld	c, 4
		ld	a, (ix+0Ah)
		ex	af, af'
		ld	a, 80h
		rst	28h
		ld	a, (ix+0Ch)
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (ix+0Bh)
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (ix+0Dh)
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_1449


; =============== S U B R O U T I N E =======================================


sub_1466:
		ld	a, (ix+0)
		ex	af, af'
		ld	a, 28h
		rst	8
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h

loc_1474:
		ld	c, 4
		ld	a, 0FFh
		ex	af, af'
		ld	a, 80h
		rst	28h
		ex	af, af'
		add	a, c
		rst	18h
		ex	af, af'
		add	a, c
		rst	18h
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_1466


; =============== S U B R O U T I N E =======================================


sub_1487:
		ld	bc, 2010h
		ld	a, (hl)
		inc	hl
		and	3Fh
		ld	(ix+0Eh), a
		ex	af, af'
		ld	a, 0B0h
		rst	28h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 30h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+6),	a
		call	sub_14EE
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ah), a
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 38h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+7),	a
		call	sub_14EE
		ld	a, (hl)
		inc	hl
		ld	(ix+0Bh), a
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 34h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		call	sub_14EE
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ch), a
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 3Ch
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+9),	a
		call	sub_14EE
		ld	a, (hl)
		ld	(ix+0Dh), a
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_1487


; =============== S U B R O U T I N E =======================================


sub_14EE:
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, b
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_14EE


; =============== S U B R O U T I N E =======================================


sub_14FF:
		ld	bc, 2010h
		ld	a, (hl)
		inc	hl
		and	3Fh
		ld	(ix+0Eh), a
		ex	af, af'
		ld	a, 0B0h
		rst	28h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 30h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+6),	a
		call	sub_1542
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 38h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+7),	a
		call	sub_1542
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 34h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		call	sub_1542
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 3Ch
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+9),	a
; End of function sub_14FF


; =============== S U B R O U T I N E =======================================


sub_1542:
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, b
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, c
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_1542


; =============== S U B R O U T I N E =======================================


sub_1558:
		ld	b, 2

loc_155A:
		ld	a, h
		cp	8
		jp	c, loc_1568
		inc	b
		srl	h
		rr	l
		jp	loc_155A
; ---------------------------------------------------------------------------

loc_1568:
		ld	e, (ix+5Ah)
		ld	d, (ix+5Bh)
		add	hl, de

loc_156F:
		ld	a, h
		cp	8
		jp	c, loc_157D
		inc	b
		srl	h
		rr	l
		jp	loc_156F
; ---------------------------------------------------------------------------

loc_157D:
		ld	a, b
		and	7
		rlca
		rlca
		rlca
		or	h
		ex	af, af'
		ld	a, 0A4h
		rst	28h
		ld	a, l
		ex	af, af'
		sub	4
		jp	sub_18
; End of function sub_1558


; =============== S U B R O U T I N E =======================================


sub_158F:
		ld	b, 2

loc_1591:
		ld	a, h
		cp	8
		jp	c, loc_157D
		inc	b
		srl	h
		rr	l
		jp	loc_1591
; End of function sub_158F


; =============== S U B R O U T I N E =======================================


sub_159F:
		ld	b, a
		ld	a, (ix+0Eh)
		and	7
		ld	e, a
		ld	d, 0
		ld	hl, byte_15E2
		add	hl, de
		ld	e, (hl)
		ld	a, 3Ch
		exx
		or	b
		exx
		ex	af, af'
		ld	a, (ix+6)
		call	sub_15C8
		ld	a, (ix+8)
		call	sub_15C8
		ld	a, (ix+7)
		call	sub_15C8
		ld	a, (ix+9)
; End of function sub_159F


; =============== S U B R O U T I N E =======================================


sub_15C8:
		rlc	e
		jp	nc, loc_15DC
		add	a, b
		jp	p, loc_15DC
		cp	0C0h
		jp	nc, loc_15DB
		ld	a, 6Fh
		jp	loc_15DC
; ---------------------------------------------------------------------------

loc_15DB:
		xor	a

loc_15DC:
		ex	af, af'
		add	a, 4

loc_15DF:
		jp	sub_18
; End of function sub_15C8

; ---------------------------------------------------------------------------
byte_15E2:	db 10h,	10h, 10h, 10h, 30h, 70h, 70h, 0F0h

; =============== S U B R O U T I N E =======================================


sub_15EA:
		ld	c, (ix+5Ah)
		ld	b, (ix+5Bh)
		add	hl, bc
		ld	a, l
		and	0Fh
		exx
		or	b
		ld	(de), a
		exx
		ld	a, l
		srl	h
		rra
		srl	h
		rra
		rra
		rra
		and	3Fh
		ld	(7F11h), a
		ret
; End of function sub_15EA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_524

loc_1607:
		cp	10h
		jp	c, loc_1617
		cp	0F0h
		jp	nc, loc_1616

loc_1611:
		ld	a, 1Fh
		jp	loc_1619
; ---------------------------------------------------------------------------

loc_1616:
		xor	a

loc_1617:
		or	10h

loc_1619:
		exx
		or	b
		ld	(de), a

loc_161C:
		exx
		ret
; END OF FUNCTION CHUNK	FOR sub_524
; ---------------------------------------------------------------------------
		dw loc_163C
		dw loc_168B
		dw loc_16C5
		dw loc_16FF
		dw loc_1739
		dw loc_1773
		dw loc_17AD
		dw loc_17CB
		dw loc_17DE
		dw loc_182B
		dw loc_1852
		dw loc_1865
		dw loc_18AA
		dw loc_1865
		dw loc_1865
; ---------------------------------------------------------------------------

loc_163C:
		ld	hl, 0B3E8h
		call	sub_14FF
		ld	(ix+1Fh), 50h
		ld	de, loc_1664
		ld	hl, 1C0h

loc_164C:
		ld	(ix+1Dh), e
		ld	(ix+1Eh), d
		ld	(ix+21h), l
		ld	(ix+22h), h
		call	sub_158F
		ld	a, (ix+23h)
		call	sub_159F
		jp	loc_1435
; ---------------------------------------------------------------------------

loc_1664:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_1684
		ld	bc, 0FFEAh
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_1684:
		ld	bc, 240h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_168B:
		ld	hl, 0B307h
		call	sub_14FF
		ld	(ix+1Fh), 80h
		ld	de, loc_169E
		ld	hl, 720h
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_169E:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_16BE
		ld	bc, 0FFD0h
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_16BE:
		ld	bc, 220h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_16C5:
		ld	hl, 0B2EEh
		call	sub_14FF
		ld	(ix+1Fh), 60h
		ld	de, loc_16D8
		ld	hl, 920h
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_16D8:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_16F8
		ld	bc, 0FF9Eh
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_16F8:
		ld	bc, 20h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_16FF:
		ld	hl, 0B352h
		call	sub_14FF
		ld	(ix+1Fh), 80h
		ld	de, loc_1712
		ld	hl, 900h
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_1712:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_1732
		ld	bc, 0FFFCh
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_1732:
		ld	bc, 400h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_1739:
		ld	hl, 0B36Bh
		call	sub_14FF
		ld	(ix+1Fh), 80h
		ld	de, loc_174C
		ld	hl, 610h
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_174C:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_176C
		ld	bc, 0FFF8h
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_176C:
		ld	bc, 400h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_1773:
		ld	hl, 0B384h
		call	sub_14FF
		ld	(ix+1Fh), 80h
		ld	de, loc_1786
		ld	hl, 480h
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_1786:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		bit	0, (ix+1Fh)
		jp	nz, loc_17A6
		ld	bc, 0FFF4h
		add	hl, bc
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_17A6:
		ld	bc, 500h
		add	hl, bc
		jp	sub_158F
; ---------------------------------------------------------------------------

loc_17AD:
		ld	hl, 0B320h
		call	sub_14FF
		ld	(ix+1Fh), 40h
		ld	de, loc_17C0
		ld	hl, 50ABh
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_17C0:
		dec	(ix+1Fh)
		ret	nz

loc_17C4:
		set	0, (ix+50h)
		jp	sub_1440
; ---------------------------------------------------------------------------

loc_17CB:
		ld	hl, 0B339h
		call	sub_14FF
		ld	(ix+1Fh), 50h
		ld	de, loc_17C0
		ld	hl, 70ABh
		jp	loc_164C
; ---------------------------------------------------------------------------

loc_17DE:
		ld	hl, 0B39Dh
		call	sub_14FF
		ld	(ix+1Fh), 60h
		ld	(ix+20h), 2
		ld	de, loc_1804
		ld	hl, 0B01h

loc_17F2:
		ld	(ix+1Dh), e
		ld	(ix+1Eh), d
		call	sub_158F
		ld	a, (ix+23h)
		call	sub_159F
		jp	loc_1435
; ---------------------------------------------------------------------------

loc_1804:
		dec	(ix+20h)
		ret	nz
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	(ix+20h), 2
		ld	hl, 0B00h
		bit	0, (ix+1Fh)
		jp	nz, loc_181F
		ld	hl, 0B01h

loc_181F:
		call	sub_158F
		inc	(ix+23h)
		ld	a, (ix+23h)
		jp	sub_159F
; ---------------------------------------------------------------------------

loc_182B:
		ld	hl, 0B3B6h
		call	sub_14FF
		ld	(ix+1Fh), 60h
		ld	de, loc_183E
		ld	hl, 0A01h
		jp	loc_17F2
; ---------------------------------------------------------------------------

loc_183E:
		dec	(ix+1Fh)
		jp	z, loc_17C4
		bit	0, (ix+1Fh)
		ret	nz
		inc	(ix+23h)
		ld	a, (ix+23h)
		jp	sub_159F
; ---------------------------------------------------------------------------

loc_1852:
		ld	hl, 0B3CFh
		call	sub_14FF
		ld	(ix+1Fh), 60h
		ld	de, loc_183E
		ld	hl, 400h
		jp	loc_17F2
; ---------------------------------------------------------------------------

loc_1865:
		ld	hl, 0B3CFh
		call	sub_14FF
		ld	hl, 2B0h

loc_186E:
		ld	(ix+1Fh), 40h
		ld	(ix+20h), 2
		ld	de, loc_1882
		ld	(ix+21h), l
		ld	(ix+22h), h
		jp	loc_17F2
; ---------------------------------------------------------------------------

loc_1882:
		dec	(ix+20h)
		ret	nz
		dec	(ix+1Fh)
		jp	z, loc_17C4
		ld	(ix+20h), 2
		ld	l, (ix+21h)
		ld	h, (ix+22h)
		dec	hl
		ld	(ix+21h), l
		ld	(ix+22h), h
		call	sub_158F
		ld	a, (ix+23h)
		inc	a
		ld	(ix+23h), a
		jp	sub_159F
; ---------------------------------------------------------------------------

loc_18AA:
		ld	hl, 0B3CFh
		call	sub_14FF
		ld	hl, 200h
		jp	loc_186E
; ---------------------------------------------------------------------------
byte_18B6:	db 0
		db 10h
		db 12h
		db 12h
		db 11h
		db 14h
		db 14h
		db 1Ch
		db 10h
		db  16h
		db  12h
		db  1Ah
		db  18h
		db  16h
		db  16h
		db  16h
		db  1Bh
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  14h
		db  18h
		db  16h
		db  14h
		db  14h
		db  16h
		db  13h
		db  14h
		db  14h
		db  14h
		db  16h
		db  12h
		db  1Ah
		db  19h
		db  19h
		db  19h
		db  18h
		db  18h
		db  16h
		db  18h
		db  16h
		db  18h
		db  18h
		db  18h
		db  1Eh
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  14h
		db  14h
		db  14h
		db  16h
		db  18h
		db  14h
		db  14h
		db  14h
		db  1Bh
		db  16h
		db  14h
		db  14h
		db  16h
		db  14h
		db  16h
		db  16h
		db  1Bh
		db  1Dh
		db  18h
		db  18h
		db  18h
		db  18h
		db  16h
		db  16h
		db  13h
		db  13h
		db  13h
		db  13h
		db  16h
		db  16h
		db  16h
		db  18h
		db  14h
		db  15h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  13h
		db  10h
		db  14h
		db  13h
		db  13h
		db  13h
		db  11h
		db  11h
		db  2Bh
		db  20h
		db  2Ch
		db  28h
		db  25h
		db  2Eh
		db  2Fh
		db  24h
		db  28h
		db  24h
		db  24h
		db  28h
		db  28h
		db  24h
		db  2Ah
		db  2Ah
		db  26h
		db  26h
		db  26h
		db  26h
		db  26h
		db  2Dh
		db  2Ah
		db  28h
		db  2Dh
		db  28h
		db  28h
		db  2Ch
		db  2Ah
		db  2Ah
		db  2Ah
		db  2Eh
		db  22h
		db  26h
		db  24h
		db  2Bh
		db  26h
		db  28h
		db  2Dh
		db  22h
		db  21h
		db  29h
		db  28h
		db  2Ah
		db  22h
		db  24h
		db  28h
		db  26h
		db  29h
		db  2Dh
		db  2Ah
MusicOffset:
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank2_Offset, Music_Bank2_Offset, Music_Bank2_Offset
		db Music_Bank2_Offset, Music_Bank2_Offset, Music_Bank3_Offset, Music_Bank3_Offset, Music_Bank3_Offset, Music_Bank3_Offset, Music_Bank3_Offset, Music_Bank3_Offset, Music_Bank4_Offset, Music_Bank4_Offset, Music_Bank4_Offset
		db Music_Bank4_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank5_Offset, Music_Bank6_Offset, Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset,	Music_Bank_Offset, Music_Bank_Offset
		db Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset, Music_Bank_Offset
		db 12h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1B00:	db 0
byte_1B01:	db 0
byte_1B02:	db 0
byte_1B03:	db 0
		db    0
		db    0
		db    0
		db    0
byte_1B08:	db 0
byte_1B09:	db 0
byte_1B0A:	db 0
byte_1B0B:	db 0
byte_1B0C:	db 0
byte_1B0D:	db 0
byte_1B0E:	db 0
byte_1B0F:	db 0
		db    0
		db    0
word_1B12:	dw 0
word_1B14:	dw 0
byte_1B16:	db 0
		db    0
byte_1B18:	db 0
byte_1B19:	db 0
		db    0
byte_1B1B:	db 0
byte_1B1C:	db 0
byte_1B1D:	db 0
byte_1B1E:	db 0
byte_1B1F:	db 0
byte_1B20:	db 0
byte_1B21:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
MusBank:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1B40:	db 0
byte_1B41:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1BA0:	db 0
byte_1BA1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1C00:	db 0
byte_1C01:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1C60:	db 0
byte_1C61:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1CAE:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1CC0:	db 0
byte_1CC1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D0E:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D20:	db 0
byte_1D21:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D4F:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D5A:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D80:	db 0
byte_1D81:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1DE0:	db 0
byte_1DE1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1E40:	db 0
byte_1E41:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1EA0:	db 0
byte_1EA1:	db 0
		db    0
		db    0
byte_1EA4:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1F00:	db 0
byte_1F01:	db 0
		db    0
		db    0
byte_1F04:	db 0

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
