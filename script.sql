 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------


------------------------------------------------------------
-- Table: Adresse
------------------------------------------------------------
CREATE TABLE Adresse(
	ID_adresse   NUMBER NOT NULL ,
	nom_rue      VARCHAR2 (150) NOT NULL  ,
	Ville        VARCHAR2 (50) NOT NULL  ,
	Pays         VARCHAR2 (150) NOT NULL  ,
	numero_rue   NUMBER (10,0) NOT NULL  ,
	Code_postal  NUMBER (10,0) NOT NULL  ,
	CONSTRAINT Adresse_PK PRIMARY KEY (ID_adresse)
);

------------------------------------------------------------
-- Table: Responsable
------------------------------------------------------------
CREATE TABLE Responsable(
	Matricule_responsable  NUMBER NOT NULL ,
	prenom                 VARCHAR2 (150)  ,
	tel                    VARCHAR2 (15)  ,
	email                  VARCHAR2 (150)  ,
	nom                    VARCHAR2 (150) NOT NULL  ,
	ID_adresse             NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Responsable_PK PRIMARY KEY (Matricule_responsable)

	,CONSTRAINT Responsable_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
);

------------------------------------------------------------
-- Table: Professeur
------------------------------------------------------------
CREATE TABLE Professeur(
	Matricule_prof  NUMBER NOT NULL ,
	nom             VARCHAR2 (150)  ,
	prenom          VARCHAR2 (150)  ,
	email           VARCHAR2 (150)  ,
	Tel_domicile    VARCHAR2 (25) NOT NULL  ,
	Tel_mobile      VARCHAR2 (25) NOT NULL  ,
	ID_adresse      NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Professeur_PK PRIMARY KEY (Matricule_prof)

	,CONSTRAINT Professeur_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
);

------------------------------------------------------------
-- Table: Salles
------------------------------------------------------------
CREATE TABLE Salles(
	code        NUMBER NOT NULL ,
	nom         VARCHAR2 (150)  ,
	nb_place    NUMBER (10,0)  ,
	Type_salle  VARCHAR2 (50)  ,
	CONSTRAINT Salles_PK PRIMARY KEY (code)
);

------------------------------------------------------------
-- Table: Promotion
------------------------------------------------------------
CREATE TABLE Promotion(
	Id_Promo       NUMBER NOT NULL ,
	nom_Promotion  VARCHAR2 (150)  ,
	Nb_eleve       NUMBER (10,0)  ,
	CONSTRAINT Promotion_PK PRIMARY KEY (Id_Promo)
);

------------------------------------------------------------
-- Table: Eleve
------------------------------------------------------------
CREATE TABLE Eleve(
	Matricule                NUMBER NOT NULL ,
	nom                      VARCHAR2 (150)  ,
	prenom                   VARCHAR2 (150)  ,
	Date_Naissance           DATE  NOT NULL  ,
	Ville_Naissance          VARCHAR2 (50) NOT NULL  ,
	Pays_Naissance           VARCHAR2 (50) NOT NULL  ,
	Sexe                     VARCHAR2 (50) NOT NULL  ,
	Date_Inscription         DATE  NOT NULL  ,
	Etablissement_Precedent  VARCHAR2 (150) NOT NULL  ,
	Photo                    VARCHAR2 (150) NOT NULL  ,
	Tel_domicile             VARCHAR2 (25) NOT NULL  ,
	Tel_mobile               VARCHAR2 (25) NOT NULL  ,
	Email                    VARCHAR2 (150) NOT NULL  ,
	ID_adresse               NUMBER(10,0)  NOT NULL  ,
	Id_Promo                 NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Eleve_PK PRIMARY KEY (Matricule)

	,CONSTRAINT Eleve_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
	,CONSTRAINT Eleve_Promotion0_FK FOREIGN KEY (Id_Promo) REFERENCES Promotion(Id_Promo)
);

------------------------------------------------------------
-- Table: Groupe
------------------------------------------------------------
CREATE TABLE Groupe(
	code      NUMBER NOT NULL ,
	nom       VARCHAR2 (150)  ,
	Id_Promo  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Groupe_PK PRIMARY KEY (code)

	,CONSTRAINT Groupe_Promotion_FK FOREIGN KEY (Id_Promo) REFERENCES Promotion(Id_Promo)
);

------------------------------------------------------------
-- Table: Cours
------------------------------------------------------------
CREATE TABLE Cours(
	Code_cours     NUMBER NOT NULL ,
	Date_cours     DATE  NOT NULL  ,
	Horaire_cours  DATE  NOT NULL  ,
	nom            VARCHAR2 (150)  ,
	CONSTRAINT Cours_PK PRIMARY KEY (Code_cours)
);

------------------------------------------------------------
-- Table: Concerner
------------------------------------------------------------
CREATE TABLE Concerner(
	Matricule_responsable  NUMBER(10,0)  NOT NULL  ,
	Matricule              NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Concerner_PK PRIMARY KEY (Matricule_responsable,Matricule)

	,CONSTRAINT Concerner_Responsable_FK FOREIGN KEY (Matricule_responsable) REFERENCES Responsable(Matricule_responsable)
	,CONSTRAINT Concerner_Eleve0_FK FOREIGN KEY (Matricule) REFERENCES Eleve(Matricule)
);

------------------------------------------------------------
-- Table: Appartenir
------------------------------------------------------------
CREATE TABLE Appartenir(
	code       NUMBER(10,0)  NOT NULL  ,
	Matricule  NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Appartenir_PK PRIMARY KEY (code,Matricule)

	,CONSTRAINT Appartenir_Groupe_FK FOREIGN KEY (code) REFERENCES Groupe(code)
	,CONSTRAINT Appartenir_Eleve0_FK FOREIGN KEY (Matricule) REFERENCES Eleve(Matricule)
);

------------------------------------------------------------
-- Table: Recevoir
------------------------------------------------------------
CREATE TABLE Recevoir(
	Code_cours  NUMBER(10,0)  NOT NULL  ,
	Matricule   NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Recevoir_PK PRIMARY KEY (Code_cours,Matricule)

	,CONSTRAINT Recevoir_Cours_FK FOREIGN KEY (Code_cours) REFERENCES Cours(Code_cours)
	,CONSTRAINT Recevoir_Eleve0_FK FOREIGN KEY (Matricule) REFERENCES Eleve(Matricule)
);

------------------------------------------------------------
-- Table: Concerner1
------------------------------------------------------------
CREATE TABLE Concerner1(
	Code_cours  NUMBER(10,0)  NOT NULL  ,
	code        NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT Concerner1_PK PRIMARY KEY (Code_cours,code)




	=======================================================================
	   Désolé, il faut activer cette version pour voir la suite du script ! 
	=======================================================================
