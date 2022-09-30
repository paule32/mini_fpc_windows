// ---------------------------------------------------------------------------
// File:        dll_main.cc
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
# define HDR_WINDOWS
# define HDR_LIBCC
# define HDR_EXCEPTION
# define HDR_TCLASS
# define HDR_TOBJECT

# define HDR_IUNKNOWN
# include "pch.hpp"

using namespace std;

extern void module_test(void);
static BOOL library_is_initialized = false;

// ---------------------------------------------------------------------------
// this member function must be visible in the library .def file:
// DllGetClassObject PRIVATE
// ---------------------------------------------------------------------------
extern "C" DWORD DllGetClassObject(REFCLSIID rciid, REFIID riid, IUnknown **ppv)
{
    static IUnknown *g_ptr = nullptr;

    if (nullptr == g_ptr) {
        g_ptr = new IUnknown;
        if (nullptr == g_ptr) {
            throw new E_OUTOFMEMORY;
        }
        // -----------------------
        // keep the pointer alive
        // for server lifetime
        // -----------------------
        g_ptr->_AddRef();
    }
    DWORD res = g_ptr->QueryInterface(riid, ppv);
    return res;
}

extern "C" BOOL
__declspec(dllexport)
#if defined(WINDOWS) || defined(__WIN64) || defined(__MINGW64__)
DllMain(
    HINSTANCE hinstDLL,     // handle to DLL module
    DWORD     fdwReason,    // reason for calling function
    LPVOID    lpvReserved)  // reserved
#else
DLL_init()
#endif
    {
    switch (fdwReason) {
        case DLL_PROCESS_ATTACH: {
            std::cout << "attach" << std::endl;
            library_is_initialized = true;
            module_test();
        }
        break;
        case DLL_THREAD_ATTACH:
        break;
        case DLL_THREAD_DETACH:
        break;
        case DLL_PROCESS_DETACH: {
            std::cout << "detach" << std::endl;
            library_is_initialized = false;
        }
        break;
    }
    return true;
}

BOOL check_initialize_library(void){
    if (library_is_initialized)
    return true ; else
    return false;        
}
