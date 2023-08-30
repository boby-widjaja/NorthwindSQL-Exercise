USE Northwind;

SELECT prod.UnitsInStock AS Stock,
	CASE
		WHEN prod.UnitsInStock  <= 20  THEN UPPER(CONCAT(prod.ProductName , ' ', '(Insufficient)'))
		WHEN prod.UnitsInStock > 20 AND prod.UnitsInStock < 80 THEN CONCAT(prod.ProductName , ' ', '(Sufficient)')
		WHEN prod.UnitsInStock >= 80 THEN CONCAT(prod.ProductName , ' ', '(Abundant)')
	END AS [Product Name]
FROM dbo.Products AS prod
ORDER BY prod.UnitsInStock;