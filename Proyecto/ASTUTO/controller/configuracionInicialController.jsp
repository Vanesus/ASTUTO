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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="confInicialBean" class="uco.interfaz.ConfInicialBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
} else {//Si esta logado 
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
  ConexionBD micon;   // objeto que realiza la conexi�n con la base de datos
  
  //Extraigo del formulario
  String asuntoPeticion = request.getParameter("asuntoPeticion");
  String motivoPeticion = request.getParameter("motivoPeticion");
  String enlacePeticion = request.getParameter("enlacePeticion");
  
  String asuntoTutorias = request.getParameter("asuntoTutorias");
  String motivoTutorias = request.getParameter("motivoTutorias");
  String enlaceTutorias = request.getParameter("enlaceTutorias");
  
  String asuntoManual = request.getParameter("asuntoManual");
  String motivoManual = request.getParameter("motivoManual");
  String enlaceManual = request.getParameter("enlaceManual");
  
  String asuntoModificar = request.getParameter("asuntoModificar");
  String motivoModificar = request.getParameter("motivoModificar");
  String enlaceModificar = request.getParameter("enlaceModificar");
  
  String asuntoConfirmar = request.getParameter("asuntoConfirmar");
  String motivoConfirmar = request.getParameter("motivoConfirmar");
  String enlaceConfirmar = request.getParameter("enlaceConfirmar");
  
  String asuntoCode = request.getParameter("asuntoCode");
  String motivoCode = request.getParameter("motivoCode");
  String enlaceCode = request.getParameter("enlaceCode");
  
  String slot = request.getParameter("slot");
  String metodoAsignacion = request.getParameter("metodoAsignacion");
  String tiempoMaxEspera = request.getParameter("tiempoMaxEspera");
  String previsionMinima = request.getParameter("previsionMinima");
  String nAusencias = request.getParameter("nAusencias");
  
  String opcion = request.getParameter("opcion");
  
  //Lista los enlaces de interes relacionados con el administrador.
  query = pm.getPropiedad("selectEnlacesAdministrador");  
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
  if ( opcion==null){
    //Busco si existe configuraci�n inicial introducida
    query = pm.getPropiedad("selectConfInicial");  
	micon = new ConexionBD();
	Vector resultado = micon.doSelect(query);
	//Hay ya una cofiguraci�n inicial establecida
	if (resultado.size()>=1){
	 for (int i=0;i<resultado.size();i++){
		item = (Hashtable)resultado.get(i);  	
		String motivo=(String)item.get("motivo");
		String asunto=(String)item.get("asunto");
		String enlace=(String)item.get("enlace");
		
		confInicialBean.setMotivo(motivo,i);
		confInicialBean.setAsunto(asunto,i);
		confInicialBean.setEnlace(enlace,i);
	 }
	 //Buscar la configuraci�n inicial para la configuraci�n del horario de tutor�as
	 query = pm.getPropiedad("selectConfInicialTutoria");  
	 micon = new ConexionBD();
	 Vector resultadoTut = micon.doSelect(query);
	 if (resultadoTut.size()>=1){
		item = (Hashtable)resultadoTut.get(0);  	
		Integer slot1 =(Integer)item.get("slot");
		Integer metodoAsignacion1=(Integer)item.get("metodoAsignacion");
		Integer tiempoMaxEspera1=(Integer)item.get("tiempoMaxEspera");
		Integer previsionMinima1=(Integer)item.get("previsionMinima");
		Integer nAusencias1=(Integer)item.get("nAusencias");
		
		confInicialBean.setSlot(slot1);
		confInicialBean.setMetodo(metodoAsignacion1);
		confInicialBean.setTiempoEspera(tiempoMaxEspera1);
		confInicialBean.setPrevisionMinima(previsionMinima1);
		confInicialBean.setNAusencias(nAusencias1);
	 }
	  //Redirecciono a la vista que muestra la pagina.	 
	  %>
        <jsp:forward page="../view/configuracionInicialView.jsp"/>
      <%
	}
	//No hay configuraci�n inicial establecida
	//inicializamos a null
		confInicialBean.setMotivo("",0);
		confInicialBean.setAsunto("",0);
		confInicialBean.setEnlace("",0);
		confInicialBean.setMotivo("",1);
		confInicialBean.setAsunto("",1);
		confInicialBean.setEnlace("",1);
		confInicialBean.setMotivo("",2);
		confInicialBean.setAsunto("",2);
		confInicialBean.setEnlace("",2);
		confInicialBean.setMotivo("",3);
		confInicialBean.setAsunto("",3);
		confInicialBean.setEnlace("",3);
		confInicialBean.setMotivo("",4);
		confInicialBean.setAsunto("",4);
		confInicialBean.setEnlace("",4);
		confInicialBean.setMotivo("",5);
		confInicialBean.setAsunto("",5);
		confInicialBean.setEnlace("",5);
		
		confInicialBean.setSlot(0);
		confInicialBean.setMetodo(0);
		confInicialBean.setTiempoEspera(0);
		confInicialBean.setPrevisionMinima(0);
		confInicialBean.setNAusencias(0);
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
        <jsp:forward page="../view/configuracionInicialView.jsp"/>
      <% 
   }else{ //Guardar configuraci�n inicial
  
	  query = pm.getPropiedad("selectConfInicial");  
	  micon = new ConexionBD();
	  Vector resultado = micon.doSelect(query);
	  //Existe cnfiguraci�n inicial establecida
	  if (resultado.size()>=1){
	    //Modifico configuraci�n inicial
	   	params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoPeticion);
	 	params.add(asuntoPeticion);
	  	params.add(enlacePeticion);
		params.add(1);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
	  
	  	params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoTutorias);
	  	params.add(asuntoTutorias);
	  	params.add(enlaceTutorias);
		params.add(2);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
		params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoManual);
	  	params.add(asuntoManual);
	  	params.add(enlaceManual);
		params.add(3);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
		params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoModificar);
	  	params.add(asuntoModificar);
	  	params.add(enlaceModificar);
		params.add(4);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
		params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoConfirmar);
	  	params.add(asuntoConfirmar);
	  	params.add(enlaceConfirmar);
		params.add(5);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
		
		params.removeAllElements(); //Elimino elementos del vector
	  	params.add(slot);
	  	params.add(metodoAsignacion);
	  	params.add(tiempoMaxEspera);
		params.add(previsionMinima);
		params.add(nAusencias);
		params.add(6);
	  	query = pm.getPropiedad("updateConfInicialTutoria");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
		params.removeAllElements(); //Elimino elementos del vector
	  	params.add(motivoCode);
	  	params.add(asuntoCode);
	  	params.add(enlaceCode);
		params.add(7);
	  	query = pm.getPropiedad("updateConfInicial");  
	  	micon = new ConexionBD();
	  	micon.doUpdate(query, params);
		
	    //Redirecciono a la vista que muestra la pagina.	  
		%>
        <jsp:forward page="../controller/principalAdministradorController.jsp"/>
        <%
	  }
	  //No tiene configuraci�n inicial establecida
	  //Insertamos configuraci�n incial
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoPeticion);
	  params.add(asuntoPeticion);
	  params.add(enlacePeticion);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoTutorias);
	  params.add(asuntoTutorias);
	  params.add(enlaceTutorias);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoManual);
	  params.add(asuntoManual);
	  params.add(enlaceManual);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoModificar);
	  params.add(asuntoModificar);
	  params.add(enlaceModificar);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoConfirmar);
	  params.add(asuntoConfirmar);
	  params.add(enlaceConfirmar);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(slot);
	  params.add(metodoAsignacion);
	  params.add(tiempoMaxEspera);
	  params.add(previsionMinima);
	  params.add(nAusencias);
	  query = pm.getPropiedad("insertConfInicialTutoria");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  params.removeAllElements(); //Elimino elementos del vector
	  params.add(motivoCode);
	  params.add(asuntoCode);
	  params.add(enlaceCode);
	  query = pm.getPropiedad("insertConfInicial");  
	  micon = new ConexionBD();
	  micon.doUpdate(query, params);
	  
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
       <jsp:forward page="../controller/principalAdministradorController.jsp"/>
      <%
   }
}%>