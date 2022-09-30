// ----------------------------------------------------------------------------
// File:        utils.cc
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

#if 0
void* check_pointer(void *ptr) {
    for (auto& element : FPC::qtContainer) {
        if (element == ptr) {
            std::cout << "errrrrr" << std::endl;
            return ptr;
        }
    }
    return nullptr;
}
void* get_pointer(void *ptr) {
    void *pc = check_pointer(ptr);
    return pc;
}
#endif
