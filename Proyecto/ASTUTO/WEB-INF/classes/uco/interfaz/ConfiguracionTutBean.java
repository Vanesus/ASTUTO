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
import java.util.Date;
import java.util.Vector;

public class ConfiguracionTutBean {
	
	Vector <Integer> dia = new Vector <Integer>();
	Vector <Integer> horaInicio = new Vector <Integer>();
	Vector <Integer> horaFin = new Vector <Integer>();
	Vector <Integer> minutosInicio = new Vector <Integer>();
	Vector <Integer> minutosFin = new Vector <Integer>();
	Vector <Integer> idAsignatura = new Vector <Integer>();
	Vector <Integer> idProfesor = new Vector <Integer>();
	Vector <Integer> idConfiguracionTut = new Vector <Integer>();
	Vector <Integer> asignacion = new Vector <Integer>();
	Vector <Integer> slot = new Vector <Integer>();
	Vector <Date> fechaInicio = new Vector <Date>();
	Vector <Date> fechaFin = new Vector <Date>();
	Vector <Integer> metodoAsignacion = new Vector <Integer>();
	Vector <Integer> tiempoMaxEspera = new Vector <Integer>();
	Vector <Integer> previsionMinima = new Vector <Integer>();
	Vector <Integer> nAusencias = new Vector <Integer>();
	
	
	Integer contador=null;
	
	public void setFechaInicio(Date valor, int i){
		fechaInicio.insertElementAt(valor,i);
	}

	public Date getFechaInicio(int i){
		return fechaInicio.elementAt(i);
	}
	public void setFechaFin(Date valor, int i){
		fechaFin.insertElementAt(valor,i);
	}

	public Date getFechaFin(int i){
		return fechaFin.elementAt(i);
	}
	public void setDia(Integer valor, int i){
		dia.insertElementAt(valor,i);
	}

	public Integer getDia(int i){
		return dia.elementAt(i);
	}
	public void setSlot(Integer valor, int i){
		slot.insertElementAt(valor,i);
	}

	public Integer getSlot(int i){
		return slot.elementAt(i);
	}
	public void setHoraInicio(Integer valor, int i){
		horaInicio.insertElementAt(valor,i);
	}

	public Integer getHoraInicio(int i){
		return horaInicio.elementAt(i);
	}
	public void setHoraFin(Integer valor, int i){
		horaFin.insertElementAt(valor,i);
	}

	public Integer getHoraFin(int i){
		return horaFin.elementAt(i);
	}
	public void setIdAsig(Integer valor, int i){
		idAsignatura.insertElementAt(valor,i);
	}
	public void setMinutosInicio(Integer valor, int i){
		minutosInicio.insertElementAt(valor,i);
	}
	public Integer getMinutosInicio(int i){
		return minutosInicio.elementAt(i);
	}
	public void setMinutosFin(Integer valor, int i){
		minutosFin.insertElementAt(valor,i);
	}

	public Integer getMinutosFin(int i){
		return minutosFin.elementAt(i);
	}
	

	public Integer getIdAsig(int i){
		return idAsignatura.elementAt(i);
	}
	public void setIdProfesor(Integer valor, int i){
		idProfesor.insertElementAt(valor,i);
	}

	public Integer getIdProfesor(int i){
		return idProfesor.elementAt(i);
	}
	public void setIdConfTut(Integer valor, int i){
		idConfiguracionTut.insertElementAt(valor,i);
	}

	public Integer getIdConfTut(int i){
		return idConfiguracionTut.elementAt(i);
	}
	public void setAsignacion(Integer valor, int i){
		asignacion.insertElementAt(valor,i);
	}

	public Integer getAsignacion(int i){
		return asignacion.elementAt(i);
	}
	
	public void setContador(Integer valor){
		contador=valor;
	}

	public Integer getContador(){
		return contador;
	}
	public void setMetodo(Integer valor, int i){
		metodoAsignacion.insertElementAt(valor,i);
	}
	public Integer getMetodo(int i){
		return metodoAsignacion.elementAt(i);
	} 
	public void setTiempoEspera(Integer valor, int i){
		tiempoMaxEspera.insertElementAt(valor,i);
	}
	public Integer getTiempoEspera(int i){
		return tiempoMaxEspera.elementAt(i);
	}
	public void setPrevisionMinima(Integer valor, int i){
		previsionMinima.insertElementAt(valor,i);
	}
	public Integer getPrevisionMinima(int i){
		return previsionMinima.elementAt(i);
	}
	public void setNAusencias(Integer valor, int i){
		nAusencias.insertElementAt(valor,i);
	}
	public Integer getNAusencias(int i){
		return nAusencias.elementAt(i);
	} 

}
