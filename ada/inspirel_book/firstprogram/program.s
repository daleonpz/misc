	.cpu cortex-m4
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.file	"program.adb"
	.text
	.align	2
	.global	run
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	run, %function
run:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
.L3:
	nop
	b	.L3
	.size	run, .-run
	.global	program_E
	.data
	.align	1
	.type	program_E, %object
	.size	program_E, 2
program_E:
	.space	2
	.ident	"GCC: (GNU) 6.3.1 20170510 (for GNAT GPL 2017 20170515)"
