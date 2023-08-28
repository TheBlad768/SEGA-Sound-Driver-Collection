; ---------------------------------------------------------------------------
; Konami Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($288000>>15)
Music_Bank2_Offset:			equ ($290000>>15)
Samples_Bank_Offset:			equ ($288000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		!org	0
		CPU Z80
		listing on

		di
		ld	sp, byte_1FFF
		jp	loc_68
; End of function start
; ---------------------------------------------------------------------------
		db 0

loc_8:
		ld	hl, 4000h

loc_B:
		bit	7, (hl)
		jr	nz, loc_B
		ld	(hl), a
		ex	af, af'

loc_11:
		bit	7, (hl)
		jr	nz, loc_11
		inc	l
		ld	(hl), a
		ret
; END OF FUNCTION CHUNK	FOR sub_247

; =============== S U B R O U T I N E =======================================


sub_18:
		exx
		or	b

loc_1A:
		bit	7, (hl)
		jr	nz, loc_1A
		ld	(de), a
		ex	af, af'
		inc	e

loc_21:
		bit	7, (hl)
		jr	nz, loc_21
		ld	(de), a
		dec	e
		exx
		ret
; End of function sub_18

; ---------------------------------------------------------------------------
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

; =============== S U B R O U T I N E =======================================


nullsub_1:
		reti
; End of function nullsub_1

; ---------------------------------------------------------------------------
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
		db 0

; =============== S U B R O U T I N E =======================================


nullsub_2:
		retn
; End of function nullsub_2

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_68:
		ld	iy, byte_1F00
		call	sub_1EE5
		ld	a, 0
		ld	(byte_1E32), a
		ld	a, Music_Bank_Offset
		call	LoadBank
		call	sub_1E61
		ld	hl, 4000h
		ld	b, 2Bh
		ld	a, 0
		ld	(iy+0),	1

loc_87:
		bit	7, (hl)
		jr	nz, loc_87
		ld	(hl), b

loc_8C:
		bit	7, (hl)
		jr	nz, loc_8C
		ld	(4001h), a
		ld	(iy+0),	0
		ld	b, 0B6h
		ld	a, 0C0h
		ld	(iy+0),	1

loc_9F:
		bit	7, (hl)
		jr	nz, loc_9F
		push	af
		ld	a, b
		ld	(4002h), a
		pop	af

loc_A9:
		bit	7, (hl)
		jr	nz, loc_A9
		ld	(4003h), a
		ld	(iy+0),	0
		call	sub_1E3

loc_B7:
		call	sub_300
		call	sub_55F
		call	sub_CE
		ld	a, (byte_1E32)
		cp	1
		jp	z, loc_355
		call	sub_1EC5
		jp	loc_B7
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_CE:
		ld	a, (byte_1E30)
		or	a
		jr	z, locret_143
		cp	1
		jr	z, loc_13F
		ld	a, 1
		ld	(byte_1E32), a
		call	sub_1E3
		ld	a, Samples_Bank_Offset
		call	LoadBank
		ld	a, (0B037h)
		ld	c, a
		ld	a, (0B036h)
		ld	b, a
		sla	a
		ld	a, (0B035h)
		rla
		call	LoadBank
		ld	a, b
		or	80h
		ld	h, a
		ld	l, c
		ld	bc, byte_1B00
		ld	de, sub_300
		ldir
		ld	hl, 4000h
		ld	b, 2Bh
		ld	a, 80h
		ld	(iy+0),	1

loc_10E:
		bit	7, (hl)
		jr	nz, loc_10E
		ld	(hl), b

loc_113:
		bit	7, (hl)
		jr	nz, loc_113
		ld	(4001h), a
		ld	(iy+0),	0
		ld	b, 0B6h
		ld	a, 0C0h
		ld	(iy+0),	1

loc_126:
		bit	7, (hl)
		jr	nz, loc_126
		push	af
		ld	a, b
		ld	(4002h), a
		pop	af

loc_130:
		bit	7, (hl)
		jr	nz, loc_130
		ld	(4003h), a
		ld	(iy+0),	0
		exx
		ld	b, 32h
		exx

loc_13F:
		xor	a
		ld	(byte_1E30), a

locret_143:
		ret
; End of function sub_CE


; =============== S U B R O U T I N E =======================================


sub_144:
		ld	a, (byte_1E30)
		or	a
		jp	z, loc_1D9
		cp	2
		jp	z, loc_1D5
		xor	a
		ld	(byte_1E32), a
		ld	hl, 4000h
		ld	a, 80h
		ld	(iy+0),	1

loc_15D:
		bit	7, (hl)
		jr	nz, loc_15D
		ld	(hl), 2Ah

loc_163:
		bit	7, (hl)
		jr	nz, loc_163
		ld	(4001h), a
		ld	(iy+0),	0
		xor	a
		ld	(byte_1F03), a
		ld	(byte_1F05), a
		ld	(byte_1F02), a
		ld	(byte_1F04), a
		ld	a, Samples_Bank_Offset
		call	LoadBank
		ld	a, (0B03Bh)
		ld	c, a
		ld	a, (0B03Ah)
		ld	b, a
		sla	a
		ld	a, (0B039h)
		rla
		call	LoadBank
		ld	a, b
		or	80h
		ld	h, a
		ld	l, c
		ld	bc, byte_1B00
		ld	de, sub_300
		ldir
		ld	hl, 4000h
		ld	b, 2Bh
		xor	a
		ld	(iy+0),	1

loc_1A8:
		bit	7, (hl)
		jr	nz, loc_1A8
		ld	(hl), b

loc_1AD:
		bit	7, (hl)
		jr	nz, loc_1AD
		ld	(4001h), a
		ld	(iy+0),	0
		ld	b, 0B6h
		ld	a, 0C0h
		ld	(iy+0),	1

loc_1C0:
		bit	7, (hl)
		jr	nz, loc_1C0
		push	af
		ld	a, b
		ld	(4002h), a
		pop	af

loc_1CA:
		bit	7, (hl)
		jr	nz, loc_1CA
		ld	(4003h), a
		ld	(iy+0),	0

loc_1D5:
		xor	a
		ld	(byte_1E30), a

loc_1D9:
		ld	a, (byte_1E32)
		or	a
		jp	nz, sub_300
		jp	loc_B7
; End of function sub_144


; =============== S U B R O U T I N E =======================================


sub_1E3:
		ld	hl, byte_1A00
		ld	bc, 319h

loc_1E9:
		ld	(hl), 0
		inc	hl
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_1E9
		call	sub_1F9
		call	sub_205
		ret
; End of function sub_1E3

; =============== S U B R O U T I N E =======================================

sub_1F9:
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		ret
; End of function sub_1F9

; =============== S U B R O U T I N E =======================================

sub_205:
		ld	ix, byte_1A00
		exx
		ld	hl, 4000h
		ld	de, 4000h
		exx
		xor	a
		ld	(byte_1D05), a

loc_215:
		exx
		cp	3
		jp	c, loc_220
		sub	3
		ld	de, 4002h

loc_220:
		ld	b, a
		exx
		call	sub_235
		ld	de, 80h
		add	ix, de
		ld	hl, byte_1D05
		inc	(hl)
		ld	a, (hl)
		cp	6
		jp	nz, loc_215
		ret
; End of function sub_205

; =============== S U B R O U T I N E =======================================

sub_235:
		ld	a, 0FFh
		ex	af, af'
		ld	a, 80h
		rst	18h
		ex	af, af'
		ld	a, 84h
		rst	18h
		ex	af, af'
		ld	a, 88h
		rst	18h
		ex	af, af'
		ld	a, 8Ch
		rst	18h
; End of function sub_235


; =============== S U B R O U T I N E =======================================


sub_247:

; FUNCTION CHUNK AT 0008 SIZE 00000010 BYTES

		ld	a, (byte_1D05)
		ld	hl, byte_25A
		add	a, l
		ld	l, a
		jp	nc, loc_253
		inc	h

loc_253:
		ld	a, (hl)
		ex	af, af'
		ld	a, 28h
		jp	loc_8
; End of function sub_247

; ---------------------------------------------------------------------------
byte_25A:	db 0, 1, 2, 4, 5, 6
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
		jp	loc_B7
; ---------------------------------------------------------------------------
		jp	sub_144

; =============== S U B R O U T I N E =======================================


sub_300:
		ld	a, (byte_1E18)
		or	a
		ret	z
		cp	0F0h
		jp	c, loc_310
		call	sub_326
		jp	loc_321
; ---------------------------------------------------------------------------

loc_310:
		cp	0BDh
		jp	c, loc_31B
		call	sub_385

loc_318:
		ld	a, (byte_1E18)

loc_31B:
		ld	(byte_1D09), a
		call	sub_3D3

loc_321:
		xor	a
		ld	(byte_1E18), a
		ret
; End of function sub_300


; =============== S U B R O U T I N E =======================================


sub_326:
		sub	0F1h
		call	sub_528
		ex	(sp), hl
		ld	bc, sub_385
		ld	e, (hl)
		inc	bc
		ld	h, h
		inc	bc
		ld	c, e
		inc	bc
		ld	e, b
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	l, c
		inc	bc
		ld	a, 1
		ld	(byte_1D04), a
		ld	a, 0BAh
		ld	(byte_1D09), a

loc_355:
		jp	sub_3D3
; End of function sub_326

; ---------------------------------------------------------------------------
		ld	a, 3
		ld	(byte_1D04), a
		ret
; ---------------------------------------------------------------------------
		ld	a, 1
		ld	(byte_1D08), a
		ret
; ---------------------------------------------------------------------------
		xor	a
		ld	(byte_1D08), a
		ret
; ---------------------------------------------------------------------------
		sub	6
		ld	hl, byte_17B9
		add	a, l
		ld	l, a
		jp	nc, loc_374
		inc	h

loc_374:
		ld	a, (hl)
		ld	(byte_1D02), a
		ld	(byte_1D01), a
		ld	a, 1
		ld	(word_1D12), a
		xor	a
		ld	(word_1D12+1), a
		ret

; =============== S U B R O U T I N E =======================================


sub_385:
		ld	ix, byte_1A00
		exx
		ld	hl, 4000h
		ld	de, 4000h
		exx
		xor	a
		ld	(byte_1D05), a

loc_395:
		exx
		cp	3
		jp	c, loc_3A0
		sub	3
		ld	de, 4002h

loc_3A0:
		ld	b, a
		exx
		ld	(ix+0),	0
		ld	(ix+1),	0
		call	sub_F2F
		call	sub_235
		ld	de, 80h
		add	ix, de
		ld	hl, byte_1D05
		inc	(hl)
		ld	a, (hl)
		cp	6
		jp	nz, loc_395
		xor	a
		ld	(word_1D12), a
		ld	(word_1D12+1), a
		ret
; End of function sub_385

; ---------------------------------------------------------------------------
byte_3C7:	db 0, 0, 80h, 0
		db 0, 1, 80h, 1
		db 0, 2, 80h, 2

; =============== S U B R O U T I N E =======================================


sub_3D3:
		ld	hl, loc_10D9
		ld	c, a
		ld	b, 0
		sla	c
		rl	b
		sla	c
		rl	b
		sla	c
		rl	b
		add	hl, bc
		ld	b, h
		ld	c, l
		ld	a, (bc)
		inc	bc
		ld	(byte_1D0A), a
		ld	a, (bc)
		inc	bc
		ld	(byte_1D05), a
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, byte_3C7
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	ix, byte_1A00
		add	ix, de
		ld	a, (bc)
		inc	bc
		ld	(byte_1D0B), a
		ld	a, (bc)
		inc	bc
		ld	(byte_1D0C), a
		call	LoadBank
		ld	a, (bc)
		inc	bc
		ld	d, a
		ld	a, (bc)
		ld	b, a
		ld	c, d
		exx
		ld	hl, 4000h
		ld	de, 4000h
		exx

loc_41E:
		ld	a, (byte_1D0B)
		cp	(ix+1)
		jp	c, loc_516
		ld	(ix+1),	a
		ld	a, (bc)
		inc	bc
		ld	(ix+66h), a
		ld	(ix+62h), a
		ld	(ix+64h), a
		ld	(ix+5Eh), a
		ld	a, (bc)
		inc	bc
		ld	(ix+67h), a
		ld	(ix+63h), a
		ld	(ix+65h), a
		ld	(ix+5Fh), a
		ld	(ix+4),	0FFh
		ld	(ix+1Eh), 1
		ld	(ix+5),	1
		ld	(ix+40h), 7Fh
		ld	(ix+12h), 7Fh
		ld	(ix+23h), 0FFh
		ld	(ix+22h), 0
		ld	(ix+21h), 0
		ld	(ix+20h), 0
		ld	(ix+13h), 0
		ld	(ix+15h), 0
		ld	(ix+30h), 0
		ld	(ix+31h), 0
		ld	(ix+2Ch), 0
		ld	(ix+2Dh), 0
		ld	(ix+10h), 0
		ld	(ix+11h), 0
		ld	(ix+6),	0
		ld	(ix+7),	0
		ld	(ix+2),	0
		ld	(ix+3),	0
		ld	(ix+1Ah), 0
		ld	(ix+1Bh), 0
		ld	(ix+1Ch), 0
		ld	(ix+1Dh), 0
		ld	(ix+36h), 0
		ld	(ix+37h), 0
		ld	(ix+38h), 0
		ld	(ix+39h), 0
		ld	(ix+3Ah), 0
		ld	(ix+3Bh), 0
		ld	(ix+3Ch), 0
		ld	(ix+3Dh), 0
		ld	(ix+54h), 0
		ld	(ix+55h), 0
		ld	(ix+4Ch), 0
		ld	(ix+4Dh), 0
		ld	(ix+56h), 0
		ld	(ix+57h), 0
		ld	(ix+68h), 0
		ld	(ix+69h), 0
		ld	(ix+6Ah), 0
		ld	(ix+6Bh), 0
		ld	a, (byte_1D09)
		ld	(ix+0),	a
		ld	a, (byte_1D0C)
		ld	(ix+34h), a
		ld	a, (byte_1D05)
		exx
		cp	3
		jp	c, loc_50C
		sub	3
		ld	de, 4002h

loc_50C:
		ld	b, a
		exx
		push	bc
		call	sub_F2F
		call	sub_235
		pop	bc

loc_516:
		ld	hl, byte_1D0A
		dec	(hl)
		ret	m
		ld	de, 80h
		add	ix, de
		ld	hl, byte_1D05
		inc	(hl)
		ld	a, (hl)
		jp	loc_41E
; End of function sub_3D3


; =============== S U B R O U T I N E =======================================


sub_528:
		ex	(sp), hl
		push	af
		push	de
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		pop	de
		pop	af
		ex	(sp), hl
		ret
; End of function sub_528


; =============== S U B R O U T I N E =======================================


sub_538:
		push	bc
		ld	b, 8
		and	a

loc_53C:
		adc	hl, hl
		ld	a, h
		jp	c, loc_546
		cp	e
		jp	c, loc_549

loc_546:
		sub	e
		ld	h, a
		and	a

loc_549:
		ccf
		djnz	loc_53C
		rl	l
		pop	bc
		ret
; End of function sub_538


; =============== S U B R O U T I N E =======================================


sub_550:
		push	bc
		ld	e, l
		ld	d, 0
		ld	l, d
		ld	b, 8

loc_557:
		add	hl, hl
		jr	nc, loc_55B
		add	hl, de

loc_55B:
		djnz	loc_557
		pop	bc
		ret
; End of function sub_550


; =============== S U B R O U T I N E =======================================


sub_55F:
		ld	a, (byte_1D04)
		or	a
		jp	z, loc_595
		dec	a
		jp	z, loc_58D
		dec	a
		jp	z, loc_5D0
		ld	ix, byte_1A00
		ld	a, 1
		ld	(byte_1A31), a
		ld	(byte_1AB1), a
		ld	(byte_1B31), a
		ld	(byte_1BB1), a
		ld	(byte_1C31), a
		ld	(byte_1CB1), a
		xor	a
		ld	(byte_1D04), a
		jp	loc_595
; ---------------------------------------------------------------------------

loc_58D:
		call	sub_ED3
		ld	hl, byte_1D04
		inc	(hl)
		ret
; ---------------------------------------------------------------------------

loc_595:
		ld	a, (word_1D12)
		or	a
		jp	z, loc_5D0
		ld	hl, byte_1D01
		dec	(hl)
		jp	nz, loc_5D0
		ld	a, (byte_1D02)
		ld	(byte_1D01), a
		ld	hl, word_1D12
		inc	(hl)
		ld	ix, byte_1A00
		ld	a, 1
		ld	(byte_1A31), a
		ld	(byte_1AB1), a
		ld	(byte_1B31), a
		ld	(byte_1BB1), a
		ld	(byte_1C31), a
		ld	(byte_1CB1), a
		ld	a, (word_1D12)
		cp	50h
		jp	nz, loc_5D0
		call	sub_385

loc_5D0:
		ld	ix, byte_1A00
		exx
		ld	hl, 4000h
		ld	de, 4000h
		exx
		xor	a
		ld	(byte_1D05), a

loc_5E0:
		exx
		cp	3
		jp	c, loc_5EB
		sub	3
		ld	de, 4002h

loc_5EB:
		ld	b, a
		exx
		ld	a, (byte_1D04)
		cp	2
		jp	nz, loc_5FD
		ld	a, (ix+0)
		cp	0BAh
		jp	nz, loc_633

loc_5FD:
		ld	a, (ix+0)
		or	a
		jp	z, loc_633
		ld	a, (ix+34h)
		call	LoadBank
		ld	a, (ix+4)
		add	a, (ix+5)
		ld	(ix+5),	a
		jp	c, loc_620
		ld	(ix+24h), 0
		call	sub_739
		jp	loc_633
; ---------------------------------------------------------------------------

loc_620:
		ld	(ix+24h), 1
		ld	c, (ix+66h)
		ld	b, (ix+67h)
		call	sub_683
		ld	(ix+66h), c
		ld	(ix+67h), b

loc_633:
		ld	de, 80h
		add	ix, de
		ld	hl, byte_1D05
		inc	(hl)
		ld	a, (hl)
		cp	6
		jp	nz, loc_5E0
		ret
; End of function sub_55F

; ---------------------------------------------------------------------------
byte_643:	db 40h
		db 80h
		db 40h
		db 80h
		db 40h
		db 80h
		db 40h
		db 80h
		db 40h
		db 80h
		db 40h
		db 80h
		db 0
		db 0
		db 0
		db 0
		db 0C0h
		db 40h
		db 0C0h
		db 80h
		db 0C0h
		db 40h
		db 0C0h
		db 80h
		db 0C0h
		db 40h
		db 0C0h
		db 80h
		db 0
		db 0
		db 0
		db 0
		db 0C0h
		db 40h
		db 80h
		db 0C0h
		db 40h
		db 80h
		db 0C0h
		db 40h
		db  80h
		db 0C0h
		db 40h
		db  80h
		db    0
		db    0
		db 0
		db 0
		db 0C0h
		db 80h
		db 40h
		db 0C0h
		db 80h
		db 40h
		db 0C0h
		db 80h
		db 40h
		db 0C0h
		db 80h
		db 40h
		db 0
		db 0
		db 0
		db 0

; =============== S U B R O U T I N E =======================================


sub_683:

; FUNCTION CHUNK AT 08CA SIZE 00000136 BYTES
; FUNCTION CHUNK AT 0AC6 SIZE 00000060 BYTES

		dec	(ix+1Eh)
		jp	z, loc_8CA
		ld	a, (ix+16h)
		or	a
		jp	z, loc_6C9
		dec	(ix+15h)
		jp	nz, loc_6C9
		ld	a, (ix+16h)
		ld	(ix+15h), a
		ld	a, (ix+18h)
		sla	a
		sla	a
		sla	a
		sla	a
		add	a, (ix+19h)
		ld	hl, byte_643
		add	a, l
		ld	l, a
		jp	nc, loc_6B3
		inc	h

loc_6B3:
		ld	a, (hl)
		ld	(ix+17h), a
		ld	d, a
		ld	a, (ix+19h)
		inc	a
		cp	0Ch
		jp	nz, loc_6C2
		xor	a

loc_6C2:
		ld	(ix+19h), a
		ld	a, d
		call	sub_F49

loc_6C9:
		xor	a
		cp	(ix+2Ch)
		jp	z, loc_6E2
		cp	(ix+2Eh)
		jp	z, loc_6E2
		dec	(ix+2Eh)
		jp	nz, loc_6E2
		ld	a, (ix+2Ah)
		call	sub_F37

loc_6E2:
		xor	a
		cp	(ix+2Dh)
		jp	z, loc_6FB
		cp	(ix+2Fh)
		jp	z, loc_6FB
		dec	(ix+2Fh)
		jp	nz, loc_6FB
		ld	a, (ix+2Bh)
		call	sub_F40

loc_6FB:
		ld	a, (ix+1Ch)
		or	a
		jp	z, sub_739
		cp	7Fh
		jp	z, sub_739
		xor	a
		cp	(ix+1Ah)
		jp	z, loc_717
		dec	(ix+1Ah)
		jp	nz, sub_739
		call	sub_247

loc_717:
		ld	a, (ix+56h)
		ld	d, (ix+57h)
		ld	e, a
		or	d
		jp	z, sub_739
		ld	(ix+31h), 1
		ld	l, (ix+58h)
		ld	h, (ix+59h)
		add	hl, de
		jp	nc, loc_733
		ld	hl, 0FFFFh

loc_733:
		ld	(ix+58h), l
		ld	(ix+59h), h
; End of function sub_683


; =============== S U B R O U T I N E =======================================


sub_739:
		xor	a
		ld	(byte_1D07), a
		cp	(ix+6)
		jp	z, loc_781
		cp	(ix+8)
		jp	z, loc_755
		cp	(ix+24h)
		jp	z, loc_781
		dec	(ix+8)
		jp	loc_781
; ---------------------------------------------------------------------------

loc_755:
		dec	(ix+6)
		jp	nz, loc_76A
		ld	a, (ix+48h)
		ld	(ix+44h), a
		ld	a, (ix+49h)
		ld	(ix+45h), a
		jp	loc_77C
; ---------------------------------------------------------------------------

loc_76A:
		ld	a, (ix+46h)
		add	a, (ix+44h)
		ld	(ix+44h), a
		ld	a, (ix+47h)
		adc	a, (ix+45h)
		ld	(ix+45h), a

loc_77C:
		ld	a, 1
		ld	(byte_1D07), a

loc_781:
		xor	a
		ld	h, a
		ld	l, a
		ld	(word_1D0E), hl
		cp	(ix+11h)
		jp	z, loc_7E4
		cp	(ix+0Ah)
		jp	z, loc_79F
		cp	(ix+24h)
		jp	z, loc_7E4
		dec	(ix+0Ah)
		jp	loc_7E4
; ---------------------------------------------------------------------------

loc_79F:
		cp	(ix+0Dh)
		jp	z, loc_7D0
		cp	(ix+24h)
		jp	z, loc_7D0
		dec	(ix+0Dh)
		jp	nz, loc_7BE
		ld	a, (ix+11h)
		ld	(ix+4Dh), a
		ld	(ix+4Ch), 0
		jp	loc_7D0
; ---------------------------------------------------------------------------

loc_7BE:
		ld	a, (ix+4Eh)
		add	a, (ix+4Ch)
		ld	(ix+4Ch), a
		ld	a, (ix+4Fh)
		adc	a, (ix+4Dh)
		ld	(ix+4Dh), a

loc_7D0:
		ld	a, (ix+0Ch)
		add	a, (ix+0Bh)
		ld	(ix+0Bh), a
		call	sub_E94
		ld	(word_1D0E), hl
		ld	a, 1
		ld	(byte_1D07), a

loc_7E4:
		ld	de, 0
		ld	a, (ix+20h)
		or	a
		jp	z, loc_819
		add	a, (ix+1Fh)
		ld	(ix+1Fh), a
		jp	nc, loc_819
		ld	e, (ix+50h)
		ld	d, (ix+51h)
		ld	hl, 9157h
		add	hl, de
		inc	de
		ld	a, d
		and	1
		ld	(ix+50h), e
		ld	(ix+51h), a
		ld	a, (hl)
		inc	hl
		and	(ix+53h)
		ld	d, a
		ld	a, (hl)
		and	(ix+52h)
		ld	e, a
		jp	loc_820
; ---------------------------------------------------------------------------

loc_819:
		ld	a, (byte_1D07)
		or	a
		jp	z, sub_82F

loc_820:
		ld	hl, (word_1D0E)
		add	hl, de
		ld	e, (ix+44h)
		ld	d, (ix+45h)
		add	hl, de
		ex	de, hl
		call	sub_10AC
; End of function sub_739


; =============== S U B R O U T I N E =======================================


sub_82F:
		bit	5, (ix+22h)
		jp	z, loc_83B
		res	5, (ix+22h)
		ret
; ---------------------------------------------------------------------------

loc_83B:
		ld	a, (ix+13h)
		or	a
		jp	z, loc_86B
		dec	(ix+13h)
		jp	nz, loc_855
		ld	a, (ix+14h)
		ld	(ix+41h), a
		ld	(ix+40h), 0
		jp	loc_867
; ---------------------------------------------------------------------------

loc_855:
		ld	a, (ix+42h)
		add	a, (ix+40h)
		ld	(ix+40h), a
		ld	a, (ix+43h)
		adc	a, (ix+41h)
		ld	(ix+41h), a

loc_867:
		ld	(ix+31h), 1

loc_86B:
		xor	a
		cp	(ix+31h)
		ret	z
		ld	l, (ix+12h)
		ld	h, a
		ld	d, a
		ld	e, (ix+59h)
		xor	a
		sbc	hl, de
		ld	a, 7Fh
		sub	(ix+41h)
		ld	e, a
		xor	a
		ld	d, a
		sbc	hl, de
		ld	e, (ix+36h)
		ld	d, (ix+37h)
		add	hl, de
		ld	e, (ix+38h)
		ld	d, (ix+39h)
		add	hl, de
		ld	a, (ix+0)
		cp	0BAh
		jp	z, loc_8A3
		ld	de, (word_1D12)
		xor	a
		ld	d, a
		sbc	hl, de

loc_8A3:
		jp	p, loc_8AA
		xor	a
		jp	loc_8BF
; ---------------------------------------------------------------------------

loc_8AA:
		ld	a, h
		or	a
		jp	nz, loc_8B5
		ld	a, l
		cp	80h
		jp	c, loc_8BA

loc_8B5:
		ld	a, 7Fh
		jp	loc_8BF
; ---------------------------------------------------------------------------

loc_8BA:
		ld	a, l
		sra	a
		add	a, 40h

loc_8BF:
		ld	(ix+68h), a
		call	sub_1068
		ld	(ix+31h), 0
		ret
; End of function sub_82F

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_683

loc_8CA:
		ld	a, (bc)
		inc	bc
		ld	(word_1D0E), a
		or	a
		cp	0E0h
		jp	nc, loc_AC6
		jp	loc_8D8
; ---------------------------------------------------------------------------

loc_8D8:
		xor	a
		cp	(ix+33h)
		jp	z, loc_8E6
		ld	(ix+33h), 0
		call	sub_247

loc_8E6:
		ld	(ix+31h), 1
		ld	a, (word_1D0E)
		ld	d, a
		ld	a, (ix+1Bh)
		bit	7, d
		jp	nz, loc_8F8
		ld	a, (bc)
		inc	bc

loc_8F8:
		ld	(ix+1Bh), a
		ld	(ix+1Eh), a
		ld	a, (bc)
		inc	bc
		ld	(word_1D0E+1), a
		or	a
		jp	p, loc_90A
		ld	a, (ix+1Ch)

loc_90A:
		or	a
		jp	z, loc_921
		cp	7Fh
		jp	z, loc_921
		ld	d, a
		ld	a, (ix+1Bh)
		cp	1
		ld	a, d
		jp	nz, loc_921
		ld	(ix+33h), 1

loc_921:
		ld	(ix+1Ch), a
		ld	a, (word_1D0E+1)
		or	a
		jp	m, loc_92D
		ld	a, (bc)
		inc	bc

loc_92D:
		and	7Fh
		ld	(ix+12h), a
		ld	a, (ix+1Ch)
		or	a
		jp	z, loc_93E
		cp	7Fh
		jp	nz, loc_944

loc_93E:
		ld	a, (ix+1Bh)
		jp	loc_952
; ---------------------------------------------------------------------------

loc_944:
		add	a, a
		ld	l, a
		ld	h, (ix+1Bh)
		call	sub_550
		ld	a, h
		or	a
		jp	nz, loc_952
		inc	a

loc_952:
		ld	(ix+1Ah), a
		ld	l, (ix+44h)
		ld	h, (ix+45h)
		ld	(word_1D10), hl
		ld	a, (word_1D0E)
		add	a, (ix+21h)
		ld	h, a
		ld	l, 0
		ld	e, (ix+3Ah)
		ld	d, (ix+3Bh)
		add	hl, de
		ld	e, (ix+3Ch)
		ld	d, (ix+3Dh)
		add	hl, de
		ld	e, (ix+54h)
		ld	d, (ix+55h)
		add	hl, de
		ld	a, h
		and	7Fh
		ld	(ix+45h), a
		ld	(ix+44h), l
		ld	a, (ix+0Fh)
		ld	(ix+0Ah), a
		ld	a, (ix+2Ch)
		ld	(ix+2Eh), a
		ld	a, (ix+2Dh)
		ld	(ix+2Fh), a
		ld	a, (ix+10h)
		ld	(ix+0Dh), a
		or	a
		jp	z, loc_9A9
		ld	(ix+4Ch), 0
		ld	(ix+4Dh), 0

loc_9A9:
		ld	(ix+0Bh), 0
		ld	(ix+58h), 0
		ld	(ix+59h), 0
		ld	a, (bc)
		cp	0F3h
		jp	nz, loc_9C1
		call	sub_A00
		jp	loc_9CE
; ---------------------------------------------------------------------------

loc_9C1:
		ld	a, (ix+7)
		ld	(ix+6),	a
		or	a
		jp	z, loc_9CE
		call	sub_A2A

loc_9CE:
		ld	e, (ix+44h)
		ld	d, (ix+45h)
		call	sub_10AC
		xor	a
		cp	(ix+2Ch)
		jp	z, loc_9E1
		call	sub_F37

loc_9E1:
		xor	a
		cp	(ix+2Dh)
		jp	z, loc_9EB
		call	sub_F40

loc_9EB:
		call	sub_82F
		ld	a, (ix+1Dh)
		cp	7Fh
		jp	z, loc_9F9
		call	sub_F10

loc_9F9:
		ld	a, (ix+1Ch)
		ld	(ix+1Dh), a
		ret
; END OF FUNCTION CHUNK	FOR sub_683

; =============== S U B R O U T I N E =======================================


sub_A00:
		inc	bc
		ld	a, (bc)
		inc	bc
		ld	(ix+8),	a
		ld	a, (bc)
		inc	bc
		ld	(ix+6),	a
		ld	a, (bc)
		inc	bc
		add	a, (ix+21h)
		ld	(ix+48h), 0
		ld	(ix+49h), a
		ld	h, a
		xor	a
		ld	l, a
		cp	(ix+6)
		ret	z
		inc	bc
		ld	a, (bc)
		inc	bc
		ld	(ix+46h), a
		ld	a, (bc)
		inc	bc
		ld	(ix+47h), a
		ret
; End of function sub_A00


; =============== S U B R O U T I N E =======================================


sub_A2A:
		ld	a, (ix+9)
		ld	(ix+8),	a
		ld	l, (ix+44h)
		ld	h, (ix+45h)
		bit	4, (ix+22h)
		jp	nz, loc_A56
		ld	(ix+48h), l
		ld	(ix+49h), h
		ld	(word_1D10), hl
		ld	e, (ix+4Ah)
		ld	d, (ix+4Bh)
		or	a
		sbc	hl, de
		ld	(ix+44h), l
		ld	(ix+45h), h
		ret
; ---------------------------------------------------------------------------

loc_A56:
		ld	a, (word_1D10)
		ld	(ix+44h), a
		ld	a, (word_1D10+1)
		ld	(ix+45h), a
		ld	a, h
		cp	60h
		jp	c, loc_A76
		cp	80h
		jp	c, loc_A73
		ld	hl, 0
		jp	loc_A76
; ---------------------------------------------------------------------------

loc_A73:
		ld	hl, 5FFFh

loc_A76:
		ld	(ix+48h), l
		ld	(ix+49h), h
		ld	e, (ix+44h)
		ld	d, (ix+45h)
		or	a
		sbc	hl, de
		jp	nc, loc_AA0
		ex	de, hl
		ld	hl, 0
		or	a
		sbc	hl, de
		call	sub_AAA
		ex	de, hl
		ld	hl, 0
		or	a
		sbc	hl, de
		ld	(ix+46h), l
		ld	(ix+47h), h
		ret
; ---------------------------------------------------------------------------

loc_AA0:
		call	sub_AAA
		ld	(ix+46h), l
		ld	(ix+47h), h
		ret
; End of function sub_A2A


; =============== S U B R O U T I N E =======================================


sub_AAA:
		ld	e, (ix+6)
		ld	a, h
		cp	e
		jp	nc, loc_AB7
		xor	a
		push	af
		jp	loc_AC0
; ---------------------------------------------------------------------------

loc_AB7:
		ld	d, l
		ld	l, h
		ld	h, 0
		call	sub_538
		push	hl
		ld	l, d

loc_AC0:
		call	sub_538
		pop	de
		ld	h, d
		ret
; End of function sub_AAA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_683

loc_AC6:
		sub	0E0h
		call	sub_528
; ---------------------------------------------------------------------------
		dw loc_B0E		; 0E0h
		dw loc_B26		; 0E1h
		dw loc_B48		; 0E2h
		dw loc_B65		; 0E3h
		dw loc_B89		; 0E4h
		dw loc_BA6		; 0E5h
		dw loc_BC2		; 0E6h
		dw loc_C3A		; 0E7h
		dw loc_BCB		; 0E8h
		dw loc_BE8		; 0E9h
		dw loc_CA0		; 0EAh
		dw loc_DE4		; 0EBh
		dw loc_CA8		; 0ECh
		dw loc_CB0		; 0EDh
		dw loc_CBD		; 0EEh
		dw loc_CCD		; 0EFh
		dw loc_D0C		; 0F0h
		dw loc_D1C		; 0F1h
		dw loc_D36		; 0F2h
		dw loc_D72		; 0F3h
		dw loc_D5C		; 0F4h
		dw loc_D75		; 0F5h
		dw loc_D96		; 0F6h
		dw loc_DA7		; 0F7h
		dw loc_B0B		; 0F8h
		dw loc_E0D		; 0F9h
		dw loc_B0B		; 0FAh
		dw loc_E36		; 0FBh
		dw loc_E49		; 0FCh
		dw loc_E64		; 0FDh
		dw loc_E56		; 0FEh
		dw loc_E6E		; 0FFh
; ---------------------------------------------------------------------------

loc_B0B:
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_B0E:
		ld	a, (bc)
		inc	bc
		ld	(ix+1Bh), a
		ld	(ix+1Eh), a
		xor	a
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		ld	(ix+1Ah), a
		ld	(ix+12h), a
		jp	sub_247
; END OF FUNCTION CHUNK	FOR sub_683
; ---------------------------------------------------------------------------

loc_B26:
		ld	a, (bc)
		inc	bc
		ld	(ix+1Bh), a
		ld	(ix+1Eh), a
		ld	a, (bc)
		inc	bc
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		add	a, a
		ld	l, a
		ld	h, (ix+1Bh)
		call	sub_550
		ld	a, h
		or	a
		jp	nz, loc_B44
		inc	a

loc_B44:
		ld	(ix+1Ah), a
		ret
; ---------------------------------------------------------------------------

loc_B48:
		call	sub_B4E
		jp	loc_8CA

; =============== S U B R O U T I N E =======================================


sub_B4E:

; FUNCTION CHUNK AT 0F6E SIZE 000000F2 BYTES

		ld	a, (bc)
		inc	bc
		cp	(ix+23h)
		ret	z
		ld	(ix+23h), a
		ld	(ix+56h), 0
		ld	(ix+57h), 0
		jp	loc_F6E
; End of function sub_B4E

; ---------------------------------------------------------------------------
		add	a, b
		ret	nz
		ld	b, b

loc_B65:
		ld	a, (bc)
		inc	bc
		or	a
		jp	z, loc_B75
		cp	1
		jp	z, loc_B7A
		ld	a, 40h
		jp	loc_B7C
; ---------------------------------------------------------------------------

loc_B75:
		ld	a, 80h
		jp	loc_B7C
; ---------------------------------------------------------------------------

loc_B7A:
		ld	a, 0C0h

loc_B7C:
		ld	(ix+17h), a
		ld	(ix+16h), 0
		call	sub_F49
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_B89:
		ld	a, (bc)
		inc	bc
		ld	(ix+0Fh), a
		ld	a, (bc)
		inc	bc
		ld	(ix+0Ch), a
		ld	a, (bc)
		inc	bc
		ld	(ix+11h), a
		ld	(ix+4Dh), a
		ld	(ix+4Ch), 0
		ld	(ix+10h), 0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_BA6:
		ld	a, (bc)
		inc	bc
		ld	(ix+20h), a
		ld	a, (bc)
		inc	bc
		ld	(ix+53h), a
		ld	a, (bc)
		inc	bc
		ld	(ix+52h), a
		xor	a
		ld	(ix+1Fh), a
		ld	(ix+50h), a
		ld	(ix+51h), a
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_BC2:
		ld	(ix+62h), c
		ld	(ix+63h), b
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_BCB:
		ld	(ix+64h), c
		ld	(ix+65h), b
		ld	(ix+3),	0
		ld	(ix+38h), 0
		ld	(ix+39h), 0
		ld	(ix+3Ch), 0
		ld	(ix+3Dh), 0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_BE8:
		ld	a, (bc)
		inc	bc
		or	a
		jp	z, loc_BFC
		inc	(ix+3)
		cp	(ix+3)
		jp	nz, loc_BFC
		inc	bc
		inc	bc
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_BFC:
		ld	a, (bc)
		inc	bc
		or	a
		jp	z, loc_C16
		ld	h, 0
		jp	p, loc_C08
		dec	h

loc_C08:
		ld	l, a
		ld	e, (ix+38h)

; =============== S U B R O U T I N E =======================================


sub_C0C:
		ld	d, (ix+39h)
		add	hl, de
		ld	(ix+38h), l
		ld	(ix+39h), h

loc_C16:
		ld	a, (bc)
		inc	bc
		ld	h, 0
		ld	l, a
		or	a
		jp	p, loc_C21
		ld	h, 0FFh

loc_C21:
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	e, (ix+3Ch)
		ld	d, (ix+3Dh)
		add	hl, de
		ld	(ix+3Ch), l
		ld	(ix+3Dh), h
		ld	c, (ix+64h)
		ld	b, (ix+65h)
		jp	loc_8CA
; End of function sub_C0C

; ---------------------------------------------------------------------------

loc_C3A:
		ld	a, (bc)
		inc	bc
		or	a
		jp	z, loc_C62
		inc	(ix+2)
		cp	(ix+2)
		jp	nz, loc_C62
		inc	bc
		inc	bc
		ld	(ix+2),	0
		ld	(ix+36h), 0
		ld	(ix+37h), 0
		ld	(ix+3Ah), 0
		ld	(ix+3Bh), 0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_C62:
		ld	a, (bc)
		inc	bc
		or	a
		jp	z, loc_C7C
		ld	h, 0
		jp	p, loc_C6E
		dec	h

loc_C6E:
		ld	l, a
		ld	e, (ix+36h)
		ld	d, (ix+37h)
		add	hl, de
		ld	(ix+36h), l
		ld	(ix+37h), h

loc_C7C:
		ld	a, (bc)
		inc	bc
		ld	h, 0
		ld	l, a
		or	a
		jp	p, loc_C87
		ld	h, 0FFh

loc_C87:
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	e, (ix+3Ah)
		ld	d, (ix+3Bh)
		add	hl, de
		ld	(ix+3Ah), l
		ld	(ix+3Bh), h
		ld	c, (ix+62h)
		ld	b, (ix+63h)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_CA0:
		ld	a, (bc)
		inc	bc
		ld	(ix+4),	a
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_CA8:
		ld	a, (bc)
		inc	bc
		ld	(ix+21h), a
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_CB0:
		ld	a, (bc)
		inc	bc
		ld	(byte_1D0D), a
		or	8
		call	sub_F29
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_CBD:
		ld	a, (bc)
		inc	bc
		ld	(ix+40h), 0
		ld	(ix+41h), a
		ld	(ix+13h), 0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_CCD:
		ld	a, (bc)
		inc	bc
		ld	(ix+13h), a
		ld	a, (bc)
		inc	bc
		push	bc
		ld	(ix+14h), a
		sub	(ix+41h)
		rr	c
		bit	7, c
		jp	z, loc_CE5
		xor	0FFh
		inc	a

loc_CE5:
		ld	l, a
		ld	h, 0
		ld	e, (ix+13h)
		call	sub_538
		push	hl
		ld	l, 0
		call	sub_538
		pop	de
		ld	h, e
		bit	7, c
		jp	z, loc_D02
		ex	de, hl
		ld	hl, 0
		or	a
		sbc	hl, de

loc_D02:
		ld	(ix+42h), l
		ld	(ix+43h), h
		pop	bc
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D0C:
		ld	a, (bc)
		inc	bc
		ld	(ix+7),	a
		set	4, (ix+22h)
		ld	(ix+9),	0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D1C:
		ld	a, (bc)
		inc	bc
		ld	(ix+9),	a
		ld	a, (bc)
		inc	bc
		ld	(ix+7),	a
		ld	a, (bc)
		inc	bc
		ld	(ix+4Bh), a
		ld	(ix+4Ah), 0
		res	4, (ix+22h)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D36:
		ld	a, (bc)
		inc	bc
		or	a
		jp	m, loc_D44
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		jp	loc_D53
; ---------------------------------------------------------------------------

loc_D44:
		xor	0FFh
		inc	a
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ex	de, hl
		ld	hl, 0
		or	a
		sbc	hl, de

loc_D53:
		ld	(ix+54h), l
		ld	(ix+55h), h
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D5C:
		ld	a, (bc)
		inc	bc
		ld	(ix+2Ch), a
		ld	a, (bc)
		inc	bc
		ld	(ix+2Ah), a
		ld	d, a
		xor	a
		cp	(ix+2Ch)
		jp	nz, loc_D72
		ld	a, d
		call	sub_F37

loc_D72:
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D75:
		ld	a, (bc)
		inc	bc
		ld	(ix+2Dh), a
		ld	a, (bc)
		inc	bc
		sla	a
		sla	a
		sla	a
		sla	a
		ld	(ix+2Bh), a
		ld	d, a
		xor	a
		cp	(ix+2Dh)
		jp	nz, loc_D93
		ld	a, d
		call	sub_F40

loc_D93:
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_D96:
		ld	(ix+5Eh), c
		ld	(ix+5Fh), b
		res	7, (ix+22h)
		res	6, (ix+22h)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_DA7:
		bit	6, (ix+22h)
		jp	nz, loc_DBC
		bit	7, (ix+22h)
		jp	nz, loc_DD3
		set	6, (ix+22h)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_DBC:
		res	6, (ix+22h)
		set	7, (ix+22h)
		ld	(ix+60h), c
		ld	(ix+61h), b
		ld	c, (ix+5Eh)
		ld	b, (ix+5Fh)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_DD3:
		set	6, (ix+22h)
		res	7, (ix+22h)
		ld	c, (ix+60h)
		ld	b, (ix+61h)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_DE4:
		ld	a, (bc)
		inc	bc
		ld	(ix+16h), a
		ld	(ix+15h), a
		ld	a, (bc)
		inc	bc
		ld	(ix+18h), a
		cp	3
		jp	nz, loc_DFE
		ld	a, 40h
		ld	(ix+17h), a
		jp	loc_E03
; ---------------------------------------------------------------------------

loc_DFE:
		ld	a, 80h
		ld	(ix+17h), a

loc_E03:
		call	sub_F49
		ld	(ix+19h), 0
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E0D:
		ld	a, (bc)
		inc	bc
		ld	(ix+10h), a
		or	a
		jp	z, loc_E2D
		ld	e, a
		ld	l, (ix+11h)
		ld	h, 0
		call	sub_538
		push	hl
		ld	l, h
		ld	h, 0
		call	sub_538
		pop	de
		ld	(ix+4Eh), l
		ld	(ix+4Fh), e

loc_E2D:
		jp	loc_8CA
; ---------------------------------------------------------------------------
		inc	bc
		inc	bc
		inc	bc
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E36:
		ld	a, (bc)
		inc	bc
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	(ix+56h), l
		ld	(ix+57h), h
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E49:
		ld	a, (bc)
		inc	bc
		ld	(ix+46h), a
		ld	a, (bc)
		inc	bc
		ld	(ix+47h), a
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E56:
		push	bc
		pop	de
		inc	de
		inc	de
		ld	(ix+5Ch), e
		ld	(ix+5Dh), d
		set	2, (ix+22h)

loc_E64:
		ld	a, (bc)
		inc	bc
		ld	e, a
		ld	a, (bc)
		inc	bc
		ld	b, a
		ld	c, e
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E6E:
		bit	2, (ix+22h)
		jp	z, loc_E82
		res	2, (ix+22h)
		ld	c, (ix+5Ch)
		ld	b, (ix+5Dh)
		jp	loc_8CA
; ---------------------------------------------------------------------------

loc_E82:
		ld	(ix+0),	0
		ld	(ix+1),	0
		set	5, (ix+22h)
		call	sub_235
		jp	sub_247

; =============== S U B R O U T I N E =======================================


sub_E94:
		push	af
		srl	a
		and	3Fh
		cp	21h
		jp	c, loc_EA2
		ld	d, a
		ld	a, 40h
		sub	d

loc_EA2:
		ld	h, a
		ld	l, (ix+4Dh)
		call	sub_550
		bit	7, (ix+11h)
		jp	nz, loc_EB8
		srl	h
		rr	l
		srl	h
		rr	l

loc_EB8:
		pop	af
		or	a
		ret	p
		push	hl
		pop	de
		ld	hl, 0
		or	a
		sbc	hl, de
		ret
; End of function sub_E94

; ---------------------------------------------------------------------------
		ld	a, 50h
		ex	af, af'
		ld	a, 2Bh
		jp	loc_8
; ---------------------------------------------------------------------------
		xor	a
		ex	af, af'
		ld	a, 2Bh
		jp	loc_8

; =============== S U B R O U T I N E =======================================


sub_ED3:
		ld	ix, byte_1A00
		exx
		ld	hl, 4000h
		ld	de, 4000h
		exx
		xor	a
		ld	(byte_1D05), a

loc_EE3:
		exx
		cp	3
		jp	c, loc_EEE
		sub	3
		ld	de, 4002h

loc_EEE:
		ld	b, a
		exx
		ld	a, (ix+0)
		or	a
		jp	z, loc_F00
		cp	0BAh
		jp	z, loc_F00
		xor	a
		call	sub_1068

loc_F00:
		ld	de, 80h
		add	ix, de
		ld	hl, byte_1D05
		inc	(hl)
		ld	a, (hl)
		cp	6
		jp	nz, loc_EE3
		ret
; End of function sub_ED3


; =============== S U B R O U T I N E =======================================


sub_F10:
		ld	a, (byte_1D05)
		ld	hl, byte_F23
		add	a, l
		ld	l, a
		jp	nc, loc_F1C
		inc	h

loc_F1C:
		ld	a, (hl)
		ex	af, af'
		ld	a, 28h
		jp	loc_8
; End of function sub_F10

; ---------------------------------------------------------------------------
byte_F23:	db 0F0h, 0F1h, 0F2h, 0F4h, 0F5h, 0F6h

; =============== S U B R O U T I N E =======================================


sub_F29:
		ex	af, af'
		ld	a, 22h
		jp	loc_8
; End of function sub_F29


; =============== S U B R O U T I N E =======================================


sub_F2F:
		ld	a, (ix+30h)
		and	0C0h
		jp	loc_F50
; End of function sub_F2F


; =============== S U B R O U T I N E =======================================


sub_F37:
		ld	d, a
		ld	a, (ix+30h)
		and	0F0h
		jp	loc_F4F
; End of function sub_F37


; =============== S U B R O U T I N E =======================================


sub_F40:
		ld	d, a
		ld	a, (ix+30h)
		and	0CFh
		jp	loc_F4F
; End of function sub_F40


; =============== S U B R O U T I N E =======================================


sub_F49:
		ld	d, a
		ld	a, (ix+30h)
		and	3Fh

loc_F4F:
		or	d

loc_F50:
		ld	d, a
		ld	a, (byte_1D08)
		or	a
		jp	nz, loc_F60
		ld	a, (byte_1D05)
		cp	5
		jp	nz, loc_F64

loc_F60:
		set	6, d
		set	7, d

loc_F64:
		ld	(ix+30h), d
		ld	a, d
		ex	af, af'
		ld	a, 0B4h
		jp	sub_18
; End of function sub_F49
; ---------------------------------------------------------------------------

loc_F6E:
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, 8001h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	a, (hl)
		inc	hl
		and	3Fh
		ex	af, af'
		ld	a, 0B0h
		rst	18h
		and	7
		ld	(ix+25h), a
		ld	de, byte_1060
		add	a, e
		ld	e, a
		jp	nc, loc_F90
		inc	d

loc_F90:
		ld	a, (de)
		srl	a
		srl	a
		srl	a
		srl	a
		ld	d, a
		ld	e, 0Ah
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 30h
		rst	18h
		ld	a, (hl)
		inc	hl
		ld	(ix+26h), a
		srl	d
		jp	nc, loc_FAE
		ld	a, 0FFh

loc_FAE:
		ex	af, af'
		ld	a, 40h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 50h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 60h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 70h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 80h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 38h
		rst	18h
		ld	a, (hl)
		inc	hl
		ld	(ix+27h), a
		srl	d
		jp	nc, loc_FDC
		ld	a, 0FFh

loc_FDC:
		ex	af, af'
		ld	a, 48h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 58h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 68h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 78h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 88h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 34h
		rst	18h
		ld	a, (hl)
		inc	hl
		ld	(ix+28h), a
		srl	d
		jp	nc, loc_100A
		ld	a, 0FFh

loc_100A:
		ex	af, af'
		ld	a, 44h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 54h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 64h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 74h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 84h
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 3Ch
		rst	18h
		ld	a, (hl)
		inc	hl
		ld	(ix+29h), a
		srl	d
		jp	nc, loc_1038
		ld	a, 0FFh

loc_1038:
		ex	af, af'
		ld	a, 4Ch
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 5Ch
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 6Ch
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 7Ch
		rst	18h
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 8Ch
		rst	18h
		ld	a, 0C0h
		ld	(ix+17h), a
		ld	(ix+16h), 0
		jp	sub_F49
; END OF FUNCTION CHUNK	FOR sub_B4E
; ---------------------------------------------------------------------------
byte_1060:	db 80h,	80h, 80h, 80h, 0A0h, 0E0h, 0E0h, 0F0h

; =============== S U B R O U T I N E =======================================


sub_1068:
		ld	e, a
		ld	a, (ix+25h)
		ld	hl, byte_1060
		add	a, l
		ld	l, a
		jp	nc, loc_1075
		inc	h

loc_1075:
		ld	d, (hl)
		ld	a, (ix+29h)
		ex	af, af'
		ld	a, 4Ch
		call	sub_109A
		ld	a, (ix+28h)
		ex	af, af'
		ld	a, 44h
		call	sub_109A
		ld	a, (ix+27h)
		ex	af, af'
		ld	a, 48h
		call	sub_109A
		ld	a, (ix+26h)
		ex	af, af'
		ld	a, 40h
		jp	sub_109A
; End of function sub_1068


; =============== S U B R O U T I N E =======================================


sub_109A:
		ex	af, af'
		sla	d
		ret	nc
		add	a, 7Fh
		sub	e
		cp	80h
		jp	c, loc_10A8
		ld	a, 7Fh

loc_10A8:
		ex	af, af'
		jp	sub_18
; End of function sub_109A


; =============== S U B R O U T I N E =======================================


sub_10AC:
		ld	(ix+6Ah), d
		ld	(ix+6Bh), e
		push	de
		ld	a, d
		ld	hl, 9457h
		add	a, l
		ld	l, a
		jp	nc, loc_10BD
		inc	h

loc_10BD:
		ld	l, (hl)
		ld	h, e
		call	sub_550
		ld	l, h
		ld	h, 0
		pop	de
		push	hl
		ld	a, d
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, 9357h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		pop	hl
		add	hl, de
		ld	a, h
		ex	af, af'
		ld	a, 0A4h

loc_10D9:
		rst	18h
		ld	a, l
		ex	af, af'
		ld	a, 0A0h
		jp	sub_18
; End of function sub_10AC

; ---------------------------------------------------------------------------
; SFX Pointer
		db 0, 5, 1, Music_Bank_Offset, 0D7h, 94h, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 0F0h, 94h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 33h, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 59h, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 80h, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 9Dh, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 0CCh, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 0E5h, 95h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 2, 96h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 1Ah, 96h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 42h, 96h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 6Ch, 96h, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 80h, 96h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 8Fh,	96h, 0,	0
		db 0, 5, 5, Music_Bank_Offset, 0A8h, 96h, 0, 0
		db 0, 5, 5, Music_Bank_Offset, 0CDh, 96h, 0, 0
		db 0, 5, 5, Music_Bank_Offset, 0FEh, 96h, 0, 0
		db 0, 5, 5, Music_Bank_Offset, 21h, 97h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 3Bh,	97h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 5Eh,	97h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 7Ch,	97h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0A6h, 97h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0BCh, 97h, 0, 0
		db 0, 5, 60h, Music_Bank_Offset, 0EEh, 97h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 18h,	98h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 2Eh,	98h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 7Eh,	98h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0A5h, 98h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0C2h, 98h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0E4h, 98h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 5, 99h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 27h,	99h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 3Fh,	99h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 5Ch,	99h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 84h,	99h, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0BBh, 99h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0F4h, 99h, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 2Fh,	9Ah, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 51h,	9Ah, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 76h,	9Ah, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 9Ah,	9Ah, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0B1h, 9Ah, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0D4h, 9Ah, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0FBh, 9Ah, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 2Ah,	9Bh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 54h,	9Bh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 76h,	9Bh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 9Dh,	9Bh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0D3h, 9Bh, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0ECh, 9Bh, 0, 0
		db 0, 5, 5, Music_Bank_Offset, 1Dh, 9Ch, 0, 0
		db 0, 5, 5, Music_Bank_Offset, 39h, 9Ch, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 58h,	9Ch, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 7Ch,	9Ch, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0ADh, 9Ch, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0D5h, 9Ch, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0FBh, 9Ch, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 35h,	9Dh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 65h,	9Dh, 0,	0
		db 0, 5, 30h, Music_Bank_Offset, 8Ch,	9Dh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0B9h, 9Dh, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0Bh,	9Eh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 21h,	9Eh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 49h,	9Eh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 5Fh,	9Eh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 7Dh,	9Eh, 0,	0
		db 0, 5, 40h, Music_Bank_Offset, 0ABh, 9Eh, 0, 0
		db 0, 5, 40h, Music_Bank_Offset, 0D0h, 9Eh, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 8, 9Fh, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 29h,	9Fh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 47h,	9Fh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 61h,	9Fh, 0,	0
		db 0, 5, 20h, Music_Bank_Offset, 0A7h, 9Fh, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0E2h, 9Fh, 0, 0
		db 0, 5, 1, Music_Bank_Offset, 3Ch, 0A0h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 5Bh,	0A0h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 6Bh,	0A0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 8Eh,	0A0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 9Eh,	0A0h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0B7h, 0A0h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0DBh, 0A0h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0F1h, 0A0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 16h,	0A1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4Dh,	0A1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 7Eh,	0A1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 8Fh,	0A1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0B6h, 0A1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0FAh, 0A1h, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 3Eh,	0A2h, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 83h,	0A2h, 0, 0
		db 0, 5, 10h, Music_Bank_Offset, 96h,	0A2h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0A9h, 0A2h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0BEh, 0A2h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 0DDh, 0A2h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 5, 0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 1Bh,	0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 5Bh,	0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 70h,	0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 95h,	0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0CCh, 0A3h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 20h,	0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 39h,	0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 6Ch,	0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 93h,	0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0ABh, 0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0D2h, 0A4h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 19h,	0A5h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 38h,	0A5h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0BBh, 0A5h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0D8h, 0A5h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0F5h, 0A5h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 2Bh,	0A6h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4Fh,	0A6h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 8Bh,	0A6h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 9Eh,	0A6h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0F1h, 0A6h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 12h,	0A7h, 0, 0
		db 0, 5, 40h, Music_Bank_Offset, 37h,	0A7h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 77h,	0A7h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 9Eh,	0A7h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0D0h, 0A7h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 24h,	0A8h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4Ch,	0A8h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 7Eh,	0A8h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0A1h, 0A8h, 0, 0
		db 0, 5, 40h, Music_Bank_Offset, 0C2h, 0A8h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4, 0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 11h,	0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4Ch,	0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 76h,	0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0A8h, 0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0C8h, 0A9h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0DFh, 0A9h, 0, 0
		db 0, 5, 20h, Music_Bank_Offset, 11h,	0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 4Dh,	0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 73h,	0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 9Ah,	0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0B7h, 0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0D2h, 0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0ECh, 0AAh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 16h,	0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 32h,	0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 5Fh,	0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 82h,	0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0BBh, 0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0DEh, 0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0F7h, 0ABh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 1Ch,	0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 3Dh,	0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 53h,	0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 7Ah,	0ACh, 0, 0
		db 0, 5, 40h, Music_Bank_Offset, 8Bh,	0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0C1h, 0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0D6h, 0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0F7h, 0ACh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 12h,	0ADh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 95h,	0ADh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0B0h, 0ADh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0FAh, 0ADh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 2Dh,	0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 44h,	0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 5Ah,	0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 73h,	0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0B4h, 0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0F5h, 0AEh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 2Bh,	0AFh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 41h,	0AFh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 7Dh,	0AFh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 9Fh,	0AFh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0B0h, 0AFh, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0Ah,	0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 2Fh,	0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 6Bh,	0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 93h,	0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0C4h, 0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0DCh, 0B0h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 34h,	0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 52h,	0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 81h,	0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0A5h, 0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0BEh, 0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0DAh, 0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 0EEh, 0B1h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 11h,	0B2h, 0, 0
		db 0, 5, 30h, Music_Bank_Offset, 47h,	0B2h, 0, 0
		db 0, 5, 80h, Music_Bank_Offset, 90h,	0B2h, 0, 0
		db 1, 4, 10h, Music_Bank_Offset, 0DCh, 0B2h, 0, 0
		db 1, 4, 10h, Music_Bank_Offset, 12h,	0B3h, 0, 0
; Music Pointer
		db 5, 0, 80h, Music_Bank_Offset, 50h,	0B3h, 0, 0	; 0BDh
		db 5, 0, 80h, Music_Bank_Offset, 9, 0B4h, 0, 0		; 0BEh
		db 5, 0, 80h, Music_Bank_Offset, 0D6h, 0B5h, 0, 0		; 0BFh
		db 4, 0, 80h, Music_Bank_Offset, 20h,	0BCh, 0, 0	; 0C0h
		db 5, 0, 80h, Music_Bank_Offset, 0AAh, 0BDh, 0, 0	; 0C1h
		db 4, 0, 80h, Music_Bank_Offset, 0E3h, 0BFh, 0, 0		; 0C2h
		db 4, 0, 80h, Music_Bank_Offset, 39h,	0C1h, 0, 0	; 0C3h
		db 4, 0, 80h, Music_Bank_Offset, 2Ah,	0C2h, 0, 0	; 0C4h
		db 4, 0, 80h, Music_Bank_Offset, 0FCh, 0CDh, 0, 0	; 0C5h
		db 4, 0, 80h, Music_Bank_Offset, 76h,	0D5h, 0, 0	; 0C6h
		db 4, 0, 80h, Music_Bank_Offset, 3Bh,	0DEh, 0, 0	; 0C7h
		db 4, 0, 80h, Music_Bank_Offset, 8Dh,	0E7h, 0, 0	; 0C8h
		db 4, 0, 80h, Music_Bank2_Offset, 0D7h, 94h, 0, 0		; 0C9h
		db 4, 0, 80h, Music_Bank2_Offset, 0BAh, 0A2h, 0, 0	; 0CAh
		db 4, 0, 80h, Music_Bank2_Offset, 6Fh,	0A6h, 0, 0	; 0CBh
		db 4, 0, 80h, Music_Bank2_Offset, 5Bh,	0B2h, 0, 0	; 0CCh
		db 4, 0, 80h, Music_Bank2_Offset, 0FFh, 0B7h, 0, 0	; 0CDh
		db 4, 0, 80h, Music_Bank2_Offset, 54h,	0BDh, 0, 0	; 0CEh
		db 4, 0, 80h, Music_Bank2_Offset, 0F1h, 0C1h, 0, 0	; 0CFh
		db 4, 0, 80h, Music_Bank2_Offset, 7Ch,	0C4h, 0, 0	; 0D0h
		db 4, 0, 80h, Music_Bank2_Offset, 4Ch,	0CDh, 0, 0	; 0D1h
		db 4, 0, 80h, Music_Bank2_Offset, 0D6h, 0D7h, 0, 0	; 0D2h
		db 4, 0, 80h, Music_Bank2_Offset, 0A2h, 0DFh, 0, 0	; 0D3h
		db 4, 0, 80h, Music_Bank2_Offset, 52h,	0E0h, 0, 0	; 0D4h
		db 5, 0, 80h, Music_Bank2_Offset, 0FAh, 0E0h, 0, 0	; 0D5h
		db 4, 0, 80h, Music_Bank_Offset, 0DBh, 0F2h, 0, 0	; 0D6h
		db 5, 0, 80h, Music_Bank_Offset, 83h,	0F3h, 0, 0	; 0D7h
		db 5, 0, 80h, Music_Bank2_Offset, 99h,	0E3h, 0, 0	; 0D8h
		db 5, 0, 80h, Music_Bank2_Offset, 18h,	0E9h, 0, 0	; 0D9h
		db 4, 0, 80h, Music_Bank2_Offset, 96h,	0FEh, 0, 0	; 0DAh
		db 3, 0, 80h, Music_Bank_Offset, 28h,	0F5h, 0, 0	; 0DBh
byte_17B9:	db 2
		db    4
		db    8
		db  0Ah
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1A00:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1A31:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1AB1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1B31:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1BB1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1C31:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1CB1:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D01:	db 0
byte_1D02:	db 0
		db 0
byte_1D04:	db 0
byte_1D05:	db 0
		db 0
byte_1D07:	db 0
byte_1D08:	db 0
byte_1D09:	db 0
byte_1D0A:	db 0
byte_1D0B:	db 0
byte_1D0C:	db 0
byte_1D0D:	db 0
word_1D0E:	dw 0
word_1D10:	dw 0
word_1D12:	dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1E00:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1E18:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1E30:	db 0
byte_1E31:	db 0
byte_1E32:	db 0
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

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	hl, byte_1E31
		cp	(hl)
		jr	z, locret_1E60
		ld	(byte_1E31), a
		ld	hl, 6000h
		ld	d, 8

loc_1E4E:
		rrca
		jp	c, loc_1E5A
		ld	(hl), 0
		dec	d
		jr	nz, loc_1E4E
		jp	loc_1E5F
; ---------------------------------------------------------------------------

loc_1E5A:
		ld	(hl), 1
		dec	d
		jr	nz, loc_1E4E

loc_1E5F:
		ld	(hl), d

locret_1E60:
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_1E61:
		ld	hl, 4000h
		ld	a, 3Ch
		ld	b, 27h
		ld	(iy+0),	1

loc_1E6C:
		bit	7, (hl)
		jr	nz, loc_1E6C
		ld	(hl), b

loc_1E71:
		bit	7, (hl)
		jr	nz, loc_1E71
		ld	(4001h), a
		ld	(iy+0),	0
		ld	a, 91h
		ld	b, 24h
		ld	(iy+0),	1

loc_1E84:
		bit	7, (hl)
		jr	nz, loc_1E84
		ld	(hl), b

loc_1E89:
		bit	7, (hl)
		jr	nz, loc_1E89
		ld	(4001h), a
		ld	(iy+0),	0
		ld	a, 0
		ld	b, 25h
		ld	(iy+0),	1

loc_1E9C:
		bit	7, (hl)
		jr	nz, loc_1E9C
		ld	(hl), b

loc_1EA1:
		bit	7, (hl)
		jr	nz, loc_1EA1
		ld	(4001h), a
		ld	(iy+0),	0
		ld	a, 35h
		ld	b, 27h
		ld	(iy+0),	1

loc_1EB4:
		bit	7, (hl)
		jr	nz, loc_1EB4
		ld	(hl), b

loc_1EB9:
		bit	7, (hl)
		jr	nz, loc_1EB9
		ld	(4001h), a
		ld	(iy+0),	0
		ret
; End of function sub_1E61


; =============== S U B R O U T I N E =======================================


sub_1EC5:
		ld	hl, 4000h

loc_1EC8:
		bit	0, (hl)
		jr	z, loc_1EC8
		ld	a, 35h
		ld	b, 27h
		ld	(iy+0),	1

loc_1ED4:
		bit	7, (hl)
		jr	nz, loc_1ED4
		ld	(hl), b

loc_1ED9:
		bit	7, (hl)
		jr	nz, loc_1ED9
		ld	(4001h), a
		ld	(iy+0),	0
		ret
; End of function sub_1EC5


; =============== S U B R O U T I N E =======================================


sub_1EE5:
		ld	hl, byte_1E00
		ld	b, 33h
		xor	a

loc_1EEB:
		ld	(hl), a
		inc	hl
		djnz	loc_1EEB
		ret
; End of function sub_1EE5

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
byte_1F00:	ds 1
		ds 1
byte_1F02:	ds 1
byte_1F03:	ds 1
byte_1F04:	ds 1
byte_1F05:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1FFF:

; end of 'ROM'

		END
