SELECT TOP 1 ship.CompanyName AS [Shipper], COUNT(ord.OrderID) AS [Orders]
FROM dbo.Orders AS ord
JOIN dbo.Shippers AS ship ON ord.ShipVia = ship.ShipperID
GROUP BY ship.CompanyName
ORDER BY COUNT(ord.OrderID) DESC;