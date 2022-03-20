--GROUP BY:

--Employes tablosunda ki �al��anlar� �lkelerine g�re grupland�rarak listeleyiniz

SELECT * FROM Employees

SELECT Country AS '�lke', COUNT(*) AS 'Ki�i Say�s�'
FROM Employees
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY [Ki�i Say�s�] DESC

--�al��anlar�n yapm�� oldu�u sipari� say�s�na g�re grupland�rarak azalan s�rada s�ralay�n�z

SELECT * FROM Orders

SELECT EmployeeID , COUNT(*) AS 'Toplam Sipari� Say�s�'
FROM Orders
GROUP BY EmployeeID /*Grupland�rma yapt�ktan sonraki sayma i�lemini yap�yorum */
ORDER BY [Toplam Sipari� Say�s�] DESC 

--�r�n Bedeli 35'ten az olan �r�nlerin say�s�n� kategorilerine g�re artan s�rada s�ralay�n�z

SELECT CategoryID AS KategoriID, COUNT(*) AS ADET
FROM Products
WHERE UnitPrice < 35 AND CategoryID IS NOT NULL
GROUP BY CategoryID
ORDER By ADET ASC
--Ba� Harfi A ile K aral���nda olan ve stok mikarlar� 5-50 aras�nda olan �r�nleri , kategorilerine g�re grupland�rarak kategoride bulunan �r�n say�s�na g�re azalan s�rada s�ralay�n�z

SELECT CategoryID , COUNT(*) AS ADET
FROM Products
WHERE (ProductName LIKE '[A-K]%') AND (UnitsInStock > 5 AND UnitsInStock < 50 )
GROUP BY CategoryID 
ORDER BY ADET DESC
/* !!!�NEML� NOT!!! : ORDEY BY KISMINDA SIRALAMA ��LEMLER�N� AGGREGATE FUNCTION 'DA AS DED�KTEN SONRA YAPTI�IM ��LEME G�RE SIRALAMASI GEREKMEKTED�R.*/

--Her bir sipari�teki toplam �r�n say�s�n� grupland�rarak azalan s�rada s�ralay�n�z...

SELECT OrderID , SUM(Quantity) AS ToplamUrunAdedi
FROM [Order Details]
GROUP BY OrderID
ORDER BY ToplamUrunAdedi DESC

--Her bir sipari�in toplam tutar�n� , sipari�e g�re hesaplayarak , en y�ksek tutardaki 5 sipari�i azalan s�rada s�ralay�n�z..
--NOT Toplam tutarlar 2 ondal�kl� olacak �ekilde olmal�d�r.

SELECT TOP 5 OrderID , CAST(SUM(UnitPrice * Quantity * (1-Discount)) AS decimal(18,2)) AS ToplamTutar
FROM [Order Details]
GROUP BY OrderID
ORDER BY ToplamTutar DESC
