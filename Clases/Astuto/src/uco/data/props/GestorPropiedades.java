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

import java.util.*;

/**
* Fachada del sistema de gestión de ficheros de propiedades. Ofrece todos los mecanismos
* para acceder a este tipo de archivos y obtener las propiedades en ellos definidas.
*
* Por defecto se ha establecido que la ruta la tome de la clase Singleton Configurador
* (en versión 1.1)
*
* @author	José Raúl Romero Salguero
* @version 1.1
* 
* @Modificado por Vanesa González Pérez y Mª Josefa Aldea Palacios
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

