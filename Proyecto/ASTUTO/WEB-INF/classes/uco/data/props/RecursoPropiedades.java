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

import java.io.*;
import java.util.*;

/**
* Clase que mantiene la colecci�n de propiedades del fichero interpretado.
* Extiende la funcionalidad de los m�todos de la clase ResourceBundle
*
* @author	Jos� Ra�l Romero Salguero
* @version 1.0	
* 
* @Modificado por Vanesa Gonz�lez P�rez y M� Josefa Aldea Palacios
* @version 2.0

*/
public class RecursoPropiedades extends ResourceBundle {

/**
 * Constructor de la clase
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public RecursoPropiedades (String stream) throws IOException {
    InterpretePropiedades properties = new InterpretePropiedades();
    properties.cargar(stream);
    lookup = new HashMap(properties);
}


/**
 * Recupera el objeto asociado a una clave
 */
public Object handleGetObject(String key) {
    if (key == null) {
        throw new NullPointerException();
    }
    return lookup.get(key);
}


/**
* Obtiene una enumeraci�n de las claves
*/
@SuppressWarnings({ "unchecked", "rawtypes" })
public Enumeration getKeys() {
	Vector vcKeys = new Vector();
	for (Iterator iter = lookup.keySet().iterator(); iter.hasNext();) {
		vcKeys.add(iter.next());
	}
	
	return vcKeys.elements();
}


@SuppressWarnings("rawtypes")
private Map lookup;
}
