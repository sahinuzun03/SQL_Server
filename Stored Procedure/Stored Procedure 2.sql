CREATE PROCEDURE pasa.FilmTabloEkle
AS
BEGIN
CREATE TABLE Films
(	ID		INT				NOT NULL		IDENTITY(1,1)		PRIMARY KEY
    ,Ad		NVARCHAR(MAX)	NULL
	,Y�l	INT				NOT NULL
	,FilmDirector_�d	INT	REFERENCES pasa.Directors(ID)
)
INSERT INTO pasa.Directors(ID,AD) VALUES (1,'Matt Reeves')
INSERT INTO pasa.Directors(ID,AD) VALUES (2,'Joe Pytka')
INSERT INTO pasa.Directors(ID,AD) VALUES (3,'Sam Raimi')
END
GO

CREATE PROCEDURE pasa.FilmEkle
(
	@Ad NVARCHAR(MAX)
	,@Y�l DATETIME
	,@FilmDirector_Id INT /* d��ar�dan kendisi gelmiyor mu FOREIGN Key olarak tan�t�ld�!!*/
)
AS
BEGIN
INSERT INTO pasa.Films VALUES (@Ad,@Y�l,@FilmDirector_Id)
SELECT * FROM pasa.Films /*��eride tabloda ne var ne yok Store Procedure yapt�k */
END

EXEC pasa.FilmTabloEkle
EXEC pasa.FilmEkle 'Batman',2005,1
EXEC pasa.FilmEkle 'Space Jam',1996,2
EXEC pasa.FilmEkle 'Spiderman',2021,3

