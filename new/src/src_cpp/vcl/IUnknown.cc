// ---------------------------------------------------------------------------
// File:        IUnknown.cc
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
# include "pch.hpp"

# include "ISomething.h"

IUnknown::IUnknown(void) {
    ClassName = setClassName(typeid(this).name());
    std::cout << "class: " << ClassName << std::endl;
}

// ---------------------------------------------------------------------------
// get the class name of the object ...
// ---------------------------------------------------------------------------
std::string IUnknown::setClassName(const char *info)
{
    std::string name(info);
    std::string nopr("#+*-/");
    auto ptr = std::unique_ptr<char, decltype(& std::free)>{
        abi::__cxa_demangle(name.c_str(), nullptr, nullptr, nullptr),
        std::free
    };
    ClassName = ptr.get();
    for (std::string::size_type idx = 0 ; idx < ClassName.length(); idx++) {
         std::string tmp = ClassName;
         for (int ch = 0; ch < nopr.length(); ++ch) {
             if (tmp.data()[idx] == nopr[ch]) {
                 tmp.erase (idx,1);
             }
         }
         ClassName = tmp;
    }    return ClassName;
}
// ---------------------------------------------------------------------------
// the reference counter ...
// ---------------------------------------------------------------------------
DWORD IUnknown::RefCount = 0;
DWORD IUnknown::QueryInterface(const REFIID iid, IUnknown **pptrObject)
{
    std::stringstream ss;
    pptrObject = nullptr;

//    for 
    {
        ss.str(std::string());
        ss << iid.Data1    << iid.Data2
           << iid.Data2
           << iid.Data4[0] << iid.Data4[1]
           << iid.Data4[2] << iid.Data4[3]
           << iid.Data4[4] << iid.Data4[5]
           << iid.Data4[6] << iid.Data4[7] ;
    }

    if (iid == IID_ISomething) {
        std::cout << "8888888" << std::endl;

        auto *pptrObject = new ISomething;
        std::cout << "xxxxx" << std::endl;
        pptrObject->test();
    }

    if (nullptr != pptrObject) {
        std::cout << "00000" << std::endl;
        return _AddRef();
    }   return 0;
}

// ---------------------------------------------------------------------------
// the following map container holds the list of interfaces that are available
// by creating/register a interface.
// ---------------------------------------------------------------------------
std::map<                 // c++ container: std::map
    std::string,          // this is the IID
    IUnknown*             // GUID pointer Object
> IInterfaces;            // interface list holder

// ---------------------------------------------------------------------------
// declare/forms a guid with a name, and add the guid to the interface list:
// IIinterfaces. Since we have no Windows concepts on other platforms, we can
// use plugin .dll or .so code.
// dont forget to compile with -shared -fPIC !
// ---------------------------------------------------------------------------
std::string DEFINE_GUID(TGUID intf, IUnknown *ptr)
{
    if (nullptr == ptr) return nullptr;

    std::stringstream ss;
    ss << intf.Data1 << intf.Data2 <<
          intf.Data2 << intf.Data4 ;

    std::string dat(ss.str(),sizeof(TGUID));

    BOOL found = false;
    std::for_each(IInterfaces.begin(), IInterfaces.end(),
        [&dat, &found](std::pair<std::string, IUnknown*> entry) {
            if (entry.first == dat) {
                found = true;
            }
        });
    if (found == true) {
        std::cout << "GUID already exists."
                  << std::endl;
        return nullptr;
    }

    IInterfaces.insert( std::pair< std::string, IUnknown*>(dat,ptr));

    std::map< std::string, IUnknown*>::iterator it;
    for (it = IInterfaces.begin(); it != IInterfaces.end(); ++it) {
        (*it).second->test();
    }
    ptr;std::cout << "nnottt\n";
    return dat;
}

// ---------------------------------------------------------------------------
// increments the rvmt counter RefCount
// ---------------------------------------------------------------------------
DWORD IUnknown::_AddRef(void) {
    ++RefCount;
    return RefCount;
}

// ---------------------------------------------------------------------------
// decrements the rvmt counter RefCount
// ---------------------------------------------------------------------------
DWORD IUnknown::_Release(void) {
    DWORD result = --RefCount;
    if (0 == result)
    delete this;
    return result;
}

// ---------------------------------------------------------------------------
// get the current RefCount capacity ...
// ---------------------------------------------------------------------------
DWORD IUnknown::getRefCount(void) {
    return RefCount;
}

BOOL operator == (const REFIID& lhs, const REFIID& rhs) {
    if (
    (lhs.Data1 == rhs.Data1) &&
    (lhs.Data2 == rhs.Data2) &&
    (lhs.Data3 == rhs.Data3) &&

    (lhs.Data4[0] == rhs.Data4[0]) && (lhs.Data4[1] == rhs.Data4[1]) &&
    (lhs.Data4[2] == rhs.Data4[2]) && (lhs.Data4[3] == rhs.Data4[3]) &&
    (lhs.Data4[4] == rhs.Data4[4]) && (lhs.Data4[5] == rhs.Data4[5]) &&
    (lhs.Data4[6] == rhs.Data4[6]) && (lhs.Data4[7] == rhs.Data4[7]))
    return true ; else
    return false;
}

void IUnknown::test(void) {
    std::cout << "tessstert" << std::endl;
}
