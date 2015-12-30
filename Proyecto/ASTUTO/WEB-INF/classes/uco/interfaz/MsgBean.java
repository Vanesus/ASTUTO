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