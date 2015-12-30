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

import java.io.*;
import java.util.*;

/**
* Clase que mantiene la colección de propiedades del fichero interpretado.
* Extiende la funcionalidad de los métodos de la clase ResourceBundle
*
* @author	José Raúl Romero Salguero
* @version 1.0	
* 
* @Modificado por Vanesa González Pérez y Mª Josefa Aldea Palacios
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
* Obtiene una enumeración de las claves
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
