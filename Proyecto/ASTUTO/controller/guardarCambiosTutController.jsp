<!- 
	T�tulo: 			ASTUTO. Aplicaci�n web para solicitar tutor�as online.
	Alumnas: 			Vanesa Gonz�lez P�rez, Ingenier�a T�cnica en Inform�tica de Gesti�n.
			 			Mar�a Josefa Aldea Palacios,Ingenier�a T�cnica en Inform�tica de Gesti�n.
	Director:			Dr. Jos� Ra�l Romero Salguero.
	Fecha creaci�n:		
	�ltima modificaci�n:
	Historial:
		v1.0 Inicial
->
<%-- Paquetes Java importados necesarios para la ejecuci�n de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaraci�n de los javaBeans usados en este fichero --%>
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
  <jsp:forward page="../controller/principalController.jsp"/>
  <%
} else {//Si esta logado 
  String direccionUrl;
  //Extraigo String del fichero web.xml que contiene la ruta de la ubicaci�n del fichero de propiedades 
  //en el que se encuentran las consultas de la base de datos
  String curDir = (String)getServletContext().getInitParameter("ruta");
  //Creo objeto GestorPropuedades para gestionar las consultas de la base de datos,
  //a partir de la ruta anterior curDir y especificando el nombre del fichero.
  GestorPropiedades pm = new GestorPropiedades(curDir,"ConsultasASTUTO.properties");
  
 //Declaraci�n de variables 
  Hashtable item = null;
  String query;
  Vector params = new Vector();
  ConexionBD micon = new ConexionBD();

  //Datos extraidos del formulario
  String comentarioProfesor = request.getParameter("comentario");//Comentario del profesor
  String id = request.getParameter("id");//identificador de la peticion 	
  String d = request.getParameter("d");//dia	
  String m = request.getParameter("m");//mes
  String a = request.getParameter("a");//a�o
  String estadoStr = request.getParameter("estado");//estado de la peticion
  
  //Lista los enlaces de interes relacionados con los profesores.
  query = pm.getPropiedad("selectEnlacesProfesor");  
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

  //Modificar los datos de la peticion.
  query = pm.getPropiedad("updateTutoriaEsCom"); 
  params.add(estadoStr); 
  params.add(comentarioProfesor);
  params.add(id); 	  
  micon.doUpdate(query, params);
  
  if (estadoStr.equals("6")){//Si el alumno no ha asistido a la tutoria, estado incomparesencia
	   	//Incremetamos en una unidad el numero de ausencias del alumno
	   	query = pm.getPropiedad("updateAlumnoAusencias"); 
	   	params.removeAllElements();
		params.add(1); 	  
		params.add(tutoriaDiaBean.getId(0)); 
	   	micon.doUpdate(query, params);
  }
}
  //Redirecciono a la vista que muestra la pagina.        	
  %>
  <jsp:forward page="../view/diarioTutoriasView.jsp?m=0"/>