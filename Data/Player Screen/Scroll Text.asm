
; =============== S U B R O U T I N E =======================================

Load_DrvNameText:
		move.w	(Driver_Line_Count).w,d0
		cmp.w	(Driver_CurrentLine_Count).w,d0
		beq.s	Load_DrvNameText_Return
		move.w	d0,(Driver_CurrentLine_Count).w
		add.w	d0,d0
		lea	DrvName_Text(pc,d0.w),a0
		locVRAM	$E500,d3
		move.l	#$800000,d2
		moveq	#13-1,d7

-		move.w	(a0),d0
		lea	(a0,d0.w),a1
		bsr.w	Calculate_TextPosition
		move.l	d3,VDP_control_port-VDP_control_port(a5)
		sub.l	d1,d3

; Load Text
		move.w	#$100,d0	; VRAM

-		move.b	(a1)+,d0
		cmpi.w	#7-1,d7
		bne.s	+
		ori.w	#$2000,d0
+		move.w	d0,VDP_data_port-VDP_data_port(a6)
		dbf	d6,-
		add.l	d2,d3
		addq.w	#2,a0
		dbf	d7,--

Load_DrvNameText_Return:
		rts
; ---------------------------------------------------------------------------

DrvName_Text:
		offsetEntry.w DrvName_Text76
		offsetEntry.w DrvName_Text77
		offsetEntry.w DrvName_Text78
		offsetEntry.w DrvName_Text79
		offsetEntry.w DrvName_Text80
		offsetEntry.w DrvName_Text81

		offsetEntry.w DrvName_Text1
		offsetEntry.w DrvName_Text2
		offsetEntry.w DrvName_Text3
		offsetEntry.w DrvName_Text4
		offsetEntry.w DrvName_Text5
		offsetEntry.w DrvName_Text6
		offsetEntry.w DrvName_Text7
		offsetEntry.w DrvName_Text8
		offsetEntry.w DrvName_Text9
		offsetEntry.w DrvName_Text10
		offsetEntry.w DrvName_Text11
		offsetEntry.w DrvName_Text12
		offsetEntry.w DrvName_Text13
		offsetEntry.w DrvName_Text14
		offsetEntry.w DrvName_Text15
		offsetEntry.w DrvName_Text16
		offsetEntry.w DrvName_Text17
		offsetEntry.w DrvName_Text18
		offsetEntry.w DrvName_Text19
		offsetEntry.w DrvName_Text20
		offsetEntry.w DrvName_Text21
		offsetEntry.w DrvName_Text22
		offsetEntry.w DrvName_Text23
		offsetEntry.w DrvName_Text24
		offsetEntry.w DrvName_Text25
		offsetEntry.w DrvName_Text26
		offsetEntry.w DrvName_Text27
		offsetEntry.w DrvName_Text28
		offsetEntry.w DrvName_Text29
		offsetEntry.w DrvName_Text30
		offsetEntry.w DrvName_Text31
		offsetEntry.w DrvName_Text32
		offsetEntry.w DrvName_Text33
		offsetEntry.w DrvName_Text34
		offsetEntry.w DrvName_Text35
		offsetEntry.w DrvName_Text36
		offsetEntry.w DrvName_Text37
		offsetEntry.w DrvName_Text38
		offsetEntry.w DrvName_Text39
		offsetEntry.w DrvName_Text40
		offsetEntry.w DrvName_Text41
		offsetEntry.w DrvName_Text42
		offsetEntry.w DrvName_Text43
		offsetEntry.w DrvName_Text44
		offsetEntry.w DrvName_Text45
		offsetEntry.w DrvName_Text46
		offsetEntry.w DrvName_Text47
		offsetEntry.w DrvName_Text48
		offsetEntry.w DrvName_Text49
		offsetEntry.w DrvName_Text50
		offsetEntry.w DrvName_Text51
		offsetEntry.w DrvName_Text52
		offsetEntry.w DrvName_Text53
		offsetEntry.w DrvName_Text54
		offsetEntry.w DrvName_Text55
		offsetEntry.w DrvName_Text56
		offsetEntry.w DrvName_Text57
		offsetEntry.w DrvName_Text58
		offsetEntry.w DrvName_Text59
		offsetEntry.w DrvName_Text60
		offsetEntry.w DrvName_Text61
		offsetEntry.w DrvName_Text62
		offsetEntry.w DrvName_Text63
		offsetEntry.w DrvName_Text64
		offsetEntry.w DrvName_Text65
		offsetEntry.w DrvName_Text66
		offsetEntry.w DrvName_Text67
		offsetEntry.w DrvName_Text68
		offsetEntry.w DrvName_Text69
		offsetEntry.w DrvName_Text70
		offsetEntry.w DrvName_Text71
		offsetEntry.w DrvName_Text72
		offsetEntry.w DrvName_Text73
		offsetEntry.w DrvName_Text74
		offsetEntry.w DrvName_Text75
		offsetEntry.w DrvName_Text76
		offsetEntry.w DrvName_Text77
		offsetEntry.w DrvName_Text78
		offsetEntry.w DrvName_Text79
		offsetEntry.w DrvName_Text80
		offsetEntry.w DrvName_Text81

		offsetEntry.w DrvName_Text1
		offsetEntry.w DrvName_Text2
		offsetEntry.w DrvName_Text3
		offsetEntry.w DrvName_Text4
		offsetEntry.w DrvName_Text5
		offsetEntry.w DrvName_Text6
; ---------------------------------------------------------------------------

DrvName_Text1:		levselstr	"Adventures of Batman and Robin"
DrvName_Text2:		levselstr	"Aero the Acro-Bat 1"
DrvName_Text3:		levselstr	"Aero the Acro-Bat 2"
DrvName_Text4:		levselstr	"Aladdin"
DrvName_Text5:		levselstr	"Alien 3"
DrvName_Text6:		levselstr	"AWS Pro Moves Soccer"
DrvName_Text7:		levselstr	"Batman Returns"
DrvName_Text8:		levselstr	"Battletoads - Double Dragon"
DrvName_Text9:		levselstr	"Battle Mania Daiginjou"
DrvName_Text10:		levselstr	"Beyond Oasis (The Story of Thor)"
DrvName_Text11:		levselstr	"Body Count"
DrvName_Text12:		levselstr	"Boogerman"
DrvName_Text13:		levselstr	"Castlevania - Bloodlines"
DrvName_Text14:		levselstr	"Chinese Fighter"
DrvName_Text15:		levselstr	"Comix Zone"
DrvName_Text16:		levselstr	"Comix Zone (Beta)"
DrvName_Text17:		levselstr	"Daze Before Christmas"
DrvName_Text18:		levselstr	"Devilish (Bad Omen)"
DrvName_Text19:		levselstr	"Doom Troopers - TMC"
DrvName_Text20:	levselstr	"Double Dragon II - The Revenge"
DrvName_Text21:		levselstr	"Dragon Slayer - Eiyuu Densetsu 1"
DrvName_Text22:	levselstr	"Dragon Slayer - Eiyuu Densetsu 2"
DrvName_Text23:		levselstr	"Dragon*s Fury"
DrvName_Text24:	levselstr	"Earnest Evans"
DrvName_Text25:		levselstr	"Elemental Master"
DrvName_Text26:	levselstr	"Eliminate Down"
DrvName_Text27:		levselstr	"Garfield - Caught in the Act"
DrvName_Text28:	levselstr	"High Seas Havoc"
DrvName_Text29:	levselstr	"Home Alone 2"
DrvName_Text30:	levselstr	"James Bond 007 - The Duel"
DrvName_Text31:		levselstr	"Langrisser II"
DrvName_Text32:		levselstr	"Magic Girl"
DrvName_Text33:		levselstr	"Master of Monsters"
DrvName_Text34:		levselstr	"Mega Bomberman"
DrvName_Text35:		levselstr	"Mega Turrican"
DrvName_Text36:		levselstr	"Mickey Mania"
DrvName_Text37:		levselstr	"Mickey Mouse - GCM"
DrvName_Text38:		levselstr	"Midnight Resistance"
DrvName_Text39:		levselstr	"Monster World IV"
DrvName_Text40:	levselstr	"Mortal Kombat II"
DrvName_Text41:		levselstr	"Mortal Kombat V (Sub-Zero)"
DrvName_Text42:	levselstr	"Mr. Nutz"
DrvName_Text43:		levselstr	"M.U.S.H.A. (Musha Aleste)"
DrvName_Text44:	levselstr	"Panorama Cotton"
DrvName_Text45:		levselstr	"The Pirates of Dark Water"
DrvName_Text46:	levselstr	"Prince of Persia"
DrvName_Text47:		levselstr	"Red-Zone"
DrvName_Text48:	levselstr	"Rock n* Roll Racing"
DrvName_Text49:	levselstr	"Rocket Knight Adventures"
DrvName_Text50:	levselstr	"Shaq-Fu"
DrvName_Text51:		levselstr	"Shi-Kin-Jou"
DrvName_Text52:		levselstr	"Shui Hu - Feng Yun Zhuan"
DrvName_Text53:		levselstr	"Socket (Time Dominator)"
DrvName_Text54:		levselstr	"Sol-Deace"
DrvName_Text55:		levselstr	"Sonic the Hedgehog 1"
DrvName_Text56:		levselstr	"Sonic the Hedgehog 2"
DrvName_Text57:		levselstr	"Sonic the Hedgehog (SMS)"
DrvName_Text58:		levselstr	"Sonic Spinball"
DrvName_Text59:		levselstr	"Spider-Man & Venom - MC"
DrvName_Text60:	levselstr	"Splatterhouse 2"
DrvName_Text61:		levselstr	"Splatterhouse 3"
DrvName_Text62:	levselstr	"Streets of Rage 1"
DrvName_Text63:		levselstr	"Streets of Rage 2"
DrvName_Text64:	levselstr	"Streets of Rage 2 (Beta)"
DrvName_Text65:		levselstr	"Streets of Rage 3"
DrvName_Text66:	levselstr	"Sub-Terrania"
DrvName_Text67:		levselstr	"The Ooze"
DrvName_Text68:	levselstr	"Thunder Force 3"
DrvName_Text69:	levselstr	"Thunder Force 4"
DrvName_Text70:	levselstr	"Time Trax (Prototype)"
DrvName_Text71:		levselstr	"Tinhead"
DrvName_Text72:		levselstr	"True Lies"
DrvName_Text73:		levselstr	"Tiny Toon Adventures - BHT"
DrvName_Text74:		levselstr	"Twinkle Tale"
DrvName_Text75:		levselstr	"Two Crude Dudes"
DrvName_Text76:		levselstr	"Undead Line"
DrvName_Text77:		levselstr	"Vectorman 1"
DrvName_Text78:		levselstr	"Vectorman 2"
DrvName_Text79:		levselstr	"Verytex"
DrvName_Text80:	levselstr	"X-Men-(32X)"
DrvName_Text81:		levselstr	"Zero the Kamikaze Squirrel"
	even