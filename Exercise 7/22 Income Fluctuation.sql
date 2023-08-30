SELECT FORMAT(orderPerDay.OrderDate, 'dd-MM-yy', 'id-ID') AS [Order Date], 
	FORMAT(orderPerDay.Income, 'C', 'en-US') AS [Total Income], 
	FORMAT(orderPerDay.Income - (LEAD(orderPerDay.Income) OVER (ORDER BY orderPerDay.OrderDate DESC)), 'N', 'en-US') AS [Fluctuation]
FROM(
	SELECT CONVERT(DATE, ord.OrderDate) AS OrderDate, 
	(SUM((ordet.Quantity * ordet.UnitPrice) * (1 - ordet.Discount))) AS [Income]
	FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
	GROUP BY CONVERT(DATE, ord.OrderDate)) AS orderPerDay
ORDER BY orderPerDay.OrderDate DESC;