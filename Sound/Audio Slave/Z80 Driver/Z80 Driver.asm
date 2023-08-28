; ---------------------------------------------------------------------------
; Audios Wave Slave MD
; Z80 DAC Driver
;
; Disassembled by Vladikcomper
; ---------------------------------------------------------------------------

DAC_BANK_1: 				equ ($120000>>15)
DAC_BANK_2: 				equ ($128000>>15)
; ---------------------------------------------------------------------------
		!org	0
		CPU Z80
		listing on
		jp	InitDriver
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		jp	InterruptHandler
; ---------------------------------------------------------------------------

InitDriver:
		ld	sp, 1CDh	; init stack pointer
		di			; disable interrupts

		; Init driver's RAM
		xor	a		; a = 0
		ld	(200h),	a	; Clear YM commands list #1
		ld	(300h),	a	; Clear YM commands list #2
		ld	(400h),	a	; Clear DAC A pitch
		ld	(406h),	a	; Clear DAC B pitch
		ld	(409h),	a
		ld	(40Ah),	a
		ld	(40Ch),	a
		ld	(40Dh),	a	; Clear 68k transfer flag
		ld	a, 1
		ld	(401h),	a	; Disable DAC A
		ld	(407h),	a	; Disable DAC B
		ld	a, 80h
		ld	(402h),	a
		ld	(405h),	a
		ld	(408h),	a
		ld	(40Bh),	a

		; Setup YM registers for DAC playback
		ld	a, 2Bh
		ld	(4000h), a		; YM Register 2Bh
		ld	a, 80h
		ld	(4001h), a		; = Enable DAC
		ld	a, 0B6h
		ld	(4002h), a		; YM Register B6h
		ld	a, 0C0h
		ld	(4003h), a		; = Setup DAC panning

		; Init DAC data
		ld	ix, 8000h
		ld	(DAC_A_Pos), ix		; Set DAC A pos	to 8000h
		ld	de, 0BB8h
		ld	(DAC_A_Length),	de	; Set DAC A length
		ld	b, 6Eh
		ld	iy, 8000h
		ld	(DAC_B_Pos), iy		; Set DAC B post to 8000h
		ld	hl, 990h
		ld	(DAC_B_Length),	hl	; Set DAC B length
		ld	c, 0
		exx
		ld	bc, 4001h
		ld	d, 80h
		ld	e, 7Fh
		ld	l, 80h
		exx
		ld	a, 2Ah
		ld	(4000h), a		; Set YM2612 to	fetch PCM byte

MainLoop:
		ld	a, (40Dh)		; Load 68k transfer flag
		or	a			; Is the flag set?
		jp	nz, LoadDataFrom68k	; If yes, branch
; ---------------------------------------------------------------------------
; Routine to playback DAC samples
; ---------------------------------------------------------------------------

UpdatePCM:
		exx
		ld	a, (ix+0)		; Load DAC A byte
		add	a, (iy+0)		; Add DAC B byte to it
		jp	po, PCM_NoChange
		jp	m, PCM_Max
		ld	a, d			; a = 80h
		jp	WritePCM

PCM_Max:
		ld	a, e			; a = 7Fh
		jp	WritePCM

PCM_NoChange:
		nop
		nop
		nop
		nop
		nop
		nop

WritePCM:
		add	a, l			; a += 80h
		ld	(bc), a			; send PCM byte	to YM
		exx
; ---------------------------------------------------------------------------

;Update_DAC_A:
		ld	a, (DAC_A_PitchByte)
		add	a, b
		ld	(DAC_A_PitchByte), a
		jp	nc, Update_DAC_B_Sync
		inc	ix			; Next DAC A byte
		dec	de			; Decrease length
		ld	a, d
		or	e
		jp	nz, Update_DAC_B	; If length is not zero, branch
		ld	de, (DAC_A_Length)	; Load new length
		ld	ix, (DAC_A_Pos)		; Load new pos
		jp	Update_DAC_B
; ---------------------------------------------------------------------------

Update_DAC_B_Sync:
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop

Update_DAC_B:
		ld	a, (DAC_B_PitchByte)
		add	a, c
		ld	(DAC_B_PitchByte), a
		jp	nc, ToMainLoop_Sync
		inc	iy			; Next DAC B byte
		dec	hl			; Decrease length
		ld	a, h
		or	l
		jp	nz, MainLoop		; If length is not zero, branch
		ld	hl, (DAC_B_Length)	; Load new length
		ld	iy, (DAC_B_Pos)		; Load new pos
		jp	MainLoop
; ---------------------------------------------------------------------------

ToMainLoop_Sync:
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		jp	MainLoop
; ---------------------------------------------------------------------------
; Routine to load data stored by 68k side of Audios
; Basically, it's YM commands and DAC settings
; ---------------------------------------------------------------------------

LoadDataFrom68k:
		push	af
		push	bc

;SetYM:
		ld	bc, 200h	; Load from address 200h

SetYM_Loop:
		ld	a, (bc)
		or	a
		jp	z, SetYM_2	; If data byte is zero,	quit
		ld	(4000h), a	; Set register number
		inc	bc
		ld	a, (bc)
		ld	(4001h), a	; Set register value
		inc	bc
		jp	SetYM_Loop
; ---------------------------------------------------------------------------

SetYM_2:
		xor	a
		ld	(200h),	a
		ld	(40Dh),	a
		ld	bc, 300h	; Load from address 300h

SetYM_Loop_2:
		ld	a, (bc)
		or	a
		jp	z, Load_DAC_Data ; if data byte	is zero, quit
		ld	(4002h), a	; Set register number
		inc	bc
		ld	a, (bc)
		ld	(4003h), a	; Set register value
		inc	bc
		jp	SetYM_Loop_2
; ---------------------------------------------------------------------------

Load_DAC_Data:
		xor	a
		ld	(300h),	a
		ld	bc, (402h)
		ld	(DAC_A_Pos), bc	; Load DAC A position in ROM bank
		ld	bc, (404h)
		ld	(DAC_A_Length),	bc ; Load DAC A	length
		ld	bc, (408h)
		ld	(DAC_B_Pos), bc	; Load DAC B position in bytes
		ld	bc, (40Ah)
		ld	(DAC_B_Length),	bc ; Load DAC B	length
		ld	a, (401h)	; Load DAC A disable flag
		or	a		; Is the flag set?
		jr	z, Chk_DAC_B	; If not, branch
		ld	de, 1		; Reset	DAC length

Chk_DAC_B:
		ld	a, (407h)	; Load DAC B disable flag
		or	a		; Is the flag set?
		jr	z, +		; If not, branch
		ld	hl, 1		; Reset	DAC length

+		ld	b,DAC_BANK_1	; bank #1 value
		ld	a,(40Ch)			; load bank id
		or	a
		jr	z,LoadBank
		ld	b,DAC_BANK_2	; bank #2 value

LoadBank:
		ld	a,b
		ld	bc,6000h
		ld	(bc), a	; A15
		rrca
		ld	(bc), a	; A16
		rrca
		ld	(bc), a	; A17
		rrca
		ld	(bc), a	; A18
		rrca
		ld	(bc), a	; A19
		rrca
		ld	(bc), a	; A20
		rrca
		ld	(bc), a	; A21
		xor	a	; a = 0
		ld	(bc), a	; A22
		ld	(bc), a	; A23

LoadDAC_End:
		ld	a, 2Ah
		ld	(4000h), a	; Set YM2612 to	fetch PCM byte
		pop	bc
		ld	a, (400h)
		ld	b, a		; Set DAC A pitch
		ld	a, (406h)
		ld	c, a		; Set DAC B pitch
		pop	af
		jp	UpdatePCM
; ---------------------------------------------------------------------------

InterruptHandler:
		ei			; enable interrupts
		reti
; ---------------------------------------------------------------------------

DAC_A_PitchByte:db 1
DAC_A_Pos:	dw 1
DAC_A_Length:	dw 1
DAC_B_PitchByte:db 1
DAC_B_Pos:	dw 1
DAC_B_Length:	dw 1

		db    1
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

		END
