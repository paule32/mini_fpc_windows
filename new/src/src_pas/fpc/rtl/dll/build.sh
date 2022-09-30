#!/bin/bash

# -------------------------------------------------------------------
# absolute path's of used compiler programs "fpc", and "g++"
# -------------------------------------------------------------------
FPC="C:/Lazarus/fpc/3.2.2/bin/x86_64-win64"
GCC="E:/msys64/mingw64/bin/gcc.exe"
GPP="E:/msys64/mingw64/bin/g++.exe"

${FPC}/fpc -a -D fpc_dll.pas
#gendef fpc_dll.dll
dlltool.exe -d fpc_dll.def -D fpc_dll.dll -l libfpc_dll.a
