Use Northwind;

SELECT RANK() OVER (ORDER BY pro.UnitPrice DESC) AS [Ranking],
	sup.CompanyName AS [Supplier], pro.ProductName, pro.UnitPrice
FROM dbo.Products AS pro
	JOIN (
		SELECT pro.SupplierID, MAX(pro.UnitPrice) AS [MaxPrice]
		FROM dbo.Products AS pro 
		GROUP BY pro.SupplierID
	) AS mostExp ON pro.SupplierID = mostExp.SupplierID
	JOIN dbo.Suppliers AS sup ON pro.SupplierID = sup.SupplierID
WHERE pro.UnitPrice = mostExp.MaxPrice
ORDER BY [Ranking], ProductName