package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class professeur {

professeur(String url, String user, String password,String variable) throws SQLException{
		
		Connection connexion = DriverManager.getConnection(url, user, password);
	     java.sql.Statement state = connexion.createStatement();

	     
	     ResultSet lecture = state.executeQuery( "SELECT MatriculeP  FROM professeur WHERE Nom='"+variable+ "';" );


	     /* Récupération des données du résultat de la requête de lecture */

	     while ( lecture.next() ) {

	         int MatriculeP = lecture.getInt( "MatriculeP" );

	        // String Nom = lecture.getString( "Nom" );
	       //  String Prenom = lecture.getInt( "Prenom" );
	         //int NumRue=lecture.getInt("NumRue");
	         //String NomRue = lecture.getString( "NomRue" );
	         //int CodePostal=lecture.getInt("CodePostal");
	         // String Ville=lecture.getString("Ville");
	         //int TelDom=lecture.getInt("TelDom");
	         //int TelMobile=lecture.getInt("TelMobile");
	         //String Email=lecture.getString("Email");



	         /* Traiter ici les valeurs récupérées. */


	     }
	}
}
