Use Northwind;

SELECT TOP 2 cat.CategoryName AS [Category], SUM(prod.UnitsInStock) AS Stock
FROM dbo.Categories AS cat
JOIN dbo.Products AS prod ON cat.CategoryID = prod.CategoryID
GROUP BY cat.CategoryName
ORDER BY SUM(prod.UnitsInStock) ASC;