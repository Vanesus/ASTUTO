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
<jsp:useBean id="correoBean" class="uco.interfaz.CorreoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
// Extraigo del formulario
String correoAlumno = request.getParameter("correo");//Correo del alumno
String identificador = request.getParameter("identificador");//Correo del alumno
String opcion = request.getParameter("opcion");
String identificacion = request.getParameter("identificacion");
String correo = request.getParameter("correoBuscar");//Correo a buscar
String idPetTut = request.getParameter("idPeticionTut");//identificador de la petición


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
for (int i=0; i<enlacesBean.getContador(); i++){
    item = (Hashtable)resultadoEnlaces.get(i);  
    String nombre = (String)item.get("nombre");
	String URL = (String)item.get("URL");
	//Indicaciones para mostrar el nombre y URL del enlace
    enlacesBean.setNombre(nombre,i);
	enlacesBean.setUrl(URL,i);   
}
//Si no hay opción seleccionada
if (opcion==null){
 if (correoAlumno==null &&identificador==null) {//el formulario esta vacio 
  messageBean.setMsg("");
  //Redirecciono a la vista que muestra la pagina.
  %>
  <jsp:forward page="../view/tutoriasAlumnosView.jsp"/>
  <% 
 } else {
  Integer idAlumno=null;
   if (identificacion.equals("1"))//opcion por identificador
   {
 	if (identificador=="")// comprobamos que el identificador este introducido
	{
		messageBean.setMsg("Tiene que introducir el identificador");
  		//Redirecciono a la vista que muestra la pagina.
  		%>
  		<jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=1"/>
  		<% 
	}
	else
	{
	  //Buscamos si ese alumno existe
   		query = pm.getPropiedad("selectAlumnoPorIdentificador"); 
   		params = new Vector();
   		params.add(identificador);  //Añado parámetro usuario
   		micon = new ConexionBD();
   		Vector resultadoAlumnoId = micon.doSelect(query, params);
   		//No existe el alumno
   		if(resultadoAlumnoId.size()==0){
	  		messageBean.setMsg("No existe ningún alumno con ese identificador");
	  		//Redirecciono a la vista que muestra la pagina.
	  		%>
  			<jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=1"/>
  	  		<%
		}
		item=(Hashtable)resultadoAlumnoId.get(0);
        idAlumno = (Integer)item.get("id_alumno");
		correoAlumno = (String)item.get("email");
	    alumnoBean.setCorreo(correoAlumno);
		//Buscamos si el alumno ha realizado alguna petición de tutoría
	  	params.removeAllElements();
	  	query = pm.getPropiedad("selectPeticionTutAlumno"); 
      	params.add(idAlumno);  //Añado parámetro usuario
      	micon = new ConexionBD();
      	Vector resultadoPeticion = micon.doSelect(query, params);
	  	peticionTutBean.setContador(resultadoPeticion.size());
	  	//No ha pedido ninguna tutoría
	  	if(peticionTutBean.getContador()==0){
	      messageBean.setMsg("No hay ninguna tutoría asignada a este identificador");
	      //Redirecciono a la vista que muestra la pagina.
		  %>
          <jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=1"/>
          <%
	   	} else {//Si ha pedido tutorías
	   	 messageBean.setMsg("");
	     for(int i=0;i<peticionTutBean.getContador();i++){
		   //Extraigo los datos de la petición
	       item=(Hashtable)resultadoPeticion.get(i);
		   Integer idProfesor = (Integer)item.get("id_profesor");
		   Integer idAsignatura = (Integer)item.get("id_asignatura");
		   Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		   Integer dia = (Integer)item.get("dia");
		   Integer mes = (Integer)item.get("mes");
		   Integer anyo = (Integer)item.get("anyo");
		   Integer hora = (Integer)item.get("horaInicio");
		   Integer minutos = (Integer)item.get("minutosInicio");
		   Integer estado = (Integer)item.get("estado");
		   
		   peticionTutBean.setId(idPeticionTut,i);
		   peticionTutBean.setDia1(dia,i);
		   peticionTutBean.setMes1(mes,i);
		   peticionTutBean.setAnyo1(anyo,i);
		   peticionTutBean.setHora(hora,i);
		   peticionTutBean.setMinutos(minutos,i);
		   peticionTutBean.setAceptado(estado,i);
		   
		   //Buscamos el nombre de la asignatura de la que ha pedido la tutoría
		   params.removeAllElements();
	       query = pm.getPropiedad("selectAsignaturaProf"); 
           params.add(idAsignatura);  //Añado parámetro usuario
           micon = new ConexionBD();
           Vector resultadoAsig = micon.doSelect(query, params);
		   item=(Hashtable)resultadoAsig.get(0);
		   String asignatura = (String)item.get("nombre");
		   Integer id_EstDocente =(Integer)item.get("id_EstDocente");
		   asignaturaBean.setNombre(asignatura,i);
		   
		   //Buscamos el nombre de la titulación a la que pertenece la asignatura
		   params.removeAllElements(); //Elimino elementos del vector
		   params.add(id_EstDocente);
		   query = pm.getPropiedad("selectNombreTitulacion");  
		   micon = new ConexionBD();
		   Vector resultadoTit = micon.doSelect(query, params);
		   item = (Hashtable)resultadoTit.get(0);  	
		   String NombreTit=(String)item.get("nombre");
		   profBean.setTitulacion(NombreTit,i,0);
		   
		   //Buscamos el nombre y apellidos del profesor al que hemos pedido la tutoría
		   params.removeAllElements();
	       query = pm.getPropiedad("selectNombreProf"); 
           params.add(idProfesor);  //Añado parámetro usuario
           micon = new ConexionBD();
           Vector resultadoProfesor = micon.doSelect(query, params);
		   item=(Hashtable)resultadoProfesor.get(0);
           String nombreProf = (String)item.get("nombre");
		   String apellidosProf = (String)item.get("apellidos");
		   profBean.setNombre(nombreProf,i);
		   profBean.setApellidos(apellidosProf,i);
		 }
		 //Redirecciono a la vista que muestra la pagina.
		 %>
         <jsp:forward page="../view/informacionTutAlumnosView.jsp"/>
         <%
	  }		
	} 
   } 
   if (identificacion.equals("2"))//opcion por identificador
   {
 	if (correoAlumno=="")// comprobamos que el identificador este introducido
	{
		messageBean.setMsg("Tiene que introducir el correo");
  		//Redirecciono a la vista que muestra la pagina.
  		%>
  		<jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=2"/>
  		<% 
	}
	else
	{
	  //Buscamos si ese alumno existe
	   query = pm.getPropiedad("selectAlumno"); 
   		params = new Vector();
   		params.add(correoAlumno);  //Añado parámetro usuario
   		micon = new ConexionBD();
   		Vector resultadoAlumnoId = micon.doSelect(query, params);
   		//No existe el alumno
   		if(resultadoAlumnoId.size()==0){
	  		messageBean.setMsg("No existe ningún alumno con ese email");
	  		//Redirecciono a la vista que muestra la pagina.
	  		%>
  			<jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=2"/>
  	  		<% 
   		} else {//Si existe el alumno
   	  		//Extraemos el identificador del alumno
      		item=(Hashtable)resultadoAlumnoId.get(0);
      		idAlumno = (Integer)item.get("id_alumno");
	  		alumnoBean.setCorreo(correoAlumno);
			
			//Extraigo uno de los "code" del alumno para que pueda ver sus tutorías
			params.removeAllElements();
			query = pm.getPropiedad("selectCode"); 
    		params.add(idAlumno);  //Añado parámetro usuario
    		micon = new ConexionBD();
    		Vector resultadoCode = micon.doSelect(query, params);
			if (resultadoCode.size()==0)
			{
				messageBean.setMsg("No tiene asignada ninguna tutoría este alumno");
	  			//Redirecciono a la vista que muestra la pagina.
	  			%>
  				<jsp:forward page="../view/tutoriasAlumnosView.jsp?opcion=2"/>
  	  			<%
			}
			item=(Hashtable)resultadoCode.get(0);
    		String code = (String)item.get("code");
			
			//Busco los datos del correo establecidos por el administrador.
 	    	//Correo tipo 1 petición tutoría
			params.removeAllElements();
			query = pm.getPropiedad("selectCorreo"); 
    		params.add(7);  //Añado parámetro usuario
    		micon = new ConexionBD();
    		Vector resultado = micon.doSelect(query, params);
			item=(Hashtable)resultado.get(0);
    		String motivo1 = (String)item.get("motivo");
			String asunto = (String)item.get("asunto");	  
			String enlace = (String)item.get("enlace");	
	  
    		correoBean.setReceptor(correoAlumno);
 			correoBean.setAsunto(asunto);
            
			//Reemplazo de motivo del correo para una de las variables.
			String motivoCorreo=motivo1;		
			motivoCorreo=motivoCorreo.replace("[[CODE]]",code);
 			motivoCorreo=motivoCorreo.replace("[[ENLACECODE]]",enlace+"?identificador="+code+"&identificacion=1");
 
 			messageBean.setUrl("../view/principalView.jsp");		
 			correoBean.setMotivo(motivoCorreo);  
			messageBean.setMsg("\nSe ha enviado a su correo el código de identificación para que pueda ver sus tutorías.");
		
			//Redirecciono a la vista que muestra la pagina.
 			%>
  			<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 			<%
		}
   }
   }
  }
 }

//Creamos una variable tipo Calendar donde introducimos la fecha actural
Calendar fechaEnviar = Calendar.getInstance();
//Si la opción es borrar la petición de tutoría
if (opcion.equals("borrar")){
	  //Busco los datos del correo establecidos por el administrador.
 	  //Correo tipo 2 borrar petición tutoría
      params.removeAllElements();
	  query = pm.getPropiedad("selectCorreo"); 
      params.add(2);  //Añado parámetro usuario
      micon = new ConexionBD();
      Vector resultado = micon.doSelect(query, params);
	  item=(Hashtable)resultado.get(0);
      String motivo1 = (String)item.get("motivo");
	  String asunto = (String)item.get("asunto");	  
	  String enlace = (String)item.get("enlace");	
	  
      correoBean.setReceptor(correo);
	  correoBean.setAsunto(asunto);
	  
	  //Buscamos si esa petición ya ha ssido borrada
	  params.removeAllElements();
	  query = pm.getPropiedad("selectPeticionTutAlumnoBorrar"); 
      params.add(idPetTut);  //Añado parámetro usuario
      micon = new ConexionBD();
      Vector resultadoPeticion = micon.doSelect(query, params);
	  //Si ha sido borrada
	  if (resultadoPeticion.size()==0){
	   	messageBean.setMsg("\nHa sido borrada");
		//Redirecciono a la vista que muestra la pagina.		
		%>
        <jsp:forward page="../view/informacionTutAlumnosView.jsp"/>
        <%		
	  }
	  //Extraido los datos de la petición que desea borrar
      item=(Hashtable)resultadoPeticion.get(0);
	  Integer idProfesor = (Integer)item.get("id_profesor");
	  Integer idAsignatura = (Integer)item.get("id_asignatura");
	  String motivo = (String)item.get("motivo");
	  Integer estado = (Integer)item.get("estado");
	  Integer idAlumno = (Integer)item.get("id_alumno");
	  String code = (String)item.get("code");
	  Integer dia = (Integer)item.get("dia");
	  Integer mes = (Integer)item.get("mes");
	  Integer anyo = (Integer)item.get("anyo");
	  Integer horaInicio = (Integer)item.get("horaInicio");
	  Integer minutosInicio = (Integer)item.get("minutosInicio");
	  
	  if (estado==7||estado==2){
	  	messageBean.setMsg("\nEsta tutoría no puede ser eliminada ya que se encuentra a la espera de que sea aceptada la solicitud. Si desea eliminarla pulse reenviar y rechaza la solicitud");
		//Redirecciono a la vista que muestra la pagina.
	    %>
        <jsp:forward page="../view/informacionTutAlumnosView.jsp"/>
        <%
      }
	  if (estado==1){
	  	messageBean.setMsg("\nEsta tutoría no puede ser eliminada, ya que esta pendiente de ser asignada");
		//Redirecciono a la vista que muestra la pagina.
	    %>
        <jsp:forward page="../view/informacionTutAlumnosView.jsp"/>
        <%
      }
	  
	  //Busco el nombre de la asignatura de la petición que desea borrar
	  params.removeAllElements();
	  query = pm.getPropiedad("selectAsignaturaProf"); 
      params.add(idAsignatura);  //Añado parámetro usuario
      micon = new ConexionBD();
      Vector resultadoAsig = micon.doSelect(query, params);
      item=(Hashtable)resultadoAsig.get(0);
	  String asignatura = (String)item.get("nombre");
	  
	  //Busco el nombre y apellidos del profesor de la petición que desea borrar 
	  params.removeAllElements();
	  query = pm.getPropiedad("selectNombreProf"); 
      params.add(idProfesor);  //Añado parámetro usuario
      micon = new ConexionBD();
      Vector resultadoProfesor = micon.doSelect(query, params);
	  item=(Hashtable)resultadoProfesor.get(0);
      String nombreProf = (String)item.get("nombre");
	  String apellidosProf = (String)item.get("apellidos");
      
	  //Reemplazo de motivo del correo para una de las variables.
	  String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
 	  motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignatura);
	  motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
 	  if(estado==1)
			motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Solicitada");
	  if(estado==2)
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Enviada");
	  if(estado==3)
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Confirmada");
	  if(estado==4)
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","Realizada");
	  if(estado==5)
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","No Realiazada");
	  if(estado==6)
		    motivoCorreo=motivoCorreo.replace("[[ESTADO]]","No Realiazada");
		
      motivoCorreo=motivoCorreo.replace("[[ENLACEBORRAR]]",enlace+"?code="+2+code);
	  correoBean.setMotivo(motivoCorreo);    
	  messageBean.setUrl("../view/principalView.jsp");
	  messageBean.setMsg("\nSe ha enviado a su correo un email con los datos de su tutoría donde podrá confirmar su eliminación");
		
	  //Insertamos registro de movimientos del alumno
	  query = pm.getPropiedad("insertRegistro"); 
      params.removeAllElements(); //Elimino elementos del vector
 	  params.add(idPetTut);
	  params.add(idProfesor); 
	  params.add(idAsignatura); 
	  if (anyo==null)
		params.add(null);
	  else
		params.add(anyo+"-"+mes+"-"+dia); 
	  params.add(horaInicio); 
	  params.add(minutosInicio);  
 	  params.add(idAlumno); 
 	  params.add("Mis Tutorías"); 
   	  params.add("Enviar"); 
  	  params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
      params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
  	  micon.doUpdate(query, params);
	  
	  //Redirecciono a la vista que muestra la pagina.
	  %>
      <jsp:forward page="../controller/enviarCorreoController.jsp"/>
      <%
}
//Si la opción es aceptar la petición de tutoría (Volver a mandar correo para aceptar la petición)
if (opcion.equals("aceptar")){
    //Buscamos los datos de la petición que desea aceptar
 	query = pm.getPropiedad("selectPetTut"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(idPetTut); 
	micon = new ConexionBD();
 	Vector resultadoId = micon.doSelect(query, params);
 	item=(Hashtable)resultadoId.get(0);
	Integer idAlumno= (Integer)item.get("id_alumno");
 	Integer idAsignatura= (Integer)item.get("id_asignatura");
	Integer idProfesor= (Integer)item.get("id_profesor");
	Integer dia= (Integer)item.get("dia");
	Integer mes= (Integer)item.get("mes");
	Integer anyo= (Integer)item.get("anyo");
 	Integer horaInicio= (Integer)item.get("horaInicio");
 	Integer horaFin= (Integer)item.get("horaFin");
 	Integer minutosFin= (Integer)item.get("minutosFin");
 	Integer minutosInicio= (Integer)item.get("minutosInicio");
 	String motivo= (String)item.get("motivo");
 	Integer estado= (Integer)item.get("estado");
	String code= (String)item.get("code");
	//Creamos una variable tipo Calendar donde introducimos la fecha actural
	Calendar fecha = Calendar.getInstance();
	//Si el estado de la petición es enviada y la fecha asignada sea mayor a la actual
	if (estado==2){ 
		//Buscamos el nombre de la asignatura de la petición que desea aceptar
		params.removeAllElements();
 		query = pm.getPropiedad("selectAsignaturaProf"); 
 		params.add(idAsignatura);  //Añado parámetro usuario
 		micon = new ConexionBD();
 		Vector resultadoAsig = micon.doSelect(query, params);
 		item=(Hashtable)resultadoAsig.get(0);
 		String asignatura = (String)item.get("nombre");
		
		//Buscamos el nombre y apellidos del profesor de la petición que desea aceptar
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
 		motivoCorreo=motivoCorreo.replace("[[FECHA]]",dia+"-"+mes+"-"+anyo);
 		if (minutosInicio==0)
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":00");
 		else
 			motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":"+minutosInicio);
		
		motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+10+code);
 		motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+11+code);
		
 		messageBean.setUrl("../view/principalView.jsp");		
 		correoBean.setMotivo(motivoCorreo);  
		messageBean.setMsg("\nSe ha reeenviado a su correo los detalles de la tutoría asignada. Desde allí podrá confirmarla o rechazarla.");
		
		query = pm.getPropiedad("selectDatosPeticion"); 
		params.removeAllElements(); //Elimino elementos del vector
		params.add(code);  
		Vector resultadoDtosPet = micon.doSelect(query, params);
		item=(Hashtable)resultadoDtosPet.get(0);
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
			
		//Insertamos registro de movimientos del alumno
		 query = pm.getPropiedad("insertRegistro"); 
		 params.removeAllElements(); //Elimino elementos del vector
		 params.add(idPeticionTut); 
		 params.add(idProfesor); 
		 params.add(idAsignatura); 
		 if (anyo==null)
		  	params.add(null);
		  else
		  	params.add(anyo+"-"+mes+"-"+dia); 
		 params.add(horaInicio); 
		 params.add(minutosInicio); 
		 params.add(idAlumno); 
		 params.add("Petición Tutoría"); 
		 params.add("Reenviar"); 
		 params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
		 params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
		 micon.doUpdate(query, params);
 
		//Redirecciono a la vista que muestra la pagina.
 		%>
  		<jsp:forward page="../controller/enviarCorreoController.jsp"/>
 		<% 
	} else {//Si el estado de la petición no es enviada y la fecha asignada es menor a la actual
		if (estado==7){
			//Buscamos el nombre de la asignatura de la petición que desea aceptar
			params.removeAllElements();
 			query = pm.getPropiedad("selectAsignaturaProf"); 
 			params.add(idAsignatura);  //Añado parámetro usuario
 			micon = new ConexionBD();
 			Vector resultadoAsig = micon.doSelect(query, params);
 			item=(Hashtable)resultadoAsig.get(0);
 			String asignatura = (String)item.get("nombre");
		
			//Buscamos el nombre y apellidos del profesor de la petición que desea aceptar
			params.removeAllElements();
			query = pm.getPropiedad("selectNombreProf"); 
			params.add(idProfesor);  //Añado parámetro usuario
			micon = new ConexionBD();
			Vector resultadoProfesor = micon.doSelect(query, params);
			item=(Hashtable)resultadoProfesor.get(0);
			String nombreProf = (String)item.get("nombre");
			String apellidosProf = (String)item.get("apellidos");
			
			//Busco los datos del correo establecidos por el administrador.
			//Correo tipo 5 confirmación petición
			params.removeAllElements();
			query = pm.getPropiedad("selectCorreo"); 
			params.add(5);  //Añado parámetro usuario
			micon = new ConexionBD();
			Vector resultado = micon.doSelect(query, params);
			item=(Hashtable)resultado.get(0);
			String motivo1 = (String)item.get("motivo");
			String asunto = (String)item.get("asunto");	  
			String enlace = (String)item.get("enlace");	
		  
		    //Correo tipo 7 enlace del identificador
 			params.removeAllElements();
 			query = pm.getPropiedad("selectCorreo"); 
 			params.add(7);  //Añado parámetro usuario
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
			motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+60+code);
			motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+61+code);
			
			motivoCorreo=motivoCorreo.replace("[[ENLACEMISTUTORIAS]]",enlaceTutorias+"?identificador="+code+"&identificacion=1");
 			motivoCorreo=motivoCorreo.replace("[[CODE]]",code);
 
			messageBean.setUrl("../view/principalView.jsp");		
			correoBean.setMotivo(motivoCorreo);  
			messageBean.setMsg("\nSe ha reenviado a su correo los detalles de la tutoría para seguir el curso de la solicitud. Desde allí podrá confirmarla o rechazarla.");
			
			query = pm.getPropiedad("selectDatosPeticion"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(code);  
			Vector resultadoDtosPet = micon.doSelect(query, params);
			item=(Hashtable)resultadoDtosPet.get(0);
			Integer idPeticionTut = (Integer)item.get("id_peticionTut");
			
			//Insertamos registro de movimientos del alumno
			query = pm.getPropiedad("insertRegistroConfirmacion"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idPeticionTut); 
			params.add(idProfesor); 
			params.add(idAsignatura); 
			params.add(idAlumno); 
			params.add("Confirmación Petición en Curso"); 
			params.add("Reenviar"); 
			params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
			params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
			micon.doUpdate(query, params);
			
			//Redirecciono a la vista que muestra la pagina.
			%>
			<jsp:forward page="../controller/enviarCorreoController.jsp"/>
			<% 
		}
		if (estado==1)
			messageBean.setMsg("\nEsta tutoría no ha sido asignada");
		if (estado>2)
			messageBean.setMsg("\nEsta tutoría ya ha sido aceptada");
		//Redirecciono a la vista que muestra la pagina.
 		%>
  		<jsp:forward page="../view/informacionTutAlumnosView.jsp"/>
 		<% 
	}
}%>	