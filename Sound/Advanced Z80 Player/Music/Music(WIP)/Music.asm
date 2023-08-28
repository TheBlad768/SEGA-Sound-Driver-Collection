
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

; =============== S U B R O U T I N E =======================================

Bank1:
		align $E8000
		include "z80 driver/Music/Music/Adventures of Batman and Robin/Bank 1/Pointer.asm"
Bank2:
		align $F0000
		include "z80 driver/Music/Music/Adventures of Batman and Robin/Bank 2/Pointer.asm"
Bank3:
		align $F8000
		include "z80 driver/Music/Music/Adventures of Batman and Robin/Bank 3/Pointer.asm"
Bank4:
		align $108000
		include "z80 driver/Music/Music/Sub-Terrania/Bank4.asm"
Bank5:
		align $109A02
		include "z80 driver/Music/Music/Sub-Terrania/Bank5.asm"
Bank6:
		align $10B51C
		include "z80 driver/Music/Music/Sub-Terrania/Bank6.asm"
Bank7:
		align $10CCAE
		include "z80 driver/Music/Music/Sub-Terrania/Bank7.asm"
Bank8:
		align $110000
		include "z80 driver/Music/Music/Sub-Terrania/Bank8.asm"
Bank9:
		align $116EE0
		include "z80 driver/Music/Music/Sub-Terrania/Bank9.asm"
Bank10:
		align $118000
		include "z80 driver/Music/Music/Sub-Terrania/Bank10.asm"
Bank11:
		align $118CC6
		include "z80 driver/Music/Music/Sub-Terrania/Bank11.asm"
Bank12:
		align $120000
		include "z80 driver/Music/Music/Red Zone/Bank12.asm"
Bank13:
		align $128000
		include "z80 driver/Music/Music/Red Zone/Bank13.asm"
Bank14:
		align $138000
		include "z80 driver/Music/Music/AWS Pro Moves Soccer/Bank 1/Pointer.asm"
Bank15:
		align $138F28
		include "z80 driver/Music/Music/AWS Pro Moves Soccer/Bank 2/Pointer.asm"
Bank16:
		align $148000
		include "z80 driver/Music/Music/X-Men/Bank16.asm"
Bank17:
		align $150000
		include "z80 driver/Music/Music/X-Men/Bank17.asm"
Bank18:
		align $158000

; =============== S U B R O U T I N E =======================================

; SFX
		include "z80 driver/SFX/SFX.asm"
	even