USE Northwind;

SELECT prod.ProductName AS [Product], sup.CompanyName AS [Supplier], cat.CategoryName AS [Category], prod.QuantityPerUnit AS [Package], prod.UnitsInStock AS [Stock]
FROM dbo.Products AS prod
JOIN dbo.Suppliers AS sup ON prod.SupplierID = sup.SupplierID
JOIN dbo.Categories AS cat ON prod.CategoryID = cat.CategoryID
WHERE prod.QuantityPerUnit LIKE '%bottle%' OR 
	  prod.QuantityPerUnit LIKE '%glass%' OR
	  prod.QuantityPerUnit LIKE '%jar%';