
CREATE DATABASE Karavan_4223

USE Karavan_4223

CREATE TABLE dbo.KADMINISTRATOR
(
	id_admin numeric(18, 0) IDENTITY(1,1) NOT NULL,
	username [nvarchar](50) NULL,
	password [nvarchar](50) NULL,
	ime [nvarchar](50) NULL,
	telefon [nvarchar](50) NULL,
	CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED
	(
		id_admin ASC
	)
)

CREATE TABLE dbo.JAZIK
(
	id_jazik numeric(18, 0) IDENTITY(1,1) NOT NULL,
	jazik [nvarchar](50) NULL, 
	CONSTRAINT [PK_jazik] PRIMARY KEY CLUSTERED
	(
		id_jazik ASC
	)
)

CREATE TABLE dbo.KNOVOST
(
	id_novost numeric(18, 0) IDENTITY(1,1) NOT NULL,
	adm_id_admin numeric(18, 0) NULL,
	jazik_id_jazik numeric(18, 0) NULL,
	naslov [nvarchar](50) NULL,
	opis [nvarchar](1500) NULL,
	datum_od datetime NULL,
	datum_do datetime NULL,
	PRIMARY KEY(id_novost),
	FOREIGN KEY(adm_id_admin) REFERENCES KADMINISTRATOR(id_admin),
	FOREIGN KEY(jazik_id_jazik) REFERENCES JAZIK(id_jazik)
)

CREATE TABLE dbo.KDOKUMENT
(
	id_dokument numeric(18, 0) IDENTITY(1,1) NOT NULL,
	naslov nvarchar(50) NULL,
	jazik_id_jazikd numeric(18, 0) NULL,
	dokument nvarchar(50) NULL,
	prikaz numeric(18, 0) NULL, 
	PRIMARY KEY (id_dokument),
	FOREIGN KEY (jazik_id_jazik) REFERENCES JAZIK(id_jazik)
)

CREATE TABLE dbo.EMAIL
(
	id_posetitel numeric(18, 0) IDENTITY(1,1) NOT NULL,
	ime nvarchar(50) NULL,
	mail nvarchar(50) NULL, 
	PRIMARY KEY(id_posetitel)
)

CREATE TABLE dbo.EMAIL_GRUPA
(
	id_grupa numeric(18, 0) IDENTITY(1,1) NOT NULL,
	jazik_id_jazikd numeric(18, 0) NULL,
	NAZIV nvarchar(50) NULL,
	aktivna numeric(18, 0) NULL,
	PRIMARY KEY(id_grupa),
	FOREIGN KEY(jazik_id_jazikd) REFERENCES JAZIK(id_jazik) 
)

CREATE TABLE dbo.EMAIL_PORAKA
(
	id_poraka numeric(18, 0) IDENTITY NOT NULL, 
	grupa_id_grupa numeric(18, 0) NULL, 
	datum datetime NULL,
	naslov nvarchar(50) NULL,
	tekst nvarchar(500) NULL, 
	PRIMARY KEY(id_poraka),
	FOREIGN KEY(grupa_id_grupa) REFERENCES EMAIL_GRUPA(id_grupa)
)

CREATE TABLE dbo.MAILING
(
	email_id_posetitel numeric(18,0) NULL,
	email_id_grupa numeric(18,0) NULL,
	FOREIGN KEY(email_id_posetitel) REFERENCES EMAIL(id_posetitel),
	FOREIGN KEY(email_id_grupa) REFERENCES EMAIL_GRUPA(id_grupa)
)

CREATE TABLE dbo.GALERIJA
(
	id_galerija numeric(18,0) IDENTITY(1,1) NOT NULL,
	preview numeric(18,0) NULL,
	PRIMARY KEY(id_galerija)
)

CREATE TABLE dbo.GALERIJA_OPIS
(	gal_id_galerija numeric(18, 0) NULL,
	jazik_id_jazik numeric(18, 0) NULL, 
	naslov nvarchar(50) NULL,
	opis nvarchar(500) NULL 
	FOREIGN KEY(gal_id_galerija) REFERENCES GALERIJA(id_galerija),
	FOREIGN KEY(jazik_id_jazik) REFERENCES JAZIK(id_jazik)
)

CREATE TABLE dbo.GALERIJA_SLIKA
(
	id_slika numeric(18, 0) IDENTITY(1,1) NOT NULL, 
	gal_id_galerija numeric(18, 0) NULL, 
	opisslika nvarchar(300) NULL,
	slika nvarchar(50) NULL,
	OPISSLIKAENG nvarchar(300) NULL, 
	PRIMARY KEY(id_slika),
	FOREIGN KEY(gal_id_galerija) REFERENCES GALERIJA(id_galerija)
)