fpc -al -Aas -CF32 -a -al -n -sh -st -Xd -Xe -Xm -WA -Us -viwnt ^
    -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS ^
    -Px86_64 -Twin64   ^
    -o.asm/src_pp/fpc/system.s src_pp/fpc/system.pas
as --64 -o .obj/src_pp/fpc/system.o .asm/src_pp/fpc/system.s

fpc -al -Aas -CF32 -a -al -n -sh -st -Xd -Xe -Xm -WA -Us -viwnt ^
    -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS ^
    -Px86_64 -Twin64   ^
    -o.asm/src_pp/fpc/sysinit.s src_pp/fpc/sysinit.pas
as --64 -o .obj/src_pp/fpc/sysinit.o .asm/src_pp/fpc/sysinit.s

fpc -al -Aas -CF32 -a -al -n -sh -st -Ur -Xd -Xe -Xm -WA -viwnt ^
    -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS ^
    -Px86_64 -Twin64   ^
    -Fusample ^
    -Fusrc_pp/fpc ^
    -o.asm/test/test1.s sample/test1.pas
.asm\test\test1_ppas.bat