; ---------------------------------------------------------------------------
; Konami (TTA) Sound Driver
; ---------------------------------------------------------------------------

Music_Bank_Offset:			equ ($268000>>15)

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
		ld	(byte_1A40), a
		inc	a
		ld	(byte_1AA0), a
		inc	a
		ld	(byte_1B00), a
		ld	a, 4
		ld	(byte_1B60), a
		ld	(byte_1DA0), a
		inc	a
		ld	(byte_1BC0), a
		ld	(byte_1E00), a
		inc	a
		ld	(byte_1C20), a
		xor	a
		ld	(byte_1A17), a
		ex	af, af'
		ld	a, 2Bh
		rst	8
		ld	(byte_1A00), a
		ld	(byte_1A01), a
		ld	(byte_1A02), a
		ld	(byte_1A03), a
		ld	(byte_1A04), a
		ld	(byte_1A20), a
		dec	l
		exx
		call	sub_A9
		call	LoadBank
		ld	hl, 4000h
		jp	loc_332
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_80:
		ld	(hl), 0
		cp	80h
		jp	c, sub_227
; End of function sub_80


; =============== S U B R O U T I N E =======================================


sub_87:

; FUNCTION CHUNK AT 0121 SIZE 00000086 BYTES
; FUNCTION CHUNK AT 02D0 SIZE 00000040 BYTES

		cp	0E0h
		jp	c, loc_2E7
		cp	0F0h
		jp	c, loc_121
		jp	z, loc_13C
		cp	0F1h
		jp	z, loc_14A
		cp	0FDh
		jp	z, loc_17E
		cp	0FEh
		jp	z, sub_A9
		cp	0FFh
		jp	z, sub_B9
		ret
; End of function sub_87


; =============== S U B R O U T I N E =======================================


sub_A9:
		xor	a
		ld	(byte_1A22), a
		ld	(byte_1DA1), a
		ld	(byte_1E01), a
		ld	(byte_1DA4), a
		ld	(byte_1E04), a
; End of function sub_A9


; =============== S U B R O U T I N E =======================================


sub_B9:
		xor	a
		ld	(byte_1A41), a
		ld	(byte_1AA1), a
		ld	(byte_1B01), a
		ld	(byte_1B61), a
		ld	(byte_1BC1), a
		ld	(byte_1C21), a
		call	sub_310

loc_CF:
		ld	ix, byte_1A40
		ld	de, 60h
		exx
		ld	de, 4000h
		ld	bc, 0

loc_DD:
		exx
		call	sub_D79
		add	ix, de
		exx
		inc	b
		ld	a, b
		cp	3
		jp	nz, loc_DD
		inc	e
		inc	e
		ld	b, 0
		ld	a, (byte_1DA1)
		or	a
		jp	nz, loc_FB
		exx
		call	sub_D79
		exx

loc_FB:
		inc	b
		ld	a, (byte_1E01)
		or	a
		jp	nz, loc_10C
		exx
		ld	ix, byte_1BC0
		call	sub_D79
		exx

loc_10C:
		inc	b
		exx
		ld	ix, byte_1C20
		call	sub_D79
		ld	hl, 7F11h
		ld	(hl), 9Fh
		ld	(hl), 0BFh
		ld	(hl), 0DFh
		ld	(hl), 0FFh
		ret
; End of function sub_B9

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_87

loc_121:
		ld	c, a
		ld	a, (byte_1A09)
		or	a
		ret	nz
		ld	a, c
		and	0Fh
		inc	a
		add	a, a
		add	a, a
		add	a, a
		ld	(byte_1A09), a
		ld	(byte_1A0A), a
		xor	a
		ld	(byte_1A0C), a
		ld	(byte_1A0B), a
		ret
; ---------------------------------------------------------------------------

loc_13C:
		ld	a, 0FFh
		ld	(byte_1A20), a
		xor	a
		ld	a, 73h
		call	sub_227
		jp	loc_CF
; ---------------------------------------------------------------------------

loc_14A:
		xor	a
		ld	(byte_1A20), a
		ld	ix, byte_1A40
		ld	de, 60h
		exx
		ld	bc, 0
		ld	de, 4000h

loc_15C:
		exx
		call	sub_D5C
		add	ix, de
		exx
		inc	b
		ld	a, b
		cp	3
		jp	nz, loc_15C
		inc	e
		inc	e
		dec	b
		exx
		ld	ix, byte_1C20
		call	sub_D5C
		ld	a, 81h
		ld	(byte_1BAE), a
		ld	(byte_1C0E), a
		ret
; ---------------------------------------------------------------------------

loc_17E:
		ld	a, 2
		ld	ix, byte_1DA0
		cp	(ix+1)
		jp	nz, loc_18E
		xor	a
		jp	loc_197
; ---------------------------------------------------------------------------

loc_18E:
		ld	ix, byte_1E00
		cp	(ix+1)
		ret	nz
		dec	a

loc_197:
		exx
		ld	de, 4002h
		ld	b, a
		exx
		xor	a
		ld	(ix+1),	a
		ld	(ix+4),	a
		jp	sub_D79
; END OF FUNCTION CHUNK	FOR sub_87
; ---------------------------------------------------------------------------
word_1A7:	dw 4040h
		dw 0A06Ch
		dw 4040h
		dw 6640h
		dw 626Eh
		dw 8062h
		dw 8081h
		dw 0E0E0h
		dw 8068h
		dw 8E80h
		dw 0A0A0h
		dw 6642h
		dw 42E8h
		dw 6282h
		dw 0A4E8h
		dw 6260h
		dw 8862h
		dw 8880h
		dw 6288h
		dw 8842h
		dw 8888h
		dw 6262h
		dw 4262h
		dw 8844h
		dw 14C8h
		dw 0E288h
		dw 0E062h
		dw 1014h
		dw 8062h
		dw 6E81h
		dw 8080h
		dw 8080h
		dw 8280h
		dw 6262h
		dw 0E262h
		dw 82E4h
		dw 6228h
		dw 1090h
		dw 0E010h
		dw 8888h
		dw 8888h
		dw 2042h
		dw 6280h
		dw 64E0h
		dw 64E2h
		dw 0E062h
		dw 2462h
		dw 0E062h
		dw 5062h
		dw 0A0h
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 0
		dw 6666h
		dw 0F0CEh
		dw 8AC0h
		dw 8A8Ah
		dw 0E08Ah
		dw 0E088h
		dw 908Eh
		dw 0F0C8h

; =============== S U B R O U T I N E =======================================


sub_227:
		ld	c, a
		ld	a, (byte_1A41)
		cp	92h
		ret	z
		ld	hl, word_1A7
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		or	a
		ret	z
		ld	b, a
		ld	(byte_1A1E), a
		ld	a, c
		cp	51h
		jp	z, loc_24B
		cp	3Ah
		jp	nz, loc_25C
		ld	a, 39h
		jp	loc_24D
; ---------------------------------------------------------------------------

loc_24B:
		ld	a, 47h

loc_24D:
		ld	hl, byte_1DA1
		cp	(hl)
		jp	z, loc_2A4
		ld	hl, byte_1E01
		cp	(hl)
		jp	z, loc_2A4
		ld	a, c

loc_25C:
		ld	hl, byte_1DA1
		cp	70h
		jp	nc, loc_28C
		cp	(hl)
		jp	z, loc_2A4
		ld	hl, byte_1E01
		cp	(hl)
		jp	z, loc_2A4
		ld	a, (byte_1DA4)
		ld	hl, byte_1E04
		cp	(hl)
		jp	nc, loc_283
		ld	l, a
		ld	a, b
		cp	l
		ret	c
		ld	hl, byte_1DA1
		jp	loc_2A4
; ---------------------------------------------------------------------------

loc_283:
		ld	a, b
		cp	(hl)
		ret	c
		ld	hl, byte_1E01
		jp	loc_2A4
; ---------------------------------------------------------------------------

loc_28C:
		cp	(hl)
		jp	z, loc_298
		ld	a, (byte_1DA4)
		cp	b
		jp	z, loc_298
		ret	nc

loc_298:
		ld	b, 2
		ld	de, 9294h
		ld	a, c
		and	0Fh
		add	a, a
		jp	loc_2AA
; ---------------------------------------------------------------------------

loc_2A4:
		ld	b, 1
		ld	de, 91CEh
		ld	a, c

loc_2AA:
		push	hl
		add	a, a
		ld	l, a
		ld	h, 0
		add	hl, de
		ex	de, hl
		pop	hl
; End of function sub_227


; =============== S U B R O U T I N E =======================================


sub_2B2:
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
		ld	a, (byte_1A1E)
		ld	(hl), a
		inc	l
		ld	(hl), 2
		dec	b
		ret	z
		inc	de
		push	bc
		ld	bc, 5Ch
		add	hl, bc
		pop	bc
		jp	sub_2B2
; End of function sub_2B2

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_87

loc_2D0:
		cp	0C0h
		jp	z, loc_2DD
		cp	0C1h
		ret	nz
		xor	a
		ld	(byte_1A22), a
		ret
; ---------------------------------------------------------------------------

loc_2DD:
		ld	a, 0FFh
		ld	(byte_1A22), a
		ld	a, 16h
		jp	sub_227
; ---------------------------------------------------------------------------

loc_2E7:
		cp	9Bh
		jp	nc, loc_2D0
		ld	c, a
		cp	80h
		jp	nz, loc_2F9
		ld	a, (byte_1A41)
		ld	(byte_1A21), a
		ld	a, c

loc_2F9:
		and	7Fh
		add	a, a
		ld	l, a
		add	a, a
		add	a, l
		ld	l, a
		ld	h, 0
		add	hl, hl
		ld	de, 0FC06h
		add	hl, de
		ld	de, byte_1A41
		ex	de, hl
		ld	b, 6
		call	sub_2B2
; END OF FUNCTION CHUNK	FOR sub_87

; =============== S U B R O U T I N E =======================================


sub_310:
		xor	a
		ld	(byte_1A09), a
		ld	(byte_1A0A), a
		ld	(byte_1A0C), a
		ld	(byte_1A0B), a
		ld	(byte_1A0D), a
		ld	(byte_1A0E), a
		ld	(byte_1A0F), a
		ld	(byte_1C5A), a
		ret
; End of function sub_310

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start

loc_32A:
		ld	hl, 4000h

loc_32D:
		bit	1, (hl)
		jp	z, loc_32D

loc_332:
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
		exx
		ld	a, (byte_1A00)
		or	a
		jp	z, loc_359
		ld	hl, byte_1A00
		call	sub_80

loc_359:
		ld	a, (byte_1A01)
		or	a
		jp	z, loc_366
		ld	hl, byte_1A01
		call	sub_80

loc_366:
		ld	a, (byte_1A02)
		or	a
		jp	z, loc_373
		ld	hl, byte_1A02
		call	sub_80

loc_373:
		ld	a, (byte_1A04)
		or	a
		jp	z, loc_382
		ld	hl, byte_1A04
		ld	(hl), 0
		call	sub_87

loc_382:
		ld	a, (byte_1A03)
		or	a
		jp	z, loc_391
		ld	hl, byte_1A03
		ld	(hl), 0
		call	sub_87

loc_391:
		xor	a
		ld	(byte_1A1F), a
		ld	ix, byte_1DA0
		exx
		ld	bc, 1
		ld	de, 4002h
		call	sub_443
		ld	ix, byte_1E00
		exx
		inc	b
		call	sub_443
		ld	a, (byte_1A20)
		or	a
		jp	nz, loc_32A
		ld	a, (byte_1A22)
		or	a
		jp	z, loc_3CA
		dec	a
		ld	(byte_1A22), a
		jp	nz, loc_3CA
		dec	a
		ld	(byte_1A22), a
		ld	a, 16h
		call	sub_227

loc_3CA:
		ld	hl, byte_1A09
		ld	a, (hl)
		or	a
		jp	z, loc_3F8
		inc	l
		inc	l
		ld	(hl), 0
		dec	l
		dec	(hl)
		jp	nz, loc_3F8
		ld	(hl), a
		inc	l
		ld	(hl), a
		inc	l
		inc	(hl)
		ld	a, (hl)
		cp	18h
		jp	c, loc_3F8
		inc	(hl)
		cp	30h
		jp	c, loc_3F8
		inc	(hl)
		cp	50h
		jp	c, loc_3F8
		inc	(hl)
		cp	60h
		call	nc, sub_B9

loc_3F8:
		ld	ix, byte_1A40
		exx
		ld	bc, 0
		ld	de, 4000h
		call	sub_46C
		ld	ix, byte_1AA0
		exx
		inc	b
		call	sub_46C
		ld	ix, byte_1B00
		exx
		inc	b
		call	sub_46C
		ld	ix, byte_1B60
		exx
		ld	b, 0
		inc	e
		inc	e
		ld	a, (byte_1DA1)
		call	sub_44C
		ld	ix, byte_1BC0
		exx
		inc	b
		ld	a, (byte_1E01)
		call	sub_44C
		xor	a
		ld	(byte_1A1F), a
		ld	ix, byte_1C20
		exx
		inc	b
		call	sub_46C
		jp	loc_32A
; END OF FUNCTION CHUNK	FOR start

; =============== S U B R O U T I N E =======================================


sub_443:

; FUNCTION CHUNK AT 0D48 SIZE 0000000B BYTES
; FUNCTION CHUNK AT 0EFD SIZE 0000016E BYTES
; FUNCTION CHUNK AT 10F3 SIZE 00000020 BYTES

		exx
		ld	a, (ix+1)
		or	a
		ret	z
		jp	loc_EFD
; End of function sub_443


; =============== S U B R O U T I N E =======================================


sub_44C:
		exx
		ex	af, af'
		ld	a, (ix+1)
		or	a
		ret	z
		ex	af, af'
		or	a
		ld	a, 81h
		jp	nz, loc_45F
		ld	a, (ix+4Eh)
		and	1

loc_45F:
		ld	(byte_1A1F), a
		call	sub_490
		ld	a, (byte_1A1F)
		ld	(ix+4Eh), a
		ret
; End of function sub_44C


; =============== S U B R O U T I N E =======================================


sub_46C:
		exx
		ld	a, (ix+1)
		or	a
		ret	z
		jp	sub_490
; End of function sub_46C


; =============== S U B R O U T I N E =======================================


LoadBank:
		ld	a, Music_Bank_Offset
		ld	(byte_1A1A), a
		ld	hl, 6000h
		ld	b, 8

loc_47F:
		rrca
		jp	c, loc_48A
		ld	(hl), 0
		djnz	loc_47F
		jp	loc_48E
; ---------------------------------------------------------------------------

loc_48A:
		ld	(hl), 1
		djnz	loc_47F

loc_48E:
		ld	(hl), b
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_490:
		ld	a, (ix+5)
		or	a
		jp	z, loc_4D0
		dec	(ix+5)
		jp	z, loc_4A9
		ld	a, (byte_1A1F)
		or	a
		ret	nz
		ld	(ix+2Fh), 0C0h
		jp	sub_D79
; ---------------------------------------------------------------------------

loc_4A9:
		xor	a
		push	ix
		pop	hl
		ld	bc, 4Eh
		add	hl, bc
		ld	b, 12h

loc_4B3:
		ld	(hl), a
		inc	hl
		djnz	loc_4B3
		ld	(ix+0Fh), a
		ld	(ix+10h), a
		ld	(ix+11h), a
		inc	a
		ld	(ix+1Ch), a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), 0FFh
		ld	(ix+2Fh), 0C0h
		ret
; ---------------------------------------------------------------------------

loc_4D0:
		ld	(byte_1A1E), a
		ld	a, (ix+1Bh)
		add	a, (ix+1Ah)
		ld	(ix+1Bh), a
		jp	nc, loc_52A
		dec	(ix+1Ch)
		jp	z, loc_6FD
		ld	a, (byte_1A1F)
		or	a
		jp	z, loc_4F0
		jp	p, loc_532
		ret
; ---------------------------------------------------------------------------

loc_4F0:
		bit	0, (ix+50h)
		ret	nz
		ld	a, (ix+4Fh)
		or	a
		jp	z, loc_506
		dec	(ix+4Fh)
		jp	nz, loc_506
		set	1, (ix+38h)

loc_506:
		bit	7, (ix+51h)
		jp	nz, loc_569
		ld	a, (ix+3Ch)
		cp	(ix+1Ch)
		call	z, sub_D53
		ld	a, (ix+59h)
		or	a
		jp	z, loc_570
		dec	(ix+59h)
		jp	nz, loc_570
		set	0, (ix+38h)
		jp	loc_570
; ---------------------------------------------------------------------------

loc_52A:
		ld	a, (byte_1A1F)
		or	a
		jp	z, loc_55D
		ret	m

loc_532:
		set	0, (ix+50h)
		xor	a
		ld	(byte_1A1F), a
; End of function sub_490


; =============== S U B R O U T I N E =======================================


sub_53A:
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		ld	l, (ix+4Ah)
		ld	h, (ix+4Bh)
		call	sub_D9A
; End of function sub_53A


; =============== S U B R O U T I N E =======================================


sub_54A:
		ld	a, (byte_1A0E)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)
		ld	hl, 1A0Ch
		add	a, (hl)
		jp	sub_EB2
; End of function sub_54A

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_490

loc_55D:
		bit	0, (ix+50h)
		ret	nz
		bit	7, (ix+51h)
		jp	z, loc_570

loc_569:
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_570:
		ld	a, (byte_1A0B)
		or	a
		call	nz, sub_54A
		call	sub_5D4
		bit	0, d
		call	nz, sub_E6B
		bit	0, (ix+38h)
		ret	z
		dec	(ix+41h)
		ret	nz
		ld	a, (ix+42h)
		add	a, 11h
		jp	m, loc_5CF
		ld	(ix+42h), a
		ld	b, 11h
		ld	c, a
		and	0F0h
		rrca
		cp	(ix+3Eh)
		jp	c, loc_5A4
		ld	b, 1
		ld	a, (ix+3Eh)

loc_5A4:
		ld	e, a
		ld	a, c
		and	0Fh
		cp	(ix+3Fh)
		jp	c, loc_5B3
		res	0, b
		ld	a, (ix+3Fh)

loc_5B3:
		or	e
		or	(ix+2Fh)
		ex	af, af'
		ld	a, b
		or	a
		ld	a, 0B4h
		jp	z, loc_5C8
		ld	c, (ix+40h)
		ld	(ix+41h), c
		jp	sub_28
; ---------------------------------------------------------------------------

loc_5C8:
		res	0, (ix+38h)
		jp	sub_28
; ---------------------------------------------------------------------------

loc_5CF:
		res	0, (ix+38h)
		ret
; END OF FUNCTION CHUNK	FOR sub_490

; =============== S U B R O U T I N E =======================================


sub_5D4:
		ld	d, 0
		bit	2, (ix+38h)
		jp	z, loc_5FE
		call	sub_69E
		ld	d, 0FFh
		bit	4, (ix+50h)
		ret	z
		bit	1, (ix+38h)
		jp	z, loc_5F4
		dec	(ix+2Bh)
		jp	z, loc_60D

loc_5F4:
		ld	c, (ix+22h)
		ld	b, (ix+23h)
		add	hl, bc
		ld	d, 0FFh
		ret
; ---------------------------------------------------------------------------

loc_5FE:
		bit	1, (ix+38h)
		ret	z
		dec	(ix+2Bh)
		ret	nz
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)

loc_60D:
		ld	a, (ix+2Ah)
		ld	(ix+2Bh), a
		ld	e, (ix+24h)
		ld	d, (ix+25h)

loc_619:
		ld	a, (de)
		inc	de
		cp	0F0h
		jp	nc, loc_64B
		ld	(ix+24h), e
		ld	(ix+25h), d
		ld	d, 0
		or	a
		jp	p, loc_632
		and	7Fh
		neg
		ld	d, 0FFh

loc_632:
		ld	e, a
		ld	a, (ix+2Eh)
		or	a
		jp	z, loc_641
		ex	de, hl

loc_63B:
		add	hl, hl
		dec	a
		jp	nz, loc_63B
		ex	de, hl

loc_641:
		ld	(ix+22h), e
		ld	(ix+23h), d
		add	hl, de
		ld	d, 0FFh
		ret
; ---------------------------------------------------------------------------

loc_64B:
		and	0Fh
		jp	z, loc_65E
		cp	0Fh
		jp	z, loc_690
		ld	(ix+2Ah), a
		ld	(ix+2Bh), a
		jp	loc_619
; ---------------------------------------------------------------------------

loc_65E:
		ld	a, (ix+2Ch)
		or	a
		jp	nz, loc_672
		ld	(ix+2Ch), 1
		ld	(ix+28h), e
		ld	(ix+29h), d
		jp	loc_619
; ---------------------------------------------------------------------------

loc_672:
		ld	c, a
		ld	a, (de)
		or	a
		jp	z, loc_67F
		cp	c
		jp	z, loc_688
		inc	(ix+2Ch)

loc_67F:
		ld	e, (ix+28h)
		ld	d, (ix+29h)
		jp	loc_619
; ---------------------------------------------------------------------------

loc_688:
		inc	de
		ld	(ix+2Ch), 0
		jp	loc_619
; ---------------------------------------------------------------------------

loc_690:
		res	1, (ix+38h)
		ld	e, (ix+22h)
		ld	d, (ix+23h)
		add	hl, de
		ld	d, 0FFh
		ret
; End of function sub_5D4


; =============== S U B R O U T I N E =======================================


sub_69E:
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		ld	c, (ix+20h)
		ld	b, (ix+21h)
		push	bc
		xor	a
		sbc	hl, bc
		jp	z, loc_6F7
		jp	p, loc_6BD
		ex	de, hl
		ld	hl, byte_1A1E
		ld	(hl), d
		ld	l, a
		ld	h, a
		sbc	hl, de

loc_6BD:
		ex	de, hl
		ld	l, a
		ld	h, a
		ld	bc, 800h
		ex	af, af'
		ld	a, (ix+54h)

loc_6C7:
		srl	d
		rr	e
		rr	c
		rlca
		jp	nc, loc_6D9
		add	hl, de
		ex	af, af'
		add	a, c
		ex	af, af'
		jp	nc, loc_6D9
		inc	hl

loc_6D9:
		djnz	loc_6C7
		ld	a, l
		or	h
		jp	nz, loc_6E1
		inc	l

loc_6E1:
		pop	de
		ld	a, (byte_1A1E)
		or	a
		jp	nz, loc_6ED
		add	hl, de
		jp	loc_6F0
; ---------------------------------------------------------------------------

loc_6ED:
		ex	de, hl
		sbc	hl, de

loc_6F0:
		ld	(ix+20h), l
		ld	(ix+21h), h
		ret
; ---------------------------------------------------------------------------

loc_6F7:
		pop	hl
		res	2, (ix+38h)
		ret
; End of function sub_69E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_490

loc_6FD:
		ld	e, (ix+2)
		ld	d, (ix+3)

loc_703:
		ld	a, (de)
		inc	de
		cp	0D0h
		jp	nc, loc_916
		ld	c, a
		and	0Fh
		jp	nz, loc_712
		ld	a, 10h

loc_712:
		ld	h, (ix+50h)
		bit	2, h
		jp	nz, loc_71D
		ld	l, a
		add	a, l
		add	a, l

loc_71D:
		bit	1, h
		jp	nz, loc_723
		add	a, a

loc_723:
		bit	3, h
		jp	z, loc_72F
		res	3, (ix+50h)
		sub	(ix+3Dh)

loc_72F:
		ld	(ix+1Ch), a

loc_732:
		ld	(ix+2),	e
		ld	(ix+3),	d
		ld	(ix+38h), 0
		ld	d, a
		ld	a, (ix+3Bh)
		or	a
		jp	z, loc_75B
		ld	l, 0
		ld	h, l
		ld	e, l
		ld	b, 8

loc_74A:
		srl	d
		rr	e
		rlca
		jp	nc, loc_753
		add	hl, de

loc_753:
		djnz	loc_74A
		ld	a, h
		or	a
		jp	nz, loc_75B
		inc	a

loc_75B:
		ld	(ix+3Ch), a
		bit	0, (ix+51h)
		jp	nz, loc_8C2
		ld	a, (byte_1A1F)
		or	a
		jp	z, loc_787
		jp	p, loc_77B
		ld	a, (ix+57h)
		or	a
		ret	p
		dec	(ix+35h)
		ret	nz
		jp	sub_84D
; ---------------------------------------------------------------------------

loc_77B:
		xor	a
		ld	(byte_1A1F), a
		push	bc
		call	sub_53A
		pop	bc
		jp	loc_79B
; ---------------------------------------------------------------------------

loc_787:
		ld	a, (byte_1A0B)
		or	a
		jp	z, loc_794
		call	sub_54A
		jp	loc_79B
; ---------------------------------------------------------------------------

loc_794:
		ld	a, (byte_1A1E)
		or	a
		call	nz, sub_54A

loc_79B:
		ld	a, c
		and	0F0h
		jp	nz, loc_7A8
		set	0, (ix+50h)
		jp	sub_D53
; ---------------------------------------------------------------------------

loc_7A8:
		ld	c, a
		ld	a, (ix+57h)
		or	a
		jp	p, loc_7B6
		dec	(ix+35h)
		call	z, sub_84D

loc_7B6:
		ld	a, c
		ld	de, 8246h
		call	sub_7DE
		call	sub_E6B
		ld	a, (ix+58h)
		or	a
		jp	z, loc_D48
		ld	(ix+59h), a
		ld	a, (ix+40h)
		ld	(ix+41h), a
		ld	(ix+42h), 0
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		jp	loc_D48
; END OF FUNCTION CHUNK	FOR sub_490

; =============== S U B R O U T I N E =======================================


sub_7DE:
		res	0, (ix+50h)
		rrca
		rrca
		rrca
		add	a, (ix+3Ah)
		add	a, (ix+55h)
		add	a, (ix+5Fh)
		ld	hl, byte_1A0D
		add	a, (hl)
		ld	l, a
		ld	h, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	(ix+1Eh), e
		ld	(ix+1Fh), d
		ld	a, (ix+54h)
		or	a
		jp	nz, loc_80F
		ld	(ix+20h), e
		ld	(ix+21h), d
		jp	loc_819
; ---------------------------------------------------------------------------

loc_80F:
		ld	(ix+38h), 4
		ld	e, (ix+20h)
		ld	d, (ix+21h)

loc_819:
		ex	de, hl
		bit	4, (ix+50h)
		ret	z
		ld	e, (ix+26h)
		ld	d, (ix+27h)
		ld	(ix+2Ch), 0
		ld	a, (ix+2Dh)
		ld	(ix+4Fh), a
		or	a
		jp	nz, loc_83A
		set	1, (ix+38h)
		jp	loc_619
; ---------------------------------------------------------------------------

loc_83A:
		ld	(ix+24h), e
		ld	(ix+25h), d
		ld	(ix+2Bh), 1
		ld	(ix+22h), 0
		ld	(ix+23h), 0
		ret
; End of function sub_7DE


; =============== S U B R O U T I N E =======================================


sub_84D:
		ld	a, (ix+34h)
		ld	(ix+35h), a
		ld	e, (ix+30h)
		ld	d, (ix+31h)

loc_859:
		ld	a, (de)
		inc	de
		cp	0F0h
		jp	nc, loc_878
		ld	(ix+30h), e
		ld	(ix+31h), d
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, (byte_1A1F)
		or	a
		ret	nz
		ld	a, 0B4h
		jp	sub_28
; ---------------------------------------------------------------------------

loc_878:
		and	0Fh
		jp	z, loc_88B
		cp	0Fh
		jp	z, loc_8BD
		ld	(ix+34h), a
		ld	(ix+35h), a
		jp	loc_859
; ---------------------------------------------------------------------------

loc_88B:
		ld	a, (ix+36h)
		or	a
		jp	nz, loc_89F
		ld	(ix+36h), 1
		ld	(ix+32h), e
		ld	(ix+33h), d
		jp	loc_859
; ---------------------------------------------------------------------------

loc_89F:
		ld	l, a
		ld	a, (de)
		or	a
		jp	z, loc_8AC
		cp	l
		jp	z, loc_8B5
		inc	(ix+36h)

loc_8AC:
		ld	e, (ix+32h)
		ld	d, (ix+33h)
		jp	loc_859
; ---------------------------------------------------------------------------

loc_8B5:
		inc	de
		ld	(ix+36h), 0
		jp	loc_859
; ---------------------------------------------------------------------------

loc_8BD:
		ld	(ix+57h), 0
		ret
; End of function sub_84D

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_490

loc_8C2:
		ld	a, (byte_1A1F)
		or	a
		jp	z, loc_8DC
		jp	p, loc_8D8
		ld	a, (ix+57h)
		or	a
		ret	p
		dec	(ix+35h)
		ret	nz
		jp	sub_84D
; ---------------------------------------------------------------------------

loc_8D8:
		xor	a
		ld	(byte_1A1F), a

loc_8DC:
		ld	a, c
		and	0F0h
		jp	nz, loc_8E9
		set	0, (ix+50h)
		jp	sub_D53
; ---------------------------------------------------------------------------

loc_8E9:
		ld	c, a
		ld	a, (ix+57h)
		or	a
		jp	p, loc_8F7
		dec	(ix+35h)
		call	z, sub_84D

loc_8F7:
		ld	a, c
		rrca
		rrca
		rrca
		ld	c, a
		res	0, (ix+50h)
		ld	(ix+51h), 81h
		ld	hl, 12EEh
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		ld	(ix+1Eh), a
		inc	hl
		ld	a, (hl)
		ld	(ix+1Fh), a
		jp	sub_D53
; ---------------------------------------------------------------------------

loc_916:
		sub	0D8h
		jp	c, loc_9B0
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_928
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_490
; ---------------------------------------------------------------------------
off_928:	dw loc_9D0		; 0
		dw loc_9DB		; 1
		dw loc_9F7		; 2
		dw loc_A35		; 3
		dw loc_A3F		; 4
		dw loc_A3F		; 5
		dw loc_A54		; 6
		dw loc_A66		; 7
		dw loc_A7B		; 8
		dw loc_A99		; 9
		dw loc_AB2		; 0Ah
		dw loc_ABA		; 0Bh
		dw loc_AF3		; 0Ch
		dw loc_B00		; 0Dh
		dw loc_B35		; 0Eh
		dw loc_B35		; 0Fh
		dw loc_B3F		; 10h
		dw loc_B3F		; 11h
		dw loc_B84		; 12h
		dw loc_B95		; 13h
		dw loc_BBE		; 14h
		dw loc_BC7		; 15h
		dw loc_BE5		; 16h
		dw loc_BE5		; 17h
		dw loc_978		; 18h
		dw loc_97F		; 19h
		dw loc_986		; 1Ah
		dw loc_98D		; 1Bh
		dw loc_994		; 1Ch
		dw loc_99B		; 1Dh
		dw loc_9A2		; 1Eh
		dw loc_9A9		; 1Fh
		dw loc_BF9		; 20h
		dw loc_BF9		; 21h
		dw loc_C0A		; 22h
		dw sub_C3D		; 23h
		dw sub_C70		; 24h
		dw sub_C99		; 25h
		dw sub_CC2		; 26h
		dw loc_D23		; 27h
; ---------------------------------------------------------------------------

loc_978:
		ld	(ix+3Ah), 0
		jp	loc_703
; ---------------------------------------------------------------------------

loc_97F:
		ld	(ix+3Ah), 18h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_986:
		ld	(ix+3Ah), 30h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_98D:
		ld	(ix+3Ah), 48h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_994:
		ld	(ix+3Ah), 60h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_99B:
		ld	(ix+3Ah), 78h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_9A2:
		ld	(ix+3Ah), 90h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_9A9:
		ld	(ix+3Ah), 0A8h
		jp	loc_703
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_490

loc_9B0:
		and	7
		ld	c, a
		jp	z, loc_9C6
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_9C6
		ld	c, a
		ld	b, 0
		ld	hl, 8200h
		add	hl, bc
		ld	c, (hl)

loc_9C6:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1A1E), a
		jp	loc_703
; END OF FUNCTION CHUNK	FOR sub_490
; ---------------------------------------------------------------------------

loc_9D0:
		ld	a, (de)
		inc	de
		add	a, a
		add	a, a
		add	a, a
		ld	(ix+53h), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_9DB:
		ld	b, 10h

loc_9DD:
		ld	a, (de)
		inc	de
		cp	0D9h
		jp	nz, loc_9EB
		ld	a, b
		add	a, 10h
		ld	b, a
		jp	loc_9DD
; ---------------------------------------------------------------------------

loc_9EB:
		ld	c, a
		and	0Fh
		jp	nz, loc_9F3
		ld	a, 10h

loc_9F3:
		add	a, b
		jp	loc_712
; ---------------------------------------------------------------------------

loc_9F7:
		ld	a, (de)
		inc	de
		ld	(ix+57h), a
		or	a
		jp	m, loc_A15
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, (byte_1A1F)
		or	a
		jp	nz, loc_703
		ld	a, 0B4h
		rst	28h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A15:
		and	7Fh
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, 8320h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+30h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+31h), a
		ld	(ix+35h), 1
		ld	(ix+36h), 0
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A35:
		ld	a, (de)
		inc	de
		neg
		ld	(ix+3Bh), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A3F:
		bit	2, (ix+50h)
		jp	nz, loc_A4D
		set	2, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A4D:
		res	2, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A54:
		set	3, (ix+50h)
		ld	a, (de)
		inc	de
		ld	c, a
		and	0Fh
		ld	(ix+1Ch), a
		ld	(ix+3Dh), a
		jp	loc_732
; ---------------------------------------------------------------------------

loc_A66:
		bit	1, (ix+50h)
		jp	nz, loc_A74
		set	1, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A74:
		res	1, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A7B:
		ld	(ix+51h), 0
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		ld	(byte_1A1E), a
		call	sub_AC0
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	a, (de)
		inc	de
		neg
		ld	(ix+3Bh), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_A99:
		ld	(ix+56h), 0
		ld	(ix+51h), 1
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	(ix+3Bh), 0
		jp	loc_703
; ---------------------------------------------------------------------------

loc_AB2:
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_ABA:
		call	sub_AC0
		jp	loc_703

; =============== S U B R O U T I N E =======================================


sub_AC0:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_ACA
		cp	(ix+56h)
		ret	z

loc_ACA:
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
		ld	bc, 843Bh
		add	hl, bc
		ld	(ix+4Ah), l
		ld	(ix+4Bh), h
		ld	a, (byte_1A1F)
		or	a
		ret	nz
		inc	a
		ld	(byte_1A1E), a
		jp	sub_D9A
; End of function sub_AC0

; ---------------------------------------------------------------------------

loc_AF3:
		ld	a, (de)
		inc	de
		ld	(ix+39h), a
		ld	a, 0FFh
		ld	(byte_1A1E), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B00:
		ld	a, (de)
		inc	de
		add	a, a
		jp	z, loc_B2E
		ld	c, a
		ld	b, 0
		ld	hl, 8320h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+26h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+27h), a
		ld	a, (de)
		and	0F0h
		rrca
		rrca
		ld	(ix+2Dh), a
		ld	a, (de)
		inc	de
		and	0Fh
		ld	(ix+2Eh), a
		set	4, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B2E:
		res	4, (ix+50h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B35:
		ld	a, (de)
		inc	de
		neg
		ld	(ix+54h), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B3F:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_B6D
		ld	c, a
		and	30h
		ld	(ix+3Eh), a
		ld	a, c
		and	7
		ld	(ix+3Fh), a
		ld	a, (de)
		and	0F0h
		jp	nz, loc_B59
		ld	a, 4

loc_B59:
		rrca
		rrca
		ld	(ix+58h), a
		ld	a, (de)
		inc	de
		and	0Fh
		add	a, a
		jp	nz, loc_B67
		inc	a

loc_B67:
		ld	(ix+40h), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B6D:
		ld	(ix+58h), a
		ld	(ix+59h), a
		ld	a, (byte_1A1F)
		or	a
		jp	nz, loc_703
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B84:
		ld	a, (de)
		inc	de
		and	0Fh
		jp	z, loc_B8E
		dec	a
		or	8

loc_B8E:
		ex	af, af'
		ld	a, 22h
		rst	8
		jp	loc_703
; ---------------------------------------------------------------------------

loc_B95:
		call	sub_B9E
		ld	(byte_1A0D), a
		jp	loc_703

; =============== S U B R O U T I N E =======================================


sub_B9E:
		ld	a, (de)
		inc	de
		ld	c, a
		and	0Fh
		ld	l, a
		ld	a, c
		and	70h
		jp	z, loc_BB6
		rrca
		rrca
		rrca
		rrca
		ld	b, a
		xor	a

loc_BB0:
		add	a, 0Ch
		djnz	loc_BB0
		add	a, l
		ld	l, a

loc_BB6:
		ld	a, l
		add	a, a
		bit	7, c
		ret	z
		neg
		ret
; End of function sub_B9E

; ---------------------------------------------------------------------------

loc_BBE:
		call	sub_B9E
		ld	(ix+55h), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_BC7:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_BDB
		and	7Fh
		neg
		ld	(ix+5Ah), a
		ld	(ix+5Bh), 0FFh
		jp	loc_703
; ---------------------------------------------------------------------------

loc_BDB:
		ld	(ix+5Ah), a
		ld	(ix+5Bh), 0
		jp	loc_703
; ---------------------------------------------------------------------------

loc_BE5:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_BF0
		and	7Fh
		jp	loc_BF2
; ---------------------------------------------------------------------------

loc_BF0:
		neg

loc_BF2:
		ld	(byte_1A0E), a
		inc	de
		jp	loc_703
; ---------------------------------------------------------------------------

loc_BF9:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	a, (hl)
		or	80h
		ld	d, a
; START	OF FUNCTION CHUNK FOR sub_C70

loc_C00:
		exx
		ld	a, c
		exx
		or	a
		jp	nz, loc_FA3
		jp	loc_703
; END OF FUNCTION CHUNK	FOR sub_C70
; ---------------------------------------------------------------------------

loc_C0A:
		ld	a, (ix+0Fh)
		or	a
		jp	nz, loc_C1E
		ld	(ix+0Fh), 1
		ld	(ix+12h), e
		ld	(ix+13h), d
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_C1E:
		ex	de, hl
		cp	(hl)
		jp	z, loc_C34
		ld	a, (hl)
		or	a
		jp	z, loc_C2B
		inc	(ix+0Fh)

loc_C2B:
		ld	e, (ix+12h)
		ld	d, (ix+13h)
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_C34:
		ld	(ix+0Fh), 0
		ex	de, hl
		inc	de
		jp	loc_C00

; =============== S U B R O U T I N E =======================================


sub_C3D:
		ld	a, (ix+10h)
		or	a
		jp	nz, loc_C51
		ld	(ix+10h), 1
		ld	(ix+14h), e
		ld	(ix+15h), d
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_C51:
		ex	de, hl
		cp	(hl)
		jp	z, loc_C67
		ld	a, (hl)
		or	a
		jp	z, loc_C5E
		inc	(ix+10h)

loc_C5E:
		ld	e, (ix+14h)
		ld	d, (ix+15h)
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_C67:
		ld	(ix+10h), 0
		ex	de, hl
		inc	de
		jp	loc_C00
; End of function sub_C3D


; =============== S U B R O U T I N E =======================================


sub_C70:

; FUNCTION CHUNK AT 0C00 SIZE 0000000A BYTES

		bit	0, (ix+11h)
		jp	nz, loc_C8C
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
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_C8C:
		res	0, (ix+11h)
		ld	e, (ix+16h)
		ld	d, (ix+17h)
		jp	loc_C00
; End of function sub_C70


; =============== S U B R O U T I N E =======================================


sub_C99:
		bit	4, (ix+11h)
		jp	nz, loc_CB5
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
		jp	loc_C00
; ---------------------------------------------------------------------------

loc_CB5:
		res	4, (ix+11h)
		ld	e, (ix+18h)
		ld	d, (ix+19h)
		jp	loc_C00
; End of function sub_C99


; =============== S U B R O U T I N E =======================================


sub_CC2:
		ld	a, (ix+5Ch)
		or	a
		jp	nz, loc_CD6
		ld	(ix+5Ch), 1
		ld	(ix+44h), e
		ld	(ix+45h), d
		jp	loc_703
; ---------------------------------------------------------------------------

loc_CD6:
		bit	0, a
		jp	nz, loc_CE8
		ld	(ix+5Ch), 0
		ld	e, (ix+46h)
		ld	d, (ix+47h)
		jp	loc_703
; ---------------------------------------------------------------------------

loc_CE8:
		bit	1, a
		jp	nz, loc_D02
		or	2
		bit	2, a
		jp	z, loc_CFA
		ld	e, (ix+46h)
		ld	d, (ix+47h)

loc_CFA:
		and	0FBh
		ld	(ix+5Ch), a
		jp	loc_703
; ---------------------------------------------------------------------------

loc_D02:
		and	0FDh
		or	4
		ld	c, a
		ld	a, (de)
		cp	0FEh
		ld	a, c
		jp	nz, loc_D11
		inc	de
		and	0FEh

loc_D11:
		ld	(ix+5Ch), a
		ld	(ix+46h), e
		ld	(ix+47h), d
		ld	e, (ix+44h)
		ld	d, (ix+45h)
		jp	loc_703
; End of function sub_CC2

; ---------------------------------------------------------------------------

loc_D23:
		ld	a, (ix+0)
		cp	6
		jp	nz, loc_D3C
		ld	a, (ix+1)
		cp	80h
		jp	nz, loc_D3C
		ld	hl, byte_1A21
		ld	a, (hl)
		ld	(hl), 0
		jp	loc_2E7
; ---------------------------------------------------------------------------

loc_D3C:
		ld	(ix+1),	0
		ld	a, (byte_1A1F)
		or	a
		ret	nz
		jp	sub_D79
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_443

loc_D48:
		ld	a, (ix+0)
		or	0F0h
		ex	af, af'
		ld	a, 28h
		jp	sub_8
; END OF FUNCTION CHUNK	FOR sub_443

; =============== S U B R O U T I N E =======================================


sub_D53:
		ld	a, (ix+0)
		ex	af, af'
		ld	a, 28h
		jp	sub_8
; End of function sub_D53


; =============== S U B R O U T I N E =======================================


sub_D5C:
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
; End of function sub_D5C


; =============== S U B R O U T I N E =======================================


sub_D79:
		ld	a, (ix+0)
		ex	af, af'
		ld	a, 28h
		rst	8
		ld	a, (ix+2Fh)
		ex	af, af'
		ld	a, 0B4h
		rst	28h

loc_D87:
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
; End of function sub_D79


; =============== S U B R O U T I N E =======================================


sub_D9A:
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
		call	sub_E01
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
		call	sub_E01
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
		call	sub_E01
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
		call	sub_E01
		ld	a, (hl)
		ld	(ix+0Dh), a
		ex	af, af'
		add	a, c
		jp	sub_18
; End of function sub_D9A


; =============== S U B R O U T I N E =======================================


sub_E01:
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
; End of function sub_E01


; =============== S U B R O U T I N E =======================================


sub_E12:
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
		call	sub_E55
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 38h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+7),	a
		call	sub_E55
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 34h
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+8),	a
		call	sub_E55
		ld	a, (hl)
		inc	hl
		ex	af, af'
		ld	a, 3Ch
		rst	28h
		ld	a, (hl)
		inc	hl
		ld	(ix+9),	a
; End of function sub_E12


; =============== S U B R O U T I N E =======================================


sub_E55:
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
; End of function sub_E55


; =============== S U B R O U T I N E =======================================


sub_E6B:
		ld	b, 2

loc_E6D:
		ld	a, h
		cp	8
		jp	c, loc_E7B
		inc	b
		srl	h
		rr	l
		jp	loc_E6D
; ---------------------------------------------------------------------------

loc_E7B:
		ld	e, (ix+5Ah)
		ld	d, (ix+5Bh)
		add	hl, de

loc_E82:
		ld	a, h
		cp	8
		jp	c, loc_E90
		inc	b
		srl	h
		rr	l
		jp	loc_E82
; ---------------------------------------------------------------------------

loc_E90:
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
; End of function sub_E6B


; =============== S U B R O U T I N E =======================================


sub_EA2:
		ld	b, 2

loc_EA4:
		ld	a, h
		cp	8
		jp	c, loc_E90
		inc	b
		srl	h
		rr	l
		jp	loc_EA4
; End of function sub_EA2


; =============== S U B R O U T I N E =======================================


sub_EB2:
		ld	b, a
		ld	a, (ix+0Eh)
		and	7
		ld	e, a
		ld	d, 0
		ld	hl, byte_EF5
		add	hl, de
		ld	e, (hl)
		ld	a, 3Ch
		exx
		or	b
		exx
		ex	af, af'
		ld	a, (ix+6)
		call	sub_EDB
		ld	a, (ix+8)
		call	sub_EDB
		ld	a, (ix+7)
		call	sub_EDB
		ld	a, (ix+9)
; End of function sub_EB2


; =============== S U B R O U T I N E =======================================


sub_EDB:
		rlc	e
		jp	nc, loc_EEF
		add	a, b
		jp	p, loc_EEF
		cp	0C0h
		jp	nc, loc_EEE
		ld	a, 6Fh
		jp	loc_EEF
; ---------------------------------------------------------------------------

loc_EEE:
		xor	a

loc_EEF:
		ex	af, af'
		add	a, 4
		jp	sub_18
; End of function sub_EDB

; ---------------------------------------------------------------------------
byte_EF5:	db 10h,	10h, 10h, 10h, 30h, 70h, 70h, 0F0h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_443

loc_EFD:
		ld	a, (ix+5)
		or	a
		jp	z, loc_F2D
		ld	(ix+2Fh), 0C0h
		call	sub_D79
		xor	a
		ld	(ix+5),	a
		push	ix
		pop	hl
		ld	bc, 4Eh
		add	hl, bc
		ld	b, 12h

loc_F18:
		ld	(hl), a
		inc	hl
		djnz	loc_F18
		ld	(ix+0Fh), a
		ld	(ix+10h), a
		ld	(ix+11h), a
		inc	a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

loc_F2D:
		ld	(byte_1A1E), a
		ld	a, (ix+55h)
		or	a
		jp	z, loc_F4C
		dec	(ix+2Ch)
		jp	nz, loc_F4C
		ld	(byte_1A1E), a
		ld	(ix+2Ch), a
		ld	a, (ix+2Bh)
		add	a, (ix+56h)
		ld	(ix+56h), a

loc_F4C:
		dec	(ix+1Bh)
		jp	z, loc_F96
		bit	0, (ix+50h)
		ret	nz
		ld	d, 0
		ld	l, (ix+1Eh)
		ld	h, (ix+1Fh)
		ld	a, (ix+57h)
		or	a
		jp	z, loc_F7D
		dec	(ix+2Dh)
		jp	nz, loc_F7D
		dec	d
		ld	(ix+2Dh), a
		ld	c, (ix+20h)
		ld	b, (ix+21h)
		add	hl, bc
		ld	(ix+1Eh), l
		ld	(ix+1Fh), h

loc_F7D:
		bit	7, d
		call	nz, sub_EA2
		ld	a, (byte_1A1E)
		or	a
		ret	z
		ld	a, (ix+24h)
		add	a, (ix+52h)
		add	a, (ix+5Ah)
		add	a, (ix+56h)
		jp	sub_EB2
; ---------------------------------------------------------------------------

loc_F96:
		bit	4, (ix+51h)
		call	z, sub_D53
		ld	e, (ix+2)
		ld	d, (ix+3)

loc_FA3:
		ld	a, (de)
		inc	de
		cp	0D0h
		jp	nc, loc_1059
		ld	c, (ix+1Ah)
		ld	(ix+1Bh), c
		bit	0, (ix+51h)
		jp	z, loc_FC3
		ld	h, a
		ld	a, (de)
		inc	de
		ld	(ix+2),	e
		ld	(ix+3),	d
		jp	loc_1006
; ---------------------------------------------------------------------------

loc_FC3:
		ld	(ix+2),	e
		ld	(ix+3),	d
		ld	c, a
		and	0F0h
		jp	nz, loc_FD6
		set	0, (ix+50h)
		jp	sub_D53
; ---------------------------------------------------------------------------

loc_FD6:
		ld	e, a
		ld	a, c
		and	0Fh
		ld	c, a
		jp	z, loc_FEE
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_FEE
		ld	c, a
		ld	b, 0
		ld	hl, 8200h
		add	hl, bc
		ld	c, (hl)

loc_FEE:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1A1E), a
		ld	a, e
		rrca
		rrca
		rrca
		add	a, (ix+25h)
		ld	c, a
		ld	b, 0
		ld	hl, 8246h
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)

loc_1006:
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
		ld	a, (ix+57h)
		or	a
		jp	z, loc_1030
		ld	(ix+2Dh), a

loc_1030:
		call	sub_EA2
		ld	a, (ix+58h)
		or	a
		jp	p, loc_1040
		dec	(ix+35h)
		call	z, sub_84D

loc_1040:
		ld	a, (byte_1A1E)
		or	a
		jp	z, loc_D48
		ld	a, (ix+24h)
		add	a, (ix+52h)
		add	a, (ix+5Ah)
		add	a, (ix+56h)
		call	sub_EB2
		jp	loc_D48
; ---------------------------------------------------------------------------

loc_1059:
		sub	0D8h
		jp	c, loc_10F3
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, off_106B
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_443
; ---------------------------------------------------------------------------
off_106B:	dw sub_1113		; 0
		dw loc_111B		; 1
		dw sub_111E		; 2
		dw loc_1152		; 3
		dw loc_1152		; 4
		dw sub_1155		; 5
		dw loc_1152		; 6
		dw loc_1152		; 7
		dw sub_115F		; 8
		dw sub_1174		; 9
		dw sub_117C		; 0Ah
		dw sub_1184		; 0Bh
		dw sub_11AA		; 0Ch
		dw loc_11B4		; 0Dh
		dw loc_11B7		; 0Eh
		dw loc_11B7		; 0Fh
		dw loc_11BA		; 10h
		dw loc_11DD		; 11h
		dw loc_11DD		; 12h
		dw loc_11DD		; 13h
		dw loc_11E0		; 14h
		dw loc_1210		; 15h
		dw loc_122E		; 16h
		dw loc_12B2		; 17h
		dw sub_10BB		; 18h
		dw sub_10C2		; 19h
		dw sub_10C9		; 1Ah
		dw sub_10D0		; 1Bh
		dw sub_10D7		; 1Ch
		dw sub_10DE		; 1Dh
		dw sub_10E5		; 1Eh
		dw sub_10EC		; 1Fh
		dw sub_12E0		; 20h
		dw loc_BF9		; 21h
		dw loc_C0A		; 22h
		dw sub_C3D		; 23h
		dw sub_C70		; 24h
		dw sub_C99		; 25h
		dw sub_CC2		; 26h
		dw sub_12E6		; 27h

; =============== S U B R O U T I N E =======================================


sub_10BB:
		ld	(ix+25h), 0
		jp	loc_FA3
; End of function sub_10BB


; =============== S U B R O U T I N E =======================================


sub_10C2:
		ld	(ix+25h), 18h
		jp	loc_FA3
; End of function sub_10C2


; =============== S U B R O U T I N E =======================================


sub_10C9:
		ld	(ix+25h), 30h
		jp	loc_FA3
; End of function sub_10C9


; =============== S U B R O U T I N E =======================================


sub_10D0:
		ld	(ix+25h), 48h
		jp	loc_FA3
; End of function sub_10D0


; =============== S U B R O U T I N E =======================================


sub_10D7:
		ld	(ix+25h), 60h
		jp	loc_FA3
; End of function sub_10D7


; =============== S U B R O U T I N E =======================================


sub_10DE:
		ld	(ix+25h), 78h
		jp	loc_FA3
; End of function sub_10DE


; =============== S U B R O U T I N E =======================================


sub_10E5:
		ld	(ix+25h), 90h
		jp	loc_FA3
; End of function sub_10E5


; =============== S U B R O U T I N E =======================================


sub_10EC:
		ld	(ix+25h), 0A8h
		jp	loc_FA3
; End of function sub_10EC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_443

loc_10F3:
		and	7
		ld	c, a
		jp	z, loc_1109
		add	a, (ix+53h)
		cp	10h
		jp	c, loc_1109
		ld	c, a
		ld	b, 0
		ld	hl, 8200h
		add	hl, bc
		ld	c, (hl)

loc_1109:
		ld	(ix+52h), c
		inc	a
		ld	(byte_1A1E), a
		jp	loc_FA3
; END OF FUNCTION CHUNK	FOR sub_443

; =============== S U B R O U T I N E =======================================


sub_1113:
		ld	a, (de)
		inc	de
		add	a, a
		add	a, a
		add	a, a
		ld	(ix+53h), a

loc_111B:
		jp	loc_FA3
; End of function sub_1113


; =============== S U B R O U T I N E =======================================


sub_111E:
		ld	a, (de)
		inc	de
		ld	(ix+58h), a
		or	a
		jp	m, loc_1135
		and	3
		rrca
		rrca
		ld	(ix+2Fh), a
		ex	af, af'
		ld	a, 0B4h
		rst	28h
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_1135:
		and	7Fh
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, 8320h
		add	hl, bc
		ld	a, (hl)
		ld	(ix+30h), a
		inc	hl
		ld	a, (hl)
		or	80h
		ld	(ix+31h), a
		ld	(ix+35h), 1
		ld	(ix+36h), 0

loc_1152:
		jp	loc_FA3
; End of function sub_111E


; =============== S U B R O U T I N E =======================================


sub_1155:
		ld	a, (ix+1Ah)
		ld	(ix+1Bh), a
		xor	a
		jp	loc_FC3
; End of function sub_1155


; =============== S U B R O U T I N E =======================================


sub_115F:
		ld	a, (de)
		inc	de
		ld	(ix+51h), a
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		call	sub_118A
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		jp	loc_FA3
; End of function sub_115F


; =============== S U B R O U T I N E =======================================


sub_1174:
		ld	a, (de)
		inc	de
		ld	(ix+51h), a
		jp	loc_FA3
; End of function sub_1174


; =============== S U B R O U T I N E =======================================


sub_117C:
		ld	a, (de)
		inc	de
		ld	(ix+1Ah), a
		jp	loc_FA3
; End of function sub_117C


; =============== S U B R O U T I N E =======================================


sub_1184:
		call	sub_118A
		jp	loc_FA3
; End of function sub_1184


; =============== S U B R O U T I N E =======================================


sub_118A:
		call	sub_D53
		ld	a, (de)
		inc	de
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
		ld	bc, 875Bh
		add	hl, bc
		inc	a
		ld	(byte_1A1E), a
		jp	sub_D9A
; End of function sub_118A


; =============== S U B R O U T I N E =======================================


sub_11AA:
		ld	a, (de)
		inc	de
		ld	(ix+24h), a
		ld	a, 0FFh
		ld	(byte_1A1E), a

loc_11B4:
		jp	loc_FA3
; End of function sub_11AA

; ---------------------------------------------------------------------------

loc_11B7:
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_11BA:
		ld	(ix+56h), 0
		ld	a, (de)
		inc	de
		ld	(ix+55h), a
		or	a
		jp	z, loc_FA3
		ld	(ix+2Ch), a
		ld	a, (de)
		inc	de
		or	a
		jp	m, loc_11D8
		neg
		ld	(ix+2Bh), a
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_11D8:
		and	7Fh
		ld	(ix+2Bh), a

loc_11DD:
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_11E0:
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
		jp	nz, loc_1201
		ld	(ix+5Dh), a
		ld	(ix+5Eh), b
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_1201:
		ld	c, a
		xor	a
		ld	l, a
		ld	h, a
		sbc	hl, bc
		ld	(ix+5Dh), l
		ld	(ix+5Eh), h
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_1210:
		ld	a, (de)
		inc	de
		or	a
		jp	p, loc_1224
		and	7Fh
		neg
		ld	(ix+4Eh), a
		ld	(ix+4Fh), 0FFh
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_1224:
		ld	(ix+4Eh), a
		ld	(ix+4Fh), 0
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_122E:
		ld	a, (ix+59h)
		or	a
		jp	nz, loc_1252
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
		ld	(byte_1A1E), a
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_1252:
		ld	(byte_1A1E), a
		ld	l, (ix+38h)
		ld	h, (ix+39h)
		ld	a, (ix+59h)
		cp	(hl)
		jp	z, loc_12A2
		inc	(ix+59h)
		ex	de, hl
		inc	de
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_1289
		jp	p, loc_1279
		and	7Fh
		neg
		ld	b, 0FFh
		jp	loc_127B
; ---------------------------------------------------------------------------

loc_1279:
		ld	b, 0

loc_127B:
		ld	c, a
		ld	l, (ix+5Bh)
		ld	h, (ix+5Ch)
		add	hl, bc
		ld	(ix+5Bh), l
		ld	(ix+5Ch), h

loc_1289:
		ld	a, (de)
		inc	de
		or	a
		jp	z, loc_FA3
		jp	m, loc_1297
		neg
		jp	loc_1299
; ---------------------------------------------------------------------------

loc_1297:
		and	7Fh

loc_1299:
		add	a, (ix+5Ah)
		ld	(ix+5Ah), a
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_12A2:
		xor	a
		ld	(ix+59h), a
		ld	(ix+5Ah), a
		ld	(ix+5Bh), a
		ld	(ix+5Ch), a
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_12B2:
		ld	a, (de)
		inc	de
		ld	(ix+57h), a
		or	a
		jp	z, loc_FA3
		ld	a, (de)
		inc	de
		or	a
		jp	m, loc_12CC
		ld	(ix+21h), a
		ld	a, (de)
		inc	de
		ld	(ix+20h), a
		jp	loc_FA3
; ---------------------------------------------------------------------------

loc_12CC:
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
		jp	loc_FA3

; =============== S U B R O U T I N E =======================================


sub_12E0:
		call	loc_D87
		jp	loc_FA3
; End of function sub_12E0


; =============== S U B R O U T I N E =======================================


sub_12E6:
		xor	a
		ld	(ix+1),	a
		ld	(ix+4),	a

loc_12ED:
		jp	sub_D79
; End of function sub_12E6

; ---------------------------------------------------------------------------
		dw loc_130A		; 0
		dw loc_1366		; 1
		dw loc_13A0		; 2
		dw loc_13DA		; 3
		dw loc_1414		; 4
		dw loc_144E		; 5
		dw loc_1488		; 6
		dw loc_14A6		; 7
		dw loc_14B9		; 8
		dw loc_1516		; 9
		dw loc_153D		; 0Ah
		dw loc_1550		; 0Bh
		dw loc_1595		; 0Ch
; ---------------------------------------------------------------------------

loc_130A:
		ld	hl, 91B5h
		call	sub_E12
		ld	(ix+20h), 50h
		ld	de, loc_133F
		ld	hl, 1C0h

loc_131A:
		ld	(ix+1Eh), e
		ld	(ix+1Fh), d
		ld	(ix+22h), l
		ld	(ix+23h), h
		call	sub_EA2
		ld	a, (byte_1A0E)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)
		ld	hl, byte_1A0C
		add	a, (hl)
		call	sub_EB2
		jp	loc_D48
; ---------------------------------------------------------------------------

loc_133F:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_135F
		ld	bc, 0FFF5h
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_135F:
		ld	bc, 240h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1366:
		ld	hl, 90D4h
		call	sub_E12
		ld	(ix+20h), 80h
		ld	de, loc_1379
		ld	hl, 720h
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_1379:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_1399
		ld	bc, 0FFE8h
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1399:
		ld	bc, 220h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_13A0:
		ld	hl, 90BBh
		call	sub_E12

loc_13A6:
		ld	(ix+20h), 60h
		ld	de, loc_13B3
		ld	hl, 920h
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_13B3:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_13D3
		ld	bc, 0FFCFh
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_13D3:
		ld	bc, 20h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_13DA:
		ld	hl, 911Fh
		call	sub_E12
		ld	(ix+20h), 80h
		ld	de, loc_13ED
		ld	hl, 900h
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_13ED:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_140D
		ld	bc, 0FFFEh
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_140D:
		ld	bc, 400h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1414:
		ld	hl, 9138h
		call	sub_E12
		ld	(ix+20h), 80h
		ld	de, loc_1427
		ld	hl, 610h
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_1427:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_1447
		ld	bc, 0FFFCh
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1447:
		ld	bc, 400h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_144E:
		ld	hl, 9151h
		call	sub_E12
		ld	(ix+20h), 80h
		ld	de, loc_1461
		ld	hl, 480h
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_1461:
		dec	(ix+20h)
		jp	z, loc_149F
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		bit	0, (ix+20h)
		jp	nz, loc_1481
		ld	bc, 0FFFAh
		add	hl, bc
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1481:
		ld	bc, 500h
		add	hl, bc
		jp	sub_EA2
; ---------------------------------------------------------------------------

loc_1488:
		ld	hl, 90EDh
		call	sub_E12
		ld	(ix+20h), 40h
		ld	de, loc_149B
		ld	hl, 50ABh
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_149B:
		dec	(ix+20h)
		ret	nz

loc_149F:
		set	0, (ix+50h)
		jp	sub_D53
; ---------------------------------------------------------------------------

loc_14A6:
		ld	hl, 9106h
		call	sub_E12
		ld	(ix+20h), 50h
		ld	de, loc_149B
		ld	hl, 70ABh
		jp	loc_131A
; ---------------------------------------------------------------------------

loc_14B9:
		ld	hl, 916Ah
		call	sub_E12
		ld	(ix+20h), 60h
		ld	(ix+21h), 2
		ld	de, loc_14EF
		ld	hl, 0B01h

loc_14CD:
		ld	(ix+1Eh), e
		ld	(ix+1Fh), d
		call	sub_EA2
		ld	a, (byte_1A0E)
		add	a, (ix+39h)
		add	a, (ix+52h)
		add	a, (ix+5Eh)
		ld	hl, byte_1A0C
		add	a, (hl)
		ld	(ix+24h), a
		call	sub_EB2
		jp	loc_D48
; ---------------------------------------------------------------------------

loc_14EF:
		dec	(ix+21h)
		ret	nz
		dec	(ix+20h)
		jp	z, loc_149F
		ld	(ix+21h), 2
		ld	hl, 0B00h
		bit	0, (ix+20h)
		jp	nz, loc_150A
		ld	hl, 0B01h

loc_150A:
		call	sub_EA2
		inc	(ix+24h)
		ld	a, (ix+24h)
		jp	sub_EB2
; ---------------------------------------------------------------------------

loc_1516:
		ld	hl, 9183h
		call	sub_E12
		ld	(ix+20h), 60h
		ld	de, loc_1529
		ld	hl, 0A01h
		jp	loc_14CD
; ---------------------------------------------------------------------------

loc_1529:
		dec	(ix+20h)
		jp	z, loc_149F
		bit	0, (ix+20h)
		ret	nz
		inc	(ix+24h)
		ld	a, (ix+24h)
		jp	sub_EB2
; ---------------------------------------------------------------------------

loc_153D:
		ld	hl, 919Ch
		call	sub_E12
		ld	(ix+20h), 60h
		ld	de, loc_1529
		ld	hl, 400h
		jp	loc_14CD
; ---------------------------------------------------------------------------

loc_1550:
		ld	hl, 919Ch
		call	sub_E12
		ld	hl, 2B0h

loc_1559:
		ld	(ix+20h), 40h
		ld	(ix+21h), 2
		ld	de, loc_156D
		ld	(ix+22h), l
		ld	(ix+23h), h
		jp	loc_14CD
; ---------------------------------------------------------------------------

loc_156D:
		dec	(ix+21h)
		ret	nz
		dec	(ix+20h)
		jp	z, loc_149F
		ld	(ix+21h), 2
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		dec	hl
		ld	(ix+22h), l
		ld	(ix+23h), h
		call	sub_EA2
		ld	a, (ix+24h)
		inc	a
		ld	(ix+24h), a
		jp	sub_EB2
; ---------------------------------------------------------------------------

loc_1595:
		ld	hl, 919Ch
		call	sub_E12
		ld	hl, 200h
		jp	loc_1559
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
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1A00:	ds 1
byte_1A01:	ds 1
byte_1A02:	ds 1
byte_1A03:	ds 1
byte_1A04:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1A09:	ds 1
byte_1A0A:	ds 1
byte_1A0B:	ds 1
byte_1A0C:	ds 1
byte_1A0D:	ds 1
byte_1A0E:	ds 1
byte_1A0F:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1A17:	ds 1
		ds 1
		ds 1
byte_1A1A:		ds 1
		ds 1
		ds 1
		ds 1
byte_1A1E:	ds 1
byte_1A1F:	ds 1
byte_1A20:	ds 1
byte_1A21:	ds 1
byte_1A22:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1A40:	ds 1
byte_1A41:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1AA0:		ds 1
byte_1AA1:		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1B00:		ds 1
byte_1B01:		ds 1
			ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1B60:		ds 1
byte_1B61:		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1BAE:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1BC0:		ds 1
byte_1BC1:		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C0E:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C20:		ds 1
byte_1C21:		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1C5A:		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1DA0:		ds 1
byte_1DA1:	ds 1
		ds 1
		ds 1
byte_1DA4:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1E00:		ds 1
byte_1E01:		ds 1
		ds 1
		ds 1
byte_1E04:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
