USE Northwind;

SELECT pvt.Title AS [Job Title], [Northern], [Eastern], [Southern], [Western]
FROM(
	SELECT DISTINCT emp.Title AS [Title], reg.RegionDescription AS [Region], emp.EmployeeID AS [Employee]
	FROM dbo.Employees AS emp
	JOIN dbo.EmployeeTerritories AS et ON emp.EmployeeID = et.EmployeeID
	JOIN dbo.Territories AS ter ON et.TerritoryID = ter.TerritoryID
	JOIN dbo.Region AS reg ON ter.RegionID = reg.RegionID
) AS jobTitleRegion
PIVOT(COUNT(jobTitleRegion.Employee) FOR jobTitleRegion.Region IN ([Northern], [Eastern], [Southern], [Western])) AS pvt
ORDER BY pvt.Title;