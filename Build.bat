@Echo off
set AS_MSGPATH=Win32
set USEANSI=n
"Win32\asw" -xx -q -c -A -L Player.asm
IF EXIST Player.p "Win32\p2bin" Player.p Player.bin Player.h
IF NOT EXIST Player.p goto LABLPAUSE
IF EXIST Player.p del Player.p
IF EXIST Player.h del Player.h
REM // generate debug information
REM // IF EXIST Player.bin "Win32\convsym" Player.lst Player.bin -a -input as_lst
IF EXIST Player.bin "Win32\rompad" Player.bin 255 0
IF EXIST Player.bin "Win32\fixheadr" Player.bin
IF EXIST Player.bin goto LABLEXIT
:LABLPAUSE
pause
:LABLEXIT
exit /b