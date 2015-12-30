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

<%
String direccionUrl;
//Extraigo String del fichero web.xml que contiene la ruta de la ubicación del fichero de propiedades 
//en el que se encuentran las consultas de la base de datos
String curDir = (String)getServletContext().getInitParameter("ruta");
//Creo objeto GestorPropuedades para gestionar las consultas de la base de datos,
//a partir de la ruta anterior curDir y especificando el nombre del fichero.
GestorPropiedades pm = new GestorPropiedades(curDir,"ConsultasASTUTO.properties");

//Declaración de variables 
String query;
Vector params = new Vector();
ConexionBD micon = new ConexionBD();
Hashtable item = null;

//Extraigo el code de la petición
String code = request.getParameter("code");
messageBean.setMsg("");
//Creamos una variable tipo Calendar donde introducimos la fecha actual
Calendar fecha = Calendar.getInstance();
 
 if (code.substring(0,1).equals("1")) {//tipo de correo PETICIÓN TUTORÍA
    //Busco la petición por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreoEstado"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(code.substring(2)); //sustraigo de la cade code desde el tercer digito al final
	params.add(2); 
 	Vector resultado=micon.doSelect(query, params);
	//Existe la petición
	if (resultado.size()>0){
		item=(Hashtable)resultado.get(0);
		Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		Integer idProfesor= (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		
		//Quiero aceptar al tutoría
	    if (code.substring(1,2).equals("0")){
			//modifico el estado de la tutoría a aceptada
	 		query = pm.getPropiedad("updatePeticionCorreo"); 
	 		params.removeAllElements(); //Elimino elementos del vector
	 		params.add(idPeticionTut); 
 			micon.doUpdate(query, params);
			messageBean.setMsg("Su solicitud ha sido aceptada");
	
			//Insertamos registro de movimientos del alumno
 			query = pm.getPropiedad("insertRegistro"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idPeticionTut); 
 			params.add(idProfesor); 
 			params.add(idAsignatura); 
 			params.add(anyo+"-"+mes+"-"+dia); 
 			params.add(horaInicio); 
 			params.add(minutosInicio); 
 			params.add(idAlumno); 
 			params.add("Petición Tutoría"); 
	 		params.add("Aceptar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 			micon.doUpdate(query, params);
		} else { //Quiero rechazar la tutoría
			//Busco si el alumno tiene mas peticiones
			query = pm.getPropiedad("selectIdPeticionTut"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idAlumno); 
 			Vector resultadoAlum=micon.doSelect(query, params);
			//Si tiene solo esa petición 
			if (resultadoAlum.size()==1){
				//Elimino el alumno
				query = pm.getPropiedad("deleteAlumno"); 
 				params.removeAllElements(); //Elimino elementos del vector
 				params.add(idAlumno); 
 				micon.doUpdate(query, params);
			}		
			//Elimino la petición ya que ha sido rechazada	
			query = pm.getPropiedad("deletePeticionCorreo"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idPeticionTut); 
 			micon.doUpdate(query, params);
			messageBean.setMsg("Su solicitud ha sido rechazada");	
	
			//Insertamos registro de movimientos del alumno
 			query = pm.getPropiedad("insertRegistro"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idPeticionTut); 
 			params.add(idProfesor); 
 			params.add(idAsignatura); 
 			params.add(anyo+"-"+mes+"-"+dia); 
 			params.add(horaInicio); 
 			params.add(minutosInicio); 
 			params.add(idAlumno); 
 			params.add("Petición Tutoría"); 
	 		params.add("Rechazar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 			micon.doUpdate(query, params);
		}
	} else {//No existe la petición
		messageBean.setMsg("Ya no existe la petición o ya ha sido aceptada");
	}
 }
 if (code.substring(0,1).equals("2")) {//tipo de correo ELIMINAR PETICIÓN. Solo esta la ocpion Aceptar
 	//Busco la petición por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreo"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(code.substring(1));//sustraigo desde el segundo digito hasta el final
 	Vector resultado=micon.doSelect(query, params);
	//Existe la petición
	if (resultado.size()>0) {
		item=(Hashtable)resultado.get(0);
		Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		Integer idProfesor= (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		
		query = pm.getPropiedad("selectIdPeticionTut"); 
 		params.removeAllElements(); //Elimino elementos del vector
 		params.add(idAlumno); 
 		Vector resultadoAlum=micon.doSelect(query, params);
		//El alumno solo tiene esa petición
		if (resultadoAlum.size()==1) {
			//Elimino el alumno
			query = pm.getPropiedad("deleteAlumno"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idAlumno); 
			micon.doUpdate(query, params);
		}
		//Elimino la petición
	 	query = pm.getPropiedad("deletePeticionCorreo"); 
 		params.removeAllElements(); //Elimino elementos del vector
 		params.add(idPeticionTut); 
 		micon.doUpdate(query, params);
		messageBean.setMsg("Su solicitud ha sido borrada");	
	    
		//Insertamos registro de movimientos del alumno
 		query = pm.getPropiedad("insertRegistro"); 
 		params.removeAllElements(); //Elimino elementos del vector
 		params.add(idPeticionTut); 
 		params.add(idProfesor); 
 		params.add(idAsignatura); 
 		params.add(anyo+"-"+mes+"-"+dia); 
 		params.add(horaInicio); 
 		params.add(minutosInicio); 
 		params.add(idAlumno); 
 		params.add("Mis Tutorías"); 
	 	params.add("Eliminar"); 
		params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 		params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 		micon.doUpdate(query, params);
    } else {//No existe la petición
		messageBean.setMsg("Ya no existe la petición");
	}
  }
 if (code.substring(0,1).equals("4")) {//tipo de correo MODIFICAR PETICIÓN
 	//Busco la petición por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreo"); 
 	params.removeAllElements(); //Elimino elementos del vector
	params.add(code.substring(2));  
	Vector resultado=micon.doSelect(query, params);
	//Si existe la petición
	if (resultado.size()>0){
		item=(Hashtable)resultado.get(0);
		Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		Integer idProfesor= (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		
		//Quiero aceptar la modificación de la petición
	    if (code.substring(1,2).equals("0")){
			//Modifico el estado de la petición 
	 		query = pm.getPropiedad("updatePeticionCorreo"); 
	 		params.removeAllElements(); //Elimino elementos del vector
	 		params.add(idPeticionTut); 
 			micon.doUpdate(query, params);
			messageBean.setMsg("Su solicitud ha sido aceptada");
	        
			//Insertamos registro de movimientos del alumno
			query = pm.getPropiedad("insertRegistro"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idPeticionTut); 
			params.add(idProfesor); 
			params.add(idAsignatura); 
			params.add(anyo+"-"+mes+"-"+dia); 
			params.add(horaInicio); 
			params.add(minutosInicio); 
			params.add(idAlumno); 
			params.add("Petición Modificada"); 
			params.add("Aceptar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
			micon.doUpdate(query, params);
		} else {//Rechazo la modificación de la petición
			//Busco si el alumno tiene peticiones
			query = pm.getPropiedad("selectIdPeticionTut"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idAlumno); 
 			Vector resultadoAlum=micon.doSelect(query, params);
			//Solo tiene esa petición
			if (resultadoAlum.size()==1){
				//Elimino el alumno
				query = pm.getPropiedad("deleteAlumno"); 
 				params.removeAllElements(); //Elimino elementos del vector
 				params.add(idAlumno); 
 				micon.doUpdate(query, params);
			}
			//Elimino la petición
			query = pm.getPropiedad("deletePeticionCorreo"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idPeticionTut); 
 			micon.doUpdate(query, params);
			messageBean.setMsg("Su solicitud ha sido rechazada");	
	
			//Insertamos registro de movimientos del alumno
			query = pm.getPropiedad("insertRegistro"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idPeticionTut); 
			params.add(idProfesor); 
			params.add(idAsignatura); 
			params.add(anyo+"-"+mes+"-"+dia); 
			params.add(horaInicio); 
			params.add(minutosInicio); 
			params.add(idAlumno); 
			params.add("Petición Modificada"); 
			params.add("Rechazar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
			micon.doUpdate(query, params);
		}
	} else {//No existe la petición
		messageBean.setMsg("Ya no existe la petición");
	}
 }
 //Redirecciono a la vista que muestra la pagina.        
 %>
 <jsp:forward page="../view/principalView.jsp"/> 		