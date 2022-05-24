/*Query 2-Customer with highest purchases in each country*/
WITH table1
AS (SELECT
  c.CustomerId,
  c.FirstName,
  c.LastName,
  c.Country,
  SUM(i.total) AS totalPurchaces
FROM Customer c
JOIN Invoice i
  ON i.CustomerId = c.CustomerId
GROUP BY 1,
         2,
         3,
         4),
table2
AS (SELECT
  table1.Country AS Country,
  MAX(table1.totalPurchaces) AS MaxPurchaces
FROM table1
GROUP BY 1)
SELECT
  t1.Country,
  t2.MaxPurchaces AS TotalSpent,
  t1.FirstName,
  t1.LastName,
  t1.CustomerId
FROM table1 t1
JOIN table2 t2
  ON t1.Country = t2.Country
  AND t2.MaxPurchaces = t1.totalPurchaces
ORDER BY 1;
