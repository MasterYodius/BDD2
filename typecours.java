package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class typecours  {
	
	
	typecours(String url, String user, String password,String variable) throws SQLException{
		
		Connection connexion = DriverManager.getConnection(url, user, password);
	     java.sql.Statement state = connexion.createStatement();

	     
	     ResultSet lecture = state.executeQuery( "SELECT ID_Type_Cours  FROM typecours WHERE Type='"+variable+ "';" );


	     /* R�cup�ration des donn�es du r�sultat de la requ�te de lecture */

	     while ( lecture.next() ) {

	         int ID_type_Cours = lecture.getInt( "ID_type_Cours" );

	        // String Type = lecture.getString( "Type" );


	         /* Traiter ici les valeurs r�cup�r�es. */


	     }
	}

}
