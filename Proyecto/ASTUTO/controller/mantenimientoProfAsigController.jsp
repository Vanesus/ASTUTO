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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==null)
{
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
} else {//Si esta logado
 
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
  		      
  //Extraigo del bean
  String asignatura= asignaturaBean.getNombreAsig();
  String curso= asignaturaBean.getNombreCurso();
  String titulacion = asignaturaBean.getNombreTit();
	
  //Extraigo del formulario
  String nombre= request.getParameter("nombreProf");
  String apellidos= request.getParameter("apellidos");
  String login= request.getParameter("login");
  String nombreAsig= request.getParameter("nombre");
  String idAsignatura= request.getParameter("idAsignatura");
 
  //Extraigo
  String idProfesor = request.getParameter("idProfesor");
  String opcion = request.getParameter("opcion");
  String disabled = request.getParameter("disabled");
  
  //Lista los enlaces de interes relacionados con el administrador.
  query = pm.getPropiedad("selectEnlacesAdministrador");  
  micon = new ConexionBD();
  Vector resultadoEnlaces = micon.doSelect(query);

  enlacesBean.setContador(resultadoEnlaces.size());
  for (int i=0; i<enlacesBean.getContador(); i++){
    	item = (Hashtable)resultadoEnlaces.get(i);  
    	String nombreEnlace = (String)item.get("nombre");
		String URL = (String)item.get("URL");
		//Indicaciones para mostrar el nombre y URL del enlace
	    enlacesBean.setNombre(nombreEnlace,i);
		enlacesBean.setUrl(URL,i);   
  }
 
//Opcion nueva asignatura
if(idProfesor==null){  
  //formulario vacio
  if (nombre ==null || apellidos ==null ||login==null){
      messageBean.setMsg("");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
      <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
      <% 
  }  else  {
      //buscar profesor con ese nombre y apellidos
	  query = pm.getPropiedad("selectBuscarProf"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(nombre);
	  params.add(apellidos);  
	  params.add(login);
	  micon = new ConexionBD();
	  Vector resultado = micon.doSelect(query, params);
	  //No existe profesor con esos datos
	  if (resultado.size()==0){
		messageBean.setMsg("No existe el profesor");
		%>
	   	 <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	   <% 
	  }else{
	    messageBean.setMsg("Elija un profesor");
	  	// Existe profesor con esos datos
		//Lista de profesores
		profBean.setContador(resultado.size());
		for(int i=0;i<profBean.getContador();i++){
		   item = (Hashtable)resultado.get(i);  
	 	   Integer idProf = (Integer)item.get("id_profesor"); 
		   String nombreProf = (String)item.get("nombre");
		   String apellidosProf = (String)item.get("apellidos");
			profBean.setId(idProf,i);
			profBean.setNombre(nombreProf,i);
			profBean.setApellidos(apellidosProf,i);
		}
		//Redirecciono a la vista que muestra la pagina.	  
		%>
	   	 <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	    <% 
	    }
	}
}
//inserta la asignatura sabiendo ya el profesor que la imparte
if(idAsignatura==null&& idProfesor!=null){
	//SI EXITE LA TITULACION Y EL CURSO INSERTO ASIGNATURA.	
	query = pm.getPropiedad("insertAsignatura"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(asignatura);  
	params.add(curso);  
	micon = new ConexionBD();
	micon.doUpdate(query, params);
	asignaturaBean.setNombreAsig(asignatura);		
	
	//idAsignatura antes insertada
	query = pm.getPropiedad("selectIdAsignatura"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(asignatura);
	params.add(curso);
	micon = new ConexionBD();
	Vector resultado = micon.doSelect(query, params);
	item = (Hashtable)resultado.get(0);  
	Integer idAsig = (Integer)item.get("id_asignatura"); 
			
	//Inserta la relación entre el profesor y la asignatura creada
	query = pm.getPropiedad("insertProfAsig"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idProfesor);  
	params.add(idAsig);  
	micon = new ConexionBD();
	micon.doUpdate(query, params);
	messageBean.setMsg("Asignatura Guardada");
	//Redirecciono a la vista que muestra la pagina.	  	    
	%>
	<jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	<%
}
//Añadir nuevo profesor a una asignatura ya creada
if(idAsignatura!=null && idProfesor!=null &&opcion==null){
    //el profesor seleccionado ya esta añadido
	query = pm.getPropiedad("selectProfAñadido"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idProfesor);  
	params.add(idAsignatura);  
	micon = new ConexionBD();
	Vector resultadoProfAñadido = micon.doSelect(query, params);
	if (resultadoProfAñadido.size()>0){
	messageBean.setMsg("El profesor ya esta añadido");
	//Redirecciono a la vista que muestra la pagina.	  
	%>
	<jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	<%
	}
	//nuevo profesor una vez esta la asignatura creada
	query = pm.getPropiedad("insertProfAsig"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idProfesor);  
	params.add(idAsignatura);  
	micon = new ConexionBD();
	micon.doUpdate(query, params);
	messageBean.setMsg("Profesor Añadido");
	//Redirecciono a la vista que muestra la pagina.	  
	%>
	<jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	<%
} 
//Borrar la asignación entre un profesor y una asignatura
if(idProfesor !=null && idAsignatura!=null){
   //Datos del profesor que vamos a eliminar 
   if ( apellidos ==null && disabled ==null){
      query = pm.getPropiedad("selectNombreProf"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idProfesor);
	  micon = new ConexionBD();
	  Vector resultado = micon.doSelect(query, params);
	  item = (Hashtable)resultado.get(0);  
	  nombre = (String)item.get("nombre"); 
	  apellidos = (String)item.get("apellidos"); 
	  profesorBean.setNombre(nombre);
	  profesorBean.setApellidos(apellidos);
	  messageBean.setMsg("");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
      <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
      <% 
   }
    //Buscar cuantos profesores tiene asociada esta asignatura
    query = pm.getPropiedad("selectProfAsig"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idAsignatura);
	micon = new ConexionBD();
	Vector resultado = micon.doSelect(query, params);
	//la imparten mas de un profesor
	if(resultado.size()>1){  
	   //BORRAR ASOCIACION ENTRE PROFESOR Y ASIGNATURA
	   query = pm.getPropiedad("deleteProfAsigidProf"); 
	   params.removeAllElements(); //Elimino elementos del vector
	   params.add(idAsignatura); 
	   params.add(idProfesor); 
	   micon = new ConexionBD();
	   micon.doUpdate(query, params);
	   messageBean.setMsg("Profesor Borrado");
	   //Redirecciono a la vista que muestra la pagina.	  
	   %>
		 <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	   <%   
	} else {//Solo la imparte ese profesor por lo que no se puede borrar
	  messageBean.setMsg("Solo existe un profesor asociado a esta asignatura. No se puede eliminar");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
		 <jsp:forward page="../view/verDatosProfAsigView.jsp"/>
	   <%
	}
}
}%>