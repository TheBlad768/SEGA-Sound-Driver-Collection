; DAC IDs
offset :=	DAC_Table
ptrsize :=	8
idstart :=	$81

	if S1DACSamples|S2DACSamples
; Sonic 1 & 2
dKick =				id(ptr_dac81)
dSnare =			id(ptr_dac82)
dTimpani =			id(ptr_dac85)
dHiTimpani =			id(ptr_dac88)
dMidTimpani =			id(ptr_dac89)
dLowTimpani =			id(ptr_dac8A)
dVLowTimpani =			id(ptr_dac8B)
	endif

	if S2DACSamples
; Sonic 2
dClap =				id(ptr_dac83)
dScratch =			id(ptr_dac84)
dHiTom =			id(ptr_dac86)
dVLowBongo =			id(ptr_dac87)
dMidTom =			id(ptr_dac8C)
dLowTom =			id(ptr_dac8D)
dFloorTom =			id(ptr_dac8E)
dHighBongo =			id(ptr_dac8F)
dMidBongo =			id(ptr_dac90)
dLowBongo =			id(ptr_dac91)

dHiClap = dHighBongo
dMidClap = dMidBongo
dLowClap = dLowBongo
	endif

	if S3DACSamples|SKDACSamples|S3DDACSamples
; Sonic 3 & K & 3D
dSnareS3 =			id(ptr_dac92)
dHighTom =			id(ptr_dac93)
dMidTomS3 =			id(ptr_dac94)
dLowTomS3 =			id(ptr_dac95)
dFloorTomS3 =			id(ptr_dac96)
dKickS3 =			id(ptr_dac97)
dMuffledSnare =			id(ptr_dac98)
dCrashCymbal =			id(ptr_dac99)
dRideCymbal =			id(ptr_dac9A)
dLowMetalHit =			id(ptr_dac9B)
dMetalHit =			id(ptr_dac9C)
dHighMetalHit =			id(ptr_dac9D)
dHigherMetalHit =		id(ptr_dac9E)
dMidMetalHit =			id(ptr_dac9F)
dClapS3 =			id(ptr_dacA0)
dElectricHighTom =		id(ptr_dacA1)
dElectricMidTom =		id(ptr_dacA2)
dElectricLowTom =		id(ptr_dacA3)
dElectricFloorTom =		id(ptr_dacA4)
dTightSnare =			id(ptr_dacA5)
dMidpitchSnare =		id(ptr_dacA6)
dLooseSnare =			id(ptr_dacA7)
dLooserSnare =			id(ptr_dacA8)
dHiTimpaniS3 =			id(ptr_dacA9)
dLowTimpaniS3 =			id(ptr_dacAA)
dMidTimpaniS3 =			id(ptr_dacAB)
dQuickLooseSnare =		id(ptr_dacAC)
dClick =			id(ptr_dacAD)
dPowerKick =			id(ptr_dacAE)
dQuickGlassCrash =		id(ptr_dacAF)
	endif

	if S3DACSamples|SKDACSamples
; Sonic 3 & K
dGlassCrashSnare =		id(ptr_dacB0)
dGlassCrash =			id(ptr_dacB1)
dGlassCrashKick =		id(ptr_dacB2)
dQuietGlassCrash =		id(ptr_dacB3)
dOddSnareKick =			id(ptr_dacB4)
dKickExtraBass =		id(ptr_dacB5)
dComeOn =			id(ptr_dacB6)
dDanceSnare =			id(ptr_dacB7)
dLooseKick =			id(ptr_dacB8)
dModLooseKick =			id(ptr_dacB9)
dWoo =				id(ptr_dacBA)
dGo =				id(ptr_dacBB)
dSnareGo =			id(ptr_dacBC)
dPowerTom =			id(ptr_dacBD)
dHiWoodBlock =			id(ptr_dacBE)
dLowWoodBlock =			id(ptr_dacBF)
dHiHitDrum =			id(ptr_dacC0)
dLowHitDrum =			id(ptr_dacC1)
dMetalCrashHit =		id(ptr_dacC2)
dEchoedClapHit =		id(ptr_dacC3)
dLowerEchoedClapHit =		id(ptr_dacC4)
dHipHopHitKick =		id(ptr_dacC5)
dHipHopHitPowerKick =		id(ptr_dacC6)
dBassHey =			id(ptr_dacC7)
dDanceStyleKick =		id(ptr_dacC8)
dHipHopHitKick2 =		id(ptr_dacC9)
dReverseFadingWind =		id(ptr_dacCA)
dScratchS3 =			id(ptr_dacCB)
dLooseSnareNoise =		id(ptr_dacCC)
dPowerKick2 =			id(ptr_dacCD)
dCrashingNoiseWoo =		id(ptr_dacCE)
dQuickHit =			id(ptr_dacCF)
dKickHey =			id(ptr_dacD0)
dPowerKickHit =			id(ptr_dacD1)
dLowPowerKickHit =		id(ptr_dacD2)
dLowerPowerKickHit =		id(ptr_dacD3)
dLowestPowerKickHit =		id(ptr_dacD4)

dHipHopHitKick3 = dHipHopHitKick2
	endif

	if S3DDACSamples
; Sonic 3D
dFinalFightMetalCrash =		id(ptr_dacD5)
dIntroKick =			id(ptr_dacD6)
	endif

	if S3DACSamples
; Sonic 3
dEchoedClapHit_S3 =		id(ptr_dacD7)
dLowerEchoedClapHit_S3 =	id(ptr_dacD8)
	endif

	if SCDACSamples
; Sonic Crackers
dBeat =				id(ptr_dacD9)
dSnareSC =			id(ptr_dacDA)
dHiTimTom =			id(ptr_dacDB)
dMidTimTom =			id(ptr_dacDC)
dLowTimTom =			id(ptr_dacDD)
dLetsGo =			id(ptr_dacDE)
dHey =				id(ptr_dacDF)
	endif

; ---------------------------------------------------------------------------
; Sound driver equates
; ---------------------------------------------------------------------------
zTrack STRUCT DOTS
	PlaybackControl:	ds.b 1		; All tracks
	VoiceControl:		ds.b 1		; All tracks
	VolFlutter:				; PSG only	; Clownacy | Now shared with panning RAM
	AMSFMSPan:		ds.b 1		; FM/DAC only
	TempoDivider:		ds.b 1		; All tracks
	Transpose:		ds.b 1		; FM/PSG only	; these two need to be together!
	Volume:			ds.b 1		; All tracks	; these two need to be together!
	DataPointer:		ds.l 1		; All tracks
	VoiceIndex:		ds.b 1		; FM/PSG only
	StackPointer:		ds.b 1		; All tracks
	DurationTimeout:	ds.b 1		; All tracks
	SavedDuration:		ds.b 1		; All tracks
	SavedDAC:				; DAC only
	Freq:			ds.w 1		; FM/PSG only
	NoteFillTimeout:	ds.b 1		; FM/PSG only
	NoteFillMaster:		ds.b 1		; FM/PSG only
	ModulationPtr:		ds.l 1		; FM/PSG only
	ModulationWait:		ds.b 1		; FM/PSG only
	ModulationSpeed:	ds.b 1		; FM/PSG only
	ModulationDelta:	ds.b 1		; FM/PSG only
	ModulationSteps:	ds.b 1		; FM/PSG only
	ModulationVal:		ds.w 1		; FM/PSG only
	Detune:			ds.b 1		; FM/PSG only
	PSGNoise:				; PSG only
	FeedbackAlgo:		ds.b 1		; FM only
	PlaybackControlBackup:			; Clownacy | New, music tracks only (1UP backup)
	VoicePtr:		ds.l 1		; FM SFX only
	LoopCounters:		ds.b 2		; All tracks
				ds.l 2
	GoSubStack:				; All tracks
zTrack ENDSTRUCT

; ---------------------------------------------------------------------------
; RAM variables
; ---------------------------------------------------------------------------
ireallydontknow:

	phase 0
v_sounddriverramstart:

v_startofvariables:
v_sndprio:			ds.b 1	; sound priority (priority of new music/SFX must be higher or equal to this value or it won't play; bit 7 of priority being set prevents this value from changing)
v_main_tempo_timeout:		ds.b 1	; Has v_main_tempo added to it; when it carries, delays song by 1 frame
v_main_tempo:			ds.b 1	; Used for music only
f_stopmusic:			ds.b 1	; flag set to stop music when paused

v_fadeout_counter:		ds.b 1
v_fadeout_delay:		ds.b 1

v_fadein_counter:		ds.b 1	; Timer for fade in/out
v_fadein_delay:			ds.b 1

v_tempo_mod:			ds.b 1	; music - tempo modifier
v_speeduptempo:			ds.b 1	; music - tempo modifier with speed shoes
f_speedup:			ds.b 1	; flag indicating whether speed shoes tempo is on ($80) or off ($00)

v_playsnd0:			ds.b 1	; sound or music copied from below
v_playsnd1:			ds.b 1	; music to play	; Clownacy | Note to all, must be on even address!
v_playsnd2:			ds.b 1	; sound to play
v_playsnd3:			ds.b 1	; secondary sound to play
v_playsnd4:			ds.b 1	; secondary music to play

v_voice_ptr:			ds.l 1	; voice data pointer (4 bytes)

	if EnableSpecSFX
v_special_voice_ptr:		ds.l 1	; voice data pointer for special SFX ($D0-$DF) (4 bytes)
	endif

f_voice_selector:		ds.b 1	; $00 = use music voice pointer; $80 = use track voice pointer

f_1up_playing:			ds.b 1	; flag indicating 1-up song is playing

v_spindash_timer:		ds.b 1
v_spindash_pitch:		ds.b 1

v_pal_audio_countdown:		ds.b 1
v_communication_byte:		ds.b 1

	if EnableContSFX
v_current_contsfx:		ds.b 1
v_contsfx_channels:		ds.b 1
	endif

misc_flags:			ds.b 1
	v_gloop_toggle:			= 0	; if set, prevents further gloop sounds from playing
	f_spindash_lastsound:		= 1
	v_ring_speaker:			= 2	; which speaker the "ring" sound is played in (0 = right; 1 = left)
	f_updating_dac:			= 3	; 1 if updating DAC, 0 otherwise
	f_fadein_flag:			= 4	; flag for fade in
	f_force_pal_tempo:		= 5	; flag for if the current song must play at PAL speed on PAL consoles
	f_doubleupdate:			= 6
	f_continuous_sfx:		= 7

misc_flags2:			ds.b 1
	f_push_playing:			= 0

v_endofvariables:

	if (*)&1	; pretty much an 'even'
				ds.b 1
	endif

v_track_ram:
v_dac_track:		zTrack
v_fm1_track:		zTrack
v_fm2_track:		zTrack
v_fm3_track:		zTrack
v_fm4_track:		zTrack
v_fm5_track:		zTrack
v_fm6_track:		zTrack
v_psg1_track:		zTrack
v_psg2_track:		zTrack
v_psg3_track:		zTrack
v_track_ram_end:

v_sfx_track_ram:
v_sfx_fm3_track:	zTrack
v_sfx_fm4_track:	zTrack
v_sfx_fm5_track:	zTrack
v_sfx_psg1_track:	zTrack
v_sfx_psg2_track:	zTrack
v_sfx_psg3_track:	zTrack
v_sfx_track_ram_end:

v_sfx2_track_ram:
v_sfx2_fm4_track:	zTrack
v_sfx2_psg3_track:	zTrack
v_sfx2_track_ram_end:

	phase v_sfx_track_ram
v_1up_ram_copy:
v_1up_dac_track:	zTrack
v_1up_fm1_track:	zTrack
v_1up_fm2_track:	zTrack
v_1up_fm3_track:	zTrack
v_1up_fm4_track:	zTrack
v_1up_fm5_track:	zTrack
v_1up_fm6_track:	zTrack
v_1up_psg1_track:	zTrack
v_1up_psg2_track:	zTrack
v_1up_psg3_track:	zTrack

v_1up_variables:	ds.b v_endofvariables-v_startofvariables

v_sounddriverramend:
	dephase

;    if MOMPASS=1
;	message "Clone Driver v2 RAM size is $\{v_sounddriverramend-v_sounddriverramstart} bytes!"
;    endif
	!org ireallydontknow
