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
public class TitulacionBean {

int contador[] = new int[50];
String matrizTit[][]=new String[50][50];
Integer matrizId[][]=new Integer[50][50];
Integer matrizOrden[][]=new Integer[50][50];

public void setTitulacion(String valor, int i, int j){
	matrizTit[i][j] = valor;
}
public String getTitulacion(int i,int j){
	return matrizTit[i][j];
}
public void setId(Integer valor, int i, int j){
	matrizId[i][j] = valor;
}
public Integer getId(int i,int j){
	return matrizId[i][j];
}
public void setOrden(Integer valor, int i, int j){
	matrizOrden[i][j] = valor;
}
public Integer getOrden(int i,int j){
	return matrizOrden[i][j];
}

public void setContador(int valor, int i){
	contador[i]=valor;
}

public int getContador(int i){
	return contador[i];
}
}