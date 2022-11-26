// ---------------------------------------------------------------------------
// File:        test2.pas
// Author:      Jens Kallup - paule32 <kallup-dev@web.de>
// Copyright:   (c) 2022 kallup non-profit
//
// License:     non-profit * only for education, and trial !!!
//              All modifications needs to query to the original author's (me).
//              You can use it at Your school as teacher for education.
//              But commercial usage is not allowed.
// ---------------------------------------------------------------------------
{$mode delphi}
program test2;
uses Classes;

var
  RTL: RTL_class;
  
begin
  RTL := RTL_class.Create;
  RTL.Free;
end.
