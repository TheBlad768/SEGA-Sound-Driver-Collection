@echo off
for %%f in (*.asm) do (
		_ASMX /p /o ae- "%%f", "%%~nf.bin", ,
	)
pause