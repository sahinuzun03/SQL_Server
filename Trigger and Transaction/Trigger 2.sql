--TRIGER:
--AFTER TRIGGER
--Instead of Trigger
--Categories tablosuna eklenen kategoriyi yazan bir triger oluþturun
CREATE TRIGGER Categori_Ekle ON Categories AFTER INSERT
AS
BEGIN
	DECLARE @kategoriAdý NVARCHAR(15)
	SELECT @kategoriAdý = CategoryName FROM inserted
	PRINT @kategoriAdý + 'Ýsimli kategori eklendi'
END

INSERT INTO Categories (CategoryName) VALUES ('Kýyafetler')

SELECT * FROM Categories


--Order Detail tablosunda bir sipariþteki bir ürün satýldýðýnda o ürünün stok miktarýnda satýlan miktar kadar azaltma yapan bir triger yazýnýz.

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

--Order details tablosundan bir kayýt silindiðinde Products tablosundaki UnýtInStock kolununda güncelleme yapan bir trigger yazýnýz....
