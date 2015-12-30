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
<jsp:useBean id="usuarioBean" class="uco.interfaz.UsuarioBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
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
  
  //Extraigo el identificador del usuario y la opción
  String idUsuario = request.getParameter("idUsuario");	
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
  
  //Cuando muestro los usuarios y cuando vengo de editar, nuevo o borrar	
  if (idUsuario ==null||opcion!=null){	
	// Busco todos los usuarios registrados
	query = pm.getPropiedad("selectDatosUsuario");  
	micon = new ConexionBD();
	// Realiza una consulta en la base de datos pasando la consulta como argumentos
	Vector resultado = micon.doSelect(query);
	usuarioBean.setContador(resultado.size());
	for (int i=0; i<usuarioBean.getContador(); i++){
		//Extraigo los datos de cada usuario
		item = (Hashtable)resultado.get(i);  
		Integer id= (Integer)item.get("id_usuario");
		String login = (String)item.get("login");
		String contrasena = (String)item.get("contrasena");
		Integer rol = (Integer)item.get("rol");
		
		usuarioBean.setId(id,i);
		usuarioBean.setLogin(login,i);
		usuarioBean.setContrasena(contrasena,i);
		usuarioBean.setRol(rol,i);		
    }
   //Redirecciono a la vista que muestra la pagina.	  
   %>
	<jsp:forward page="../view/usuarioMantView.jsp"/>     
   <%
  } else {//mostrar los datos del profesor si es usuario profesor
    // Buscar el login del usuario que he seleccionado mostrarlo arriba
    params.removeAllElements(); //Elimino elementos del vector
    params.add(idUsuario);
    query = pm.getPropiedad("selectLoginUsuario");  
    micon = new ConexionBD();
    // Realiza una consulta en la base de datos pasando la consulta como argumentos
    Vector resultado = micon.doSelect(query,params);
    if (resultado.size()==1){	
		item = (Hashtable)resultado.get(0);
		String login = (String)item.get("login");    
		loginBean.setLogin(login);
		
		//Busco los datos del profesor seleccionado
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idUsuario);
		query = pm.getPropiedad("selectDatosProfesor");  
		micon = new ConexionBD();
		// Realiza una consulta en la base de datos pasando la consulta como argumentos
		resultado = micon.doSelect(query,params);
		if (resultado.size()==1){	
			item = (Hashtable)resultado.get(0);
			Integer idProfesor = (Integer)item.get("id_profesor");  
			String nombre = (String)item.get("nombre");
			String apellidos = (String)item.get("apellidos");
			String email = (String)item.get("email");
			String localizacion = (String)item.get("localizacion");
			String perfilPublico = (String)item.get("PerfilPublico");
			
			profesorBean.setId(idProfesor);
			profesorBean.setNombre(nombre);
			profesorBean.setApellidos(apellidos);
			profesorBean.setEmail(email);
			profesorBean.setLoc(localizacion);
			profesorBean.setPerfPub(perfilPublico);
		}
  	  }
	  //Redirecciono a la vista que muestra la pagina.	  
      %>
	   <jsp:forward page="../view/profesorMantView.jsp"/>     
      <% 
  }		
}%>