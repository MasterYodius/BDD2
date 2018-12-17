package Gestion;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.StringTokenizer;

import com.mysql.jdbc.ResultSetMetaData;
import com.mysql.jdbc.Statement;

public class Connect {

  public static void main(String[] args) {      

    try {

      Class.forName("com.mysql.jdbc.Driver");

      System.out.println("Driver O.K.");
      String url = "jdbc:mysql://localhost:3306/projet";

      String user = "root";

      String passwd = "";


    Connection connexion = DriverManager.getConnection(url, user, passwd);

     System.out.println("Connexion effective !");         

		//Fenetre fenetre = new Fenetre();
		//Panneau pan = new Panneau();
		
		
		//Cr�ation d'un objet Statement

	      java.sql.Statement state = connexion.createStatement();

	      //L'objet ResultSet contient le r�sultat de la requete SQL

	     // ResultSet result = state.executeQuery("SELECT * FROM cours");
	      //String variable='E15';


		     ResultSet lecture = state.executeQuery( "SELECT Id_Salel  FROM salle WHERE Nom='E15';" );


		     /* R�cup�ration des donn�es du r�sultat de la requ�te de lecture */

//		     
	      //On r�cup�re les MetaData

	      ResultSetMetaData resultMeta = (ResultSetMetaData) lecture.getMetaData();
//
//	         
//
	      System.out.println("\n**********************************");
////
////	      //On affiche le nom des colonnes
////
	      for(int i = 1; i <= resultMeta.getColumnCount(); i++)
////
	        System.out.print("\t" + resultMeta.getColumnName(i).toUpperCase() + "\t *");
////
////	         
////
	      System.out.println("\n**********************************");
////
////	         
////
	      while(lecture.next()){         
	        for(int i = 1; i <= resultMeta.getColumnCount(); i++)
////
	          System.out.print("\t" + lecture.getObject(i).toString() + "\t |");
////
	        System.out.println("\n---------------------------------");
//
	      }
//

	      //execution requete d'ecriture, ajout d'une ligne dans une table de la BDD
	    /// int statut = state.executeUpdate( "INSERT INTO typecours (ID_type_Cours,type) VALUES ('4', 'DE');" );
	      

		
		
	
		         lecture.close();
		      state.close();
}
		
     catch (Exception e) {

      e.printStackTrace();

    }      finally {}
    
  } 
}

