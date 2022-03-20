--TRIGER:
--AFTER TRIGGER
--Instead of Trigger
--Categories tablosuna eklenen kategoriyi yazan bir triger olu�turun
CREATE TRIGGER Categori_Ekle ON Categories AFTER INSERT
AS
BEGIN
	DECLARE @kategoriAd� NVARCHAR(15)
	SELECT @kategoriAd� = CategoryName FROM inserted
	PRINT @kategoriAd� + '�simli kategori eklendi'
END

INSERT INTO Categories (CategoryName) VALUES ('K�yafetler')

SELECT * FROM Categories


--Order Detail tablosunda bir sipari�teki bir �r�n sat�ld���nda o �r�n�n stok miktar�nda sat�lan miktar kadar azaltma yapan bir triger yaz�n�z.

CREATE TRIGGER StokDusur ON [Order Detail] AFTER INSERT
AS 
BEGIN
	DECLARE @miktar SMALLINT ,@urunID INT
	SELECT @miktar = Quantity , @urunID = ProductID FROM inserted
	UPDATE Products SET UnitsInStock = UnitsInStock - @miktar WHERE ProductID = @urunID
END


SELECT * FROM Products WHERE ProductID = 6 --stokta 120 tane var


INSERT INTO Orders (CustomerID,EmployeeID) VALUES ('KHKCO',5)
SELECT * FROM Orders WHERE CustomerID = 'KHKCO' AND EmployeeID = 5 --11078 ORDERID

INSERT INTO [Order Details] (OrderID,ProductID,Quantity,UnitPrice) values (11078,6,10,25.00) 

SELECT * FROM [Order Details] WHERE OrderID = 11078 AND ProductID = 6

--Order details tablosundan bir kay�t silindi�inde Products tablosundaki Un�tInStock kolununda g�ncelleme yapan bir trigger yaz�n�z....
