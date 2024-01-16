/* #1 
Вивести з/п спеціалістів ML Engineer в 2023 році
*/

SELECT
	job_title,
	salary_in_usd
FROM
	salaries
WHERE
	job_title = 'ML Engineer'
	AND year = 2023;


/* #2
Назвати країну (company_location), в якій зафіксована найменша з/п спеціаліста
в сфері Data Scientist в 2023 році. 
*/

SELECT
	comp_location,
	salary_in_usd,
	job_title,
	year
FROM
	salaries
WHERE
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY
	salary_in_usd
LIMIT 1;


/* 3#
Вивести з/п українців (код країни UA), додати сортування за зростанням з/п
*/

SELECT
	salary_in_usd
FROM
	salaries
WHERE
	emp_location = 'UA'
ORDER BY
	salary_in_usd;


/* 4#
Вивести топ 5 з/п серед усіх спеціалістів, які працюють повністю віддалено 
(remote_ratio = 100)
*/

SELECT
	job_title,
	salary_in_usd
FROM
	salaries
WHERE
	remote_ratio = 100
ORDER BY
	salary_in_usd DESC
LIMIT 5;

/* 5#
Згенерувати .csv файл з таблицею даних всіх спеціалістів, які в 2023 році мали з/п більшу 
за $100,000 і працювали в компаніях середнього розміру (company_size = 'M')
*/

SELECT
	*
FROM
	salaries
WHERE
	salary_in_usd > 100000
	AND
	comp_size = 'M';

/* 6# 
Вивести кількість унікальних значень для кожної колонки, що містить текстові значення.
*/

/* 7#
Вивести унікальні значення для кожної колонки, що містить текстові значення. 
(SELECT DISTINCT column_name FROM salaries)
*/

/* 8#
Вивести середню, мінімальну та максимальну з/п (salary_in_usd)
для кожного року (окремими запитами, в кожному з яких впроваджено фільтр відповідного року)
*/

SELECT
	year,
	MIN(salary_in_usd) AS min_salary
FROM
	salaries
GROUP BY
	year
ORDER BY
	year;

SELECT
	year,
	MAX(salary_in_usd) AS max_salary
FROM
	salaries
GROUP BY
	year
ORDER BY
	year;
	
SELECT
	year,
	AVG(salary_in_usd) AS avg_salary
FROM
	salaries
GROUP BY
	year
ORDER BY
	year;

/* 9#
 Вивести середню з/п (salary_in_usd) для 2023 року по кожному рівню досвіду працівників 
 (окремими запитами, в кожному з яких впроваджено фільтр року та досвіду).
*/

SELECT
	exp_level,
	AVG(salary_in_usd) AS avg_salary
FROM
	salaries
WHERE
	year = 2023
GROUP BY
	exp_level
ORDER BY
	avg_salary DESC;
	
SELECT
	CASE
		WHEN exp_level = 'EX' THEN 'Executive'
		WHEN exp_level = 'SE' THEN 'Senior'
		WHEN exp_level = 'MI' THEN 'Middle'
		ELSE 'Entry' END AS experience_level,
	year,
	AVG(salary_in_usd) AS avg_salary
FROM
	salaries
WHERE
	year = 2023
GROUP BY
	1, 2
ORDER BY
	avg_salary DESC;

/* 10#
Вивести 5 найвищих заробітних плат в 2023 році для представників спеціальності ML Engineer.
Заробітні плати перевести в гривні.
*/

SELECT
	year,
	job_title,
	salary_in_usd * 38 AS salary_in_uah
FROM
	salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY
	salary_in_uah DESC
LIMIT 5;

/* 11#
Вивести Унікальні значення колонки remote_ratio, формат даних має бути 
дробовим з двома знаками після коми, приклад: значення 50 має відображатись в форматі 0.50
*/

SELECT
	DISTINCT ROUND(remote_ratio/100.0, 2) AS round_remote_ratio
FROM
	salaries
ORDER BY
	round_remote_ratio DESC;
	
/* 12#
 Вивести дані таблиці, додавши колонку 'exp_level_full' з повною назвою рівнів досвіду
 працівників відповідно до колонки exp_level. Визначення: Entry-level (EN), Mid-level (MI), 
 Senior-level (SE), Executive-level (EX)
*/

SELECT
	*,
	CASE
		WHEN exp_level = 'EX' THEN 'Executive-level'
		WHEN exp_level = 'SE' THEN 'Senior-level'
		WHEN exp_level = 'MI' THEN 'Mid-level'
		ELSE 'Entry-level' END AS exp_level_full
FROM
	salaries;
	
/* 13#
Додатки колонку "salary_category', яка буде відображати різні категорії заробітних плат 
відповідно до їх значення в колонці 'salary_in_usd'. Визначення: з/п менша за 
20 000 - Категорія 1, з/п менша за 50 000 - Категорія 2, з/п менша за 
100 000 - Категорія 3, з/п більша за 100 000 - Категорія 4
*/

SELECT
	*,
	CASE
		WHEN salary_in_usd < 20000 THEN 'Category 1'
		WHEN salary_in_usd < 50000 THEN 'Category 2'
		WHEN salary_in_usd < 100000 THEN 'Category 3'
		ELSE 'Category 4' END AS salary_category
FROM
	salaries;
	
/* 14#
Дослідити всі колонки на наявність відсутніх значень, порівнявши кількість рядків 
таблиці з кількістю значень відповідної колонки
*/

/* 15#
Порахувати кількість працівників в таблиці, які в 2023 році працюють на 
компанії розміру "М" і отримують з/п вищу за $100 000
*/

SELECT
	COUNT(*) AS num_of_employees
FROM
	salaries
WHERE
	comp_size = 'M'
	AND year = 2023
	AND salary_in_usd > 100000;
	
/* 16#
Вивести всіх співробітників, які в 2023 отримували з/п більшу за $300тис.
*/

SELECT
	*
FROM
	salaries
WHERE
	year = 2023
	AND salary_in_usd > 300000;
	
/* 17#
Вивести всіх співробітників, які в 2023 отримували з/п більшу за $300тис. 
та не працювали в великих компаніях.
*/

SELECT
	*
FROM
	salaries
WHERE
	year = 2023
	AND salary_in_usd > 300000
	AND comp_size != 'L';
	
/* 18#
Чи є співробітники, які працювали на Українську компанію повністю віддалено?
*/

SELECT
	*
FROM
	salaries
WHERE
	comp_location = 'UA'
	AND remote_ratio = 100;
	
/* 19#
Вивести всіх співробітників, які в 2023 році працюючи в Німеччині 
(company_location = 'DE') отримували з/п більшу за $100тис.
*/

SELECT
	*
FROM
	salaries
WHERE
	comp_location = 'DE'
	AND salary_in_usd > 100000
	AND year = 2023;
	
/* 20#
Доопрацювати попередній запит: Вивести з результатів тільки ТОП 5 співробітників за рівнем з/п.
*/

SELECT
	*
FROM
	salaries
WHERE
	comp_location = 'DE'
	AND salary_in_usd > 100000
	AND year = 2023
ORDER BY
	salary_in_usd DESC
LIMIT 5;

/* 21#
Додати в попередню таблицю окрім спеціалістів з Німеччини спеціалістів з Канади (CA).
*/

SELECT
	*
FROM
	salaries
WHERE
	comp_location IN ('DE', 'CA')
	AND salary_in_usd > 100000
	AND year = 2023
ORDER BY
	salary_in_usd DESC
LIMIT 5;

/* 22#
Надати перелік країн, в яких в 2021 році спеціалісти "ML Engineer" та 
"Data Scientist" отримувати з/п в діапазоні між $50тис і $100тис
*/

SELECT
	comp_location AS company_location,
	emp_location AS employee_location
FROM
	salaries
WHERE
	year = 2021
	AND job_title IN ('ML Engineer', 'Data Scientist')
	AND salary_in_usd BETWEEN 50000 AND 100000;
	
/* 23#
Порахувати кількість спеціалістів, які працюючи в середніх компаніях 
(company_size = M) та в великих компаніях (company_size = L) 
працювали віддалено (remote_ratio=100 або remote_ratio=50).
*/

SELECT
	COUNT(*) AS num_of_employees
FROM
	salaries
WHERE
	comp_size IN ('M', 'L')
	AND remote_ratio IN (100, 50);
	
/* 24#
Вивести кількість країн, які починаються на "С".
*/

SELECT
	COUNT(*) AS country_count
FROM
	salaries
WHERE
	comp_location LIKE 'C%';
	
/* 25#
Вивести професії, назва яких не складається з трьох слів.
*/


/* 26#
Для кожного року навести дані щодо середньої заробітної плати та кількості спеціалістів. 
Результат експортувати в .csv файл, імпортувати файл в Power BI і 
побудувати доречну візуалізацію отриманих даних.
*/

SELECT
	year,
	ROUND(AVG(salary_in_usd), 2) AS avg_salary_in_usd,
	COUNT(*) AS num_of_employees
FROM
	salaries
GROUP BY
	year
ORDER BY 
	year;