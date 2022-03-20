--WHERE Komutu (Sorgularý Filtrelemek):
--SQL'de yazdýðýmýz sorgularý belirli koþullara göre filtrelemek istiyorsak,WHERE ifadesini kulllanmamýz gerekir.

--Kullanýmý 
--SELECT <KOLON_ADLARI> FROM <TABLO_ADÝ> WHERE <KOSUL>

SELECT * FROM Employees

--Employees tablosundan unvaný 'Mr.' olan çalýþanlarýn Adý , Soyadý ve Unvan bilgilerini listeleyiniz

SELECT 
TitleOfCourtesy AS Unvan
,FirstName AS Adý
,LastName AS Soyadý
FROM Employees
WHERE TitleOfCourtesy = 'Mr.'

--Employees tablosundan ID'si 5 ten buyuk olan çalýþanlarýn EmployeID,Adý,Soyadý bilgisi

SELECT 
 EmployeeID AS ÇalýþanKodu
,FirstName AS Adý
,LastName AS Soyadý
FROM Employees
WHERE EmployeeID > 5

--1690 yýlýnda doðan çalýþanlarýn adý,soyadý,doðum tarihi bilgilerini listeleyiniz
SELECT 
BirthDate AS [Doðum Tarihi]
,FirstName AS Adý
,LastName AS Soyadý
FROM Employees
WHERE DATEPART(YEAR,BirthDate) = 1960

SELECT 
BirthDate AS [Doðum Tarihi]
,FirstName AS Adý
,LastName AS Soyadý
FROM Employees
WHERE DATEPART(YEAR,BirthDate) > 1949 AND DATEPART(YEAR,BirthDate) < 1961

SELECT * FROM Employees

SELECT 
City
,TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Çalýþan Bilgisi'
,Title
,Country
,BirthDate
FROM Employees
WHERE Country = 'UK'

SELECT 
TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Çalýþan Bilgisi'
,Title
,Country
,BirthDate
FROM Employees
Where (TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.') AND (Country = 'UK')

SELECT 
ProductName
,UnitPrice
,UnitsInStock
FROM Products
WHERE UnitsInStock < 10


--1950 ile 1961 yýlýnda doðan çalýþanlarýn adý , soyadý ve doðum tarhi bilgilerini listeleyiniz

SELECT 
OrderId
,EmployeeID
,ShipAddress
,ShipCountry
,ShipCity
FROM Orders
WHERE ShipCountry = 'France'

SELECT 
(TitleOfCourtesy + ' ' + FirstName + ' ' + LastName ) AS 'Kiþi Bilgisi'
,Title AS Görevi
,Country AS Ülkesi
,BirthDate AS 'Doðum Tarihi'
,YEAR(GetDate()) - Year(BirthDate) AS Yas
FROM Employees
WHERE (Year(GETDATE()) - YEAR(BirthDate) > 60) OR TitleOfCourtesy = 'Mr.'

-- NULL VERÝLERÝ SORGULAMAK --

--SQL ' de bir alana veri girilmemiþse NULL olarak görürüz.Bu verileri WHERE koþulu ile filtrelemek istersek IS NULL cümleciðini kullanabiliriz.

SELECT 
Region
FROM Employees

--Region (Bölge) bilgisi BELÝRTÝLMEMÝÞ olan çalýþanlarýn , Unvan,Ad,Soyad,Bölge bilgilerini listeleyinizi

SELECT TitleOfCourtesy,FirstName,LastName,Region
FROM Employees
WHERE Region IS NULL 

SELECT TitleOfCourtesy,FirstName,LastName,Region
FROM Employees
WHERE Region IS NOT NULL
-- NULL deðer içermeyen verileri IS NOT NULL cümleciði ile sorgulayabiliriz.

--NOT veya NOT NULL deðerleri sorgularken = veya <> gibi operatörler kullanmayýz.Bunun yerine IS NULL veya IS NOT NULL ifadeleri kullanýlabilir.