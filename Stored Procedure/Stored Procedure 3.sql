--STORE PROCEDURE:
--Employees tablosunda , yaþadýðý þehirler NULL olmayan çalýþanlarýn Ad,Soyad ve Görev'lerini listeleyen bir SP yazýnýz

CREATE PROCEDURE sp_CalisanlarýGetir 
AS
BEGIN
	SELECT FirstName,LastName,Title
	FROM Employees WHERE City IS NOT NULL
END

EXEC sp.CalisanlariGetir

--Procedure birden fazla deðer döndürebilir
--Tüm kategori isimleriyle, bu kategorilere ait olan ürünlerin adlarýný listeleyen bir SP yazýnýz.

CREATE PROC sp_KategoriyeAitUrunler 
AS 
BEGIN
	SELECT CategoryName , ProductName
	FROM Categories c
	LEFT OUTER JOIN Products p ON c.CategoryID = p.CategoryID
END

EXEC sp_KategoriyeAitUrunler

--Kategori ID'si alan ve bu ID'ye ilgili kategoriye ait ürünleri listeleyen SP yazýnýz...

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

--Kategori ID'si 5 olan ürünler (ÜrünAdý, KategoriAdý)
ALTER Procedure sp_PatlatBaba @catID INT , @proID INT
AS
BEGIN
SELECT ProductName,CategoryName
FROM Products p INNER JOIN Categories c ON c.CategoryID = p.CategoryID
WHERE c.CategoryID = @catID AND p.ProductID > @proID
END

EXEC sp_PatlatBaba 5 , 56
EXEC sp_PatlatBaba @proID=55,@catID=5