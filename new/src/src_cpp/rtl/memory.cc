// ----------------------------------------------------------------------------
// File:        memory.cc
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
# include <stdio.h>
# include <string.h>

# include <windows.h>

void * __gxx_personality_v0   = 0;  // dummy
void * __gxx_personality_seh0 = 0;  // dummy

void * _Unwind_Resume         = 0;  // flummy

static void *newu(size_t size) {
    void *ptr = nullptr;
    ptr = VirtualAlloc(
        NULL,                       // system selects address
        size,                       // the allocated bytes
        MEM_COMMIT | MEM_RESERVE,   // null zero allocation
        PAGE_READWRITE);            // protection type
    return ptr;
}

void *operator new  (size_t size) { return newu(size); }
void *operator new[](size_t size) { return newu(size); }

static void delo(void *ptr, size_t size) {
    if (!VirtualFree(ptr,0,MEM_RELEASE)) {
        MessageBox(NULL,"internal memory release error.","Error",MB_OK);
        ExitProcess( GetLastError() );
    }
}

void operator delete  (void *ptr, size_t size) { delo(ptr,size); }
void operator delete[](void *ptr, size_t size) { delo(ptr,size); }

void operator delete  (void *ptr) { delo(ptr,0); }
void operator delete[](void *ptr) { delo(ptr,0); }
