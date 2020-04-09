----demonstration1
SELECT * FROM sys.views;
GO

SELECT * FROM sys.tables;
GO

SELECT * FROM sys.objects
GO

SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO



-- DYNAMIC MANAGEMENT VIEWS

SELECT * FROM sys.dm_exec_connections;
GO

SELECT * FROM sys.dm_exec_sessions;
GO

SELECT * FROM sys.dm_exec_requests;
GO

SELECT * FROM sys.dm_exec_query_stats;
GO


SELECT TOP (20) qs.max_logical_reads,
                st.text 
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY qs.max_logical_reads DESC;



----demonstration 2

IF OBJECT_ID(N'SalesLT.vw_CustomerOrders', N'V') IS NOT NULL
	DROP VIEW SalesLT.vw_CustomerOrders;
GO
CREATE VIEW SalesLT.vw_CustomerOrders
AS
SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderDate, O.SubTotal, O.TotalDue 
FROM SalesLT.Customer AS C
	INNER JOIN SalesLT.SalesOrderHeader as O
ON C.CustomerID =O.CustomerID;
GO

SELECT * 
	FROM SalesLT.vw_CustomerOrders;
GO

SELECT * 
FROM SalesLT.vw_CustomerOrders
ORDER BY TotalDue Desc;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID(N'SalesLT.vw_CustomerOrders',N'V'));
GO

ALTER VIEW SalesLT.vw_CustomerOrders
WITH ENCRYPTION
AS
	SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderDate, O.SubTotal, O.TotalDue 
FROM SalesLT.Customer AS C
	INNER JOIN SalesLT.SalesOrderHeader as O
ON C.CustomerID =O.CustomerID;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID(N'SalesLT.vw_CustomerOrders',N'V'));
GO

DROP VIEW SalesLT.vw_CustomerOrders;
GO



----lab 1
USE AdventureWorks2016;
GO
-- View 1

CREATE VIEW Production.OnlineProducts
AS
SELECT p.ProductID, p.Name, p.ProductNumber AS [Product Number], COALESCE(p.Color, 'N/A') AS Color,
CASE p.DaysToManufacture
WHEN 0 THEN 'In stock' 
WHEN 1 THEN 'Overnight'
WHEN 2 THEN '2 to 3 days delivery'
ELSE 'Call us for a quote'
END AS Availability,
p.Size, p.SizeUnitMeasureCode AS [Unit of Measure], p.ListPrice AS Price, p.Weight
FROM Production.Product AS p
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;
GO

--View 2

CREATE VIEW Production.AvailableModels
AS
SELECT p.ProductID AS [Product ID], p.Name AS [Product Name], pm.ProductModelID AS [Product Model ID], pm.Name as [Product Model]
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;
GO

SELECT * FROM Production.OnlineProducts
GO

SELECT * FROM Production.AvailableModels
GO

--END






---lab2
USE AdventureWorks2016;
GO

CREATE VIEW Sales.NewCustomer
AS
SELECT CustomerID, FirstName, LastName FROM Sales.CustomerPII;
GO

SELECT * FROM Sales.NewCustomer 
ORDER BY CustomerID

INSERT INTO Sales.NewCustomer
VALUES
(10001,'hello', 'thjkk'),
(10002, 'hello76', 'ishika');
GO

SELECT * from Sales.CustomerPII ORDER BY CustomerID