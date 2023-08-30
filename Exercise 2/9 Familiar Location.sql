USE Northwind;

SELECT cou.Country, sup.ContactName AS [Supplier], sup.Phone AS [Supplier Phone], CONCAT(emp.FirstName, ' ', emp.LastName) AS Employee, emp.HomePhone AS [Employee Phone]
FROM (
	SELECT sup.Country
	FROM dbo.Suppliers AS sup
	INTERSECT
	SELECT emp.Country
	FROM dbo.Employees AS emp
) AS cou
JOIN dbo.Suppliers AS sup ON cou.Country = sup.Country
JOIN dbo.Employees AS emp ON cou.Country = emp.Country
ORDER BY cou.Country;