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
<%@ page import = "java.sql.Time"%>
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
}else{ 

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
  //Declaración tipo de variable Calendar, inicializada con la fecha actual.
  Calendar fechaEnviar = Calendar.getInstance();

  //Datos extraidos del formulario
  String asignatura = request.getParameter("asignatura");
  String nombreAlumno = request.getParameter("nombreAlumno");
  String correoAlumno = request.getParameter("correoAlumno");
  String estado = request.getParameter("estado");
  String horaInicio = request.getParameter("horaInicio");
  String minutosInicio = request.getParameter("minutosInicio");
  String horaFin = request.getParameter("horaFin");
  String minutosFin = request.getParameter("minutosFin");
  String motivo = request.getParameter("motivo");
  String correo = request.getParameter("correo");
    
  //Datos extaidos del Bean
  Integer dia = tutoriaDiaBean.getDia(0);
  Integer mes = tutoriaDiaBean.getMes(0);
  Integer anyo = tutoriaDiaBean.getAnyo(0);
  Integer idAlumno = null;
  messageBean.setMsg("");
  
  //Buscar identificador del profesor, conociendo el login del usuario
  String usuario=loginBean.getUser();
  query = pm.getPropiedad("selectBuscarIdProfesor");  
  params.add(usuario); 
  Vector resultado = micon.doSelect(query,params);
  item = (Hashtable)resultado.get(0); 
	
  //Dato extaido del formulario
  Integer idProfesor = (Integer)item.get("id_profesor");
		
  //Buscar si el profeosr imparte alguna asignatura  	     	   
  params.removeAllElements();
  query = pm.getPropiedad("selectNombreAsignaturas");  
  params.add(idProfesor); 
  Vector resultadoAsignaturas = micon.doSelect(query,params);
	   
  if(resultadoAsignaturas.size()==0){
	messageBean.setMsg("No tiene asignaturas asignadas");
  }else{
    //Extraer el nombre e identificador de las asiganturas que imparte dicho profesor
	asignaturaProfBean.setContador(resultadoAsignaturas.size());
	for(int i=0;i<asignaturaProfBean.getContador();i++){ 
          item = (Hashtable)resultadoAsignaturas.get(i); 
		  String nombreAsignatura = (String)item.get("nombre");
		  Integer idAsignatura = (Integer)item.get("id_asignatura");
	      asignaturaProfBean.setAsignatura(nombreAsignatura,i);
		  asignaturaProfBean.setId(idAsignatura,i);
	}
  }  
  //Formulario vacio.
  if (asignatura==null && nombreAlumno==null && correoAlumno==null && estado==null && horaInicio==null && horaFin==null && motivo==null) { 
	//Redirecciono a la vista que muestra la pagina.	  
	%>
  	<jsp:forward page="../view/asignarTutoriaView.jsp?salir=1"/>
  	<% 
  }else 
  //Formulario vacio
  if(asignatura=="" && nombreAlumno=="" && correoAlumno=="" || estado=="" || horaInicio=="" || horaFin=="" || motivo=="") { 
	messageBean.setMsg("Debe introducir todos los campos");
	//Redirecciono a la vista que muestra la pagina.	  
	%>
  	<jsp:forward page="../view/asignarTutoriaView.jsp?salir=1"/>
  	<% 
  }else{ 
  	//Convertir los datos de String a Integer
  	Integer horaI=Integer.parseInt(horaInicio.trim());
	Integer horaF=Integer.parseInt(horaFin.trim());
	Integer minI=Integer.parseInt(minutosInicio.trim());
	Integer minF=Integer.parseInt(minutosFin.trim());
	
	//Verificar que la hora es correcta
	if (horaI>horaF || (horaI==horaF && minI>=minF)){
		messageBean.setMsg("Error fecha incorrecta.");//Hora Incorrecta
		//Redirecciono a la vista que muestra la pagina.	  
		%>
  		<jsp:forward page="../view/asignarTutoriaView.jsp?salir=0"/>
        <% 
	}else{//Hora Correcta
	  	if (horaFin.equals(horaInicio))//Si la hora de fin es igual que la hora de inicio
			query = pm.getPropiedad("selectCoincideAsignar"); 
	  	else
			query = pm.getPropiedad("selectCoincideAsignar1");
			 
		//Buscar si ese día y a esa hora hay ya alguna tutoría asignada	
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
  		params.add(idProfesor); 	 	  
  		micon = new ConexionBD();
   		Vector resultadoCoincide = micon.doSelect(query, params);
   		if (resultadoCoincide.size()>0){//No se puede asignar ese día y a esa hora
	    	messageBean.setMsg("Error ese día y a esa hora tiene ya una tutoría asignada");
			//Redirecciono a la vista que muestra la pagina.	  
	   		%>
  			<jsp:forward page="../view/asignarTutoriaView.jsp?salir=0"/>
       		<% 
		}else{//Puede asignar ese dia y a esa hora
			//Insertar alumno si no existe y buscar si identificador
			do{
        		query = pm.getPropiedad("selectAlumnoId"); 
				params.removeAllElements(); //Elimino elementos del vector
				params.add(correoAlumno);  
				Vector resultadoAlumnoId = micon.doSelect(query, params);
   
				if(resultadoAlumnoId.size()==0){
	   				query = pm.getPropiedad("insertAlumno"); 
	   				params.removeAllElements(); //Elimino elementos del vector
	   				params.add(correoAlumno); 
	   				params.add(nombreAlumno); 
	   				micon.doUpdate(query, params);
   				}else{
     				item=(Hashtable)resultadoAlumnoId.get(0);
    				idAlumno=(Integer)item.get("id_alumno");
				}
			}while(idAlumno==null||idAlumno.equals("null"));
	  
	   		//Calcular número aleatorio de 15 dígitos
			Random rnd = new Random();
			int x;
			String numero="";
			for (int i = 0; i < 15; i++) {
				x = (int)(rnd.nextDouble() * 10.0);
				numero+=x;
			}
			//Insertar nueva petición 
	  		params.removeAllElements();
	  		query = pm.getPropiedad("insertPeticionTutoria");  
      		params.add(idProfesor); 
	  		params.add(asignatura); 
	  		params.add(idAlumno); 
			params.add(motivo); 
			params.add(estado); 
			params.add(dia); 
			params.add(mes); 
			params.add(anyo); 
			params.add(horaInicio); 
			params.add(minutosInicio); 
			params.add(horaFin); 
			params.add(minutosFin); 
			params.add(numero); 
			micon.doUpdate(query,params);
			//Si el estado es Incomparecencia
			if (estado.equals("6")){
				//Incremento en una unidad el número de ausencias del alumno
				query = pm.getPropiedad("updateAlumnoAusenciasId"); 
	   			params.removeAllElements();
				params.add(1); 	  
				params.add(idAlumno); 
	   			micon.doUpdate(query, params);
			}
			//Mandar correo al alumno
			if (correo!=null){
			    //Cambiar estado a enviada
				query = pm.getPropiedad("updateEstadoEnviado"); 
	   			params.removeAllElements();
				params.add(2);
				params.add(numero);
	   			micon.doUpdate(query, params);
				//Buscar correo del alumno
				params.removeAllElements();
				query = pm.getPropiedad("selectCorreoAlumno"); 
				params.add(idAlumno);  
				micon = new ConexionBD();
				Vector resultadoAlum = micon.doSelect(query, params);
				item=(Hashtable)resultadoAlum.get(0);
				correoAlumno = (String)item.get("email");
				
				//Buscar nombre de la asignatura
				params.removeAllElements();
				query = pm.getPropiedad("selectAsignaturaProf"); 
				params.add(asignatura);  //Añado parámetro usuario
				micon = new ConexionBD();
				Vector resultadoAsig = micon.doSelect(query, params);
				item=(Hashtable)resultadoAsig.get(0);
				String asignaturaNombre = (String)item.get("nombre");
				   
				//Buscar nombre y apellidos del profesor
				params.removeAllElements();
				query = pm.getPropiedad("selectNombreProf"); 
				params.add(idProfesor);  //Añado parámetro usuario
				micon = new ConexionBD();
				Vector resultadoProfesor = micon.doSelect(query, params);
				item=(Hashtable)resultadoProfesor.get(0);
				String nombreProf = (String)item.get("nombre");
				String apellidosProf = (String)item.get("apellidos");
			 
			 	//Buscar datos del correo que vamos a enviar
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
		 
		 		//Reemplazar la cadena por el valor de la variable.
				String motivoCorreo=motivo1.replace("[[PROFESOR]]",nombreProf+" "+apellidosProf);
				motivoCorreo=motivoCorreo.replace("[[ASIGNATURA]]",asignaturaNombre);
				motivoCorreo=motivoCorreo.replace("[[MOTIVO]]",motivo);
				motivoCorreo=motivoCorreo.replace("[[FECHA]]",anyo+"-"+mes+"-"+dia);
				
				if (minutosInicio.equals("0"))
					motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":00");
				else
					motivoCorreo=motivoCorreo.replace("[[HORA]]",horaInicio+":"+minutosInicio);
		 
				motivoCorreo=motivoCorreo.replace("[[ENLACEACEPTAR]]",enlace+"?code="+10+numero);
				motivoCorreo=motivoCorreo.replace("[[ENLACERECHAZAR]]",enlace+"?code="+11+numero);
		 
				messageBean.setUrl("../view/asignarTutoriaView.jsp?salir=0");		
				correoBean.setMotivo(motivoCorreo);   
		   
		   		messageBean.setMsg("Tutoría asignada");	
				
				//Buscar el identificador de la peticion
				query = pm.getPropiedad("selectDatosPeticion"); 
				params.removeAllElements(); //Elimino elementos del vector
				params.add(numero);  
				Vector resultadoDtosPet = micon.doSelect(query, params);
				item=(Hashtable)resultadoDtosPet.get(0);
				Integer idPeticionTut = (Integer)item.get("id_peticionTut");
			   
				//Insertamos registro de movimientos del alumno
				 query = pm.getPropiedad("insertRegistro"); 
				 params.removeAllElements(); //Elimino elementos del vector
				 params.add(idPeticionTut); 
				 params.add(idProfesor); 
				 params.add(asignatura); 
				 params.add(anyo+"-"+mes+"-"+dia); 
				 params.add(horaInicio); 
				 params.add(minutosInicio); 
				 params.add(idAlumno); 
				 params.add("Petición Tutoría"); 
				 params.add("Enviar"); 
				 params.add(fechaEnviar.get(Calendar.YEAR)+"-"+(fechaEnviar.get(Calendar.MONTH)+1)+"-"+fechaEnviar.get(Calendar.DATE));
				 params.add(fechaEnviar.get(Calendar.HOUR_OF_DAY)+":"+fechaEnviar.get(Calendar.MINUTE)); 
				 micon.doUpdate(query, params);
				 
				 //Redirecciono a la vista que muestra la pagina.	  
				 %>
				 <jsp:forward page="../controller/enviarCorreoController.jsp"/>
				 <% 
			   }else{
			     messageBean.setMsg("Tutoría asignada");	
				 //Redirecciono a la vista que muestra la pagina.	  
				 %>
				 <jsp:forward page="../view/asignarTutoriaView.jsp?salir=0"/>
				 <%
			   }
	  		}
		}	
	}
}%>