	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
	endbr64	
	push	rbp
	mov	rbp, rsp	# stack
	mov	DWORD PTR -20[rbp], edi	# num = first argument: -20
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]
	movsd	QWORD PTR -8[rbp], xmm0	# double prev_root = num: -8
#	double new_root = num / (double) ROOT_DEGREE;
	cvtsi2sd	xmm0, DWORD PTR -20[rbp]	# num
	movsd	xmm1, QWORD PTR .LC0[rip]	# xmm1 = ROOT_DEGREE
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0	# double new_root = num / (double) ROOT_DEGREE: -16
	jmp	.L2	# while ((prev_root - new_root) > EPS)
.L3:
	movsd	xmm0, QWORD PTR -16[rbp]	# xmm0 = new_root
	movsd	QWORD PTR -8[rbp], xmm0	# prev_root = new_root;
#	new_root = (COEFFICIENT * prev_root + num / (prev_root * prev_root * prev_root * prev_root) ) / ROOT_DEGREE;
	movsd	xmm1, QWORD PTR -8[rbp]	# tmp97, prev_root
	movsd	xmm0, QWORD PTR .LC1[rip]	# xmm0 = COEFFICIENT
	movapd	xmm2, xmm1
	mulsd	xmm2, xmm0	# COEFFICIENT * prev_root
	cvtsi2sd	xmm1, DWORD PTR -20[rbp]	# xmm1 = num
	movsd	xmm0, QWORD PTR -8[rbp]	# xmm0 = prev_root
	mulsd	xmm0, xmm0	# prev_root * prev_root
	mulsd	xmm0, QWORD PTR -8[rbp]	# prev_root * prev_root * prev_root
	mulsd	xmm0, QWORD PTR -8[rbp]	# prev_root * prev_root * prev_root * prev_root
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1	# num / prev_root^4
	addsd	xmm0, xmm2	# num/prev_root^4 + COEFFICIENT * prev_root
	movsd	xmm1, QWORD PTR .LC0[rip]	# xmm1 = ROOT_DEGREE
	divsd	xmm0, xmm1	# (num/prev_root^4 + COEFFICIENT * prev_root) / ROOT_DEGREE
	movsd	QWORD PTR -16[rbp], xmm0	# new_root = (coef * num + num/prev_root^4) / ROOT_DEGREE
.L2:
#	while ((prev_root - new_root) > EPS)
	movsd	xmm0, QWORD PTR -8[rbp]	# xmm0, prev_root
	subsd	xmm0, QWORD PTR -16[rbp]	# prev_root - new_root
	comisd	xmm0, QWORD PTR .LC2[rip]	# (prev_root - new_root) > EPS
	ja	.L3
	movsd	xmm0, QWORD PTR -16[rbp]	# return new_root;
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
