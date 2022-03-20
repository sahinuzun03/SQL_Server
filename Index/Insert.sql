--INSERT KOMUTU
-- Bir tabloya veri eklemek için kullanýlan SQL komutudur.
-- EÐER BELÝRTÝLEN KOLONLARA VERÝ EKLENECEKSE
-- INSERT INTO <tablo_adi> (kolon1,kolon2,kolon3,....) 
--VALUES (deger1,deger2,deger3,)

--EÐR TÜM KOLONLARA VERÝ EKLENECEKSE
--INSERT INTO <tablo_adi> VALUES <deger1,deger2,deger3,...>
--EKLENECEK DEÐERLER , ORJÝNAL TABLODAKÝ KOLON SIRASINA GÖRE EKLENMELÝDÝR.

--Kategorilere 'Baklagiller kategorinisi 'Protein bakýmýndan zengindiler açýklamasýyla birlikte ekleyelim'

SELECT * FROM Categories

INSERT INTO Categories (CategoryName,Description) 
VALUES ('Baklagiller','Protein bakýmýndan zengindiler')

--Kategoriler tablosuna herhangi bir açýklama ekleyiniz

--INSERT INTO Categories (Description) //CategoryName NULL geçilemeyeceði için giriþ yapmak zorundayýz.
--VALUES ('Bilge adam boost ')

SELECT * FROM Shippers
INSERT INTO Shippers (CompanyName,Phone)
VALUES ('MNG KARGO','444 1 664')

SELECT * FROM Suppliers
INSERT INTO Suppliers (CompanyName,Phone)
VALUES ('Levi''s','444 1 587')

SELECT * FROM Customers
INSERT INTO Customers (CompanyName) --Customerýd girmem gerektip Identity ' si yes olarak iþaretlenmemiþ!!!
VALUES ('Bilge Adam')


SELECT * FROM Products
INSERT INTO Products (ProductName,Discontinued)
VALUES ('Helva',1),('Armut',0),('Sucuk',1),('Ekmek',0),('Tavuk',1)
INSERT INTO Products (ProductName)
VALUES ('Helva'),('Armut'),('Sucuk'),('Ekmek'),('Tavuk')



SELECT * FROM Employees
INSERT INTO Employees (FirstName,LastName,Title,TitleOfCourtesy,BirthDate)
VALUES('Þahin','Uzun','Öðrenci','Kodlama Çalýþmak','02.10.1999')

SELECT * FROM Products
INSERT INTO Products (CategoryID,ProductName,UnitPrice)
VALUES (20,'Dana Kavurma',25.90) 
--Böyle bir ekleme iþlemi gerçekleþtiremem çünkü kategorilerde ID'si 20 olan bir kategori.Bu yüzden arka planda eþleþme yapamýyor program.