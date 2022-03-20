-- UPDATE KOMUTU :

--Bir veri tabaný tablosundan veri güncelleme iþlemi yapmak için update komutu kullanýlýr.

--KULLANIMI 
-- UPDATE <tablo_adi> SET <kolon_adi> = 'Deger' => Kolondaki bütün verileri günceller.

--2.Kullanýmý 
-- UPDATE <tablo_adi> SET <kolon_adi> = 'deger' WHERE <kolon_adi> = 'filte deðeri' þeklinde kullanýlýr. => Ýlgili kolondaki ilgili deðere sahip hücreyi & hücreleri günceller

--NOT : Bir veri tabaný tablosunda güncelleme ya da silme iþlemi yapýlýrken dkkatli olmak gerekir.Veri kaybýný önlemek için çalýþtýrýlacak sorgu , ilgili tablonun bir kopyasý alýnarak , önce kopyalanmýþ olan tablolarda denenir.Daha sonra sorgu eðer doðru çalýþýyorsa asýl tabloda iþlem yapýlýr.

--Bir tabloyu içindeki verilerle kopyalamak için yapýlýr

SELECT * INTO Calisanlar FROM Employees -- Ayný veritabanýnda farklý bir tablo oluþturup kopyalamak için.

SELECT * INTO LokantaDB.dbo.Calisanlar FROM Employees -- Farklý veritabanýnda farklý bir tablo oluþturup kopyalamak için.

--dbo = database object demektir database elemaný oluþturmak için kullanmamaýz gerekmektedir.

SELECT * FROM LokantaDB.dbo.Calisanlar
SELECT * FROM Employees

-- Çalýþanlar isimli tablodaki tüm çalýþanlarýn soyadlarýný deðiþtirelim

UPDATE LokantaDB.dbo.Calisanlar 
SET LastName = 'Babacýk'

-- UPDATE komutu ile bir tablodaki deðerler güncellenebilir.Fakat , burada dikkat edilmesi gereken nokta , hangi kaydýn güncelleneceðinin açýkça belirtilmesidir!!!!
--Eðer btün kayýtlar deðilde , belli þartlara uygun kayýtlar güncellensin istiyorsak
--UPDATE <TABLO_ADÝ> SET <KOLON_ADÝ>  = 'DEÐER' WHERE <KOLON_ADÝ> = 'FÝLTE DEÐERÝ'


UPDATE LokantaDB.dbo.Calisanlar
SET LastName = 'Annecik'
WHERE LokantaDB.dbo.Calisanlar.EmployeeID = 3

UPDATE LokantaDB.dbo.Calisanlar
SET LastName = 'AslanParçasý'
WHERE LokantaDB.dbo.Calisanlar.LastName = 'Annecik'

--Unvaný mr olan çalýþanlarýn ünvanýný bay olarak güncelleyiniz

UPDATE LokantaDB.dbo.Calisanlar
SET TitleOfCourtesy = 'BAY'
WHERE  LokantaDB.dbo.Calisanlar.TitleOfCourtesy = 'Mr.'

--DELETE KOMUTU :
-- KULLANIMI : DELETE FROM <TABLO_ADÝ> WHERE <KOLON_ADÝ> = 'FÝLTRE_DEÐERÝ'

--Calisanlar tablosundan ID'si 3 olan çalýþaný silelim

DELETE FROM LokantaDB.dbo.Calisanlar WHERE EmployeeID = 3
SELECT * FROM LokantaDB.dbo.Calisanlar

DELETE FROM LokantaDB.dbo.Calisanlar WHERE TitleOfCourtesy = 'Mrs.' Or TitleOfCourtesy ='Ms.'
SELECT * FROM LokantaDB.dbo.Calisanlar

--Git LokantaDB Calisanlara oradan ünvanlarýn içinde ara MS veya MRS olanlarý bul ve sil
DELETE FROM LokantaDB.dbo.Calisanlar WHERE TitleOfCourtesy IN('Ms.','Mrs.')

-- Calisanlar tablosundaki bütün verileri silelim

DELETE FROM LokantaDB.dbo.Calisanlar 

--NOT : DELETE FROM <TABLO_ADÝ> yazýp execute edildiðinde , tablonun içindeki tüm veriler silini.Bu yüzden , veri kaybýna sebep olmamak için dikakt edilmesi gerekir.Ancak , bu komut ile tablo , veri tabanýndan silinmez.

--Veri tabanýndan direk olarak tabloyu siler.Ýçindeki verilerde veri tabanýndan silinir.DDL komutudur.
DROP TABLE LokantaDB.dbo.Calisanlar 