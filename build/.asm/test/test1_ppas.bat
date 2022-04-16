@echo off
SET THEFILE=system
echo Assembling %THEFILE%
as.exe --64 -o .asm\test\system.o   .asm\test\system.s
if errorlevel 1 goto asmend
SET THEFILE=sysinit
echo Assembling %THEFILE%
as.exe --64 -o .asm\test\sysinit.o   .asm\test\sysinit.s
if errorlevel 1 goto asmend
SET THEFILE=test1
echo Assembling %THEFILE%
as.exe --64 -o .asm\test\test1.o   .asm\test\test1.s
if errorlevel 1 goto asmend
SET THEFILE=.asm\test\test1.s
echo Linking %THEFILE%
ld.exe -b pei-x86-64  --gc-sections -Map .asm\test\test1.map -s  --entry=_mainCRTStartup   --base-file base.$$$ -o .asm\test\test1.s .asm\test\test1_link.res
if errorlevel 1 goto linkend
dlltool.exe -S as.exe -D .asm\test\test1.s -e exp.$$$ --base-file base.$$$ 
if errorlevel 1 goto linkend
ld.exe -b pei-x86-64  -s  --entry=_mainCRTStartup  -o .asm\test\test1.s .asm\test\test1_link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
