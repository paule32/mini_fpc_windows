	.file	"strings.cc"
	.text
	.p2align 4
itoa.part.0:
.LFB6256:
	pushq	%rsi
	pushq	%rbx
	movq	%rdx, %r9
	movl	%ecx, %edx
	movl	%ecx, %eax
	shrl	$31, %edx
	cmpl	$10, %r8d
	movq	%r9, %r11
	sete	%sil
	negl	%ecx
	andb	%dl, %sil
	cmovne	%ecx, %eax
	xorl	%ecx, %ecx
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%edx, %ecx
.L5:
	cltd
	idivl	%r8d
	cmpl	$10, %edx
	leal	87(%rdx), %ebx
	leal	48(%rdx), %r10d
	cmovge	%ebx, %r10d
	leal	1(%rcx), %edx
	addq	$1, %r11
	movb	%r10b, -1(%r11)
	testl	%eax, %eax
	jne	.L10
	movslq	%edx, %rax
	addq	%r9, %rax
	testb	%sil, %sil
	je	.L6
	movb	$45, (%rax)
	leal	2(%rcx), %eax
	movl	%edx, %ecx
	cltq
	movb	$0, (%r9,%rax)
.L7:
	movslq	%ecx, %rax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L9:
	movzbl	(%r9,%rdx), %ecx
	movzbl	(%r9,%rax), %r8d
	movb	%r8b, (%r9,%rdx)
	addq	$1, %rdx
	movb	%cl, (%r9,%rax)
	subq	$1, %rax
	cmpl	%edx, %eax
	jg	.L9
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movb	$0, (%rax)
	testl	%ecx, %ecx
	jne	.L7
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LazExitProcess
_$dll$laz_rtl$LazExitProcess:
.LFB6217:
	subq	$40, %rsp
	call	*__imp_ExitProcess(%rip)
	nop
	.p2align 4
	.globl	LAZEXITPROCEDURE
LAZEXITPROCEDURE:
.LFB6218:
	subq	$40, %rsp
	call	*__imp_ExitProcess(%rip)
	nop
	.section .rdata,"dr"
.LC0:
	.ascii "Error\0"
.LC1:
	.ascii "string is too long\0"
	.text
	.p2align 4
	.globl	CopyPascalString2PChar
CopyPascalString2PChar:
.LFB6219:
	subq	$40, %rsp
	call	strlen
	cmpq	$255, %rax
	ja	.L19
	movl	$255, %ecx
	addq	$40, %rsp
	jmp	_Znay
.L19:
	xorl	%ecx, %ecx
	xorl	%r9d, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC1(%rip), %rdx
	call	*__imp_MessageBoxA(%rip)
	call	*__imp_GetLastError(%rip)
	movl	%eax, %ecx
	call	*__imp_ExitProcess(%rip)
	nop
	.p2align 4
	.globl	reverse
reverse:
.LFB6220:
	subl	$1, %edx
	testl	%edx, %edx
	jle	.L20
	movslq	%edx, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L22:
	movzbl	(%rcx,%rax), %r8d
	movzbl	(%rcx,%rdx), %r9d
	movb	%r9b, (%rcx,%rax)
	addq	$1, %rax
	movb	%r8b, (%rcx,%rdx)
	subq	$1, %rdx
	cmpl	%edx, %eax
	jl	.L22
.L20:
	ret
	.p2align 4
	.globl	itoa
itoa:
.LFB6221:
	pushq	%r12
	subq	$32, %rsp
	movq	%rdx, %r12
	testl	%ecx, %ecx
	je	.L27
	call	itoa.part.0
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	movl	$48, %eax
	movw	%ax, (%rdx)
	movq	%r12, %rax
	addq	$32, %rsp
	popq	%r12
	ret
	.p2align 4
	.globl	atoi
atoi:
.LFB6222:
	movsbl	(%rcx), %eax
	testb	%al, %al
	je	.L31
	addq	$1, %rcx
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L30:
	leal	(%r8,%r8,4), %edx
	addq	$1, %rcx
	leal	-48(%rax,%rdx,2), %r8d
	movsbl	-1(%rcx), %eax
	testb	%al, %al
	jne	.L30
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.p2align 4
	.globl	isspace
isspace:
.LFB6223:
	xorl	%eax, %eax
	cmpb	$32, %cl
	ja	.L33
	movabsq	$4294979328, %rax
	shrq	%cl, %rax
	andl	$1, %eax
.L33:
	ret
	.p2align 4
	.globl	strcpy
strcpy:
.LFB6224:
	xorl	%eax, %eax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	.p2align 4,,10
	.p2align 3
.L37:
	movzbl	(%rcx,%rax), %edx
	movb	%dl, (%r8,%rax)
	addq	$1, %rax
	testb	%dl, %dl
	jne	.L37
	movq	%r8, %rax
	ret
	.p2align 4
	.globl	strncpy
strncpy:
.LFB6225:
	movq	%rcx, %r9
	testq	%r8, %r8
	je	.L40
	addq	%rcx, %r8
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L42:
	movzbl	(%rdx), %ecx
	cmpb	$1, %cl
	movb	%cl, (%rax)
	sbbq	$-1, %rdx
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L42
.L40:
	movq	%r9, %rax
	ret
	.p2align 4
	.globl	strlcpy
strlcpy:
.LFB6226:
	pushq	%r13
	pushq	%r12
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rcx
	movq	%rdx, %r13
	movq	%r8, %rbx
	call	strlen
	movq	%rax, %r12
	testq	%rbx, %rbx
	je	.L49
	leaq	-1(%rbx), %r8
	cmpq	%rbx, %rax
	movq	%r13, %rdx
	movq	%rsi, %rcx
	movq	%r8, %rbx
	cmovb	%rax, %rbx
	movq	%rbx, %r8
	call	_Z9LazMemCpyPvPKvy
	movb	$0, (%rsi,%rbx)
.L49:
	movq	%r12, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	popq	%r13
	ret
	.p2align 4
	.globl	strcat
strcat:
.LFB6227:
	cmpb	$0, (%rcx)
	movq	%rdx, %r8
	movq	%rcx, %r9
	movq	%rcx, %rdx
	je	.L57
	.p2align 4,,10
	.p2align 3
.L58:
	addq	$1, %rdx
	cmpb	$0, (%rdx)
	jne	.L58
.L57:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L59:
	movzbl	(%r8,%rax), %ecx
	movb	%cl, (%rdx,%rax)
	addq	$1, %rax
	testb	%cl, %cl
	jne	.L59
	movq	%r9, %rax
	ret
	.p2align 4
	.globl	strncat
strncat:
.LFB6228:
	movq	%rcx, %r9
	testq	%r8, %r8
	je	.L65
	cmpb	$0, (%rcx)
	movq	%rcx, %rax
	je	.L66
	.p2align 4,,10
	.p2align 3
.L67:
	addq	$1, %rax
	cmpb	$0, (%rax)
	jne	.L67
.L66:
	addq	%rax, %r8
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L77:
	cmpq	%r8, %rax
	je	.L76
.L69:
	movzbl	(%rdx), %ecx
	addq	$1, %rdx
	addq	$1, %rax
	movb	%cl, -1(%rax)
	testb	%cl, %cl
	jne	.L77
.L65:
	movq	%r9, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	movb	$0, (%rax)
	movq	%r9, %rax
	ret
	.p2align 4
	.globl	strncmp
strncmp:
.LFB6229:
	movq	%rdx, %r9
	testq	%r8, %r8
	je	.L84
	xorl	%eax, %eax
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L80:
	testb	%dl, %dl
	je	.L84
	addq	$1, %rax
	cmpq	%r8, %rax
	je	.L84
.L81:
	movzbl	(%rcx,%rax), %edx
	cmpb	(%r9,%rax), %dl
	je	.L80
	sbbl	%eax, %eax
	orl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	strcmp
strcmp:
.LFB6230:
	xorl	%eax, %eax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L87:
	addq	$1, %rax
	testb	%dl, %dl
	je	.L92
.L89:
	movzbl	(%r8,%rax), %edx
	cmpb	(%rcx,%rax), %dl
	je	.L87
	sbbl	%eax, %eax
	orl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L92:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	strchr
strchr:
.LFB6231:
	movzbl	(%rcx), %eax
	cmpb	%dl, %al
	jne	.L95
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L99:
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	cmpb	%dl, %al
	je	.L96
.L95:
	testb	%al, %al
	jne	.L99
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%rcx, %rax
	ret
	.p2align 4
	.globl	skip_spaces
skip_spaces:
.LFB6232:
	movq	%rcx, %rax
	movabsq	$4294979328, %rcx
	movzbl	(%rax), %edx
	cmpb	$32, %dl
	ja	.L100
	.p2align 4,,10
	.p2align 3
.L104:
	btq	%rdx, %rcx
	jnc	.L100
	movzbl	1(%rax), %edx
	addq	$1, %rax
	cmpb	$32, %dl
	jbe	.L104
.L100:
	ret
	.p2align 4
	.globl	strim
strim:
.LFB6233:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	call	strlen
	movq	%rax, %rdx
	movq	%rbx, %rax
	testq	%rdx, %rdx
	je	.L105
	leaq	-1(%rbx,%rdx), %rax
	cmpq	%rax, %rbx
	ja	.L107
	movabsq	$4294979328, %rcx
	.p2align 4,,10
	.p2align 3
.L108:
	movzbl	(%rax), %edx
	cmpb	$32, %dl
	jbe	.L113
.L107:
	movabsq	$4294979328, %rcx
	movb	$0, 1(%rax)
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L109:
	movzbl	(%rax), %edx
	cmpb	$32, %dl
	jbe	.L114
.L105:
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L114:
	btq	%rdx, %rcx
	jnc	.L105
	addq	$1, %rax
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L113:
	btq	%rdx, %rcx
	jnc	.L107
	subq	$1, %rax
	cmpq	%rax, %rbx
	jbe	.L108
	jmp	.L107
	.p2align 4
	.globl	strlen
strlen:
.LFB6234:
	cmpb	$0, (%rcx)
	je	.L118
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L117:
	addq	$1, %rax
	cmpb	$0, (%rax)
	jne	.L117
	subq	%rcx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	strnlen
strnlen:
.LFB6235:
	testq	%rdx, %rdx
	je	.L124
	addq	%rcx, %rdx
	movq	%rcx, %rax
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L122:
	addq	$1, %rax
	cmpq	%rax, %rdx
	je	.L127
.L123:
	cmpb	$0, (%rax)
	jne	.L122
	subq	%rcx, %rax
.L120:
	ret
	.p2align 4,,10
	.p2align 3
.L127:
	movq	%rdx, %rax
	subq	%rcx, %rax
	jmp	.L120
.L124:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	strreplace
strreplace:
.LFB6236:
	movq	%rcx, %rax
	movl	%edx, %ecx
	movzbl	(%rax), %edx
	testb	%dl, %dl
	je	.L129
	.p2align 4,,10
	.p2align 3
.L131:
	cmpb	%dl, %cl
	jne	.L130
	movb	%r8b, (%rax)
.L130:
	movzbl	1(%rax), %edx
	addq	$1, %rax
	testb	%dl, %dl
	jne	.L131
.L129:
	ret
	.section .rdata,"dr"
.LC2:
	.ascii "Warning\0"
	.align 8
.LC3:
	.ascii "No terminal open.\12Do you want open a CRT Terminal ?\0"
	.text
	.p2align 4
	.globl	check_console
check_console:
.LFB6237:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movl	24+LazTerminal(%rip), %eax
	testl	%eax, %eax
	jne	.L137
	xorl	%ecx, %ecx
	movl	$73764, %r9d
	leaq	.LC2(%rip), %r8
	leaq	.LC3(%rip), %rdx
	call	*__imp_MessageBoxA(%rip)
	cmpl	$7, %eax
	je	.L138
.L137:
	call	*__imp_AllocConsole(%rip)
	movq	__imp_GetStdHandle(%rip), %rsi
	movl	$-11, %ecx
	call	*%rsi
	movq	__imp_GetLastError(%rip), %rbx
	movq	%rax, LazTerminal(%rip)
	call	*%rbx
	movl	$-10, %ecx
	call	*%rsi
	movq	%rax, 8+LazTerminal(%rip)
	call	*%rbx
	movl	$-12, %ecx
	call	*%rsi
	movq	%rax, 16+LazTerminal(%rip)
	call	*%rbx
	movl	$-1, %ecx
	call	*__imp_AttachConsole(%rip)
	movl	$1, 24+LazTerminal(%rip)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L138:
	call	*__imp_GetLastError(%rip)
	movl	%eax, %ecx
	call	*__imp_ExitProcess(%rip)
	nop
	.p2align 4
WriteLnHelper:
.LFB6239:
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$64, %rsp
	movl	%ecx, %r13d
	call	check_console
	movl	$100, %ecx
	call	_Znay
	movq	%rax, %r12
	testl	%r13d, %r13d
	je	.L146
	movl	$10, %r8d
	movq	%rax, %rdx
	movl	%r13d, %ecx
	call	itoa.part.0
	movq	%r12, %rcx
	call	strim
	cmpb	$0, (%rax)
	je	.L144
.L147:
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L143:
	addq	$1, %r8
	cmpb	$0, (%r8)
	jne	.L143
	movl	%r8d, %ebx
	subl	%eax, %ebx
.L142:
	movq	%r12, %rcx
	call	strim
	leaq	56(%rsp), %r9
	movl	%ebx, %r8d
	movq	$0, 32(%rsp)
	movq	__imp_WriteConsoleA(%rip), %rbx
	movq	LazTerminal(%rip), %rcx
	movq	%rax, %rdx
	call	*%rbx
	movl	$10, %eax
	leaq	54(%rsp), %rdx
	leaq	60(%rsp), %r9
	movl	$1, %r8d
	movw	%ax, 54(%rsp)
	movq	LazTerminal(%rip), %rcx
	movq	$0, 32(%rsp)
	call	*%rbx
	movl	$1, %edx
	movq	%r12, %rcx
	call	_ZdlPvy
	nop
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L146:
	movl	$48, %edx
	movq	%r12, %rcx
	movw	%dx, (%rax)
	call	strim
	cmpb	$0, (%rax)
	jne	.L147
.L144:
	xorl	%ebx, %ebx
	jmp	.L142
	.p2align 4
	.globl	_$dll$laz_rtl$WriteLnString
_$dll$laz_rtl$WriteLnString:
.LFB6240:
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, %r12
	call	check_console
	movq	%r12, %rcx
	call	strim
	cmpb	$0, (%rax)
	je	.L151
	movq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L150:
	addq	$1, %r8
	cmpb	$0, (%r8)
	jne	.L150
	subq	%rax, %r8
	movzbl	%r8b, %ebx
.L149:
	movq	%r12, %rcx
	call	strim
	leaq	56(%rsp), %r9
	movl	%ebx, %r8d
	movq	$0, 32(%rsp)
	movq	__imp_WriteConsoleA(%rip), %rbx
	movq	LazTerminal(%rip), %rcx
	movq	%rax, %rdx
	call	*%rbx
	movq	LazTerminal(%rip), %rcx
	movl	$10, %eax
	movq	$0, 32(%rsp)
	movw	%ax, 54(%rsp)
	leaq	54(%rsp), %rdx
	leaq	60(%rsp), %r9
	movl	$1, %r8d
	call	*%rbx
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L151:
	xorl	%ebx, %ebx
	jmp	.L149
	.p2align 4
	.globl	_$dll$laz_rtl$WriteLnByte
_$dll$laz_rtl$WriteLnByte:
.LFB6241:
	movzbl	%cl, %ecx
	jmp	WriteLnHelper
	.p2align 4
	.globl	_$dll$laz_rtl$WriteLnChar
_$dll$laz_rtl$WriteLnChar:
.LFB6242:
	movsbl	%cl, %ecx
	jmp	WriteLnHelper
	.p2align 4
	.globl	_$dll$laz_rtl$WriteLnWord
_$dll$laz_rtl$WriteLnWord:
.LFB6258:
	movsbl	%cl, %ecx
	jmp	WriteLnHelper
	.p2align 4
	.globl	_$dll$laz_rtl$WriteLnInteger
_$dll$laz_rtl$WriteLnInteger:
.LFB6244:
	jmp	WriteLnHelper
	.p2align 4
	.globl	MouseEventProc
MouseEventProc:
.LFB6245:
	ret
	.section .rdata,"dr"
.LC4:
	.ascii "--> %d, %c\12\0"
.LC5:
	.ascii "Info\0"
.LC6:
	.ascii "numerisch\0"
.LC7:
	.ascii "alpha\0"
	.text
	.p2align 4
	.globl	KeyEventProc
KeyEventProc:
.LFB6246:
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	movdqu	(%rcx), %xmm0
	movd	%xmm0, %eax
	testl	%eax, %eax
	jne	.L169
.L158:
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L169:
	pextrw	$3, %xmm0, %ebx
	leaq	64(%rsp), %r12
	leaq	.LC4(%rip), %rdx
	movzwl	%bx, %r8d
	movq	%r12, %rcx
	movl	%r8d, %r9d
	call	*__imp_wsprintfA(%rip)
	cmpb	$0, 64(%rsp)
	je	.L164
	movq	%r12, %r8
	.p2align 4,,10
	.p2align 3
.L161:
	addq	$1, %r8
	cmpb	$0, (%r8)
	jne	.L161
	subl	%r12d, %r8d
.L160:
	movq	LazTerminal(%rip), %rcx
	leaq	60(%rsp), %r9
	movq	%r12, %rdx
	movq	$0, 32(%rsp)
	call	*__imp_WriteConsoleA(%rip)
	leal	-48(%rbx), %eax
	cmpw	$9, %ax
	jbe	.L170
	subl	$65, %ebx
	cmpw	$25, %bx
	ja	.L158
	xorl	%r9d, %r9d
	leaq	.LC5(%rip), %r8
	leaq	.LC7(%rip), %rdx
	xorl	%ecx, %ecx
	call	*__imp_MessageBoxA(%rip)
	nop
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L170:
	xorl	%r9d, %r9d
	leaq	.LC5(%rip), %r8
	leaq	.LC6(%rip), %rdx
	xorl	%ecx, %ecx
	call	*__imp_MessageBoxA(%rip)
	nop
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L164:
	xorl	%r8d, %r8d
	jmp	.L160
	.p2align 4
	.globl	ResizeEventProc
ResizeEventProc:
.LFB6247:
	ret
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Terminal operation set READ mode denied.\12Can't get the input handle !\0"
	.align 8
.LC9:
	.ascii "Terminal operation READ denied.\12Can't get the input handle !\0"
.LC10:
	.ascii "\0"
	.text
	.p2align 4
	.globl	_$dll$laz_rtl$ReadLn
_$dll$laz_rtl$ReadLn:
.LFB6248:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$2632, %rsp
	call	check_console
	movl	$255, %ecx
	call	_Znay
	movq	8+LazTerminal(%rip), %rcx
	movl	$24, %edx
	movq	$0, 40+LazTerminal(%rip)
	movq	%rax, 32+LazTerminal(%rip)
	call	*__imp_SetConsoleMode(%rip)
	testl	%eax, %eax
	je	.L189
	movl	$101, %ebp
	leaq	60(%rsp), %r14
	movq	__imp_ReadConsoleInputA(%rip), %r13
	leaq	64(%rsp), %r12
	leaq	.L179(%rip), %r15
	leaq	32(%rsp), %rdi
	.p2align 4,,10
	.p2align 3
.L173:
	movq	8+LazTerminal(%rip), %rcx
	movq	%r14, %r9
	movl	$128, %r8d
	movq	%r12, %rdx
	call	*%r13
	testl	%eax, %eax
	je	.L190
	movl	60(%rsp), %eax
	movq	%r12, %rbx
	xorl	%esi, %esi
	testl	%eax, %eax
	je	.L181
	.p2align 4,,10
	.p2align 3
.L182:
	cmpw	$16, (%rbx)
	ja	.L188
	movzwl	(%rbx), %eax
	movslq	(%r15,%rax,4), %rax
	addq	%r15, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L179:
	.long	.L188-.L179
	.long	.L180-.L179
	.long	.L178-.L179
	.long	.L188-.L179
	.long	.L178-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L178-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L188-.L179
	.long	.L178-.L179
	.text
	.p2align 4,,10
	.p2align 3
.L180:
	movl	%esi, %eax
	movq	%rdi, %rcx
	leaq	(%rax,%rax,4), %rax
	movdqu	68(%rsp,%rax,4), %xmm0
	movaps	%xmm0, 32(%rsp)
	call	KeyEventProc
.L178:
	addl	$1, %esi
	addq	$20, %rbx
	cmpl	%esi, 60(%rsp)
	ja	.L182
.L181:
	subl	$1, %ebp
	jne	.L173
	leaq	.LC10(%rip), %rax
	addq	$2632, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L190:
	xorl	%r9d, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC9(%rip), %rdx
.L187:
	xorl	%ecx, %ecx
	call	*__imp_MessageBoxA(%rip)
	.p2align 4,,10
	.p2align 3
.L188:
	call	*__imp_GetLastError(%rip)
	movl	%eax, %ecx
	call	*__imp_ExitProcess(%rip)
.L189:
	xorl	%r9d, %r9d
	leaq	.LC0(%rip), %r8
	leaq	.LC8(%rip), %rdx
	jmp	.L187
	.p2align 4
	.globl	_$dll$laz_rtl$LengthByte
_$dll$laz_rtl$LengthByte:
.LFB6249:
	movl	$1, %eax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LengthChar
_$dll$laz_rtl$LengthChar:
.LFB6250:
	movl	$1, %eax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LengthInteger
_$dll$laz_rtl$LengthInteger:
.LFB6251:
	movl	$8, %eax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LengthWord
_$dll$laz_rtl$LengthWord:
.LFB6252:
	movl	$4, %eax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LengthString
_$dll$laz_rtl$LengthString:
.LFB6253:
	cmpb	$0, (%rcx)
	je	.L198
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L197:
	addq	$1, %rax
	cmpb	$0, (%rax)
	jne	.L197
	subq	%rcx, %rax
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L198:
	xorl	%eax, %eax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$LowerCase
_$dll$laz_rtl$LowerCase:
.LFB6254:
	movzbl	(%rcx), %eax
	movq	%rcx, %r8
	testb	%al, %al
	je	.L201
	movq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L203:
	leal	-65(%rax), %ecx
	cmpb	$25, %cl
	ja	.L202
	subl	$32, %eax
	movb	%al, (%rdx)
.L202:
	movzbl	1(%rdx), %eax
	addq	$1, %rdx
	testb	%al, %al
	jne	.L203
.L201:
	movq	%r8, %rax
	ret
	.p2align 4
	.globl	_$dll$laz_rtl$UpperCase
_$dll$laz_rtl$UpperCase:
.LFB6255:
	movzbl	(%rcx), %eax
	movq	%rcx, %r8
	testb	%al, %al
	je	.L209
	movq	%rcx, %rdx
	.p2align 4,,10
	.p2align 3
.L211:
	leal	-97(%rax), %ecx
	cmpb	$25, %cl
	ja	.L210
	subl	$32, %eax
	movb	%al, (%rdx)
.L210:
	movzbl	1(%rdx), %eax
	addq	$1, %rdx
	testb	%al, %al
	jne	.L211
.L209:
	movq	%r8, %rax
	ret
	.globl	LazStringImg
	.bss
	.align 32
LazStringImg:
	.space 256
	.globl	LazTerminal
	.align 32
LazTerminal:
	.space 48
