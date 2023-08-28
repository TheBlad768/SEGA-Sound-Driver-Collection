; ===========================================================================
; Macros
; ===========================================================================

; makes a VDP command
vdpComm function addr,type,rwd,(((type&rwd)&3)<<30)|((addr&$3FFF)<<16)|(((type&rwd)&$FC)<<2)|((addr&$C000)>>14)
; ---------------------------------------------------------------------------

; values for the type argument
VRAM = %100001
CRAM = %101011
VSRAM = %100101

; values for the rwd argument
READ = %001100
WRITE = %000111
DMA = %100111
; ---------------------------------------------------------------------------

; tells the VDP to fill a region of VRAM with a certain byte
dmaFillVRAM macro byte,addr,length
	move.w	#$8F01,VDP_control_port-VDP_control_port(a5) ; VRAM pointer increment: $0001
	move.l	#(($9400|((((length)-1)&$FF00)>>8))<<16)|($9300|(((length)-1)&$FF)),VDP_control_port-VDP_control_port(a5) ; DMA length ...
	move.w	#$9780,VDP_control_port-VDP_control_port(a5) ; VRAM fill
	move.l	#$40000080|(((addr)&$3FFF)<<16)|(((addr)&$C000)>>14),VDP_control_port-VDP_control_port(a5) ; Start at ...
	move.w	#(byte)<<8,VDP_data_port-VDP_data_port(a6) ; Fill with byte
.loop:
	move.w	VDP_control_port-VDP_control_port(a5),d1
	btst	#1,d1
	bne.s	.loop	; busy loop until the VDP is finished filling...
	move.w	#$8F02,VDP_control_port-VDP_control_port(a5) ; VRAM pointer increment: $0002
    endm
; ---------------------------------------------------------------------------
; Set a VRAM address via the VDP control port.
; input: 16-bit VRAM address, control port (default is (a5))
; ---------------------------------------------------------------------------

locVRAM macro loc,controlport
	if ("controlport"=="")
	move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),VDP_control_port-VDP_control_port(a5)
	else
	move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),controlport
	endif
    endm
; ---------------------------------------------------------------------------
; Decompress tilemap using Enigma compression
; ---------------------------------------------------------------------------

LoadTileMap	macro source,loc,vram,loc2,width,height
	lea	source,a0
	lea	loc,a1
	if vram=0
	moveq	#0,d0
	elseif
	move.w	#vram,d0
	endif
	bsr.w	Eni_Decomp
    endm
; ---------------------------------------------------------------------------
; Copy a tilemap from 68K (ROM/RAM) to the VRAM without using DMA
; input: source, destination, width [cells], height [cells]
; ---------------------------------------------------------------------------

copyTilemap	macro loc,width,height
	locVRAM	loc,d1
	moveq	#(width/8-1),d3
	moveq	#(height/8-1),d7
	bsr.w	SetPlaneMap
    endm
; ---------------------------------------------------------------------------

; calculates initial loop counter value for a dbf loop
; that writes n bytes total at 4 bytes per iteration
bytesToLcnt function n,n>>2-1
; ---------------------------------------------------------------------------

disableInts macro
	move	#$2700,sr
    endm

enableInts macro
	move	#$2300,sr
    endm

disableInts2 macro
	move	sr,-(sp)
	ori	#$700,sr
    endm

enableInts2 macro
	move	(sp)+,sr
    endm

stopCPU macro
	stop	#$2300
    endm
; ---------------------------------------------------------------------------

; tells the Z80 to stop, and waits for it to finish stopping (acquire bus)
stopZ80 macro
	move.w	#$100,(Z80_bus_request).l ; stop the Z80
	nop
	nop
	nop
-	btst	#0,(Z80_bus_request).l
	bne.s	- 	; loop until it says it's stopped
    endm

; tells the Z80 to stop, and waits for it to finish stopping (acquire bus)
stopZ80a macro
	move.w	#$100,(Z80_bus_request).l ; stop the Z80
    endm

; tells the Z80 to wait for it to finish stopping (acquire bus)
waitZ80 macro
-	btst	#0,(z80_bus_request).l
	bne.s	-
    endm

; tells the Z80 to reset
resetZ80 macro
	move.w	#$100,(z80_reset).l
    endm

; tells the Z80 to reset
resetZ80a macro
	move.w	#0,(z80_reset).l
    endm

; tells the Z80 to start again
startZ80 macro
	move.w	#0,(z80_bus_request).l
    endm

waitZ80time macro time
	move.w	#(time),d0
-	nop
	dbf	d0,-
    endm
; ---------------------------------------------------------------------------

; function to make a little-endian 16-bit pointer for the Z80 sound driver
z80_ptr function x,(x)<<8&$FF00|(x)>>8&$7F|$80

; macro to declare a little-endian 16-bit pointer for the Z80 sound driver
rom_ptr_z80 macro addr
	dc.w z80_ptr(addr)
    endm
; ---------------------------------------------------------------------------

; macros to convert from tile index to art tiles, block mapping or VRAM address.
make_art_tile function addr,pal,pri,((pri&1)<<15)|((pal&3)<<13)|(addr&tile_mask)
tiles_to_bytes function addr,((addr&$7FF)<<5)
; ---------------------------------------------------------------------------

_Kos_UseLUT := 1
_Kos_LoopUnroll := 3
_Kos_ExtremeUnrolling := 1

_Kos_RunBitStream macro
	dbra	d2,.skip
	moveq	#7,d2				; Set repeat count to 8.
	move.b	d1,d0				; Use the remaining 8 bits.
	not.w	d3					; Have all 16 bits been used up?
	bne.s	.skip				; Branch if not.
	move.b	(a0)+,d0				; Get desc field low-byte.
	move.b	(a0)+,d1				; Get desc field hi-byte.
	if _Kos_UseLUT==1
	move.b	(a4,d0.w),d0			; Invert bit order...
	move.b	(a4,d1.w),d1			; ... for both bytes.
	endif
.skip
    endm

_Kos_ReadBit macro
	if _Kos_UseLUT==1
	add.b	d0,d0				; Get a bit from the bitstream.
	else
	lsr.b	#1,d0					; Get a bit from the bitstream.
	endif
    endm
; ---------------------------------------------------------------------------

SetDriverRAM macro ram,size,channels
	dc.l (channels)<<24|(ram)&$FFFFFF ; Channels number, RAM
	dc.w size					; Channel size
    endm

SetConf_LoadDriver macro update,method,drv,data
	dc.l update,method,drv,data
    endm

SetConf_PlaySound macro max,select,start,method
	dc.l (max)<<24|(select),(start)<<24|(method)
    endm

SetPlay_PlaySound macro id,method
	dc.l (id)<<24|(method)
    endm

SetSnd_OffsetData macro offset
	dc.ATTRIBUTE offset>>15
    endm
; ---------------------------------------------------------------------------

; fills a region of 68k RAM with 0 (4 bytes at a time)
clearRAM macro addr,length
    if ((addr)&$8000)==0
	lea	(addr).l,a1
    else
	lea	(addr).w,a1
    endif
	moveq	#0,d0
	move.w	#bytesToLcnt(length-addr),d1
-	move.l	d0,(a1)+
	dbf	d1,-
    endm

clearZ80RAM macro
	lea	(Z80_RAM).l,a0
	move.w	#$1FFF,d0
-	clr.b (a0)+
	dbf	d0,-
    endm

clearM68KRAM macro
	lea	(SoundDriverRAM).l,a0
	move.w	#bytesToLcnt(SoundDriverRAM_End-SoundDriverRAM),d0
-	clr.l (a0)+
	dbf	d0,-
    endm

paddingZ80RAM macro
	moveq	#0,d0
-	move.b	d0,(a1)+
	cmpa.l	#(Z80_RAM_end),a1
	bne.s	-
    endm
; ---------------------------------------------------------------------------

; macro to declare an offset table
offsetTable macro {INTLABEL}
current_offset_table := __LABEL__
__LABEL__ label *
    endm

; macro to declare an entry in an offset table
offsetTableEntry macro ptr
	dc.ATTRIBUTE ptr-current_offset_table
    endm
offsetEntry macro ptr
	dc.ATTRIBUTE ptr-*
    endm
; ---------------------------------------------------------------------------

; macro for generating standard strings
standardstr macro str
	save
	codepage	STANDARD
	dc.b strlen(str)-1, str
	restore
    endm

; macro for generating music screen strings
levselstr macro str
	save
	codepage	MUSICSCREEN
	dc.b strlen(str)-1, str
	restore
    endm

; macro for generating music screen strings
namemstr macro str
	dc.b strlen(str)-1, str
    endm

; Codepage for music screen
	save
	codepage MUSICSCREEN
	CHARSET ' ',  0
	CHARSET '0','9', 16
	CHARSET '!', 26
	CHARSET '?', 27
	CHARSET '&', 28
	CHARSET '©', 29
	CHARSET '^', 30
	CHARSET '*', 31
	CHARSET '$', 32
	CHARSET ';', 33
	CHARSET ':', 34
	CHARSET '.', 35
	CHARSET ',', 36
	CHARSET '(', 37
	CHARSET ')', 38
	CHARSET '-', 39
	CHARSET '=', 40
	CHARSET '<', 41
	CHARSET '>', 42
	CHARSET '/', 43
	CHARSET 'A','Z', 44
	CHARSET 'a','z', 44
	restore