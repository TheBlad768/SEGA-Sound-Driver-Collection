; Ancient Music Driver -MD- Z80 Program Version 1.06.
; Copyright (C) 1994 Ancient corp., Programmed By Hideki Koyama.
; ---------------------------------------------------------------------------

DAC_Bank_Offset:			equ $800	; $080000 in rom

DAC_Driver:
		!org	0
		CPU Z80
		listing on

		jp	DAC_Driver_Init
; ---------------------------------------------------------------------------
byte_3:	db 0
byte_4:	db 0
byte_5:	db 0
byte_6:	db 0
		db 3
		db 0
		db 1
		db 2
		db 6
		db 0Ch
		db 18h
		db 30h
		db 60h
		db 0A0h
		db 0D0h
		db 0E8h
		db 0F4h
		db 0FAh
		db 0FEh
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  41h
		db  6Eh
		db  63h
		db  69h
		db  65h
		db  6Eh
		db  74h
		db  20h
		db  4Dh
		db  75h
		db  73h
		db  69h
		db  63h
		db  20h
		db  20h
		db  20h
		db  44h
		db  72h
		db  69h
		db  76h
		db  65h
		db  72h
		db  20h
		db  2Dh
		db  4Dh
		db  44h
		db  2Dh
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  5Ah
		db  38h
		db  30h
		db  20h
		db  50h
		db  72h
		db  6Fh
		db  67h
		db  72h
		db  61h
		db  6Dh
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  56h
		db  65h
		db  72h
		db  73h
		db  69h
		db  6Fh
		db  6Eh
		db  20h
		db  31h
		db  2Eh
		db  30h
		db 36h
		db  43h
		db  6Fh
		db  70h
		db  79h
		db  72h
		db  69h
		db  67h
		db  68h
		db  74h
		db  28h
		db  43h
		db  29h
		db  31h
		db  39h
		db  39h
		db  34h
		db  41h
		db  6Eh
		db  63h
		db  69h
		db  65h
		db  6Eh
		db  74h
		db  20h
		db  63h
		db  6Fh
		db  72h
		db  70h
		db  2Eh
		db  2Ch
		db  20h
		db  20h
		db  50h
		db  72h
		db  6Fh
		db  67h
		db  72h
		db  61h
		db  6Dh
		db  6Dh
		db  65h
		db  64h
		db  20h
		db  42h
		db  79h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  48h
		db  69h
		db  64h
		db  65h
		db  6Bh
		db  69h
		db  20h
		db  4Bh
		db  6Fh
		db  79h
		db  61h
		db  6Dh
		db  61h
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1D9:	db 0
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
		db 0
byte_49B:
		db 0
byte_49C:
		db 0
; ---------------------------------------------------------------------------

DAC_Driver_Init:
		di
		ld	sp, byte_49B
		ld	hl, DAC_Bank_Offset
		call	sub_A18
		ld	iy, 4000h

loc_4AB:
		call	sub_9C7
		xor	a
		ld	(byte_3), a
		ld	(byte_4), a
		ld	(byte_5), a
		ld	(byte_6), a
		ld	b, a
		ld	c, a
		exx

loc_4BE:
		ld	a, (byte_3)
		or	a
		jr	nz, loc_4DF
		call	loc_783
		call	loc_783
		call	loc_783
		ld	a, (byte_4)
		or	a
		jr	nz, loc_4F4

loc_4D3:
		call	loc_783
		call	loc_783
		call	loc_783
		jp	loc_4BE
; ---------------------------------------------------------------------------

loc_4DF:
		bit	0, a
		call	nz, sub_A41
		bit	1, a
		call	nz, sub_A6F
		bit	7, a
		jr	nz, loc_4AB
		xor	a
		ld	(byte_3), a
		jp	loc_4BE
; ---------------------------------------------------------------------------

loc_4F4:
		bit	1, a
		jp	z, loc_504
		bit	0, a
		jp	z, loc_53B

loc_4FE:
		ld	a, 0
		or	a
		jp	z, loc_53B

loc_504:
		ld	hl, 17h
		ld	ix, 4002h
		call	sub_644
		ld	ix, 4000h
		call	sub_573
		call	sub_573
		call	sub_573
		ld	ix, 4002h
		call	sub_573
		call	sub_573
		ld	ix, 4000h
		call	sub_573
		ld	a, (byte_4)
		res	0, a
		ld	(byte_4), a
		xor	a
		ld	(loc_4FE+1), a
		jp	loc_4D3
; ---------------------------------------------------------------------------

loc_53B:
		ld	hl, byte_1D9
		ld	ix, 4002h
		call	sub_644
		ld	ix, 4000h
		call	sub_573
		call	sub_573
		call	sub_573
		ld	ix, 4002h
		call	sub_573
		call	sub_573
		ld	ix, 4000h
		call	sub_573
		ld	a, (byte_4)
		res	1, a
		ld	(byte_4), a
		ld	a, 0FFh
		ld	(loc_4FE+1), a
		jp	loc_4D3

; =============== S U B R O U T I N E =======================================

sub_573:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jp	nz, loc_581
		call	loc_783
		call	loc_783
		ret
; ---------------------------------------------------------------------------

loc_581:
		or	a
		jr	z, loc_58F
		cp	1
		jr	z, loc_5B9
		cp	2
		jr	z, loc_5EB
		jp	loc_5D2
; ---------------------------------------------------------------------------

loc_58F:
		call	loc_783
		call	loc_783
		call	loc_783

loc_598:
		bit	7, (iy+0)
		jr	nz, loc_598
		ld	(iy+0),	28h
		ld	a, (hl)
		inc	hl

loc_5A4:
		bit	7, (iy+0)
		jr	nz, loc_5A4
		ld	(iy+1),	a
		call	loc_783
		call	loc_783
		call	loc_783
		jp	sub_573
; ---------------------------------------------------------------------------

loc_5B9:
		ld	a, (hl)
		inc	hl

loc_5BB:
		bit	7, (iy+0)
		jr	nz, loc_5BB
		ld	(ix+0),	a
		ld	a, (hl)
		inc	hl

loc_5C6:
		bit	7, (iy+0)
		jr	nz, loc_5C6
		ld	(ix+1),	a
		jp	sub_573
; ---------------------------------------------------------------------------

loc_5D2:
		ld	a, (hl)
		inc	hl

loc_5D4:
		bit	7, (iy+0)
		jr	nz, loc_5D4
		ld	(iy+0),	a
		ld	a, (hl)
		inc	hl

loc_5DF:
		bit	7, (iy+0)
		jr	nz, loc_5DF
		ld	(iy+1),	a
		jp	sub_573
; ---------------------------------------------------------------------------

loc_5EB:
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		ld	a, (hl)
		inc	hl
		ld	b, 18h

loc_601:
		bit	7, (iy+0)
		jr	nz, loc_601
		ld	(ix+0),	a
		ld	d, (hl)
		inc	hl

loc_60C:
		bit	7, (iy+0)
		jr	nz, loc_60C
		ld	(ix+1),	d
		add	a, 4
		djnz	loc_601
		add	a, 20h

loc_61B:
		bit	7, (iy+0)
		jr	nz, loc_61B
		ld	(ix+0),	a
		ld	d, (hl)
		inc	hl

loc_626:
		bit	7, (iy+0)
		jr	nz, loc_626
		ld	(ix+1),	d
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		call	loc_783
		jp	sub_573
; End of function sub_573

; =============== S U B R O U T I N E =======================================

sub_644:
		ld	a, (hl)
		inc	hl
		cp	0FFh
		jr	nz, loc_64B
		ret
; ---------------------------------------------------------------------------

loc_64B:
		cp	10h
		jr	z, loc_68C
		cp	11h
		jr	z, loc_698
		cp	1
		jr	z, loc_65A
		jp	loc_673
; ---------------------------------------------------------------------------

loc_65A:
		ld	a, (hl)
		inc	hl

loc_65C:
		bit	7, (iy+0)
		jr	nz, loc_65C
		ld	(ix+0),	a
		ld	a, (hl)
		inc	hl

loc_667:
		bit	7, (iy+0)
		jr	nz, loc_667
		ld	(ix+1),	a
		jp	sub_644
; ---------------------------------------------------------------------------

loc_673:
		ld	a, (hl)
		inc	hl

loc_675:
		bit	7, (iy+0)
		jr	nz, loc_675
		ld	(iy+0),	a
		ld	a, (hl)
		inc	hl

loc_680:
		bit	7, (iy+0)
		jr	nz, loc_680
		ld	(iy+1),	a
		jp	sub_644
; ---------------------------------------------------------------------------

loc_68C:
		call	loc_783
		call	loc_783
		call	sub_6A4
		jp	sub_644
; ---------------------------------------------------------------------------

loc_698:
		call	loc_783
		call	loc_783
		call	sub_704
		jp	sub_644
; End of function sub_644

; =============== S U B R O U T I N E =======================================

sub_6A4:
		ld	a, (hl)
		inc	hl
		cp	80h
		jr	nc, loc_702
		push	hl
		ld	hl, (byte_49B)
		push	hl
		ld	hl, DAC_Bank_Offset
		ld	de, 80h

loc_6B5:
		cp	10h
		jr	c, loc_6BF
		sub	10h
		add	hl, de
		jp	loc_6B5
; ---------------------------------------------------------------------------

loc_6BF:
		ex	af, af'
		call	sub_A0B
		ex	af, af'
		ld	h, 80h
		ld	e, a
		add	a, a
		add	a, a
		add	a, e
		ld	l, a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		jr	z, loc_6F4
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ex	de, hl
		ld	d, 80h
		exx
		ld	hl, loc_78D
		ld	(loc_789), hl
		pop	hl
		pop	hl
		ld	a, (hl)
		inc	hl
		ld	(loc_971), a
		call	sub_9DE
		call	loc_783
		call	loc_783
		call	loc_783
		ret
; ---------------------------------------------------------------------------

loc_6F4:
		pop	hl
		call	sub_A0B
		pop	hl
		call	loc_783
		call	loc_783
		call	loc_783

loc_702:
		inc	hl
		ret
; End of function sub_6A4

; =============== S U B R O U T I N E =======================================

sub_704:
		ld	a, (hl)
		inc	hl
		cp	80h
		jp	nc, loc_77C
		push	hl
		ld	hl, (byte_49B)
		push	hl
		ld	hl, DAC_Bank_Offset
		ld	de, 80h

loc_716:
		cp	10h
		jr	c, loc_720
		sub	10h
		add	hl, de
		jp	loc_716
; ---------------------------------------------------------------------------

loc_720:
		ex	af, af'
		call	sub_A0B
		ex	af, af'
		ld	h, 80h
		ld	e, a
		add	a, a
		add	a, a
		add	a, e
		ld	l, a
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, e
		or	d
		jr	z, loc_76E
		inc	hl
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		inc	hl
		ld	a, (hl)
		ex	de, hl
		ld	d, 80h
		exx
		or	a
		jr	nz, loc_746
		ld	hl, loc_80D
		jp	loc_749
; ---------------------------------------------------------------------------

loc_746:
		ld	hl, loc_899

loc_749:
		ld	(loc_789), hl
		pop	hl
		pop	hl
		ld	a, (hl)
		inc	hl
		ld	(loc_971), a
		ld	(loc_99E), a
		ld	a, (hl)
		inc	hl
		call	sub_9F5
		ld	a, 0FFh
		ld	(byte_6), a
		xor	a
		ld	(byte_5), a
		call	loc_783
		call	loc_783
		call	loc_783
		ret
; ---------------------------------------------------------------------------

loc_76E:
		pop	hl
		call	sub_A0B
		pop	hl
		call	loc_783
		call	loc_783
		call	loc_783

loc_77C:
		xor	a
		ld	(byte_5), a
		inc	hl
		inc	hl
		ret
; End of function sub_704

; ---------------------------------------------------------------------------

loc_783:
		exx
		ld	a, c
		or	b
		jr	z, loc_78B
; ---------------------------------------------------------------------------
		db 0C3h
; ---------------------------------------------------------------------------

loc_789:
		nop
		nop

loc_78B:
		exx
		ret
; ---------------------------------------------------------------------------

loc_78D:
		ld	a, (hl)
		and	0F0h
		jp	nz, loc_7B9
		ld	a, 3
		ld	(loc_7A4), a
		push	hl
		ld	hl, loc_7A0
		ld	(loc_789), hl
		pop	hl

loc_7A0:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_7A4:
		nop
		dec	a
		jr	z, loc_7AE
		ld	(loc_7A4), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_7AE:
		push	hl
		ld	hl, loc_7D4
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_7B9:
		rrca
		rrca
		rrca
		rrca
		add	a, 7
		ld	(loc_7C3), a
; ---------------------------------------------------------------------------
		db  3Ah
; ---------------------------------------------------------------------------

loc_7C3:
		rlca
		nop
		ld	e, a
		call	loc_969
		push	hl
		ld	hl, loc_7D4
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_7D4:
		ld	a, (hl)
		and	0Fh
		jr	nz, loc_7F4
		ld	a, 3
		ld	(loc_7EA), a
		push	hl
		ld	hl, loc_7E6
		ld	(loc_789), hl
		pop	hl

loc_7E6:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_7EA:
		nop
		dec	a
		jr	z, loc_800
		ld	(loc_7EA), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_7F4:
		add	a, 7
		ld	(loc_7FA), a
; ---------------------------------------------------------------------------
		db  3Ah
; ---------------------------------------------------------------------------

loc_7FA:
		rlca
		nop
		ld	e, a
		call	loc_969

loc_800:
		inc	hl
		dec	bc
		push	hl
		ld	hl, loc_78D
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_80D:
		ld	a, (hl)
		and	0F0h
		jp	nz, loc_839
		ld	a, 3
		ld	(loc_824), a
		push	hl
		ld	hl, loc_820
		ld	(loc_789), hl
		pop	hl

loc_820:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_824:
		nop
		dec	a
		jr	z, loc_82E
		ld	(loc_824), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_82E:
		push	hl
		ld	hl, loc_854
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_839:
		rrca
		rrca
		rrca
		rrca
		add	a, 7
		ld	(byte_843), a
; ---------------------------------------------------------------------------
		db  3Ah
byte_843:	db 7
; ---------------------------------------------------------------------------
		nop
		ld	e, a
		call	loc_969
		push	hl
		ld	hl, loc_854
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_854:
		ld	a, (hl)
		and	0Fh
		jr	nz, loc_874
		ld	a, 3
		ld	(loc_86A), a
		push	hl
		ld	hl, loc_866
		ld	(loc_789), hl
		pop	hl

loc_866:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_86A:
		nop
		dec	a
		jr	z, loc_880
		ld	(loc_86A), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_874:
		add	a, 7
		ld	(loc_87A), a
; ---------------------------------------------------------------------------
		db  3Ah
; ---------------------------------------------------------------------------

loc_87A:
		rlca
		nop
		ld	e, a
		call	loc_969

loc_880:
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jp	z, loc_892
		push	hl
		ld	hl, loc_80D
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_892:
		xor	a
		ld	(byte_6), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_899:
		ld	a, (hl)
		and	0F0h
		jp	nz, loc_8D3
		ld	a, 3
		ld	(loc_8A8), a

loc_8A4:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_8A8:
		nop
		dec	a
		jr	z, loc_8BA
		ld	(loc_8A8), a
		push	hl
		ld	hl, loc_8C5
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_8BA:
		push	hl
		ld	hl, loc_8EE
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_8C5:
		call	loc_999
		push	hl
		ld	hl, loc_8A4
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_8D3:
		rrca
		rrca
		rrca
		rrca
		add	a, 7
		ld	(loc_8DD), a
; ---------------------------------------------------------------------------
		db  3Ah
; ---------------------------------------------------------------------------

loc_8DD:
		rlca
		nop
		ld	e, a
		call	loc_969
		push	hl
		ld	hl, loc_8EE
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_8EE:
		call	loc_999
		push	hl
		ld	hl, loc_8FC
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_8FC:
		ld	a, (hl)
		and	0Fh
		jr	nz, loc_935
		ld	a, 3
		ld	(loc_90A), a

loc_906:
		call	loc_968
; ---------------------------------------------------------------------------
		db  3Eh
; ---------------------------------------------------------------------------

loc_90A:
		nop
		dec	a
		jr	z, loc_91C
		ld	(loc_90A), a
		push	hl
		ld	hl, loc_927
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_91C:
		push	hl
		ld	hl, loc_94C
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_927:
		call	loc_999
		push	hl
		ld	hl, loc_906
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_935:
		add	a, 7
		ld	(loc_93B), a
; ---------------------------------------------------------------------------
		db  3Ah
; ---------------------------------------------------------------------------

loc_93B:
		rlca
		nop
		ld	e, a
		call	loc_969
		push	hl
		ld	hl, loc_94C
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_94C:
		call	loc_999
		inc	hl
		dec	bc
		ld	a, b
		or	c
		jp	z, loc_961
		push	hl
		ld	hl, loc_899
		ld	(loc_789), hl
		pop	hl
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_961:
		xor	a
		ld	(byte_6), a
		jp	loc_78B
; ---------------------------------------------------------------------------

loc_968:
		ld	a, e

loc_969:
		ld	(iy+0),	2Ah
		add	a, d
		ld	d, a
		ex	af, af'
; ---------------------------------------------------------------------------
		db 3Eh
; ---------------------------------------------------------------------------

loc_971:
		nop
		bit	1, a
		jp	nz, loc_98C
		bit	0, a
		jp	nz, loc_981
		ex	af, af'
		ld	(iy+1),	a
		ret
; ---------------------------------------------------------------------------

loc_981:
		ex	af, af'
		add	a, 80h
		sra	a
		add	a, 80h
		ld	(iy+1),	a
		ret
; ---------------------------------------------------------------------------

loc_98C:
		ex	af, af'
		add	a, 80h
		sra	a
		sra	a
		add	a, 80h
		ld	(iy+1),	a
		ret
; ---------------------------------------------------------------------------

loc_999:
		ld	(iy+0),	2Ah
; ---------------------------------------------------------------------------
		db 3Eh
; ---------------------------------------------------------------------------

loc_99E:
		nop
		bit	1, a
		jp	nz, loc_9BA
		bit	0, a
		jp	nz, loc_9AF
		nop
		nop
		ld	(iy+1),	d
		ret
; ---------------------------------------------------------------------------

loc_9AF:
		ld	a, d
		add	a, 80h
		sra	a
		add	a, 80h
		ld	(iy+1),	a
		ret
; ---------------------------------------------------------------------------

loc_9BA:
		ld	a, d
		add	a, 80h
		sra	a
		sra	a
		add	a, 80h
		ld	(iy+1),	a
		ret

; =============== S U B R O U T I N E =======================================

sub_9C7:
		bit	7, (iy+0)
		jr	nz, sub_9C7
		ld	(iy+0),	2Bh
		nop
		nop

loc_9D3:
		bit	7, (iy+0)
		jr	nz, loc_9D3
		ld	(iy+1),	80h
		ret
; End of function sub_9C7

; =============== S U B R O U T I N E =======================================

sub_9DE:
		bit	7, (iy+0)
		jr	nz, sub_9DE
		ld	(iy+2),	0B6h
		nop
		nop

loc_9EA:
		bit	7, (iy+0)
		jr	nz, loc_9EA
		ld	(iy+3),	0C0h
		ret
; End of function sub_9DE

; =============== S U B R O U T I N E =======================================

sub_9F5:
		bit	7, (iy+0)
		jr	nz, sub_9DE
		ld	(iy+2),	0B6h
		nop
		nop

loc_A01:
		bit	7, (iy+0)
		jr	nz, loc_A01
		ld	(iy+3),	a
		ret
; End of function sub_9F5

; =============== S U B R O U T I N E =======================================

sub_A0B:
		ld	a, (byte_49B)
		cp	l
		jr	nz, sub_A18
		ld	a, (byte_49C)
		cp	h
		jr	nz, sub_A18
		ret
; End of function sub_A0B

; =============== S U B R O U T I N E =======================================

sub_A18:
		ld	(byte_49B), hl
		ld	a, l
		rlca
		ld	(6000h), a
		ld	a, h
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		rrca
		ld	(6000h), a
		ret
; End of function sub_A18

; =============== S U B R O U T I N E =======================================

sub_A41:
		ld	hl, 4000h
		ld	b, 8
		ld	d, 28h
		ld	e, 7

loc_A4A:
		call	sub_A79
		dec	e
		djnz	loc_A4A
		ld	b, 0Fh
		ld	c, 4Eh
		ld	d, 8Eh
		ld	e, 0FFh

loc_A58:
		ld	hl, 4000h
		call	sub_A79
		call	sub_A8A
		ld	hl, 4002h
		call	sub_A79
		call	sub_A8A
		dec	c
		dec	d
		djnz	loc_A58
		ret
; End of function sub_A41

; =============== S U B R O U T I N E =======================================

sub_A6F:
		ld	hl, 4000h
		ld	d, 22h
		ld	e, 0
		jp	sub_A79
; End of function sub_A6F

; =============== S U B R O U T I N E =======================================

sub_A79:
		bit	7, (iy+0)
		jr	nz, sub_A79
		ld	(hl), d
		inc	hl

loc_A81:
		bit	7, (iy+0)
		jr	nz, loc_A81
		ld	(hl), e
		dec	hl
		ret
; End of function sub_A79

; =============== S U B R O U T I N E =======================================

sub_A8A:
		bit	7, (iy+0)
		jr	nz, sub_A8A
		ld	(hl), c
		inc	hl

loc_A92:
		bit	7, (iy+0)
		jr	nz, loc_A92
		ld	(hl), e
		dec	hl
		ret
; End of function sub_A8A
; ---------------------------------------------------------------------------
		nop
; end of 'ROM'

		END
