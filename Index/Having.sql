--HAVING : Where ile yapamam�� oldu�umuz filtreleme i�lemini HAV�NG ile yap�yoruz.

-- Toplam tutar� 2500 ile 3500 aras�nda olan sipari�lerin listelenmesi i�in :

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

--Yukar�daki �rne�e filtre �art� olarak Order ID ' si 10300 ile 10750 aras�nda olmas�n� ekleyelim


SELECT OrderID , CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) AS ToplamTutar
FROM [Order Details]
WHERE OrderID BETWEEN 10300 AND 10750
GROUP BY OrderID
HAVING CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) BETWEEN 2500 AND 3500
ORDER BY ToplamTutar DESC

--HAVING AGGREGATE FUNCT�ONLAR �LE BERABER NORMAL KISITLAMALAR ���NDE KULLANILAB�L�RLER.


--HER B�R S�PAR��TEK� TOPLAM �R�N SAYISI 200'DEN FAZLA OLAN S�PAR��LER� GRUPLANDIRARAK , ADET B�LG�S� ARTAN �EK�LDE OLACAK �EK�LDE SIRALAYINIZ 

SELECT OrderID , SUM(Quantity) AS ToplamUrunAdedi
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 200
ORDER BY ToplamUrunAdedi ASC

