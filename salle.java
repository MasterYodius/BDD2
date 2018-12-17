package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class salle {

	salle(String url, String user, String password,String variable) throws SQLException{
		
		Connection connexion = DriverManager.getConnection(url, user, password);
	     java.sql.Statement state = connexion.createStatement();

	     
	     ResultSet lecture = state.executeQuery( "SELECT Id_Salel  FROM salle WHERE Nom='"+variable+ "';" );


	     /* Récupération des données du résultat de la requête de lecture */

	     while ( lecture.next() ) {

	          int Id_Salel = lecture.getInt( "Id_Salel" );
	         //String Nom = lecture.getString( "Nom" );
	         //int NbPlace = lecture.getInt( "NbPlace" );
	         //String Type_salle = lecture.getString( "Type_salle" );



	         /* Traiter ici les valeurs récupérées. */

	         
	     }
	}
}
