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
