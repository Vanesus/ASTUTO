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

public class AsignaturaBean {


int contador=0;
String nombre[]=new String [200];
int idAsig[]=new int [200];
String nombreAsig="";
String nombreCurso="";
String nombreTit="";

int idEstDocente[]=new int [200];

String curso[]=new String[200];
String titulacion[]=new String[200];

public void setNombreAsig(String valor){
	this.nombreAsig = valor;
 }

public String getNombreAsig(){
	 return this.nombreAsig;
 }
public void setNombreCurso(String valor){
	this.nombreCurso = valor;
 }

public String getNombreCurso(){
	 return this.nombreCurso;
 }
public void setNombreTit(String valor){
	this.nombreTit = valor;
 }

public String getNombreTit(){
	 return this.nombreTit;
 }
	
public void setId(int valor,int i){
	this.idAsig[i] = valor;
  }

  public Integer getId(int i){
  	return this.idAsig[i];
  }
  
  public void setNombre(String valor,int i){
		this.nombre[i] = valor;
	  }

  public String getNombre(int i){
	  	return this.nombre[i];
	  }
 
  public void setIdEstDocente(int valor,int i){
		this.idEstDocente[i] = valor;
	  }

	  public Integer getIdEstDocente(int i){
	  	return this.idEstDocente[i];
	  }
	  
public void setCurso(String valor,int i){
      this.curso[i]=valor;
    }
public String getCurso(int i){
	    return this.curso[i];
}
public void setTitulacion(String valor,int i){
    this.titulacion[i]=valor;
  }
public String getTitulacion(int i){
	    return this.titulacion[i];
}  
  public void setContador(int valor){
		this.contador = valor;
	}

  public int getContador(){
		return this.contador;
	}
 
}
