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
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="titulacionBean" class="uco.interfaz.TitulacionBean" scope="session"/>
<jsp:useBean id="cursoBean" class="uco.interfaz.CursoBean" scope="session"/>
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
  
  //Lista de Centros. 
  //Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea null
  query = pm.getPropiedad("selectCentro");  
  micon = new ConexionBD();
  Vector resultadoCentro = micon.doSelect(query);

  centroBean.setContador(resultadoCentro.size());
  for (int i=0; i<centroBean.getContador(); i++){
    item = (Hashtable)resultadoCentro.get(i);  
    String centro = (String)item.get("nombre");
	Integer id_centro = (Integer)item.get("id_EstDocente");
	Integer orden = (Integer)item.get("orden");
	
    centroBean.setCentro(centro,orden-1);//le resto 1 para que sea un vector de 0 a n-1
	centroBean.setId(id_centro,orden-1);
	centroBean.setOrden(orden,orden-1);
    
	//Lista de Titulaciones de cada centro
	//Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea el id del centro.
	params.removeAllElements(); //Elimino elementos del vector
    params.add(id_centro);
    query = pm.getPropiedad("selectTitulacion");   
	micon = new ConexionBD();
    Vector resultadoTit = micon.doSelect(query, params);
	
    titulacionBean.setContador(resultadoTit.size(),orden-1);
      for (int j=0; j<titulacionBean.getContador(orden-1); j++){
		item = (Hashtable)resultadoTit.get(j);  
		String titulacion = (String)item.get("nombre");
		Integer id_titulacion = (Integer)item.get("id_EstDocente");
		Integer ordenTit = (Integer)item.get("orden");
		
		titulacionBean.setTitulacion(titulacion,orden-1,ordenTit-1);
		titulacionBean.setId(id_titulacion,orden-1,ordenTit-1);
		titulacionBean.setOrden(ordenTit,orden-1,ordenTit-1);
		
		//Lista de Curso de cada titulacion
		//Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea el id de la titulación.
		params.removeAllElements(); //Elimino elementos del vector
		params.add(id_titulacion);
		query = pm.getPropiedad("selectCurso");   
		micon = new ConexionBD();
		Vector resultadoCurso = micon.doSelect(query, params);
		
		cursoBean.setContador(resultadoCurso.size(),orden-1,ordenTit-1);
		  for (int k=0; k<cursoBean.getContador(orden-1,ordenTit-1); k++){
			item = (Hashtable)resultadoCurso.get(k);  
			String curso = (String)item.get("nombre");
			Integer id_curso = (Integer)item.get("id_EstDocente");
			Integer ordenCurso = (Integer)item.get("orden");
			cursoBean.setCurso(curso,orden-1,ordenTit-1,ordenCurso-1);
			cursoBean.setId(id_curso,orden-1,ordenTit-1,ordenCurso-1);
			cursoBean.setOrden(ordenCurso,orden-1,ordenTit-1,ordenCurso-1);
		 }
	  } 
   }
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/peticionTutView.jsp"/>            