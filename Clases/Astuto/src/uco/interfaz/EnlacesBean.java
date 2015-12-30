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


public class EnlacesBean {
	Vector <String> nombre = new Vector <String>();
	Vector <String> url = new Vector <String>();
	Integer contador=null;
	
	public void setNombre(String valor, int i){
		nombre.insertElementAt(valor,i);
	}

	public String getNombre(int i){
		return nombre.elementAt(i);
	}
	public void setUrl(String valor, int i){
		url.insertElementAt(valor,i);
	}

	public String getUrl(int i){
		return url.elementAt(i);
	}
	public void setContador(Integer valor){
		contador=valor;
	}

	public Integer getContador(){
		return contador;
	}
	
}
