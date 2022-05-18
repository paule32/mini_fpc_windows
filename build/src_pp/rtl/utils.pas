// ----------------------------------------------------------
// This file is part of RTL.
//
// (c) Copyright 2022 Jens Kallup - paule32
// only for non-profit usage !!!
// ----------------------------------------------------------
{$mode delphi}
{$calling cdecl}
unit utils;

interface

function High(b: Byte): Byte; stdcall; export;
function Low (b: Byte): Byte; stdcall; export;

implementation

function High(b: Byte): Byte; begin result := b shr   4; end;
function Low (b: Byte): Byte; begin result := b and $0f; end;

end.
