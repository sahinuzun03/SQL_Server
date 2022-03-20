--JOIN Kullanýmý : 
--INNER JOÝN 2 KÜMENÝN KESÝÞÝM KÜMESÝDÝR
--LEFT OUTER JOIN SOLDAKÝ TABLONUN HEPSÝNÝ GETÝRÝ
--RIGHT OUTER JOIN SAÐDAKÝ TABLONUN HEPSÝNÝ GETÝRÝR
--FULL OUTER JOIN BÜTÜN TABLOLARI GETÝRÝR.

--INNER JOIN 
--HER ÜRÜN ÝÇÝ ÜRÜNLER TABLOSUNDAN ÜRÜN ADI , KATEGORÝLER TABLOSUNDAN KATEGORÝ ADI GETÝRÝNÝZ

SELECT ProductName , CategoryName
FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID

--Her br ürün için ürün ýd , ürün adý , kateogrid , kategori adý , kategori açýklamasý

SELECT ProductID,ProductName,c.CategoryID,CategoryName,[Description]
FROM Categories C INNER JOIN Products p ON p.CategoryID = C.CategoryID 
--Joýn ifadesinin saðýnda ve solunda ayný kolon var ise ve ben bu kolonu yazdýrýyorsam bunu hangi kolondan yazdýrdýðýmý belirtmem gerekmektedir.

--INNER JOIN de saða veya sola hangisinin yazýldýðýnýn bir öenmi yoktur

--Hangi sipariþin , hangi çalýþan tarafýndan alýndýðýný , hangi müþteriye gönderileceðini listeleyiniz.SÝpariþ ID , Sipariþ Tarihi , Þirket adý , Þirket Yetkilisi , Personel adý , Personel Soyadý , Personel Unvaný , Personel Görevi

SELECT FirstName + ' ' + LastName +' '+ TitleOfCourtesy + ' '+ Title AS Personel
,OrderID,OrderDate,CompanyName,ContactName
FROM Orders o INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID

--Suppliers tablosundan company name  , contact name
--Products tablosundan productname , unitprice
--Categories tablosundan categoriname 
--Compnay name kolonuna göre artan sýrada olacak þekilde listeleyniz


SELECT CompanyName,ContactName,ProductName,UnitPrice,CategoryName
FROM Products p INNER JOIN Categories c ON c.CategoryID = p.CategoryID
				INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID
ORDER BY CompanyName ASC

--Kategorilere göre toplam stok sayýlarýný listeleyiniz
--Kategori adý ve stok miktarý kolonlarý , stok miktarý kolonuna göre azala sýrada olacak þekilde

SELECT c.CategoryName AS KategoriAdý , SUM(p.UnitsInStock) AS ToplamStok
FROM Categories c INNER JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY SUM(p.UnitsInStock) DESC

--Her bir çalýþanýn toplam ne kadarlýk satýþ yaptýðýný listeleyiniz
--Çalýþanýn (FirstName , LastName) , ToplamSatýþ virgülden sonra 2 basamak

SELECT FirstName + ' ' + LastName AS [Çalýþan] , CAST(SUM(Quantity*UnitPrice*(1-Discount))AS decimal(18,2)) AS ToplamSatýþ
FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY FirstName + ' ' + LastName

SELECT FirstName + ' ' + LastName
,(SELECT SUM(Quantity*UnitPrice*(1-Discount)) FROM [Order Details] WHERE OrderID IN (SELECT OrderID FROM Orders WHERE Orders.EmployeeID = Employees.EmployeeID))
FROM Employees 
