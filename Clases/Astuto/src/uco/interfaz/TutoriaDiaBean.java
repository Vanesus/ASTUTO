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
public class TutoriaDiaBean {
	Vector<Integer> id=new Vector<Integer>();
	Vector<String> nombreProf= new Vector<String>();
	Vector<String> nombreAlumno= new Vector<String>();
	Vector<String> correoAlumno= new Vector<String>();
	Vector<String>asignatura= new Vector<String>();
	Vector<String> motivo=new Vector<String>();
	Vector<Integer> estado=new Vector<Integer>();
	Vector<Integer> dia=new Vector<Integer>();
	Vector<Integer> mes=new Vector<Integer>();
	Vector<Integer> anyo=new Vector<Integer>();
	Vector<Integer> horaInicio=new Vector<Integer>();
	Vector<Integer> minutosInicio=new Vector<Integer>();
	Vector<Integer> horaFin= new Vector<Integer>();
	Vector<Integer> minutosFin= new Vector<Integer>();
	Vector<String> comentarioProfesor=new Vector<String>();
	Vector <Integer> nAusencias = new Vector <Integer>();
	Integer contador=0;
	
	public void setId(Integer valor, int i){
		id.insertElementAt(valor,i);
    }
    public Integer getId(int i){
		return id.elementAt(i);
	  }
	 public void setnombreProf(String valor, int i){
			nombreProf.insertElementAt(valor,i);
	  }
	 public String getnombreProf(int i){
			return nombreProf.elementAt(i);
		  }
	 public void setnombreAlumno(String valor, int i){
			nombreAlumno.insertElementAt(valor,i);
	  }
	 public String getnombreAlumno(int i){
			return nombreAlumno.elementAt(i);
		  }
	 public void setcorreoAlumno(String valor, int i){
			correoAlumno.insertElementAt(valor,i);
	  }
	 public String getcorreoAlumno(int i){
			return correoAlumno.elementAt(i);
		  }
	 public void setAsignatura(String valor, int i){
			asignatura.insertElementAt(valor,i);
	  }
	 public String getAsignatura(int i){
			return asignatura.elementAt(i);
		  }
	 public void setMotivo(String valor, int i){
			motivo.insertElementAt(valor,i);
	  }
	 public String getMotivo(int i){
			return motivo.elementAt(i);
		  }
	 public void setEstado(Integer valor, int i){
			estado.insertElementAt(valor,i);
	  }
	 public Integer getEstado(int i){
			return estado.elementAt(i);
		  }
	 public void setDia(Integer valor, int i){
			dia.insertElementAt(valor,i);
	  }
	 public Integer getDia(int i){
			return dia.elementAt(i);
		  }
	 public void setMes(Integer valor, int i){
			mes.insertElementAt(valor,i);
	  }
	 public Integer getMes(int i){
			return mes.elementAt(i);
		  }
	 public void setAnyo(Integer valor, int i){
			anyo.insertElementAt(valor,i);
	  }
	 public Integer getAnyo(int i){
			return anyo.elementAt(i);
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
	 public void setHoraFin(Integer valor, int i){
			horaFin.insertElementAt(valor,i);
	  }
	 public Integer getHoraFin(int i){
			return horaFin.elementAt(i);
		  }
	 public void setMinutosFin(Integer valor, int i){
			minutosFin.insertElementAt(valor,i);
	  }
	 public Integer getMinutosFin(int i){
			return minutosFin.elementAt(i);
		  }
	 public void setComentarioProfesor(String valor, int i){
			comentarioProfesor.insertElementAt(valor,i);
	  }
	 public String getComentarioProfesor(int i){
			return comentarioProfesor.elementAt(i);
		  }
	 public void setNAusencias(Integer valor, int i){
			nAusencias.insertElementAt(valor,i);
		}
		public Integer getNAusencias(int i){
			return nAusencias.elementAt(i);
		} 
	 public void setContador(Integer valor){
			this.contador = valor;
		  }

	 public Integer getContador(){
			  return this.contador;
		  }
}
