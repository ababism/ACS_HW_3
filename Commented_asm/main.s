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
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 304	# stack
	mov	DWORD PTR -292[rbp], edi	# argc = edi: -292 (first argument)
	mov	QWORD PTR -304[rbp], rsi	# argv: -304
# ./main.c:13:     ch_arr[max_size] = '\0';
	mov	BYTE PTR -55[rbp], 0	# ch_arr[max_size] = '\0'
# ./main.c:15:     if (argc == 3) {
	cmp	DWORD PTR -292[rbp], 3	# argc cmp 3
	jne	.L2	#,
	mov	rax, QWORD PTR -304[rbp]	# rax, argv
	add	rax, 8	# argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT	# fopen(argv[1], "r");
	mov	QWORD PTR -32[rbp], rax	# input_stream = rax (result of fopen)
# ./main.c:17:         if (input_stream == NULL) {
	cmp	QWORD PTR -32[rbp], 0	# input_stream cmp with NULL
	jne	.L3	#,
	lea	rdi, .LC1[rip]	# "Could not open file. Press any key to exit" first argument of printf
	mov	eax, 0
	call	printf@PLT	#  printf("Could not open file. Press any key to exit");
	call	getchar@PLT	#
	mov	eax, 0	# return 0
	jmp	.L12	#
.L3:
	mov	rdx, QWORD PTR -32[rbp]	# input_stream third argument of fgets
	lea	rax, -272[rbp]	# ch_arr: -272
	mov	esi, 218	# sizeof(ch_arr) sencond argument of fgets
	mov	rdi, rax	# ch_arr first argument of fgets
	call	fgets@PLT	# fgets(ch_arr, sizeof(ch_arr), input_stream);
	mov	rax, QWORD PTR -32[rbp]	# input_stream: -32
	mov	rdi, rax	# input_stream first argument of fclose
	call	fclose@PLT	close(input_stream);

	mov	rax, QWORD PTR -304[rbp]	# argv
	add	rax, 16	# argv[2]
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]	# "w" second argument of fopen
	mov	rdi, rax	# argv[2] (string) first argument of fopen
	call	fopen@PLT	# fopen(argv[2], "w");
	mov	QWORD PTR -40[rbp], rax	# output_stream = fopen(): -40
	lea	rax, -272[rbp]	# ch_arr
	mov	rdi, rax	# ch_arr first argument of task
	call	task@PLT	# task(ch_arr)
	mov	rdx, rax	# result of task(ch_arr) third argument of fprintf
	mov	rax, QWORD PTR -40[rbp]	# rax, output_stream
	lea	rsi, .LC3[rip]	# "%s"
	mov	rdi, rax	# output_stream first argument of fprintf
	mov	eax, 0
	call	fprintf@PLT	# fprintf(output_stream, "%s ", task(ch_arr));
	mov	rax, QWORD PTR -40[rbp]	# rax, output_stream
	mov	rdi, rax	# output_stream first argument of fclose
	call	fclose@PLT	#  fclose(output_stream);
	mov	eax, 0	#  return 0;
	jmp	.L12	#
.L2:
	cmp	DWORD PTR -292[rbp], 2	# argc cmp 2 (argc == 2)
	jne	.L5
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax	# t_start = clock() : -16
	mov	rax, QWORD PTR -304[rbp]	# rax, argv
	add	rax, 8	# argv[1]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax	# argv[1] (string) second argument of printf
	lea	rdi, .LC4[rip]	# "String: %s\n" first argument of printf
	mov	eax, 0
	call	printf@PLT	#  printf("String: %s\n", argv[1]);
	mov	DWORD PTR -4[rbp], 0	# i = 0: -4
	jmp	.L6	# for (int i = 0; i < 20000000; ++i)
.L7:
	mov	rax, QWORD PTR -304[rbp]	# rax, argv
	add	rax, 8	# argv[1]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax	# argv[1] first argument of task(argv[1])
	call	task@PLT	# task(argv[1])
	add	DWORD PTR -4[rbp], 1	# ++i
.L6:
#	for (int i = 0; i < 20000000; ++i)
	cmp	DWORD PTR -4[rbp], 19999999	# i cmp 19999999
	jle	.L7
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax	# t_end = clock(): -24
	mov	rdx, QWORD PTR -16[rbp]	# tmp120, t_start
	mov	rax, QWORD PTR -24[rbp]	# tmp121, t_end
	mov	rsi, rdx	# t_start second argument of difftime
	mov	rdi, rax	# t_end first argument of difftime
	call	difftime@PLT	# (difftime(t_end, t_start)
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx	
	mov	esi, eax	# (int) difftime(t_end, t_start) / 1000 second argument of printf
	lea	rdi, .LC5[rip]	# "Time: %d ms\n" first argument of printf
	mov	eax, 0
	call	printf@PLT	#printf("Time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
	mov	rax, QWORD PTR -304[rbp]	# argv
	add	rax, 8	# argv[1]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax	# argv[1] first argument of task
	call	task@PLT	#  task(argv[1])
	mov	rsi, rax	#  task(argv[1]) second argument of printf
	lea	rdi, .LC6[rip]	# "Result: %s\n" first argument of printf
	mov	eax, 0
	call	printf@PLT	# printf("Result: %s\n", task(argv[1]));
	mov	eax, 0	#  return 0;
	jmp	.L12
.L5:
	lea	rdi, .LC7[rip]	# first argument of printf
	mov	eax, 0
	call	printf@PLT	# printf("Random (enter 1) or manual input (enter != 1):");
	mov	DWORD PTR -276[rbp], 0	# input_type_flag = 0: -276
	lea	rax, -276[rbp]	# &input_type_flag
	mov	rsi, rax	# &input_type_flag second argument of scanf
	lea	rdi, .LC8[rip]	# "%d" first argument of scanf
	mov	eax, 0
	call	__isoc99_scanf@PLT	# scanf("%d", &input_type_flag);
	mov	eax, DWORD PTR -276[rbp]
	cmp	eax, 1	# input_type_flag cmp 1,
	jne	.L8
	mov	DWORD PTR -280[rbp], 0	# length = 0: -280
	mov	esi, 217	# max_size second argument of printf
	lea	rdi, .LC9[rip]	# "Input length (0 < length <= %d):" first argument of printf
	mov	eax, 0
	call	printf@PLT	#  printf("Input length (0 < length <= %d):", max_size);
	lea	rax, -280[rbp]	# rax, &length
	mov	rsi, rax	# &length second argument of scanf
	lea	rdi, .LC8[rip]	# "%d"
	mov	eax, 0
	call	__isoc99_scanf@PLT	# scanf("%d", &length);
	mov	eax, DWORD PTR -280[rbp]	# length
	test	eax, eax	# length < 1
	jle	.L9
	mov	eax, DWORD PTR -280[rbp]	# length
	cmp	eax, 217	# length > max_size
	jle	.L10
.L9:
	mov	eax, DWORD PTR -280[rbp]	# eax, length
	mov	esi, eax	# length
	lea	rdi, .LC10[rip]	# "Incorrect length = %d\n" first argument of printf
	mov	eax, 0
	call	printf@PLT	# printf("Incorrect length = %d\n", length);
	mov	eax, 0	# return 0;
	jmp	.L12
.L10:
	mov	eax, DWORD PTR -280[rbp]	# length
	lea	rdx, -272[rbp]	# ch_arr
	mov	rsi, rdx	# ch_arr second argument of task_random
	mov	edi, eax	# length first argument of task_random
	call	task_random@PLT	# task_random(length, ch_arr)
	mov	rsi, rax	# result of task_random second argument of printf
	lea	rdi, .LC11[rip]	# "\nResult: %s\n" first argument of printf
	mov	eax, 0	#,
	call	printf@PLT	# printf("\nResult: %s\n", task_random(length, ch_arr));
	mov	eax, 0	# return 0;
	jmp	.L12	#
.L8:
	lea	rax, -272[rbp]	# ch_arr
	mov	rdi, rax	# ch_arr first argument of task_manual
	call	task_manual@PLT	# task_manual(ch_arr)
	mov	rsi, rax	# result of task_manual second argument of printf
	lea	rdi, .LC11[rip]	# "\nResult: %s\n" first argument of printf
	mov	eax, 0
	call	printf@PLT	# printf("\nResult: %s\n", task_manual(ch_arr));
	mov	eax, 0	# return 0;
.L12:
	leave	# quiting from program
	ret	
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
