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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
 <%
} else {//Si esta logado
 
	// Extraigo del formulario
	String nombre = request.getParameter("nombre");//nombre de la estructura
	String disabled = request.getParameter("disabled");//
	
	String idEstDocente = request.getParameter("idEstDocente");//identificador estructura docente
	String opcion = request.getParameter("opcion");//opcion
	
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
  
	//Lista los enlaces de interes relacionados con el administrador.
   	query = pm.getPropiedad("selectEnlacesAdministrador");  
   	micon = new ConexionBD();
   	Vector resultadoEnlaces = micon.doSelect(query);

   	enlacesBean.setContador(resultadoEnlaces.size());
   	for (int i=0; i<enlacesBean.getContador(); i++)
   	{
    	item = (Hashtable)resultadoEnlaces.get(i);  
    	String nombreEnlace = (String)item.get("nombre");
		String URL = (String)item.get("URL");
		//Indicaciones para mostrar el nombre y URL del enlace
	    enlacesBean.setNombre(nombreEnlace,i);
		enlacesBean.setUrl(URL,i);   
	}
	
 //Nueva estructura docente
 if (opcion.equals("nuevo")){
 	//Si el formulario esta vacio
	if (nombre==""||nombre==null ){
	   	messageBean.setMsg("");
		//Redirecciono a la vista que muestra la pagina.	  
	  	%>
	  	<jsp:forward page="../view/verDatosEstDocenteView.jsp"/>
	  	<% 
	}
	Integer orden =0;//inicializo la variable orden a 0
	//Si la estructura docente es un centro
	if (idEstDocente==null){
	  //CENTRO
	  //Busco el que tenga orden maximo para poner al nuevo el orden adecuado
	  query = pm.getPropiedad("selectMaxOrdenNull"); 
	  micon = new ConexionBD(); 
	  Vector resultado = micon.doSelect(query);
	  //Si existe algun centro
	  if (resultado.size()!=0){  
		  item = (Hashtable)resultado.get(0);  
		  orden = (Integer)item.get("orden");//orden maximo
	  }
	  //inserta centro
	  query = pm.getPropiedad("insertEstDocenteNull"); 
	  params.add(nombre);  
	  params.add(orden+1);
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);  
	}else{//Si la estructura docente es una titulación o curso
	  query = pm.getPropiedad("selectEsTit"); 
	  micon = new ConexionBD();
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idEstDocente); 
	  Vector resultado = micon.doSelect(query, params);
	  if (resultado.size()!=0){ 
	    //Busco si existe otra titulación con ese nombre. 
	    query = pm.getPropiedad("selectExitTit"); 
	  	micon = new ConexionBD();
	  	params.removeAllElements(); //Elimino elementos del vector
	  	params.add(nombre); 
	    resultado = micon.doSelect(query, params);
		//Existe titulación con el mismo nombre
		if (resultado.size()!=0){
	  		messageBean.setMsg("Existe Titulación");
			//Redirecciono a la vista que muestra la pagina.	  
			%>
   			<jsp:forward page="../view/verDatosEstDocenteView.jsp"/>  
   			<%
		}
	  }
	  //Busco el que tenga orden maximo para poner al nuevo el orden adecuado
	  query = pm.getPropiedad("selectMaxOrden"); 
	  micon = new ConexionBD();
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idEstDocente); 
	  resultado = micon.doSelect(query, params);
	  //Si existe alguna titulación o curs
	  if (resultado.size()!=0){  
		  item = (Hashtable)resultado.get(0);  
		  orden = (Integer)item.get("orden");
	  }
	  //inserta titulación o centro
	  query = pm.getPropiedad("insertEstDocente"); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(nombre);  
	  params.add(orden+1); 
	  params.add(idEstDocente); 
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	}
   messageBean.setMsg("Estructura Docente Guardada");
   //Redirecciono a la vista que muestra la pagina.	  
   %>
   <jsp:forward page="../view/verDatosEstDocenteView.jsp"/>  
   <%
 }
  //Si la opción es editar o borrar
  if (nombre==null && disabled==null){	
    messageBean.setMsg("");
	  
    //mostrar los datos de la estructura docente que vamos a editar o borrar
	query = pm.getPropiedad("selectEstDocenteNombre"); 
	micon = new ConexionBD(); 
	params.add(idEstDocente); 
	Vector resultado = micon.doSelect(query, params);
	  
	item = (Hashtable)resultado.get(0);  
	nombre = (String)item.get("nombre");
	estDocenteBean.setNombre(nombre);
	//Si la opción en borrar
	if (opcion.equals("borrar")){
	  //buscar los que dependan de la estructura que desea borrar
	  query = pm.getPropiedad("selectId"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idEstDocente); 
	  resultado = micon.doSelect(query, params);
	  messageBean.setMsg("");
	  //si existe estructura docente que dependa de ella
	  if (resultado.size()!=0){ 
	    messageBean.setMsg("Tiene estructura docente asociada, se eliminaran automáticamente");
	  }
	}
	//Redirecciono a la vista que muestra la pagina.	  
	%>
	<jsp:forward page="../view/verDatosEstDocenteView.jsp"/>         
	<%
  }
  //Si la opción es editar
  if(opcion.equals("editar")){	
  	  //modificar el nombre de la estructura docente
	  query = pm.getPropiedad("updateEstDocente"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(nombre); 
	  params.add(idEstDocente); 
	  micon.doUpdate(query, params); 
	  messageBean.setMsg("Estructura Docente Modificada");
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	  <jsp:forward page="../view/verDatosEstDocenteView.jsp"/> 
	  <%     
  }
  //Si la opción en borrar
  if (opcion.equals("borrar")){
      //Elimino la estructura docente 
	  query = pm.getPropiedad("deleteEstDocente"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idEstDocente); 
	  micon.doUpdate(query, params);
	  
	  //buscar los que dependan de ella
	  query = pm.getPropiedad("selectId"); 
	  micon = new ConexionBD(); 
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(idEstDocente); 
	  Vector resultado = micon.doSelect(query, params);
	  //si existe estDocente que dependa de ella
	  if (resultado.size()!=0){
		  for (int i=0;i<resultado.size();i++){
			item = (Hashtable)resultado.get(i);  
			Integer id = (Integer)item.get("id_EstDocente");
			
			//borrar los que dependan de el, si es centro borrar titulaciones 
			query = pm.getPropiedad("deleteEstDocente"); 
			micon = new ConexionBD(); 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(id); 
			micon.doUpdate(query, params);
			//busco si tiene cursos asociados
			query = pm.getPropiedad("selectId"); 
	  	    micon = new ConexionBD(); 
	        params.removeAllElements(); //Elimino elementos del vector
	        params.add(id); 
	        Vector resultado1 = micon.doSelect(query, params);
			//si tiene centros
			if (resultado1.size()!=0){
			  for (int j=0;j<resultado1.size();j++){
				item = (Hashtable)resultado1.get(j);  
				id = (Integer)item.get("id_EstDocente");
				//borrar los que dependan de el, si es centro borrar curso 
				query = pm.getPropiedad("deleteEstDocente"); 
				micon = new ConexionBD(); 
				params.removeAllElements(); //Elimino elementos del vector
				params.add(id); 
				micon.doUpdate(query, params);
			  }
			}
		  }
		}
		messageBean.setMsg("Estructura Docente Borrada");
		//Redirecciono a la vista que muestra la pagina.	  
	  	%>
	  	<jsp:forward page="../view/verDatosEstDocenteView.jsp"/>       
	  	<%
  }
} %>               