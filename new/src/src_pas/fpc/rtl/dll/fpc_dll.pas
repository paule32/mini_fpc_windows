{$mode delphi}
library fpc_dll;

uses Windows, Classes, SysUtils;

function RTL_IntToStr(Avalue: Integer): String;  stdcall; export; begin result := IntToStr(AValue); end;
function RTL_StrToInt(AValue: String ): Integer; stdcall; export; begin result := StrToInt(AValue); end;

exports
  RTL_IntToStr,
  RTL_StrToInt;

begin
ExitProcess(1);
end.
