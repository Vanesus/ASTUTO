<!- 
	Título: 			ASTUTO. Aplicación web para solicitar tutorías online.
	Alumnas: 			Vanesa González Pérez, Ingeniería Técnica en Informática de Gestión.
			 			María Josefa Aldea Palacios,Ingeniería Técnica en Informática de Gestión.
	Director:			Dr. José Raúl Romero Salguero.
	Fecha creación:		
	Última modificación:
	Historial:
		v1.0 Inicial
->
<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
  String direccionUrl;
  //Extraigo String del fichero web.xml que contiene la ruta de la ubicación del fichero de propiedades 
  //en el que se encuentran las consultas de la base de datos
  String curDir = (String)getServletContext().getInitParameter("ruta");
  //Creo objeto GestorPropuedades para gestionar las consultas de la base de datos,
  //a partir de la ruta anterior curDir y especificando el nombre del fichero.
  GestorPropiedades pm = new GestorPropiedades(curDir,"ConsultasASTUTO.properties");

  //Declaración de variables 
  Hashtable item = null;
  String query;
  Vector params = new Vector();
  ConexionBD micon;   // objeto que realiza la conexión con la base de datos
  
  //Lista los enlaces de interes relacionados con los alumnos.
  query = pm.getPropiedad("selectEnlacesAlumno");  
  micon = new ConexionBD();
  Vector resultadoEnlaces = micon.doSelect(query);
  
  enlacesBean.setContador(resultadoEnlaces.size());
  for (int i=0; i<enlacesBean.getContador(); i++){
    item = (Hashtable)resultadoEnlaces.get(i);  
    String nombre = (String)item.get("nombre");
	String URL = (String)item.get("URL");
	//Indicaciones para mostrar el nombre y URL del enlace
    enlacesBean.setNombre(nombre,i);
	enlacesBean.setUrl(URL,i);   
  }
  
  //Extraigo el identificador de la operación a realizar
  String opcion=request.getParameter("opcion");
  
  //Buscar todos los profesores
  params.removeAllElements(); //Elimino elementos del vector
  query = pm.getPropiedad("selectTodosProf"); 
  micon = new ConexionBD();
  Vector resultado = micon.doSelect(query);
	
  profBean.setContador(resultado.size());
  for(int i=0;i< resultado.size();i++){
  	//Extraigo los datos de cada uno de los profesores
	item = (Hashtable)resultado.get(i);  
	Integer idProfesor=(Integer)item.get("id_profesor");
	String nomb = (String)item.get("nombre");
	String ape = (String)item.get("apellidos");
	profBean.setId(idProfesor,i);
	profBean.setNombre(nomb,i);
	profBean.setApellidos(ape,i);
				
	//Buscamos el nombre de cada una de las asignaturas asignadas a casa profesor
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idProfesor);
	query = pm.getPropiedad("selectNombreAsigBuscar");  
	micon = new ConexionBD();
	Vector resultadoAsig = micon.doSelect(query, params);
	 
	if(resultadoAsig.size() !=0)
	{
		profBean.setContadorAsig(resultadoAsig.size(),i);
	    for (int j=0; j<profBean.getContadorAsig(i); j++)
		{
			//Extraemos el nombre e identificador 
			item = (Hashtable)resultadoAsig.get(j);  
			Integer idAsignatura=(Integer)item.get("id_asignatura");	
			String asig=(String)item.get("nombre");
			Integer id_EstDocente=(Integer)item.get("id_EstDocente");
			profBean.setAsignatura(asig,i,j);
			profBean.setIdAsignatura(idAsignatura,i,j);
					
			//Buscamos el nombre de la titulación a la que pertenece ccasa asignatura
			params.removeAllElements(); //Elimino elementos del vector
			params.add(id_EstDocente);
			query = pm.getPropiedad("selectNombreTitulacion");  
			micon = new ConexionBD();
			Vector resultadoTit = micon.doSelect(query, params);
			item = (Hashtable)resultadoTit.get(0);  	
			String NombreTit=(String)item.get("nombre");
			profBean.setTitulacion(NombreTit,i,j);
   		 }				
	}
  }
  //Redirecciono a la vista que muestra la pagina.
  %>
  <jsp:forward page="../view/resultBusquedaProfView.jsp"/>