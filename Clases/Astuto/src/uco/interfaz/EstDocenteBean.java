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
