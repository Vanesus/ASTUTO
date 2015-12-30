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
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaraci�n de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="excepcionBean" class="uco.interfaz.ExcepcionBean" scope="session"/>
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>

<%
//Si no esta logado, te envia a la pagina principal de invitados
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
} else {//Si esta logado. 
 
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
  ConexionBD micon=new ConexionBD();   // objeto que realiza la conexi�n con la base de datos
    
  //Datos extraidos del formulario
  int dia = Integer.parseInt(request.getParameter("dia"));//d�a
  int m = Integer.parseInt(request.getParameter("mes"));//mes
  int a = Integer.parseInt(request.getParameter("anyo"));//a�o
  
  //Guardar datos en el bean         
  tutoriaDiaBean.setDia(dia,0);
  tutoriaDiaBean.setMes(m,0);
  tutoriaDiaBean.setAnyo(a,0);
  excepcionBean.setDia(dia);
  excepcionBean.setMes(m);
  excepcionBean.setAnyo(a);
  
  //Crear variable formato inicializada con el formato yyyy/MM/dd
  SimpleDateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
  String fechaStr=String.valueOf(a+"/"+m+"/"+dia+"");
  //Crear variable tipo fecha inicializada a la fecha seleccionada desde el formulario
  Date fecha = formato.parse(fechaStr);
  //Dia de la semana
  Integer semana=fecha.getDay();
		
  String usuario=loginBean.getUser();
  //Buscar identificador del usuario
  query = pm.getPropiedad("selectIdUsuario");  
  params.add(usuario); 
  Vector resultadoUsuario = micon.doSelect(query,params);
  item = (Hashtable)resultadoUsuario.get(0); 
  Integer idUsuario = (Integer)item.get("id_usuario");
	
  //Buscar el identificador del profesor que corresponde con el usuario logado
  params.removeAllElements();
  query = pm.getPropiedad("selectIdProfUs");  
  params.add(idUsuario); 
  Vector resultadoProf = micon.doSelect(query,params);
  item = (Hashtable)resultadoProf.get(0); 
  Integer idProfesor = (Integer)item.get("id_profesor");
	
  //Buscar si para ese d�a hay horario de tutor�a asignado
  params.removeAllElements();
  query = pm.getPropiedad("selectHorarioDiaSemana");  
  params.add(idProfesor); 
  params.add(semana); 
  Vector resultadoHorario= micon.doSelect(query,params);
  //No hay horario de tutor�a para ese d�a
  if(resultadoHorario.size()==0){
  	messageBean.setUrl("No tiene horario de tutor�as asignado");  
  }else{
	messageBean.setUrl("");
	//Extraer datos del horario de tutor�a asignado para ese d�a
	item = (Hashtable)resultadoHorario.get(0); 
	excepcionBean.sethInicio((Integer)item.get("horaInicio"));
	excepcionBean.setmInicio((Integer)item.get("minutosInicio"));
	excepcionBean.sethFin((Integer)item.get("horaFin"));
	excepcionBean.setmFin((Integer)item.get("minutosFin"));
  }
  params.removeAllElements();
  //Buscar si hay alguna excepci�n para ese d�a
  query = pm.getPropiedad("selectExcepcion");  
  params.add(dia); 
  params.add(m); 
  params.add(a); 
  Vector resultadoExcepciones= micon.doSelect(query,params);
  if(resultadoExcepciones.size()==0){
	excepcionBean.setTipo(0);
  }else{//Si hay excepci�n para ese d�a
	item = (Hashtable)resultadoExcepciones.get(0); 
	excepcionBean.setId((Integer)item.get("id_excepcionDia"));
	excepcionBean.setTipo((Integer)item.get("tipo"));
  }
  //Buscar que tipo de d�a es esta fecha dentro del calendario escolar
  params.removeAllElements();
  query = pm.getPropiedad("selectCalendarioFecha");  
  params.add(dia); 
  params.add(m); 
  params.add(a); 
  params.add(m); 
  params.add(a); 
  params.add(a);
  params.add(dia); 
  params.add(m); 
  params.add(a); 
  params.add(m); 
  params.add(a); 
  params.add(a);
  Vector resultadoCalendario= micon.doSelect(query,params);
  if(resultadoCalendario.size()>0){
	item = (Hashtable)resultadoCalendario.get(0); 
	calendarioBean.setTipo((Integer)item.get("tipo"),0);
  }
  else 
  {
    calendarioBean.setTipo(0,0);
  }
  //Buscar si hay alguna asignatura asignada para ese d�a
  params.removeAllElements();
  query = pm.getPropiedad("selectTutoriaDia");  
   micon = new ConexionBD();
   params.add(dia);
   params.add(m);
   params.add(a);
   params.add(idProfesor); 
   Vector resultadoTut = micon.doSelect(query,params);
   //No hay tutor�a asignada
   if(resultadoTut.size()==0){
       messageBean.setMsg("No tiene asignada ninguna tutor�a");
	   	tutoriaDiaBean=null;
	   %>
	   <jsp:forward page="../view/tutoriaDiaView.jsp"/>
	   <%
   }else{//Si hay tutor�a asignada
    tutoriaDiaBean.setContador(resultadoTut.size());
	for(int i=0;i<tutoriaDiaBean.getContador();i++){
	    //Extraer datos de la tutor�a
	    item = (Hashtable)resultadoTut.get(i);
        Integer idPeticion = (Integer)item.get("id_peticionTut");		
        Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		String motivo = (String)item.get("motivo");
		Integer estado = (Integer)item.get("estado");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		Integer horaFin = (Integer)item.get("horaFin");
		Integer minutosFin = (Integer)item.get("minutosFin");
		String comentarioProfesor = (String)item.get("comentarioProfesor");
		
		//Buscar nombre de la asignatura
		params.removeAllElements();
	    query = pm.getPropiedad("selectAsignaturaProf"); 
        params.add(idAsignatura);  //A�ado par�metro usuario
        micon = new ConexionBD();
        Vector resultadoAsig = micon.doSelect(query, params);
		item=(Hashtable)resultadoAsig.get(0);
		String asignatura = (String)item.get("nombre");
		   
		//Buscar email del alumno
		params.removeAllElements();
	    query = pm.getPropiedad("selectNombreAlumno"); 
        params.add(idAlumno);  //A�ado par�metro usuario
        micon = new ConexionBD();
        Vector resultadoAlumno = micon.doSelect(query, params);
		item=(Hashtable)resultadoAlumno.get(0);
		String alumno = (String)item.get("nombre");
		
		tutoriaDiaBean.setId(idPeticion,i);
		tutoriaDiaBean.setnombreAlumno(alumno,i);
		tutoriaDiaBean.setAsignatura(asignatura,i);
		tutoriaDiaBean.setDia(dia,i);
		tutoriaDiaBean.setMes(m,i);
		tutoriaDiaBean.setAnyo(a,i);
		tutoriaDiaBean.setMotivo(motivo,i);
		tutoriaDiaBean.setEstado(estado,i);
		tutoriaDiaBean.setHoraInicio(horaInicio,i);
		tutoriaDiaBean.setMinutosInicio(minutosInicio,i);
		tutoriaDiaBean.setHoraFin(horaFin,i);
		tutoriaDiaBean.setMinutosFin(minutosFin,i);
		tutoriaDiaBean.setComentarioProfesor(comentarioProfesor,i);
	}
  }     
%>	   
<%messageBean.setMsg("");
  tutoriaDiaBean=null;%>
<jsp:forward page="../view/tutoriaDiaView.jsp"/>
<%} %>   