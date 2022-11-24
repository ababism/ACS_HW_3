# ACS_HW_2
# Архитектуры вычислительных систем. ИДЗ № 2. Вариант 10 <br/> Киселев Иван БПИ217.

## Описание репозитория:

### Решение задачи на C сразу на 9 балов 
**[](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)** 
> 2 единицы комплиляции + прием аргументов командной строки для ввода с файла + генерация + таймер

### Код на Assembly с комментариями + Доп. Комментарии
[Commented_asm](https://github.com/ababism/ACS_HW_2/tree/main/Commented_asm)
> Код послужил основанием для комментариев, доп. комментарии в README.md

### Модифицированный код на Assembly + Список изменений
[Modded_asm](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)
> Список изменений в файле README.md

### Тестирование программы + задача на 8 и 9 баллов
[Tests](https://github.com/ababism/ACS_HW_2/tree/main/Tests)
> Удобно добавить задание на 8 и 9 баллов в тесты

# О программе

1. При обычно запуске будет выведена понятная менюшка

2. При вводе одного аргумента (это должна быть целая строка) командной строки программа будет работать с таймером, который засечет выполнение нашего задания (task) 20 миллионов раз
```
./program.exe ваша_строка
```
3. При файловом вводе-выводе надо ввести два аргумента -- названия существующих двух файлов, которые лежат в папке с .exe: первый файл ввод

```
./program.exe input.txt output.txt
```

# Отсчет

## Задание на 4 балла:
**✔[Решение задачи на C](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)**

**✔ [Не модифицированный код на Assembly с комментариями](https://github.com/ababism/ACS_HW_2/tree/main/Commented_asm)**
Сборка согласно семинарам, другие варианты сборки в задании на 9
<img width="537" alt="image" src="https://user-images.githubusercontent.com/111705295/201545529-32bea517-8dd2-4c26-bb94-c271002d2e0a.png">

**✔ [Модифицированный код на Assembly (убраны макросы)](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**
Изменения подробнее написаны в README

** [Список изменений к ней](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**
В README

**✔ [Полное тестовое покрытие](https://github.com/ababism/ACS_HW_2/tree/main/Tests)**
Прогоны для обоих програм, все работает

### Итог:

Все корректно работает, код был откомментрован максильно подробно (сразу на 9 баллов)

## Задание на 5 баллов:
**✔ [Комментарии и код на Assembly](https://github.com/ababism/ACS_HW_2/tree/main/Commented_asm)**
 В код добавлены комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата + в README.md
 
 
**✔[Решение задачи на C](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)** 
Уже было
**✔ [Модифицированный код на Assembly](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**
Уже было

### Итог:

Весь код был прокомментирван, включая передачу параметров в функции (mov регистр для соотвествующего аргумента, значение аргумента) и использование переменных.


## Задание на 6 баллов:

**✔ [Модифицированный код на Assembly (с рефакторингом)](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**
Регистры и изменения описаны в README

**✔ [Комментарии для регистров и код на Assembly](https://github.com/ababism/ACS_HW_2/tree/main/Commented_asm)**

### [Внесенные изменения](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)
После измененений ассмемблер код уменьшился на 453 (было суммарно) - 407 (стало) = 46 строк

**✔ [Тестирование программы через консоль и генерацию](https://github.com/ababism/ACS_HW_2/tree/main/Tests)**
Тестовые прогоны делались на финальной модифицированной версии асм (включает все на 9 баллов) + кончено и на первоначальной

### Итог:

Выполен рефакторинг программы на ассемблере за счет максимального использования регистров процессора (в основном замены переменной итератора из стека на регист r14d/r15d). В ходе тестирования получены идентичные значения.

## Задание на 7 баллов:

**✔ [Код на C, содержащий 3 единицы компиляции](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)** 

**✔ [Модифицированный код на ассемблере, содержащий 3 следующие единицы компиляции](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**

Также есть проверка на неккоректный файл (при такой опции пользователю выводит "Could not open file. Press any key to exit")

**✔ [Файлы для тестов](https://github.com/ababism/ACS_HW_2/tree/main/Files_for_test)**
** [Проведение тестов с этими файлами](https://github.com/ababism/ACS_HW_2/tree/main/Tests)**


## Задание на 8 баллов:

**✔ [Код на C, содержащий генератор случайных значений](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)** 

**✔ [Модифицированный код на ассемблере, содержащий генератор случайных значений и выбор типа ввода](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)**


**✔ Тестирование автоматически сгенерированных данных с замером времени**
* [Тесты](https://github.com/ababism/ACS_HW_2/tree/main/Tests)
Здесь таймер и подробно время и размер


### Итог:

Был реализован таймер замеряющий только задание из варианта. Повторяя решение для массиива из 200, 100, 10 символов 20млн раз мы смогли протестировать среднее время выполнения (на случайных данных) и убедились, что уменьшили время работы на более 1 секунды.

## Задание на 9 баллов:
**✔ Отмечено и сделано в тестах**
* [Тесты](https://github.com/ababism/ACS_HW_2/tree/main/Tests)
Используем опции, все они в таблице
