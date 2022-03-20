--WHERE Komutu (Sorgular� Filtrelemek):
--SQL'de yazd���m�z sorgular� belirli ko�ullara g�re filtrelemek istiyorsak,WHERE ifadesini kulllanmam�z gerekir.

--Kullan�m� 
--SELECT <KOLON_ADLARI> FROM <TABLO_AD�> WHERE <KOSUL>

SELECT * FROM Employees

--Employees tablosundan unvan� 'Mr.' olan �al��anlar�n Ad� , Soyad� ve Unvan bilgilerini listeleyiniz

SELECT 
TitleOfCourtesy AS Unvan
,FirstName AS Ad�
,LastName AS Soyad�
FROM Employees
WHERE TitleOfCourtesy = 'Mr.'

--Employees tablosundan ID'si 5 ten buyuk olan �al��anlar�n EmployeID,Ad�,Soyad� bilgisi

SELECT 
 EmployeeID AS �al��anKodu
,FirstName AS Ad�
,LastName AS Soyad�
FROM Employees
WHERE EmployeeID > 5

--1690 y�l�nda do�an �al��anlar�n ad�,soyad�,do�um tarihi bilgilerini listeleyiniz
SELECT 
BirthDate AS [Do�um Tarihi]
,FirstName AS Ad�
,LastName AS Soyad�
FROM Employees
WHERE DATEPART(YEAR,BirthDate) = 1960

SELECT 
BirthDate AS [Do�um Tarihi]
,FirstName AS Ad�
,LastName AS Soyad�
FROM Employees
WHERE DATEPART(YEAR,BirthDate) > 1949 AND DATEPART(YEAR,BirthDate) < 1961

SELECT * FROM Employees

SELECT 
City
,TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS '�al��an Bilgisi'
,Title
,Country
,BirthDate
FROM Employees
WHERE Country = 'UK'

SELECT 
TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS '�al��an Bilgisi'
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


--1950 ile 1961 y�l�nda do�an �al��anlar�n ad� , soyad� ve do�um tarhi bilgilerini listeleyiniz

SELECT 
OrderId
,EmployeeID
,ShipAddress
,ShipCountry
,ShipCity
FROM Orders
WHERE ShipCountry = 'France'

SELECT 
(TitleOfCourtesy + ' ' + FirstName + ' ' + LastName ) AS 'Ki�i Bilgisi'
,Title AS G�revi
,Country AS �lkesi
,BirthDate AS 'Do�um Tarihi'
,YEAR(GetDate()) - Year(BirthDate) AS Yas
FROM Employees
WHERE (Year(GETDATE()) - YEAR(BirthDate) > 60) OR TitleOfCourtesy = 'Mr.'

-- NULL VER�LER� SORGULAMAK --

--SQL ' de bir alana veri girilmemi�se NULL olarak g�r�r�z.Bu verileri WHERE ko�ulu ile filtrelemek istersek IS NULL c�mleci�ini kullanabiliriz.

SELECT 
Region
FROM Employees

--Region (B�lge) bilgisi BEL�RT�LMEM�� olan �al��anlar�n , Unvan,Ad,Soyad,B�lge bilgilerini listeleyinizi

SELECT TitleOfCourtesy,FirstName,LastName,Region
FROM Employees
WHERE Region IS NULL 

SELECT TitleOfCourtesy,FirstName,LastName,Region
FROM Employees
WHERE Region IS NOT NULL
-- NULL de�er i�ermeyen verileri IS NOT NULL c�mleci�i ile sorgulayabiliriz.

--NOT veya NOT NULL de�erleri sorgularken = veya <> gibi operat�rler kullanmay�z.Bunun yerine IS NULL veya IS NOT NULL ifadeleri kullan�labilir.