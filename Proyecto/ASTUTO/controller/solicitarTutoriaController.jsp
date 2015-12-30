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
<%@ page import = "java.text.*" %>

<%-- Declaraci�n de los javaBeans usados en este fichero --%>
<jsp:useBean id="correoBean" class="uco.interfaz.CorreoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//Extraigo el identificador de la operaci�n a realizar
String alumno = request.getParameter("alumno");//Nombre y apellidos alumno
String correo = request.getParameter("correo");//Correo del alumno
String motivo = request.getParameter("motivo"); //Motivo de la peticio�n
String idProfesorR = request.getParameter("idProfesor");//identificador profesor
String idAsignaturaR = request.getParameter("idAsignatura");//identificador asignatura
String code=request.getParameter ("code");
//Si el identificador de asignatura es null
if (idAsignaturaR==null)
{
   idAsignaturaR = request.getParameter("asignatura");
}
String direccionUrl;
//Extraigo String del fichero web.xml que contiene la ruta de la ubicaci�n del fichero de propiedades 
//en el que se encuentran las consultas de la base de datos
String curDir = (String)getServletContext().getInitParameter("ruta");
//Creo objeto GestorPropuedades para gestionar las consultas de la base de datos,
//a partir de la ruta anterior curDir y especificando el nombre del fichero.
GestorPropiedades pm = new GestorPropiedades(curDir,"ConsultasASTUTO.properties");
//Declaraci�n de variables 
String query;
Vector params = new Vector();
ConexionBD micon = new ConexionBD();
Hashtable item = null;
Integer idAlumno = null;//Identificador del alumno lo igualo a null
//Creamos una variable tipo Calendar donde introducimos la fecha actural
Calendar fechaEnviar = Calendar.getInstance();
Calendar fechaCaducidad = Calendar.getInstance();

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
  
//Si el formulario esta vacio
if (alumno=="" || motivo=="" || correo=="" ||alumno==null && code==null){ 
	//Buscamos el nombre de la asignatura a la que desea perdir la tutor�a
    params.removeAllElements();
	query = pm.getPropiedad("selectAsignaturaProf"); 
    params.add(idAsignaturaR);  
    micon = new ConexionBD();
    Vector resultadoAsig = micon.doSelect(query, params);
	item=(Hashtable)resultadoAsig.get(0);
	String asignatura = (String)item.get("nombre");//nombre asignatura
	asignaturaBean.setNombreAsig(asignatura);
	
	//Buscamos el nombre y los apellidos del profesor al que desea perdir la tutor�a
	params.removeAllElements();
	query = pm.getPropiedad("selectNombreProf"); 
    params.add(idProfesorR);  
    micon = new ConexionBD();
    Vector resultadoProfesor = micon.doSelect(query, params);
	item=(Hashtable)resultadoProfesor.get(0);
    String nombreProf = (String)item.get("nombre");
	String apellidosProf = (String)item.get("apellidos");
	profesorBean.setNombre(nombreProf);
	profesorBean.setApellidos(apellidosProf);
	 
	messageBean.setMsg("");
	//Redirecciono a la vista que muestra la pagina.
  	%>
  	<jsp:forward page="../view/solicitarTutoriaView.jsp"/>
  	<% 
} else {//Si el forlario esta totalmente relleno
 
 //Mandar correo para que confirme la solicitud en curso
 if (code==null){
    do{
   		//Buscamos si el alumno que desea pedir la tutor�a esta registrado.
   		query = pm.getPropiedad("selectAlumnoId"); 
   		params.removeAllElements(); //Elimino elementos del vector
   		params.add(correo);  
   		Vector resultadoAlumnoId = micon.doSelect(query, params);
   		//Si no esta registrado
   		if(resultadoAlumnoId.size()==0){
   	  		//Insertamos un nuevo alumno con esos datos
	  		query = pm.getPropiedad("insertAlumno"); 
	  		params.removeAllElements(); //Elimino elementos del vector
	  		params.add(correo); 
	  		params.add(alumno); 
	  		micon.doUpdate(query, params);
   		} else {//Si esta registrado busco su identificador
     		item=(Hashtable)resultadoAlumnoId.get(0);
     		idAlumno=(Integer)item.get("id_alumno");
		}
 	}while(idAlumno==null||idAlumno.equals("null"));//hacer esto hasta que tengamos cual es el identificador del alumno que desea pedir la tutor�a. 
   
   	query = pm.getPropiedad("selectManualOAutomatico"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idProfesorR);  
 	params.add(idAsignaturaR);  
 	Vector resultadoMetdAsig = micon.doSelect(query, params);
 	item=(Hashtable)resultadoMetdAsig.get(0);
 	Integer tiempoMaxEspera = (Integer)item.get("tiempoMaxEspera");
 
 //Establezco un numero alatorio de 15 digitos
 String numero="";
 Integer resul=null;
 do
 {
    Random rnd = new Random();
 	int x;
 	numero="";
 	for (int i = 0; i < 15; i++) {
 		x = (int)(rnd.nextDouble() * 10.0);
    	numero+=x;
 	}
	params.removeAllElements();
 	query = pm.getPropiedad("selectExitCode"); 
 	params.add(numero);  //A�ado par�metro usuario
 	micon = new ConexionBD();
 	Vector resultadoCode = micon.doSelect(query, params);
	resul=resultadoCode.size();
 }while(resul!=0);	
	fechaCaducidad.add(Calendar.HOUR,tiempoMaxEspera);//calcular fecha caducidad. fecha actual+ tiempo maximo de espera
	//insertamos una nueva petici�n si asignar para que el alumno confirme la solicitud en curso antes de asignarla
   	query = pm.getPropiedad("insertPeticionTutManual"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idProfesorR); 
 	params.add(idAsignaturaR); 
 	params.add(idAlumno); 
 	params.add(motivo); 
 	params.add(7); //Solicitud en curso
	params.add(numero); 
	params.add(fechaCaducidad.get(Calendar.YEAR)+"-"+(fechaCaducidad.get(Calendar.MONTH)+1)+"-"+fechaCaducidad.get(Calendar.DATE));//fecha Caducidad
  	micon.doUpdate(query, params);
    
 	//Buscamos el nombre de la asignatura a la que hemos asignado la tutor�a
 	params.removeAllElements();
 	query = pm.getPropiedad("selectAsignaturaProf"); 
 	params.add(idAsignaturaR);  //A�ado par�metro usuario
 	micon = new ConexionBD();
 	Vector resultadoAsig = micon.doSelect(query, params);
 	item=(Hashtable)resultadoAsig.get(0);
 	String asignatura = (String)item.get("nombre");
		   
 	//Buscamos el nombre del profesor al que hemos asignado la tutor�a
 	params.removeAllElements();
 	query = pm.getPropiedad("selectNombreProf"); 
 	params.add(idProfesorR);  //A�ado par�metro usuario
 	micon = new ConexionBD();
 	Vector resultadoProfesor = micon.doSelect(query, params);
 	item=(Hashtable)resultadoProfesor.get(0);
 	String nombreProf = (String)item.get("nombre");
 	String apellidosProf = (String)item.get("apellidos");
 
 	//Busco los datos del correo establecidos por el administrador.
 	//Correo tipo 6 peticion de tutor�a
 	params.removeAllElements();
 	query = pm.getPropiedad("selectCorreo"); 
 	params.add(5);  //A�ado par�metro usuario
 	micon = new ConexionBD();
 	Vector resultado = micon.doSelect(query, params);
 	item=(Hashtable)resultado.get(0);
 	String motivo1 = (String)item.get("motivo");
 	String asunto = (String)item.get("asunto");	  
 	String enlace = (String)item.get("enlace");
	
	//Correo tipo 7 enlace del identificador
 	params.removeAllElements();
 	query = pm.getPropiedad("selectCorreo"); 
 	params.add(7);  //A�ado par�metro usuario
 	micon = new ConexionBD();
 	Vector resultadoTut = micon.doSelect(query, params);
 	item=(Hashtable)resultadoTut.get(0);
 	String enlaceTutorias = (String)item.get("enlace");	  
	  
 	correoBean.setReceptor(correo);
 	correoBean.setAsunto(asunto);
 
 	//Reemplazo de motivo del correo para una de las variables.
 	String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 	motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignatura);
 	motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);

 	motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+60+numero);
 	motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+61+numero);
    
	motivoCorreo=motivoCorreo.replace("[[ENLACEMISTUTORIAS]]",enlaceTutorias+"?identificador="+numero+"&identificacion=1");
 	motivoCorreo=motivoCorreo.replace("[[CODE]]",numero);
 
 	messageBean.setUrl("../view/principalView.jsp");		
 	correoBean.setMotivo(motivoCorreo); 
 	messageBean.setMsg("\nSe ha enviado a su correo la solicitud de la petici�n. Desde all� podr� confirmarla o rechazarla para su posterior asignaci�n.");
    
	query = pm.getPropiedad("selectDatosPeticion"); 
    params.removeAllElements(); //Elimino elementos del vector
    params.add(numero);  
    Vector resultadoDtosPet = micon.doSelect(query, params);
    item=(Hashtable)resultadoDtosPet.get(0);
    Integer idPeticionTutR = (Integer)item.get("id_peticionTut");
   
	//Insertamos registro de movimientos del alumno
 	query = pm.getPropiedad("insertRegistroConfirmacion"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idPeticionTutR); 
 	params.add(idProfesorR); 
 	params.add(idAsignaturaR); 
 	params.add(idAlumno); 
 	params.add("Confirmaci�n Petici�n en Curso"); 
 	params.add("Enviar"); 
 	params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 	params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 	micon.doUpdate(query, params);
 
 	//Redirecciono a la vista que muestra la pagina.
 	%>
  	<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 	<%  
 } else {//Ha sido confimada la solicitud
 
   query = pm.getPropiedad("selectDatosPeticionConfirmacion"); 
   params.removeAllElements(); //Elimino elementos del vector
   params.add(code.substring(2));  
   Vector resultadoDtosPet = micon.doSelect(query, params);
   if (resultadoDtosPet.size()==0){
   	messageBean.setMsg("Esta solicitud ha sido rechazada o ya esta asignada");
	%>
 	<jsp:forward page="../view/principalView.jsp"/>   
	<%
   }	
   item=(Hashtable)resultadoDtosPet.get(0);
   Integer idProfesor = (Integer)item.get("id_profesor");
   Integer idAsignatura = (Integer)item.get("id_asignatura");
   Integer idPeticionTut = (Integer)item.get("id_peticionTut");
   idAlumno = (Integer)item.get("id_alumno");
   motivo = (String)item.get("motivo");
   if (code.substring(1,2).equals("1")) {//Rechazar confirmaci�n
    //Busco si el alumno tiene mas peticiones
	query = pm.getPropiedad("selectIdPeticionTut"); 
	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idAlumno); 
 	Vector resultadoAlum=micon.doSelect(query, params);
	//Si tiene solo esa petici�n 
	if (resultadoAlum.size()==1){
		//Elimino el alumno
		query = pm.getPropiedad("deleteAlumno"); 
 		params.removeAllElements(); //Elimino elementos del vector
 		params.add(idAlumno); 
 		micon.doUpdate(query, params);
	}	
	code=code.substring(2);	
	//Elimino la petici�n ya que ha sido rechazada	
	query = pm.getPropiedad("deletePeticionCode"); 
	params.removeAllElements(); //Elimino elementos del vector
	params.add(code); 
	micon.doUpdate(query, params);
	
	//Insertamos registro de movimientos del alumno
 	query = pm.getPropiedad("insertRegistroConfirmacion"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idPeticionTut); 
 	params.add(idProfesor); 
 	params.add(idAsignatura); 
 	params.add(idAlumno); 
 	params.add("Confirmaci�n Petici�n en Curso"); 
 	params.add("Rechazar"); 
 	params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 	params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 	micon.doUpdate(query, params);
 
	messageBean.setMsg("Su solicitud ha sido rechazada");
	%>
 	<jsp:forward page="../view/principalView.jsp"/>   
	<%		
 }	
 code=code.substring(2);
 
 //Insertamos registro de movimientos del alumno
 query = pm.getPropiedad("insertRegistroConfirmacion"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(idPeticionTut); 
 params.add(idProfesor); 
 params.add(idAsignatura); 
 params.add(idAlumno); 
 params.add("Confirmaci�n Petici�n en Curso"); 
 params.add("Aceptar"); 
 params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 micon.doUpdate(query, params);
 
 //Buscamos si el profesor para esta asignatura quiere que la asignaci�n de la tutor�a sea manual o automatica
 query = pm.getPropiedad("selectManualOAutomatico"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(idProfesor);  
 params.add(idAsignatura);  
 Vector resultadoMetdAsig = micon.doSelect(query, params);
 item=(Hashtable)resultadoMetdAsig.get(0);
 Integer metodoAsignacion = (Integer)item.get("metodoAsignacion");
 Integer tiempoMaxEspera = (Integer)item.get("tiempoMaxEspera");
 Integer previsionMinima = (Integer)item.get("previsionMinima");
 Integer nAusencias = (Integer)item.get("nAusencias");
 
 query = pm.getPropiedad("selectCorreoAlumno"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(idAlumno);  
 Vector resultadoCorreo = micon.doSelect(query, params);
 item=(Hashtable)resultadoCorreo.get(0);
 correo = (String)item.get("email");
 
 //Buscamos cuantas incomparecencias ha tenido este alumno.
 query = pm.getPropiedad("selectNAusencias"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(correo);  
 Vector resultadoNAusencias = micon.doSelect(query, params);
 item=(Hashtable)resultadoNAusencias.get(0);
 Integer nAusenciasAlumno=(Integer)item.get("nAusencias");
 
 //Si el numero de incemparencias realizadas por el alumno son mayor o igual que las establecidas como maximas por el profesor para esa asignatura
 if(nAusenciasAlumno>=nAusencias){
    //Insertamos una nueva petici�n si asignar para que sea el profesor quien la asigne manualmente
   	query = pm.getPropiedad("updatePeticionTutEstadoMan"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(1); 
	params.add(code); 
 	micon.doUpdate(query, params);
	
  	messageBean.setMsg("\nPosteriormente se enviara a su correo la contestaci�n a su petici�n. Desde all� podr� confirmarla o rechazarla.");
 	//Redirecciono a la vista que muestra la pagina.	
	%>
  	<jsp:forward page="../view/principalView.jsp"/>
 	<%
 } 
//Si el profesor quiere una asignaci�n autom�tica
if (metodoAsignacion==2){
 //Creamos una variable tipo Calendar donde introducimos la fecha actural
 Calendar fecha = Calendar.getInstance();
 //Fecha actual mas el tiempo maximo de demora (numero de horas establecidas por el profesor a partir de las cuales se puede asignar la tutor�a)
 fecha.add(Calendar.HOUR,previsionMinima);
 //Declaraci�n de variables
 int dia= 0;//d�a de la semana
 Integer horaInicio=null;
 Integer horaFin=null;
 Integer minutosInicio=null;
 Integer minutosFin =null;
 Integer slot =null;//slot de tiempo. Duraci�n de la tutor�a
 Integer contador=0;
 Integer horaInicioPeticion=null;
 Integer minutosInicioPeticion=null;
 Integer horaFinPeticion=null;
 Integer minutosFinPeticion=null;
 Integer asignacion=null;//tipo de asignacion, al inicio o al final.
do{
 do{
 //D�a de la semana 
 dia= fecha.get(Calendar.DAY_OF_WEEK);
 //Fecha 
 String fechaActual= fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE);
 
 //Buscamos si el d�a que queremos establer la tutoria es festivo. 
 query = pm.getPropiedad("selectBuscarFest"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(fecha.get(Calendar.DATE));  
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR));  
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR));
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR));    
 params.add(fecha.get(Calendar.DATE));  
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR));  
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR)); 
 params.add(fecha.get(Calendar.MONTH)+1);  
 params.add(fecha.get(Calendar.YEAR));   
 Vector resultadoFest = micon.doSelect(query, params);
 if (resultadoFest.size()>0) {//es festivo ese d�a
 	fecha.add(Calendar.HOUR,24);//paso al siguiente dia
 } else {//no es d�a festivo
    //Buscamos si hay alguna excepci�n establecida para ese d�a.
 	query = pm.getPropiedad("selectBuscarExcep"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idProfesor);
 	params.add(fecha.get(Calendar.DATE));  
 	params.add(fecha.get(Calendar.MONTH)+1);  
 	params.add(fecha.get(Calendar.YEAR));  
 	Vector resultadoExcep = micon.doSelect(query, params);
 	if (resultadoExcep.size()==0) {//no hay ninguna excepcion	
 		//Buscomos el horario de la tutoria para ese d�a
 		query = pm.getPropiedad("selectDiaYHoraTutoria"); 
 		params.removeAllElements(); //Elimino elementos del vector
 		params.add(dia-1); 
 		params.add(idProfesor); 
 		params.add(idAsignatura); 
 		params.add(fechaActual);
 		params.add(fechaActual);
 		Vector resultadoDiaHora = micon.doSelect(query, params);
 		contador=resultadoDiaHora.size();
		//Hay tutor�a ese d�a
 		if(resultadoDiaHora.size()==1){
   			item=(Hashtable)resultadoDiaHora.get(0);
			horaInicio = (Integer)item.get("horaInicio");
			horaFin = (Integer)item.get("horaFin");	  
			minutosInicio = (Integer)item.get("minutosInicio");	  
			minutosFin = (Integer)item.get("minutosFin");
			slot = (Integer)item.get("slot"); //duraci�n de la tutoria
			asignacion = (Integer)item.get("asignacion"); //tipo de asignaci�n 	
 		} else {//no hay tutor�as ese d�a 
			fecha.add(Calendar.HOUR,24);//paso al siguiente d�a
		}
 	} else{//hay excepciones ese dia	
 		item=(Hashtable)resultadoExcep.get(0);
		Integer tipo = (Integer)item.get("tipo");//tipo de excepci�n
 		if (tipo==1) {//No se asigna tutor�a para ese d�a		
			fecha.add(Calendar.HOUR,24);// paso al siguiente dia
		} else {//Cambio de horario de tutor�a
			//Cogemos el establecido en la excepci�n
			horaInicio = (Integer)item.get("hInicio");
 			horaFin = (Integer)item.get("hFin");
 			minutosInicio = (Integer)item.get("mInicio");
 			minutosFin = (Integer)item.get("mInicio");
			slot = (Integer)item.get("slot"); 
			asignacion = (Integer)item.get("asignacion");
			contador=1; 
		}
 	}	
 }			
 }while (contador==0);//Hacemos esto hasta que en el d�a seleccionado se pueda asignar tutor�a
 //tipo de asigancion Al Inicio.
 if (asignacion==1){
    //Busco si ese d�a hay alguna tutor�a ya asignada
 	params.removeAllElements();
 	query = pm.getPropiedad("selectPeticonHorario"); 
 	params.add(fecha.get(Calendar.DATE)); 
 	params.add(fecha.get(Calendar.MONTH)+1); 
 	params.add(fecha.get(Calendar.YEAR)); 
 	params.add(idProfesor);  
 	params.add(horaInicio); 
 	params.add(horaFin); 
 	micon = new ConexionBD();
 	Vector resultadoHorario = micon.doSelect(query, params);
 	peticionTutBean.setContador(resultadoHorario.size());
	//Si hay tutoria asignada para ese d�a
 	if (resultadoHorario.size()>=1)	{
	 for (int i=0;i<peticionTutBean.getContador();i++){
	 	//Hago un recorrido por todas las peticiones de ese d�a y las guardo en el bean.
 		item=(Hashtable)resultadoHorario.get(i);
 		horaFinPeticion = (Integer)item.get("horaFin");
 		minutosFinPeticion = (Integer)item.get("minutosFin");
		horaInicioPeticion = (Integer)item.get("horaInicio");
 		minutosInicioPeticion = (Integer)item.get("minutosInicio");
		
		peticionTutBean.setHora(horaInicioPeticion,i);
		configuracionTutBean.setHoraFin(horaFinPeticion,i);
		peticionTutBean.setMinutos(minutosInicioPeticion,i);
		configuracionTutBean.setMinutosFin(minutosFinPeticion,i);
	 }
		horaInicioPeticion=0;//inicializo a 0 
		int i=0;//inicializo a 0 
		do{
			//Si es la primera del vector y la hora de inicio de la peticion igual hora Inicio de la tutor�a
			if (i==0 &&peticionTutBean.getHora(i)==horaInicio&&peticionTutBean.getMinutos(i)==minutosInicio)
			{
				//Si los minutos de Fin de la primero peticion son distitos que los minutos de Inicio de la siguiente y la hora es igual.
				if (configuracionTutBean.getMinutosFin(i)!=peticionTutBean.getMinutos(i+1)&&configuracionTutBean.getHoraFin(i)==peticionTutBean.getHora(i+1))
				{
					//Si los minutos de fin de la primera peticion mas el tiempo de duraci�n de la tutor�as es menos o igual que los minutos de 
					//fin de la siguiente.
					if ((configuracionTutBean.getMinutosFin(i)+slot)<=peticionTutBean.getMinutos(i+1))
					{
						//Asigno una tutor�a con la hora de inicio igual a la hora de Fin de la primera
						// y los minutos de inicio = a los minutos de fin de la primera.
						//Es decir, inserto una tutor�a en medio de la primera y la segunda petici�n ya que el hueco es adecuado.
						horaInicioPeticion=configuracionTutBean.getHoraFin(i);
						minutosInicioPeticion=configuracionTutBean.getMinutosFin(i);
					}
				}
			}
			//Si es la primera del vector y la hora de inicio es mayor o igual que la hora de Inicio de la tutor�a y los minutos son mayores a los de inicio de la tutor�a
			if (i==0 &&((peticionTutBean.getHora(i)==horaInicio&&peticionTutBean.getMinutos(i)>minutosInicio)||(peticionTutBean.getHora(i)>horaInicio)))
			{
				//Si la hora de inicio es igual a la hora de inicio de la tutor�a y los minutos de inicio de la tutor�a mas el tiempo de duraci�n de la tutor�a es menor
				//o igual que los minutos de inicio de la primera petici�n
				if (peticionTutBean.getHora(i)==horaInicio&&(minutosInicio+slot)<=peticionTutBean.getMinutos(i))
				{
					//Asigno una tutor�a con la hora de inicio igual a la hora de Inicio del horario de tutor�a
					// y los minutos de inicio igual a los minutos de inicio del horario de tutor�a.
					//Es decir, inserto una tutor�a al inicio de las peticiones ya que la primera petici�n es distinta que la hora de inicio del horario de tutoria
					// y el hueco es adecuado.	
					horaInicioPeticion=horaInicio;
					minutosInicioPeticion=minutosInicio;
				}
				//Si la hora de inicio de la primera peticion es mayor a la hora de inicio del horario de tutor�a
				if (peticionTutBean.getHora(i)>horaInicio)
				{
				    //Asigno una tutor�a con la hora de inicio igual a la hora de Inicio del horario de tutor�a
					// y los minutos de inicio igual a los minutos de inicio del horario de tutor�a.
					//Es decir, inserto una tutor�a al inicio ya que la primera petici�n es distinta que la hora de inicio del horario de tutoria
					// y el hueco es adecuado.	
					horaInicioPeticion=horaInicio;
					minutosInicioPeticion=minutosInicio;
				}
			}
			//Si la peticion no es ni la primera, ni la �ltima
			if (i>0&&i<peticionTutBean.getContador()-1)
			{
			    //Si los minutos fin de la peticion son distintos de los minutos inicio de la siguiente
				if (configuracionTutBean.getMinutosFin(i)!=peticionTutBean.getMinutos(i+1))
				{
					//si la hora de fin de la peticion es igual a la hora inicio de la siguiente y los minutos fin de la petici�n mas el tiempo
					// de duraci�n de la tutor�a es menor o igual a los minutos inicio de la siguiente
					if (configuracionTutBean.getHoraFin(i)==peticionTutBean.getHora(i+1)&& (configuracionTutBean.getMinutosFin(i)+slot)<=peticionTutBean.getMinutos(i+1))
					{
						//Asigno una tutor�a con la hora de inicio = a la hora de fin de la petici�n
						// y los minutos de inicio igual a los minutos de fin de la petici�n.
						//Es decir, inserto una tutor�a en medio de dos que no son ni la primer ni la �ltima ya que el hueco es adecuado.
						horaInicioPeticion=configuracionTutBean.getHoraFin(i);
						minutosInicioPeticion=configuracionTutBean.getMinutosFin(i);
					}
					//si la hora de fin de la peticion es distinta que la hora de inicio de la siguiente
					if (configuracionTutBean.getHoraFin(i)!=peticionTutBean.getHora(i+1))
					{
					    //Asigno una tutor�a con la hora de inicio = a la hora de fin de la petici�n
						// y los minutos de inicio igual a los minutos de fin de la petici�n.
						//Es decir, inserto una tutor�a en medio de dos que no son ni la primer ni la �ltima ya que el hueco es adecuado.
						horaInicioPeticion=configuracionTutBean.getHoraFin(i);
						minutosInicioPeticion=configuracionTutBean.getMinutosFin(i);
					}	
				}
			}
			//Si el la ultima petici�n
			if (i==peticionTutBean.getContador()-1)
			{
				//Asigno una tutor�a con la hora de inicio = a la hora de fin de la �ltima petici�n
				// y los minutos de inicio igual a los minutos de fin de la �ltima petici�n.
				//Es decir, inserto una tutor�a al final.				
				horaInicioPeticion=configuracionTutBean.getHoraFin(i);
				minutosInicioPeticion=configuracionTutBean.getMinutosFin(i);
			}
			i++;//incremento la i									
		}while (horaInicioPeticion==0);//Hacemos esto hasta que encontremos un hueco o insertemos al final la petici�n nueva
	}
	//Si no hay ninguna asignatura asignada para ese d�a
 	else
 	{
		//Asigno una tutor�a con la hora de inicio = a la hora de incicio del horario de tutor�a
		// y los minutos de inicio = a los minutos de incicio del horario de tutor�a.								
    	horaInicioPeticion=horaInicio;
		minutosInicioPeticion=minutosInicio;
		horaFinPeticion=horaInicio;	
 	}
	//Los minutos de fin los igualo a los minutos de inicio mas es tiempo que durar� la tutor�a
 	minutosFinPeticion= minutosInicioPeticion+slot;
	//La hora de Fin sera igual a la hora de Inicio de la petici�n
 	horaFinPeticion=horaInicioPeticion;
	//Si los minutos de fin son mayor o igual a 60
 	if (minutosFinPeticion>=60)
 	{
		//Incremento en una unidad la hora de Fin de la petici�n
    	horaFinPeticion=horaInicioPeticion+1;
		//Le resto 60 a los minutos de fin de la petici�n y el resultado son los minutos de fin
		minutosFinPeticion=minutosFinPeticion-60;
 	}
	//Si la hora de Inicio de peticion es igual a la hora de fin del horario de tutor�a y los minutos tambi�n son iguales 
	// o la hora de fin de la peticion es mayor o igual que la hora de fin del horario de tutor�a y los minutos son mayores.
	//Es decir, no hay sitio para la peti�n ese d�a
 	if ((horaInicioPeticion==horaFin && minutosInicioPeticion==minutosFin) || (horaFinPeticion>=horaFin && minutosFinPeticion>minutosFin))
		fecha.add(Calendar.HOUR,24);//paso al d�a siguiente
 }
 //tipo de asignaci�n Al Final
 if (asignacion==2){
    //Busco si ese d�a hay alguna tutor�a ya asignada
  	params.removeAllElements();
 	query = pm.getPropiedad("selectPeticonHorarioAlFinal"); 
 	params.add(fecha.get(Calendar.DATE)); 
 	params.add(fecha.get(Calendar.MONTH)+1); 
 	params.add(fecha.get(Calendar.YEAR)); 
 	params.add(idProfesor);  //A�ado par�metro usuario
 	params.add(horaInicio); 
 	params.add(horaFin); 
 	micon = new ConexionBD();
 	Vector resultadoHorario = micon.doSelect(query, params);
 	peticionTutBean.setContador(resultadoHorario.size());
	//Si hay tutoria asignada para ese d�a
 	if (peticionTutBean.getContador()>=1){
	  for (int i=0;i<peticionTutBean.getContador();i++){
	    //Hago un recorrido por todas las peticiones de ese d�a y las guardo en el bean.
 		item=(Hashtable)resultadoHorario.get(i);
 		horaFinPeticion = (Integer)item.get("horaFin");
 		minutosFinPeticion = (Integer)item.get("minutosFin");
		horaInicioPeticion = (Integer)item.get("horaInicio");
 		minutosInicioPeticion = (Integer)item.get("minutosInicio");
		
		peticionTutBean.setHora(horaInicioPeticion,i);
		configuracionTutBean.setHoraFin(horaFinPeticion,i);
		peticionTutBean.setMinutos(minutosInicioPeticion,i);
		configuracionTutBean.setMinutosFin(minutosFinPeticion,i);
	  }
		horaFinPeticion=0;//Inicializo a 0
		int i=0;//Inicializo a 0
		do{
		    //Si es la primera del vector y la hora de fin de la peticion es igual a la hora fin del horario de tutor�a
			if (i==0 &&configuracionTutBean.getHoraFin(i)==horaFin&&configuracionTutBean.getMinutosFin(i)==minutosFin)
			{
			    //Si los minutos de inicio de la primero petici�n son distitos que los minutos de fin de la siguiente y la hora es igual mayor o igual que la hora de fin de la siguiente.
				if (peticionTutBean.getMinutos(i)!=configuracionTutBean.getMinutosFin(i+1)&&peticionTutBean.getHora(i)>=configuracionTutBean.getHoraFin(i+1))
				{
					//Si los minutos de inicio de la primera peticion menos el tiempo de duraci�n de la tutor�as es mayor o igual que los minutos de 
					//fin de la siguiente.
					if ((peticionTutBean.getMinutos(i)-slot)>=configuracionTutBean.getMinutosFin(i+1))
					{
					    //Asigno una tutor�a con la hora de fin igual a la hora de inicio de la primera
						// y los minutos de fin igual a los minutos de inicio de la primera.
						//Es decir, inserto una tutor�a en medio de la primera y la segunda petici�n ya que el hueco es adecuado.
						horaFinPeticion=peticionTutBean.getHora(i);
						minutosFinPeticion=peticionTutBean.getMinutos(i);
					}
				}
			}
			//Si es la primera del vector y la hora de fin es menor o igual que la hora de fin del horar�o de tutor�a 
			if (i==0 &&configuracionTutBean.getHoraFin(i)<=horaFin)
			{
				//Si la hora de fin es igual a la hora de fin del horario de tutor�a y los minutos de fin del horario de tutor�a menos el tiempo de duraci�n de la tutor�a es mayor
				//o igual que los minutos de fin de la primera petici�n
				if (configuracionTutBean.getHoraFin(i)==horaFin&&(minutosFin-slot)>=configuracionTutBean.getMinutosFin(i))
				{
				    //Asigno una tutor�a con la hora de fin igual a la hora de fin del horario de tutor�a
					// y los minutos de fin igual a los minutos de fin del horario de tutor�a.
					//Es decir, inserto una tutor�a al inicio de las peticiones ya que el hueco es adecuado.		
					horaFinPeticion=horaFin;
					minutosFinPeticion=minutosFin;
				}
				//Si la hora de fin de la primera peticion es menor a la hora de fin del horario de tutor�a
				if (configuracionTutBean.getHoraFin(i)<horaFin)
				{
				    //Asigno una tutor�a con la hora de fin igual a la hora de fin del horario de tutor�a
					// y los minutos de fin igual a los minutos de fin del horario de tutor�a.
					//Es decir, inserto una tutor�a al inicio de las peticiones ya que el hueco es adecuado.		
					horaFinPeticion=horaFin;
					minutosFinPeticion=minutosFin;
				}
			}
			//Si la peticion no es ni la primera, ni la �ltima
			if (i>0&&i<peticionTutBean.getContador()-1)
			{
			    //Si los minutos de inicio de la peticion son distintos de los minutos de fin de la siguiente o la hora de inicio de la peticion es mayor que la hora de fin de la siguiente
				if ((peticionTutBean.getMinutos(i)!=configuracionTutBean.getMinutosFin(i+1))||(peticionTutBean.getHora(i)>configuracionTutBean.getHoraFin(i+1)))
				{
					//si la hora de inicio de la peticion es igual a la hora de fin de la siguiente y los minutos de inicio de la petici�n menos el tiempo
					// de duraci�n de la tutor�a es mayor o igual a los minutos de fin de la siguiente
					if (peticionTutBean.getHora(i)==configuracionTutBean.getHoraFin(i+1)&& (peticionTutBean.getMinutos(i)-slot)>=configuracionTutBean.getMinutosFin(i+1))
					{
					    //Asigno una tutor�a con la hora de fin igual a la hora de inicio de la petici�n
						// y los minutos de fin igual a los minutos de inicio de la petici�n.
						//Es decir, inserto una tutor�a en medio de dos peticiones que no son ni la primer ni la �ltima ya que el hueco es adecuado.
						horaFinPeticion=peticionTutBean.getHora(i);
						minutosFinPeticion=peticionTutBean.getMinutos(i);
					}
					//si la hora de fin de la peticion es distinta que la hora de inicio de la siguiente
					if (configuracionTutBean.getHoraFin(i)!=peticionTutBean.getHora(i+1))
					{
					    //Asigno una tutor�a con la hora de fin igual a la hora de inicio de la petici�n
						// y los minutos de fin igual a los minutos de inicio de la petici�n.
						//Es decir, inserto una tutor�a en medio de dos peticiones que no son ni la primer ni la �ltima ya que el hueco es adecuado.
						horaFinPeticion=peticionTutBean.getHora(i);
						minutosFinPeticion=peticionTutBean.getMinutos(i);
					}	
				}
			}
			//Si es la �ltima petici�n
			if (i==peticionTutBean.getContador()-1)
			{
			    //Asigno una tutor�a con la hora de fin igual a la hora de fin de la �ltima petici�n
				// y los minutos de fin igual a los minutos de fin de la �ltima petici�n.
				//Es decir, inserto una tutor�a al final de las peticiones.				
				horaFinPeticion=peticionTutBean.getHora(i);
				minutosFinPeticion=peticionTutBean.getMinutos(i);
			}
			i++;//incremento la i									
		}while (horaFinPeticion==0);
	}
	//Si no hay tutor�as asignadas para ese d�a
 	else
 	{
		//Asigno una tutor�a con la hora de fin igual a la hora de fin del horario de tutor�a
		// y los minutos de fin igual a los minutos de fin del horario de tutor�a.
		// y la hora de inicio igual a la hora de fin del horario de tutor�a.																
    	horaFinPeticion=horaFin;
		minutosFinPeticion=minutosFin;
		horaInicioPeticion=horaFin;	
 	}
	//Los minutos de inicio lo igualo a los minutos de fin menos es tiempo que durar� la tutor�a
 	minutosInicioPeticion=minutosFinPeticion-slot;
	//La hora de inicio igual a la hora de fin de la petici�n.																
 	horaInicioPeticion=horaFinPeticion;
	//Si los minutos de inicio de la petici�n es menos a 0
 	if (minutosInicioPeticion<0)
 	{
		//Disminuyo en una unidad la hora de fin de la petici�n y se la asigno a la hora de inicio.
    	horaInicioPeticion=horaFinPeticion-1;
		//Le sumo 60 a los minutos de inicio de la petici�n y el resultado son los minutos de inicio
		minutosInicioPeticion=minutosInicioPeticion+60;
 	}
	//Si la hora de fin de la petici�n es igual a la hora de inicio del horario de tutor�a y los minutos tambi�n son iguales o
	//la hora de inicio de la petici�n es menor o igual que la hora de inicio del horario de tutor�a y los minutos de inicio de la petici�n 
	// es menor que los minutos de inicio del horario de tutor�a.
	//Es decir, no hay sitio para la peti�n ese d�a
 	if ((horaFinPeticion==horaInicio && minutosFinPeticion==minutosInicio) || (horaInicioPeticion<=horaInicio && minutosInicioPeticion<minutosInicio))
		fecha.add(Calendar.HOUR,24);//paso al siguiente d�a	
  }
}while(((horaInicioPeticion==horaFin && minutosInicioPeticion==minutosFin) || (horaFinPeticion>=horaFin && minutosFinPeticion>minutosFin))||((horaFinPeticion==horaInicio && minutosFinPeticion==minutosInicio) || (horaInicioPeticion<=horaInicio && minutosInicioPeticion<minutosInicio)));

 fechaCaducidad.add(Calendar.HOUR,tiempoMaxEspera);//calcular fecha caducidad. fecha actual+ tiempo maximo de espera
 //Insertamos una nueva petici�n de tutor�a con todos los datos asignados.
 query = pm.getPropiedad("updatePeticionTutEstadoAutoma"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(2); 
 params.add(horaInicioPeticion); 
 params.add(minutosInicioPeticion); 
 params.add(horaFinPeticion); 
 params.add(minutosFinPeticion); 
 params.add(fecha.get(Calendar.DATE)); 
 params.add(fecha.get(Calendar.MONTH)+1); 
 params.add(fecha.get(Calendar.YEAR)); 
 params.add(fechaCaducidad.get(Calendar.YEAR)+"-"+(fechaCaducidad.get(Calendar.MONTH)+1)+"-"+fechaCaducidad.get(Calendar.DATE));//fecha Caducidad
 params.add(code); 
 micon.doUpdate(query, params);	
 
 //Buscamos el identificador de la petici�n que hemos creado.
 query = pm.getPropiedad("selectIdPetTut"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(idProfesor); 
 params.add(idAsignatura); 
 params.add(idAlumno); 
 params.add(motivo); 
 params.add(2); 
 params.add(horaInicioPeticion); 
 params.add(minutosInicioPeticion); 
 params.add(horaFinPeticion); 
 params.add(minutosFinPeticion); 
 params.add(fecha.get(Calendar.DATE)); 
 params.add(fecha.get(Calendar.MONTH)+1); 
 params.add(fecha.get(Calendar.YEAR)); 
 params.add(code); 
 micon = new ConexionBD();
 Vector resultadoId = micon.doSelect(query, params);
 item=(Hashtable)resultadoId.get(0);
 idPeticionTut= (Integer)item.get("id_peticionTut");

 //Buscamos el nombre de la asignatura a la que hemos asignado la tutor�a
 params.removeAllElements();
 query = pm.getPropiedad("selectAsignaturaProf"); 
 params.add(idAsignatura);  //A�ado par�metro usuario
 micon = new ConexionBD();
 Vector resultadoAsig = micon.doSelect(query, params);
 item=(Hashtable)resultadoAsig.get(0);
 String asignatura = (String)item.get("nombre");
		   
 //Buscamos el nombre del profesor al que hemos asignado la tutor�a
 params.removeAllElements();
 query = pm.getPropiedad("selectNombreProf"); 
 params.add(idProfesor);  //A�ado par�metro usuario
 micon = new ConexionBD();
 Vector resultadoProfesor = micon.doSelect(query, params);
 item=(Hashtable)resultadoProfesor.get(0);
 String nombreProf = (String)item.get("nombre");
 String apellidosProf = (String)item.get("apellidos");
 
 //Busco los datos del correo establecidos por el administrador.
 //Correo tipo 1 peticion de tutor�a
 params.removeAllElements();
 query = pm.getPropiedad("selectCorreo"); 
 params.add(1);  //A�ado par�metro usuario
 micon = new ConexionBD();
 Vector resultado = micon.doSelect(query, params);
 item=(Hashtable)resultado.get(0);
 String motivo1 = (String)item.get("motivo");
 String asunto = (String)item.get("asunto");	  
 String enlace = (String)item.get("enlace");	  
	  
 correoBean.setReceptor(correo);
 correoBean.setAsunto(asunto);
 
 //Reemplazo de motivo del correo para una de las variables.
 String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignatura);
 motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
 motivoCorreo=motivoCorreo.replace("[[FECHA]]",(fecha.get(Calendar.DATE)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.YEAR)));
 		
 if (minutosInicioPeticion==0)
 	motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicioPeticion+":00");
 else
 	motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicioPeticion+":"+minutosInicioPeticion);
 
 motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+10+code);
 motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+11+code);
 
 messageBean.setUrl("../view/principalView.jsp");		
 correoBean.setMotivo(motivoCorreo); 
 messageBean.setMsg("\nSe ha enviado a su correo los detalles de la tutor�a. Desde all� podr� confirmarla o rechazarla.");
 
 //Insertamos registro de movimientos del alumno
 query = pm.getPropiedad("insertRegistro"); 
 params.removeAllElements(); //Elimino elementos del vector
 params.add(idPeticionTut); 
 params.add(idProfesor); 
 params.add(idAsignatura); 
 params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 params.add(horaInicioPeticion); 
 params.add(minutosInicioPeticion); 
 params.add(idAlumno); 
 params.add("Petici�n Tutor�a"); 
 params.add("Enviar"); 
 params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
 params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
 micon.doUpdate(query, params);
 //Redirecciono a la vista que muestra la pagina.
 %>
  <jsp:forward page="../controller/enviarCorreoController.jsp"/>
 <% 
 } else {//Si el profesor quiere una asignaci�n manual
	//insertamos una nueva petici�n si asignar para que sea el profesor quien la asigne manualmente
   	query = pm.getPropiedad("updatePeticionTutEstadoMan"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(1); 
	params.add(code); 
 	micon.doUpdate(query, params);
   messageBean.setMsg("\nPosteriormente se enviara a su correo la contestaci�n a su petici�n. Desde all� podr� confirmarla o rechazarla.");
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/principalView.jsp"/>
   <% 
 }
} 
}
 //Redirecciono a la vista que muestra la pagina.        
 %>
 <jsp:forward page="../view/principalView.jsp"/>    