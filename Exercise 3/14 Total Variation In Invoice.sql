USE Northwind;

SELECT ord.OrderID, FORMAT(ord.OrderDate, 'dd MMMM yyyy', 'id-ID') AS [Order Date], COUNT(ordet.ProductID) AS [Total Jenis Product]
FROM dbo.Orders AS ord
JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
GROUP BY ord.OrderID, ord.OrderDate
ORDER BY ord.OrderDate;