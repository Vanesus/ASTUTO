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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%
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

//Extraigo el code de la petici�n
String code = request.getParameter("code");
messageBean.setMsg("");
//Creamos una variable tipo Calendar donde introducimos la fecha actual
Calendar fecha = Calendar.getInstance();
 
 if (code.substring(0,1).equals("1")) {//tipo de correo PETICI�N TUTOR�A
    //Busco la petici�n por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreoEstado"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(code.substring(2)); //sustraigo de la cade code desde el tercer digito al final
	params.add(2); 
 	Vector resultado=micon.doSelect(query, params);
	//Existe la petici�n
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
		
		//Quiero aceptar al tutor�a
	    if (code.substring(1,2).equals("0")){
			//modifico el estado de la tutor�a a aceptada
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
 			params.add("Petici�n Tutor�a"); 
	 		params.add("Aceptar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 			micon.doUpdate(query, params);
		} else { //Quiero rechazar la tutor�a
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
			//Elimino la petici�n ya que ha sido rechazada	
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
 			params.add("Petici�n Tutor�a"); 
	 		params.add("Rechazar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 			micon.doUpdate(query, params);
		}
	} else {//No existe la petici�n
		messageBean.setMsg("Ya no existe la petici�n o ya ha sido aceptada");
	}
 }
 if (code.substring(0,1).equals("2")) {//tipo de correo ELIMINAR PETICI�N. Solo esta la ocpion Aceptar
 	//Busco la petici�n por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreo"); 
 	params.removeAllElements(); //Elimino elementos del vector
 	params.add(code.substring(1));//sustraigo desde el segundo digito hasta el final
 	Vector resultado=micon.doSelect(query, params);
	//Existe la petici�n
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
		//El alumno solo tiene esa petici�n
		if (resultadoAlum.size()==1) {
			//Elimino el alumno
			query = pm.getPropiedad("deleteAlumno"); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idAlumno); 
			micon.doUpdate(query, params);
		}
		//Elimino la petici�n
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
 		params.add("Mis Tutor�as"); 
	 	params.add("Eliminar"); 
		params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
 		params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
 		micon.doUpdate(query, params);
    } else {//No existe la petici�n
		messageBean.setMsg("Ya no existe la petici�n");
	}
  }
 if (code.substring(0,1).equals("4")) {//tipo de correo MODIFICAR PETICI�N
 	//Busco la petici�n por el code
 	query = pm.getPropiedad("selectAlumnoPeticionCorreo"); 
 	params.removeAllElements(); //Elimino elementos del vector
	params.add(code.substring(2));  
	Vector resultado=micon.doSelect(query, params);
	//Si existe la petici�n
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
		
		//Quiero aceptar la modificaci�n de la petici�n
	    if (code.substring(1,2).equals("0")){
			//Modifico el estado de la petici�n 
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
			params.add("Petici�n Modificada"); 
			params.add("Aceptar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
			micon.doUpdate(query, params);
		} else {//Rechazo la modificaci�n de la petici�n
			//Busco si el alumno tiene peticiones
			query = pm.getPropiedad("selectIdPeticionTut"); 
 			params.removeAllElements(); //Elimino elementos del vector
 			params.add(idAlumno); 
 			Vector resultadoAlum=micon.doSelect(query, params);
			//Solo tiene esa petici�n
			if (resultadoAlum.size()==1){
				//Elimino el alumno
				query = pm.getPropiedad("deleteAlumno"); 
 				params.removeAllElements(); //Elimino elementos del vector
 				params.add(idAlumno); 
 				micon.doUpdate(query, params);
			}
			//Elimino la petici�n
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
			params.add("Petici�n Modificada"); 
			params.add("Rechazar"); 
			params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
			params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
			micon.doUpdate(query, params);
		}
	} else {//No existe la petici�n
		messageBean.setMsg("Ya no existe la petici�n");
	}
 }
 //Redirecciono a la vista que muestra la pagina.        
 %>
 <jsp:forward page="../view/principalView.jsp"/> 		