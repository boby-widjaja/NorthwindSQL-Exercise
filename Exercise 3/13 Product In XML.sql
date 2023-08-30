USE Northwind;

SELECT prod.ProductName AS [Name], cat.CategoryName AS [Category], sup.CompanyName AS [Supplier], prod.UnitPrice AS [Price]
FROM dbo.Products AS prod
JOIN dbo.Categories AS cat ON prod.CategoryID = cat.CategoryID
JOIN dbo.Suppliers AS sup ON prod.SupplierID = sup.SupplierID
FOR XML RAW('Product'), ROOT('ProductList'), ELEMENTS;