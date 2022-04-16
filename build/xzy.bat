fpc -al -Aas -CF32 -a -al -n -sh -st -Xd -Xe -Xm -WA -Us ^
    -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS ^
    -Px86_64 -Twin64   ^
    -o.asm/src_pp/fpc/system.s src_pp/fpc/system.pas
    
as --64 -o .obj/src_pp/fpc/system.o .asm/src_pp/fpc/system.s

fpc -al -Aas -CF32 -a -al -n -sh -st -Ur -Xd -Xe -Xm -WA ^
    -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS ^
    -Px86_64 -Twin64   ^
    -o.asm/test/test1.s sample/test1.pas

