// ---------------------------------------------------------------------------
// File:        kernel32.pas
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
unit kernel32;

interface
uses WinTypes;
// ---------------------------------------------------------------------------
// kernel32 stuff:
// ---------------------------------------------------------------------------
const kernel32_dll = 'kernel32.dll';

function  LoadLibrary  (lpLibFileName: PChar): HMODULE; stdcall; external kernel32_dll name 'LoadLibraryA';
function  LoadLibraryA (lpLibFileName: PChar): HMODULE; stdcall; external kernel32_dll name 'LoadLibraryA';
function  LoadLibraryW (lpLibFileName: PChar): HMODULE; stdcall; external kernel32_dll name 'LoadLibraryW';

procedure ExitProcess(ACode: DWORD); stdcall; external kernel32_dll name 'ExitProcess';
function  FreeLibrary(ALibModule: HMODULE): ByteBool; stdcall; external 'kernel32.dll' name 'FreeLibrary';

implementation
begin
end.
