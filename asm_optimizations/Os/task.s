	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	task
	.type	task, @function
task:
.LFB0:
	.cfi_startproc
	endbr64
	cvtsi2sd	xmm1, edi
	movsd	xmm4, QWORD PTR .LC0[rip]
	movsd	xmm5, QWORD PTR .LC2[rip]
	movsd	xmm6, QWORD PTR .LC1[rip]
	movapd	xmm0, xmm1
	movapd	xmm2, xmm1
	divsd	xmm0, xmm4
.L2:
	subsd	xmm2, xmm0
	comisd	xmm2, xmm5
	jbe	.L5
	movapd	xmm2, xmm0
	movapd	xmm3, xmm1
	mulsd	xmm2, xmm0
	mulsd	xmm2, xmm0
	mulsd	xmm2, xmm0
	divsd	xmm3, xmm2
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm6
	addsd	xmm3, xmm2
	movapd	xmm2, xmm0
	divsd	xmm3, xmm4
	movapd	xmm0, xmm3
	jmp	.L2
.L5:
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
