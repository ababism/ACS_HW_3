	.file	"task.c"
	.intel_syntax noprefix

	.text
	.globl	reverse
	.type	reverse, @function
reverse:
	endbr64	# macros
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -40[rbp], rdi	# it_start = first argument: -40
	mov	QWORD PTR -48[rbp], rsi	# it_end = second argument: -48
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -8[rbp], rax	# it_l = it_start: -8
	mov	rax, QWORD PTR -48[rbp]	# it_end
	sub	rax, 1
	mov	QWORD PTR -16[rbp], rax	# it_r = it_end - 1: -16
#	int size = (it_r + 1 - it_l) / 2;
	mov	rax, QWORD PTR -16[rbp]	# it_r
	add	rax, 1	# it_r + 1
	sub	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	shr	rdx, 63
	add	rax, rdx
	sar	rax
	mov	DWORD PTR -24[rbp], eax	# size = (it_r + 1 - it_l) / 2; (size: -24)
#	for (int i = 0; i < size; ++i)
	mov	DWORD PTR -20[rbp], 0	# i = 0: -20
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -25[rbp], al	# temp = *it_l: -25
#	this is *it_l = *it_r;
	mov	rax, QWORD PTR -16[rbp]	# it_r
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -8[rbp] # it_l
	mov	BYTE PTR [rax], dl

#   this is *it_r = temp;
	mov	rax, QWORD PTR -16[rbp]	# it_r
	movzx	edx, BYTE PTR -25[rbp]	# temp
	mov	BYTE PTR [rax], dl	#
	sub	QWORD PTR -16[rbp], 1	# --it_r;
	add	QWORD PTR -8[rbp], 1	#  ++it_l;
#	for (int i = 0; i < size; ++i)
	add	DWORD PTR -20[rbp], 1	# ++i;
.L2:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -24[rbp]	# i < size
	jl	.L3
	pop	rbp
	ret	
	.size	reverse, .-reverse
	.globl	task
	.type	task, @function
task:
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48	# stack
	mov	QWORD PTR -40[rbp], rdi	# str: -40 first incoming argument
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -8[rbp], rax	# char *it_l = str: -8
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax	# char *it_r = str: -16
	mov	rax, QWORD PTR -40[rbp]	# str
	mov	rdi, rax	# rdi = str
	call	strlen@PLT	# strlen(str)
	mov	rdx, QWORD PTR -16[rbp]	# it_r
	add	rax, rdx	# it_r + strlen(str)
	mov	QWORD PTR -24[rbp], rax	# char *eof = it_r + strlen(str): -24
	jmp	.L5 #  goes to  while (it_r != eof)
.L10:
#   start of if (!isalpha(*it_r))
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]	# it_r
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 1024
	test	eax, eax	# end of if (!isalpha(*it_r))
	jne	.L6
	mov	rdx, QWORD PTR -16[rbp]	# it_r
	mov	rax, QWORD PTR -8[rbp]	# it_l
	mov	rsi, rdx
	mov	rdi, rax
	call	reverse	#	reverse(it_l, it_r);
	jmp	.L7 # goes to while (!isalpha(*it_r) && it_r != eof) {
.L9:
	add	QWORD PTR -16[rbp], 1	# ++it_r;
.L7:
# start of while (!isalpha(*it_r) && it_r != eof) {
	call	__ctype_b_loc@PLT
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]	# t_r
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al	
	add	rax, rax
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 1024
	test	eax, eax
	jne	.L8	 # end of while (!isalpha(*it_r) && it_r != eof)
	mov	rax, QWORD PTR -16[rbp]	# it_r
	cmp	rax, QWORD PTR -24[rbp]	# eof
	jne	.L9	# next loop
.L8:
	mov	rax, QWORD PTR -16[rbp]	# it_r
	mov	QWORD PTR -8[rbp], rax	# it_l = it_r;
	sub	QWORD PTR -16[rbp], 1	# --it_r;
.L6:
	add	QWORD PTR -16[rbp], 1	# ++it_r;
.L5:
#   while (it_r != eof)
	mov	rax, QWORD PTR -16[rbp]	# it_r
	cmp	rax, QWORD PTR -24[rbp]	# it_r cmp eof
	jne	.L10
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rsi, rdx	# it_r
	mov	rdi, rax	# it_l
	call	reverse	# reverse(it_l, it_r);
	mov	rax, QWORD PTR -40[rbp]	# return str;
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
	sub	rsp, 32	# stack
	mov	DWORD PTR -20[rbp], edi	# length first ardument: -20
	mov	QWORD PTR -32[rbp], rsi	# ch_arr second arg: -32
	call	clock@PLT
	mov	edi, eax	# res of clock() first arg to srand()
	call	srand@PLT	 srand(clock());
#   for (int j = 0; j < length; ++j) {
	mov	DWORD PTR -4[rbp], 0	# j = 0: -1
	jmp	.L13
.L14:
	call	rand@PLT
	# ch_arr[j] = (char) (33 + rand() % 93)
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
	mov	eax, DWORD PTR -4[rbp]	# j
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]	# ch_arr
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1	# ++j
.L13:
	mov	eax, DWORD PTR -4[rbp]	# j
	cmp	eax, DWORD PTR -20[rbp]	# j cmp length
	jl	.L14
	mov	eax, DWORD PTR -20[rbp]	# length
	movsx	rdx, eax	# length * 4
	mov	rax, QWORD PTR -32[rbp]	# ch_arr
	add	rax, rdx	# &ch_arr[] + length * 4
	mov	BYTE PTR [rax], 0	# ch_arr[length] = '\0';
	mov	rax, QWORD PTR -32[rbp]	# ch_arr
	mov	rsi, rax	# ch_arr second arg
	lea	rdi, .LC0[rip]	# first arg
	mov	eax, 0
	call	printf@PLT	#  printf("Random string: %s", ch_arr);
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax	# ch_arr first arg
	call	task	# task(ch_arr);
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
	sub	rsp, 16	# stack
	mov	QWORD PTR -8[rbp], rdi	# ch_arr first arg: -8
	lea	rdi, .LC1[rip]	# arg string
	mov	eax, 0
	call	printf@PLT	# printf("Your string (no more than 217 characters):");
	call	getchar@PLT
	mov	rdx, QWORD PTR stdin[rip]	# 3rd arg stdin
	mov	rax, QWORD PTR -8[rbp]	# ch_arr
	mov	esi, 217	# 2nd arg
	mov	rdi, rax	# 1st arg ch_arr
	call	fgets@PLT	# fgets(ch_arr, 217, stdin);
	mov	rax, QWORD PTR -8[rbp]	# return task(ch_arr);
	mov	rdi, rax	# ch_arr
	call	task	# task(ch_arr)
	leave	
	ret	
	.size	task_manual, .-task_manual
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
