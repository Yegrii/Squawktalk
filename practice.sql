--Вивести з/п спеціалістів ML Engineer в 2023 році

SELECT
	job_title,
	salary_in_usd
FROM
	salaries
WHERE
	job_title = 'ML Engineer';