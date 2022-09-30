// ---------------------------------------------------------------------------
// File:        test2.pas
// Author:      Jens Kallup - paule32 <kallup-dev@web.de>
// Copyright:   (c) 2022 kallup non-profit
//
// License:     non-profit * only for education, and trial !!!
//              All modifications needs to query to the original author's (me).
//              You can use it at Your school as teacher for education.
//              But commercial usage is not allowed.
//
// Description: This library is a trial usage for simulate the COM technics on
//              differnt OS other than Microsoft's Windows product line.
//              Microsoft use the Registry to store application data during the
//              runtime. We store the information for the actual login session
//              into the available memory.
//
// Warning:     It is not 100% the same, so many aspects have differences.
//              Please sorry for that !
// ---------------------------------------------------------------------------
{$mode delphi}
program test2;
uses WinTypes, kernel32, QtApplication, QtWidget, QtMenu;

type
  MyApplication = class(QApplication)
  private
    FmyWidget: QWidget;
    FmyMenuBar: QMenuBar;
    FmyFileMenu: QMenu;
  public
    constructor Create(argc: Integer; argv: Array of PChar);
    destructor Destroy; override;
  end;

constructor MyApplication.Create(argc: Integer; argv: Array of PChar);
begin
  inherited Create(argc, argv);

  FmyWidget := QWidget.Create;
  FmyWidget.resize(350,250);
  FmyWidget.setWindowTitle(PChar('Example'));
  
  FmyMenuBar := QMenuBar.Create(FmyWidget);
  FmyMenuBar.show;
  
  FmyFileMenu := QMenu.Create('File', FmyMenuBar);
  //FmyFileMenu.show;
  
  FmyWidget.show;
end;

destructor MyApplication.Destroy;
begin
  FmyWidget.Free;
  inherited Destroy;
end;

var
  myApp: MyApplication;
  myArg: Array of PChar;
  
begin
  myApp := MyApplication.Create(ParamCount, myArg);
  myApp.Execute;
  myApp.Free;
end.
