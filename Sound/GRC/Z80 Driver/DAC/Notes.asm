DAC Pointer List Format 1:
2 bytes - Start Offset (Z80 Bank Offset)
2 bytes - Data Length
2 bytes - Playback Speed
1 byte  - Z80 ROM Bank, bit 15
1 byte  - Z80 ROM Bank, bits 16-23

DAC sounds seem to be 4-bit PCM, though the game treats it as 8-bit PCM.


DAC Pointer List Format 2:
2 bytes - Start Offset (relative to Z80 Bank)
2 bytes - Data Length



Additional Commands:
  EC ff - set Note Stop (stops all notes ff frames early)
  ED nn - set PSG Noise Bits
  EE tt aa bb - Loop tt times back to offset +bbaa (the EE command byte is the offset base)
  F4 - invalid