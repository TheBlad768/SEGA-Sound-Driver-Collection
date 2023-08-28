; Do not replace this file when updating unless instructed to

; ---------------------------------------------------------------------------
; Priority of sound. New music or SFX must have a priority higher than or equal
; to what is stored in v_sndprio or it won't play. If bit 7 of new priority is
; set ($80 and up), the new music or SFX will not set its priority -- meaning
; any music or SFX can override it (as long as it can override whatever was
; playing before). Usually, SFX will only override SFX, special SFX ($D0-$DF)
; will only override special SFX and music will only override music.
; Of course, this isn't the case anymore, as priorities no longer apply to
; special SFX or music.
; ---------------------------------------------------------------------------
; SoundTypes:
SoundPriorities:
	dc.b $80,$70,$70,$70,$70,$70,$70,$70,$70,$70,$68,$70,$70,$70,$60,$70	; $A0
	dc.b $70,$60,$70,$60,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$7F	; $B0
	dc.b $60,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70,$70	; $C0
	even
; ---------------------------------------------------------------------------
; New tempos for songs during speed shoes
; ---------------------------------------------------------------------------
; DANGER! several songs will use the first few bytes of MusicIndex as their main
; tempos while speed shoes are active. If you don't want that, you should add
; their "correct" sped-up main tempos to the list.
; byte_71A94:
SpeedUpIndex:
	dc.b	s1TempotoS3($82)	; 81 - GHZ
	dc.b	s1TempotoS3($72)	; 82 - LZ
	dc.b	s1TempotoS3($73)		; 83 - MZ
	dc.b	s1TempotoS3($26)	; 84 - SLZ
	dc.b	s1TempotoS3($15)		; 85 - SYZ
	dc.b	s1TempotoS3($08)	; 86 - SBZ
	dc.b	s1TempotoS3($FF)	; 87 - Invincible
	dc.b	s1TempotoS3($05)	; 88 - Extra Life
							; 89 - Special Stage
							; 8A - Title Screen
							; 8B - Ending
							; 8C - Boss
							; 8D - Final Zone
							; 8E - End of Act
							; 8F - Game Over
							; 90 - Continue
							; 91 - Credits
							; 92 - Drowning
							; 93 - Emerald
	even
