; ---------------------------------------------------------------------------
; Ancient Music Driver -MD- Z80 Program Version 0.85.
; Copyright (C) (M.N.M Software)., Programmed By T.Maruyam.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

DAC_Driver:
		!org	0
		CPU Z80
		listing on
		di
		ld	sp, 1FF4h
		xor	a
		ld	(1FFDh), a
		ld	hl, (1FFAh)
		call	LoadBank
		jr	DAC_Driver_Init
; ---------------------------------------------------------------------------
		db 14h, 0Ch, 0Bh, 20h
byte_14:
		db 4, 0, 1, 2, 6, 0Ch, 18h, 30h, 60h, 0A0h, 0D0h, 0E8h
		db 0F4h, 0FAh, 0FEh, 0FFh
byte_24:
		db 0

; =============== S U B R O U T I N E =======================================

DAC_Driver_Init:
		ld	hl, 1FFFh

-		ld	a, (hl)
		cp	81h
		jr	c, -
		ex	af, af'
		ld	hl, 4000h
		ld	a, 80h
		ld	(1FFDh), a

-		bit	7, (hl)
		jr	nz, -
		ld	(hl), 2Bh
		inc	hl
		ld	(hl), 80h
		dec	hl
		xor	a
		ld	(1FFDh), a
		ld	(1FF6h), a
		ex	af, af'
		ld	(1FF7h), a
		sub	81h
		ld	(1FFFh), a
		ld	de, 0
		ld	iy, DAC_Banks
		cp	5
		jr	c, loc_A7
		ld	(1FF6h), a
		cp	9
		jr	c, +
		ld	(1FF7h), a
		ld	iy, (1FF8h)
		sub	9
+
		push	hl
		ld	hl, (1FFAh)
		ld	ix, 10h

-		cp	(ix+0)
		jr	c, +
		ld	de, 8000h
		add	hl, de
		ld	de, 0
		adc	hl, de
		inc	ix
		db 0DDh, 096h, 0FFh	; Code:	sub	(ix+0FFh) - ERROR: range overflow.
		jr	nc, -
+
		push	af
		call	LoadBank
		pop	af
		pop	hl
		ex	af, af'
		ld	a, 80h
		ld	(1FFDh), a

-		bit	7, (hl)
		jr	nz, -
		ld	hl, 4002h
		ld	(hl), 0B6h
		inc	hl
		ld	(hl), 0C0h
		xor	a
		ld	(1FFDh), a
		ex	af, af'
		jr	loc_A7
; ---------------------------------------------------------------------------

loc_A7:
		ld	c, a
		add	a, a
		add	a, a
		add	a, c
		ld	c, a
		ld	b, 0
		add	iy, bc
		ld	e, (iy+0)
		ld	d, (iy+1)
		ld	a, (1FF7h)
		or	a
		jp	m, loc_C2
		ld	hl, (1FF8h)
		add	hl, de
		ex	de, hl

loc_C2:
		ex	de, hl
		ld	de, 14h
		ld	bc, 10h
		ldir
		ex	de, hl
		ld	l, (iy+2)
		ld	h, (iy+3)
		ld	a, l
		or	h
		jp	z, DAC_Driver_Init
		ld	bc, 10h
		sbc	hl, bc
		push	hl
		pop	bc
		exx
		ld	hl, 4000h
		ld	ix, 1FFCh
		ld	c, 80h
		ld	d, 0
		exx
		ld	hl, 1FFFh

loc_EE:
		ld	a, (de)
		and	0F0h
		or	a
		jp	nz, loc_10F
		ld	a, (byte_14)
		exx

loc_F9:
		ex	af, af'
		nop
		nop
		nop
		nop
		nop
		nop
		call	sub_193
		ex	af, af'
		dec	a
		jp	z, loc_134
		nop
		nop
		nop
		nop
		jp	loc_F9
; ---------------------------------------------------------------------------

loc_10F:
		rrca
		rrca
		rrca
		rrca
		add	a, 14h
		exx
		ld	e, a
		ld	a, (de)
		ld	(byte_24), a
		add	a, c
		ld	c, a
		ld	a, 80h
		ld	(1FFDh), a
		ld	b, (iy+4)

-		bit	7, (hl)
		jr	nz, -
		ld	(hl), 2Ah
		inc	hl
		ld	(hl), c
		dec	hl
		xor	a
		ld	(1FFDh), a

loc_132:
		djnz	$

loc_134:
		exx
		ld	a, (de)
		and	0Fh
		or	a
		jp	nz, loc_156
		ld	a, (byte_14)
		exx

loc_140:
		ex	af, af'
		nop
		nop
		nop
		nop
		nop
		nop
		call	sub_193
		ex	af, af'
		dec	a
		jp	z, loc_17B
		nop
		nop
		nop
		nop
		jp	loc_140
; ---------------------------------------------------------------------------

loc_156:
		nop
		nop
		nop
		nop
		add	a, 14h
		exx
		ld	e, a
		ld	a, (de)
		ld	(byte_24), a
		add	a, c
		ld	c, a
		ld	a, 80h
		ld	(1FFDh), a
		ld	b, (iy+4)

-		bit	7, (hl)
		jr	nz, -
		ld	(hl), 2Ah
		inc	hl
		xor	a
		ld	(hl), c
		dec	hl
		ld	(1FFDh), a

loc_179:
		djnz	$

loc_17B:
		exx
		bit	7, (hl)
		jp	nz, DAC_Driver_Init
		inc	de
		dec	bc
		ld	a, c
		or	b
		jp	nz, loc_EE
		jp	loc_18B
; ---------------------------------------------------------------------------

loc_18B:
		ld	hl, 1FF6h
		xor	a
		ld	(hl), a
		jp	DAC_Driver_Init
; End of function DAC_Driver

; =============== S U B R O U T I N E =======================================

sub_193:
		ld	a, (byte_24)
		add	a, c
		ld	c, a
		ld	a, 80h
		ld	(1FFDh), a
		ld	b, (iy+4)

-		bit	7, (hl)
		jr	nz, -
		ld	(hl), 2Ah
		inc	hl
		xor	a
		ld	(hl), c
		dec	hl
		ld	(1FFDh), a

loc_1AD:
		djnz	$
		ret
; End of function sub_193

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, h
		rlca
		ld	(6000h), a
		ld	b, 8
		ld	a, l

-		ld	(6000h), a
		rrca
		djnz	-
		ret
; End of function LoadBank
; ---------------------------------------------------------------------------

DAC_Banks:
		binclude "Z80 Driver/DAC/Bank1.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
