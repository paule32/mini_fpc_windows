@echo off
SET THEFILE=system
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\win\system.o   .asm\src_pp\win\system.s
if errorlevel 1 goto asmend
SET THEFILE=kernel32
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\win\kernel32.o   .asm\src_pp\win\kernel32.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
