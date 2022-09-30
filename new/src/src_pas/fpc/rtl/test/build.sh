#!/bin/bash

# -------------------------------------------------------------------
# absolute path's of used compiler programs "fpc", and "g++"
# -------------------------------------------------------------------
FPC="/C/Lazarus/fpc/3.2.2/bin/x86_64-win64"
GCC="E:/msys64/mingw64/bin/gcc.exe"
GPP="E:/msys64/mingw64/bin/g++.exe"

FPC_FLAGS="-Mdelphi -MCLASS -MRESULT -MNESTEDCOMMENTS -MANSISTRINGS -MDEFAULTPARAMETERS -MALLOWINLINE -MEXCEPTIONS \
    -Rintel -Sc -Se1 -Sg -Sh -SIcom -Sx -Cr -Co -D -Twin64 \
    -l- -O2 -Ur -WN -Fu. -Fl."

gcc -o gcc_asm.o -c gcc_asm.s
gcc -o gcc_fnc.o -c gcc_fnc.c

${FPC}/fpc -Mdelphi -Twin64 -Fu. -Fl. pastest.pas
