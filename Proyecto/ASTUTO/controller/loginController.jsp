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
// Extraigo nombre de usuario y contrase�a del formulario
String usuario = request.getParameter("login");
String contrasena = request.getParameter("contrasena");

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
// Si es la primera vez que accedo a este fichero (a�n no se ha logado el usuario)
if (usuario==null||contrasena==null){ 
  messageBean.setMsg("");
  //Redirecciono a la vista que muestra la pagina.
  %>
  <jsp:forward page="../view/loginView.jsp"/>
  <% 
}

//Buscar si existe usuario con ese login y contrase�a
query = pm.getPropiedad("selectUsuario"); 
params = new Vector();
params.add(usuario);  //A�ado par�metro usuario
params.add(contrasena); //A�ado par�metro contrase�a
micon = new ConexionBD();
Vector resultado = micon.doSelect(query, params);

//Existe un usuario con esa contrase�a
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
    //Si no existe un usuario con esa contrase�a redirecciono a la pagina de acceso
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


            