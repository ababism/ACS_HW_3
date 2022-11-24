	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	reverse
	.type	reverse, @function
reverse:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	sub	rax, 1
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 1
	sub	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	shr	rdx, 63
	add	rax, rdx
	sar	rax
	mov	DWORD PTR -24[rbp], eax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -25[rbp], al
	mov	rax, QWORD PTR -16[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR -16[rbp]
	movzx	edx, BYTE PTR -25[rbp]
	mov	BYTE PTR [rax], dl
	sub	QWORD PTR -16[rbp], 1
	add	QWORD PTR -8[rbp], 1
	add	DWORD PTR -20[rbp], 1
.L2:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -24[rbp]
	jl	.L3
	nop
	nop
	pop	rbp
	ret
	.size	reverse, .-reverse
	.globl	task
	.type	task, @function
task:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rdx, QWORD PTR -16[rbp]
	add	rax, rdx
	mov	QWORD PTR -24[rbp], rax
	jmp	.L5
.L10:
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 1024
	test	eax, eax
	jne	.L6
	mov	rsi, QWORD PTR -16[rbp]
	mov	rdi, QWORD PTR -8[rbp]
	call	reverse
	jmp	.L7
.L9:
	add	QWORD PTR -16[rbp], 1
.L7:
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 1024
	test	eax, eax
	jne	.L8
	mov	rax, QWORD PTR -16[rbp]
	cmp	rax, QWORD PTR -24[rbp]
	jne	.L9
.L8:
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -8[rbp], rax
	sub	QWORD PTR -16[rbp], 1
.L6:
	add	QWORD PTR -16[rbp], 1
.L5:
	mov	rax, QWORD PTR -16[rbp]
	cmp	rax, QWORD PTR -24[rbp]
	jne	.L10
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	reverse
	mov	rax, QWORD PTR -40[rbp]
	leave
	ret
	.size	task, .-task
	.section	.rodata
.LC0:
	.string	"Random string: %s"
	.text
	.globl	task_random
	.type	task_random, @function
task_random:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	mov	r15d, 0
	jmp	.L13
.L14:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 738919105
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 4
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 93
	sub	eax, edx
	mov	edx, eax
	mov	eax, edx
	lea	ecx, 33[rax]
	mov	eax, r15d
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	r15d, 1
.L13:
	mov	eax, r15d
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L14
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	task
	leave
	ret
	.size	task_random, .-task_random
	.section	.rodata
	.align 8
.LC1:
	.string	"Your string (no more than 217 characters):"
	.text
	.globl	task_manual
	.type	task_manual, @function
task_manual:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	call	getchar@PLT
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 217
	mov	rdi, rax
	call	fgets@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	task
	leave
	ret
	.size	task_manual, .-task_manual
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	