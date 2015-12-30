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
<%@ page import = "java.lang.*" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<%-- Declaraci�n de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

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
  ConexionBD micon=new ConexionBD(); 
  
  //Datos extraidos del formulario
  String dia=request.getParameter("dia");
  String mes=request.getParameter("mes");
  String anyo=request.getParameter("anyo");
  
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
	
  //Primera visi�n del calendario
  if(dia==null){
  	  //Busar los datos del calendario escolar
      query = pm.getPropiedad("selectCalendario");  
      Vector calendario = micon.doSelect(query);
	  calendarioBean.setContador(calendario.size());
	  for(int i=0;i<calendarioBean.getContador();i++){
         item = (Hashtable)calendario.get(i); 
	     calendarioBean.setId((Integer)item.get("id_calendario"),i);
		 calendarioBean.setdInicio((Integer)item.get("dInicio"),i);//dia de inicio del periodo
		 calendarioBean.setmInicio((Integer)item.get("mInicio"),i);//mes de inicio
		 calendarioBean.setaInicio((Integer)item.get("aInicio"),i);//a�o de inicio
		 calendarioBean.setdFin((Integer)item.get("dFin"),i);//dia de fin del periodo
		 calendarioBean.setmFin((Integer)item.get("mFin"),i);//mes de fin
		 calendarioBean.setaFin((Integer)item.get("aFin"),i);//a�o de fin
		 calendarioBean.setTipo((Integer)item.get("tipo"),i);//tipo de periodo 
	  }
	  //Busar todas las peticiones de tutor�a
	  query = pm.getPropiedad("selectTodasPeticionTut");  
      Vector resultadoTodasPetTut = micon.doSelect(query);
	  peticionTutBean.setContador(resultadoTodasPetTut.size());
	  for(int i=0;i<peticionTutBean.getContador();i++){
         item = (Hashtable)resultadoTodasPetTut.get(i); 
	     peticionTutBean.setDia1((Integer)item.get("dia"),i);
		 peticionTutBean.setMes1((Integer)item.get("mes"),i);
		 peticionTutBean.setAnyo1((Integer)item.get("anyo"),i);
	  }
	  //Redirecciono a la vista que muestra la pagina.
      %>
      <jsp:forward page="../view/diarioTutoriasView.jsp"/>
      <%
	  }else{//Si el dia es distinto de null
	  //Redirecciono al controller que muestra la pagina.
	  %>
  		<jsp:forward page="../controller/tutoriaDiaController.jsp"/>
	  <%
	  }}%>
  