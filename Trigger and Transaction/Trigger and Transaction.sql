CREATE TABLE SilinenÖðrenciler
(
   Ad				NVARCHAR(20)	NOT NULL
   ,Soyad			NVARCHAR(50)	NOT NULL
   ,[TC Kimlik]  	CHAR(11)		NULL
   ,Adress			NVARCHAR(250)	NULL
   ,CV				VARBINARY(MAX)	NULL
   ,TEL				CHAR(10)		NOT NULL /*UNIQUE ve not null kurtarýyor fakat telefon numarasý deðiþebilir*/
   ,[Doðum Tarihi]	DATETIME		NULL
   ,ID				UNIQUEIDENTIFIER		NOT NULL		PRIMARY KEY		
)

CREATE TRIGGER Öðrenci_Delete ON Öðrenci FOR DELETE
AS 
BEGIN
INSERT dbo.SilinenÖðrenciler
SELECT Ad,Soyad,[TC Kimlik],Adress,CV,TEL,[Doðum Tarihi],ID			
FROM deleted 
END		

CREATE TRIGGER Öðrenci_TCUpdate ON Öðrenci FOR UPDATE
AS
BEGIN

DECLARE  @TCNumarasý char(11)
SELECT @TCNumarasý = [TC Kimlik]
FROM inserted
--DECLARE @numericTC NUMERIC(11,0)
--SET @numericTC = CAST(@TCNumarasý AS numeric(11,0))
IF ISNUMERIC (@TCNumarasý) = 0 AND  @TCNumarasý IS NOT NULL
BEGIN
RAISERROR('TC kimlik numarasý nümerik olmalýdýr.',16,1) --Error type ý ifade ediyor --19-25 arasý hatalý kayýt diyip loglara ekleyecek
--20-25 arasýnda bir deðer verilirse sql server üzerinde iþlem yapmasý durdurulacak
--0-9 arasýnda da hata yapmaz bilgi amaçlý mesaj veriyoruz anlamý vermektedir.
--16 verdiðimizde de kullanýcýnýn yarattýðý hatalar olarak belirtebiliriz.

rollback transaction -- yapýlan iþlemleri geriye saydýk
--2 parametre alýr error seviyesi 1-5 arasý devam ediyor 
--20 üstü sql server durduruyor
--16 ' da hata mesajý çýkartýyor olduðunu belirtiyor
END
END