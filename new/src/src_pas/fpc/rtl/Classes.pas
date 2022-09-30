{$mode delphi}
unit Classes;

interface

{$IFDEF WINDOWS}
const rtl_fpcLib = 'rtl_fpc.dll';
{$ELSE}
const rtl_fpcLib = 'rtl_fpc.so';
{$ENDIF}

type
    RTL = class
    public
        constructor Create;
        destructor Destroy; override;
        
        function IntToStr(AValue: Integer): String;
        function StrToInt(AValue: String): Integer;
    end;

implementation

function RTL_IntToStr(AValue: Integer): String; stdcall; external rtl_fpcLib name 'RTL_IntToStr';
function RTL_StrToInt(AValue: String): Integer; stdcall; external rtl_fpcLib name 'RTL_StrToInt';

constructor RTL.Create;
begin
end;
destructor RTL.Destroy;
begin
  inherited Destroy;
end;

function RTL.IntToStr(AValue: Integer): String;
begin
    result := RTL_IntToStr(AValue);
end;
function RTL.StrToInt(AValue: String): Integer;
begin
    result := RTL_StrToInt(AValue);
end;

begin
end.
