// ---------------------------------------------------------------------------
// File:        IUnknown.h
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
# ifndef IUNKNOWN_H_     // C header guard
# define IUNKNOWN_H_
# pragma once            // sanity check
# include "windows.h"
// ---------------------------------------------------------------------------
// interface id's - IID :
// ---------------------------------------------------------------------------
constexpr TGUID IID_IUnknown{
    0x01020304,
    0x0102,
    0x0102,
    0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08};
// ---------------------------------------------------------------------------
// @brief  IUnknown: the basis of all Interfaces.
// @author paule32
// ---------------------------------------------------------------------------
class IUnknown: public TObject {
private:
    static DWORD RefCount;
public:
    DWORD QueryInterface(const REFIID id, IUnknown **pptrObject);
    DWORD _AddRef (void);
    DWORD _Release(void);
    
    void ** operator = (void **ptr) {  return ptr;}
    virtual void test(void) ;

    IUnknown(void);
    
public:
    std::string setClassName(const char*);
    DWORD       getRefCount(void);
};

extern std::string DEFINE_GUID(TGUID intf, IUnknown *ptr);

// ---------------------------------------------------------------------------
// GUID operator
// ---------------------------------------------------------------------------
extern BOOL operator == (const REFIID& lhs, const REFIID& rhs);

# endif
