{$mode delphi}{$H+}
program test1;

uses
  Windows, Strings;

var
  s: String;

//procedure AnsiStrAssign(var dst: Pointer; src: Pointer); cdecl; external 'laz_rtl.dll' name 'AnsiStrAssign';
//procedure fpc_AnsiStr_Assign (Var DestS: Pointer; S2: Pointer);[Public,Alias:'FPC_ANSISTR_ASSIGN']; compilerproc;
(*procedure fpc_ansistr_assign (Var DestS: Pointer; S2: Pointer);compilerproc;
begin
  asm
    movl $1,%eax
    nop
  end;
end;*)
//procedure fpc_AnsiStr_Assign (Var S1: Pointer; S2: Pointer); overload; [external name 'FPC_ANSISTR_ASSIGN'];

begin
  s := 'hallo' + ' xxl ';
  WriteLn(Length(s));
  WriteLn('meerjung');
  ReadLn;

  asm
    movl $1, %ecx
    call LazExitProcess
    nop
  end;
end.