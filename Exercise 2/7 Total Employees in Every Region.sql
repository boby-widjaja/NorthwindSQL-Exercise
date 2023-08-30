USE Northwind;

SELECT reg.RegionDescription AS [Description], regCt.[Total Employee]
FROM dbo.Region AS reg
JOIN (
	SELECT ter.RegionID , COUNT(DISTINCT emp.EmployeeID) AS [Total Employee]
	FROM dbo.Employees AS emp
	JOIN dbo.EmployeeTerritories AS et ON emp.EmployeeID = et.EmployeeID
	JOIN dbo.Territories AS ter ON et.TerritoryID = ter.TerritoryID
	GROUP BY ter.RegionID) AS regCt ON reg.RegionID = regCt.RegionID
ORDER BY regCt.[Total Employee] DESC, RegionDescription ASC;

SELECT reg.RegionDescription , COUNT(DISTINCT emp.EmployeeID) AS [Total Employee]
FROM dbo.Employees AS emp
JOIN dbo.EmployeeTerritories AS et ON emp.EmployeeID = et.EmployeeID
JOIN dbo.Territories AS ter ON et.TerritoryID = ter.TerritoryID
JOIN dbo.Region AS reg ON ter.RegionID = reg.RegionID
GROUP BY reg.RegionDescription
ORDER BY COUNT(DISTINCT emp.EmployeeID) DESC, RegionDescription;