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
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80	# stack
	mov	DWORD PTR -68[rbp], edi	# argc = first argument: -68
	mov	QWORD PTR -80[rbp], rsi	# argv = second argument: -80
	mov	DWORD PTR -60[rbp], 0	# input_number = 0: -60
#	if (argc == 3 && argv[1][0] == ':') {
	cmp	DWORD PTR -68[rbp], 3	# argc == 3
	jne	.L2	# first condition
	mov	rax, QWORD PTR -80[rbp]	# rax = argv
	add	rax, 8	# argv + 8 = &argv[1]
	mov	rax, QWORD PTR [rax]	# argv[1]
	movzx	eax, BYTE PTR [rax]	# argv[1][0]
	cmp	al, 58	# argv[1][0] == ':'
	jne	.L2	# second condition
	call	clock@PLT
	mov	edi, eax	# first arg = clock() res
	call	srand@PLT	# srand(clock())
#	input_number = rand() % MAX_NUM;
	call	rand@PLT	#
	movsx	rdx, eax	# rdx = res of rand()
	imul	rdx, rdx, -1641122631
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 27
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 217217217
	sub	eax, edx
	mov	edx, eax
	mov	DWORD PTR -60[rbp], edx	#  input_number = rand() % MAX_NUM;
	mov	eax, DWORD PTR -60[rbp]	# rax = input_number
	mov	esi, eax	# second arg = input_number
	lea	rdi, .LC0[rip]	# first arg = "Generated number: %d; answer in output file\n"
	mov	eax, 0	#,
	call	printf@PLT	# printf("Generated number: %d; answer in output file\n", input_number);
	mov	rax, QWORD PTR -80[rbp]	# argv
	add	rax, 16	# argv + 16 = &argv[2]
	mov	rax, QWORD PTR [rax]	# argv[2]
	lea	rsi, .LC1[rip]	# second arg = "w"
	mov	rdi, rax	# first arg = argv[2]
	call	fopen@PLT	# fopen(argv[2], "w");
	mov	QWORD PTR -16[rbp], rax	# FILE *output_stream = fopen(argv[2], "w"): -16
# 	fprintf(output_stream, "%.9lf", task(input_number));
	mov	eax, DWORD PTR -60[rbp]	# eax = input_number
	mov	edi, eax	# input_number first argument of task()
	call	task@PLT	# task(input_number)
	mov	rax, QWORD PTR -16[rbp]	# rax = output_stream
	lea	rsi, .LC2[rip]	# second arg = "%.9lf"
	mov	rdi, rax	# first arg = output_stream
	mov	eax, 1
	call	fprintf@PLT #  fprintf(output_stream, "%.9lf", task(input_number))
	mov	rax, QWORD PTR -16[rbp]	# rax = output_stream
	mov	rdi, rax	# output_stream first argument of fclose()
	call	fclose@PLT	#   fclose(output_stream);
	mov	eax, 0	#  return 0;
	jmp	.L11
.L2:
	cmp	DWORD PTR -68[rbp], 3	#  if (argc == 3)
	jne	.L4
	mov	rax, QWORD PTR -80[rbp]	# rax = argv
	add	rax, 8	# &argv[1]
	mov	rax, QWORD PTR [rax]	# rax = argvp[1]
	lea	rsi, .LC3[rip]	# "r" second arg of fopen()
	mov	rdi, rax	# argv[1] first arg of fopen()
	call	fopen@PLT	# fopen(argv[1], "r");
	mov	QWORD PTR -48[rbp], rax	# FILE *input_stream = fopen(argv[1], "r"): -48
	cmp	QWORD PTR -48[rbp], 0	# if (input_stream == NULL)
	jne	.L5
# ./main.c:25:             printf("Could not open file. Press any key to exit");
	lea	rdi, .LC4[rip]	# "Could not open file. Press any key to exit" first arg
	mov	eax, 0
	call	printf@PLT	# printf("Could not open file. Press any key to exit");
	call	getchar@PLT	# getchar();
	mov	eax, 0	# return 0;
	jmp	.L11
.L5:
# ./main.c:29:         fscanf(input_stream, "%d", &input_number);
	lea	rdx, -60[rbp]	# &input_number third arg
	mov	rax, QWORD PTR -48[rbp]	# rax = input_stream
	lea	rsi, .LC5[rip]	# "%d" second arg
	mov	rdi, rax	# input_stream first arg
	mov	eax, 0
	call	__isoc99_fscanf@PLT	# fscanf(input_stream, "%d", &input_number)
# ./main.c:30:         fclose(input_stream);
	mov	rax, QWORD PTR -48[rbp]	# rax, input_stream
	mov	rdi, rax	# input_stream firsr arg
	call	fclose@PLT	# fclose(input_stream);
# ./main.c:32:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR -80[rbp]	# rax, argv
	add	rax, 16	# &argv[2]
	mov	rax, QWORD PTR [rax]	# rax, argv[2]
	lea	rsi, .LC1[rip]	# "w" second arg
	mov	rdi, rax	# argv[2] first arg
	call	fopen@PLT	# fopen(argv[2], "w");
	mov	QWORD PTR -56[rbp], rax	#  FILE *output_stream = fopen(argv[2], "w"): -56
	mov	eax, DWORD PTR -60[rbp]	# eax, input_number
	mov	edi, eax	# input_number first argument of task()
	call	task@PLT	# task(input_number)
	mov	rax, QWORD PTR -56[rbp]	# rax, output_stream
	lea	rsi, .LC2[rip]	# "%.9lf" second arg
	mov	rdi, rax	# output_stream first arg
	mov	eax, 1
	call	fprintf@PLT	# fprintf(output_stream, "%.9lf", task(input_number));
	mov	rax, QWORD PTR -56[rbp]	# rax, output_stream
	mov	rdi, rax	# output_stream first arg of fclose
	call	fclose@PLT	# fclose(output_stream)
	mov	eax, 0	#  return 0;
	jmp	.L11
.L4:
	cmp	DWORD PTR -68[rbp], 2	# if (argc == 2) {
	jne	.L6
	call	clock@PLT	# clock()
	mov	QWORD PTR -24[rbp], rax	# time_t t_start = clock(): -24
	mov	rax, QWORD PTR -80[rbp]	# rax, argv
	add	rax, 8	# &argv[1]
	mov	rax, QWORD PTR [rax]	# argv[1]
	mov	rdi, rax	# argv[1] first arg
	call	atoi@PLT	# atoi(argv[1])
	mov	DWORD PTR -28[rbp], eax	# int num = atoi(argv[1]): -28
	mov	eax, DWORD PTR -28[rbp]	# eax, num
	mov	esi, eax	# num second arg
	lea	rdi, .LC6[rip]	# "Your number: %d\n" first arg
	mov	eax, 0
	call	printf@PLT	# printf("Your number: %d\n", num);
	mov	DWORD PTR -4[rbp], 0	# i = 0: -4
	jmp	.L7	#  for (int i = 0; i < 10000000; ++i) {    // Timer does not count IO of user
.L8:
	mov	eax, DWORD PTR -28[rbp]	# eax, num
	mov	edi, eax	# num second arg
	call	task@PLT	#  task(num);
	add	DWORD PTR -4[rbp], 1	# ++i
.L7:
	cmp	DWORD PTR -4[rbp], 9999999	#  i < 10000000
	jle	.L8
	call	clock@PLT	# clock()
	mov	QWORD PTR -40[rbp], rax	#  time_t t_end = clock(): -40
# ./main.c:47:         printf("Time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
	mov	rdx, QWORD PTR -24[rbp]	# rdx, t_start
	mov	rax, QWORD PTR -40[rbp]	# rax, t_end
	mov	rsi, rdx	# t_start second arg of difftime()
	mov	rdi, rax	# t_end first arg of difftime()
	call	difftime@PLT	# difftime(t_end, t_start)
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31	#
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax	# (int) (difftime(t_end, t_start)) / 1000 second arg
	lea	rdi, .LC7[rip]	# "Time: %d ms\n"
	mov	eax, 0
	call	printf@PLT	# printf("Time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000)
	mov	eax, DWORD PTR -28[rbp]	# eax, num
	mov	edi, eax	# num first arg of task()
	call	task@PLT	# task(num)
	lea	rdi, .LC8[rip]	# "Result: %.9lf\n" first arg of printf
	mov	eax, 1
	call	printf@PLT	# printf("Result: %.9lf\n", task(num));
	mov	eax, 0	# return 0;
	jmp	.L11	#
.L6:
	mov	esi, 217217217	# MAX_NUM second arg
	lea	rdi, .LC9[rip]	# "Your number (0 < num <= %d):" first arg
	mov	eax, 0
	call	printf@PLT	# printf("Your number (0 < num <= %d):", MAX_NUM);
	lea	rax, -60[rbp]	# rax, &input_number
	mov	rsi, rax	# &input_number second arg
	lea	rdi, .LC5[rip]	# "%d" first arg
	mov	eax, 0
	call	__isoc99_scanf@PLT	# scanf("%d", &input_number);
#	if (input_number < 1 || input_number > MAX_NUM) {
	mov	eax, DWORD PTR -60[rbp]	# eax, input_number
	test	eax, eax	# input_number < 1
	jle	.L9
	mov	eax, DWORD PTR -60[rbp]	# eax, input_number
	cmp	eax, 217217217	# input_number > MAX_NUM
	jle	.L10
.L9:
	mov	eax, DWORD PTR -60[rbp]	# eax, input_number
	mov	esi, eax	# input_number second arg
	lea	rdi, .LC10[rip]	# "Incorrect number = %d\n" first arg
	mov	eax, 0
	call	printf@PLT	#  printf("Incorrect number = %d\n", input_number);
	mov	eax, 0	# return 0;
	jmp	.L11
.L10:
	mov	eax, DWORD PTR -60[rbp]	# eax, input_number
	mov	edi, eax	# input_number first arg of task()
	call	task@PLT	# task(input_number)
	lea	rdi, .LC11[rip]	# "\nResult: %.9lf\n" first arg
	mov	eax, 1
	call	printf@PLT	# printf("\nResult: %.9lf\n", task(input_number));
	mov	eax, 0	# return 0;
.L11:
	leave	
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
