	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Generated number: %d; answer in output file\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"w"
.LC2:
	.string	"%.9lf"
.LC3:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Could not open file. Press any key to exit"
	.section	.rodata.str1.1
.LC5:
	.string	"%d"
.LC6:
	.string	"Your number: %d\n"
.LC7:
	.string	"Time: %d ms\n"
.LC8:
	.string	"Result: %.9lf\n"
.LC9:
	.string	"Your number (0 < num <= %d):"
.LC10:
	.string	"Incorrect number = %d\n"
.LC11:
	.string	"\nResult: %.9lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	mov	rbx, rsi
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	DWORD PTR 4[rsp], 0
	cmp	edi, 3
	je	.L14
	cmp	edi, 2
	je	.L15
	mov	edx, 217217217
	lea	rsi, .LC9[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rdi, .LC5[rip]
	lea	rsi, 4[rsp]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 4[rsp]
	lea	eax, -1[rdi]
	cmp	eax, 217217216
	ja	.L16
	call	task@PLT
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC11[rip]
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 8[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L17
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	mov	edx, edi
	lea	rsi, .LC10[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L14:
	mov	rdi, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rdi], 58
	je	.L18
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L19
	mov	rdi, rax
	lea	rdx, 4[rsp]
	lea	rsi, .LC5[rip]
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
.L12:
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	edi, DWORD PTR 4[rsp]
	mov	rbp, rax
	call	task@PLT
	mov	rdi, rbp
	mov	esi, 1
	lea	rdx, .LC2[rip]
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L19:
	lea	rsi, .LC4[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L4
.L15:
	call	clock@PLT
	mov	rdi, QWORD PTR 8[rbx]
	mov	edx, 10
	xor	esi, esi
	mov	r13, rax
	mov	ebx, 10000000
	call	strtol@PLT
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	edx, eax
	mov	r12, rax
	mov	ebp, eax
	xor	eax, eax
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	mov	edi, ebp
	call	task@PLT
	sub	ebx, 1
	jne	.L7
	call	clock@PLT
	mov	rsi, r13
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC7[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	edi, r12d
	call	task@PLT
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC8[rip]
	call	__printf_chk@PLT
	jmp	.L4
.L18:
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 217217217
	mov	edi, 1
	lea	rsi, .LC0[rip]
	cdq
	idiv	ecx
	xor	eax, eax
	mov	DWORD PTR 4[rsp], edx
	call	__printf_chk@PLT
	jmp	.L12
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
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
