// ----------------------------------------------------------
// This file is part of RTL.
//
// (c) Copyright 2021, 2022 Jens Kallup - paule32
// only for non-profit usage !!!
// ----------------------------------------------------------
# include "TTypes.h"
# include <winuser.h>

START_MANGLE
START_WIN_NS

LazBOOL FPC_DLLFUNC(LazWaitMessage,win)(LazVOID)
FPC_BEGIN
	LazBOOL result = ::WaitMessage();
	return  result ;
FPC_END

END_WIN_NS
END_MANGLE
