-- SORGULARIN HEPSÝ NORTHWÝND TABLOSU ÜZERÝNDEN YAPLIMIÞTIR. --

-- 1 : Stock adeti 20'den fazla olan ürünlerin listelenmesi

SELECT Orders.OrderID, Products.UnitsInStock,Shippers.CompanyName
FROM Orders
INNER JOIN Shippers ON ShipVia=Shippers.ShipperID
INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
INNER JOIN Products ON Products.ProductID=[Order Details].ProductID
WHERE Products.UnitsInStock>20

-- 2 : Adý Nancy olan Kargo Firmasý Federal Shipping olan çalýþanlarýn listelenmesi

SELECT * FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Employees.FirstName = 'Nancy' AND Shippers.CompanyName ='Federal Shipping'

-- 3 : Eastern konumunda bulunan bölgelerin listelenmesi
SELECT Territories.TerritoryDescription,Region.RegionDescription From  Territories INNER JOIN Region ON Territories.RegionID = Region.RegionID 
WHERE Region.RegionDescription = 'Eastern'

-- 4 : En fazla ürün adetine sahip ürünün listelenmesi
SELECT TOP 1 ProductName , SUM(Quantity) AS [Ürün ADET] FROM Products
INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
ORDER BY SUM(Quantity) DESC

-- 5 : Þirket adýnda 4.harfi e olan ve birim fiyatý 30 ile 60 arasýnda olan sipariþlerin listelenmesi

SELECT * FROM Orders 
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Shippers.CompanyName LIKE '___e%' AND (UnitPrice > 30 AND UnitPrice < 60)  

-- 6 : En fazla sipariþ veren firma adý

SELECT TOP 1 CompanyName,SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)) FROM Customers 
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY CompanyName
ORDER BY SUM([Order Details].Quantity*[Order Details].UnitPrice) DESC

-- 7 : Stok adedi 0 olan ve satýþý durdurulmuþ ürünlerin þirketi ve telefon numarasý

SELECT Suppliers.CompanyName,Phone FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID 
WHERE Products.Discontinued = 1 AND UnitsInStock = 0

-- 8 : Sipariþ tarihi aþaðýda yazýlan tarihten sonra olan sipariþlerin tarigi ve sipariþ veren firma

SELECT CompanyName,Orders.OrderDate FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE OrderDate > '1998.01.01'

-- 9 : Müþterilerin Ülkesi Mexica olan ve Ýletiþime geçen kiþi þirket sahibi olan ve sipariþ yükü 30'dan fazla olan müþterilerin listelenmesi

SELECT * FROM Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Orders.EmployeeID
WHERE Customers.Country = 'Mexico' AND Customers.ContactTitle = 'Owner' AND Orders.Freight > 30

-- 10 : Title'ý Mrs ve Ms olan çalýþanlarýmýn Müþteri isimleri ve müþterileirn þehirleri

SELECT Customers.CompanyName,Customers.City FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE TitleOfCourtesy IN ('Mrs.','Ms.')

-- 11 : Ürünlerin sevk tarihi 8. ay olan ürünadlarý , sipariþ tarihi ve sipariþ þehirlerini sipariþ yüküne göre azalan sýrada listeleme

SELECT ProductName,ShippedDate,ShipCity FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.ProductID
INNER JOIN [Order Details] on Products.ProductID = [Order Details].ProductID
INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE MONTH(ShippedDate) = 8
ORDER BY Orders.Freight DESC

-- 12 : Çalýþanlarýmýn geciken sipariþlerimin adeti

SELECT Employees.FirstName,COUNT(*) AS [GEÇÝKEN SÝPARÝÞ] 
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.RequiredDate < Orders.ShippedDate
GROUP BY Employees.FirstName

-- 13 : Kargo taþýma firmalarýndan en çok ürünü gecikecek olan firma ve geçikecek olan sipariþ sayýsý

SELECT TOP 1 Shippers.CompanyName,Count(Orders.OrderID) as [Geçicek Sipariþ Sayýsý] FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.RequiredDate < Orders.ShippedDate
GROUP BY CompanyName
ORDER BY Count(Orders.OrderID) DESC

-- 14 : Toplam ürün stok adedi 150'den fazla olan tedarikçilerim hangi ülkelerde

SELECT Suppliers.Country FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.Country
HAVING SUM(Products.UnitsInStock) > 150 

-- 15 : Konumu 'Eastern' olan çalýþanlarým tarafýndan onaylanan sipariþlerimin müþterileri, federal shipping ile taþýnan ürünlerini kategorilere göre sýralayýnýz.

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

-- 16 :Stok miktarý dýþarýdan girilen min ve max STOK aralýðýnda olan, urun ücreti dýþarýdan girilen min ve max deðerler aralýðýnda olan, toptanci firma adý, dýþarýdan girilen karakterleri barýndýran tedarikçi firma adý, urun fiyatý dýþarýdan girilen kdv uygulanmýþ haliyle listeleyiniz

CREATE PROCEDURE sp_ÜrünleriGetir 
(	
	@MinStok INT
	,@MaxStok INT
	,@MinÜcret Money
	,@MaxÜcret Money
	,@TedarikFirmaAdi NVARCHAR(40)
	,@kdvOrani Decimal(18,2)
)
AS 
BEGIN
SELECT Products.ProductName,Suppliers.CompanyName,UnitPrice,UnitPrice*@kdvOrani AS KDVliFiyat
FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE(UnitsInStock BETWEEN @MaxStok AND @MaxStok) AND (UnitPrice BETWEEN @MinÜcret AND @MaxÜcret) AND (Suppliers.CompanyName LIKE '%'+@TedarikFirmaAdi+'%')
END

-- 17 : Kategorisi 'Condiments' olan ve BirimFiyatý en fazla olan ilk 10 ürünüm.

CREATE VIEW SoruCevapp
AS 
SELECT TOP 10 Products.ProductID,Products.ProductName,Suppliers.CompanyName FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE CategoryName = 'Condiments'
ORDER BY UnitPrice DESC

SELECT * FROM SoruCevapp
where ProductName LIKE 'Vegie%'

-- 18 : En fazla sipariþ veren müþterilerim platinium müþterilerdir. Create view'ýný ayarlayýnýz.

CREATE VIEW PlatiniumMusteri
AS
SELECT top 10 CompanyName,SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)) AS 'Toplam Kazanç'FROM Customers 
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY CompanyName
ORDER BY SUM([Order Details].Quantity*[Order Details].UnitPrice) DESC

SELECT * FROM PlatiniumMusteri

-- 19 : Kritik seviyede olan ürünlerimin bilgilerinin getirilmesi

CREATE VIEW KritikSeviyeUrunBilgileri
AS
SELECT Categories.CategoryName,Products.ProductName,Suppliers.CompanyName,ABS(Products.UnitsOnOrder - Products.UnitsInStock) as MinimumAdet
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE Products.ReorderLevel >=25 AND Products.UnitsOnOrder - Products.UnitsInStock < 0

SELECT * FROM KritikSeviyeUrunBilgileri

--20. SORU : Yöneticimin ilgilendiði müþterilerden Fransa'nýn Paris Þehrinde olmayanlarýný listeleyiniz!!

SELECT * FROM Orders
SELECT * FROM Customers
SELECT * FROM Employees

SELECT DISTINCT Customers.CustomerID,Customers.CompanyName,Customers.City,Customers.Country
FROM Orders 
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Employees.EmployeeID IN (SELECT ReportsTo FROM Employees) AND Customers.City <> 'Paris'
ORDER  BY CustomeRS.Country DESC , Customers.City ASC

--21.Soru : Klavyeden Girilen Shipvia numarasýna göre 300'den az veya fazla olduðunu gösteren prosedürü yazýnýz. Eðer Shipvia deðeri yoksa Hata mesajý versin. Kayýt Çýktýsý Þu Þekilde Olacak: 300den fazla kayýt var. Kayýt Sayýsý= 330


CREATE PROCEDURE sp_KargoSipariþSayýsý (@Shipvia INT)
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
print  '300''den az kayýt var. Kayýt Sayýsý= '+ cast(@sayi as varchar)
end
else 
begin
print '300''den fazla kayýt var. Kayýt Sayýsý= '+ cast(@sayi as varchar)
end
end
else 
begin
print 'Gönderdiðiniz deðerde bir kargo kodu yoktur'
end

end

exec sp_KargoSipariþSayýsý 4

--22.soru : Ürün adý ve kategori adý parametresi alacak Kategori yoksa ekletip sonra ürün ekleten , kategori varsa o kategoriye ürünü ekleten procedürü yazýn

CREATE PROC sp_Ekle @ÜrünAdý NVARCHAR(40) , @kategoriAdý NVARCHAR(15)
AS
BEGIN

	SELECT @kategoriAdý = CategoryName FROM Categories WHERE(@kategoriAdý = CategoryName)
	IF (@kategoriAdý IS NOT NULL)
	BEGIN 
	INSERT INTO Categories(CategoryName) VALUES (@kategoriAdý)
	INSERT INTO Products(ProductName) VALUES (@ÜrünAdý)
	END
	ELSE 
	BEGIN
	DECLARE @ID INT
	SELECT  @ID = Categories.CategoryID FROM Categories WHERE @kategoriAdý = CategoryName

	INSERT INTO Products(ProductName,CategoryID) VALUES (@ÜrünAdý,@ID)
	END
END

--23.SORU : Günlük olarak rapor almak istiyorum Girdiðim kategoriye göre ürün adý ve stok miktarý getiren bir procedure yazýnýz

CREATE PROCEDURE sp_Rapor(@kategoriAdý NVARCHAR(15))
AS
BEGIN
SELECT CategoryName,ProductName,UnitsInStock
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = @kategoriAdý
END

-- 24 : 2 Tarih arasýnda yapmýþ olduum toplam ciro ne kadar Fonksiyon yazýnýz 

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

--25.SORU Customer tablosunda kayýt silmeyi iptal etmek istiyorum.Böyle bir þey mümkün mü mümkün ise nasýl

CREATE TRIGGER Employes_Delete ON Employees INSTEAD OF DELETE
AS 
BEGIN
RAISERROR ('Kiþilerin bilgilerini sistemden tamamen silemezsin',16,1)
END
INSERT INTO Employees

SELECT SUM(UnitPrice*Quantity*(1-Discount)) 
FROM [Order Details] INNER JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN '1996.07.04' AND '1998.05.06'

SELECT MIN(OrderDate) FROM Orders