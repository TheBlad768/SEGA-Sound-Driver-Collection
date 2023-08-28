; ===========================================================================
; SMPS Mucom Macros
; ===========================================================================

; Header Macros
; Header - Set up Voice Location
smpsHeaderVoice macro loc
songStart set *
	dc.w loc-songStart
	endm

; Header - Set up Channel Usage	
smpsHeaderChan macro fm,psg
	dc.b	fm,psg
	endm

; Header - Set up FM Channel	
smpsHeaderFM macro loc,vol
	dc.w loc-songStart
	dc.b	vol
	endm

; 00 - End of channel
smpsStop macro
	dc.b	$00
	endm

; F0xx - Set Voice of FM channel to xx
smpsSetvoice macro voice
	dc.b	$F0,voice
	endm

; F1xx - Alter Volume by xx
smpsAlterVol macro val
	dc.b	$F1,val
	endm

; F0wwxxyyzz - Modulation - ww: wait time - xx: modulation speed - yy: change per step - zz: number of steps
smpsModSet macro option,wait,speed,change,step,unk
	dc.b	$F4,option,wait,speed,change,step,unk
	endm

; FD - Prevent attack of next note
smpsNoAttack	EQU $FD

; FFxxxx - Jump to xxxx
smpsJump macro loc
	dc.b	$FF
	dc.w loc-*-1
	endm