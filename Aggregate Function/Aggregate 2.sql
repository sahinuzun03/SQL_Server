use AdventureWorks2019

SELECT *
FROM HumanResources.vEmployee

	   ,MAX(BusinessEntityID) AS [MaxID]
SELECT JobTitle
       ,MIN(LastName) AS [M�nLastName] --Alfabeye g�re s�ralar
	   ,COUNT (EmailPromotion) as [CountPerson] , SUM(EmailPromotion) AS Toplam  
FROM HumanResources.vEmployee
--WHERE LastName LIKE 'B%' /* B ile ba�lay�p sonras�nda ne olursa olsun */
WHERE PhoneNumberType = 'Work'
GROUP BY JobTitle
HAVING COUNT (EmailPromotion) >  10
Order By CountPerson DESC


--WHERE JobTitle = 'Design Engineer' /* ya da LIKE 'Design Engineer*/
--HAVING Metodu where ile ayn� fakat group by da k�s�tlama yapt�ktan sonra ki ��kan tabloda kullanabiliyoruz.Orada da ismini de�i�tirmi� oldu�umuz isimleri de�il foksiyon i�in ayn� ismi kullanmak zorunday�z.
--E�er ilk tablodan sorgulama yapmak istersem gidip where'in i�ine yaz�yorum.


CREATE VIEW �al��anListesi
AS
SELECT TOP 5 StateProvinceName --En �st k�s�mdan s�ralama yapt���m�z i�in ORDER BY diyip i�eride tekrardan s�ralama i�lemi ger�ekle�tirebiliyoruz.
		,City
		,COUNT(PhoneNumber) AS Ki�iSay�s�
FROM HumanResources.vEmployee
--WHERE StateProvinceName <> 'Utah' OR StateProvinceName <> 'Victoria'
WHERE StateProvinceName NOT IN  ('Utah' , 'Victoria' , 'Ontorio','Hamburg') --bunlar� getir dedim. IN ' in ba��na NOT getirirsemde parantez i�ine yazd�klar�m�n d���nda bulunan de�erler gelecektir.
GROUP BY StateProvinceName ,City 
HAVING COUNT(PhoneNumber) > 1 
--ORDER BY StateProvinceName ,City 
Go
--VIEW olu�tururken Her �eyin ismi olacak ve order by kullan�lamaz VIEW ' de

SELECT * FROM �al��anListesi
ORDER BY StateProvinceName ,City 

SELECT TOP 10 *
FROM HumanResources.vEmployee -- �stten ilk 10 kay�t� bana geitr demi� oldum. TOP 10 diyerek

SELECT TOP 10 *
FROM HumanResources.vEmployee


