	.file "utils.pas"

.section .text.n_utils_$$_high$byte$$byte,"x"
	.balign 16,0x90
.globl	UTILS_$$_HIGH$BYTE$$BYTE
UTILS_$$_HIGH$BYTE$$BYTE:
	movzbl	%cl,%eax
	shrl	$4,%eax
	andl	$255,%eax
	ret

.section .text.n_utils_$$_low$byte$$byte,"x"
	.balign 16,0x90
.globl	UTILS_$$_LOW$BYTE$$BYTE
UTILS_$$_LOW$BYTE$$BYTE:
	movw	%cx,%ax
	andl	$15,%eax
	ret

