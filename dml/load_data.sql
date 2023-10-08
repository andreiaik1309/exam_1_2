-- Вставляем данные из файла IT_vacancies_full.csv
--INSERT INTO it_vacancies
--FROM INFILE '/data/IT_vacancies_full.csv'
 --   FORMAT CSVWithNames;

INSERT INTO it_vacancies
FROM INFILE '/data/IT_vacancies_full.csv.gz'
COMPRESSION 'gzip' FORMAT CSVWithNames;


-- Удаляем столбцы, не обозначенные в схеме
ALTER TABLE it_vacancies DROP COLUMN `Professional roles`;
ALTER TABLE it_vacancies DROP COLUMN `Specializations`;
ALTER TABLE it_vacancies DROP COLUMN `Profarea names`;

-- Удаляем строки, где зарплата не задана
ALTER TABLE it_vacancies DELETE WHERE Salary=0;

-- Переименуем столбцы
ALTER TABLE it_vacancies RENAME COLUMN  `Name` TO name_vacancies;
ALTER TABLE it_vacancies RENAME COLUMN `From` TO salary_from;
ALTER TABLE it_vacancies RENAME COLUMN `To` TO salary_to;
ALTER TABLE it_vacancies RENAME COLUMN `Published at` TO published_at;


-- Создание mat view для разных городов
CREATE MATERIALIZED VIEW IF NOT EXISTS it_vacancies_moscow 
ENGINE = MergeTree()
ORDER BY (`Ids`)
POPULATE AS SELECT *
 FROM it_vacancies where Area  = 'Москва';

CREATE MATERIALIZED VIEW IF NOT EXISTS it_vacancies_sp
ENGINE = MergeTree()
ORDER BY (`Ids`)
POPULATE AS SELECT *
 FROM it_vacancies where Area  = 'Санкт-Петербург';






