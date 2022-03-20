-- USER DEF�NED FUNCT�ON (KULLANICI TANIMLI FONKS�YONLAR) --

-- Products tablosundaki �r�nlerin ad�n� , kategori ad�n� , birim fiyat�n� ve %18 KDV ' li fiyat�n� hesaplay�p listeleyelim.

SELECT
ProductName,CategoryName,UnitPrice,(UnitPrice*1.18) AS 'KVL''li Fiyat'
FROM Products p
INNER JOIN Categories c ON c.CategoryID = p.CategoryID

--Bu sorguyu sadele�tirmek i�in ve ihtiyac�m�z olan ba�ka yerlerde de kullanabilmek i�in KdvHesapla ad�nda bir Scalar Valued Function olu�tural�m:

CREATE FUNCTION KdvliHesapla(@fiyat money)
RETURNS MONEY
AS
BEGIN
RETURN @F�YAT*1.18
END

--Yukar�da olu�turulan fonksiyonu kullanarak sorgumuzu tekrardan yazal�m

SELECT
ProductName,CategoryName,UnitPrice, 'KDV''li Fiyat' = dbo.KdvliHesapla(UnitPrice)
FROM Products p
INNER JOIN Categories c ON c.CategoryID = p.CategoryID
ORDER BY [KDV'li Fiyat] DESC

--Diyelim ki KDV oran� d��t� %8 ' e d��t�

ALTER FUNCTION KdvliHesapla(@Fiyat money)
RETURNS MONEY
AS
BEGIN
RETURN @F�YAT*1.08
END 


--�al��an ki�ilerin ya�lar�n� hesaplay�p gerid�nd�ren udf yaz�n

SELECT FirstName+' '+LastName AS 'Person' , dbo.YasHesapla(BirthDate) AS Ya�
FROM Employees


CREATE FUNCTION YasHesapla(@Tarih DATETIME)
RETURNS INT
AS
BEGIN
RETURN YEAR(GETDATE())-YEAR(@Tarih)
END


--DI�ARIDAN ALDI�I ID B�LG�S�NE G�RE 

ALTER FUNCTION CalisanDondur(@ID INT)
RETURNS TABLE
RETURN SELECT * FROM Employees WHERE EmployeeID = @ID 

SELECT *
FROM CalisanDondur(5)


SELECT EmployeeID,FirstName,LastName FROM CalisanDondur(3)


--AY HESAPLA ADINDA ALDI�I DATETIME C�NS�NDEN DE�ER�N �ZER�NDEN KA� AY GE�M��,HESAPLAYAN VE BU DE�ER� GER� D�ND�REN B�R UDF OLU�TURUNUZ.ARDINDAN EMPLOYEES TABLOSUNDAK� HER B�R �ALI�ANIN ��E BA�LAMA TAR�H�N�DEN BU YANA KA� AY GE�M�� BU FONKS�YONU KULLANARAK LSTELEY�N�Z 


SELECT FirstName +' '+LastName AS Ki�i , dbo.AyHesapla(HireDate) AS [Ge�en Ay S�resi]
FROM Employees
ORDER BY [Ge�en Ay S�resi] DESC


CREATE FUNCTION AyHesapla(@Giri�Tarihi DATETIME)
RETURNS INT
BEGIN
RETURN DATEDIFF(MONTH,@Giri�Tarihi,GETDATE())
END

--�ki tarih aras�ndaki fark� alan ve geriye d�nd�ren ir UDF yaz�n�z , daha sonra sipari�ler tablosundan sipari� tarihi ile g�nderim tarihi aras�ndaki g�n say�s�n� bu fonksiyonu kullanarak listeleyiniz


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

SELECT OrderID ,OrderDate,ShippedDate ,dbo.GunHesapla(OrderDate,ShippedDate) AS G�nSay�s�
FROM Orders
ORDER BY G�nSay�s� DESC

--�al��an isimlerini , d��ar�dan g�nderilen harf ile ba�layan �al��anlar�n t�m bilgilerini getirecek �ekilde �al��acak bir udf yaz�n�z.Ard�ndan g�nderdi�iniz harf ile �al��anlar aras�ndan arama yapan sorguyu yaz�n�z.

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




--Sipari� g�nderilen �ehirleri ve sipari� say�lar�n� udf yaz�n�z ve �ehir ismi girerek arama yap�p ilgili �ehir ad� ve g�nderim say�s�n� listeleyerek sorguyu yaz�n�z
ALTER FUNCTION SiparisBul(@sehir NVARCHAR(50)) 
RETURNS TABLE
RETURN SELECT City,COUNT(*) AS Sipari�Say�s�
FROM Orders o INNER JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE City = @sehir
GROUP BY City


SELECT * FROM SiparisBul('London')


