use AdventureWorks2019

SELECT *
FROM HumanResources.vEmployee

	   ,MAX(BusinessEntityID) AS [MaxID]
SELECT JobTitle
       ,MIN(LastName) AS [MýnLastName] --Alfabeye göre sýralar
	   ,COUNT (EmailPromotion) as [CountPerson] , SUM(EmailPromotion) AS Toplam  
FROM HumanResources.vEmployee
--WHERE LastName LIKE 'B%' /* B ile baþlayýp sonrasýnda ne olursa olsun */
WHERE PhoneNumberType = 'Work'
GROUP BY JobTitle
HAVING COUNT (EmailPromotion) >  10
Order By CountPerson DESC


--WHERE JobTitle = 'Design Engineer' /* ya da LIKE 'Design Engineer*/
--HAVING Metodu where ile ayný fakat group by da kýsýtlama yaptýktan sonra ki çýkan tabloda kullanabiliyoruz.Orada da ismini deðiþtirmiþ olduðumuz isimleri deðil foksiyon için ayný ismi kullanmak zorundayýz.
--Eðer ilk tablodan sorgulama yapmak istersem gidip where'in içine yazýyorum.


CREATE VIEW ÇalýþanListesi
AS
SELECT TOP 5 StateProvinceName --En üst kýsýmdan sýralama yaptýðýmýz için ORDER BY diyip içeride tekrardan sýralama iþlemi gerçekleþtirebiliyoruz.
		,City
		,COUNT(PhoneNumber) AS KiþiSayýsý
FROM HumanResources.vEmployee
--WHERE StateProvinceName <> 'Utah' OR StateProvinceName <> 'Victoria'
WHERE StateProvinceName NOT IN  ('Utah' , 'Victoria' , 'Ontorio','Hamburg') --bunlarý getir dedim. IN ' in baþýna NOT getirirsemde parantez içine yazdýklarýmýn dýþýnda bulunan deðerler gelecektir.
GROUP BY StateProvinceName ,City 
HAVING COUNT(PhoneNumber) > 1 
--ORDER BY StateProvinceName ,City 
Go
--VIEW oluþtururken Her þeyin ismi olacak ve order by kullanýlamaz VIEW ' de

SELECT * FROM ÇalýþanListesi
ORDER BY StateProvinceName ,City 

SELECT TOP 10 *
FROM HumanResources.vEmployee -- Üstten ilk 10 kayýtý bana geitr demiþ oldum. TOP 10 diyerek

SELECT TOP 10 *
FROM HumanResources.vEmployee


