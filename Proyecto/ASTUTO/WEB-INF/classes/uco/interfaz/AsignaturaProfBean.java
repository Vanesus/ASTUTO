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
import java.util.*;
public class AsignaturaProfBean {
	Vector <String> asignatura = new Vector <String>();
	Vector <Integer> id = new Vector <Integer>();

	int contador;

	public void setAsignatura(String valor, int i){
		asignatura.insertElementAt(valor,i);
	}

	public String getAsignatura(int i){
		return asignatura.elementAt(i);
	}

	public void setId(Integer valor, int i){
		id.insertElementAt(valor,i);
	}

	public Integer getId(int i){
		return id.elementAt(i);
	}
	public void setContador(int valor){
		contador = valor;
	}

	public int getContador(){
		return contador;
	}
}
