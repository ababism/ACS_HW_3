	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm0
	cvtsi2sd	xmm1, DWORD PTR -20[rbp]
	movsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -8[rbp]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	addsd	xmm0, xmm2
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
.L2:
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	comisd	xmm0, QWORD PTR .LC2[rip]
	ja	.L3
	movsd	xmm0, QWORD PTR -16[rbp]
	pop	rbp
	ret
	.size	task, .-task
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1075052544
	.align 8
.LC1:
	.long	0
	.long	1074790400
	.align 8
.LC2:
	.long	3894859413
	.long	1041313291
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
