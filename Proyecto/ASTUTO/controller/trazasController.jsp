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
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="trazasAlumnosBean" class="uco.interfaz.TrazasAlumnosBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
} else {//Si esta logado
 
  //Estraigo del formulario
  String correo = request.getParameter("correo");
 
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
 //mostrar las peticion de tutoria del alumno
 if (correo==null) { 
     messageBean.setMsg("");
     %>
     <jsp:forward page="../view/buscarTrazasView.jsp"/>
     <% 
  } else {//Buscar Alumno
 
 	//Busco alumno para ver si existe
 	params.add(correo);
	query = pm.getPropiedad("selectAlumno"); 
	micon = new ConexionBD();
	Vector resultado = micon.doSelect(query,params);
	//existe alumno con ese correo
	if(resultado.size()!=0){
		item = (Hashtable)resultado.get(0);  
		Integer id_Alumno=(Integer)item.get("id_alumno");	
		String nombre=(String)item.get("nombre");
		alumnoBean.setCorreo(correo);
		alumnoBean.setNombre(nombre);
		alumnoBean.setId (id_Alumno);
		
		//busco las trazas de ese alumno
		params.removeAllElements(); //Elimino elementos del vector
		params.add(id_Alumno);
		query = pm.getPropiedad("selectTrazas"); 
		micon = new ConexionBD();
		Vector resultadoTrazas = micon.doSelect(query,params);
		//si existe trazas de ese alumno
		if(resultadoTrazas.size()!=0){
			peticionTutBean.setContador(resultadoTrazas.size());
			//informacion de cada uno de las peticion de ese alumno
			for (int i=0; i<peticionTutBean.getContador(); i++){
			 item = (Hashtable)resultadoTrazas.get(i);  
			 Integer idPeticionTut=(Integer)item.get("id_peticionTut");
			 String actividad = (String)item.get("actividad");
			 String accion = (String)item.get("accion");
			 Date fecha=(Date)item.get("fecha");
			 Time hora =(Time)item.get("hora");
			 Integer idProfesor=(Integer)item.get("id_profesor");
			 Integer idAsignatura=(Integer)item.get("id_asignatura");
			 Integer horaInicio=(Integer)item.get("horaInicio");
			 Integer minutosInicio=(Integer)item.get("minutosInicio");
			 Date fechaPeticion=(Date)item.get("fechaPeticion");
			 
			 params.removeAllElements();
			 query = pm.getPropiedad("selectAsignaturaProf"); 
			 params.add(idAsignatura);  //Añado parámetro usuario
			 micon = new ConexionBD();
			 Vector resultadoAsig = micon.doSelect(query, params);
			 item=(Hashtable)resultadoAsig.get(0);
			 String asignatura = (String)item.get("nombre");
				   
			 //Buscamos el nombre del profesor al que hemos asignado la tutoría
			 params.removeAllElements();
			 query = pm.getPropiedad("selectNombreProf"); 
			 params.add(idProfesor);  //Añado parámetro usuario
			 micon = new ConexionBD();
			 Vector resultadoProfesor = micon.doSelect(query, params);
			 item=(Hashtable)resultadoProfesor.get(0);
			 String nombreProf = (String)item.get("nombre");
			 String apellidosProf = (String)item.get("apellidos");
			
			 trazasAlumnosBean.setPetTut(idPeticionTut,i);
			 trazasAlumnosBean.setActividad(actividad,i);
			 trazasAlumnosBean.setAccion(accion,i);
			 trazasAlumnosBean.setFecha(fecha,i);
			 trazasAlumnosBean.setHora(hora,i);
			 trazasAlumnosBean.setFechaPeticion(fechaPeticion,i);
			 trazasAlumnosBean.setHoraInicio(horaInicio,i);
			 trazasAlumnosBean.setMinutosInicio(minutosInicio,i);
			 
			 profBean.setNombre(nombreProf,i);//Nombre del profesor
  			 profBean.setApellidos(apellidosProf,i);//Apellidos del profesor
			 
			 asignaturaBean.setNombre(asignatura,i);  
			}
			//Redirecciono a la vista que muestra la pagina.	  
			%>
               <jsp:forward page="../view/trazasAlumnoView.jsp"/>
            <% 
		} else {//No hay trazas de ese alumno 
		  messageBean.setMsg("No existen trazas");
		  //Redirecciono a la vista que muestra la pagina.	  
		  %>
               <jsp:forward page="../view/buscarTrazasView.jsp"/>
           <% 
		}		
	} else {//no existe el alumno con ese correo
	    messageBean.setMsg("No existe alumno");
		//Redirecciono a la vista que muestra la pagina.	  
		%>
               <jsp:forward page="../view/buscarTrazasView.jsp"/>
        <%    
	}
	//Redirecciono a la vista que muestra la pagina.	  
    %>
    <jsp:forward page="../view/buscarTrazasView.jsp"/>
    <%
  }
 }%>          