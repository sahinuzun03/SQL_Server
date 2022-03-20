--STORED PROCEDURES : Komut grubu eðer bir þey geri döndürecekse buna fonksiyon deniyor.Eðer bu komut grubu belirli iþler olduðu zaman çalýþacaksa ona da TRIGGER diyoruz.

-- T-SQL lisaný içerisinde yazacaðýz.
-- Begin ile End arasýnda çalýþan iþlem satýrlarý

GO
	DROP SCHEMA [Sahin]
GO
	CREATE SCHEMA [Sahin]
GO


CREATE PROCEDURE pasa.AktörTabloEkle
AS
BEGIN
CREATE Table pasa.Actors(	
	ID				INT				NOT NULL		IDENTITY(1,1)		PRIMARY KEY			
	,AD				NVARCHAR(MAX)	NOT NULL		
	,EkleyenKullanýcý NVARCHAR(200)	NULL			DEFAULT(SUSER_SNAME())
	,EklenmeTarihi	DATETIME		NULL			DEFAULT(GETDATE())
)
CREATE Table pasa.Directors(	
	ID		INT				NOT NULL		PRIMARY KEY			
	,AD		NVARCHAR(MAX)	NOT NULL		
	,DOÐUMTARÝHÝ DATETIME	NULL
)
  
	--DECLARE Komutu bizim deðiþken yaratmamýzý saðlar
	--DECLARE @<Deðiþken_Adý> <Deðiþken_Tipi>
	DECLARE @ID	INT
	SET @ID = 1 
	DECLARE @Name VARCHAR(250)
	SET @Name = 'Brad Pitt'
	EXEC pasa.AktörEkle @ID,@Name

	----Tabloya Veri Ekleme
	--INSERT INTO pasa.Actors (ID,AD)
	--VALUES (@ID,@Name)

	--INSERT INTO pasa.Actors (ID,AD)
	--VALUES (2,'Jennifer Aniston')

	--INSERT INTO pasa.Directors (ID,AD)
	--VALUES (@ID,@Name)
	EXEC pasa.AktörEkle 9,'Türkan Þoray'
	EXEC pasa.AktörEkle 10,'Tarýk Akan'

END 
GO

CREATE PROCEDURE pasa.AktörEkle 
(
	@AD VARCHAR(250)
)
AS
BEGIN
INSERT INTO pasa.Actors (AD)
VALUES (@AD)
DECLARE @INT INT
SET @ID = SCOPE_IDENTITY() -- SON YAZILANA ULAÞIYORUZ
SET @ID = @@ID --BÜTÜN YAZILANLARIN HEPSÝ GETÝRÝLÝR
VALUES
SELECT * FROM pasa.Actors 
where ýd = @ID/*Ýçeride tabloda ne var ne yok Store Procedure yaptýk */
END


EXEC pasa.AktörEkle 1,'Golcü Alex','1975.06.06'
EXEC pasa.AktörTabloEkle


CREATE DATABASE Film
USE Film


SELECT @@SERVERNAME --MAKÝNEMÝZÝN SERVERNAME'ÝNÝ ÇAÐIRMIÞ OLDUK

/* Her stored Procedure return olarak 0 deðerini return eder.

@Kullanýcý NVARCHAR(256) OUTPUT dediðim zaman dýþarýdan atama yap dedik!!*/

/* bütün bilgileri tabloda döndürmek isiyorsak 
 
	SELECT * 
	INTO YeniTablo /*SELECT SORGUSUNU TABLO YARATMAMIZI SAÐLAR*/
	FROM pasa.Actors WHERE ID = @ID
*/