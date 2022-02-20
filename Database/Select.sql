Use BTP
GO
Select * from Utilisateur
select * from login where username = 'younes'
Select CIN, Prenom, Nom, Login as Username, Type from Utilisateur U Inner Join Login L On L.username = U.login Where Login = 'younes' and  L.Type <> 'Directeur'
GO
--exec sp_rename 'Projet.dateCreation' , dateDebutP, 'column'
GO
-- alter table projet alter column Responsable varchar(22) not null
Go
-- alter table projet add constraint FKRespo_Login foreign Key (Responsable) References [Login] (username)
GO
Select distinct username from Login Where Type = 'Responsable'
Select * from projet Where statut <> 'Valider' and Responsable = ''
Select * from ressource
Select  U.CIN, U.Prenom, U.Nom  from [Login] L Inner Join Utilisateur U on U.Login = L.username Where L.username = 'ilham'
Select  count(*)  from Projet P Inner join [Login] L On L.username = P.Responsable Inner Join Utilisateur U on U.Login = L.username Where L.username = 'younes' and P.statut = 'en cours'
--select * From Livrable
--select * From Projet
Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable, statut, cast(dateDebutP as varchar(12)) as 'Date Creation', cast(DateFin as varchar(12)) as 'Date Fin' From Projet

Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable, statut, cast(dateDebutP as varchar(12)) as 'Date Creation', cast(DateFin as varchar(12)) as 'Date Fin' From Projet Where Responsable = 'younes'
Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable, statut, cast(dateDebutP as varchar(12)) as 'Date Creation', cast(DateFin as varchar(12)) as 'Date Fin' From Projet Where Responsable = 'younes' and dateDebutP >= '1/1/2000'-- and DateFin <= '1/1/2030'
Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Creation', cast(DateFin as varchar(12)) as 'Date Fin' From Projet
select * from Livrable
select * from Projet
select * from Inventaire
select * from InventaireRessource
select * from LivrableInventaire
select * from Ressource
select * from LivrableRessource
-- update Projet Set statut = 'Valider' where CodeP = 'D11'
/*
Update Ressource Set NBUnites += LR.NumeroRessource From Ressource R
	inner join LivrableRessource LR On LR.codeR = R.codeR
	inner Join Livrable L On L.iDLivrable = LR.iDLivrable
	inner Join Projet P On P.CodeP = L.codeP
	Where P.statut = 'valider' and P.CodeP = 'C00' */
Go
select * from Projet
Select * from Livrable
Select * from Ressource
Select * from LivrableRessource
Insert Into Livrable values('C00','Premiere Livrable', 'premier', getdate(), getdate(), null, null, '15%')
Insert Into LivrableRessource Values(0, 'A12', 4)
GO
Create Trigger TRInsInventaire
on LivrableRessource after Insert
as
begin
	set nocount on
	declare @id int, @codeR varchar(22), @QtStock int, @Qt int, @inv UNIQUEIDENTIFIER
	select @id = idLivrable from inserted
	select @Qt = NumeroRessource From LivrableRessource
	-- looking for output after insert
	-- How to assign a value from Inserted Output to a avariable
	/*
	insert into Inventaire(iDLivrable, dateMAJ, qte, codeR) 
	values (@id, getdate(), @NBUnite, @codeR)
	select @inv = ID From (select numInventaire as 'ID', max(dateMAJ) as 'Date' From Inventaire Group By numInventaire) as Temp
	Insert Into InventaireRessource Values(@inv, @codeR, @NBUnite)
	Insert Into LivrableInventaire values (@inv, @id, @NBUnite)
	*/
	declare @temp table ( i uniqueidentifier )
	insert into Inventaire(iDLivrable, dateMAJ, qte, codeR) 
	Output Inserted.numInventaire into @temp(i)
	values (@id, getdate(), @QtStock, @codeR)

	select @inv = i from @temp
	Insert Into InventaireRessource Values(@inv, @codeR, @QtStock)
	Insert Into LivrableInventaire values (@inv, @id, @Qt)
end
GO
Select CIN, Prenom, Nom, Login as Username, Type from Utilisateur U Inner Join Login L On L.username = U.login Where L.Type = 'Responsable'

Select L.codeP as 'Code Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' From Livrable L Inner Join Projet P On P.codeP = L.codeP
Where P.responsable = 'younes'


Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin' From Projet Where responsable = 'younes'