@echo off
SET THEFILE=utils
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\rtl\utils.o   .asm\src_pp\rtl\utils.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
