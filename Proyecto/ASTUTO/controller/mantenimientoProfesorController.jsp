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
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==null){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
} else { //Si esta logado

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
  		      
  //Extraigo del formulario
  String nombre= request.getParameter("nombre");//nombre del profesor
  String apellidos= request.getParameter("apellidos");//apellidos del profesor
  String email = request.getParameter("email");//email del profesor
  String localizacion = request.getParameter("localizacion");//localizaci�n del despacho del profesor
  String perfilPublico = request.getParameter("perfilPublico");//perfil publico del profesor
  
  //Extraigo del bean
  String login = loginBean.getLogin();//login del usuario
  String contrasena = loginBean.getContrasena();//contrase�a del usuario
  Integer rol = loginBean.getRol();//rol del usuario
  
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
 //Nuevo usuario rol profesor
 if(idProfesor==null){  
  //si el formulario esta vacio
  if (nombre ==null || apellidos ==null||nombre==""||apellidos==""){
      messageBean.setMsg("");
	  //Redirecciono a la vista que muestra la pagina.	  
      %>
      <jsp:forward page="../view/verDatosProfesorView.jsp"/>
      <% 
  }
  if (nombre !=null && apellidos !=null ){
    //inserto usuario
 	query = pm.getPropiedad("insertUsuario"); 
	params.add(login);  
	params.add(contrasena);  
	params.add(rol);  
	micon = new ConexionBD();
	micon.doUpdate(query, params);
		
	//busco id usuario insertado
	query = pm.getPropiedad("selectIdUsuario"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(login);  
	micon = new ConexionBD();
	Vector resultado= micon.doSelect(query, params);
	item = (Hashtable)resultado.get(0); 	
   	Integer id_usuario = (Integer)item.get("id_usuario");
	
	//inserto profesor con idUsuario
	query = pm.getPropiedad("insertProfesor"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(nombre);  
	params.add(apellidos);  
	params.add(email); 
	params.add(localizacion); 
	params.add(perfilPublico);  
	params.add(id_usuario);  
	micon = new ConexionBD();
	micon.doUpdate(query, params);
	messageBean.setMsg("Usuario Guardado");
	//Redirecciono a la vista que muestra la pagina.	  
	%>
    <jsp:forward page="../view/verDatosUsuarioView.jsp"/>
    <% 	  
  }
 }
 //editar y borrar profesor
 if (idProfesor!=null){
  if (nombre==null && disabled==null||nombre==""||apellidos==""){
     //Datos del profesor que vamos a editar o borrar
	 query = pm.getPropiedad("selectProfesorMant"); 
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(idProfesor);  
	 micon = new ConexionBD();
	 Vector resultado = micon.doSelect(query, params);
	 
	 item = (Hashtable)resultado.get(0);  
	 nombre = (String)item.get("nombre");
	 apellidos = (String)item.get("apellidos");
	 email = (String)item.get("email");
	 localizacion = (String)item.get("localizacion");
	 perfilPublico = (String)item.get("PerfilPublico");
		
	 profesorBean.setNombre(nombre);
	 profesorBean.setApellidos(apellidos);
	 profesorBean.setEmail(email);
	 profesorBean.setLoc(localizacion);
	 profesorBean.setPerfPub(perfilPublico);
	 messageBean.setMsg("");
	 //Redirecciono a la vista que muestra la pagina.	  
	 %>
	 <jsp:forward page="../view/verDatosProfesorView.jsp"/>
	 <%
  }
  //Si la opci�n es editar
  if(opcion.equals("editar")){
  	  //Modifico los datos del profesor
	  query = pm.getPropiedad("updateProfesor"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(nombre); 
	  params.add(apellidos); 
	  params.add(email); 
	  params.add(localizacion);
	  params.add(perfilPublico);  
	  params.add(idProfesor); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Profesor Modificado");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	  <jsp:forward page="../view/verDatosProfesorView.jsp"/>
	  <%
  }
  //Si la opcion es borrar
  if(opcion.equals("borrar")){
      //Buscar el id del usuario para eliminarlo
	  query = pm.getPropiedad("selectIdUsuarioProf"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idProfesor); 
	  Vector resultado =micon.doSelect(query, params);
	  
	  item = (Hashtable)resultado.get(0);   
	  Integer id = (Integer)item.get("id_usuario");
	  
	  //eliminar profesor
	  query = pm.getPropiedad("deleteProfesorMant"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idProfesor); 
	  micon.doUpdate(query, params);
	  
	  //eliminar usuario
	  query = pm.getPropiedad("deleteUsuario"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(id); 
	  micon.doUpdate(query, params);
	  messageBean.setMsg("Usuario y Profesor Borrado");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	 <jsp:forward page="../view/verDatosProfesorView.jsp"/>
	 <%
  }
 }  
} %>            