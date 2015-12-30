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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="confInicialBean" class="uco.interfaz.ConfInicialBean" scope="session"/>

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
  
  //Datos extraidos del formulario
  String anyoI1= request.getParameter("anyoI");
  String mesI1= request.getParameter("mesI");
  String diaI1= request.getParameter("diaI");
  
  String anyoF1= request.getParameter("anyoF");
  String mesF1= request.getParameter("mesF");
  String diaF1= request.getParameter("diaF");
  
  String fechaFin1= request.getParameter("fechaFin");
  
  String metodoAsignacion1= request.getParameter("metodoAsignacion");
  String tiempoMaxEspera1= request.getParameter("tiempoMaxEspera");
  String previsionMinima1= request.getParameter("previsionMinima");
  String nAusencias1 =request.getParameter("nAusencias");
  String dia1= request.getParameter("dia");
  String horaInicio1= request.getParameter("horaInicio");
  String horaFin1 =request.getParameter("horaFin");
  String minutosInicio1= request.getParameter("minutosInicio");
  String minutosFin1 =request.getParameter("minutosFin");
  String asignacion1 =request.getParameter("asignacion");
  //Vector de asignaturas
  String idAsig[]=new String [40];
  String idAsignatura1=request.getParameter("asignatura");
  for (int i=0;i<asignaturaProfBean.getContador();i++){
	idAsig[i]=request.getParameter(asignaturaProfBean.getAsignatura(i)+profBean.getTitulacion(i,0));
  }			
  String idProf=request.getParameter("idProfesor");
  String idConfTut=request.getParameter("idConfTut");
  String opcion=request.getParameter("opcion");
 
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
  
  if (idProf ==null&&idConfTut==null&&opcion==null){
    //Buscar el identificador del profesor logado
  	params.add(loginBean.getUser());
  	query = pm.getPropiedad("selectBuscarIdProfesor");  
  	micon = new ConexionBD();
  	Vector resultadoid = micon.doSelect(query,params);
  	item = (Hashtable)resultadoid.get(0);  
  	Integer idProfesor = (Integer)item.get("id_profesor");
  	configuracionTutBean.setIdProfesor (idProfesor,0);
  
  	//Buscar los datos de las asignaturas que imparte el profesor
  	params.removeAllElements(); //Elimino elementos del vector
  	params.add(loginBean.getUser());
  	query = pm.getPropiedad("selectAsigProf");  
  	micon = new ConexionBD();
  	Vector resultado = micon.doSelect(query,params);
  	asignaturaProfBean.setContador(resultado.size());
  	for (int i=0; i<asignaturaProfBean.getContador(); i++){
    	item = (Hashtable)resultado.get(i);  
  		String asignatura = (String)item.get("nombre");
    	Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer id_EstDocente =(Integer)item.get("id_EstDocente");
		asignaturaProfBean.setAsignatura(asignatura,i);
		asignaturaProfBean.setId(idAsignatura,i);
	
		//Buscar el nombre de la titulación a la que pertenece la asignatura
		params.removeAllElements(); //Elimino elementos del vector
		params.add(id_EstDocente);
		query = pm.getPropiedad("selectNombreTitulacion");  
		micon = new ConexionBD();
		Vector resultadoTit = micon.doSelect(query, params);
		item = (Hashtable)resultadoTit.get(0);  	
		String NombreTit=(String)item.get("nombre");
		profBean.setTitulacion(NombreTit,i,0);
  	}
    
	//Buscar los datos de todos los horario de tutorías que tiene asignadas el profesor
  	params.removeAllElements(); //Elimino elementos del vector
  	params.add(loginBean.getUser());
  	query = pm.getPropiedad("selectHorario");  
  	micon = new ConexionBD();
  	resultado = micon.doSelect(query,params);
  	configuracionTutBean.setContador(resultado.size());
  	for (int i=0; i<configuracionTutBean.getContador(); i++){
    	item = (Hashtable)resultado.get(i);  
  		Integer dia = (Integer)item.get("dia");//Dia de la semana
  		Integer horaInicio = (Integer)item.get("horaInicio");//Hora de inicio
		Integer minutosInicio = (Integer)item.get("minutosInicio");//Minutos de inicio
  		Integer horaFin = (Integer)item.get("horaFin");//Hora de fin
		Integer minutosFin = (Integer)item.get("minutosFin");//Minutos de fin
  		Integer idAsignatura = (Integer)item.get("id_asignatura");//Identificador de la asignatura
  		Integer idConfiguracionTut = (Integer)item.get("id_configuracionTut");//Identificador de la configuración de tutoría
	
		configuracionTutBean.setDia (dia,i);
		configuracionTutBean.setHoraInicio (horaInicio,i);
		configuracionTutBean.setHoraFin (horaFin,i);
		configuracionTutBean.setMinutosInicio (minutosInicio,i);
		configuracionTutBean.setMinutosFin (minutosFin,i);
		configuracionTutBean.setIdAsig (idAsignatura,i);
		configuracionTutBean.setIdConfTut (idConfiguracionTut,i);
  	}
	//Buscar los datos de la configuracionGlobal
  	query = pm.getPropiedad("selectConfInicialTutoria");  
	micon = new ConexionBD();
	Vector resultadoTut = micon.doSelect(query);
	if (resultadoTut.size()>=1){
		item = (Hashtable)resultadoTut.get(0);  	
		Integer slot =(Integer)item.get("slot");
		Integer metodoAsignacion=(Integer)item.get("metodoAsignacion");
		Integer tiempoMaxEspera=(Integer)item.get("tiempoMaxEspera");
		Integer previsionMinima=(Integer)item.get("previsionMinima");
		Integer nAusencias=(Integer)item.get("nAusencias");
		
		confInicialBean.setSlot(slot);
		confInicialBean.setMetodo(metodoAsignacion);
		confInicialBean.setTiempoEspera(tiempoMaxEspera);
		confInicialBean.setPrevisionMinima(previsionMinima);
		confInicialBean.setNAusencias(nAusencias);
	}
	else
	{
		messageBean.setMsg("No hay configuración inicial establecida por el administrador");
		//Redirecciono a la vista que muestra la pagina.
  		%>
  	    <jsp:forward page="../view/configuracionTutView.jsp"/>
  		<%
	}
	messageBean.setMsg("");
	//Redirecciono a la vista que muestra la pagina.
  	%>
      <jsp:forward page="../view/configuracionTutView.jsp"/>
  	<%
 } 
 //Crear nuevo horario de tutoría
 if(idProf!=null&&opcion==null){
  //No hay ninguna asignatura seleccionada 
  if (idAsig[0]==null&&idAsig[1]==null&&idAsig[2]==null&&idAsig[3]==null&&idAsig[4]==null){
  	messageBean.setMsg("Ninguna asignatura seleccionada");
	//Redirecciono a la vista que muestra la pagina.
	%>
      <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
  	<%
  }
  for (int i=0;i<asignaturaProfBean.getContador();i++){
   if (idAsig[i]!=null){
   //Verificar fecha
    if (anyoI1=="" || anyoF1=="" ||mesI1=="" || mesF1==""||diaI1=="" || diaF1=="")
    {
		messageBean.setMsg("Fecha vacía");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	Integer dI=Integer.parseInt(diaI1.trim());
	Integer mI=Integer.parseInt(mesI1.trim());
	Integer aI=Integer.parseInt(anyoI1.trim());
	Integer dF=Integer.parseInt(diaF1.trim());
	Integer mF=Integer.parseInt(mesF1.trim());
	Integer aF=Integer.parseInt(anyoF1.trim());
	
	if ((dI>dF && mI==mF)|| (mI>mF && aI.equals(aF)) || aI>aF)
	{
		messageBean.setMsg("Error fecha incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
   	//Verificar que la hora introducida es correcta
    if (Integer.parseInt(horaFin1)<=Integer.parseInt(horaInicio1) || ( Integer.parseInt(horaFin1)==Integer.parseInt(horaInicio1) && Integer.parseInt(minutosFin1)<=Integer.parseInt(minutosInicio1))){
	   messageBean.setMsg("Error hora incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	//Buscar los datos de la configuracion Global
	query = pm.getPropiedad("selectConfInicialTutoria");  
	micon = new ConexionBD();
    Vector resultadoTut = micon.doSelect(query);

	item = (Hashtable)resultadoTut.get(0);  	
	Integer slot =(Integer)item.get("slot");
	Integer metodoAsignacion=(Integer)item.get("metodoAsignacion");
	Integer tiempoMaxEspera=(Integer)item.get("tiempoMaxEspera");
	Integer previsionMinima=(Integer)item.get("previsionMinima");
	Integer nAusencias=(Integer)item.get("nAusencias");

	//Insertar un nuevo horario de toturía
   	params.removeAllElements(); //Elimino elementos del vector
  	params.add(idProf);
  	params.add(idAsig[i]);
  	params.add(dia1);
  	params.add(horaInicio1);
  	params.add(horaFin1);
	params.add(minutosInicio1);
  	params.add(minutosFin1);
  	params.add(asignacion1);
	params.add(metodoAsignacion);
	params.add(tiempoMaxEspera);
	params.add(previsionMinima);
	params.add(nAusencias);
	params.add(anyoI1+"/"+mesI1+"/"+diaI1);
	params.add(anyoF1+"/"+mesF1+"/"+diaF1);
	params.add(slot);	
  	query = pm.getPropiedad("insertHorario");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
   }
  }
  messageBean.setMsg("Horario Guardado");
  //Redirecciono a la vista que muestra la pagina.
  %>
  <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
  <%
  }
  messageBean.setMsg("");
  //Pulsar el boton Ver para buscar las asignaturas que tiene tutorías ese día
  if (opcion.equals("Buscar")){
   //Buscar los datos de las asignaturas que tiene horario de tutoría asignado para ese día y ha esa hora.
   params.removeAllElements(); //Elimino elementos del vector
   params.add(dia1);
   params.add(horaInicio1);
   params.add(loginBean.getUser());
   query = pm.getPropiedad("selectDatosAsignaturasHorario");  
   micon = new ConexionBD();
   Vector resultado = micon.doSelect(query,params);
   asignaturaProfBean.setContador(resultado.size());
   for (int i=0; i<asignaturaProfBean.getContador(); i++){
    item = (Hashtable)resultado.get(i);  
  	String asignatura = (String)item.get("nombre");
    Integer idAsignatura = (Integer)item.get("id_asignatura");
	Integer id_EstDocente =(Integer)item.get("id_EstDocente");
	asignaturaProfBean.setAsignatura(asignatura,i);
	asignaturaProfBean.setId(idAsignatura,i);
	
	//Buscar los datos del horario de tutoría para cada asignatura encontrada en la anterior busqueda. 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idAsignatura);
	params.add(dia1);
	params.add(horaInicio1);
	query = pm.getPropiedad("selectHoraInicio");  
	micon = new ConexionBD();
	Vector resultadoHora = micon.doSelect(query, params);
	item = (Hashtable)resultadoHora.get(0);  	
	Integer horaInicio=(Integer)item.get("horaInicio");
	Integer minutosInicio=(Integer)item.get("minutosInicio");
	Integer horaFin=(Integer)item.get("horaFin");
	Integer minutosFin=(Integer)item.get("minutosFin");
	Date fechaInicio=(Date)item.get("fechaInicio");
	Date fechaFin=(Date)item.get("fechaFin");
	
	configuracionTutBean.setHoraInicio (horaInicio, i);
	configuracionTutBean.setMinutosInicio (minutosInicio,i);
	configuracionTutBean.setHoraFin (horaFin, i);
	configuracionTutBean.setMinutosFin (minutosFin,i);
	configuracionTutBean.setFechaInicio (fechaInicio, i);
	configuracionTutBean.setFechaFin (fechaFin,i);
	
	//Buscar el nombre de la titulación a la que pertenece cada asignatura
	params.removeAllElements(); //Elimino elementos del vector
	params.add(id_EstDocente);
	query = pm.getPropiedad("selectNombreTitulacion");  
	micon = new ConexionBD();
	Vector resultadoTit = micon.doSelect(query, params);
	item = (Hashtable)resultadoTit.get(0);  	
	String NombreTit=(String)item.get("nombre");
	profBean.setTitulacion(NombreTit,i,0);
   }
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/verAsignaturasTutoriaView.jsp"/>
   <%
 }
 //Editar o eliminar horario de tutoría
 if (opcion!=null && idConfTut==null)
 {
   //Buscar los datos del horario de tutoría que deseamos eliminar o editar, para mostrarlo con anterioridad
   params.removeAllElements(); //Elimino elementos del vector
   params.add(dia1);
   params.add(horaInicio1);
   params.add(idAsignatura1);
   query = pm.getPropiedad("selectDatosHorarioAsig");  
   micon = new ConexionBD();
   Vector resultado = micon.doSelect(query,params);
   
   item = (Hashtable)resultado.get(0);  
   Integer horaFin = (Integer)item.get("horaFin");
   Integer horaInicio = (Integer)item.get("horaInicio");
   Integer minutosFin = (Integer)item.get("minutosFin");
   Integer minutosInicio = (Integer)item.get("minutosInicio");
   Integer idConfiguracionTut = (Integer)item.get("id_configuracionTut");
   Integer dia =(Integer)item.get("dia");
   Integer asignacion =(Integer)item.get("asignacion");
   Integer idAsignatura =(Integer)item.get("id_asignatura");
   Integer metodoAsignacion =(Integer)item.get("metodoAsignacion");
   Integer tiempoMaxEspera =(Integer)item.get("tiempoMaxEspera");
   Integer previsionMinima =(Integer)item.get("previsionMinima");
   Integer nAusencias =(Integer)item.get("nAusencias");
   Date fechaInicio =(Date)item.get("fechaInicio");
   Date fechaFin =(Date)item.get("fechaFin");
	
   configuracionTutBean.setDia (dia,0);
   configuracionTutBean.setHoraInicio (horaInicio,0);
   configuracionTutBean.setHoraFin (horaFin,0);
   configuracionTutBean.setMinutosInicio (minutosInicio,0);
   configuracionTutBean.setMinutosFin (minutosFin,0);
   configuracionTutBean.setIdConfTut (idConfiguracionTut,0);
   configuracionTutBean.setAsignacion (asignacion,0);
   configuracionTutBean.setIdAsig (idAsignatura,0);
   configuracionTutBean.setFechaInicio(fechaInicio,0);
   configuracionTutBean.setFechaFin(fechaFin,0);
	
   messageBean.setMsg("");
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
   <%
 }
 //Editar horario de tutoría
 if (opcion.equals("editar")){
    //Verificar fecha
   //Verificar fecha
    if (fechaFin1=="")
    {
		messageBean.setMsg("Fecha vacía");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	if (fechaFin1.length()<10){
		messageBean.setMsg("Error fecha incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	if (fechaFin1.substring(2,3).equals("/") || fechaFin1.substring(5,6).equals("/")){
	}else{
		messageBean.setMsg("Error fecha incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	String diaFin=fechaFin1.substring(0,2);
	String mesFin=fechaFin1.substring(3,5);
	String anyoFin=fechaFin1.substring(6,10);
	
	Integer dF=Integer.parseInt(diaFin.trim());
	Integer mF=Integer.parseInt(mesFin.trim());
	Integer aF=Integer.parseInt(anyoFin.trim());
	
	if (aF<1900 || dF>31 || dF<1 || mF<1 || mF>12){
		messageBean.setMsg("Error fecha incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
 	//Verificar que la hora es correcta
	if (Integer.parseInt(horaFin1)<=Integer.parseInt(horaInicio1) || ( Integer.parseInt(horaFin1)==Integer.parseInt(horaInicio1) && Integer.parseInt(minutosFin1)<=Integer.parseInt(minutosInicio1))){
	   messageBean.setMsg("Error hora incorrecta");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
       <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
       <%
	}
	//Modificar los datos del horario de tutoría seleccionado.
	params.removeAllElements(); //Elimino elementos del vector
	params.add(horaInicio1);
	params.add(horaFin1);
	params.add(minutosInicio1);
	params.add(minutosFin1);
	params.add(asignacion1);
	params.add(aF+"-"+mF+"-"+dF);
	params.add(idConfTut);	
	query = pm.getPropiedad("updateHorario");  
	micon = new ConexionBD();
	micon.doUpdate(query,params);
	messageBean.setMsg("Horario Modificado");
	//Redirecciono a la vista que muestra la pagina.
  	%>
    <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
  	<%
 }
 //Borrar un horario de tutoría
 if (opcion.equals("borrar")){
 	 //Eliminar el horario de tutoría
	 params.removeAllElements(); //Elimino elementos del vector
	 params.add(idConfTut);	
	 query = pm.getPropiedad("deleteHorario");  
	 micon = new ConexionBD();
	 micon.doUpdate(query,params);
	 messageBean.setMsg("Horario Borrado");
	 //Redirecciono a la vista que muestra la pagina.
  	 %>
     <jsp:forward page="../view/verDatosConfTutoriaView.jsp"/>
  	 <%
 }
}%>          