USE Northwind;

SELECT ter.TerritoryDescription AS [Territory], CONCAT(emp.FirstName, ' ', emp.LastName) AS [Name]
FROM dbo.Employees AS emp
RIGHT JOIN dbo.EmployeeTerritories AS et ON emp.EmployeeID = et.EmployeeID
RIGHT JOIN dbo.Territories AS ter ON et.TerritoryID = ter.TerritoryID
ORDER BY ter.TerritoryDescription;

SELECT ter.TerritoryDescription AS [Territory], ISNULL(NULLIF(CONCAT(emp.FirstName, ' ', emp.LastName), ' '), 'No Employee') AS [Name]
FROM dbo.Employees AS emp
RIGHT JOIN dbo.EmployeeTerritories AS et ON emp.EmployeeID = et.EmployeeID
RIGHT JOIN dbo.Territories AS ter ON et.TerritoryID = ter.TerritoryID
ORDER BY ter.TerritoryDescription;

SELECT ter.TerritoryDescription AS [Territory], CONCAT(emp.FirstName, ' ', emp.LastName) AS [Name]
FROM dbo.Territories AS ter 
LEFT JOIN dbo.EmployeeTerritories AS et ON ter.TerritoryID = et.TerritoryID
LEFT JOIN dbo.Employees AS emp ON et.EmployeeID = emp.EmployeeID
ORDER BY ter.TerritoryDescription;