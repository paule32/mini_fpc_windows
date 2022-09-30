// ----------------------------------------------------------------------------
// File:        QApplication.cc
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
# include "pch.hpp"

BEGIN_NAMESPACE(FPC)
QApplication::QApplication(int argc, char **argv)
{
    ::std::cout << "ctor QApplication ( argc, argv )" << ::std::endl;
    qAppPtr = new ::QApplication(argc,argv);
}
QApplication::~QApplication(void) {
    ::std::cout << "dtor QApplication" << ::std::endl;
}

int QApplication::Execute(void) {
    ::std::cout << "Execute" << ::std::endl;
    
    return qAppPtr->exec();
}
END_NAMESPACE

DLL_EXPORT(void*)
QApplication_Create(int argc, char **argv) {
    FPC::QApplication *ptr = new FPC::QApplication(argc, argv);
    return ptr;
}

DLL_EXPORT(void)
QApplication_Destroy(void *ptr) {
    ::std::cout << "dtor QApplication" << ::std::endl;
    delete static_cast<FPC::QApplication*>(ptr);
}

DLL_EXPORT(int)
QApplication_Execute(void *ptr) {
    return static_cast<FPC::QApplication*>(ptr)->Execute();
}
