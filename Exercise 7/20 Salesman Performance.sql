CREATE FUNCTION dbo.CalculateBonus(@employeeID AS INT, @orderYear AS INT)
RETURNS MONEY AS
BEGIN
	DECLARE @total AS MONEY;

	SELECT @total = SUM(ALL (ordet.Quantity * ordet.UnitPrice))
	FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
	WHERE ord.EmployeeID = @employeeID AND YEAR(ord.OrderDate) = @orderYear;

	RETURN @total * 0.1;
END