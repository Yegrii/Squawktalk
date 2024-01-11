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