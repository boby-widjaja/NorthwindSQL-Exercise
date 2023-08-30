USE Northwind;

SELECT CONCAT(emp.FirstName, ' ', emp.LastName) AS [Name], DATEDIFF(year, emp.BirthDate, GETDATE()) AS Age
FROM dbo.Employees AS emp
ORDER BY DATEDIFF(year, emp.BirthDate, GETDATE()) DESC;