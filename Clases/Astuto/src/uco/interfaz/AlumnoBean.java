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

import java.util.Vector;

public class AlumnoBean {
	
	Integer idAlumno =null;
	String correo = "";
	String nombre= "";
	Vector <Integer> id = new Vector <Integer>();
	Vector <String> nombres = new Vector <String>();
	Vector <String> correos = new Vector <String>();
	Vector <String> aux = new Vector <String>();
	
	Integer contador;
	

	  
	  public void setId(Integer valor){
		this.idAlumno = valor;
	  }

	  public Integer getId(){
	  	return this.idAlumno;
	  }

	  public void setNombre(String valor){
	  	this.nombre = valor;
	  }

	  public String getNombre(){
	  	return this.nombre;
	  }
	  
	  public void setCorreo(String valor){
		  	this.correo = valor;
		  }

	  public String getCorreo(){
		  	return this.correo;
	  }
		  
	  public void setId(int valor, int i){
		id.insertElementAt(valor,i);
	  }
	  public Integer getId(int i){
		 return id.elementAt(i);
	  }	
      public void setNombre(String valor, int i){
		nombres.insertElementAt(valor,i);
	  }
	  public String getNombre(int i){
		return nombres.elementAt(i);
	  }
	  public void setCorreo(String valor, int i){
			correos.insertElementAt(valor,i);
	  }
	  public String getCorreo(int i){
		return correos.elementAt(i);
	  }
	  public void setContador(Integer valor){
		this.contador = valor;
	  }

	  public Integer getContador(){
		  return this.contador;
	  }
	  public void setAux(String valor, int i){
			aux.insertElementAt(valor,i);
	  }
	  public String getAux(int i){
		 return aux.elementAt(i);
	  }	

}
