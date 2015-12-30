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
package uco.data;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.math.BigDecimal;
import uco.data.props.*;

/**
 * 
 * Encapsula los metodos de acceso a la base de datos.
 * Consigue las conexiones a trav�s de un DataSource que se obtiene de un
 * contexto JNDI. S�lo consigue las conexiones cuando son necesarias.
 * Implementa m�todos para hacer consultas y actualizaciones en la base de datos.
 * El commit o rollback se puede elegir hacerlo de forma manual o autom�tica
 * para lo cual existen dos constructores. La opci�n por defecto
 * (constructor sin parametros)
 * Los �nicos casos en que realizamos commit automatico:
 * - metodo finalice que ejecutar� el garbage colector.
 * - antes de realizar una consulta por si se ha olvidado de realizar el commit manual.
 *
 * La conexi�n se abre autom�ticamente al realizar alguna operaci�n, si todav�a no estaba abierta.
 * La conexi�n se cierra autom�ticamente despues de realizar una consulta o de ejecutar commit o rollback manuelmente.
 * Equivalencia de Tipos (SQL - Java) para JDBC:
 *	CHAR, VARCHAR, LONGVARCHAR - java.lang.String
 *	BIT - java.lang.Boolean<br>
 *	NUMBER - java.math.BigDecimal<br>
 *  - ADVERTENCIA: lo devolvemos como java.math.Integer
 *	TINYINT, SMALLINT, INTEGER - java.lang.Integer / java.math.BigDecimal
 *	BIGINT - java.lang.Long / java.math.BigDecimal
 *	FLOAT, DOUBLE - java.lang.Double
 *	DATE - java.sql.Timestamp
 *	otros - java.lang.Object
 * 
 * @author	Jos� Ra�l Romero Salguero
 * @version	1.0
 * @Modificado por Vanesa Gonz�lez P�rez y M� Josefa Aldea Palacios
 * @version 2.0
 * 	
 */
public class ConexionBD implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Connection connection = null; // La conexi�n con la base de datos.
	private boolean autocommit = true; // autocommit de las conexiones a true
	private boolean autoclose = true; // cierre autom�tico de la statement y la conexi�n en cada query a true
	private String connDriver = "jdbc:mysql://localhost/ASTUTO";
	private String connUrl = "com.mysql.jdbc.Driver";
	private String connUser = "root";
	private String connPass = "mysql";

    /**
      * Inicializa la clase obteniendo los par�metros de configuraci�n del fichero
      * de propiedades correspondiente.
      * 
      */
	private void init(String ppath, String pfile) throws InstantiationException {

        connection = null;
        this.connUrl = "jdbc:mysql://localhost/ASTUTO";
        this.connUser = "root";
        this.connPass = "mysql";
        this.connDriver = "com.mysql.jdbc.Driver";

		GestorPropiedades _objPropManager;
		
		if (pfile == null || pfile.equals("")) 
			_objPropManager = new GestorPropiedades();
		else if (ppath == null || ppath.equals("")) 
			_objPropManager = new GestorPropiedades(pfile);
		else
			_objPropManager = new GestorPropiedades(ppath, pfile);
	

        // Conseguimos los valores de las propiedades de la conexi�n.
        connDriver = _objPropManager.getPropiedad("ConexionDBDriver");
		String url = _objPropManager.getPropiedad("ConexionDBUrl");
		String user = _objPropManager.getPropiedad("ConexionDBUser");
		String password = _objPropManager.getPropiedad("ConexionDBPassword");
		connUrl = url + "?" + user + "=" + password;
		
		if (connDriver.equals("") || url.equals("") || 
			user.equals("") || password.equals("")) {
				throw new InstantiationException ("Faltan par�metros en el fichero de propiedades");
		}		
	}

    /**
      * Constructor por defecto de la clase.
      * 
      */
     public ConexionBD() throws InstantiationException
     {
     	try {
     		init("", "");
     	} catch (Exception e) {
     		throw new InstantiationException (e.getMessage());
     	}
     }

    /**
      * Constructor de la clase que permite configurar el autocommit de la conexi�n y el 
      * autoclose.
      * 
      */
     public ConexionBD(boolean autocommit, boolean autoclose) throws InstantiationException {

	 	this.autocommit = autocommit;
		this.autoclose = autoclose;

     	try {
     		init("", "");
     	} catch (Exception e) {
     		throw new InstantiationException (e.getMessage());
     	}
	 }

    /**
     * Consigue una conexi�n del DataSource.
     *
     */
     private Connection getConnection() throws SQLException {
     	  try {
		  	Class.forName(connDriver).newInstance();
  		  } catch (Exception e) {
  		  	throw new SQLException ("Error en busqueda de driver: " + e.getMessage());
		  }
  		  
          Connection connection = DriverManager.getConnection(connUrl, connUser, connPass);

          // Configuramos el commit
          connection.setAutoCommit(autocommit);

          return connection;
	 }

    /**
      * Cierra el statement y la conexi�n.
      * 
      */
     public void close() throws SQLException
     {
         try
         {
             if (connection != null)
                 connection.close();
         }
         catch (SQLException e)
         {
 			//System.out.println("[ConexionBD(close)] Exception: "+e.toString());
            throw new SQLException(e.getMessage());
		 }
	 }

    /**
      * Ejecuta una consulta con una PreparedStatement tomando el vector de par�metros
      * pasado por argumentos.
      * 
      */
     @SuppressWarnings("rawtypes")
	public Vector doSelect(String query, Vector parameters) throws SQLException
     {
         PreparedStatement preparedStatement = null;
         ResultSet rs;
         Vector v;

         try
         {
             if(autoclose || connection == null || connection.isClosed())
                connection = getConnection();   // Conseguimos la conexi�n.

             // Hacemos el PreparedStatement.
             preparedStatement = connection.prepareStatement(query);

             // Insertamos los parametros.
             for (int i = 0; i < parameters.size(); i++)
			     preparedStatement.setObject(i + 1, parameters.elementAt(i));

             // Ejecutamos la consulta.
			 rs = preparedStatement.executeQuery();

             // Construimos el Vector de Hashtables.
             v = resultSet2HashTableVector(rs);

             // Cerramos la sentencia.
             preparedStatement.close();
		 }
         catch (SQLException e)
         {
			 throw new SQLException(e.getMessage());
		 }
         finally
         {
             if(autoclose && (connection != null && !connection.isClosed())) close();
         }
		 return v;
	}

    /**
      * Ejecuta una actualizaci�n con una PreparedStatement pasando los
      * par�metros como argumentos
      * 
      */
     @SuppressWarnings("rawtypes")
	public int doUpdate(String query, Vector parameters) throws SQLException
     {
         PreparedStatement preparedStatement = null;
         int resultado = -1;
		 //System.out.println("ConexionBD -> doUpdate");
		 //System.out.println("QUERY: "+query);
		 //System.out.println("PARAMETERS: "+parameters);
         try
         {
             if(autoclose || connection == null || connection.isClosed())
                 connection = getConnection();   // Conseguimos la conexi�n.

             // Hacemos el PreparedStatement.
             preparedStatement = connection.prepareStatement(query);

             // Insertamos los parametros.
             for (int i = 0; i < parameters.size(); i++)
                  preparedStatement.setObject(i + 1, parameters.elementAt(i));

             // Ejecutamos la consulta.
			 resultado = preparedStatement.executeUpdate();
			 //System.out.println("[ConexionBD resultado (doUpdate): "+resultado);

             // Cerramos la sentencia.
             preparedStatement.close();
		 }
         catch (SQLException e)
         {
			 System.out.println("[ConexionBD(doUpdate)] Exception: "+e.toString());
			 throw new SQLException(e.getMessage());
		 }
         finally
         {
             if(autoclose && (connection != null && !connection.isClosed())) close();
         }
         return resultado;
	 }

    /**
	  * Ejecuta una consulta fija con una Statement.
	  * 
	  */
	 @SuppressWarnings("rawtypes")
	public Vector doSelect(String query) throws SQLException {

         Statement statement = null;
		 ResultSet rs;
		 Vector v;
		 try
         {
             if(autoclose || connection == null || connection.isClosed())
             	 connection = getConnection();   // Conseguimos la conexi�n.

             // Hacemos el Statement.
             statement = connection.createStatement();

             // Ejecutamos la consulta.
			 rs = statement.executeQuery(query);

             // Construimos el Vector de Hashtables.
             v = resultSet2HashTableVector(rs);

             // Cerramos la sentencia.
             statement.close();
         }
         catch (Exception e)
         {
			throw new SQLException(e.getMessage());
		 }
         finally
         {
             if(autoclose && (connection != null && !connection.isClosed())) close();
         }
		 return v;
	}

    /**
	 * Ejecuta una actualizaci�n fija con una Statement.
	 * 
	 */
	public int doUpdate(String query) throws SQLException {
	    Statement statement = null;
         int resultado = -1;

        try
        {
             if(autoclose || connection == null || connection.isClosed())
                 connection = getConnection();   // Conseguimos la conexi�n.

            // Hacemos el Statement.
			statement = connection.createStatement();

            // Ejecutamos la consulta.
			resultado = statement.executeUpdate(query);

             // Cerramos la sentencia.
             statement.close();
		}
        catch (Exception e)
        {
			throw new SQLException(e.getMessage());
		}
        finally
        {
             if(autoclose && (connection != null && !connection.isClosed())) close();
        }
        return resultado;
	}

    /**
     * Ejecuta un rollback manual y cierra la conexi�n.
     *
     */
	public void rollback() throws SQLException {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.rollback();   // Desacemos la operaci�n.
				connection.close();      // Cerramos la conexi�n.
			}
		} catch (SQLException e) {
			close();
			throw new SQLException(e.getMessage());
		}
	}

    /**
     * Ejecuta un commit manual y cierra la conexi�n.
     *
     */
	public void commit() throws SQLException {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.commit();
				connection.close();
			}
		} catch (SQLException e) {
			close();
			throw new SQLException(e.getMessage());
		}
	}

	/**
	 * Ejecuta manualmente commit pero no cierra la conexi�n
	 */
	public void commitNoClose() throws SQLException {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.commit();
			}
		} catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}	

    /**
     * M�todo llamado por el Garbage Collector.
     * Si la conexi�n ha quedado abierta, hace commit y cierra la conexi�n
     *
     */
	public void finalize() throws SQLException {
		try {
			if (connection != null && !connection.isClosed()) {
				commit();
				connection.close();
			}
		} catch (SQLException e) {
			close();
			throw new SQLException(e.getMessage());
		}
	}

    /**
    * M�todo que recorre un ResultSet y lo convierte en un Vector de Hashtables.
    *
    * Notas:
    * - si el result set devuelve un NULL, no se almacena nada en la hashtable
    * para que al pedir por la clave, tambi�n de un null.(Las hashtables no permiten
    * almacenar keys ni values null)
    * - si el result set devuelve un java.math.BigDecimal, lo convertimos a java.lang.Integer
	*
    */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Vector resultSet2HashTableVector(ResultSet rs) throws SQLException {
		ResultSetMetaData rsMD = null;
		Vector v = new Vector();
		Hashtable ht;
		int numberOfColumns;
		try {
			rsMD = rs.getMetaData();
			numberOfColumns = rsMD.getColumnCount();
			//boolean b = true;
			for(; rs.next(); v.addElement(ht)) {
				ht = new Hashtable();
				for (int i = 1; i <= numberOfColumns; i++) {
					String key = rsMD.getColumnName(i);
					// Hashtable:
                    // KEY: nombre de la cocampo (String)
                    // VALUE: valor del campo (Object)
                    if(rs.getObject(i) != null)
                    {
                        if (rs.getObject(i) instanceof BigDecimal)
                            ht.put(key,new Integer(((BigDecimal) rs.getObject(i)).intValue()));
                        else
                            ht.put(key, rs.getObject(i));
                    }
				}
			}
			rs.close();
		} catch (SQLException e) {
			rs.close();
			throw new SQLException(e.getMessage());
		}
		return v;
	}
}

