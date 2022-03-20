CREATE PROCEDURE pasa.FilmTabloEkle
AS
BEGIN
CREATE TABLE Films
(	ID		INT				NOT NULL		IDENTITY(1,1)		PRIMARY KEY
    ,Ad		NVARCHAR(MAX)	NULL
	,Yýl	INT				NOT NULL
	,FilmDirector_ýd	INT	REFERENCES pasa.Directors(ID)
)
INSERT INTO pasa.Directors(ID,AD) VALUES (1,'Matt Reeves')
INSERT INTO pasa.Directors(ID,AD) VALUES (2,'Joe Pytka')
INSERT INTO pasa.Directors(ID,AD) VALUES (3,'Sam Raimi')
END
GO

CREATE PROCEDURE pasa.FilmEkle
(
	@Ad NVARCHAR(MAX)
	,@Yýl DATETIME
	,@FilmDirector_Id INT /* dýþarýdan kendisi gelmiyor mu FOREIGN Key olarak tanýtýldý!!*/
)
AS
BEGIN
INSERT INTO pasa.Films VALUES (@Ad,@Yýl,@FilmDirector_Id)
SELECT * FROM pasa.Films /*Ýçeride tabloda ne var ne yok Store Procedure yaptýk */
END

EXEC pasa.FilmTabloEkle
EXEC pasa.FilmEkle 'Batman',2005,1
EXEC pasa.FilmEkle 'Space Jam',1996,2
EXEC pasa.FilmEkle 'Spiderman',2021,3

