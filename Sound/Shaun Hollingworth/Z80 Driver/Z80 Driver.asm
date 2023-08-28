; ---------------------------------------------------------------------------
; Krisalis/Shaun Hollingworth(1994).
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

	phase	$C00

start:
		!org	0
		CPU Z80
		listing on

		di
		im	1
		ld	sp, byte_1FFF
		ld	hl, sub_C4F
		ld	de, 8
		ld	bc, 37h
		ldir
		ld	hl, sub_C6F
		ld	de, 38h
		ld	bc, 8
		ldir
		ld	hl, sub_C49
		ld	de, 0
		ld	bc, 6
		ldir
		call	sub_14AF
		exx
		ld	bc, 0
		ld	a, 0B6h
		ld	(word_F2F), a
		exx
		ld	(word_F45), a
		ld	(word_F53), a
		ld	(word_F61), a
		ld	(word_F6F), a
		ld	(word_F7D), a
		ld	(word_F8B), a
		jp	loc_FF3

; =============== S U B R O U T I N E =======================================

sub_C49:
		nop
		jp	start
; End of function sub_C49
; ---------------------------------------------------------------------------
		db 0ACh
		db 0Fh

; =============== S U B R O U T I N E =======================================

sub_C4F:
		ld	a, (4000h)
		bit	7, a
		jr	nz, loc_C57
		ret
; ---------------------------------------------------------------------------

loc_C57:
		ld	a, (4000h)
		bit	7, a
		jr	nz, loc_C57
		ret
; End of function sub_C4F
; ---------------------------------------------------------------------------
		exx
		ld	a, c
		or	b
		call	nz, sub_174C
		exx
		ret
; ---------------------------------------------------------------------------

loc_C67:
		ld	a, (4000h)
		bit	7, a
		jr	nz, loc_C67
		ret

; =============== S U B R O U T I N E =======================================

sub_C6F:
		ei
		ret
; End of function sub_C6F

; =============== S U B R O U T I N E =======================================

sub_C71:
		ld	(iy+9),	a
		ex	af, af'
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		xor	a
		ld	(loc_CF3+1), a
		ld	a, c
		cp	4
		jr	nz, sub_CBC
		ld	a, (byte_FAD)
		or	a
		jr	z, sub_CBC
		ld	a, 1
		ld	(loc_CF3+1), a
		call	sub_CBC
		push	ix
		ld	a, 0FEh
		ld	(byte_FAD), a
		ld	l, 0C0h
		ld	a, (word_FEC)
		or	a
		jr	z, loc_CB9
		and	0C0h
		ld	l, a
		ld	a, 0B5h
		ld	(4002h), a
		rst	10h
		ld	ix, (word_D9A)
		ld	a, (ix+19h)
		and	3Fh
		or	l
		ld	(4003h), a
		rst	10h

loc_CB9:
		pop	ix
		ret
; End of function sub_C71

; =============== S U B R O U T I N E =======================================

sub_CBC:
		ex	af, af'
		push	bc
		ld	de, 400h
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, de
		bit	7, a
		jr	z, loc_CD1
		ld	hl, byte_D9C

loc_CD1:
		ld	(word_D9A), hl
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ex	de, hl
		ld	b, c
		ld	c, 0
		srl	b
		rr	c
		srl	b
		rr	c
		ld	hl,  word_DBB+1
		add	hl, bc
		ld	b, 40h
		ex	af, af'
		ld	a, 4
		call	sub_D80

loc_CF3:
		ld	a, 0
		or	a
		jr	z, loc_D00
		ld	a, (word_FE8)
		or	a
		jr	z, loc_D28
		jr	loc_D06
; ---------------------------------------------------------------------------

loc_D00:
		ld	a, (word_FE6)
		or	a
		jr	z, loc_D28

loc_D06:
		push	iy
		push	bc
		push	de
		ld	(loc_119C+1), a
		ld	iy, (word_D9A)
		call	loc_1109
		pop	de
		pop	bc
		pop	iy
		inc	de
		inc	de
		inc	de
		inc	de
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		ld	a, 12h
		jr	loc_D2A
; ---------------------------------------------------------------------------

loc_D28:
		ld	a, 16h

loc_D2A:
		call	sub_D2F
		pop	bc
		ret
; End of function sub_CBC

; =============== S U B R O U T I N E =======================================

sub_D2F:
		cp	1
		jr	nz, loc_D60
		ex	af, af'
		ld	a, (de)
		inc	de
		ld	(de), a
		ld	a, (iy+0Bh)
		or	(iy+0Ch)
		jr	z, loc_D61
		ld	a, (iy+0Bh)
		ld	c, a
		or	a
		jr	z, loc_D4B
		ld	a, (de)
		and	0F8h
		or	c
		ld	(de), a

loc_D4B:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (iy+0Ch)
		ld	c, a
		or	a
		jr	z, loc_D61
		ld	a, (de)
		and	3Fh
		or	c
		ld	(de), a
		jr	loc_D61
; ---------------------------------------------------------------------------

loc_D60:
		ex	af, af'

loc_D61:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	c, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	(bc), a
		rst	10h
		inc	c
		ld	a, (de)
		ld	(bc), a
		rst	10h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		inc	de
		ex	af, af'
		dec	a
		jr	nz, sub_D2F
		ex	af, af'
		ret
; End of function sub_D2F

; =============== S U B R O U T I N E =======================================

sub_D80:
		ex	af, af'
		ld	c, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	(bc), a
		rst	10h
		inc	c
		ld	a, (de)
		ld	(bc), a
		rst	10h
		inc	de
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ex	af, af'
		dec	a
		jr	nz, sub_D80
		ex	af, af'
		ret
; End of function sub_D80
; ---------------------------------------------------------------------------
		db 0
word_D9A:	dw 0
byte_D9C:	db 0
		db    0
		db    0
		db    0
		db  7Fh
		db  7Fh
		db  7Fh
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
word_DBB:	dw 0
		dw 30h
		dw 34h
		dw 38h
word_DC3:	dw 3Ch
		dw 40h
		dw 44h
		dw 48h
		dw 4Ch
		dw 50h
		dw 54h
		dw 58h
		dw 5Ch
		dw 60h
		dw 64h
		dw 68h
		dw 6Ch
		dw 70h
		dw 74h
		dw 78h
		dw 7Ch
		dw 80h
		dw 84h
		dw 88h
		dw 8Ch
		dw 0B0h
		dw 0B4h
		dw 0
		dw 0
		dw 90h
		dw 94h
		dw 98h
		dw 9Ch
		dw 31h
		dw 35h
		dw 39h
		dw 3Dh
		dw 41h
		dw 45h
		dw 49h
		dw 4Dh
		dw 51h
		dw 55h
		dw 59h
		dw 5Dh
		dw 61h
		dw 65h
		dw 69h
		dw 6Dh
		dw 71h
		dw 75h
		dw 79h
		dw 7Dh
		dw 81h
		dw 85h
		dw 89h
		dw 8Dh
		dw 0B1h
		dw 0B5h
		dw 0
		dw 0
		dw 91h
		dw 95h
		dw 99h
		dw 9Dh
		dw 32h
		dw 36h
		dw 3Ah
		dw 3Eh
		dw 42h
		dw 46h
		dw 4Ah
		dw 4Eh
		dw 52h
		dw 56h
		dw 5Ah
		dw 5Eh
		dw 62h
		dw 66h
		dw 6Ah
		dw 6Eh
		dw 72h
		dw 76h
		dw 7Ah
		dw 7Eh
		dw 82h
		dw 86h
		dw 8Ah
		dw 8Eh
		dw 0B2h
		dw 0B6h
		dw 0
		dw 0
		dw 92h
		dw 96h
		dw 9Ah
		dw 29Eh
		dw 230h
		dw 234h
		dw 238h
		dw 23Ch
		dw 240h
		dw 244h
		dw 248h
		dw 24Ch
		dw 250h
		dw 254h
		dw 258h
		dw 25Ch
		dw 260h
		dw 264h
		dw 268h
		dw 26Ch
		dw 270h
		dw 274h
		dw 278h
		dw 27Ch
		dw 280h
		dw 284h
		dw 288h
		dw 28Ch
		dw 2B0h
		dw 0B4h
		dw 0
		dw 200h
		dw 290h
		dw 294h
		dw 298h
		dw 29Ch
		dw 231h
		dw 235h
		dw 239h
word_EC3:	dw 23Dh
		dw 241h
		dw 245h
		dw 249h
		dw 24Dh
		dw 251h
		dw 255h
		dw 259h
		dw 25Dh
		dw 261h
		dw 265h
		dw 269h
		dw 26Dh
		dw 271h
		dw 275h
		dw 279h
		dw 27Dh
		dw 281h
		dw 285h
		dw 289h
		dw 28Dh
		dw 2B1h
		dw 0B5h
		dw 0
		dw 200h
		dw 291h
		dw 295h
		dw 299h
		dw 29Dh
		dw 232h
		dw 236h
		dw 23Ah
		dw 23Eh
		dw 242h
		dw 246h
		dw 24Ah
		dw 24Eh
		dw 252h
		dw 256h
		dw 25Ah
		dw 25Eh
		dw 262h
		dw 266h
		dw 26Ah
		dw 26Eh
		dw 272h
		dw 276h
		dw 27Ah
		dw 27Eh
		dw 282h
		dw 286h
		dw 28Ah
		dw 28Eh
		dw 2B2h
word_F2F:	dw 0B6h
		dw 0
		dw 200h
		dw 292h
		dw 296h
		dw 29Ah
		db  9Eh
word_F3C:	dw 0
word_F3E:	dw 0
		dw 0
word_F42:	dw 0
byte_F44:	db 0
word_F45:	dw 0
word_F47:	dw 0
		db 0
word_F4A:	dw 0
word_F4C:	dw 0
		dw 0
word_F50:	dw 0
byte_F52:	db 0
word_F53:	dw 0
word_F55:	dw 0
		db 0
word_F58:	dw 0
word_F5A:	dw 0
		dw 0
word_F5E:	dw 0
byte_F60:	db 0
word_F61:	dw 0
word_F63:	dw 0
		db 0
word_F66:	dw 0
word_F68:	dw 0
		dw 0
word_F6C:	dw 0
byte_F6E:	db 0
word_F6F:	dw 0
word_F71:	dw 0
		db 0
word_F74:	dw 0
word_F76:	dw 0
		dw 0
word_F7A:	dw 0
byte_F7C:	db 0
word_F7D:	dw 0
word_F7F:	dw 0
		db 0
word_F82:	dw 0
word_F84:	dw 0
		dw 0
word_F88:	dw 0
byte_F8A:	db 0
word_F8B:	dw 0
word_F8D:	dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_F9E:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_FAC:	db 0
byte_FAD:	db 0
byte_FAE:	db 0
byte_FAF:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_FBA:	db 0
byte_FBB:	db 0
word_FBC:	dw 1863h
word_FBE:	dw 58h
word_FC0:	dw 9A2h
byte_FC2:	db 0
		db    0
byte_FC4:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_FE4:	dw 0
word_FE6:	dw 0
word_FE8:	dw 0
word_FEA:	dw 0
word_FEC:	dw 0
word_FEE:	dw 0
word_FF0:	dw 0
byte_FF2:	db 0
; ---------------------------------------------------------------------------

loc_FF3:
		ld	a, (word_FE6)
		or	a
		call	nz, sub_10C9
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (byte_FAD)
		cp	0FEh
		call	z, sub_10B4

loc_1009:
		ld	a, (byte_FC2)
		or	a
		call	nz, sub_16E0
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (byte_FAC)
		or	a
		jr	z, loc_1009
		ld	c, a
		xor	a
		ld	(byte_FAC), a
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, c
		cp	1
		jr	z, loc_10A7
		cp	2
		jp	z, loc_15AF
		cp	3
		jr	nz, loc_1047
		ld	a, (byte_FAF)
		ld	c, a
		ld	a, (byte_FAE)
		ld	iy, byte_F9E
		call	sub_C71
		jr	loc_FF3
; ---------------------------------------------------------------------------

loc_1047:
		cp	4
		jr	nz, loc_1050
		call	sub_1533
		jr	loc_FF3
; ---------------------------------------------------------------------------

loc_1050:
		cp	7
		jp	z, loc_1586
		ld	a, (byte_FAD)
		and	0FEh
		ld	c, a
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (byte_FF2)
		cp	c
		jr	z, loc_107A
		ld	a, c
		ld	(byte_FF2), a
		ld	iy, word_F74
		xor	a
		ld	(iy+6),	a
		ld	(iy+0Bh), a
		ld	(iy+0Ch), a

loc_107A:
		ld	b, 6
		ld	c, 0
		ld	ix, byte_FAE
		ld	iy, word_F3C

loc_1086:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		push	bc
		call	sub_138E
		inc	ix
		inc	ix
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	de, 0Eh
		add	iy, de
		pop	bc
		inc	c
		push	af
		pop	af
		djnz	loc_1086

loc_10A7:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		call	sub_11BE
		jp	loc_FF3

; =============== S U B R O U T I N E =======================================

sub_10B4:
		ld	a, (word_FE8)
		ld	(loc_119C+1), a
		ld	ix, word_F74
		ld	hl,  word_EC3+1
		ld	a, (ix+8)
		or	a
		call	p, sub_10F8
		ret
; End of function sub_10B4

; =============== S U B R O U T I N E =======================================

sub_10C9:
		ld	a, (word_FE6)
		ld	b, 6
		ld	(loc_119C+1), a
		ld	ix, word_F3C
		ld	hl,  word_DC3+1

loc_10D8:
		push	bc
		ld	a, b
		cp	2
		jr	nz, loc_10E4
		ld	a, (byte_FAD)
		or	a
		jr	nz, loc_10EB

loc_10E4:
		ld	a, (ix+8)
		or	a
		call	p, sub_10F8

loc_10EB:
		ld	bc, 0Eh
		add	ix, bc
		ld	bc, 40h
		add	hl, bc
		pop	bc
		djnz	loc_10D8
		ret
; End of function sub_10C9

; =============== S U B R O U T I N E =======================================

sub_10F8:
		push	hl
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	de, 400h
		add	hl, de
		push	hl
		pop	iy
		pop	hl

loc_1109:
		push	hl
		ld	a, (iy+18h)
		and	7
		or	a
		jr	z, loc_113E
		dec	a
		jr	z, loc_113E
		dec	a
		jr	z, loc_113E
		dec	a
		jr	z, loc_113E
		dec	a
		jr	z, loc_1158
		dec	a
		jr	z, loc_1172
		dec	a
		jr	z, loc_1172
		ld	a, (iy+4)
		call	sub_118C
		ld	a, (iy+5)
		call	sub_118C
		ld	a, (iy+6)
		call	sub_118C
		ld	a, (iy+7)
		call	sub_118C
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_113E:
		ld	a, (iy+4)
		call	sub_11AA
		ld	a, (iy+5)
		call	sub_11AA
		ld	a, (iy+6)
		call	sub_11AA
		ld	a, (iy+7)
		call	sub_118C
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1158:
		ld	a, (iy+4)
		call	sub_11AA
		ld	a, (iy+5)
		call	sub_11AA
		ld	a, (iy+6)
		call	sub_118C
		ld	a, (iy+7)
		call	sub_118C
		pop	hl
		ret
; ---------------------------------------------------------------------------

loc_1172:
		ld	a, (iy+4)
		call	sub_11AA
		ld	a, (iy+5)
		call	sub_118C
		ld	a, (iy+6)
		call	sub_118C
		ld	a, (iy+7)
		call	sub_118C
		pop	hl
		ret
; End of function sub_10F8


; =============== S U B R O U T I N E =======================================


sub_118C:
		ld	b, 40h
		ld	c, (hl)
		inc	hl
		push	af
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (hl)
		inc	hl
		ld	(bc), a
		rst	10h

loc_119C:
		ld	a, 0
		ld	e, a
		pop	af
		add	a, e
		bit	7, a
		jr	z, loc_11A7
		ld	a, 7Fh

loc_11A7:
		inc	c
		ld	(bc), a
		ret
; End of function sub_118C


; =============== S U B R O U T I N E =======================================


sub_11AA:
		ld	b, 40h
		ld	c, (hl)
		inc	hl
		push	af
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (hl)
		inc	hl
		ld	(bc), a
		rst	10h
		pop	af
		inc	c
		ld	(bc), a
		ret
; End of function sub_11AA


; =============== S U B R O U T I N E =======================================


sub_11BE:
		ld	iy, word_F3C
		ld	c, 0
		ld	b, 6
		call	sub_1230
		inc	c
		dec	b
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	iy, word_F4A
		call	sub_1230
		inc	c
		dec	b
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	iy, word_F58
		call	sub_1230
		inc	c
		dec	b
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	iy, word_F66
		call	sub_1230
		inc	c
		dec	b
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	iy, word_F74
		call	sub_1230
		inc	c
		dec	b
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	iy, word_F82
		call	sub_1230
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ret
; End of function sub_11BE

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1230

loc_1221:
		ld	l, (iy+4)
		ld	h, (iy+5)
		ld	(iy+2),	l
		ld	(iy+3),	h
		jp	loc_12EB
; END OF FUNCTION CHUNK	FOR sub_1230

; =============== S U B R O U T I N E =======================================


sub_1230:

; FUNCTION CHUNK AT 1221 SIZE 0000000F BYTES

		ld	a, (iy+6)
		or	a
		jp	z, loc_12FB
		ld	l, (iy+4)
		ld	h, (iy+5)
		ld	e, (iy+2)
		ld	d, (iy+3)
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, d
		and	3Fh
		ld	d, a
		ld	a, d
		or	e
		jr	z, loc_1221
		push	hl
		and	a
		sbc	hl, de
		pop	hl
		jr	z, locret_125D
		jr	nc, loc_125E
		jr	loc_12A1
; ---------------------------------------------------------------------------

locret_125D:
		ret
; ---------------------------------------------------------------------------

loc_125E:
		ex	de, hl
		ld	d, 0
		ld	e, (iy+6)
		add	hl, de
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	de, 4D0h
		and	a
		sbc	hl, de
		pop	hl
		jr	c, loc_1284
		ld	de, 269h
		and	a
		sbc	hl, de
		ld	a, h
		add	a, 8
		ld	h, a

loc_1284:
		ld	(iy+2),	l
		ld	(iy+3),	h
		ld	e, (iy+4)
		ld	d, (iy+5)
		and	a
		sbc	hl, de
		jr	c, loc_129B
		ld	(iy+2),	e
		ld	(iy+3),	d

loc_129B:
		set	6, (iy+3)
		jr	loc_12EB
; ---------------------------------------------------------------------------

loc_12A1:
		ex	de, hl
		ld	d, 0
		ld	e, (iy+6)
		and	a
		sbc	hl, de
		push	hl
		ld	a, h
		and	7
		ld	h, a
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	de, 269h
		and	a
		sbc	hl, de
		pop	hl
		jr	nc, loc_12C7
		ld	de, 269h
		add	hl, de
		ld	a, h
		sub	8
		ld	h, a

loc_12C7:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	(iy+2),	l
		ld	(iy+3),	h
		ld	e, (iy+4)
		ld	d, (iy+5)
		and	a
		sbc	hl, de
		jr	z, loc_12E7
		jr	nc, loc_12E7
		ld	(iy+2),	e
		ld	(iy+3),	d

loc_12E7:
		set	6, (iy+3)

loc_12EB:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	l, (iy+2)
		ld	h, (iy+3)
		jp	sub_14C8
; ---------------------------------------------------------------------------

loc_12FB:
		ld	l, (iy+0)
		ld	h, (iy+1)
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, h
		or	l
		ret	z
		add	hl, hl
		ld	e, (iy+2)
		ld	d, (iy+3)
		add	hl, de
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	de, 269h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		sbc	hl, de
		pop	hl
		jr	nc, loc_132C
		add	hl, de
		ld	a, h
		sub	8
		ld	h, a

loc_132C:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	de, 4D0h
		sbc	hl, de
		pop	hl
		jr	c, loc_1350
		ld	de, 269h
		sbc	hl, de
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, h
		add	a, 8
		ld	h, a

loc_1350:
		ld	a, h
		and	3Fh
		set	6, h
		ld	(iy+2),	l
		ld	(iy+3),	h
		call	sub_14C8
		ret
; End of function sub_1230

; =============== S U B R O U T I N E =======================================

sub_135F:
		push	af
		ld	a, (byte_FAD)
		or	a
		jr	z, loc_137B
		ld	a, c
		cp	4
		jr	nz, loc_137B
		ld	(iy+8),	0FFh
		ld	(iy+9),	0FFh
		ld	a, (byte_FBB)
		or	a
		jr	nz, loc_1388

loc_1379:
		pop	af
		ret
; ---------------------------------------------------------------------------

loc_137B:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, (byte_FBA)
		or	a
		jr	z, loc_1379

loc_1388:
		pop	af
		set	5, a
		ret
; End of function sub_135F
; ---------------------------------------------------------------------------
word_138C:	dw 0

; =============== S U B R O U T I N E =======================================

sub_138E:
		ld	(iy+0Dh), 0FFh
		ld	l, (ix+0)
		ld	h, (ix+1)
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, h
		srl	a
		and	7Fh
		cp	6Dh
		jp	nc, loc_1673
		ld	a, h
		or	l
		ret	z
		ld	(word_138C), hl
		srl	h
		rr	l
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, l
		srl	a
		srl	a
		srl	a
		and	1Fh
		jr	z, loc_13EE
		dec	a
		call	sub_135F
		cp	(iy+8)
		ld	(iy+8),	a
		jr	nz, loc_13E1
		ld	a, (iy+6)
		or	a
		jr	z, loc_13DB
		ld	(iy+0Dh), 0

loc_13DB:
		ld	a, (iy+0Bh)
		or	a
		jr	z, loc_13EE

loc_13E1:
		ld	(iy+0Bh), 0
		ld	a, (iy+8)
		cp	(iy+9)
		call	nz, sub_C71

loc_13EE:
		ld	hl, (word_138C)
		ld	a, h
		srl	a
		or	a
		jr	z, loc_1461
		sla	a
		ld	e, a
		ld	d, 0
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	hl, word_179F
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	(iy+4),	l
		ld	(iy+5),	h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		set	6, (iy+3)
		ld	a, (iy+0Dh)
		or	a
		jr	z, loc_1426
		res	6, (iy+3)

loc_1426:
		ld	a, (iy+6)
		or	a
		jr	nz, loc_1432
		ld	(iy+2),	l
		ld	(iy+3),	h

loc_1432:
		ld	hl, 0
		ld	(iy+0),	l
		ld	(iy+1),	h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, c
		cp	5
		jr	nz, loc_1461
		ld	a, (byte_FAD)
		or	a
		jr	nz, loc_1461
		ld	a, (word_FE4)
		or	a
		jr	nz, loc_1461
		exx
		ld	a, c
		or	b
		jr	z, loc_1460
		ld	a, 0B6h
		ld	(word_F2F), a
		ld	bc, 1

loc_1460:
		exx

loc_1461:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	hl, (word_138C)
		ld	a, l
		and	0Fh
		jr	z, loc_148A
		ld	h, a
		and	7
		bit	3, h
		jr	z, loc_1479
		cpl
		inc	a

loc_1479:
		ld	l, a
		ld	h, 0
		bit	7, l
		jr	z, loc_1482
		ld	h, 0FFh

loc_1482:
		add	hl, hl
		add	hl, hl
		ld	(iy+0),	l
		ld	(iy+1),	h

loc_148A:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	l, (iy+2)
		ld	h, (iy+3)
		bit	6, h
		jr	nz, loc_14AA
		call	sub_14C8
		set	6, h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		call	sub_14C8

loc_14AA:
		set	6, (iy+3)
		ret
; End of function sub_138E

; =============== S U B R O U T I N E =======================================

sub_14AF:
		ld	a, 22h
		ld	(4000h), a
		rst	10h
		ld	a, 0Ch
		ld	(4001h), a
		rst	10h
		ld	a, 27h
		ld	(4000h), a
		rst	10h
		ld	a, 0
		ld	(4001h), a
		rst	10h
		ret
; End of function sub_14AF

; =============== S U B R O U T I N E =======================================

sub_14C8:
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		push	hl
		push	bc
		ld	e, 0
		ld	a, c
		cp	3
		jr	c, loc_14DD
		sub	3
		ld	c, a
		ld	e, 2

loc_14DD:
		ld	d, 40h
		ld	a, c
		add	a, 0A4h
		ld	(de), a
		rst	10h
		inc	de
		ld	a, h
		and	3Fh
		ld	(de), a
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		rst	10h
		dec	de
		ld	a, c
		add	a, 0A0h
		ld	(de), a
		rst	10h
		inc	de
		ld	a, l
		ld	(de), a
		dec	de
		rst	10h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		pop	bc
		push	bc
		ld	a, c
		and	7
		cp	3
		jr	c, loc_150D
		inc	a

loc_150D:
		ld	c, 0
		bit	6, h
		jr	z, loc_1515
		ld	c, 0F0h

loc_1515:
		or	c
		ex	af, af'
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, 28h
		ld	de, 4000h
		ld	(de), a
		rst	10h
		inc	e
		ex	af, af'
		ld	(de), a
		rst	10h
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		pop	bc
		pop	hl
		ret
; End of function sub_14C8

; =============== S U B R O U T I N E =======================================

sub_1533:
		xor	a
		ld	(word_FE6), a
		ld	iy, word_F3C
		ld	a, (byte_FAD)
		ld	(loc_155E+1), a
		exx
		ld	a, (word_FE4)
		or	a
		jr	nz, loc_154F
		ld	a, c
		or	b
		jr	z, loc_154F
		ld	bc, 1

loc_154F:
		exx
		ld	b, 6
		ld	c, 0

loc_1554:
		ld	(iy+9),	0FFh
		push	bc
		ld	a, c
		cp	4
		jr	nz, loc_1563

loc_155E:
		ld	a, 0
		or	a
		jr	nz, loc_1568

loc_1563:
		ld	a, 80h
		call	sub_C71

loc_1568:
		xor	a
		ld	(iy+0Ch), a
		ld	(iy+0Bh), a
		ld	(iy+6),	a
		ld	(iy+9),	0FFh
		ld	bc, 0Eh
		add	iy, bc
		pop	bc
		inc	c
		djnz	loc_1554
		ret
; End of function sub_1533
; ---------------------------------------------------------------------------
		db 0, 1, 2, 4, 5, 6
; ---------------------------------------------------------------------------

loc_1586:
		ld	iy, word_F3C
		ld	b, 6
		ld	c, 0

loc_158E:
		ld	a, (iy+8)
		ld	(iy+0Bh), 0
		ld	(iy+0Ch), 0
		call	sub_C71
		ld	(iy+9),	0FFh
		ld	de, 0Eh
		add	iy, de
		inc	c
		djnz	loc_158E
		xor	a
		ld	(byte_FAC), a
		jp	loc_FF3
; ---------------------------------------------------------------------------

loc_15AF:
		ld	hl, 0
		xor	a
		ld	(word_F42), a
		ld	(word_F50), a
		ld	(word_F5E), a
		ld	(word_F6C), a
		ld	(word_F88), a
		ld	(word_F47), hl
		ld	(word_F55), hl
		ld	(word_F63), hl
		ld	(word_F71), hl
		ld	(word_F7F), hl
		ld	(word_F8D), hl
		ld	(word_F3C), hl
		ld	(word_F4A), hl
		ld	(word_F58), hl
		ld	(word_F66), hl
		ld	(word_F82), hl
		ld	a, (byte_FAD)
		or	a
		jr	nz, loc_15EC
		ld	(word_F74), hl

loc_15EC:
		ld	h, 20h
		ld	(word_F3E), hl
		ld	(word_F4C), hl
		ld	(word_F5A), hl
		ld	(word_F68), hl
		ld	(word_F84), hl
		or	a
		jr	nz, loc_1603
		ld	(word_F76), hl

loc_1603:
		ld	a, 0FFh
		ld	(byte_F44), a
		ld	(byte_F52), a
		ld	(byte_F60), a
		ld	(byte_F6E), a
		ld	(byte_F8A), a
		ld	a, (byte_FAD)
		or	a
		jp	nz, loc_FF3
		ld	a, 0FFh
		ld	(byte_F7C), a
		ld	(word_F45), a
		ld	(word_F53), a
		ld	(word_F61), a
		ld	(word_F6F), a
		ld	(word_F7D), a
		ld	(word_F8B), a
		xor	a
		ld	(word_F7A), a
		jp	loc_FF3
; ---------------------------------------------------------------------------

loc_1639:
		cp	6Dh
		ret	c
		sub	6Dh
		ex	af, af'
		ld	a, c
		cp	5
		ret	nz
		ex	af, af'
		push	bc
		push	hl
		push	de
		ld	c, l
		add	a, a
		add	a, a
		ld	l, a
		ld	a, (word_FE4)
		or	a
		jr	nz, loc_166F
		ld	a, c
		ld	(word_FBE), a
		ld	h, 0
		ld	de, byte_FC4
		add	hl, de
		ld	b, (hl)
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	e, (hl)
		set	7, b
		ld	(word_FBC), bc
		ld	(word_FC0), de
		call	sub_16FF

loc_166F:
		pop	de
		pop	hl
		pop	bc
		ret
; ---------------------------------------------------------------------------

loc_1673:
		push	af
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		pop	af
		cp	75h
		jr	c, loc_1639
		cp	7Dh
		jr	nz, loc_16A5
		ld	a, c
		cp	4
		jr	nz, loc_168F
		ld	a, (byte_FAD)
		or	a
		jr	nz, loc_169A

loc_168F:
		xor	a
		bit	7, l
		jr	z, loc_1696
		ld	a, 0FFh

loc_1696:
		ld	(byte_FBA), a
		ret
; ---------------------------------------------------------------------------

loc_169A:
		xor	a
		bit	7, l
		jr	z, loc_16A1
		ld	a, 0FFh

loc_16A1:
		ld	(byte_FBB), a
		ret
; ---------------------------------------------------------------------------

loc_16A5:
		cp	7Ah
		jr	z, loc_16DB
		cp	7Ch
		jr	z, loc_16CA
		cp	7Bh
		ret	nz
		exx
		ld	a, b
		or	c
		call	nz, sub_174C
		exx
		ld	a, l
		and	3
		rrca
		rrca
		ld	(iy+0Ch), a
		ld	a, (iy+8)
		call	sub_C71
		ld	(iy+9),	0FFh
		ret
; ---------------------------------------------------------------------------

loc_16CA:
		ld	a, l
		and	7
		ld	(iy+0Bh), a
		ld	a, (iy+8)
		call	sub_C71
		ld	(iy+9),	0FFh
		ret
; ---------------------------------------------------------------------------

loc_16DB:
		ld	a, l
		ld	(iy+6),	a
		ret

; =============== S U B R O U T I N E =======================================

sub_16E0:
		ld	a, 0FFh
		ld	(word_FE4), a
		ld	a, (word_FEA)
		or	a
		ld	a, 0C0h
		jr	z, loc_16F0
		ld	a, (word_FEA)

loc_16F0:
		ld	l, a
		ld	a, 0B6h
		ld	(4002h), a
		ld	a, l
		ld	(4003h), a
		ld	a, (word_FEE)
		jr	loc_1711
; End of function sub_16E0

; =============== S U B R O U T I N E =======================================

sub_16FF:
		ld	a, 0B6h
		ld	(4002h), a
		ld	a, 0C0h
		ld	(4003h), a
		ld	a, (word_FE6)
		or	a
		ret	nz
		ld	a, (word_FF0)

loc_1711:
		call	sub_178F
		ld	a, 2Bh
		ld	(4000h), a
		rst	10h
		ld	a, 80h
		ld	(4001h), a
		ld	hl, (word_FBC)
		ld	de, 8
		add	hl, de
		ld	de, (word_FBE)
		ld	d, e
		ld	bc, (word_FC0)
		ld	a, c
		sub	0Ch
		ld	c, a
		ld	a, b
		sbc	a, 0
		ld	b, a
		jr	nc, loc_1740
		ld	bc, (word_FC0)
		ld	hl, (word_FBC)

loc_1740:
		xor	a
		ld	(byte_FC2), a
		rst	10h
		exx
		ld	a, 28h
		ld	(word_F2F), a
		ret
; End of function sub_16FF

; =============== S U B R O U T I N E =======================================

sub_174C:
		ld	a, d
		add	a, e
		ld	e, a
		ret	nc
		ld	a, 2Ah
		ld	(4000h), a
		ld	a, (hl)
		add	a, 80h
		ld	(4001h), a
		inc	hl
		dec	bc
		ld	a, b
		or	c
		ret	nz
		rst	20h
		ld	a, 0B6h
		ld	(word_F2F), a
		ld	(4002h), a
		ld	a, (byte_F8A)
		ld	de, 400h
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, de
		ld	de, 19h
		add	hl, de
		ld	a, (hl)
		ld	(4003h), a
		ld	a, 2Bh
		ld	(4000h), a
		rst	20h
		xor	a
		ld	(4001h), a
		ld	(word_FE4), a
		rst	20h
		ret
; End of function sub_174C

; =============== S U B R O U T I N E =======================================

sub_178F:
		push	bc
		ld	b, 9
		ld	c, a

loc_1793:
		ld	a, c
		and	1
		ld	(6000h), a
		srl	c
		djnz	loc_1793
		pop	bc
		ret
; End of function sub_178F
; ---------------------------------------------------------------------------

word_179F:
		dw 0
		dw 0
		dw 269h
		dw 28Dh
		dw 2B4h
		dw 2DDh
		dw 309h
		dw 337h
		dw 368h
		dw 39Ch
		dw 3D3h
		dw 40Dh
		dw 44Bh
		dw 48Ch
		dw 0A69h
		dw 0A8Dh
		dw 0AB4h
		dw 0ADDh
		dw 0B09h
		dw 0B37h
		dw 0B68h
		dw 0B9Ch
		dw 0BD3h
		dw 0C0Dh
		dw 0C4Bh
		dw 0C8Ch
		dw 1269h
		dw 128Dh
		dw 12B4h
		dw 12DDh
		dw 1309h
		dw 1337h
		dw 1368h
		dw 139Ch
		dw 13D3h
		dw 140Dh
		dw 144Bh
		dw 148Ch
		dw 1A69h
		dw 1A8Dh
		dw 1AB4h
		dw 1ADDh
		dw 1B09h
		dw 1B37h
		dw 1B68h
		dw 1B9Ch
		dw 1BD3h
		dw 1C0Dh
		dw 1C4Bh
		dw 1C8Ch
		dw 2269h
		dw 228Dh
		dw 22B4h
		dw 22DDh
		dw 2309h
		dw 2337h
		dw 2368h
		dw 239Ch
		dw 23D3h
		dw 240Dh
		dw 244Bh
		dw 248Ch
		dw 2A69h
		dw 2A8Dh
		dw 2AB4h
		dw 2ADDh
		dw 2B09h
		dw 2B37h
		dw 2B68h
		dw 2B9Ch
		dw 2BD3h
		dw 2C0Dh
		dw 2C4Bh
		dw 2C8Ch
		dw 3269h
		dw 328Dh
		dw 32B4h
		dw 32DDh
		dw 3309h
		dw 3337h
		dw 3368h
		dw 339Ch
		dw 33D3h
		dw 340Dh
		dw 344Bh
		dw 348Ch
		dw 3A69h
		dw 3A8Dh
		dw 3AB4h
		dw 3ADDh
		dw 3B09h
		dw 3B37h
		dw 3B68h
		dw 3B9Ch
		dw 3BD3h
		dw 3C0Dh
		dw 3C4Bh
		dw 3C8Ch
		db 0
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
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
		ds 1

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
