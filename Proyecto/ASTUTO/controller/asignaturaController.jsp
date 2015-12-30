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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
}else{//Si esta logado
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
  
  //Extraigo el identificador de la asignatura y la opcion
  String idAsignatura = request.getParameter("idAsignatura");
  String opcion = request.getParameter("opcion");
  
  //Lista los enlaces de interes relacionados con el administrador.
  query = pm.getPropiedad("selectEnlacesAdministrador");  
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
  
  //mostrar todas las asignaturas, cuando viene de nuevo, borrar o editar. 
  if (idAsignatura==null || opcion!=null){	
    //Buscar todas las asignaturas
	query = pm.getPropiedad("selectNombreAsigTodo");  
	micon = new ConexionBD();
	
	Vector resultado = micon.doSelect(query);
	asignaturaBean.setContador(resultado.size());
	for (int i=0; i<asignaturaBean.getContador(); i++){
		item = (Hashtable)resultado.get(i);  
		Integer id= (Integer)item.get("id_asignatura");
		asignaturaBean.setId(id,i);
		String nombre = (String)item.get("nombre");
		asignaturaBean.setNombre(nombre,i);
		Integer idEstDocente = (Integer)item.get("id_EstDocente");
		
		//Buscar el nombre del curso al que pertenece
		params.removeAllElements();
		params.add(idEstDocente);
		query = pm.getPropiedad("selectCursoAsig");  
	    micon = new ConexionBD();
	    Vector resultadoCursoAsig = micon.doSelect(query, params);
		item = (Hashtable)resultadoCursoAsig.get(0);  	
		Integer idCurso=(Integer)item.get("id_EstDocAntecesora");
		String curso=(String)item.get("nombre");
		asignaturaBean.setCurso(curso,i);
					
		//Buscar el nombre de la titulación a la que pertenece el curso
		params.removeAllElements();
		params.add(idCurso);
		query = pm.getPropiedad("selectTitulacionAsig");  
	    micon = new ConexionBD();
	    Vector resultadoTitulacionAsig = micon.doSelect(query, params);
		item = (Hashtable)resultadoTitulacionAsig.get(0);  	
		String titulacion=(String)item.get("nombre");
		asignaturaBean.setTitulacion(titulacion,i);					
   }
   //Redirecciono a la vista que muestra la pagina.	  
   %>
	<jsp:forward page="../view/asignaturaMantView.jsp"/>     
   <%
  } else {//Mostrar los profesor de la asignatura seleccionada
  		//Buscar los datos de los profesor que imparte la asignatura
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idAsignatura);
		query = pm.getPropiedad("selectDatosProfAsig");  
		micon = new ConexionBD();
		// Realiza una consulta en la base de datos pasando la consulta como argumentos
		Vector resultadoProf = micon.doSelect(query,params);
		
		if (resultadoProf.size()!=0){
		  profBean.setContador(resultadoProf.size());
		  for(int j=0;j<resultadoProf.size();j++){
			item = (Hashtable)resultadoProf.get(j);
			Integer idProfesor = (Integer)item.get("id_profesor");  
			String nombre = (String)item.get("nombre");
			String apellidos = (String)item.get("apellidos");
			
			profBean.setId(idProfesor,j);
			profBean.setNombre(nombre,j);
			profBean.setApellidos(apellidos,j);
		  }
		}
  	  }
	  //Redirecciono a la vista que muestra la pagina.	  
      %>
	   <jsp:forward page="../view/profAsigMantView.jsp"/>     
      <% 	
  }
  %>
