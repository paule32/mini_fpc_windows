// ----------------------------------------------------------------------------
// File:        QtMenu.pas
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
unit QtMenu;

interface
uses QtGlobal, QtObject, QtWidget;

type
  QMenuBar = class(QObject)
  public
    constructor Create(parent: QWidget); overload;
    constructor Create; overload;
    destructor Destroy; override;
    
    procedure show;
    procedure hide;
  end;

type
  QMenu = class(QObject)
  private
    FMenuTitle: String;
  private
    procedure setTitle(AValue: String);
    function  getTitle: String;
  public
    constructor Create(title: PChar; parent: QMenuBar); overload;
    constructor Create(title: PChar); overload;
    constructor Create; overload;
    destructor Destroy; override;

  published
    property Title: String read getTitle write setTitle;
  end;

implementation

function  QMenuBar_Create1(parent: Pointer): Pointer ; cdecl; external fpc_qt5Lib name 'QMenuBar_Create1';
function  QMenuBar_Create2:                  Pointer ; cdecl; external fpc_qt5Lib name 'QMenuBar_Create2';

procedure QMenuBar_Destory (obj: Pointer); cdecl; external fpc_qt5Lib name 'QMenuBar_Destroy';
procedure QMenuBar_show    (obj: Pointer); cdecl; external fpc_qt5Lib name 'QMenuBar_Show';
procedure QMenuBar_hide    (obj: Pointer); cdecl; external fpc_qt5Lib name 'QMenuBar_Hide';

function  QMenu_Create1(title: PChar; parent: QMenuBar): Pointer ; cdecl; external fpc_qt5Lib name 'QMenu_Create1'; overload;
function  QMenu_Create2(title: PChar)                  : Pointer ; cdecl; external fpc_qt5Lib name 'QMenu_Create2'; overload;
function  QMenu_Create3                                : Pointer ; cdecl; external fpc_qt5Lib name 'QMenu_Create3'; overload;

procedure QMenu_setTitle(obj: Pointer; AValue: PChar); cdecl; external fpc_qt5Lib name 'QMenu_SetTitle';
function  QMenu_getTitle(obj: Pointer):        PChar ; cdecl; external fpc_qt5Lib name 'QMenu_GetTitle';

procedure QMenu_Destroy (obj:    Pointer); cdecl; external fpc_qt5Lib name 'QMenu_Destroy';

constructor QMenu.Create(title: PChar; parent: QMenuBar);
begin
  inherited Create;
  writeln('3434');
  FClassPtr := QMenu_Create1(title,@parent);
  writeln('---->');
  setTitle(title);
  writeln('cccccccC');
end;
constructor QMenu.Create(title: PChar);
begin
  inherited Create;
  FClassPtr := QMenu_Create2(title);
end;
constructor QMenu.Create;
begin
  inherited Create;
  FClassPtr := QMenu_Create3;
end;
destructor QMenu.Destroy;
begin
  QMenu_Destroy(FClassPtr);
  inherited Destroy;
end;
// ---------------------------------------------------------------------------
// @brief   setTitle set the title of the menu item.
//
// @param   AValue - String
//          A String that is used for the title
//
// @return  nothing: procedure
//
// @see     getTitle - function
//          Title    - property
//
// @author  paule32
// @since   Version 1.0
// ---------------------------------------------------------------------------
procedure QMenu.setTitle(AValue: String);
begin
  FMenuTitle := AValue;
  QMenu_SetTitle(PChar(AValue),FClassPtr);
end;

// ---------------------------------------------------------------------------
// @brief   getTitle get the title of the menu item.
//
// @param   nothing
//
// @return  String - A String of the menu item.
//
// @see     setTitle - function
//          Title    - property
//
// @author  paule32
// @since   Version 1.0
// ---------------------------------------------------------------------------
function QMenu.getTitle: String;
begin
  result := PChar(QMenu_GetTitle(FClassPtr));
end;

constructor QMenuBar.Create(parent: QWidget);
begin
  inherited Create;
  FClassPtr := QMenuBar_Create1(parent);
  WriteLn('xxxxxxxx');
end;
constructor QMenuBar.Create;
begin
  inherited Create;
  FClassPtr := QMenuBar_Create2;
end;

destructor QMenuBar.Destroy;
begin
  QMenuBar_Destory(FClassPtr);
  inherited Destroy;
end;

procedure QMenuBar.show; begin QMenuBar_show(FClassPtr); end;
procedure QMenuBar.hide; begin QMenuBar_hide(FClassPtr); end;

begin
end.
