CREATE FUNCTION dbo.TotalQuantityProductSoldOn(@productID AS INT, @orderMonth AS INT, @orderYear AS INT)
RETURNS INT AS
BEGIN
	DECLARE @totalQuantity AS INT;

	SELECT @totalQuantity = SUM(ALL ordet.Quantity)
	FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
	WHERE ordet.ProductID = @productID AND
	MONTH(ord.OrderDate) = @orderMonth AND
	YEAR(ord.OrderDate) = @orderYear

	RETURN @totalQuantity;
END