-- SORGULARIN HEPS� NORTHW�ND TABLOSU �ZER�NDEN YAPLIMI�TIR. --

-- 1 : Stock adeti 20'den fazla olan �r�nlerin listelenmesi

SELECT Orders.OrderID, Products.UnitsInStock,Shippers.CompanyName
FROM Orders
INNER JOIN Shippers ON ShipVia=Shippers.ShipperID
INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
INNER JOIN Products ON Products.ProductID=[Order Details].ProductID
WHERE Products.UnitsInStock>20

-- 2 : Ad� Nancy olan Kargo Firmas� Federal Shipping olan �al��anlar�n listelenmesi

SELECT * FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Employees.FirstName = 'Nancy' AND Shippers.CompanyName ='Federal Shipping'

-- 3 : Eastern konumunda bulunan b�lgelerin listelenmesi
SELECT Territories.TerritoryDescription,Region.RegionDescription From  Territories INNER JOIN Region ON Territories.RegionID = Region.RegionID 
WHERE Region.RegionDescription = 'Eastern'

-- 4 : En fazla �r�n adetine sahip �r�n�n listelenmesi
SELECT TOP 1 ProductName , SUM(Quantity) AS [�r�n ADET] FROM Products
INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
ORDER BY SUM(Quantity) DESC

-- 5 : �irket ad�nda 4.harfi e olan ve birim fiyat� 30 ile 60 aras�nda olan sipari�lerin listelenmesi

SELECT * FROM Orders 
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Shippers.CompanyName LIKE '___e%' AND (UnitPrice > 30 AND UnitPrice < 60)  

-- 6 : En fazla sipari� veren firma ad�

SELECT TOP 1 CompanyName,SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)) FROM Customers 
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY CompanyName
ORDER BY SUM([Order Details].Quantity*[Order Details].UnitPrice) DESC

-- 7 : Stok adedi 0 olan ve sat��� durdurulmu� �r�nlerin �irketi ve telefon numaras�

SELECT Suppliers.CompanyName,Phone FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
WHERE Products.Discontinued = 1 AND UnitsInStock = 0

-- 8 : Sipari� tarihi a�a��da yaz�lan tarihten sonra olan sipari�lerin tarigi ve sipari� veren firma

SELECT CompanyName,Orders.OrderDate FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE OrderDate > '1998.01.01'

-- 9 : M��terilerin �lkesi Mexica olan ve �leti�ime ge�en ki�i �irket sahibi olan ve sipari� y�k� 30'dan fazla olan m��terilerin listelenmesi

SELECT * FROM Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Orders.EmployeeID
WHERE Customers.Country = 'Mexico' AND Customers.ContactTitle = 'Owner' AND Orders.Freight > 30

-- 10 : Title'� Mrs ve Ms olan �al��anlar�m�n M��teri isimleri ve m��terileirn �ehirleri

SELECT Customers.CompanyName,Customers.City FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE TitleOfCourtesy IN ('Mrs.','Ms.')

-- 11 : �r�nlerin sevk tarihi 8. ay olan �r�nadlar� , sipari� tarihi ve sipari� �ehirlerini sipari� y�k�ne g�re azalan s�rada listeleme

SELECT ProductName,ShippedDate,ShipCity FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.ProductID
INNER JOIN [Order Details] on Products.ProductID = [Order Details].ProductID
INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE MONTH(ShippedDate) = 8
ORDER BY Orders.Freight DESC

-- 12 : �al��anlar�m�n geciken sipari�lerimin adeti

SELECT Employees.FirstName,COUNT(*) AS [GE��KEN S�PAR��] 
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.RequiredDate < Orders.ShippedDate
GROUP BY Employees.FirstName

-- 13 : Kargo ta��ma firmalar�ndan en �ok �r�n� gecikecek olan firma ve ge�ikecek olan sipari� say�s�

SELECT TOP 1 Shippers.CompanyName,Count(Orders.OrderID) as [Ge�icek Sipari� Say�s�] FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.RequiredDate < Orders.ShippedDate
GROUP BY CompanyName
ORDER BY Count(Orders.OrderID) DESC

-- 14 : Toplam �r�n stok adedi 150'den fazla olan tedarik�ilerim hangi �lkelerde

SELECT Suppliers.Country FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.Country
HAVING SUM(Products.UnitsInStock) > 150 

-- 15 : Konumu 'Eastern' olan �al��anlar�m taraf�ndan onaylanan sipari�lerimin m��terileri, federal shipping ile ta��nan �r�nlerini kategorilere g�re s�ralay�n�z.

SELECT DISTINCT Categories.CategoryName,Products.ProductName , Customers.CompanyName ,Shippers.CompanyName,Orders.OrderID
From Territories 
INNER JOIN Region ON Territories.RegionID = Region.RegionID 
INNER JOIN EmployeeTerritories ON Territories.TerritoryID = EmployeeTerritories.TerritoryID 
INNER JOIN Employees ON EmployeeTerritories.EmployeeID = Employees.EmployeeID
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Region.RegionDescription = 'Eastern' AND Shippers.CompanyName = 'Federal Shipping' 
ORDER BY Categories.CategoryName asc

-- 16 :Stok miktar� d��ar�dan girilen min ve max STOK aral���nda olan, urun �creti d��ar�dan girilen min ve max de�erler aral���nda olan, toptanci firma ad�, d��ar�dan girilen karakterleri bar�nd�ran tedarik�i firma ad�, urun fiyat� d��ar�dan girilen kdv uygulanm�� haliyle listeleyiniz

CREATE PROCEDURE sp_�r�nleriGetir 
(	
	@MinStok INT
	,@MaxStok INT
	,@Min�cret Money
	,@Max�cret Money
	,@TedarikFirmaAdi NVARCHAR(40)
	,@kdvOrani Decimal(18,2)
)
AS 
BEGIN
SELECT Products.ProductName,Suppliers.CompanyName,UnitPrice,UnitPrice*@kdvOrani AS KDVliFiyat
FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE(UnitsInStock BETWEEN @MaxStok AND @MaxStok) AND (UnitPrice BETWEEN @Min�cret AND @Max�cret) AND (Suppliers.CompanyName LIKE '%'+@TedarikFirmaAdi+'%')
END

-- 17 : Kategorisi 'Condiments' olan ve BirimFiyat� en fazla olan ilk 10 �r�n�m.

CREATE VIEW SoruCevapp
AS 
SELECT TOP 10 Products.ProductID,Products.ProductName,Suppliers.CompanyName FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE CategoryName = 'Condiments'
ORDER BY UnitPrice DESC

SELECT * FROM SoruCevapp
where ProductName LIKE 'Vegie%'

-- 18 : En fazla sipari� veren m��terilerim platinium m��terilerdir. Create view'�n� ayarlay�n�z.

CREATE VIEW PlatiniumMusteri
AS
SELECT top 10 CompanyName,SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)) AS 'Toplam Kazan�'FROM Customers 
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY CompanyName
ORDER BY SUM([Order Details].Quantity*[Order Details].UnitPrice) DESC

SELECT * FROM PlatiniumMusteri

-- 19 : Kritik seviyede olan �r�nlerimin bilgilerinin getirilmesi

CREATE VIEW KritikSeviyeUrunBilgileri
AS
SELECT Categories.CategoryName,Products.ProductName,Suppliers.CompanyName,ABS(Products.UnitsOnOrder - Products.UnitsInStock) as MinimumAdet
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE Products.ReorderLevel >=25 AND Products.UnitsOnOrder - Products.UnitsInStock < 0

SELECT * FROM KritikSeviyeUrunBilgileri

--20. SORU : Y�neticimin ilgilendi�i m��terilerden Fransa'n�n Paris �ehrinde olmayanlar�n� listeleyiniz!!

SELECT * FROM Orders
SELECT * FROM Customers
SELECT * FROM Employees

SELECT DISTINCT Customers.CustomerID,Customers.CompanyName,Customers.City,Customers.Country
FROM Orders 
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Employees.EmployeeID IN (SELECT ReportsTo FROM Employees) AND Customers.City <> 'Paris'
ORDER  BY CustomeRS.Country DESC , Customers.City ASC

--21.Soru : Klavyeden Girilen Shipvia numaras�na g�re 300'den az veya fazla oldu�unu g�steren prosed�r� yaz�n�z. E�er Shipvia de�eri yoksa Hata mesaj� versin. Kay�t ��kt�s� �u �ekilde Olacak: 300den fazla kay�t var. Kay�t Say�s�= 330


CREATE PROCEDURE sp_KargoSipari�Say�s� (@Shipvia INT)
AS 
BEGIN
IF EXISTS (SELECT ShipVia FROM Orders WHERE ShipVia = @Shipvia)
BEGIN
declare @sayi int
Select @sayi=COUNT(ShipVia) 
from Orders 
where ShipVia=@shipvia
group by ShipVia 
if @sayi<300  
begin 
print  '300''den az kay�t var. Kay�t Say�s�= '+ cast(@sayi as varchar)
end
else 
begin
print '300''den fazla kay�t var. Kay�t Say�s�= '+ cast(@sayi as varchar)
end
end
else 
begin
print 'G�nderdi�iniz de�erde bir kargo kodu yoktur'
end

end

exec sp_KargoSipari�Say�s� 4

--22.soru : �r�n ad� ve kategori ad� parametresi alacak Kategori yoksa ekletip sonra �r�n ekleten , kategori varsa o kategoriye �r�n� ekleten proced�r� yaz�n

CREATE PROC sp_Ekle @�r�nAd� NVARCHAR(40) , @kategoriAd� NVARCHAR(15)
AS
BEGIN

	SELECT @kategoriAd� = CategoryName FROM Categories WHERE(@kategoriAd� = CategoryName)
	IF (@kategoriAd� IS NOT NULL)
	BEGIN 
	INSERT INTO Categories(CategoryName) VALUES (@kategoriAd�)
	INSERT INTO Products(ProductName) VALUES (@�r�nAd�)
	END
	ELSE 
	BEGIN
	DECLARE @ID INT
	SELECT  @ID = Categories.CategoryID FROM Categories WHERE @kategoriAd� = CategoryName

	INSERT INTO Products(ProductName,CategoryID) VALUES (@�r�nAd�,@ID)
	END
END

--23.SORU : G�nl�k olarak rapor almak istiyorum Girdi�im kategoriye g�re �r�n ad� ve stok miktar� getiren bir procedure yaz�n�z

CREATE PROCEDURE sp_Rapor(@kategoriAd� NVARCHAR(15))
AS
BEGIN
SELECT CategoryName,ProductName,UnitsInStock
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = @kategoriAd�
END

-- 24 : 2 Tarih aras�nda yapm�� olduum toplam ciro ne kadar Fonksiyon yaz�n�z 

CREATE FUNCTION ToplamCiro (@tarih1 DATETIME , @tarih2 DATETIME ) 
RETURNS DECIMAL
BEGIN

DECLARE @toplamCiro DECIMAL(18,5) 

SELECT @toplamCiro = SUM(UnitPrice*Quantity*(1-Discount)) 
FROM [Order Details] INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN @tarih1 AND  @tarih2
RETURN @toplamCiro
END

SELECT dbo.ToplamCiro('1996.07.04','1998.05.06')

--25.SORU Customer tablosunda kay�t silmeyi iptal etmek istiyorum.B�yle bir �ey m�mk�n m� m�mk�n ise nas�l

CREATE TRIGGER Employes_Delete ON Employees INSTEAD OF DELETE
AS 
BEGIN
RAISERROR ('Ki�ilerin bilgilerini sistemden tamamen silemezsin',16,1)
END
INSERT INTO Employees

SELECT SUM(UnitPrice*Quantity*(1-Discount)) 
FROM [Order Details] INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN '1996.07.04' AND '1998.05.06'

SELECT MIN(OrderDate) FROM Orders