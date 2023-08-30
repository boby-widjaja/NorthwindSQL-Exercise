CREATE FUNCTION dbo.TotalReorderCost()
RETURNS MONEY AS
BEGIN
	DECLARE @totalReorder AS MONEY;

	SELECT @totalReorder = SUM (pro.ReorderLevel * pro.UnitPrice) 
	FROM dbo.Products AS pro;

	RETURN @totalReorder;
END