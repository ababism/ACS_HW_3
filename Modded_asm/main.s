	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"Could not open file. Press any key to exit"
.LC2:
	.string	"w"
.LC3:
	.string	"%s "
.LC4:
	.string	"String: %s\n"
.LC5:
	.string	"Time: %d ms\n"
.LC6:
	.string	"Result: %s\n"
	.align 8
.LC7:
	.string	"Random (enter 1) or manual input (enter != 1):"
.LC8:
	.string	"%d"
	.align 8
.LC9:
	.string	"Input length (0 < length <= %d):"
.LC10:
	.string	"Incorrect length = %d\n"
.LC11:
	.string	"\nResult: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 304
	mov	DWORD PTR -292[rbp], edi
	mov	QWORD PTR -304[rbp], rsi
	mov	BYTE PTR -55[rbp], 0
	cmp	DWORD PTR -292[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	QWORD PTR -32[rbp], 0
	jne	.L3
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	call	getchar@PLT
	mov	eax, 0
	jmp	.L12
.L3:
	mov	rdx, QWORD PTR -32[rbp]
	lea	rax, -272[rbp]
	mov	esi, 218
	mov	rdi, rax
	call	fgets@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L12
.L2:
	cmp	DWORD PTR -292[rbp], 2
	jne	.L5
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r14d, 0
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	task@PLT
	add	r14d, 1
.L6:
	cmp	r14d, 19999999
	jle	.L7
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	task@PLT
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L12
.L5:
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -276[rbp], 0
	lea	rax, -276[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -276[rbp]
	cmp	eax, 1
	jne	.L8
	mov	DWORD PTR -280[rbp], 0
	mov	esi, 217
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -280[rbp]
	mov	rsi, rax
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -280[rbp]
	test	eax, eax
	jle	.L9
	mov	eax, DWORD PTR -280[rbp]
	cmp	eax, 217
	jle	.L10
.L9:
	mov	eax, DWORD PTR -280[rbp]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L12
.L10:
	mov	eax, DWORD PTR -280[rbp]
	lea	rdx, -272[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	task_random@PLT
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L12
.L8:
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	task_manual@PLT
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L12:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	