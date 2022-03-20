USE Northwind

SELECT CompanyName
,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS [Sipariþ Sayýsý]
,(SELECT COUNT(*) FROM [Order Details] WHERE [Order Details].OrderID IN (SELECT OrderID FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)) AS [Kalem Sayýsý]
FROM Customers 
WHERE Country <> 'Germany'
ORDER BY CompanyName DESC

CREATE VIEW HesapTablosu
AS
SELECT CompanyName
,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS [Sipariþ Sayýsý]
,(SELECT COUNT(*) FROM [Order Details] WHERE [Order Details].OrderID IN (SELECT OrderID FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)) AS [Kalem Sayýsý]
FROM Customers 
WHERE Country <> 'Germany'

SELECT * , [Kalem Sayýsý] / [Sipariþ Sayýsý] AS Sonuc
FROM HesapTablosu
WHERE [Sipariþ Sayýsý] <> 0 
ORDER BY CompanyName DESC
