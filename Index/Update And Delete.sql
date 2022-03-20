-- UPDATE KOMUTU :

--Bir veri taban� tablosundan veri g�ncelleme i�lemi yapmak i�in update komutu kullan�l�r.

--KULLANIMI 
-- UPDATE <tablo_adi> SET <kolon_adi> = 'Deger' => Kolondaki b�t�n verileri g�nceller.

--2.Kullan�m� 
-- UPDATE <tablo_adi> SET <kolon_adi> = 'deger' WHERE <kolon_adi> = 'filte de�eri' �eklinde kullan�l�r. => �lgili kolondaki ilgili de�ere sahip h�creyi & h�creleri g�nceller

--NOT : Bir veri taban� tablosunda g�ncelleme ya da silme i�lemi yap�l�rken dkkatli olmak gerekir.Veri kayb�n� �nlemek i�in �al��t�r�lacak sorgu , ilgili tablonun bir kopyas� al�narak , �nce kopyalanm�� olan tablolarda denenir.Daha sonra sorgu e�er do�ru �al���yorsa as�l tabloda i�lem yap�l�r.

--Bir tabloyu i�indeki verilerle kopyalamak i�in yap�l�r

SELECT * INTO Calisanlar FROM Employees -- Ayn� veritaban�nda farkl� bir tablo olu�turup kopyalamak i�in.

SELECT * INTO LokantaDB.dbo.Calisanlar FROM Employees -- Farkl� veritaban�nda farkl� bir tablo olu�turup kopyalamak i�in.

--dbo = database object demektir database eleman� olu�turmak i�in kullanmama�z gerekmektedir.

SELECT * FROM LokantaDB.dbo.Calisanlar
SELECT * FROM Employees

-- �al��anlar isimli tablodaki t�m �al��anlar�n soyadlar�n� de�i�tirelim

UPDATE LokantaDB.dbo.Calisanlar 
SET LastName = 'Babac�k'

-- UPDATE komutu ile bir tablodaki de�erler g�ncellenebilir.Fakat , burada dikkat edilmesi gereken nokta , hangi kayd�n g�ncellenece�inin a��k�a belirtilmesidir!!!!
--E�er bt�n kay�tlar de�ilde , belli �artlara uygun kay�tlar g�ncellensin istiyorsak
--UPDATE <TABLO_AD�> SET <KOLON_AD�>  = 'DE�ER' WHERE <KOLON_AD�> = 'F�LTE DE�ER�'


UPDATE LokantaDB.dbo.Calisanlar
SET LastName = 'Annecik'
WHERE LokantaDB.dbo.Calisanlar.EmployeeID = 3

UPDATE LokantaDB.dbo.Calisanlar
SET LastName = 'AslanPar�as�'
WHERE LokantaDB.dbo.Calisanlar.LastName = 'Annecik'

--Unvan� mr olan �al��anlar�n �nvan�n� bay olarak g�ncelleyiniz

UPDATE LokantaDB.dbo.Calisanlar
SET TitleOfCourtesy = 'BAY'
WHERE  LokantaDB.dbo.Calisanlar.TitleOfCourtesy = 'Mr.'

--DELETE KOMUTU :
-- KULLANIMI : DELETE FROM <TABLO_AD�> WHERE <KOLON_AD�> = 'F�LTRE_DE�ER�'

--Calisanlar tablosundan ID'si 3 olan �al��an� silelim

DELETE FROM LokantaDB.dbo.Calisanlar WHERE EmployeeID = 3
SELECT * FROM LokantaDB.dbo.Calisanlar

DELETE FROM LokantaDB.dbo.Calisanlar WHERE TitleOfCourtesy = 'Mrs.' Or TitleOfCourtesy ='Ms.'
SELECT * FROM LokantaDB.dbo.Calisanlar

--Git LokantaDB Calisanlara oradan �nvanlar�n i�inde ara MS veya MRS olanlar� bul ve sil
DELETE FROM LokantaDB.dbo.Calisanlar WHERE TitleOfCourtesy IN('Ms.','Mrs.')

-- Calisanlar tablosundaki b�t�n verileri silelim

DELETE FROM LokantaDB.dbo.Calisanlar 

--NOT : DELETE FROM <TABLO_AD�> yaz�p execute edildi�inde , tablonun i�indeki t�m veriler silini.Bu y�zden , veri kayb�na sebep olmamak i�in dikakt edilmesi gerekir.Ancak , bu komut ile tablo , veri taban�ndan silinmez.

--Veri taban�ndan direk olarak tabloyu siler.��indeki verilerde veri taban�ndan silinir.DDL komutudur.
DROP TABLE LokantaDB.dbo.Calisanlar 