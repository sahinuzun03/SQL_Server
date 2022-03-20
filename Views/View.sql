USE Northwind

SELECT CompanyName
,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS [Sipari� Say�s�]
,(SELECT COUNT(*) FROM [Order Details] WHERE [Order Details].OrderID IN (SELECT OrderID FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)) AS [Kalem Say�s�]
FROM Customers 
WHERE Country <> 'Germany'
ORDER BY CompanyName DESC

CREATE VIEW HesapTablosu
AS
SELECT CompanyName
,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS [Sipari� Say�s�]
,(SELECT COUNT(*) FROM [Order Details] WHERE [Order Details].OrderID IN (SELECT OrderID FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)) AS [Kalem Say�s�]
FROM Customers 
WHERE Country <> 'Germany'

SELECT * , [Kalem Say�s�] / [Sipari� Say�s�] AS Sonuc
FROM HesapTablosu
WHERE [Sipari� Say�s�] <> 0 
ORDER BY CompanyName DESC
