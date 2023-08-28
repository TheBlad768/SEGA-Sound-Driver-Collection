; ---------------------------------------------------------------------------
; Terpsichorean Sound Driver
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

start:
		!org	0
		CPU Z80
		listing on
		di
		di
		di
		im	1
		ld	sp, byte_1FFE
		call	sub_39C

loc_B:
		rst	18h
		rst	38h
		ld	a, (byte_444)
		or	a
		call	nz, sub_305
		jr	loc_B
; End of function start
; ---------------------------------------------------------------------------
		dw 0

; =============== S U B R O U T I N E =======================================

sub_18:
		ex	af, af'
		ld	a, (4000h)
		rrca
		rrca
		jr	nc, loc_36
		ld	a, (byte_444)
		inc	a
		ld	(byte_444), a
		ld	a, 27h
		ld	(4000h), a
		ld	a, (byte_C98)
		rrca
		rrca
		or	2Fh
		ld	(4001h), a

loc_36:
		ex	af, af'
		ret
; End of function sub_18

; =============== S U B R O U T I N E =======================================

zVInt:
		ret
; End of function zVInt
; ---------------------------------------------------------------------------
		ex	af, af'
		ld	a, (4000h)
		rrca
		jr	nc, loc_60
		ld	a, 27h
		ld	(4000h), a
		ld	a, (byte_C98)
		rrca
		rrca
		or	1Fh
		ld	(4001h), a
		exx
		ld	a, 2Ah
		ld	(4000h), a
		ld	a, (hl)
		inc	hl
		dec	de
		ld	(4001h), a
		ld	a, d
		or	e
		jr	z, loc_62

loc_5F:
		exx

loc_60:
		ex	af, af'
		ret
; ---------------------------------------------------------------------------

loc_62:
		ld	a, 0C9h
		ld	(zVInt), a
		xor	a
		ld	(byte_1143), a
		ld	hl, (word_E74)
		ld	b, h
		ld	c, l
		call	sub_EC5
		ld	bc, 2B00h
		call	sub_EB5
		jp	loc_5F
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_104:	db 0
byte_105:	db 0
byte_106:	db 0
byte_107:	db 0
byte_108:	db 0
byte_109:	db 0
byte_10A:	db 0
byte_10B:	db 0
byte_10C:	db 0
byte_10D:	db 0
byte_10E:	db 0
		db 0
byte_110:	db 0
word_111:	dw 3C00h
off_113:	dw loc_368
		dw loc_316
		dw loc_32E
		dw loc_33A
		dw loc_33F
		dw loc_353
word_11F:	dw 2D5Fh
		dw 272Ah
		dw 2224h
		dw 1C1Fh
		dw 171Ah
		dw 1214h
		dw 0C0Fh
		dw 70Ah
		dw 204h
off_131:	dw sub_1075		; 0
		dw sub_109E		; 1
		dw sub_10B9		; 2
		dw sub_10F0		; 3
		dw sub_10FF		; 4
		dw sub_110E		; 5
		dw sub_1116		; 6
		dw sub_1127		; 7
byte_141:	db 0
		db 0
		db 0
byte_144:	db 0
		db 0
byte_146:	db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
off_14D:	dw loc_4AE
		dw sub_49F
		dw loc_4AE
off_153:	dw sub_652
		dw sub_6D0
		dw sub_71F		; Play Sample?
off_159:	dw sub_5AA
		dw loc_5B3
		dw sub_5BC
		dw sub_5C1
off_161:	dw sub_8BE
		dw nullsub_2
		dw nullsub_2
word_167:	dw 101h
		dw 101h
		dw 302h
		dw 403h
off_16F:	dw sub_A81		; 0
		dw sub_85A		; 1
		dw sub_906		; 2
		dw sub_8AB		; 3
		dw sub_8F3		; 4
		dw sub_8F9		; 5
		dw sub_8FF		; 6
		dw sub_92B		; 7
		dw sub_945		; 8
		dw sub_956		; 9
		dw sub_967		; 0Ah
		dw sub_983		; 0Bh
		dw sub_989		; 0Ch
		dw sub_98F		; 0Dh
		dw sub_998		; 0Eh
		dw sub_9AF		; 0Fh
		dw sub_9C7		; 10h
		dw sub_9CF		; 11h
		dw sub_9E9		; 12h
		dw sub_9F3		; 13h
		dw sub_A0A		; 14h
		dw sub_A1D		; 15h
		dw sub_A43		; 16h
		dw sub_A5D		; 17h
		dw sub_A77		; 18h
		dw sub_A7C		; 19h
		dw sub_A87		; 1Ah
		dw sub_AA1		; 1Bh
		dw sub_AA5		; 1Ch
		dw sub_AA9		; 1Dh
		dw sub_8AB		; 1Eh
		dw sub_AAF		; 1Fh
		dw 284h
		dw 2ABh
		dw 2D3h
		dw 2FEh
		dw 32Dh
		dw 35Ch
		dw 38Fh
		dw 3C5h
		dw 3FFh
		dw 43Ch
		dw 47Ch
		dw 4C0h
		dw 0A84h
		dw 0AABh
		dw 0AD3h
		dw 0AFEh
		dw 0B2Dh
		dw 0B5Ch
		dw 0B8Fh
		dw 0BC5h
		dw 0BFFh
		dw 0C3Ch
		dw 0C7Ch
		dw 0CC0h
		dw 1284h
		dw 12ABh
		dw 12D3h
		dw 12FEh
		dw 132Dh
		dw 135Ch
		dw 138Fh
		dw 13C5h
		dw 13FFh
		dw 143Ch
		dw 147Ch
		dw 14C0h
		dw 1A84h
		dw 1AABh
		dw 1AD3h
		dw 1AFEh
		dw 1B2Dh
		dw 1B5Ch
		dw 1B8Fh
		dw 1BC5h
		dw 1BFFh
		dw 1C3Ch
		dw 1C7Ch
		dw 1CC0h
		dw 2284h
		dw 22ABh
		dw 22D3h
		dw 22FEh
		dw 232Dh
		dw 235Ch
		dw 238Fh
		dw 23C5h
		dw 23FFh
		dw 243Ch
		dw 247Ch
		dw 24C0h
		dw 2A84h
		dw 2AABh
		dw 2AD3h
		dw 2AFEh
		dw 2B2Dh
		dw 2B5Ch
		dw 2B8Fh
		dw 2BC5h
		dw 2BFFh
		dw 2C3Ch
		dw 2C7Ch
		dw 2CC0h
		dw 3284h
		dw 32ABh
		dw 32D3h
		dw 32FEh
		dw 332Dh
		dw 335Ch
		dw 338Fh
		dw 33C5h
		dw 33FFh
		dw 343Ch
		dw 347Ch
		dw 34C0h
		dw 3A84h
		dw 3AABh
		dw 3AD3h
		dw 3AFEh
		dw 3B2Dh
		dw 3B5Ch
		dw 3B8Fh
		dw 3BC5h
		dw 3BFFh
		dw 3C3Ch
		dw 3C7Ch
		dw 3CC0h
		dw 3F7h
		dw 3BEh
		dw 388h
		dw 356h
		dw 326h
		dw 2F9h
		dw 2CEh
		dw 2A5h
		dw 280h
		dw 25Ch
		dw 23Ah
		dw 21Ah
		dw 1FBh
		dw 1DFh
		dw 1C4h
		dw 1ABh
		dw 193h
		dw 17Dh
		dw 167h
		dw 153h
		dw 140h
		dw 12Eh
		dw 11Dh
		dw 10Dh
		dw 0FEh
		dw 0EFh
		dw 0E2h
		dw 0D6h
		dw 0C9h
		dw 0BEh
		dw 0B4h
		dw 0A9h
		dw 0A0h
		dw 97h
		dw 8Fh
		dw 87h
		dw 7Fh
		dw 78h
		dw 71h
		dw 6Bh
		dw 65h
		dw 5Fh
		dw 5Ah
		dw 55h
		dw 50h
		dw 4Bh
		dw 47h
		dw 43h
		dw 40h
		dw 3Ch
		dw 39h
		dw 36h
		dw 33h
		dw 30h
		dw 2Dh
		dw 2Bh
		dw 28h
		dw 26h
		dw 24h
		dw 22h
		dw 20h
		dw 1Fh
		dw 1Dh
		dw 1Bh
		dw 1Ah
		dw 18h
		dw 17h
		dw 16h
		dw 15h
		dw 13h
		dw 12h
		dw 11h
		dw 10h
		dw 0Fh
		dw 0Eh

; =============== S U B R O U T I N E =======================================


sub_305:
		ld	a, (byte_108)
		cp	6
		jr	nc, loc_364
		add	a, a
		add	a, 13h
		ld	(loc_312+1), a

loc_312:
		ld	hl, (off_113)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_316:
		ld	a, (byte_109)
		or	a
		jr	z, loc_364
		ld	a, (byte_B6D)
		or	a
		jr	nz, loc_364
		ld	a, 1
		ld	(byte_B6D), a
		ld	a, 0Ch
		ld	(byte_B6E), a
		jr	loc_364
; ---------------------------------------------------------------------------

loc_32E:
		ld	a, (byte_109)
		or	a
		call	nz, sub_B45
		call	sub_AC6
		jr	loc_364
; ---------------------------------------------------------------------------

loc_33A:
		call	sub_B45
		jr	loc_364
; ---------------------------------------------------------------------------

loc_33F:
		ld	a, (byte_109)
		cp	0FFh
		jr	z, loc_364
		or	a
		jr	z, loc_364
		ld	a, 0FFh
		ld	(byte_109), a
		call	sub_3DD
		jr	loc_364
; ---------------------------------------------------------------------------

loc_353:
		ld	a, (byte_109)
		cp	0FFh
		jr	nz, loc_364
		call	sub_3EB
		ld	a, 1
		ld	(byte_109), a
		jr	loc_364
; ---------------------------------------------------------------------------

loc_364:
		xor	a
		ld	(byte_108), a

loc_368:
		ld	a, (byte_109)
		cp	0FFh
		ret	z

loc_36E:
		ld	hl, byte_443
		ld	b, 6

loc_373:
		inc	(hl)
		jr	z, loc_37A
		djnz	loc_373
		jr	loc_385
; ---------------------------------------------------------------------------

loc_37A:
		ld	(hl), 0
		push	hl
		push	bc
		call	sub_445
		pop	bc
		pop	hl
		djnz	loc_373

loc_385:
		ld	hl, byte_442
		inc	(hl)
		jr	nz, loc_390
		ld	(hl), 0FCh
		call	sub_F0D

loc_390:
		ld	a, (byte_444)
		or	a
		ret	z
		dec	a
		ld	(byte_444), a
		jp	loc_36E
; End of function sub_305


; =============== S U B R O U T I N E =======================================


sub_39C:
		ex	af, af'
		exx
		xor	a
		ld	b, a
		ld	c, a
		ld	d, a
		ld	e, a
		ld	h, a
		ld	l, a
		exx
		ex	af, af'
		ld	bc, 2B00h
		call	sub_EB5
		call	LoadBank
		ld	a, (8000h)
		dec	a
		ld	(word_111), a
		ld	a, 0Fh
		call	LoadBank2
		ld	a, (8000h)
		ld	(byte_110), a
		call	sub_B45
		ld	bc, 2983h
		call	sub_EB5
		ld	bc, 26F6h
		call	sub_EB5
		ld	bc, 272Fh
		call	sub_EB5
		ld	a, 0FFh
		ld	(7F11h), a
		ret
; End of function sub_39C

; =============== S U B R O U T I N E =======================================

sub_3DD:
		ld	a, 0
		ld	(byte_441), a
		call	sub_3F4
		ld	a, 0FFh
		ld	(7F11h), a
		ret
; End of function sub_3DD

; =============== S U B R O U T I N E =======================================

sub_3EB:
		ld	a, 1
		ld	(byte_441), a
		call	sub_3F4
		ret
; End of function sub_3EB


; =============== S U B R O U T I N E =======================================


sub_3F4:
		xor	a
		ld	(byte_B6B), a
		ld	hl, word_B70

loc_3FB:
		call	sub_7E0
		ex	de, hl
		ld	a, (ix+0)

loc_402:
		cp	7
		call	z, sub_EDF
		ld	a, (iy+0)
		or	a
		jr	nz, loc_41A
		ld	a, (byte_441)
		ld	c, a
		or	a
		jr	z, loc_417
		ld	c, (ix+23h)

loc_417:
		call	sub_8BE

loc_41A:
		ld	a, (iy+0)
		dec	a
		jr	nz, loc_42C
		ld	a, (byte_441)
		or	a
		jr	z, loc_429
		ld	a, (ix+2Bh)

loc_429:
		call	loc_E7A

loc_42C:
		ld	a, (ix+0)
		cp	9
		call	z, sub_ED4
		ex	de, hl
		ld	a, (byte_B6B)
		inc	a
		ld	(byte_B6B), a
		cp	0Ah
		jr	nz, loc_3FB
		ret
; End of function sub_3F4

; ---------------------------------------------------------------------------
byte_441:	db 0
byte_442:	db 0
byte_443:	db 0
byte_444:	db 0

; =============== S U B R O U T I N E =======================================


sub_445:
		xor	a
		ld	(byte_B6B), a
		ld	hl, word_B70
		ld	(word_B69), hl
		ld	a, (byte_B6D)
		or	a
		jr	z, loc_466
		ld	hl, byte_B6E
		dec	(hl)
		jr	nz, loc_466
		ld	(hl), 0Ch
		inc	a
		cp	0Eh
		jp	z, sub_B45
		ld	(byte_B6D), a
; End of function sub_445

; START	OF FUNCTION CHUNK FOR sub_652

loc_466:
		rst	18h
		rst	38h
		ld	hl, (word_B69)
		call	sub_7E0
		ld	(word_B69), hl
		ld	a, (byte_B6B)
		cp	7
		call	z, sub_EDF
		ld	a, (byte_B6B)
		ld	b, 0
		ld	c, a
		ld	hl, byte_141
		add	hl, bc
		ld	a, (hl)
		or	a
		jr	z, loc_4AE
		and	0FEh
		jr	nz, loc_490
		call	sub_EFE
		jr	loc_4AE
; ---------------------------------------------------------------------------

loc_490:
		ld	(hl), 0
		ld	a, (iy+0)
		add	a, a
		add	a, 4Dh
		ld	(loc_49B+1), a

loc_49B:
		ld	hl, (off_14D)
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_652

; =============== S U B R O U T I N E =======================================


sub_49F:
		ld	l, (ix+29h)
		ld	h, (ix+2Ah)
		call	sub_E88
		ld	a, (ix+2Bh)
		call	loc_E7A
; End of function sub_49F

; START	OF FUNCTION CHUNK FOR sub_652

loc_4AE:
		rst	18h
		rst	38h
		ld	a, (iy+0)
		dec	a
		jr	z, loc_4CA
		ld	a, (byte_B6D)
		or	a
		jr	z, loc_4CA
		ld	a, (byte_B6E)
		dec	a
		ld	hl, byte_B6B
		cp	(hl)
		ld	a, (ix+23h)
		call	z, sub_8B0

loc_4CA:
		dec	(ix+2)
		jp	nz, loc_4FC
		ld	e, (ix+3)
		ld	d, (ix+4)

loc_4D6:
		ld	a, (de)
		cp	0FFh
		jp	z, sub_B45
		bit	7, a
		jr	nz, loc_4EF
		inc	de
		ld	hl, loc_4D6
		push	hl
		add	a, a
		add	a, 6Fh
		ld	(loc_4EB+1), a

loc_4EB:
		ld	hl, (off_16F)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_4EF:
		ld	a, (iy+0)
		add	a, a
		add	a, 53h
		ld	(loc_4F8+1), a

loc_4F8:
		ld	hl, (off_153)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_4FC:
		rst	18h
		rst	38h
		ld	a, (iy+0)
		cp	2
		jp	nc, loc_62C
		bit	4, (ix+1)
		jr	nz, loc_527
		ld	a, (ix+2)
		cp	(ix+28h)
		jr	nz, loc_527
		ld	a, (iy+0)
		or	a
		jr	nz, loc_524
		ld	b, 28h
		ld	c, (ix+47h)
		call	sub_EB4
		jr	loc_527
; ---------------------------------------------------------------------------

loc_524:
		call	sub_7BF

loc_527:
		xor	a
		ld	(byte_B6F), a
		ld	a, (ix+2Eh)
		or	a
		jr	z, loc_578
		ld	a, (ix+37h)
		or	a
		jr	z, loc_53C
		dec	(ix+37h)
		jr	loc_578
; ---------------------------------------------------------------------------

loc_53C:
		dec	(ix+33h)
		jr	nz, loc_578
		ld	a, (ix+2Eh)
		ld	(ix+33h), a
		ld	(byte_B6F), a
		ld	l, (ix+2Ch)
		ld	h, (ix+2Dh)
		ld	e, (ix+34h)
		ld	d, (ix+35h)
		add	hl, de
		ld	(ix+2Ch), l
		ld	(ix+2Dh), h
		dec	(ix+36h)
		jr	nz, loc_578
		ld	a, (ix+31h)
		add	a, a
		ld	(ix+36h), a
		ld	a, (ix+35h)
		cpl
		ld	(ix+35h), a
		ld	a, (ix+34h)
		neg
		ld	(ix+34h), a

loc_578:
		rst	18h
		rst	38h
		bit	0, (ix+38h)
		jr	z, loc_5DE
		ld	a, (ix+40h)
		or	a
		jr	z, loc_58B
		dec	(ix+40h)
		jr	loc_5DE
; ---------------------------------------------------------------------------

loc_58B:
		ld	l, (ix+3Eh)
		ld	h, (ix+3Fh)

loc_591:
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ex	de, hl
		ld	a, 0F8h
		and	b
		cp	80h
		jr	nz, loc_5C6
		ld	a, b
		add	a, a
		add	a, 59h
		ld	(loc_5A4+1), a

loc_5A4:
		ld	hl, (off_159)
		jp	(hl)
; END OF FUNCTION CHUNK	FOR sub_652
; ---------------------------------------------------------------------------
		db 0DFh
		db 0FFh

; =============== S U B R O U T I N E =======================================


sub_5AA:
		ex	de, hl
		ld	(ix+39h), l
		ld	(ix+3Ah), h
		jr	loc_591
; End of function sub_5AA

; ---------------------------------------------------------------------------

loc_5B3:
		ex	de, hl
		ld	l, (ix+39h)
		ld	h, (ix+3Ah)
		jr	loc_591

; =============== S U B R O U T I N E =======================================


sub_5BC:
		ld	(ix+40h), c
		jr	loc_5D8
; End of function sub_5BC


; =============== S U B R O U T I N E =======================================


sub_5C1:
		inc	(ix+38h)
		jr	loc_5D8
; End of function sub_5C1

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_652

loc_5C6:
		ld	l, (ix+2Ch)
		ld	h, (ix+2Dh)
		add	hl, bc
		ld	(ix+2Ch), l
		ld	(ix+2Dh), h
		ld	a, 1
		ld	(byte_B6F), a

loc_5D8:
		ld	(ix+3Eh), e
		ld	(ix+3Fh), d

loc_5DE:
		ld	a, (byte_B6F)
		or	a
		jr	z, loc_5F9
		ld	e, (ix+29h)
		ld	d, (ix+2Ah)
		add	hl, de
		ld	de, loc_5F9
		push	de
		ld	a, (iy+0)
		or	a
		jp	z, sub_767
		jp	sub_776
; ---------------------------------------------------------------------------

loc_5F9:
		ld	a, (iy+0)
		or	a
		jr	z, loc_62C
		bit	0, (ix+41h)
		jr	z, loc_62C
		dec	(ix+48h)
		jr	nz, loc_62C
		ld	e, (ix+46h)
		ld	d, (ix+47h)
		ld	a, (de)
		inc	de
		cp	0FFh
		jr	nz, loc_61B
		inc	(ix+41h)
		jr	loc_62C
; ---------------------------------------------------------------------------

loc_61B:
		call	sub_802
		call	sub_E76
		ld	a, (de)
		inc	de
		ld	(ix+48h), a
		ld	(ix+46h), e
		ld	(ix+47h), d

loc_62C:
		rst	18h
		rst	38h

loc_62E:
		ld	a, (byte_B6B)
		cp	9
		call	z, sub_ED4
		call	sub_EF0
		ld	a, (byte_B6B)
		inc	a
		ld	(byte_B6B), a
		cp	0Ah
		jp	nz, loc_466
		ld	a, (byte_104)
		xor	0FFh
		and	60h
		cp	20h
		jp	z, sub_445
		ret

; =============== S U B R O U T I N E =======================================

sub_652:
		ld	a, (ix+45h)
		or	a
		jr	z, loc_69A
		cp	4
		jr	z, loc_696
		ld	a, (de)
		inc	de
		and	0Fh
		jr	z, loc_68A
		push	de
		add	a, a
		inc	a
		ld	b, 0
		ld	c, a
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		add	hl, bc
		ex	de, hl
		ld	a, (ix+45h)
		add	a, a
		ld	b, 0
		ld	c, a
		ld	hl,  loc_68D+1
		add	hl, bc
		ld	a, (de)
		ld	b, (hl)
		ld	c, a
		call	sub_EA3
		inc	hl
		dec	de
		ld	a, (de)
		ld	b, (hl)
		ld	c, a
		call	sub_EA3
		pop	de

loc_68A:
		inc	(ix+45h)

loc_68D:
		jp	loc_4D6
; ---------------------------------------------------------------------------
		db 0ADh, 0A9h, 0AEh, 0AAh, 0ACh, 0A8h
; ---------------------------------------------------------------------------

loc_696:
		ld	(ix+45h), 1

loc_69A:
		ld	a, (ix+1)
		ld	(byte_B6F), a
		ld	b, 28h
		ld	c, (ix+47h)
		bit	4, a
		call	z, sub_EB4
		call	sub_732
		ld	a, b
		and	0Fh
		or	a
		jp	z, loc_4FC
		call	sub_74B
		call	sub_767
		ld	a, (byte_B6F)
		bit	4, a
		jp	nz, loc_4FC
		ld	b, 28h
		ld	c, (ix+46h)
		call	sub_EB4
		call	sub_779
		jp	loc_4FC
; End of function sub_652


; =============== S U B R O U T I N E =======================================


sub_6D0:
		ld	a, (ix+1)
		ld	(byte_B6F), a
		call	sub_732
		ld	a, b
		and	0Fh
		or	a
		jr	nz, loc_6E5
		call	sub_7BF
		jp	loc_4FC
; ---------------------------------------------------------------------------

loc_6E5:
		call	sub_74B
		call	sub_776
		ld	a, (byte_B6F)
		bit	4, a
		jp	nz, loc_4FC
		call	sub_779
		ld	a, (ix+41h)
		or	a
		jr	z, loc_713
		ld	l, (ix+42h)
		ld	h, (ix+43h)
		ld	(ix+46h), l
		ld	(ix+47h), h
		ld	(ix+41h), 1
		ld	(ix+48h), 1
		jp	loc_4FC
; ---------------------------------------------------------------------------

loc_713:
		ld	a, (ix+23h)
		call	loc_809
		call	sub_E76
		jp	loc_4FC
; End of function sub_6D0

; =============== S U B R O U T I N E =======================================

sub_71F:
		call	sub_732
		ld	a, (byte_E71)
		or	a
		jp	z, loc_62E
		ld	a, b
		and	1Fh
		ld	(byte_E72), a
		jp	loc_62E
; End of function sub_71F

; =============== S U B R O U T I N E =======================================

sub_732:
		ld	a, (de)
		inc	de
		ld	b, a
		ld	(ix+1),	a
		ld	a, (ix+22h)
		bit	5, b
		jr	z, loc_741
		ld	a, (de)
		inc	de

loc_741:
		ld	(ix+2),	a
		ld	(ix+3),	e
		ld	(ix+4),	d
		ret
; End of function sub_732


; =============== S U B R O U T I N E =======================================


sub_74B:
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		add	a, a
		ld	e, a
		ld	d, 0
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	l, (ix+26h)
		ld	h, (ix+27h)
		add	hl, de
		ld	(ix+29h), l
		ld	(ix+2Ah), h
		ret
; End of function sub_74B


; =============== S U B R O U T I N E =======================================


sub_767:
		ld	b, (iy+3)
		ld	c, h
		call	sub_EA3
		ld	a, 0FCh
		add	a, b
		ld	b, a
		ld	c, l
		jp	sub_EA3
; End of function sub_767


; =============== S U B R O U T I N E =======================================

; Attributes: thunk

sub_776:
		jp	sub_E87
; End of function sub_776


; =============== S U B R O U T I N E =======================================


sub_779:
		ld	a, (ix+38h)
		or	a
		jr	z, loc_795
		ld	(ix+38h), 1
		ld	l, (ix+3Bh)
		ld	h, (ix+3Ch)
		ld	(ix+3Eh), l
		ld	(ix+3Fh), h
		ld	a, (ix+3Dh)
		ld	(ix+40h), a

loc_795:
		ld	a, (ix+2Eh)
		or	a
		jr	z, loc_7B6
		ld	(ix+33h), a
		ld	l, (ix+2Fh)
		ld	h, (ix+30h)
		ld	(ix+34h), l
		ld	(ix+35h), h
		ld	a, (ix+31h)
		ld	(ix+36h), a
		ld	a, (ix+32h)
		ld	(ix+37h), a

loc_7B6:
		ld	(ix+2Ch), 0
		ld	(ix+2Dh), 0
		ret
; End of function sub_779


; =============== S U B R O U T I N E =======================================


sub_7BF:
		ld	a, (ix+41h)
		or	a
		jr	nz, loc_7C8
		jp	sub_E76
; ---------------------------------------------------------------------------

loc_7C8:
		cp	3
		ret	nc
		ld	(ix+41h), 3
		ld	(ix+48h), 1
		ld	l, (ix+44h)
		ld	h, (ix+45h)
		ld	(ix+46h), l
		ld	(ix+47h), h
		ret
; End of function sub_7BF


; =============== S U B R O U T I N E =======================================


sub_7E0:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		push	de
		pop	ix
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		push	de
		pop	iy
		ret
; End of function sub_7E0


; =============== S U B R O U T I N E =======================================


sub_7EF:
		add	a, 0Ch
; End of function sub_7EF


; =============== S U B R O U T I N E =======================================


sub_7F1:
		add	a, a
		inc	a
		ld	b, 0
		ld	c, a
		ld	hl, (word_B67)
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ld	hl, (word_B67)
		add	hl, bc
		ret
; End of function sub_7F1


; =============== S U B R O U T I N E =======================================


sub_802:
		add	a, (ix+23h)
		sub	0Fh
		jr	c, loc_80E

loc_809:
		ld	hl, byte_B6D
		sub	(hl)
		ret	nc

loc_80E:
		xor	a
		ret
; End of function sub_802

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, (byte_106)
		rla
		ld	a, (byte_105)
		rla
		ld	b, 4
		ld	hl, loc_82E

loc_81D:
		ld	c, 75h
		rrca
		jr	nc, loc_824
		inc	c
		inc	c

loc_824:
		ld	(hl), c
		inc	hl
		djnz	loc_81D
		push	hl
		ld	hl, 6000h
		ld	a, 0FFh

loc_82E:
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		pop	hl
		ret
; End of function LoadBank

; =============== S U B R O U T I N E =======================================

LoadBank2:
		ld	b, 4
		ld	hl, loc_84F

loc_83E:
		ld	c, 75h
		rrca
		jr	nc, loc_845
		inc	c
		inc	c

loc_845:
		ld	(hl), c
		inc	hl
		djnz	loc_83E

LoadBank2_2:
		push	hl
		ld	hl, 6000h
		ld	a, 0FFh

loc_84F:
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		ld	(hl), l
		pop	hl
		ret
; End of function LoadBank2

; =============== S U B R O U T I N E =======================================

sub_85A:
		ld	b, (iy+7)
		ld	c, 0Fh
		call	sub_EA3
		ld	a, 4
		add	a, b
		ld	b, a
		call	sub_EA3
		ld	a, 4
		add	a, b
		ld	b, a
		call	sub_EA3
		ld	a, 4
		add	a, b
		ld	b, a
		call	sub_EA3
		ld	a, (de)
		inc	de
		ld	(ix+41h), a
		call	sub_7EF
		ld	a, (iy+4)

loc_882:
		ld	b, a
		ld	c, (hl)
		inc	hl
		call	sub_EA3
		ld	a, 4
		add	a, b
		cp	8Fh
		jr	c, loc_882
		ld	a, (hl)
		ld	c, a
		ld	b, (iy+5)
		and	7
		ld	(ix+42h), a
		call	sub_EA3
		ld	bc, 0FFEFh
		add	hl, bc
		ld	(ix+43h), l
		ld	(ix+44h), h
		ld	c, (ix+23h)
		jr	sub_8BE
; End of function sub_85A

; =============== S U B R O U T I N E =======================================

sub_8AB:
		ld	a, (de)
		inc	de
; End of function sub_8AB

; =============== S U B R O U T I N E =======================================

loc_8AD:
		ld	(ix+23h), a

; =============== S U B R O U T I N E =======================================

sub_8B0:
		ld	c, a
		ld	a, (iy+0)
		add	a, a
		add	a, 61h
		ld	(loc_8BA+1), a

loc_8BA:
		ld	hl, (off_161)
		jp	(hl)
; End of function sub_8B0


; =============== S U B R O U T I N E =======================================


sub_8BE:
		push	de
		ld	a, c
		call	loc_809
		ld	b, 0
		ld	c, a
		ld	hl, word_11F
		add	hl, bc
		ex	de, hl
		ld	a, (ix+42h)
		add	a, 67h
		ld	(loc_8D3+1), a

loc_8D3:
		ld	a, (word_167)
		ld	b, a
		ld	c, (iy+6)
		ld	l, (ix+43h)
		ld	h, (ix+44h)

loc_8E0:
		ld	a, 0FCh
		add	a, c
		ld	c, a
		push	bc
		ld	b, c
		ld	a, (de)
		add	a, (hl)
		ld	c, a
		call	sub_EA3
		dec	hl
		pop	bc
		djnz	loc_8E0
		pop	de
		ret
; End of function sub_8BE


; =============== S U B R O U T I N E =======================================


nullsub_2:
		ret
; End of function nullsub_2


; =============== S U B R O U T I N E =======================================


sub_8F3:

; FUNCTION CHUNK AT 08AD SIZE 00000003 BYTES

		ld	a, (ix+23h)
		inc	a
		jr	loc_8AD
; End of function sub_8F3


; =============== S U B R O U T I N E =======================================


sub_8F9:
		ld	a, (ix+23h)
		dec	a
		jr	loc_8AD
; End of function sub_8F9


; =============== S U B R O U T I N E =======================================


sub_8FF:
		ld	a, (de)
		inc	de
		add	a, (ix+23h)
		jr	loc_8AD
; End of function sub_8FF


; =============== S U B R O U T I N E =======================================


sub_906:
		ld	a, (de)
		inc	de
		or	a
		jr	nz, loc_90F
		ld	(ix+41h), a
		ret
; ---------------------------------------------------------------------------

loc_90F:
		call	sub_7EF
		ld	(ix+42h), l
		ld	(ix+43h), h
		ld	a, (de)
		inc	de
		call	sub_7EF
		ld	(ix+44h), l
		ld	(ix+45h), h
		ld	(ix+41h), 4
		xor	a
		jp	sub_E76
; End of function sub_906


; =============== S U B R O U T I N E =======================================


sub_92B:
		ld	a, (de)
		inc	de
		dec	a
		ld	b, a
		add	a, b
		add	a, b
		add	a, a
		add	a, a
		add	a, a
		ld	b, 0
		ld	c, a
		ld	l, (iy+1)
		ld	h, (iy+2)
		add	hl, bc
		ld	(ix+24h), l
		ld	(ix+25h), h
		ret
; End of function sub_92B


; =============== S U B R O U T I N E =======================================


sub_945:
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		ld	bc, 18h
		add	hl, bc
		ld	(ix+24h), l
		ld	(ix+25h), h
		ret
; End of function sub_945


; =============== S U B R O U T I N E =======================================


sub_956:
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		ld	bc, 0FFE8h
		add	hl, bc
		ld	(ix+24h), l
		ld	(ix+25h), h
		ret
; End of function sub_956


; =============== S U B R O U T I N E =======================================


sub_967:
		ld	a, (de)
		inc	de
		ld	b, a
		add	a, b
		add	a, b
		add	a, a
		add	a, a
		add	a, a
		ld	c, a
		rla
		ld	a, 0
		sbc	a, a
		ld	b, a
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		add	hl, bc
		ld	(ix+24h), l
		ld	(ix+25h), h
		ret
; End of function sub_967


; =============== S U B R O U T I N E =======================================


sub_983:
		ld	a, (de)
		inc	de
		ld	(ix+22h), a
		ret
; End of function sub_983


; =============== S U B R O U T I N E =======================================


sub_989:
		ld	a, (de)
		inc	de
		ld	(ix+28h), a
		ret
; End of function sub_989


; =============== S U B R O U T I N E =======================================


sub_98F:
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (de)
		inc	de
		ld	c, a
		jp	sub_EA3
; End of function sub_98F


; =============== S U B R O U T I N E =======================================


sub_998:
		ld	l, (ix+5)
		ld	h, (ix+6)
		inc	hl
		inc	hl
		inc	hl
		ld	(ix+5),	l
		ld	(ix+6),	h
		ld	a, (de)
		inc	de
		ld	(hl), a
		inc	hl
		ld	(hl), e
		inc	hl
		ld	(hl), d
		ret
; End of function sub_998


; =============== S U B R O U T I N E =======================================


sub_9AF:
		ld	l, (ix+5)
		ld	h, (ix+6)
		dec	(hl)
		jr	z, loc_9BD
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ret
; ---------------------------------------------------------------------------

loc_9BD:
		dec	hl
		dec	hl
		dec	hl
		ld	(ix+5),	l
		ld	(ix+6),	h
		ret
; End of function sub_9AF


; =============== S U B R O U T I N E =======================================


sub_9C7:
		ld	l, (ix+5)
		ld	h, (ix+6)
		jr	loc_9BD
; End of function sub_9C7


; =============== S U B R O U T I N E =======================================


sub_9CF:
		ld	a, (de)
		inc	de
		ld	b, a
		ld	a, (de)
		inc	a
		cp	b
		jr	nz, loc_9E4
		xor	a
		ld	(de), a
		inc	de
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_B67)
		add	hl, de
		ex	de, hl
		ret
; ---------------------------------------------------------------------------

loc_9E4:
		ld	(de), a
		inc	de
		inc	de
		inc	de
		ret
; End of function sub_9CF


; =============== S U B R O U T I N E =======================================


sub_9E9:
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	hl, (word_B67)
		add	hl, de
		ex	de, hl
		ret
; End of function sub_9E9


; =============== S U B R O U T I N E =======================================


sub_9F3:
		ld	l, (ix+16h)
		ld	h, (ix+17h)
		inc	hl
		inc	hl
		ld	(ix+16h), l
		ld	(ix+17h), h
		inc	de
		inc	de
		ld	(hl), e
		inc	hl
		ld	(hl), d
		dec	de
		dec	de
		jr	sub_9E9
; End of function sub_9F3


; =============== S U B R O U T I N E =======================================


sub_A0A:
		ld	l, (ix+16h)
		ld	h, (ix+17h)
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		dec	hl
		dec	hl
		dec	hl
		ld	(ix+16h), l
		ld	(ix+17h), h
		ret
; End of function sub_A0A


; =============== S U B R O U T I N E =======================================


sub_A1D:
		ld	a, (de)
		inc	de
		ld	(ix+2Eh), a
		or	a
		ret	z
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ex	de, hl
		ld	(ix+2Fh), l
		ld	(ix+30h), h
		ld	(ix+34h), 0
		ld	(ix+35h), 0
		ld	a, (de)
		inc	de
		ld	(ix+31h), a
		ld	a, (de)
		inc	de
		ld	(ix+32h), a
		ret
; End of function sub_A1D


; =============== S U B R O U T I N E =======================================


sub_A43:
		ld	a, (de)
		inc	de
		ld	l, a
		rla
		ld	a, 0
		sbc	a, a
		ld	h, a
		ld	a, (byte_B6B)
		cp	0Ah
		jr	nz, loc_A56
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl

loc_A56:
		ld	(ix+26h), l
		ld	(ix+27h), h
		ret
; End of function sub_A43


; =============== S U B R O U T I N E =======================================


sub_A5D:
		ld	a, (de)
		inc	de
		ld	(ix+38h), a
		or	a
		ret	z
		ld	(ix+38h), 2
		call	sub_7EF
		ld	(ix+3Bh), l
		ld	(ix+3Ch), h
		ld	a, (de)
		inc	de
		ld	(ix+3Dh), a
		ret
; End of function sub_A5D


; =============== S U B R O U T I N E =======================================


sub_A77:
		ld	(ix+45h), 1
		ret
; End of function sub_A77


; =============== S U B R O U T I N E =======================================


sub_A7C:
		ld	(ix+45h), 0
		ret
; End of function sub_A7C


; =============== S U B R O U T I N E =======================================


sub_A81:
		ld	a, (de)
		inc	de
; End of function sub_A81


; =============== S U B R O U T I N E =======================================


sub_A83:
		ld	(loc_37A+1), a
		ret
; End of function sub_A83


; =============== S U B R O U T I N E =======================================


sub_A87:
		ld	c, 0C0h

loc_A89:
		ld	b, (iy+8)
		ld	a, (byte_B6B)
		cp	9
		jp	nz, sub_EA3
		ld	h, b
		ld	l, c
		ld	(word_E74), hl
		ld	a, (zVInt)
		or	a
		ret	z
		jp	sub_EA3
; End of function sub_A87


; =============== S U B R O U T I N E =======================================


sub_AA1:
		ld	c, 80h
		jr	loc_A89
; End of function sub_AA1


; =============== S U B R O U T I N E =======================================


sub_AA5:
		ld	c, 40h
		jr	loc_A89
; End of function sub_AA5


; =============== S U B R O U T I N E =======================================


sub_AA9:
		ld	a, (de)
		inc	de
		ld	(byte_10D), a
		ret
; End of function sub_AA9


; =============== S U B R O U T I N E =======================================


sub_AAF:
		ld	a, (de)
		inc	de
		add	a, a
		ld	c, a
		rla
		ld	a, 0
		sbc	a, a
		ld	b, a
		ld	l, (ix+24h)
		ld	h, (ix+25h)
		add	hl, bc
		ld	(ix+24h), l
		ld	(ix+25h), h
		ret
; End of function sub_AAF


; =============== S U B R O U T I N E =======================================


sub_AC6:
		call	LoadBank
		ld	a, (byte_107)
		add	a, a
		add	a, 1
		ld	(loc_AD2+1), a

loc_AD2:
		ld	hl, (8001h)
		push	hl
		ex	de, hl
		ld	a, (byte_107)
		inc	a
		add	a, a
		add	a, 1
		ld	(loc_AE1+1), a

loc_AE1:
		ld	hl, (8001h)
		sbc	hl, de
		inc	hl
		ld	b, h
		ld	c, l
		pop	hl
		ld	de, byte_11B2
		ld	(word_B67), de
		ldir
		call	LoadBank2_2
; End of function sub_AC6

; =============== S U B R O U T I N E =======================================

sub_AF6:
		xor	a
		ld	(byte_B6B), a
		inc	a
		ld	(byte_109), a
		ld	hl, word_B70

loc_B01:
		call	sub_7E0
		ex	de, hl
		ld	a, (byte_B6B)
		call	sub_7F1
		ld	(ix+3),	l
		ld	(ix+4),	h
		ld	(ix+1),	0
		ld	(ix+2),	1
		push	ix
		pop	hl
		ld	bc, 4
		add	hl, bc
		ld	(ix+5),	l
		ld	(ix+6),	h
		push	ix
		pop	hl
		ld	bc, 16h
		add	hl, bc
		ld	(ix+16h), l
		ld	(ix+17h), h
		ex	de, hl
		ld	a, (byte_B6B)
		inc	a
		ld	(byte_B6B), a
		cp	0Ah
		jr	nz, loc_B01
		ld	a, 0E9h
		call	sub_A83
		ret
; End of function sub_AF6


; =============== S U B R O U T I N E =======================================


sub_B45:
		ld	a, 0Fh
		ld	(byte_B6D), a
		call	sub_EF0
		call	sub_ED4
		ld	hl, word_1165
		ld	(word_B67), hl
		call	sub_AF6
		call	sub_445
		xor	a
		ld	(byte_B6D), a
		ld	(byte_109), a
		ld	(byte_10D), a
		ret
; End of function sub_B45

; ---------------------------------------------------------------------------
word_B67:	dw 0
word_B69:	dw 0
byte_B6B:	db 0
		db 0
byte_B6D:	db 0
byte_B6E:	db 0
byte_B6F:	db 0
word_B70:	dw 0BC3h
		dw 0B98h
		dw 0C0Bh
		dw 0BA1h
		dw 0C53h
		dw 0BAAh
		dw 0D73h
		dw 0BB3h
		dw 0DBCh
		dw 0BB8h
		dw 0E05h
		dw 0BBDh
		dw 0E4Eh
		dw 0BC2h
		dw 0C9Bh
		dw 0B98h
		dw 0CE3h
		dw 0BA1h
		dw 0D2Bh
		dw 0BAAh
		dw 0AD00h
		dw 0A401h
		dw 0B030h
		dw 8050h
		dw 0B4h
		dw 1ADh
		dw 31A5h
		dw 51B1h
		dw 0B581h
		dw 0AD00h
		dw 0A601h
		dw 0B232h
		dw 8252h
		dw 1B6h
		dw 243h
		dw 9080h
		dw 4301h
		dw 0A002h
		dw 1B0h
		dw 243h
		dw 0D0C0h
		dw 2
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F1h
		db    1
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
byte_C98:	db 0
		db 0F2h
		db    2
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F4h
		db    4
		db    8
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F5h
		db    5
		db    9
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F6h
		db    6
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
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
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_E71:	db 0
byte_E72:	db 0
		db 0
word_E74:	dw 0

; =============== S U B R O U T I N E =======================================


sub_E76:
		ld	(ix+2Bh), a

loc_E79:
		nop

loc_E7A:
		and	0Fh
		or	(iy+4)

loc_E7F:
		xor	0Fh
		ld	(7F11h), a
		jp	zVInt
; End of function sub_E76


; =============== S U B R O U T I N E =======================================


sub_E87:
		nop
; End of function sub_E87


; =============== S U B R O U T I N E =======================================


sub_E88:
		ld	a, 0Fh
		and	l
		or	(iy+3)

loc_E8E:
		ld	(7F11h), a
		ld	a, 0F0h
		and	l
		ld	l, a
		ld	a, 3
		and	h
		or	l
		rrca
		rrca
		rrca
		rrca
		ld	(7F11h), a
		jp	zVInt
; End of function sub_E88


; =============== S U B R O U T I N E =======================================


sub_EA3:
		nop

loc_EA4:
		rst	38h
		ld	a, (4000h)
		rla
		jr	c, loc_EA4
		ld	a, b

loc_EAC:
		ld	(4000h), a
		ld	a, c

loc_EB0:
		ld	(4001h), a
		ret
; End of function sub_EA3


; =============== S U B R O U T I N E =======================================


sub_EB4:
		nop
; End of function sub_EB4


; =============== S U B R O U T I N E =======================================


sub_EB5:
		ld	a, (4000h)
		rla
		jr	c, sub_EB5
		ld	a, b
		ld	(4000h), a
		ld	a, c
		ld	(4001h), a
		ret
; End of function sub_EB5


; =============== S U B R O U T I N E =======================================


sub_EC4:
		nop
; End of function sub_EC4


; =============== S U B R O U T I N E =======================================


sub_EC5:
		ld	a, (4000h)
		rla
		jr	c, sub_EC5
		ld	a, b
		ld	(4002h), a
		ld	a, c
		ld	(4003h), a
		ret
; End of function sub_EC5


; =============== S U B R O U T I N E =======================================


sub_ED4:
		ld	hl, 4000h
		ld	(loc_EAC+1), hl
		inc	hl
		ld	(loc_EB0+1), hl
		ret
; End of function sub_ED4


; =============== S U B R O U T I N E =======================================


sub_EDF:
		ld	hl, 4002h
		ld	(loc_EAC+1), hl
		inc	hl
		ld	(loc_EB0+1), hl
		ret
; End of function sub_EDF

; ---------------------------------------------------------------------------
		ld	a, (4000h)
		jp	zVInt

; =============== S U B R O U T I N E =======================================


sub_EF0:
		xor	a
		ld	(sub_EA3), a
		ld	(sub_EB4), a
		ld	(loc_E79), a
		ld	(sub_E87), a
		ret
; End of function sub_EF0


; =============== S U B R O U T I N E =======================================


sub_EFE:
		ld	a, 0C9h
		ld	(sub_EA3), a
		ld	(sub_EB4), a
		ld	(loc_E79), a
		ld	(sub_E87), a
		ret
; End of function sub_EFE


; =============== S U B R O U T I N E =======================================


sub_F0D:
		ld	hl, byte_10A
		ld	a, (hl)
		ld	(hl), 0
		or	a
		jr	nz, loc_F4A
		ld	a, (byte_113E)
		dec	a
		ld	a, (byte_10C)
		jr	z, loc_F2C
		ld	hl, byte_113D
		xor	a
		cp	(hl)
		ld	a, (byte_10C)
		jr	z, loc_F2C
		cp	(hl)
		jr	nz, loc_F37

loc_F2C:
		ld	hl, byte_1164
		dec	(hl)
		jr	nz, loc_F37
		ld	(hl), 32h
		or	a
		jr	nz, loc_F4A

loc_F37:
		ld	hl, byte_E72
		ld	a, (hl)
		ld	b, a
		ld	(hl), 0
		or	a
		jr	nz, loc_F63
		ld	a, (byte_10B)
		or	a
		jp	z, loc_100F
		rst	18h
		rst	38h

loc_F4A:
		ld	hl, byte_10B
		ld	(hl), 0
		ld	b, a
		cp	2Dh
		jr	z, loc_F63
		ld	a, (byte_113E)
		cp	1
		jr	nz, loc_F63
		ld	a, (byte_E71)
		cp	0Ch
		jp	nc, loc_100F

loc_F63:
		ld	a, b
		add	a, a
		ld	d, 0
		ld	e, a
		ld	hl, 8000h
		add	hl, de
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, (de)
		cp	0FFh
		jr	z, loc_FA9
		ld	hl, byte_113E
		ld	a, (de)
		inc	de
		cp	(hl)
		jp	c, loc_100F
		rst	18h
		rst	38h
		ld	(byte_113E), a
		ld	a, b
		ld	(byte_113D), a
		ld	hl, byte_1161
		ld	(word_1150), hl
		ld	hl, byte_146
		ld	b, 3
		ld	a, (de)
		inc	de
		ld	c, a

loc_F94:
		sra	c
		jr	nc, loc_F9C
		ld	(hl), 1
		jr	loc_F9E
; ---------------------------------------------------------------------------

loc_F9C:
		rlc	(hl)

loc_F9E:
		dec	hl
		djnz	loc_F94
		ld	a, 0FFh
		ld	(7F11h), a
		jp	loc_101D
; ---------------------------------------------------------------------------

loc_FA9:
		inc	de
		ld	hl, byte_1143
		ld	a, (de)
		inc	de
		cp	(hl)
		jr	c, loc_100F
		ld	(hl), a
		ld	a, (de)
		inc	de
		ld	hl, 400h
		ld	b, 0
		ld	c, a
		sbc	hl, bc
		ld	a, l
		and	3
		ld	b, 25h
		ld	c, a
		call	sub_EB5
		ld	a, l
		and	0FCh
		or	h
		rrca
		rrca
		ld	b, 24h
		ld	c, a
		call	sub_EB5
		ld	a, (byte_C98)
		and	1
		rrca
		rrca
		or	1Fh
		ld	b, 27h
		ld	c, a
		call	sub_EB5
		ld	a, (de)
		call	LoadBank2
		push	de
		pop	ix
		exx
		ld	l, (ix+1)
		ld	h, (ix+2)
		ld	e, (ix+3)
		ld	d, (ix+4)
		exx
		ld	a, (zVInt)
		or	a
		jr	z, loc_100C
		ld	bc, 0B6C0h
		call	sub_EC5
		ld	bc, 2B80h
		call	sub_EB5
		xor	a
		ld	(zVInt), a

loc_100C:
		ld	(byte_10E), a

loc_100F:
		ld	a, (byte_113D)
		or	a
		ret	z
		ld	hl, byte_1141
		dec	(hl)
		ret	nz
		ld	de, (word_113F)
; End of function sub_F0D

; START	OF FUNCTION CHUNK FOR sub_1075

loc_101D:
		rst	18h
		rst	38h
		ld	a, (de)
		inc	de
		cp	0FFh
		jr	z, loc_1055
		bit	7, a
		jr	nz, loc_104B
		cp	0Eh
		jr	nc, loc_1033
		ld	b, a
		ld	a, (de)
		inc	de
		ld	c, a
		jr	loc_101D
; ---------------------------------------------------------------------------

loc_1033:
		push	af
		and	60h
		rlca
		rlca
		rlca
		ld	(byte_1144), a
		pop	af
		and	1Fh
		sub	0Eh
		add	a, a
		add	a, 31h
		ld	(loc_1047+1), a

loc_1047:
		ld	hl, (off_131)
		jp	(hl)
; ---------------------------------------------------------------------------

loc_104B:
		and	7Fh
		ld	(byte_1141), a
		ld	(word_113F), de
		ret
; ---------------------------------------------------------------------------

loc_1055:
		ld	hl, byte_144
		ld	b, 3

loc_105A:
		ld	a, (hl)
		cp	1
		jr	nz, loc_1061
		rlc	(hl)

loc_1061:
		inc	hl
		djnz	loc_105A
		ld	a, 0FFh
		ld	(7F11h), a
		xor	a
		ld	(byte_113D), a
		ld	(byte_113E), a
		inc	a
		ld	(byte_1164), a
		ret
; END OF FUNCTION CHUNK	FOR sub_1075

; =============== S U B R O U T I N E =======================================


sub_1075:

; FUNCTION CHUNK AT 101D SIZE 00000058 BYTES

		ld	a, (byte_1144)
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, byte_1145
		add	hl, bc
		ex	de, hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ex	de, hl

loc_1086:
		ld	(hl), c
		inc	hl
		ld	(hl), b
		ld	h, b
		ld	l, c
		ld	a, 0Fh
		and	l
		ld	b, a
		ld	a, (byte_1144)
		rrca
		rrca
		rrca
		or	80h
		or	b
		call	loc_E8E
		jp	loc_101D
; End of function sub_1075


; =============== S U B R O U T I N E =======================================


sub_109E:
		ld	a, (byte_1144)
		add	a, a
		ld	c, a
		ld	b, 0
		ld	hl, byte_1145
		add	hl, bc
		push	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ex	de, hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ex	de, hl
		add	hl, bc
		ld	b, h
		ld	c, l
		pop	hl
		jr	loc_1086
; End of function sub_109E


; =============== S U B R O U T I N E =======================================


sub_10B9:
		ld	a, (byte_1144)
		ld	c, a
		ld	b, 0
		ld	hl, byte_114B
		add	hl, bc
		ld	a, (de)
		inc	de

loc_10C5:
		ld	(hl), a
		ld	c, a
		ld	a, (byte_113D)
		cp	20h
		jr	nc, loc_10DD
		ld	a, (byte_B6D)
		add	a, 0Fh
		ld	b, a
		ld	a, (byte_E71)
		add	a, c
		sub	b
		jr	nc, loc_10DC
		xor	a

loc_10DC:
		ld	c, a

loc_10DD:
		ld	a, (byte_1144)
		rrca
		rrca
		rrca
		or	90h
		ld	b, a
		ld	a, 0Fh
		and	c
		or	b
		call	loc_E7F
		jp	loc_101D
; End of function sub_10B9


; =============== S U B R O U T I N E =======================================


sub_10F0:
		ld	a, (byte_1144)
		ld	c, a
		ld	b, 0
		ld	hl, byte_114B
		add	hl, bc
		ld	a, (de)
		inc	de
		add	a, (hl)
		jr	loc_10C5
; End of function sub_10F0


; =============== S U B R O U T I N E =======================================


sub_10FF:
		ld	a, (de)
		inc	de

loc_1101:
		ld	(byte_114F), a
		and	7
		or	0E0h
		ld	(7F11h), a
		jp	loc_101D
; End of function sub_10FF


; =============== S U B R O U T I N E =======================================


sub_110E:
		ld	hl, byte_114F
		ld	a, (de)
		inc	de
		add	a, (hl)
		jr	loc_1101
; End of function sub_110E


; =============== S U B R O U T I N E =======================================


sub_1116:
		ld	a, (de)
		inc	de
		ld	hl, (word_1150)
		dec	hl
		ld	(hl), d
		dec	hl
		ld	(hl), e
		dec	hl
		ld	(hl), a
		ld	(word_1150), hl
		jp	loc_101D
; End of function sub_1116


; =============== S U B R O U T I N E =======================================


sub_1127:
		ld	hl, (word_1150)
		dec	(hl)
		jr	z, loc_1134
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		jp	loc_101D
; ---------------------------------------------------------------------------

loc_1134:
		inc	hl
		inc	hl
		inc	hl
		ld	(word_1150), hl
		jp	loc_101D
; End of function sub_1127

; ---------------------------------------------------------------------------
byte_113D:	db 0
byte_113E:	db 0
word_113F:	dw 0
byte_1141:	db 0
		db 0
byte_1143:	db 0
byte_1144:	db 0
byte_1145:	db 0
		db 0
		db 0
		db 0
		db 0
		db 0
byte_114B:	db 0
		db 0
		db 0
		db 0
byte_114F:	db 0
word_1150:	dw 1161h
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
byte_1161:	db 0
		db 0
		db 0
byte_1164:	db 0
word_1165:	dw 1EFFh
		dw 1E00h
		dw 1B00h
		dw 2400h
		dw 2400h
		dw 2400h
		dw 2C00h
		dw 1E00h
		dw 1E00h
		dw 1E00h
		dw 2A00h
		dw 2C00h
		dw 3300h
		db 0
		db    0
		db  87h
		db  19h
		db    1
		db    0
		db  1Ah
		db  12h
		db  26h
		db    0
		db    2
		db    0
		db  17h
		db    0
		db  15h
		db    0
		db  16h
		db    0
		db    3
		db    0
		db 0A0h
		db 0FFh
		db  12h
		db  2Eh
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  1Fh
		db  1Fh
		db  1Fh
		db  1Fh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Fh
		db  0Fh
		db  0Fh
		db  0Fh
		db    0
		db    0
byte_11B2:	ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
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
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
		ds 1
byte_1FFE:
		ds 1
		ds 1

; end of 'ROM'



		END
