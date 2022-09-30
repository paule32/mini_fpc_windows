#!/bin/bash

# -------------------------------------------------------------------
# absolute path's of used compiler programs "fpc", and "g++"
# -------------------------------------------------------------------
FPC="C:/Lazarus/fpc/3.2.2/bin/x86_64-win64"
GCC="E:/msys64/mingw64/bin/gcc.exe"
GPP="E:/msys64/mingw64/bin/g++.exe"

# -------------------------------------------------------------------
# global scoped used variables for compile c++, and pas files ...
# -------------------------------------------------------------------
SRC_DIR="."
SRC_PAS="${SRC_DIR}/src_pas"
SRC_CPP="${SRC_DIR}/src_cpp"

OUT_DIR="${SRC_DIR}/out_obj"
OUT_PAS="${OUT_DIR}/src_pas"
OUT_CPP="${OUT_DIR}/src_cpp"

START_DATE="$(date '+%Y-%m-%d')";
LAST_DATE="$(date '+%Y-%m-%d')";
CLEAN=false;

# -------------------------------------------------------------------
# set values
# -------------------------------------------------------------------
TRUE=1
FALSE=0

# -------------------------------------------------------------------
# g++ include/header proto types files ...
# -------------------------------------------------------------------
CINCLUDES=$(echo "-I${SRC_CPP}/inc \
-I/E/msys64/mingw64/include            \
-I/E/msys64/mingw64/include/QtCore     \
-I/E/msys64/mingw64/include/QtGui      \
-I/E/msys64/mingw64/include/QtWidgets ")

# -------------------------------------------------------------------
# g++ library files ...
# -------------------------------------------------------------------
CXXLIBS=$(echo "\
-L /E/msys64/mingw64/lib  \
-licuin           \
-licuuc           \
-lQt5Core.dll     \
-lQt5Gui.dll      \
-lQt5Widgets.dll ")

# -------------------------------------------------------------------
# compiler flags for g++, and fpc ...
# -------------------------------------------------------------------
CPP_FLAGS="-Wfatal-errors -m64 -std=c++2a -O2 ${CINCUDES} -shared -fPIC"
FPC_FLAGS="-Mdelphi -MCLASS -MRESULT -MNESTEDCOMMENTS -MANSISTRINGS -MDEFAULTPARAMETERS -MALLOWINLINE -MEXCEPTIONS \
    -Rintel -Sc -Se1 -Sg -Sh -SIcom -Sx -Cr -Co -D -Twin64 \
    -l- -O2 -Ur -WN"

# -------------------------------------------------------------------
# clean temp
# -------------------------------------------------------------------
function clean() {
    rm -rf   ${OUT_DIR}
    mkdir -p ${OUT_PAS}/fpc/win
    mkdir -p ${OUT_PAS}/qt5
    mkdir -p ${OUT_PAS}/vcl

    mkdir -p ${OUT_CPP}/fpc/win
    mkdir -p ${OUT_CPP}/qt5
    mkdir -p ${OUT_CPP}/vcl
    mkdir -p ${OUT_DIR}/x64_exec
}

# -------------------------------------------------------------------
# compile c++ file, if the source is newer that the .o bject file ...
# -------------------------------------------------------------------
function compile_cpp() {
    #file1Time=$(stat -c %Y "$1")
    #file2Time=$(stat -c %Y "$2")

    #if [ $file1Time gt $file2Time ]; then
        echo "compile: $2"
        $(echo $GPP $CPP_FLAGS $CINCLUDES -o $1 -c $2)
    #fi
}
# -------------------------------------------------------------------
# compile pas file, if the source is newer that the .o bject file ...
# -------------------------------------------------------------------
function compile_fpc() {
    ${FPC}/fpc ${PPF} -Xs \
    -Fu${OUT_PAS}/fpc     \
    -Fu${OUT_PAS}/fpc/win \
    -Fu${OUT_PAS}/qt5     \
    -Fu${SRC_PAS}/fpc     \
    -Fu${SRC_PAS}/qt5     \
    -Fu${SRC_PAS}/fpc/win \
    -FE$1 $2
}

# -------------------------------------------------------------------
# remove old artefact's :
# -------------------------------------------------------------------
clean

# -------------------------------------------------------------------
# catch arguments from command line ...
# -------------------------------------------------------------------
argc="$*"
echo "$argc"
x=0
for arg in $argc
do
    case "$x" in
        "--" ) echo "invalide opt"; exit 1;;
        "--clean" ) echo "pupu";;
        * ) echo "invalid option: $*"; exit 1;;
    esac
    x=$arg;
done

# -------------------------------------------------------------------
# test case dll
# -------------------------------------------------------------------
compile_cpp ${OUT_CPP}/modtest.o   pas_test/modtest.cc
compile_cpp ${OUT_CPP}/dll_main.o  ${SRC_CPP}/dll_main.cc

# -------------------------------------------------------------------
# create dll files ...
# -------------------------------------------------------------------
compile_cpp ${OUT_CPP}/qt5/QApplication.o     ${SRC_CPP}/qt5/QApplication.cc
compile_cpp ${OUT_CPP}/qt5/QMenu.o            ${SRC_CPP}/qt5/QMenu.cc
compile_cpp ${OUT_CPP}/qt5/QObject.o          ${SRC_CPP}/qt5/QObject.cc
compile_cpp ${OUT_CPP}/qt5/QWidget.o          ${SRC_CPP}/qt5/QWidget.cc
compile_cpp ${OUT_CPP}/qt5/utils.o            ${SRC_CPP}/qt5/utils.cc

compile_cpp ${OUT_CPP}/vcl/TClass.o     ${SRC_CPP}/vcl/TClass.cc
compile_cpp ${OUT_CPP}/vcl/TException.o ${SRC_CPP}/vcl/TException.cc
compile_cpp ${OUT_CPP}/vcl/TObject.o    ${SRC_CPP}/vcl/TObject.cc
compile_cpp ${OUT_CPP}/vcl/IUnknown.o   ${SRC_CPP}/vcl/IUnknown.cc
compile_cpp ${OUT_CPP}/vcl/ISomething.o ${SRC_CPP}/vcl/ISomething.cc

compile_fpc ${OUT_PAS}/fpc/win ${SRC_PAS}/fpc/win/kernel32.pas

echo "build dll ..."
g++ ${CPP_FLAGS} -o ${OUT_DIR}/x64_exec/qt5_fpc.dll \
    ${OUT_CPP}/qt5/QApplication.o  \
    ${OUT_CPP}/qt5/QObject.o       \
    ${OUT_CPP}/qt5/QMenu.o         \
    ${OUT_CPP}/qt5/QWidget.o       \
    ${OUT_CPP}/qt5/utils.o         \
    ${OUT_CPP}/vcl/TClass.o        \
    ${OUT_CPP}/vcl/TException.o    \
    ${OUT_CPP}/vcl/TObject.o       \
    ${OUT_CPP}/vcl/IUnknown.o      \
    ${OUT_CPP}/vcl/ISomething.o    \
    \
    ${OUT_CPP}/dll_main.o          \
    ${OUT_CPP}/modtest.o           \
    \
    ${CXXLIBS}

echo "remove debug symbols ..."
strip ${OUT_DIR}/x64_exec/qt5_fpc.dll

# test case
#echo "FPC - create new system unit ..."
#${FPC}/fpc ${PPF} -Us -n  \
#    -FE${OUT_PAS}/fpc ${SRC_PAS}/fpc/system.pas

echo "FPC - create test case ..."
compile_fpc ${OUT_DIR}/x64_exec pas_test/test2.pas
