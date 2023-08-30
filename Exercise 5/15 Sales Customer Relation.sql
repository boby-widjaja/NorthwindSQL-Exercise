CREATE VIEW dbo.EmployeeCustomerRelation AS(
	SELECT DISTINCT CONCAT(emp.FirstName, ' ', emp.LastName) AS [Salesman], cus.ContactName AS [Customer]
	FROM dbo.Orders AS ord
	JOIN dbo.Customers AS cus ON ord.CustomerID = cus.CustomerID
	JOIN dbo.Employees AS emp ON ord.EmployeeID = emp.EmployeeID
);