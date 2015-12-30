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

import java.sql.Date;
import java.sql.Time;
import java.util.Vector;

public class TrazasAlumnosBean {
	Vector <Integer> idPetTut = new Vector <Integer>();
	Vector <String> actividad = new Vector <String>();
	Vector <String> accion = new Vector <String>();
	Vector <Date> fecha = new Vector <Date>();
	Vector <Time> hora = new Vector <Time>();
	Vector <Date> fechaPeticion = new Vector <Date>();
	Vector <Integer> horaInicio = new Vector <Integer>();
	Vector <Integer> minutosInicio = new Vector <Integer>();
	
	
	public void setPetTut(Integer valor, int i){
		idPetTut.insertElementAt(valor,i);
	}
	public Integer getPetTut(int i){
		return idPetTut.elementAt(i);
	}
	public void setActividad(String valor, int i){
		actividad.insertElementAt(valor,i);
	}
	public String getActividad(int i){
		return actividad.elementAt(i);
	}
	public void setAccion(String valor, int i){
		accion.insertElementAt(valor,i);
	}
	public String getAccion(int i){
		return accion.elementAt(i);
	}
	public void setFecha(Date valor, int i){
		fecha.insertElementAt(valor,i);
	}
	public Date getFecha(int i){
		return fecha.elementAt(i);
	}
	public void setHora(Time valor, int i){
		hora.insertElementAt(valor,i);
	}
	public Time getHora(int i){
		return hora.elementAt(i);
	}
	public void setHoraInicio(Integer valor, int i){
		horaInicio.insertElementAt(valor,i);
	}
	public Integer getHoraInicio(int i){
		return horaInicio.elementAt(i);
	}
	public void setMinutosInicio(Integer valor, int i){
		minutosInicio.insertElementAt(valor,i);
	}
	public Integer getMinutosInicio(int i){
		return minutosInicio.elementAt(i);
	}
	public void setFechaPeticion(Date valor, int i){
		fechaPeticion.insertElementAt(valor,i);
	}
	public Date getFechaPeticion(int i){
		return fechaPeticion.elementAt(i);
	}
	
	
}