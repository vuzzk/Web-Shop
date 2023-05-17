create database webshop
use webshop

create table Proizvodi1(
proizvod_id int primary key identity(1,1),
ime nvarchar(100) not null,
sifra varchar(12) not null,
cena int,
kolicina int not null,
proizvodjac nvarchar(100) not null,
kategorija_id int,
)

Create table Opis1(
opis_id int primary key identity(1,1),
sifra_proiz int,
tekst nvarchar(500),
slika1 nvarchar(150),
slika2 nvarchar(150),
slika3 nvarchar(150),
slika4 nvarchar(150)
)

create table Kategorije(
kategorija_id int primary key identity(1,1),
ime nvarchar(100) not null,
opis nvarchar(500),
slika  nvarchar(150)
)

create table Korisnici(
korisnik_id int primary key identity(1,1),
ime nvarchar(100) not null,
prezime nvarchar(100) not null,
username nvarchar(30) not null unique,
lozinka nvarchar(255) not null,
email nvarchar(255) not null unique,
drzava nvarchar(100) not null,
grad nvarchar(255) not null,
postanski_br int not null,
adresa nvarchar(255) not null,
uloga_korisnika_id int not null,
)

create table UlogeKorisnika(
uloga_korisnika_id int primary key identity(1,1),
naziv varchar(100) not null unique
)

create table Porudzbine(
porudzbina_id int primary key identity(1,1),
korisnik_id int not null,
ukupan_iznos int not null,
datum_vreme date default getdate() not null,
porudzbina_uspesna varchar(2)
)

create table StavkePorudzbina(
stavka_porudzbine_id int primary key identity(1,1),
porudzbina_id int not null,
proizvod_id int not null,
kolicina int
)

ALTER table Proizvodi
add constraint FK_opis_id
FOREIGN KEY (opis_id)
REFERENCES Opisi(opis_id);

ALTER table Proizvodi
add constraint FK_kategorija_id
FOREIGN KEY (kategorija_id)
REFERENCES Kategorije(kategorija_id);

ALTER table Korisnici
add constraint FK_uloga_korisnika_id
FOREIGN KEY (uloga_korisnika_id)
REFERENCES UlogeKorisnika(uloga_korisnika_id);

ALTER table Porudzbine
add constraint FK_korisnik_id
FOREIGN KEY (korisnik_id)
REFERENCES Korisnici(korisnik_id);

ALTER table StavkePorudzbina
add constraint FK_proizvod_id
FOREIGN KEY (proizvod_id)
REFERENCES Proizvodi(proizvod_id);

ALTER table StavkePorudzbina
add constraint FK_porudzbina_id
FOREIGN KEY (porudzbina_id)
REFERENCES Porudzbine(porudzbina_id);

/*** TABELA KORISNIK *****************************************************/
GO
Create PROC dbo.Korisnik_Email
@email nvarchar(50),
@loz nvarchar(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 email FROM Korisnici
	WHERE email = @email and lozinka=@loz)
	Begin
	RETURN 0
	end
	RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/**/
GO
Create PROC dbo.Korisnik_Email_Admin
@email nvarchar(50),
@loz nvarchar(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 email FROM Korisnici
	WHERE email = @email and lozinka=@loz and uloga_korisnika_id=2)
	Begin
		RETURN 0
	end
		RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/**/
GO
Create PROC Korisnik_Insert
@ime nvarchar(100),
@prezime nvarchar(100),
@username nvarchar(30),
@lozinka nvarchar(255),
@email nvarchar(255),
@drzava nvarchar(100),
@grad nvarchar(100),
@postanski_br int,
@adresa nvarchar(255),
@uloga_korisnika_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 email FROM Korisnici
	WHERE email = @email and lozinka=@lozinka)
		RETURN 1
	ELSE
		Insert Into Korisnici(ime,prezime,username,lozinka,email,drzava,grad,postanski_br,adresa,uloga_korisnika_id)
		Values(@ime,@prezime,@username,@lozinka,@email,@drzava,@grad,@postanski_br,@adresa,@uloga_korisnika_id)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create PROC Korisnik_Update
@ime nvarchar(100),
@prezime nvarchar(100),
@email nvarchar(50),
@drzava nvarchar(100),
@grad nvarchar(100),
@postanski_br int,
@adresa nvarchar(255),
@uloga_korisnika_id int
AS
SET LOCK_TIMEOUT 3000;

BEGIN TRY
	IF EXISTS (SELECT TOP 1 ime FROM Korisnici
	WHERE email = @email)

	BEGIN
	
	Update Korisnici Set ime=@ime, prezime=@prezime, drzava=@drzava, grad=@grad, postanski_br=@postanski_br, adresa=@adresa, uloga_korisnika_id=@uloga_korisnika_id where email = @email
		RETURN 0;
	END
	RETURN -1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create Proc Korisnik_Delete
@email nvarchar(50)
AS
Begin TRY
Delete from Korisnici where email = @email
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create PROC Korisnici_Select
As
BEGIN TRY
	Select * from Korisnici
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

/*** TABELA KORISNIK *****************************************************/

Create proc UlogeKorisnika_Insert
@naziv NVARCHAR(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 naziv FROM UlogeKorisnika
	WHERE naziv = @naziv)
		RETURN 1
	ELSE
		Insert Into UlogeKorisnika(naziv)
		Values(@naziv)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

/*** TABELA PROIZVODI *****************************************************/

GO
Create PROC dbo.Proizvodi_Postoji
@proizvod_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 ime FROM Proizvodi
	WHERE proizvod_id = @proizvod_id)
	Begin
	RETURN 0
	end
	RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/**/
GO
Create PROC Proizvodi_Insert
@ime nvarchar(100),
@sifra nvarchar(12),
@cena int,
@kolicina int,
@proizvodjac nvarchar(100),
@kategorija_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 ime FROM Proizvodi1
	WHERE ime = @ime and sifra = @sifra)
	Return 1
	else
	Insert Into Proizvodi1(ime, sifra, cena, kolicina, proizvodjac, kategorija_id)
	Values(@ime, @sifra, @cena, @kolicina, @proizvodjac, @kategorija_id)
		RETURN 0;
END TRY	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
Create PROC Proizvodi_Update
@proizvod_id int,
@ime nvarchar(100),
@sifra nvarchar(12),
@cena int,
@kolicina int,
@proizvodjac nvarchar(100),
@opis_id int,
@kategorija_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 ime FROM Proizvodi
	WHERE proizvod_id = @proizvod_id )
	BEGIN	
	UPDATE Proizvodi SET ime=@ime, sifra=@sifra, cena=@cena, kolicina=@kolicina, proizvodjac=@proizvodjac, opis_id=@opis_id, kategorija_id=@kategorija_id WHERE proizvod_id=@proizvod_id
		RETURN 0;
	END
		RETURN -1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
CREATE PROC Proizvodi_Delete
@proizvod_id int,
@ime nvarchar(100)
AS
BEGIN TRY
	DELETE FROM Proizvodi WHERE ime=@ime and proizvod_id=@proizvod_id
	RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
CREATE PROC Proizvodi_Svi
AS
BEGIN TRY
	SELECT * FROM Proizvodi1
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/*IMA JOS DA SE DODA*/


/*** TABELA KATEGORIJE *****************************************************/

GO
Create PROC dbo.Kategorije_Ime
@ime nvarchar(100)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 ime FROM Kategorije
	WHERE ime = @ime)
	BEGIN
		RETURN 0
	END
	RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/**/
GO
CREATE PROC Kategorije_Insert
@ime nvarchar(100),
@opis nvarchar(500),
@slika  nvarchar(150)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 ime FROM Kategorije
	WHERE ime = @ime)
		RETURN 1
	ELSE
		INSERT INTO Kategorije(ime, opis, slika)
		VALUES(@ime, @opis, @slika)
		RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create PROC Kategorije_Update
@kategorija_id int,
@ime nvarchar(100),
@opis nvarchar(500),
@slika  nvarchar(150)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 ime FROM Kategorije
	WHERE kategorija_id = @kategorija_id)
	BEGIN
		UPDATE Kategorije SET ime = @ime, opis = @opis, slika = @slika WHERE kategorija_id = @kategorija_id
		RETURN 0;
	END
	RETURN -1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
CREATE PROC Kategorije_Delete
@kategorija_id int,
@ime nvarchar(100)
AS
BEGIN TRY
DELETE FROM Kategorije WHERE ime = @ime and kategorija_id = @kategorija_id
RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
CREATE PROC Kategorija_Select
AS
BEGIN TRY
	SELECT * FROM Kategorije
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO

/*** TABELA OPISI **********************************************************/

GO
Create PROC dbo.Opisi_Postoji
@opis_id int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 opis_id FROM Opisi
	WHERE opis_id = @opis_id)
	BEGIN
		RETURN 0
	END
		RETURN 1
END TRY
BEGIN CATCH
	RETURN @@error;
END CATCH
GO
/**/
GO
Create PROC Opisi_Insert_1
@sifra_proizvoda nvarchar(12),
@tekst nvarchar(500),
@slika1 nvarchar(150),
@slika2 nvarchar(150),
@slika3 nvarchar(150),
@slika4 nvarchar(150)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 @sifra_proizvoda FROM Opis1
	WHERE sifra_proiz = @sifra_proizvoda)
	RETURN 1
	ELSE
	INSERT INTO Opis1(tekst,sifra_proiz,slika1,slika2,slika3,slika4)
	VALUES(@tekst,@sifra_proizvoda,@slika1,@slika2,@slika3,@slika4)
		RETURN 0;
END TRY
	
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create PROC Opisi_Update
@opis_id int,
@tekst nvarchar(500),
@slika1 nvarchar(150),
@slika2 nvarchar(150),
@slika3 nvarchar(150),
@slika4 nvarchar(150)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 opis_id FROM Opisi 
	WHERE opis_id = @opis_id)
	BEGIN	
		UPDATE Opisi SET tekst = @tekst, slika1 = @slika1, slika2 = @slika2, slika3 = @slika3, slika4 = @slika4 WHERE opis_id = @opis_id
		RETURN 0;
	END
	RETURN -1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
GO
Create Proc Opisi_Delete
@opis_id int
AS
BEGIN TRY
	DELETE FROM Opisi WHERE opis_id = @opis_id
	RETURN 0
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
CREATE PROC Opisi_Select
AS
BEGIN TRY
	SELECT * FROM Opisi
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO
/**/
Create proc Opisi_GlavnaSlika
@opis_id nvarchar(max)
AS
BEGIN TRY
	SELECT slika1 FROM Opisi WHERE opis_id = @opis_id
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
GO


/*** PROC EXEC **********************************************************/

exec dbo.UlogeKorisnika_Insert 'admin'
exec dbo.UlogeKorisnika_Insert 'prodavac'
exec dbo.UlogeKorisnika_Insert 'kupac'

exec dbo.Korisnik_Insert 'Vuk','Zdravkovic','vukz','12345','vukz@gmail.com','Srbija','Beograd',11000,'Visegradska 24',2

exec dbo.Kategorija_Select
exec dbo.Korisnici_Select
exec dbo.Proizvodi_Svi


