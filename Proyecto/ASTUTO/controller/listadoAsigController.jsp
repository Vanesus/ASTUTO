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
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="datosProfBean" class="uco.interfaz.DatosProfBean" scope="session"/>
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>
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
	
  //Extraigo el identificador de la operación a realizar
  String idCurso = request.getParameter("idCurso");
  
  //Lista los enlaces de interes relacionados con los alumnos.
  query = pm.getPropiedad("selectEnlacesAlumno");  
  micon = new ConexionBD();
  Vector resultadoEnlaces = micon.doSelect(query);

  enlacesBean.setContador(resultadoEnlaces.size());
  for (int i=0; i<enlacesBean.getContador(); i++)
  {
    item = (Hashtable)resultadoEnlaces.get(i);  
    String nombre = (String)item.get("nombre");
	String URL = (String)item.get("URL");
	//Indicaciones para mostrar el nombre y URL del enlace
    enlacesBean.setNombre(nombre,i);
	enlacesBean.setUrl(URL,i);   
  }
  
  //Buscamos el nombre del curso que hemos seleccionado
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idCurso);
  query = pm.getPropiedad("selectEstDocente");  
  micon = new ConexionBD();
  // Realiza una consulta en la base de datos pasando la consulta como argumentos
  Vector resultadoCurso = micon.doSelect(query,params);
  item = (Hashtable)resultadoCurso.get(0); 
  String curso = (String)item.get("nombre");
  Integer idEstDocente = (Integer)item.get("id_EstDocAntecesora");
  estDocenteBean.setNombreCurso(curso);
  
  //Buscamos el nombre de la titulación a la pertener el curso seleccionado
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idEstDocente);
  query = pm.getPropiedad("selectEstDocente");  
  micon = new ConexionBD();
  // Realiza una consulta en la base de datos pasando la consulta como argumentos
  Vector resultadoTit = micon.doSelect(query,params);
  item = (Hashtable)resultadoTit.get(0);  
  idEstDocente = (Integer)item.get("id_EstDocAntecesora");
  String titulacion = (String)item.get("nombre");	
  estDocenteBean.setNombreTit(titulacion);
  
  //Buscamos el nombre del centro al que pertener el curso seleccionado
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idEstDocente);
  query = pm.getPropiedad("selectEstDocente");  
  micon = new ConexionBD();
  // Realiza una consulta en la base de datos pasando la consulta como argumentos
  Vector resultadoCentro = micon.doSelect(query,params);
  item = (Hashtable)resultadoCentro.get(0);  
  String centro = (String)item.get("nombre");
  estDocenteBean.setNombreCentro(centro);
  	
  //Buscamos todas las asignaturas que se imparten en el curso seleccionado
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idCurso);
  query = pm.getPropiedad("selectAsignaturas");  
  micon = new ConexionBD();
  // Realiza una consulta en la base de datos pasando la consulta como argumentos
  Vector resultadoAsig = micon.doSelect(query,params);

  asignaturaBean.setContador(resultadoAsig.size());
  for (int i=0; i<asignaturaBean.getContador(); i++)
  {
    item = (Hashtable)resultadoAsig.get(i); 
	Integer idAsignatura = (Integer)item.get("id_asignatura");
	String asignatura = (String)item.get("nombre");
	
    asignaturaBean.setNombre(asignatura,i);
	asignaturaBean.setId(idAsignatura,i);
	
	//Buscamos la lista de profesor que imparten cada asignatura. 
	params.removeAllElements(); //Elimino elementos del vector	
	params.add(idAsignatura);
    query = pm.getPropiedad("selectProfesores");  
    micon = new ConexionBD();
    // Realiza una consulta en la base de datos pasando la consulta como argumentos
    Vector resultadoIdProf = micon.doSelect(query,params);
    datosProfBean.setContador(resultadoIdProf.size(),i);
    for (int j=0; j<datosProfBean.getContador(i); j++)
    {
    	item = (Hashtable)resultadoIdProf.get(j); 
		Integer idProf = (Integer)item.get("id_Profesor");
	    datosProfBean.setId(idProf,i,j);
		
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idProf);
		query=pm.getPropiedad("selectDatosProf");
		micon = new ConexionBD();
		Vector resultadoDatosProf = micon.doSelect(query,params);
	
		for(int k=0;k<resultadoDatosProf.size();k++)
		{
			item = (Hashtable)resultadoDatosProf.get(k);  
			String nombre=(String)item.get("nombre");
			String apellidos=(String) item.get("apellidos");
			
    		datosProfBean.setNombre(nombre,i,j);
			datosProfBean.setApellidos(apellidos,i,j);
		}
	  }
	}
	//Redirecciono a la vista que muestra la pagina.
	%>
  	<jsp:forward page="../view/listadoAsigView.jsp"/>    
