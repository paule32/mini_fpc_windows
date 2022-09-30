// ---------------------------------------------------------------------------
// File:        pch.hpp
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
# ifndef PCH_H_  // C header guard
# define PCH_H_

# ifdef __MINGW64__
# if !defined(__GNUC__) || !defined(__GNUG__)
#   error "No GNU C++ Compiler available."
# else
#   if !(__GNUG__ >= 7)
#     error "You need G++ Version > 7.0.0"
#   endif
# endif
# else
#   error "This Library supported only under MingW-64 !!!"
# endif

# pragma once        // sanity check

// ---------------------------------------------------------------------------
// ansi std. c++ proto type header's ...
// ---------------------------------------------------------------------------
# include <cxxabi.h>
# include <iostream>
# include <cstdint>
# include <string>
# include <sstream>
# include <algorithm>
# include <functional>
# include <vector>
# include <map>
# include <memory>
# include <exception>
# include <typeinfo>

// ---------------------------------------------------------------------------
// ansi std. c proto type header's ...
// ---------------------------------------------------------------------------
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <stdint.h>

// ---------------------------------------------------------------------------
// library qt5 proto type header's ...
// ---------------------------------------------------------------------------
# include <QObject>
# include <QString>
# include <QApplication>
# include <QWidget>
# include <QMenuBar>

// ---------------------------------------------------------------------------
// library c++ proto type header's ...
// ---------------------------------------------------------------------------
# include <windows.h>
# include <TException.h>
# include <TClass.h>
# include <TObject.h>
# include <IUnknown.h>

namespace FPC {
struct QDummy { };
}

# include "qtGlobal.h"
# include "qtObject.h"
# include "qtApplication.h"
# include "qtWidget.h"
# include "qtMenu.h"

# endif
