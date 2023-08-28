; ---------------------------------------------------------------------------
; PalSoft Z80 Sound Driver
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

		save
		!org	0
		CPU Z80
		listing on

DAC_BANK_1 				equ (250000h>>8)
MUSIC_BANK_1 				equ (258000h>>8)
MUSIC_BANK_Offset 			equ 9800h	; Music Offset+$1800

; =============== S U B R O U T I N E =======================================

start:
		jp	loc_3A
; ---------------------------------------------------------------------------
byte_3:	db 0
byte_4:	db 0
byte_5:	db 0
		db 0
		db 0
byte_8:	db 0
byte_9:	db 0
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; ---------------------------------------------------------------------------
		ei
		ret
; ---------------------------------------------------------------------------

loc_3A:
		di
		im	1
		ld	sp, 2000h
		ei
		ld	hl, byte_1200
		ld	de, byte_1201
		ld	bc, 106h
		ld	(hl), 0
		ldir
		ld	a, 0C0h
		ld	(byte_121F), a
		ld	(byte_1246), a
		ld	(byte_126D), a
		ld	(byte_1294), a
		ld	(byte_12BB), a
		ld	(byte_12E2), a
		ld	a, 0C9h
		ld	(byte_12F0), a
		ld	hl, 00h				; Samples Offset
		ld	(word_1307), hl
		ld	hl, MUSIC_BANK_1	; Music Offset - $F0000 in rom.
		ld	(word_1309), hl
		ld	hl, DAC_BANK_1		; ~Samples Offset - $F8000 in rom.
		ld	(word_130B), hl
		ld	a, 1
		ld	(byte_130F), a
		call	sub_D66
		call	sub_2CA
		ld	hl, 4000h
		ld	(word_12F7), hl
		ld	b, 3
		ld	hl, word_120B

loc_8F:
		ld	c, 0
		call	sub_991
		ld	a, 28h
		add	a, l
		ld	l, a
		djnz	loc_8F
		push	hl
		ld	hl, 4002h

loc_9E:
		ld	(word_12F7), hl
		pop	hl
		ld	b, 3

loc_A4:
		ld	c, 0
		call	sub_991
		ld	a, 28h
		add	a, l
		ld	l, a
		djnz	loc_A4
		call	sub_22D
		ld	hl, 8Dh
		call	sub_26F
		ld	a, 26h
		ld	e, 0C9h
		call	sub_2B4
		ld	a, 27h
		ld	e, 3Fh
		call	sub_2B4

loc_C6:
		ld	a, (byte_3)
		or	a
		jr	nz, loc_FC
		ld	a, (4000h)
		rra
		call	c, sub_184
		ld	b, a
		ld	a, (byte_12F9)
		or	a
		jr	nz, loc_C6
		rr	b
		call	c, sub_197
		call	sub_136
		ld	a, (byte_130F)
		ld	b, a

loc_E6:
		djnz	$
		jr	loc_C6
; End of function start

; =============== S U B R O U T I N E =======================================

LoadUnknownBank:
		ld	hl, (word_1307)
		jp	LoadBank
; End of function LoadUnknownBank

; =============== S U B R O U T I N E =======================================

LoadMusicBank:
		ld	hl, (word_1309)
		jp	LoadBank
; End of function LoadMusicBank

; =============== S U B R O U T I N E =======================================

LoadSamplesBank:
		ld	hl, (word_130B)
		jp	LoadBank
; End of function LoadSamplesBank
; ---------------------------------------------------------------------------

loc_FC:
		ld	de, byte_110
		push	de
		cp	0Dh
		ret	nc
		add	a, a
		ld	l, a
		ld	h, 0
		ld	de, off_115
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR start
; ---------------------------------------------------------------------------
byte_110:	db 0AFh
		db 32h
		db 3
		db 0
		db 0C3h
off_115:	dw loc_C6
		dw sub_312
		dw loc_438
		dw sub_41B
		dw sub_C54
		dw sub_C5B
		dw sub_C82
		dw sub_CFB
		dw sub_D66
		dw sub_1B0
		dw sub_22D
		dw sub_251
		dw sub_12F

; =============== S U B R O U T I N E =======================================


sub_12F:
		ld	a, (byte_4)
		ld	(byte_9), a
		ret
; End of function sub_12F


; =============== S U B R O U T I N E =======================================


sub_136:
		ld	a, (byte_12FC)
		or	a
		ret	z
		ld	a, (byte_9)
		or	a
		ret	nz
		ld	a, (byte_12FD)
		or	a
		jr	nz, loc_173
		ld	hl, (word_1301)
		ld	e, (hl)
		inc	hl
		set	7, h
		ld	(word_1301), hl
		ld	a, 2Ah
		call	sub_2B4
		ld	hl, (word_12FF)
		dec	hl
		ld	(word_12FF), hl
		ld	a, h
		or	l
		jr	z, loc_161
		ret
; ---------------------------------------------------------------------------

loc_161:
		ld	hl, (word_1301)
		dec	hl
		ld	(word_1301), hl
		ld	a, 1
		ld	(byte_12FD), a
		ld	a, 0Ah
		ld	(word_12FF), a
		ret
; ---------------------------------------------------------------------------

loc_173:
		ld	hl, (word_1301)
		ld	e, (hl)
		ld	a, 2Ah
		call	sub_2B4
		ld	hl, word_12FF
		dec	(hl)
		jp	z, sub_22D
		ret
; End of function sub_136

; =============== S U B R O U T I N E =======================================

sub_184:
		push	af
		ld	a, 27h
		ld	e, 1Fh
		call	sub_2B4
		call	LoadUnknownBank
		call	sub_DF2
		call	LoadSamplesBank
		pop	af
		ret
; End of function sub_184

; =============== S U B R O U T I N E =======================================

sub_197:
		ld	a, (byte_12F0)
		ld	e, a
		ld	a, 26h
		call	sub_2B4
		ld	a, 27h
		ld	e, 2Fh
		call	sub_2B4
		call	LoadMusicBank
		call	sub_469
		jp	LoadSamplesBank
; End of function sub_197

; =============== S U B R O U T I N E =======================================

sub_1B0:
		ld	hl, (word_130B)
		ld	(word_130D), hl
		ld	a, 1
		ld	(byte_12FE), a
		ld	a, (byte_4)
		ld	hl, 00h				; Samples Offset
		cp	5
		jr	c, loc_1D3
		sub	5
		ld	hl, 00h				; Samples Offset
		cp	2
		jr	c, loc_1D3
		sub	2
		ld	hl, 00h				; Samples Offset

loc_1D3:
		ld	(word_130B), hl
		push	af
		call	LoadSamplesBank
		pop	af
		ld	l, a
		ld	h, 0
		ld	e, a
		ld	d, h
		add	hl, hl
		add	hl, de
		ld	de, 8000h
		add	hl, de
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		ld	a, (byte_5)
; End of function sub_1B0

; =============== S U B R O U T I N E =======================================

sub_1EE:
		ld	e, a
		ld	a, (byte_12FC)
		cp	(hl)
		jr	z, loc_204
		jr	c, loc_200
		ld	hl, (word_130D)
		ld	(word_130B), hl
		jp	LoadSamplesBank
; ---------------------------------------------------------------------------

loc_200:
		ld	a, (hl)
		ld	(byte_12FC), a

loc_204:
		ld	a, e
		call	sub_254
		ld	a, (byte_12FA)
		or	20h
		ld	(byte_12FA), a
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	(byte_130F), a
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(word_1301), hl
		ld	(word_12FF), de
		xor	a
		ld	(byte_12FD), a
		ld	a, 2Bh
		ld	e, 80h
		jp	sub_2B4
; End of function sub_1EE

; =============== S U B R O U T I N E =======================================

sub_22D:
		xor	a
		ld	(byte_12FC), a
		ld	e, a
		ld	a, 2Bh
		call	sub_2B4
		ld	hl, byte_12FA
		res	5, (hl)
		ld	hl, 4002h
		ld	(word_12F7), hl
		ld	a, (byte_12E2)
		ld	e, a
		ld	a, 0B6h
		call	sub_29D
		ld	a, 1
		ld	(byte_130F), a
		ret
; End of function sub_22D

; =============== S U B R O U T I N E =======================================

sub_251:
		ld	a, (byte_5)
; End of function sub_251

; =============== S U B R O U T I N E =======================================

sub_254:
		push	hl
		ld	hl, (word_12F7)
		push	hl
		ld	hl, 4002h
		ld	(word_12F7), hl
		rrca
		rrca
		and	0C0h
		ld	e, a
		ld	a, 0B6h
		call	sub_29D
		pop	hl
		ld	(word_12F7), hl
		pop	hl

locret_26E:
		ret
; End of function sub_254

; =============== S U B R O U T I N E =======================================

sub_26F:
		ld	a, l
		and	3
		ld	e, a
		ld	a, 25h
		call	sub_2B4
		dec	a
		srl	h
		rr	l
		srl	h
		rr	l
		ld	e, l
		jp	sub_2B4
; End of function sub_26F

; =============== S U B R O U T I N E =======================================

LoadBank:
		push	bc
		push	hl
		xor	a
		rl	l
		rla
		ld	(6000h), a
		ld	b, 8

loc_290:
		ld	a, h
		and	1
		ld	(6000h), a
		rr	h
		djnz	loc_290
		pop	hl
		pop	bc
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

sub_29D:
		push	af
		push	hl
		push	af
		ld	hl, (word_12F7)

loc_2A3:
		ld	a, (4000h)
		rlca
		jr	c, loc_2A3
		pop	af
		ld	(hl), a
		inc	hl
		nop
		nop
		nop
		ld	a, e
		ld	(hl), a
		pop	hl
		pop	af
		ret
; End of function sub_29D

; =============== S U B R O U T I N E =======================================

sub_2B4:
		push	af

loc_2B5:
		ld	a, (4000h)
		rlca
		jr	c, loc_2B5
		pop	af
		push	af
		ld	(4000h), a
		nop
		nop
		nop
		nop
		ld	a, e
		ld	(4001h), a
		pop	af
		ret
; End of function sub_2B4

; =============== S U B R O U T I N E =======================================

sub_2CA:
		ld	a, (byte_12FE)
		or	a
		call	z, sub_22D
		ld	a, 28h
		ld	e, 0
		call	sub_2B4
		inc	e
		call	sub_2B4
		inc	e
		call	sub_2B4
		inc	e
		inc	e
		call	sub_2B4
		inc	e
		call	sub_2B4
		inc	e
		call	sub_2B4
		push	hl
		ld	hl, 4000h
		call	sub_2FC
		ld	hl, 4002h
		call	sub_2FC
		pop	hl
		ret
; End of function sub_2CA

; =============== S U B R O U T I N E =======================================

sub_2FC:
		ld	(word_12F7), hl
		ld	a, 40h
		ld	e, 7Fh
		ld	c, 4

loc_305:
		ld	b, 3

loc_307:
		call	sub_29D
		inc	a
		djnz	loc_307
		inc	a
		dec	c
		jr	nz, loc_305
		ret
; End of function sub_2FC

; =============== S U B R O U T I N E =======================================

sub_312:
		call	LoadMusicBank
		ld	a, (byte_4)
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	de, MUSIC_BANK_Offset
		add	hl, de
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		or	a
		jr	nz, loc_32D
		dec	a

loc_32D:
		ld	(byte_8), a
		ld	a, b
		or	a
		jr	z, loc_33C
		ld	(byte_12EF), a
		ld	a, 1
		ld	(byte_12EE), a

loc_33C:
		ld	(byte_12ED), a
		xor	a
		ld	(byte_12EA), a
		ld	(word_12F1), hl
		ld	(byte_12F9), a
		ex	de, hl
		inc	de
		inc	de
		inc	de
		inc	de
		ld	ix, byte_1200
		ld	b, 6

loc_354:
		push	bc
		ld	bc, (word_12F1)
		call	sub_388
		jr	z, loc_367
		ld	a, (byte_12EA)
		inc	a
		ld	(byte_12EA), a
		ld	a, 0FFh

loc_367:
		ld	(ix+0),	a
		ld	(ix+1),	l
		ld	(ix+2),	h
		ld	bc, 27h
		add	ix, bc
		pop	bc
		djnz	loc_354
		ld	bc, (word_12F1)
		call	sub_388
		ld	(word_12F1), hl
		call	sub_392
		jp	LoadSamplesBank
; End of function sub_312

; =============== S U B R O U T I N E =======================================

sub_388:
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		inc	de
		or	l
		ret	z
		add	hl, bc
		ret
; End of function sub_388

; =============== S U B R O U T I N E =======================================

sub_392:
		ld	a, (byte_12EA)
		ld	(byte_12EB), a
		ld	a, 0C9h
		ld	(byte_12F0), a
		ld	hl, 4000h
		ld	(word_12F7), hl
		ld	b, 3
		ld	hl, byte_1200

loc_3A8:
		call	sub_3C5
		ld	a, 27h
		add	a, l
		ld	l, a
		djnz	loc_3A8
		push	hl
		ld	hl, 4002h
		ld	(word_12F7), hl
		pop	hl
		ld	b, 3

loc_3BB:
		call	sub_3C5
		ld	a, 27h
		add	a, l
		ld	l, a
		djnz	loc_3BB
		ret
; End of function sub_392

; =============== S U B R O U T I N E =======================================

sub_3C5:
		ld	a, (hl)
		or	a
		ret	z
		ld	a, 0B7h
		sub	b
		ld	e, 0C0h
		call	sub_29D
		push	bc
		push	hl
		ld	a, 0Ah
		add	a, l
		ld	l, a
		ld	a, (hl)
		inc	l
		ld	(byte_3FE), a
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		ld	(word_3FF), de
		pop	hl
		push	hl
		inc	l
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		inc	l
		ld	(hl), e
		inc	l
		ld	(hl), d
		inc	l
		ex	de, hl
		ld	hl, byte_3F9
		ld	bc, 22h
		ldir
		pop	hl
		pop	bc
		ret
; End of function sub_3C5
; ---------------------------------------------------------------------------

byte_3F9:
		db 1
		db 0
		db 1Eh
		db 0
		db 0Ch
byte_3FE:
		db 0FFh
word_3FF:
		dw 0
		db 0
		db 1
		db 0Eh
		db 4
		db 0Eh
		db 4
		db 4
		db 4
		db 0
		db 0
		db 0
		db 83h
		db 0Ch
		db 0Ch
		db 1
		db 1
		db 0FAh
		db 6
		db 0C0h
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0

; =============== S U B R O U T I N E =======================================

sub_41B:
		ld	a, (byte_12ED)
		or	a
		jr	nz, locret_437
		ld	a, (byte_4)
		ld	(byte_12EF), a
		ld	a, 0Fh
		ld	(byte_12ED), a
		ld	a, 1
		ld	(byte_12EE), a
		ld	(byte_12EC), a
		call	sub_22D

locret_437:
		ret
; End of function sub_41B
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_469

loc_438:
		ld	hl, 0
		ld	(word_1205), hl
		ld	(word_122C), hl
		ld	(word_1253), hl
		ld	(word_127A), hl
		ld	(word_12A1), hl
		ld	(word_12C8), hl
		ld	(word_120B), hl
		ld	(word_1232), hl
		ld	(word_1259), hl
		ld	(word_1280), hl
		ld	(word_12A7), hl
		ld	(word_12CE), hl
		xor	a
		ld	(byte_12ED), a
		ld	(byte_8), a
		jp	sub_2CA
; END OF FUNCTION CHUNK	FOR sub_469

; =============== S U B R O U T I N E =======================================

sub_469:
		ld	hl, 0
		ld	(word_1303), hl

loc_46F:
		ld	a, 1
		ld	(byte_12FB), a
		ld	hl, 4000h
		ld	(word_12F7), hl
		ld	b, 3
		ld	hl, word_1205

loc_47F:
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		dec	l
		ld	a, e
		or	d
		jp	z, loc_62F
		dec	de
		ld	a, e
		or	d
		jp	z, loc_6ED
		ld	(hl), e
		inc	l
		ld	(hl), d
		ld	a, 3

loc_493:
		add	a, l
		ld	l, a

loc_495:
		ld	e, (hl)
		bit	7, e
		jp	nz, loc_634
		ld	a, (byte_12ED)
		or	a
		jr	z, loc_4B3
		ex	af, af'
		xor	a
		ld	(word_1303+1), a
		ex	af, af'
		add	a, e
		add	a, 0F1h
		ld	e, a
		jp	p, loc_4BC
		ld	e, 0
		jp	loc_4BC
; ---------------------------------------------------------------------------

loc_4B3:
		ld	a, (word_1303+1)
		inc	a
		jr	z, loc_4F5
		ld	(word_1303+1), a

loc_4BC:
		ld	a, e
		and	0Fh
		inc	a
		add	a, a
		add	a, a
		neg
		add	a, 40h
		ld	e, a
		push	hl
		inc	l
		ld	c, (hl)
		inc	l
		ld	a, (hl)
		inc	l
		ld	h, (hl)
		ld	l, a
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		inc	hl
		ld	a, 43h
		sub	b
		rr	c
		call	c, sub_639
		inc	hl
		add	a, 4
		rr	c
		call	c, sub_639
		inc	hl
		add	a, 4
		rr	c
		call	c, sub_639
		inc	hl
		add	a, 4
		rr	c
		call	c, sub_639
		pop	hl

loc_4F5:
		ld	a, 6
		add	a, l
		ld	l, a
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		inc	l
		push	hl
		pop	ix
		ld	a, (ix+4)
		or	a
		jp	nz, loc_64A

loc_507:
		ld	(hl), e
		inc	l
		ld	(hl), d
		ld	a, 6
		add	a, l
		ld	l, a
		ld	a, (hl)
		or	a
		jp	m, loc_58F
		inc	l
		ld	a, (hl)
		dec	l
		or	a
		jp	nz, loc_58F
		push	de
		ld	c, l
		ld	a, 7
		add	a, l
		ld	l, a
		ld	e, (hl)
		ld	l, c
		ld	a, e
		and	3Fh
		jr	z, loc_52D
		ld	a, 0B7h
		sub	b
		call	sub_29D

loc_52D:
		pop	de
		ld	a, (word_12F7)
		or	a
		jp	nz, loc_58F
		ld	a, (hl)
		or	a
		jr	z, loc_58F
		ld	c, l

loc_53A:
		ld	a, 5
		add	a, l
		ld	l, a
		ld	a, (hl)
		ld	l, c
		neg
		jp	m, loc_578
		jr	z, loc_588
		push	af
		ld	a, d
		and	38h
		ld	c, a
		ld	a, d
		and	7
		ld	d, a
		pop	af
		push	hl
		ld	l, e
		ld	h, d
		call	sub_B6E
		ld	e, d
		ld	d, a
		add	hl, de
		ex	de, hl
		pop	hl

loc_55C:
		ld	a, d
		cp	8
		jr	c, loc_572
		srl	d
		rr	e
		ld	a, c
		add	a, 8
		ld	c, a
		cp	40h
		jr	c, loc_55C
		ld	de, 7FFh
		ld	c, 38h

loc_572:
		ld	a, d
		or	c
		ld	d, a
		jp	loc_588
; ---------------------------------------------------------------------------

loc_578:
		push	af
		ld	a, d
		and	38h
		ld	c, a
		ld	a, d
		and	7
		ld	d, a
		pop	af
		call	sub_B6E
		ld	e, d
		or	c
		ld	d, a

loc_588:
		xor	a
		ld	(word_1303), a
		jp	loc_598
; ---------------------------------------------------------------------------

loc_58F:
		ld	a, (word_1303)
		inc	a
		jr	nz, loc_5BA
		ld	(word_1303), a

loc_598:
		ld	a, e
		ld	e, d
		ld	d, a
		ld	a, 0A7h
		sub	b
		call	sub_29D
		add	a, 0FCh
		ld	e, d
		call	sub_29D
		ld	a, (word_12F7)
		or	a
		jr	z, loc_5AF
		ld	a, 4

loc_5AF:
		add	a, 3
		sub	b
		or	0F0h
		ld	e, a
		ld	a, 28h
		call	sub_2B4

loc_5BA:
		ld	a, 14h

loc_5BC:
		add	a, l
		ld	l, a
		ld	a, (byte_12FB)
		add	a, a
		ld	(byte_12FB), a
		dec	b
		jp	nz, loc_47F
		ld	a, (word_12F7)
		or	a
		jr	nz, loc_5D9
		ld	a, 2
		ld	(word_12F7), a
		ld	b, 3
		jp	loc_47F
; ---------------------------------------------------------------------------

loc_5D9:
		ld	hl, byte_1218
		ld	a, (hl)
		or	a
		call	p, sub_B81
		ld	hl, byte_123F
		ld	a, (hl)
		or	a
		call	p, sub_B81
		ld	hl, byte_1266
		ld	a, (hl)
		or	a
		call	p, sub_B81
		ld	hl, byte_128E
		ld	b, 3
		ld	a, (hl)
		or	a
		call	nz, sub_C47
		ld	hl, byte_12B5
		dec	b
		ld	a, (hl)
		or	a
		call	nz, sub_C47
		ld	hl, byte_12DC
		dec	b
		ld	a, (hl)
		or	a
		call	nz, sub_C47
		ld	a, (byte_12ED)
		or	a
		ret	z
		ld	hl, byte_12EE
		dec	(hl)
		ret	nz
		ld	a, (byte_12EF)
		ld	(hl), a
		dec	l
		ld	a, (byte_12EC)
		or	a
		jr	z, loc_627
		dec	(hl)
		jp	z, loc_438
		ret
; ---------------------------------------------------------------------------

loc_627:
		inc	(hl)
		ld	a, (hl)
		cp	10h
		ret	c
		ld	(hl), 0
		ret
; ---------------------------------------------------------------------------

loc_62F:
		ld	a, 27h
		jp	loc_5BC
; ---------------------------------------------------------------------------

loc_634:
		ld	a, 23h
		jp	loc_5BC
; End of function sub_469


; =============== S U B R O U T I N E =======================================


sub_639:
		push	de
		push	af
		ld	a, e
		add	a, (hl)
		cp	6Bh
		jr	c, loc_643
		ld	a, 6Ah

loc_643:
		ld	e, a
		pop	af
		call	sub_29D
		pop	de
		ret
; End of function sub_639

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_469

loc_64A:
		ld	a, 0FFh
		ld	(word_1303), a
		ld	(word_12F5), de
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		ld	a, d
		and	38h
		ld	(byte_1306), a
		ld	a, d
		and	7
		ld	d, a
		ld	a, 4
		add	a, l
		ld	l, a
		ld	c, (hl)
		ld	a, 0FBh
		add	a, l
		ld	l, a
		ld	a, c
		ex	af, af'
		ld	a, (byte_1306)
		ld	c, a
		ex	af, af'
		or	a
		jp	m, loc_6B2
		push	hl
		ld	l, e
		ld	h, d
		call	sub_B6E
		ld	e, d
		ld	d, a
		add	hl, de
		ex	de, hl

loc_67E:
		ld	hl, 48Dh
		or	a
		sbc	hl, de
		jr	nc, loc_697
		srl	d
		rr	e
		ld	a, c
		add	a, 8
		ld	c, a
		cp	40h
		jr	c, loc_67E
		ld	c, 38h
		ld	de, 7FFh

loc_697:
		ld	hl, (word_12F5)
		ld	a, h
		and	38h
		cp	c
		jr	z, loc_6A6
		pop	hl
		jr	c, loc_6E0
		jp	loc_6E7
; ---------------------------------------------------------------------------

loc_6A6:
		ld	a, h
		and	7
		ld	h, a
		sbc	hl, de
		pop	hl
		jr	c, loc_6E0
		jp	loc_6E7
; ---------------------------------------------------------------------------

loc_6B2:
		push	hl
		call	sub_B6E
		ld	e, d
		ld	d, a
		ld	hl, locret_26E
		or	a
		sbc	hl, de
		jr	c, loc_6C8
		sla	e
		rr	d
		ld	a, c
		sub	8
		ld	c, a

loc_6C8:
		ld	hl, (word_12F5)
		ld	a, h
		and	38h
		cp	c
		jr	z, loc_6D7
		pop	hl
		jr	c, loc_6E7
		jp	loc_6E0
; ---------------------------------------------------------------------------

loc_6D7:
		ld	a, h
		and	7
		ld	h, a
		sbc	hl, de
		pop	hl
		jr	c, loc_6E7

loc_6E0:
		ld	de, (word_12F5)
		jp	loc_507
; ---------------------------------------------------------------------------

loc_6E7:
		ld	a, d
		or	c
		ld	d, a
		jp	loc_507
; ---------------------------------------------------------------------------

loc_6ED:
		dec	l
		ld	d, (hl)
		dec	l
		ld	e, (hl)

loc_6F1:
		ld	a, (de)
		inc	de
		push	hl
		ld	hl, off_1118
		ld	c, a
		rrca
		rrca
		rrca
		and	1Eh
		add	a, l
		ld	l, a
		ld	a, (hl)
		inc	l
		ld	h, (hl)
		ld	l, a
		ld	a, c
		and	0Fh
		ld	c, a
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_469

; =============== S U B R O U T I N E =======================================


sub_708:
		pop	hl
		ld	a, c
		cp	0Fh
		jp	nz, loc_6F1
		inc	l
		inc	l
		ld	(hl), 0
		inc	l
		ld	(hl), 0
		ld	a, (word_12F7)
		or	a
		jr	z, loc_71E
		ld	a, 4

loc_71E:
		add	a, 3
		sub	b
		ld	e, a
		ld	a, 28h
		call	sub_2B4
		ld	a, 0FAh
		add	a, l
		ld	l, a
		ld	a, (hl)
		or	a
		jr	z, loc_734
		call	sub_739
		jr	loc_734
; ---------------------------------------------------------------------------

loc_734:
		ld	a, 2Ch
		jp	loc_5BC
; End of function sub_708


; =============== S U B R O U T I N E =======================================


sub_739:
		ld	a, (byte_12EB)
		dec	a
		ld	(byte_12EB), a
		ret	nz
		ld	a, (byte_8)
		cp	0FFh
		jr	z, loc_74D
		dec	a
		ld	(byte_8), a
		ret	z

loc_74D:
		pop	hl
		call	sub_392
		jp	loc_46F
; End of function sub_739


; =============== S U B R O U T I N E =======================================


sub_754:

; FUNCTION CHUNK AT 07AC SIZE 000000BE BYTES

		pop	hl
		ld	a, c
		cp	0Dh
		jr	nc, loc_769
		ld	(hl), e
		inc	l
		ld	(hl), d
		inc	l
		inc	l
		inc	l
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		dec	l
		dec	l
		dec	l
		jp	loc_7AC
; ---------------------------------------------------------------------------

loc_769:
		rrca
		rrca
		and	0C0h
		push	de
		ld	e, a
		ld	c, l
		ld	a, 1Ch
		add	a, l
		ld	l, a
		ld	a, (hl)
		and	3Fh
		or	e
		ld	e, a
		ld	(hl), e
		ld	l, c
		ld	a, 0B7h
		sub	b
		call	sub_29D
		pop	de
		jp	loc_6F1
; End of function sub_754

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_79B

loc_785:
		call	sub_78B
		jp	loc_6F1
; END OF FUNCTION CHUNK	FOR sub_79B

; =============== S U B R O U T I N E =======================================


sub_78B:
		ld	c, l
		ld	a, 4
		add	a, l
		ld	l, a
		ld	a, (word_12F3)
		ld	(hl), a
		inc	l
		ld	a, (word_12F3+1)
		ld	(hl), a
		ld	l, c
		ret
; End of function sub_78B


; =============== S U B R O U T I N E =======================================


sub_79B:

; FUNCTION CHUNK AT 0785 SIZE 00000006 BYTES

		call	sub_B57
		pop	hl
		ld	a, c
		cp	0Eh
		jr	z, loc_785
		ld	(hl), e
		inc	l
		ld	(hl), d
		inc	l
		ld	de, (word_12F3)
; End of function sub_79B

; START	OF FUNCTION CHUNK FOR sub_754

loc_7AC:
		ld	(hl), e
		inc	l
		ld	(hl), d
		inc	l
		inc	l
		inc	l
		bit	6, (hl)
		jr	nz, loc_7C7
		ld	a, (word_12F7)
		or	a
		jr	z, loc_7BE
		ld	a, 4

loc_7BE:
		add	a, 3
		sub	b
		ld	e, a
		ld	a, 28h
		call	sub_2B4

loc_7C7:
		push	hl
		pop	ix
		ld	a, (ix+16h)
		and	0C0h
		ld	e, a
		ld	a, 0B7h
		sub	b
		call	sub_29D
		dec	c
		jp	p, loc_7DF
		set	7, (hl)
		jp	loc_495
; ---------------------------------------------------------------------------

loc_7DF:
		res	7, (hl)
		ld	a, 4
		add	a, l
		ld	l, a
		ld	a, (hl)
		ld	(byte_1305), a
		ld	a, c
		add	a, a
		ld	de, word_1100
		add	a, e
		ld	e, a
		push	hl
		ex	de, hl
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		ld	a, (byte_1305)
		ld	l, a
		add	a, a
		ld	a, 0
		sbc	a, a
		ld	h, a
		add	hl, de
		ex	de, hl
		pop	hl
		ld	a, 6
		add	a, l
		ld	l, a
		ld	a, (hl)
		dec	a
		add	a, a
		add	a, a
		add	a, a
		or	d
		ld	d, a
		ld	a, 0FCh
		add	a, l
		ld	l, a
		push	de
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		inc	l
		ld	(hl), e
		inc	l
		ld	(hl), d
		dec	l
		dec	l
		pop	de
		ld	(hl), d
		dec	l
		ld	(hl), e
		dec	l
		ld	a, (hl)
		ld	(hl), c
		neg
		add	a, c
		ld	c, a
		ld	a, 7
		add	a, l
		ld	l, a
		ld	a, (hl)
		dec	l
		or	a
		jp	z, loc_857
		neg
		add	a, 10h
		sla	a
		ld	e, a
		dec	l
		ld	a, (hl)
		inc	l
		cp	(hl)
		ld	a, e
		jp	m, loc_847
		jr	nz, loc_84D
		inc	c
		dec	c
		jr	z, loc_84C
		jp	p, loc_84D

loc_847:
		neg
		jp	loc_84D
; ---------------------------------------------------------------------------

loc_84C:
		xor	a

loc_84D:
		inc	l
		inc	l
		ld	(hl), a
		ld	a, 0FDh
		add	a, l
		ld	l, a
		ld	a, (hl)
		inc	l
		ld	(hl), a

loc_857:
		ld	a, 6
		add	a, l
		ld	l, a
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ld	de, 0FFFFh
		ld	(word_1303), de
		ld	a, 0F0h
		jp	loc_493
; END OF FUNCTION CHUNK	FOR sub_754

; =============== S U B R O U T I N E =======================================


sub_86A:
		pop	hl
		call	sub_871
		jp	loc_6F1
; End of function sub_86A


; =============== S U B R O U T I N E =======================================


sub_871:
		ld	a, 10h
		add	a, l
		ld	l, a
		ld	a, c
		cp	8
		jr	c, loc_88F
		sub	0Ch
		jr	c, loc_87F
		inc	a

loc_87F:
		ld	c, (hl)
		dec	c
		add	a, c
		jp	m, loc_88E
		cp	8
		jr	c, loc_88F
		ld	a, 7
		jp	loc_88F
; ---------------------------------------------------------------------------

loc_88E:
		xor	a

loc_88F:
		inc	a
		ld	(hl), a
		ld	a, 0F0h
		add	a, l
		ld	l, a
		ret
; End of function sub_871


; =============== S U B R O U T I N E =======================================


sub_896:
		pop	hl
		ld	a, 6
		add	a, l
		ld	l, a
		ld	a, c
		sub	1
		jr	nc, loc_8A1
		xor	a

loc_8A1:
		ld	(hl), a
		ld	a, 0FAh
		add	a, l
		ld	l, a
		jp	loc_6F1
; End of function sub_896


; =============== S U B R O U T I N E =======================================


sub_8A9:
		ld	hl, loc_6F1
		ex	(sp), hl
		push	hl
		ld	hl, off_1138
		ld	a, c
		add	a, a
		add	a, l
		ld	l, a
		ld	a, (hl)
		inc	l
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; End of function sub_8A9

; =============== S U B R O U T I N E =======================================

sub_8BA:
		pop	hl
		ld	a, 0Ah
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	a, 0F6h
		add	a, l
		ld	l, a
		ret
; End of function sub_8BA

; =============== S U B R O U T I N E =======================================

sub_8C7:
		pop	hl
; End of function sub_8C7

; =============== S U B R O U T I N E =======================================

sub_8C8:
		ld	c, l
		ld	a, 12h
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	l, c
		ret
; End of function sub_8C8

; =============== S U B R O U T I N E =======================================

sub_8D2:
		pop	hl
		ld	a, (de)
		ld	c, a
		inc	de
		call	sub_991
		call	sub_91C
		call	sub_8C8
		inc	de
		ret
; End of function sub_8D2

; =============== S U B R O U T I N E =======================================

sub_8E1:
		pop	hl
		jp	sub_91C
; End of function sub_8E1

; =============== S U B R O U T I N E =======================================

sub_8E5:
		pop	hl
		ld	c, l
		ld	a, 6
		add	a, l
		ld	l, a
		set	6, (hl)
		ld	l, c
		ret
; End of function sub_8E5

; =============== S U B R O U T I N E =======================================

sub_8EF:
		pop	hl
		ld	c, l
		ld	a, 6
		add	a, l
		ld	l, a
		res	6, (hl)
		ld	l, c
		ret
; End of function sub_8EF

; =============== S U B R O U T I N E =======================================

sub_8F9:
		pop	hl
		ld	c, l
		ld	a, 15h
		add	a, l
		ld	l, a
		res	7, (hl)
		ld	l, c
		ret
; End of function sub_8F9

; =============== S U B R O U T I N E =======================================

sub_903:
		pop	hl
		ld	c, l
		ld	a, 15h
		add	a, l
		ld	l, a
		set	7, (hl)
		ld	l, c
		ret
; End of function sub_903

; =============== S U B R O U T I N E =======================================

sub_90D:
		pop	hl
		ret
; End of function sub_90D

; =============== S U B R O U T I N E =======================================

sub_90F:
		pop	hl
		ld	a, (de)
		inc	de
		cp	8
		jr	nc, loc_918
		ld	a, 0C9h

loc_918:
		ld	(byte_12F0), a
		ret
; End of function sub_90F

; =============== S U B R O U T I N E =======================================

sub_91C:
		ld	c, l
		ld	a, 15h
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	a, 4
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		dec	l
		dec	l
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	a, 4
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		inc	de
		inc	de
		ld	l, c
		ret
; End of function sub_91C

; =============== S U B R O U T I N E =======================================

sub_93B:
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		dec	de
		add	hl, de
		inc	de
		inc	de
		ld	(word_12F3), hl
		ld	hl, loc_957
		ex	(sp), hl
		ld	a, 8
		add	a, l
		ld	l, a
		push	de
		ld	de, (word_12F3)
		jp	loc_9B4
; End of function sub_93B
; ---------------------------------------------------------------------------

loc_957:
		ld	a, 0F9h
		add	a, l
		ld	l, a
		ret

; =============== S U B R O U T I N E =======================================

sub_95C:
		pop	hl
		ld	c, l
		ld	a, (de)
		inc	de
		push	de
		or	8
		ld	e, a
		ld	a, 22h
		call	sub_2B4
		pop	de
		ld	a, 17h
		add	a, l
		ld	l, a
		ld	a, (de)
		inc	de
		ld	(hl), a
		ld	a, 5
		add	a, l
		ld	l, a
		ld	a, 0C0h
		and	(hl)
		ld	(hl), a
		ld	a, (de)
		inc	de
		or	(hl)
		ld	(hl), a
		ld	l, c
		ret
; End of function sub_95C

; =============== S U B R O U T I N E =======================================

sub_97F:
		pop	hl
		ld	a, 8
		add	a, l
		ld	l, a
		inc	c
		inc	c
		inc	c
		call	sub_991
		ld	a, 0F9h
		add	a, l
		ld	l, a
		jp	loc_6F1
; End of function sub_97F

; =============== S U B R O U T I N E =======================================

sub_991:
		push	de
		ld	de, byte_1178
		ld	a, c
		cp	3
		jr	c, loc_9A0
		sub	3
		ld	de, (word_12F1)

loc_9A0:
		push	hl
		push	de
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	e, l
		ld	d, h
		add	hl, hl
		add	hl, de
		ld	e, a
		ld	d, 0
		add	hl, de
		pop	de
		add	hl, de
		ex	de, hl
		pop	hl

loc_9B4:
		push	hl
		ld	a, (hl)
		inc	l
		ld	h, (hl)
		ld	l, a
		or	a
		sbc	hl, de
		pop	hl
		jr	nz, loc_9C2
		dec	l
		pop	de
		ret
; ---------------------------------------------------------------------------

loc_9C2:
		ld	(hl), e
		inc	l
		ld	(hl), d
		dec	l
		dec	l
		ex	de, hl
		ld	c, e
		ld	e, (hl)
		inc	hl
		ld	a, 0B3h
		sub	b
		call	sub_29D
		ld	a, e
		ld	e, c
		push	de
		and	7
		ld	de, byte_1158
		add	a, e
		ld	e, a
		ld	a, (de)
		pop	de
		ld	(de), a
		push	de
		ld	d, a
		ld	a, 33h
		sub	b
		push	bc
		ld	b, 4

loc_9E6:
		ld	e, (hl)
		inc	hl
		call	sub_29D
		add	a, 4
		djnz	loc_9E6
		ld	b, 4

loc_9F1:
		ld	e, (hl)
		inc	hl
		rr	d
		jr	nc, loc_9F9
		ld	e, 6Bh

loc_9F9:
		call	sub_29D
		add	a, 4
		djnz	loc_9F1
		ld	b, 10h

loc_A02:
		ld	e, (hl)
		inc	hl
		call	sub_29D
		add	a, 4
		djnz	loc_A02
		pop	bc
		pop	hl
		pop	de
		ret
; End of function sub_991

; =============== S U B R O U T I N E =======================================

sub_A0F:
		ld	e, (hl)
		inc	hl
		ld	a, 0B0h
		add	a, b
		call	sub_29D
		ld	a, e
		and	7
		ld	de, byte_1158
		add	a, 58h
		ld	e, a
		ld	d, 11h
		ld	a, (de)
		ld	d, a
		ld	a, 30h
		add	a, b
		ld	b, 4

loc_A29:
		ld	e, (hl)
		inc	hl
		call	sub_29D
		add	a, 4
		djnz	loc_A29
		ld	b, 4

loc_A34:
		ld	e, (hl)
		inc	hl
		rr	d
		jr	nc, loc_A3C
		ld	e, 6Bh

loc_A3C:
		call	sub_29D
		add	a, 4
		djnz	loc_A34
		ld	b, 10h

loc_A45:
		ld	e, (hl)
		inc	hl
		call	sub_29D
		add	a, 4
		djnz	loc_A45
		ret
; End of function sub_A0F

; =============== S U B R O U T I N E =======================================

sub_A4F:
		ld	a, (de)
		inc	de
		push	bc
		push	de
		cp	10h
		jp	nc, loc_A90
		ld	l, a
		ld	h, 0
		ld	e, a
		ld	d, h
		add	hl, hl
		add	hl, de
		ld	de, 8000h
		add	hl, de
		ld	a, (byte_12ED)
		or	a
		jr	nz, loc_A8A
		push	hl
		ld	hl, (word_130B)
		ld	(word_130D), hl
		ld	hl, DAC_BANK_1		; Samples Offset - $F8000 in rom.
		ld	(word_130B), hl
		call	LoadSamplesBank
		pop	hl
		xor	a
		ld	(byte_12FE), a
		ld	a, (hl)
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ex	de, hl
		call	sub_1EE
		call	LoadMusicBank

loc_A8A:
		pop	de
		pop	bc
		pop	hl
		jp	loc_6F1
; ---------------------------------------------------------------------------

loc_A90:
		jr	$
; End of function sub_A4F

; =============== S U B R O U T I N E =======================================

sub_A92:
		pop	hl
		call	sub_A99
		jp	loc_6F1
; End of function sub_A92

; =============== S U B R O U T I N E =======================================

sub_A99:
		ld	a, 6
		add	a, l
		ld	l, a
		ld	a, c
		add	a, 0F8h
		jp	m, loc_AA4
		inc	a

loc_AA4:
		add	a, (hl)
		ld	(hl), a
		ld	a, 0FAh
		add	a, l
		ld	l, a
		ret
; End of function sub_A99

; =============== S U B R O U T I N E =======================================

sub_AAB:
		pop	hl
		call	sub_AB2
		jp	loc_6F1
; End of function sub_AAB

; =============== S U B R O U T I N E =======================================

sub_AB2:
		ld	a, 1Fh
		add	a, l
		ld	l, a
		ld	a, c
		or	a
		jr	z, loc_AD3
		dec	a
		jr	z, loc_ADA
		ld	c, a
		ld	a, (hl)
		or	a
		jr	nz, loc_AC3
		ld	(hl), c

loc_AC3:
		inc	l
		inc	l
		inc	l
		ld	(hl), e
		inc	l
		ld	(hl), d
		dec	l
		dec	l
		ld	d, (hl)
		dec	l
		ld	e, (hl)
		ld	a, 0E0h
		add	a, l
		ld	l, a
		ret
; ---------------------------------------------------------------------------

loc_AD3:
		inc	l
		ld	(hl), e
		inc	l
		ld	(hl), d
		jp	loc_AED
; ---------------------------------------------------------------------------

loc_ADA:
		inc	l
		inc	l
		inc	l
		ld	a, (hl)
		inc	l
		or	(hl)
		jr	z, loc_AFC
		ld	a, 0FCh
		add	a, l
		ld	l, a
		dec	(hl)
		jr	z, loc_AF6
		inc	l
		ld	e, (hl)
		inc	l
		ld	d, (hl)

loc_AED:
		inc	l
		ld	(hl), 0
		inc	l
		ld	(hl), 0
		jp	loc_AFC
; ---------------------------------------------------------------------------

loc_AF6:
		inc	l
		inc	l
		inc	l
		ld	e, (hl)
		inc	l
		ld	d, (hl)

loc_AFC:
		ld	a, 0DDh
		add	a, l
		ld	l, a
		ret
; End of function sub_AB2

; =============== S U B R O U T I N E =======================================

sub_B01:
		pop	hl
		dec	a
		jr	z, loc_B11
		dec	a
		jr	z, loc_B17
		dec	a
		jr	z, loc_B1D
		call	sub_B23
		jp	loc_6F1
; ---------------------------------------------------------------------------

loc_B11:
		call	sub_B3A
		jp	loc_6F1
; ---------------------------------------------------------------------------

loc_B17:
		call	sub_B46
		jp	loc_6F1
; ---------------------------------------------------------------------------

loc_B1D:
		call	sub_B50
		jp	loc_6F1
; End of function sub_B01

; =============== S U B R O U T I N E =======================================

sub_B23:
		ld	a, 1Dh
		add	a, l
		ld	l, a
		push	bc
		ld	a, (de)
		inc	de
		ld	c, a
		ld	a, (de)
		inc	de
		ld	b, a
		ld	(hl), e
		inc	l
		ld	(hl), d
		dec	de
		dec	de
		ex	de, hl
		add	hl, bc
		ex	de, hl
		pop	bc
		jp	loc_B41
; End of function sub_B23

; =============== S U B R O U T I N E =======================================

sub_B3A:
		ld	a, 1Dh
		add	a, l
		ld	l, a
		ld	e, (hl)
		inc	l
		ld	d, (hl)

loc_B41:
		ld	a, 0E2h
		add	a, l
		ld	l, a
		ret
; End of function sub_B3A

; =============== S U B R O U T I N E =======================================

sub_B46:
		push	hl
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		dec	hl
		add	hl, de
		ex	de, hl
		pop	hl
		ret
; End of function sub_B46

; =============== S U B R O U T I N E =======================================

sub_B50:
		dec	l
		ld	(hl), d
		dec	l
		ld	(hl), e
		inc	l
		inc	l
		ret
; End of function sub_B50

; =============== S U B R O U T I N E =======================================

sub_B57:
		ld	hl, 0

loc_B5A:
		ld	a, (de)
		inc	de
		cp	0FFh
		jr	nz, loc_B65
		inc	h
		dec	hl
		jp	loc_B5A
; ---------------------------------------------------------------------------

loc_B65:
		add	a, l
		ld	l, a
		jr	nc, loc_B6A
		inc	h

loc_B6A:
		ld	(word_12F3), hl
		ret
; End of function sub_B57

; =============== S U B R O U T I N E =======================================

sub_B6E:
		push	hl
		push	bc
		ld	bc, 800h
		ld	l, c
		ld	h, c

loc_B75:
		add	hl, hl
		adc	a, a
		jr	nc, loc_B7B
		add	hl, de
		adc	a, c

loc_B7B:
		djnz	loc_B75
		pop	bc
		ex	de, hl
		pop	hl
		ret
; End of function sub_B6E

; =============== S U B R O U T I N E =======================================

sub_B81:
		ld	c, a
		inc	l
		ld	a, (hl)
		or	a
		jr	z, loc_B9B
		dec	(hl)
		ret	nz
		ld	a, 5
		add	a, l
		ld	l, a
		ld	a, (hl)
		neg
		dec	l
		ld	(hl), a
		dec	l
		ld	a, (hl)
		dec	l
		ld	(hl), a
		inc	l
		inc	l
		jp	loc_B9F
; ---------------------------------------------------------------------------

loc_B9B:
		ld	a, 4
		add	a, l
		ld	l, a

loc_B9F:
		dec	c
		jr	z, loc_BAE
		dec	c
		jr	z, loc_BCA
		dec	c
		jr	z, loc_BDC
		dec	c
		jr	z, loc_C17
		jp	loc_C2F
; ---------------------------------------------------------------------------

loc_BAE:
		ld	d, (hl)
		dec	l
		ld	e, (hl)
		inc	l
		inc	l
		ld	c, (hl)
		dec	l
		ld	a, d
		sub	e
		jp	pe, loc_BC8
		ld	d, a
		add	a, 80h
		ld	e, a
		ld	a, c
		neg
		add	a, 80h
		cp	e
		jr	nc, loc_BC8
		ld	(hl), d
		ret
; ---------------------------------------------------------------------------

loc_BC8:
		ld	(hl), c
		ret
; ---------------------------------------------------------------------------

loc_BCA:
		dec	l
		dec	l
		dec	(hl)
		jr	z, loc_BD1
		dec	(hl)
		ret	nz

loc_BD1:
		inc	l
		inc	l
		ld	a, (hl)
		neg
		ld	(hl), a
		dec	l
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_BDC:
		dec	l
		ld	e, (hl)
		inc	l
		ld	d, (hl)
		inc	l
		ld	a, (hl)
		dec	l
		bit	7, e
		jr	nz, loc_BFE
		ld	c, a
		ld	a, d
		add	a, e
		cp	c
		jp	m, loc_BF9
		jp	pe, loc_BFC

loc_BF1:
		ld	a, e
		neg
		dec	l
		ld	(hl), a
		inc	l
		ld	(hl), c
		ret
; ---------------------------------------------------------------------------

loc_BF9:
		jp	pe, loc_BF1

loc_BFC:
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_BFE:
		neg
		ld	c, a
		ld	a, d
		add	a, e
		cp	c
		jp	m, loc_C12
		jp	po, loc_C15

loc_C0A:
		ld	a, e
		neg
		dec	l
		ld	(hl), a
		inc	l
		ld	(hl), c
		ret
; ---------------------------------------------------------------------------

loc_C12:
		jp	po, loc_C0A

loc_C15:
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_C17:
		dec	l
		dec	l
		dec	(hl)
		jr	z, loc_C1E
		dec	(hl)
		ret	nz

loc_C1E:
		ld	a, r
		inc	l
		inc	l
		inc	l
		ld	c, (hl)
		cp	c
		jr	c, loc_C28
		ld	a, c

loc_C28:
		dec	l
		ld	(hl), a
		dec	l
		ld	a, (hl)
		dec	l
		ld	(hl), a
		ret
; ---------------------------------------------------------------------------

loc_C2F:
		ld	d, (hl)
		dec	l
		ld	e, (hl)
		inc	l
		inc	l
		ld	c, (hl)
		dec	l
		ld	a, d
		add	a, e
		ld	d, a
		add	a, c
		ld	e, a
		ld	a, c
		add	a, a
		cp	e
		jr	c, loc_C42
		ld	(hl), d
		ret
; ---------------------------------------------------------------------------

loc_C42:
		ld	a, c
		neg
		ld	(hl), a
		ret
; End of function sub_B81

; =============== S U B R O U T I N E =======================================

sub_C47:
		dec	(hl)
		ret	nz
		ld	a, 6
		add	a, l
		ld	l, a
		ld	e, (hl)
		ld	a, 0B7h
		sub	b
		jp	sub_29D
; End of function sub_C47

; =============== S U B R O U T I N E =======================================

sub_C54:
		ld	a, (byte_8)
		ld	(byte_4), a
		ret
; End of function sub_C54

; =============== S U B R O U T I N E =======================================

sub_C5B:
		ld	a, 1
		ld	(byte_12F9), a
		call	sub_2CA
		ld	hl, 4000h
		call	sub_C73
		ld	hl, 4002h
		call	sub_C73
		call	sub_D66
		ret
; End of function sub_C5B

; =============== S U B R O U T I N E =======================================

sub_C73:
		ld	(word_12F7), hl
		ld	b, 3
		ld	e, 0
		ld	a, 0B6h

loc_C7C:
		call	sub_29D
		djnz	loc_C7C
		ret
; End of function sub_C73

; =============== S U B R O U T I N E =======================================

sub_C82:
		call	LoadMusicBank
		xor	a
		ld	(byte_12F9), a
		ld	hl, 4000h
		ld	a, (byte_121F)
		call	sub_CF2
		ld	a, (byte_1246)
		call	sub_CF2
		ld	a, (byte_126D)
		call	sub_CF2
		ld	hl, 4002h
		ld	a, (byte_1294)
		call	sub_CF2
		ld	a, (byte_12BB)
		call	sub_CF2
		ld	a, (byte_12E2)
		call	sub_CF2
		ld	hl, 4000h
		ld	(word_12F7), hl
		ld	b, 0
		ld	hl, (word_120B)
		call	sub_A0F
		ld	b, 1
		ld	hl, (word_1232)
		call	sub_A0F
		ld	b, 2
		ld	hl, (word_1259)
		call	sub_A0F
		ld	hl, 4002h
		ld	(word_12F7), hl
		ld	b, 0
		ld	hl, (word_1280)
		call	sub_A0F
		ld	b, 1
		ld	hl, (word_12A7)
		call	sub_A0F
		ld	b, 2
		ld	hl, (word_12CE)
		call	sub_A0F
		jp	LoadSamplesBank
; End of function sub_C82

; =============== S U B R O U T I N E =======================================

sub_CF2:
		ld	(word_12F7), hl
		ld	e, a
		ld	a, 0B6h
		jp	sub_29D
; End of function sub_CF2

; =============== S U B R O U T I N E =======================================

sub_CFB:
		call	LoadUnknownBank
		ld	a, (byte_4)
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		ld	de, 0E000h
		add	hl, de
		ld	a, (hl)
		inc	hl
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	b, 80h
		ld	ix, byte_105D
		ld	iy, byte_1076
		or	a
		jr	z, loc_D27
		ld	b, 0A0h
		ld	ix, byte_1076
		ld	iy, byte_105D

loc_D27:
		ld	a, (de)
		cp	(ix+0)
		ret	c
		ld	(ix+0),	a
		res	0, (ix+17h)
		set	0, (iy+17h)
		cp	(iy+0)
		jr	nc, loc_D44
		res	0, (iy+17h)
		set	0, (ix+17h)

loc_D44:
		ld	a, b
		ld	(byte_108F), a
		ld	l, e
		ld	h, d
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		add	hl, de
		ld	(ix+0Eh), l
		ld	(ix+0Fh), h
		inc	de
		inc	de
		inc	de
		ld	(ix+3),	e
		ld	(ix+4),	d
		call	sub_DA3
		call	LoadSamplesBank
		ret
; End of function sub_CFB

; =============== S U B R O U T I N E =======================================

sub_D66:
		ld	hl, byte_105D
		ld	de, byte_105E
		ld	bc, 31h
		ld	(hl), 0
		ldir
		ld	a, 1
		ld	(byte_1066), a
		ld	(byte_107F), a
		ld	a, 9Fh
		ld	(7F11h), a
		ld	a, 0BFh
		ld	(7F11h), a
		ld	a, 0DFh
		ld	(7F11h), a
		ld	a, 0FFh
		ld	(7F11h), a
		ret
; End of function sub_D66

; =============== S U B R O U T I N E =======================================

sub_D90:
		ld	a, l
		and	0Fh
		or	d
		ld	(7F11h), a
		ld	a, l
		and	0F0h
		or	h
		rrca
		rrca
		rrca
		rrca
		ld	(7F11h), a
		ret
; End of function sub_D90

; =============== S U B R O U T I N E =======================================

sub_DA3:
		ld	(ix+14h), 0
		ld	a, 0E7h
		ld	(7F11h), a
		ld	a, 0
		ld	(ix+18h), a
		ld	a, (byte_108F)
		or	10h
		ld	(7F11h), a

loc_DB9:
		ld	l, (ix+0Eh)
		ld	h, (ix+0Fh)
		ld	(ix+0Ch), l
		ld	(ix+0Dh), h
		ld	(ix+10h), l
		ld	(ix+11h), l
		ld	l, (ix+3)
		ld	h, (ix+4)
		ld	(ix+1),	l
		ld	(ix+2),	h
		ld	(ix+5),	l
		ld	(ix+6),	h
		xor	a
		ld	(ix+8),	a
		ld	(ix+7),	a
		ld	(ix+13h), a
		ld	(ix+12h), a
		ld	(ix+0Bh), a
		ld	(ix+9),	1
		ret
; End of function sub_DA3

; =============== S U B R O U T I N E =======================================

sub_DF2:
		ld	a, 80h
		ld	(byte_108F), a
		ld	ix, byte_105D
		ld	iy, byte_1076
		call	sub_E13
		ld	a, 0A0h
		ld	(byte_108F), a
		ld	ix, byte_1076
		ld	iy, byte_105D
		call	sub_E13
		ret
; End of function sub_DF2

; =============== S U B R O U T I N E =======================================

sub_E13:
		ld	a, (ix+0)
		or	a
		ret	z
		call	sub_F06
		ld	a, (ix+0Bh)
		or	a
		ret	nz
		ld	a, (ix+13h)
		or	a
		jr	z, loc_E2A
		dec	(ix+13h)
		ret	nz

loc_E2A:
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)

loc_E30:
		ld	a, (hl)
		inc	hl
		ld	(ix+0Ch), l
		ld	(ix+0Dh), h
		ld	c, a
		and	0E0h
		rra
		rra
		rra
		rra
		ld	e, a
		ld	d, 0
		ld	hl, loc_E4E
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, c
		and	1Fh
		jp	(hl)
; End of function sub_E13
; ---------------------------------------------------------------------------

loc_E4E:
		ld	e, (hl)
		ld	c, 83h
		ld	c, 88h
		ld	c, 9Fh
		ld	c, 12h
		nop
		cp	l
		ld	c, 0EEh
		ld	c, 2Ah
		ld	c, 6Fh
		ld	h, 0
		srl	h
		rr	l
		ld	(ix+15h), l
		ld	(ix+16h), h
		ld	(ix+14h), 1
		bit	0, (ix+17h)
		jr	nz, locret_E82
		ld	d, 0C0h
		call	sub_D90
		ld	a, (ix+18h)
		or	0F0h
		ld	(7F11h), a

locret_E82:
		ret
; ---------------------------------------------------------------------------
		inc	a
		ld	(ix+13h), a
		ret

; =============== S U B R O U T I N E =======================================


sub_E88:
		res	0, (iy+17h)
		ld	(ix+0Bh), 1
		ld	(ix+14h), 0

loc_E94:
		ld	a, 0FFh
		bit	0, (ix+17h)
		ret	nz
		ld	(7F11h), a
		ret
; End of function sub_E88

; ---------------------------------------------------------------------------
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		ld	(ix+0Eh), l
		ld	(ix+0Fh), h
		jp	loc_E2A
; ---------------------------------------------------------------------------
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		ld	(ix+10h), l
		ld	(ix+11h), h
		jp	loc_E2A
; ---------------------------------------------------------------------------
		ld	a, (ix+0Eh)
		or	a
		jr	nz, loc_ED6
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		ld	a, (hl)
		ld	(ix+12h), a
		ld	l, (ix+10h)
		ld	h, (ix+11h)
		jp	loc_E30
; ---------------------------------------------------------------------------

loc_ED6:
		dec	(ix+0Eh)
		jr	z, loc_EE4
		ld	l, (ix+10h)
		ld	h, (ix+11h)
		jp	loc_E30
; ---------------------------------------------------------------------------

loc_EE4:
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		inc	hl
		jp	loc_E30
; ---------------------------------------------------------------------------
		ld	l, (ix+0Ch)
		ld	h, (ix+0Dh)
		ld	a, (hl)
		ld	(ix+13h), a
		inc	hl
		ld	(ix+0Ch), l
		ld	(ix+0Dh), h
		ld	(ix+14h), 0
		jp	loc_E94

; =============== S U B R O U T I N E =======================================


sub_F06:
		ld	a, (ix+8)
		or	a
		jr	z, loc_F10
		dec	(ix+8)
		ret	nz

loc_F10:
		ld	l, (ix+1)
		ld	h, (ix+2)

loc_F16:
		ld	a, (hl)
		inc	hl
		ld	(ix+1),	l
		ld	(ix+2),	h
		ld	c, a
		and	0F0h
		rra
		rra
		rra
		ld	e, a
		ld	d, 0
		ld	hl, off_F33
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, c
		and	0Fh
		jp	(hl)
; End of function sub_F06

; ---------------------------------------------------------------------------
off_F33:	dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F53
		dw loc_F71
		dw loc_FA1
		dw loc_FA6
; ---------------------------------------------------------------------------

loc_F53:
		ld	l, c
		ld	h, 0
		ld	a, (ix+9)
		dec	a
		jr	z, loc_F62

loc_F5C:
		dec	a
		jr	z, loc_F62
		add	hl, hl
		jr	loc_F5C
; ---------------------------------------------------------------------------

loc_F62:
		ld	a, h
		cp	4
		jr	c, loc_F6A
		ld	hl, 3FFh

loc_F6A:
		ld	a, (byte_108F)
		ld	d, a
		jp	sub_D90
; ---------------------------------------------------------------------------

loc_F71:
		cpl
		and	0Fh
		ld	(ix+18h), a
		ld	e, a
		ld	a, (byte_108F)
		or	e
		or	10h
		ld	(7F11h), a
		ld	a, (ix+14h)
		or	a
		jr	z, loc_F9E
		bit	0, (ix+17h)
		jr	nz, loc_F9E
		ld	l, (ix+15h)
		ld	h, (ix+16h)
		ld	d, 0C0h
		call	sub_D90
		ld	a, e
		or	0F0h
		ld	(7F11h), a

loc_F9E:
		jp	loc_F10
; ---------------------------------------------------------------------------

loc_FA1:
		inc	a
		ld	(ix+8),	a
		ret
; ---------------------------------------------------------------------------

loc_FA6:
		ld	hl, off_FB3
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------
off_FB3:	dw loc_FD3
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FE4
		dw loc_FED
		dw loc_FF4
		dw loc_1003
		dw loc_1012
		dw loc_1043
		dw loc_F10
		dw loc_F10
; ---------------------------------------------------------------------------

loc_FD3:
		call	sub_E88
		xor	a
		ld	(ix+0),	a
		ld	a, (byte_108F)
		or	1Fh
		ld	(7F11h), a
		pop	af
		ret
; ---------------------------------------------------------------------------

loc_FE4:
		ld	a, c
		and	0Fh
		ld	(ix+9),	a
		jp	loc_F10
; ---------------------------------------------------------------------------

loc_FED:
		call	loc_DB9
		pop	af
		jp	sub_DF2
; ---------------------------------------------------------------------------

loc_FF4:
		ld	l, (ix+1)
		ld	h, (ix+2)
		ld	(ix+3),	l
		ld	(ix+4),	h
		jp	loc_F10
; ---------------------------------------------------------------------------

loc_1003:
		ld	l, (ix+1)
		ld	h, (ix+2)
		ld	(ix+5),	l
		ld	(ix+6),	h
		jp	loc_F10
; ---------------------------------------------------------------------------

loc_1012:
		ld	a, (ix+7)
		or	a
		jr	nz, loc_102B
		ld	l, (ix+1)
		ld	h, (ix+2)
		ld	a, (hl)
		ld	(ix+7),	a
		ld	l, (ix+5)
		ld	h, (ix+6)
		jp	loc_F16
; ---------------------------------------------------------------------------

loc_102B:
		dec	(ix+7)
		jr	z, loc_1039
		ld	l, (ix+5)
		ld	h, (ix+6)
		jp	loc_F16
; ---------------------------------------------------------------------------

loc_1039:
		ld	l, (ix+1)
		ld	h, (ix+2)
		inc	hl
		jp	loc_F16
; ---------------------------------------------------------------------------

loc_1043:
		ld	l, (ix+1)
		ld	h, (ix+2)
		ld	a, (hl)
		ld	(ix+8),	a
		inc	hl
		ld	(ix+1),	l
		ld	(ix+2),	h
		ld	a, (byte_108F)
		or	1Fh
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------
byte_105D:	db 0
byte_105E:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1066:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1076:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_107F:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_108F:	db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_1100:	dw 26Fh
		dw 28Eh
		dw 2B5h
		dw 2DEh
		dw 30Ah
		dw 338h
		dw 369h
		dw 39Dh
		dw 3D4h
		dw 40Eh
		dw 44Ch
		dw 48Dh
off_1118:	dw sub_754
		dw sub_79B
		dw sub_86A
		dw sub_896
		dw sub_8A9
		dw sub_97F
		dw sub_A4F
		dw sub_A92
		dw sub_90D
		dw sub_90D
		dw sub_90D
		dw sub_90D
		dw sub_90D
		dw sub_AAB
		dw sub_B01
		dw sub_708
off_1138:	dw sub_8BA
		dw sub_8C7
		dw sub_8E5
		dw sub_8EF
		dw sub_8D2
		dw sub_8E1
		dw sub_8F9
		dw sub_903
		dw sub_90D
		dw sub_90D
		dw sub_90D
		dw sub_90F
		dw sub_93B
		dw sub_95C
		dw sub_90D
		dw sub_90D
byte_1158:
		db 8
		db    8
		db    8
		db    8
		db  0Ch
		db  0Eh
		db  0Eh
		db  0Fh
		db  36h
		db  31h
		db  23h
		db  34h
		db  3Ch
		db  37h
		db  85h
		db  3Ah
		db    0
		db  3Eh
		db 0B0h
		db  41h
		db  98h
		db  45h
		db 0BBh
		db  49h
		db  1Eh
		db  4Eh
		db 0C2h
		db  52h
		db 0AEh
		db  57h
		db 0E5h
		db  5Ch
byte_1178:
		db 2Ch
		db  7Dh
		db    1
		db    1
		db    1
		db  20h
		db  11h
		db  10h
		db    4
		db  1Fh
		db  5Fh
		db  1Fh
		db  5Fh
		db  0Eh
		db  11h
		db  0Ch
		db  12h
		db  0Dh
		db    6
		db  0Ch
		db    5
		db  66h
		db  16h
		db  48h
		db  18h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1200:	ds 1
byte_1201:	ds 1
		ds 1
		ds 1
		ds 1
word_1205:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_120B:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1218:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_121F:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_122C:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_1232:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_123F:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1246:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_1253:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_1259:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1266:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_126D:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_127A:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_1280:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_128E:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1294:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_12A1:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_12A7:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12B5:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12BB:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
word_12C8:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
word_12CE:	ds 2
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12DC:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12E2:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_12EA:	ds 1
byte_12EB:	ds 1
byte_12EC:	ds 1
byte_12ED:	ds 1
byte_12EE:	ds 1
byte_12EF:	ds 1
byte_12F0:	ds 1
word_12F1:	ds 2
word_12F3:	ds 2
word_12F5:	ds 2
word_12F7:	ds 2
byte_12F9:	ds 1
byte_12FA:	ds 1
byte_12FB:	ds 1
byte_12FC:	ds 1
byte_12FD:	ds 1
byte_12FE:	ds 1
word_12FF:	ds 2
word_1301:	ds 2
word_1303:	ds 2
byte_1305:	ds 1
byte_1306:	ds 1
word_1307:	ds 2
word_1309:	ds 2
word_130B:	ds 2
word_130D:	ds 2
byte_130F:	ds 1

	restore

	!align $1800

		binclude "Z80 Driver/Music/Music.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
