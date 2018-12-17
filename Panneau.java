package Gestion;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JPanel;


public class Panneau extends JPanel {
	
	Panneau(){
		  CardLayout cl = new CardLayout();

		  JPanel content = new JPanel();
		
	    JButton Admin = new JButton("Admin");
	    this.add(Admin);
	//    Définition de l'action du bouton Admin
	    Admin.addActionListener(new ActionListener(){
	      public void actionPerformed(ActionEvent event){
	    	JPanel corps= new PanneauAdmin();
	    	
	      }
	    });
	    
	    
	    JButton Prof = new JButton ("Prof");
		//Definition action du bouton Prof	
	    Prof.addActionListener(new ActionListener(){
		      public void actionPerformed(ActionEvent event){				
		        
		        //Via cette instruction, on passe au conteneur correspondant au nom fourni en paramètre
		       // cl.show(content, listContent[2]);
		      }
		    });
	    this.add(Prof);
	    
	    
	    JButton Eleve = new JButton("Eleve");
	    //Définition de l'action du bouton Eleve
	    Eleve.addActionListener(new ActionListener(){
	      public void actionPerformed(ActionEvent event){				
	        
	        //Via cette instruction, on passe au conteneur correspondant au nom fourni en paramètre
	    	 //cl.show(content, listContent[3]);
	      }
	    });
	    this.add(Eleve);
	    
	    
	}
	

		  public void paintComponent(Graphics g) {
			  

			

			   Graphics2D g2d = (Graphics2D)g;     
			   
			  //colorisation du fond
			   GradientPaint gp = new GradientPaint(0, 0, Color.pink, 30, 30, Color.pink, true);                

			    g2d.setPaint(gp);

			    g2d.fillRect(0, 0, this.getWidth(), this.getHeight());
			    
			    //affichage du mot colore
			    Font font = new Font("Courier", Font.BOLD, 20);

				    g.setFont(font);

				   g.setColor(Color.blue); 
				   g.drawString("Selectionnez votre profil", 10, 20);
		  } 
		  
}

