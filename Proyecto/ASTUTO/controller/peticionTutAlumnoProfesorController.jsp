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
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
 %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
} else {//Si esta logado

 //Datos extraidos del formulario
 String correo = request.getParameter("correo");
 String idPetTut = request.getParameter("idPeticionTut"); 
 String idAlumno = request.getParameter("idAlumno");
 String opcion = request.getParameter("opcion");
 String correoBuscar = request.getParameter("correoBuscar");
 String disabled = request.getParameter("disabled");
 String login = request.getParameter("login");
 String asignatura = request.getParameter("asignatura");
 String buscar = request.getParameter("buscar");

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
 //mostrar las peticion de tutoria del alumno
 if(idPetTut==null ){
  //NUEVO
  if (correo==null) { 
     messageBean.setMsg("");
  } else {//Buscar Alumno
    //busco alumno para ver si existe	
 	params.removeAllElements(); //Elimino elementos del vector
	params.add(correo);	
	query = pm.getPropiedad("selectAlumno"); 
	micon = new ConexionBD();
	Vector resultado = micon.doSelect(query,params);
	//existe alumno con ese correo
	if(resultado.size()!=0){
		item = (Hashtable)resultado.get(0);  
		Integer id_Alumno=(Integer)item.get("id_alumno");	
		String nombre=(String)item.get("nombre");
		//guardo informacion alumno
		alumnoBean.setCorreo(correo);
		alumnoBean.setNombre(nombre);
		alumnoBean.setId (id_Alumno);
		
		if(asignatura==null || asignatura.equals ("null")){
		  asignatura="";
		}		
		//busco si ese alumno ha realizado alguna peticion de tutoria
		params.removeAllElements(); //Elimino elementos del vector
		params.add(id_Alumno);
		params.add(login);
		params.add(asignatura);
		query = pm.getPropiedad("selectPeticionTutProfesor"); 
		micon = new ConexionBD();
		Vector resultadoPetTut = micon.doSelect(query,params);
		//si existe peticion de ese alumno
		if(resultadoPetTut.size()!=0){
			peticionTutBean.setContador(resultadoPetTut.size());
			//informacion de cada uno de las peticion de ese alumno
			for (int i=0; i<peticionTutBean.getContador(); i++){
			 item = (Hashtable)resultadoPetTut.get(i);  
			 Integer idPeticionTut=(Integer)item.get("id_peticionTut");
			 Integer idProfesor = (Integer)item.get("id_profesor");
			 Integer idAsignatura = (Integer)item.get("id_asignatura");
			 String motivo = (String)item.get("motivo");
			 Integer estado =(Integer)item.get("estado");
			 peticionTutBean.setMotivo(motivo,i);
			 peticionTutBean.setId(idPeticionTut,i);
			 peticionTutBean.setAceptado(estado,i);
			 
			 //Nombre y apellidos profesor
			 params.removeAllElements(); //Elimino elementos del vector
			 params.add(idProfesor);
			 query = pm.getPropiedad("selectNombreProf"); 
			 micon = new ConexionBD();
			 resultado = micon.doSelect(query,params);
			 item = (Hashtable)resultado.get(0);  
			 String nombreProf = (String)item.get("nombre");
			 String apellidos = (String)item.get("apellidos");
			 profBean.setNombre(nombreProf,i);
			 profBean.setApellidos(apellidos,i);
			 
			 //Nombre asignatura
			 params.removeAllElements(); //Elimino elementos del vector
			 params.add(idAsignatura);
			 query = pm.getPropiedad("selectNombreAsig"); 
			 micon = new ConexionBD();
			 resultado = micon.doSelect(query,params);
			 item = (Hashtable)resultado.get(0);  
			 String nombreAsig = (String)item.get("nombre");
			 asignaturaBean.setNombre(nombreAsig,i);			 
			} 
			//Redirecciono a la vista que muestra la pagina.	  
			%>
               <jsp:forward page="../view/peticionTutAlumnoProfesorView.jsp"/>
            <% 
		}		
	}
   }
 }
 //Mostrar informacion de la peticion de tutoria
 if(idPetTut!=null && opcion ==null){
		//buscar Informacion tutoria si se ha aceptado
		query = pm.getPropiedad("selectDatosBorrarPeticionTut"); 
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idPetTut); 
		micon = new ConexionBD();
		Vector resultado=micon.doSelect(query, params);
		item = (Hashtable)resultado.get(0);  
		Integer idProfesor=(Integer)item.get("id_profesor");
		Integer idAsignatura=(Integer)item.get("id_asignatura");
		String motivo=(String)item.get("motivo");
		peticionTutBean.setMotivo(motivo);
				 
		//Nombre y apellidos profesor
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idProfesor);
		query = pm.getPropiedad("selectNombreProf"); 
		micon = new ConexionBD();
		resultado = micon.doSelect(query,params);
		item = (Hashtable)resultado.get(0);  
		String nombreProf = (String)item.get("nombre");
		String apellidos = (String)item.get("apellidos");
		profesorBean.setNombre(nombreProf);
		profesorBean.setApellidos(apellidos);
				 
		//Nombre de la asignatura
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idAsignatura);
		query = pm.getPropiedad("selectNombreAsig"); 
		micon = new ConexionBD();
		resultado = micon.doSelect(query,params);
		item = (Hashtable)resultado.get(0);  
		String nombreAsig = (String)item.get("nombre");
		asignaturaBean.setNombreAsig(nombreAsig);
		
		//Datos de la petición de la tutoría
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idPetTut);
		query = pm.getPropiedad("selectInformacionTut"); 
		micon = new ConexionBD();
		resultado = micon.doSelect(query,params);
		item = (Hashtable)resultado.get(0);  
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer horaFin = (Integer)item.get("horaFin");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		Integer minutosFin = (Integer)item.get("minutosFin");
		
		String comentario = (String)item.get("comentarioProfesor");
		Integer estado =(Integer)item.get("estado");
		peticionTutBean.setDia(dia);
		peticionTutBean.setMes(mes);
		peticionTutBean.setAnyo(anyo);
		peticionTutBean.setHoraInicio(horaInicio);
		peticionTutBean.setHoraFin(horaFin);
		peticionTutBean.setMinutosInicio(minutosInicio);
		peticionTutBean.setMinutosFin(minutosFin);
		peticionTutBean.setComentario(comentario);
		peticionTutBean.setEstado(estado);
		//Redirecciono a la vista que muestra la pagina.	  
		%>
          <jsp:forward page="../view/informacionPeticionTutProfesorView.jsp"/>
        <% 
	}
 
}
%>
            