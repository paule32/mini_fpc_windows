	.file	"user32.cc"
	.text
	.p2align 4
	.globl	_$dll$laz_win$LazWaitMessage
_$dll$laz_win$LazWaitMessage:
.LFB6172:
	subq	$40, %rsp
	call	*__imp_WaitMessage(%rip)
	addq	$40, %rsp
	ret
