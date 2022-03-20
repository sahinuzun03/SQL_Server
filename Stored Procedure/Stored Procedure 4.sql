--STORE PROCEDURE Çalýþma Sorularý 

--1.SORU
--Maksimum 10 karakterlik parametre alan,Employees tablosundaki çalýþanlarýn adlarýný içinde parametre bulunan kiþilerin ad ve soyadlarýný listeleyen bir SP yazýnýz.
CREATE PROCEDURE Soru1 @isim NVARCHAR(10)
AS
BEGIN
SELECT FirstName AS Ad , LastName AS Soyad 
FROM Employees 
WHERE FirstName LIKE '%'+@isim+'%'
END

--2.SORU
--sp_Calisanlar isimli bir SP oluþturunuz.Bu SP ad ve soyadýna göre çalýþanýn tüm bilgilerini getiren bir SP yazýnýz.
CREATE PROCEDURE sp_Calisanlar @ad NVARCHAR(10) , @soyad NVARCHAR(10)
AS
BEGIN
SELECT FirstName AS Ýsim , LastName AS Soyisim
FROM Employees
WHERE FirstName = @ad AND LastName = @soyad
END
--3.SORU
--sp_Calisanlar isimli bir SP'yi güncelleyiniz. BU SP çalýþanýn ID'si , Adý , Soyadý,Görevi ve Unvaný bilgilerini getirsin.
PROCEDURE sp_Calisanlar
AS
BEGIN
SELECT EmployeeID AS ÇalýþanID ,TitleOfCourtesy AS Unvaný, FirstName AS Ýsim , LastName AS Soyisim , Title AS ÇalýþanGörevi 
FROM Employees
END

--4.SORU
--sp_Calisanlar isimli SP'yi siliniz.

DROP PROCEDURE sp_Calisanlar

--5.SORU 
--Customers tablosuna INSERT iþlemi yapan bir SP yazýnýz.Eðer herhangi bir kolona deðer girilmez ise NULL deðer yerleþtirmek yerine o kolona 'Belirtilmedi' ifadesini yerleþtirilsin.
CREATE PROCEDURE EKLEMEYAP @ID NCHAR(5),@AD NVARCHAR(40),@kiþiAd NVARCHAR(30)
AS
BEGIN
INSERT INTO Customers (CustomerID,CompanyName,ContactName) VALUES (@ID,@AD,@kiþiAd)
END
SELECT * FROM Customers 
--Parametreye default deðer vermek için @kiþAD = 'BELÝRTÝLMEDÝ' dediðimiz zaman bu iþlem gerçekleþmiþ olacaktýr.
--6.SORU
--Kullanýcýnýn belirttiði kategoriyi (kategori adý) eðer kategoriler tablosunda yoksa ekleyen, varsa bu kategoriye gönderilen açýklama ile güncelleyen bir SP yazýnýz.(Kategorinin açýklamasý güncellenecek)
CREATE PROCEDURE Ekle @kategori NVARCHAR(15),@açýklama NTEXT
AS
	IF
		EXISTS (SELECT CategoryName From Categories WHERE CategoryName = @kategori)
		BEGIN
		UPDATE Categories 
		SET Description = @açýklama WHERE CategoryName = @kategori
		PRINT 'BU KATEGORÝ ZATEN VAR KARDEÞÝM HADÝ SENÝ MÝ KIRACAÐIM AÇIKLAMASINI GÜNCELLEDÝM'
		END
	ELSE
		BEGIN	
		INSERT INTO Categories(CategoryName,Description) VALUES (@kategori,@açýklama)
		PRINT 'GÖNDERÝLEN KATEGORÝ ADI VE AÇIKLAMA EKLENDÝ. KAFAN RAHAT OLSUN KARDEÞÝM'
		END
SELECT * FROM Categories
EXEC dbo.Ekle 'Kardeþ','KAPLAN'
EXEC dbo.Ekle 'Kardeþ',
--7.SORU 
--Girilen 3 tane tam sayýnýn toplamýný bulan bir SP yazýnýz.
CREATE PROCEDURE sayýlarýTopla @sayi1 INT,@sayi2 INT,@sayi3 INT,@sonuc INT OUTPUT
AS
BEGIN
SET @sonuc = @sayi1+@sayi2+@sayi3
END

DECLARE @sonuc INT
EXEC dbo.sayýlarýTopla 7,2,3,@sonuc output
SELECT @sonuc

--8.SORU 
--Girilen 3 tane tam sayýnýn toplamýný ve ortalamasýný bulan bir SP yazýnýz.(OUTPUT tipli olarak ortalamayý fýrlatsýn)
alter PROCEDURE Ortalama @sayi1 INT , @sayi2 INT, @sayi3 INT 
,@sonuc2 INT OUTPUT
AS
BEGIN
SET @sonuc2 =(@sayi1+@sayi2+@sayi3)/3
END


DECLARE @sonuc2 INT
EXEC Ortalama 1,2,3,@sonuc2 output
SELECT @sonuc2

--9.SORU
--sp_UrunVeKategori adýnda ; INPUT parametre olarak Ürün Adý ve Kategori Adý alan;OUTPUT parametre olarak ÜrünID alan ve bu SP ' ye gönderilen kategori daha önce eklenmemiþse ekleyip en son eklenen kategöroinin ID'sini kullanarak ürünlere parametre olarak gönderilen verileri dpðru bir kategori ID ile ekleyen ,eðer kategori adý daha önceden ekli ise bu kategorinin ID sini kullanarak çalýþan bir SP yazýnýz.

CREATE PROCEDURE UrunVeKategori @ürünAdý NVARCHAR(50) , @kategoriAdý NVARCHAR(20),@ürünID INT OUTPUT
AS
IF
EXISTS (SELECT * FROM Categories WHERE CategoryName = @kategoriAdý)
BEGIN
PRINT 'Kardeþim bu kategori adý burada var ama ben sana güzellik yapýp bu ürünü buraya kaydediyorum'
DECLARE @mevcutkategoriID INT 
SET @mevcutkategoriID = (SELECT CategoryID FROM Categories WHERE CategoryName = @kategoriAdý)
INSERT INTO Products (CategoryID,ProductName) VALUES (@mevcutkategoriID,@ürünAdý)
END
ELSE
BEGIN
PRINT 'Kardeþim yeni kategori getirmiþsin ekledim.Yeni kategori getirene yeni ürün bedava diyip ürünüde sisteme ekledim Hadii yine iyisinnnn!!!! '
DECLARE @enSonKategoriID INT
SET @enSonKategoriID = (SELECT max(CategoryID) FROM Categories) 
INSERT INTO Products (CategoryID,ProductName) VALUES (@enSonKategoriID,@ürünAdý)
END

CREATE PROCEDURE sp_UrunVeKategori @urunAdi NVARCHAR(40),@kategoriAdý NVARCHAR(15),@urunID INT OUTPUT
AS
BEGIN
DECLARE @kategoriID INT

IF EXISTS (SELECT * From Categories WHERE CategoryName = @kategoriAdý)
BEGIN
	SELECT @kategoriID = CategoryID FROM Categories Where CategoryName = @kategoriAdý
END
ELSE
BEGIN
INSERT INTO Categories(CategoryName) VALUES (@kategoriAdý)
SET @kategoriID = @@IDENTITY
END
INSERT INTO Products (ProductName,CategoryID) VALUES (@urunAdi,@kategoriAdý)
SET @urunID = @@IDENTITY
END


DECLARE @id INT
EXEC sp_UrunVeKategori 'Domates','Sebzeler',@id OUT
SELECT * From Products WHERE ProductID = @id

-- 10.SORU -- 
--sp_MusteriEkle adýnda þirket adý ve ýd'sini parametre olarak alan ve eðer gönderilen þirket adý zaten kayýtlýysa herhangi bir ilem yapmadan 'Bu þirket adý zaten kayýtlýdýr' mesajýný veren , aksi halde kayýt ekleyen bir SP yazýnýz.

CREATE PROCEDURE sp_MusteriEkle @sirketAdi NVARCHAR(40) , @sirketID NCHAR(5)
AS
BEGIN
	IF EXISTS(SELECT CompanyName FROM Customers WHERE CompanyName = @sirketAdi)
		BEGIN
			PRINT 'Bu þirket adý zaten kayýtlýdýr';
		END
	ELSE
		BEGIN
			INSERT INTO Customers (CompanyName,CustomerID) VALUES (@sirketAdi,@sirketID)
			PRINT 'Þirket Baþarýyla Eklendi'
		END
END

EXEC sp_MusteriEkle 'Þahin UZUN CO.' , 'KHKCO'

SELECT * FROM Customers

--11.SORU --
--Ýlk olarak sp_KategoriEkle adýnda input tipli olarak kategori adý ve output tipli olarak kategori ID alan , gönderilen kategöri adýnda bir veri yoksa ekleyen bir sp yazýnýz.Ardýndanda sp_Urun  ekle adýnda kategori adý,birim fiyatý default olarak 10 deðrine sahip olsun alan ve eðer gönderilen ürün adýnda bir veri yoksa bunu sp_KategoriEkle isimli store procedurü kullanarak ekleyen bir sp yazýnýz.



CREATE PROCEDURE sp_KategoriEkle @kategoriAdý NVARCHAR(15),@kategoriID INT OUTPUT AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Categories WHERE CategoryName = @kategoriAdý)
		BEGIN
			INSERT INTO Categories (CategoryName) VALUES (@kategoriAdý)
			SET @kategoriID = @@IDENTITY
		END
	ELSE	
		BEGIN
			SELECT @kategoriID = CategoryID FROM Categories WHERE CategoryName = @kategoriAdý
		END
END

CREATE PROCEDURE sp_UrunEkle @UrunAdi NVARCHAR(40),@katAdi NVARCHAR(15),@brimFiyatý MONEY = 15
AS
BEGIN
	IF EXISTS (SELECT * FROM Products WHERE ProductName = @UrunAdi)
		BEGIN
			PRINT 'BU ÜRÜN PRODUCTS TABLOSUNDA BULUNDUÐU ÝÇÝN HERHANGÝ BÝR ÝÞLEM YAPILMAMIÞTIR.'
		END
	ELSE
		BEGIN
			DECLARE @katID INT
			EXEC sp_KategoriEkle @katAdi , @katID OUT	--yukarýda fýrlatýlan @kategoriID ' yi burada yakaladýk.
			INSERT INTO Products (ProductName,CategoryID,UnitPrice) VALUES (@UrunAdi,@katID,@brimFiyatý)
			PRINT 'Belirttiðiniz ürün Products tablosuna eklenmiþtir.Ürünün kayýt numarsý: ' + CAST(@@IDENTITY AS NVARCHAR)
		END
		
END

EXEC sp_UrunEkle 'Bilgisayar','Teknoloji',7850

select * from Products WHERE ProductID = 101