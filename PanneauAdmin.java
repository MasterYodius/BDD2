package Gestion;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.JButton;
import javax.swing.JPanel;

public class PanneauAdmin extends JPanel {

	PanneauAdmin(){
	 JButton ListeEleve = new JButton("ListeEleve");
	 this.add(ListeEleve);
	}
		
		
		  public void paintComponent(Graphics g) {
			  

				

			   Graphics2D g2d = (Graphics2D)g;     
			   
			  //colorisation du fond
			   GradientPaint gp = new GradientPaint(0, 0, Color.GRAY, 30, 30, Color.GRAY, true);                

			    g2d.setPaint(gp);

			    g2d.fillRect(0, 0, this.getWidth(), this.getHeight());
			    
			   

				  
				   
				    

		  } 
	}

