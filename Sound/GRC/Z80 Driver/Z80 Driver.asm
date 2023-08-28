; ---------------------------------------------------------------------------
; GRC Z80 DAC Driver
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

DAC_Driver:
		!org	0
		CPU Z80
		listing on
		di
		di
		ld	sp, 1FE0h
		xor	a
		ld	(1FFFh), a
		ld	(1FF0h), a
		ld	(1FF1h), a
		ld	hl, 0
		ld	(1FE5h+1), hl
		ld	(1FE2h), hl
		ld	(1FE0h), hl
		ld	(1FEEh), hl
		ld	(1FEAh), hl
		ld	(1FE8h), hl
		jr	DAC_Driver_Init
; End of function DAC_Driver
; ---------------------------------------------------------------------------
		align 38h

; =============== S U B R O U T I N E =======================================

zVInt:
		reti

; =============== S U B R O U T I N E =======================================

LoadBank:
		ld	a, l
		rlca
		ld	(6000h), a
		ld	b, 8
		ld	a, h

-		ld	(6000h), a
		srl	a
		djnz	-
		ret
; End of function LoadBank
; ---------------------------------------------------------------------------
		align 66h

; =============== S U B R O U T I N E =======================================

zsub_66:
		retn

; =============== S U B R O U T I N E =======================================

DAC_Driver_Init:
		ld	a, (1FF0h)
		or	a
		call	nz, sub_AA
		ld	e, 80h
		ld	hl, (1FE5h+1)
		ld	bc, (1FE2h)
		xor	a
		sbc	hl, bc
		jr	nc, loc_95
		ld	hl, (1FE5h+1)
		ld	a, (hl)
		ld	e, a
		ld	bc, (1FE0h)
		ld	hl, (1FE5h)
		add	hl, bc
		ld	(1FE5h), hl
		ld	a, (1FE7h)
		adc	a, 0
		ld	(1FE7h), a

loc_95:
		ld	a, 80h
		ld	(1FFFh), a
		ld	a, 2Ah
		ld	(4000h), a
		ld	a, e
		ld	(4001h), a
		xor	a
		ld	(1FFFh), a
		jp	DAC_Driver_Init

; =============== S U B R O U T I N E =======================================

sub_AA:
		ld	a, (1FF0h)
		call	sub_C7
		ld	(1FE5h+1), hl
		xor	a
		ld	(1FE4h), a
		ld	(1FE5h), a
		add	hl, de
		ld	(1FE2h), hl
		ld	(1FE0h), bc
		xor	a
		ld	(1FF0h), a
		ret
; End of function sub_AA

; =============== S U B R O U T I N E =======================================

sub_C7:
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ex	de, hl
		ld	ix, DACTbl
		add	ix, de
		ld	l, (ix+6)
		ld	h, (ix+7)
		call	LoadBank
		ld	l, (ix+0)
		ld	h, (ix+1)
		ld	e, (ix+2)
		ld	d, (ix+3)
		ld	c, (ix+4)
		ld	b, (ix+5)
		ret
; End of function sub_C7
; ---------------------------------------------------------------------------
		align 180h

DACTbl:		; DAC Tbl ~8 bytes.
		binclude "Z80 Driver/DAC/DAC Table.bin"
		binclude "Z80 Driver/DAC/DAC.bin"

; =============== S U B R O U T I N E =======================================

; end of 'ROM'

		END
