	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Generated number: %d; answer in output file\n"
.LC1:
	.string	"w"
.LC2:
	.string	"%.9lf"
.LC3:
	.string	"r"
.LC4:
	.string	"Could not open file. Press any key to exit"
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
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rsi
	sub	rsp, 16
	.cfi_def_cfa_offset 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	DWORD PTR 4[rsp], 0
	cmp	edi, 3
	jne	.L2
	mov	rdi, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rdi], 58
	jne	.L3
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
.L3:
	lea	rsi, .LC3[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L5
	lea	rsi, .LC4[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	call	getchar@PLT
	jmp	.L4
.L5:
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
	mov	al, 1
	lea	rdx, .LC2[rip]
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L2:
	cmp	edi, 2
	jne	.L6
	call	clock@PLT
	mov	rdi, QWORD PTR 8[rbx]
	mov	ebx, 10000000
	mov	r12, rax
	call	atoi@PLT
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	edx, eax
	mov	ebp, eax
	xor	eax, eax
	call	__printf_chk@PLT
.L7:
	mov	edi, ebp
	call	task@PLT
	dec	ebx
	jne	.L7
	call	clock@PLT
	mov	rsi, r12
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
	mov	edi, ebp
	call	task@PLT
	lea	rsi, .LC8[rip]
	jmp	.L13
.L6:
	mov	edx, 217217217
	lea	rsi, .LC9[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	lea	rsi, 4[rsp]
	lea	rdi, .LC5[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	edx, DWORD PTR 4[rsp]
	lea	eax, -1[rdx]
	cmp	eax, 217217216
	jbe	.L8
	lea	rsi, .LC10[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L8:
	mov	edi, edx
	call	task@PLT
	lea	rsi, .LC11[rip]
.L13:
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 8[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	add	rsp, 16
	.cfi_def_cfa_offset 32
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
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
