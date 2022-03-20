CREATE VIEW Kahraman
AS
SELECT [Alt Kategori].AD , [Alt Kategori].ID FROM [Alt Kategori] WHERE [Ana Kategori].ID = 3

GO

CREATE VIEW Beden
AS
SELECT * FROM [Alt Kategori] WHERE [Ana Kategori].ID = 2 /*ANA KATEGOR� YER�NE ALT ANA ID GELECEK QUERY KISMINDA D�ZENLENMES LAZIM*/
GO




CREATE VIEW Renk
AS
SELECT [Alt Kategori].AD , [Alt Kategori].ID 
FROM [Alt Kategori]
WHERE [Alt Kategori]

CREATE VIEW [Ana Kategoriler]
AS 
SELECT [Alt Kategori].AD  FROM [Alt Kategori] WHERE [ANA ID] IS NULL
GO

SELECT *
FROM [Ana Kategori] ana
LEFT OUTER JOIN  [Alt Kategori] alt  ON ana.ID = alt.[ANA ID] /*Buradaki Ana Kategori VIEW ekran�nda bulunan sabit de�erleri getiriyor.*/ 