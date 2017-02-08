	.file	"control.c"
	.text
	.globl	asm_if
	.type	asm_if, @function
asm_if:
.LFB0:
	.cfi_startproc
	leal	4(%rdi), %edx
	leal	-1(%rdi), %eax
	testl	%edi, %edi
	cmovg	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	asm_if, .-asm_if
	.globl	asm_while
	.type	asm_while, @function
asm_while:
.LFB1:
	.cfi_startproc
	testl	%edi, %edi
	je	.L4
.L7:
	subl	$1, %edi
	jne	.L7
.L4:
	rep ret
	.cfi_endproc
.LFE1:
	.size	asm_while, .-asm_while
	.globl	asm_for
	.type	asm_for, @function
asm_for:
.LFB2:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L9
	movl	$0, %eax
.L11:
	addl	$1, %eax
	cmpl	%eax, %edi
	jne	.L11
.L9:
	rep ret
	.cfi_endproc
.LFE2:
	.size	asm_for, .-asm_for
	.globl	asm_switch
	.type	asm_switch, @function
asm_switch:
.LFB3:
	.cfi_startproc
	cmpl	$5, %edi
	ja	.L14
	movl	%edi, %eax
	jmp	*.L16(,%rax,8)
	.section	.rodata
	.align 8
	.align 4
.L16:
	.quad	.L14
	.quad	.L21
	.quad	.L17
	.quad	.L18
	.quad	.L19
	.quad	.L20
	.text
.L17:
	movl	$1, %eax
	ret
.L18:
	movl	$15, %eax
	ret
.L19:
	movl	$14, %edi
.L20:
	addl	$10, %edi
.L14:
	leal	(%rdi,%rdi), %eax
	ret
.L21:
	movl	$2, %eax
	ret
	.cfi_endproc
.LFE3:
	.size	asm_switch, .-asm_switch
	.globl	short_switch
	.type	short_switch, @function
short_switch:
.LFB4:
	.cfi_startproc
	movl	$2, %eax
	cmpl	$1, %edi
	je	.L22
	leal	(%rdi,%rdi), %eax
	cmpl	$2, %edi
	movl	$1, %edx
	cmove	%edx, %eax
.L22:
	rep ret
	.cfi_endproc
.LFE4:
	.size	short_switch, .-short_switch
	.ident	"GCC: (GNU) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
