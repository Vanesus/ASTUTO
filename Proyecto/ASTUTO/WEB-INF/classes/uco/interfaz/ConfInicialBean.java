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

import java.util.Vector;

public class ConfInicialBean {
	Vector <String> motivo = new Vector <String>();
	Vector <String> asunto = new Vector <String>();
	Vector <String> enlace = new Vector <String>();
	Integer slot=null;
	Integer metodo=null;
	Integer tiempoEspera=null;
	Integer nAusencias=null;
	Integer previsionMinima=null;

	public void setMotivo(String valor, int i){
		motivo.insertElementAt(valor,i);
	}

	public String getMotivo(int i){
		return motivo.elementAt(i);
	}
	public void setAsunto(String valor, int i){
		asunto.insertElementAt(valor,i);
	}

	public String getAsunto(int i){
		return asunto.elementAt(i);
	}
	public void setEnlace(String valor, int i){
		enlace.insertElementAt(valor,i);
	}

	public String getEnlace(int i){
		return enlace.elementAt(i);
	}
	
	public void setSlot(Integer valor){
		this.slot = valor;
	 }

	public Integer getSlot(){
		 return this.slot;
	 }
	public void setMetodo(Integer valor){
		this.metodo = valor;
	 }

	public Integer getMetodo(){
		 return this.metodo;
	 }
	public void setTiempoEspera(Integer valor){
		this.tiempoEspera = valor;
	 }

	public Integer getTiempoEspera(){
		 return this.tiempoEspera;
	 }
	public void setPrevisionMinima(Integer valor){
		this.previsionMinima = valor;
	 }

	public Integer getPrevisionMinima(){
		 return this.previsionMinima;
	 }
	public void setNAusencias(Integer valor){
		this.nAusencias = valor;
	 }

	public Integer getNAusencias(){
		 return this.nAusencias;
	 }
}
