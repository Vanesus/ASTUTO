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
* Clase encargada de interpretar físicamente los ficheros de propiedades y establecer
* la estructura de pares clave/valor capaz de soportarlas
*
* @author	José Raúl Romero Salguero
* @version 1.0
* 
* @Modificado por Vanesa González Pérez y Mª Josefa Aldea Palacios
* @version 2.0
	
*/
@SuppressWarnings("rawtypes")
public class InterpretePropiedades extends Hashtable {

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

protected InterpretePropiedades defaults;

/**
* Constructor por defecto
*/
public InterpretePropiedades() {
	this(null);
}

/**
 * Contructor que permite establecer una configuración de partida 
 */
public InterpretePropiedades(InterpretePropiedades defaults) {
	this.defaults = defaults;
}

/**
 * Establece el valor de una propiedad
 */
@SuppressWarnings("unchecked")
public synchronized Object setProperty(String key, String value) {
    return put(key, value);
}

private static final String keyValueSeparators = "=: \t\r\n\f";

private static final String strictKeyValueSeparators = "=:";

private static final String specialSaveChars = "=: \t\r\n\f#!";

private static final String whiteSpaceChars = " \t\r\n\f";

/**
 * Traduce un fichero de propiedades y crea la estructura de clave/valor
 */
@SuppressWarnings("unchecked")
public synchronized void cargar(String inStream) throws IOException {

	BufferedReader in = new BufferedReader(new FileReader(inStream));
	while (true) {
        // Get next line
        String line = in.readLine();
        if (line == null)
            return;

        if (line.length() > 0) {
            // Continue lines that end in slashes if they are not comments
            char firstChar = line.charAt(0);
            if ((firstChar != '#') && (firstChar != '!')) {
                while (continueLine(line)) {
                    String nextLine = in.readLine();
                    if(nextLine == null)
                        nextLine = "";
                    String loppedLine = line.substring(0, line.length()-1);
                    // Advance beyond whitespace on new line
                    int startIndex=0;
                    for(startIndex=0; startIndex<nextLine.length(); startIndex++)
                        if (whiteSpaceChars.indexOf(nextLine.charAt(startIndex)) == -1)
                            break;
                    nextLine = nextLine.substring(startIndex,nextLine.length());
                    line = new String(loppedLine+nextLine);
                }

                // Find start of key
                int len = line.length();
                int keyStart;
                for(keyStart=0; keyStart<len; keyStart++) {
                    if(whiteSpaceChars.indexOf(line.charAt(keyStart)) == -1)
                        break;
                }

                // Blank lines are ignored
                if (keyStart == len)
                    continue;

                // Find separation between key and value
                int separatorIndex;
                for(separatorIndex=keyStart; separatorIndex<len; separatorIndex++) {
                    char currentChar = line.charAt(separatorIndex);
                    if (currentChar == '\\')
                        separatorIndex++;
                    else if(keyValueSeparators.indexOf(currentChar) != -1)
                        break;
                }

                // Skip over whitespace after key if any
                int valueIndex;
                for (valueIndex=separatorIndex; valueIndex<len; valueIndex++)
                    if (whiteSpaceChars.indexOf(line.charAt(valueIndex)) == -1)
                        break;

                // Skip over one non whitespace key value separators if any
                if (valueIndex < len)
                    if (strictKeyValueSeparators.indexOf(line.charAt(valueIndex)) != -1)
                        valueIndex++;

                // Skip over white space after other separators if any
                while (valueIndex < len) {
                    if (whiteSpaceChars.indexOf(line.charAt(valueIndex)) == -1)
                        break;
                    valueIndex++;
                }
                String key = line.substring(keyStart, separatorIndex);
                String value = (separatorIndex < len) ? line.substring(valueIndex, len) : "";

                // Convert then guardar key and value
                key = loadConvert(key);
                value = loadConvert(value);
                put(key, value);
            }
        }
	}
}

/*
 * Devuelve true si la línea dada es debe añadirse a la siguiente (acaba en "\\")
 */
private boolean continueLine (String line) {
    int slashCount = 0;
    int index = line.length() - 1;
    while((index >= 0) && (line.charAt(index--) == '\\'))
        slashCount++;
    return (slashCount % 2 == 1);
}

/**
 * Convierte el &#92 codificado a caracteres UNICODE y devuelve los caracteres 
 * guardados de modo especial a su estado original
 */
private String loadConvert (String theString) {
    char aChar;
    int len = theString.length();
    StringBuffer outBuffer = new StringBuffer(len);

    for(int x=0; x<len; ) {
        aChar = theString.charAt(x++);
        if (aChar == '\\') {
            aChar = theString.charAt(x++);
            if(aChar == 'u') {
                // Read the xxxx
                int value=0;
	    for (int i=0; i<4; i++) {
	        aChar = theString.charAt(x++);
	        switch (aChar) {
	          case '0': case '1': case '2': case '3': case '4':
	          case '5': case '6': case '7': case '8': case '9':
	             value = (value << 4) + aChar - '0';
		     break;
		  case 'a': case 'b': case 'c':
                      case 'd': case 'e': case 'f':
		     value = (value << 4) + 10 + aChar - 'a';
		     break;
		  case 'A': case 'B': case 'C':
                      case 'D': case 'E': case 'F':
		     value = (value << 4) + 10 + aChar - 'A';
		     break;
		  default:
                          throw new IllegalArgumentException(
                                       "Malformed \\uxxxx encoding.");
                    }
                }
                outBuffer.append((char)value);
            } else {
                if (aChar == 't') aChar = '\t';
                else if (aChar == 'r') aChar = '\r';
                else if (aChar == 'n') aChar = '\n';
                else if (aChar == 'f') aChar = '\f';
                outBuffer.append(aChar);
            }
        } else
            outBuffer.append(aChar);
    }
    return outBuffer.toString();
}

/**
 * Convierte UNICODE -> codificados &#92; y escribe cualquier carácter con su
 * codificación especial precedido de una barra
 */
private String saveConvert(String theString, boolean escapeSpace) {
    int len = theString.length();
    StringBuffer outBuffer = new StringBuffer(len*2);

    for(int x=0; x<len; x++) {
        char aChar = theString.charAt(x);
        switch(aChar) {
	case ' ':
	    if (x == 0 || escapeSpace) 
		outBuffer.append('\\');

	    outBuffer.append(' ');
	    break;
            case '\\':outBuffer.append('\\'); outBuffer.append('\\');
                      break;
            case '\t':outBuffer.append('\\'); outBuffer.append('t');
                      break;
            case '\n':outBuffer.append('\\'); outBuffer.append('n');
                      break;
            case '\r':outBuffer.append('\\'); outBuffer.append('r');
                      break;
            case '\f':outBuffer.append('\\'); outBuffer.append('f');
                      break;
            default:
                if ((aChar < 0x0020) || (aChar > 0x007e)) {
                    outBuffer.append('\\');
                    outBuffer.append('u');
                    outBuffer.append(toHex((aChar >> 12) & 0xF));
                    outBuffer.append(toHex((aChar >>  8) & 0xF));
                    outBuffer.append(toHex((aChar >>  4) & 0xF));
                    outBuffer.append(toHex( aChar        & 0xF));
                } else {
                    if (specialSaveChars.indexOf(aChar) != -1)
                        outBuffer.append('\\');
                    outBuffer.append(aChar);
                }
        }
    }
    return outBuffer.toString();
}

/**
 * Llama a guardar(OutputStream out, String header) y suprime 
 * cualquier lanzamiento de IOException
 */
public synchronized void save(OutputStream out, String header)  {
    try {
        guardar(out, header);
    } catch (IOException e) {
    }
}

/**
 * Guarda los pares clave valor en el fichero de propiedades o corriente de salida
 * especificada con la cabecera predeterminada
 */
public synchronized void guardar(OutputStream out, String header)
throws IOException
{
    BufferedWriter awriter;
    awriter = new BufferedWriter(new OutputStreamWriter(out, "8859_1"));
    if (header != null)
        writeln(awriter, "#" + header);
    writeln(awriter, "#" + new Date().toString());
    for (Enumeration e = keys(); e.hasMoreElements();) {
        String key = (String)e.nextElement();
        String val = (String)get(key);
        key = saveConvert(key, true);

        val = saveConvert(val, false);
        writeln(awriter, key + "=" + val);
    }
    awriter.flush();
}

/**
* Escribe una línea y realiza el salto de carro
*/
private static void writeln(BufferedWriter bw, String s) throws IOException {
    bw.write(s);
    bw.newLine();
}

/**
 * Obtiene la propiedad asociada a la clave
 */
public String getPropiedad(String key) {
	Object oval = super.get(key);
	String sval = (oval instanceof String) ? (String)oval : null;
	return ((sval == null) && (defaults != null)) ? defaults.getPropiedad(key) : sval;
}

/**
 * Obtiene la propiedad asociada a la clave y, si no la encuentra, devuelve el valor
 * por defecto indicado
 */
public String getPropiedad(String key, String defaultValue) {
	String val = getPropiedad(key);
	return (val == null) ? defaultValue : val;
}

/**
* Devuelve la enumeración de clases
*/
public Enumeration propertyNames() {
	Hashtable h = new Hashtable();
	enumerate(h);
	return h.keys();
}

/**
 * Listado de propiedades
 */
public void list(PrintStream out) {
	out.println("-- listado de propiedades: Gesdoc --");
	Hashtable h = new Hashtable();
	enumerate(h);
	for (Enumeration e = h.keys() ; e.hasMoreElements() ;) {
	    String key = (String)e.nextElement();
	    String val = (String)h.get(key);
	    if (val.length() > 40) {
                val = val.substring(0, 37) + "...";
	    }
	    out.println(key + "=" + val);
	}
}

/**
 * Listado de propiedades
 */
public void list(PrintWriter out) {
	out.println("-- listado de propiedades: Gesdoc --");
	Hashtable h = new Hashtable();
	enumerate(h);
	for (Enumeration e = h.keys() ; e.hasMoreElements() ;) {
	    String key = (String)e.nextElement();
	    String val = (String)h.get(key);
	    if (val.length() > 40) {
		val = val.substring(0, 37) + "...";
	    }
	    out.println(key + "=" + val);
	}
}

@SuppressWarnings("unchecked")
private synchronized void enumerate(Hashtable h) {
	if (defaults != null) {
	    defaults.enumerate(h);
	}
	for (Enumeration e = keys() ; e.hasMoreElements() ;) {
	    String key = (String)e.nextElement();
	    h.put(key, get(key));
	}
}

private static char toHex(int nibble) {
	return hexDigit[(nibble & 0xF)];
}

private static final char[] hexDigit = {
	'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
};
}

