# ACS_HW_3
# Архитектуры вычислительных систем. ИДЗ № 3. Вариант 26 <br/> Киселев Иван БПИ217.

## Описание репозитория:

### Решение задачи на C сразу на 9 балов 
**[C_Files](https://github.com/ababism/ACS_HW_3/tree/main/C_Files)** 
> 2 единицы комплиляции + прием аргументов командной строки для ввода с файла + генерация + таймер

### Код на Assembly с комментариями + Доп. Комментарии
[Commented_asm](https://github.com/ababism/ACS_HW_3/tree/main/Commented_asm)
> Код послужил основанием для комментариев, доп. комментарии в README.md

### Модифицированный код на Assembly + Список изменений
[Modded_asm](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)
> Список изменений в файле README.md

### Тестирование программы + задача на 8 и 9 баллов
[Tests](https://github.com/ababism/ACS_HW_3/tree/main/Tests)
> Удобно добавить задание на 8 и 9 баллов в тесты

# О программе
> Программа выдает результат с точнотью 0,000000001 (9 знаков после запятой), что не хуже точности 0,0001

1. При обычном запуске будет выведена понятная менюшка

2. При вводе одного аргумента (число не разделенное другими символами) командной строки программа будет работать с таймером, который засечет только выполнение нашего задания (task) 10 миллионов раз
```
./program.exe вашe_число
```

3.1 При файловом вводе-выводе надо ввести два аргумента -- названия существующих двух файлов, которые лежат в папке с .exe: первый файл для ввода

```
./program.exe input.txt output.txt
```
3.2 При рандомной генерации (и файловом выводе) надо ввести два аргумента -- первый это "флаг" ':', второй -- название файла, который лежит в папке с .exe. Рандомное число появится на дисплее в консоли, а ответ будет в файле

```
./program.exe : output.txt
```

# Отсчет

## Задание на 4 балла:
**✔[Решение задачи на C](https://github.com/ababism/ACS_HW_3/tree/main/C_Files)**

**✔ [Не модифицированный код на Assembly с комментариями](https://github.com/ababism/ACS_HW_3/tree/main/Commented_asm)**
Сборка согласно семинарам, другие варианты сборки в задании на 9

<img width="581" alt="image" src="https://user-images.githubusercontent.com/111705295/204144467-3294c8f9-fbeb-4c74-9771-5a7e5d357724.png">

**✔ [Модифицированный код на Assembly (убраны макросы)](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)**
Изменения подробнее написаны в README

* [Список изменений к ней](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)
В README

**✔ [Полное тестовое покрытие](https://github.com/ababism/ACS_HW_3/tree/main/Tests)**
Прогоны для обоих програм, все работает

### Итог:

Все корректно работает, код был откомментрован максимально подробно (сразу на 9 баллов), также отельно выписаны все изменения и адреса переменных

## Задание на 5 баллов:
**✔ [Комментарии и код на Assembly](https://github.com/ababism/ACS_HW_3/tree/main/Commented_asm)**
 В код добавлены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата + в README.md
 
 
**✔[Решение задачи на C](https://github.com/ababism/ACS_HW_3/tree/main/C_Files)** 
Уже было
**✔ [Модифицированный код на Assembly](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)**
Уже было

### Итог:

Весь код был прокомментирван, включая передачу параметров в функции (mov регистр для соотвествующего аргумента, значение аргумента) и использование переменных.


## Задание на 6 баллов:

**✔ [Модифицированный код на Assembly (с рефакторингом)](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)**
Регистры и изменения описаны в README

**✔ [Комментарии для регистров и код на Assembly](https://github.com/ababism/ACS_HW_3/tree/main/Commented_asm)**

### [Внесенные изменения](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)
После измененений ассмемблер код уменьшился на 323 (было суммарно) - 280 (стало) = 43 строк

**✔ [Тестирование программы через консоль и генерацию](https://github.com/ababism/ACS_HW_3/tree/main/Tests)**
Тестовые прогоны делались на финальной модифицированной версии асм (включает весь функционал и изменения на 9 баллов) + кончено и на первоначальной

### Итог:

Выполен рефакторинг программы на ассемблере за счет максимального использования регистров процессора (в основном замены переменной итератора из стека на регист r14d/r15d). В ходе тестирования получены идентичные значения.

## Задание на 7 баллов:

**✔ [Код на C, содержащий 3 единицы компиляции](https://github.com/ababism/ACS_HW_3/tree/main/C_Files)** 

**✔ [Модифицированный код на ассемблере, содержащий 3 следующие единицы компиляции](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)**

Также есть проверка на неккоректный файл (при такой опции пользователю выводит "Could not open file. Press any key to exit")
При отсутсвии указанного файла для вывода программа его сама создаст

**✔ [Файлы для тестов](https://github.com/ababism/ACS_HW_3/tree/main/Files_for_test)**
** [Проведение тестов с этими файлами](https://github.com/ababism/ACS_HW_3/tree/main/Tests)**


## Задание на 8 баллов:

**✔ [Код на C, содержащий генератор случайных значений](https://github.com/ababism/ACS_HW_3/tree/main/C_Files)** 

**✔ [Модифицированный код на ассемблере, содержащий генератор случайных значений и выбор типа ввода](https://github.com/ababism/ACS_HW_3/tree/main/Modded_asm)**


**✔ Тестирование данных с замером времени**
* [Тесты](https://github.com/ababism/ACS_HW_3/tree/main/Tests)
Здесь таймер и подробно время и размер для всех трех программ


### Итог:

Был реализован таймер замеряющий только задание из варианта. Повторяя решение для чисел 217, 217217, 217217217 10млн раз мы смогли протестировать время выполнения и убедились, что уменьшили время работы на более чем 1 секунду.

## Задание на 9 баллов:
**✔ Отмечено и сделано в тестах**
* [Тесты](https://github.com/ababism/ACS_HW_3/tree/main/Tests)
Используем опции -O0 -O1 -O2 -O3 -Os -Ofast и другие, все они есть в таблице и приложении под ней. Испаолняемые и ams файлы лежат в папке [asm_optimizations](https://github.com/ababism/ACS_HW_3/tree/main/asm_optimizations)

Продублирую сюда итог:

### Итог:

Программа одинакого оптимизированна по скорости флагами O2 O3. При этом она достигает маскимальной скорости на флаге -Ofast. Самая маленькая по размеру оптимицазия это Os, но при этом наша оптимицазия программы на asm почти что достигла уровня флага -Os как по скорости так и по размеру
