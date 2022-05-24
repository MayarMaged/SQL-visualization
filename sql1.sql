/*Query 1 - query used for "Most Popular Genre of Each Country"*/
WITH table1
AS (SELECT
  i.BillingCountry AS country,
  COUNT(il.InvoiceLineId) AS Purchases,
  g.Name AS genre,
  g.GenreId
FROM Invoice i
JOIN InvoiceLine il
  ON il.InvoiceId = i.InvoiceId
JOIN Track t
  ON t.TrackId = il.TrackId
JOIN Genre g
  ON g.GenreId = t.GenreId
GROUP BY 1,
         3,
         4),
table2
AS (SELECT
  table1.country AS c,
  MAX(table1.Purchases) AS Purchases
FROM table1
GROUP BY 1)
SELECT
  t1.country,
  t2.Purchases,
  t1.genre,
  t1.GenreId
FROM table1 t1
JOIN table2 t2
  ON t1.country = t2.c
  AND t2.Purchases = t1.Purchases;