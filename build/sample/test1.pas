{$mode delphi}{$H+}
program test1;

uses
  Windows, Strings;

var
  s: String;

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
