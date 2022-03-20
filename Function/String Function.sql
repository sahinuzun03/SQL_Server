--STRÝNG FONKSÝYONLARI
--SQL'de metinsel deðerlerle ilgili,boþluk silme,karakter ekleme gibi iþlemler yapýalacaksa String fonksiyonlarý kullanýlýr.

SELECT 
5 + 4	AS 'Toplam',
13 - 4	AS 'FARK',
6 * 7	AS 'Çarpým',
6 / 2	AS 'Bölüm',
9 % 4	AS 'Mod'

SELECT 'Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý' AS Mesaj --Result sekmesinde yazdýrýr
PRINT 'Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý' --Messages sekmesinde yazdýrýr

--ASCII Kod Karþýlýðý
SELECT ASCII('A') AS 'ASCII Karþýlýðý'

--ASCII kodun karakter karþýlýðý
SELECT CHAR(65) AS 'Karakter'

--Bir karakter veya kelimenin belli bir metin içindeki yeri
SELECT CHARINDEX('e','Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý') AS 'Karakter Konumu'

SELECT CHARINDEX('oo','Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý') AS 'Karakter Konumu'

SELECT CHARINDEX('h','Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý') AS 'Karakter Konumu'

--Bir metnin içerisinde belirli sayýda karakteri aramak için
SELECT LEFT('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý',5) AS 'Soldan 5 karakter'

SELECT RIGHT('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý',8) AS 'Soldan 5 karakter'

--Bir metnin karakter sayýsýný öðrenmek için
SELECT LEN('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý')

--Bir metnin tüm karakterlerini büyük harfe çevirmek için:

SELECT UPPER('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý') AS 'Büyük Harf'

SELECT LOWER('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý') AS 'Küçük Harf'

--Bir metnin solundaki boþlukarlý temizlemek için:
SELECT '                                          Bilge Adam' AS Mesaj 
SELECT LTRIM('                                    Bilge Adam') AS 'Soldan Temizle'

--Bir metnin 2 tarafýndaki boþluklarýný temizleme
SELECT '             Bilge Adam               '  AS Mesaj 
SELECT TRIM('        Bilge Adam               ') AS 'Boþluk Temizle' --YADA þunu ypa


SELECT RTRIM(LTRIM('        Bilge Adam               ')) AS 'Boþluk Temizle'


--Metinlerin içerisindeki karakterleri deðiþtirmek için 

SELECT REPLACE('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý', 'a','x') AS 'Metin deðiþtirildi'

--Bir metin içerisinden alt metin oluþturmak için
SELECT SUBSTRING('Bilge Adam Akademi Boost Yýldýz Yazýlýmcý Yetiþtirme Programý 2021',12,7) AS 'Alt Metin' --metin,baþlangýç indexi,kaçkarakter alacak

--Bir metni ters çevirmek için :
SELECT REVERSE ('Bilge Adam Akademi') AS 'Ters Metin'

--Bir metnin içerisine istenilen kadar boþluk eklemek için
SELECT 'Bilge Adam Akademi Boost' +SPACE(15)+ 'Yýldýz Yazýlýmcý Yetiþtirme Programý' AS 'Boþluklu Mesaj'

--Bir metni istediðiniz kadar çoðaltmak için
SELECT REPLICATE('Bilge Adam Akademi-',5) AS 'Metni Çoðalt' 









