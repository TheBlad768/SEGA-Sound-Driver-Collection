; ===========================================================================
; Advanced Z80 Player (Macros)
; ===========================================================================

; Old(2016)
UniBank_OffsetTable macro {INTLABEL}
__LABEL__ label *
UniBank_offset_table := __LABEL__
    endm
UniBankOffset macro offset
	dc.l offset+(UniBank_offset_table+$8000)
    endm
MusicBankOffset macro offset
	dc.b (offset>>16)&$FF,(offset>>8)&$FF,offset&$FF
    endm
SequenceVoiceBankOffset macro offset
	dc.w (offset>>8)&$FFFF+(UniBank_offset_table>>8)&$FFFF+($8000>>8)&$FFFF
	dc.b offset&$FF
    endm

; New(WIP)
UniBankOffset2 macro offset1,offset2,offset3
	dc.b (*)>>15,offset2,offset3
    endm
MusicBankOffset2 macro offset1,offset2,offset3
	dc.b (*)>>16,z80_ptr(offset2)>>8,offset3
    endm

;MusicBankOffset2 macro offset1,offset2,offset3
;	dc.b (*)>>16,(z80_ptr(((*)>>8))>>8)&$F0|offset2&$7F,offset3
;    endm