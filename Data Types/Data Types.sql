-- SQL VERİ TİPLERİ :

--METİNSEL VERİ TİPLERİ

--Unicode Desteği Olanlar : 

	--nchar(): Bu veri tipi char veri tipine benzer.UNICODE karakter setini kullanır.girilen her bir karaktere karşılık 2 byte'lık yer tutar.En fazla 4000 karakter (8000 byte) veri saklayan tiptir.Her veride () içerisinde tanımlanan karakter sayısı kadar yer tutulur.
	
	--nvarchar: Bu veri tipi varchr veri tipine benzer.UNICODE karakter setini kullanır.Girilen her bir karaktere karşılık nchar'da olduğu gibi 2 byte'lık yer tutar.En fazla 400 karakter veri alır.Ancak,burada tanımlanan karakter sayısı kadar değil girilen karakter sayısı kadar yer tutulur. 

	--ntext,nvarchar(MAX): Maksimum sayıda karakter depolayabilir.ntext gelecek versiyonlarda olmama ihtimali bulunuyor.Bu sebeple kullanılması önerilmez.ntext yerine nvarchar(MAX) kullanılabilir.


--Unicode Desteği Olmayanlar : 

	--char: Bu veri tipinde her bir karakter 1 byte'lık yer kaplar. Ve en fazla 8000 karakter tutar (8000 byte).Her veride tanımlanan karakter sayısı kadar yer tutulur.

	--varchar: Bu veri tipinde her bir karakter 1 byte'lık yer tutuar.Ve en fazla 8000 karakter tutar (8000 byte).Her veride tanımlanan değil,girilen karakter sayısı kadar yer tutar.

	--text,varchar(MAX):En fazla 2GB boyutu kadar karakter verisi alabilir. Eğer MAX yerinden sayısal bir ifade yer alıyorsa , veri tipinin maksimum uzunluğu o sayı kadar olur.


--SAYISAL VERİ TİPLERİ

	-- bit : 0 ya da 1 değer alır.Durum bilgisi saklamakta kullanılır.
	-- tinyint : 0 ve 255 arasında değer alır // 1 byte 
	-- smallint : -2^15 ile 2^15 arasında değer alır // 2 byte
	-- int :  -2^31 ile 2^31-1 arasında değer alır // 4 byte
	-- bigint : -2^63 ile 2^63 arasında değer alır // 8 byte 
	
	-- money : -2^63 ile 2^63-1 arasında değer alır. 8 byte
	--Virgülden sonra 4 basamak alır

	-- smallmoney : -214,748.3648 ve 214,478.3647 arasında değer alır. 7 basama kadar 4 byte yer tutar
	--Virgülden sonra 4 basamak tutar.
	
	-- decimal(18,0) : -10^38 ve +10^38-1
	--ÖRNEK : decimal(6,2) => 1234,56
	--ÖRNEK : decimal(6,4) => 12,3456
	--virgülden sonra ka basamağın dikkate  alınacağını belirten veri tipidir.
	
	--1 'den 9 ' a kadar hassasiyet için : 5 byte
	-- 10'dan 19'a kadar hassasiyet için : 9 byte
	--20 den 28 'e kadar hassasiyet için : 13 byte 
	--29 ' dan 38 ' e kadar hassasiyet için : 17 byte
	
	-- float : Boyutu ve hasssasiyeti verilen parametreye göre değişkenlik gösterebilir.Ondalık sayılar için kullanılır.toplam karakter sayısı 1-24 arasında ve ondalık kısmı 7 haneye kadar ise 4 byte yer kaplar.Varsayılan 

	--date : Tarihleri yıl ay gün  şeklinde saklar 3 byte
	--datetime : yıl ay gün şeklinde tarih ve zaman verilerini tutar 8 byte. 1 Ocak 1753 ile 31 Aralık 9999 arası veriler için kullanılır.
	--datetime2 : 1 Ocak 0001 ile 31 Aralık 9999 tarihleri arasında değer tutar.Salise hassasiyeti daha yüksektir. Salise hassasiyetine göre 6 - 8 byte veri tutar.

	--ÖDEV ....:.::.::
--DDL(Data Definition Language)	
-- Nedir ? Açıklama yazılmalı
-- Hangi komutlar kullanılır ve ne için kullanılır.
-- Her komut için birer tane örnek sorgu yazınız.
