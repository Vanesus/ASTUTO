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
public class CalendarioBean {
	
		Vector<Integer> id=new Vector<Integer>();
		Vector<Integer> dInicio= new Vector<Integer>();
		Vector<Integer> mInicio= new Vector<Integer>();
		Vector<Integer> aInicio= new Vector<Integer>();
		Vector<Integer> dFin= new Vector<Integer>();
		Vector<Integer> mFin= new Vector<Integer>();
		Vector<Integer> aFin= new Vector<Integer>();
		Vector<Integer> tipo= new Vector<Integer>();
		Integer contador=0;
		
		public void setId(Integer valor, int i){
			id.insertElementAt(valor,i);
	    }
	    public Integer getId(int i){
			return id.elementAt(i);
		  }
		public void setdInicio(Integer valor, int i){
			dInicio.insertElementAt(valor,i);
	    }
		 public Integer getdInicio(int i){
			return dInicio.elementAt(i);
	    }
		public void setmInicio(Integer valor, int i){
			mInicio.insertElementAt(valor,i);
		}
	    public Integer getmInicio(int i){
			return mInicio.elementAt(i);
		  }	
		public void setaInicio(Integer valor, int i){
			aInicio.insertElementAt(valor,i);
	    }
	    public Integer getaInicio(int i){
			return aInicio.elementAt(i);
		  }
	    public Integer getdFin(int i){
			return dFin.elementAt(i);
		  }
		public void setdFin(Integer valor, int i){
			dFin.insertElementAt(valor,i);
	    }
	    public Integer getmFin(int i){
			return mFin.elementAt(i);
		  }
	    public void setmFin(Integer valor, int i){
			mFin.insertElementAt(valor,i);
	    }
		public void setaFin(Integer valor, int i){
			aFin.insertElementAt(valor,i);
	    }
	    public Integer getaFin(int i){
			return aFin.elementAt(i);
		  }	
		public void setTipo(Integer valor, int i){
			tipo.insertElementAt(valor,i);
	    }
	    public Integer getTipo(int i){
			return tipo.elementAt(i);
		  }	
	    public void setContador(Integer valor){
			this.contador = valor;
		  }
	    public Integer getContador(){
			  return this.contador;
		  }
	}


