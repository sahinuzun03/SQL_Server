-- LIKE KOMUTU : 

--LIKE Komutu nedir:
--LIKE komutu ile birlikte hangi filtrelemeler yap�labilir.
-- Her biri i�in �rnek sorgu yaz�n�z

-- LIKE KOMUTU : 
-- SQL LIKE Komutu herhangi bir tabloda istenilen column i�erisinde belirtilen kriter do�rultusunda arama yapar.Yani LIKE Where i�ersinde filtreleme yaparken kullan�l�r.

--LIKE Operator� ile beraber 2 tane i�aret kullan�r�l�r 
/* 
1. % i�areti s�f�r bir veya birden �ok karakterler yazarken kullan�l�r�
2. _ karakteri ise tek bir karakter girece�imiz zaman kullan�l�r

LIKE KOMUTU KULLANIMI : 

SELECT <kolon_adi>
FROM <tablo_adi>
WHERE <kolon_adi> LIKE '�stenilen'

LIKE 'a%' -> a ile ba�layan her �eyi getirir.
LIKE '%a' -> a ile biten her �eyi getirir
LIKE '%or%' -> i�erisinde or ge�en her �eyi getirir

*/

-- Mesela �al��anlarda ad� A ile ba�layanlar
SELECT FirstName 
FROM Employees
WHERE FirstName LIKE 'A%' --Andrew ve Anne listelenecektir.

--Ad� a ile biten ki�iler listelenecektir.
SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%A' -- Laura listelenecektir

-- Ad�n'da AH i�erenler listelenecektir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE '%h%' --Michael listelenecektir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE '_a%' -- �simlerde 2. karakter olarak a i�eren isimler getirilir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE 'm__?' --M ile ba�layan ve en az 3 karakterden olu�an durumlarda ge�erlidir. 

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE '�%n' --� ile ba�lay�p n ile biten isimleri getirecek bende �ahin ekli oldu�u i�in onu getiriyor. 

SELECT FirstName
FROM Employees 
WHERE FirstName NOT LIKE '�%n' -- � ile ba�lamay�p n ile bitmeyen b�t�n isimlerin hepsini getirecektir.

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%�ahin'--Kolonda isim var m� yok mu onun kontrol�n� yapmam�z� sa�lar 

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%Hasan' --Hasan olmad��� i�in bo� bir ��kt� verecektir bize

SELECT FirstName
FROM Employees
WHERE FirstName NOT LIKE '%Hasan' --S�tunlarda Hasan olmayan b�t�n isimleri getir dedi�im i�in hepsini getirecektir.

--A�a��da bulunan �rnekte telefonu 206 ile  ba�layanlar veya �nvan� Ms. olanlar listelenecektir.
SELECT FirstName AS AD , LastName AS Soyad , HomePhone AS Telefon , TitleOfCourtesy AS Unvan
FROM Employees
WHERE HomePhone LIKE '(206)%' OR TitleOfCourtesy LIKE 'Ms.'
ORDER BY FirstName


--�al��anlar tablosundan ad� michael olanlar� listeleyelim 

SELECT FirstName , LastName
FROM Employees
WHERE FirstName = 'Michael'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'Michael'


--�al��anlar i�erisinde ad� A ile ba�layanlar� 
SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'A%'

--�al��anlar i�ersinde ad� N ile bitenleri

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%n'

--�al��anlar i�erisinde ad�n i�erisinde E harfi ge�sin

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%e%'

--�al��anlar�n i�erisinde ad�n�n ilk harfi a ile l olanlar� lste

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'L%'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '[AL]%'

--�al��anlar�n i�erisinde ad�n�n i�erisinde r veya t olan �al��anlar� listeleyelim

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%R%' OR FirstName LIKE '%T%'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%[RT]%'


--�al��anlar�n i�erisinde ad�n�n ilk harfi alfabeti olarak J ile R olanlar� listeleyelim

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '[J-R]%' --Alfabetik olarak s�ral� verecek J den R ye kadar aradaki harfleri verir.
ORDER BY FirstName ASC

--�al��anlar�n i�erisinde ad� �u �ekilde olanlar� listeleyiniz tAnEr , tAmEr , yAsEmin gibi A ile E karakterleri aras�nda 1 karakter bulunan

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%A_E%'--��erisinde A ile E aras�nda 1 tane karakter olsun diyorsak.
ORDER BY FirstName ASC

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%A__E%'--��erisinde A ile E aras�nda 2 tane karakter olsun diyorsak.
ORDER BY FirstName ASC

-- _ ' 1 karakteri ifade eder ve karakter ne olursa olsun demektir.
-- % ne olursa olsunu ifade eder.

--�al��anlar�n i�ersinde ad� J ile ba�lay�p N ile biten isimleri


SELECT FirstName , LastName
FROM Employees 
WHERE LastName LIKE 'J%N'

--�al��anlar�n i�ersinde ad�n�n ilk harfi M Olmaanlar�

-- 1.YOL --
SELECT FirstName , LastName
FROM Employees 
WHERE FirstName NOT LIKE 'M%'

--2.YOL --
SELECT FirstName , LastName
FROM Employees 
WHERE FirstName LIKE '[^M]%'

/*^ Bunun d���ndakiler anlam�na gelmektedir.*/

--�al��anlar�n i�erisinde ad�n�n ik harfi alfabetik olarak A ile I aral���nda olmayanlar� listeyelim


SELECT FirstName , LastName
FROM Employees
WHERE FirstName NOT LIKE '[A-I]%' -- VEYA  LIKE '[^A-I]%' �eklinde de yazabiliriz 
								  -- Ad�n�n ilk harfi A ile I aras�nda olmayanlar� listele
ORDER BY FirstName ASC

--�al��anlar�n i�erisinde ad�n�n ikinci harfi A veya T olmayanlar� listeleyelim.
--1.YOL
SELECT FirstName , LastName
FROM Employees
WHERE FirstName NOT LIKE '_A%' AND FirstName NOT LIKE '_T%'-- VEYA  LIKE '[^A-I]%' �eklinde de yazabiliriz 
								  -- Ad�n�n ilk harfi A ile I aras�nda olmayanlar� listele
ORDER BY FirstName ASC

--2.YOL
SELECT FirstName , LastName
FROM Employees
WHERE FirstName NOT LIKE '_[AT]%'
ORDER BY FirstName ASC

--3.Yol
SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '_[^AT]%'
ORDER BY FirstName ASC


--�al��anlar�n i�erisine ad�n�n ilk iki harfi LA , LN AA veya AN olanlar� listeleyiniz

SELECT FirstName
FROM Employees
WHERE (FirstName LIKE 'AN%' OR FirstName LIKE 'LA%') OR (FirstName LIKE 'LN%' OR FirstName LIKE 'AA%')


-- �al��anlar�n i�erisinde ad�n�n i�inde _ (alt �izgi) ge�enleri listeleyiniz
--NOT : �ncelikle Employees tablosuna ad�n�n i�inde _ ge�en veri ekleyiniz

INSERT INTO Employees (FirstName,LastName) VALUES ('_�ahin','Uzun')

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%[_]%' /* Arada bir karakterin _ olaca��n� belirtiyoruz*/

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%\_%' ESCAPE '\' /* Burada bizim \ i�aretini ka��� karakteri olarak tan�mlad���m�z� ifade ediyoruz.*/



-- M��teriler tablosunda CustomerID sinin 2. harfi A ve 4. Harfinin T olanlar�n ilk %10 luk k�sm�n� CustomerID'ye g�re azalan s�rada s�ralay�n�z 

SELECT TOP 10 Percent *
FROM Customers
WHERE CustomerID LIKE '_A_T%' 
ORDER BY CustomerID DESC