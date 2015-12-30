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
