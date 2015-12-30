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
package uco.data.props;

public class Configurador implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static String RutaPropiedades = "";
	private static Configurador thisObj = null;


  private Configurador() {
  }


  /**
  * Devuelve la instancia del objeto (Singleton)
  */
  public static Configurador getInstance(){
    if(thisObj==null){
      thisObj=new Configurador();
    }

	//System.out.println("\n\nInstancia de Configurador con Ruta: " + RutaPropiedades);
    return thisObj;
  }


}
