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

public class DatosProfBean {
	String nombre[][]= new String[20][20];
    String apellidos[][]= new String[50][50];
    Integer idProf[][]= new Integer[4][4];
    Integer contador[]=new Integer [4];
    

    
	
	
	public void setNombre(String valor,int i, int j){
		this.nombre[i][j] = valor;
	}

	public String getNombre(int i, int j){
	    return this.nombre[i][j];
	}
	public void setApellidos(String valor,int i, int j){
		this.apellidos[i][j] = valor;
	}

	public String getApellidos(int i, int j){
		 return this.apellidos[i][j];
	}
	
	public void setId(Integer valor,int i, int j){
		this.idProf[i][j] = valor;
	}

	public Integer getId(int i, int j){
		 return this.idProf[i][j];
	}
	
	public void setContador(int valor, int i){
		this.contador[i] = valor;
	}

	public Integer getContador(int i){
		return this.contador[i];
	}
	  
}
