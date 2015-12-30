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
