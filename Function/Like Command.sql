-- LIKE KOMUTU : 

--LIKE Komutu nedir:
--LIKE komutu ile birlikte hangi filtrelemeler yapýlabilir.
-- Her biri için örnek sorgu yazýnýz

-- LIKE KOMUTU : 
-- SQL LIKE Komutu herhangi bir tabloda istenilen column içerisinde belirtilen kriter doðrultusunda arama yapar.Yani LIKE Where içersinde filtreleme yaparken kullanýlýr.

--LIKE Operatorü ile beraber 2 tane iþaret kullanýrýlýr 
/* 
1. % iþareti sýfýr bir veya birden çok karakterler yazarken kullanýlýrç
2. _ karakteri ise tek bir karakter gireceðimiz zaman kullanýlýr

LIKE KOMUTU KULLANIMI : 

SELECT <kolon_adi>
FROM <tablo_adi>
WHERE <kolon_adi> LIKE 'Ýstenilen'

LIKE 'a%' -> a ile baþlayan her þeyi getirir.
LIKE '%a' -> a ile biten her þeyi getirir
LIKE '%or%' -> içerisinde or geçen her þeyi getirir

*/

-- Mesela çalýþanlarda adý A ile baþlayanlar
SELECT FirstName 
FROM Employees
WHERE FirstName LIKE 'A%' --Andrew ve Anne listelenecektir.

--Adý a ile biten kiþiler listelenecektir.
SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%A' -- Laura listelenecektir

-- Adýn'da AH içerenler listelenecektir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE '%h%' --Michael listelenecektir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE '_a%' -- Ýsimlerde 2. karakter olarak a içeren isimler getirilir.

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE 'm__?' --M ile baþlayan ve en az 3 karakterden oluþan durumlarda geçerlidir. 

SELECT FirstName
FROM Employees 
WHERE FirstName LIKE 'þ%n' --þ ile baþlayýp n ile biten isimleri getirecek bende Þahin ekli olduðu için onu getiriyor. 

SELECT FirstName
FROM Employees 
WHERE FirstName NOT LIKE 'þ%n' -- Þ ile baþlamayýp n ile bitmeyen bütün isimlerin hepsini getirecektir.

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%Þahin'--Kolonda isim var mý yok mu onun kontrolünü yapmamýzý saðlar 

SELECT FirstName
FROM Employees
WHERE FirstName LIKE '%Hasan' --Hasan olmadýðý için boþ bir çýktý verecektir bize

SELECT FirstName
FROM Employees
WHERE FirstName NOT LIKE '%Hasan' --Sütunlarda Hasan olmayan bütün isimleri getir dediðim için hepsini getirecektir.

--Aþaðýda bulunan örnekte telefonu 206 ile  baþlayanlar veya ünvaný Ms. olanlar listelenecektir.
SELECT FirstName AS AD , LastName AS Soyad , HomePhone AS Telefon , TitleOfCourtesy AS Unvan
FROM Employees
WHERE HomePhone LIKE '(206)%' OR TitleOfCourtesy LIKE 'Ms.'
ORDER BY FirstName


--Çalýþanlar tablosundan adý michael olanlarý listeleyelim 

SELECT FirstName , LastName
FROM Employees
WHERE FirstName = 'Michael'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'Michael'


--Çalýþanlar içerisinde adý A ile baþlayanlarý 
SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'A%'

--Çalýþanlar içersinde adý N ile bitenleri

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%n'

--Çalýþanlar içerisinde adýn içerisinde E harfi geçsin

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%e%'

--Çalýþanlarýn içerisinde adýnýn ilk harfi a ile l olanlarý lste

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'L%'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '[AL]%'

--Çalýþanlarýn içerisinde adýnýn içerisinde r veya t olan çalýþanlarý listeleyelim

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%R%' OR FirstName LIKE '%T%'

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%[RT]%'


--Çalýþanlarýn içerisinde adýnýn ilk harfi alfabeti olarak J ile R olanlarý listeleyelim

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '[J-R]%' --Alfabetik olarak sýralý verecek J den R ye kadar aradaki harfleri verir.
ORDER BY FirstName ASC

--Çalýþanlarýn içerisinde adý þu þekilde olanlarý listeleyiniz tAnEr , tAmEr , yAsEmin gibi A ile E karakterleri arasýnda 1 karakter bulunan

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%A_E%'--Ýçerisinde A ile E arasýnda 1 tane karakter olsun diyorsak.
ORDER BY FirstName ASC

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%A__E%'--Ýçerisinde A ile E arasýnda 2 tane karakter olsun diyorsak.
ORDER BY FirstName ASC

-- _ ' 1 karakteri ifade eder ve karakter ne olursa olsun demektir.
-- % ne olursa olsunu ifade eder.

--Çalýþanlarýn içersinde adý J ile baþlayýp N ile biten isimleri


SELECT FirstName , LastName
FROM Employees 
WHERE LastName LIKE 'J%N'

--Çalýþanlarýn içersinde adýnýn ilk harfi M Olmaanlarý

-- 1.YOL --
SELECT FirstName , LastName
FROM Employees 
WHERE FirstName NOT LIKE 'M%'

--2.YOL --
SELECT FirstName , LastName
FROM Employees 
WHERE FirstName LIKE '[^M]%'

/*^ Bunun dýþýndakiler anlamýna gelmektedir.*/

--Çalýþanlarýn içerisinde adýnýn ik harfi alfabetik olarak A ile I aralýðýnda olmayanlarý listeyelim


SELECT FirstName , LastName
FROM Employees
WHERE FirstName NOT LIKE '[A-I]%' -- VEYA  LIKE '[^A-I]%' þeklinde de yazabiliriz 
								  -- Adýnýn ilk harfi A ile I arasýnda olmayanlarý listele
ORDER BY FirstName ASC

--Çalýþanlarýn içerisinde adýnýn ikinci harfi A veya T olmayanlarý listeleyelim.
--1.YOL
SELECT FirstName , LastName
FROM Employees
WHERE FirstName NOT LIKE '_A%' AND FirstName NOT LIKE '_T%'-- VEYA  LIKE '[^A-I]%' þeklinde de yazabiliriz 
								  -- Adýnýn ilk harfi A ile I arasýnda olmayanlarý listele
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


--Çalýþanlarýn içerisine adýnýn ilk iki harfi LA , LN AA veya AN olanlarý listeleyiniz

SELECT FirstName
FROM Employees
WHERE (FirstName LIKE 'AN%' OR FirstName LIKE 'LA%') OR (FirstName LIKE 'LN%' OR FirstName LIKE 'AA%')


-- Çalýþanlarýn içerisinde adýnýn içinde _ (alt çizgi) geçenleri listeleyiniz
--NOT : Öncelikle Employees tablosuna adýnýn içinde _ geçen veri ekleyiniz

INSERT INTO Employees (FirstName,LastName) VALUES ('_Þahin','Uzun')

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%[_]%' /* Arada bir karakterin _ olacaðýný belirtiyoruz*/

SELECT FirstName , LastName
FROM Employees
WHERE FirstName LIKE '%\_%' ESCAPE '\' /* Burada bizim \ iþaretini kaçýþ karakteri olarak tanýmladýðýmýzý ifade ediyoruz.*/



-- Müþteriler tablosunda CustomerID sinin 2. harfi A ve 4. Harfinin T olanlarýn ilk %10 luk kýsmýný CustomerID'ye göre azalan sýrada sýralayýnýz 

SELECT TOP 10 Percent *
FROM Customers
WHERE CustomerID LIKE '_A_T%' 
ORDER BY CustomerID DESC