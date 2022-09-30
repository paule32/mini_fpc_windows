// ---------------------------------------------------------------------------
// File:        TClass.h
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
# ifndef TCLASS_H_     // C header guard
# define TCLASS_H_
# pragma once           // sanity check

# define HDR_LIBCC
# undef  HDR_TCLASS

# include "pch.hpp"

class TClass {
public:
    std::string    ClassName;
    BOOL           ClassNameIs(std::string);
    TClass       * ClassParent;
    TClass       * ClassType;
    TClass       * ClassInfo;
public:
    TClass();
};

# endif