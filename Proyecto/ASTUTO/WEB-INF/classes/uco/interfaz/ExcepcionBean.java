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

public class ExcepcionBean {
	Integer id=0;
	Integer dia=0;
	Integer mes= 0;
	Integer anyo= 0;
	Integer hInicio= 0;
	Integer mInicio= 0;
	Integer hFin= 0;
	Integer mFin=0;
	Integer tipo= 0;
	
	
	public void setId(Integer valor){
		this.id=valor;
    }
    public Integer getId(){
		return this.id;
	  }
	public void setDia(Integer valor){
		this.dia=valor;
    }
	 public Integer getDia(){
		return this.dia;
    }
	public void setMes(Integer valor){
		this.mes=valor;
	}
    public Integer getMes(){
		return this.mes;
	  }	
	public void setAnyo(Integer valor){
		this.anyo=valor;
    }
    public Integer getAnyo(){
		return this.anyo;
	  }
    public void sethInicio(Integer valor){
		this.hInicio=valor;
    }
    public Integer gethInicio(){
		return this.hInicio;
	  }
    public void setmInicio(Integer valor){
		this.mInicio=valor;
    }
    public Integer getmInicio(){
		return this.mInicio;
	  }
    public void sethFin(Integer valor){
		this.hFin=valor;
    }
    public Integer gethFin(){
		return this.hFin;
	  }
    public void setmFin(Integer valor){
		this.mFin=valor;
    }
    public Integer getmFin(){
		return this.mFin;
	  }
    public void setTipo(Integer valor){
		this.tipo=valor;
    }
    public Integer getTipo(){
		return this.tipo;
	  }	
}
