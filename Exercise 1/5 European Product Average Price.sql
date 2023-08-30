USE Northwind;

SELECT sup.Country, AVG(prod.UnitPrice) AS [Average Product Price]
FROM dbo.Products AS prod
	JOIN dbo.Suppliers AS sup ON prod.SupplierID = sup.SupplierID
WHERE sup.Country IN ('Germany', 'Spain', 'Sweden', 'Italy', 'Norway', 'Denmark', 'Netherlands', 'Finland', 'France')
GROUP BY sup.Country
	HAVING AVG(prod.UnitPrice) <= 50
ORDER BY AVG(prod.UnitPrice) DESC;