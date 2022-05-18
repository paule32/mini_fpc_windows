@echo off
SET THEFILE=system
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\fpv\system.o   .asm\src_pp\fpv\system.s
if errorlevel 1 goto asmend
SET THEFILE=tvision
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\fpv\TVision.o   .asm\src_pp\fpv\TVision.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
