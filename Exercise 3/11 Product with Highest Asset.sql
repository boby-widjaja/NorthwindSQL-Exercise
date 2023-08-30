USE Northwind;

SELECT pro.ProductName, (pro.UnitsInStock * pro.UnitPrice) AS Asset
FROM dbo.Products AS pro
WHERE pro.Discontinued = 0
ORDER BY Asset DESC;