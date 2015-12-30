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
