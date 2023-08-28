
; =============== S U B R O U T I N E =======================================

Music_Tbl1:
		dc.l Music_Pointer1
		dc.l Music_Pointer1_Index		; 0
		dc.l Music_Pointer2
		dc.l Music_Pointer2_Index		; 8
		dc.l Music_Pointer3
		dc.l Music_Pointer3_Index		; 16
		dc.l Music_Pointer4
		dc.l Music_Pointer4_Index		; 24
		dc.l Music_Pointer5
		dc.l Music_Pointer5_Index		; 32
		dc.l Music_Pointer6
		dc.l Music_Pointer6_Index		; 40
		dc.l Music_Pointer7
		dc.l Music_Pointer7_Index		; 48
		dc.l Music_Pointer8
		dc.l Music_Pointer8_Index		; 56
		dc.l Music_Pointer9
		dc.l Music_Pointer9_Index		; 64
		dc.l Music_Pointer10
		dc.l Music_Pointer10_Index	; 72
		dc.l Music_Pointer11
		dc.l Music_Pointer11_Index		; 80
		dc.l Music_Pointer12
		dc.l Music_Pointer12_Index	; 88
		dc.l Music_Pointer13
		dc.l Music_Pointer13_Index	; 96
		dc.l Music_Pointer14
		dc.l Music_Pointer14_Index	; 104
		dc.l Music_Pointer15
		dc.l Music_Pointer15_Index	; 112
		dc.l Music_Pointer16
		dc.l Music_Pointer16_Index	; 120
		dc.l Music_Pointer17
		dc.l Music_Pointer17_Index	; 128
		dc.l Music_Pointer18
		dc.l Music_Pointer18_Index	; 136

; =============== S U B R O U T I N E =======================================

		align $8000
Bank1:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank1.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank2:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank2.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank3:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank3.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank4:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank4.asm"
; ---------------------------------------------------------------------------
Bank5:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank5.asm"
; ---------------------------------------------------------------------------
Bank6:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank6.asm"
; ---------------------------------------------------------------------------
Bank7:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank7.asm"
; ---------------------------------------------------------------------------
Bank8:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank8.asm"
; ---------------------------------------------------------------------------
Bank9:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank9.asm"
; ---------------------------------------------------------------------------
Bank10:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank10.asm"
; ---------------------------------------------------------------------------
Bank11:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank11.asm"
; ---------------------------------------------------------------------------
		align $100
Bank12:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank12.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank13:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank13.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank14:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank14.asm"
	even
; ---------------------------------------------------------------------------
		align $8000
Bank15:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank15.asm"
; ---------------------------------------------------------------------------
Bank16:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank16.asm"
; ---------------------------------------------------------------------------
		align $100
Bank17:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank17.asm"
; ---------------------------------------------------------------------------
		align $8000
Bank18:
    if MOMPASS=1
		message " Advanced Z80 Player Music Data ROM offset is $\{*}"
    endif
		include "Sound/Advanced Z80 Player/Music/Banks/Bank18.asm"
	even