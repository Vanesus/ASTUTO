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
public class CursoBean {
	Integer matrizCont[][]=new Integer[100][100];
	String matrizCurso[][][]=new String [100][100][100];
	Integer matrizId[][][]=new Integer[100][100][100];
	Integer matrizOrden[][][]=new Integer[100][100][100];

	public void setCurso(String valor, int i, int j, int k){
		matrizCurso[i][j][k] = valor;
	}
	public String getCurso(int i,int j, int k){
		return matrizCurso[i][j][k];
	}
	public void setId(Integer valor, int i, int j, int k){
		matrizId[i][j][k] = valor;
	}
	public Integer getId(int i,int j, int k){
		return matrizId[i][j][k];
	}
	public void setOrden(Integer valor, int i, int j, int k){
		matrizOrden[i][j][k] = valor;
	}
	public Integer getOrden(int i,int j, int k){
		return matrizOrden[i][j][k];
	}

	public void setContador(int valor, int i, int j){
		matrizCont[i][j] = valor;
	}
	
	public int getContador(int i, int j){
		return matrizCont[i][j];
	}
}
