; ===========================================================================
; Sonic 2 Clone Driver v2 (By Clownacy).
; ===========================================================================

    if MOMPASS=1
		message "SMPS Clone Driver ROM offset is $\{*}"
    endif

; ---------------------------------------------------------------------------

; Background music
bgm__First:	equ $01
bgm_GHZ:	equ ((ptr_mus81-MusicIndex)/4)+bgm__First
bgm_LZ:		equ ((ptr_mus82-MusicIndex)/4)+bgm__First
bgm_MZ:		equ ((ptr_mus83-MusicIndex)/4)+bgm__First
bgm_SLZ:	equ ((ptr_mus84-MusicIndex)/4)+bgm__First
bgm_SYZ:	equ ((ptr_mus85-MusicIndex)/4)+bgm__First
bgm_SBZ:	equ ((ptr_mus86-MusicIndex)/4)+bgm__First
bgm_Invincible:	equ ((ptr_mus87-MusicIndex)/4)+bgm__First
bgm_ExtraLife:	equ ((ptr_mus88-MusicIndex)/4)+bgm__First
bgm_SS:		equ ((ptr_mus89-MusicIndex)/4)+bgm__First
bgm_Title:	equ ((ptr_mus8A-MusicIndex)/4)+bgm__First
bgm_Ending:	equ ((ptr_mus8B-MusicIndex)/4)+bgm__First
bgm_Boss:	equ ((ptr_mus8C-MusicIndex)/4)+bgm__First
bgm_FZ:		equ ((ptr_mus8D-MusicIndex)/4)+bgm__First
bgm_GotThrough:	equ ((ptr_mus8E-MusicIndex)/4)+bgm__First
bgm_GameOver:	equ ((ptr_mus8F-MusicIndex)/4)+bgm__First
bgm_Continue:	equ ((ptr_mus90-MusicIndex)/4)+bgm__First
bgm_Credits:	equ ((ptr_mus91-MusicIndex)/4)+bgm__First
bgm_Drowning:	equ ((ptr_mus92-MusicIndex)/4)+bgm__First
bgm_Emerald:	equ ((ptr_mus93-MusicIndex)/4)+bgm__First

bgm_Mus1_S2:	equ ((ptr_mus94-MusicIndex)/4)+bgm__First
bgm_Mus2_S2:	equ ((ptr_mus95-MusicIndex)/4)+bgm__First
bgm_Mus3_S2:	equ ((ptr_mus96-MusicIndex)/4)+bgm__First
bgm_Mus4_S2:	equ ((ptr_mus97-MusicIndex)/4)+bgm__First
bgm_Mus5_S2:	equ ((ptr_mus98-MusicIndex)/4)+bgm__First
bgm_Mus6_S2:	equ ((ptr_mus99-MusicIndex)/4)+bgm__First
bgm_Mus7_S2:	equ ((ptr_mus9A-MusicIndex)/4)+bgm__First
bgm_Mus8_S2:	equ ((ptr_mus9B-MusicIndex)/4)+bgm__First
bgm_Mus9_S2:	equ ((ptr_mus9C-MusicIndex)/4)+bgm__First
bgm_MusA_S2:	equ ((ptr_mus9D-MusicIndex)/4)+bgm__First
bgm_MusB_S2:	equ ((ptr_mus9E-MusicIndex)/4)+bgm__First
bgm_MusC_S2:	equ ((ptr_mus9F-MusicIndex)/4)+bgm__First
bgm_MusD_S2:	equ ((ptr_musA0-MusicIndex)/4)+bgm__First
bgm_MusE_S2:	equ ((ptr_musA1-MusicIndex)/4)+bgm__First
bgm_MusF_S2:	equ ((ptr_musA2-MusicIndex)/4)+bgm__First
bgm_Mus10_S2:	equ ((ptr_musA3-MusicIndex)/4)+bgm__First
bgm_Mus11_S2:	equ ((ptr_musA4-MusicIndex)/4)+bgm__First
bgm_Mus12_S2:	equ ((ptr_musA5-MusicIndex)/4)+bgm__First
bgm_Mus13_S2:	equ ((ptr_musA6-MusicIndex)/4)+bgm__First
bgm_Mus14_S2:	equ ((ptr_musA7-MusicIndex)/4)+bgm__First
bgm_Mus15_S2:	equ ((ptr_musA8-MusicIndex)/4)+bgm__First
bgm_Mus16_S2:	equ ((ptr_musA9-MusicIndex)/4)+bgm__First
bgm_Mus17_S2:	equ ((ptr_musAA-MusicIndex)/4)+bgm__First
bgm_Mus18_S2:	equ ((ptr_musAB-MusicIndex)/4)+bgm__First
bgm_Mus19_S2:	equ ((ptr_musAC-MusicIndex)/4)+bgm__First
bgm_Mus1A_S2:	equ ((ptr_musAD-MusicIndex)/4)+bgm__First
bgm_Mus1B_S2:	equ ((ptr_musAE-MusicIndex)/4)+bgm__First
bgm_Mus1C_S2:	equ ((ptr_musAF-MusicIndex)/4)+bgm__First
bgm_Mus1D_S2:	equ ((ptr_musB0-MusicIndex)/4)+bgm__First
bgm_Mus1E_S2:	equ ((ptr_musB1-MusicIndex)/4)+bgm__First
bgm_Mus1F_S2:	equ ((ptr_musB2-MusicIndex)/4)+bgm__First
bgm_Mus20_S2:	equ ((ptr_musB3-MusicIndex)/4)+bgm__First

bgm__Last:	equ ((ptr_musend-MusicIndex-4)/4)+bgm__First

; Sound effects
sfx__First:	equ $80
sfx__Last:	equ ((ptr_sndend-SoundIndex-4)/4)+sfx__First

; Special sound effects
spec__First:	equ sfx__Last+1
spec__Last:	equ ((ptr_specend-SpecSoundIndex-4)/4)+spec__First


flg__First:	equ $FA
sfx_Fade:	equ ((ptr_flgFA-Sound_ExIndex)/4)+flg__First
bgm_Fade:	equ ((ptr_flgFB-Sound_ExIndex)/4)+flg__First
sfx_Sega:	equ ((ptr_flgFC-Sound_ExIndex)/4)+flg__First
bgm_Speedup:	equ ((ptr_flgFD-Sound_ExIndex)/4)+flg__First
bgm_Slowdown:	equ ((ptr_flgFE-Sound_ExIndex)/4)+flg__First
bgm_Stop:	equ ((ptr_flgFF-Sound_ExIndex)/4)+flg__First
flg__Last:	equ ((ptr_flgend-Sound_ExIndex-4)/4)+flg__First


; =================================================================================
; From here on, until otherwise stated, all offsets are relative to v_snddriver_ram
; =================================================================================
; =================================================================================
; Constants
; =================================================================================

Size_of_SegaPCM:		equ $6978
Size_of_DAC_driver_guess:	equ $1760

; Z80 addresses
v_snddriver_ram:  = SoundDriverRAM	; start of RAM for the sound driver data ($5C0 bytes)
z80_version:		equ $A10001
z80_port_1_data:	equ $A10002
z80_port_1_control:	equ $A10008
z80_port_2_control:	equ $A1000A
z80_expansion_control:	equ $A1000C
ym2612_a0:		equ $A04000
ym2612_d0:		equ $A04001
ym2612_a1:		equ $A04002
ym2612_d1:		equ $A04003
; ---------------------------------------------------------------------------

allOptimizations = 1
;	| If 1, enables all optimizations
;
removeJmpTos = 1|allOptimizations
;	| If 1, many unnecessary JmpTos are removed, improving performance
;
addsubOptimize = 1|allOptimizations
;	| If 1, some add/sub instructions are optimized to addq/subq
;
relativeLea = 1|allOptimizations
;	| If 1, makes some instructions use pc-relative addressing, instead of absolute long

; Clone Driver v2 flags and stuff

TargetDisasm    = 3
;	| 1 for Sonic 2 Git
;	| 2 for Sonic 2 Xenowhirl
;	| 3 for Sonic 1 Git
;
SegaPCM_68k     = 0
;	| If 0, the Z80 and Mega PCM handle the SEGA sample playback. If 1, the 68k handles it. I recommend Z80, as with the 68k version, if overclocked, the sound plays wrongly.
;
EnableContSFX   = 0
;	| If 1, include S3K's continuous SFX system.
;
First_ContSFX   = $BC
;	| Set this to the sound ID of your first continous SFX. This ID must be a higher number than any of your normal SFXes.
;	| (Default value is S&K's)
;
	include "sound/SMPS M68K/Sonic 2 Clone Driver v2 - Compatibility.asm"
	include "sound/SMPS M68K/Sonic 2 Clone Driver v2 - Constants.asm"

OptimiseSound	  = 1	; change to 1 to optimise sound queuing
; ---------------------------------------------------------------------------

; Macro to wait for when the YM2612 isn't busy
waitYM macro
	nop		; 4(1/0) ; Gotta give the YM2612 some time to read
	nop		; 4(1/0)
	nop		; 4(1/0)
	; If you're gonna overclock your 68k, you may need to pad this out with more 'nop's to avoid missed writes
.loop:
	tst.b	(a0)	; 8(2/0)
	bmi.s	.loop	; 10(2/0) | 8(1/0)
	endm	; optimial cycle count: 24(5/0)

waitYMspec macro target
	nop		; 4(1/0) ; Gotta give the YM2612 some time to read
	nop		; 4(1/0)
	nop		; 4(1/0)
	tst.b	target
	bpl.s	.skip	; 10(2/0) | 8(1/0)
.loop:	tst.b	(a0)	; 8(2/0)
	bmi.s	.loop	; 10(2/0) | 8(1/0)
.skip:
	endm	; optimal cycle count: 18(4/0) + target test cycles

Fix_DriverBugs	= 1
;	| Fix bugs, what else?
;
ReverseFreqs	= 0
;	| Reverse PSG and FM frequencies. Home of 'Rongs'.
;
; ---------------------------------------------------------------------------
; SMPS2ASM conversion core, hacked together to work properly here
; ---------------------------------------------------------------------------
	include "sound/SMPS M68K/_smps2asm_inc.asm"

; ---------------------------------------------------------------------------
; Subroutine to play a sound
; ---------------------------------------------------------------------------

PlaySoundSMPS:
		disableInts2
		move.b	d0,(v_snddriver_ram+v_playsnd1).l
		cmp.w	(MusicPlay_SaveCurrent_Count).w,d0
		beq.s	+
		move.w	d0,(MusicPlay_SaveCurrent_Count).w
		lsl.w	#2,d0
		lea	MusicIndex(pc),a0
		movea.l	-4(a0,d0.w),a0
		lea	(SoundDriverMusicRAM).l,a1
		jsr	(Kos_Decomp).l
+		enableInts2
		rts
; End of function PlaySoundSMPS
; ---------------------------------------------------------------------------
; Subroutine to play a sound
; ---------------------------------------------------------------------------

StopSoundSMPS:
		disableInts2
		move.b	d0,(v_snddriver_ram+v_playsnd1).l
		enableInts2
		rts
; ---------------------------------------------------------------------------
; Subroutine to update music more than once per frame
; (Called by horizontal & vert. interrupts)
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71B4C:
UpdateMusic_SMPS:
	lea	(Clone_Driver_RAM).l,a6		; Clownacy | If you get errors, use (Clone_Driver_RAM).l instead
	clr.b	f_voice_selector(a6)
	tst.b	f_stopmusic(a6)			; Is music paused?
	bne.w	PauseMusic			; If yes, branch
	move.b	v_fadeout_counter(a6),d0
	beq.s	.skipfadeout
	bsr.w	DoFadeOut
; loc_71BA8:
.skipfadeout:
	btst	#f_fadein_flag,misc_flags(a6)
	beq.s	.skipfadein
	bsr.w	DoFadeIn
; loc_71BB2:
.skipfadein:
	tst.l	v_playsnd1(a6)			; Is a music or sound queued for played?
	beq.s	.nosndinput			; If not, branch
	bsr.w	Sound_Play
; loc_71BBC:
.nosndinput:
	tst.b	v_playsnd0(a6)			; Is song queue set for silence?
	beq.s	.nonewsound			; If yes, branch
	bsr.w	Sound_ChkValue
; loc_71BC8:
.nonewsound:
	tst.b   v_spindash_timer(a6)
	beq.s	.notimer
	subq.b	#1,v_spindash_timer(a6)
.notimer:
	; Clownacy | Pretty large rearrangements have been made here for the
	; Sonic 2-style selective PAL mode. With S2's driver, if the drowning music played on a PAL
	; system, the drowning theme would play at 50fps speed, or 'PAL speed'
	; this code is part of that feature's replication
	btst	#6,(Graphics_Flags).w			; is this a PAL console?
	beq.s	.updatemusictracks			; if not, branch
	btst	#f_force_pal_tempo,misc_flags(a6)	; is this song forced to play slow on PAL consoles?
	bne.s	.updatemusictracks			; if so, skip the double-update
	subq.b	#1,v_pal_audio_countdown(a6)		; subtract 1 from the PAL countdown
	bne.s	.updatemusictracks			; if the PAL countdown is not 0, we are not ready to double-update, branch
	move.b	#5,v_pal_audio_countdown(a6)		; if the countdown is now at 0, reset the counter...
	bset	#f_doubleupdate,misc_flags(a6)		; ...and then set the double-update flag

.updatemusictracks:
	bsr.w	TempoWait

	lea	v_dac_track(a6),a5
	tst.b	zTrack.PlaybackControl(a5)		; Is DAC track playing?
	bpl.s	.dacdone				; Branch if not
	bsr.s	UpdateDAC
; loc_71BD4:
.dacdone:
	bclr	#f_updating_dac,misc_flags(a6)
	moveq	#(v_fm6_track-v_fm1_track)/zTrack.len,d7	; 6 FM tracks
; loc_71BDA:
.bgmfmloop:
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)		; Is track playing?
	bpl.s	.bgmfmnext				; Branch if not
	bsr.w	FMUpdateTrack
; loc_71BE6:
.bgmfmnext:
	dbf	d7,.bgmfmloop

	moveq	#(v_psg3_track-v_psg1_track)/zTrack.len,d7	; 3 PSG tracks
; loc_71BEC:
.bgmpsgloop:
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.bgmpsgnext			; Branch if not
	bsr.w	PSGUpdateTrack
; loc_71BF8:
.bgmpsgnext:
	dbf	d7,.bgmpsgloop

	bclr	#f_doubleupdate,misc_flags(a6)	; Clear double-update flag
	bne.s	.updatemusictracks		; Was the flag set? If so, double-update

;.updatesfxtracks:
	move.b	#$80,f_voice_selector(a6)			; Now at SFX tracks
	moveq	#(v_sfx_fm5_track-v_sfx_fm3_track)/zTrack.len,d7	; SFX only has access to 3 FM tracks
; loc_71C04:
.sfxfmloop:
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.sfxfmnext			; Branch if not
	bsr.w	FMUpdateTrack
; loc_71C10:
.sfxfmnext:
	dbf	d7,.sfxfmloop

	moveq	#(v_sfx_psg3_track-v_sfx_psg1_track)/zTrack.len,d7	; SFX only has access to 3 PSG tracks
; loc_71C16:
.sfxpsgloop:
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.sfxpsgnext			; Branch of not
	bsr.w	PSGUpdateTrack
; loc_71C22:
.sfxpsgnext:
	dbf	d7,.sfxpsgloop

    if EnableSpecSFX
	move.b	#$40,f_voice_selector(a6)	; Now at special SFX tracks
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.specfmdone			; Branch if not
	bsr.w	FMUpdateTrack
; loc_71C38:
.specfmdone:
	lea	zTrack.len(a5),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing
	bpl.s	.locret				; Branch if not
	bra.w	PSGUpdateTrack
    endif
; loc_71C44:
;DoStartZ80:
	; From Vladikcomper:
	; ""Mega PCM" doesn't store YM register 2A before writing to port in playback loop,
	; this is odd and getting rid of it gives a small speed-up.
	; Register is stored before playback and driver relies that it won't be changed.
	; However, SMPS does writes to YM, storing different registers.
	; So, it must restore register 2A before releasing Z80 bus and continuing Z80 playback program."
	; "This pulls a little trick required for Mega PCM. We'll need this one, but not here."
;	move.b	(ym2612_a0).l,d2
;	tst.b	d2
;	bmi.s	DoStartZ80
;	move.b	#$2A,(ym2612_a0).l

;	startZ80
.locret:
	rts
; End of function UpdateMusic_SMPS


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71C4E:
UpdateDAC:
	subq.b	#1,zTrack.DurationTimeout(a5)	; Has DAC sample timeout expired?
	bne.s	locret_71CAA			; Return if not
	bset	#f_updating_dac,misc_flags(a6)	; Set flag to indicate this is the DAC
	movea.l	zTrack.DataPointer(a5),a4	; DAC track data pointer
; loc_71C5E:
.sampleloop:
	moveq	#0,d5
	move.b	(a4)+,d5		; Get next SMPS unit
	cmpi.b	#$FE,d5			; Is it a coord. flag?
	blo.s	.notcoord		; Branch if not
	bsr.w	CoordFlag
	bra.s	.sampleloop
; ===========================================================================
; loc_71C6E:
.notcoord:
	tst.b	d5			; Is it a sample?
	bpl.s	.gotduration		; Branch if not (duration)
	move.b	d5,zTrack.SavedDAC(a5)	; Store new sample
	move.b	(a4)+,d5		; Get another byte
	bpl.s	.gotduration		; Branch if it is a duration
	subq.w	#1,a4			; Put byte back
	move.b	zTrack.SavedDuration(a5),zTrack.DurationTimeout(a5) ; Use last duration
	bra.s	.gotsampleduration
; ===========================================================================
; loc_71C84:
.gotduration:
	bsr.w	SetDuration
; loc_71C88:
.gotsampleduration:
	move.l	a4,zTrack.DataPointer(a5)	; Save pointer
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overridden?
	bne.s	locret_71CAA			; Return if yes
	moveq	#0,d0
	move.b	zTrack.SavedDAC(a5),d0		; Get sample
	cmpi.b	#$80,d0				; Is it a rest?
	beq.s	locret_71CAA			; Return if yes
;	btst	#3,d0				; Is bit 3 set (samples between $88-$8F)?
;	bne.s	.timpani			; Various timpani

	; From Vladikcomper:
	; "We need the Z80 to be stopped before this command executes and to be started directly afterwards."
	stopZ80
	sf.b	(z80_dac_type).l	; This is music DAC; change according to volume
	move.b	d0,(z80_dac_sample).l
	startZ80

locret_71CAA:
	rts
; ===========================================================================
	; From Vladikcomper:
	; "This removes hardcoded Timpani tempo modifier for old driver.
	; Certain sample numbers ($88-$8B) were hardcoded to play sample $83 (timpani) with different tempos.
	; New driver doesn't need it, as you can set this stuff in the DAC table."
; loc_71CAC:
;.timpani:
;	subi.b	#$88,d0			; Convert into an index
;	move.b	DAC_sample_rate(pc,d0.w),d0
	; Warning: this affects the raw pitch of sample $83, meaning it will
	; use this value from then on.
;	move.b	d0,(z80_dac3_pitch).l
;	move.b	#$83,(z80_dac_sample).l	; Use timpani
;	rts
; End of function UpdateDAC

; ===========================================================================
; Note: this only defines rates for samples $88-$8D, meaning $8E-$8F are invalid.
; Also, $8C-$8D are so slow you may want to skip them.
; byte_71CC4:
;DAC_sample_rate: dc.b $12, $15, $1C, $1D, $FF, $FF

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71CCA:
FMUpdateTrack:
	subq.b	#1,zTrack.DurationTimeout(a5)	; Update duration timeout
	bne.s	.notegoing			; Branch if it hasn't expired
	bclr	#4,zTrack.PlaybackControl(a5)	; Clear 'do not attack next note' bit
	bsr.s	FMDoNext
	bsr.w	FMPrepareNote
	bsr.w	FMNoteOn
	; Clownacy | Sonic 2 adds these two branches
	bsr.w	DoModulation
	bra.w	FMUpdateFreq
; ===========================================================================
; loc_71CE0:
.notegoing:
	bsr.w	NoteFillUpdate
	bsr.w	DoModulation
	bra.w	FMUpdateFreq
; End of function FMUpdateTrack


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71CEC:
FMDoNext:
	movea.l	zTrack.DataPointer(a5),a4	; Track data pointer
	bclr	#1,zTrack.PlaybackControl(a5)	; Clear 'track at rest' bit
; loc_71CF4:
.noteloop:
	moveq	#0,d5
	move.b	(a4)+,d5		; Get byte from track
	cmpi.b	#$FE,d5			; Is this a coord. flag?
	blo.s	.gotnote		; Branch if not
	bsr.w	CoordFlag
	bra.s	.noteloop
; ===========================================================================
; loc_71D04:
.gotnote:
	bsr.w	FMNoteOff
	tst.b	d5			; Is this a note?
	bpl.w	SetDuration_pea		; Branch if not
	bsr.s	FMSetFreq
	move.b	(a4)+,d5		; Get another byte
	bpl.w	SetDuration_pea		; Branch if it is a duration
	subq.w	#1,a4			; Otherwise, put it back
	bra.w	FinishTrackUpdate
; ===========================================================================
; loc_71D1A:
;.gotduration:	Clownacy | Replaced by SetDuration_pea
;	pea	FinishTrackUpdate(pc)
;	bra.w	SetDuration
; End of function FMDoNext


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71D22:
FMSetFreq:
	subi.b	#$80,d5				; Make it a zero-based index
	beq.w	TrackSetRest
	add.b	zTrack.Transpose(a5),d5		; Add track transposition
	andi.w	#$7F,d5				; Clear high byte and sign bit
	add.w	d5,d5
	move.w	FM_Notes(pc,d5.w),zTrack.Freq(a5) ; Store new frequency
	rts
; End of function FMSetFreq

; ===========================================================================
; ---------------------------------------------------------------------------
; FM Note Values: b-0 to a#8
; ---------------------------------------------------------------------------
; I could use some code from other SMPS drivers to make this table MUCH smaller
; but it's at a cost of speed, and we all know SMPS 68k makes everything run at 10fps, riiight?
; word_72790:
FM_Notes:
    if ReverseFreqs = 0
	dc.w $025E,$0284,$02AB,$02D3,$02FE,$032D,$035C,$038F,$03C5,$03FF,$043C,$047C
	dc.w $0A5E,$0A84,$0AAB,$0AD3,$0AFE,$0B2D,$0B5C,$0B8F,$0BC5,$0BFF,$0C3C,$0C7C
	dc.w $125E,$1284,$12AB,$12D3,$12FE,$132D,$135C,$138F,$13C5,$13FF,$143C,$147C
	dc.w $1A5E,$1A84,$1AAB,$1AD3,$1AFE,$1B2D,$1B5C,$1B8F,$1BC5,$1BFF,$1C3C,$1C7C
	dc.w $225E,$2284,$22AB,$22D3,$22FE,$232D,$235C,$238F,$23C5,$23FF,$243C,$247C
	dc.w $2A5E,$2A84,$2AAB,$2AD3,$2AFE,$2B2D,$2B5C,$2B8F,$2BC5,$2BFF,$2C3C,$2C7C
	dc.w $325E,$3284,$32AB,$32D3,$32FE,$332D,$335C,$338F,$33C5,$33FF,$343C,$347C
	dc.w $3A5E,$3A84,$3AAB,$3AD3,$3AFE,$3B2D,$3B5C,$3B8F,$3BC5,$3BFF,$3C3C,$3C7C
    else
	dc.w $3C7C,$3C3C,$3BFF,$3BC5,$3B8F,$3B5C,$3B2D,$3AFE,$3AD3,$3AAB,$3A84,$3A5E
	dc.w $347C,$343C,$33FF,$33C5,$338F,$335C,$332D,$32FE,$32D3,$32AB,$3284,$325E
	dc.w $2C7C,$2C3C,$2BFF,$2BC5,$2B8F,$2B5C,$2B2D,$2AFE,$2AD3,$2AAB,$2A84,$2A5E
	dc.w $247C,$243C,$23FF,$23C5,$238F,$235C,$232D,$22FE,$22D3,$22AB,$2284,$225E
	dc.w $1C7C,$1C3C,$1BFF,$1BC5,$1B8F,$1B5C,$1B2D,$1AFE,$1AD3,$1AAB,$1A84,$1A5E
	dc.w $147C,$143C,$13FF,$13C5,$138F,$135C,$132D,$12FE,$12D3,$12AB,$1284,$125E
	dc.w $0C7C,$0C3C,$0BFF,$0BC5,$0B8F,$0B5C,$0B2D,$0AFE,$0AD3,$0AAB,$0A84,$0A5E
	dc.w $047C,$043C,$03FF,$03C5,$038F,$035C,$032D,$02FE,$02D3,$02AB,$0284,$025E
    endif

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

SetDuration_pea:	; Clownacy | Replaces .gotduration
	pea	FinishTrackUpdate(pc)	; Clownacy | Save 2 cycles
; sub_71D40:
SetDuration:
	move.b	d5,d0
	move.b	zTrack.TempoDivider(a5),d1	; Get dividing timing
; loc_71D46:
.multloop:
	subq.b	#1,d1
	beq.s	.donemult
	add.b	d5,d0
	bra.s	.multloop
; ===========================================================================
; loc_71D4E:
.donemult:
	move.b	d0,zTrack.SavedDuration(a5)	; Save duration
	move.b	d0,zTrack.DurationTimeout(a5)	; Save duration timeout
	rts
; End of function SetDuration

; ===========================================================================
; loc_71D58:
TrackSetRest:
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	clr.w	zTrack.Freq(a5)			; Clear frequency
	; Clownacy | Sonic 2's driver doesn't continue to FinishTrackUpdate
	rts

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71D60:
FinishTrackUpdate:
	move.l	a4,zTrack.DataPointer(a5)		; Store new track position
	move.b	zTrack.SavedDuration(a5),zTrack.DurationTimeout(a5) ; Reset note timeout
	btst	#4,zTrack.PlaybackControl(a5)		; Is track set to not attack note?
	bne.s	locret_71D9C				; If so, branch
	move.b	zTrack.NoteFillMaster(a5),zTrack.NoteFillTimeout(a5) ; Reset note fill timeout
	; Clownacy | We only want VolFlutter clearing on PSG tracks, now.
	; Non-PSG tracks use the RAM for something else.
	tst.b	zTrack.VoiceControl(a5)			; Is this a psg track?
	bpl.s	.notpsg					; If not, branch
	clr.b	zTrack.VolFlutter(a5)			; Reset PSG flutter index
.notpsg:
	btst	#3,zTrack.PlaybackControl(a5)		; Is modulation on?
	beq.s	locret_71D9C				; If not, return
	movea.l	zTrack.ModulationPtr(a5),a0		; Modulation data pointer
	move.b	(a0)+,zTrack.ModulationWait(a5)		; Reset wait
	move.b	(a0)+,zTrack.ModulationSpeed(a5)	; Reset speed
	move.b	(a0)+,zTrack.ModulationDelta(a5)	; Reset delta
	move.b	(a0)+,d0				; Get steps
	lsr.b	#1,d0					; Halve them
	move.b	d0,zTrack.ModulationSteps(a5)		; Then store
	clr.w	zTrack.ModulationVal(a5)		; Reset frequency change
locret_71D9C:
	rts
; End of function FinishTrackUpdate


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; Clownacy | Nicely optimised
; sub_71D9E:
NoteFillUpdate:
	tst.b	zTrack.NoteFillTimeout(a5)	; Is note fill on?
	beq.s	locret_71D9C			; If not, return
	subq.b	#1,zTrack.NoteFillTimeout(a5)	; Update note fill timeout
	bne.s	locret_71D9C			; Return if it hasn't expired
	bset	#1,zTrack.PlaybackControl(a5)	; Put track at rest
	addq.w	#4,sp				; Do not return to caller
	tst.b	zTrack.VoiceControl(a5)		; Is this a psg track?
	bmi.w	PSGNoteOff			; If yes, branch
	bra.w	FMNoteOff
; End of function NoteFillUpdate


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71DC6:
DoModulation:
    if Fix_DriverBugs
	; Clownacy | (From S2) Corrects modulation during rests (can be heard in ARZ's theme, as beeping right after the song loops)
	btst	#1,zTrack.PlaybackControl(a5)	; Is track at rest?
	bne.s	.locret				; Return if so
    endif
	btst	#3,zTrack.PlaybackControl(a5)	; Is modulation active?
	beq.s	.locret				; Return if not
	tst.b	zTrack.ModulationWait(a5)	; Has modulation wait expired?
	beq.s	.waitdone			; If yes, branch
	subq.b	#1,zTrack.ModulationWait(a5)	; Update wait timeout
; locret_71E16:
.locret:
	addq.w	#4,sp				; Do not return to caller (but see below)
	rts
; ===========================================================================
; loc_71DDA:
.waitdone:
	subq.b	#1,zTrack.ModulationSpeed(a5)	; Update speed
	beq.s	.updatemodulation		; If it expired, want to update modulation
	addq.w	#4,sp				; Do not return to caller (but see below)
	rts
; ===========================================================================
; loc_71DE2:
.updatemodulation:
	movea.l	zTrack.ModulationPtr(a5),a0		; Get modulation data
	move.b	1(a0),zTrack.ModulationSpeed(a5)	; Restore modulation speed
	tst.b	zTrack.ModulationSteps(a5)		; Check number of steps
	bne.s	.calcfreq				; If nonzero, branch
	move.b	3(a0),zTrack.ModulationSteps(a5)	; Restore from modulation data
	neg.b	zTrack.ModulationDelta(a5)		; Negate modulation delta
	addq.w	#4,sp				; Do not return to caller (but see below)
	rts
; ===========================================================================
; loc_71DFE:
.calcfreq:
	subq.b	#1,zTrack.ModulationSteps(a5)	; Update modulation steps
	move.b	zTrack.ModulationDelta(a5),d6	; Get modulation delta
	ext.w	d6
	add.w	zTrack.ModulationVal(a5),d6	; Add cumulative modulation change
	move.w	d6,zTrack.ModulationVal(a5)	; Store it
	add.w	zTrack.Freq(a5),d6		; Add note frequency to it
	rts
; End of function DoModulation


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_71E18:
FMPrepareNote:
	btst	#1,zTrack.PlaybackControl(a5)	; Is track resting?
	bne.s	locret_71E48			; Return if so
	move.w	zTrack.Freq(a5),d6		; Get current note frequency
	beq.s	FMSetRest			; Branch if zero
; loc_71E24:
FMUpdateFreq:
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overridden?
	bne.s	locret_71E48			; Return if so
	move.b	zTrack.Detune(a5),d0		; Get detune value
	ext.w	d0
	add.w	d0,d6				; Add note frequency
	move.w	d6,d1
	lsr.w	#8,d1
	move.b	#$A4,d0		; Register for upper 6 bits of frequency
	bsr.w	WriteFMIorII
	move.b	d6,d1
	move.b	#$A0,d0		; Register for lower 8 bits of frequency
	bra.w	WriteFMIorII
;locret_71E48:
;	rts
; ===========================================================================
; loc_71E4A:
FMSetRest:
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit

locret_71E48:
	rts
; End of function FMPrepareNote

; ===========================================================================
; loc_71E50:
PauseMusic:
	bmi.s	UnpauseMusic		; Branch if music is being unpaused
	cmpi.b	#2,f_stopmusic(a6)
	beq.w	locret_71EFE
	move.b	#2,f_stopmusic(a6)
	bsr.w	FMSilenceAll
	bsr.w	PSGSilenceAll
	; From Vladikcomper:
	; "Playing sample $7F executes pause command."
	; "We need the Z80 to be stopped before this command executes and to be started directly afterwards."
	stopZ80
	move.b  #$7F,(z80_dac_sample).l	; pause DAC
	startZ80

	rts
; ===========================================================================
; loc_71E94: .unpausemusic:
UnpauseMusic:
	clr.b	f_stopmusic(a6)

	lea	v_track_ram(a6),a5
	moveq	#(v_fm6_track-v_dac_track)/zTrack.len,d7	; 6 FM + 1 DAC
	bsr.s	ResumeTrack

	move.b	#$80,f_voice_selector(a6)			; Now at SFX tracks
	lea	v_sfx_track_ram(a6),a5
	moveq	#(v_sfx_fm5_track-v_sfx_fm3_track)/zTrack.len,d7	; 3 FM
	bsr.s	ResumeTrack

    if EnableSpecSFX
	move.b	#$40,f_voice_selector(a6)			; Now at SFX tracks
	lea	v_sfx2_track_ram(a6),a5
	moveq	#(v_sfx2_fm4_track-v_sfx2_fm4_track)/zTrack.len,d7	; 1 FM
	bsr.s	ResumeTrack
    endif

	clr.b	f_voice_selector(a6)			; Now at SFX tracks
	; From Vladikcomper:
	; "Playing sample $00 cancels pause mode."
	; "We need the Z80 to be stopped before this command executes and to be started directly afterwards."
	stopZ80
	clr.b  (z80_dac_sample).l	; unpause DAC
	startZ80

; loc_71EFE:
locret_71EFE:
	rts


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

ResumeTrack:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	+				; Branch if not
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding track?
	bne.s	+				; Branch if not
	moveq	#0,d0
	move.b	zTrack.VoiceIndex(a5),d0	; Current track FM instrument
	bsr.w	cfSetVoiceCont
+
	lea	zTrack.len(a5),a5	; Advance to next track
	dbf	d7,ResumeTrack		; loop
	rts
; End of function ResumeTrack

; ===========================================================================

; ---------------------------------------------------------------------------
; Subroutine to	play a sound or	music track
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sound_Play:
	lea	SoundPriorities(pc),a0
	lea	v_playsnd1(a6),a1	; Load music track number
	move.b	v_sndprio(a6),d3	; Get priority of currently playing SFX
	moveq	#3,d4			; Clownacy | Number of sound queues-1, now 3 to match the new fourth queue
	moveq	#0,d0			; Clownacy | Added as a replacement for the below andi.w
; loc_71F12:
.inputloop:
	move.b	(a1),d0			; Move track number to d0
	move.b	d0,d1
	clr.b	(a1)+			; Clear entry
	tst.b	d0			; Make it into 0-based index
	beq.s	.nextinput		; If negative (i.e., it was $80 or lower), branch
	cmpi.b	#SndID__End,d0		; Is it a special command?		; Clownacy | Part of S2's SFX-only priority system
	bhs.s	.musicorflag		; If so, branch				; Clownacy | Part of S2's SFX-only priority system
	subi.b	#SndID__First,d0	; Subtract first SFX index		; Clownacy | Part of S2's SFX-only priority system
	blo.s	.musicorflag		; If it was music, branch		; Clownacy | Part of S2's SFX-only priority system
	tst.b	v_playsnd0(a6)		; Is v_playsnd0 a $00 (empty)?
	beq.s	.havesound		; If yes, branch
	move.b	d1,v_playsnd1(a6)	; Put sound into v_playsnd1
	bra.s	.nextinput
; ===========================================================================

.musicorflag:
	tst.b	v_playsnd0(a6)		; Is v_playsnd0 a $00 (empty)?		; Clownacy | Part of S2's SFX-only priority system
	beq.s	.skippriority		; If yes, branch			; Clownacy | Part of S2's SFX-only priority system
	move.b	d1,v_playsnd1(a6)	; Put sound into v_playsnd1		; Clownacy | Part of S2's SFX-only priority system
	bra.s	.nextinput							; Clownacy | Part of S2's SFX-only priority system
; ===========================================================================

; loc_71F2C:
.havesound:
;	andi.w	#$7F,d0			; Clear high byte and sign bit		; Clownacy | Commented out to accomidate the greater number of slots
	move.b	(a0,d0.w),d2		; Get sound type
	cmp.b	d3,d2			; Is it a lower priority sound?
	blo.s	.nextinput		; Branch if yes
	move.b	d2,d3			; Store new priority

.skippriority:
	move.b	d1,v_playsnd0(a6)	; Queue sound for play
; loc_71F3E:
.nextinput:
	dbf	d4,.inputloop

	tst.b	d3			; We don't want to change sound priority if it is negative
	bmi.s	locret_71F4A
	move.b	d3,v_sndprio(a6)	; Set new sound priority
locret_71F4A:
	rts
; End of function Sound_Play


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Sound_ChkValue:	; For the love of god, don't rearrange the order of the groups, it has to be 'music --> SFX --> flags'
	moveq	#0,d7
	move.b	v_playsnd0(a6),d7
;	beq.w	StopSoundAndMusic	; Is this $00? Branch if yes				; Clownacy | I'm not even sure what this one was doing, this was here before I made $00==$80
;	bpl.s	locret_71F4A		; If >= 0, return (not a valid sound, bgm or command)	; Clownacy | Commented out to allow slots $00-$7F
	clr.b	v_playsnd0(a6)		; reset	music flag
	cmpi.b	#MusID__End,d7		; Is this music ($01-$1F)?
	blo.w	Sound_PlayBGM		; Branch if yes
	cmpi.b	#SndID__First,d7	; Is this after music but before sfx?
	blo.s	locret_71F4A		; Return if yes
	cmpi.b	#SndID__End,d7		; Is this sfx ($80-$D0)?
	blo.w	Sound_PlaySFX		; Branch if yes
    if EnableSpecSFX
	cmpi.b	#SpecID__First,d7	; Is this after sfx but before spec sfx?
	blo.s	locret_71F4A		; Return if yes
	; These are old special SFX slots (GHZ waterfall)
	cmpi.b	#SpecID__End,d7		; Is this spec sfx
	blo.w	Sound_PlaySpecial	; Branch if yes
    endif
	cmpi.b	#FlgID__First,d7	; Is this after sfx (spec if above code is present) but before $D0?
	blo.s	locret_71F4A		; Return if yes
	; Clownacy | Basic logic: if it can only be 1 or 2, and it isn't 1, it's clearly 2.
	; These lines are pointless, and have been since I moved the flags all the way to the end of the ID list.
	; Surprised it took me so long to notice (picked this up from S3K's driver, modified SMPS Z80 Type 2).
	; The flags slots
;	cmpi.b	#FlgID__End-1,d7	; Is this $FB-$FF?
;	bls.s	Sound_FAtoFF		; Branch if yes

; locret_71F8C:
;.locret:
;	rts

; ===========================================================================
; Sound_E0toE4:
;Sound_FAtoFF:
	subi.b	#FlgID__First,d7
	add.w	d7,d7
	add.w	d7,d7
	jmp	Sound_ExIndex(pc,d7.w)
; ===========================================================================

Sound_ExIndex:
ptr_flgFA:	bra.w	StopSFX			; $FA	; Clownacy | Brand new. Was missing from the stock S1 driver because Sonic Team had stripped out various unused components of the driver
ptr_flgFB:	bra.w	FadeOutMusic		; $FB	; Clownacy | Was $E0
ptr_flgFC:	bra.w	PlaySega		; $FC	; Clownacy | Was $E1
ptr_flgFD:	bra.w	SpeedUpMusic		; $FD	; Clownacy | Was $E2
ptr_flgFE:	bra.w	SlowDownMusic		; $FE	; Clownacy | Was $E3
ptr_flgFF:	bra.w	StopSoundAndMusic	; $FF	; Clownacy | Was $E4
ptr_flgend
; ---------------------------------------------------------------------------
; Play "Say-gaa" PCM sound
; ---------------------------------------------------------------------------
; Sound_E1:
PlaySega:
    if SegaPCM_68k = 0

	stopZ80
	st.b	(z80_dac_type).l	; This is a DAC SFX; ignore music DAC volume
	move.b	#0,(z80_dac_sample).l	; Queue Sega PCM
	startZ80
	    if IdlingSegaSound
		move.w	#$11,d1
; loc_71FC0:
.busyloop_outer:
		move.w	#-1,d0
; loc_71FC4:
.busyloop:
		nop
		dbf	d0,.busyloop

		dbf	d1,.busyloop_outer
	    endif
    else

    if Fix_DriverBugs
	; Clownacy | One of Valley Bell's fixes: this resets the DAC pan, so the SEGA chant isn't accidentally panned by a previously-playing song
	move.b	#$B6,d0		; AMS/FMS/panning of FM6
	move.b	#$C0,d1		; Stereo
	bsr.w	WriteFMII
    endif
	; Clownacy | Fancy-pantsy optimised version of Puto's 68k DAC code
	moveq	#$2B,d0		; DAC enable/disable register
	move.b	#$80,d1		; Enable DAC
	bsr.w	WriteFMI
	stopZ80
	lea	(ym2612_a0).l,a0		; Load $A04000 (YM2612 register A0) into a0 for some temporary use
	lea	(SegaPCM).l,a2			; Load the SEGA PCM sample into a2. It's important that we use a2 since a0 and a1 are going to be used up ahead when reading the joypad ports
	lea	(ym2612_d0).l,a3		; Load $A04001 (YM2612 register D0) into a3
	lea	(Ctrl_1).w,a4			; Load address where JoyPad states are written into a4
	lea	(HW_Port_1_Data).l,a5		; Load address where JoyPad states are read from into a5
	move.w	#0,d3					; Load the size of the SEGA PCM sample into d3
	waitYM
	move.b	#$2A,(a0)			; $A04000 = $2A -> Write to DAC channel
	waitYM
.loop:
	move.b	(a2)+,(a3)			; Write the PCM data (contained in a2) to YM2612 register D0 (contained in a3)
	moveq	#$18,d0				; Write the pitch ($18 in this case) to d0
.idle:
	dbf	d0,.idle			; Decrement d0; jump to itself if not 0. (for pitch control, avoids playing the sample too fast)
	movea.w	a4,a0				; address where JoyPad states are written
	movea.l	a5,a1				; address where JoyPad states are read from
	jsr	(Joypad_Read).w			; Read only the first joypad port. It's important that we do NOT do the two ports, we don't have the cycles for that
	tst.b	(a4)				; Check for Start button
	bmi.s	.endloop			; If start is pressed, stop playing, leave this loop, and unfreeze the 68K, otherwise, continue playing PCM sample
	dbf	d3,.loop			; Count down d3 and loop. If d3 = 0, we finished playing the PCM sample, so stop playing, leave this loop, and unfreeze the 68K
.endloop:
	startZ80
    endif

	addq.w	#4,sp				; Tamper return value so we don't return to caller
	rts

; ===========================================================================
; ---------------------------------------------------------------------------
; Play music track $81-$9F
; ---------------------------------------------------------------------------
; Sound_81to9F:
Sound_PlayBGM:
	; Clownacy | The commented-out is from S2's driver, which was used to hide a certain bug.
	; Lucky for us, though, we just fix the bug directly, so we don't need this.
;	bsr.w	StopSFX			; Clownacy | (From S2) Helps stop audio artefacts after SFX interruption
;    if EnableSpecSFX
;	bsr.w	StopSpecSFX
;    endif
	cmpi.b	#MusID_ExtraLife,d7	; Is the "extra life" music to be played?
	bne.s	.bgmnot1up		; If not, branch
	tst.b	f_1up_playing(a6)	; Is a 1-up music playing?
	bne.w	.bgm_loadMusic		; If yes, branch	; Clownacy | (From S2)

	; Clownacy | Making the music backup share RAM with the SFX tracks makes this code so much more complicated...
	; First up, we have to meddle with bit 7 PlaybackControl, but, afterwards, we wanna put it back the way it was, so we gotta back all 10 of them up
	lea	v_track_ram(a6),a5
	moveq	#(v_psg3_track-v_dac_track)/zTrack.len,d0	; 1 DAC + 6 FM + 3 PSG tracks
; loc_71FE6:
.clearsfxloop:
	bclr	#2,zTrack.PlaybackControl(a5)		; Clear 'SFX is overriding' bit
	move.b	zTrack.PlaybackControl(a5),zTrack.PlaybackControlBackup(a5)	; Clownacy | Backup PlaybackControl...
	bclr	#7,zTrack.PlaybackControl(a5)		; ...then screw with 'track is playing' bit (we don't want the SFX update processing the music track backup!!!)
	lea	zTrack.len(a5),a5
	dbf	d0,.clearsfxloop

	; The RAM this code changes is immediately overwritten with the music track backup, so the code's useless
;	lea	v_sfx_track_ram(a6),a5
;	moveq	#(v_sfx2_psg3_track-v_sfx_fm3_track)/zTrack.len,d0	; 3 FM + 3 PSG tracks (SFX) + 1 FM + 1 PSG tracks (special SFX)
; loc_71FF8:
;.cleartrackplayloop:
;	bclr	#7,zTrack.PlaybackControl(a5)	; Clear 'track is playing' bit
;	lea	zTrack.len(a5),a5
;	dbf	d0,.cleartrackplayloop

	; Clownacy | We're backing-up the variables and tracks separately, to put the backed-up variables after the backed-up tracks
	; this is so the backed-up tracks and SFX tracks start at the same place: at the end of the music tracks
;	clr.b	v_sndprio(a6)		; Clear priority (S2 removes this one)
	lea	v_track_ram(a6),a0
	lea	v_1up_ram_copy(a6),a1
	moveq	#((v_track_ram_end-v_track_ram)/4)-1,d0	; Backup music track data
; loc_72012:
.backuptrackramloop:
	move.l	(a0)+,(a1)+
	dbf	d0,.backuptrackramloop

	movea.l	a6,a0
	move.w	#(v_endofvariables-v_startofvariables)-1,d0	; Backup variables

.backupvariablesloop:
	move.b	(a0)+,(a1)+
	dbf	d0,.backupvariablesloop

	move.b	#$80,f_1up_playing(a6)
	clr.b	v_sndprio(a6)		; Clear priority twice?
	bra.s	.bgm_loadMusic
; ===========================================================================
; loc_72024:
.bgmnot1up:
	moveq	#0,d0
	move.b	d0,f_1up_playing(a6)
	move.b	d0,v_fadein_counter(a6)
	move.b	d0,v_fadeout_counter(a6)	; Clownacy | (From S2)
; loc_7202C:
.bgm_loadMusic:
	bsr.w	InitMusicPlayback
	lea	SpeedUpIndex(pc),a4
	subi.b	#MusID__First,d7
	move.b	(a4,d7.w),v_speeduptempo(a6)
	lea	SoundDriverMusicRAM-Clone_Driver_RAM(a6),a4
	moveq	#0,d0
	move.w	(a4),d0
	add.l	a4,d0
	move.l	d0,v_voice_ptr(a6)
	move.b	5(a4),d0		; Load tempo		; Clownacy | +2 to accommodate the voices' new longword pointer
	move.b	d0,v_tempo_mod(a6)
	tst.b	f_speedup(a6)
	beq.s	.nospeedshoes
	move.b	v_speeduptempo(a6),d0
; loc_72068:
.nospeedshoes:
	move.b	d0,v_main_tempo(a6)
	moveq	#0,d1
	move.b	d1,v_main_tempo_timeout(a6)	; Clownacy | Cleared to avoid unintended overflow on first frame of playback
	move.b	#5,v_pal_audio_countdown(a6)	; Clownacy | "reset PAL update tick to 5 (update immediately)"
	movea.l	a4,a3

	addq.w	#6,a4			; Point past header			; Clownacy | +2 to accommodate the voices' new longword pointer
    if Fix_DriverBugs
	; Clownacy | One of Valley Bell's fixes: this vital code is skipped if FM/DAC channels is 0, so it's been moved to avoid that
	move.b	4(a3),d4		; Load tempo dividing timing		; Clownacy | +2 to accommodate the voices' new longword pointer
	moveq	#zTrack.len,d6
	moveq	#1,d5			; Note duration for first "note"
    endif
	moveq	#0,d7			; Clownacy | Hey, look! It's the 'moveq	#0,d7' that the other Play_X's were missing!
	move.b	2(a3),d7		; Load number of FM+DAC tracks	; Clownacy | +2 to accommodate the voices' new longword pointer
	beq.w	.bgm_fmdone		; Branch if zero
	subq.b	#1,d7
	move.b	#$C0,d1			; Default AMS+FMS+Panning
    if ~Fix_DriverBugs
	move.b	4(a3),d4		; Load tempo dividing timing		; Clownacy | +2 to accommodate the voices' new longword pointer
	moveq	#zTrack.len,d6
	moveq	#1,d5			; Note duration for first "note"
    endif
	lea	v_track_ram(a6),a1
	lea	FMDACInitBytes(pc),a2
; loc_72098:
.bmg_fmloadloop:
    if Fix_DriverBugs
	; Clownacy | (From S2) Now sets 'track at rest' bit to prevent hanging notes
	move.b	#$82,zTrack.PlaybackControl(a1)	; Initial playback control: set 'track playing' and 'track at rest' bits
    else
	bset	#7,zTrack.PlaybackControl(a1)	; Initial playback control: set 'track playing' bit
    endif
	move.b	(a2)+,zTrack.VoiceControl(a1)	; Voice control bits
	move.b	d4,zTrack.TempoDivider(a1)
	move.b	d6,zTrack.StackPointer(a1)	; Set "gosub" (coord flag F8h) stack init value
	move.b	d1,zTrack.AMSFMSPan(a1)		; Set AMS/FMS/Panning
	move.b	d5,zTrack.DurationTimeout(a1)	; Set duration of first "note"
	moveq	#0,d0
	move.w	(a4)+,d0			; Load DAC/FM pointer
	add.l	a3,d0				; Relative pointer
	move.l	d0,zTrack.DataPointer(a1)	; Store track pointer
	move.w	(a4)+,zTrack.Transpose(a1)	; Load FM channel modifier
	adda.w	d6,a1
	dbf	d7,.bmg_fmloadloop

	cmpi.b	#7,2(a3)	; Are 7 (1 x DAC + 6 x FM) tracks defined?	; Clownacy | +2 to accommodate the voices' new longword pointer
	beq.s	.bgm_fmdone
; ===========================================================================
; loc_720D8:
;.silencefm6:
	; Silence FM Channel 6 specifically if it's not in use
	; Clownacy | Optimising this a bit by doing what Sonic 2's driver does
	moveq	#$42,d0		; TL for operator 1 of FM6
	moveq	#$FF,d1		; Total silence
	moveq	#4-1,d2

.silenceloop:
	bsr.w	WriteFMII
	addq.b	#4,d0		; Next operator
	dbf	d2,.silenceloop

	move.b	#$B6,d0		; AMS/FMS/panning of FM6
	move.b	#$C0,d1		; Stereo
	bsr.w	WriteFMII
; loc_72114:
.bgm_fmdone:
	moveq	#0,d7
	move.b	3(a3),d7	; Load number of PSG tracks
	beq.s	.bgm_psgdone	; Branch if zero
	subq.b	#1,d7
	lea	v_psg1_track(a6),a1
	lea	PSGInitBytes(pc),a2
; loc_72126:
.bgm_psgloadloop:
    if Fix_DriverBugs
	; Clownacy | (From S2) Now sets 'track at rest' bit to prevent hanging notes
	move.b	#$82,zTrack.PlaybackControl(a1)	; Initial playback control: set 'track playing' and 'track at rest' bits
    else
	bset	#7,zTrack.PlaybackControl(a1)	; Initial playback control: set 'track playing' bit
    endif
	move.b	(a2)+,zTrack.VoiceControl(a1)	; Voice control bits
	move.b	d4,zTrack.TempoDivider(a1)
	move.b	d6,zTrack.StackPointer(a1)	; Set "gosub" (coord flag F8h) stack init value
	move.b	d5,zTrack.DurationTimeout(a1)	; Set duration of first "note"
	moveq	#0,d0
	move.w	(a4)+,d0			; Load PSG channel pointer
	add.l	a3,d0				; Relative pointer
	move.l	d0,zTrack.DataPointer(a1)	; Store track pointer
	move.w	(a4)+,zTrack.Transpose(a1)	; Load PSG modifier
	addq.w	#1,a4				; Skip redundant byte (SMPS2ASM calls this 'mod', and SMPS 68k Type 2 actually does use it for modulation ($A(a5)))
	move.b	(a4)+,zTrack.VoiceIndex(a1)	; Initial PSG tone
	adda.w	d6,a1
	dbf	d7,.bgm_psgloadloop
; loc_72154:
.bgm_psgdone:
	lea	v_sfx_fm3_track(a6),a1
	moveq	#(v_sfx_psg3_track-v_sfx_fm3_track)/zTrack.len,d7	; 6 SFX tracks
; loc_7215A:
.sfxstoploop:
	tst.b	zTrack.PlaybackControl(a1)	; Is SFX playing?
	bpl.s	.sfxnext			; Branch if not
	moveq	#0,d0
	move.b	zTrack.VoiceControl(a1),d0	; Get voice control bits
	bmi.s	.sfxpsgchannel			; Branch if this is a PSG channel
	subq.b	#2,d0				; SFX can't have FM1 or FM2
	add.b	d0,d0
	add.b	d0,d0
	bra.s	.gotchannelindex
; ===========================================================================
; loc_7216E:
.sfxpsgchannel:
	lsr.b	#3,d0		; Convert to index
; loc_72170:
.gotchannelindex:
	lea	SFX_BGMChannelRAM(pc),a0
	movea.l	(a0,d0.w),a0
	; Clownacy | For some reason, this was changed to a bclr in S2's driver, breaking the code
	bset	#2,zTrack.PlaybackControl(a0)	; Set 'SFX is overriding' bit
; loc_7217C:
.sfxnext:
	adda.w	d6,a1
	dbf	d7,.sfxstoploop

    if EnableSpecSFX
	tst.b	v_sfx2_fm4_track.PlaybackControl(a6)	; Is special SFX being played?
	bpl.s	.checkspecialpsg			; Branch if not
	bset	#2,v_fm4_track.PlaybackControl(a6)	; Set 'SFX is overriding' bit
; loc_7218E:
.checkspecialpsg:
	tst.b	v_sfx2_psg3_track.PlaybackControl(a6)	; Is special SFX being played?
	bpl.s	.sendfmnoteoff				; Branch if not
	bset	#2,v_psg3_track.PlaybackControl(a6)	; Set 'SFX is overriding' bit
    endif
; loc_7219A:
.sendfmnoteoff:
	lea	v_fm1_track(a6),a5
	moveq	#(v_fm6_track-v_fm1_track)/zTrack.len,d4
; loc_721A0:
.fmnoteoffloop:
	bsr.w	FMNoteOff
	adda.w	d6,a5
	dbf	d4,.fmnoteoffloop	; Run all FM tracks
	moveq	#(v_psg3_track-v_psg1_track)/zTrack.len,d4
; loc_721AC:
.psgnoteoffloop:
	bsr.w	PSGNoteOff
	adda.w	d6,a5
	dbf	d4,.psgnoteoffloop	; Run all PSG tracks

	addq.w	#4,sp	; Tamper with return value to not return to caller
	rts
; ===========================================================================
; byte_721BA:
FMDACInitBytes:
	dc.b 6,	0, 1, 2, 4, 5, 6	; first byte is for DAC; then notice the 0, 1, 2 then 4, 5, 6; this is the gap between parts I and II for YM2612 port writes
; byte_721C2:
PSGInitBytes:
	dc.b $80, $A0, $C0	; Specifically, these configure writes to the PSG port for each channel
	even
; ===========================================================================
; ---------------------------------------------------------------------------
; Play normal sound effect
; ---------------------------------------------------------------------------
; Sound_A0toCF:
Sound_PlaySFX:
	tst.b	f_1up_playing(a6)		; Is 1-up playing?
	bne.w	.clear_sndprio			; Exit is it is
;	tst.b	v_fadeout_counter(a6)		; Is music being faded out?	; Clownacy | S2's driver doesn't bother with this
;	bne.w	.clear_sndprio			; Exit if it is
	btst	#f_fadein_flag,misc_flags(a6)	; Is music being faded in?
	bne.w	.clear_sndprio			; Exit if it is
	bclr	#f_spindash_lastsound,misc_flags(a6)
	cmpi.b	#SndID_Ring,d7			; Is ring sound	effect played?
	bne.s	.sfx_notRing			; If not, branch
	btst	#v_ring_speaker,misc_flags(a6)	; Is the ring sound playing on right speaker?
	bne.s	.gotringspeaker			; Branch if not
	move.b	#SndID_RingLeft,d7		; Play ring sound in left speaker
; loc_721EE:
.gotringspeaker:
	bchg	#v_ring_speaker,misc_flags(a6)	; Change speaker
; Sound_notB5:
.sfx_notRing:
    if PushBehaviour
	cmpi.b	#sfx_Push,d7			; Is "pushing" sound played?
	bne.s	.sfx_notPush			; If not, branch

	btst	#f_push_playing,misc_flags2(a6)	; Is pushing sound already playing?
	bne.w	.locret				; Return if not
	bset	#f_push_playing,misc_flags2(a6)	; Mark it as playing
    endif
; Sound_notA7:
.sfx_notPush:
    if GloopBehaviour
	; Turns out S2 uses a version of the above code for the gloop SFX (zPlaySound_CheckGloop).
	; This is my best attempt at porting it.
	cmpi.b	#SndID_Gloop,d7			; Is bloop/gloop sound played?
	bne.s	.sfx_notgloop			; If not, branch

	bchg	#v_gloop_toggle,misc_flags(a6)	; Z80 cpl
	beq.w	.locret				; Is value set to 0? If so, branch
    endif

.sfx_notgloop:
	cmpi.b	#SndID_SpindashRev,d7		; Is this the Spin Dash sound?
	bne.s	.sfx_notspindashrev		; If not, branch
	move.b	v_spindash_pitch(a6),d0		; Store extra frequency
	tst.b	v_spindash_timer(a6)		; Is the Spin Dash timer active?
	bne.s	.sfx_timeractive		; If it is, branch
	moveq	#-1,d0				; Otherwise, reset frequency (becomes 0 on next line)

.sfx_timeractive:
	addq.b	#1,d0
	cmpi.b	#$C,d0				; Has the limit been reached?
	bhs.s	.sfx_limitreached		; If it has, branch
	move.b	d0,v_spindash_pitch(a6)		; Otherwise, set new frequency

.sfx_limitreached:
	bset	#f_spindash_lastsound,misc_flags(a6)	; Set flag
	move.b	#60,v_spindash_timer(a6)		; Set timer

.sfx_notspindashrev:

    if EnableContSFX
	cmpi.b	#First_ContSFX,d7		; Is this a continuous SFX?
	blo.s	.sfx_notcont			; If not, branch
	moveq	#0,d0
	move.b	v_current_contsfx(a6),d0
	cmp.b	d7,d0					; Is this the same continuous sound that was playing?
	bne.s	.sfx_notsame				; If not, branch
	bset	#f_continuous_sfx,misc_flags(a6)	; Set flag for continuous playback mode
	lea	SoundIndex(pc),a0
	subi.b	#SndID__First,d7
	add.w	d7,d7				; Convert sfx ID into index
	add.w	d7,d7
	movea.l	(a0,d7.w),a0
	move.b	3(a0),v_contsfx_channels(a6)	; Save number of channels in SFX
	rts

.sfx_notsame:
	bclr	#f_continuous_sfx,misc_flags(a6)	; Clear flag for continuous playback mode
	move.b	d7,v_current_contsfx(a6)		; Mark this as the current continuous SFX

.sfx_notcont:
    endif

	lea	SoundIndex(pc),a0
	subi.b	#SndID__First,d7	; Make it 0-based
	add.w	d7,d7			; Convert sfx ID into index
	add.w	d7,d7
	movea.l	(a0,d7.w),a3		; SFX data pointer
	movea.l	a3,a1
	moveq	#0,d1
	move.l	(a1)+,d1	; Voice pointer		; Clownacy | Made to read a longword to suit the voices' new absoute pointer
;	add.l	a3,d1		; Relative pointer	; Clownacy | Voice pointers are now absolute, so this isn't needed
	move.b	(a1)+,d5	; Dividing timing
	; DANGER! Ugh, this bug.
	; In the stock driver, sounds >= $E0 would cause a crash.
	; The original Clone Driver had a really messy workaround, and so does the SCHG (at the time of writing)
	; The real bug is that the SFX only has a range of $3F, after that, everything goes to hell.
	; Why? Look at the routine:
	; The index is made zero-based, so $A0 would become 0 (stock driver values).
	; By this logic, $DF would become $3F, and $E0: $40.
	; The value is then multiplied by 4 (the lsl), to suit the longword indexes of SoundIndex.
	; The result for $3F is $FC. Now do the same to $40, notice something?
	; The result is $100. We go beyond a single byte, this is the catalyst.
	; The second line below (move.b) tries to overwrite the register that holds the modifed value... with a byte.
	; So, we blank the *entire* register.
	; DANGER! there is a missing 'moveq	#0,d7' here, without which SFXes whose
	; index entry is above $3F will cause a crash. This is actually the same way that
	; this bug is fixed in Ristar's driver.
    if Fix_DriverBugs
	moveq	#0,d7
    endif
	move.b	(a1)+,d7	; Number of tracks (FM + PSG)
	subq.b	#1,d7
	moveq	#zTrack.len,d6
; loc_72228:
.sfx_loadloop:
	moveq	#0,d3
	move.b	1(a1),d3	; Channel assignment bits
	move.b	d3,d4
	bmi.s	.sfxinitpsg	; Branch if PSG
	subq.w	#2,d3		; SFX can only have FM3, FM4 or FM5
	add.w	d3,d3
	add.w	d3,d3
	lea	SFX_BGMChannelRAM(pc),a5
	movea.l	(a5,d3.w),a5
	bset	#2,zTrack.PlaybackControl(a5)	; Mark music track as being overridden
	bra.s	.sfxoverridedone
; ===========================================================================
; loc_72244:
.sfxinitpsg:
	lsr.w	#3,d3
	lea	SFX_BGMChannelRAM(pc),a5
	movea.l	(a5,d3.w),a5
	bset	#2,zTrack.PlaybackControl(a5)	; Mark music track as being overridden
	cmpi.b	#$C0,d4			; Is this PSG 3?
	bne.s	.sfxoverridedone	; Branch if not
	move.b	d4,d0
	ori.b	#$1F,d0			; Command to silence PSG 3
	lea	(PSG_input).l,a5
	move.b	d0,(a5)
	bchg	#5,d0			; Command to silence noise channel
	move.b	d0,(a5)
; loc_7226E:
.sfxoverridedone:
	movea.l	SFX_SFXChannelRAM(pc,d3.w),a5
	movea.l	a5,a2
	moveq	#(zTrack.len/4)-1,d0	; $30 bytes
	moveq	#0,d2
; loc_72276:
.clearsfxtrackram:
	move.l	d2,(a2)+
	dbf	d0,.clearsfxtrackram

	move.w	(a1)+,zTrack.PlaybackControl(a5)	; Initial playback control bits
	move.b	d5,zTrack.TempoDivider(a5)		; Initial voice control bits
	moveq	#0,d0
	move.w	(a1)+,d0				; Track data pointer
	add.l	a3,d0					; Relative pointer
	move.l	d0,zTrack.DataPointer(a5)		; Store track pointer
	move.w	(a1)+,zTrack.Transpose(a5)		; load FM/PSG channel modifier
	move.b	#1,zTrack.DurationTimeout(a5)		; Set duration of first "note"
	btst	#f_spindash_lastsound,misc_flags(a6)	; Is the Spin Dash sound playing?
	beq.s	.notspindash				; If not, branch
	move.b	v_spindash_pitch(a6),d0
	add.b	d0,zTrack.Transpose(a5)
.notspindash:
	move.b	d6,zTrack.StackPointer(a5)	; Set "gosub" (coord flag F8h) stack init value
	tst.b	d4				; Is this a PSG channel?
	bmi.s	.sfxpsginitdone			; Branch if yes
	move.b	#$C0,zTrack.AMSFMSPan(a5)	; AMS/FMS/Panning
	move.l	d1,zTrack.VoicePtr(a5)		; Voice pointer
; loc_722A8:
.sfxpsginitdone:
	dbf	d7,.sfx_loadloop

    if EnableSpecSFX
	tst.b	v_sfx_fm4_track.PlaybackControl(a6)	; Is SFX being played?
	bpl.s	.doneoverride				; Branch if not
	bset	#2,v_sfx2_fm4_track.PlaybackControl(a6)	; Set SFX is overriding bit
; loc_722B8:
.doneoverride:
	tst.b	v_sfx_psg3_track.PlaybackControl(a6)	; Is special SFX being played?
	bpl.s	.locret					; Branch if not
	bset	#2,v_sfx2_psg3_track.PlaybackControl(a6) ; Set SFX is overriding bit
    endif
; locret_722C4:
.locret:
	rts
; ===========================================================================
; loc_722C6:
.clear_sndprio:
	clr.b	v_sndprio(a6)	; Clear priority
	rts
; ===========================================================================
; ---------------------------------------------------------------------------
; RAM addresses for FM and PSG channel variables used by the SFX
; ---------------------------------------------------------------------------
; dword_722EC: SFXChannelRAM:
SFX_SFXChannelRAM:
		dc.l (Clone_Driver_RAM+v_sfx_fm3_track)&$FFFFFF
		dc.l 0
		dc.l (Clone_Driver_RAM+v_sfx_fm4_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_sfx_fm5_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_sfx_psg1_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_sfx_psg2_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_sfx_psg3_track)&$FFFFFF	; Plain PSG3
		dc.l (Clone_Driver_RAM+v_sfx_psg3_track)&$FFFFFF	; Noise
; dword_722CC: BGMChannelRAM:
SFX_BGMChannelRAM:
		dc.l (Clone_Driver_RAM+v_fm3_track)&$FFFFFF
		dc.l 0
		dc.l (Clone_Driver_RAM+v_fm4_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_fm5_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_psg1_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_psg2_track)&$FFFFFF
		dc.l (Clone_Driver_RAM+v_psg3_track)&$FFFFFF	; Plain PSG3
		dc.l (Clone_Driver_RAM+v_psg3_track)&$FFFFFF	; Noise

; ===========================================================================
; ---------------------------------------------------------------------------
; Play GHZ waterfall sound
; ---------------------------------------------------------------------------
    if EnableSpecSFX
; Sound_D0toDF:
Sound_PlaySpecial:
	tst.b	f_1up_playing(a6)		; Is 1-up playing?
	bne.w	.locret				; Return if so
;	tst.b	v_fadeout_counter(a6)		; Is music being faded out?	; Clownacy | S2's driver didn't bother with this in Sound_PlaySFX
;	bne.w	.locret				; Exit if it is
	btst	#f_fadein_flag,misc_flags(a6)	; Is music being faded in?
	bne.w	.locret				; Exit if it is
	lea	SpecSoundIndex(pc),a0
	subi.b	#SpecID__First,d7		; Make it 0-based
	add.w	d7,d7
	add.w	d7,d7
	movea.l	(a0,d7.w),a3
	movea.l	a3,a1
;	moveq	#0,d0
	move.l	(a1)+,v_special_voice_ptr(a6)	; Store voice pointer
	move.b	(a1)+,d5			; Dividing timing
	; DANGER! there is a missing 'moveq	#0,d7' here, without which Special SFXes whose
	; index entry is above $3F will cause a crash. Ristar's driver didn't have this
	; particular instance fixed.
    if Fix_DriverBugs
	moveq	#0,d7
    endif
	move.b	(a1)+,d7	; Number of tracks (FM + PSG)
	subq.b	#1,d7
	moveq	#zTrack.len,d6
; loc_72348:
.sfxloadloop:
	move.b	1(a1),d4				; Voice control bits
	bmi.s	.sfxoverridepsg				; Branch if PSG
	bset	#2,v_fm4_track.PlaybackControl(a6)	; Set 'SFX is overriding' bit
	lea	v_sfx2_fm4_track(a6),a5
	bra.s	.sfxinitpsg
; ===========================================================================
; loc_7235A:
.sfxoverridepsg:
	bset	#2,v_psg3_track.PlaybackControl(a6)	; Set 'SFX is overriding' bit
	lea	v_sfx2_psg3_track(a6),a5
; loc_72364:
.sfxinitpsg:
	movea.l	a5,a2
	moveq	#(zTrack.len/4)-1,d0	; $30 bytes
	moveq	#0,d2
; loc_72368:
.clearsfxtrackram:
	move.l	d2,(a2)+
	dbf	d0,.clearsfxtrackram

	move.w	(a1)+,zTrack.PlaybackControl(a5)	; Initial playback control bits
	move.b	d5,zTrack.TempoDivider(a5)		; Initial voice control bits
	moveq	#0,d0
	move.w	(a1)+,d0				; Track data pointer
	add.l	a3,d0					; Relative pointer
	move.l	d0,zTrack.DataPointer(a5)		; Store track pointer
	move.w	(a1)+,zTrack.Transpose(a5)		; load FM/PSG channel modifier
	move.b	#1,zTrack.DurationTimeout(a5)		; Set duration of first "note"
	move.b	d6,zTrack.StackPointer(a5)		; set "gosub" (coord flag F8h) stack init value
	tst.b	d4					; Is this a PSG channel?
	bmi.s	.sfxpsginitdone				; Branch if yes
	move.b	#$C0,zTrack.AMSFMSPan(a5)		; AMS/FMS/Panning
; loc_72396:
.sfxpsginitdone:
	dbf	d7,.sfxloadloop

	tst.b	v_sfx_fm4_track.PlaybackControl(a6)	; Is track playing?
	bpl.s	.doneoverride				; Branch if not
	bset	#2,v_sfx2_fm4_track.PlaybackControl(a6)	; Set 'SFX is overriding' track
; loc_723A6:
.doneoverride:
	tst.b	v_sfx_psg3_track.PlaybackControl(a6)	; Is track playing?
	bpl.s	.locret					; Branch if not
	bset	#2,v_sfx2_psg3_track.PlaybackControl(a6) ; Set 'SFX is overriding' track
	ori.b	#$1F,d4					; Command to silence channel
	lea	(PSG_input).l,a1
	move.b	d4,(a1)
	bchg	#5,d4					; Command to silence noise channel
	move.b	d4,(a1)
; locret_723C6:
.locret:
	rts
; End of function Sound_ChkValue
    endif

; ===========================================================================
; ---------------------------------------------------------------------------
; Unused RAM addresses for FM and PSG channel variables used by the Special SFX
; ---------------------------------------------------------------------------
; The first block would have been used for overriding the music tracks
; as they have a lower priority, just as they are in Sound_PlaySFX
; The third block would be used to set up the Special SFX
; The second block, however, is for the SFX tracks, which have a higher priority
; and would be checked for if they're currently playing
; If they are, then the third block would be used again, this time to mark
; the new tracks as 'currently playing'

; These were actually used in Moonwalker's driver (SMPS 68k Type 1a)

; BGMFM4PSG3RAM:
;SpecSFX_BGMChannelRAM:
;		dc.l (Clone_Driver_RAM+v_fm4_track)&$FFFFFF
;		dc.l (Clone_Driver_RAM+v_psg3_track)&$FFFFFF
; SFXFM4PSG3RAM:
;SpecSFX_SFXChannelRAM:
;		dc.l (Clone_Driver_RAM+v_sfx_fm4_track)&$FFFFFF
;		dc.l (Clone_Driver_RAM+v_sfx_psg3_track)&$FFFFFF
; SpecialSFXFM4PSG3RAM:
;SpecSFX_SpecSFXChannelRAM:
;		dc.l (Clone_Driver_RAM+v_sfx2_fm4_track)&$FFFFFF
;		dc.l (Clone_Driver_RAM+v_sfx2_psg3_track)&$FFFFFF

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; Snd_FadeOut1: Snd_FadeOutSFX: FadeOutSFX:
StopSFX:
	clr.b	v_sndprio(a6)			; Clear priority
	lea	v_sfx_track_ram(a6),a5
	moveq	#(v_sfx_psg3_track-v_sfx_fm3_track)/zTrack.len,d6	; 3 FM + 3 PSG (SFX)	; Clownacy | Now uses d6 instead of d7 so it doesn't conflict with Sound_PlayBGM
; loc_723EA:
.trackloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.w	.nexttrack			; Branch if not
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bclr	#4,zTrack.PlaybackControl(a5)	; Clear 'do not attack next note'
	moveq	#0,d3
	move.b	zTrack.VoiceControl(a5),d3	; Get voice control bits
	bmi.s	.trackpsg			; Branch if PSG
	bsr.w	FMNoteOff
    if EnableSpecSFX
	cmpi.b	#4,d3				; Is this FM4?
	bne.s	.getfmpointer			; Branch if not
	tst.b	v_sfx2_fm4_track.PlaybackControl(a6)	; Is special SFX playing?
	bpl.s	.getfmpointer			; Branch if not
	; DANGER! there is a missing 'movea.l	a5,a3' here, without which the
	; code is broken. It is dangerous to do a fade out when a GHZ waterfall
	; is playing its sound!
    if Fix_DriverBugs
	movea.l	a5,a3
    endif

	lea	v_sfx2_fm4_track(a6),a5
	movea.l	v_special_voice_ptr(a6),a1	; Get special voice pointer
	bra.s	.gotfmpointer
    endif
; ===========================================================================
; loc_72416:
.getfmpointer:
	subq.b	#2,d3				; SFX only has FM3 and up
	add.b	d3,d3
	add.b	d3,d3
	lea	SFX_BGMChannelRAM(pc),a0
	movea.l	a5,a3
	movea.l	(a0,d3.w),a5
	movea.l	v_voice_ptr(a6),a1		; Get music voice pointer
; loc_72428:
.gotfmpointer:
	bclr	#2,zTrack.PlaybackControl(a5)	; Clear 'SFX is overriding' bit
	beq.s	.nooverride			; If it was already clear, branch and do nothing
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	move.b	zTrack.VoiceIndex(a5),d0	; Current voice
	bsr.w	SetVoice
.nooverride:
	movea.l	a3,a5
	bra.s	.nexttrack
; ===========================================================================
; loc_7243C:
.trackpsg:
	bsr.w	PSGNoteOff
    if EnableSpecSFX
	lea	v_sfx2_psg3_track(a6),a0
	cmpi.b	#$E0,d3					; Is this a noise channel:
	beq.s	.gotpsgpointer				; Branch if yes
	cmpi.b	#$C0,d3					; Is this PSG 3?
	beq.s	.gotpsgpointer				; Branch if yes
    endif
	lsr.b	#3,d3
	lea	SFX_BGMChannelRAM(pc),a0
	movea.l	(a0,d3.w),a0
; loc_7245A:
.gotpsgpointer:
	bclr	#2,zTrack.PlaybackControl(a0)		; Clear 'SFX is overriding' bit
	bset	#1,zTrack.PlaybackControl(a0)		; Set 'track at rest' bit
	cmpi.b	#$E0,zTrack.VoiceControl(a0)		; Is this a noise channel?
	bne.s	.nexttrack				; Branch if not
	move.b	zTrack.PSGNoise(a0),(PSG_input).l	; Set noise type
; loc_72472:
.nexttrack:
	lea	zTrack.len(a5),a5
	dbf	d6,.trackloop		; Clownacy | Now uses d6 instead of d7 so it doesn't conflict with Sound_PlayBGM
.locret:
	rts
; End of function StopSFX


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||
    if EnableSpecSFX
; Snd_FadeOut2: Snd_FadeOutSFX2: FadeOutSpecSFX:
StopSpecSFX:
	lea	v_sfx2_fm4_track(a6),a5
	tst.b	zTrack.PlaybackControl(a5)		; Is track playing?
	bpl.s	.fadedfm				; Branch if not
	bclr	#7,zTrack.PlaybackControl(a5)		; Stop track
	btst	#2,zTrack.PlaybackControl(a5)		; Is SFX overriding?
	bne.s	.fadedfm				; Branch if not
	bsr.w	SendFMNoteOff
	lea	v_fm4_track(a6),a5
	bclr	#2,zTrack.PlaybackControl(a5)		; Clear 'SFX is overriding' bit
	bset	#1,zTrack.PlaybackControl(a5)		; Set 'track at rest' bit
	tst.b	zTrack.PlaybackControl(a5)		; Is track playing?
	bpl.s	.fadedfm				; Branch if not
	movea.l	v_voice_ptr(a6),a1			; Voice pointer
	move.b	zTrack.VoiceIndex(a5),d0		; Current voice
	bsr.w	SetVoice
; loc_724AE:
.fadedfm:
	lea	v_sfx2_psg3_track(a6),a5
	tst.b	zTrack.PlaybackControl(a5)		; Is track playing?
	bpl.s	.fadedpsg				; Branch if not
	bclr	#7,zTrack.PlaybackControl(a5)		; Stop track
	btst	#2,zTrack.PlaybackControl(a5)		; Is SFX overriding?
	bne.s	.fadedpsg				; Return if not
	bsr.w	SendPSGNoteOff
	lea	v_psg3_track(a6),a5
	bclr	#2,zTrack.PlaybackControl(a5)		; Clear 'SFX is overriding' bit
	bset	#1,zTrack.PlaybackControl(a5)		; Set 'track at rest' bit
	tst.b	zTrack.PlaybackControl(a5)		; Is track playing?
	bpl.s	.fadedpsg				; Return if not
	cmpi.b	#$E0,zTrack.VoiceControl(a5)		; Is this a noise channel?
	bne.s	.fadedpsg				; Return if not
	move.b	zTrack.PSGNoise(a5),(PSG_input).l	; Set noise type
; locret_724E4:
.fadedpsg
	rts
; End of function StopSpecSFX
    endif
; ===========================================================================
; ---------------------------------------------------------------------------
; Fade out music
; ---------------------------------------------------------------------------
; Sound_E0:
FadeOutMusic:
	; Clownacy | In Sonic 2's driver, StopSFX is split into its own sound command
	; and StopSpecSFX is bumped out entirely
;	bsr.w	StopSFX
;    if EnableSpecSFX
;	bsr.s	StopSpecSFX
;    endif
	move.b	#3,v_fadeout_delay(a6)		; Set fadeout delay to 3
	move.b	#$28,v_fadeout_counter(a6)	; Set fadeout counter
	clr.b	f_speedup(a6)			; Disable speed shoes tempo
	rts

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72504:
DoFadeOut:
	move.b	v_fadeout_delay(a6),d0	; Has fadeout delay expired?
	beq.s	.continuefade		; Branch if yes
	subq.b	#1,v_fadeout_delay(a6)
	rts
; ===========================================================================
; loc_72510:
.continuefade:
	subq.b	#1,v_fadeout_counter(a6)	; Update fade counter
	beq.w	StopSoundAndMusic		; Branch if fade is done
	move.b	#3,v_fadeout_delay(a6)		; Reset fade delay
	lea	v_dac_track(a6),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.fadefm				; Branch if not
	addq.b	#4,zTrack.Volume(a5)		; Increase volume attenuation
	bpl.s	.senddacvol			; Branch if still positive
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bra.s	.fadefm
; ===========================================================================

.senddacvol:
	bsr.w	SetDACVolume

.fadefm:
	lea	v_fm1_track(a6),a5
	moveq	#(v_fm6_track-v_fm1_track)/zTrack.len,d7	; 6 FM tracks
; loc_72524:
.fmloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextfm				; Branch if not
	addq.b	#1,zTrack.Volume(a5)		; Increase volume attenuation
	bpl.s	.sendfmtl			; Branch if still positive
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bra.s	.nextfm
; ===========================================================================
; loc_72534:
.sendfmtl:
	bsr.w	SendVoiceTL
; loc_72538:
.nextfm:
	lea	zTrack.len(a5),a5
	dbf	d7,.fmloop

	moveq	#(v_psg3_track-v_psg1_track)/zTrack.len,d7	; 3 PSG tracks
; loc_72542:
.psgloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextpsg			; branch if not
	lea	zTrack.Volume(a5),a0		; Optimise the following code that uses this
	addq.b	#1,(a0)				; Increase volume attenuation
	cmpi.b	#$10,(a0)			; Is it greater than $F?
	blo.s	.sendpsgvol			; Branch if not
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bra.s	.nextpsg
; ===========================================================================
; loc_72558:
.sendpsgvol:
	move.b	(a0),d6	; Store new volume attenuation
	bsr.w	SetPSGVolume
; loc_72560:
.nextpsg:
	lea	zTrack.len(a5),a5
	dbf	d7,.psgloop

	rts
; End of function DoFadeOut


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

FMSilenceChannel:
	moveq	#3,d4
	moveq	#$40,d3
	moveq	#$7F,d1

-	move.b	d3,d0
	bsr.w	WriteFMIorII
	addq.b	#4,d3
	dbf	d4,-

	moveq	#3,d4
	move.b	#$80,d3
	moveq	#$F,d1

-	move.b	d3,d0
	bsr.w	WriteFMIorII
	addq.b	#4,d3
	dbf	d4,-

	rts
; End of function FMSilenceChannel

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_7256A:
FMSilenceAll:
	moveq	#2,d3		; 3 FM channels for each YM2612 parts
	moveq	#$28,d0		; FM key on/off register
; loc_7256E:
.noteoffloop:
	move.b	d3,d1
	bsr.w	WriteFMI
	addq.b	#4,d1		; Move to YM2612 part 1
	bsr.w	WriteFMI
	dbf	d3,.noteoffloop

	moveq	#$40,d0		; Set TL on FM channels...
	moveq	#$7F,d1		; ... to total attenuation...
	moveq	#2,d4		; ... for all 3 channels...
; loc_72584:
.channelloop:
	moveq	#3,d3		; ... for all operators on each channel...
; loc_72586:
.channeltlloop:
	bsr.w	WriteFMI		; ... for part 0...
	bsr.w	WriteFMII		; ... and part 1
	addq.w	#4,d0			; Next TL operator
	dbf	d3,.channeltlloop

	subi.b	#$F,d0		; Move to TL operator 1 of next channel
	dbf	d4,.channelloop

	rts
; End of function FMSilenceAll

; ===========================================================================
; ---------------------------------------------------------------------------
; Stop music
; ---------------------------------------------------------------------------
; Sound_E4:
StopSoundAndMusic:
	moveq	#$27,d0		; Timers, FM3/FM6 mode
	moveq	#0,d1		; FM3/FM6 normal mode, disable timers
	bsr.w	WriteFMI
	movea.l	a6,a0
	move.w	#((v_sfx2_track_ram_end-v_startofvariables)/4)-1,d0	; Clear all variables and track data (don't really care about clearing the music track backup)
.skipclearsfx:
	moveq	#0,d2
; loc_725B6:
.clearramloop:
	move.l	d2,(a0)+
	dbf	d0,.clearramloop

	move.b	d2,v_playsnd0(a6)	; Set music to $00 (silence)
	; From Vladikcomper:
	; "Playing sample $80 forces to stop playback."
	; "We need the Z80 to be stopped before this command executes and to be started directly afterwards."
	stopZ80
	move.b  #$80,(z80_dac_sample).l	; stop DAC playback
	startZ80

	pea	PSGSilenceAll(pc)
	bra.w	FMSilenceAll

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_725CA:
InitMusicPlayback:
	movea.l	a6,a0
	; Save several values
	move.b	v_sndprio(a6),d1
	move.b	f_1up_playing(a6),d2
	move.b	f_speedup(a6),d3
	move.b	v_fadein_counter(a6),d4
	move.w	v_playsnd1(a6),d5
	move.w	#((v_track_ram_end-v_startofvariables)/4)-1,d0	; Clear $220 bytes: all variables and music track data
	moveq	#0,d6

; loc_725E4:
.clearramloop:
	move.l	d6,(a0)+
	dbf	d0,.clearramloop

	; Restore the values saved above
	move.b	d1,v_sndprio(a6)
	move.b	d2,f_1up_playing(a6)
	move.b	d3,f_speedup(a6)
	move.b	d4,v_fadein_counter(a6)
	move.w	d5,v_playsnd1(a6)
	move.b	d6,v_playsnd0(a6)	; set music to $00 (silence)
	moveq	#$0|((VolumeTbls&$F000)>>8),d0	; Clownacy | Reset DAC volume to maximum
	bsr.w	WriteDACVolume
    if Fix_DriverBugs
	rts
    else
	; Clownacy | We don't need this, especially since .sfxstoploop does the
	; same thing, only better (it only silences the music channels).
	; This actually causes a bug in S1's driver, where an SFX is interrupted
	; when a new song starts, causing sound distorition. S2 just stopped all
	; SFX when a new song plays, which just hides the problem.
	pea	PSGSilenceAll(pc)
	bra.w	FMSilenceAll
    endif
; End of function InitMusicPlayback


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_7260C:
TempoWait:	; Clownacy | Ported straight from S3K's Z80 driver
	move.b	v_main_tempo(a6),d0				; Get current tempo value
	add.b	d0,v_main_tempo_timeout(a6)
	bcc.s	.skipdelay					; If the addition did not overflow, return
	lea	v_track_ram+zTrack.DurationTimeout(a6),a0	; Duration timeout of first track
	moveq	#zTrack.len,d0					; Spacing between tracks
	moveq	#(v_psg3_track-v_dac_track)/zTrack.len,d1	; Number of tracks (1x DAC + 6x FM + 3x PSG)

.delayloop:
	addq.b	#1,(a0)					; Delay notes another frame
	adda.w	d0,a0					; Advance to next track
	dbf	d1,.delayloop				; Loop for all tracks
; loc_71B9E:
.skipdelay:
	rts
; End of function TempoWait

; ===========================================================================
; ---------------------------------------------------------------------------
; Speed	up music
; ---------------------------------------------------------------------------
; Sound_E2:
SpeedUpMusic:
	tst.b	f_1up_playing(a6)
	bne.s	SpeedUpMusic_1up
	move.b	v_speeduptempo(a6),v_main_tempo(a6)
	move.b	#$80,f_speedup(a6)
	rts
; ===========================================================================
; loc_7263E: .speedup_1up:
SpeedUpMusic_1up:
	move.b	v_1up_variables+v_speeduptempo(a6),v_1up_variables+v_main_tempo(a6)
	move.b	#$80,v_1up_variables+f_speedup(a6)
	rts
; ===========================================================================
; ---------------------------------------------------------------------------
; Change music back to normal speed
; ---------------------------------------------------------------------------
; Sound_E3:
SlowDownMusic:
	tst.b	f_1up_playing(a6)
	bne.s	SlowDownMusic_1up
	move.b	v_tempo_mod(a6),v_main_tempo(a6)
	clr.b	f_speedup(a6)
	rts
; ===========================================================================
; loc_7266A: .slowdown_1up:
SlowDownMusic_1up:
	move.b	v_1up_variables+v_tempo_mod(a6),v_1up_variables+v_main_tempo(a6)
	clr.b	v_1up_variables+f_speedup(a6)
	rts

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_7267C:
DoFadeIn:
	tst.b	v_fadein_delay(a6)	; Has fadein delay expired?
	beq.s	.continuefade		; Branch if yes
	subq.b	#1,v_fadein_delay(a6)
	rts
; ===========================================================================
; loc_72688:
.continuefade:
	tst.b	v_fadein_counter(a6)	; Is fade done?
	beq.s	.fadedone		; Branch if yes
	subq.b	#1,v_fadein_counter(a6)	; Update fade counter
	move.b	#2,v_fadein_delay(a6)	; Reset fade delay
	lea	v_dac_track(a6),a5
	tst.b	zTrack.PlaybackControl(a5) ; Is track playing?
	bpl.s	.fadefm			; Branch if not
	subq.b	#4,zTrack.Volume(a5)	; Reduce volume attenuation
	bsr.w	SetDACVolume

.fadefm:
	lea	v_fm1_track(a6),a5
	moveq	#(v_fm6_track-v_fm1_track)/zTrack.len,d7	; 6 FM tracks
; loc_7269E:
.fmloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextfm				; Branch if not
	subq.b	#1,zTrack.Volume(a5)		; Reduce volume attenuation
	bsr.w	SendVoiceTL
; loc_726AA:
.nextfm:
	lea	zTrack.len(a5),a5
	dbf	d7,.fmloop
	moveq	#(v_psg3_track-v_psg1_track)/zTrack.len,d7	; 3 PSG tracks
; loc_726B4:
.psgloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextpsg			; Branch if not
	subq.b	#1,zTrack.Volume(a5)		; Reduce volume attenuation
	move.b	zTrack.Volume(a5),d6		; Get value
;	cmpi.b	#$10,d6				; Is it is < $10?	; Clownacy | This correction is moved to SetPSGVolume (the S2 way)
;	blo.s	.sendpsgvol			; Branch if yes
;	moveq	#$F,d6				; Limit to $F (maximum attenuation)
; loc_726C8:
;.sendpsgvol:
	bsr.w	SetPSGVolume
; loc_726CC:
.nextpsg:
	lea	zTrack.len(a5),a5
	dbf	d7,.psgloop
.locret:
	rts
; ===========================================================================
; loc_726D6:
.fadedone:	; Modified version of MJ's original DAC fade-in fix
	bclr	#f_fadein_flag,misc_flags(a6)		; Stop fadein
	tst.b	v_dac_track.PlaybackControl(a6)		; is the DAC channel running?
	bpl.s	.locret					; if not, return
;.DAC:
	move.b	#$B6,d0					; MJ: AMS/FMS/panning of FM6
	move.b	v_dac_track.AMSFMSPan(a6),d1		; MJ: load DAC channel's L/R/AMS/FMS value
	bra.w	WriteFMII				; MJ: write to FM 6

;.locret:
;	rts
; End of function DoFadeIn

; ===========================================================================

SetDACVolume:
	moveq	#0,d0
	move.b	zTrack.Volume(a5),d0
	cmpi.b	#$7F,d0	; $7F is the last valid volume
	bhi.s	.maxreached
	lsr.b	#3,d0
	andi.b	#$F,d0
	ori.b	#(VolumeTbls&$F000)>>8,d0
	bra.s	WriteDACVolume
.maxreached:
	moveq	#$F|((VolumeTbls&$F000)>>8),d0	; cap at maximum value (minimum volume)
	;bra.s	WriteDACVolume

WriteDACVolume:
	stopZ80
	move.b	d0,(z80_dac_volume).l
	startZ80
	rts
; End of function SetDACVolume

; ===========================================================================

; loc_726E2:
FMNoteOn:
	btst	#1,zTrack.PlaybackControl(a5)	; Is track resting?
	bne.s	locret_726FC			; Return if so
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overridden?
	bne.s	locret_726FC			; Return if so
	cmpi.b	#6,zTrack.VoiceControl(a5)	; If this FM6?
	bne.s	.notfm6				; If not, branch
	moveq	#$2B,d0				; DAC enable/disable register
	moveq	#0,d1				; Disable DAC (letting FM6 run)
	bsr.w	WriteFMI
.notfm6:
	moveq	#$28,d0				; Note on/off register
	move.b	zTrack.VoiceControl(a5),d1	; Get channel bits
	ori.b	#$F0,d1				; Note on on all operators
	bra.s	WriteFMI
; ===========================================================================
locret_726FC:
	rts

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_726FE:
FMNoteOff:
	btst	#4,zTrack.PlaybackControl(a5)	; Is 'do not attack next note' set?
	bne.s	locret_726FC			; Return if yes
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	locret_726FC			; Return if yes
; loc_7270A:
SendFMNoteOff:
	moveq	#$28,d0				; Note on/off register
	move.b	zTrack.VoiceControl(a5),d1	; Note off to this channel
	bra.s	WriteFMI
; End of function FMNoteOff

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72722:
WriteFMIorII:
	btst	#2,zTrack.VoiceControl(a5)	; Is this bound for part I or II?
	bne.s	WriteFMIIPart			; Branch if for part II
	add.b	zTrack.VoiceControl(a5),d0	; Add in voice control bits
; End of function WriteFMIorII


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; List of cycle counts from various revisions of WriteFMI (Write cycles + 'wait for YM' cycles)


; (SMPS 68k Type 1a)
;  Michael Jackson's Moonwalker:
;	32(6/2) + 68(14/0)
;  Strider Hiryuu
;	32(6/2) + 58(12/0) (Slightly optimised by replacing a btst #7's function with a bmi)


; (SMPS 68k Type 1b)
;  Sonic the Hedgehog:
;	32(6/2) + 80(17/0) (Interestingly, this uses the Type 1a version, with some nops)
;  Mega PCM standard:
;	52(10/3) + 102(21/0)
;  Clone Driver v2:
;	40(7/3) + 74(15/0)
;  Golden Axe 2:
;	32(6/2) + 44(9/0)
;  Nekketsu Koukou Dodgeball Bu Soccer Hen MD:
;	32(6/2) + 40(8/0) (Like Golden Axe 2 minus the nop)


; (SMPS 68k Type 2)
;  Fatal Fury:
;	Same as Golden Axe 2
;  Fatal Fury 2:
;	Same as Golden Axe 2
;  Golden Axe 3:
;	Same as Golden Axe 2
;  Phantasy Star: The End of the Millenium
;	Same as Golden Axe 2
;  Super Shinobi II
;	Same as Golden Axe 2
;  Bishoujo Senshi Sailor Moon
;	Same as Golden Axe 2

; Vladikcomper's modified WriteFMI, optimised by Clownacy
; sub_7272E:
WriteFMI:
	stopZ80
	lea	(ym2612_a0).l,a0		; 12(3/0)
	waitYM					; 24(5/0)
	move.b	d0,(a0)		; ym2612_a0	; 8(1/1)
	waitYMspec (a0)+			; 8(2/0) + 18(4/0)
	move.b	d1,(a0)		; ym2612_d0	; 8(1/1)
	waitYMspec -(a0)			; 10(2/0) + 18(4/0)
	move.b	#$2A,(a0)	; ym2612_a0	; 12(2/1)
	startZ80				; Total: 40(7/3) + 78(17/0)

locret_72714:
	rts
; End of function WriteFMI

; ===========================================================================
; loc_7275A:
WriteFMIIPart:
	move.b	zTrack.VoiceControl(a5),d2	; Get voice control bits
	bclr	#2,d2				; Clear chip toggle
	add.b	d2,d0				; Add in to destination register

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; Vladikcomper's modified WriteFMII, optimised by Clownacy
; sub_72764:
WriteFMII:
	stopZ80
	lea	(ym2612_a0).l,a0		; 12(3/0)
	waitYM					; 24(5/0)
	move.b	d0,2(a0)	; ym2612_a1	; 12(2/1)
	waitYM					; 24(5/0)
	move.b	d1,3(a0)	; ym2612_d1	; 12(2/1)
	waitYM					; 24(5/0)
	move.b	#$2A,(a0)	; ym2612_a0	; 12(2/1)
	startZ80				; Total: 48(9/3) + 72(15/0)
	rts
; End of function WriteFMII

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72850:
PSGUpdateTrack:
	subq.b	#1,zTrack.DurationTimeout(a5)	; Update note timeout
	bne.s	.notegoing
	bclr	#4,zTrack.PlaybackControl(a5)	; Clear 'do not attack note' flag
	bsr.s	PSGDoNext
	bsr.w	PSGDoNoteOn
	bsr.w	PSGDoVolFX
	; Clownacy | Sonic 2 adds these two branches
	bsr.w	DoModulation
	bra.w	PSGUpdateFreq
; ===========================================================================
; loc_72866:
.notegoing:
	bsr.w	NoteFillUpdate
	bsr.w	PSGUpdateVolFX
	bsr.w	DoModulation
	bra.w	PSGUpdateFreq
; End of function PSGUpdateTrack


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72878:
PSGDoNext:
	bclr	#1,zTrack.PlaybackControl(a5)	; Clear 'track at rest' bit
	movea.l	zTrack.DataPointer(a5),a4	; Get track data pointer
; loc_72880:
.noteloop:
	moveq	#0,d5
	move.b	(a4)+,d5	; Get byte from track
	cmpi.b	#$FE,d5		; Is it a coord. flag?
	blo.s	.gotnote	; Branch if not
	bsr.w	CoordFlag
	bra.s	.noteloop
; ===========================================================================
; loc_72890:
.gotnote:
	tst.b	d5			; Is it a note?
	bpl.w	SetDuration_pea		; Branch if not
	bsr.s	PSGSetFreq
	move.b	(a4)+,d5		; Get another byte
	tst.b	d5			; Is it a duration?
	bpl.w	SetDuration_pea		; Branch if yes
	subq.w	#1,a4			; Put byte back
	bra.w	FinishTrackUpdate
; ===========================================================================
; loc_728A4:
;.gotduration:	Clownacy | Replaced by SetDuration_pea
;	pea	FinishTrackUpdate(pc)	; Clownacy | Save 2 cycles
;	bra.w	SetDuration
; End of function PSGDoNext


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_728AC:
PSGSetFreq:
	subi.b	#$81,d5			; Convert to 0-based index
	blo.s	.restpsg		; If $80, put track at rest
	add.b	zTrack.Transpose(a5),d5	; Add in channel transposition
	andi.w	#$7F,d5			; Clear high byte and sign bit
	add.w	d5,d5
	move.w	PSGFrequencies(pc,d5.w),zTrack.Freq(a5)	; Set new frequency
	; Clownacy | Sonic 2's driver doesn't continue to FinishTrackUpdate
	rts
; ===========================================================================
; loc_728CA:
.restpsg:
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	move.w	#-1,zTrack.Freq(a5)		; Invalidate note frequency
	; Clownacy | Sonic 2's driver doesn't continue to FinishTrackUpdate
	bra.w	PSGNoteOff
; End of function PSGSetFreq

; ===========================================================================
; word_729CE:
PSGFrequencies:
    if ReverseFreqs = 0
	; This table starts with 12 notes not in S1 or S2:
	dc.w $3FF, $3FF, $3FF, $3FF, $3FF, $3FF, $3FF, $3FF
	dc.w $3FF, $3F7, $3BE, $388
	; The following notes are present on S1 and S2 too:
	dc.w $356, $326, $2F9, $2CE, $2A5, $280, $25C, $23A
	dc.w $21A, $1FB, $1DF, $1C4, $1AB, $193, $17D, $167
	dc.w $153, $140, $12E, $11D, $10D,  $FE,  $EF,  $E2
	dc.w  $D6,  $C9,  $BE,  $B4,  $A9,  $A0,  $97,  $8F
	dc.w  $87,  $7F,  $78,  $71,  $6B,  $65,  $5F,  $5A
	dc.w  $55,  $50,  $4B,  $47,  $43,  $40,  $3C,  $39
	dc.w  $36,  $33,  $30,  $2D,  $2B,  $28,  $26,  $24
	dc.w  $22,  $20,  $1F,  $1D,  $1B,  $1A,  $18,  $17
	dc.w  $16,  $15,  $13,  $12,  $11,  $10,    0,    0
    else
	; The following notes are present on S1 and S2 too:
	dc.w    0,    0,  $10,  $11,  $12,  $13,  $15,  $16
	dc.w  $17,  $18,  $1A,  $1B,  $1D,  $1F,  $20,  $22
	dc.w  $24,  $26,  $28,  $2B,  $2D,  $30,  $33,  $36
	dc.w  $39,  $3C,  $40,  $43,  $47,  $4B,  $50,  $55
	dc.w  $5A,  $5F,  $65,  $6B,  $71,  $78,  $7F,  $87
	dc.w  $8F,  $97,  $A0,  $A9,  $B4,  $BE,  $C9,  $D6
	dc.w  $E2,  $EF,  $FE, $10D, $11D, $12E, $140, $153
	dc.w $167, $17D, $193, $1AB, $1C4, $1DF, $1FB, $21A
	dc.w $23A, $25C, $280, $2A5, $2CE, $2F9, $326, $356
	; This table starts with 12 notes not in S1 or S2:
	dc.w $388, $3BE, $3F7, $3FF, $3FF, $3FF, $3FF, $3FF
	dc.w $3FF, $3FF, $3FF, $3FF
    endif

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_728DC:
PSGDoNoteOn:
	move.w	zTrack.Freq(a5),d6	; Get note frequency
	bmi.s	PSGSetRest		; If invalid, branch
; End of function PSGDoNoteOn


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_728E2:
PSGUpdateFreq:
	move.b	zTrack.Detune(a5),d0		; Get detune value
	ext.w	d0
	add.w	d0,d6				; Add to frequency
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overridden?
	bne.s	.locret				; Return if yes
	btst	#1,zTrack.PlaybackControl(a5)	; Is track at rest?
	bne.s	.locret				; Return if yes
	move.b	zTrack.VoiceControl(a5),d0	; Get channel bits
	cmpi.b	#$E0,d0				; Is it a noise channel?
	bne.s	.notnoise			; Branch if not
	move.b	#$C0,d0				; Use PSG 3 channel bits
; loc_72904:
.notnoise:
	move.w	d6,d1
	andi.b	#$F,d1		; Low nibble of frequency
	or.b	d1,d0		; Latch tone data to channel
	lsr.w	#4,d6		; Get upper 6 bits of frequency
	andi.b	#$3F,d6		; Send to latched channel
	lea	(PSG_input).l,a0
	move.b	d0,(a0)
	move.b	d6,(a0)
; locret_7291E:
.locret:
	rts
; End of function PSGUpdateFreq

; ===========================================================================
; loc_72920:
PSGSetRest:
	bset	#1,zTrack.PlaybackControl(a5)

locret_72924:
	rts

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72926:
PSGUpdateVolFX:
	tst.b	zTrack.VoiceIndex(a5)	; Test PSG tone
	beq.s	locret_72924		; Return if it is zero
; loc_7292E:
PSGDoVolFX:
	; Clownacy | Rearranged to closer fit Super Shinobi 2's version of this code (SMPS 68k Type 2)
	; from which the additional PSG flags were ported
	move.b	zTrack.Volume(a5),d6	; Get volume
	moveq	#0,d0
	move.b	zTrack.VoiceIndex(a5),d0 ; Get PSG tone
	beq.s	SetPSGVolume
	lea	PSG_Index(pc),a0
	subq.w	#1,d0
	add.w	d0,d0
	add.w	d0,d0
	movea.l	(a0,d0.w),a0

PSGDoVolFX_Loop:
	moveq	#0,d0
	move.b	zTrack.VolFlutter(a5),d0	; Get flutter index
	addq.b	#1,zTrack.VolFlutter(a5)	; Increment flutter index
	move.b	(a0,d0.w),d0		; Get flutter value
	bpl.s	.gotflutter		; If it is not a terminator, branch
	cmpi.b	#$81,d0			; Clownacy | Most commonly used
	beq.s	VolEnv_Hold		; 81 - hold at current level
	cmpi.b	#$83,d0			; Clownacy | Second most commonly used
	beq.s	VolEnv_Off		; 83 - turn Note Off
	cmpi.b	#$80,d0			; Clownacy | Third most commonly used
	beq.s	VolEnv_Reset		; 80 - loop back to beginning
	cmpi.b	#$82,d0			; Clownacy | Fourth most commonly used
	beq.s	VolEnv_Jump2Idx		; 82 xx	- jump to byte xx
; loc_72960:
.gotflutter:
	add.w	d0,d6		; Add flutter to volume
;	cmpi.b	#$10,d6		; Is volume $10 or higher?	; Clownacy | This correction is moved to SetPSGVolume (the S2 way)
;	blo.s	SetPSGVolume	; Branch if not
;	moveq	#$F,d6		; Limit to silence and fall through
; End of function PSGUpdateVolFX


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_7296A:
SetPSGVolume:
	btst	#1,zTrack.PlaybackControl(a5)	; Is track at rest?
	bne.s	locret_7298A			; Return if so
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	locret_7298A			; Return if so
	btst	#4,zTrack.PlaybackControl(a5)	; Is track set to not attack next note?
	bne.s	PSGCheckNoteFill		; Branch if yes
; loc_7297C:
PSGSendVolume:
	; Clownacy | This correction is present elsewhere in S1's driver, but just having
	; a single copy here saves space and eliminates the few instances where the correction
	; isn't performed
	cmpi.b	#$10,d6				; Is volume $10 or higher?
	blo.s	+				; Branch if not
	moveq	#$F,d6				; Limit to silence and fall through
+
	or.b	zTrack.VoiceControl(a5),d6	; Add in track selector bits
	ori.b	#$10,d6				; Mark it as a volume command
	move.b	d6,(PSG_input).l

locret_7298A:
	rts
; ===========================================================================
; loc_7298C:
PSGCheckNoteFill:
	tst.b	zTrack.NoteFillMaster(a5)	; Is note fill on?
	beq.s	PSGSendVolume			; Branch if not
	tst.b	zTrack.NoteFillTimeout(a5)	; Has note fill timeout expired?
	bne.s	PSGSendVolume			; Branch if not
	rts
; End of function SetPSGVolume

; ===========================================================================
	; Clownacy | This isn't used by any current PSGs
	; but for the sake of forwards compatibility, it's here
VolEnv_Jump2Idx:
	move.b	1(a0,d0.w),zTrack.VolFlutter(a5)	; Change flutter index to the byte following the flag
	bra.s	PSGDoVolFX_Loop

; ===========================================================================

VolEnv_Reset:	; For compatibility with S3K
	clr.b	zTrack.VolFlutter(a5)
	bra.s	PSGDoVolFX_Loop

; ===========================================================================
; loc_7299A: FlutterDone:
VolEnv_Hold:
	subq.b	#1,zTrack.VolFlutter(a5)	; Decrement flutter index
	rts

; ===========================================================================

VolEnv_Off:	; For compatibility with S3K
	subq.b	#1,zTrack.VolFlutter(a5)	; Decrement flutter index
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
;	bra.s	PSGNoteOff

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_729A0:
PSGNoteOff:
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	locret_729B4			; Return if so
; loc_729A6:
SendPSGNoteOff:
	move.b	zTrack.VoiceControl(a5),d0	; PSG channel to change
	ori.b	#$1F,d0				; Maximum volume attenuation
	move.b	d0,(PSG_input).l
    if Fix_DriverBugs
	; Without InitMusicPlayback forcefully muting all channels, there's the
	; risk of music accidentally playing noise because it can't detect if
	; the PSG 4/noise channel needs muting, on track initialisation.
	; This bug can be heard be playing the End of Level music in CNZ, whose
	; music uses the noise channel. S&K's driver contains a fix just like this.
	cmpi.b	#$DF,d0			; Are we stopping PSG 3?
	bne.s	locret_729B4
	move.b	#$FF,(PSG_input).l	; If so, stop noise channel while we're at it
    endif
locret_729B4:
	rts
; End of function PSGNoteOff


; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_729B6:
PSGSilenceAll:
	lea	(PSG_input).l,a0
	move.b	#$9F,(a0)	; Silence PSG 1
	move.b	#$BF,(a0)	; Silence PSG 2
	move.b	#$DF,(a0)	; Silence PSG 3
	move.b	#$FF,(a0)	; Silence noise channel
	rts
; End of function PSGSilenceAll

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72A5A:
CoordFlag:
	cmpi.b	#$FE,d5		; Clownacy | smpsNoAttack doesn't like being two bytes, so it uses the unique $FE byte
	beq.w	cfPreventAttack
	move.b	(a4)+,d5	; Clownacy | The true coord flag value follows the $FF
	add.w	d5,d5
	add.w	d5,d5
	jmp	coordflagLookup(pc,d5.w)
; End of function CoordFlag

; ===========================================================================
; loc_72A64:
coordflagLookup:
	bra.w	cfPanningAMSFMS		; $FF, $00	Clownacy | Was $E0
; ===========================================================================
	bra.w	cfDetune		; $FF, $01	Clownacy | Was $E1
; ===========================================================================
	bra.w	cfSetCommunication	; $FF, $02	Clownacy | Was $E2
; ===========================================================================
	bra.w	cfJumpReturn		; $FF, $03	Clownacy | Was $E3
; ===========================================================================
	bra.w	cfFadeInToPrevious	; $FF, $04	Clownacy | Was $E4
; ===========================================================================
	bra.w	cfSetTempoDivider	; $FF, $05	Clownacy | Was $E5
; ===========================================================================
	bra.w	cfChangeFMVolume	; $FF, $06	Clownacy | Was $E6
; ===========================================================================
	bra.w	cfStopSpecialFM4	; $FF, $07	Clownacy | Was $EE
; ===========================================================================
	bra.w	cfNoteFill		; $FF, $08	Clownacy | Was $E8
; ===========================================================================
	bra.w	cfChangeTransposition	; $FF, $09	Clownacy | Was $E9
; ===========================================================================
	bra.w	cfSetTempo		; $FF, $0A	Clownacy | Was $EA
; ===========================================================================
	bra.w	cfSetTempoMod		; $FF, $0B	Clownacy | Was $EB
; ===========================================================================
	bra.w	cfChangePSGVolume	; $FF, $0C	Clownacy | Was $EC
; ===========================================================================
	bra.w	cfSetVoice		; $FF, $0D	Clownacy | Was $EF
; ===========================================================================
	bra.w	cfModulation		; $FF, $0E	Clownacy | Was $F0
; ===========================================================================
	bra.w	cfEnableModulation	; $FF, $0F	Clownacy | Was $F1
; ===========================================================================
	bra.w	cfStopTrack		; $FF, $10	Clownacy | Was $F2
; ===========================================================================
	bra.w	cfSetPSGNoise		; $FF, $11	Clownacy | Was $F3
; ===========================================================================
	bra.w	cfDisableModulation	; $FF, $12	Clownacy | Was $F4
; ===========================================================================
	bra.w	cfSetPSGTone		; $FF, $13	Clownacy | Was $F5
; ===========================================================================
	bra.w	cfJumpTo		; $FF, $14	Clownacy | Was $F6
; ===========================================================================
	bra.w	cfRepeatAtPos		; $FF, $15	Clownacy | Was $F7
; ===========================================================================
	bra.w	cfJumpToGosub		; $FF, $16	Clownacy | Was $F8
; ===========================================================================
	bra.w	cfChanFMCommand		; $FF, $17	Clownacy | Brand new
; ===========================================================================
	bra.w	cfSilenceStopTrack	; $FF, $18	Clownacy | Brand new
; ===========================================================================
	bra.w	cfPlayDACSample		; $FF, $19	Clownacy | Brand new
; ===========================================================================
	bra.w	cfPlaySound		; $FF, $1A	Clownacy | Brand new
; ===========================================================================
	bra.w	cfSetKey		; $FF, $1B	Clownacy | Brand new
; ===========================================================================
	bra.w	cfSetVolume		; $FF, $1C	Clownacy | Brand new
; ===========================================================================
	bra.w	cfNoteFillS3K		; $FF, $1D	Clownacy | Brand new
; ===========================================================================
	bra.w	cfLoopContinuousSFX	; $FF, $1E	Clownacy | Brand new
; ===========================================================================
	bra.w	cfClearPush		; $FF, $1F	Clownacy | Was $ED
; ===========================================================================
	bra.w	cfSendFMI		; $FF, $20	Clownacy | Brand new
; ===========================================================================
; loc_72ACC:
cfPanningAMSFMS:
	move.b	(a4)+,d1		; New AMS/FMS/panning value
	tst.b	zTrack.VoiceControl(a5)	; Is this a PSG track?
	bmi.s	locret_72AEA		; Return if yes
	btst	#2,zTrack.PlaybackControl(a5)
	bne.s	locret_72AEA
	move.b	zTrack.AMSFMSPan(a5),d0	; Get current AMS/FMS/panning
	andi.b	#$37,d0			; Retain bits 0-2, 3-4 if set
	or.b	d0,d1			; Mask in new value
	move.b	d1,zTrack.AMSFMSPan(a5)	; Store value
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overriden by sfx?
	bne.s	locret_72AEA			; Return if yes
	move.b	#$B4,d0			; Command to set AMS/FMS/panning
	bra.w	WriteFMIorII
; ===========================================================================
; loc_72AEC: cfAlterNotes:
cfDetune:
	move.b	(a4)+,zTrack.Detune(a5)	; Set detune value
locret_72AEA:
	rts
; ===========================================================================
; loc_72AF2:
cfSetCommunication:
	move.b	(a4)+,v_communication_byte(a6)	; Set otherwise unused communication byte to parameter
	rts
; ===========================================================================
; loc_72AF8:
cfJumpReturn:
	moveq	#0,d0
	move.b	zTrack.StackPointer(a5),d0	; Track stack pointer
	movea.l	(a5,d0.w),a4			; Set track return address
	clr.l	(a5,d0.w)			; Set 'popped' value to zero
	addq.w	#2,a4				; Skip jump target address from gosub flag
	addq.b	#4,d0				; Actually 'pop' value
	move.b	d0,zTrack.StackPointer(a5)	; Set new stack pointer
	rts
; ===========================================================================
; loc_72B14:
cfFadeInToPrevious:
	; Clownacy | This is my fix to allow cfFadeInToPrevious to be used on FM/PSG tracks
	btst	#f_updating_dac,misc_flags(a6)	; Clownacy | Is this running on the DAC channel
	bne.s	.dactrack			; If so, branch
	addq.w	#4,sp				; Tamper return value so we don't return to caller ; Clownacy | FM/PSG requires three addresses be stripped off
.dactrack:
	; Clownacy | We're restoring the variables and tracks separately, as the backed-up variables are now after the backed-up tracks
	; this is so the backed-up tracks and SFX tracks start at the same place: at the end of the music tracks
	lea	v_track_ram(a6),a0
	lea	v_1up_ram_copy(a6),a1
	moveq	#((v_track_ram_end-v_track_ram)/4)-1,d0	; restore music track data
; loc_72B1E:
.restoretrackramloop:
	move.l	(a1)+,(a0)+
	dbf	d0,.restoretrackramloop

	movea.l	a6,a0
	move.w	#(v_endofvariables-v_startofvariables)-1,d0	; restore variables
; loc_72B1E:
.restorevariablesloop:
	move.b	(a1)+,(a0)+
	dbf	d0,.restorevariablesloop

	lea	v_track_ram(a6),a0
	moveq	#(v_psg3_track-v_dac_track)/zTrack.len,d0	; 1 DAC + 6 FM + 3 PSG tracks
; loc_71FE6:
.restoreplaybackloop:
	move.b	zTrack.PlaybackControlBackup(a0),zTrack.PlaybackControl(a0)
	lea	zTrack.len(a0),a0
	dbf	d0,.restoreplaybackloop

	movea.l	a5,a3
	moveq	#$28,d6
	sub.b	v_fadein_counter(a6),d6			; If fade already in progress, this adjusts track volume accordingly
	lea	v_dac_track(a6),a5
	btst	#7,zTrack.PlaybackControl(a5)	; Is track playing?
	beq.s	.fadefm				; Branch if not
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	move.b	d6,d0
	add.b	d0,d0
	add.b	d0,d0
	add.b	d0,zTrack.Volume(a5)		; Apply current volume fade-in
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	.fadefm				; Branch if yes
	bsr.w	SetDACVolume

.fadefm:
	moveq	#(v_fm6_track-v_fm1_track)/zTrack.len,d7 ; 6 FM tracks
	lea	v_fm1_track(a6),a5
; loc_72B3A:
.fmloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextfm				; Branch if not
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	add.b	d6,zTrack.Volume(a5)		; Apply current volume fade-in
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	.nextfm				; Branch if yes
	moveq	#0,d0
	move.b	zTrack.VoiceIndex(a5),d0	; Get voice
	movea.l	v_voice_ptr(a6),a1		; Voice pointer
	bsr.w	SetVoice
; loc_72B5C:
.nextfm:
	lea	zTrack.len(a5),a5
	dbf	d7,.fmloop

	moveq	#(v_psg3_track-v_psg1_track)/zTrack.len,d7
; loc_72B66:
.psgloop:
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.nextpsg			; Branch if not
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	bsr.w	PSGNoteOff
	add.b	d6,zTrack.Volume(a5)		; Apply current volume fade-in
    if Fix_DriverBugs
	; Clownacy | One of Valley Bell's fixes: this restores the noise mode if need be, avoiding a bug where unwanted noise plays
	cmpi.b	#$E0,zTrack.VoiceControl(a5)		; Is this a noise channel?
	bne.s	.nextpsg				; Branch if not
	move.b	zTrack.PSGNoise(a5),(PSG_input).l	; Set noise type
    endif

; loc_72B78:
.nextpsg:
	lea	zTrack.len(a5),a5
	dbf	d7,.psgloop

	movea.l	a3,a5

	bset	#f_fadein_flag,misc_flags(a6)	; Trigger fade-in
	move.b	#$28,v_fadein_counter(a6)	; Fade-in delay
	clr.b	f_1up_playing(a6)
	addq.w	#8,sp				; Tamper return value so we don't return to caller
	rts
; ===========================================================================
; loc_72B9E:
cfSetTempoDivider:
	move.b	(a4)+,zTrack.TempoDivider(a5)	; Set tempo divider on current track
	rts
; ===========================================================================
; loc_72BA4: cfSetVolume:
cfChangeFMVolume:
	move.b	(a4)+,d0		; Get parameter
	add.b	d0,zTrack.Volume(a5)	; Add to current volume
	btst	#f_updating_dac,misc_flags(a6)
	bne.w	SetDACVolume
	bra.w	SendVoiceTL
; ===========================================================================
; loc_72BAE:
cfPreventAttack:
	bset	#4,zTrack.PlaybackControl(a5)	; Set 'do not attack next note' bit
	rts
; ===========================================================================
cfNoteFillS3K:	; Ported from S3K
; S3K's zComputeNoteDuration
	move.b	(a4)+,d1			; Get parameter
	move.b	zTrack.TempoDivider(a5),d0	; Get tempo divider for this track
	subq.b	#1,d0				; Make it into a loop counter
	beq.s	.skip				; Skip if it was 1
	move.b	d1,d2

.loop:
	add.b	d2,d1
	dbf	d0,.loop	; Multiply the parameter by tempo divider

.skip:
	move.b	d1,zTrack.NoteFillTimeout(a5)	; Note fill timeout
	move.b	d1,zTrack.NoteFillMaster(a5)	; Note fill master
	rts
; ===========================================================================
; loc_72BB4:
cfNoteFill:
	move.b	(a4),zTrack.NoteFillTimeout(a5)	; Note fill timeout
	move.b	(a4)+,zTrack.NoteFillMaster(a5)	; Note fill master
	rts
; ===========================================================================
; loc_72BBE: cfAddKey:
cfChangeTransposition:
	move.b	(a4)+,d0		; Get parameter
	add.b	d0,zTrack.Transpose(a5)	; Add to transpose value
	rts
; ===========================================================================
; loc_72BC6:
cfSetTempo:
	move.b	(a4),v_main_tempo(a6)		; Set main tempo
	move.b	(a4)+,v_main_tempo_timeout(a6)	; And reset timeout (!)
	rts
; ===========================================================================
; loc_72BD0:
cfSetTempoMod:
	lea	v_track_ram(a6),a0
	move.b	(a4)+,d0		; Get new tempo divider
	moveq	#zTrack.len,d1
	moveq	#(v_psg3_track-v_dac_track)/zTrack.len,d2	; 1 DAC + 6 FM + 3 PSG tracks
; loc_72BDA:
.trackloop:
	move.b	d0,zTrack.TempoDivider(a0)	; Set track's tempo divider
	adda.w	d1,a0
	dbf	d2,.trackloop

	rts
; ===========================================================================
; loc_72BE6: cfChangeVolume:
cfChangePSGVolume:
	move.b	(a4)+,d0		; Get volume change
	add.b	d0,zTrack.Volume(a5)	; Apply it

locret_72CAA:
	rts
; ===========================================================================
; loc_72BEE:
cfClearPush:
    if PushBehaviour
	bclr	#f_push_playing,misc_flags2(a6)	; Allow push sound to be played once more
	rts
    endif
; ===========================================================================
; loc_72BF4:
cfStopSpecialFM4:
    if EnableSpecSFX
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bclr	#4,zTrack.PlaybackControl(a5)	; Clear 'do not attack next note' bit
	bsr.w	FMNoteOff
	tst.b	v_sfx_fm4_track(a6)		; Is SFX using FM4?
	bmi.s	.locexit			; Branch if yes
	movea.l	a5,a3
	lea	v_fm4_track(a6),a5
	movea.l	v_voice_ptr(a6),a1		; Voice pointer
	bclr	#2,zTrack.PlaybackControl(a5)	; Clear 'SFX is overriding' bit
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	move.b	zTrack.VoiceIndex(a5),d0	; Current voice
	bsr.s	SetVoice
	movea.l	a3,a5
; loc_72C22:
.locexit:
	addq.w	#8,sp				; Tamper with return value so we don't return to caller
	rts
    endif
; ===========================================================================
; loc_72C26:
cfSetVoice:			; Branch if yes
	moveq	#0,d0
	move.b	(a4)+,d0			; Get new voice
	move.b	d0,zTrack.VoiceIndex(a5)	; Store it
	tst.b	zTrack.VoiceControl(a5)		; Is this a PSG track?
	bmi.s	locret_72CAA
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding this track?
	bne.s	locret_72CAA			; Return if yes

cfSetVoiceCont:
	movea.l	v_voice_ptr(a6),a1		; Music voice pointer
	tst.b	f_voice_selector(a6)		; Are we updating a music track?
	beq.s	SetVoice			; If yes, branch
	movea.l	zTrack.VoicePtr(a5),a1		; SFX track voice pointer
    if EnableSpecSFX
	tst.b	f_voice_selector(a6)		; Are we updating a SFX track?
	bmi.s	SetVoice			; If yes, branch
	movea.l	v_special_voice_ptr(a6),a1	; Special SFX voice pointer
    endif
; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72C4E:
SetVoice:
	subq.w	#1,d0
	bmi.s	.havevoiceptr
	moveq	#25,d1
; loc_72C56:
.voicemultiply:
	adda.w	d1,a1
	dbf	d0,.voicemultiply
; loc_72C5C:
.havevoiceptr:
	move.b	(a1)+,d1			; feedback/algorithm
	move.b	d1,zTrack.FeedbackAlgo(a5)	; Save it to track RAM
	move.b	d1,d4
	move.b	#$B0,d0			; Command to write feedback/algorithm
	bsr.w	WriteFMIorII
	lea	FMInstrumentOperatorTable(pc),a2
	moveq	#$13,d3			; Don't want to send TL yet
; loc_72C72:
.sendvoiceloop:
	move.b	(a2)+,d0
	move.b	(a1)+,d1
	bsr.w	WriteFMIorII
	dbf	d3,.sendvoiceloop

	moveq	#3,d5
	andi.w	#7,d4			; Get algorithm
	move.b	FMSlotMask(pc,d4.w),d4	; Get slot mask for algorithm
	move.b	zTrack.Volume(a5),d3	; Track volume attenuation
; loc_72C8C:
.sendtlloop:
	move.b	(a2)+,d0
	move.b	(a1)+,d1
	lsr.b	#1,d4			; Is bit set for this operator in the mask?
	bcc.s	.sendtl			; Branch if not
	add.b	d3,d1			; Include additional attenuation
; loc_72C96:
.sendtl:
	bsr.w	WriteFMIorII
	dbf	d5,.sendtlloop

	move.b	#$B4,d0			; Register for AMS/FMS/Panning
	move.b	zTrack.AMSFMSPan(a5),d1	; Value to send
	bra.w	WriteFMIorII

;locret_72CAA:
;	rts
; End of function SetVoice

; ===========================================================================
; byte_72CAC:
FMSlotMask:
	dc.b 8,	8, 8, 8, $A, $E, $E, $F

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||

; sub_72CB4:
SendVoiceTL:
	btst	#2,zTrack.PlaybackControl(a5)	; Is SFX overriding?
	bne.s	.locret				; Return if so
	moveq	#0,d0
	move.b	zTrack.VoiceIndex(a5),d0	; Current voice
	movea.l	v_voice_ptr(a6),a1		; Voice pointer
	tst.b	f_voice_selector(a6)		; Is this music?
	beq.s	.gotvoiceptr			; If so, branch

    if Fix_DriverBugs
	movea.l	zTrack.VoicePtr(a5),a1
    else
	; DANGER! This uploads the wrong voice! It should have been
	; a5 instead of a6!
	movea.l	zTrack.VoicePtr(a6),a1
    endif

    if EnableSpecSFX
	tst.b	f_voice_selector(a6)		; Is this an SFX?
	bmi.s	.gotvoiceptr			; If so, branch
	movea.l	v_special_voice_ptr(a6),a1	; Otherwise, this must be a Special SFX
    endif
; loc_72CD8:
.gotvoiceptr:
	subq.w	#1,d0
	bmi.s	.gotvoice
	moveq	#25,d1
; loc_72CE0:
.voicemultiply:
	adda.w	d1,a1
	dbf	d0,.voicemultiply
; loc_72CE6:
.gotvoice:
	lea	21(a1),a1			; Want TL
	lea	FMInstrumentTLTable(pc),a2
	move.b	zTrack.FeedbackAlgo(a5),d0	; Get feedback/algorithm
	andi.w	#7,d0				; Want only algorithm
	move.b	FMSlotMask(pc,d0.w),d4		; Get slot mask
	move.b	zTrack.Volume(a5),d3		; Get track volume attenuation
	bmi.s	.locret				; If negative, stop
	moveq	#3,d5
; loc_72D02:
.sendtlloop:
	move.b	(a2)+,d0
	move.b	(a1)+,d1
	lsr.b	#1,d4			; Is bit set for this operator in the mask?
	bcc.s	.senttl			; Branch if not
	add.b	d3,d1			; Include additional attenuation
	blo.s	.senttl			; Branch on overflow
	bsr.w	WriteFMIorII
; loc_72D12:
.senttl:
	dbf	d5,.sendtlloop
; locret_72D16:
.locret:
	rts
; End of function SendVoiceTL

; ===========================================================================
; byte_72D18:
FMInstrumentOperatorTable:
	dc.b  $30	; Detune/multiple operator 1
	dc.b  $38	; Detune/multiple operator 3
	dc.b  $34	; Detune/multiple operator 2
	dc.b  $3C	; Detune/multiple operator 4
	dc.b  $50	; Rate scalling/attack rate operator 1
	dc.b  $58	; Rate scalling/attack rate operator 3
	dc.b  $54	; Rate scalling/attack rate operator 2
	dc.b  $5C	; Rate scalling/attack rate operator 4
	dc.b  $60	; Amplitude modulation/first decay rate operator 1
	dc.b  $68	; Amplitude modulation/first decay rate operator 3
	dc.b  $64	; Amplitude modulation/first decay rate operator 2
	dc.b  $6C	; Amplitude modulation/first decay rate operator 4
	dc.b  $70	; Secondary decay rate operator 1
	dc.b  $78	; Secondary decay rate operator 3
	dc.b  $74	; Secondary decay rate operator 2
	dc.b  $7C	; Secondary decay rate operator 4
	dc.b  $80	; Secondary amplitude/release rate operator 1
	dc.b  $88	; Secondary amplitude/release rate operator 3
	dc.b  $84	; Secondary amplitude/release rate operator 2
	dc.b  $8C	; Secondary amplitude/release rate operator 4
; byte_72D2C:
FMInstrumentTLTable:
	dc.b  $40	; Total level operator 1
	dc.b  $48	; Total level operator 3
	dc.b  $44	; Total level operator 2
	dc.b  $4C	; Total level operator 4
; ===========================================================================
; loc_72D30:
cfModulation:
	bset	#3,zTrack.PlaybackControl(a5)		; Turn on modulation
	move.l	a4,zTrack.ModulationPtr(a5)		; Save pointer to modulation data
	move.b	(a4)+,zTrack.ModulationWait(a5)		; Modulation delay
	move.b	(a4)+,zTrack.ModulationSpeed(a5)	; Modulation speed
	move.b	(a4)+,zTrack.ModulationDelta(a5)	; Modulation delta
	move.b	(a4)+,d0				; Modulation steps...
	lsr.b	#1,d0					; ... divided by 2...
	move.b	d0,zTrack.ModulationSteps(a5)		; ... before being stored
	clr.w	zTrack.ModulationVal(a5)		; Total accumulated modulation frequency change
	rts
; ===========================================================================
; loc_72D52:
cfEnableModulation:
	bset	#3,zTrack.PlaybackControl(a5)	; Turn on modulation
	rts
; ===========================================================================
; loc_72D58:
cfStopTrack:
	bclr	#7,zTrack.PlaybackControl(a5)	; Stop track
	bclr	#4,zTrack.PlaybackControl(a5)	; Clear 'do not attack next note' bit
	tst.b	zTrack.VoiceControl(a5)		; Is this a PSG track?
	bmi.s	.stoppsg			; Branch if yes
	btst	#f_updating_dac,misc_flags(a6)	; Is this the DAC we are updating?
	bne.w	.locexit			; Exit if yes
	pea	.stoppedchannel(pc)
	bra.w	FMNoteOff
; ===========================================================================
; loc_72D74:
.stoppsg:
	bsr.w	PSGNoteOff
; loc_72D78:
.stoppedchannel:
	tst.b	f_voice_selector(a6)		; Are we updating SFX?
	bpl.w	.locexit			; Exit if not
	clr.b	v_sndprio(a6)			; Clear priority
	moveq	#0,d0
	move.b	zTrack.VoiceControl(a5),d0	; Get voice control bits
	bmi.s	.getpsgptr			; Branch if PSG
	lea	SFX_BGMChannelRAM(pc),a0
	movea.l	a5,a3
    if EnableSpecSFX
	cmpi.b	#4,d0				; Is this FM4?
	bne.s	.getpointer			; Branch if not
	tst.b	v_sfx2_fm4_track.PlaybackControl(a6)	; Is special SFX playing?
	bpl.s	.getpointer			; Branch if not
	lea	v_sfx2_fm4_track(a6),a5
	movea.l	v_special_voice_ptr(a6),a1	; Get voice pointer
	bra.s	.gotpointer
    endif
; ===========================================================================
; loc_72DA8:
.getpointer:
	subq.b	#2,d0			; SFX can only use FM3 and up
	add.b	d0,d0
	add.b	d0,d0
	movea.l	(a0,d0.w),a5
	tst.b	zTrack.PlaybackControl(a5)	; Is track playing?
	bpl.s	.novoiceupd			; Branch if not
	movea.l	v_voice_ptr(a6),a1		; Get voice pointer
; loc_72DB8:
.gotpointer:
	bclr	#2,zTrack.PlaybackControl(a5)	; Clear 'SFX overriding' bit
	bset	#1,zTrack.PlaybackControl(a5)	; Set 'track at rest' bit
	move.b	zTrack.VoiceIndex(a5),d0	; Current voice
	bsr.w	SetVoice
; loc_72DC8:
.novoiceupd:
	movea.l	a3,a5
	addq.w	#8,sp		; Tamper with return value so we don't go back to caller
	rts
; ===========================================================================
; loc_72DCC:
.getpsgptr:
    if EnableSpecSFX
	lea	v_sfx2_psg3_track(a6),a0
	tst.b	zTrack.PlaybackControl(a0)	; Is track playing?
	bpl.s	.getchannelptr			; Branch if not
	cmpi.b	#$E0,d0				; Is it the noise channel?
	beq.s	.gotchannelptr			; Branch if yes
	cmpi.b	#$C0,d0				; Is it PSG 3?
	beq.s	.gotchannelptr			; Branch if yes
    endif
; loc_72DE0:
.getchannelptr:
	lea	SFX_BGMChannelRAM(pc),a0
	lsr.b	#3,d0
	movea.l	(a0,d0.w),a0
; loc_72DEA:
.gotchannelptr:
	bclr	#2,zTrack.PlaybackControl(a0)	; Clear 'SFX overriding' bit
	bset	#1,zTrack.PlaybackControl(a0)	; Set 'track at rest' bit
	cmpi.b	#$E0,zTrack.VoiceControl(a0)	; Is this a noise pointer?
	bne.s	.locexit			; Branch if not
	move.b	zTrack.PSGNoise(a0),(PSG_input).l ; Set noise tone
; loc_72E02:
.locexit:
	addq.w	#8,sp			; Tamper with return value so we don't go back to caller
	rts
; ===========================================================================
; loc_72E06:
cfSetPSGNoise:
	move.b	#$E0,zTrack.VoiceControl(a5)	; Turn channel into noise channel
	move.b	(a4)+,d0			; Get tone noise
	move.b	d0,zTrack.PSGNoise(a5)		; Save it
	btst	#2,zTrack.PlaybackControl(a5)	; Is track being overridden?
	bne.s	.locret				; Return if yes
	move.b	d0,(PSG_input).l		; Set tone
; locret_72E1E:
.locret:
	rts
; ===========================================================================
; loc_72E20:
cfDisableModulation:
	bclr	#3,zTrack.PlaybackControl(a5)	; Disable modulation
	rts
; ===========================================================================
; loc_72E26:
cfSetPSGTone:
	tst.b	zTrack.VoiceControl(a5)		; Is this a PSG track?
	bpl.s	+				; Return if not
	move.b	(a4)+,zTrack.VoiceIndex(a5)	; Set current PSG tone
+	rts
; ===========================================================================
; loc_72E2C:
cfJumpTo:
	move.b	(a4)+,d0	; High byte of offset
	lsl.w	#8,d0		; Shift it into place
	move.b	(a4)+,d0	; Low byte of offset
	adda.w	d0,a4		; Add to current position
	subq.w	#1,a4		; Put back one byte
	rts
; ===========================================================================
; loc_72E38:
cfRepeatAtPos:
	moveq	#0,d0
	move.b	(a4)+,d0			; Loop index
	move.b	(a4)+,d1			; Repeat count
	tst.b	zTrack.LoopCounters(a5,d0.w)	; Has this loop already started?
	bne.s	.loopexists			; Branch if yes
	move.b	d1,zTrack.LoopCounters(a5,d0.w)	; Initialize repeat count
; loc_72E48:
.loopexists:
	subq.b	#1,zTrack.LoopCounters(a5,d0.w)	; Decrease loop's repeat count
	bne.s	cfJumpTo			; If nonzero, branch to target
	addq.w	#2,a4				; Skip target address
	rts
; ===========================================================================
; loc_72E52:
cfJumpToGosub:
	moveq	#0,d0
	move.b	zTrack.StackPointer(a5),d0	; Current stack pointer
	subq.b	#4,d0				; Add space for another target
	move.l	a4,(a5,d0.w)			; Put in current address (*before* target for jump!)
	move.b	d0,zTrack.StackPointer(a5)	; Store new stack pointer
	bra.s	cfJumpTo
; ===========================================================================

; Clownacy | Since I reintroduced cfSendFMI, this flag is pointless

; loc_72E64:
;cfOpF9:
;	move.b	#$88,d0		; D1L/RR of Operator 3
;	moveq	#$F,d1		; Loaded with fixed value (max RR, 1TL)
;	bsr.w	WriteFMI
;	move.b	#$8C,d0		; D1L/RR of Operator 4
;	moveq	#$F,d1		; Loaded with fixed value (max RR, 1TL)
;	bra.w	WriteFMI
; ===========================================================================
cfSilenceStopTrack:
	pea	cfStopTrack(pc)
	bra.w	FMSilenceChannel
; ===========================================================================
; Sets a new DAC sample for play.
;
; Has one parameter, the index (1-based) of the DAC sample to play.
;
cfPlayDACSample:
	stopZ80
	st.b	(z80_dac_type).l	; This is a DAC SFX; ignore music DAC volume
	move.b	(a4)+,(z80_dac_sample).l
	startZ80
	rts
; ===========================================================================
; Plays another song or SFX.
;
; Has one parameter byte, the ID of what is to be played.
;
; cfPlaySoundByIndex
cfPlaySound:
	move.b	(a4)+,v_playsnd2(a6)
	rts
; ===========================================================================
; Changes the track's key displacement.
;
; There is a single parameter byte, the new track key offset + 40h (that is,
; 40h is subtracted from the parameter byte before the key displacement is set)
;
cfSetKey:
	move.b	(a4)+,d0
	subi.b	#$40,d0
	move.b	d0,zTrack.Transpose(a5)
	rts
; ===========================================================================
; Sets track volume.
;
; Has one parameter byte, the volume.
;
; For FM tracks, this is a 7-bit value from 0 (lowest volume) to 127 (highest
; volume). The value is XOR'ed with 7Fh before being sent, then stripped of the
; sign bit. The volume change takes effect immediatelly.
;
; For PSG tracks, this is a 4-bit value ranging from 8 (lowest volume) to 78h
; (highest volume). The value is shifted 3 bits to the right, XOR'ed with 0Fh
; and AND'ed with 0Fh before being uploaded, so the sign bit and the lower 3
; bits are discarded.
;
cfSetVolume:
	tst.b	zTrack.VoiceControl(a5)	; Is this a psg track?
	bpl.s	.FMVolume		; If not, branch
	move.b	(a4)+,d0		; Load parameter byte
	lsr.b	#4,d0			; Move bits 4,5,6,7 to the position of 0,1,2,3
	not.b	d0			; Invert bits
	andi.b	#$F,d0
	move.b	d0,zTrack.Volume(a5)	; Write volume
	rts
.FMVolume:
	move.b	(a4)+,d0		; Load parameter byte
	not.b	d0			; Invert bits
	bchg	#7,d0			; Retain sign bit
	move.b	d0,zTrack.Volume(a5)	; Write volume
	bra.w	SendVoiceTL
; ===========================================================================
; If a continuous SFX is playing, it will continue playing from target address.
; A loop conuter is decremented (it is initialized to number of SFX tracks)
; for continuous SFX; if the result is zero, the continuous SFX will be flagged
; to stop.
; Non-continuous SFX do not loop.
;
; Has a 2-byte parameter, the jump target address.
;
cfLoopContinuousSFX:
    if EnableContSFX
	btst	#f_continuous_sfx,misc_flags(a6)	; Is the flag for continuous playback mode set?
	bne.s	.continuousmode				; If so, branch
	clr.b	v_current_contsfx(a6)			; Communicate that there is no continuous SFX playing
	addq.w	#2,a4					; Clownacy | Advance reading counter to skip the address
	rts

.continuousmode:
	subq.b	#1,v_contsfx_channels(a6)		; Mark one channel as processed
	bne.w	cfJumpTo				; If that wan't the last channel, branch
	bclr	#f_continuous_sfx,misc_flags(a6)	; If it was, clear flag for continuous playback mode...
	bra.w	cfJumpTo				; ...and then branch
    endif
; ===========================================================================
; Sends an FM command to the YM2612. The command is sent to part I, so not all
; registers can be set using this coord. flag (in particular, channels FM4,
; FM5 and FM6 cannot (in general) be affected).
;
; Has 2 parameter bytes: a 1-byte register selector and a 1-byte register data.
;
cfSendFMI:
	move.b	(a4)+,d0				; Get YM2612 regigter selector
	move.b	(a4)+,d1				; Get YM2612 register data
	bra.w	WriteFMI				; Send it to YM2612
; ===========================================================================
; Sends an FM command to the YM2612. The command is sent to the adequate part
; for the current track, so it is only appropriate for those registers that
; affect specific channels.
;
; Has 2 parameter bytes: a 1-byte register selector and a 1-byte register data.
;
cfChanFMCommand:
	move.b	(a4)+,d0				; Get YM2612 regigter selector
	move.b	(a4)+,d1				; Get YM2612 register data
	bra.w	WriteFMIorII				; Send it to YM2612
; ===========================================================================
; ---------------------------------------------------------------------------
; PSG pointers
; ---------------------------------------------------------------------------
PSG_Index:
	dc.l PSG01, PSG02, PSG03
	dc.l PSG04, PSG05, PSG06
	dc.l PSG07, PSG08, PSG09
	dc.l PSG0A, PSG0B, PSG0C
	dc.l PSG0D, PSG0E, PSG0F
	dc.l PSG10, PSG11, PSG12
	dc.l PSG13, PSG14, PSG15
	dc.l PSG16, PSG17, PSG18
	dc.l PSG19, PSG1A, PSG1B
	dc.l PSG1C, PSG1D, PSG1E
	dc.l PSG1F, PSG20, PSG21
	dc.l PSG22, PSG23, PSG24
	dc.l PSG25, PSG26, PSG27
	dc.l PSG28, PSG29, PSG2A
	dc.l PSG2B

; ---------------------------------------------------------------------------
; Sound effects 'include's and pointers
; ---------------------------------------------------------------------------
	include "sound/SMPS M68K/Sonic 2 Clone Driver v2 - Sounds.asm"

; ---------------------------------------------------------------------------
; Priorities and speedup tempos
; ---------------------------------------------------------------------------
	include "sound/SMPS M68K/Sonic 2 Clone Driver v2 - Other.asm"

; ---------------------------------------------------------------------------
; Music 'include's and pointers
; ---------------------------------------------------------------------------
	include "sound/SMPS M68K/Sonic 2 Clone Driver v2 - Music.asm"

; ---------------------------------------------------------------------------
; PSG instruments used in music (now with S2+S3 PSGs)
; ---------------------------------------------------------------------------
PSG01:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1 (S1, S2).bin"
PSG02:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 2 (S1, S2).bin"
PSG03:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 3 (S1, S2).bin"
PSG04:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 4 (S1, S2).bin"
PSG05:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 5 (S1, S2).bin"
PSG06:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 6 (S1, S2).bin"
PSG07:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 7 (S1, S2).bin"
PSG08:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 8 (S1, S2).bin"
PSG09:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 9 (S1, S2).bin"
PSG0A:		BINCLUDE	"sound/SMPS M68K/PSG/PSG A (S2).bin"
PSG0B:		BINCLUDE	"sound/SMPS M68K/PSG/PSG B (S2).bin"
PSG0C:		BINCLUDE	"sound/SMPS M68K/PSG/PSG C (S2).bin"
PSG0D:		BINCLUDE	"sound/SMPS M68K/PSG/PSG D (S2).bin"
PSG0E:		BINCLUDE	"sound/SMPS M68K/PSG/PSG E (S3).bin"
PSG0F:		BINCLUDE	"sound/SMPS M68K/PSG/PSG F (S3).bin"
PSG10:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 10 (S3).bin"
PSG11:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 11 (S3).bin"
PSG12:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 12 (S3).bin"
PSG13:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 13 (S3).bin"
PSG14:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 14 (S3).bin"
PSG15:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 15 (S3).bin"
PSG16:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 16 (S3).bin"
PSG17:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 17 (S3).bin"
PSG18:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 18 (S3).bin"
PSG19:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 19 (S3).bin"
PSG1A:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1A (S3).bin"
PSG1B:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1B (S3).bin"
PSG1C:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1C (S3).bin"
PSG1D:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1D (S3).bin"
PSG1E:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1E (S3).bin"
PSG1F:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 1F (S3).bin"
PSG20:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 20 (S3).bin"
PSG21:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 21 (S3).bin"
PSG22:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 22 (S3).bin"
PSG23:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 23 (S3).bin"
PSG24:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 24 (S3).bin"
PSG25:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 25 (S3).bin"
PSG26:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 26 (S3).bin"
PSG27:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 27 (S3).bin"
PSG28:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 28 (S3).bin"
PSG29:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 29 (S3).bin"
PSG2A:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 2A (S3).bin"
PSG2B:		BINCLUDE	"sound/SMPS M68K/PSG/PSG 2B (S3).bin"
		even

; ---------------------------------------------------------------------------
; Universal Voice Bank, from S&K
; ---------------------------------------------------------------------------
    if SMPS_EnableUniversalVoiceBank
	include	"sound/SMPS M68K/Sonic 2 Clone Driver v2 - FM Universal Voice Bank.asm"
    endif

; ---------------------------------------------------------------------------
; Vladikcomper's Mega PCM DAC driver
; ---------------------------------------------------------------------------
	include	"sound/SMPS M68K/MegaPCM - 68k.asm"

;	dc.b	$43,$6C,$6F,$77,$6E,$61,$63,$79
	even