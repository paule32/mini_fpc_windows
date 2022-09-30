// ----------------------------------------------------------------------------
// File:        qtMenu.h
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
#pragma once
#ifndef QT_MENU_MENUBAR_H_
#define QT_MENU_MENUBAR_H_

# include "pch.hpp"

BEGIN_NAMESPACE(FPC)
class QMenuBar;

class QMenu: public QObject {
      QMenu* qMenuParent;
    ::QMenu* qMenuOwner;
public:
      QMenu(::std::string title, FPC::QMenuBar* parent);
      QMenu(::std::string title);
      QMenu();
     ~QMenu();

      QMenu* getParent() const;
    ::QMenu* getOwner () const;

    void          setTitle(::std::string title);
    ::std::string getTitle() const;
    ::std::string    title() const;
};

class QMenuBar: public QObject {
      QWidget*  qMenuBarParent;
    ::QMenuBar* qMenuBarOwner;
public:
      QMenuBar(FPC::QWidget *parent);
      QMenuBar();
     ~QMenuBar();
    
     void show(void);
     void hide(void);

      QWidget*  getParent() const;
    ::QMenuBar* getOwner () const;
   
     void      addMenu(QMenu* menu);
     QMenuBar* getMenuBar() const;
     QMenuBar*    menuBar() const;
};

END_NAMESPACE

#endif
