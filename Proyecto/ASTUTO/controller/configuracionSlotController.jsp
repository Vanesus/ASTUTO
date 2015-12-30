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
  
  //Datos extraido del formulario 
  String slot= request.getParameter("slot");
  String metodoAsignacion= request.getParameter("metodoAsignacion");
  String tiempoMaxEspera= request.getParameter("tiempoMaxEspera");
  String previsionMinima= request.getParameter("previsionMinima");
  String nAusencias= request.getParameter("nAusencias");
  String opcion=request.getParameter("opcion");
 
  //Vector de las asignaturas seleccionadas con checkbox
  String Asig[]=new String [40];
  for (int i=0;i<asignaturaProfBean.getContador();i++)
  {
	Asig[i]=request.getParameter(asignaturaProfBean.getAsignatura(i)+profBean.getTitulacion(i,0));
  }
 
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
  
  if (opcion==null){
    //Buscar datos asignaturas que imparte el profesor
  	params.add(loginBean.getUser());
  	query = pm.getPropiedad("selectAsigProf");  
  	micon = new ConexionBD();
  	Vector resultado = micon.doSelect(query,params);
  	asignaturaProfBean.setContador(resultado.size());
  	int contador=0;
  	for (int i=0; i<resultado.size(); i++){
    	item = (Hashtable)resultado.get(i);  
  		String asignatura = (String)item.get("nombre");
    	Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer id_EstDocente =(Integer)item.get("id_EstDocente");
		
		//Buscar si tiene asignado horario de tutoría
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idAsignatura);
		params.add(loginBean.getUser());
  		query = pm.getPropiedad("selectExisteConfiguracionAsigSlot");  
    	micon = new ConexionBD();
    	Vector resultadoConfAsig = micon.doSelect(query,params);
    	if (resultadoConfAsig.size()>=1){
	  		asignaturaProfBean.setAsignatura(asignatura,contador);
			asignaturaProfBean.setId(idAsignatura,contador);
	
			//Buscar el nombre de la titulación a la que pertenece la asignatura
			params.removeAllElements(); //Elimino elementos del vector
			params.add(id_EstDocente);
			query = pm.getPropiedad("selectNombreTitulacion");  
			micon = new ConexionBD();
			Vector resultadoTit = micon.doSelect(query, params);
			item = (Hashtable)resultadoTit.get(0);  	
			String NombreTit=(String)item.get("nombre");
			profBean.setTitulacion(NombreTit, contador,0);
	
			//Buscar los datos de la configuración global actuales de cada asignatura 
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idAsignatura);
			params.add(loginBean.getUser());
			query = pm.getPropiedad("selectSlotAsig");  
			micon = new ConexionBD();
			Vector resultadoSlot = micon.doSelect(query, params);
			item = (Hashtable)resultadoSlot.get(0); 
			Integer slot1 =(Integer)item.get("slot");
			Integer metodoAsignacion1 =(Integer)item.get("metodoAsignacion");
			Integer tiempoMaxEspera1 =(Integer)item.get("tiempoMaxEspera");		 	
			Integer previsionMinima1 =(Integer)item.get("previsionMinima");		 	
			Integer nAusencias1 =(Integer)item.get("nAusencias");		 			 	
				 	
			configuracionTutBean.setSlot(slot1,contador);
			configuracionTutBean.setMetodo(metodoAsignacion1,contador);
			configuracionTutBean.setTiempoEspera(tiempoMaxEspera1,contador);
			configuracionTutBean.setPrevisionMinima(previsionMinima1,contador);
			configuracionTutBean.setNAusencias(nAusencias1,contador);
			contador++;
		}
  	}
  	asignaturaProfBean.setContador(contador); 
  	messageBean.setMsg("");
	//Redirecciono a la vista que muestra la pagina.
  	%>
    <jsp:forward page="../view/verAsignaturasSlotView.jsp"/>
  	<%
 }
 if (slot==""){//No hay datos introducidos
   messageBean.setMsg("Introduzca todos los datos");
   //Redirecciono a la vista que muestra la pagina.
   %>
      <jsp:forward page="../view/verAsignaturasSlotView.jsp"/>
   <%
 } else {
  for (int i=0;i<asignaturaProfBean.getContador();i++){
   if (Asig[i]!=null){
   	//Modificar los datos de la configuración global de cada asignatura seleccionada.
  	params.removeAllElements(); //Elimino elementos del vector
  	params.add(slot); 
	params.add(metodoAsignacion);
	params.add(tiempoMaxEspera);
	params.add(previsionMinima);
	params.add(nAusencias);
  	params.add(Asig[i]);
 	params.add(loginBean.getUser());
  	query = pm.getPropiedad("updateSlot");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
   }
  }  
  //Redirecciono a la vista que muestra la pagina.
  %>
      <jsp:forward page="../controller/principalProfesorController.jsp"/>
  <%
 }
}%>
	