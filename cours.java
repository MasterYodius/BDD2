package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class cours {
cours(String url, String user, String password,String nom,String date, String heureD,String heureF, int MatriculeP, int Id_salle,int ID_type_cours) throws SQLException{
		
		Connection connexion = DriverManager.getConnection(url, user, password);
	     java.sql.Statement state = connexion.createStatement();


	         int statut = state.executeUpdate( "INSERT INTO cours (Nom, Date, HeureD, HeureF, MatriculeP, Id_Salel, ID_type_Cours ) "

            + "VALUES ('" + nom + "', '" + date + "', '" + heureD+ "','" + heureF+ "','"+MatriculeP+"','"+Id_salle+"','"+ID_type_cours+"');" );
	     }
	}

