
## Тесты

# Unmodded
### Тесты:

1. Manual input
<img width="856" alt="image" src="https://user-images.githubusercontent.com/111705295/201544935-e563cc99-ef1e-4497-9765-1ebdd848fded.png">

2. File input
<img width="1066" alt="image" src="https://user-images.githubusercontent.com/111705295/201544956-7c069cb1-bd1f-464c-b3fc-d74e2d0501d7.png">

3. Random generation
<img width="988" alt="image" src="https://user-images.githubusercontent.com/111705295/201544987-395d23dc-bca8-440d-a84b-6fcb199daf3e.png">

4. Random generation incorrect lenght
<img width="814" alt="image" src="https://user-images.githubusercontent.com/111705295/201545062-d3a0c75c-517a-4ddc-8a56-6e724d2e3ad4.png">

5. Cmd arg + Timer
<img width="1053" alt="image" src="https://user-images.githubusercontent.com/111705295/201545106-a784996e-37f3-4e3e-8e64-3032b610d94d.png">


----
# Modded
### Все тесты сразу:
<img width="1174" alt="image" src="https://user-images.githubusercontent.com/111705295/201545298-93a8bfa9-9dbe-4383-b950-ccf2175007ce.png">

### Тесты:
1. Manual input

2. File input

3. Random generation

4. Random generation incorrect lenght
<img width="529" alt="image" src="https://user-images.githubusercontent.com/111705295/201545405-e50b66dc-6803-48e0-8c92-9a71596252e4.png">

5. Cmd arg + Timer

# 7 баллов
Файлы
<img width="917" alt="image" src="https://user-images.githubusercontent.com/111705295/201546722-5662fe20-f0a3-484a-95e7-645931654e69.png">
<img width="1066" alt="image" src="https://user-images.githubusercontent.com/111705295/201544956-7c069cb1-bd1f-464c-b3fc-d74e2d0501d7.png">
 # 8 и 9 баллов
 
> Первый тест: размер 200, 20 млн отработок функции task. <br/>
> Второй тест: размер 100, 20 млн отработок функции task. <br/>
> Третий тест: размер 10, 20 млн отработок функции task. <br/> 

| Тип программы  | Время работы первого теста  | Время работы второго теста  | Время работы третьего теста  | Размер исполняемого файла | Суммарное количество строк | 
| :---: | :---: | :---: | :---: | :---: | :---: | 
| [Программа на C с замером времени](https://github.com/ababism/ACS_HW_2/tree/main/C_Files)  | 19362мс  | 8966мс  | 860мс  | 17кб  | 115 строк  | 
| [Программа на ассемблере без модификаций с замером времени](https://github.com/ababism/ACS_HW_2/tree/main/Unmoded_asm)  | 53827мс  | 24826мс  | 2432мс  | 17кб  | 453 строк  | 
| [Программа на ассемблере с модификациями с замером времени](https://github.com/ababism/ACS_HW_2/tree/main/Modded_asm)  | 46286мс  | 23131мс  | 22730мс  | 17кб  | 407 строк  | 
> Само проведение тестов
<img width="1140" alt="image" src="https://user-images.githubusercontent.com/111705295/201547473-0c797e31-4193-4a81-8979-cbadd05e313e.png">
<img width="1111" alt="image" src="https://user-images.githubusercontent.com/111705295/201547490-62d98d55-47a1-4463-9bab-b01c21a1a4e9.png">

## Задание на 9 баллов:

| Тип программы  | Опция откладки | Суммарное количество строк | Размер исполняемого файла, KiB |  Время, ms |
| :---: | :---: | :---: | :---: | :---: | 
| Программа на C | O0 | 503 | 17 | 48530 | 
| Программа на C | O1 | 484 | 17 | 5859 |
| Программа на C | O2 | 508 | 17,1 | 3698 | 
| Программа на C | O3 | 508 | 17,1 | 3721 | 
| Программа на C | Os | 418 | 17 | 34447 | 
| Программа на C | Ofast | 508 | 17,1 | 3698 |
| Программа на ассемблере | - | 407 | 17 |  46286 | 

Итог: программа одинакого оптимизированна по скорости флагами O2 O3 Ofast, при этом она достигает на них маскимальной скорости. Самая маленькая по размеру оптимицазия это Os

>Проверялось следующим образом размер строки 200 символов, 20 млн отработок функции task:
> O0
<img width="924" alt="image" src="https://user-images.githubusercontent.com/111705295/201548453-04215680-e9e8-45eb-a9e0-7150cc963845.png">
> O2
<img width="906" alt="image" src="https://user-images.githubusercontent.com/111705295/201549359-70319125-99e1-4f4e-9913-f417bf7e097b.png">
> Os
<img width="1085" alt="image" src="https://user-images.githubusercontent.com/111705295/201549393-ff58455b-3109-4175-8334-0eeccec344ec.png">
