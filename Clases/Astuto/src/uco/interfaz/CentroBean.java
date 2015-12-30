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