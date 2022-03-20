--STORE PROCEDURE �al��ma Sorular� 

--1.SORU
--Maksimum 10 karakterlik parametre alan,Employees tablosundaki �al��anlar�n adlar�n� i�inde parametre bulunan ki�ilerin ad ve soyadlar�n� listeleyen bir SP yaz�n�z.
CREATE PROCEDURE Soru1 @isim NVARCHAR(10)
AS
BEGIN
SELECT FirstName AS Ad , LastName AS Soyad 
FROM Employees 
WHERE FirstName LIKE '%'+@isim+'%'
END

--2.SORU
--sp_Calisanlar isimli bir SP olu�turunuz.Bu SP ad ve soyad�na g�re �al��an�n t�m bilgilerini getiren bir SP yaz�n�z.
CREATE PROCEDURE sp_Calisanlar @ad NVARCHAR(10) , @soyad NVARCHAR(10)
AS
BEGIN
SELECT FirstName AS �sim , LastName AS Soyisim
FROM Employees
WHERE FirstName = @ad AND LastName = @soyad
END
--3.SORU
--sp_Calisanlar isimli bir SP'yi g�ncelleyiniz. BU SP �al��an�n ID'si , Ad� , Soyad�,G�revi ve Unvan� bilgilerini getirsin.
PROCEDURE sp_Calisanlar
AS
BEGIN
SELECT EmployeeID AS �al��anID ,TitleOfCourtesy AS Unvan�, FirstName AS �sim , LastName AS Soyisim , Title AS �al��anG�revi 
FROM Employees
END

--4.SORU
--sp_Calisanlar isimli SP'yi siliniz.

DROP PROCEDURE sp_Calisanlar

--5.SORU 
--Customers tablosuna INSERT i�lemi yapan bir SP yaz�n�z.E�er herhangi bir kolona de�er girilmez ise NULL de�er yerle�tirmek yerine o kolona 'Belirtilmedi' ifadesini yerle�tirilsin.
CREATE PROCEDURE EKLEMEYAP @ID NCHAR(5),@AD NVARCHAR(40),@ki�iAd NVARCHAR(30)
AS
BEGIN
INSERT INTO Customers (CustomerID,CompanyName,ContactName) VALUES (@ID,@AD,@ki�iAd)
END
SELECT * FROM Customers 
--Parametreye default de�er vermek i�in @ki�AD = 'BEL�RT�LMED�' dedi�imiz zaman bu i�lem ger�ekle�mi� olacakt�r.
--6.SORU
--Kullan�c�n�n belirtti�i kategoriyi (kategori ad�) e�er kategoriler tablosunda yoksa ekleyen, varsa bu kategoriye g�nderilen a��klama ile g�ncelleyen bir SP yaz�n�z.(Kategorinin a��klamas� g�ncellenecek)
CREATE PROCEDURE Ekle @kategori NVARCHAR(15),@a��klama NTEXT
AS
	IF
		EXISTS (SELECT CategoryName From Categories WHERE CategoryName = @kategori)
		BEGIN
		UPDATE Categories 
		SET Description = @a��klama WHERE CategoryName = @kategori
		PRINT 'BU KATEGOR� ZATEN VAR KARDE��M HAD� SEN� M� KIRACA�IM A�IKLAMASINI G�NCELLED�M'
		END
	ELSE
		BEGIN	
		INSERT INTO Categories(CategoryName,Description) VALUES (@kategori,@a��klama)
		PRINT 'G�NDER�LEN KATEGOR� ADI VE A�IKLAMA EKLEND�. KAFAN RAHAT OLSUN KARDE��M'
		END
SELECT * FROM Categories
EXEC dbo.Ekle 'Karde�','KAPLAN'
EXEC dbo.Ekle 'Karde�',
--7.SORU 
--Girilen 3 tane tam say�n�n toplam�n� bulan bir SP yaz�n�z.
CREATE PROCEDURE say�lar�Topla @sayi1 INT,@sayi2 INT,@sayi3 INT,@sonuc INT OUTPUT
AS
BEGIN
SET @sonuc = @sayi1+@sayi2+@sayi3
END

DECLARE @sonuc INT
EXEC dbo.say�lar�Topla 7,2,3,@sonuc output
SELECT @sonuc

--8.SORU 
--Girilen 3 tane tam say�n�n toplam�n� ve ortalamas�n� bulan bir SP yaz�n�z.(OUTPUT tipli olarak ortalamay� f�rlats�n)
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
--sp_UrunVeKategori ad�nda ; INPUT parametre olarak �r�n Ad� ve Kategori Ad� alan;OUTPUT parametre olarak �r�nID alan ve bu SP ' ye g�nderilen kategori daha �nce eklenmemi�se ekleyip en son eklenen kateg�roinin ID'sini kullanarak �r�nlere parametre olarak g�nderilen verileri dp�ru bir kategori ID ile ekleyen ,e�er kategori ad� daha �nceden ekli ise bu kategorinin ID sini kullanarak �al��an bir SP yaz�n�z.

CREATE PROCEDURE UrunVeKategori @�r�nAd� NVARCHAR(50) , @kategoriAd� NVARCHAR(20),@�r�nID INT OUTPUT
AS
IF
EXISTS (SELECT * FROM Categories WHERE CategoryName = @kategoriAd�)
BEGIN
PRINT 'Karde�im bu kategori ad� burada var ama ben sana g�zellik yap�p bu �r�n� buraya kaydediyorum'
DECLARE @mevcutkategoriID INT 
SET @mevcutkategoriID = (SELECT CategoryID FROM Categories WHERE CategoryName = @kategoriAd�)
INSERT INTO Products (CategoryID,ProductName) VALUES (@mevcutkategoriID,@�r�nAd�)
END
ELSE
BEGIN
PRINT 'Karde�im yeni kategori getirmi�sin ekledim.Yeni kategori getirene yeni �r�n bedava diyip �r�n�de sisteme ekledim Hadii yine iyisinnnn!!!! '
DECLARE @enSonKategoriID INT
SET @enSonKategoriID = (SELECT max(CategoryID) FROM Categories) 
INSERT INTO Products (CategoryID,ProductName) VALUES (@enSonKategoriID,@�r�nAd�)
END

CREATE PROCEDURE sp_UrunVeKategori @urunAdi NVARCHAR(40),@kategoriAd� NVARCHAR(15),@urunID INT OUTPUT
AS
BEGIN
DECLARE @kategoriID INT

IF EXISTS (SELECT * From Categories WHERE CategoryName = @kategoriAd�)
BEGIN
	SELECT @kategoriID = CategoryID FROM Categories Where CategoryName = @kategoriAd�
END
ELSE
BEGIN
INSERT INTO Categories(CategoryName) VALUES (@kategoriAd�)
SET @kategoriID = @@IDENTITY
END
INSERT INTO Products (ProductName,CategoryID) VALUES (@urunAdi,@kategoriAd�)
SET @urunID = @@IDENTITY
END


DECLARE @id INT
EXEC sp_UrunVeKategori 'Domates','Sebzeler',@id OUT
SELECT * From Products WHERE ProductID = @id

-- 10.SORU -- 
--sp_MusteriEkle ad�nda �irket ad� ve �d'sini parametre olarak alan ve e�er g�nderilen �irket ad� zaten kay�tl�ysa herhangi bir ilem yapmadan 'Bu �irket ad� zaten kay�tl�d�r' mesaj�n� veren , aksi halde kay�t ekleyen bir SP yaz�n�z.

CREATE PROCEDURE sp_MusteriEkle @sirketAdi NVARCHAR(40) , @sirketID NCHAR(5)
AS
BEGIN
	IF EXISTS(SELECT CompanyName FROM Customers WHERE CompanyName = @sirketAdi)
		BEGIN
			PRINT 'Bu �irket ad� zaten kay�tl�d�r';
		END
	ELSE
		BEGIN
			INSERT INTO Customers (CompanyName,CustomerID) VALUES (@sirketAdi,@sirketID)
			PRINT '�irket Ba�ar�yla Eklendi'
		END
END

EXEC sp_MusteriEkle '�ahin UZUN CO.' , 'KHKCO'

SELECT * FROM Customers

--11.SORU --
--�lk olarak sp_KategoriEkle ad�nda input tipli olarak kategori ad� ve output tipli olarak kategori ID alan , g�nderilen kateg�ri ad�nda bir veri yoksa ekleyen bir sp yaz�n�z.Ard�ndanda sp_Urun  ekle ad�nda kategori ad�,birim fiyat� default olarak 10 de�rine sahip olsun alan ve e�er g�nderilen �r�n ad�nda bir veri yoksa bunu sp_KategoriEkle isimli store procedur� kullanarak ekleyen bir sp yaz�n�z.



CREATE PROCEDURE sp_KategoriEkle @kategoriAd� NVARCHAR(15),@kategoriID INT OUTPUT AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Categories WHERE CategoryName = @kategoriAd�)
		BEGIN
			INSERT INTO Categories (CategoryName) VALUES (@kategoriAd�)
			SET @kategoriID = @@IDENTITY
		END
	ELSE	
		BEGIN
			SELECT @kategoriID = CategoryID FROM Categories WHERE CategoryName = @kategoriAd�
		END
END

CREATE PROCEDURE sp_UrunEkle @UrunAdi NVARCHAR(40),@katAdi NVARCHAR(15),@brimFiyat� MONEY = 15
AS
BEGIN
	IF EXISTS (SELECT * FROM Products WHERE ProductName = @UrunAdi)
		BEGIN
			PRINT 'BU �R�N PRODUCTS TABLOSUNDA BULUNDU�U ���N HERHANG� B�R ��LEM YAPILMAMI�TIR.'
		END
	ELSE
		BEGIN
			DECLARE @katID INT
			EXEC sp_KategoriEkle @katAdi , @katID OUT	--yukar�da f�rlat�lan @kategoriID ' yi burada yakalad�k.
			INSERT INTO Products (ProductName,CategoryID,UnitPrice) VALUES (@UrunAdi,@katID,@brimFiyat�)
			PRINT 'Belirtti�iniz �r�n Products tablosuna eklenmi�tir.�r�n�n kay�t numars�: ' + CAST(@@IDENTITY AS NVARCHAR)
		END
		
END

EXEC sp_UrunEkle 'Bilgisayar','Teknoloji',7850

select * from Products WHERE ProductID = 101