// ---------------------------------------------------------------------------
// File:        windows.h
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
# ifndef WINDOWS_H_     // C header guard
# define WINDOWS_H_
# pragma once           // sanity check

// ---------------------------------------------------------------------------
// data types ...
// ---------------------------------------------------------------------------
typedef uint8_t   BYTE;
typedef uint16_t  WORD;
typedef uint32_t DWORD;

// ---------------------------------------------------------------------------
// ms-windows data types ...
// ---------------------------------------------------------------------------
typedef DWORD*    PDWORD;
typedef DWORD     LONG  ;
typedef LONG *    PLONG ;
typedef void *    LPVOID;

struct  HINSTANCE__ { DWORD unused; };
typedef HINSTANCE__ * HINSTANCE;
typedef HINSTANCE     HMODULE;

constexpr int DLL_PROCESS_ATTACH = 1;
constexpr int DLL_THREAD_ATTACH  = 2;
constexpr int DLL_THREAD_DETACH  = 3;
constexpr int DLL_PROCESS_DETACH = 0;

// ---------------------------------------------------------------------------
// strict BYTE boolean:
// ---------------------------------------------------------------------------
typedef BYTE      BOOL;

// ---------------------------------------------------------------------------
// a GUID is a 128-bit integer that is virtually guranteed
// to be unique accross space, and time. This integer can be
// assigned to any element of COM that requires a unique
// identidy.
// For each type of COM element, the GUID is referred to by
// a more appropriate term.
// Below, a COM Elements List that require GUID's
// ------------+-----------------------
// Interface   | Interface   ID (IID)
// COM Class   | Class       ID (CLSID)
// Category    | Category    ID (CATID)
// Application | Application ID (APPID)
// Data Format | Format      ID (FMTID)
// ---------------------------------------------------------------------------
typedef struct _GUID {
    DWORD Data1;
    WORD  Data2;
    WORD  Data3;
    BYTE  Data4[8];
} GUID;

// ---------------------------------------------------------------------------
// derivated GUID declaration's ...
// ---------------------------------------------------------------------------
typedef GUID TGUID;

typedef TGUID IID;
typedef TGUID CLSIID;
typedef TGUID REFIID;
typedef TGUID REFCLSIID;

# endif