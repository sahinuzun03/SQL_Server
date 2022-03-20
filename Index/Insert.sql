--INSERT KOMUTU
-- Bir tabloya veri eklemek i�in kullan�lan SQL komutudur.
-- E�ER BEL�RT�LEN KOLONLARA VER� EKLENECEKSE
-- INSERT INTO <tablo_adi> (kolon1,kolon2,kolon3,....) 
--VALUES (deger1,deger2,deger3,)

--E�R T�M KOLONLARA VER� EKLENECEKSE
--INSERT INTO <tablo_adi> VALUES <deger1,deger2,deger3,...>
--EKLENECEK DE�ERLER , ORJ�NAL TABLODAK� KOLON SIRASINA G�RE EKLENMEL�D�R.

--Kategorilere 'Baklagiller kategorinisi 'Protein bak�m�ndan zengindiler a��klamas�yla birlikte ekleyelim'

SELECT * FROM Categories

INSERT INTO Categories (CategoryName,Description) 
VALUES ('Baklagiller','Protein bak�m�ndan zengindiler')

--Kategoriler tablosuna herhangi bir a��klama ekleyiniz

--INSERT INTO Categories (Description) //CategoryName NULL ge�ilemeyece�i i�in giri� yapmak zorunday�z.
--VALUES ('Bilge adam boost ')

SELECT * FROM Shippers
INSERT INTO Shippers (CompanyName,Phone)
VALUES ('MNG KARGO','444 1 664')

SELECT * FROM Suppliers
INSERT INTO Suppliers (CompanyName,Phone)
VALUES ('Levi''s','444 1 587')

SELECT * FROM Customers
INSERT INTO Customers (CompanyName) --Customer�d girmem gerektip Identity ' si yes olarak i�aretlenmemi�!!!
VALUES ('Bilge Adam')


SELECT * FROM Products
INSERT INTO Products (ProductName,Discontinued)
VALUES ('Helva',1),('Armut',0),('Sucuk',1),('Ekmek',0),('Tavuk',1)
INSERT INTO Products (ProductName)
VALUES ('Helva'),('Armut'),('Sucuk'),('Ekmek'),('Tavuk')



SELECT * FROM Employees
INSERT INTO Employees (FirstName,LastName,Title,TitleOfCourtesy,BirthDate)
VALUES('�ahin','Uzun','��renci','Kodlama �al��mak','02.10.1999')

SELECT * FROM Products
INSERT INTO Products (CategoryID,ProductName,UnitPrice)
VALUES (20,'Dana Kavurma',25.90) 
--B�yle bir ekleme i�lemi ger�ekle�tiremem ��nk� kategorilerde ID'si 20 olan bir kategori.Bu y�zden arka planda e�le�me yapam�yor program.