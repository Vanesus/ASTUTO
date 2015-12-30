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
<%@ page import = "java.text.*" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

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
  Integer idAsignatura=null;
  
  //Datos extraidos del formulario
  String asignatura = request.getParameter("asignatura");
  String estado = request.getParameter("estado");
  
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
  
  //Buscar el identificador del profesor
  String usuario=loginBean.getUser();
  query = pm.getPropiedad("selectBuscarIdProfesor");  
  params.add(usuario); 
  Vector resultado = micon.doSelect(query,params);
  item = (Hashtable)resultado.get(0); 
  Integer idProfesor = (Integer)item.get("id_profesor");
	
  //Si el formulario de busqueda esta vacio
  if (asignatura==null && estado==null) { 
  	   //Buscar todas las asignatura que son impartidas por el profesor 	   
	   params.removeAllElements();
	   query = pm.getPropiedad("selectNombreAsignaturas");  
       params.add(idProfesor); 
       Vector resultadoAsignaturas = micon.doSelect(query,params);
	   
	   //No imparte ninguna asignatura
	   if(resultadoAsignaturas.size()==0){
	     		messageBean.setMsg("No tiene asignaturas asignadas");
				//Redirecciono a la vista que muestra la pagina.
				%>
  				<jsp:forward page="../view/misTutoriasView.jsp"/>
  				<% 
		}else{//Si imparte asignaturas
	     asignaturaProfBean.setContador(resultadoAsignaturas.size());
	     for(int i=0;i<asignaturaProfBean.getContador();i++){ 
		 	//Extraer datos de cada asignatura
            item = (Hashtable)resultadoAsignaturas.get(i); 
		    String nombreAsignatura = (String)item.get("nombre");
		    Integer idAsig = (Integer)item.get("id_asignatura");
			Integer id_EstDocente =(Integer)item.get("id_EstDocente");
	        asignaturaProfBean.setAsignatura(nombreAsignatura,i);
		    asignaturaProfBean.setId(idAsig,i);
			
			//Buscar el nombre de la titulación a la que pertenece casa asignatura
		   	params.removeAllElements(); //Elimino elementos del vector
		   	params.add(id_EstDocente);
			query = pm.getPropiedad("selectNombreTitulacion");  
			micon = new ConexionBD();
			Vector resultadoTit = micon.doSelect(query, params);
			item = (Hashtable)resultadoTit.get(0);  	
			String NombreTit=(String)item.get("nombre");
			profBean.setTitulacion(NombreTit,i,0);
	     }
	    }
		messageBean.setMsg("");
		//Redirecciono a la vista que muestra la pagina.	  
  		%>
  		<jsp:forward page="../view/misTutoriasView.jsp"/>
  		<% 
 	}else{ 
		messageBean.setMsg("");
		params.removeAllElements();
		//Seleccionamos todos los estados
		if(estado.equals("0")){
			//Seleccionamos todas las asignaturas	
			if (asignatura.equals("0"))
			   	query = pm.getPropiedad("selectBuscarTodasAsigTutorias"); 
			else
				query = pm.getPropiedad("selectBuscarTodasTutorias"); 
	    }else{//Seleccinamos un estado en concreto
    	   	if (asignatura.equals("0"))//seleccionamos todas las asignaturas
			 	query = pm.getPropiedad("selectBuscarAsigTutorias"); 
			else
				query = pm.getPropiedad("selectBuscarTutorias"); 
		}  
		//Si hemos seleccionado todas las asignaturas
		if (asignatura.equals("0"))
		{
		   	params.add(idProfesor);
			params.add(estado);
		}else{//Si hemos seleccionado una asignatura en concreto
			params.add(idProfesor);
			params.add(asignatura);
			params.add(estado);
		}	
       micon = new ConexionBD();	   
	   Vector resultadoTut = micon.doSelect(query,params);	   
	   //No encontramos ninguna petición con esos criterios de busqueda
       if(resultadoTut.size()==0){
	   		messageBean.setMsg("No hay datos resultantes de la búsqueda");
			//Redirecciono a la vista que muestra la pagina.	  
            %>
			<jsp:forward page="../view/misTutoriasView.jsp"/>
			<%
       }else{
	   	   //Extraigo datos de las peticiones que cumplen los criterios de busqueda
	       tutoriaDiaBean.setContador(resultadoTut.size());
	       for(int i=0;i<resultadoTut.size();i++){
	         item = (Hashtable)resultadoTut.get(i);
             Integer idPeticion = (Integer)item.get("id_peticionTut");		
		     Integer idProf = (Integer)item.get("id_profesor");
		     idAsignatura = (Integer)item.get("id_asignatura");
             Integer idAlumno = (Integer)item.get("id_alumno");
		     String motivo = (String)item.get("motivo");
	         Integer est = (Integer)item.get("estado");
		     Integer d = (Integer)item.get("dia");
		     Integer m = (Integer)item.get("mes");
		     Integer a = (Integer)item.get("anyo");
		     Integer horaInicio = (Integer)item.get("horaInicio");
			 Integer minutosInicio = (Integer)item.get("minutosInicio");
		     Integer horaFin = (Integer)item.get("horaFin");
			 Integer minutosFin = (Integer)item.get("minutosFin");
		     String comentarioProfesor = (String)item.get("comentarioProfesor");
			 
			 //Buscar el nombre de la asignatura
	         params.removeAllElements();
	         query = pm.getPropiedad("selectAsignaturaProf"); 
             params.add(idAsignatura);  //Añado parámetro usuario
             micon = new ConexionBD();
             Vector resultadoAsig = micon.doSelect(query, params);
		     item=(Hashtable)resultadoAsig.get(0);
		     asignatura = (String)item.get("nombre");
		     Integer id_EstDocente =(Integer)item.get("id_EstDocente");
		   
		     //Buscar el nombre de la titulación a la que pertenece la asignatura
		   	 params.removeAllElements(); //Elimino elementos del vector
		   	 params.add(id_EstDocente);
			 query = pm.getPropiedad("selectNombreTitulacion");  
			 micon = new ConexionBD();
			 Vector resultadoTit = micon.doSelect(query, params);
			 item = (Hashtable)resultadoTit.get(0);  	
			 String NombreTit=(String)item.get("nombre");
			 profBean.setTitulacion(NombreTit,i,0);
		   
		     //Buscar el email y nombre del alumno
		     params.removeAllElements();
	         query = pm.getPropiedad("selectNombreAlumno"); 
             params.add(idAlumno);  //Añado parámetro usuario
             micon = new ConexionBD();
             Vector resultadoAlumno = micon.doSelect(query, params);
		     item=(Hashtable)resultadoAlumno.get(0);
		     String email = (String)item.get("email");
		     String nombreAlumno = (String)item.get("nombre");
			 Integer nAusencias = (Integer)item.get("nAusencias");
		   
		   
		     tutoriaDiaBean.setId(idPeticion,i);
		     tutoriaDiaBean.setnombreAlumno(nombreAlumno,i);
			 tutoriaDiaBean.setNAusencias(nAusencias,i);
		     tutoriaDiaBean.setcorreoAlumno(email,i);
		   	 tutoriaDiaBean.setAsignatura(asignatura,i);
		     tutoriaDiaBean.setDia(d,i);
		     tutoriaDiaBean.setMes(m,i);
		     tutoriaDiaBean.setAnyo(a,i);
		     tutoriaDiaBean.setMotivo(motivo,i);
		     tutoriaDiaBean.setEstado(est,i);
		     tutoriaDiaBean.setHoraInicio(horaInicio,i);
		     tutoriaDiaBean.setMinutosInicio(minutosInicio,i);
		     tutoriaDiaBean.setHoraFin(horaFin,i);
		     tutoriaDiaBean.setMinutosFin(minutosFin,i);
		     tutoriaDiaBean.setComentarioProfesor(comentarioProfesor,i);
	    }
	}
}
 //Redirecciono a la vista que muestra la pagina.	  
 %> 
 <jsp:forward page="../view/resultTutoriasView.jsp"/>
<%}%>