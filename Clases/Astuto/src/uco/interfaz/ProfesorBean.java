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

public class ProfesorBean {
	String nombre=null;
    String apellidos=null;
    String localizacion=null;
    String email=null;
    String perfilPub=null;
    Integer id=null;
	
    public void setId(Integer valor){
	  	this.id = valor;
	}
	public Integer getId(){
	  	return this.id;
	}    
    public void setNombre(String valor){
	  	this.nombre = valor;
	}
	public String getNombre(){
	  	return this.nombre;
	}
	public void setApellidos(String valor){
		this.apellidos = valor;
    }
    public String getApellidos(){
		return this.apellidos;
    }
    public void setEmail(String valor){
	  	this.email = valor;
	}

	public String getEmail(){
	  	return this.email;
	}
	public void setLoc(String valor){
		this.localizacion = valor;
    }
    public String getLoc(){
		return this.localizacion;
    }
    public void setPerfPub(String valor){
		this.perfilPub = valor;
    }
    public String getPerfPub(){
		return this.perfilPub;
    }
		  
}
