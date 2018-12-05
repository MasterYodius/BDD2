#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Adresse
#------------------------------------------------------------

CREATE TABLE Adresse(
        ID_adresse  Int  Auto_increment  NOT NULL ,
        nom_rue     Varchar (150) NOT NULL ,
        Ville       Varchar (50) NOT NULL ,
        Pays        Varchar (150) NOT NULL ,
        numero_rue  Integer NOT NULL ,
        Code_postal Integer NOT NULL
	,CONSTRAINT Adresse_PK PRIMARY KEY (ID_adresse)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Responsable
#------------------------------------------------------------

CREATE TABLE Responsable(
        Matricule_responsable Int  Auto_increment  NOT NULL ,
        prenom                Varchar (150) ,
        tel                   Varchar (15) ,
        email                 Varchar (150) ,
        nom                   Varchar (150) NOT NULL ,
        ID_adresse            Int NOT NULL
	,CONSTRAINT Responsable_PK PRIMARY KEY (Matricule_responsable)

	,CONSTRAINT Responsable_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Professeur
#------------------------------------------------------------

CREATE TABLE Professeur(
        Matricule_prof Int  Auto_increment  NOT NULL ,
        nom            Varchar (150) ,
        prenom         Varchar (150) ,
        email          Varchar (150) ,
        Tel_domicile   Varchar (25) NOT NULL ,
        Tel_mobile     Varchar (25) NOT NULL ,
        ID_adresse     Int NOT NULL
	,CONSTRAINT Professeur_PK PRIMARY KEY (Matricule_prof)

	,CONSTRAINT Professeur_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Salles
#------------------------------------------------------------

CREATE TABLE Salles(
        code       Int  Auto_increment  NOT NULL ,
        nom        Varchar (150) ,
        nb_place   Integer ,
        Type_salle Varchar (50)
	,CONSTRAINT Salles_PK PRIMARY KEY (code)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Promotion
#------------------------------------------------------------

CREATE TABLE Promotion(
        Id_Promo      Int  Auto_increment  NOT NULL ,
        nom_Promotion Varchar (150) ,
        Nb_eleve      Integer
	,CONSTRAINT Promotion_PK PRIMARY KEY (Id_Promo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Eleve
#------------------------------------------------------------

CREATE TABLE Eleve(
        Matricule               Int  Auto_increment  NOT NULL ,
        nom                     Varchar (150) ,
        prenom                  Varchar (150) ,
        Date_Naissance          Date NOT NULL ,
        Ville_Naissance         Varchar (50) NOT NULL ,
        Pays_Naissance          Varchar (50) NOT NULL ,
        Sexe                    Varchar (50) NOT NULL ,
        Date_Inscription        Date NOT NULL ,
        Etablissement_Precedent Varchar (150) NOT NULL ,
        Photo                   Varchar (150) NOT NULL ,
        Tel_domicile            Varchar (25) NOT NULL ,
        Tel_mobile              Varchar (25) NOT NULL ,
        Email                   Varchar (150) NOT NULL ,
        ID_adresse              Int NOT NULL ,
        Id_Promo                Int NOT NULL
	,CONSTRAINT Eleve_PK PRIMARY KEY (Matricule)

	,CONSTRAINT Eleve_Adresse_FK FOREIGN KEY (ID_adresse) REFERENCES Adresse(ID_adresse)
	,CONSTRAINT Eleve_Promotion0_FK FOREIGN KEY (Id_Promo) REFERENCES Promotion(Id_Promo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Groupe
#------------------------------------------------------------

CREATE TABLE Groupe(
        code     Int  Auto_increment  NOT NULL ,
        nom      Varchar (150) ,
        Id_Promo Int NOT NULL
	,CONSTRAINT Groupe_PK PRIMARY KEY (code)

	,CONSTRAINT Groupe_Promotion_FK FOREIGN KEY (Id_Promo) REFERENCES Promotion(Id_Promo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Cours
#------------------------------------------------------------

CREATE TABLE Cours(
        Code_cours    Int  Auto_increment  NOT NULL ,
        Date_cours    Date NOT NULL ,
        Horaire_cours Datetime NOT NULL ,
        nom           Varchar (150)
	,CONSTRAINT Cours_PK PRIMARY KEY (Code_cours)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Concerner
#------------------------------------------------------------

CREATE TABLE Concerner(
        Matricule_responsable Int NOT NULL ,
        Matricule             Int NOT NULL
	,CONSTRAINT Concerner_PK PRIMARY KEY (Matricule_responsable,Matricule)

	,CONSTRAINT Concerner_Responsable_FK FOREIGN KEY (Matricule_responsable) REFERENCES Responsable(Matricule_responsable)
	,CONSTRAINT Concerner_Eleve0_FK FOREIGN KEY (Matricule) REFERENCES Eleve(Matricule)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir
#------------------------------------------------------------

CREATE TABLE Appartenir(
        code      Int NOT NULL ,
        Matricule Int NOT NULL
	,CONSTRAINT Appartenir_PK PRIMARY KEY (code,Matricule)

	,CONSTRAINT Appartenir_Groupe_FK FOREIGN KEY (code) REFERENCES Groupe(code)
	,CONSTRAINT Appartenir_Eleve0_FK FOREIGN KEY (Matricule) REFERENCES Eleve(Matricule)
)ENGINE=InnoDB;





	=======================================================================
	   Désolé, il faut activer cette version pour voir la suite du script ! 
	=======================================================================
