--Вивести з/п спеціалістів ML Engineer в 2023 році

SELECT
	job_title,
	salary_in_usd
FROM
	salaries
WHERE
	job_title = 'ML Engineer';


/*
Назвати країну (company_location), в якій зафіксована найменша з/п спеціаліста
в сфері Data Scientist в 2023 році. 
*/

SELECT
	comp_location,
	salary_in_usd
FROM
	salaries
WHERE
	job_title = 'Data Scientist'
ORDER BY
	salary_in_usd
LIMIT 1;


--Вивести з/п українців (код країни UA), додати сортування за зростанням з/п

SELECT
	salary_in_usd
FROM
	salaries
WHERE
	emp_location = 'UA'
ORDER BY
	salary_in_usd;

/*
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