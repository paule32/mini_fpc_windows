// ---------------------------------------------------------------------------
// File:        modtest.cc
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

using namespace std;

class TInterfacedObject: public ISomething {
public:
    std::function<void()> AfterConstruction  = nullptr;
    std::function<void()> BeforeConstruction = nullptr;
};

// ---------------------------------------------------------------------------
// unit test case class ...
// ---------------------------------------------------------------------------
template <class T, IID intf>
class TMyClass {
public:
    TMyClass() {
        std::cout << "default: ctor" << std::endl;
    }
    TMyClass(std::string &i) {
        std::cout << "end." << std::endl;
    }
};

// ---------------------------------------------------------------------------
// entry point for our test :
// ---------------------------------------------------------------------------
BOOL module_test() {
    try {
        auto *objptr = new TInterfacedObject;
        std::string MyInterfaceID = DEFINE_GUID({
                0x01020304,
                0x0102,
                0x0102,
                0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08},
                objptr);
        TMyClass<TInterfacedObject, IID_IUnknown> intf(MyInterfaceID);

        std::cout << "lolo" << std::endl;
    }
    catch (E_OUTOFMEMORY &e) {
        std::cout << e.what() << std::endl;
        return false;
    }
    catch (exception &e) {
        std::cout << e.what() << std::endl;
        return false;
    }
    catch (...) {
        std::cout << "unknown exception occur." << std::endl;
        return false;
    }   return true ;
}
