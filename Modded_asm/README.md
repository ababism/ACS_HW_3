# Список внесенных изменений в asm
## Задание на 4 баллов (в отдельно папке):
### Убраны макросы
``` assembly
# endbr
# cdqe
# cdq (в main не получилось убрать, так как он был важен для rand())
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
i[-4] --> r13d
```

### task.s
``` assembly
DWORD PTR -20[rbp] = r12d
QWORD PTR -8[rbp] = xmm7 (prev_root)
QWORD PTR -16[rbp] = xmm8 (new_root)
```

### Убраны присваивания, не влияющие на логику программы:

**task.s**
``` assembly
movsd	xmm0, xmm8
movsd	xmm7, xmm0
```
** Стало **
``` assembly
movsd	xmm7, xmm8
```
**main.s**
145:
``` assembly
mov	rax, QWORD PTR [rax]
	mov	rdi, rax
```
** Стало **
``` assembly
mov	rdi, QWORD PTR [rax]
```

149:
``` assembly
mov	eax, DWORD PTR -28[rbp]
mov	esi, eax
```
** Стало **
``` assembly
mov	esi, DWORD PTR -28[rbp]
```

156:
``` assembly
mov	eax, DWORD PTR -28[rbp]
mov	edi, eax
```
** Стало **
``` assembly
mov	edi, DWORD PTR -28[rbp]
```

163:
``` assembly
mov	QWORD PTR -40[rbp], rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
```
** Стало **
``` assembly
mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -40[rbp], rax
	mov	rsi, QWORD PTR -24[rbp]
	mov	rdi, QWORD PTR -40[rbp]
```
179:
``` assembly
mov	eax, DWORD PTR -28[rbp]
mov	edi, eax
```
** Стало **
``` assembly
mov	edi, DWORD PTR -28[rbp]
```
179:
``` assembly
mov	eax, DWORD PTR -28[rbp]
mov	edi, eax
```
** Стало **
``` assembly
mov	edi, DWORD PTR -28[rbp]
```

203:
``` assembly
mov	eax, DWORD PTR -60[rbp]
mov	esi, eax
```
** Стало **
``` assembly
mov	esi, DWORD PTR -60[rbp]
```
210:
``` assembly
mov	eax, DWORD PTR -60[rbp]
mov	edi, eax
```
** Стало **
``` assembly
mov	edi, DWORD PTR -60[rbp]
```
Красиво показана часть изменений:
<img width="1064" alt="image" src="https://user-images.githubusercontent.com/111705295/204145526-7a9e9b8a-6a6c-4994-aee1-c20260754678.png">
