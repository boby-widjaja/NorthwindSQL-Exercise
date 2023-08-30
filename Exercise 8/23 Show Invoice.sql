CREATE PROCEDURE dbo.GenerateInvoice
@orderID AS INT
AS
BEGIN
	DECLARE @total AS MONEY;

	SELECT @total = SUM(ALL (ordet.Quantity * ordet.UnitPrice) * (1 - ordet.Discount))
	FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
	WHERE ord.OrderID = @orderID;

	SELECT FORMAT(ord.OrderDate, 'dd MMM yyyy', 'id-ID') AS [Order Date], 
	cus.ContactName AS [Customer], CONCAT(emp.FirstName, ' ', emp.LastName) AS [Salesman], 
	ship.CompanyName AS [Shipper], FORMAT(ord.ShippedDate, 'dd MMM yyyy', 'id-ID') AS [Ship Date],
	FORMAT(@total + ord.Freight, 'C', 'en-US') AS [Total Cost]
	FROM dbo.Orders AS ord
	JOIN dbo.Customers AS cus ON ord.CustomerID = cus.CustomerID
	JOIN dbo.Employees AS emp ON ord.EmployeeID = emp.EmployeeID
	JOIN dbo.Shippers AS ship ON ord.ShipVia = ship.ShipperID
	WHERE ord.OrderID = @orderID;

	SELECT prod.ProductName AS [Product], sup.CompanyName AS [Supplier], ordet.Quantity, FORMAT(ordet.UnitPrice, 'C', 'en-US') AS [Price Per Unit],
	FORMAT(((ordet.Quantity * ordet.UnitPrice) * (1 - ordet.Discount)), 'C', 'en-US') AS [Total]
	FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
	JOIN dbo.Products AS prod ON ordet.ProductID = prod.ProductID
	JOIN dbo.Suppliers AS sup ON prod.SupplierID = sup.SupplierID
	WHERE ord.OrderID = @orderID
END;