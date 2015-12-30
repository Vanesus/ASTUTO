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

public class UserBean{

  private Integer rol =null;
  private String user = "";
  private String login= "";
  private String contrasena= "";
  private Integer id =null;
  

  
  public void setRol(Integer valor){
	this.rol = valor;
  }

  public Integer getRol(){
  	return this.rol;
  }

  public void setUser(String valor){
  	this.user = valor;
  }

  public String getUser(){
  	return this.user;
  }
  
  public void setLogin(String valor){
	 this.login = valor;
  }

  public String getLogin(){
	 return this.login;
  }
  
  public void setContrasena(String valor){
	 this.contrasena = valor;
  }

  public String getContrasena(){
	 return this.contrasena;
  }
public void setId(Integer valor){
	 this.id = valor;
 }

 public Integer getId(){
	 return this.id;
 }

}
