--GROUP BY:

--Employes tablosunda ki çalýþanlarý ülkelerine göre gruplandýrarak listeleyiniz

SELECT * FROM Employees

SELECT Country AS 'Ülke', COUNT(*) AS 'Kiþi Sayýsý'
FROM Employees
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY [Kiþi Sayýsý] DESC

--Çalýþanlarýn yapmýþ olduðu sipariþ sayýsýna göre gruplandýrarak azalan sýrada sýralayýnýz

SELECT * FROM Orders

SELECT EmployeeID , COUNT(*) AS 'Toplam Sipariþ Sayýsý'
FROM Orders
GROUP BY EmployeeID /*Gruplandýrma yaptýktan sonraki sayma iþlemini yapýyorum */
ORDER BY [Toplam Sipariþ Sayýsý] DESC 

--Ürün Bedeli 35'ten az olan ürünlerin sayýsýný kategorilerine göre artan sýrada sýralayýnýz

SELECT CategoryID AS KategoriID, COUNT(*) AS ADET
FROM Products
WHERE UnitPrice < 35 AND CategoryID IS NOT NULL
GROUP BY CategoryID
ORDER By ADET ASC
--Baþ Harfi A ile K aralýðýnda olan ve stok mikarlarý 5-50 arasýnda olan ürünleri , kategorilerine göre gruplandýrarak kategoride bulunan ürün sayýsýna göre azalan sýrada sýralayýnýz

SELECT CategoryID , COUNT(*) AS ADET
FROM Products
WHERE (ProductName LIKE '[A-K]%') AND (UnitsInStock > 5 AND UnitsInStock < 50 )
GROUP BY CategoryID 
ORDER BY ADET DESC
/* !!!ÖNEMLÝ NOT!!! : ORDEY BY KISMINDA SIRALAMA ÝÞLEMLERÝNÝ AGGREGATE FUNCTION 'DA AS DEDÝKTEN SONRA YAPTIÐIM ÝÞLEME GÖRE SIRALAMASI GEREKMEKTEDÝR.*/

--Her bir sipariþteki toplam ürün sayýsýný gruplandýrarak azalan sýrada sýralayýnýz...

SELECT OrderID , SUM(Quantity) AS ToplamUrunAdedi
FROM [Order Details]
GROUP BY OrderID
ORDER BY ToplamUrunAdedi DESC

--Her bir sipariþin toplam tutarýný , sipariþe göre hesaplayarak , en yüksek tutardaki 5 sipariþi azalan sýrada sýralayýnýz..
--NOT Toplam tutarlar 2 ondalýklý olacak þekilde olmalýdýr.

SELECT TOP 5 OrderID , CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) AS ToplamTutar
FROM [Order Details]
GROUP BY OrderID
ORDER BY ToplamTutar DESC
