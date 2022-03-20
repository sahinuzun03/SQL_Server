CREATE TABLE Silinen��renciler
(
   Ad				NVARCHAR(20)	NOT NULL
   ,Soyad			NVARCHAR(50)	NOT NULL
   ,[TC Kimlik]  	CHAR(11)		NULL
   ,Adress			NVARCHAR(250)	NULL
   ,CV				VARBINARY(MAX)	NULL
   ,TEL				CHAR(10)		NOT NULL /*UNIQUE ve not null kurtar�yor fakat telefon numaras� de�i�ebilir*/
   ,[Do�um Tarihi]	DATETIME		NULL
   ,ID				UNIQUEIDENTIFIER		NOT NULL		PRIMARY KEY		
)

CREATE TRIGGER ��renci_Delete ON ��renci FOR DELETE
AS 
BEGIN
INSERT dbo.Silinen��renciler
SELECT Ad,Soyad,[TC Kimlik],Adress,CV,TEL,[Do�um Tarihi],ID			
FROM deleted 
END		

CREATE TRIGGER ��renci_TCUpdate ON ��renci FOR UPDATE
AS
BEGIN

DECLARE  @TCNumaras� char(11)
SELECT @TCNumaras� = [TC Kimlik]
FROM inserted
--DECLARE @numericTC NUMERIC(11,0)
--SET @numericTC = CAST(@TCNumaras� AS numeric(11,0))
IF ISNUMERIC (@TCNumaras�) = 0 AND  @TCNumaras� IS NOT NULL
BEGIN
RAISERROR('TC kimlik numaras� n�merik olmal�d�r.',16,1) --Error type � ifade ediyor --19-25 aras� hatal� kay�t diyip loglara ekleyecek
--20-25 aras�nda bir de�er verilirse sql server �zerinde i�lem yapmas� durdurulacak
--0-9 aras�nda da hata yapmaz bilgi ama�l� mesaj veriyoruz anlam� vermektedir.
--16 verdi�imizde de kullan�c�n�n yaratt��� hatalar olarak belirtebiliriz.

rollback transaction -- yap�lan i�lemleri geriye sayd�k
--2 parametre al�r error seviyesi 1-5 aras� devam ediyor 
--20 �st� sql server durduruyor
--16 ' da hata mesaj� ��kart�yor oldu�unu belirtiyor
END
END