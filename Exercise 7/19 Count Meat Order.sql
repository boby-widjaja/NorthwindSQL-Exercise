CREATE FUNCTION dbo.CountMeatOrderOn(@year AS INT)
RETURNS INT AS
BEGIN
	DECLARE @totalOrder AS INT;
	WITH MeatOrder(OrderID) AS (
		SELECT DISTINCT ord.OrderID
		FROM dbo.[Orders] AS ord
		JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
		JOIN dbo.Products AS pro ON ordet.ProductID = pro.ProductID
		JOIN dbo.Categories AS cat ON pro.CategoryID = cat.CategoryID
		WHERE cat.CategoryName LIKE '%Meat/Poultry%' AND YEAR(ord.OrderDate) = @year
	)
	SELECT @totalOrder = COUNT(ALL mo.OrderID)
	FROM MeatOrder AS mo
	RETURN @totalOrder;
END