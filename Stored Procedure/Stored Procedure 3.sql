--STORE PROCEDURE:
--Employees tablosunda , ya�ad��� �ehirler NULL olmayan �al��anlar�n Ad,Soyad ve G�rev'lerini listeleyen bir SP yaz�n�z

CREATE PROCEDURE sp_Calisanlar�Getir 
AS
BEGIN
	SELECT FirstName,LastName,Title
	FROM Employees WHERE City IS NOT NULL
END

EXEC sp.CalisanlariGetir

--Procedure birden fazla de�er d�nd�rebilir
--T�m kategori isimleriyle, bu kategorilere ait olan �r�nlerin adlar�n� listeleyen bir SP yaz�n�z.

CREATE PROC sp_KategoriyeAitUrunler 
AS 
BEGIN
	SELECT CategoryName , ProductName
	FROM Categories c
	LEFT OUTER JOIN Products p ON c.CategoryID = p.CategoryID
END

EXEC sp_KategoriyeAitUrunler

--Kategori ID'si alan ve bu ID'ye ilgili kategoriye ait �r�nleri listeleyen SP yaz�n�z...

CREATE PROCEDURE sp_UrunByKategori @id INT
AS
BEGIN
	SELECT ProductName,CategoryName
	FROM Categories c
	INNER JOIN Products p ON c.CategoryID = p.CategoryID
	WHERE c.CategoryID = @id
END

EXEC sp_UrunByKategori 5
EXEC sp_UrunByKategori @id=3

--Kategori ID'si 5 olan �r�nler (�r�nAd�, KategoriAd�)
ALTER Procedure sp_PatlatBaba @catID INT , @proID INT
AS
BEGIN
SELECT ProductName,CategoryName
FROM Products p INNER JOIN Categories c ON c.CategoryID = p.CategoryID
WHERE c.CategoryID = @catID AND p.ProductID > @proID
END

EXEC sp_PatlatBaba 5 , 56
EXEC sp_PatlatBaba @proID=55,@catID=5