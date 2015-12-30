/* 
	Título: 			ASTUTO. Aplicación web para solicitar tutorías online.
	Alumnas: 			Vanesa González Pérez, Ingeniería Técnica en Informática de Gestión.
			 			María Josefa Aldea Palacios,Ingeniería Técnica en Informática de Gestión.
	Director:			Dr. José Raúl Romero Salguero.
	Fecha creación:		
	Última modificación:
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
