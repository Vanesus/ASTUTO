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

import java.util.Vector;

public class PeticionTutBean {
	
	Vector <String> motivo = new Vector <String>();
	Vector <Integer> idPeticionTut = new Vector <Integer>();
	Vector <Integer> aceptado = new Vector <Integer>();
	Vector <Integer> dia1 = new Vector <Integer>();
	Vector <Integer> mes1 = new Vector <Integer>();
	Vector <Integer> anyo1 = new Vector <Integer>();
	Vector <Integer> horaInicio1 = new Vector <Integer>();
	Vector <Integer> minutosInicio1 = new Vector <Integer>();
	
	
	Integer dia=null;
	Integer mes=null;
	Integer anyo=null;
	Integer horaInicio=null;
	Integer horaFin=null;
	Integer minutosInicio=null;
	Integer minutosFin=null;
	
	String comentario=null;
	String motivoBorrar=null;
	Integer estado=null;
	
	Integer contador;
	
	public void setMotivo(String valor, int i){
		motivo.insertElementAt(valor,i);
	}

	public String getMotivo(int i){
		return motivo.elementAt(i);
	}
	public void setMotivo(String valor){
		motivoBorrar=valor;
	}

	public String getMotivo(){
		return motivoBorrar;
	}
	public void setComentario(String valor){
		comentario=valor;
	}

	public String getComentario(){
		return comentario;
	}
	public void setDia(Integer valor){
		dia=valor;
	}
	public Integer getDia(){
		return dia;
	}
	public void setMes(Integer valor){
		mes=valor;
	}
	public Integer getMes(){
		return mes;
	}
	public void setAnyo(Integer valor){
		anyo=valor;
	}
	public Integer getAnyo(){
		return anyo;
	}
	public void setHoraInicio(Integer valor){
		horaInicio=valor;
	}

	public Integer getHoraInicio(){
		return horaInicio;
	}
	public void setHoraFin(Integer valor){
		horaFin=valor;
	}
	public Integer getHoraFin(){
		return horaFin;
	}
	public void setMinutosInicio(Integer valor){
		minutosInicio=valor;
	}

	public Integer getMinutosInicio(){
		return minutosInicio;
	}
	public void setMinutosFin(Integer valor){
		minutosFin=valor;
	}

	public Integer getMinutosFin(){
		return minutosFin;
	}
	public void setEstado(Integer valor){
		estado=valor;
	}

	public Integer getEstado(){
		return estado;
	}
	public void setContador(int valor){
		contador = valor;
	}

	public int getContador(){
		return contador;
	}
	public void setAceptado(Integer valor, int i){
		aceptado.insertElementAt(valor,i);
	}

	public Integer getAceptado(int i){
		return aceptado.elementAt(i);
	}
	public void setId(Integer valor, int i){
		idPeticionTut.insertElementAt(valor,i);
	}

	public Integer getId(int i){
		return idPeticionTut.elementAt(i);
	}
	public void setDia1(Integer valor, int i){
		dia1.insertElementAt(valor,i);
	}

	public Integer getDia1(int i){
		return dia1.elementAt(i);
	}
	public void setMes1(Integer valor, int i){
		mes1.insertElementAt(valor,i);
	}

	public Integer getMes1(int i){
		return mes1.elementAt(i);
	}
	public void setAnyo1(Integer valor, int i){
		anyo1.insertElementAt(valor,i);
	}

	public Integer getAnyo1(int i){
		return anyo1.elementAt(i);
	}
	public void setHora(Integer valor, int i){
		horaInicio1.insertElementAt(valor,i);
	}

	public Integer getHora(int i){
		return horaInicio1.elementAt(i);
	}
	public void setMinutos(Integer valor, int i){
		minutosInicio1.insertElementAt(valor,i);
	}

	public Integer getMinutos(int i){
		return minutosInicio1.elementAt(i);
	}
	
	
	
}
