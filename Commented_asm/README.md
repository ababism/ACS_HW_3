# Переменные из Си-кода с их эквивалентными представлениями в Ассемблер-коде, а также комментирование регистров, вызова функций и регистров для них

## __main__:
### int main(int argc, char *argv[])
* i: -4
* FILE* output_stream: -16
* time_t t_start: -24
* time_t t_end: -40
* num: -28
* FILE* input_stream: -48
* FILE* output_stream: -56
* input_number = 0: -60
*  argc: -68
*  argv: -80


## task:
### double task(const int num)
* num: -20
* double prev_root: -8
* double new_root: -16


# Регистры
## Комментирование выполнено согласно следующим законам
 * rdi/edi - первый аргумент в функции
 * rsi/esi - второй аргумент в функции
 * rdx/edx - третий аргумент в функции
 * rcx - счётчик
 * eax/rax - для запоминания/аккумулирования данных
 * xmm - регистры для работы с double
