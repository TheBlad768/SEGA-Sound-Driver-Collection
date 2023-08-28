; ---------------------------------------------------------------------------
; Westone Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($298000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		save
		!org	0
		CPU Z80
		listing on

		di
		im	1
		jp	loc_3B
; End of function start
; ---------------------------------------------------------------------------
		dw 1809h	; Driver size	; Now unused

; =============== S U B R O U T I N E =======================================

sub_8:
		ld	(hl), d
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jr	nz, sub_8
		ret
; End of function sub_8

; =============== S U B R O U T I N E =======================================

sub_10:
		rst	18h
		rst	18h
		rst	18h
		inc	e
		ret
; End of function sub_10
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_18:
		ld	a, e
		ld	b, d
		call	sub_6CC
		inc	e
		ret
; End of function sub_18
; ---------------------------------------------------------------------------
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_20:
		ex	(sp), hl
		dec	hl
		ex	(sp), hl
		jp	sub_F88
; End of function sub_20
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_28:
		ex	(sp), hl
		dec	hl
		ex	(sp), hl
		jp	sub_F88
; End of function sub_28
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_30:
		ex	(sp), hl
		dec	hl
		ex	(sp), hl
		jp	sub_F88
; End of function sub_30
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

zVInt:
		nop
		reti
; End of function zVInt
; ---------------------------------------------------------------------------

loc_3B:
		ld	hl, word_1B80
		ld	sp, hl
		ld	(hl), 0FFh
		inc	hl
		ld	bc, 0FFh
		ld	d, 0
		rst	8
		ld	bc, 380h
		dec	d
		rst	8
		ld	hl, byte_1C80
		ld	de, 40h
		ld	b, 9

loc_55:
		ld	(hl), d
		add	hl, de
		djnz	loc_55
		ld	e, 20h
		ld	b, 0Ah

loc_5D:
		ld	(hl), d
		add	hl, de
		djnz	loc_5D
		ld	hl, byte_1ED1
		ld	b, 0Ah

loc_66:
		ld	(hl), d
		add	hl, de
		djnz	loc_66

; Updated code (Load Bank)
		ld	a, 0
		ld	b, 7
		ld	a, Music_Bank_Offset
		ld	hl, 6000h

-		ld	(hl), a
		rrca
		djnz	-
		ld	(hl), a
		xor	a
		ld	(hl), a
	rept 2
		nop
	endm
		ld	c, 0
		ld	b, 2Bh
		call	sub_6F8
		ld	c, 0EDh
		ld	b, 26h
		call	sub_6F8
		ld	a, 2Ah
		ld	(byte_1C23), a
		ld	c, a
		ld	b, 27h
		call	sub_6F8
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		call	sub_E2
		call	sub_13D
		ld	a, 1
		ld	(byte_1C2D), a
		xor	a
		ld	(byte_1C00), a

loc_AF:
		xor	a
		ld	(byte_1C06), a
		ld	a, 3

loc_B5:
		ld	(byte_1C02), a
		call	sub_10F
		call	sub_154
		call	sub_193
		ld	hl, (word_1C16)
		ld	h, 0
		ld	de, (word_1C14)
		add	hl, de
		ld	(word_1C16), hl
		ld	a, h
		ld	hl, byte_1C06
		add	a, (hl)
		ld	(hl), a
		call	sub_70C
		ld	a, (byte_1C02)
		dec	a
		jr	nz, loc_B5
		call	sub_B80
		jr	loc_AF
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_E2:
		ld	c, 0
		ld	d, 90h
		call	sub_FF
		dec	c
		ld	d, 80h
		call	sub_FF
		ld	b, 28h
		call	sub_F4
; End of function sub_E2


; =============== S U B R O U T I N E =======================================


sub_F4:
		inc	c
		ld	e, 3

loc_F7:
		call	sub_6F8
		inc	c
		dec	e
		jr	nz, loc_F7
		ret
; End of function sub_F4

; =============== S U B R O U T I N E =======================================

sub_FF:
		xor	a
		call	sub_105
		ld	a, 2
; End of function sub_FF

; =============== S U B R O U T I N E =======================================

sub_105:
		ld	(byte_1C10), a
		ld	e, 0
		rst	10h
		rst	10h
		rst	10h
		rst	10h
		ret
; End of function sub_105

; =============== S U B R O U T I N E =======================================

sub_10F:
		ld	a, (byte_1B99)
		or	a
		call	nz, sub_F88
		ld	hl, byte_1C2D
		dec	(hl)
		ret	nz
		ld	(hl), 1
		ld	a, (byte_1C03)
		and	2
		jr	z, loc_126
		ld	(hl), 4

loc_126:
		ld	a, (4000h)
		and	2
		jr	z, sub_10F
		ld	hl, (word_1C04)
		inc	hl
		ld	(word_1C04), hl
		ld	a, (byte_1C23)
		ld	c, a
		ld	b, 27h
		jp	sub_6F8
; End of function sub_10F

; =============== S U B R O U T I N E =======================================

sub_13D:
		call	sub_36A
		ld	hl, byte_1C81
		ld	de, 40h
		ld	b, 6

loc_148:
		ld	(hl), d
		add	hl, de
		djnz	loc_148
		ld	b, 3

loc_14E:
		ld	(hl), 2
		add	hl, de
		djnz	loc_14E
		ret
; End of function sub_13D


; =============== S U B R O U T I N E =======================================


sub_154:
		ld	a, (word_1C2A)
		or	a
		jr	z, loc_161
		ld	a, (word_1C2A+1)
		ld	(word_1C0A+1), a
		ret
; ---------------------------------------------------------------------------

loc_161:
		ld	a, (byte_1C09)
		or	a
		ret	z
		ld	hl, (word_1C0A)
		ld	de, (word_1C0C)
		add	hl, de
		bit	7, h
		jr	z, loc_177
		bit	7, d
		jp	z, sub_30D

loc_177:
		ld	(word_1C0A), hl
		ld	hl, byte_1C09
		dec	(hl)
		ret	nz
		ld	de, (word_1C0E)
		ld	a, (de)
		inc	de
		ld	(hl), a
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_1C0E), hl
		ld	(word_1C0C), de
		ret
; End of function sub_154


; =============== S U B R O U T I N E =======================================


sub_193:
		ld	a, 0FFh
		ld	(byte_1C00), a
		ld	a, (byte_1C2F)
		or	a
		jr	nz, loc_1A2
		ld	(byte_1C00), a
		ret
; ---------------------------------------------------------------------------

loc_1A2:
		dec	a
		ld	(byte_1C2F), a
		ld	a, (byte_1C2E)
		ld	e, a
		ld	d, 0
		ld	hl, byte_1C30
		add	hl, de
		inc	a
		and	0Fh
		ld	(byte_1C2E), a
		ld	c, (hl)
		xor	a
		ld	(byte_1C00), a
		ld	a, c
		cp	0F9h
		jr	c, loc_1CC
		cpl
		add	a, a
		ld	e, a
		ld	hl, off_25F
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

loc_1CC:
		cp	53h
		ret	nc
		add	a, a
		ld	e, a
		ld	hl, 0A20Dh	; Music pointers
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, (hl)
		inc	hl
		ld	(byte_1C28), a
		or	a
		jp	p, loc_217
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_1C14), de
		push	hl
		ld	hl, 0
		ld	(word_1C16), hl
		call	sub_30D
		pop	hl
		ld	ix, byte_1EC0
		ld	bc, 20h

loc_1FC:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		ret	z
		inc	hl
		ld	(ix+0),	80h
		ld	a, (byte_1C28)
		ld	(ix+10h), a
		ld	(ix+6),	e
		ld	(ix+7),	d
		add	ix, bc
		jr	loc_1FC
; ---------------------------------------------------------------------------

loc_217:
		push	hl
		call	sub_345
		pop	hl

loc_21C:
		ld	a, (hl)
		cp	0FFh
		ret	z
		inc	hl
		rrca
		rrca
		rrca
		ld	d, a
		and	0E0h
		ld	e, a
		ld	a, d
		and	7
		ld	d, a
		ld	ix, byte_1EC0
		add	ix, de
		bit	7, (ix+0)
		jr	z, loc_249
		ld	a, (byte_1C28)
		cp	(ix+10h)
		jr	nc, loc_244
		inc	hl
		inc	hl
		jr	loc_21C
; ---------------------------------------------------------------------------

loc_244:
		push	hl
		call	sub_2E6
		pop	hl

loc_249:
		ld	(ix+0),	80h
		ld	a, (byte_1C28)
		ld	(ix+10h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+6),	a
		ld	a, (hl)
		inc	hl
		ld	(ix+7),	a
		jr	loc_21C
; End of function sub_193

; ---------------------------------------------------------------------------
off_25F:	dw sub_36A
		dw loc_288
		dw sub_2CE
		dw sub_2A6
		dw sub_26E
		dw sub_274
		dw sub_30D
; ---------------------------------------------------------------------------
		ret

; =============== S U B R O U T I N E =======================================


sub_26E:
		ld	a, 1
		ld	(word_1C2A), a
		ret
; End of function sub_26E


; =============== S U B R O U T I N E =======================================


sub_274:
		ld	hl, byte_279
		jr	loc_28B
; ---------------------------------------------------------------------------
byte_279:	db 80h
		db 10h
		db 0
		db 80h
		db 18h
		db 0
		db 0FFh
		db 20h
		db 0
		db 0FFh
		db 40h
		db 0
		db 0FFh
		db 80h
		db 0
; ---------------------------------------------------------------------------

loc_288:
		ld	hl, byte_29D

loc_28B:
		ld	(word_1C0E), hl
		ld	hl, 0
		ld	(word_1C0C), hl
		ld	(word_1C2A), hl
		ld	a, 1
		ld	(byte_1C09), a
		ret
; End of function sub_274

; ---------------------------------------------------------------------------
byte_29D:	db 20h
		db 40h
		db 0
		db 20h
		db 60h
		db 0
		db 0FFh
		db 80h
		db 0

; =============== S U B R O U T I N E =======================================


sub_2A6:
		ld	ix, byte_1EC0
		xor	a

loc_2AB:
		ld	(byte_1C07), a
		bit	7, (ix+0)
		jr	z, loc_2BB
		bit	7, (ix+10h)
		call	nz, sub_2E6

loc_2BB:
		ld	de, 20h
		add	ix, de
		ld	a, (byte_1C07)
		inc	a
		cp	0Ah
		jr	c, loc_2AB
		ld	hl, byte_1C03
		set	0, (hl)
		ret
; End of function sub_2A6


; =============== S U B R O U T I N E =======================================


sub_2CE:
		ld	hl, byte_1C03
		res	0, (hl)
		ret
; End of function sub_2CE


; =============== S U B R O U T I N E =======================================


sub_2D4:
		push	ix
		pop	hl
		ld	bc, 0E140h
		add	hl, bc
		ld	a, h
		rlca
		rlca
		rlca
		ld	c, a
		ld	a, l
		rlca
		rlca
		rlca
		or	c
		ret
; End of function sub_2D4


; =============== S U B R O U T I N E =======================================


sub_2E6:
		call	sub_2D4
		push	ix
		ld	ix, byte_1C80
		ld	b, 9

loc_2F1:
		bit	7, (ix+0)
		jr	z, loc_303
		cp	(ix+6)
		jr	nz, loc_303
		ld	c, a
		push	bc
		call	sub_447
		pop	bc
		ld	a, c

loc_303:
		ld	de, 40h
		add	ix, de
		djnz	loc_2F1
		pop	ix
		ret
; End of function sub_2E6


; =============== S U B R O U T I N E =======================================


sub_30D:
		xor	a
		ld	(word_1C0A), a
		ld	(word_1C0A+1), a
		ld	(byte_1C09), a
		ld	(word_1C2A), a
		ld	a, (byte_1C03)
		and	0FEh
		ld	(byte_1C03), a
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_328:
		bit	7, (ix+0)
		jr	z, loc_33D
		bit	7, (ix+10h)
		jr	z, loc_33D
		push	bc
		call	sub_2E6
		pop	bc
		ld	(ix+0),	0

loc_33D:
		ld	de, 20h
		add	ix, de
		djnz	loc_328
		ret
; End of function sub_30D


; =============== S U B R O U T I N E =======================================


sub_345:
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_34B:
		bit	7, (ix+0)
		jr	z, loc_362
		ld	a, (byte_1C28)
		cp	(ix+10h)
		jr	nz, loc_362
		push	bc
		call	sub_2E6
		pop	bc
		ld	(ix+0),	0

loc_362:
		ld	de, 20h
		add	ix, de
		djnz	loc_34B
		ret
; End of function sub_345


; =============== S U B R O U T I N E =======================================


sub_36A:
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_370:
		bit	7, (ix+0)
		jr	z, loc_37F
		push	bc
		call	sub_2E6
		pop	bc
		ld	(ix+0),	0

loc_37F:
		ld	de, 20h
		add	ix, de
		djnz	loc_370
		ld	hl, 0
		ld	(word_1C2A), hl
		xor	a
		ld	(byte_1C09), a
		ld	(word_1C0A+1), a
		ret
; End of function sub_36A


; =============== S U B R O U T I N E =======================================


sub_394:
		ld	a, (byte_1C20)
		ld	e, a
		rrca
		add	a, e
		ld	e, a
		ld	d, 0
		ld	hl, byte_405
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		push	de
		pop	iy
		ld	a, (byte_1C21)
		and	(hl)
		ld	c, a
		ld	b, 80h
		ld	de, 40h

loc_3B2:
		bit	0, c
		jr	z, loc_3F0
		bit	7, (iy+0)
		ret	z
		ld	a, (byte_1C22)
		cp	(iy+4)
		jr	c, loc_3F0
		bit	7, b
		jr	nz, loc_3E1
		ld	a, b
		cp	(iy+4)
		jr	c, loc_3F0
		jr	nz, loc_3E1
		ld	a, (word_1C26+1)
		cp	(iy+3Dh)
		jr	c, loc_3E1
		jr	nz, loc_3F0
		ld	a, (word_1C26)
		cp	(iy+3Ch)
		jr	nc, loc_3F0

loc_3E1:
		ld	l, (iy+3Ch)
		ld	h, (iy+3Dh)
		ld	(word_1C26), hl
		ld	b, (iy+4)
		push	iy
		pop	hl

loc_3F0:
		add	iy, de
		srl	c
		jr	nz, loc_3B2
		bit	7, b
		ret	nz
		push	hl
		ex	(sp), ix
		call	sub_447
		ex	(sp), ix
		pop	iy
		xor	a
		ret
; End of function sub_394

; ---------------------------------------------------------------------------
byte_405:	db 80h
		db 1Ch
		db 3Fh
		db 0
		db 1Eh
		db 7
		db 80h
		db 1Eh
		db 1

; =============== S U B R O U T I N E =======================================


sub_40E:
		ld	a, (ix+12h)
		sub	(ix+13h)
		ld	c, a
		ld	iy, byte_1C80
		ld	de, 40h
		ld	b, 9

loc_41E:
		bit	7, (iy+0)
		jr	z, loc_431
		ld	a, (byte_1C07)
		cp	(iy+6)
		jr	nz, loc_431
		ld	a, c
		cp	(iy+7)
		ret	z

loc_431:
		add	iy, de
		djnz	loc_41E
		scf
		ret
; End of function sub_40E


; =============== S U B R O U T I N E =======================================


sub_437:
		push	ix
		pop	hl
		ld	bc, 0E380h
		add	hl, bc
		ld	a, h
		rlca
		rlca
		ld	h, a
		ld	a, l
		rlca
		rlca
		or	h
		ret
; End of function sub_437


; =============== S U B R O U T I N E =======================================


sub_447:
		call	sub_437
		cp	6
		jr	c, loc_455
		sub	6
		ld	(byte_1C11), a
		jr	loc_461
; ---------------------------------------------------------------------------

loc_455:
		srl	a
		ld	(byte_1C11), a
		ld	a, 0
		rla
		rlca
		ld	(byte_1C10), a

loc_461:
		ld	a, (ix+1)
		sub	2
		jr	c, loc_48D
		jr	nz, loc_47E
		ld	(ix+29h), 78h
		ld	a, (byte_1C11)
		rrca
		rrca
		rrca
		or	9Fh
		ld	(7F11h), a
		ld	(ix+0),	0
		ret
; ---------------------------------------------------------------------------

loc_47E:
		ld	a, 78h
		ld	(byte_1C13), a
		ld	a, 0FFh
		ld	(7F11h), a
		ld	(ix+0),	0
		ret
; ---------------------------------------------------------------------------

loc_48D:
		ld	c, 0FFh
		ld	b, 80h
		call	sub_6C9
		ld	b, 84h
		call	sub_6C9
		ld	b, 88h
		call	sub_6C9
		ld	b, 8Ch
		call	sub_6C9
		bit	1, (ix+0)
		jr	nz, loc_4AD
		xor	a
		call	sub_6E3

loc_4AD:
		ld	(ix+0),	0
		ret
; End of function sub_447


; =============== S U B R O U T I N E =======================================


sub_4B2:
		ld	a, d
		rlca
		rlca
		rlca
		rlca
		ld	d, a
		ld	a, e
		rrca
		rrca
		rrca
		rrca
		and	0Eh
		or	d
		add	a, l
		jr	nc, loc_4C4
		inc	h

loc_4C4:
		ld	l, a
		ld	a, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	l, (hl)
		ld	h, e
		ld	e, a
		ld	a, l
		sub	e
		srl	a
		bit	4, h
		jr	z, loc_4DB
		ld	l, a
		add	a, e
		ld	e, a
		ld	a, l
		jr	nc, loc_4DB
		inc	d

loc_4DB:
		srl	a
		bit	3, h
		ret	z
		add	a, e
		ld	e, a
		ret	nc
		inc	d
		ret
; End of function sub_4B2


; =============== S U B R O U T I N E =======================================


sub_4E5:
		ld	a, d
		rlca
		rlca
		rlca
		rlca
		ld	d, a
		ld	a, e
		rrca
		rrca
		rrca
		rrca
		and	0Eh
		or	d
		add	a, l
		jr	nc, loc_4F7
		inc	h

loc_4F7:
		ld	l, a
		ld	a, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	l, (hl)
		ld	h, e
		ld	e, a
		sub	l
		srl	a
		bit	4, h
		jr	z, loc_50D
		ld	l, a
		add	a, e
		ld	e, a
		ld	a, l
		jr	nc, loc_50D
		inc	d

loc_50D:
		srl	a
		bit	3, h
		ret	z
		add	a, e
		ld	e, a
		ret	nc
		inc	d
		ret
; End of function sub_4E5


; =============== S U B R O U T I N E =======================================


sub_517:
		ld	a, d
		cp	60h
		jr	c, loc_522
		ld	de, 0BF8h
		ld	c, 7
		ret
; ---------------------------------------------------------------------------

loc_522:
		ld	c, 0
		cp	30h
		jr	c, loc_52C
		sub	30h
		set	2, c

loc_52C:
		cp	18h
		jr	c, loc_534
		sub	18h
		set	1, c

loc_534:
		cp	0Ch
		jr	c, loc_53B
		sub	0Ch
		inc	c

loc_53B:
		ld	d, a
		ret
; End of function sub_517


; =============== S U B R O U T I N E =======================================


sub_53D:
		ld	a, (ix+1)
		or	a
		jr	z, loc_57A
		call	sub_5A4
		ret	z
		call	sub_517
		ld	hl, word_1139
		call	sub_4E5
		ld	b, c
		inc	b
		dec	b
		jr	z, loc_55B

loc_555:
		srl	d
		rr	e
		djnz	loc_555

loc_55B:
		ld	a, e
		and	0Fh
		ld	c, a
		ld	a, (byte_1C11)
		rrca
		rrca
		rrca
		or	c
		or	80h
		ld	(7F11h), a
		ld	a, e
		and	0F0h
		srl	d
		rra
		srl	d
		rra
		rrca
		rrca
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_57A:
		call	sub_5A4
		ret	z
		ld	a, (byte_1C11)
		add	a, 0A4h
		ld	b, a
		call	sub_517
		ld	hl, word_1077
		call	sub_4B2
		ld	a, c
		rlca
		rlca
		rlca
		or	d
		ld	c, a
		call	sub_6CE
		res	2, b
		ld	c, e
		jp	sub_6CE
; End of function sub_53D


; =============== S U B R O U T I N E =======================================


sub_59C:
		and	0F8h
		ld	e, a
		cp	l
		ret	nz
		ld	a, d
		cp	h
		ret
; End of function sub_59C


; =============== S U B R O U T I N E =======================================


sub_5A4:
		ld	a, (ix+8)
		ld	d, (ix+9)
		ld	l, (ix+0Ah)
		ld	h, (ix+0Bh)
		call	sub_59C
		ret	z
		ld	(ix+0Ah), e
		ld	(ix+0Bh), d
		ret
; End of function sub_5A4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_757

loc_5BB:
		ld	a, (ix+1)
		sub	2
		jr	c, loc_617
		jr	nz, loc_5F0
		ld	a, (ix+0)
		and	20h
		jr	z, loc_5CE
		ld	a, (word_1C0A+1)

loc_5CE:
		add	a, (ix+28h)
		jp	p, loc_5D6
		ld	a, 7Fh

loc_5D6:
		and	78h
		cp	(ix+29h)
		ret	z
		ld	(ix+29h), a
		rrca
		rrca
		rrca
		ld	c, a
		ld	a, (byte_1C11)
		rrca
		rrca
		rrca
		or	90h
		or	c
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_5F0:
		ld	a, (byte_1C13)
		ld	b, a
		ld	a, (ix+0)
		and	20h
		jr	z, loc_5FE
		ld	a, (word_1C0A+1)

loc_5FE:
		ld	c, a
		add	a, (ix+28h)
		jp	p, loc_607
		ld	a, 7Fh

loc_607:
		and	78h
		cp	b
		ret	z
		ld	(byte_1C13), a
		rrca
		rrca
		rrca
		or	0F0h
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

loc_617:
		call	sub_668
		ld	e, (hl)
		ld	a, (ix+2)
		add	a, (ix+1Ch)
		ld	c, a
		ld	a, (ix+0)
		and	20h
		jr	z, loc_62C
		ld	a, (word_1C0A+1)

loc_62C:
		add	a, c
		jp	po, loc_632
		ld	a, 7Fh

loc_632:
		ld	(byte_1C08), a
		push	ix
		pop	hl
		ld	bc, 28h
		add	hl, bc
		ld	d, b

loc_63D:
		ld	c, (hl)
		inc	hl
		srl	e
		jr	nc, loc_65F
		ld	a, (byte_1C08)
		add	a, c
		jp	p, loc_64C
		ld	a, 7Fh

loc_64C:
		cp	(hl)
		jr	z, loc_65F
		ld	(hl), a
		ld	c, a
		ld	a, d
		srl	a
		jr	nc, loc_658
		or	2

loc_658:
		rlca
		rlca
		or	40h
		call	sub_6C8

loc_65F:
		inc	hl
		inc	hl
		inc	hl
		inc	d
		bit	2, d
		jr	z, loc_63D
		ret

; =============== S U B R O U T I N E =======================================

sub_668:
		ld	a, (ix+24h)
		and	7
		add	a, FadeData&0FFh
		ld	l, a
		ld	h, FadeData>>8&0FFh
		ret	nc
		inc	h
		ret
; End of function sub_668
; ---------------------------------------------------------------------------

FadeData:	db 8, 8, 8, 8, 0Ah, 0Eh, 0Eh, 0Fh

; =============== S U B R O U T I N E =======================================

sub_67D:
		ld	(byte_1C12), a
		ldi
		inc	de
		ld	c, (hl)
		inc	hl
		ld	a, (de)
		cp	c
		jr	z, loc_690
		ld	a, c
		ld	(de), a
		ld	b, 30h
		call	sub_6C4

loc_690:
		inc	de
		ld	a, (hl)
		inc	hl
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	bc, byte_1281
		add	hl, bc
		ld	c, a
		ld	a, (de)
		cp	c
		jr	nz, loc_6A8
		inc	de
		inc	hl
		inc	hl
		inc	hl
		jr	loc_6C0
; ---------------------------------------------------------------------------

loc_6A8:
		ld	a, c
		ld	(de), a
		inc	de
		ld	c, (hl)
		inc	hl
		ld	b, 50h
		call	sub_6C4
		ld	c, (hl)
		inc	hl
		ld	b, 60h
		call	sub_6C4
		ld	c, (hl)
		inc	hl
		ld	b, 70h
		call	sub_6C4

loc_6C0:
		ld	c, (hl)
		pop	hl
		ld	b, 80h
; End of function sub_67D


; =============== S U B R O U T I N E =======================================


sub_6C4:
		ld	a, (byte_1C12)
		or	b
; End of function sub_6C4


; =============== S U B R O U T I N E =======================================


sub_6C8:
		ld	b, a
; End of function sub_6C8


; =============== S U B R O U T I N E =======================================


sub_6C9:
		ld	a, (byte_1C11)
; End of function sub_6C9


; =============== S U B R O U T I N E =======================================


sub_6CC:
		or	b
		ld	b, a
; End of function sub_6CC


; =============== S U B R O U T I N E =======================================


sub_6CE:
		ld	a, (byte_1C10)
		push	hl
		ld	l, a
		ld	h, 40h

loc_6D5:
		ld	a, (4000h)
		or	a
		jp	m, loc_6D5
		ld	(hl), b
		inc	l
		jr	loc_6E0
; ---------------------------------------------------------------------------

loc_6E0:
		ld	(hl), c
		pop	hl
		ret
; End of function sub_6CE


; =============== S U B R O U T I N E =======================================


sub_6E3:
		ld	b, 28h
		ld	c, a
		ld	a, (byte_1C11)
		cp	3
		adc	a, 0FFh
		or	c
		ld	c, a
		ld	a, (byte_1C10)
		bit	1, a
		jr	z, sub_6F8
		set	2, c
; End of function sub_6E3

; =============== S U B R O U T I N E =======================================

sub_6F8:
		ld	a, (4000h)
		or	a
		jp	m, sub_6F8
		ld	a, b
		ld	(4000h), a
		jr	loc_705
; ---------------------------------------------------------------------------

loc_705:
		jr	loc_707
; ---------------------------------------------------------------------------

loc_707:
		ld	a, c
		ld	(4001h), a
		ret
; End of function sub_6F8

; =============== S U B R O U T I N E =======================================

sub_70C:
		ld	ix, byte_1C80
		xor	a
		ld	(byte_1BF6), a

loc_714:
		ld	(byte_1C11), a
		xor	a

loc_718:
		ld	(byte_1C10), a
		bit	7, (ix+0)
		call	nz, sub_757
		ld	de, 40h
		add	ix, de
		ld	hl, byte_1BF6
		inc	(hl)
		ld	a, (byte_1C10)
		xor	2
		jr	nz, loc_718
		ld	a, (byte_1C11)
		inc	a
		cp	3
		jr	c, loc_714
		xor	a

loc_73B:
		ld	(byte_1C11), a
		bit	7, (ix+0)
		call	nz, sub_757
		ld	de, 40h
		add	ix, de
		ld	hl, byte_1BF6
		inc	(hl)
		ld	a, (byte_1C11)
		inc	a
		cp	3
		jr	c, loc_73B
		ret
; End of function sub_70C


; =============== S U B R O U T I N E =======================================


sub_757:

; FUNCTION CHUNK AT 05BB SIZE 000000AD BYTES
; FUNCTION CHUNK AT 0A09 SIZE 000000FC BYTES

		bit	6, (ix+0)
		jr	nz, loc_773
		set	6, (ix+0)
		ld	hl, loc_773
		push	hl
		ld	a, (ix+1)
		sub	2
		jp	c, loc_A09
		jp	z, loc_AB3
		jp	loc_AAA
; ---------------------------------------------------------------------------

loc_773:
		ld	a, 1
		bit	5, (ix+0)
		jr	z, loc_77E
		ld	a, (word_1C16+1)

loc_77E:
		add	a, (ix+3Ch)
		ld	(ix+3Ch), a
		jr	nc, loc_7A3
		inc	(ix+3Dh)
		jp	z, loc_461
		jp	po, loc_7A3
		set	0, (ix+0)
		ld	a, (ix+1)
		or	a
		jr	nz, loc_79C
		jp	sub_6E3
; ---------------------------------------------------------------------------

loc_79C:
		ld	a, (ix+1)
		or	a
		call	z, sub_6E3

loc_7A3:
		dec	(ix+3Bh)
		jp	nz, loc_86E
		ld	a, (ix+3Ah)
		ld	(ix+3Bh), a
		ld	a, (ix+14h)
		add	a, (ix+16h)
		ld	(ix+14h), a
		ld	a, (ix+15h)
		adc	a, (ix+17h)
		ld	(ix+15h), a
		ld	a, (ix+0Eh)
		or	a
		jp	z, loc_86E
		dec	(ix+0Eh)
		jp	nz, loc_86E
		ld	(ix+3Fh), 0
		ld	l, (ix+10h)
		ld	h, (ix+11h)

loc_7D8:
		ld	a, (hl)
		inc	hl
		or	a
		jp	z, loc_86E
		cp	0F8h
		jr	c, loc_85B
		cpl
		dec	a
		jp	p, loc_7ED
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_7ED:
		jr	nz, loc_7FC
		dec	(ix+0Fh)
		jr	z, loc_7D8
		ld	l, (ix+12h)
		ld	h, (ix+13h)
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_7FC:
		dec	a
		jr	nz, loc_80C
		ld	a, (hl)
		inc	hl
		ld	(ix+0Fh), a
		ld	(ix+12h), l
		ld	(ix+13h), h
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_80C:
		dec	a
		jr	nz, loc_821
		sub	(ix+16h)
		ld	(ix+16h), a
		ld	a, 0
		sbc	a, (ix+17h)
		ld	(ix+17h), a
		ld	a, (hl)
		inc	hl
		jr	loc_865
; ---------------------------------------------------------------------------

loc_821:
		dec	a
		jr	nz, loc_830
		ld	a, (hl)
		inc	hl
		ld	(ix+14h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+15h), a
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_830:
		dec	a
		jr	nz, loc_83E
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	(ix+0Eh), a
		jr	loc_86E
; ---------------------------------------------------------------------------

loc_83E:
		dec	a
		jr	nz, loc_84B
		ld	a, (hl)
		inc	hl
		ld	(ix+3Bh), a
		ld	(ix+3Ah), a
		jr	loc_7D8
; ---------------------------------------------------------------------------

loc_84B:
		xor	a
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+3Fh), a
		ld	a, (hl)
		inc	hl
		jr	loc_865
; ---------------------------------------------------------------------------

loc_85B:
		ld	c, (hl)
		inc	hl
		ld	(ix+16h), c
		ld	c, (hl)
		inc	hl
		ld	(ix+17h), c

loc_865:
		ld	(ix+0Eh), a
		ld	(ix+10h), l
		ld	(ix+11h), h

loc_86E:
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		bit	4, (ix+0)
		jr	z, loc_8A1
		ld	c, (ix+1Ah)
		ld	b, (ix+1Bh)
		add	hl, bc
		ld	e, (ix+18h)
		ld	d, (ix+19h)
		ld	a, h
		cp	d
		jr	nz, loc_88F
		ld	a, l
		cp	e
		jr	z, loc_897

loc_88F:
		bit	7, b
		jr	z, loc_894
		ccf

loc_894:
		jr	c, loc_89B
		ex	de, hl

loc_897:
		res	4, (ix+0)

loc_89B:
		ld	(ix+0Ch), l
		ld	(ix+0Dh), h

loc_8A1:
		ld	a, (ix+3Fh)
		or	a
		jr	z, loc_8BA
		ld	b, a
		push	hl
		call	sub_B67
		pop	de
		ld	l, a
		and	80h
		jr	z, loc_8B4
		ld	a, 0FFh

loc_8B4:
		ld	h, a

loc_8B5:
		add	hl, hl
		djnz	loc_8B5
		jr	loc_8C0
; ---------------------------------------------------------------------------

loc_8BA:
		ld	e, (ix+14h)
		ld	d, (ix+15h)

loc_8C0:
		add	hl, de
		ld	e, (ix+26h)
		ld	d, (ix+27h)
		add	hl, de
		ld	(ix+8),	l
		ld	(ix+9),	h
		dec	(ix+39h)
		jp	nz, loc_963
		ld	a, (ix+38h)
		ld	(ix+39h), a
		ld	a, (ix+1Ch)
		add	a, (ix+1Dh)
		ld	(ix+1Ch), a
		ld	a, (ix+1Eh)
		or	a
		jr	z, loc_963
		dec	(ix+1Eh)
		jr	nz, loc_963
		ld	l, (ix+20h)
		ld	h, (ix+21h)

loc_8F4:
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_963
		cp	0F9h
		jr	c, loc_955
		cpl
		dec	a
		jp	p, loc_908
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_8F4
; ---------------------------------------------------------------------------

loc_908:
		jr	nz, loc_917
		dec	(ix+1Fh)
		jr	z, loc_8F4
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		jr	loc_8F4
; ---------------------------------------------------------------------------

loc_917:
		dec	a
		jr	nz, loc_927
		ld	a, (hl)
		inc	hl
		ld	(ix+1Fh), a
		ld	(ix+22h), l
		ld	(ix+23h), h
		jr	loc_8F4
; ---------------------------------------------------------------------------

loc_927:
		dec	a
		jr	nz, loc_935
		xor	a
		sub	(ix+1Dh)
		ld	(ix+1Dh), a
		ld	a, (hl)
		inc	hl
		jr	loc_95A
; ---------------------------------------------------------------------------

loc_935:
		dec	a
		jr	nz, loc_93F
		ld	a, (hl)
		inc	hl
		ld	(ix+1Ch), a
		jr	loc_8F4
; ---------------------------------------------------------------------------

loc_93F:
		dec	a
		jr	nz, loc_94B
		xor	a
		ld	(ix+1Dh), a
		ld	(ix+1Eh), a
		jr	loc_963
; ---------------------------------------------------------------------------

loc_94B:
		ld	a, (hl)
		inc	hl
		ld	(ix+39h), a
		ld	(ix+38h), a
		jr	loc_8F4
; ---------------------------------------------------------------------------

loc_955:
		ld	c, (hl)
		inc	hl
		ld	(ix+1Dh), c

loc_95A:
		ld	(ix+1Eh), a
		ld	(ix+20h), l
		ld	(ix+21h), h

loc_963:
		ld	a, (ix+1)
		or	a
		jr	z, loc_971
		call	sub_977
		bit	7, (ix+0)
		ret	z

loc_971:
		call	sub_53D
		jp	loc_5BB
; End of function sub_757


; =============== S U B R O U T I N E =======================================


sub_977:
		bit	1, (ix+0)
		jr	nz, loc_998
		bit	0, (ix+0)
		jr	z, loc_9CC
		set	1, (ix+0)
		ld	a, (ix+2Fh)
		or	a
		jr	z, loc_9A3
		cp	(ix+30h)
		jr	nc, loc_9A3
		set	2, (ix+0)
		jr	loc_9FF
; ---------------------------------------------------------------------------

loc_998:
		bit	2, (ix+0)
		jr	nz, loc_9FF
		dec	(ix+2Ch)
		jr	nz, loc_9FF

loc_9A3:
		ld	a, (ix+30h)
		add	a, (ix+2Eh)
		ld	c, (ix+2Fh)
		inc	c
		dec	c
		jr	nz, loc_9B6
		or	a
		jp	m, loc_461
		jr	loc_9C4
; ---------------------------------------------------------------------------

loc_9B6:
		or	a
		jp	p, loc_9BC
		jr	loc_9BF
; ---------------------------------------------------------------------------

loc_9BC:
		cp	c
		jr	c, loc_9C4

loc_9BF:
		ld	a, c
		set	2, (ix+0)

loc_9C4:
		ld	c, (ix+2Dh)
		ld	(ix+2Ch), c
		jr	loc_9FC
; ---------------------------------------------------------------------------

loc_9CC:
		ld	a, (ix+2Ch)
		or	a
		jr	z, loc_9FF
		dec	(ix+2Ch)
		jr	nz, loc_9FF
		ld	l, (ix+2Ah)
		ld	h, (ix+2Bh)
		ld	a, (hl)
		cp	0F0h
		jp	z, loc_461
		inc	hl
		ld	c, a
		and	0Fh
		ld	(ix+2Ch), a
		ld	(ix+2Ah), l
		ld	(ix+2Bh), h
		ld	a, c
		rrca
		and	78h
		add	a, (ix+2)
		jp	p, loc_9FC
		ld	a, 7Fh

loc_9FC:
		ld	(ix+30h), a

loc_9FF:
		ld	a, (ix+30h)
		add	a, (ix+1Ch)
		ld	(ix+28h), a
		ret
; End of function sub_977
; ---------------------------------------------------------------------------

loc_A09:
		ld	l, (ix+3)
		ld	h, 0
		ld	e, l
		ld	d, h
		add	hl, hl
		ex	de, hl
		add	hl, de
		ex	de, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, de
		ld	de, 9B01h	; Instruments offset (12h size)
		add	hl, de
		ld	a, (hl)
		inc	hl
		cp	(ix+24h)
		jr	z, loc_A2C
		ld	(ix+24h), a
		ld	c, a
		ld	b, 0B0h
		call	sub_6C9

loc_A2C:
		ld	a, (hl)
		inc	hl
		ld	(ix+5),	a
		ld	a, (ix+3Eh)
		and	0C0h
		ld	c, a
		jr	z, loc_A3B
		ld	a, 0C0h

loc_A3B:
		cpl
		and	(hl)
		inc	hl
		or	c
		cp	(ix+25h)
		jr	z, loc_A4D
		ld	(ix+25h), a
		ld	c, a
		ld	b, 0B4h
		call	sub_6C9

loc_A4D:
		push	ix
		pop	de
		ex	de, hl
		ld	bc, 28h
		add	hl, bc
		ex	de, hl
		xor	a
		call	sub_67D
		ld	a, 8
		call	sub_67D
		ld	a, 4
		call	sub_67D
		ld	a, 0Ch
		call	sub_67D
		ld	a, (hl)
		inc	hl
		ld	(ix+26h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+27h), a
		call	sub_B05
		call	sub_668
		ld	e, (hl)
		push	ix
		pop	hl
		ld	bc, 28h
		add	hl, bc
		ld	d, b

loc_A82:
		ld	a, (hl)
		inc	hl
		srl	e
		jr	c, loc_A9B
		cp	(hl)
		jr	z, loc_A9B
		ld	(hl), a
		ld	c, a
		ld	a, d
		srl	a
		jr	nc, loc_A94
		or	2

loc_A94:
		rlca
		rlca
		or	40h
		call	sub_6C8

loc_A9B:
		inc	hl
		inc	hl
		inc	hl
		inc	d
		bit	2, d
		jr	z, loc_A82
		ld	a, (ix+5)
		call	sub_6E3
		ret
; ---------------------------------------------------------------------------

loc_AAA:
		ld	(ix+29h), 78h
		ld	a, 0DFh
		ld	(7F11h), a

loc_AB3:
		ld	l, (ix+3)
		ld	h, 0
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		add	hl, hl
		ld	de, byte_15A6
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	(ix+2Fh), a
		ld	a, (hl)
		inc	hl
		ld	(ix+2Dh), a
		ld	a, (hl)
		inc	hl
		ld	(ix+2Eh), a
		ld	a, (hl)
		inc	hl
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, word_160D
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, (hl)
		inc	hl
		ld	(ix+2Ah), l
		ld	(ix+2Bh), h
		ld	e, a
		and	0Fh
		ld	(ix+2Ch), a
		ld	a, e
		rrca
		and	78h
		add	a, (ix+2)
		jp	p, loc_AF9
		ld	a, 7Fh

loc_AF9:
		ld	(ix+30h), a
		pop	hl
		ld	(ix+26h), 0
		ld	(ix+27h), 0E8h

; =============== S U B R O U T I N E =======================================

sub_B05:
		ld	a, (hl)
		inc	hl
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	bc, word_1691
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	(ix+10h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+11h), a
		pop	hl
		ld	l, (hl)
		ld	h, 0
		add	hl, hl
		ld	bc, word_17E1
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	(ix+20h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+21h), a
		xor	a
		ld	(ix+14h), a
		ld	(ix+15h), a
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		ld	(ix+3Fh), a
		inc	a
		ld	(ix+0Eh), a
		ld	(ix+3Ah), a
		ld	(ix+3Bh), a
		ld	(ix+1Eh), a
		ld	(ix+38h), a
		ld	(ix+39h), a
		call	sub_B5C
		ld	(hl), 32h
		ret
; End of function sub_B05


; =============== S U B R O U T I N E =======================================


sub_B5C:
		ld	a, (byte_1BF6)
		ld	hl, byte_1BF7
		add	a, l
		ld	l, a
		ret	nc
		inc	h
		ret
; End of function sub_B5C


; =============== S U B R O U T I N E =======================================


sub_B67:
		call	sub_B5C
		ld	a, (hl)
		ld	c, a
		sla	c
		sla	c
		add	a, c
		sla	c
		sla	c
		add	a, c
		sla	c
		add	a, c
		sla	c
		add	a, c
		add	a, 7Fh
		ld	(hl), a
		ret
; End of function sub_B67


; =============== S U B R O U T I N E =======================================


sub_B80:
		ld	ix, byte_1EC0
		xor	a

loc_B85:
		ld	(byte_1C07), a
		bit	7, (ix+0)
		call	nz, sub_B9D
		ld	de, 20h
		add	ix, de
		ld	a, (byte_1C07)
		inc	a
		cp	0Ah
		jr	c, loc_B85
		ret
; End of function sub_B80


; =============== S U B R O U T I N E =======================================


sub_B9D:
		bit	7, (ix+10h)
		jr	z, loc_BA9
		ld	a, (byte_1C03)
		bit	0, a
		ret	nz

loc_BA9:
		bit	6, (ix+0)
		jr	nz, loc_BE4
		set	6, (ix+0)
		xor	a
		ld	(ix+2),	a
		ld	(ix+3),	a
		ld	(ix+1),	a
		ld	(ix+12h), a
		ld	(ix+13h), a
		ld	(ix+8),	a
		ld	(ix+9),	a
		ld	(ix+0Ah), 0Fh
		ld	(ix+0Bh), 8
		ld	(ix+0Ch), a
		ld	(ix+0Dh), a
		ld	(ix+0Eh), a
		ld	a, (ix+11h)
		and	1
		ld	(ix+11h), a
		jr	loc_C03
; ---------------------------------------------------------------------------

loc_BE4:
		ld	l, (ix+2)
		ld	h, (ix+3)
		ld	e, 9
		bit	7, (ix+10h)
		jr	z, loc_BF6
		ld	a, (byte_1C06)
		ld	e, a

loc_BF6:
		xor	a
		ld	d, a
		sbc	hl, de
		ld	(ix+2),	l
		ld	(ix+3),	h
		jr	z, loc_C03
		ret	nc

loc_C03:
		ld	e, (ix+6)
		ld	d, (ix+7)
		xor	a
		ld	(byte_1C1A), a
		ld	(byte_1C1B), a
		ld	l, (ix+4)
		ld	h, (ix+5)
		ld	(word_1C18), hl

loc_C19:
		ld	a, (de)
		inc	de
		cp	0E0h
		jr	c, loc_C33
		add	a, a
		and	3Eh
		add	a, 63h
		ld	l, a
		ld	a, 0
		adc	a, 0Eh
		ld	h, a
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	bc, loc_C19
		push	bc
		jp	(hl)
; ---------------------------------------------------------------------------

loc_C33:
		cp	0D8h
		jr	c, loc_C3E
		sub	0D7h
		call	sub_E56
		jr	loc_C19
; ---------------------------------------------------------------------------

loc_C3E:
		cp	0D0h
		jr	c, loc_C4D
		sub	0CFh
		call	sub_E56
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jr	loc_C19
; ---------------------------------------------------------------------------

loc_C4D:
		cp	0C0h
		jr	c, loc_C6C
		and	0Fh
		ld	c, a
		ld	b, 0
		ld	hl, byte_E36
		add	hl, bc
		ld	l, (hl)
		ld	h, 0
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	(word_1C18), hl
		ld	(ix+4),	l
		ld	(ix+5),	h
		jr	loc_C19
; ---------------------------------------------------------------------------

loc_C6C:
		cp	60h
		jr	c, loc_C77
		sub	60h
		call	sub_CA6
		jr	loc_C19
; ---------------------------------------------------------------------------

loc_C77:
		call	sub_CA6

loc_C7A:
		ld	(ix+6),	e
		ld	(ix+7),	d
		ld	a, (word_1C18)
		add	a, (ix+2)
		ld	(ix+2),	a
		ld	a, (word_1C18+1)
		adc	a, (ix+3)
		ld	(ix+3),	a
		ld	a, (byte_1C1B)
		ld	(ix+13h), a
		res	4, (ix+0)
		ld	a, (byte_1C1A)
		or	a
		ret	z
		set	4, (ix+0)
		ret
; End of function sub_B9D

; =============== S U B R O U T I N E =======================================

sub_CA6:
		push	de
		bit	0, (ix+11h)
		jp	nz, loc_E13
		bit	0, (ix+0)
		jr	z, loc_CEC
		ld	l, a
		add	a, a
		add	a, l
		ld	l, a
		ld	h, 0
		rl	h
		add	hl, hl
		ld	de, 0A176h	; Music offset
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	(byte_1C20), a
		ld	a, (hl)
		inc	hl
		ld	(byte_1C21), a
		ld	a, (ix+10h)
		and	7Fh
		ld	(byte_1C22), a
		push	hl
		call	sub_394
		pop	hl
		jp	nz, loc_E13
		ld	a, (hl)
		inc	hl
		ld	(iy+3),	a
		ld	a, (hl)
		inc	hl
		ld	c, a
		and	3Fh
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		jp	loc_DA6
; ---------------------------------------------------------------------------

loc_CEC:
		add	a, (ix+0Dh)
		ld	h, a
		ld	l, (ix+0Ch)
		ld	(word_1C24), hl
		ld	a, (ix+8)
		ld	(byte_1C20), a
		bit	5, (ix+0)
		jr	z, loc_D63
		call	sub_40E
		jr	c, loc_D83
		bit	4, (ix+0)
		jr	nz, loc_D16
		push	iy
		ex	(sp), ix
		call	sub_447
		pop	ix

loc_D16:
		ld	hl, (word_1C24)
		ld	(iy+18h), l
		ld	(iy+19h), h
		ld	e, (iy+0Ch)
		ld	d, (iy+0Dh)
		or	a
		sbc	hl, de
		push	af
		jr	nc, loc_D32
		xor	a
		sub	l
		ld	l, a
		ld	a, 0
		sbc	a, h
		ld	h, a

loc_D32:
		xor	a
		ld	b, 10h
		ld	c, (ix+0Fh)

loc_D38:
		add	hl, hl
		rla
		cp	c
		jr	c, loc_D3F
		sub	c
		inc	l

loc_D3F:
		djnz	loc_D38
		pop	af
		jr	nc, loc_D4B
		xor	a
		sub	l
		ld	l, a
		ld	a, 0
		sbc	a, h
		ld	h, a

loc_D4B:
		ld	(iy+1Ah), l
		ld	(iy+1Bh), h
		bit	4, (ix+0)
		jr	nz, loc_D77
		ld	(iy+0),	80h
		ld	a, (ix+0Bh)
		ld	c, (ix+11h)
		jr	loc_DAC
; ---------------------------------------------------------------------------

loc_D63:
		bit	4, (ix+0)
		jr	z, loc_D83
		call	sub_40E
		jr	c, loc_D83
		ld	hl, (word_1C24)
		ld	(iy+0Ch), l
		ld	(iy+0Dh), h

loc_D77:
		call	sub_E1C
		ld	a, (ix+12h)
		ld	(iy+7),	a
		jp	loc_E13
; ---------------------------------------------------------------------------

loc_D83:
		ld	a, (ix+0Ah)
		ld	(byte_1C21), a
		ld	a, (ix+10h)
		and	7Fh
		ld	(byte_1C22), a
		call	sub_394
		jp	nz, loc_E13
		ld	a, (ix+9)
		ld	(iy+3),	a
		ld	a, (ix+0Bh)
		ld	c, (ix+11h)
		ld	hl, (word_1C24)

loc_DA6:
		ld	(iy+0Ch), l
		ld	(iy+0Dh), h

loc_DAC:
		ld	(iy+3Eh), c
		call	sub_E1C
		ld	hl, byte_1C1A
		bit	0, (hl)
		jr	z, loc_DBF
		xor	a
		ld	(iy+3Ch), a
		jr	loc_DDA
; ---------------------------------------------------------------------------

loc_DBF:
		ld	b, 5
		ld	de, (word_1C18)
		ld	hl, 0

loc_DC8:
		srl	h
		rr	l
		rra
		jr	nc, loc_DD0
		add	hl, de

loc_DD0:
		djnz	loc_DC8
		xor	a
		sub	l
		ld	(iy+3Ch), a
		ld	a, 80h
		sbc	a, h

loc_DDA:
		ld	(iy+3Dh), a
		ld	a, (byte_1C20)
		or	a
		jr	z, loc_DE6
		ld	(iy+1),	a

loc_DE6:
		ld	c, 80h
		ld	a, (ix+10h)
		or	a
		jp	p, loc_DF3
		and	7Fh
		ld	c, 0A0h

loc_DF3:
		bit	5, (ix+0)
		jr	z, loc_E01
		bit	7, (iy+0)
		jr	z, loc_E01
		set	4, c

loc_E01:
		ld	(iy+4),	a
		ld	(iy+0),	c
		ld	a, (byte_1C07)
		ld	(iy+6),	a
		ld	a, (ix+12h)
		ld	(iy+7),	a

loc_E13:
		pop	de
		inc	(ix+12h)
		ld	hl, byte_1C1B
		inc	(hl)
		ret
; End of function sub_CA6


; =============== S U B R O U T I N E =======================================


sub_E1C:
		ld	hl, byte_1200
		ld	b, (iy+1)
		inc	b
		dec	b
		jr	z, loc_E29
		ld	hl, byte_1240

loc_E29:
		ld	e, (ix+0Eh)
		srl	e
		ld	d, 0
		add	hl, de
		ld	l, (hl)
		ld	(iy+2),	l
		ret
; End of function sub_E1C

; ---------------------------------------------------------------------------
byte_E36:	db 6
		db 9
		db 0Ch
		db 12h
		db 18h
		db  24h
		db 30h
		db  48h
		db 60h
		db  90h
		db 0C0h
		db 8
		db  10h
		db  20h
		db  3Ch
		db  78h

; =============== S U B R O U T I N E =======================================


sub_E46:
		ld	a, (ix+1)

loc_E49:
		ld	l, a
		add	a, a
		add	a, l
		add	a, 14h
		push	ix
		pop	hl
		add	a, l
		ld	l, a
		ret	nc
		inc	h
		ret
; End of function sub_E46


; =============== S U B R O U T I N E =======================================


sub_E56:
		ld	c, a
		call	sub_E46
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), c

loc_E5F:
		inc	(ix+1)
		ret
; End of function sub_E56

; ---------------------------------------------------------------------------
off_E63:	dw sub_EA3		; 0
		dw sub_EAD		; 1
		dw sub_EB2		; 2
		dw loc_EB9		; 3
		dw sub_ECD		; 4
		dw locret_EAC		; 5
		dw locret_EAC		; 6
		dw locret_EAC		; 7
		dw locret_EAC		; 8
		dw locret_EAC		; 9
		dw locret_EAC		; 0Ah
		dw locret_EAC		; 0Bh
		dw locret_EAC		; 0Ch
		dw locret_EAC		; 0Dh
		dw locret_EAC		; 0Eh
		dw locret_EAC		; 0Fh
		dw sub_ED8		; 10h
		dw sub_EDE		; 11h
		dw sub_EE4		; 12h
		dw sub_EEF		; 13h
		dw sub_F00		; 14h
		dw sub_F06		; 15h
		dw sub_F0F		; 16h
		dw sub_F26		; 17h
		dw sub_F2C		; 18h
		dw sub_F35		; 19h
		dw sub_F42		; 1Ah
		dw sub_F46		; 1Bh
		dw sub_F4C		; 1Ch
		dw sub_F52		; 1Dh
		dw sub_F57		; 1Eh
		dw sub_F67		; 1Fh

; =============== S U B R O U T I N E =======================================


sub_EA3:
		ld	a, (de)
		inc	de
		ld	(ix+0Fh), a
		set	5, (ix+0)

locret_EAC:
		ret
; End of function sub_EA3


; =============== S U B R O U T I N E =======================================


sub_EAD:
		res	5, (ix+0)
		ret
; End of function sub_EAD


; =============== S U B R O U T I N E =======================================


sub_EB2:
		ld	a, (de)
		inc	de
		ld	l, a
		ld	h, 0
		jr	loc_EBF
; ---------------------------------------------------------------------------

loc_EB9:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ex	de, hl

loc_EBF:
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	(word_1C18), hl
		ld	(ix+4),	l
		ld	(ix+5),	h
		ret
; End of function sub_EB2


; =============== S U B R O U T I N E =======================================


sub_ECD:
		ld	a, (de)
		inc	de
		ld	(word_1C14), a
		ld	a, (de)
		inc	de
		ld	(word_1C14+1), a
		ret
; End of function sub_ECD


; =============== S U B R O U T I N E =======================================


sub_ED8:
		ld	a, (de)
		inc	de
		ld	(ix+9),	a
		ret
; End of function sub_ED8


; =============== S U B R O U T I N E =======================================


sub_EDE:
		ld	a, (de)
		inc	de
		ld	(ix+0Bh), a
		ret
; End of function sub_EDE


; =============== S U B R O U T I N E =======================================


sub_EE4:
		ld	a, (de)
		inc	de
		ld	(ix+0Ch), a
		ld	a, (de)
		inc	de
		ld	(ix+0Dh), a
		ret
; End of function sub_EE4


; =============== S U B R O U T I N E =======================================


sub_EEF:
		ld	a, (de)
		inc	de
		add	a, (ix+0Ch)
		ld	(ix+0Ch), a
		ld	a, (de)
		inc	de
		adc	a, (ix+0Dh)
		ld	(ix+0Dh), a
		ret
; End of function sub_EEF


; =============== S U B R O U T I N E =======================================


sub_F00:
		ld	a, (de)
		inc	de
		ld	(ix+0Eh), a
		ret
; End of function sub_F00


; =============== S U B R O U T I N E =======================================


sub_F06:
		ld	a, (de)
		inc	de
		add	a, (ix+0Eh)
		ld	(ix+0Eh), a
		ret
; End of function sub_F06


; =============== S U B R O U T I N E =======================================


sub_F0F:
		ld	a, (de)
		inc	de
		ld	(ix+8),	a
		sub	2
		ld	a, 3Fh
		jr	c, loc_F22
		jr	z, loc_F20
		ld	a, 1
		jr	loc_F22
; ---------------------------------------------------------------------------

loc_F20:
		ld	a, 7

loc_F22:
		ld	(ix+0Ah), a
		ret
; End of function sub_F0F


; =============== S U B R O U T I N E =======================================


sub_F26:
		ld	a, (de)
		inc	de
		ld	(ix+0Ah), a
		ret
; End of function sub_F26


; =============== S U B R O U T I N E =======================================


sub_F2C:
		ld	a, (ix+0)
		xor	1
		ld	(ix+0),	a
		ret
; End of function sub_F2C


; =============== S U B R O U T I N E =======================================


sub_F35:
		ld	a, (ix+11h)
		and	3Fh
		ld	c, a
		ld	a, (de)
		inc	de
		or	c
		ld	(ix+11h), a
		ret
; End of function sub_F35


; =============== S U B R O U T I N E =======================================


sub_F42:
		pop	hl
		jp	loc_C7A
; End of function sub_F42


; =============== S U B R O U T I N E =======================================


sub_F46:
		push	de
		call	sub_2E6
		pop	de
		ret
; End of function sub_F46


; =============== S U B R O U T I N E =======================================


sub_F4C:
		ld	a, 1
		ld	(byte_1C1A), a
		ret
; End of function sub_F4C


; =============== S U B R O U T I N E =======================================


sub_F52:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ret
; End of function sub_F52


; =============== S U B R O U T I N E =======================================


sub_F57:
		call	sub_E46
		dec	hl
		dec	(hl)
		jr	nz, loc_F62
		dec	(ix+1)
		ret
; ---------------------------------------------------------------------------

loc_F62:
		dec	hl
		ld	d, (hl)
		dec	hl
		ld	e, (hl)
		ret
; End of function sub_F57


; =============== S U B R O U T I N E =======================================


sub_F67:
		ld	a, (ix+1)
		or	a
		jp	nz, loc_F77
		pop	hl
		call	sub_2E6
		ld	(ix+0),	0
		ret
; ---------------------------------------------------------------------------

loc_F77:
		dec	a
		call	loc_E49
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		dec	(hl)
		jr	nz, sub_F52
		dec	(ix+1)
		inc	de
		inc	de
		ret
; End of function sub_F67


; =============== S U B R O U T I N E =======================================


sub_F88:
		ld	(word_1B82), bc
		ld	(word_1B84), de
		ld	(word_1B86), hl
		ld	(word_1B88), ix
		ld	(word_1B8A), iy
		pop	hl
		ld	(word_1B8C), hl
		ld	(word_1B8E), sp
		push	af
		pop	hl
		ld	(word_1B80), hl
		ex	af, af'
		push	af
		ex	af, af'
		pop	hl
		ld	(word_1B90), hl
		exx
		ld	(word_1B92), bc
		ld	(word_1B94), de
		ld	(word_1B96), hl
		exx
		ld	a, (byte_1BA2)
		or	a
		jr	z, loc_FCE
		ld	c, a
		ld	b, 0
		ld	hl, byte_1BA3
		ld	de, (word_1BA0)
		ldir

loc_FCE:
		ld	a, (byte_1BAA)
		or	a
		jr	z, loc_FE0
		ld	c, a
		ld	b, 0
		ld	hl, byte_1BAB
		ld	de, (word_1BA8)
		ldir

loc_FE0:
		ld	a, (byte_1BB2)
		or	a
		jr	z, loc_FF2
		ld	c, a
		ld	b, 0
		ld	hl, byte_1BB3
		ld	de, (word_1BB0)
		ldir

loc_FF2:
		ld	a, 1
		ld	(byte_1B98), a
		ld	(byte_1B99), a

loc_FFA:
		ld	a, (byte_1B99)
		or	a
		jr	nz, loc_FFA
		ld	a, (byte_1BA2)
		or	a
		jr	z, loc_101E
		ld	c, a
		ld	b, 0
		ld	hl, (word_1BA0)
		ld	de, byte_1BA3
		ldir
		ld	hl, (word_1BA0)
		ld	(hl), 0E7h

loc_1016:
		inc	hl
		dec	a
		jr	z, loc_101E
		ld	(hl), 0
		jr	loc_1016
; ---------------------------------------------------------------------------

loc_101E:
		ld	a, (byte_1BAA)
		or	a
		jr	z, loc_103C
		ld	c, a
		ld	b, 0
		ld	hl, (word_1BA8)
		ld	de, byte_1BAB
		ldir
		ld	hl, (word_1BA8)
		ld	(hl), 0EFh

loc_1034:
		inc	hl
		dec	a
		jr	z, loc_103C
		ld	(hl), 0
		jr	loc_1034
; ---------------------------------------------------------------------------

loc_103C:
		ld	a, (byte_1BB2)
		or	a
		jr	z, loc_105A
		ld	c, a
		ld	b, 0
		ld	hl, (word_1BB0)
		ld	de, byte_1BB3
		ldir
		ld	hl, (word_1BB0)
		ld	(hl), 0F7h

loc_1052:
		inc	hl
		dec	a
		jr	z, loc_105A
		ld	(hl), 0
		jr	loc_1052
; ---------------------------------------------------------------------------

loc_105A:
		ld	bc, (word_1B82)
		ld	de, (word_1B84)
		ld	sp, (word_1B8E)
		ld	hl, (word_1B8C)
		push	hl
		ld	hl, (word_1B80)
		push	hl
		ld	hl, (word_1B86)
		xor	a
		ld	(byte_1B98), a
		pop	af
		ret
; End of function sub_F88

; ---------------------------------------------------------------------------
word_1077:	dw 28Eh, 293h, 297h, 29Ch, 2A1h, 2A6h, 2ABh, 2B0h, 2B5h
		dw 2BAh, 2BFh, 2C4h, 2C9h, 2CEh, 2D4h, 2D9h, 2DEh, 2E3h
		dw 2E9h, 2EEh, 2F4h, 2F9h, 2FFh, 304h, 30Ah, 30Fh, 315h
		dw 31Bh, 320h, 326h, 32Ch, 332h, 338h, 33Eh, 344h, 34Ah
		dw 350h, 356h, 35Ch, 363h, 369h, 36Fh, 376h, 37Ch, 383h
		dw 389h, 390h, 396h, 39Dh, 3A4h, 3AAh, 3B1h, 3B8h, 3BFh
		dw 3C6h, 3CDh, 3D4h, 3DBh, 3E2h, 3E9h, 3F1h, 3F8h, 3FFh
		dw 407h, 40Eh, 416h, 41Dh, 425h, 42Dh, 434h, 43Ch, 444h
		dw 44Ch, 454h, 45Ch, 464h, 46Ch, 474h, 47Dh, 485h, 48Dh
		dw 496h, 49Eh, 4A7h, 4AFh, 4B8h, 4C1h, 4CAh, 4D3h, 4DBh
		dw 4E4h, 4EEh, 4F7h, 500h, 509h, 513h, 51Ch
word_1139:	dw 349h, 343h, 33Dh, 337h, 331h, 32Bh, 326h, 320h, 31Ah
		dw 314h, 30Fh, 309h, 303h, 2FEh, 2F8h, 2F3h, 2EDh, 2E8h
		dw 2E3h, 2DDh, 2D8h, 2D3h, 2CEh, 2C8h, 2C3h, 2BEh, 2B9h
		dw 2B4h, 2AFh, 2AAh, 2A5h, 2A0h, 29Ch, 297h, 292h, 28Dh
		dw 289h, 284h, 27Fh, 27Bh, 276h, 272h, 26Dh, 269h, 264h
		dw 260h, 25Bh, 257h, 253h, 24Eh, 24Ah, 246h, 242h, 23Eh
		dw 239h, 235h, 231h, 22Dh, 229h, 225h, 221h, 21Dh, 219h
		dw 216h, 212h, 20Eh, 20Ah, 206h, 203h, 1FFh, 1FBh, 1F8h
		dw 1F4h, 1F0h, 1EDh, 1E9h, 1E6h, 1E2h, 1DFh, 1DBh, 1D8h
		dw 1D5h, 1D1h, 1CEh, 1CAh, 1C7h, 1C4h, 1C1h, 1BDh, 1BAh
		dw 1B7h, 1B4h, 1B1h, 1AEh, 1ABh, 1A7h, 1A4h, 0,	0
		db 0
byte_1200:	db 0, 0, 0, 0, 1, 1, 1,	2, 2, 3, 3, 4, 5, 5, 6,	7, 8, 9
		db 0Ah,	0Bh, 0Dh, 0Fh, 10h, 12h, 14h, 18h, 18h,	1Ah, 1Ch
		db 1Fh,	21h, 23h, 26h, 28h, 2Ah, 2Ch, 2Eh, 30h,	32h, 34h
		db 36h,	38h, 3Ah, 3Ch, 40h, 41h, 42h, 43h, 44h,	45h, 46h
		db 47h,	48h, 49h, 4Ah, 4Bh, 4Bh, 4Bh, 4Ch, 4Ch,	4Dh, 4Dh
		db 4Eh,	7Fh
byte_1240:	db 0, 0, 8, 8, 8, 10h, 10h, 18h, 18h, 18h, 20h,	20h, 28h
		db 28h,	28h, 30h, 30h, 30h, 38h, 38h, 38h, 38h,	38h, 40h
		db 40h,	40h, 40h, 40h, 40h, 48h, 48h, 48h, 48h,	48h, 48h
		db 48h,	50h, 50h, 50h, 50h, 50h, 50h, 50h, 50h,	58h, 58h
		db 58h,	58h, 58h, 58h, 58h, 58h, 58h, 60h, 60h,	60h, 60h
		db 60h,	60h, 60h, 68h, 68h, 70h, 78h, 0A0h
byte_1281:	db 5Fh
		db  0Dh
		db  0Eh
		db  38h
		db  56h
		db    8
		db    5
		db  47h
		db  9Fh
		db  1Fh
		db    7
		db  36h
		db  16h
		db  0Ch
		db    6
		db  28h
		db  1Fh
		db  17h
		db    0
		db  40h
		db  51h
		db    2
		db    1
		db  15h
		db  1Fh
		db  12h
		db    3
		db  20h
		db  1Ah
		db  11h
		db  13h
		db  80h
		db  1Fh
		db  16h
		db    6
		db  20h
		db  1Fh
		db  13h
		db  0Bh
		db  19h
		db  1Fh
		db  1Fh
		db    7
		db  50h
		db  1Ah
		db  1Ch
		db  11h
		db  5Ah
		db  1Ch
		db  15h
		db  0Ch
		db  46h
		db  18h
		db  10h
		db    6
		db  1Ah
		db  1Fh
		db  1Fh
		db    6
		db  40h
		db  15h
		db  1Dh
		db  12h
		db  7Ah
		db  1Dh
		db  1Fh
		db  0Ch
		db  46h
		db  19h
		db  0Fh
		db  16h
		db  56h
		db  1Fh
		db  0Eh
		db  12h
		db 0D8h
		db  16h
		db  11h
		db    6
		db  2Bh
		db  1Bh
		db  13h
		db    4
		db  29h
		db  1Fh
		db    0
		db  14h
		db    0
		db  1Fh
		db  12h
		db  12h
		db  15h
		db  1Fh
		db  11h
		db  13h
		db  15h
		db  1Fh
		db  10h
		db  11h
		db  15h
		db  1Fh
		db  1Ch
		db    2
		db  31h
		db  1Fh
		db  14h
		db    3
		db  22h
		db  1Fh
		db  1Dh
		db  0Dh
		db  36h
		db  1Fh
		db  10h
		db    9
		db 0E8h
		db  18h
		db  1Fh
		db    0
		db    0
		db  1Fh
		db  10h
		db  0Bh
		db  34h
		db  1Fh
		db  12h
		db  0Ah
		db  34h
		db  1Fh
		db  1Fh
		db    0
		db    0
		db  1Fh
		db  1Bh
		db    5
		db  85h
		db  1Fh
		db  1Ch
		db    4
		db 0F0h
		db  1Dh
		db  0Fh
		db    5
		db  36h
		db  18h
		db  1Fh
		db    0
		db    0
		db  1Ah
		db  1Eh
		db  10h
		db  15h
		db  1Dh
		db  1Ch
		db    0
		db  18h
		db  19h
		db  1Fh
		db  14h
		db  0Bh
		db  1Dh
		db  16h
		db    9
		db  32h
		db  1Fh
		db  16h
		db    9
		db    0
		db  19h
		db  10h
		db    9
		db  46h
		db  1Fh
		db  11h
		db    0
		db    0
		db  1Fh
		db    9
		db  1Fh
		db    0
		db  1Fh
		db    7
		db  1Fh
		db  10h
		db  1Fh
		db  10h
		db  12h
		db    9
		db  1Fh
		db  10h
		db  10h
		db  48h
		db  1Fh
		db  1Ah
		db  10h
		db  9Ah
		db  1Fh
		db  13h
		db  0Ah
		db 0F8h
		db  1Fh
		db    0
		db  10h
		db  5Eh
		db  5Fh
		db    9
		db    0
		db    6
		db  5Fh
		db  0Ah
		db    0
		db    9
		db  1Fh
		db  0Eh
		db    0
		db 0E7h
		db  5Fh
		db  0Ch
		db    0
		db 0E6h
		db  1Fh
		db    8
		db    0
		db  43h
		db  0Dh
		db    8
		db    2
		db  18h
		db  1Fh
		db    9
		db    0
		db  30h
		db  1Fh
		db    6
		db    4
		db  80h
		db  1Fh
		db    8
		db    7
		db  30h
		db  0Dh
		db    9
		db    4
		db  20h
		db  12h
		db  0Bh
		db    3
		db  16h
		db  18h
		db    0
		db    0
		db    0
		db  0Eh
		db    7
		db    4
		db  40h
		db  1Ch
		db  0Dh
		db    6
		db  50h
		db  13h
		db  0Ch
		db    2
		db  35h
		db  18h
		db  1Fh
		db  13h
		db  79h
		db  16h
		db  0Fh
		db  0Fh
		db  75h
		db  1Fh
		db  10h
		db    4
		db  44h
		db  15h
		db  0Dh
		db    7
		db  66h
		db  1Fh
		db  1Fh
		db    0
		db    3
		db  11h
		db  1Fh
		db    0
		db    7
		db  11h
		db  1Fh
		db    0
		db  0Fh
		db  14h
		db    4
		db    0
		db  40h
		db  1Dh
		db    8
		db    2
		db  16h
		db  1Fh
		db    4
		db    1
		db  46h
		db  12h
		db    6
		db    1
		db  27h
		db  1Ch
		db  0Eh
		db    6
		db  40h
		db  1Fh
		db    8
		db    2
		db  27h
		db  10h
		db  10h
		db    3
		db    0
		db  14h
		db  1Fh
		db    1
		db  17h
		db  18h
		db  1Fh
		db    7
		db  40h
		db  12h
		db  10h
		db    7
		db  30h
		db  16h
		db  0Eh
		db  0Fh
		db  19h
		db  1Fh
		db  0Ch
		db    0
		db  10h
		db  16h
		db  1Ch
		db  0Bh
		db  26h
		db  18h
		db  1Dh
		db    6
		db  36h
		db  1Ch
		db  1Ch
		db  0Bh
		db  30h
		db  1Fh
		db  1Dh
		db    6
		db  26h
		db    9
		db  0Ch
		db    0
		db  80h
		db  1Fh
		db    0
		db  18h
		db  80h
		db  0Ch
		db  0Eh
		db    6
		db  96h
		db  1Fh
		db  18h
		db    0
		db  10h
		db  1Fh
		db  18h
		db    0
		db  20h
		db  17h
		db  1Fh
		db    6
		db    6
		db  13h
		db  15h
		db    8
		db 0FFh
		db  0Eh
		db    0
		db    0
		db    0
		db  11h
		db  10h
		db    3
		db  20h
		db  13h
		db  11h
		db    6
		db  18h
		db  0Ah
		db    0
		db    0
		db    0
		db  1Fh
		db    6
		db    0
		db  30h
		db  12h
		db  11h
		db    4
		db  17h
		db  14h
		db    8
		db    0
		db  40h
		db  10h
		db    8
		db    4
		db  18h
		db  1Fh
		db    4
		db    3
		db  48h
		db  16h
		db    6
		db    3
		db  28h
		db  1Fh
		db    7
		db    8
		db 0F0h
		db  14h
		db  0Fh
		db    9
		db  27h
		db  1Fh
		db  1Fh
		db    0
		db  16h
		db  1Fh
		db  1Fh
		db    4
		db  16h
		db  1Fh
		db  1Ch
		db    0
		db    6
		db  5Fh
		db  11h
		db    4
		db 0D8h
		db  1Fh
		db  10h
		db    0
		db  20h
		db  11h
		db  11h
		db    4
		db  17h
		db  0Ah
		db  1Fh
		db    5
		db    5
		db  10h
		db    6
		db    0
		db  30h
		db  12h
		db  1Fh
		db    0
		db    7
		db  0Ch
		db  10h
		db    6
		db  10h
		db  97h
		db  0Fh
		db    0
		db 0C0h
		db  97h
		db  11h
		db  11h
		db  4Eh
		db  5Fh
		db    7
		db    7
		db 0BFh
		db  1Fh
		db  18h
		db    9
		db  29h
		db  1Fh
		db  1Fh
		db    5
		db  56h
		db  12h
		db  11h
		db    8
		db  27h
		db  12h
		db  10h
		db    7
		db    7
		db  1Fh
		db    1
		db    1
		db  14h
		db  12h
		db    3
		db    1
		db  26h
		db  1Fh
		db  1Bh
		db    7
		db  89h
		db  1Fh
		db  13h
		db  11h
		db  39h
		db  1Fh
		db  11h
		db    2
		db  25h
		db  1Fh
		db  11h
		db  0Bh
		db  45h
		db  1Fh
		db  16h
		db    4
		db  18h
		db  1Ah
		db  11h
		db  11h
		db  9Ch
		db  1Dh
		db  12h
		db  13h
		db  98h
		db  1Bh
		db  0Fh
		db  0Fh
		db  29h
		db  5Ch
		db  12h
		db  0Fh
		db  37h
		db  16h
		db  0Fh
		db    6
		db  60h
		db  1Ch
		db  10h
		db    9
		db  26h
		db    5
		db    0
		db    0
		db    0
		db  1Fh
		db  0Ch
		db    0
		db  20h
		db  1Fh
		db    0
		db    4
		db  30h
		db  1Ch
		db    0
		db    2
		db    8
		db  1Ah
		db  0Eh
		db    9
		db  47h
		db  1Fh
		db  1Fh
		db  11h
		db    0
		db  0Dh
		db  1Fh
		db  1Fh
		db 0FFh
		db    8
		db  1Fh
		db  1Fh
		db 0FFh
		db  0Fh
		db  10h
		db  10h
		db  36h
		db  0Fh
		db    9
		db    1
		db  17h
		db  1Fh
		db  0Ah
		db    0
		db  20h
		db  14h
		db  0Fh
		db    5
		db  26h
		db  1Fh
		db    5
		db    0
		db  20h
		db  12h
		db    3
		db    2
		db  26h
		db  15h
		db  17h
		db    2
		db  36h
		db  0Fh
		db    3
		db    2
		db  36h
		db  12h
		db    6
		db    2
		db  26h
		db  18h
		db    8
		db    0
		db  20h
		db  1Ah
		db  0Dh
		db    0
		db  10h
		db  16h
		db  0Bh
		db    8
		db  15h
		db  1Ch
		db  0Fh
		db    5
		db    9
		db  1Fh
		db  0Bh
		db    0
		db  40h
		db  16h
		db  14h
		db  0Ah
		db  36h
		db  1Ch
		db    8
		db    4
		db  10h
		db  18h
		db  12h
		db  0Ch
		db  16h
		db  15h
		db  17h
		db    1
		db  1Ah
		db  1Fh
		db  0Dh
		db    0
		db  20h
		db  17h
		db  0Ah
		db    0
		db  30h
		db  1Ch
		db    9
		db    0
		db  10h
		db  1Ah
		db  0Ah
		db    7
		db  25h
		db  5Fh
		db  12h
		db    2
		db  96h
		db  1Fh
		db  0Ch
		db  0Ch
		db 0DFh
		db  1Fh
		db  0Eh
		db  0Dh
		db  1Fh
		db  18h
		db  0Eh
		db    9
		db  16h
		db  1Fh
		db  1Fh
		db    7
		db    0
		db  1Ch
		db  1Fh
		db    2
		db  0Ah
		db  16h
		db  10h
		db    9
		db  16h
		db  14h
		db  0Ch
		db    9
		db  16h
		db  1Fh
		db    8
		db    0
		db  20h
		db  1Fh
		db  0Bh
		db    4
		db  40h
		db  11h
		db    6
		db    2
		db  27h
		db    6
		db    5
		db    0
		db  20h
		db    4
		db    7
		db    0
		db  40h
		db    8
		db    6
		db    0
		db  20h
		db    9
		db  1Fh
		db    0
		db    9
		db  1Fh
		db  1Fh
		db  0Fh
		db    8
		db  1Fh
		db  1Fh
		db  0Ah
		db    0
		db  15h
		db  11h
		db    8
		db  66h
		db  1Fh
		db    4
		db    4
		db  40h
		db  10h
		db    5
		db    1
		db  17h
		db  18h
		db    4
		db    0
		db  10h
		db  1Ah
		db  0Ch
		db    6
		db  26h
		db  1Fh
		db  0Eh
		db    0
		db  60h
		db  1Ah
		db  10h
		db    0
		db  80h
		db  1Bh
		db  0Dh
		db    8
		db  88h
		db  1Ah
		db  0Ch
		db  0Ah
		db  10h
		db  1Ah
		db    8
		db    7
		db  10h
		db  16h
		db  0Dh
		db  0Ah
		db  18h
		db  0Eh
		db    8
		db    2
		db  18h
		db  12h
		db    8
		db    2
		db  18h
		db  0Bh
		db  1Fh
		db  10h
		db    8
		db    9
		db  0Ah
		db    0
		db 0F8h
		db  0Eh
		db  1Fh
		db    9
		db    8
		db  11h
byte_15A6:	db 0
		db    2
		db    4
		db    0
		db    0
		db    0
		db    0
		db    3
		db    1
		db    1
		db    0
		db    0
		db    0
		db    1
		db    4
		db    2
		db    1
		db    0
		db    0
		db    2
		db    4
		db    3
		db    2
		db    0
		db    0
		db    8
		db    1
		db    4
		db    0
		db    0
		db    0
		db    2
		db    1
		db    5
		db    0
		db    0
		db    0
		db  0Fh
		db    1
		db    6
		db    1
		db    0
		db    0
		db    2
		db    2
		db    7
		db    3
		db    0
		db    0
		db    2
		db    1
		db    8
		db    0
		db    0
		db    0
		db    1
		db    1
		db    9
		db    1
		db    0
		db    0
		db    2
		db    1
		db    3
		db    2
		db    0
		db    0
		db    2
		db    1
		db    7
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    8
		db    0
		db    0
		db    2
		db    1
		db  0Ah
		db  10h
		db    0
		db  4Fh
		db    1
		db    1
		db  0Bh
		db    0
		db    0
		db    0
		db    2
		db    1
		db  0Ch
		db    5
		db    0
		db    0
		db    2
		db    1
		db  0Ah
		db    0
		db    0
		db  0Dh
word_160D:	dw 1627h
		dw 1628h
		dw 162Eh
		dw 1634h
		dw 163Fh
		dw 1647h
		dw 164Bh
		dw 1651h
		dw 1659h
		dw 1661h
		dw 1671h
		dw 1679h
		dw 1687h
		db 0
		db  41h
		db  21h
		db  0Fh
		db  13h
		db  22h
		db 30h
		db  41h
		db  21h
		db  0Fh
		db  3Fh
		db  5Fh
		db  90h
		db    2
		db  31h
		db    2
		db  31h
		db    2
		db  31h
		db    2
		db  31h
		db    2
		db  31h
		db    0
		db  81h
		db  62h
		db  43h
		db  24h
		db  0Ch
		db  18h
		db  2Ch
		db  30h
		db  61h
		db  31h
		db  0Fh
		db  30h
		db  62h
		db  22h
		db    1
		db  12h
		db  31h
		db  50h
		db  91h
		db  41h
		db  11h
		db  0Fh
		db  18h
		db  28h
		db  3Ah
		db  40h
		db    1
		db  12h
		db  22h
		db  31h
		db  41h
		db  51h
		db  61h
		db  70h
		db  91h
		db  61h
		db  34h
		db  25h
		db  16h
		db    2
		db  11h
		db  21h
		db  31h
		db  41h
		db  51h
		db  61h
		db  71h
		db  81h
		db  91h
		db 0A0h
		db  61h
		db  51h
		db  41h
		db  31h
		db  21h
		db  11h
		db  0Fh
		db  10h
		db    7
		db  15h
		db  25h
		db  35h
		db  45h
		db  5Fh
		db  6Fh
		db  7Fh
		db  8Fh
		db  9Fh
		db 0AFh
		db 0BFh
		db 0CFh
		db 0D0h
		db  21h
		db  11h
		db    3
		db  11h
		db  21h
		db  31h
		db  42h
		db  52h
		db  60h
		db  15h
word_1691:	dw 16BBh
		dw 16BCh
		dw 16CDh
		dw 16D6h
		dw 16DDh
		dw 16E6h
		dw 16FBh
		dw 1707h
		dw 1716h
		dw 1722h
		dw 1731h
		dw 173Ah
		dw 1752h
		dw 1756h
		dw 1787h
		dw 17A5h
		dw 17ACh
		dw 17B8h
		dw 17C1h
		dw 17CAh
		dw 17D1h
		db    0
		db    2
		db  10h
		db    0
		db    3
		db 0D0h
		db 0FFh
		db  2Ah
		db  40h
		db 0FFh
		db  30h
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0C5h
		db  16h
		db 0F8h
		db    5
		db 0F0h
		db 0F8h
		db    5
		db 0F0h
		db 0FFh
		db 0CDh
		db  16h
		db  16h
		db    0
		db    0
		db  40h
		db  89h
		db 0FFh
		db 0FAh
		db  40h
		db  40h
		db 0A7h
		db  40h
		db  80h
		db  69h
		db 0FFh
		db 0DDh
		db  16h
		db  30h
		db    0
		db    0
		db    3
		db    1
		db    0
		db    6
		db 0FFh
		db 0FFh
		db    9
		db    3
		db    0
		db  10h
		db 0FDh
		db 0FFh
		db  10h
		db    3
		db    0
		db 0FFh
		db 0F2h
		db  16h
		db    2
		db    6
		db    6
		db    2
		db 0F4h
		db 0F3h
		db    2
		db  0Ch
		db  0Ch
		db 0FFh
		db 0FEh
		db  16h
		db  3Ch
		db    0
		db    0
		db  14h
		db    2
		db    0
		db  28h
		db 0FEh
		db 0FFh
		db  28h
		db    2
		db    0
		db 0FFh
		db  0Dh
		db  17h
		db    1
		db  80h
		db    3
		db    1
		db    0
		db 0F9h
		db    1
		db    0
		db    7
		db 0FFh
		db  19h
		db  17h
		db    1
		db  80h
		db 0FFh
		db  10h
		db    8
		db    0
		db  1Ah
		db    0
		db    0
		db    8
		db    3
		db    0
		db 0FFh
		db 0F2h
		db  16h
		db    2
		db 0F4h
		db 0FFh
		db  20h
		db  0Ch
		db    0
		db 0FFh
		db  16h
		db  17h
		db  11h
		db    0
		db    0
		db  0Fh
		db    2
		db    0
		db  22h
		db 0FEh
		db 0FFh
		db  16h
		db    3
		db    0
		db  1Ch
		db 0FDh
		db 0FFh
		db  10h
		db    7
		db    0
		db  10h
		db 0F9h
		db 0FFh
		db 0FFh
		db  49h
		db  17h
		db  40h
		db 0F8h
		db 0FFh
		db 0FAh
		db    1
		db  10h
		db    0
		db 0FDh
		db  0Ah
		db    2
		db 0F0h
		db 0FFh
		db    2
		db  10h
		db    0
		db 0FEh
		db 0FDh
		db    5
		db  10h
		db 0FFh
		db 0FFh
		db  10h
		db    1
		db    0
		db 0FEh
		db  10h
		db 0FDh
		db 0FFh
		db  10h
		db    3
		db    0
		db 0FDh
		db    5
		db  10h
		db 0F9h
		db 0FFh
		db  10h
		db    7
		db    0
		db 0FEh
		db  20h
		db 0FFh
		db 0FFh
		db  20h
		db 0FEh
		db 0FFh
		db  20h
		db 0FCh
		db 0FFh
		db  20h
		db 0F6h
		db 0FFh
		db 0FAh
		db  40h
		db    0
		db    0
		db    8
		db    4
		db    0
		db 0FDh
		db    2
		db  10h
		db 0FCh
		db 0FFh
		db  10h
		db    4
		db    0
		db 0FEh
		db    8
		db 0FCh
		db 0FFh
		db    8
		db 0F9h
		db 0FFh
		db  10h
		db    7
		db    0
		db  10h
		db 0F9h
		db 0FFh
		db 0FFh
		db  9Ch
		db  17h
		db    1
		db  10h
		db 0FFh
		db  14h
		db  0Ch
		db    0
		db 0FAh
		db  1Ch
		db    0
		db    0
		db  14h
		db    4
		db    0
		db  14h
		db 0FCh
		db 0FFh
		db 0FFh
		db 0AFh
		db  17h
		db 0F8h
		db    5
		db 0F0h
		db 0F8h
		db    5
		db 0F0h
		db 0FFh
		db 0B8h
		db  17h
		db  10h
		db 0FCh
		db 0FFh
		db  2Ah
		db    3
		db    0
		db 0FFh
		db 0F2h
		db  16h
		db  16h
		db    0
		db    0
		db  80h
		db 0D9h
		db 0FFh
		db 0FAh
		db    4
		db    0
		db    0
		db    3
		db  37h
		db    1
		db    1
		db 0F4h
		db 0F3h
		db    1
		db 0FAh
		db  0Bh
		db 0FFh
		db 0D7h
		db  17h
		db    2
word_17E1:	dw 17E5h
		dw 17E6h
		db    0
		db  38h
		db    0
		db 0FDh
		db    2
		db    1
		db    1
		db    5
		db    0
		db 0FEh
		db 0FDh
		db    3
		db    1
		db 0FFh
		db    5
		db    0
		db 0FEh
		db 0FDh
		db    4
		db    1
		db    1
		db    2
		db    0
		db 0FEh
		db 0FDh
		db    4
		db    1
		db 0FFh
		db    2
		db    0
		db 0FEh
		db 0FFh
		db 0F6h
		db  17h
		db 0FBh
		db  11h
		db  0Dh
		db 0A2h
		db    1
		db  9Bh
		db  81h
		db  12h
		db 0A6h
		db  15h
		db  0Dh
		db  16h
		db  91h
		db  16h
		db 0E1h
		db  17h
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_1B80:	ds 2
word_1B82:	ds 2
word_1B84:	ds 2
word_1B86:	ds 2
word_1B88:	ds 2
word_1B8A:	ds 2
word_1B8C:	ds 2
word_1B8E:	ds 2
word_1B90:	ds 2
word_1B92:	ds 2
word_1B94:	ds 2
word_1B96:	ds 2
byte_1B98:	ds 1
byte_1B99:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_1BA0:	ds 2
byte_1BA2:	ds 1
byte_1BA3:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_1BA8:	ds 2
byte_1BAA:	ds 1
byte_1BAB:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_1BB0:	ds 2
byte_1BB2:	ds 1
byte_1BB3:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1BF6:	ds 1
byte_1BF7:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C00:	ds 1
		ds 1
byte_1C02:	ds 1
byte_1C03:	ds 1
word_1C04:	ds 2
byte_1C06:	ds 1
byte_1C07:	ds 1
byte_1C08:	ds 1
byte_1C09:	ds 1
word_1C0A:	ds 2
word_1C0C:	ds 2
word_1C0E:	ds 2
byte_1C10:	ds 1
byte_1C11:	ds 1
byte_1C12:	ds 1
byte_1C13:	ds 1
word_1C14:	ds 2
word_1C16:	ds 2
word_1C18:	ds 2
byte_1C1A:	ds 1
byte_1C1B:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C20:	ds 1
byte_1C21:	ds 1
byte_1C22:	ds 1
byte_1C23:	ds 1
word_1C24:	ds 2
word_1C26:	ds 2
byte_1C28:	ds 1
		ds 1
word_1C2A:	ds 2
		ds 1
byte_1C2D:	ds 1
byte_1C2E:	ds 1
byte_1C2F:	ds 1
byte_1C30:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C80:	ds 1
byte_1C81:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1EC0:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1ED1:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1

	restore

		!org	$1B00

		binclude "Z80 Driver/Music/Music.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
