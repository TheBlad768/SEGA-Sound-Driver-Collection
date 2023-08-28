; ---------------------------------------------------------------------------
; Westone Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($2A0000>>15)

; =============== S U B R O U T I N E =======================================

Sound_Driver:
		save
		!org	0
		CPU Z80
		listing on

		di
		im	1
		jp	loc_39
; End of function start
; ---------------------------------------------------------------------------
		dw 1953h	; Driver size	; Now unused

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
		call	sub_6E2
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
		jp	sub_F98
; End of function sub_20
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_28:
		ex	(sp), hl
		dec	hl
		ex	(sp), hl
		jp	sub_F98
; End of function sub_28
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================

sub_30:
		ex	(sp), hl
		dec	hl
		ex	(sp), hl
		jp	sub_F98
; End of function sub_30
; ---------------------------------------------------------------------------
		db 0FFh
		db 0FFh

; =============== S U B R O U T I N E =======================================


zVInt:
		ret
; End of function zVInt

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_39:
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

loc_53:
		ld	(hl), d
		add	hl, de
		djnz	loc_53
		ld	e, 20h
		ld	b, 0Ah

loc_5B:
		ld	(hl), d
		add	hl, de
		djnz	loc_5B
		ld	hl, byte_1ED1
		ld	b, 0Ah

loc_64:
		ld	(hl), d
		add	hl, de
		djnz	loc_64

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
		ld	bc, 2B00h
		call	sub_70E
		ld	bc, 26EDh
		call	sub_70E
		ld	a, 2Ah
		ld	(byte_1C23), a
		ld	c, a
		ld	b, 27h
		call	sub_70E
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		call	sub_F7
		call	sub_152
		ld	a, 1
		ld	(byte_1C2D), a
		xor	a
		ld	(byte_1C00), a
		dec	a
		ld	(byte_1C29), a

loc_AF:
		xor	a
		ld	(byte_1C06), a
		ld	a, 3

loc_B5:
		ld	(byte_1C02), a
		call	sub_124
		call	sub_169
		call	sub_1A8
		ld	hl, (word_1C16)
		ld	h, 0
		ld	de, (word_1C14)
		add	hl, de
		ld	(word_1C16), hl
		ld	a, h
		ld	hl, byte_1C06
		add	a, (hl)
		ld	(hl), a
		call	sub_722
		ld	a, (byte_1C02)
		dec	a
		jr	nz, loc_B5
		call	sub_B98
		ld	hl, byte_1EC0
		ld	de, 10h
		ld	b, 0Ah

loc_E8:
		ld	a, (hl)
		add	hl, de
		and	(hl)
		add	hl, de
		and	80h
		jr	nz, loc_F2
		djnz	loc_E8

loc_F2:
		ld	(byte_1C1C), a
		jr	loc_AF

; =============== S U B R O U T I N E =======================================

sub_F7:
		ld	c, 0
		ld	d, 90h
		call	sub_114
		dec	c
		ld	d, 80h
		call	sub_114
		ld	b, 28h
		call	sub_109
; End of function sub_F7

; =============== S U B R O U T I N E =======================================

sub_109:
		inc	c
		ld	e, 3

loc_10C:
		call	sub_70E
		inc	c
		dec	e
		jr	nz, loc_10C
		ret
; End of function sub_109


; =============== S U B R O U T I N E =======================================


sub_114:
		xor	a
		call	sub_11A
		ld	a, 2
; End of function sub_114


; =============== S U B R O U T I N E =======================================


sub_11A:
		ld	(byte_1C10), a
		ld	e, 0
		rst	10h
		rst	10h
		rst	10h
		rst	10h
		ret
; End of function sub_11A

; =============== S U B R O U T I N E =======================================

sub_124:
		ld	a, (byte_1B99)
		or	a
		call	nz, sub_F98
		ld	hl, byte_1C2D
		dec	(hl)
		ret	nz
		ld	(hl), 1
		ld	a, (byte_1C03)
		and	2
		jr	z, loc_13B
		ld	(hl), 4

loc_13B:
		ld	a, (4000h)
		and	2
		jr	z, sub_124
		ld	hl, (word_1C04)
		inc	hl
		ld	(word_1C04), hl
		ld	a, (byte_1C23)
		ld	c, a
		ld	b, 27h
		jp	sub_70E
; End of function sub_124

; =============== S U B R O U T I N E =======================================

sub_152:
		call	sub_38C
		ld	hl, byte_1C81
		ld	de, 40h
		ld	b, 6

loc_15D:
		ld	(hl), d
		add	hl, de
		djnz	loc_15D
		ld	b, 3

loc_163:
		ld	(hl), 2
		add	hl, de
		djnz	loc_163
		ret
; End of function sub_152


; =============== S U B R O U T I N E =======================================


sub_169:
		ld	a, (word_1C2A)
		or	a
		jr	z, loc_176
		ld	a, (word_1C2A+1)
		ld	(word_1C0A+1), a
		ret
; ---------------------------------------------------------------------------

loc_176:
		ld	a, (byte_1C09)
		or	a
		ret	z
		ld	hl, (word_1C0A)
		ld	de, (word_1C0C)
		add	hl, de
		bit	7, h
		jr	z, loc_18C
		bit	7, d
		jp	z, sub_332

loc_18C:
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
; End of function sub_169


; =============== S U B R O U T I N E =======================================


sub_1A8:
		ld	a, 0FFh
		ld	(byte_1C00), a
		ld	a, (byte_1C2F)
		or	a
		jr	nz, loc_1C4
		ld	(byte_1C00), a
		ld	a, (byte_1C29)
		ld	c, a
		inc	a
		ret	z
		ld	a, 0FFh
		ld	(byte_1C29), a
		ld	a, c
		jr	loc_1EE
; ---------------------------------------------------------------------------

loc_1C4:
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
		jr	c, loc_1EE
		cpl
		add	a, a
		ld	e, a
		ld	hl, Index_285
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

loc_1EE:
		cp	9Ch
		ret	nc
		ld	e, a
		ld	hl, 0A1EFh	; Music pointers
		ex	de, hl
		add	hl, hl
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, (hl)
		inc	hl
		ld	(byte_1C28), a
		or	a
		jp	p, loc_23D
		ld	(byte_1C1C), a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_1C14), de
		push	hl
		ld	hl, 0
		ld	(word_1C16), hl
		call	sub_332
		pop	hl
		ld	ix, byte_1EC0
		ld	bc, 20h

loc_222:
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
		jr	loc_222
; ---------------------------------------------------------------------------

loc_23D:
		push	hl
		call	sub_367
		pop	hl

loc_242:
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
		jr	z, loc_26F
		ld	a, (byte_1C28)
		cp	(ix+10h)
		jr	nc, loc_26A
		inc	hl
		inc	hl
		jr	loc_242
; ---------------------------------------------------------------------------

loc_26A:
		push	hl
		call	sub_30B
		pop	hl

loc_26F:
		ld	(ix+0),	80h
		ld	a, (byte_1C28)
		ld	(ix+10h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+6),	a
		ld	a, (hl)
		inc	hl
		ld	(ix+7),	a
		jr	loc_242
; End of function sub_1A8

; ---------------------------------------------------------------------------
Index_285:	dw sub_38C		; 0
		dw loc_2AD		; 1
		dw sub_2F3		; 2
		dw sub_2CB		; 3
		dw sub_293		; 4
		dw sub_299		; 5
		dw sub_332		; 6

; =============== S U B R O U T I N E =======================================


sub_293:
		ld	a, 1
		ld	(word_1C2A), a
		ret
; End of function sub_293


; =============== S U B R O U T I N E =======================================


sub_299:
		ld	hl, byte_29E
		jr	loc_2B0
; ---------------------------------------------------------------------------
byte_29E:	db 80h
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

loc_2AD:
		ld	hl, byte_2C2

loc_2B0:
		ld	(word_1C0E), hl
		ld	hl, 0
		ld	(word_1C0C), hl
		ld	(word_1C2A), hl
		ld	a, 1
		ld	(byte_1C09), a
		ret
; End of function sub_299

; ---------------------------------------------------------------------------
byte_2C2:	db 20h
		db 40h
		db 0
		db 20h
		db 60h
		db 0
		db 0FFh
		db 80h
		db 0

; =============== S U B R O U T I N E =======================================


sub_2CB:
		ld	ix, byte_1EC0
		xor	a

loc_2D0:
		ld	(byte_1C07), a
		bit	7, (ix+0)
		jr	z, loc_2E0
		bit	7, (ix+10h)
		call	nz, sub_30B

loc_2E0:
		ld	de, 20h
		add	ix, de
		ld	a, (byte_1C07)
		inc	a
		cp	0Ah
		jr	c, loc_2D0
		ld	hl, byte_1C03
		set	0, (hl)
		ret
; End of function sub_2CB


; =============== S U B R O U T I N E =======================================


sub_2F3:
		ld	hl, byte_1C03
		res	0, (hl)
		ret
; End of function sub_2F3


; =============== S U B R O U T I N E =======================================


sub_2F9:
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
; End of function sub_2F9


; =============== S U B R O U T I N E =======================================


sub_30B:
		call	sub_2F9
		push	ix
		ld	ix, byte_1C80
		ld	b, 9

loc_316:
		bit	7, (ix+0)
		jr	z, loc_328
		cp	(ix+6)
		jr	nz, loc_328
		ld	c, a
		push	bc
		call	sub_469
		pop	bc
		ld	a, c

loc_328:
		ld	de, 40h
		add	ix, de
		djnz	loc_316
		pop	ix
		ret
; End of function sub_30B


; =============== S U B R O U T I N E =======================================


sub_332:
		xor	a
		ld	(word_1C0A), a
		ld	(word_1C0A+1), a
		ld	(byte_1C09), a
		ld	(word_1C2A), a
		ld	hl, byte_1C03
		res	0, (hl)
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_34A:
		bit	7, (ix+0)
		jr	z, loc_35F
		bit	7, (ix+10h)
		jr	z, loc_35F
		push	bc
		call	sub_30B
		pop	bc
		ld	(ix+0),	0

loc_35F:
		ld	de, 20h
		add	ix, de
		djnz	loc_34A
		ret
; End of function sub_332


; =============== S U B R O U T I N E =======================================


sub_367:
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_36D:
		bit	7, (ix+0)
		jr	z, loc_384
		ld	a, (byte_1C28)
		cp	(ix+10h)
		jr	nz, loc_384
		push	bc
		call	sub_30B
		pop	bc
		ld	(ix+0),	0

loc_384:
		ld	de, 20h
		add	ix, de
		djnz	loc_36D
		ret
; End of function sub_367


; =============== S U B R O U T I N E =======================================


sub_38C:
		ld	ix, byte_1EC0
		ld	b, 0Ah

loc_392:
		bit	7, (ix+0)
		jr	z, loc_3A1
		push	bc
		call	sub_30B
		pop	bc
		ld	(ix+0),	0

loc_3A1:
		ld	de, 20h
		add	ix, de
		djnz	loc_392
		ld	hl, 0
		ld	(word_1C2A), hl
		xor	a
		ld	(byte_1C09), a
		ld	(word_1C0A+1), a
		ret
; End of function sub_38C


; =============== S U B R O U T I N E =======================================


sub_3B6:
		ld	a, (byte_1C20)
		ld	e, a
		rrca
		add	a, e
		ld	e, a
		ld	d, 0
		ld	hl, byte_427
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

loc_3D4:
		bit	0, c
		jr	z, loc_412
		bit	7, (iy+0)
		ret	z
		ld	a, (byte_1C22)
		cp	(iy+4)
		jr	c, loc_412
		bit	7, b
		jr	nz, loc_403
		ld	a, b
		cp	(iy+4)
		jr	c, loc_412
		jr	nz, loc_403
		ld	a, (word_1C26+1)
		cp	(iy+3Dh)
		jr	c, loc_403
		jr	nz, loc_412
		ld	a, (word_1C26)
		cp	(iy+3Ch)
		jr	nc, loc_412

loc_403:
		ld	l, (iy+3Ch)
		ld	h, (iy+3Dh)
		ld	(word_1C26), hl
		ld	b, (iy+4)
		push	iy
		pop	hl

loc_412:
		add	iy, de
		srl	c
		jr	nz, loc_3D4
		bit	7, b
		ret	nz
		push	hl
		ex	(sp), ix
		call	sub_469
		ex	(sp), ix
		pop	iy
		xor	a
		ret
; End of function sub_3B6

; ---------------------------------------------------------------------------
byte_427:	db 80h
		db 1Ch
		db 3Fh
		db 0
		db 1Eh
		db 7
		db 80h
		db 1Eh
		db 1

; =============== S U B R O U T I N E =======================================


sub_430:
		ld	a, (ix+12h)
		sub	(ix+13h)
		ld	c, a
		ld	iy, byte_1C80
		ld	de, 40h
		ld	b, 9

loc_440:
		bit	7, (iy+0)
		jr	z, loc_453
		ld	a, (byte_1C07)
		cp	(iy+6)
		jr	nz, loc_453
		ld	a, c
		cp	(iy+7)
		ret	z

loc_453:
		add	iy, de
		djnz	loc_440
		scf
		ret
; End of function sub_430


; =============== S U B R O U T I N E =======================================


sub_459:
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
; End of function sub_459


; =============== S U B R O U T I N E =======================================


sub_469:
		call	sub_459
		cp	6
		jr	c, loc_477
		sub	6
		ld	(byte_1C11), a
		jr	loc_483
; ---------------------------------------------------------------------------

loc_477:
		srl	a
		ld	(byte_1C11), a
		ld	a, 0
		rla
		rlca
		ld	(byte_1C10), a

loc_483:
		ld	a, (ix+1)
		sub	2
		jr	c, loc_4AF
		jr	nz, loc_4A0
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

loc_4A0:
		ld	a, 78h
		ld	(byte_1C13), a
		ld	a, 0FFh
		ld	(7F11h), a
		ld	(ix+0),	0
		ret
; ---------------------------------------------------------------------------

loc_4AF:
		ld	c, 0FFh
		ld	b, 80h
		call	sub_6DF
		ld	b, 84h
		call	sub_6DF
		ld	b, 88h
		call	sub_6DF
		ld	b, 8Ch
		call	sub_6DF
		bit	1, (ix+0)
		jr	nz, loc_4CF
		xor	a
		call	sub_6F9

loc_4CF:
		ld	(ix+0),	0
		ret
; End of function sub_469


; =============== S U B R O U T I N E =======================================


sub_4D4:
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
		jr	nc, loc_4E6
		inc	h

loc_4E6:
		ld	l, a
		ret
; End of function sub_4D4


; =============== S U B R O U T I N E =======================================


sub_4E8:
		call	sub_4D4
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
		jr	z, loc_501
		ld	l, a
		add	a, e
		ld	e, a
		ld	a, l
		jr	nc, loc_501
		inc	d

loc_501:
		srl	a
		bit	3, h
		ret	z
		add	a, e
		ld	e, a
		ret	nc
		inc	d
		ret
; End of function sub_4E8


; =============== S U B R O U T I N E =======================================


sub_50B:
		call	sub_4D4
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
		jr	z, loc_523
		ld	l, a
		add	a, e
		ld	e, a
		ld	a, l
		jr	nc, loc_523
		inc	d

loc_523:
		srl	a
		bit	3, h
		ret	z
		add	a, e
		ld	e, a
		ret	nc
		inc	d
		ret
; End of function sub_50B


; =============== S U B R O U T I N E =======================================


sub_52D:
		ld	a, d
		cp	60h
		jr	c, loc_538
		ld	de, 0BF8h
		ld	c, 7
		ret
; ---------------------------------------------------------------------------

loc_538:
		ld	c, 0
		cp	30h
		jr	c, loc_542
		sub	30h
		set	2, c

loc_542:
		cp	18h
		jr	c, loc_54A
		sub	18h
		set	1, c

loc_54A:
		cp	0Ch
		jr	c, loc_551
		sub	0Ch
		inc	c

loc_551:
		ld	d, a
		ret
; End of function sub_52D


; =============== S U B R O U T I N E =======================================


sub_553:
		ld	a, (ix+1)
		or	a
		jr	z, loc_590
		call	sub_5BA
		ret	z
		call	sub_52D
		ld	hl, word_113B
		call	sub_50B
		ld	b, c
		inc	b
		dec	b
		jr	z, loc_571

loc_56B:
		srl	d
		rr	e
		djnz	loc_56B

loc_571:
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

loc_590:
		call	sub_5BA
		ret	z
		ld	a, (byte_1C11)
		add	a, 0A4h
		ld	b, a
		call	sub_52D
		ld	hl, word_1079
		call	sub_4E8
		ld	a, c
		rlca
		rlca
		rlca
		or	d
		ld	c, a
		call	sub_6E4
		res	2, b
		ld	c, e
		jp	sub_6E4
; End of function sub_553


; =============== S U B R O U T I N E =======================================


sub_5B2:
		and	0F8h
		ld	e, a
		cp	l
		ret	nz
		ld	a, d
		cp	h
		ret
; End of function sub_5B2


; =============== S U B R O U T I N E =======================================


sub_5BA:
		ld	a, (ix+8)
		ld	d, (ix+9)
		ld	l, (ix+0Ah)
		ld	h, (ix+0Bh)
		call	sub_5B2
		ret	z
		ld	(ix+0Ah), e
		ld	(ix+0Bh), d
		ret
; End of function sub_5BA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_76D

loc_5D1:
		ld	a, (ix+1)
		sub	2
		jr	c, loc_62D
		jr	nz, loc_606
		ld	a, (ix+0)
		and	20h
		jr	z, loc_5E4
		ld	a, (word_1C0A+1)

loc_5E4:
		add	a, (ix+28h)
		jp	p, loc_5EC
		ld	a, 7Fh

loc_5EC:
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

loc_606:
		ld	a, (byte_1C13)
		ld	b, a
		ld	a, (ix+0)
		and	20h
		jr	z, loc_614
		ld	a, (word_1C0A+1)

loc_614:
		ld	c, a
		add	a, (ix+28h)
		jp	p, loc_61D
		ld	a, 7Fh

loc_61D:
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

loc_62D:
		call	sub_67E
		ld	e, (hl)
		ld	a, (ix+2)
		add	a, (ix+1Ch)
		ld	c, a
		ld	a, (ix+0)
		and	20h
		jr	z, loc_642
		ld	a, (word_1C0A+1)

loc_642:
		add	a, c
		jp	po, loc_648
		ld	a, 7Fh

loc_648:
		ld	(byte_1C08), a
		push	ix
		pop	hl
		ld	bc, 28h
		add	hl, bc
		ld	d, b

loc_653:
		ld	c, (hl)
		inc	hl
		srl	e
		jr	nc, loc_675
		ld	a, (byte_1C08)
		add	a, c
		jp	p, loc_662
		ld	a, 7Fh

loc_662:
		cp	(hl)
		jr	z, loc_675
		ld	(hl), a
		ld	c, a
		ld	a, d
		srl	a
		jr	nc, loc_66E
		or	2

loc_66E:
		rlca
		rlca
		or	40h
		call	sub_6DE

loc_675:
		inc	hl
		inc	hl
		inc	hl
		inc	d
		bit	2, d
		jr	z, loc_653
		ret

; =============== S U B R O U T I N E =======================================

sub_67E:
		ld	a, (ix+24h)
		and	7
		add	a, FadeData&0FFh
		ld	l, a
		ld	h, FadeData>>8&0FFh
		ret	nc
		inc	h
		ret
; End of function sub_67E
; ---------------------------------------------------------------------------

FadeData:	db 8, 8, 8, 8, 0Ah, 0Eh, 0Eh, 0Fh

; =============== S U B R O U T I N E =======================================

sub_693:
		ld	(byte_1C12), a
		ldi
		inc	de
		ld	c, (hl)
		inc	hl
		ld	a, (de)
		cp	c
		jr	z, loc_6A6
		ld	a, c
		ld	(de), a
		ld	b, 30h
		call	sub_6DA

loc_6A6:
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
		jr	nz, loc_6BE
		inc	de
		inc	hl
		inc	hl
		inc	hl
		jr	loc_6D6
; ---------------------------------------------------------------------------

loc_6BE:
		ld	a, c
		ld	(de), a
		inc	de
		ld	c, (hl)
		inc	hl
		ld	b, 50h
		call	sub_6DA
		ld	c, (hl)
		inc	hl
		ld	b, 60h
		call	sub_6DA
		ld	c, (hl)
		inc	hl
		ld	b, 70h
		call	sub_6DA

loc_6D6:
		ld	c, (hl)
		pop	hl
		ld	b, 80h
; End of function sub_693

; =============== S U B R O U T I N E =======================================

sub_6DA:
		ld	a, (byte_1C12)
		or	b
; End of function sub_6DA

; =============== S U B R O U T I N E =======================================

sub_6DE:
		ld	b, a
; End of function sub_6DE

; =============== S U B R O U T I N E =======================================

sub_6DF:
		ld	a, (byte_1C11)
; End of function sub_6DF

; =============== S U B R O U T I N E =======================================

sub_6E2:
		or	b
		ld	b, a
; End of function sub_6E2

; =============== S U B R O U T I N E =======================================

sub_6E4:
		ld	a, (byte_1C10)
		push	hl
		ld	l, a
		ld	h, 40h

loc_6EB:
		ld	a, (4000h)
		or	a
		jp	m, loc_6EB
		ld	(hl), b
		inc	l
		jr	loc_6F6
; ---------------------------------------------------------------------------

loc_6F6:
		ld	(hl), c
		pop	hl
		ret
; End of function sub_6E4


; =============== S U B R O U T I N E =======================================


sub_6F9:
		ld	b, 28h
		ld	c, a
		ld	a, (byte_1C11)
		cp	3
		adc	a, 0FFh
		or	c
		ld	c, a
		ld	a, (byte_1C10)
		bit	1, a
		jr	z, sub_70E
		set	2, c
; End of function sub_6F9


; =============== S U B R O U T I N E =======================================


sub_70E:
		ld	a, (4000h)
		or	a
		jp	m, sub_70E
		ld	a, b
		ld	(4000h), a
		jr	loc_71B
; ---------------------------------------------------------------------------

loc_71B:
		jr	loc_71D
; ---------------------------------------------------------------------------

loc_71D:
		ld	a, c
		ld	(4001h), a
		ret
; End of function sub_70E


; =============== S U B R O U T I N E =======================================


sub_722:
		ld	ix, byte_1C80
		xor	a
		ld	(byte_1BF6), a

loc_72A:
		ld	(byte_1C11), a
		xor	a

loc_72E:
		ld	(byte_1C10), a
		bit	7, (ix+0)
		call	nz, sub_76D
		ld	de, 40h
		add	ix, de
		ld	hl, byte_1BF6
		inc	(hl)
		ld	a, (byte_1C10)
		xor	2
		jr	nz, loc_72E
		ld	a, (byte_1C11)
		inc	a
		cp	3
		jr	c, loc_72A
		xor	a

loc_751:
		ld	(byte_1C11), a
		bit	7, (ix+0)
		call	nz, sub_76D
		ld	de, 40h
		add	ix, de
		ld	hl, byte_1BF6
		inc	(hl)
		ld	a, (byte_1C11)
		inc	a
		cp	3
		jr	c, loc_751
		ret
; End of function sub_722


; =============== S U B R O U T I N E =======================================


sub_76D:

; FUNCTION CHUNK AT 05D1 SIZE 000000AD BYTES
; FUNCTION CHUNK AT 0A1F SIZE 000000FE BYTES

		bit	6, (ix+0)
		jr	nz, loc_789
		set	6, (ix+0)
		ld	hl, loc_789
		push	hl
		ld	a, (ix+1)
		sub	2
		jp	c, loc_A1F
		jp	z, loc_ACB
		jp	loc_AC0
; ---------------------------------------------------------------------------

loc_789:
		ld	a, 1
		bit	5, (ix+0)
		jr	z, loc_794
		ld	a, (word_1C16+1)

loc_794:
		add	a, (ix+3Ch)
		ld	(ix+3Ch), a
		jr	nc, loc_7B9
		inc	(ix+3Dh)
		jp	z, loc_483
		jp	po, loc_7B9
		set	0, (ix+0)
		ld	a, (ix+1)
		or	a
		jr	nz, loc_7B2
		jp	sub_6F9
; ---------------------------------------------------------------------------

loc_7B2:
		ld	a, (ix+1)
		or	a
		call	z, sub_6F9

loc_7B9:
		dec	(ix+3Bh)
		jp	nz, loc_884
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
		jp	z, loc_884
		dec	(ix+0Eh)
		jp	nz, loc_884
		ld	(ix+3Fh), 0
		ld	l, (ix+10h)
		ld	h, (ix+11h)

loc_7EE:
		ld	a, (hl)
		inc	hl
		or	a
		jp	z, loc_884
		cp	0F8h
		jr	c, loc_871
		cpl
		dec	a
		jp	p, loc_803
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_7EE
; ---------------------------------------------------------------------------

loc_803:
		jr	nz, loc_812
		dec	(ix+0Fh)
		jr	z, loc_7EE
		ld	l, (ix+12h)
		ld	h, (ix+13h)
		jr	loc_7EE
; ---------------------------------------------------------------------------

loc_812:
		dec	a
		jr	nz, loc_822
		ld	a, (hl)
		inc	hl
		ld	(ix+0Fh), a
		ld	(ix+12h), l
		ld	(ix+13h), h
		jr	loc_7EE
; ---------------------------------------------------------------------------

loc_822:
		dec	a
		jr	nz, loc_837
		sub	(ix+16h)
		ld	(ix+16h), a
		ld	a, 0
		sbc	a, (ix+17h)
		ld	(ix+17h), a
		ld	a, (hl)
		inc	hl
		jr	loc_87B
; ---------------------------------------------------------------------------

loc_837:
		dec	a
		jr	nz, loc_846
		ld	a, (hl)
		inc	hl
		ld	(ix+14h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+15h), a
		jr	loc_7EE
; ---------------------------------------------------------------------------

loc_846:
		dec	a
		jr	nz, loc_854
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	(ix+0Eh), a
		jr	loc_884
; ---------------------------------------------------------------------------

loc_854:
		dec	a
		jr	nz, loc_861
		ld	a, (hl)
		inc	hl
		ld	(ix+3Bh), a
		ld	(ix+3Ah), a
		jr	loc_7EE
; ---------------------------------------------------------------------------

loc_861:
		xor	a
		ld	(ix+16h), a
		ld	(ix+17h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+3Fh), a
		ld	a, (hl)
		inc	hl
		jr	loc_87B
; ---------------------------------------------------------------------------

loc_871:
		ld	c, (hl)
		inc	hl
		ld	(ix+16h), c
		ld	c, (hl)
		inc	hl
		ld	(ix+17h), c

loc_87B:
		ld	(ix+0Eh), a
		ld	(ix+10h), l
		ld	(ix+11h), h

loc_884:
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		bit	4, (ix+0)
		jr	z, loc_8B7
		ld	c, (ix+1Ah)
		ld	b, (ix+1Bh)
		add	hl, bc
		ld	e, (ix+18h)
		ld	d, (ix+19h)
		ld	a, h
		cp	d
		jr	nz, loc_8A5
		ld	a, l
		cp	e
		jr	z, loc_8AD

loc_8A5:
		bit	7, b
		jr	z, loc_8AA
		ccf

loc_8AA:
		jr	c, loc_8B1
		ex	de, hl

loc_8AD:
		res	4, (ix+0)

loc_8B1:
		ld	(ix+0Ch), l
		ld	(ix+0Dh), h

loc_8B7:
		ld	a, (ix+3Fh)
		or	a
		jr	z, loc_8D0
		ld	b, a
		push	hl
		call	sub_B7F
		pop	de
		ld	l, a
		and	80h
		jr	z, loc_8CA
		ld	a, 0FFh

loc_8CA:
		ld	h, a

loc_8CB:
		add	hl, hl
		djnz	loc_8CB
		jr	loc_8D6
; ---------------------------------------------------------------------------

loc_8D0:
		ld	e, (ix+14h)
		ld	d, (ix+15h)

loc_8D6:
		add	hl, de
		ld	e, (ix+26h)
		ld	d, (ix+27h)
		add	hl, de
		ld	(ix+8),	l
		ld	(ix+9),	h
		dec	(ix+39h)
		jp	nz, loc_979
		ld	a, (ix+38h)
		ld	(ix+39h), a
		ld	a, (ix+1Ch)
		add	a, (ix+1Dh)
		ld	(ix+1Ch), a
		ld	a, (ix+1Eh)
		or	a
		jr	z, loc_979
		dec	(ix+1Eh)
		jr	nz, loc_979
		ld	l, (ix+20h)
		ld	h, (ix+21h)

loc_90A:
		ld	a, (hl)
		inc	hl
		or	a
		jr	z, loc_979
		cp	0F9h
		jr	c, loc_96B
		cpl
		dec	a
		jp	p, loc_91E
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jr	loc_90A
; ---------------------------------------------------------------------------

loc_91E:
		jr	nz, loc_92D
		dec	(ix+1Fh)
		jr	z, loc_90A
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		jr	loc_90A
; ---------------------------------------------------------------------------

loc_92D:
		dec	a
		jr	nz, loc_93D
		ld	a, (hl)
		inc	hl
		ld	(ix+1Fh), a
		ld	(ix+22h), l
		ld	(ix+23h), h
		jr	loc_90A
; ---------------------------------------------------------------------------

loc_93D:
		dec	a
		jr	nz, loc_94B
		xor	a
		sub	(ix+1Dh)
		ld	(ix+1Dh), a
		ld	a, (hl)
		inc	hl
		jr	loc_970
; ---------------------------------------------------------------------------

loc_94B:
		dec	a
		jr	nz, loc_955
		ld	a, (hl)
		inc	hl
		ld	(ix+1Ch), a
		jr	loc_90A
; ---------------------------------------------------------------------------

loc_955:
		dec	a
		jr	nz, loc_961
		xor	a
		ld	(ix+1Dh), a
		ld	(ix+1Eh), a
		jr	loc_979
; ---------------------------------------------------------------------------

loc_961:
		ld	a, (hl)
		inc	hl
		ld	(ix+39h), a
		ld	(ix+38h), a
		jr	loc_90A
; ---------------------------------------------------------------------------

loc_96B:
		ld	c, (hl)
		inc	hl
		ld	(ix+1Dh), c

loc_970:
		ld	(ix+1Eh), a
		ld	(ix+20h), l
		ld	(ix+21h), h

loc_979:
		ld	a, (ix+1)
		or	a
		jr	z, loc_987
		call	sub_98D
		bit	7, (ix+0)
		ret	z

loc_987:
		call	sub_553
		jp	loc_5D1
; End of function sub_76D


; =============== S U B R O U T I N E =======================================


sub_98D:
		bit	1, (ix+0)
		jr	nz, loc_9AE
		bit	0, (ix+0)
		jr	z, loc_9E2
		set	1, (ix+0)
		ld	a, (ix+2Fh)
		or	a
		jr	z, loc_9B9
		cp	(ix+30h)
		jr	nc, loc_9B9
		set	2, (ix+0)
		jr	loc_A15
; ---------------------------------------------------------------------------

loc_9AE:
		bit	2, (ix+0)
		jr	nz, loc_A15
		dec	(ix+2Ch)
		jr	nz, loc_A15

loc_9B9:
		ld	a, (ix+30h)
		add	a, (ix+2Eh)
		ld	c, (ix+2Fh)
		inc	c
		dec	c
		jr	nz, loc_9CC
		or	a
		jp	m, loc_483
		jr	loc_9DA
; ---------------------------------------------------------------------------

loc_9CC:
		or	a
		jp	p, loc_9D2
		jr	loc_9D5
; ---------------------------------------------------------------------------

loc_9D2:
		cp	c
		jr	c, loc_9DA

loc_9D5:
		ld	a, c
		set	2, (ix+0)

loc_9DA:
		ld	c, (ix+2Dh)
		ld	(ix+2Ch), c
		jr	loc_A12
; ---------------------------------------------------------------------------

loc_9E2:
		ld	a, (ix+2Ch)
		or	a
		jr	z, loc_A15
		dec	(ix+2Ch)
		jr	nz, loc_A15
		ld	l, (ix+2Ah)
		ld	h, (ix+2Bh)
		ld	a, (hl)
		cp	0F0h
		jp	z, loc_483
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
		jp	p, loc_A12
		ld	a, 7Fh

loc_A12:
		ld	(ix+30h), a

loc_A15:
		ld	a, (ix+30h)
		add	a, (ix+1Ch)
		ld	(ix+28h), a
		ret
; End of function sub_98D
; ---------------------------------------------------------------------------

loc_A1F:
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
		jr	z, loc_A42
		ld	(ix+24h), a
		ld	c, a
		ld	b, 0B0h
		call	sub_6DF

loc_A42:
		ld	a, (hl)
		inc	hl
		ld	(ix+5),	a
		ld	a, (ix+3Eh)
		and	0C0h
		ld	c, a
		jr	z, loc_A51
		ld	a, 0C0h

loc_A51:
		cpl
		and	(hl)
		inc	hl
		or	c
		cp	(ix+25h)
		jr	z, loc_A63
		ld	(ix+25h), a
		ld	c, a
		ld	b, 0B4h
		call	sub_6DF

loc_A63:
		push	ix
		pop	de
		ex	de, hl
		ld	bc, 28h
		add	hl, bc
		ex	de, hl
		xor	a
		call	sub_693
		ld	a, 8
		call	sub_693
		ld	a, 4
		call	sub_693
		ld	a, 0Ch
		call	sub_693
		ld	a, (hl)
		inc	hl
		ld	(ix+26h), a
		ld	a, (hl)
		inc	hl
		ld	(ix+27h), a
		call	sub_B1D
		call	sub_67E
		ld	e, (hl)
		push	ix
		pop	hl
		ld	bc, 28h
		add	hl, bc
		ld	d, b

loc_A98:
		ld	a, (hl)
		inc	hl
		srl	e
		jr	c, loc_AB1
		cp	(hl)
		jr	z, loc_AB1
		ld	(hl), a
		ld	c, a
		ld	a, d
		srl	a
		jr	nc, loc_AAA
		or	2

loc_AAA:
		rlca
		rlca
		or	40h
		call	sub_6DE

loc_AB1:
		inc	hl
		inc	hl
		inc	hl
		inc	d
		bit	2, d
		jr	z, loc_A98
		ld	a, (ix+5)
		call	sub_6F9
		ret
; ---------------------------------------------------------------------------

loc_AC0:
		ld	(ix+29h), 78h
		ld	hl, 7F11h
		ld	(hl), 0E7h
		ld	(hl), 0DFh

loc_ACB:
		ld	l, (ix+3)
		ld	h, 0
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		add	hl, hl
		ld	de, byte_1536
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
		ld	de, Index_16C3
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
		jp	p, loc_B11
		ld	a, 7Fh

loc_B11:
		ld	(ix+30h), a
		pop	hl
		ld	(ix+26h), 0
		ld	(ix+27h), 0E8h
; END OF FUNCTION CHUNK	FOR sub_76D

; =============== S U B R O U T I N E =======================================


sub_B1D:
		ld	a, (hl)
		inc	hl
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	bc, word_1729
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
		ld	bc, Index_1855
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
		call	sub_B74
		ld	(hl), 32h
		ret
; End of function sub_B1D


; =============== S U B R O U T I N E =======================================


sub_B74:
		ld	a, (byte_1BF6)
		ld	hl, byte_1BF7
		add	a, l
		ld	l, a
		ret	nc
		inc	h
		ret
; End of function sub_B74


; =============== S U B R O U T I N E =======================================


sub_B7F:
		call	sub_B74
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
; End of function sub_B7F


; =============== S U B R O U T I N E =======================================


sub_B98:
		ld	ix, byte_1EC0
		xor	a

loc_B9D:
		ld	(byte_1C07), a
		bit	7, (ix+0)
		call	nz, sub_BB5
		ld	de, 20h
		add	ix, de
		ld	a, (byte_1C07)
		inc	a
		cp	0Ah
		jr	c, loc_B9D
		ret
; End of function sub_B98


; =============== S U B R O U T I N E =======================================


sub_BB5:
		bit	7, (ix+10h)
		jr	z, loc_BC0
		ld	a, (byte_1C03)
		rra
		ret	c

loc_BC0:
		bit	6, (ix+0)
		jr	nz, loc_BF2
		set	6, (ix+0)
		push	ix
		pop	hl
		inc	l
		sub	a
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		inc	l
		inc	l
		inc	l
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), 0Fh
		inc	l
		ld	(hl), 8
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		ld	(hl), a
		ld	a, (ix+11h)
		and	1
		ld	(ix+11h), a
		jr	loc_C11
; ---------------------------------------------------------------------------

loc_BF2:
		ld	l, (ix+2)
		ld	h, (ix+3)
		ld	e, 9
		bit	7, (ix+10h)
		jr	z, loc_C04
		ld	a, (byte_1C06)
		ld	e, a

loc_C04:
		xor	a
		ld	d, a
		sbc	hl, de
		ld	(ix+2),	l
		ld	(ix+3),	h
		jr	z, loc_C11
		ret	nc

loc_C11:
		ld	e, (ix+6)
		ld	d, (ix+7)
		xor	a
		ld	(byte_1C1A), a
		ld	(byte_1C1B), a
		ld	l, (ix+4)
		ld	h, (ix+5)
		ld	(word_1C18), hl

loc_C27:
		ld	a, (de)
		inc	de
		cp	0E0h
		jr	c, loc_C41
		add	a, a
		and	3Eh
		add	a, 71h
		ld	l, a
		ld	a, 0
		adc	a, 0Eh
		ld	h, a
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	bc, loc_C27
		push	bc
		jp	(hl)
; ---------------------------------------------------------------------------

loc_C41:
		cp	0D8h
		jr	c, loc_C4C
		sub	0D7h
		call	sub_E64
		jr	loc_C27
; ---------------------------------------------------------------------------

loc_C4C:
		cp	0D0h
		jr	c, loc_C5B
		sub	0CFh
		call	sub_E64
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jr	loc_C27
; ---------------------------------------------------------------------------

loc_C5B:
		cp	0C0h
		jr	c, loc_C7A
		and	0Fh
		ld	c, a
		ld	b, 0
		ld	hl, byte_E44
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
		jr	loc_C27
; ---------------------------------------------------------------------------

loc_C7A:
		cp	60h
		jr	c, loc_C85
		sub	60h
		call	sub_CB4
		jr	loc_C27
; ---------------------------------------------------------------------------

loc_C85:
		call	sub_CB4

loc_C88:
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
; End of function sub_BB5

; =============== S U B R O U T I N E =======================================

sub_CB4:
		push	de
		bit	0, (ix+11h)
		jp	nz, loc_E21
		bit	0, (ix+0)
		jr	z, loc_CFA
		ld	l, a
		add	a, a
		add	a, l
		ld	l, a
		ld	h, 0
		rl	h
		add	hl, hl
		ld	de, 0A104h	; Music offset
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
		call	sub_3B6
		pop	hl
		jp	nz, loc_E21
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
		jp	loc_DB4
; ---------------------------------------------------------------------------

loc_CFA:
		add	a, (ix+0Dh)
		ld	h, a
		ld	l, (ix+0Ch)
		ld	(word_1C24), hl
		ld	a, (ix+8)
		ld	(byte_1C20), a
		bit	5, (ix+0)
		jr	z, loc_D71
		call	sub_430
		jr	c, loc_D91
		bit	4, (ix+0)
		jr	nz, loc_D24
		push	iy
		ex	(sp), ix
		call	sub_469
		pop	ix

loc_D24:
		ld	hl, (word_1C24)
		ld	(iy+18h), l
		ld	(iy+19h), h
		ld	e, (iy+0Ch)
		ld	d, (iy+0Dh)
		or	a
		sbc	hl, de
		push	af
		jr	nc, loc_D40
		xor	a
		sub	l
		ld	l, a
		ld	a, 0
		sbc	a, h
		ld	h, a

loc_D40:
		xor	a
		ld	b, 10h
		ld	c, (ix+0Fh)

loc_D46:
		add	hl, hl
		rla
		cp	c
		jr	c, loc_D4D
		sub	c
		inc	l

loc_D4D:
		djnz	loc_D46
		pop	af
		jr	nc, loc_D59
		xor	a
		sub	l
		ld	l, a
		ld	a, 0
		sbc	a, h
		ld	h, a

loc_D59:
		ld	(iy+1Ah), l
		ld	(iy+1Bh), h
		bit	4, (ix+0)
		jr	nz, loc_D85
		ld	(iy+0),	80h
		ld	a, (ix+0Bh)
		ld	c, (ix+11h)
		jr	loc_DBA
; ---------------------------------------------------------------------------

loc_D71:
		bit	4, (ix+0)
		jr	z, loc_D91
		call	sub_430
		jr	c, loc_D91
		ld	hl, (word_1C24)
		ld	(iy+0Ch), l
		ld	(iy+0Dh), h

loc_D85:
		call	sub_E2A
		ld	a, (ix+12h)
		ld	(iy+7),	a
		jp	loc_E21
; ---------------------------------------------------------------------------

loc_D91:
		ld	a, (ix+0Ah)
		ld	(byte_1C21), a
		ld	a, (ix+10h)
		and	7Fh
		ld	(byte_1C22), a
		call	sub_3B6
		jp	nz, loc_E21
		ld	a, (ix+9)
		ld	(iy+3),	a
		ld	a, (ix+0Bh)
		ld	c, (ix+11h)
		ld	hl, (word_1C24)

loc_DB4:
		ld	(iy+0Ch), l
		ld	(iy+0Dh), h

loc_DBA:
		ld	(iy+3Eh), c
		call	sub_E2A
		ld	hl, byte_1C1A
		bit	0, (hl)
		jr	z, loc_DCD
		xor	a
		ld	(iy+3Ch), a
		jr	loc_DE8
; ---------------------------------------------------------------------------

loc_DCD:
		ld	b, 5
		ld	de, (word_1C18)
		ld	hl, 0

loc_DD6:
		srl	h
		rr	l
		rra
		jr	nc, loc_DDE
		add	hl, de

loc_DDE:
		djnz	loc_DD6
		xor	a
		sub	l
		ld	(iy+3Ch), a
		ld	a, 80h
		sbc	a, h

loc_DE8:
		ld	(iy+3Dh), a
		ld	a, (byte_1C20)
		or	a
		jr	z, loc_DF4
		ld	(iy+1),	a

loc_DF4:
		ld	c, 80h
		ld	a, (ix+10h)
		or	a
		jp	p, loc_E01
		and	7Fh
		ld	c, 0A0h

loc_E01:
		bit	5, (ix+0)
		jr	z, loc_E0F
		bit	7, (iy+0)
		jr	z, loc_E0F
		set	4, c

loc_E0F:
		ld	(iy+4),	a
		ld	(iy+0),	c
		ld	a, (byte_1C07)
		ld	(iy+6),	a
		ld	a, (ix+12h)
		ld	(iy+7),	a

loc_E21:
		pop	de
		inc	(ix+12h)
		ld	hl, byte_1C1B
		inc	(hl)
		ret
; End of function sub_CB4


; =============== S U B R O U T I N E =======================================


sub_E2A:
		ld	hl, byte_1200
		ld	b, (iy+1)
		inc	b
		dec	b
		jr	z, loc_E37
		ld	hl, byte_1240

loc_E37:
		ld	e, (ix+0Eh)
		srl	e
		ld	d, 0
		add	hl, de
		ld	l, (hl)
		ld	(iy+2),	l
		ret
; End of function sub_E2A

; ---------------------------------------------------------------------------
byte_E44:	db 6
		db    9
		db  0Ch
		db  12h
		db 18h
		db  24h
		db  30h
		db  48h
		db  60h
		db  90h
		db 0C0h
		db    8
		db  10h
		db  20h
		db  3Ch
		db  78h

; =============== S U B R O U T I N E =======================================


sub_E54:
		ld	a, (ix+1)

loc_E57:
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
; End of function sub_E54


; =============== S U B R O U T I N E =======================================


sub_E64:
		ld	c, a
		call	sub_E54
		ld	(hl), e
		inc	hl
		ld	(hl), d
		inc	hl
		ld	(hl), c
		inc	(ix+1)
		ret
; End of function sub_E64

; ---------------------------------------------------------------------------
		dw sub_EB1		; 0
		dw sub_EBB		; 1
		dw sub_EC0		; 2
		dw loc_EC7		; 3
		dw sub_EDB		; 4
		dw sub_EE6		; 5
		dw locret_EBA		; 6
		dw locret_EBA		; 7
		dw locret_EBA		; 8
		dw locret_EBA		; 9
		dw locret_EBA		; 0Ah
		dw locret_EBA		; 0Bh
		dw locret_EBA		; 0Ch
		dw locret_EBA		; 0Dh
		dw locret_EBA		; 0Eh
		dw locret_EBA		; 0Fh
		dw sub_EEC		; 10h
		dw sub_EF2		; 11h
		dw sub_EF8		; 12h
		dw loc_F01		; 13h
		dw sub_F12		; 14h
		dw loc_F16		; 15h
		dw sub_F1F		; 16h
		dw sub_F36		; 17h
		dw sub_F3C		; 18h
		dw sub_F45		; 19h
		dw sub_F52		; 1Ah
		dw sub_F56		; 1Bh
		dw sub_F5C		; 1Ch
		dw sub_F62		; 1Dh
		dw sub_F67		; 1Eh
		dw sub_F77		; 1Fh

; =============== S U B R O U T I N E =======================================


sub_EB1:
		ld	a, (de)
		inc	de
		ld	(ix+0Fh), a
		set	5, (ix+0)

locret_EBA:
		ret
; End of function sub_EB1


; =============== S U B R O U T I N E =======================================


sub_EBB:
		res	5, (ix+0)
		ret
; End of function sub_EBB


; =============== S U B R O U T I N E =======================================


sub_EC0:
		ld	a, (de)
		inc	de
		ld	l, a
		ld	h, 0
		jr	loc_ECD
; ---------------------------------------------------------------------------

loc_EC7:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ex	de, hl

loc_ECD:
		ld	c, l
		ld	b, h
		add	hl, hl
		add	hl, bc
		ld	(word_1C18), hl
		ld	(ix+4),	l
		ld	(ix+5),	h
		ret
; End of function sub_EC0


; =============== S U B R O U T I N E =======================================


sub_EDB:
		ld	a, (de)
		inc	de
		ld	(word_1C14), a
		ld	a, (de)
		inc	de
		ld	(word_1C14+1), a
		ret
; End of function sub_EDB


; =============== S U B R O U T I N E =======================================


sub_EE6:
		ld	a, (de)
		inc	de
		ld	(byte_1C29), a
		ret
; End of function sub_EE6


; =============== S U B R O U T I N E =======================================


sub_EEC:
		ld	a, (de)
		inc	de
		ld	(ix+9),	a
		ret
; End of function sub_EEC


; =============== S U B R O U T I N E =======================================


sub_EF2:
		ld	a, (de)
		inc	de
		ld	(ix+0Bh), a
		ret
; End of function sub_EF2


; =============== S U B R O U T I N E =======================================


sub_EF8:
		ld	a, (de)
		inc	de
		ld	(ix+0Ch), a
		ld	a, (de)
		inc	de
		jr	loc_F0E
; ---------------------------------------------------------------------------

loc_F01:
		ld	a, (de)
		inc	de
		add	a, (ix+0Ch)
		ld	(ix+0Ch), a
		ld	a, (de)
		inc	de
		adc	a, (ix+0Dh)

loc_F0E:
		ld	(ix+0Dh), a
		ret
; End of function sub_EF8


; =============== S U B R O U T I N E =======================================


sub_F12:
		ld	a, (de)
		inc	de
		jr	loc_F1B
; ---------------------------------------------------------------------------

loc_F16:
		ld	a, (de)
		inc	de
		add	a, (ix+0Eh)

loc_F1B:
		ld	(ix+0Eh), a
		ret
; End of function sub_F12


; =============== S U B R O U T I N E =======================================


sub_F1F:
		ld	a, (de)
		inc	de
		ld	(ix+8),	a
		sub	2
		ld	a, 3Fh
		jr	c, loc_F32
		jr	z, loc_F30
		ld	a, 1
		jr	loc_F32
; ---------------------------------------------------------------------------

loc_F30:
		ld	a, 7

loc_F32:
		ld	(ix+0Ah), a
		ret
; End of function sub_F1F


; =============== S U B R O U T I N E =======================================


sub_F36:
		ld	a, (de)
		inc	de
		ld	(ix+0Ah), a
		ret
; End of function sub_F36


; =============== S U B R O U T I N E =======================================


sub_F3C:
		ld	a, (ix+0)
		xor	1
		ld	(ix+0),	a
		ret
; End of function sub_F3C


; =============== S U B R O U T I N E =======================================


sub_F45:
		ld	a, (ix+11h)
		and	3Fh
		ld	c, a
		ld	a, (de)
		inc	de
		or	c
		ld	(ix+11h), a
		ret
; End of function sub_F45


; =============== S U B R O U T I N E =======================================


sub_F52:
		pop	hl
		jp	loc_C88
; End of function sub_F52


; =============== S U B R O U T I N E =======================================


sub_F56:
		push	de
		call	sub_30B
		pop	de
		ret
; End of function sub_F56


; =============== S U B R O U T I N E =======================================


sub_F5C:
		ld	a, 1
		ld	(byte_1C1A), a
		ret
; End of function sub_F5C


; =============== S U B R O U T I N E =======================================


sub_F62:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ret
; End of function sub_F62


; =============== S U B R O U T I N E =======================================


sub_F67:
		call	sub_E54
		dec	hl
		dec	(hl)
		jr	nz, loc_F72
		dec	(ix+1)
		ret
; ---------------------------------------------------------------------------

loc_F72:
		dec	hl
		ld	d, (hl)
		dec	hl
		ld	e, (hl)
		ret
; End of function sub_F67


; =============== S U B R O U T I N E =======================================


sub_F77:
		ld	a, (ix+1)
		or	a
		jp	nz, loc_F87
		pop	hl
		call	sub_30B
		ld	(ix+0),	0
		ret
; ---------------------------------------------------------------------------

loc_F87:
		dec	a
		call	loc_E57
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		dec	(hl)
		jr	nz, sub_F62
		dec	(ix+1)
		inc	de
		inc	de
		ret
; End of function sub_F77


; =============== S U B R O U T I N E =======================================


sub_F98:
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
		pop	hl
		ld	(word_1B90), hl
		exx
		ld	(word_1B92), bc
		ld	(word_1B94), de
		ld	(word_1B96), hl
		exx
		ld	b, 0
		ld	a, (byte_1BA2)
		or	a
		jr	z, loc_FDD
		ld	c, a
		ld	hl, byte_1BA3
		ld	de, (word_1BA0)
		ldir

loc_FDD:
		ld	a, (byte_1BAA)
		or	a
		jr	z, loc_FED
		ld	c, a
		ld	hl, byte_1BAB
		ld	de, (word_1BA8)
		ldir

loc_FED:
		ld	a, (byte_1BB2)
		or	a
		jr	z, loc_FFD
		ld	c, a
		ld	hl, byte_1BB3
		ld	de, (word_1BB0)
		ldir

loc_FFD:
		ld	a, 1
		ld	(byte_1B98), a
		ld	(byte_1B99), a

loc_1005:
		ld	a, (byte_1B99)
		or	a
		jr	nz, loc_1005
		ld	b, a
		ld	a, (byte_1BA2)
		or	a
		jr	z, loc_1027
		ld	c, a
		ld	hl, (word_1BA0)
		ld	de, byte_1BA3
		ldir
		ld	hl, (word_1BA0)
		ld	(hl), 0E7h

loc_1020:
		inc	hl
		dec	a
		jr	z, loc_1027
		ld	(hl), b
		jr	loc_1020
; ---------------------------------------------------------------------------

loc_1027:
		ld	a, (byte_1BAA)
		or	a
		jr	z, loc_1042
		ld	c, a
		ld	hl, (word_1BA8)
		ld	de, byte_1BAB
		ldir
		ld	hl, (word_1BA8)
		ld	(hl), 0EFh

loc_103B:
		inc	hl
		dec	a
		jr	z, loc_1042
		ld	(hl), b
		jr	loc_103B
; ---------------------------------------------------------------------------

loc_1042:
		ld	a, (byte_1BB2)
		or	a
		jr	z, loc_105D
		ld	c, a
		ld	hl, (word_1BB0)
		ld	de, byte_1BB3
		ldir
		ld	hl, (word_1BB0)
		ld	(hl), 0F7h

loc_1056:
		inc	hl
		dec	a
		jr	z, loc_105D
		ld	(hl), b
		jr	loc_1056
; ---------------------------------------------------------------------------

loc_105D:
		ld	bc, (word_1B82)
		ld	de, (word_1B84)
		ld	sp, (word_1B8E)
		ld	hl, (word_1B8C)
		push	hl
		ld	hl, (word_1B80)
		push	hl
		ld	hl, (word_1B86)
		ld	(byte_1B98), a
		pop	af
		ret
; End of function sub_F98
; ---------------------------------------------------------------------------

word_1079:	dw 28Eh, 293h, 297h, 29Ch, 2A1h, 2A6h, 2ABh, 2B0h, 2B5h
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
word_113B:	dw 349h, 343h, 33Dh, 337h, 331h, 32Bh, 326h, 320h, 31Ah
		dw 314h, 30Fh, 309h, 303h, 2FEh, 2F8h, 2F3h, 2EDh, 2E8h
		dw 2E3h, 2DDh, 2D8h, 2D3h, 2CEh, 2C8h, 2C3h, 2BEh, 2B9h
		dw 2B4h, 2AFh, 2AAh, 2A5h, 2A0h, 29Ch, 297h, 292h, 28Dh
		dw 289h, 284h, 27Fh, 27Bh, 276h, 272h, 26Dh, 269h, 264h
		dw 260h, 25Bh, 257h, 253h, 24Eh, 24Ah, 246h, 242h, 23Eh
		dw 239h, 235h, 231h, 22Dh, 229h, 225h, 221h, 21Dh, 219h
		dw 216h, 212h, 20Eh, 20Ah, 206h, 203h, 1FFh, 1FBh, 1F8h
		dw 1F4h, 1F0h, 1EDh, 1E9h, 1E6h, 1E2h, 1DFh, 1DBh, 1D8h
		dw 1D5h, 1D1h, 1CEh, 1CAh, 1C7h, 1C4h, 1C1h, 1BDh, 1BAh
		dw 1B7h, 1B4h, 1B1h, 1AEh, 1ABh, 1A7h, 1A4h, 0
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
		db 60h,	60h, 60h, 68h, 68h, 70h, 78h, 8Ah
byte_1281:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  1Fh
		db  1Fh
		db    0
		db  0Fh
		db  19h
		db  11h
		db  11h
		db  4Fh
		db  1Ah
		db  1Fh
		db  10h
		db  4Fh
		db  1Dh
		db  10h
		db  10h
		db  1Fh
		db  18h
		db    0
		db    0
		db  0Fh
		db  1Fh
		db  12h
		db  10h
		db  1Fh
		db  1Ah
		db  1Fh
		db    0
		db  0Fh
		db  1Ch
		db  12h
		db  10h
		db  1Fh
		db  1Ch
		db  1Fh
		db    9
		db  0Fh
		db  1Fh
		db  1Bh
		db    5
		db  8Fh
		db  1Fh
		db  1Ch
		db    4
		db 0FFh
		db  1Dh
		db  0Fh
		db    8
		db  2Fh
		db  1Fh
		db  1Eh
		db  10h
		db  1Fh
		db  1Fh
		db  1Fh
		db    0
		db  1Fh
		db  15h
		db  16h
		db  14h
		db  1Fh
		db  1Ah
		db  14h
		db    2
		db  1Fh
		db  1Fh
		db  1Fh
		db    0
		db  1Fh
		db  1Fh
		db  1Fh
		db    4
		db  1Fh
		db  1Fh
		db  1Ch
		db    0
		db  0Fh
		db  5Fh
		db  11h
		db    4
		db 0DFh
		db  1Ch
		db  16h
		db    8
		db  2Fh
		db  1Ch
		db  12h
		db    8
		db  1Fh
		db  1Fh
		db  1Fh
		db    8
		db  0Fh
		db  18h
		db  1Fh
		db    0
		db  0Fh
		db  1Fh
		db  10h
		db  0Bh
		db  3Fh
		db  1Fh
		db  12h
		db  0Ah
		db  3Fh
		db  15h
		db  1Eh
		db  0Eh
		db  2Fh
		db  1Ah
		db  1Ah
		db  0Fh
		db  8Fh
		db  18h
		db  12h
		db  0Fh
		db  2Fh
		db  19h
		db  0Ah
		db  10h
		db  2Fh
		db  1Fh
		db  0Eh
		db    4
		db  4Fh
		db  18h
		db  0Fh
		db    6
		db  2Fh
		db  1Ah
		db  13h
		db    2
		db  1Fh
		db  1Ch
		db  14h
		db  12h
		db  3Fh
		db  1Fh
		db  0Bh
		db    0
		db  4Fh
		db  15h
		db  0Fh
		db    6
		db  1Fh
		db    0
		db    0
		db    0
		db  0Fh
		db  18h
		db    8
		db    2
		db  1Fh
		db  1Fh
		db  0Eh
		db    0
		db 0FFh
		db  12h
		db  10h
		db  13h
		db  8Fh
		db  1Ah
		db  12h
		db  0Fh
		db  4Fh
		db  1Ch
		db  1Fh
		db  10h
		db  0Fh
		db  1Fh
		db  12h
		db    3
		db  1Fh
		db  1Fh
		db  11h
		db  13h
		db  8Fh
		db  1Fh
		db  16h
		db    6
		db  2Fh
		db  1Ah
		db  1Fh
		db    5
		db  0Fh
		db  14h
		db  14h
		db  12h
		db 0FFh
		db  10h
		db  1Fh
		db    0
		db  0Fh
		db  16h
		db  11h
		db  12h
		db  4Fh
		db  18h
		db  10h
		db  0Eh
		db  2Fh
		db  1Fh
		db  1Fh
		db    8
		db  0Fh
		db  14h
		db  12h
		db  0Ch
		db  1Fh
		db  1Fh
		db  1Fh
		db    9
		db  0Fh
		db  16h
		db  11h
		db  0Dh
		db  2Fh
		db  1Dh
		db  14h
		db    2
		db  2Fh
		db    4
		db  1Fh
		db    2
		db  0Fh
		db  0Eh
		db  1Fh
		db    0
		db  0Fh
		db  10h
		db    4
		db    0
		db  1Fh
		db  16h
		db  16h
		db  0Dh
		db  2Fh
		db  1Fh
		db  1Fh
		db  0Ah
		db  0Fh
		db  1Ah
		db  13h
		db  0Dh
		db  2Fh
		db  14h
		db  10h
		db    0
		db  1Fh
		db  1Fh
		db    4
		db    0
		db  2Fh
		db  11h
		db  1Fh
		db    0
		db  0Fh
		db  1Fh
		db  0Ch
		db    0
		db  1Fh
		db  16h
		db    8
		db    4
		db  1Fh
		db  15h
		db    4
		db    3
		db  4Fh
		db  14h
		db    6
		db    3
		db  2Fh
		db  1Ah
		db  0Eh
		db    8
		db 0FFh
		db  18h
		db  1Fh
		db  11h
		db  0Fh
		db  1Dh
		db  1Fh
		db  0Ch
		db  0Fh
		db  18h
		db  1Fh
		db    0
		db  0Fh
		db  1Ch
		db  11h
		db    2
		db  1Fh
		db  18h
		db  11h
		db    2
		db  0Fh
		db  1Fh
		db  10h
		db  0Eh
		db  3Fh
		db  18h
		db  12h
		db    4
		db  1Fh
		db  1Ah
		db  10h
		db  0Ch
		db  8Fh
		db  16h
		db  11h
		db    7
		db  2Fh
		db  14h
		db  12h
		db  0Ch
		db  1Fh
		db  16h
		db  11h
		db  0Dh
		db  2Fh
		db  19h
		db    8
		db  10h
		db  2Fh
		db  1Ah
		db  1Fh
		db    2
		db  0Fh
		db  1Fh
		db    9
		db    0
		db  3Fh
		db  11h
		db    6
		db    2
		db  1Fh
		db  16h
		db  12h
		db  10h
		db  8Fh
		db  1Ah
		db  13h
		db  10h
		db  8Fh
		db  16h
		db  12h
		db  0Ch
		db  1Fh
		db  1Ah
		db  13h
		db  0Eh
		db  3Fh
		db  12h
		db  1Fh
		db    0
		db  0Fh
		db  16h
		db  15h
		db  14h
		db  2Fh
		db  15h
		db  0Eh
		db    2
		db  1Fh
		db  13h
		db  0Fh
		db  0Bh
		db  2Fh
		db  10h
		db    8
		db    2
		db  3Fh
		db  1Fh
		db  18h
		db    8
		db 0FFh
		db  18h
		db  0Fh
		db    8
		db 0FFh
		db  1Fh
		db  14h
		db    8
		db 0FFh
		db  1Ah
		db  11h
		db  0Ah
		db  3Fh
		db  1Fh
		db  0Ch
		db    8
		db  2Fh
		db  18h
		db  10h
		db  0Dh
		db  3Fh
		db  1Ah
		db  11h
		db    2
		db  1Fh
		db  14h
		db  11h
		db  14h
		db  1Fh
		db  0Bh
		db  1Fh
		db    2
		db  0Fh
		db  18h
		db  1Fh
		db  13h
		db  7Fh
		db  16h
		db  0Fh
		db  0Fh
		db  7Fh
		db  1Fh
		db  10h
		db    4
		db  4Fh
		db  15h
		db  0Dh
		db    7
		db  6Fh
		db  12h
		db  0Eh
		db  0Ch
		db  3Fh
		db  15h
		db  10h
		db  0Bh
		db  1Fh
		db  13h
		db  0Eh
		db  0Ch
		db  3Fh
		db  14h
		db  0Fh
		db  0Bh
		db  3Fh
		db  1Eh
		db  1Fh
		db    2
		db  0Fh
		db  1Fh
		db  0Ch
		db    7
		db  1Fh
		db  1Fh
		db    7
		db    7
		db  1Fh
		db  1Ah
		db  0Ch
		db    7
		db  1Fh
		db  1Ch
		db  0Ah
		db    9
		db 0FFh
		db  1Fh
		db  17h
		db    0
		db  4Fh
		db  0Fh
		db    5
		db  0Ah
		db  2Fh
		db  11h
		db    4
		db    2
		db  2Fh
		db  14h
		db    7
		db    5
		db  2Fh
		db  16h
		db  0Ah
		db  0Ah
		db  2Fh
		db  14h
		db    5
		db    5
		db  2Fh
		db  18h
		db  11h
		db    0
		db  2Fh
		db  12h
		db  10h
		db    9
		db  3Fh
		db  11h
		db    8
		db    7
		db  2Fh
		db  1Ah
		db  1Fh
		db    2
		db  0Fh
		db  0Ch
		db  0Fh
		db    0
		db  2Fh
		db  0Fh
		db  0Fh
		db    0
		db  3Fh
		db  0Fh
		db    5
		db    0
		db  1Fh
		db  0Fh
		db  1Fh
		db  0Ch
		db  0Fh
		db  13h
		db  1Fh
		db    0
		db  0Fh
		db  13h
		db  12h
		db  0Ah
		db  3Fh
		db  1Fh
		db  1Fh
		db  0Ch
		db  0Fh
		db  12h
		db  0Fh
		db    1
		db  1Fh
		db  17h
		db  11h
		db    8
		db  2Fh
		db  1Ah
		db  12h
		db  0Dh
		db  1Fh
		db  17h
		db  13h
		db  10h
		db  4Fh
		db  16h
		db  10h
		db    0
		db  8Fh
		db  18h
		db  17h
		db  0Ch
		db  2Fh
		db  14h
		db  1Fh
		db    0
		db  0Fh
		db  18h
		db  11h
		db  13h
		db  2Fh
		db  1Fh
		db  12h
		db  0Fh
		db  2Fh
		db  16h
		db  10h
		db    7
		db  3Fh
		db  1Bh
		db  12h
		db    6
		db  1Fh
		db  1Bh
		db  1Fh
		db  0Fh
		db  0Fh
		db  1Eh
		db  1Fh
		db  0Fh
		db  0Fh
		db  13h
		db  10h
		db    7
		db  2Fh
		db  17h
		db  11h
		db  0Eh
		db  3Fh
		db  19h
		db  11h
		db  0Eh
		db  3Fh
		db  1Ch
		db  11h
		db  0Eh
		db  3Fh
		db  0Bh
		db  1Fh
		db    6
		db  0Fh
		db  10h
		db  1Fh
		db    7
		db  0Fh
		db  1Fh
		db    8
		db    1
		db  3Fh
		db  0Ch
		db    8
		db    1
		db  2Fh
		db  0Bh
		db    8
		db    0
		db  1Fh
		db  0Dh
		db    8
		db    0
		db  1Fh
		db  1Fh
		db  18h
		db    0
		db  3Fh
		db  1Ch
		db  14h
		db    8
		db  0Fh
		db  1Ch
		db  1Fh
		db    2
		db  0Fh
		db  1Fh
		db  0Ah
		db    0
		db  2Fh
		db  1Fh
		db  1Fh
		db    2
		db  0Fh
		db  1Fh
		db  13h
		db  0Ah
		db  3Fh
		db  18h
		db  1Fh
		db  10h
		db  0Fh
		db  15h
		db  0Fh
		db    4
		db  1Fh
		db  1Ch
		db  1Fh
		db    2
		db  0Fh
		db  14h
		db  1Fh
		db    8
		db  0Fh
		db  15h
		db  0Dh
		db    4
		db  2Fh
		db  18h
		db  1Fh
		db    2
		db  0Fh
		db  1Ch
		db  0Dh
		db    8
		db  4Fh
		db  1Dh
		db  1Fh
		db    0
		db  0Fh
		db  42h
byte_1536:	db 0
		db    2
		db    4
		db    0
		db    0
		db    0
		db    0
		db    3
		db    1
		db    1
		db    3
		db    0
		db    0
		db    1
		db    8
		db    2
		db    0
		db    0
		db    0
		db    1
		db  10h
		db    3
		db    0
		db    0
		db    0
		db    1
		db    4
		db    4
		db    0
		db    0
		db    0
		db    2
		db    5
		db    5
		db    0
		db    0
		db    0
		db    2
		db    4
		db    2
		db    4
		db    0
		db    0
		db    2
		db    4
		db    1
		db    5
		db    2
		db    0
		db    3
		db    1
		db    1
		db    8
		db    0
		db    0
		db    2
		db    4
		db    6
		db  0Bh
		db    6
		db    0
		db    2
		db    4
		db    1
		db  0Ch
		db    7
		db    0
		db    1
		db    3
		db    1
		db    1
		db    0
		db    0
		db    1
		db  18h
		db    1
		db    0
		db    0
		db    0
		db    1
		db    3
		db    1
		db  0Dh
		db    0
		db    0
		db    1
		db    2
		db    6
		db  0Eh
		db    0
		db    0
		db    1
		db    2
		db    7
		db  0Fh
		db    0
		db    0
		db    1
		db    2
		db    8
		db  10h
		db    8
		db    0
		db    2
		db    5
		db    1
		db    3
		db    0
		db    0
		db    2
		db    5
		db    8
		db  11h
		db    0
		db    0
		db    2
		db    5
		db    1
		db  12h
		db    0
		db    0
		db    2
		db    5
		db    1
		db  13h
		db    0
		db    0
		db    2
		db    5
		db    1
		db  14h
		db    0
		db    0
		db    2
		db    5
		db    1
		db  15h
		db    0
		db    0
		db    2
		db    5
		db    1
		db  16h
		db    0
		db    0
		db    2
		db    5
		db    7
		db  17h
		db    0
		db    0
		db    2
		db    3
		db    6
		db  18h
		db    0
		db    0
		db    2
		db    3
		db    9
		db  18h
		db    0
		db    0
		db    1
		db    2
		db    1
		db    0
		db    0
		db    0
		db    1
		db    3
		db  0Ah
		db  19h
		db    0
		db    0
		db    1
		db    8
		db    2
		db  1Ah
		db    0
		db    0
		db    1
		db    3
		db    1
		db  1Bh
		db    9
		db    0
		db    1
		db    3
		db    1
		db  1Ch
		db  0Ah
		db    0
		db    1
		db    3
		db    1
		db  1Dh
		db  0Ah
		db    0
		db    2
		db    3
		db    7
		db    3
		db    0
		db    0
		db    1
		db    1
		db    1
		db  1Eh
		db    0
		db    0
		db    1
		db    1
		db    1
		db  1Fh
		db    0
		db    0
		db    1
		db    1
		db    1
		db  20h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  10h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  18h
		db    0
		db    0
		db    1
		db    4
		db    4
		db  21h
		db    0
		db    0
		db    1
		db    1
		db    7
		db  22h
		db  0Bh
		db    0
		db    1
		db    1
		db    1
		db  23h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  0Eh
		db    0
		db    0
		db    1
		db    1
		db  0Bh
		db  24h
		db    0
		db    0
		db  10h
		db    1
		db    1
		db  24h
		db    0
		db    0
		db    2
		db    3
		db    1
		db  25h
		db    0
		db    0
		db    1
		db    1
		db    7
		db  24h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  24h
		db    0
		db    0
		db    1
		db    6
		db    1
		db  27h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  28h
		db  0Ch
		db    0
		db    1
		db    1
		db    7
		db  29h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  2Ah
		db    1
		db    0
		db    1
		db    1
		db    1
		db  2Bh
		db  0Eh
		db    0
		db    1
		db    1
		db    5
		db  2Ch
		db  0Bh
		db    0
		db    1
		db    1
		db    1
		db  2Dh
		db    9
		db    0
		db    1
		db    1
		db    1
		db  2Eh
		db  0Fh
		db    0
		db    1
		db    1
		db    1
		db  2Fh
		db    0
		db    0
		db    1
		db    1
		db    1
		db  30h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  31h
		db    0
		db    0
		db    2
		db    5
		db    5
		db    3
		db    0
		db    0
		db    1
		db    3
		db    6
		db  32h
		db    0
		db    0
		db    1
		db    3
		db    7
		db  33h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  34h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  35h
		db    0
		db    0
		db    1
		db    1
		db    1
		db  36h
		db    0
		db    0
		db    1
		db    4
		db    6
		db    1
		db    0
		db  0Ch
Index_16C3:	dw byte_16DB
		dw byte_16EB
		dw byte_16EC
		dw byte_16EF
		dw byte_16F1
		dw byte_16F3
		dw byte_16F6
		dw byte_16FE
		dw byte_1709
		dw byte_170D
		dw byte_1713
		dw byte_1718
byte_16DB:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_16EB:	db 0
byte_16EC:	db 31h
		db  12h
		db    0
byte_16EF:	db 4
		db  10h
byte_16F1:	db 31h
		db    0
byte_16F3:	db 41h
		db  21h
		db    0
byte_16F6:	db 0D1h
		db 0B1h
		db  91h
		db  71h
		db  51h
		db  31h
		db  11h
		db    0
byte_16FE:	db 0A1h
		db  91h
		db  81h
		db  71h
		db  61h
		db  51h
		db  41h
		db  31h
		db  21h
		db  11h
		db    0
byte_1709:	db 3
		db  12h
		db  21h
		db  30h
byte_170D:	db 0F1h
		db 0C2h
		db  93h
		db  64h
		db  35h
		db    0
byte_1713:	db 61h
		db  51h
		db  41h
		db  21h
		db    0
byte_1718:	db 0F1h
		db 0E1h
		db 0D1h
		db 0C1h
		db 0B1h
		db 0A1h
		db  91h
		db  81h
		db  72h
		db  62h
		db  52h
		db  42h
		db  33h
		db  22h
		db  13h
		db    0
		db  3Bh
word_1729:	dw 179Fh
		dw 17A0h
		db 29h
		db 0F4h
		db 0AAh
		db  17h
		db 36h
		db 0F4h
		db 43h
		db 0F4h
		db  47h
		db 0F4h
		db 5Ah
		db 0F4h
		db  73h
		db 0F4h
		db 0C3h
		db  17h
		db 0D8h
		db 17h
		db 83h
		db 0F4h
		db  93h
		db 0F4h
		db 0DCh
		db 0F4h
		db 0E6h
		db 0F4h
		db 0EDh
		db 0F4h
		db 0F4h
		db 0F4h
		db    1
		db 0F5h
		db 14h
		db 0F5h
		db 0F7h
		db 17h
		db 27h
		db 0F5h
		db 3Dh
		db 0F5h
		db 5Fh
		db 0F5h
		db 81h
		db 0F5h
		db 0CDh
		db 0F5h
		db 0D7h
		db 0F5h
		db 0DBh
		db 0F5h
		db 0F4h
		db 0F5h
		db 0FEh
		db 0F5h
		db 1Ah
		db 0F6h
		db  2Ah
		db 0F6h
		db  58h
		db 0F6h
		db  83h
		db 0F6h
		db  90h
		db 0F6h
		db  94h
		db 0F6h
		db 0ADh
		db 0F6h
		db 0BDh
		db 0F6h
		db 0CAh
		db 0F6h
		db  13h
		db 18h
		db 0FEh
		db 0F6h
		db  3Bh
		db 0F7h
		db 69h
		db 0F7h
		db 97h
		db 0F7h
		db 0C8h
		db 0F7h
		db 0E7h
		db 0F7h
		db 3Ch
		db 0F8h
		db 46h
		db 0F8h
		db 0A7h
		db 0F8h
		db 0C3h
		db 0F8h
		db 0D0h
		db 0F8h
		db 0DAh
		db 0F8h
		db 0E1h
		db 0F8h
		db 0E8h
		db 0F8h
		db 1
		db 0F9h
		db  14h
		db 0F9h
		db 1Dh
		db 18h
		db  27h
		db 18h
		db  2Eh
		db  18h
		db  4Ah
		db  18h
		db    0
		db    2
		db  70h
		db    0
		db    3
		db 0D0h
		db 0FFh
		db  2Ah
		db  58h
		db 0FFh
		db 0FAh
		db 38h
		db    0
		db 0
		db 8
		db 1
		db    0
		db 0FDh
		db 10h
		db  10h
		db 0FFh
		db 0FFh
		db 10h
		db    1
		db 0
		db 0FEh
		db    8
		db 0FEh
		db 0FFh
		db 8
		db 2
		db 0
		db 0FFh
		db 0B9h
		db 17h
		db 0
		db 1
		db  80h
		db 0FFh
		db 10h
		db    8
		db 0
		db 1Ah
		db 0
		db 0
		db 8
		db 3
		db 0
		db 10h
		db 0FDh
		db 0FFh
		db 10h
		db    3
		db 0
		db 0FFh
		db 0CFh
		db 17h
		db 40h
		db 0
		db 0
		db 8
		db 4
		db 0
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
		db 0EDh
		db  17h
		db    0
		db    3
		db    0
		db    0
		db    1
		db    0
		db 0FDh
		db    1
		db    0
		db    9
		db    2
		db    0
		db    0
		db    1
		db    0
		db  0Bh
		db    1
		db    0
		db    0
		db    1
		db    0
		db 0FAh
		db    2
		db    0
		db    0
		db    1
		db    0
		db 0FFh
		db    0
		db 0FBh
		db 0D0h
		db 0FFh
		db    2
		db  18h
		db    0
		db 0FFh
		db 0AAh
		db  17h
		db    0
		db  28h
		db    0
		db    0
		db 0FDh
		db    8
		db  50h
		db 0FDh
		db 0FFh
		db 0FEh
		db    0
		db  50h
		db    0
		db    0
		db 0FFh
		db  1Dh
		db  18h
		db    0
		db  10h
		db    0
		db    0
		db 0FDh
		db    8
		db    4
		db    8
		db    0
		db    8
		db 0F8h
		db 0FFh
		db    4
		db    8
		db    0
		db 0FEh
		db    4
		db  10h
		db    0
		db    8
		db 0F0h
		db 0FFh
		db    4
		db  10h
		db    0
		db 0FFh
		db  3Dh
		db  18h
		db    0
		db 0FBh
		db 0C0h
		db 0FEh
		db    8
		db  28h
		db    0
		db 0FFh
		db  2Eh
		db  18h
		db    0
		db  10h
Index_1855:	dw byte_1875
		dw byte_1876
		dw byte_189A
		dw byte_189F
		dw byte_18AA
		dw byte_18AF
		dw byte_18D1
		dw byte_18E8
		dw byte_18F3
		dw byte_18FD
		dw byte_1906
		dw byte_1916
		dw byte_1922
		dw byte_192B
		dw byte_193B
		dw byte_1948
byte_1875:	db 0
byte_1876:	db 3
		db    0
		db 0FBh
		db  7Fh
		db    2
		db    0
		db 0FBh
		db    0
		db    1
		db    0
		db 0FBh
		db  7Fh
		db    1
		db    0
		db 0FBh
		db    0
		db    4
		db    0
		db 0FBh
		db    0
		db    6
		db    0
		db 0FDh
		db  14h
		db    3
		db    0
		db 0FBh
		db  7Fh
		db    1
		db    0
		db 0FBh
		db    0
		db    2
		db    0
		db 0FEh
		db    0
byte_189A:	db 28h
		db    0
		db  20h
		db    3
		db    0
byte_189F:	db 62h
		db    0
		db  30h
		db    0
		db    1
		db  0Bh
		db  30h
		db    0
		db    1
		db    1
		db    0
byte_18AA:	db 7
		db    0
		db 0FBh
		db  0Ch
		db    0
byte_18AF:	db 38h
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
		db 0BFh
		db  18h
		db    0
byte_18D1:	db 1
		db    0
		db 0FDh
		db    3
		db    2
		db    0
		db    1
		db  0Fh
		db    1
		db 0F1h
		db 0FEh
		db 0FDh
		db    9
		db    1
		db  0Fh
		db    1
		db 0F1h
		db    1
		db    0
		db    1
		db    2
		db 0FEh
		db    0
byte_18E8:	db 0Ah
		db    0
		db    1
		db  0Ah
		db    5
		db    0
		db    1
		db 0FAh
		db  20h
		db    0
		db    0
byte_18F3:	db 1
		db    0
		db 0FDh
		db    5
		db    2
		db    0
		db    1
		db    4
		db 0FEh
		db    0
byte_18FD:	db 2
		db    0
		db    1
		db  7Fh
		db 0FBh
		db    0
		db  30h
		db    0
		db    0
byte_1906:	db 9
		db    0
		db 0FBh
		db  10h
		db    3
		db    0
		db 0FBh
		db    0
		db 0FDh
		db  1Eh
		db    2
		db    0
		db    1
		db    1
		db 0FEh
		db    0
byte_1916:	db 1
		db    0
		db 0FBh
		db  7Fh
		db    1
		db    0
		db 0FBh
		db    0
		db 0FFh
		db  16h
		db  19h
		db    0
byte_1922:	db 9
		db    0
		db 0FBh
		db  7Fh
		db    4
		db    0
		db 0FBh
		db  0Ah
		db    0
byte_192B:	db 1
		db  45h
		db 0F9h
		db    2
		db  1Eh
		db    0
		db 0FDh
		db  45h
		db    3
		db    0
		db    1
		db 0FFh
		db 0FEh
		db  80h
		db    0
		db    0
byte_193B:	db 5
		db    0
		db    1
		db  7Fh
		db 0FBh
		db    0
		db    6
		db    0
		db 0FBh
		db  7Fh
		db  30h
		db    0
		db    0
byte_1948:	db 6
		db    0
		db 0FBh
		db  14h
		db    4
		db    0
		db 0FBh
		db    0
		db    0
		db 0FDh
		db  11h
		db 0EFh
		db 0A1h
		db    1
		db  9Bh
		db  81h
		db  12h
		db  36h
		db  15h
		db 0C3h
		db  16h
		db  29h
		db  17h
		db  55h
		db  18h
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
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
byte_1C1C:	ds 1
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
byte_1C29:	ds 1
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
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
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

		binclude "Z80 Driver2/Music/Music.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
