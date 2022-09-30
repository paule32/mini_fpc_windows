#!/bin/bash

# -------------------------------------------------------------------
# absolute path's of used compiler programs "fpc", and "g++"
# -------------------------------------------------------------------
FPC="/C/Lazarus/fpc/3.2.2/bin/x86_64-win64"
GCC="/E/msys64/mingw64/bin/gcc.exe"
GPP="/E/msys64/mingw64/bin/g++.exe"

${FPC}/fpc -Fu. classes.pas
