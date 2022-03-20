-- SELECT KOMUTU --

--Ürünleri , fiyatlarý ile birlikte ve kolonlara baþlýklar vererek listeleyiniz
--Kategoriler ve kargo firmalarý tablolarýndan tüm kolonlarý tek bir sorguda listeleyiniz

-- 1 --
SELECT ProductName AS 'Ürün Adý'
	  ,UnitPrice AS 'Ürün Fiyatý'
FROM Products

-- 2 -- 
SELECT *
FROM  Shippers , Categories

-- 3 -- 
SELECT FirstName,LastName,[Address],HomePhone
FROM Employees
--Select ve From arasýna yazýldýðý için Address ' i tanýmlý olarak görecektir
-- 4 --
SELECT CategoryName , [Description]
FROM Categories

-- 5 -- 
SELECT OrderID , OrderDate
       ,ShipAddress + ' ' + ShipCity + ' ' +ShipCountry + ' ' +ShipName+' ' + ShipPostalCode + ' ' + ShipRegion AS 'Açýk Adres' 
FROM  Orders

-- 6 -- 
SELECT ProductName , CategoryID , UnitPrice , UnitsInStock
FROM Products

-- 7 --
SELECT CompanyName
      ,Address + ' ' + City + ' ' + PostalCode AS 'Açýk Adres'  
FROM Suppliers

-- 8 --
SELECT CompanyName + '/' + [Address] AS 'Þirket Bilgisi'
,ContactName + ' : Ýletiþim=' + Phone AS 'Yetkili Bilgisi'
FROM Customers 



