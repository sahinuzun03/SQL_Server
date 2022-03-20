--STR�NG FONKS�YONLARI
--SQL'de metinsel de�erlerle ilgili,bo�luk silme,karakter ekleme gibi i�lemler yap�alacaksa String fonksiyonlar� kullan�l�r.

SELECT 
5 + 4	AS 'Toplam',
13 - 4	AS 'FARK',
6 * 7	AS '�arp�m',
6 / 2	AS 'B�l�m',
9 % 4	AS 'Mod'

SELECT 'Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�' AS Mesaj --Result sekmesinde yazd�r�r
PRINT 'Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�' --Messages sekmesinde yazd�r�r

--ASCII Kod Kar��l���
SELECT ASCII('A') AS 'ASCII Kar��l���'

--ASCII kodun karakter kar��l���
SELECT CHAR(65) AS 'Karakter'

--Bir karakter veya kelimenin belli bir metin i�indeki yeri
SELECT CHARINDEX('e','Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�') AS 'Karakter Konumu'

SELECT CHARINDEX('oo','Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�') AS 'Karakter Konumu'

SELECT CHARINDEX('h','Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�') AS 'Karakter Konumu'

--Bir metnin i�erisinde belirli say�da karakteri aramak i�in
SELECT LEFT('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�',5) AS 'Soldan 5 karakter'

SELECT RIGHT('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�',8) AS 'Soldan 5 karakter'

--Bir metnin karakter say�s�n� ��renmek i�in
SELECT LEN('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�')

--Bir metnin t�m karakterlerini b�y�k harfe �evirmek i�in:

SELECT UPPER('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�') AS 'B�y�k Harf'

SELECT LOWER('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�') AS 'K���k Harf'

--Bir metnin solundaki bo�lukarl� temizlemek i�in:
SELECT '                                          Bilge Adam' AS Mesaj 
SELECT LTRIM('                                    Bilge Adam') AS 'Soldan Temizle'

--Bir metnin 2 taraf�ndaki bo�luklar�n� temizleme
SELECT '             Bilge Adam               '  AS Mesaj 
SELECT TRIM('        Bilge Adam               ') AS 'Bo�luk Temizle' --YADA �unu ypa


SELECT RTRIM(LTRIM('        Bilge Adam               ')) AS 'Bo�luk Temizle'


--Metinlerin i�erisindeki karakterleri de�i�tirmek i�in 

SELECT REPLACE('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program�', 'a','x') AS 'Metin de�i�tirildi'

--Bir metin i�erisinden alt metin olu�turmak i�in
SELECT SUBSTRING('Bilge Adam Akademi Boost Y�ld�z Yaz�l�mc� Yeti�tirme Program� 2021',12,7) AS 'Alt Metin' --metin,ba�lang�� indexi,ka�karakter alacak

--Bir metni ters �evirmek i�in :
SELECT REVERSE ('Bilge Adam Akademi') AS 'Ters Metin'

--Bir metnin i�erisine istenilen kadar bo�luk eklemek i�in
SELECT 'Bilge Adam Akademi Boost' +SPACE(15)+ 'Y�ld�z Yaz�l�mc� Yeti�tirme Program�' AS 'Bo�luklu Mesaj'

--Bir metni istedi�iniz kadar �o�altmak i�in
SELECT REPLICATE('Bilge Adam Akademi-',5) AS 'Metni �o�alt' 









