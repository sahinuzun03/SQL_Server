-- SELECT KOMUTU --

--�r�nleri , fiyatlar� ile birlikte ve kolonlara ba�l�klar vererek listeleyiniz
--Kategoriler ve kargo firmalar� tablolar�ndan t�m kolonlar� tek bir sorguda listeleyiniz

-- 1 --
SELECT ProductName AS '�r�n Ad�'
	  ,UnitPrice AS '�r�n Fiyat�'
FROM Products

-- 2 -- 
SELECT *
FROM  Shippers , Categories

-- 3 -- 
SELECT FirstName,LastName,[Address],HomePhone
FROM Employees
--Select ve From aras�na yaz�ld��� i�in Address ' i tan�ml� olarak g�recektir
-- 4 --
SELECT CategoryName , [Description]
FROM Categories

-- 5 -- 
SELECT OrderID , OrderDate
       ,ShipAddress + ' ' + ShipCity + ' ' +ShipCountry + ' ' +ShipName+' ' + ShipPostalCode + ' ' + ShipRegion AS 'A��k Adres' 
FROM  Orders

-- 6 -- 
SELECT ProductName , CategoryID , UnitPrice , UnitsInStock
FROM Products

-- 7 --
SELECT CompanyName
      ,Address + ' ' + City + ' ' + PostalCode AS 'A��k Adres'  
FROM Suppliers

-- 8 --
SELECT CompanyName + '/' + [Address] AS '�irket Bilgisi'
,ContactName + ' : �leti�im=' + Phone AS 'Yetkili Bilgisi'
FROM Customers 



