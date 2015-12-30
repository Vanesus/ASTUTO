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
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
// Extraigo nombre de usuario y contraseña del formulario
String usuario = request.getParameter("login");
String contrasena = request.getParameter("contrasena");

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
  for (int i=0; i<enlacesBean.getContador(); i++)
  {
    item = (Hashtable)resultadoEnlaces.get(i);  
    String nombre = (String)item.get("nombre");
	String URL = (String)item.get("URL");
	//Indicaciones para mostrar el nombre y URL del enlace
    enlacesBean.setNombre(nombre,i);
	enlacesBean.setUrl(URL,i);   
  }
// Si es la primera vez que accedo a este fichero (aún no se ha logado el usuario)
if (usuario==null||contrasena==null){ 
  messageBean.setMsg("");
  //Redirecciono a la vista que muestra la pagina.
  %>
  <jsp:forward page="../view/loginView.jsp"/>
  <% 
}

//Buscar si existe usuario con ese login y contraseña
query = pm.getPropiedad("selectUsuario"); 
params = new Vector();
params.add(usuario);  //Añado parámetro usuario
params.add(contrasena); //Añado parámetro contraseña
micon = new ConexionBD();
Vector resultado = micon.doSelect(query, params);

//Existe un usuario con esa contraseña
if (resultado.size() ==1) {  
  //Accedo a la base de datos para comprobar si este usuario es administrador
  params.removeAllElements(); //Elimino elementos del vector
  params.add(usuario);
  query = pm.getPropiedad("selectRol");   
  resultado = micon.doSelect(query, params);
  item=(Hashtable)resultado.get(0);
  Integer rol = (Integer)item.get("rol");
  //Guardo el rol del usuario en loginBean para utilizarlo posteriormente, en la vista
  //para cargar unos marcos y otros
  loginBean.setRol(rol);  
  loginBean.setUser(usuario);
      if (rol.equals(1)){ //administrador	
        direccionUrl="../controller/principalAdministradorController.jsp"; 
      } else {//profesor
         direccionUrl="../controller/principalProfesorController.jsp"; 
      }
    //Si no existe un usuario con esa contraseña redirecciono a la pagina de acceso
    //y muestro un mensaje indicando que se han introducido datos incorrectos   
 }else {  
 messageBean.setMsg("Datos incorrectos");
 direccionUrl="../view/loginView.jsp"; 
}
messageBean=null;
loginBean=null;
%>

<jsp:forward page="<%= direccionUrl %>" >
<jsp:param name="centro" value="blanco" />
</jsp:forward>


            