# Лабораторная работа по Распределенные системы хранения данных № 1
### Вариант 104
Используя сведения из представлений словаря данных, сформировать список таблиц в заданной схеме, хотя бы в одной из строк хотя бы одной из колонок имеющих значение 'NULL'. Полученную информацию представить в виде списка следующего формата:

``` Схема: s100000

 No. Имя таблицы
 --- -------------------------------
   1 Н_ЛЮДИ
   2 Н_ХАРАКТЕРИСТИКИ_ВИДОВ_РАБОТ
   3 Н_УЧЕНИКИ
   4 Н_ПЛАНЫ
   5 Н_ОТДЕЛЫ
	...
```

Запуск `psql -h pg -d studs -f script.sql -v v1="s207704";`

Где содержимое script.sql: `select "antipin_task"(:'v1');`, а параметр `v1` - схема из которой достаются необходимые данные. 
