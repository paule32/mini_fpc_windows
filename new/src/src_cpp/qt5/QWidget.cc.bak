// ----------------------------------------------------------------------------
// File:        QWidget.cc
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
QWidget::QWidget(void)
{
    ::std::cout << "ctor QWidget" << ::std::endl;
    qWidgetPtr = new ::QWidget();
}
QWidget::~QWidget(void) {
    ::std::cout << "dtor QWidget" << ::std::endl;
}

void QWidget::resize(int width, int height){
    qWidgetPtr->resize(width,height);
}
void QWidget::setWindowTitle(std::string title){
    qWidgetPtr->setWindowTitle(title.c_str());
}
void QWidget::show(void){
    qWidgetPtr->show();
}
END_NAMESPACE


DLL_EXPORT(void*)
QWidget_Create(){
    FPC::QWidget *ptr = new FPC::QWidget();
    return ptr;
}

DLL_EXPORT(void)
QWidget_Destroy(void *ptr){
    if (ptr != nullptr)
    delete static_cast<FPC::QWidget*>(ptr);
}

DLL_EXPORT(void)
QWidget_resize(void *ptr, int width, int height){
    static_cast<FPC::QWidget*>(ptr)->resize(width, height);
}

DLL_EXPORT(void)
QWidget_setWindowTitle(void *ptr, char *title){
    static_cast<FPC::QWidget*>(ptr)->setWindowTitle(std::string(title));
}

DLL_EXPORT(void)
QWidget_show(void *ptr){
    static_cast<FPC::QWidget*>(ptr)->show();
}
