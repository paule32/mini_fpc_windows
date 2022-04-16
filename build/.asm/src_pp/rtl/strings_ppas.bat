@echo off
SET THEFILE=system
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\rtl\system.o   .asm\src_pp\rtl\system.s
if errorlevel 1 goto asmend
SET THEFILE=strings
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\rtl\strings.o   .asm\src_pp\rtl\strings.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
