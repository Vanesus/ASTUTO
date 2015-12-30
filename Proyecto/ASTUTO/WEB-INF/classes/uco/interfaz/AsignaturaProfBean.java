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
import java.util.*;
public class AsignaturaProfBean {
	Vector <String> asignatura = new Vector <String>();
	Vector <Integer> id = new Vector <Integer>();

	int contador;

	public void setAsignatura(String valor, int i){
		asignatura.insertElementAt(valor,i);
	}

	public String getAsignatura(int i){
		return asignatura.elementAt(i);
	}

	public void setId(Integer valor, int i){
		id.insertElementAt(valor,i);
	}

	public Integer getId(int i){
		return id.elementAt(i);
	}
	public void setContador(int valor){
		contador = valor;
	}

	public int getContador(){
		return contador;
	}
}
