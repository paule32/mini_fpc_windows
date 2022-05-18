{$mode delphi}
{$calling cdecl}
program test1;

uses
  Windows, Strings;

var
  s: String;

begin
	asm
		nop
	end;
  s := 'hallo' + ' xxl ';
	asm
		nop
	end;

  WriteLn(Length(s));
  WriteLn('meerjung');
  ReadLn;

  asm
    movl $1, %ecx
    call LazExitProcess
    nop
  end;
end.
