--JOIN Kullan�m� : 
--INNER JO�N 2 K�MEN�N KES���M K�MES�D�R
--LEFT OUTER JOIN SOLDAK� TABLONUN HEPS�N� GET�R�
--RIGHT OUTER JOIN SA�DAK� TABLONUN HEPS�N� GET�R�R
--FULL OUTER JOIN B�T�N TABLOLARI GET�R�R.

--INNER JOIN 
--HER �R�N ��� �R�NLER TABLOSUNDAN �R�N ADI , KATEGOR�LER TABLOSUNDAN KATEGOR� ADI GET�R�N�Z

SELECT ProductName , CategoryName
FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID

--Her br �r�n i�in �r�n �d , �r�n ad� , kateogrid , kategori ad� , kategori a��klamas�

SELECT ProductID,ProductName,c.CategoryID,CategoryName,[Description]
FROM Categories C INNER JOIN Products p ON p.CategoryID = C.CategoryID 
--Jo�n ifadesinin sa��nda ve solunda ayn� kolon var ise ve ben bu kolonu yazd�r�yorsam bunu hangi kolondan yazd�rd���m� belirtmem gerekmektedir.

--INNER JOIN de sa�a veya sola hangisinin yaz�ld���n�n bir �enmi yoktur

--Hangi sipari�in , hangi �al��an taraf�ndan al�nd���n� , hangi m��teriye g�nderilece�ini listeleyiniz.S�pari� ID , Sipari� Tarihi , �irket ad� , �irket Yetkilisi , Personel ad� , Personel Soyad� , Personel Unvan� , Personel G�revi

SELECT FirstName + ' ' + LastName +' '+ TitleOfCourtesy + ' '+ Title AS Personel
,OrderID,OrderDate,CompanyName,ContactName
FROM Orders o INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID

--Suppliers tablosundan company name  , contact name
--Products tablosundan productname , unitprice
--Categories tablosundan categoriname 
--Compnay name kolonuna g�re artan s�rada olacak �ekilde listeleyniz


SELECT CompanyName,ContactName,ProductName,UnitPrice,CategoryName
FROM Products p INNER JOIN Categories c ON c.CategoryID = p.CategoryID
				INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID
ORDER BY CompanyName ASC

--Kategorilere g�re toplam stok say�lar�n� listeleyiniz
--Kategori ad� ve stok miktar� kolonlar� , stok miktar� kolonuna g�re azala s�rada olacak �ekilde

SELECT c.CategoryName AS KategoriAd� , SUM(p.UnitsInStock) AS ToplamStok
FROM Categories c INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY SUM(p.UnitsInStock) DESC

--Her bir �al��an�n toplam ne kadarl�k sat�� yapt���n� listeleyiniz
--�al��an�n (FirstName , LastName) , ToplamSat�� virg�lden sonra 2 basamak

SELECT FirstName + ' ' + LastName AS [�al��an] , CAST(SUM(Quantity*UnitPrice*(1-Discount))AS decimal(18,2)) AS ToplamSat��
FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY FirstName + ' ' + LastName

SELECT FirstName + ' ' + LastName
,(SELECT SUM(Quantity*UnitPrice*(1-Discount)) FROM [Order Details] WHERE OrderID IN (SELECT OrderID FROM Orders WHERE Orders.EmployeeID = Employees.EmployeeID))
FROM Employees 
