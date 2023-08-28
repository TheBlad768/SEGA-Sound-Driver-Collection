; Do not replace this file when updating unless instructed to

; ---------------------------------------------------------------------------
; Music	pointers

; Flags:
; +1 - Forces song to play at PAL speeds on PAL consoles for synchronisation (Used by drowning theme)
; ---------------------------------------------------------------------------
MusicIndex:
ptr_mus81:	dc.l Music81
ptr_mus82:	dc.l Music82
ptr_mus83:	dc.l Music83
ptr_mus84:	dc.l Music84
ptr_mus85:	dc.l Music85
ptr_mus86:	dc.l Music86
ptr_mus87:	dc.l Music87
ptr_mus88:	dc.l Music88
ptr_mus89:	dc.l Music89
ptr_mus8A:	dc.l Music8A
ptr_mus8B:	dc.l Music8B
ptr_mus8C:	dc.l Music8C
ptr_mus8D:	dc.l Music8D
ptr_mus8E:	dc.l Music8E
ptr_mus8F:	dc.l Music8F
ptr_mus90:	dc.l Music90
ptr_mus91:	dc.l Music91
ptr_mus92:	dc.l Music92
ptr_mus93:	dc.l Music93
ptr_mus94:	dc.l Music94
ptr_mus95:	dc.l Music95
ptr_mus96:	dc.l Music96
ptr_mus97:	dc.l Music97
ptr_mus98:	dc.l Music98
ptr_mus99:	dc.l Music99
ptr_mus9A:	dc.l Music9A
ptr_mus9B:	dc.l Music9B
ptr_mus9C:	dc.l Music9C
ptr_mus9D:	dc.l Music9D
ptr_mus9E:	dc.l Music9E
ptr_mus9F:	dc.l Music9F
ptr_musA0:	dc.l MusicA0
ptr_musA1:	dc.l MusicA1
ptr_musA2:	dc.l MusicA2
ptr_musA3:	dc.l MusicA3
ptr_musA4:	dc.l MusicA4
ptr_musA5:	dc.l MusicA5
ptr_musA6:	dc.l MusicA6
ptr_musA7:	dc.l MusicA7
ptr_musA8:	dc.l MusicA8
ptr_musA9:	dc.l MusicA9
ptr_musAA:	dc.l MusicAA
ptr_musAB:	dc.l MusicAB
ptr_musAC:	dc.l MusicAC
ptr_musAD:	dc.l MusicAD
ptr_musAE:	dc.l MusicAE
ptr_musAF:	dc.l MusicAF
ptr_musB0:	dc.l Music88
ptr_musB1:	dc.l MusicB1
ptr_musB2:	dc.l Music8E
ptr_musB3:	dc.l Music8F
ptr_musB4:	dc.l Music90
ptr_musB5:	dc.l Music93
ptr_musB6:	dc.l MusicB6
ptr_musB7:	dc.l Music92
ptr_musend
; ---------------------------------------------------------------------------
; Music 'binclude's
; ---------------------------------------------------------------------------

Music81:		binclude "sound/SMPS M68K/music/S1/Mus81 - GHZ.bin"
	even
Music82:	binclude "sound/SMPS M68K/music/S1/Mus82 - LZ.bin"
	even
Music83:		binclude "sound/SMPS M68K/music/S1/Mus83 - MZ.bin"
	even
Music84:	binclude "sound/SMPS M68K/music/S1/Mus84 - SLZ.bin"
	even
Music85:		binclude "sound/SMPS M68K/music/S1/Mus85 - SYZ.bin"
	even
Music86:	binclude "sound/SMPS M68K/music/S1/Mus86 - SBZ.bin"
	even
Music87:		binclude "sound/SMPS M68K/music/S1/Mus87 - Invincibility.bin"
	even
Music88:	binclude "sound/SMPS M68K/music/S1/Mus88 - Extra Life.bin"
	even
Music89:	binclude "sound/SMPS M68K/music/S1/Mus89 - Special Stage.bin"
	even
Music8A:	binclude "sound/SMPS M68K/music/S1/Mus8A - Title Screen.bin"
	even
Music8B:	binclude "sound/SMPS M68K/music/S1/Mus8B - Ending.bin"
	even
Music8C:	binclude "sound/SMPS M68K/music/S1/Mus8C - Boss.bin"
	even
Music8D:	binclude "sound/SMPS M68K/music/S1/Mus8D - FZ.bin"
	even
Music8E:	binclude "sound/SMPS M68K/music/S1/Mus8E - Sonic Got Through.bin"
	even
Music8F:	binclude "sound/SMPS M68K/music/S1/Mus8F - Game Over.bin"
	even
Music90:	binclude "sound/SMPS M68K/music/S1/Mus90 - Continue Screen.bin"
	even
Music91:		binclude "sound/SMPS M68K/music/S1/Mus91 - Credits.bin"
	even
Music92:	binclude "sound/SMPS M68K/music/S1/Mus92 - Drowning.bin"
	even
Music93:		binclude "sound/SMPS M68K/music/S1/Mus93 - Get Emerald.bin"
	even
Music94:	binclude "sound/SMPS M68K/music/S2/81 - 2 Player Menu.bin"
	even
Music95:		binclude "sound/SMPS M68K/music/S2/82 - EHZ.bin"
	even
Music96:	binclude "sound/SMPS M68K/music/S2/83 - MCZ 2P.bin"
	even
Music97:		binclude "sound/SMPS M68K/music/S2/84 - OOZ.bin"
	even
Music98:	binclude "sound/SMPS M68K/music/S2/85 - MTZ.bin"
	even
Music99:	binclude "sound/SMPS M68K/music/S2/A1 - MTZ(Beta).bin"
	even
Music9A:	binclude "sound/SMPS M68K/music/S2/86 - HTZ.bin"
	even
Music9B:	binclude "sound/SMPS M68K/music/S2/87 - ARZ.bin"
	even
Music9C:	binclude "sound/SMPS M68K/music/S2/A2 - ARZ(Beta).bin"
	even
Music9D:	binclude "sound/SMPS M68K/music/S2/88 - CNZ 2P.bin"
	even
Music9E:	binclude "sound/SMPS M68K/music/S2/89 - CNZ.bin"
	even
Music9F:	binclude "sound/SMPS M68K/music/S2/A3 - CNZ(Beta).bin"
	even
MusicA0:	binclude "sound/SMPS M68K/music/S2/8A - DEZ.bin"
	even
MusicA1:		binclude "sound/SMPS M68K/music/S2/A4 - DEZ(Beta).bin"
	even
MusicA2:	binclude "sound/SMPS M68K/music/S2/8B - MCZ.bin"
	even
MusicA3:	binclude "sound/SMPS M68K/music/S2/8C - EHZ 2P.bin"
	even
MusicA4:	binclude "sound/SMPS M68K/music/S2/8D - SCZ.bin"
	even
MusicA5:	binclude "sound/SMPS M68K/music/S2/8E - CPZ.bin"
	even
MusicA6:	binclude "sound/SMPS M68K/music/S2/8F - WFZ.bin"
	even
MusicA7:	binclude "sound/SMPS M68K/music/S2/90 - HPZ.bin"
	even
MusicA8:	binclude "sound/SMPS M68K/music/S2/91 - Options.bin"
	even
MusicA9:	binclude "sound/SMPS M68K/music/S2/92 - Special Stage.bin"
	even
MusicAA:	binclude "sound/SMPS M68K/music/S2/93 - Boss.bin"
	even
MusicAB:	binclude "sound/SMPS M68K/music/S2/A0 - Boss(Beta).bin"
	even
MusicAC:	binclude "sound/SMPS M68K/music/S2/94 - Final Boss.bin"
	even
MusicAD:	binclude "sound/SMPS M68K/music/S2/95 - SWEET SWEET SWEET.bin"
	even
MusicAE:	binclude "sound/SMPS M68K/music/S2/96 - Super Sonic.bin"
	even
MusicAF:	binclude "sound/SMPS M68K/music/S2/97 - Invincible.bin"
	even
;MusicB0:	binclude "sound/SMPS M68K/music/S2/98 - Extra Life.bin"
;	even
MusicB1:		binclude "sound/SMPS M68K/music/S2/99 - Title Screen.bin"
	even
;MusicB2:	binclude "sound/SMPS M68K/music/S2/9A - End of Act.bin"
;	even
;MusicB3:	binclude "sound/SMPS M68K/music/S2/9B - Game Over.bin"
;	even
;MusicB4:	binclude "sound/SMPS M68K/music/S2/9C - Continue.bin"
;	even
;MusicB5:	binclude "sound/SMPS M68K/music/S2/9D - Got Emerald.bin"
;	even
MusicB6:	binclude "sound/SMPS M68K/music/S2/9E - Credits.bin"
	even
;MusicB7:	binclude "sound/SMPS M68K/music/S2/9F - Drowning.bin"
;	even