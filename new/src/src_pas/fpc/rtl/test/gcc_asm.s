.globl INIT$_$System
INIT$_$System:
ret
.globl INIT$_$FPINTRES
INIT$_$FPINTRES:
ret
.globl INIT$_$OBJPAS
INIT$_$OBJPAS:
ret
.globl INIT$_$SYSTEM
INIT$_$SYSTEM:
ret
.globl FINALIZE$_$OBJPAS
FINALIZE$_$OBJPAS:
ret
.globl THREADVARLIST_$SYSTEM$indirect
THREADVARLIST_$SYSTEM$indirect:
ret
.globl fpc_initializeunits
fpc_initializeunits:
ret
.globl fpc_do_exit
fpc_do_exit:
pushq $1
call ExitProcess
ret
