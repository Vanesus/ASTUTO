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
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="titulacionBean" class="uco.interfaz.TitulacionBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
} else {//Si esta logado
 
  //Extraigo del formulario
  String asignatura= request.getParameter("nombre");
  String curso= request.getParameter("curso");
  String titulacion = request.getParameter("titulacion");
	
  //Extraigo
  String idAsignatura = request.getParameter("idAsignatura");
  String opcion = request.getParameter("opcion");
  String disabled = request.getParameter("disabled");
	
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
  ConexionBD micon = new ConexionBD();
  
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
  
 //Nueva asignatura
 if(idAsignatura==null||opcion=="editar"){
  	//El formulario esta vacio
	if (asignatura==null && disabled ==null){
	    messageBean.setMsg("");
		//Redirecciono a la vista que muestra la pagina.	  
	    %>
	    <jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	    <% 
	  }
	  //Si no hemos introducido el nombre de la asignatura que vamos a crear
	  if (curso==null)	  {
	     if(asignatura.equals("")){
	     	messageBean.setMsg("Introduzca el nombre de la asignatura");
			//Redirecciono a la vista que muestra la pagina.	  
	     	%>
	     	<jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	     	<% 
	     }else{
		    //Buscar las titulaciones y los cursos asignados a cada titulacion
			query = pm.getPropiedad("selectTitCur"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(titulacion);  
			micon = new ConexionBD();
			Vector resultado = micon.doSelect(query, params);
			//existe titulacion con ese nombre
			if(resultado.size()!=0){
			 centroBean.setContador(resultado.size());
			 for(Integer i=0;i<centroBean.getContador();i++){
			   	item = (Hashtable)resultado.get(i);  	
			   	Integer idEst=(Integer)item.get("id_EstDocente");
			   	String nombreTit=(String)item.get("nombre");
		       	centroBean.setId(idEst,i);
	           	centroBean.setCentro(nombreTit,i);
				
				//Buscar los cursos de cada titulacion
				query = pm.getPropiedad("selectCurso"); 
				params.removeAllElements(); //Elimino elementos del vector
				params.add(idEst);
				micon = new ConexionBD();
				Vector resultadoCur = micon.doSelect(query, params);
				if(resultadoCur.size()!=0){
			      titulacionBean.setContador(resultadoCur.size(),i);
				  for(int j=0;j<titulacionBean.getContador(i);j++){
				    //datos del curso
			      	item = (Hashtable)resultadoCur.get(j);  	
					String nombreCur=(String)item.get("nombre");
			        Integer idCurso=(Integer)item.get("id_EstDocente");
					Integer orden=(Integer)item.get("orden");
					titulacionBean.setId(idCurso,i,j);
					titulacionBean.setTitulacion(nombreCur,i,j);
				  }
				} 				
			}
			   messageBean.setMsg("Elija la titulación");
			}else{//No hay ninguna titulación con ese nombre 
			   messageBean.setMsg("Titulación no encontrada");
			}
		 	//Redirecciono a la vista que muestra la pagina.	  
         	%>
	     	<jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	     	<% 
	   }            
	}else {//paso a asignarle profesor
		    asignaturaBean.setNombreAsig(asignatura);
			asignaturaBean.setNombreTit(titulacion);
			asignaturaBean.setNombreCurso(curso);
			
			%>
			<jsp:forward page="../controller/mantenimientoProfAsigController.jsp"/>
			<%	
	} 
 }
 //editar o borrar asignatura
 if(idAsignatura!=null){ 
   //Mostrar los datos a editar o eliminar
   if (asignatura==null && disabled==null){
	 messageBean.setMsg("");
	 query = pm.getPropiedad("SelectDatosAsignatura"); 
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(idAsignatura);
	 micon = new ConexionBD();
	 Vector resultado = micon.doSelect(query, params);
	 item = (Hashtable)resultado.get(0);  
	 String nombre = (String)item.get("nombre");
	 Integer id = (Integer)item.get("id_EstDocente");
	 asignaturaBean.setNombreAsig(nombre);
	 
	 //nombre del curso
	 query = pm.getPropiedad("SelectNombreCurso"); 
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(id);
	 micon = new ConexionBD();
	 resultado = micon.doSelect(query, params);
	 item = (Hashtable)resultado.get(0);  
	 nombre = (String)item.get("nombre");
	 id = (Integer)item.get("id_EstDocAntecesora"); 
	 asignaturaBean.setNombreCurso(nombre);
	 
	 //nombre de la titulacion
	 query = pm.getPropiedad("SelectNombreTit"); 
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(id);
	 micon = new ConexionBD();
	 resultado = micon.doSelect(query, params);
	 item = (Hashtable)resultado.get(0);  
	 nombre = (String)item.get("nombre"); 
	 asignaturaBean.setNombreTit(nombre);
	 messageBean.setMsg("");
	 //Redirecciono a la vista que muestra la pagina.	  
	 %>
	 <jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	 <% 
   }
   //Editar
   if(opcion.equals("editar")){
      //Modificar el nombre o la titulación de la asignatura
	  query = pm.getPropiedad("updateAsignatura"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(asignatura); 
	  params.add(curso); 
	  params.add(idAsignatura); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Asignatura Modificada");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	 <jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	 <%
   }
   //Borrar asignatura
   if(opcion.equals("borrar")){
   	  //borro la asignatura y la relacion profesor-asignatura
	  query = pm.getPropiedad("deleteAsignatura"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idAsignatura); 
	  micon.doUpdate(query, params);
	  
	  query = pm.getPropiedad("deleteProfAsig"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idAsignatura); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Asignatura Borrada");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	  <jsp:forward page="../view/verDatosAsignaturaView.jsp"/>
	  <%
   }
 }
}%>  