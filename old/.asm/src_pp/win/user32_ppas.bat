@echo off
SET THEFILE=user32
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\win\user32.o   .asm\src_pp\win\user32.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
