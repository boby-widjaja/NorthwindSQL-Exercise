--CREATE TYPE dbo.Cart AS TABLE
--(
--	Quantity INT NOT NULL,
--	ProductID INT NOT NULL
--);

CREATE PROCEDURE dbo.Purchasing 
@customerID AS NCHAR(5),
@employeeID AS INT,
@shipperID AS INT,
@shoppingCart AS dbo.Cart READONLY
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO dbo.Orders(CustomerID, EmployeeID, OrderDate, ShipVia) VALUES (@customerID, @employeeID, GETDATE(), @shipperID);

			DECLARE @orderID AS INT = SCOPE_IDENTITY();

			INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity, Discount)
			SELECT @orderID, sc.ProductID, (SELECT UnitPrice FROM dbo.Products WHERE ProductID = sc.ProductID), sc.Quantity, 0
			FROM @shoppingCart AS sc;

			UPDATE dbo.Products
			SET UnitsInStock = pro.UnitsInStock - shc.Quantity
			FROM @shoppingCart AS shc
				JOIN dbo.Products AS pro ON shc.ProductID = pro.ProductID;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE();
		ROLLBACK TRANSACTION;
	END CATCH
END