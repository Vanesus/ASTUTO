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
