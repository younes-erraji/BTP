Create Database BTP
GO
Use BTP
GO
Create Table [Login] (
	ID uniqueidentifier primary key default newid(),
	username varchar(22) unique not null,
	[password] nvarchar(22) not null,
	[Type] varchar(20) not null check([Type] in ('Responsable', 'Directeur'))
)
GO
Create Table Utilisateur (
	CIN varchar(10) Primary Key,
	Prenom varchar(22),
	Nom varchar(22),
	[login] varchar(22) unique not null foreign Key References [Login] (username)
)
GO
create Proc EncryptLogin
@username varchar(22), @pass nvarchar(22), @ty varchar(20)
as
  begin
	insert into [Login] (username, password, Type)
	values (@username,convert(nvarchar(22), HashBytes('MD5', @username + @pass)), @ty)
  end
GO
Exec EncryptLogin 'one', '123', 'Responsable'
GO
Exec EncryptLogin 'ilham', '123', 'Directeur'
GO
Exec EncryptLogin 'younes', '123', 'Responsable'
GO
Insert Into Utilisateur Values ('AD2012013', 'Younes', 'ERRAJI', 'younes'),
	('AB875487', 'Ilham', 'ERRAJI', 'ilham')
GO
create Function [dbo].[VerifierLogin]
(@user varchar(22),
@pass nvarchar(22))
returns bit
as begin
  declare @i bit
  
  if Exists (select username, password from [Login]
    where convert(nvarchar(22), HashBytes('MD5', @user + @pass)) = (select [password] from [Login] where username = @user))
		set @i = 1
  else set @i = 0
  return @i
end
GO
select dbo.[VerifierLogin]('ilham', '123')
GO
select dbo.[VerifierLogin]('younes', '123')
GO
Create Table Projet (
  CodeP varchar(14) Primary Key,
  nomProjet varchar(max),
  IntituleProjet varchar(max),
  Responsable varchar(22) not null foreign Key References [Login] (username),
  [statut] varchar(max) check([statut] in('Brouillon','valider','en cours','clôture','annuler')),
  dateDebutP date,
  DatePrevueFin date,
  DateFin date
)
GO
Create Table TypeRessource (
  typeR varchar(20) Primary Key,
  nomR varchar(max),
  [description] varchar(max)
)
GO
Create Table UnitéRessource (
  UnitéRess varchar(10) Primary Key,
  intituleRess varchar(max),
  [description] varchar(max)
)
GO
Create Table Ressource (
  codeR varchar(10) Primary Key,
  designation varchar(max),
  typeR varchar(20) foreign key References TypeRessource (typeR),
  UnitéR varchar(10) foreign key References UnitéRessource (UnitéRess),
  NBUnites varchar(max),
  prixUnitaire money
)
GO
insert into UnitéRessource(UnitéRess) values('Litre')
insert into UnitéRessource (UnitéRess, intituleRess) values ('kg','Kilogramme')
insert into UnitéRessource (UnitéRess, intituleRess) values ('m3','metre cube')
insert into UnitéRessource (UnitéRess, intituleRess) values ('ml','millilitre')
insert into UnitéRessource (UnitéRess, intituleRess) values ('m2','metre carré')
insert into UnitéRessource (UnitéRess, intituleRess) values ('t','tonne')
insert into UnitéRessource (UnitéRess, intituleRess) values ('M','Mois')
insert into UnitéRessource (UnitéRess, intituleRess) values ('j','jour')
insert into UnitéRessource (UnitéRess) values ('U')
insert into UnitéRessource (UnitéRess) values ('V')
Go
insert into TypeRessource(typeR) values ('Carburant')
insert into TypeRessource(typeR) values ('Fourniture')
insert into TypeRessource(typeR) values ('Masse Salariale')
insert into TypeRessource(typeR) values ('Matériels')
insert into TypeRessource(typeR) values ('Outillage')
GO
Insert Into Ressource(typeR, codeR, designation, UnitéR, prixUnitaire)
	values ('Carburant','CAR01','Gasoil','Litre',9.00),
	('Carburant','CAR02','Essence','Litre',12.00),
	('Fourniture','A5','Ciment CPJ 45 en sac','kg',1.25),
	('Fourniture','A1','Tout venant  GNF','m3',42.00),
	('Fourniture','A19','Fer à béton','kg',6.25),
	('Fourniture','A2','Tout venant  GNB','m3',48.00),
	('Fourniture','A12','Sable de béton','m3',150.00),
	('Fourniture','A56','Tube DN 1000 -Série 135 A-','ml',800.00),
	('Fourniture','A44','Pierre sèche','m3',100.00),
	('Fourniture','A14','Gravette G 1','m3',110.00),
	('Fourniture','A15','Gravette G 2','m3',110.00),
	('Fourniture','A62','Fil de Gabions','m2',11.00),
	('Fourniture','A52','eau pour arrosage','t',10.00),
	('Fourniture','A61','tri soudé DN 6','m2',6.50),
	('Fourniture','A16','Madrier','ml',40.00),
	('Fourniture','A47','SABLE0-5','m3',150.00),
	('Fourniture','A57','Tube DN 400 -Série 135 A-','ml',195.00),
	('Fourniture','A45','POLYSTERE 2CM','m3',458.33),
	('Fourniture','A67','Frais d''étude pour déplacement des Poteaux','u',5000.00),
	('Fourniture','A39','Loyer ouvrier','M',3000.00),
	('Fourniture','A20','Fil d''attache','kg',9.00),
	('Fourniture','A13','Panneaux de signalisation','u',1200.00),
	('Fourniture','A58','Pointe 10','kg',12.00),
	('Fourniture','A59','Pointe 6','kg',12.00),
	('Fourniture','A64','Joint "Water stop " de 22,5 cm','ml',100.00),
	('Fourniture','A17','Planche','m2',20.00),
	('Fourniture','A11','Loyer','M',1200.00),
	('Fourniture','A27','Eau et électricité','M',1000.00),
	('Fourniture','EPI-01','chaussures de sécurité','u',175.00),
	('Fourniture','EPI-03','Gillet','u',20.00),
	('Fourniture','EPI-04','gant en cuir','u',12.00),
	('Fourniture','EPI-02','casques','u',20.00),
	('Fourniture','A3','Cut Back 0,10','t',5820.00),
	('Fourniture','A24','Bitume 65','t',6320.00),
	('Fourniture','A6','TUBE ORANGE PVC SN4/S1 B006 DN160','ml',39.36),
	('Fourniture','A7','TUBE ORANGE PVC SN4/S1 B006 DN200','ml',57.29),
	('Fourniture','A8','TUBE ORANGE PVC SN4/S1 B006 DN400','ml',235.58),
	('Fourniture','A9','TUBE PE100 PN10 D0063 R100','ml',14.26),
	('Fourniture','A66','Autorisation + Divers pour concasseur','m3',20.00),
	('Fourniture','A4','Bitume 55','t',5820.00),
	('Fourniture','A18','Tout venant 0,50',	'm3',50.00),
	('Fourniture','A21','Grain de riz 3/8 départ carrière',	'm3',130.00),
	('Fourniture','A22','Gravette pour lit de pose','m3',90.00),
	('Fourniture','A23','Moellon','m3',100.00),
	('Fourniture','A28','Béton prêt à l''emploi B20','m3',615.00),
	('Fourniture','A29','Béton prêt à l''emploi B30','m3',745.00),
	('Fourniture','A31','BITUME OXYDE 90/40 (Feutre bitumineux)','kg',9.58),
	('Fourniture','A32','Flintkote sac de 20kg','Kg',7.50),
	('Fourniture','A33','Feutre 36/S','m2',10.42),
	('Fourniture','A34','Polyane','m2',3.00),
	('Fourniture','A40','Transport ouvrier','M',5625.00),
	('Fourniture','A41','Agglos de 15','u',5.50),
	('Fourniture','A42','Pavé','m2',75.00),
	('Fourniture','A43','Bordure P1 100X25X15','ml',43.00),
	('Fourniture','EPI-05','Transport de matériel','v',4500.00),
	('Fourniture','A46','Tamis 2000x1500','u',500.00),
	('Fourniture','EPI-07', null, null, null),
	('Fourniture','A53','Gravette 10/14','m3',130.00),
	('Fourniture','A48','Appuis de fenêtre en béton armé','ml',1.00),
	('Fourniture','A49','cornière 45/45','ml',11.67),
	('Fourniture','A50','cornière 40/40','ml',10.83),
	('Fourniture','A51','Agglos de 20','u',5.17),
	('Fourniture','A55','MS','m3',25.00),
	('Fourniture','A54','Gravette 6/10','m3',130.00),
	('Fourniture','A63','Géotextile','m2',28.00),
	('Masse Salariale','MO','Ouvrier','j',92.50),
	('Masse Salariale','MQ','Boiseur / maçon / Ferrailleur /  poseur','j',150.00),
	('Masse Salariale','CT','Conducteur de Travaux','M',22109.00),
	('Masse Salariale','CC','Chef de chantier','M',7000.00),
	('Masse Salariale','OT','Opérateur Topographe','M',7000.00),
	('Masse Salariale','AD','Administrateur','M',4000.00),
	('Masse Salariale','GA','Gardien','M',2775.00),
	('Masse Salariale','AGF','Administration, gestion et Finance','M',15000.00),
	('Masse Salariale','IT','Ingénieur de Travaux','M',12000.00),
	('Masse Salariale','MA','Maçon','j',150.00),
	('Masse Salariale','FE','Ferrailleur','j',130.00),
	('Matériels','MAT-106','Camion Benne 18M3','j',1300.00),
	('Matériels','MAT-134','Auto bétonnière  2500 Litres','j',800.00),
	('Matériels','MAT-110','Pelle Hydraulique Sur Chenilles  Poids<22Tonnes','j',1500.00),
	('Matériels','MAT-122','Niveleuse','j',1600.00),
	('Matériels','MAT-114','Pelle Hydraulique Sur Pneu','j',1400.00),
	('Matériels','MAT-128','Compacteur Roulant 16 Tonnes','j',900.00),
	('Matériels','MAT-143','Camion Citerne à eau 10 tonnes','j',500.00),
	('Matériels','MAT-119','Tractopelle','j',900.00),
	('Matériels','MAT-105','Camion Benne 6M3','j',600.00),
	('Matériels','MAT-104','Camion Benne 3M3','j',450.00),
	('Matériels','MAT-127','Compacteur Roulant 1Tonne<Poids<3,5 Tonnes','j',500.00),
	('Matériels','MAT-108','Pick Up','M',7500.00),
	('Matériels','MAT-139','Magasin (container 20")','U',8000.00),
	('Matériels','MAT-153','Concasseur Mobile','j',4000.00),
	('Matériels','MAT-120','Chargeur','j',1500.00),
	('Matériels','MAT-145','Répondeuse 10 Tonnes','j',2500.00),
	('Matériels','MAT-146','Gravieuneuse 10 m3','j',1800.00),
	('Matériels','MAT-152','Compacteur Roulant avec Pneu','j',2000.00),
	('Matériels','MAT-112','Pelle Hydraulique Sur Chenilles 22 Tonnes < Poids< 30 Tonnes','j',1700.00),
	('Matériels','MAT-125','Transport Matériel','v',5000.00),
	('Matériels','MAT-107','Camion Plateau Avec Grue','j',2000.00),
	('Matériels','MAT-109','Pompe A Béton','m3',50.00),
	('Matériels','MAT-123','Groupe électrogène 30 kva','j',38.25),
	('Matériels','MAT-129','Compacteur Roulant Poids< 950Kg','j',300.00),
	('Matériels','MAT-132','Manitou rotatif','M',30000.00),
	('Matériels','MAT-133','Grue mobile','M',45000.00),
	('Matériels','MAT-135','Voiture de services','M',6000.00),
	('Matériels','MAT-141','Appareil niveau','M',83.33),
	('Matériels','MAT-142','Convertisseur de vibration béton','j',21.86),
	('Matériels','MAT-144','Camion Citerne à eau 26 tonnes','j',2200.00),
	('Matériels','MAT-149','Camion 8x4','j',2500.00),
	('Matériels','MAT-150','Manitou','j',1400.00),
	('Matériels','MAT-151','Bétonnière 500 l','j',300.00),
	('Outillage','OUT-106','Brouette','U',500.00),
	('Outillage','OUT-108','Pioche','U',50.00),
	('Outillage','OUT-107','pelle','U',40.00),
	('Outillage','OUT-111','Marteaux 2 kg','U',50.00),
	('Outillage','OUT-112','Marteaux 5 kg','U',75.00),
	('Outillage','OUT-113','Pointe 10','kg',12.00   ),
	('Outillage','OUT-109','Manche / pelle','U',15.00),
	('Outillage','OUT-110','manche / pioche','U',15.00),
	('Outillage','OUT-101','Elingues 4ml (10/08)','U',7000.00),
	('Outillage','OUT-102','Scie sauteuse','U',500.00),
	('Outillage','OUT-103','Perceuse','U',900.00),
	('Outillage','OUT-104','Meuleuse','U',1200.00)
GO
Update Ressource set NBUnites = 1780
GO
Create Table Livrable (
  iDLivrable int Identity(0,1) unique,
  codeP varchar(14) foreign key references Projet (CodeP),
  intitule varchar(30),
  description varchar (max),
  dateDebLEs date,
  dateFinLEs date,
  dateDebLR date, 
  dateFinLR date,
  etatAvancement varchar(15),
  Primary Key(iDLivrable, codeP)
)
GO
Create Table LivrableRessource (
	iDLivrable int Foreign Key References Livrable (iDLivrable),
	codeR varchar(10) Foreign Key References Ressource (codeR),
	NumeroRessource int,
	Primary Key(iDLivrable, codeR)
)
GO
create Table Inventaire (
  numInventaire UNIQUEIDENTIFIER Primary Key DEFAULT newid(),
  iDLivrable int foreign key References Livrable (IDLivrable),
  dateMAJ date,
  qte varchar(10) ,
  codeR varchar(10) foreign key References Ressource (codeR)
)
GO
Create Table InventaireRessource (
  numInventaire UNIQUEIDENTIFIER foreign key References Inventaire (numInventaire),
  codeR varchar(10) foreign key References Ressource (codeR),
  NBUniteRes int,
  Primary Key(numInventaire, codeR)
)
GO 
Create Table LivrableInventaire (
  numInventaire UNIQUEIDENTIFIER foreign key References Inventaire (numInventaire),
  IDLivrable int foreign key References Livrable (IDLivrable),
  NBUniteLiv int,
  Primary Key(numInventaire, IDLivrable)
)
GO 
Create Table LivrableProjet (
  IDLivrable int foreign key References Livrable (IDLivrable),
  codeP varchar(14) foreign key References Projet (codeP),
  DateDLiv date,
  DateFLiv date,
  Primary Key(codeP, IDLivrable)
)
GO
Create Trigger TRRessourceProjet
on LivrableRessource after Update, Insert, Delete
as
	begin
		set nocount on
		Update Ressource set NBUnites = NBUnites - (select NumeroRessource from inserted)
			Where codeR = (select codeR from inserted)
	end
GO
Create Trigger TRFinProjet
on Projet after Update
as
	begin
		set nocount on
		declare @i varchar(22), @code varchar(14)
		select @code = codeP, @i = statut from inserted
		if @i = 'valider'
			update Projet Set DateFin = getdate() where CodeP = @code
			Update Ressource Set NBUnites += LR.NumeroRessource From Ressource R
				inner join LivrableRessource LR On LR.codeR = R.codeR
				inner Join Livrable L On L.iDLivrable = LR.iDLivrable
				inner Join Projet P On P.CodeP = L.codeP
				Where P.statut = 'valider' and P.CodeP = @code
	end
GO
Create Trigger TRInsInventaire
on LivrableRessource after Insert
as
begin
	set nocount on
	declare @id int, @codeR varchar(22), @QtStock int, @Qt int, @inv UNIQUEIDENTIFIER
	select @id = idLivrable from inserted
	select @codeR = codeR from inserted
	select @Qt = NumeroRessource From LivrableRessource
	declare @temp table ( i uniqueidentifier )
	insert into Inventaire(iDLivrable, dateMAJ, qte, codeR) 
	Output Inserted.numInventaire into @temp(i)
	values (@id, getdate(), @QtStock, @codeR)

	select @inv = i from @temp
	Insert Into InventaireRessource Values(@inv, @codeR, @QtStock)
	Insert Into LivrableInventaire values (@inv, @id, @Qt)
end
GO