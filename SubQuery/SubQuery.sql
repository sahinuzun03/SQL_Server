use AdventureWorks2019
SELECT *
FROM HumanResources.vEmployee

SELECT Person.FirstName , Person.LastName
	   ,(SELECT TOP 1 PhoneNumber FROM Person.PersonPhone
		 WHERE BusinessEntityID = Person.BusinessEntityID ) AS TelNo
	   ,(SELECT COUNT(*) FROM Person.PersonPhone WHERE BusinessEntityID = Person.BusinessEntityID) AS TelSayýsý
	   ,(SELECT COUNT(*) FROM Person.Address 
	   INNER JOIN Person.BusinessEntityAddress BEA ON Address.AddressID = BEA.AddressID
	   WHERE BEA.BusinessEntityID = Person.BusinessEntityID
	   ) AS AdressSayýsý
	   ,Employee.*
FROM HumanResources.Employee Employee
INNER JOIN Person.Person Person ON Employee.BusinessEntityID = Person.BusinessEntityID
WHERE Person.BusinessEntityID IN 
(SELECT BusinessEntityID FROM Person.BusinessEntityAddress
 WHERE AddressID IN(
SELECT AddressID FROM Person.Address
 WHERE StateProvinceID IN (
	SELECT StateProvinceID FROM Person.StateProvince State
    WHERE Name = 'Washington'))
)


--LEFT OUTER JOIN Person.PersonPhone Phone ON Person.BusinessEntityID = Phone.BusinessEntityID




SELECT TOP 1 *
FROM Person.PersonPhone
WHERE BusinessEntityID = 1 
--BusinessEntityID'si 1 olan kiþinin 10 tane telefonuda olsa TOP 1 dediðimiz için artýk onun sadece ilk sýradaki numarasý gelecektir.

--SubQuery'de bu 2 sorgu birleþtirilir.



