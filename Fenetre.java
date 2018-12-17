package Gestion;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Fenetre extends JFrame {

	  CardLayout cl = new CardLayout();

	  JPanel content = new JPanel();

	  //Liste des noms de nos conteneurs pour la pile de cartes

	  String[] listContent = {"CARD_1", "CARD_2", "CARD_3", "CARD_4"};

	  int indice = 0;
	  
 Fenetre() {
	 
	
		//Définit un titre pour notre fenêtre
		this.setTitle("Systeme de gestion des Planning");
	
	    //Définit sa taille : 400 pixels de large et 100 pixels de haut
	    this.setSize(1500, 500);
	
	    //Nous demandons maintenant à notre objet de se positionner au centre
	    this.setLocationRelativeTo(null);
	
	    //Garde toujours au premier plan
	    this.setAlwaysOnTop(true);
	    
	    //Termine le processus lorsqu'on clique sur la croix rouge
	    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    

			
	    //le premier conteneur prend un objet panneau
	    
	    JPanel card1 = new Panneau();
	    
	  //  JPanel card2 = new PanneauAdmin();
	    
	    JPanel card3 = new JPanel();
	    card3.setBackground(Color.green);
	    
	    JPanel card4 = new JPanel ();
	    card4.setBackground(Color.yellow);

	    JPanel boutonPane = new JPanel();
	 
	    
	    JButton Menu = new JButton ("Menu");
	    
	    //le bouton Men retourne au menu principal
	    Menu.addActionListener(new ActionListener() {
	    	public void actionPerformed(ActionEvent event) {
	    		cl.show(content, listContent[0]);
	    	}
	    	
	    });

	    
	    //Interface de base de la fenêtre mère
	    boutonPane.add(Menu);
	    

	    
	    //On définit le layout
	    content.setLayout(cl);
	    //On ajoute les cartes à la pile avec un nom pour les retrouver
	    content.add(card1, listContent[0]);
	  //  content.add(card2, listContent[1]);
	    content.add(card3, listContent[2]);
	    content.add(card4, listContent[3]);
	    
	    
	    //Emplacement 
	    this.getContentPane().add(boutonPane, BorderLayout.SOUTH);
	    this.getContentPane().add(content, BorderLayout.CENTER);
	    
	 
	       
	  
	    
	    //Et enfin, la rendre visible       
		this.setVisible(false);
	}
}
