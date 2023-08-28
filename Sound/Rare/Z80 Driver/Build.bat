@ECHO OFF
cd ..
IF EXIST "Z80 Driver\Z80 Driver.bin" del "Z80 Driver\Z80 Driver.bin"
"Z80 Driver\AS\asw" -c -A -L -xx "Z80 Driver\Z80 Driver.asm"
"Z80 Driver\AS\s1p2bin" "Z80 Driver\Z80 Driver.p" "Z80 Driver\Z80 Driver.bin" "Z80 Driver\Z80 Driver.h"
IF EXIST "Z80 Driver\Z80 Driver.p" del "Z80 Driver\Z80 Driver.p"
IF EXIST "Z80 Driver\Z80 Driver.h" del "Z80 Driver\Z80 Driver.h"
IF EXIST "Z80 Driver\Z80 Driver.bin" copy  "Z80 Driver\Z80 Driver.bin" "Z80 Rare Driver.bin">nul
pause