	.file "test1.pas"

.section .text.n_p$test1_$$_fin$00000003,"x"
	.balign 16,0x90
P$TEST1_$$_fin$00000003:
	pushq	%rbp
	movq	%rcx,%rbp
	leaq	-32(%rsp),%rsp
	leaq	-8(%rbp),%rcx
	call	fpc_ansistr_decr_ref
	nop
	leaq	32(%rsp),%rsp
	popq	%rbp
	ret

.section .text.n_main,"x"
	.balign 16,0x90
.globl	PASCALMAIN
PASCALMAIN:
.globl	main
main:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-48(%rsp),%rsp
	movq	$0,-8(%rbp)
.Lj13:
	nop
.Lj9:
	nop
	leaq	U_$P$TEST1_$$_S(%rip),%rax
	leaq	.Ld1(%rip),%rdx
	movq	%rax,%rcx
	call	fpc_ansistr_assign
	nop
	movq	U_$P$TEST1_$$_S(%rip),%rcx
	call	_$dll$laz_rtl$LengthString
	movswl	%ax,%ecx
	call	_$dll$laz_rtl$WriteLnInteger
	leaq	.Ld2(%rip),%rcx
	call	_$dll$laz_rtl$WriteLnString
	leaq	-8(%rbp),%rcx
	call	_$dll$laz_rtl$ReadLn
	leaq	-8(%rbp),%rcx
	call	fpc_ansistr_decr_ref
	movl	$1,%ecx
	call	_$dll$laz_rtl$LazExitProcess
	nop
.Lj14:
	nop
.Lj10:
	movq	%rbp,%rcx
	call	P$TEST1_$$_fin$00000003
movl $0, %ecx
movq __imp_ExitProcess(%rip), %rax
call *%rax
	nop
	leaq	(%rbp),%rsp
	popq	%rbp
	ret
	.long	1
	.long	0
	.rva	.Lj9
	.rva	.Lj10
	.rva	P$TEST1_$$_fin$00000003

.section .text.n_main,"x"

.section .text.n_p$test1_$$_init_implicit$,"x"
	.balign 16,0x90
.globl	INIT$_$P$TEST1
INIT$_$P$TEST1:
.globl	P$TEST1_$$_init_implicit$
P$TEST1_$$_init_implicit$:
	leaq	-40(%rsp),%rsp
	nop
	leaq	40(%rsp),%rsp
	ret

.section .text.n_p$test1_$$_finalize_implicit$,"x"
	.balign 16,0x90
.globl	PASCALFINALIZE
PASCALFINALIZE:
.globl	FINALIZE$_$P$TEST1
FINALIZE$_$P$TEST1:
.globl	P$TEST1_$$_finalize_implicit$
P$TEST1_$$_finalize_implicit$:
	pushq	%rbp
	movq	%rsp,%rbp
	leaq	-32(%rsp),%rsp
	leaq	U_$P$TEST1_$$_S(%rip),%rcx
	call	fpc_ansistr_decr_ref
	nop
	leaq	(%rbp),%rsp
	popq	%rbp
	ret

.Ld1:
	.ascii	"hallo xxl \000"

.Ld2:
	.ascii	"meerjung\000"

