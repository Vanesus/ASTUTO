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
