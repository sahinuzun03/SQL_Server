-- Aggregate Functions (Toplam Fonksiyonlarý veya Gruplamalý Fonksiyonlar)

-- COUNT :

-- Employes tablosundaki toplam kayýt sayýsýný bulmak için :

SELECT Count(*)
FROM Employees

SELECT Count(EmployeeID) AS ToplamKayýt
FROM Employees

SELECT Count(Region)
FROM Employees

--Count ile yapacaðýmýz iþler ya * ya da ID olanlarý null geçilemeyen deðerleri kullanýrýz.

SELECT COUNT(City) [Þehir Sayýsý] /* Count ifadesi tekrarlanan deðerleride sayar*/
FROM Employees

SELECT City From Employees

SELECT COUNT(DISTINCT City) [Farklý Þehir Sayýsý] /* Ayný veriden varsa gelmemesini saðladýk*/
FROM Employees

-- SUM : o kolonun içersindeki deðerlerin toplamýný alýr

--Employes tablosundaki EmployeeID'lerin toplamýný bulalým

SELECT SUM(EmployeeID) AS IDToplamý
FROM Employees

--Employees tablosundaki çalýþanlarýn yýl bazýnda yaþlarýnýn toplamýný bulunuz

SELECT SUM(YEAR(GETDATE()) - YEAR (BirthDate)) AS YaþlarýnToplamý
FROM Employees
/*NULL Deðerleri toplama iþleminin içerisine almýyor.*/

--SELECT SUM(FirstName)
--FROM Employees => Hatalý kullaným 

/* SUM operatörü sayýsal deðerler içeren sütunlarda iþlemlerini gerçekleþtirir */

--AVG : 

--EmployeeID'lerin ortalamasý:

SELECT AVG(EmployeeID) AS EmployeeIDlerinOrtalamasý
FROM Employees

--Çalýþanlarýn yýl bazýnda ortalamasýný bulalým

SELECT AVG(YEAR(GETDATE()) - YEAR (BirthDate)) AS YaþlarýnOrtalamasý
FROM Employees /* NULL olmayan deðerlerde iþlemleri gerçekleþtirir */

--MIN() ve MAX()
--En küçük employee ID ' yi bulalým
SELECT MIN(EmployeeID) AS ENKUCUK
FROM Employees
--En BÜYÜK employee ID ' yi bulalým
SELECT MAX(EmployeeID) AS ENBUYUK
FROM Employees

--Çalýþanalrýn arasýnda yýl bazýnda yaþalrý en küçü ve en büyük olanlarýn yaþlarýný bulalým
SELECT MAX(YEAR(GETDATE()) - YEAR (BirthDate)) AS EnBüyükYaþ
FROM Employees

SELECT MIN(YEAR(GETDATE()) - YEAR (BirthDate)) AS EnKüçükYaþ
FROM Employees

--Çalýþanlarýn arasýnda alfabetik olarak en önde ve en sonda olan çalýþanlarýn isimlerini getiriniz

SELECT MIN(FirstName) AS ÝLKAD --Alfabatik olarak en önde olan isim
FROM Employees

SELECT MAX(FirstName) AS SONAD --Alfabatik olarak en sonda olan isim
FROM Employees

--MIN() VE MAX() fonksiyonlarý metinsel deðerler içeren kolonlarda da çalýþýr.Alfabatik olarak en önde veya en sonda olan deðerleri bulabiliriz.


