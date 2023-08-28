; ---------------------------------------------------------------------------
; Twinkle DAC Driver
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

start:
		!org	0
		CPU Z80
		listing on

		di
		di
		im	1
		jp	loc_42
; End of function start
; ---------------------------------------------------------------------------
		db 0

; =============== S U B R O U T I N E =======================================

sub_8:
		ld	a, (4000h)
		rlca
		jr	c, sub_8
		ret
; End of function sub_8
; ---------------------------------------------------------------------------
		db 0

; =============== S U B R O U T I N E =======================================

sub_10:
		push	af
		rst	8
		pop	af
		ld	(4000h), a
		ret
; End of function sub_10
; ---------------------------------------------------------------------------
		db 0

; =============== S U B R O U T I N E =======================================

sub_18:
		push	af
		rst	8
		pop	af
		ld	(4001h), a
		ret
; End of function sub_18
; ---------------------------------------------------------------------------
		db 0
; ---------------------------------------------------------------------------
		push	af
		rst	8
		pop	af
		ld	(4002h), a
		ret
; ---------------------------------------------------------------------------
		db 0
; ---------------------------------------------------------------------------
		push	af
		rst	8
		pop	af
		ld	(4003h), a
		ret
; ---------------------------------------------------------------------------

		align 38h

; =============== S U B R O U T I N E =======================================

sub_38:
		push	af

loc_39:
		ld	a, (1FF6h)
		or	a
		jr	nz, loc_39
		pop	af
		ei
		ret
; End of function sub_38
; ---------------------------------------------------------------------------

loc_42:
		ld	hl, word_12C

loc_45:
		xor	a
		ld	(hl), a
		inc	hl
		ld	a, h
		cp	20h
		jr	nz, loc_45
		ld	sp, 1F00h

loc_50:
		xor	a
		ld	(1FF5h), a

loc_54:
		ld	a, (1FF4h)
		or	a
		jr	z, loc_54
		call	sub_9E
		jr	loc_66
; ---------------------------------------------------------------------------

loc_5F:
		ld	a, (1FF4h)
		or	a
		call	nz, sub_9E

loc_66:
		ld	hl, (word_133)
		ld	a, (hl)
		add	a, a
		add	a, a
		add	a, a
		or	7
		ex	af, af'
		ld	a, (1FF7h)
		or	a
		jr	z, loc_7D
		ld	b, a
		ex	af, af'

loc_78:
		srl	a
		djnz	loc_78
		ex	af, af'

loc_7D:
		ex	af, af'
		rst	18h
		ld	a, (1FF3h)
		ld	b, a

loc_83:
		djnz	$
		ld	hl, (word_133)
		inc	hl
		call	sub_D6
		ld	(word_133), hl
		ld	de, (word_12C)
		dec	de
		ld	(word_12C), de
		ld	a, d
		or	e
		jr	nz, loc_5F
		jr	loc_50

; =============== S U B R O U T I N E =======================================

sub_9E:
		ld	a, (1FF0h)
		ld	h, a
		ld	a, (1FF1h)
		ld	l, a
		ld	de, 0
		ld	(1FF0h), de
		ld	(word_12F), hl
		call	LoadBank
		ld	a, (1FF2h)
		ld	(byte_131), a
		ld	l, a
		ld	a, (word_12F)
		or	80h
		ld	h, a
		ld	d, (hl)
		inc	hl
		call	sub_D6
		ld	e, (hl)
		inc	hl
		call	sub_D6
		ld	(word_133), hl
		ld	(word_12C), de
		xor	a
		ld	(1FF4h), a
		ret
; End of function sub_9E

; =============== S U B R O U T I N E =======================================

sub_D6:
		ld	a, h
		or	l
		jr	nz, locret_EA
		ld	hl, (word_12F)
		ld	bc, 80h
		add	hl, bc
		ld	(word_12F), hl
		call	LoadBank
		ld	hl, 8000h

locret_EA:
		ret
; End of function sub_D6

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, l
		rlca
		ld	(6000h), a
		ld	b, 8
		ld	a, h

loc_F3:
		ld	(6000h), a
		rrca
		djnz	loc_F3
		ret
; End of function LoadBank
; ---------------------------------------------------------------------------

loc_FA:
		ld	a, c
		rst	10h
		ld	a, (hl)
		rst	18h
		inc	hl
		inc	c
		djnz	loc_FA
		ret
; ---------------------------------------------------------------------------

loc_103:
		ld	a, c
		rst	10h
		ld	a, (hl)
		rst	18h
		inc	hl
		inc	c
		djnz	loc_103
		ret
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
word_12C:
		dw 0
		db 0
word_12F:
		dw 0
byte_131:
		db 0
		db 0
word_133:
		dw 0
		db 0

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
