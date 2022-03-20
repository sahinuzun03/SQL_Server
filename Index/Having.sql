--HAVING : Where ile yapamamýþ olduðumuz filtreleme iþlemini HAVÝNG ile yapýyoruz.

-- Toplam tutarý 2500 ile 3500 arasýnda olan sipariþlerin listelenmesi için :

SELECT OrderID , CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) AS ToplamTutar
FROM [Order Details]
GROUP BY OrderID
HAVING CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) BETWEEN 2500 AND 3500
ORDER BY ToplamTutar DESC

SELECT CategoryID , COUNT(*) AS ADET
FROM Products
WHERE (ProductName LIKE '[A-K]%') AND (UnitsInStock > 5 AND UnitsInStock < 50 )
GROUP BY CategoryID 
HAVING COUNT(*) > 2
ORDER BY ADET DESC

--Yukarýdaki örneðe filtre þartý olarak Order ID ' si 10300 ile 10750 arasýnda olmasýný ekleyelim


SELECT OrderID , CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) AS ToplamTutar
FROM [Order Details]
WHERE OrderID BETWEEN 10300 AND 10750
GROUP BY OrderID
HAVING CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) BETWEEN 2500 AND 3500
ORDER BY ToplamTutar DESC

--HAVING AGGREGATE FUNCTÝONLAR ÝLE BERABER NORMAL KISITLAMALAR ÝÇÝNDE KULLANILABÝLÝRLER.


--HER BÝR SÝPARÝÞTEKÝ TOPLAM ÜRÜN SAYISI 200'DEN FAZLA OLAN SÝPARÝÞLERÝ GRUPLANDIRARAK , ADET BÝLGÝSÝ ARTAN ÞEKÝLDE OLACAK ÞEKÝLDE SIRALAYINIZ 

SELECT OrderID , SUM(Quantity) AS ToplamUrunAdedi
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 200
ORDER BY ToplamUrunAdedi ASC

