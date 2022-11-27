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
	.text
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
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rbx, rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	DWORD PTR 4[rsp], 0
	cmp	edi, 3
	je	.L12
	cmp	edi, 2
	je	.L13
	mov	edx, 217217217
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 4[rsp]
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 4[rsp]
	lea	eax, -1[rdi]
	cmp	eax, 217217216
	ja	.L14
	call	task@PLT
	lea	rsi, .LC11[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 8[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L15
	mov	eax, 0
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	mov	rdi, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rdi], 58
	je	.L16
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L17
	lea	rdx, 4[rsp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	edi, DWORD PTR 4[rsp]
	call	task@PLT
	lea	rdx, .LC2[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L16:
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 217217217
	cdq
	idiv	ecx
	mov	DWORD PTR 4[rsp], edx
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC1[rip]
	call	fopen@PLT
	mov	rbx, rax
	mov	edi, DWORD PTR 4[rsp]
	call	task@PLT
	lea	rdx, .LC2[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L17:
	lea	rsi, .LC4[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	jmp	.L4
.L13:
	call	clock@PLT
	mov	r13, rax
	mov	rdi, QWORD PTR 8[rbx]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	r12, rax
	mov	ebp, eax
	mov	edx, eax
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	ebx, 10000000
.L7:
	mov	edi, ebp
	call	task@PLT
	sub	ebx, 1
	jne	.L7
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, r13
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	edi, r12d
	call	task@PLT
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	jmp	.L4
.L14:
	mov	edx, edi
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L15:
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
