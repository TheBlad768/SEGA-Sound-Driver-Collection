; ---------------------------------------------------------------------------
; Sonic 1 Master System Sound Driver(Without SFX).
; Comments were taken from Sonic 1 Master System Disassembly.
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

SMS_SoundDriver:
		save
		!org	0							; z80 Align, handled by the build process
		CPU Z80undoc
		listing purecode
		di								; Disable interrupts
		ld	sp, 2000h					; set the stack pointer to 0x2000 (end of z80 RAM)
		jp	_loadMusicBank
; ---------------------------------------------------------------------------

zCurrentMusic:	db 0 	; byte
zCurrentBank:	db (Z80SMS_MusicData>>15) 	; byte

		align 38h

; =============== S U B R O U T I N E =======================================

_loadMusicSlot:
		exx
		inc	bc
		exx
		call	_MusicIndex
		ld	a, (zCurrentMusic)
		cp	80h
		jr	z, +
		call	sub_70
		call	j__playMusic
		ld	a, 80h
		ld	(zCurrentMusic),	a
+		ei
		reti
; End of function _loadMusicSlot

; =============== S U B R O U T I N E =======================================

_loadMusicBank:
		im	1					; set interrupt mode 1
		ld	hl, 6000h
		ld	b, 8
		ld	a, (zCurrentBank)
-		ld	(hl), a
		rrca
		djnz	-
		xor	a
		ld	(hl), a
		nop
		ld	a, 80h
		ld	(zCurrentMusic),	a
		call	sub_70
		ei
		jp	$
; End of function _loadMusicBank

; =============== S U B R O U T I N E =======================================

sub_70:
		push	af
		ld	hl, 1C00h
		ld	bc, 220h
		ld	a, 0
-		ld	(hl), a
		inc	hl
		dec	bc
		cp	b
		jr	nz, -
		pop	af
		ret
; End of function sub_70

; =============== S U B R O U T I N E =======================================

_MusicIndex:
		jp	_update
; ---------------------------------------------------------------------------
		jp	_loadMusic
; ---------------------------------------------------------------------------
		jp	_stop
; End of function _MusicIndex

; =============== S U B R O U T I N E =======================================

j__playMusic:
		jp	_playMusic
; End of function j__playMusic

; =============== S U B R O U T I N E =======================================

_loadMusic:
		push	af
		push	bc
		push	de
		push	hl
		push	ix
		ld	c, l
		ld	b, h
		ld	ix, 1C1Ch
		ld	a, 5
-		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ex	de, hl
		add	hl, bc
		ld	(ix+0),	l
		inc	ix
		ld	(ix+0),	h
		inc	ix
		ex	de, hl
		dec	a
		jp	nz, -
		ld	hl, initTrackValues_words
-		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, d
		inc	a
		jr	z, +
		inc	hl
		ldi
		ldi
		jp	-
; ---------------------------------------------------------------------------
+		ld	hl, initTrackValues_bytes
-		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		ld	a, d
		inc	a
		jr	z, +
		inc	hl
		ldi
		jp	-
; ---------------------------------------------------------------------------
+		pop	ix
		pop	hl
		pop	de
		pop	bc
		pop	af
		ld	(1C4Fh), hl
		ld	(1C7Ch), hl
		ld	(1CA9h), hl
		ld	(1CD6h), hl
		ret
; End of function _loadMusic
; ---------------------------------------------------------------------------

initTrackValues_words:
		dw 1C48h
		dw 0
		dw 1C75h
		dw 0
		dw 1CA2h
		dw 0
		dw 1CCFh
		dw 0
		dw 1C46h
		dw 107h
		dw 1C73h
		dw 1008h
		dw 1CA0h
		dw 1009h
		dw 1CCDh
		dw 100Ah
		dw 1C28h
		dw 1
		dw 1C55h
		dw 1
		dw 1C82h
		dw 1
		dw 1CAFh
		dw 1
		dw 1C3Dh
		dw 0
		dw 1C42h
		dw 0
		dw 1C6Ah
		dw 0
		dw 1C6Fh
		dw 0
		dw 1C97h
		dw 0
		dw 1C9Ch
		dw 0
		dw 1CC4h
		dw 0
		dw 1CC9h
		dw 0
		dw 1C2Eh
		dw 0
		dw 1C5Bh
		dw 0
		dw 1C88h
		dw 0
		dw 1CB5h
		dw 0
		dw 1C0Ah
		dw 1
		dw 0FFFFh
initTrackValues_bytes:
		dw 1C26h
		db 80h
		dw 1C27h
		db 90h
		dw 1C53h
		db 0A0h
		dw 1C54h
		db 0B0h
		dw 1C80h
		db 0C0h
		dw 1C81h
		db 0D0h
		dw 1CADh
		db 0E0h
		dw 1CAEh
		db 0F0h
		dw 1C4Eh
		db 2
		dw 1C7Bh
		db 2
		dw 1CA8h
		db 2
		dw 1CD5h
		db 2
		dw 1D02h
		db 0
		dw 1C3Ah
		db 0
		dw 1C67h
		db 0
		dw 1C94h
		db 0
		dw 1CC1h
		db 0
		dw 1C3Bh
		db 0
		dw 1C68h
		db 0
		dw 1C95h
		db 0
		dw 1CC2h
		db 0
		dw 1C51h
		db 0
		dw 1C7Eh
		db 1
		dw 1CABh
		db 2
		dw 1CD8h
		db 3
		dw 1C06h
		db 0
		dw 1C04h
		db 0
		dw 0FFFFh
_initPSGValues:
		db 9Fh		; Silence PSG 1
		db 0BFh		; Silence PSG 2
		db 0DFh		; Silence PSG 3
		db 0FFh		; Silence noise channel

; =============== S U B R O U T I N E =======================================

_stop:
		push	af
		push	hl
		push	bc
		ld	a, (1C4Eh)
		and	0FDh
		ld	(1C4Eh), a
		ld	a, (1C7Bh)
		and	0FDh
		ld	(1C7Bh), a
		ld	a, (1CA8h)
		and	0FDh
		ld	(1CA8h), a
		ld	a, (1CD5h)
		and	0FDh
		ld	(1CD5h), a
		ld	a, (1D02h)
		and	0FDh
		ld	(1D02h), a
		xor	a
		ld	(1C06h), a
		ld	b, 4
		ld	c, 7Fh
		ld	hl, _initPSGValues
		otir
		ld	a, (1C04h)
		and	0F7h
		ld	(1C04h), a
		pop	bc
		pop	hl
		pop	af
		ret
; End of function _stop
; ---------------------------------------------------------------------------
		db 80h		; Unused?
		db 90h
		db 0A0h
		db 0B0h
		db 0C0h
		db 0D0h
		db 0E0h
		db 0F0h

; =============== S U B R O U T I N E =======================================

_update:
		ld	ix, 1C26h
		ld	de, (1C1Ch)
		ld	bc, (1C0Ah)
		call	_updateTrack
		ld	(1C14h), ix
		ld	(1C1Ch), de
		ld	ix, 1C53h
		ld	de, (1C1Eh)
		ld	bc, (1C0Ah)
		call	_updateTrack
		ld	(1C16h), ix
		ld	(1C1Eh), de
		ld	ix, 1C80h
		ld	de, (1C20h)
		ld	bc, (1C0Ah)
		call	_updateTrack
		ld	(1C18h), ix
		ld	(1C20h), de
		ld	ix, 1CADh
		ld	de, (1C22h)
		ld	bc, (1C0Ah)
		call	_updateTrack
		ld	(1C1Ah), ix
		ld	(1C22h), de
		ld	ix, 1CDAh
		ld	de, (1C24h)
		ld	bc, (1C0Eh)
		call	_updateTrack
		ld	(1C24h), de
		bit	1, (ix+28h)
		jr	z, +
		ld	hl, 1C14h
		ld	a, (1C05h)
		add	a, a
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	(hl), 0DAh
		inc	hl
		ld	(hl), 0DCh
+		ld	ix, (1C14h)
		call	_processTrack
		ld	ix, (1C16h)
		call	_processTrack
		ld	ix, (1C18h)
		call	_processTrack
		ld	ix, (1C1Ah)
		call	_processTrack
		ld	a, (1C04h)
		and	8
		ret	z
		ld	hl, (1C10h)
		ld	bc, (1C12h)
		and	a
		sbc	hl, bc
		jr	nc, +
		call	_stop
+		ld	(1C10h), hl
		ret
; End of function _update

; =============== S U B R O U T I N E =======================================

_updateTrack:
		bit	1, (ix+28h)
		ret	z
		ld	l, (ix+2)
		ld	h, (ix+3)
		and	a
		sbc	hl, bc
		ld	(ix+2),	l
		ld	(ix+3),	h
		jr	z, _trackReadLoop
		jp	nc, loc_37D

_trackReadLoop:
		ld	a, (de)
		and	a
		jp	m, _doCommand
		cp	70h
		jr	c, _doNote
		cp	7Fh
		jr	nz, _doNoiseNote
		ld	(ix+1Eh), 0
		jp	_doNoteLength
; ---------------------------------------------------------------------------

_doNoiseNote:
		push	de
		push	ix
		pop	hl
		ld	bc, 0Eh
		add	hl, bc
		ex	de, hl
		and	0Fh
		ld	l, a
		ld	h, 0
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, _noiseNoteValues
		add	hl, bc
		ld	a, (hl)
		ld	(ix+25h), a
		inc	hl
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		pop	de
		jp	_resetModValues
; ---------------------------------------------------------------------------

_doNote:
		and	0Fh
		ld	hl, _PSGfrequencyValues
		add	a, a
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		ld	(ix+6),	a
		inc	hl
		ld	a, (hl)
		ld	(ix+7),	a
		ld	a, (de)
		rrca
		rrca
		rrca
		rrca
		and	0Fh
		ld	(ix+1Fh), a
		bit	0, (ix+28h)
		jr	nz, _doNoteLength

_resetModValues:
		ld	a, (ix+14h)
		ld	(ix+19h), a
		ld	a, (ix+15h)
		ld	(ix+1Ah), a
		ld	a, (ix+16h)
		srl	a
		ld	(ix+1Bh), a
		ld	a, (ix+17h)
		ld	(ix+1Ch), a
		ld	a, (ix+18h)
		ld	(ix+1Dh), a
		xor	a
		ld	(ix+0Ah), a
		ld	(ix+0Bh), a
		ld	(ix+0Dh), a
		ld	(ix+0Ch), a
		ld	(ix+1Eh), 0Fh

_doNoteLength:
		inc	de
		ld	a, (de)
		inc	de
		and	a
		jr	nz, +
		ld	a, (ix+24h)
+		push	de
		ld	c, a
		ld	l, (ix+26h)
		ld	h, (ix+27h)
		ld	a, l
		or	h
		jr	nz, +
		ld	hl, (1C08h)
+		call	_calcTickTime
		pop	de
		ld	a, l
		add	a, (ix+2)
		ld	(ix+2),	a
		ld	a, h
		adc	a, (ix+3)
		ld	(ix+3),	a

loc_37D:
		res	0, (ix+28h)
		ret
; End of function _updateTrack
; ---------------------------------------------------------------------------

_noiseNoteValues:
		db 5, 0FFh, 0BEh, 0Ah,	4, 5, 2, 0, 5, 0E6h, 24h, 5Ah, 14h
		db 28h,	8, 0

; =============== S U B R O U T I N E =======================================

_processTrack:
		bit	1, (ix+28h)
		ret	z
		ld	a, (ix+0Dh)
		and	a
		jp	z, _ADSRenvelopeAttack
		dec	a
		jp	z, _ADSRenvelopeDecay1
		dec	a
		jp	z, _ADSRenvelopeDecay2
		dec	a
		jp	z, _ADSRenvelopeSustain

_doTrackSoundOut:
		ld	a, (ix+0)
		cp	0E0h
		jr	nz, _doModulation
		ld	c, (ix+25h)
		ld	a, (1C07h)
		cp	c
		jp	z, _sendVolume
		ld	a, c
		ld	(1C07h), a
		or	0E0h
		ld	(7F11h), a
		jp	_sendVolume
; ---------------------------------------------------------------------------

_doModulation:
		ld	e, (ix+0Ah)
		ld	d, (ix+0Bh)
		ld	a, (ix+19h)
		and	a
		jr	z, +
		dec	(ix+19h)
		jp	_sendFrequency
; ---------------------------------------------------------------------------
+		dec	(ix+1Ah)
		jp	nz, _sendFrequency
		ld	a, (ix+15h)
		ld	(ix+1Ah), a
		ld	l, (ix+1Ch)
		ld	h, (ix+1Dh)
		dec	(ix+1Bh)
		jp	nz, +
		ld	a, (ix+16h)
		ld	(ix+1Bh), a
		ld	a, l
		cpl
		ld	l, a
		ld	a, h
		cpl
		ld	h, a
		inc	hl
		ld	(ix+1Ch), l
		ld	(ix+1Dh), h
		jp	_sendFrequency
; ---------------------------------------------------------------------------
+		add	hl, de
		ld	(ix+0Ah), l
		ld	(ix+0Bh), h
		ex	de, hl

_sendFrequency:
		ld	l, (ix+6)
		ld	h, (ix+7)
		ld	c, (ix+8)
		ld	b, (ix+9)
		add	hl, bc
		add	hl, de
		ld	a, (ix+1Fh)
		and	a
		jr	z, +
		ld	b, a
-		srl	h
		rr	l
		djnz	-
+		ld	a, l
		and	0Fh
		or	(ix+0)
		ld	(7F11h), a
		ld	a, h
		rlca
		rlca
		rlca
		rlca
		and	0F0h
		ld	c, a
		ld	a, l
		rrca
		rrca
		rrca
		rrca
		and	0Fh
		or	c
		ld	(7F11h), a

_sendVolume:
		ld	a, (ix+5)
		and	a
		jr	z, +
		ld	c, a
		ld	a, (ix+0Ch)
		and	a
		jr	z, +
		ld	l, a
		ld	h, 0
		call	_calcTickTime
		rl	l
		ld	a, 0
		adc	a, h
+		and	(ix+1Eh)
		xor	0Fh
		or	(ix+1)
		ld	(7F11h), a
		ld	a, (1C04h)
		and	8
		ret	z
		ld	a, (ix+2Bh)
		cp	4
		ret	z
		ld	l, (ix+4)
		ld	h, (ix+5)
		ld	bc, (1C12h)
		sbc	hl, bc
		jr	nc, +
		ld	hl, 0
+		ld	(ix+4),	l
		ld	(ix+5),	h
		ret
; ---------------------------------------------------------------------------

_PSGfrequencyValues:
		dw 356h, 326h, 2F9h, 2CEh, 2A5h, 280h, 25Ch, 23Ah, 21Ah
		dw 1FBh, 1DFh, 1C4h, 3F7h, 3BEh, 388h
; ---------------------------------------------------------------------------

_doCommand:
		cp	0FFh
		jp	z, _cmdFF_stopMusic
		cp	0FEh
		jp	z, _cmdFE_stopSFX
		inc	de
		ld	hl, _commandPointers
		add	a, a
		ld	c, a
		ld	b, 0
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		jp	(hl)
; ---------------------------------------------------------------------------

_cmdFF_stopMusic:
		ld	l, (ix+22h)
		ld	h, (ix+23h)
		ld	a, l
		or	h
		jr	z, _stopTrack
		ex	de, hl
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmdFE_stopSFX:
		xor	a
		ld	(1C06h), a

_stopTrack:
		res	1, (ix+28h)
		ld	a, 0Fh
		or	(ix+1)
		ld	(7F11h), a
		ret
; ---------------------------------------------------------------------------

_commandPointers:
		dw _cmd80_tempo
		dw _cmd81_volumeSet
		dw _cmd82_setADSR
		dw _cmd83_modulation
		dw _cmd84_detune
		dw _cmd85_dummy
		dw _cmd86_loopStart
		dw _cmd87_loopEnd
		dw _cmd88_masterLoop
		dw _cmd89_noiseMode
		dw _cmd8A_noteLength
		dw _cmd8B_volumeUp
		dw _cmd8C_volumeDown
		dw _cmd8D_hold
; ---------------------------------------------------------------------------

_ADSRenvelopeAttack:
		ld	a, (ix+0Eh)
		add	a, (ix+0Ch)
		jp	nc, +
		ld	a, 0FFh
+		ld	(ix+0Ch), a
		jp	nc, _doTrackSoundOut
		inc	(ix+0Dh)
		jp	_doTrackSoundOut
; ---------------------------------------------------------------------------

_ADSRenvelopeDecay1:
		ld	c, (ix+10h)
		ld	a, (ix+0Ch)
		sub	(ix+0Fh)
		jr	c, +
		cp	(ix+10h)
		jr	c, +
		ld	c, a
+		ld	(ix+0Ch), c
		jp	nc, _doTrackSoundOut
		inc	(ix+0Dh)
		jp	_doTrackSoundOut
; ---------------------------------------------------------------------------

_ADSRenvelopeDecay2:
		ld	c, (ix+12h)
		ld	a, (ix+0Ch)
		sub	(ix+11h)
		jr	c, +
		cp	(ix+12h)
		jp	c, +
		ld	c, a
+		ld	(ix+0Ch), c
		jp	nc, _doTrackSoundOut
		inc	(ix+0Dh)
		jp	_doTrackSoundOut
; ---------------------------------------------------------------------------

_ADSRenvelopeSustain:
		ld	a, (ix+0Ch)
		sub	(ix+13h)
		jp	nc, +
		ld	a, 0
+		ld	(ix+0Ch), a
		jp	nc, _doTrackSoundOut
		inc	(ix+0Dh)
		jp	_doTrackSoundOut
; End of function _processTrack
; ---------------------------------------------------------------------------

_cmd80_tempo:
		ld	a, (de)
		ld	(ix+26h), a
		ld	(1C08h), a
		inc	de
		ld	a, (de)
		ld	(ix+27h), a
		ld	(1C09h), a
		inc	de
		ld	a, (de)
		ld	(1C0Ah), a
		ld	(1C0Ch), a
		inc	de
		ld	a, (de)
		ld	(1C0Bh), a
		ld	(1C0Dh), a
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd81_volumeSet:
		ld	a, (de)
		ld	(ix+2Ch), a
		inc	de
		ld	a, (ix+2Bh)
		cp	4
		jr	z, +
		ld	a, (1C04h)
		and	8
		jp	nz, _trackReadLoop
+		ld	a, (ix+2Ch)
		ld	(ix+5),	a
		ld	(ix+4),	0
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd82_setADSR:
		push	ix
		pop	hl
		ld	bc, 0Eh
		add	hl, bc
		ex	de, hl
		ldi
		ldi
		ldi
		ldi
		ldi
		ldi
		ex	de, hl
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd83_modulation:
		push	ix
		pop	hl
		ld	bc, 14h
		add	hl, bc
		ex	de, hl
		ldi
		ldi
		ldi
		ldi
		ldi
		ex	de, hl
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd84_detune:
		ld	a, (de)
		ld	(ix+8),	a
		inc	de
		ld	a, (de)
		ld	(ix+9),	a
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd85_dummy:
		ld	a, (de)
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd86_loopStart:
		ld	l, (ix+20h)
		ld	h, (ix+21h)
		ld	(hl), 0
		ld	bc, 5
		add	hl, bc
		ld	(ix+20h), l
		ld	(ix+21h), h
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd87_loopEnd:
		ld	l, (ix+20h)
		ld	h, (ix+21h)
		ld	bc, 0FFFBh
		add	hl, bc
		ld	a, (hl)
		and	a
		jr	nz, _loopInit
		ld	a, (de)
		dec	a
		jr	z, ++
		ld	(hl), a
		jp	+
; ---------------------------------------------------------------------------

_loopInit:
		dec	(hl)
		jr	z, ++
+		ex	de, hl
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	c, (ix+29h)
		ld	b, (ix+2Ah)
		add	hl, bc
		ex	de, hl
		jp	_trackReadLoop
; ---------------------------------------------------------------------------
+		ld	(ix+20h), l
		ld	(ix+21h), h
		inc	de
		inc	de
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd88_masterLoop:
		ld	(ix+22h), e
		ld	(ix+23h), d
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd89_noiseMode:
		ld	a, (de)
		ld	(ix+25h), a
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd8A_noteLength:
		ld	a, (de)
		ld	(ix+24h), a
		inc	de
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd8B_volumeUp:
		ld	a, (ix+2Ch)
		inc	a
		cp	10h
		jr	c, +
		ld	a, 0Fh
+		ld	(ix+2Ch), a
		ld	a, (1C04h)
		and	8
		jp	nz, _trackReadLoop
		ld	a, (ix+2Ch)
		ld	(ix+5),	a
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd8C_volumeDown:
		ld	a, (ix+2Ch)
		dec	a
		cp	10h
		jr	c, +
		xor	a
+		ld	(ix+2Ch), a
		ld	a, (1C04h)
		and	8
		jp	nz, _trackReadLoop
		ld	a, (ix+2Ch)
		ld	(ix+5),	a
		jp	_trackReadLoop
; ---------------------------------------------------------------------------

_cmd8D_hold:
		set	0, (ix+28h)
		jp	_trackReadLoop

; =============== S U B R O U T I N E =======================================

_calcTickTime:
		xor	a
		ld	b, 7
		ex	de, hl
		ld	l, a
		ld	h, a
-		rl	c
		jp	nc, +
		add	hl, de
+		add	hl, hl
		djnz	-
		or	c
		ret	z
		add	hl, de
		ret
; End of function _calcTickTime

; =============== S U B R O U T I N E =======================================

_playMusic:
		push	hl
		ld	hl, S1_MusicPointers
		add	a, a
		add	a, l
		ld	l, a
		ld	a, 0
		adc	a, h
		ld	h, a
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		call	_loadMusic
		pop	hl
		ret
; End of function _playMusic
; ---------------------------------------------------------------------------

SMSMusicOffset macro offset
	db offset&0FFh,(offset>>8|080h)&0FFh
    endm
; ---------------------------------------------------------------------------

S1_MusicPointers:
		SMSMusicOffset Z80SMS_Music0 ; Stop
		SMSMusicOffset Z80SMS_Music1 ; GREEN HILL ZONE
		SMSMusicOffset Z80SMS_Music2 ; BRIDGE ZONE
		SMSMusicOffset Z80SMS_Music3 ; JUNGLE ZONE
		SMSMusicOffset Z80SMS_Music4 ; MARBLE ZONE
		SMSMusicOffset Z80SMS_Music5 ; LABYRINTH ZONE
		SMSMusicOffset Z80SMS_Music6 ; SCRAP BRAIN ZONE
		SMSMusicOffset Z80SMS_Music7 ; SKY BASE ZONE
		SMSMusicOffset Z80SMS_Music8 ; BONUS ZONE
		SMSMusicOffset Z80SMS_Music9 ; ENDING THEME
		SMSMusicOffset Z80SMS_MusicA ; BOSS THEME
		SMSMusicOffset Z80SMS_MusicB ; TITLE SCREEN
		SMSMusicOffset Z80SMS_MusicC ; ACT START
		SMSMusicOffset Z80SMS_MusicD ; INVINCIBLE
		SMSMusicOffset Z80SMS_MusicE ; ACT COMPLETE
		SMSMusicOffset Z80SMS_MusicF ; DEATH THEME
		SMSMusicOffset Z80SMS_Music10 ; GOOD END
		SMSMusicOffset Z80SMS_Music11 ; CHAOS EMERALD
; ---------------------------------------------------------------------------

SMS_SoundDriver_End:

		restore
		padding off
		!org		SMS_SoundDriver+SMS_SoundDriver_End