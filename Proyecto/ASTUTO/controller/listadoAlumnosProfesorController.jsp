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
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%  
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()=="")
{
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
} else { //Si esta logado

 //Extraigo del formulario
 String correoBuscar=request.getParameter("correoBuscar");
 String correo=request.getParameter("correo");
 String asignatura=request.getParameter("asignatura");
 String idAlumno=request.getParameter("idAlumno");
 String disabled=request.getParameter("disabled");
 String login=request.getParameter("login");
 String opcion=request.getParameter("opcion");
 
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
 //Buscar alumnos
 if(idAlumno==null){
 //Formulario vacio
 if (correo==null ) { 
   messageBean.setMsg("");
   //Redirecciono a la vista que muestra la pagina.	  
   %>
   <jsp:forward page="../view/buscarAlumnoProfesorView.jsp"/>
   <% 
 }
 //No se introduce ningun dato
 else{
   if(correo==("") && asignatura==("") ){
		messageBean.setMsg("Introduzca alg�n dato");
		//Redirecciono a la vista que muestra la pagina.	  
		%>
               <jsp:forward page="../view/buscarAlumnoProfesorView.jsp"/>
        <%		 
	}else{//Introducimos datos de busqueda
	    //Bucar los alumnos que cumplan con los criterios de busqueda	
		params.add(login);
		params.add(asignatura);
		params.add(correo);
		query = pm.getPropiedad("selectDatosPetTutProfesorEstado"); 
		micon = new ConexionBD();

		Vector resultado = micon.doSelect(query,params);
		//Si alumno que cumpla los criterios
		if(resultado.size()!=0){
		 alumnoBean.setContador(resultado.size());
		 for(int i=0;i< resultado.size();i++){
		 	//Extraigo los datos de los alumnos
			item = (Hashtable)resultado.get(i);  
			Integer id_alumno=(Integer)item.get("id_alumno");
			correo = (String)item.get("email");
			String nombre = (String)item.get("nombre");
			alumnoBean.setId(id_alumno,i);
			alumnoBean.setNombre(nombre,i);
			alumnoBean.setCorreo(correo,i);
		 }
		 //Redirecciono a la vista que muestra la pagina.	  
		 %>
           <jsp:forward page="../view/alumnoMantProfesorView.jsp"/>
         <%
		} else {//No existe alumno con esos datos
	     messageBean.setMsg("Datos no encontrados");
		 //Redirecciono a la vista que muestra la pagina.	  
		 %>
               <jsp:forward page="../view/buscarAlumnoProfesorView.jsp"/>
         <%    
		}
 	}
 }
}
}%>            