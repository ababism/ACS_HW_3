	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	push	rbp
	mov	rbp, rsp
	mov	r12d, edi
	cvtsi2sd	xmm0, r12d
	movsd	xmm7, xmm0
	cvtsi2sd	xmm0, r12d
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm7, xmm0
	movsd	xmm1, xmm7
	movsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm0
	cvtsi2sd	xmm1, r12d
	movsd	xmm0, xmm7
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm7
	mulsd	xmm0, xmm7
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	addsd	xmm0, xmm2
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
.L2:
	movsd	xmm0, xmm7
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
