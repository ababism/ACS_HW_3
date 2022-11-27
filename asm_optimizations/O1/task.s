	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
.LFB0:
	.cfi_startproc
	endbr64
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, edi
	movapd	xmm0, xmm3
	divsd	xmm0, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm3
	subsd	xmm1, xmm0
	comisd	xmm1, QWORD PTR .LC1[rip]
	jbe	.L1
	movsd	xmm6, QWORD PTR .LC2[rip]
	movsd	xmm5, QWORD PTR .LC0[rip]
	movsd	xmm4, QWORD PTR .LC1[rip]
.L4:
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movapd	xmm2, xmm3
	divsd	xmm2, xmm1
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm6
	addsd	xmm2, xmm1
	movapd	xmm1, xmm0
	divsd	xmm2, xmm5
	movapd	xmm0, xmm2
	subsd	xmm1, xmm2
	comisd	xmm1, xmm4
	ja	.L4
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	task, .-task
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1075052544
	.align 8
.LC1:
	.long	3894859413
	.long	1041313291
	.align 8
.LC2:
	.long	0
	.long	1074790400
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
