/* 
	T�tulo: 			ASTUTO. Aplicaci�n web para solicitar tutor�as online.
	Alumnas: 			Vanesa Gonz�lez P�rez, Ingenier�a T�cnica en Inform�tica de Gesti�n.
			 			Mar�a Josefa Aldea Palacios,Ingenier�a T�cnica en Inform�tica de Gesti�n.
	Director:			Dr. Jos� Ra�l Romero Salguero.
	Fecha creaci�n:		
	�ltima modificaci�n:
	Historial:
		v1.0 Inicial
*/
package uco.interfaz;

public class CorreoBean {
	String emisor = "astutouco@gmail.com";
	String contrasena="proyectoastuto";
	String receptor = "";
	String motivo="";
	String asunto="";
	String enlace="";
	
	
	public void setEmisor (String valor){
		this.emisor = valor;
	}
	
	public String getEmisor (){
		return this.emisor;	
	}
	public void setContrasena (String valor){
		this.contrasena = valor;
	}
	
	public String getContrasena (){
		return this.contrasena;	
	}
	
	public void setReceptor (String valor){
		this.receptor = valor;
	}
	
	public String getReceptor (){
		return this.receptor;	
	}
	public void setMotivo (String valor){
		this.motivo = valor;
	}
	
	public String getMotivo (){
		return this.motivo;	
	}
	public void setAsunto (String valor){
		this.asunto = valor;
	}
	
	public String getAsunto (){
		return this.asunto;	
	}
	public void setEnlace (String valor){
		this.enlace = valor;
	}
	
	public String getEnlace (){
		return this.enlace;	
	}
}
