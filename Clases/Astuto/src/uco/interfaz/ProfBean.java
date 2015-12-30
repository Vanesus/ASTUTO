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

public class ProfBean {
	Vector <Integer> idProf = new Vector <Integer>();
	Vector <String> nombre = new Vector <String>();
	Vector <String> apellidos = new Vector <String>();
	String asignatura[][] = new String [500][500];
	String titulacion[][] = new String [500][500];
	Integer idAsignatura[][] = new Integer [500][500];
	Integer contador;
	Vector <Integer> contadorAsig = new Vector <Integer>();
	Vector <String> login = new Vector <String>();
	
	public void setLogin(String valor, int i){
		login.insertElementAt(valor,i);
	}
	public String getLogin(int i){
		return login.elementAt(i);
	}
	public void setId(int valor, int i){
		idProf.insertElementAt(valor,i);
	}
	public Integer getId(int i){
		return idProf.elementAt(i);
	}	
	public void setNombre(String valor, int i){
		nombre.insertElementAt(valor,i);
	}
	public String getNombre(int i){
		return nombre.elementAt(i);
	}
	public void setApellidos(String valor, int i){
		apellidos.insertElementAt(valor,i);
	}
	public String getApellidos(int i){
		return apellidos.elementAt(i);
	}
	public void setIdAsignatura(int valor, int i,int j){
		idAsignatura[i][j]=valor;
	}
	public Integer getIdAsignatura(int i,int j){
		return idAsignatura[i][j];
	}
	public void setAsignatura(String valor, int i, int j){
		asignatura[i][j]=valor;
	}
	public String getAsignatura(int i,int j){
		return asignatura[i][j];
	}
	public void setTitulacion(String valor, int i, int j){
		titulacion[i][j]=valor;
	}
	public String getTitulacion(int i,int j){
		return titulacion[i][j];
	}
	public void setContador(int valor){
		contador = valor;
	}

	public int getContador(){
		return contador;
	}
	public void setContadorAsig(int valor, int i){
		contadorAsig.insertElementAt(valor,i);
	}

	public int getContadorAsig(int i){
		return contadorAsig.elementAt(i);
	}
}
