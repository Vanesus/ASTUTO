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
	
public class EstDocenteBean {
	
	String curso=null;
	String titulacion=null;
	String centro=null;
	String nombre =null;
	Integer idAntes=null;
	
	public void setNombreCurso(String valor){
	  	this.curso = valor;
	}
	public String getNombreCurso(){
	  	return this.curso;
	}
	public void setNombreTit(String valor){
		this.titulacion = valor;
    }
    public String getNombreTit(){
		return this.titulacion;
    }
    public void setNombreCentro(String valor){
	  	this.centro = valor;
	}
    public String getNombreCentro(){
    	return this.centro;
	}
    
    public void setNombre(String valor){
	  	this.nombre = valor;
	}
	public String getNombre(){
	  	return this.nombre;
	}
	public void setIdAntes(Integer valor){
	  	this.idAntes = valor;
	}
	public Integer getIdAntes(){
	  	return this.idAntes;
	}
}
