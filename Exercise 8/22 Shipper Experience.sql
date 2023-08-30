CREATE PROCEDURE dbo.ShipperExperienceOn
@year AS INT
AS
BEGIN
	SELECT pvt.Product, [Speedy Express], [United Package], [Federal Shipping]
	FROM(
		SELECT ship.CompanyName AS [Shipper], cat.CategoryName AS [Product], ordet.Quantity AS [Quantity]
		FROM dbo.Orders AS ord
		JOIN dbo.Shippers AS ship ON ord.ShipVia = ship.ShipperID
		JOIN dbo.[Order Details] AS ordet ON ord.OrderID  = ordet.OrderID
		JOIN dbo.Products AS prod ON ordet.ProductID = prod.ProductID
		JOIN dbo.Categories AS cat ON prod.CategoryID = cat.CategoryID
		WHERE YEAR(ord.ShippedDate) = @year
	) AS shipperProduct
	PIVOT (SUM(shipperProduct.Quantity) FOR shipperProduct.Shipper IN ([Speedy Express], [United Package], [Federal Shipping])) AS pvt
END;