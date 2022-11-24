# Переменные из Си-кода с их эквивалентными представлениями в Ассемблер-коде, а также комментирование регистров, вызова функций и регистров для них

## __main__:
### int main(int argc, char *argv[])
* i: -4
* t_start: -16
* t_end = clock(): -24
* FILE* input_stream: -32
* FILE* output_stream: -40
* ch_arr: -271
* input_type_flag: -276
* length = 0: -280
*  argc: -292
*  argv: -304

## task:

### void reverse(char *it_start, char *it_end)
* first: -40
* it_end: -48
* it_l: -8
* it_r: -16
* size: -24
* i = 0: -20
* temp: -25

### int task(const char *str);
* str: -40
* char *it_l: -8
* char *it_r: -16
* char *eof: -24

### char *task_random(int length, char *ch_arr)
* length: -20
* ch_arr: -32
* j: -4

### char *task_manual(char *ch_arr)
* ch_arr: -8


# Регистры
## Комментирование выполнено согласно следующим законам
 * rdi/edi - первый аргумент в функции
 * rsi/esi - второй аргумент в функции
 * rdx/edx - третий аргумент в функции
 * rcx - счётчик
 * eax/rax - для запоминания/аккумулирования данных
