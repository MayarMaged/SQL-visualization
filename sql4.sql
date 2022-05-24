/*Query 4 - Employees number of invoices */
SELECT
  e.EmployeeId,
  e.FirstName,
  e.LastName,
  COUNT(c.SupportRepId) AS Invoices,
  STRFTIME('%Y-%m-%d', e.HireDate) AS HireDate
FROM Employee e
JOIN Customer c
  ON c.SupportRepId = e.EmployeeId
JOIN Invoice i
  ON i.CustomerId = c.CustomerId
GROUP BY 1,
         2,
         3,
         5
ORDER BY 4 DESC;








