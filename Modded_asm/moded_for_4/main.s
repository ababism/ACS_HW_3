	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Generated number: %d; answer in output file\n"
.LC1:
	.string	"w"
.LC2:
	.string	"%.9lf"
.LC3:
	.string	"r"
	.align 8
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
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	mov	DWORD PTR -60[rbp], 0
	cmp	DWORD PTR -68[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 58
	jne	.L2
	call	clock@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1641122631
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 27
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 217217217
	sub	eax, edx
	mov	edx, eax
	mov	DWORD PTR -60[rbp], edx
	mov	eax, DWORD PTR -60[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -60[rbp]
	mov	edi, eax
	call	task@PLT
	mov	rax, QWORD PTR -16[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L11
.L2:
	cmp	DWORD PTR -68[rbp], 3
	jne	.L4
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0
	jne	.L5
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	call	getchar@PLT
	mov	eax, 0
	jmp	.L11
.L5:
	lea	rdx, -60[rbp]
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	mov	eax, DWORD PTR -60[rbp]
	mov	edi, eax
	call	task@PLT
	mov	rax, QWORD PTR -56[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	jmp	.L11
.L4:
	cmp	DWORD PTR -68[rbp], 2
	jne	.L6
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -28[rbp], eax
	mov	eax, DWORD PTR -28[rbp]
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -28[rbp]
	mov	edi, eax
	call	task@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	cmp	DWORD PTR -4[rbp], 9999999
	jle	.L8
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
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
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -28[rbp]
	mov	edi, eax
	call	task@PLT
	lea	rdi, .LC8[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	jmp	.L11
.L6:
	mov	esi, 217217217
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -60[rbp]
	mov	rsi, rax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -60[rbp]
	test	eax, eax
	jle	.L9
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, 217217217
	jle	.L10
.L9:
	mov	eax, DWORD PTR -60[rbp]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	eax, DWORD PTR -60[rbp]
	mov	edi, eax
	call	task@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L11:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
