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
public class CentroBean {

String centro[]=new String [50];
Integer id_centro []=new Integer [50];
Integer orden[]=new Integer [50];


int contador;

public void setCentro(String valor, int i){
	centro[i]=valor;
}

public String getCentro(int i){
	return centro[i];
}

public void setId(Integer valor, int i){
	id_centro[i]=valor;
}

public Integer getId(int i){
	return id_centro[i];
}

public void setOrden(Integer valor, int i){
	orden[i]=valor;
}

public Integer getOrden(int i){
	return orden[i];
}

public void setContador(int valor){
	contador = valor;
}

public int getContador(){
	return contador;
}
}