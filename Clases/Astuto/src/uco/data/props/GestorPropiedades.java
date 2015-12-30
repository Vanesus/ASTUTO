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

import java.util.*;

/**
* Fachada del sistema de gesti�n de ficheros de propiedades. Ofrece todos los mecanismos
* para acceder a este tipo de archivos y obtener las propiedades en ellos definidas.
*
* Por defecto se ha establecido que la ruta la tome de la clase Singleton Configurador
* (en versi�n 1.1)
*
* @author	Jos� Ra�l Romero Salguero
* @version 1.1
* 
* @Modificado por Vanesa Gonz�lez P�rez y M� Josefa Aldea Palacios
* @version 2.0

*/
public class GestorPropiedades implements java.io.Serializable {

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

transient RecursoPropiedades myResource;

/** Nombre del fichero de propiedades por defecto */
private static String PROPERTY_FILE = "ConsultasASTUTO.properties";
private static String PROPERTY_DEFAULT = "ConsultasASTUTO.properties";
private static String PROPERTY_PATH ="";

/** 
* Constructor por defecto de la clase
**/
public GestorPropiedades() 
{
	PROPERTY_FILE = PROPERTY_DEFAULT;
	
	// El path se toma del Configurador
	//Configurador configura = Configurador.getInstance();
	if (!Configurador.RutaPropiedades.equals("")) {
		PROPERTY_PATH = Configurador.RutaPropiedades;
	}
	
    cargar();
}

/**
 * Constructor de la clase: admite el nombre de fichero 
 * 
 */
public GestorPropiedades(String file) 
{
	PROPERTY_FILE = file;
	// El path se toma del Configurador
	//Configurador configura = Configurador.getInstance();
	if (!Configurador.RutaPropiedades.equals("")) {
		PROPERTY_PATH = Configurador.RutaPropiedades;
	}
    cargar();
}

/**
 * Constructor de la clase: admite la ruta y el nombre de fichero
 * 
 */
public GestorPropiedades(String path, String file) 
{
	PROPERTY_PATH = path;
	PROPERTY_FILE = file;
    cargar();
}

/**
 * Recupera el valor asociado a la propiedad que se pasa por parametro
 *
 */
public String getPropiedad(String sPropertyName) 
{
	String resultado = "";
   	try{
    	resultado = myResource.getString(sPropertyName);
   	}catch(Exception e){
   	}
	//System.out.println ("GestorPropiedades::getPropiedad('" + sPropertyName + "') en fichero('" + this.PROPERTY_FILE + "') es: " + resultado);
    return resultado;
}


/**
* Obtiene las claves contenidas en el fichero de propiedades
*/
@SuppressWarnings("rawtypes")
public Enumeration getClaves()
{
	if (myResource == null) {
		Vector vc = new Vector();
		return vc.elements();
	}
  	return myResource.getKeys();
}


/**
 * Carga y devuelve el Properties
 *
 */
private void cargar()
{
	try {
		String file = PROPERTY_PATH + "\\" + PROPERTY_FILE;
		myResource = null;
		// System.out.println ("GestorPropiedades::cargar(). file: " + file);
		myResource = new RecursoPropiedades(file);
	  	} catch (Exception e) {
	  		System.out.println("ERROR> Fichero " + PROPERTY_FILE + " no encontrado.");
	  	}
}

/**
 * Devuelve el Properties
 *
 */
public RecursoPropiedades getPropiedades()
{
    return myResource;
}

}

