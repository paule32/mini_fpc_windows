// ----------------------------------------------------------------------------
// File:        QtGlobal.pas
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
{$mode delphi}{$H+}
{$typedaddress on}
unit QtGlobal;

interface

{$IFDEF WINDOWS}
const fpc_qt5Lib = 'qt5_fpc.dll';
{$ELSE}
const fpc_qt5Lib = 'qt5_fpc.so';
{$ENDIF}

type
  ByteBool  = False..Boolean(255);
  bool      = ByteBool;

implementation

begin
end.
