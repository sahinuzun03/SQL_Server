--Tarih Fonksiyonlarý
--SQL üzerinde tarhilerle iglili iþlemler yapmak için sistem fonksiyonlarýndan tanýmlý olan tarih fonksiyonlarý kullanýlabilir.

--DATEPART()
--Yýl bilgisi almak için:

SELECT FirstName,LastName,DatePart(YEAR,BirthDate) AS 'Doðum Yýlý'
FROM Employees
ORDER BY  [Doðum Yýlý]


SELECT FirstName,LastName,DatePart(YY,BirthDate) AS 'Doðum Yýlý'
FROM Employees
ORDER BY  [Doðum Yýlý]

SELECT FirstName,LastName,DatePart(YYYY,BirthDate) AS 'Doðum Yýlý'
FROM Employees
ORDER BY  [Doðum Yýlý]

--Yýlýn kaçýncý günü olduðu bilgisini almak için

SELECT FirstName,LastName,BirthDate,DATEPART(DAYOFYEAR,BirthDate) AS 'Kaçýncý Gün'
FROM Employees
ORDER BY [Kaçýncý Gün] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(DY,BirthDate) AS 'Kaçýncý Gün'
FROM Employees
ORDER BY [Kaçýncý Gün] DESC

--Yýlýn kaçýncý ayý olduðu bilgisini almak için

SELECT FirstName,LastName,BirthDate,DATEPART(MONTH,BirthDate) AS 'Kaçýncý Ay'
FROM Employees
ORDER BY [Kaçýncý Ay] DESC


SELECT FirstName,LastName,BirthDate,DATEPART(M,BirthDate) AS 'Kaçýncý Ay'
FROM Employees
ORDER BY [Kaçýncý Ay] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(Mm,BirthDate) AS 'Kaçýncý Ay'
FROM Employees
ORDER BY [Kaçýncý Ay] DESC

--Yýlýn kaçýncý haftasý olduðu bilgisini almak için.

SELECT FirstName,LastName,BirthDate,DATEPART(WEEK,BirthDate) AS 'Kaçýncý Hafta'
FROM Employees
ORDER BY [Kaçýncý Hafta] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(WK,BirthDate) AS 'Kaçýncý Hafta'
FROM Employees
ORDER BY [Kaçýncý Hafta] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(WW,BirthDate) AS 'Kaçýncý Hafta'
FROM Employees
ORDER BY [Kaçýncý Hafta] DESC

--Haftanýn kaçýncý günü olduðu bilgisini almak için.
SELECT FirstName,LastName,BirthDate,DATEPART(WEEKDAY,BirthDate) AS 'Haftanýn Kaçýncý Günü'
FROM Employees
ORDER BY [Haftanýn Kaçýncý Günü] DESC


SELECT FirstName,LastName,BirthDate,DATEPART(DW,BirthDate) AS 'Haftanýn Kaçýncý Günü'
FROM Employees
ORDER BY [Haftanýn Kaçýncý Günü] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(DW,BirthDate) AS 'Haftanýn Kaçýncý Günü'
FROM Employees
ORDER BY [Haftanýn Kaçýncý Günü] DESC

--Bugünhaftanýn kaçýncý günü

SELECT DATEPART(dw,GETDATE()) AS 'Bugün Haftanýn Kaçýncý Günü' 
/*Pazar 1 / Pazartesi 2 / Salý 3 / Çarþamba 4 / Perþembe 5 / Cuma 6 / Cumartesi 7 */
--Haftanýn günleri yukarýdaki gibi kabul edilmiþtir.

--DateTime veri içeren kolonda SAAT bilgisini almak için:

SELECT FirstName,LastName,BirthDate,DATEPART(HOUR,BirthDate) AS 'SAAT'
FROM Employees
ORDER BY [SAAT] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(HH,BirthDate) AS 'SAAT'
FROM Employees
ORDER BY [SAAT] DESC


--DateTime veri içeren kolonda DAKÝKA bilgisini almak için:

SELECT FirstName,LastName,BirthDate,DATEPART(MINUTE,BirthDate) AS 'DAKÝKA'
FROM Employees
ORDER BY [DAKÝKA] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(MI,BirthDate) AS 'DAKÝKA'
FROM Employees
ORDER BY [DAKÝKA] DESC

--DateTime veri içeren kolonda SANÝYE bilgisini almak için:

SELECT FirstName,LastName,BirthDate,DATEPART(SECOND,BirthDate) AS 'SANÝYE'
FROM Employees
ORDER BY [SANÝYE] DESC

SELECT FirstName,LastName,BirthDate,DATEPART(SS,BirthDate) AS 'SANÝYE'
FROM Employees
ORDER BY [SANÝYE] DESC

--DateTime veri içeren kolonda MÝLÝSANÝYE bilgisini almak için:

SELECT FirstName,LastName,BirthDate,DATEPART(MILLISECOND,BirthDate) AS 'MÝLÝSANÝYE'
FROM Employees
ORDER BY [MÝLÝSANÝYE] DESC
SELECT FirstName,LastName,BirthDate,DATEPART(MS,BirthDate) AS 'MÝLÝSANÝYE'
FROM Employees
ORDER BY [MÝLÝSANÝYE] DESC




--Sistemin þuanki tarih ve saat bilgisi içerisinden ayrý kolonlarda yazdýrmak üzere saat , dakika , saniye ve mili saniye bilgilerini alýnýz

SELECT DATEPART(HH,GETDATE()) AS Saat 
	  ,DATEPART(MI,GETDATE()) AS Dakika 
	  ,DATEPART(SS,GETDATE()) AS Saniye 
	  ,DATEPART(Ms,GETDATE()) AS MiliSaniye

--Çalýþanlar tablosundan adý ve soyadýný bilgisini alalým.Yýl bazýnda yaþbilgisini ve gün bazýndan prim sayýsýný hesaplayýp yazdýralým

SELECT FirstName + ' ' + LastName AS 'Personel' 
	  ,DATEDIFF(YEAR,BirthDate,GETDATE()) AS Yaþ
	  ,DATEDIFF(DAY,HireDate,GETDATE()) AS 'Prim Günü'
FROM Employees

--DATEDIFF(ÝSTENÝLEN,BaþlangýçTarihi,BitiþTarihi) 2 tarih arasýnda bulunan istenilen deðeri bize oluþturur.
--ÝSTENÝLEN = Gün ise gün ,ay ise ay , yýl ise yýl bilgisi döndürür



SELECT DATEDIFF(DAY,'1999.10.02',GETDATE()) AS 'Çekilen Çile' /* Yaþanýlan gün */

--Çalýþanlarýn adý ile SAAT bazýndan kaç saattir yaþadýklarýný hesaplayalým

SELECT FirstName,DATEDIFF(HOUR,BirthDate,GETDATE()) as 'Kaç Saat Oldu'
FROM Employees
ORDER BY 2 DESC

