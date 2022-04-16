	.file "strings.pas"
# Begin asmlist al_procedures

.section .text.n_strings_$$_dummy,"x"
	.balign 16,0x90
STRINGS_$$_DUMMY:
.Lc1:
# [strings.pas]
# [46] procedure dummy; begin end;
	ret
.Lc2:
# End asmlist al_procedures
# Begin asmlist al_rtti

.section .rodata.n_RTTI_$STRINGS_$$_def00000022,"d"
	.balign 8
.globl	RTTI_$STRINGS_$$_def00000022
RTTI_$STRINGS_$$_def00000022:
	.byte	12,10
# [49] 
	.ascii	"AnsiString"
	.quad	0,0
	.quad	RTTI_$SYSTEM_$$_ANSISTRING$indirect
	.byte	1
	.quad	RTTI_$SYSTEM_$$_INT64$indirect
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .rodata.n_RTTI_$STRINGS_$$_def00000022,"d"
	.balign 8
.globl	RTTI_$STRINGS_$$_def00000022$indirect
RTTI_$STRINGS_$$_def00000022$indirect:
	.quad	RTTI_$STRINGS_$$_def00000022
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc3:
	.long	.Lc5-.Lc4
.Lc4:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc5:
	.long	.Lc7-.Lc6
.Lc6:
	.secrel32	.Lc3
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.balign 4,0
.Lc7:
# End asmlist al_dwarf_frame

