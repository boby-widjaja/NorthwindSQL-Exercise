USE Northwind;

SELECT *
FROM(SELECT cus.ContactName AS [Name], cus.Phone AS [Phone Number], 'Customer' AS [Entity Group]
	FROM dbo.Customers AS cus
	UNION
	SELECT CONCAT(emp.FirstName, ' ', emp.LastName) AS [Name], emp.HomePhone AS [Phone Number], 'Employee' AS [Entity Group]
	FROM dbo.Employees AS emp
	UNION
	SELECT sup.ContactName AS [Name], sup.Phone AS [Phone Number], 'Supplier' AS [Entity Group]
	FROM dbo.Suppliers AS sup) AS pb
ORDER BY pb.[Name] DESC;