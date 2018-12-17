package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class groupe {
	
		public groupe(String url, String user, String password,String NomGroupe,String NomPromo) throws SQLException {
			
			Connection connexion = DriverManager.getConnection(url, user, password);
		    java.sql.Statement state = connexion.createStatement();

		    
		    ResultSet lecture = state.executeQuery( "SELECT eleve.Nom,Prenom,eleve.ID_Groupe,groupe.Nom,promotion.Id_Promotion  FROM eleve,groupe,promotion WHERE groupe.Id_promotion=promotion.Id_promotion AND groupe.ID_Groupe=eleve.ID_Groupe AND groupe.Nom='"+NomGroupe+ "' AND promotion.Nom='"+NomPromo+"';" );
		    while ( lecture.next() ) {

		        String Nom = lecture.getString( "eleve.Nom" );
		        String Prenom = lecture.getString( "Prenom" );
		        int ID_Groupe=lecture.getInt("eleve.ID_Groupe");
		        String Nom_Groupe=lecture.getString("groupe.Nom");
		        int Id_Promotion=lecture.getInt("promotion.Id_Promotion");
		        
		    }

		}
}
