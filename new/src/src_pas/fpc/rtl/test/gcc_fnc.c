#include <stdio.h>
#include <stdlib.h>
#include <strings.h>

#ifdef WINDOWS
#include <windows.h>
# define doExit(x) ExitProcess(x);
#else
# define doExit(x) exit(x);
#endif

//void fpc_initializeunits() { }
//void fpc_do_exit() { doExit(1); }
