; ===========================================================================
; PSG
; ===========================================================================

PSG_Bank_SMPS: offsetTable
		offsetTableEntry.w PSG_Tone1_SMPS
		offsetTableEntry.w PSG_Tone2_SMPS
		offsetTableEntry.w PSG_Tone3_SMPS
		offsetTableEntry.w PSG_Tone4_SMPS
		offsetTableEntry.w PSG_Tone5_SMPS
PSG_Tone1_SMPS:	binclude "Sound/SMPS Mucom/Music/Streets of Rage/PSG/1.bin"
PSG_Tone2_SMPS:	binclude "Sound/SMPS Mucom/Music/Streets of Rage/PSG/2.bin"
PSG_Tone3_SMPS:	binclude "Sound/SMPS Mucom/Music/Streets of Rage/PSG/3.bin"
PSG_Tone4_SMPS:	binclude "Sound/SMPS Mucom/Music/Streets of Rage/PSG/4.bin"
PSG_Tone5_SMPS:	binclude "Sound/SMPS Mucom/Music/Streets of Rage/PSG/5.bin"
	even