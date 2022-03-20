--STORED PROCEDURES : Komut grubu e�er bir �ey geri d�nd�recekse buna fonksiyon deniyor.E�er bu komut grubu belirli i�ler oldu�u zaman �al��acaksa ona da TRIGGER diyoruz.

-- T-SQL lisan� i�erisinde yazaca��z.
-- Begin ile End aras�nda �al��an i�lem sat�rlar�

GO
	DROP SCHEMA [Sahin]
GO
	CREATE SCHEMA [Sahin]
GO


CREATE PROCEDURE pasa.Akt�rTabloEkle
AS
BEGIN
CREATE Table pasa.Actors(	
	ID				INT				NOT NULL		IDENTITY(1,1)		PRIMARY KEY			
	,AD				NVARCHAR(MAX)	NOT NULL		
	,EkleyenKullan�c� NVARCHAR(200)	NULL			DEFAULT(SUSER_SNAME())
	,EklenmeTarihi	DATETIME		NULL			DEFAULT(GETDATE())
)
CREATE Table pasa.Directors(	
	ID		INT				NOT NULL		PRIMARY KEY			
	,AD		NVARCHAR(MAX)	NOT NULL		
	,DO�UMTAR�H� DATETIME	NULL
)
  
	--DECLARE Komutu bizim de�i�ken yaratmam�z� sa�lar
	--DECLARE @<De�i�ken_Ad�> <De�i�ken_Tipi>
	DECLARE @ID	INT
	SET @ID = 1 
	DECLARE @Name VARCHAR(250)
	SET @Name = 'Brad Pitt'
	EXEC pasa.Akt�rEkle @ID,@Name

	----Tabloya Veri Ekleme
	--INSERT INTO pasa.Actors (ID,AD)
	--VALUES (@ID,@Name)

	--INSERT INTO pasa.Actors (ID,AD)
	--VALUES (2,'Jennifer Aniston')

	--INSERT INTO pasa.Directors (ID,AD)
	--VALUES (@ID,@Name)
	EXEC pasa.Akt�rEkle 9,'T�rkan �oray'
	EXEC pasa.Akt�rEkle 10,'Tar�k Akan'

END 
GO

CREATE PROCEDURE pasa.Akt�rEkle 
(
	@AD VARCHAR(250)
)
AS
BEGIN
INSERT INTO pasa.Actors (AD)
VALUES (@AD)
DECLARE @INT INT
SET @ID = SCOPE_IDENTITY() -- SON YAZILANA ULA�IYORUZ
SET @ID = @@ID --B�T�N YAZILANLARIN HEPS� GET�R�L�R
VALUES
SELECT * FROM pasa.Actors 
where �d = @ID/*��eride tabloda ne var ne yok Store Procedure yapt�k */
END


EXEC pasa.Akt�rEkle 1,'Golc� Alex','1975.06.06'
EXEC pasa.Akt�rTabloEkle


CREATE DATABASE Film
USE Film


SELECT @@SERVERNAME --MAK�NEM�Z�N SERVERNAME'�N� �A�IRMI� OLDUK

/* Her stored Procedure return olarak 0 de�erini return eder.

@Kullan�c� NVARCHAR(256) OUTPUT dedi�im zaman d��ar�dan atama yap dedik!!*/

/* b�t�n bilgileri tabloda d�nd�rmek isiyorsak 
 
	SELECT * 
	INTO YeniTablo /*SELECT SORGUSUNU TABLO YARATMAMIZI SA�LAR*/
	FROM pasa.Actors WHERE ID = @ID
*/