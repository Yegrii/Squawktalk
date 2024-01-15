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
	