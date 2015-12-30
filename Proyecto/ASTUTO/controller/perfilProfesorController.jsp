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
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%
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
  
  //Extraigo el identificador del profesor y de la asignatura necesarios para la operación ha realizar
  String idProfesor = request.getParameter("idProf");	
  String idAsignatura = request.getParameter("idAsignatura");
	
  //Lista los enlaces de interes relacionados con los alumnos.
  query = pm.getPropiedad("selectEnlacesAlumno");  
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
  messageBean.setMsg("");
		
  //Buscamos los datos del profesor seleccionado. Para mostrar su perfil.
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idProfesor);
  query=pm.getPropiedad("selectDatosProf");
  micon = new ConexionBD();
  Vector resultadoDatosProf = micon.doSelect(query,params);
	
  item = (Hashtable)resultadoDatosProf.get(0);  
  String nombre=(String)item.get("nombre");
  String apellidos=(String) item.get("apellidos");
  String email=(String) item.get("email");
  String localizacion= (String) item.get("localizacion");
  String perfilPublico=(String)item.get("PerfilPublico");
  
  //Indicaciones para mostrar el perfil del profesor
  profesorBean.setNombre(nombre);//Nombre del profesor
  profesorBean.setApellidos(apellidos);//Apellidos del profesor
  profesorBean.setEmail(email);//Email
  profesorBean.setLoc(localizacion);//Localización del despacho
  profesorBean.setPerfPub(perfilPublico);//Perfil Publico
  
  //Buscamos el nombre de la asignatura asignada al profesor que hemos seleccionado.
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idAsignatura);
  query = pm.getPropiedad("selectNombreAsig");  
  micon = new ConexionBD();
  Vector resultadoNombre = micon.doSelect(query, params);
  item = (Hashtable)resultadoNombre.get(0);  	
  String NombreAsig=(String)item.get("nombre");
  asignaturaBean.setNombreAsig(NombreAsig);  
  
  //Creamos una variable tipo Calendar donde introducimos la fecha actural
  Calendar fecha = Calendar.getInstance();
  //Creamos una variable tipo String donde introducimos la fecha antual con el formato que necesitamos
  String fechaActual= fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE);
  
  //Buscamos el horario de tutorias que tiene ese profesor para esa asignatura. 
  params.removeAllElements(); //Elimino elementos del vector
  params.add(idAsignatura);
  params.add(idProfesor);
  query = pm.getPropiedad("selectHorarioAsig");  
  micon = new ConexionBD();
  Vector resultado = micon.doSelect(query, params);
  
  //si existe horario 
  if (resultado.size()>=1){
		configuracionTutBean.setContador(resultado.size());
    	for (int i=0; i<configuracionTutBean.getContador(); i++){
   		 	item = (Hashtable)resultado.get(i);  
   			Integer dia = (Integer)item.get("dia");
			Integer horaInicio  = (Integer)item.get("horaInicio");
			Integer minutosInicio  = (Integer)item.get("minutosInicio");
			Integer horaFin  = (Integer)item.get("horaFin");
			Integer minutosFin  = (Integer)item.get("minutosFin");
			Date fechaInicio  = (Date)item.get("fechaInicio");
			Date fechaFin  = (Date)item.get("fechaFin");
			
			//Indicaciones para mostrar los datos de la tutoría
    		configuracionTutBean.setDia(dia,i);//Dia de la semana
			configuracionTutBean.setHoraInicio(horaInicio,i); //Hora de Inicio
			configuracionTutBean.setMinutosInicio(minutosInicio,i); //Minutos de Inicio
			configuracionTutBean.setHoraFin(horaFin,i); //Hora de Fin
			configuracionTutBean.setMinutosFin(minutosFin,i); //Minutos de Fin
			configuracionTutBean.setFechaInicio(fechaInicio,i); //Fecha de Inicio
			configuracionTutBean.setFechaFin(fechaFin,i); //Fecha de Fin
   		}
		//Redirecciono a la vista que muestra la pagina.
		%>
			<jsp:forward page="../view/perfilProfesorView.jsp"/>   
		<%      
  } else { //Si no tiene horario de tutoría asignado 
	   messageBean.setMsg("No tiene horario de tutoría asignado");
	   //Redirecciono a la vista que muestra la pagina.
	   configuracionTutBean=null;
		%>
			<jsp:forward page="../view/perfilProfesorView.jsp"/>   
		<%  
  }%>