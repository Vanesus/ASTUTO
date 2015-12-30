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
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
}else{ //Si esta logado
  
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
		     
  //Datos extraidos del formulario
  String login =request.getParameter("login");			 
  String contrasena =request.getParameter("contrasena");
  String confirmar =request.getParameter("confirmar");			 			 
  String nombre =request.getParameter("nombre");			 
  String apellidos =request.getParameter("apellidos");			 
  String email =request.getParameter("email");			 
  String localizacion =request.getParameter("localizacion");			 
  String perfilPublico =request.getParameter("perfilPublico");			 
  String idProf =request.getParameter("idProfesor"); //Identificador del profesor			 
  String idUsu =request.getParameter("idUsuario");//Identificador del usuario
  String opcion =request.getParameter("opcion");			 

  //Lista los enlaces de interes relacionados con el profesor.
  query = pm.getPropiedad("selectEnlacesProfesor");  
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
 // Ver datos del perfil profesor
 if (opcion==null){  
   if( idProf==null){ //mostrar datos del perfil publico
    messageBean.setMsg("");
	//Buscar el identificador del usuario 
    params.removeAllElements(); //Elimino elementos del vector
	params.add(loginBean.getUser());    
   	query = pm.getPropiedad("selectUsuarioProfesor");  
   	micon = new ConexionBD();
   	Vector resultado = micon.doSelect(query,params);
   	item = (Hashtable)resultado.get(0);  
    Integer idUsuario= (Integer)item.get("id_usuario");	
	loginBean.setId(idUsuario);
	
	//Buscar datos del profesor, perfil publico
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idUsuario);    
   	query = pm.getPropiedad("selectDatosProfesor");  
   	micon = new ConexionBD();
    resultado = micon.doSelect(query,params);

   	item = (Hashtable)resultado.get(0);  
	Integer idProfesor =(Integer)item.get("id_profesor");
   	nombre = (String)item.get("nombre");
	apellidos = (String)item.get("apellidos");
	email = (String)item.get("email");
	localizacion = (String)item.get("localizacion");
	perfilPublico = (String)item.get("PerfilPublico");
	
	profesorBean.setId(idProfesor);
	profesorBean.setNombre(nombre);
	profesorBean.setApellidos(apellidos);
	profesorBean.setEmail(email);
	profesorBean.setLoc(localizacion);
	profesorBean.setPerfPub(perfilPublico);
	//Redirecciono a la vista que muestra la pagina.
    %>
    <jsp:forward page="../view/perfilPublicoProfesorView.jsp"/>
    <%
   }
   //Modificar los datos del perfil publico del profesor
   params.removeAllElements(); //Elimino elementos del vector
   params.add(nombre);
   params.add(apellidos);
   params.add(email);
   params.add(localizacion);
   params.add(perfilPublico);
   params.add(idProf);
   query = pm.getPropiedad("updateProfesor");  
   micon = new ConexionBD();
   micon.doUpdate(query,params);
   messageBean.setMsg("Perfil Modificado");
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/verDatosPerfilProfesorView.jsp"/>
   <%
}else{//Modificar contrase�a
  if( idUsu==null){//modificar contrase�a
    messageBean.setMsg("");
	//Buscar datos del usuario, para modificar la contrase�a
    params.removeAllElements(); //Elimino elementos del vector
	params.add(loginBean.getUser());    
   	query = pm.getPropiedad("selectUsuarioProfesor");  
   	micon = new ConexionBD();
   	Vector resultado = micon.doSelect(query,params);

   	item = (Hashtable)resultado.get(0);  
    Integer idUsuario= (Integer)item.get("id_usuario");	
	login = (String)item.get("login");
	contrasena = (String)item.get("contrasena");
	loginBean.setLogin(login);
	loginBean.setContrasena(contrasena);
	loginBean.setId(idUsuario);
	//Redirecciono a la vista que muestra la pagina.	
	%>
    <jsp:forward page="../view/verDatosCambiarContrasenaView.jsp"/>
    <%
 }else {
  if (confirmar.equals(contrasena)){//Contrase�a y confirmaci�n correcta
    //Modificar contrase�a del usuario
    params.removeAllElements(); //Elimino elementos del vector
  	params.add(contrasena);
  	params.add(idUsu);
  	query = pm.getPropiedad("updateUsuario");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
  	messageBean.setMsg("Contrase�a Modificada");
	//Redirecciono a la vista que muestra la pagina.
  	%>
   <jsp:forward page="../view/verDatosCambiarContrasenaView.jsp?opcion=salir"/>
  	<% 
  }else{//Contrase�a y confirmaci�n no coincide
	messageBean.setMsg("Contrase�a Erronea");
	//Redirecciono a la vista que muestra la pagina.
	%>
	<jsp:forward page="../view/verDatosCambiarContrasenaView.jsp"/>
	<% 
  } 
 }
}
}
%>           