
SELECT 
	*
FROM 
	Invoice i 
LIMIT 10;


SELECT 
	*
FROM 
	InvoiceLine il 
LIMIT 10;


SELECT 
	*
FROM 
	Track t 
LIMIT 10;

SELECT 
	*
FROM 
	Album a 
LIMIT 10;

SELECT 
	*
FROM 
	Artist a2
LIMIT 10;


SELECT 
	*
FROM 
	Track t 
JOIN
	Album a ON
	t.AlbumId = a.AlbumId 
/* 1#
 Порівняти всіх музичних виконавчів за кількістю проданих музичних треків та загальною сумою продажу
*/

/*
SELECT 
	a.Name ,
	SUM(il.Quantity) AS sold_quantity,
	SUM(il.UnitPrice * il.Quantity) AS sold_in_usd
FROM 
	Artist a 
JOIN
	Album a2 ON
	a.ArtistId = a2.ArtistId
JOIN 
	Track t ON
	a2.AlbumId = t.AlbumId 
JOIN 
	InvoiceLine il ON
	t.TrackId = il.TrackId 
GROUP BY 
	a.Name 
ORDER BY 
	sold_quantity DESC, sold_in_usd DESC  
LIMIT 10;
*/

/* 2#
Сформувати топ-3 співробітника за рівнем продажів для кожного року
*/
	
	
	
/* 3#
Надати інформацію про клієнтів, які придбали музичні треки в межах 4 різних жанрів
*/
	
SELECT 
	c.CustomerId ,
	c.FirstName ,
	c.LastName ,
	COUNT(DISTINCT g.GenreId) AS num_genres
FROM 
	InvoiceLine il 
LEFT JOIN
	Track t ON
	il.TrackId = t.TrackId 
LEFT JOIN 
	Genre g ON
	t.GenreId = g.GenreId 
LEFT JOIN 
	Invoice i ON
	il.InvoiceId = i.InvoiceId 
LEFT JOIN 
	Customer c ON
	i.CustomerId = c.CustomerId 
GROUP BY 
	c.CustomerId , c.FirstName , c.LastName 
HAVING 
	COUNT(DISTINCT g.GenreId) >= 4
ORDER BY 
	num_genres DESC ;
	
/* 4#
Сформувати перелік клієнтів, які станом на останній місяць продажів не придбали нічого протягом 1 місяця, 2 місяців, 3 місяців
*/
	
	
	
/* 5#
Сформувати найбільш популярний жанр з числа перших покупок клієнтів
*/
	
	
	
/* 6#
Вивести динаміку продажів музичних треків за останні 3 роки
*/


/* 7#
Дослідити кумулятивну суму продажів для кожного замовника
*/


/* 8#
Розрахувати середній чек
*/


/* 9#
Розрахувати середню загальну суму продажу в перерахунку на одного замовника
*/


/* 10#
Розрахувати середню загальну суму продажу в перерахунку на одного замовника
*/


/* 11#
Розрахувати середню тривалість періоду між першою покупкою і другою
*/
