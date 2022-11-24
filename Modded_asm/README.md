# Список внесенных изменений в asm
## Задание на 4 баллов (в отдельно папке):
### Убраны макросы
``` assembly
# endbr
# cdqe
# cdq
```

### Вручную удалены строки, не влияющие на ход программы, в конце каждого файла
``` assembly
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
```
## Задание на 6 баллов (финальное):

### Внесенные изменения:
### main.s
``` assembly
i[-4] --> r14d 
```

### task.s
``` assembly
j[-4] = r15d
```

### Убраны присваивания, не влияющие на логику программы:

**task.s**
``` assembly
mov	rdx, QWORD PTR -16[rbp]
mov	rax, QWORD PTR -8[rbp]
mov	rsi, rdx
mov	rdi, rax
```
** Стало **
``` assembly
mov	rsi, QWORD PTR -16[rbp]
mov	rdi, QWORD PTR -8[rbp]
```
