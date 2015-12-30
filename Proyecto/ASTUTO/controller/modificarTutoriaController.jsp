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
<%@ page import = "java.util.Arrays" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="correoBean" class="uco.interfaz.CorreoBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
}else{ //Si esta logado
  
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
  ConexionBD micon=new ConexionBD();   // objeto que realiza la conexión con la base de datos
  //Creamos una variable tipo Calendar donde introducimos la fecha actural
  Calendar fechaEnviar = Calendar.getInstance();

  //Datos extraidos del formulario
  String asig = request.getParameter("asig");
  String estado1 = request.getParameter("estado1");	
  String opcion = request.getParameter("opcion");
  String asignatura = request.getParameter("asignatura");
  String correo = request.getParameter("correo");
  String horaInicio = request.getParameter("horaInicio");
  String minutosInicio = request.getParameter("minutosInicio");
  String horaFin = request.getParameter("horaFin");
  String minutosFin = request.getParameter("minutosFin");
  String estado = request.getParameter("estado");
  String dia = request.getParameter("dia");
  String mes = request.getParameter("mes");
  String anyo = request.getParameter("anyo");

//Si la opcion es modificar, borrar o aceptar
if(opcion.equals("modificar")||opcion.equals("borrar")||opcion.equals("aceptar")){
	//Buscar el identificador del profesor
	String usuario=loginBean.getUser();
	query = pm.getPropiedad("selectBuscarIdProfesor");  
	params.add(usuario); 
	Vector resultado = micon.doSelect(query,params);
	item = (Hashtable)resultado.get(0); 
	Integer idProfesor = (Integer)item.get("id_profesor");
	params.removeAllElements();
	
	//Buscar los datos de las asiganturas que imparte el profesor
	query = pm.getPropiedad("selectNombreAsignaturas");  
	params.add(idProfesor); 
	Vector resultadoAsignaturas = micon.doSelect(query,params);
	//No imparte ninguna asignatura
	if(resultadoAsignaturas.size()==0){
	    messageBean.setMsg("No tiene asignaturas asignadas");
	} else { //Si imparte asignaturas
		asignaturaProfBean.setContador(resultadoAsignaturas.size());
		for(int i=0;i<asignaturaProfBean.getContador();i++){ 
			//Extraer datos de la asignatura que imparte el profesor
            item = (Hashtable)resultadoAsignaturas.get(i); 
		    String nombreAsignatura = (String)item.get("nombre");
		    Integer idAsignatura = (Integer)item.get("id_asignatura");
	        asignaturaProfBean.setAsignatura(nombreAsignatura,i);
		    asignaturaProfBean.setId(idAsignatura,i);
	     }
	}
	//Datos extraidos
	Integer i = Integer.parseInt(request.getParameter("i"));  
	if(i!=0) //Si la posicion en el vector no es la primera
	{
		 //Extraigo los datos del bean  que corresponda para introducirlo de nuevo en el mimsmo bean en la primera posicion del bean
		 tutoriaDiaBean.setId(tutoriaDiaBean.getId(i),0);
		 tutoriaDiaBean.setnombreAlumno(tutoriaDiaBean.getnombreAlumno(i),0);
		 tutoriaDiaBean.setNAusencias(tutoriaDiaBean.getNAusencias(i),0);
		 tutoriaDiaBean.setcorreoAlumno(tutoriaDiaBean.getcorreoAlumno(i),0);
		 tutoriaDiaBean.setAsignatura(tutoriaDiaBean.getAsignatura(i),0);
		 tutoriaDiaBean.setMotivo(tutoriaDiaBean.getMotivo(i),0);
		 tutoriaDiaBean.setEstado(tutoriaDiaBean.getEstado(i),0);
		 tutoriaDiaBean.setDia(tutoriaDiaBean.getDia(i),0);
		 tutoriaDiaBean.setMes(tutoriaDiaBean.getMes(i),0);
		 tutoriaDiaBean.setAnyo(tutoriaDiaBean.getAnyo(i),0);
		 tutoriaDiaBean.setHoraInicio(tutoriaDiaBean.getHoraInicio(i),0);
		 tutoriaDiaBean.setMinutosInicio(tutoriaDiaBean.getMinutosInicio(i),0);
		 tutoriaDiaBean.setHoraFin(tutoriaDiaBean.getHoraFin(i),0);
		 tutoriaDiaBean.setMinutosFin(tutoriaDiaBean.getMinutosFin(i),0);
		 tutoriaDiaBean.setComentarioProfesor(tutoriaDiaBean.getComentarioProfesor(i),0);
	}
    messageBean.setMsg("");
	//Redirecciono a la vista que muestra la pagina.
	%>
    <jsp:forward page="../view/modificarTutoriaView.jsp"/>
    <%
}
//Si la opcion es modificar los datos de la tutoría
else if (opcion.equals("editar")){
	//Convertir los datos de String a Integer
	Integer horaI=Integer.parseInt(horaInicio.trim());
	Integer horaF=Integer.parseInt(horaFin.trim());
	Integer minI=Integer.parseInt(minutosInicio.trim());
	Integer minF=Integer.parseInt(minutosFin.trim());
	Integer d=Integer.parseInt(dia.trim());
	Integer m=Integer.parseInt(mes.trim());
	Integer a=Integer.parseInt(anyo.trim());
	
	//Verificar que la fecha es correcta
	if (d>31 || m>12 || m<1 || d<1 || a<1900){
		messageBean.setMsg("Error fecha incorrecta");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	}
	//Verificar que la hora es correcta
	if (horaI>horaF || (horaI==horaF && minI>minF)){//Fecha erronea
		messageBean.setMsg("Error hora incorrecta");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	}else{	//Fecha correcta
	  if (horaFin.equals(horaInicio)) //Si la hora de fin es igual a la hora de inicio
	  	query = pm.getPropiedad("selectCoincide"); 
	  else //Si la hora de fin es distinta a la hora de inicio
	  	query = pm.getPropiedad("selectCoincide1"); 
		
	  //Buscar si hay alguna tutoría ese dia y a esa hora para que no puedan coincidir	
	  params.removeAllElements();
	  params.add(dia); 	  
	  params.add(mes); 
	  params.add(anyo);
	  params.add(horaInicio);
	  params.add(horaInicio);
	  params.add(minutosInicio);
      params.add(horaInicio);	
	  params.add(horaFin);
	  params.add(horaFin);
	  if (horaFin.equals(horaInicio))
	  	params.add(minutosFin);
	  params.add(tutoriaDiaBean.getId(0)); 	
	  params.add(tutoriaDiaBean.getId(0));   	  
	  micon = new ConexionBD();
      Vector resultadoCoincide = micon.doSelect(query, params);
	  //Hay una tutoría asignada para ese dia y a esa hora
      if (resultadoCoincide.size()>0){
	    messageBean.setMsg("Error ese día y a esa hora tiene ya una tutoría asignada");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	  } else { //No hay ninguna tutoría ya asignada para ese dia y a esa hora
	   //Modificar los datos de la tutoría	
	   query = pm.getPropiedad("updatePeticionTutoria"); 
	   params.removeAllElements();
	   params.add(dia); 
	   params.add(mes); 
	   params.add(anyo); 
	   params.add(horaInicio);
	   params.add(minutosInicio);
	   params.add(horaFin);
	   params.add(minutosFin);
	   params.add(estado);
       params.add(tutoriaDiaBean.getId(0)); 	  
	   micon.doUpdate(query, params);
	   if (estado.equals("6")){//Si el alumno no ha asistido a la tutoria, estado incomparesencia
	   	//Incremetamos en una unidad el numero de ausencias del alumno
	   	query = pm.getPropiedad("updateAlumnoAusencias"); 
	   	params.removeAllElements();
		params.add(1); 	  
		params.add(tutoriaDiaBean.getId(0)); 
	   	micon.doUpdate(query, params);
	   }
	   //Mandar correo 		
	   if (correo!=null){
	   	//Buscar los datos de la tutoria seleccionada para editar
	    params.removeAllElements();
		query = pm.getPropiedad("selectDatosCorreoEditar"); 
 		params.add(tutoriaDiaBean.getId(0)); 	  
	    micon = new ConexionBD();
 		Vector resultado = micon.doSelect(query, params);
 		item=(Hashtable)resultado.get(0);
 		Integer idProfesor = (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");	
 		String motivo = (String)item.get("motivo");	  
 		String code = (String)item.get("code");	  
		Integer idAlumno = (Integer) item.get("id_alumno");
		
		//Buscar el email del alumno al que petenece la tutoria
		params.removeAllElements();
 		query = pm.getPropiedad("selectCorreoAlumno"); 
 		params.add(idAlumno);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoAlum = micon.doSelect(query, params);
 		item=(Hashtable)resultadoAlum.get(0);
 		String correoAlumno = (String)item.get("email");
		
		//Buscar el nombre de la asignatura
		params.removeAllElements();
 		query = pm.getPropiedad("selectAsignaturaProf"); 
 		params.add(idAsignatura);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoAsig = micon.doSelect(query, params);
 		item=(Hashtable)resultadoAsig.get(0);
 		String asignaturaNombre = (String)item.get("nombre");
		   
		//Buscar el nombre y apellidos del profesor
		params.removeAllElements();
 		query = pm.getPropiedad("selectNombreProf"); 
 		params.add(idProfesor);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoProfesor = micon.doSelect(query, params);
 		item=(Hashtable)resultadoProfesor.get(0);
 		String nombreProf = (String)item.get("nombre");
 		String apellidosProf = (String)item.get("apellidos");
	 
	    //Busco los datos del correo establecidos por el administrador.
 	    //Correo tipo 4 petición tutoría modificada
	  	params.removeAllElements();
		query = pm.getPropiedad("selectCorreo"); 
 		params.add(4);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoCorreo = micon.doSelect(query, params);
 		item=(Hashtable)resultadoCorreo.get(0);
 		String motivo1 = (String)item.get("motivo");
 		String asunto = (String)item.get("asunto");	  
 		String enlace = (String)item.get("enlace");	  
	  
		correoBean.setReceptor(correoAlumno);
		correoBean.setAsunto(asunto);
 		
		//Reemplazo de motivo del correo para una de las variables.
		String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 		motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignaturaNombre);
 		motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
 		motivoCorreo=motivoCorreo.replace("[[FECHA]]",dia+"-"+mes+"-"+anyo);
		if(estado.equals("1"))
			motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Solicitada");
		if(estado.equals("2"))
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Enviada");
		if(estado.equals("3"))
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Confirmada");
		if(estado.equals("4"))
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Realizada");
		if(estado.equals("5"))
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","No Realiazada");
		if(estado.equals("6"))
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","No Realiazada");
			
 		if (minutosInicio.equals("0"))
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":00");
 		else
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":"+minutosInicio);
 
		motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+40+code);
 		motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+41+code);
 
 		messageBean.setUrl("../view/modificarTutoriaView.jsp?opcion=salir");		
 		correoBean.setMotivo(motivoCorreo); 
 		
 		messageBean.setMsg("\nTutoría Modificada");
 
 		//Insertamos registro de movimientos del alumno
		query = pm.getPropiedad("insertRegistro"); 
		params.removeAllElements(); //Elimino elementos del vector
		params.add(tutoriaDiaBean.getId(0)); 
		params.add(idProfesor); 
		params.add(idAsignatura); 
		params.add(anyo+"-"+mes+"-"+dia); 
		params.add(horaInicio); 
		params.add(minutosInicio); 
		params.add(idAlumno); 
		params.add("Petición Modificada"); 
		params.add("Enviar"); 
		params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 		params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 		micon.doUpdate(query, params);
		
 		//Redirecciono a la vista que muestra la pagina.		
 		%>
  		<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 		<% 
	  }else{ //No mandar correo
	   messageBean.setMsg("Tutoría Modificada");
	   //Redirecciono a la vista que muestra la pagina.
	   %>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
       <% 
	   }
	  }
	 }
} 
//Si la opcion es eliminar la tutoría
else if(opcion.equals("eliminar")){
	  //Mandar correo
	  if (correo!=null)
	  {
	    //Buscar los datos de la tutoria seleccionada para borrar
	    params.removeAllElements();
		query = pm.getPropiedad("selectDatosCorreoEditar"); 
 		params.add(tutoriaDiaBean.getId(0)); 	  
	    micon = new ConexionBD();
 		Vector resultado = micon.doSelect(query, params);
 		item=(Hashtable)resultado.get(0);
 		Integer idProfesor = (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");	
 		String motivo = (String)item.get("motivo");	  
 		String code = (String)item.get("code");
		Integer idAlumno = (Integer)item.get("id_alumno");	  
		Integer dia1 = (Integer)item.get("dia");	  
		Integer mes1 = (Integer)item.get("mes");	  
		Integer anyo1 = (Integer)item.get("anyo");	  
		Integer horaInicio1 = (Integer)item.get("horaInicio");	  
		Integer minutosInicio1 = (Integer)item.get("minutosInicio");	  
		
		//Buscar el email del alumno al que petenece la tutoria
		params.removeAllElements();
 		query = pm.getPropiedad("selectCorreoAlumno"); 
 		params.add(idAlumno);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoAlum = micon.doSelect(query, params);
 		item=(Hashtable)resultadoAlum.get(0);
 		String correoAlumno = (String)item.get("email");
		
		//Eliminar la petición de tutoría
		query = pm.getPropiedad("deletePeticionTut"); 
	  	params.removeAllElements();
      	params.add(tutoriaDiaBean.getId(0)); 	  
	 	micon.doUpdate(query, params);
	  
	    //Buscar los datos de la asignatura
		params.removeAllElements();
 		query = pm.getPropiedad("selectAsignaturaProf"); 
 		params.add(idAsignatura);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoAsig = micon.doSelect(query, params);
 		item=(Hashtable)resultadoAsig.get(0);
 		String asignaturaNombre = (String)item.get("nombre");
		   
		//Buscar el nombre y apellidos del profesor
		params.removeAllElements();
 		query = pm.getPropiedad("selectNombreProf"); 
 		params.add(idProfesor);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoProfesor = micon.doSelect(query, params);
 		item=(Hashtable)resultadoProfesor.get(0);
 		String nombreProf = (String)item.get("nombre");
 		String apellidosProf = (String)item.get("apellidos");
	 
	    //Busco los datos del correo establecidos por el administrador.
 	    //Correo tipo 3 petición tutoría eliminada
	  	params.removeAllElements();
		query = pm.getPropiedad("selectCorreo"); 
 		params.add(3);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoCorreo = micon.doSelect(query, params);
 		item=(Hashtable)resultadoCorreo.get(0);
 		String motivo1 = (String)item.get("motivo");
 		String asunto = (String)item.get("asunto");	  
 		String enlace = (String)item.get("enlace");	  
	  
		correoBean.setReceptor(correoAlumno);
		correoBean.setAsunto(asunto);
 
 		//Reemplazo de motivo del correo para una de las variables.
		String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 		motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignaturaNombre);
 		motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
		if (dia1==null)
		{
		 motivoCorreo=motivoCorreo.replace("[[FECHA]]","");
		 motivoCorreo=motivoCorreo.replace("[[HORA]]","");
 		}else{
 		  motivoCorreo=motivoCorreo.replace("[[FECHA]]",dia1+"-"+mes1+"-"+anyo1);
		
 		  if (minutosInicio1.equals("0"))
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio1+":00");
   		  else
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio1+":"+minutosInicio1);
 		}
 		messageBean.setUrl("../view/modificarTutoriaView.jsp?opcion=salir");		
 		correoBean.setMotivo(motivoCorreo); 
 		
 		messageBean.setMsg("\nTutoría Borrada");
 
 		//Insertamos registro de movimientos del alumno
		query = pm.getPropiedad("insertRegistro"); 
		params.removeAllElements(); //Elimino elementos del vector
		params.add(tutoriaDiaBean.getId(0)); 
		params.add(idProfesor); 
		params.add(idAsignatura); 
		if (dia==null)
		{
			params.add(null); 
			params.add(null); 
			params.add(null); 
		}else{
			params.add(anyo1+"-"+mes1+"-"+dia1); 
			params.add(horaInicio1); 
			params.add(minutosInicio1); 
		}
		params.add(idAlumno); 
		params.add("Petición Eliminada"); 
		params.add("Enviar"); 
		params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 		params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 		micon.doUpdate(query, params);
		//Redirecciono a la vista que muestra la pagina.
 		%>
  		<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 		<% 
	  } else { //No manadar correo
	   query = pm.getPropiedad("deletePeticionTut"); 
	   params.removeAllElements();
       params.add(tutoriaDiaBean.getId(0)); 	  
	   micon.doUpdate(query, params);
	   messageBean.setMsg("Tutoría Borrada");
	   //Redirecciono a la vista que muestra la pagina.
	  %>
      <jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
      <%
	  }
} 
//Si la opcion es asignar una tutoría de forma manual
else if(opcion.equals("validar")) {
	//Convertir una variable tipo String a tipo Integer
	Integer horaI=Integer.parseInt(horaInicio.trim());
	Integer horaF=Integer.parseInt(horaFin.trim());
	Integer minI=Integer.parseInt(minutosInicio.trim());
	Integer minF=Integer.parseInt(minutosFin.trim());
	Integer d=Integer.parseInt(dia.trim());
	Integer m=Integer.parseInt(mes.trim());
	Integer a=Integer.parseInt(anyo.trim());
	
	//Verificar que la fecha es correcta
	if (d>31 || m>12 || m<1 || d<1 || a<1900){
		messageBean.setMsg("Error fecha incorrecta");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	}
	//Verificar que la hora es correcta
	if (horaI>horaF || (horaI==horaF && minI>=minF)){ //Hora erronea
		messageBean.setMsg("Error hora incorrecta");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	}else{ //Hora correcta
	  if (horaFin.equals(horaInicio)) //Si la hora de fin es igual a la hora de inicio
	  	query = pm.getPropiedad("selectCoincide"); 
	  else //Si la hora de fin es distinta a la hora de inicio
	  	query = pm.getPropiedad("selectCoincide1"); 
	  //Buscar si hay alguna tutoría ese dia y a esa hora para que no puedan coincidir	 
	  params.removeAllElements();
	  params.add(dia); 	  
	  params.add(mes); 
	  params.add(anyo);
	  params.add(horaInicio);
	  params.add(horaInicio);
	  params.add(minutosInicio);
	  params.add(horaInicio);	
	  params.add(horaFin);
	  params.add(horaFin);
	  if (horaFin.equals(horaInicio))
	  	params.add(minutosFin);
	  params.add(tutoriaDiaBean.getId(0)); 	
	  params.add(tutoriaDiaBean.getId(0));   	  
	  micon = new ConexionBD();
      Vector resultadoCoincide = micon.doSelect(query, params);
      if (resultadoCoincide.size()>0){//Hay tutoría asignada para ese dia y a esa hora
	    messageBean.setMsg("Error ese día y a esa hora tiene ya tutoría asignada");
		//Redirecciono a la vista que muestra la pagina.
	   	%>
  		<jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	  } else {	//No hay tutoría asignada para ese dia y a esa hora
	   //Modificar la petición con los datos introducidos por el profesor
	   query = pm.getPropiedad("updatePeticionEstado"); 
	   params.removeAllElements();
	   params.add(2);
	   params.add(dia); 
	   params.add(mes); 
	   params.add(anyo); 
	   params.add(horaInicio);
	   params.add(minutosInicio);
	   params.add(horaFin);
	   params.add(minutosFin);
       params.add(tutoriaDiaBean.getId(0)); 	  
	   micon.doUpdate(query, params);
	  
	   //Buscar los datos de la tutoria seleccionada para asignar manualmente
	   params.removeAllElements();
	   query = pm.getPropiedad("selectDatosCorreoEditar"); 
       params.add(tutoriaDiaBean.getId(0)); 	  
	   micon = new ConexionBD();
 	   Vector resultado = micon.doSelect(query, params);
       item=(Hashtable)resultado.get(0);
       Integer idProfesor = (Integer)item.get("id_profesor");
	   Integer idAsignatura = (Integer)item.get("id_asignatura");	
 	   String motivo = (String)item.get("motivo");	  
 	   String code = (String)item.get("code");	 
	   Integer idAlumno = (Integer)item.get("id_alumno"); 
		
	   //Buscar el email del alumno
	   params.removeAllElements();
	   query = pm.getPropiedad("selectCorreoAlumno"); 
 	   params.add(idAlumno);  //Añado parámetro usuario
 	   micon = new ConexionBD();
 	   Vector resultadoAlum = micon.doSelect(query, params);
 	   item=(Hashtable)resultadoAlum.get(0);
 	   String correoAlumno = (String)item.get("email");
		
	   //Buscar el nombre de la asignatura
	   params.removeAllElements();
       query = pm.getPropiedad("selectAsignaturaProf"); 
       params.add(idAsignatura);  //Añado parámetro usuario
 	   micon = new ConexionBD();
 	   Vector resultadoAsig = micon.doSelect(query, params);
 	   item=(Hashtable)resultadoAsig.get(0);
 	   String asignaturaNombre = (String)item.get("nombre");
		   
	   //Buscar el nombre y apellidos del profesor
	   params.removeAllElements();
 	   query = pm.getPropiedad("selectNombreProf"); 
 	   params.add(idProfesor);  //Añado parámetro usuario
 	   micon = new ConexionBD();
 	   Vector resultadoProfesor = micon.doSelect(query, params);
 	   item=(Hashtable)resultadoProfesor.get(0);
 	   String nombreProf = (String)item.get("nombre");
 	   String apellidosProf = (String)item.get("apellidos");
	 
	   //Busco los datos del correo establecidos por el administrador.
 	   //Correo tipo 1 petición tutoría 
	   params.removeAllElements();
	   query = pm.getPropiedad("selectCorreo"); 
 	   params.add(1);  //Añado parámetro usuario
 	   micon = new ConexionBD();
 	   Vector resultadoCorreo = micon.doSelect(query, params);
 	   item=(Hashtable)resultadoCorreo.get(0);
 	   String motivo1 = (String)item.get("motivo");
 	   String asunto = (String)item.get("asunto");	  
 	   String enlace = (String)item.get("enlace");	  
	  
		correoBean.setReceptor(correoAlumno);
		correoBean.setAsunto(asunto);
 
 		//Reemplazo de motivo del correo para una de las variables.
		String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 		motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignaturaNombre);
 		motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
 		motivoCorreo=motivoCorreo.replace("[[FECHA]]",dia+"-"+mes+"-"+anyo);
		
 		if (minutosInicio.equals("0"))
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":00");
 		else
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":"+minutosInicio);
 
		motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+10+code);
 		motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+11+code);
 
 		messageBean.setUrl("../view/modificarTutoriaView.jsp?opcion=salir");		
 		correoBean.setMotivo(motivoCorreo); 
   
 		messageBean.setMsg("\nTutoría Asignada");
 
 		//Insertamos registro de movimientos del alumno
		query = pm.getPropiedad("insertRegistro"); 
		params.removeAllElements(); //Elimino elementos del vector
		params.add(tutoriaDiaBean.getId(0)); 
		params.add(idProfesor); 
		params.add(idAsignatura); 
		params.add(anyo+"-"+mes+"-"+dia); 
		params.add(horaInicio); 
		params.add(minutosInicio); 
		params.add(idAlumno); 
		params.add("Petición Tutoría"); 
		params.add("Enviar Manual"); 
		params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
		params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
		micon.doUpdate(query, params);
		//Redirecciono a la vista que muestra la pagina.
 		%>
  		<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 		<% 
	  }
	  }
	 }else{
	    messageBean.setMsg("Tutoría Asignada");
	    //Redirecciono a la vista que muestra la pagina.
	    %>
        <jsp:forward page="../view/modificarTutoriaView.jsp?opcion=salir"/>
        <% 
	  }
}
  tutoriaDiaBean=null;
  %>