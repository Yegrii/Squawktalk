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