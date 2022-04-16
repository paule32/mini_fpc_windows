@echo off
SET THEFILE=system
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\vcl\system.o   .asm\src_pp\vcl\system.s
if errorlevel 1 goto asmend
SET THEFILE=windows
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\vcl\Windows.o   .asm\src_pp\vcl\Windows.s
if errorlevel 1 goto asmend
SET THEFILE=forms
echo Assembling %THEFILE%
as.exe --64 -o .asm\src_pp\vcl\Forms.o   .asm\src_pp\vcl\Forms.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
