--Tarih Fonksiyonlar�
--SQL �zerinde tarhilerle iglili i�lemler yapmak i�in sistem fonksiyonlar�ndan tan�ml� olan tarih fonksiyonlar� kullan�labilir.

--DATEPART()
--Y�l bilgisi almak i�in:

SELECT FirstName,LastName,DatePart(YEAR,BirthDate) AS 'Do�um Y�l�'
FROM Employees
ORDER BY  [Do�um Y�l�]


SELECT FirstName,LastName,DatePart(YY,BirthDate) AS 'Do�um Y�l�'
FROM Employees
ORDER BY  [Do�um Y�l�]

SELECT FirstName,LastName,DatePart(YYYY,BirthDate) AS 'Do�um Y�l�'
FROM Employees
ORDER BY  [Do�um Y�l�]

--Y�l�n ka��nc� g�n� oldu�u bilgisini almak i�in

SELECT FirstName,LastName,BirthDate,DATEPART(DAYOFYEAR,BirthDate) AS 'Ka��nc� G�n'
FROM Employees
ORDER BY [Ka��nc� G�n] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(DY,BirthDate) AS 'Ka��nc� G�n'
FROM Employees
ORDER BY [Ka��nc� G�n] DESC

--Y�l�n ka��nc� ay� oldu�u bilgisini almak i�in

SELECT FirstName,LastName,BirthDate,DATEPART(MONTH,BirthDate) AS 'Ka��nc� Ay'
FROM Employees
ORDER BY [Ka��nc� Ay] DESC


SELECT FirstName,LastName,BirthDate,DATEPART(M,BirthDate) AS 'Ka��nc� Ay'
FROM Employees
ORDER BY [Ka��nc� Ay] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(Mm,BirthDate) AS 'Ka��nc� Ay'
FROM Employees
ORDER BY [Ka��nc� Ay] DESC

--Y�l�n ka��nc� haftas� oldu�u bilgisini almak i�in.

SELECT FirstName,LastName,BirthDate,DATEPART(WEEK,BirthDate) AS 'Ka��nc� Hafta'
FROM Employees
ORDER BY [Ka��nc� Hafta] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(WK,BirthDate) AS 'Ka��nc� Hafta'
FROM Employees
ORDER BY [Ka��nc� Hafta] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(WW,BirthDate) AS 'Ka��nc� Hafta'
FROM Employees
ORDER BY [Ka��nc� Hafta] DESC

--Haftan�n ka��nc� g�n� oldu�u bilgisini almak i�in.
SELECT FirstName,LastName,BirthDate,DATEPART(WEEKDAY,BirthDate) AS 'Haftan�n Ka��nc� G�n�'
FROM Employees
ORDER BY [Haftan�n Ka��nc� G�n�] DESC


SELECT FirstName,LastName,BirthDate,DATEPART(DW,BirthDate) AS 'Haftan�n Ka��nc� G�n�'
FROM Employees
ORDER BY [Haftan�n Ka��nc� G�n�] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(DW,BirthDate) AS 'Haftan�n Ka��nc� G�n�'
FROM Employees
ORDER BY [Haftan�n Ka��nc� G�n�] DESC

--Bug�nhaftan�n ka��nc� g�n�

SELECT DATEPART(dw,GETDATE()) AS 'Bug�n Haftan�n Ka��nc� G�n�' 
/*Pazar 1 / Pazartesi 2 / Sal� 3 / �ar�amba 4 / Per�embe 5 / Cuma 6 / Cumartesi 7 */
--Haftan�n g�nleri yukar�daki gibi kabul edilmi�tir.

--DateTime veri i�eren kolonda SAAT bilgisini almak i�in:

SELECT FirstName,LastName,BirthDate,DATEPART(HOUR,BirthDate) AS 'SAAT'
FROM Employees
ORDER BY [SAAT] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(HH,BirthDate) AS 'SAAT'
FROM Employees
ORDER BY [SAAT] DESC


--DateTime veri i�eren kolonda DAK�KA bilgisini almak i�in:

SELECT FirstName,LastName,BirthDate,DATEPART(MINUTE,BirthDate) AS 'DAK�KA'
FROM Employees
ORDER BY [DAK�KA] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(MI,BirthDate) AS 'DAK�KA'
FROM Employees
ORDER BY [DAK�KA] DESC

--DateTime veri i�eren kolonda SAN�YE bilgisini almak i�in:

SELECT FirstName,LastName,BirthDate,DATEPART(SECOND,BirthDate) AS 'SAN�YE'
FROM Employees
ORDER BY [SAN�YE] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(SS,BirthDate) AS 'SAN�YE'
FROM Employees
ORDER BY [SAN�YE] DESC

--DateTime veri i�eren kolonda M�L�SAN�YE bilgisini almak i�in:

SELECT FirstName,LastName,BirthDate,DATEPART(MILLISECOND,BirthDate) AS 'M�L�SAN�YE'
FROM Employees
ORDER BY [M�L�SAN�YE] DESC
SELECT FirstName,LastName,BirthDate,DATEPART(MS,BirthDate) AS 'M�L�SAN�YE'
FROM Employees
ORDER BY [M�L�SAN�YE] DESC




--Sistemin �uanki tarih ve saat bilgisi i�erisinden ayr� kolonlarda yazd�rmak �zere saat , dakika , saniye ve mili saniye bilgilerini al�n�z

SELECT DATEPART(HH,GETDATE()) AS Saat 
	  ,DATEPART(MI,GETDATE()) AS Dakika 
	  ,DATEPART(SS,GETDATE()) AS Saniye 
	  ,DATEPART(Ms,GETDATE()) AS MiliSaniye

--�al��anlar tablosundan ad� ve soyad�n� bilgisini alal�m.Y�l baz�nda ya�bilgisini ve g�n baz�ndan prim say�s�n� hesaplay�p yazd�ral�m

SELECT FirstName + ' ' + LastName AS 'Personel' 
	  ,DATEDIFF(YEAR,BirthDate,GETDATE()) AS Ya�
	  ,DATEDIFF(DAY,HireDate,GETDATE()) AS 'Prim G�n�'
FROM Employees

--DATEDIFF(�STEN�LEN,Ba�lang��Tarihi,Biti�Tarihi) 2 tarih aras�nda bulunan istenilen de�eri bize olu�turur.
--�STEN�LEN = G�n ise g�n ,ay ise ay , y�l ise y�l bilgisi d�nd�r�r



SELECT DATEDIFF(DAY,'1999.10.02',GETDATE()) AS '�ekilen �ile' /* Ya�an�lan g�n */

--�al��anlar�n ad� ile SAAT baz�ndan ka� saattir ya�ad�klar�n� hesaplayal�m

SELECT FirstName,DATEDIFF(HOUR,BirthDate,GETDATE()) as 'Ka� Saat Oldu'
FROM Employees
ORDER BY 2 DESC

