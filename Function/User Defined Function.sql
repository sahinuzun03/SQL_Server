-- USER DEFÝNED FUNCTÝON (KULLANICI TANIMLI FONKSÝYONLAR) --

-- Products tablosundaki ürünlerin adýný , kategori adýný , birim fiyatýný ve %18 KDV ' li fiyatýný hesaplayýp listeleyelim.

SELECT
ProductName,CategoryName,UnitPrice,(UnitPrice*1.18) AS 'KVL''li Fiyat'
FROM Products p
INNER JOIN Categories c ON c.CategoryID = p.CategoryID

--Bu sorguyu sadeleþtirmek için ve ihtiyacýmýz olan baþka yerlerde de kullanabilmek için KdvHesapla adýnda bir Scalar Valued Function oluþturalým:

CREATE FUNCTION KdvliHesapla(@fiyat money)
RETURNS MONEY
AS
BEGIN
RETURN @FÝYAT*1.18
END

--Yukarýda oluþturulan fonksiyonu kullanarak sorgumuzu tekrardan yazalým

SELECT
ProductName,CategoryName,UnitPrice, 'KDV''li Fiyat' = dbo.KdvliHesapla(UnitPrice)
FROM Products p
INNER JOIN Categories c ON c.CategoryID = p.CategoryID
ORDER BY [KDV'li Fiyat] DESC

--Diyelim ki KDV oraný düþtü %8 ' e düþtü

ALTER FUNCTION KdvliHesapla(@Fiyat money)
RETURNS MONEY
AS
BEGIN
RETURN @FÝYAT*1.08
END 


--Çalýþan kiþilerin yaþlarýný hesaplayýp geridöndüren udf yazýn

SELECT FirstName+' '+LastName AS 'Person' , dbo.YasHesapla(BirthDate) AS Yaþ
FROM Employees


CREATE FUNCTION YasHesapla(@Tarih DATETIME)
RETURNS INT
AS
BEGIN
RETURN YEAR(GETDATE())-YEAR(@Tarih)
END


--DIÞARIDAN ALDIÐI ID BÝLGÝSÝNE GÖRE 

ALTER FUNCTION CalisanDondur(@ID INT)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE EmployeeID = @ID 

SELECT *
FROM CalisanDondur(5)


SELECT EmployeeID,FirstName,LastName FROM CalisanDondur(3)


--AY HESAPLA ADINDA ALDIÐI DATETIME CÝNSÝNDEN DEÐERÝN ÜZERÝNDEN KAÇ AY GEÇMÝÞ,HESAPLAYAN VE BU DEÐERÝ GERÝ DÖNDÜREN BÝR UDF OLUÞTURUNUZ.ARDINDAN EMPLOYEES TABLOSUNDAKÝ HER BÝR ÇALIÞANIN ÝÞE BAÞLAMA TARÝHÝNÝDEN BU YANA KAÇ AY GEÇMÝÞ BU FONKSÝYONU KULLANARAK LSTELEYÝNÝZ 


SELECT FirstName +' '+LastName AS Kiþi , dbo.AyHesapla(HireDate) AS [Geçen Ay Süresi]
FROM Employees
ORDER BY [Geçen Ay Süresi] DESC


CREATE FUNCTION AyHesapla(@GiriþTarihi DATETIME)
RETURNS INT
BEGIN
RETURN DATEDIFF(MONTH,@GiriþTarihi,GETDATE())
END

--Ýki tarih arasýndaki farký alan ve geriye döndüren ir UDF yazýnýz , daha sonra sipariþler tablosundan sipariþ tarihi ile gönderim tarihi arasýndaki gün sayýsýný bu fonksiyonu kullanarak listeleyiniz


CREATE FUNCTION TarihFarkHesapla(@BirinciTarih DATETIME,@IkinciTarih DATETIME)
RETURNS INT
BEGIN
RETURN DATEDIFF(DAY,@BirinciTarih,@IkinciTarih)
END


CREATE FUNCTION GunHesapla(@tarih DATETIME,@tarih2 DATETIME)
RETURNS INT
BEGIN
DECLARE @gunSayisi INT
SET @gunSayisi = DATEDIFF(DAY,@tarih,@tarih2)
RETURN @gunSayisi
END

SELECT OrderID ,OrderDate,ShippedDate ,dbo.GunHesapla(OrderDate,ShippedDate) AS GünSayýsý
FROM Orders
ORDER BY GünSayýsý DESC

--Çalýþan isimlerini , dýþarýdan gönderilen harf ile baþlayan çalýþanlarýn tüm bilgilerini getirecek þekilde çalýþacak bir udf yazýnýz.Ardýndan gönderdiðiniz harf ile çalýþanlar arasýndan arama yapan sorguyu yazýnýz.

-- 1.YOL --
CREATE FUNCTION HarfAl(@harf CHAR)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE FirstName LIKE @harf+'%'

--2.YOL -- 
CREATE FUNCTION HarfAl2(@harf CHAR)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE CHARINDEX(@harf,FirstName) = 1
SELECT *
FROM HarfAl2('a')


CREATE FUNCTION HarfAl3(@harf CHAR)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE SUBSTRING(FirstName,1,1) = @harf


CREATE FUNCTION HarfAl4(@harf CHAR)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE LEFT(FirstName,1) = @harf

SELECT *
FROM HarfAl4('a')




--Sipariþ gönderilen þehirleri ve sipariþ sayýlarýný udf yazýnýz ve þehir ismi girerek arama yapýp ilgili þehir adý ve gönderim sayýsýný listeleyerek sorguyu yazýnýz
ALTER FUNCTION SiparisBul(@sehir NVARCHAR(50)) 
RETURNS TABLE
RETURN SELECT City,COUNT(*) AS SipariþSayýsý
FROM Orders o INNER JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE City = @sehir
GROUP BY City


SELECT * FROM SiparisBul('London')


