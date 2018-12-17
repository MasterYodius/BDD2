package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class suivre {
	suivre(String url, String user, String password) throws SQLException{
		
		Connection connexion = DriverManager.getConnection(url, user, password);
	     java.sql.Statement state = connexion.createStatement();

	    // int modif = state.executeUpdate( "INSERT INTO typecours (ID_type_Cours,type) VALUES ('4', 'DE');" );
	     
	     ResultSet lecture = state.executeQuery( "SELECT ID_Type_Cours, type  FROM typecours;" );


	     /* Récupération des données du résultat de la requête de lecture */

	     while ( lecture.next() ) {

	         int ID_Cours = lecture.getInt( "ID_Cours" );

	         String ID_Groupe = lecture.getString( "ID_Groupe" );

	         //ON RISQUE D'AVOIR UN PB AVEC LES CLEFS ETRANGERES
	         /* Traiter ici les valeurs récupérées. */

	     }
	}

}
