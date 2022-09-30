// ----------------------------------------------------------------------------
// File:        QObject.pas
// Author:      Jens Kallup - paule32 <kallup-dev@web.de>
// Copyright:   (c) 2022 kallup non-profit
//
// License:     non-profit * only for education, and trial !!!
//              All modifications needs to query to the original author's (me).
//              You can use it at Your school as teacher for education.
//              But commercial usage is not allowed.
//
// Description: Qt5 is a GUI framework formed by Nokia in 2011, Norway.
//              This implementation is not complete. But can be a step,
//              to depth into the magic of gui programming with FPC-OOP
// ----------------------------------------------------------------------------
{$mode delphi}
unit QtApplication;

interface
uses QtGlobal, QtObject;

type
  QApplication = class(QObject)
  public
    constructor Create(argc: Integer; argv: Array of PChar);
    destructor  Destroy; override;

    function Execute: Integer;
  end;

implementation
// ----------------------------------------------------------------------------
// some magic is put in pascal files, and some other magic is put in cpp files.
// You will need the libraries and other tools from the Qt5 GUI-framework...
// ----------------------------------------------------------------------------
function  QApplication_Create  (argc: Integer; argv: Pointer): Pointer; cdecl; external fpc_qt5Lib name 'QApplication_Create';
procedure QApplication_Destroy (obj : Pointer);                         cdecl; external fpc_qt5Lib name 'QApplication_Destroy';
function  QApplication_Execute (obj : Pointer): Integer;                cdecl; external fpc_qt5Lib name 'QApplication_Execute';

constructor QApplication.Create(argc: Integer; argv: Array of PChar);
var parr: Array of PChar;
begin
  inherited Create;

  SetLength(parr,3);
  FClassPtr := QApplication_Create(ParamCount,@parr);
end;

destructor QApplication.Destroy;
begin
  QApplication_Destroy(FClassPtr);
  inherited Destroy;
end;

function QApplication.Execute: Integer;
begin
  result := QApplication_Execute(FClassPtr);
end;

begin
end.
