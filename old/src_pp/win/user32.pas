// ----------------------------------------------------------
// This file is part of RTL.
//
// (c) Copyright 2021, 2022 Jens Kallup - paule32
// only for non-profit usage !!!
// ----------------------------------------------------------
{$mode delphi}
unit user32;

interface

function  WaitMessage: Boolean; stdcall; external 'laz_win.dll' name 'LazWaitMessage';

implementation

// -------------------------------------------------------
// this procedure does nothing.
// it's a dummy for fpc, to make .o file.
// fpc does not create .o bject file, if you have only
// interface "external"s.
// -------------------------------------------------------
procedure dummy;
begin
//  asm
//  call WaitMessage
//  end;
end;

end.
