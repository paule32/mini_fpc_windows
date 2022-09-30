// ----------------------------------------------------------
// This file is part of RTL.
//
// (c) Copyright 2021 Jens Kallup - paule32
// only for non-profit usage !!!
// ----------------------------------------------------------
{$mode delphi}
unit strings;

interface

procedure AnsiStrAssign(var dst: Pointer; src: Pointer); cdecl; external 'laz_rtl.dll' name 'AnsiStrAssign';

procedure ClrScr; cdecl; external 'laz_rtl.dll' name 'LazClrScr';

procedure LazExitProcess(ExitCode: LongInt); cdecl; external 'laz_rtl.dll' name 'LazExitProcess';

function Length(s: Byte                  ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthByte';
function Length(s: Char                  ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthChar';
function Length(s: Word                  ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthWord';
function Length(s: Integer               ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthInteger';

function Length(const s: String          ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthString';
function Length(const s: Array of Char   ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthArrayChar';
function Length(const s: Array of Byte   ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthArrayByte';
function Length(const s: Array of Integer): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthArrayInteger';
function Length(const s: Array of String ): Integer; overload; cdecl; external 'laz_rtl.dll' name 'LengthArrayString';

function LowerCase(const s: String): String ; cdecl; external 'laz_rtl.dll' name 'LowerCase';
function UpperCase(const s: String): String ; cdecl; external 'laz_rtl.dll' name 'UpperCase';

function  ReadLn   : String ; cdecl; external 'laz_rtl.dll' name 'ReadLn';

procedure WriteLn(s: Byte   ); overload; cdecl; external 'laz_rtl.dll' name 'WriteLnByte';
procedure WriteLn(s: Char   ); overload; cdecl; external 'laz_rtl.dll' name 'WriteLnChar';
procedure WriteLn(s: Integer); overload; cdecl; external 'laz_rtl.dll' name 'WriteLnInteger';

procedure WriteLn(s: String ); overload; cdecl; external 'laz_rtl.dll' name 'WriteLnString';

implementation

// -------------------------------------------------------
// this procedure does nothing.
// it's a dummy for fpc, to make .o file.
// fpc does not create .o bject file, if you have only
// interface "external"s.
// -------------------------------------------------------
procedure dummy; begin end;

end.
