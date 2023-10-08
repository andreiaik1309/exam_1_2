Структура репозитория:

папка data содержит файлы с исходными данными: 
    '/data/IT_vacancies_full.csv';

папка DDL содержит скрипт create_tables.sql для создания таблицы;

папка DML содержит:
    скрипт load_data.sql для загрузки таблицы из файлов с исходными данными;
    Кроме того скрипт выполняет следующие действия:
        Удаляем столбцы, не обозначенные в схеме;
        Удаляем строки, где зарплата не задана;
        Переименовываем столбцы (чтобы убрать названия с пробелами и/или названия == служебные слова);
        Создание mat view для разных городов

Файл 'answer.pdf' - это ответ по заданию Часть 2: Извлечение информации : Напишите код для извлечения информации о средней заработной плате вакансий и местоположении, где вакансии наиболее распространены; Выведите это все в один отчет; Укажите в отчете то количество строк вакансий, которое получилось после удаления. Либо укажите команды, которыми вы удаляли данные.



Алгоритм работы

скачайте репозиторий на локальный ПК;

в терминале перейдите в директорию, где сохранили данный проект;

в командной строке запустите команду docker-compose up -d;

подключите базу данных к клиенту управления базами данных и изучите:
    Таблицы: it_vacancies

    Материализованные представления: it_vacancies_moscow, 
    it_vacancies_sp


Запустите команды:

select count(*) as total_rows from it_vacancies;

select Area, round(avg(salary_from), 2) as avg_salary_from, 
round(avg(salary_to), 2) as avg_salary_to,
count(*) as acount_vacancies from it_vacancies
group by Area;

