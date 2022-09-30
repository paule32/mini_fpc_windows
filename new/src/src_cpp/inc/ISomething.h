// ---------------------------------------------------------------------------
// File:        ISomething.h
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
# ifndef ISOMETHING_H_      // C header guard
# define ISOMETHING_H_
# pragma once               // sanity check
# include "pch.hpp"
constexpr REFIID IID_ISomething{
    0x01020305,
    0x0102,
    0x0102,
    0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08};
class ISomething: public IUnknown
{
public:
    ISomething() {
        setClassName(typeid(this).name());
        std::cout << "class: " << ClassName << std::endl;
    }
    void test(void)  { std::cout << "aga tster" << std::endl; }
};

# endif
