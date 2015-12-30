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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
}else{ //Si esta logado
 
  // Extraigo
  String login= request.getParameter("login");//login del usuario
  String contrasena= request.getParameter("contrasena");//contrase�a
  String confirmarContrasena= request.getParameter("confirmar");//confirmacion de la contrase�a
  String rol = request.getParameter("rol");//rol
  String idUsuario = request.getParameter("idUsuario");//identificador del usuario
  String opcion = request.getParameter("opcion");//opci�n
  String disabled = request.getParameter("disabled");

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
  ConexionBD micon;   // objeto que realiza la conexi�n con la base de datos
  
  
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
  //opcion nuevo usuario
  if(idUsuario==null){
  	//si el formulario esta vacio
	if (login==null||contrasena==null||login==""||contrasena==""){
	    messageBean.setMsg("");
		//Redirecciono a la vista que muestra la pagina.	  
	    %>
	    <jsp:forward page="../view/verDatosUsuarioView.jsp"/>
	    <% 
	 }
	 //Buscar si existe ya otro usuario con el mismo login
	 query = pm.getPropiedad("selectExitUsuario"); 
	 params.add(login);  
	 micon = new ConexionBD();
	 Vector resultado = micon.doSelect(query, params);
	 //Existe ya otro con el mismo login
	 if (resultado.size() ==1) {
		messageBean.setMsg("Existe Usuario");
		//Redirecciono a la vista que muestra la pagina.	  
		%>
		<jsp:forward page="../view/verDatosUsuarioView.jsp"/>
		<% 
	 } else {//No existe otro usuario con este login
	 	//Si la la confirmacion de la contrase�a es igual a la contrase�
	    if (confirmarContrasena.equals(contrasena)){
  		}else {	//Contrase�a erronea no coincide la confirmacion de la contrase�a
			messageBean.setMsg("Contrase�a Erronea");
			//Redirecciono a la vista que muestra la pagina.	  
			%>
			<jsp:forward page="../view/verDatosUsuarioView.jsp"/>
			<% 
		}
		//Usuario Administrado
		if (rol.equals("1")){
			//inserto usuario administrador
			Integer rol1=1;
			query = pm.getPropiedad("insertUsuario"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(login);  
			params.add(contrasena);  
			params.add(rol1);  
			micon = new ConexionBD();
			micon.doUpdate(query, params);
			messageBean.setMsg("Usuario Guardado");
			//Redirecciono a la vista que muestra la pagina.	  
			%>
			<jsp:forward page="../view/verDatosUsuarioView.jsp"/>
			<% 
		} else {//Usuario Profesor
			//Guarda informacion en bean 
			Integer rol1=2;
			loginBean.setLogin (login);
			loginBean.setRol(rol1);
			loginBean.setContrasena (contrasena);
			//Redirecciono a la vista que muestra la pagina.	  
			%>
	         <jsp:forward page="../controller/mantenimientoProfesorController.jsp"/>
	        <%
		}		  
	}
  }
  //Editar o borrar
  if (idUsuario!=null){
   //Modificar contrase�a
   if (contrasena==null && disabled==null){
     //mostramos los datos que vamos a eliminar o editar
	 query = pm.getPropiedad("selectUsuarioMant"); 
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(idUsuario);  
	 micon = new ConexionBD();
	 Vector resultado = micon.doSelect(query, params);
	 
	 item = (Hashtable)resultado.get(0);  
	 login = (String)item.get("login");
	 contrasena = (String)item.get("contrasena");
	 Integer rol1=(Integer)item.get("rol");
	 loginBean.setLogin(login);
	 loginBean.setContrasena(contrasena);
	 loginBean.setRol(rol1);
	 if (rol1==1 && opcion.equals("borrar")){
	 	query = pm.getPropiedad("selectAdmin"); 
	 	params.removeAllElements(); //Elimino elementos del vector
	 	params.add(1);  
	 	micon = new ConexionBD();
	 	Vector resultadoAdmin = micon.doSelect(query, params);
	    if (resultadoAdmin.size()==1){
			messageBean.setMsg("No se puede eliminar administrador ya que es el �nico de la aplicaci�n");
	 		//Redirecciono a la vista que muestra la pagina.	  
	 		%>
	 		<jsp:forward page="../view/verDatosUsuarioView.jsp"/>
	 		<%
	  	}	
	}	
	 messageBean.setMsg("");
	 //Redirecciono a la vista que muestra la pagina.	  
	 %>
	 <jsp:forward page="../view/verDatosUsuarioView.jsp"/>
	 <%
   }
   //Editar la contrase�a
   if(opcion.equals("editar")){
   	  //Si la confirmaci�n de la contrase�a y la contrase�a coincide
      if (confirmarContrasena.equals(contrasena)){
   	  } else {//Si la confirmaci�n de la contrase�a y la contrase�a no coincide
		messageBean.setMsg("Contrase�a Erronea");
		%>
		<jsp:forward page="../view/verDatosUsuarioView.jsp"/>
		<% 
	  }
	  //modificar la contrase�a
	  query = pm.getPropiedad("updateUsuario"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(contrasena); 
	  params.add(idUsuario); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Contrase�a Cambiada");
	  //Redirecciono a la vista que muestra la pagina.	 
	  %>
	 <jsp:forward page="../view/verDatosUsuarioView.jsp"/>
	 <%
   }
   //Borrar usuario
   if(opcion.equals("borrar")){
      //elimino tanto al usuario como al profesor 
	  query = pm.getPropiedad("deleteUsuario"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idUsuario); 
	  micon.doUpdate(query, params);
	  
	  query = pm.getPropiedad("deleteProfesor"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idUsuario); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Usuario Borrado");
	  //Redirecciono a la vista que muestra la pagina.	 
	  %>
	 <jsp:forward page="../view/verDatosUsuarioView.jsp"/>
	 <%
   }
  }  			   
}%>            