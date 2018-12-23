-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 23 déc. 2018 à 10:07
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet final`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

DROP TABLE IF EXISTS `avoir`;
CREATE TABLE IF NOT EXISTS `avoir` (
  `MatriculeE` int(11) NOT NULL,
  `RespID` int(11) NOT NULL,
  PRIMARY KEY (`MatriculeE`,`RespID`),
  KEY `Avoir_Responsable0_FK` (`RespID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avoir`
--

INSERT INTO `avoir` (`MatriculeE`, `RespID`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `ID_Cours` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `HeureD` time NOT NULL,
  `HeureF` time NOT NULL,
  `MatriculeP` int(11) NOT NULL,
  `Id_Salel` int(11) NOT NULL,
  `ID_type_Cours` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cours`),
  KEY `Cours_Professeur_FK` (`MatriculeP`),
  KEY `Cours_Salle0_FK` (`Id_Salel`),
  KEY `Cours_TypeCours1_FK` (`ID_type_Cours`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`ID_Cours`, `Nom`, `Date`, `HeureD`, `HeureF`, `MatriculeP`, `Id_Salel`, `ID_type_Cours`) VALUES
(1, 'Math', '2018-06-09', '08:00:00', '09:45:00', 1, 10, 3),
(2, 'Informatique', '2018-12-14', '10:00:00', '11:45:00', 2, 10, 1),
(3, 'BDD', '2018-12-17', '15:45:00', '17:45:00', 1, 4, 1),
(5, 'Test', '2018-08-07', '15:45:00', '17:45:00', 1, 4, 2),
(6, 'Test', '2018-08-07', '08:00:00', '09:45:00', 1, 4, 2),
(7, 'Testo', '2018-08-07', '10:00:00', '11:45:00', 1, 4, 2),
(19, 'Math', '2018-08-07', '14:00:00', '15:45:00', 1, 4, 2),
(20, 'Anglais', '2018-06-09', '14:00:00', '15:45:00', 1, 4, 2),
(21, 'Informatique', '2018-06-09', '10:00:00', '11:45:00', 1, 4, 1),
(22, 'Informatique', '2018-06-09', '18:00:00', '19:45:00', 1, 4, 1);

--
-- Déclencheurs `cours`
--
DROP TRIGGER IF EXISTS `Dispo_Prof`;
DELIMITER $$
CREATE TRIGGER `Dispo_Prof` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF (EXISTS(SELECT MatriculeP,Date,HeureD FROM cours

               WHERE MatriculeP=NEW.MatriculeP AND Date=NEW.Date AND HeureD=New.HeureD ))

      THEN INSERT INTO Erreur (erreur) VALUES ("Erreur : Le professeur donne déjà cours.");

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `horaire_limite`;
DELIMITER $$
CREATE TRIGGER `horaire_limite` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF NEW.HeureD < '08:00:00'

    OR NEW.HeureD > '18:00:00'

    OR NEW.HeureF > '19:45:00'

    OR NEW.HeureF < '09:45:00'

      THEN INSERT INTO erreur (erreur) VALUES ('Erreur : Les cours s effectuent entre 8h à 19h45.');

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `horaire_valide`;
DELIMITER $$
CREATE TRIGGER `horaire_valide` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF NEW.HeureD = NEW.HeureF

    OR NEW.HeureD > NEW.HeureF


      THEN INSERT INTO Erreur (erreur) VALUES ('Erreur : Les horaires ne sont pas valides.');

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `limite_heure_inf`;
DELIMITER $$
CREATE TRIGGER `limite_heure_inf` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF (EXISTS(SELECT Date,HeureD,HeureF FROM cours

               WHERE  Date=NEW.Date AND TIMEDIFF(New.HeureF,New.HeureD)<'01:45:00'))

      THEN INSERT INTO Erreur (erreur) VALUES ('Erreur : Le cours ne fait pas 1h45');

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `limite_heure_sup`;
DELIMITER $$
CREATE TRIGGER `limite_heure_sup` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF (EXISTS(SELECT Date,HeureD,HeureF FROM cours

               WHERE  Date=NEW.Date AND TIMEDIFF(New.HeureF,New.HeureD)>'01:45:00'))

      THEN INSERT INTO Erreur (erreur) VALUES ('Erreur : Le cours ne fait pas 1h45');

    END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `salle_occupee`;
DELIMITER $$
CREATE TRIGGER `salle_occupee` BEFORE INSERT ON `cours` FOR EACH ROW BEGIN

    IF (EXISTS(SELECT Id_Salel,Date,HeureD FROM cours

               WHERE Id_Salel=NEW.Id_Salel AND Date=NEW.Date AND HeureD=New.HeureD))

      THEN INSERT INTO Erreur (erreur) VALUES ('Erreur : La salle est indisponible');

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `MatriculeE` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `DateNaissance` date NOT NULL,
  `VilleNaissance` varchar(25) NOT NULL,
  `PaysNaissance` varchar(25) NOT NULL,
  `Sexe` varchar(10) NOT NULL,
  `DateInscription` date NOT NULL,
  `EtablissementPrec` varchar(50) NOT NULL,
  `Photo` varchar(50) NOT NULL,
  `Num_Rue` int(11) NOT NULL,
  `Nom_Rue` varchar(50) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `TeleDom` int(11) NOT NULL,
  `TeleMobile` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ID_Groupe` int(11) NOT NULL,
  PRIMARY KEY (`MatriculeE`),
  KEY `Eleve_Groupe_FK` (`ID_Groupe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`MatriculeE`, `Nom`, `Prenom`, `DateNaissance`, `VilleNaissance`, `PaysNaissance`, `Sexe`, `DateInscription`, `EtablissementPrec`, `Photo`, `Num_Rue`, `Nom_Rue`, `Ville`, `TeleDom`, `TeleMobile`, `Email`, `ID_Groupe`) VALUES
(1, 'Michel', 'A', '1999-12-17', 'Paris', 'France', 'Masculin', '2018-12-11', 'Louis Rascol', 'none', 5, 'Rue de la colère', 'Paris', 156956322, 632459856, 'michel.a@efrei.net', 1),
(2, 'Lepaul', 'Gertrude', '1997-12-05', 'Paris', 'France', 'Féminin', '2018-12-11', 'Deodat de Severac', 'none', 4, 'Rue de la Fatigue', 'Nantes', 189652323, 632569845, 'lepaul.gertrude@efrei.net', 13),
(3, 'Muratet', 'Joris', '2018-12-11', 'Albi', 'France', 'Masculin', '2018-12-13', 'Deodat', 'none', 44, 'Rue des Peuplier', 'Cambon', 654656565, 654656546, 'joris.muratet@efrei.net', 2);

-- --------------------------------------------------------

--
-- Structure de la table `erreur`
--

DROP TABLE IF EXISTS `erreur`;
CREATE TABLE IF NOT EXISTS `erreur` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `erreur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `erreur` (`erreur`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `erreur`
--

INSERT INTO `erreur` (`id`, `erreur`) VALUES
(1, 'Erreur : Les cours s effectuent entre 8h à 19h45.'),
(3, 'Erreur : La salle est indisponible'),
(4, 'Erreur : Le professeur donne déjà cours.'),
(5, 'Erreur : Le cours ne fait pas 1h45'),
(6, 'Erreur : Les horaires ne sont pas valides.');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `ID_Groupe` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Id_Promotion` int(11) NOT NULL,
  PRIMARY KEY (`ID_Groupe`),
  KEY `Groupe_Promotion_FK` (`Id_Promotion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`ID_Groupe`, `Nom`, `Id_Promotion`) VALUES
(1, 'L1A', 1),
(2, 'L1B', 1),
(3, 'L1C', 1),
(4, 'L1D', 1),
(5, 'L1E', 1),
(6, 'L2A', 2),
(7, 'L2B', 2),
(8, 'L2C', 2),
(9, 'L2D', 2),
(10, 'L2E', 2),
(11, 'L3A', 3),
(12, 'L3B', 3),
(13, 'L3C', 3),
(14, 'L3D', 3),
(15, 'L3E', 3),
(16, 'M1A', 4);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `MatriculeP` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `NumRue` int(11) NOT NULL,
  `NomRue` varchar(50) NOT NULL,
  `CodePostal` int(11) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `TelDom` int(11) NOT NULL,
  `TelMobile` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`MatriculeP`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`MatriculeP`, `Nom`, `Prenom`, `NumRue`, `NomRue`, `CodePostal`, `Ville`, `TelDom`, `TelMobile`, `Email`) VALUES
(1, 'Durand', 'Albet', 6, 'Rue des Bois', 75001, 'Paris', 665984587, 632598452, 'albert.durand@efrei.net'),
(2, 'Luc', 'Ratif', 9, 'Rue Mozart', 81000, 'Albi', 365958789, 632569845, 'luc.ratif@efrei.net');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `Id_Promotion` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Promotion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`Id_Promotion`, `nom`) VALUES
(1, 'L1'),
(2, 'L2'),
(3, 'L3'),
(4, 'M1'),
(5, 'M2');

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `RespID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`RespID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `responsable`
--

INSERT INTO `responsable` (`RespID`, `Nom`, `Prenom`, `Adresse`, `Telephone`, `Email`) VALUES
(1, 'Bernard', 'Jean', '4 rue de la mauvaise foi', 368484651, 'jean.bernard@efrei.net'),
(2, 'DUPONT', 'ALFRED', '9 rue des Sapin', 66599865, 'dupont.alfred@efrei.net');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `Id_Salel` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(150) NOT NULL,
  `NbPlace` int(11) NOT NULL,
  `Type_salle` varchar(150) NOT NULL,
  PRIMARY KEY (`Id_Salel`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`Id_Salel`, `Nom`, `NbPlace`, `Type_salle`) VALUES
(1, 'AmphiRouge', 200, 'Amphi'),
(2, 'AmphiJaune', 200, 'Amphi'),
(3, 'AmphiOrange', 200, 'Amphi'),
(4, 'E15', 40, 'Informatique'),
(5, 'E24', 40, 'Classique'),
(6, 'E25', 40, 'Classique'),
(7, 'E26', 40, 'Classique'),
(8, 'E27', 40, 'Classique'),
(9, 'C13', 40, 'Informatique'),
(10, 'C14', 40, 'Informatique');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `ID_Cours` int(11) NOT NULL,
  `ID_Groupe` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cours`,`ID_Groupe`),
  KEY `Suivre_Groupe0_FK` (`ID_Groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `suivre`
--

INSERT INTO `suivre` (`ID_Cours`, `ID_Groupe`) VALUES
(1, 1),
(20, 1),
(21, 1),
(22, 1),
(19, 2),
(2, 12);

-- --------------------------------------------------------

--
-- Structure de la table `typecours`
--

DROP TABLE IF EXISTS `typecours`;
CREATE TABLE IF NOT EXISTS `typecours` (
  `ID_type_Cours` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(150) NOT NULL,
  PRIMARY KEY (`ID_type_Cours`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typecours`
--

INSERT INTO `typecours` (`ID_type_Cours`, `Type`) VALUES
(1, 'TP'),
(2, 'TD'),
(3, 'COURSMAGISTRAL'),
(4, 'DE');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `Avoir_Eleve_FK` FOREIGN KEY (`MatriculeE`) REFERENCES `eleve` (`MatriculeE`),
  ADD CONSTRAINT `Avoir_Responsable0_FK` FOREIGN KEY (`RespID`) REFERENCES `responsable` (`RespID`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `Cours_Professeur_FK` FOREIGN KEY (`MatriculeP`) REFERENCES `professeur` (`MatriculeP`),
  ADD CONSTRAINT `Cours_Salle0_FK` FOREIGN KEY (`Id_Salel`) REFERENCES `salle` (`Id_Salel`),
  ADD CONSTRAINT `Cours_TypeCours1_FK` FOREIGN KEY (`ID_type_Cours`) REFERENCES `typecours` (`ID_type_Cours`);

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `Eleve_Groupe_FK` FOREIGN KEY (`ID_Groupe`) REFERENCES `groupe` (`ID_Groupe`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `Groupe_Promotion_FK` FOREIGN KEY (`Id_Promotion`) REFERENCES `promotion` (`Id_Promotion`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `Suivre_Cours_FK` FOREIGN KEY (`ID_Cours`) REFERENCES `cours` (`ID_Cours`),
  ADD CONSTRAINT `Suivre_Groupe0_FK` FOREIGN KEY (`ID_Groupe`) REFERENCES `groupe` (`ID_Groupe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
