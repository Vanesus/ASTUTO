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

public class MsgBean {
	String mensaje = "";
	String Url = "";
	
	public void setMsg (String valor){
		this.mensaje = valor;
	}
	
	public String getMsg (){
		return this.mensaje;	
	}
	public void setUrl (String valor){
		this.Url = valor;
	}
	
	public String getUrl (){
		return this.Url;	
	}
}