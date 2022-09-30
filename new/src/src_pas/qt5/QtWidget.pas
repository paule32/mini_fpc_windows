// ----------------------------------------------------------------------------
// File:        QtWidget.pas
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
unit QtWidget;

interface
uses QtGlobal, QtObject;

type
  QWidget = class(QObject)
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure resize(width, height: Integer);
    procedure setWindowTitle(title: Pchar);
    procedure show;
  end;

implementation

function  QWidget_Create:             Pointer ;                         cdecl; external fpc_qt5Lib name 'QWidget_Create';
procedure QWidget_Destory       (obj: Pointer);                         cdecl; external fpc_qt5Lib name 'QWidget_Destroy';
procedure QWidget_resize        (obj: Pointer; width, height: Integer); cdecl; external fpc_qt5Lib name 'QWidget_resize';
procedure QWidget_setWindowTitle(obj: Pointer; title: PChar);           cdecl; external fpc_qt5Lib name 'QWidget_setWindowTitle';
procedure QWidget_show          (obj: Pointer);                         cdecl; external fpc_qt5Lib name 'QWidget_show';

constructor QWidget.Create;
begin
  inherited Create;
  FClassPtr := QWidget_Create;
end;

destructor QWidget.Destroy;
begin
  QWidget_Destory(FClassPtr);
  inherited Destroy;
end;

procedure QWidget.resize(width, height: Integer);
begin
  QWidget_resize(FClassPtr, width, height);
end;

procedure QWidget.setWindowTitle(title: PChar);
begin
  QWidget_setWindowTitle(FClassPtr, title);
end;

procedure QWidget.show;
begin
  QWidget_show(FClassPtr);
end;

begin
end.
