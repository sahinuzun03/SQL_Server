-- SQL VER� T�PLER� :

--MET�NSEL VER� T�PLER�

--Unicode Deste�i Olanlar : 

	--nchar(): Bu veri tipi char veri tipine benzer.UNICODE karakter setini kullan�r.girilen her bir karaktere kar��l�k 2 byte'l�k yer tutar.En fazla 4000 karakter (8000 byte) veri saklayan tiptir.Her veride () i�erisinde tan�mlanan karakter say�s� kadar yer tutulur.
	
	--nvarchar: Bu veri tipi varchr veri tipine benzer.UNICODE karakter setini kullan�r.Girilen her bir karaktere kar��l�k nchar'da oldu�u gibi 2 byte'l�k yer tutar.En fazla 400 karakter veri al�r.Ancak,burada tan�mlanan karakter say�s� kadar de�il girilen karakter say�s� kadar yer tutulur. 

	--ntext,nvarchar(MAX): Maksimum say�da karakter depolayabilir.ntext gelecek versiyonlarda olmama ihtimali bulunuyor.Bu sebeple kullan�lmas� �nerilmez.ntext yerine nvarchar(MAX) kullan�labilir.


--Unicode Deste�i Olmayanlar : 

	--char: Bu veri tipinde her bir karakter 1 byte'l�k yer kaplar. Ve en fazla 8000 karakter tutar (8000 byte).Her veride tan�mlanan karakter say�s� kadar yer tutulur.

	--varchar: Bu veri tipinde her bir karakter 1 byte'l�k yer tutuar.Ve en fazla 8000 karakter tutar (8000 byte).Her veride tan�mlanan de�il,girilen karakter say�s� kadar yer tutar.

	--text,varchar(MAX):En fazla 2GB boyutu kadar karakter verisi alabilir. E�er MAX yerinden say�sal bir ifade yer al�yorsa , veri tipinin maksimum uzunlu�u o say� kadar olur.


--SAYISAL VER� T�PLER�

	-- bit : 0 ya da 1 de�er al�r.Durum bilgisi saklamakta kullan�l�r.
	-- tinyint : 0 ve 255 aras�nda de�er al�r // 1 byte 
	-- smallint : -2^15 ile 2^15 aras�nda de�er al�r // 2 byte
	-- int :  -2^31 ile 2^31-1 aras�nda de�er al�r // 4 byte
	-- bigint : -2^63 ile 2^63 aras�nda de�er al�r // 8 byte 
	
	-- money : -2^63 ile 2^63-1 aras�nda de�er al�r. 8 byte
	--Virg�lden sonra 4 basamak al�r

	-- smallmoney : -214,748.3648 ve 214,478.3647 aras�nda de�er al�r. 7 basama kadar 4 byte yer tutar
	--Virg�lden sonra 4 basamak tutar.
	
	-- decimal(18,0) : -10^38 ve +10^38-1
	--�RNEK : decimal(6,2) => 1234,56
	--�RNEK : decimal(6,4) => 12,3456
	--virg�lden sonra ka basama��n dikkate  al�naca��n� belirten veri tipidir.
	
	--1 'den 9 ' a kadar hassasiyet i�in : 5 byte
	-- 10'dan 19'a kadar hassasiyet i�in : 9 byte
	--20 den 28 'e kadar hassasiyet i�in : 13 byte 
	--29 ' dan 38 ' e kadar hassasiyet i�in : 17 byte
	
	-- float : Boyutu ve hasssasiyeti verilen parametreye g�re de�i�kenlik g�sterebilir.Ondal�k say�lar i�in kullan�l�r.toplam karakter say�s� 1-24 aras�nda ve ondal�k k�sm� 7 haneye kadar ise 4 byte yer kaplar.Varsay�lan 

	--date : Tarihleri y�l ay g�n  �eklinde saklar 3 byte
	--datetime : y�l ay g�n �eklinde tarih ve zaman verilerini tutar 8 byte. 1 Ocak 1753 ile 31 Aral�k 9999 aras� veriler i�in kullan�l�r.
	--datetime2 : 1 Ocak 0001 ile 31 Aral�k 9999 tarihleri aras�nda de�er tutar.Salise hassasiyeti daha y�ksektir. Salise hassasiyetine g�re 6 - 8 byte veri tutar.

	--�DEV ....:.::.::
--DDL(Data Definition Language)	
-- Nedir ? A��klama yaz�lmal�
-- Hangi komutlar kullan�l�r ve ne i�in kullan�l�r.
-- Her komut i�in birer tane �rnek sorgu yaz�n�z.
