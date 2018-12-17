package Gestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class eleve {
public eleve(String url, String user, String password,String variable) throws SQLException {
	
	Connection connexion = DriverManager.getConnection(url, user, password);
    java.sql.Statement state = connexion.createStatement();

    
    ResultSet lecture = state.executeQuery( "SELECT eleve.Nom,Prenom,eleve.ID_Groupe,promotion.Nom,promotion.Id_Promotion  FROM eleve,groupe,promotion WHERE promotion.Id_Promotion=groupe.Id_Promotion AND groupe.ID_Groupe=eleve.ID_Groupe AND groupe.Nom='"+variable+ "';" );
    while ( lecture.next() ) {

        String Nom = lecture.getString( "eleve.Nom" );
        String Prenom = lecture.getString( "Prenom" );
        int ID_Groupe=lecture.getInt("eleve.ID_Groupe");
        String NomPromo=lecture.getString("promotion.Nom");
        int Id_Promotion=lecture.getInt("promotion.Id_Promotion");
        
    }

}
}
