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
