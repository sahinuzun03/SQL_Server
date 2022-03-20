-- Aggregate Functions (Toplam Fonksiyonlar� veya Gruplamal� Fonksiyonlar)

-- COUNT :

-- Employes tablosundaki toplam kay�t say�s�n� bulmak i�in :

SELECT Count(*)
FROM Employees

SELECT Count(EmployeeID) AS ToplamKay�t
FROM Employees

SELECT Count(Region)
FROM Employees

--Count ile yapaca��m�z i�ler ya * ya da ID olanlar� null ge�ilemeyen de�erleri kullan�r�z.

SELECT COUNT(City) [�ehir Say�s�] /* Count ifadesi tekrarlanan de�erleride sayar*/
FROM Employees

SELECT City From Employees

SELECT COUNT(DISTINCT City) [Farkl� �ehir Say�s�] /* Ayn� veriden varsa gelmemesini sa�lad�k*/
FROM Employees

-- SUM : o kolonun i�ersindeki de�erlerin toplam�n� al�r

--Employes tablosundaki EmployeeID'lerin toplam�n� bulal�m

SELECT SUM(EmployeeID) AS IDToplam�
FROM Employees

--Employees tablosundaki �al��anlar�n y�l baz�nda ya�lar�n�n toplam�n� bulunuz

SELECT SUM(YEAR(GETDATE()) - YEAR (BirthDate)) AS Ya�lar�nToplam�
FROM Employees
/*NULL De�erleri toplama i�leminin i�erisine alm�yor.*/

--SELECT SUM(FirstName)
--FROM Employees => Hatal� kullan�m 

/* SUM operat�r� say�sal de�erler i�eren s�tunlarda i�lemlerini ger�ekle�tirir */

--AVG : 

--EmployeeID'lerin ortalamas�:

SELECT AVG(EmployeeID) AS EmployeeIDlerinOrtalamas�
FROM Employees

--�al��anlar�n y�l baz�nda ortalamas�n� bulal�m

SELECT AVG(YEAR(GETDATE()) - YEAR (BirthDate)) AS Ya�lar�nOrtalamas�
FROM Employees /* NULL olmayan de�erlerde i�lemleri ger�ekle�tirir */

--MIN() ve MAX()
--En k���k employee ID ' yi bulal�m
SELECT MIN(EmployeeID) AS ENKUCUK
FROM Employees
--En B�Y�K employee ID ' yi bulal�m
SELECT MAX(EmployeeID) AS ENBUYUK
FROM Employees

--�al��analr�n aras�nda y�l baz�nda ya�alr� en k��� ve en b�y�k olanlar�n ya�lar�n� bulal�m
SELECT MAX(YEAR(GETDATE()) - YEAR (BirthDate)) AS EnB�y�kYa�
FROM Employees

SELECT MIN(YEAR(GETDATE()) - YEAR (BirthDate)) AS EnK���kYa�
FROM Employees

--�al��anlar�n aras�nda alfabetik olarak en �nde ve en sonda olan �al��anlar�n isimlerini getiriniz

SELECT MIN(FirstName) AS �LKAD --Alfabatik olarak en �nde olan isim
FROM Employees

SELECT MAX(FirstName) AS SONAD --Alfabatik olarak en sonda olan isim
FROM Employees

--MIN() VE MAX() fonksiyonlar� metinsel de�erler i�eren kolonlarda da �al���r.Alfabatik olarak en �nde veya en sonda olan de�erleri bulabiliriz.


