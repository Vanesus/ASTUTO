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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="excepcionBean" class="uco.interfaz.ExcepcionBean" scope="session"/>
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
  
  //Datos extraido del bena
  int d = excepcionBean.getDia();//d�a
  int m = excepcionBean.getMes();//mes
  int a = excepcionBean.getAnyo();//a�o
  
  //Datos extraidos del formulario
  String tipo = request.getParameter("tipo");
  String opcion = request.getParameter("opcion");
  String id = request.getParameter("id");
 
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
  
  //Buscar el identificador del profesor
  query = pm.getPropiedad("selectBuscarIdProfesor"); 
  params.removeAllElements(); //Elimino elementos del vector
  params.add(loginBean.getUser());  
  Vector resultado = micon.doSelect(query, params);
  item=(Hashtable)resultado.get(0);
  Integer idProfesor = (Integer)item.get("id_profesor");
  
  //Si la opci�n es eliminar excepci�n
  if(opcion!=null && id!=null){
      //Eliminar la excepcion
	  params.removeAllElements();
	  query = pm.getPropiedad("deleteExcepcion");  
      params.add(id); 
      micon.doUpdate(query,params);
      messageBean.setMsg("Excepci�n borrada.");
	  //Redirecciono a la vista que muestra la pagina.        
      %>
	  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=salir"/>
      <%	
  }else if(tipo==null){//Nueva excepci�n
  	  //Redirecciono a la vista que muestra la pagina.        	
      messageBean.setMsg("");			  
	  %> 
	  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=nuevo"/>
	  <%
  }else{ //insertar una nueva excepcion
	 if(tipo.equals("1")){//Tipo de excepci�n no asignar tutor�a durante todo el dia
	   //Insertar nueva excepcion
       params.removeAllElements();
	   query = pm.getPropiedad("insertExcepcion");  
       params.add(d); 
	   params.add(m); 
	   params.add(a); 
	   params.add(tipo); 
	   params.add(idProfesor); 
       micon.doUpdate(query,params);
	 }else{//Tipo de excepci�n asignar la tutor�a con otro horario
	 	//Datos extraidos del formulario
		String hInicio=request.getParameter("horaI");
		String mInicio=request.getParameter("minutosI");
		String hFin=request.getParameter("horaF");
		String mFin=request.getParameter("minutosF");
		String slot=request.getParameter("slot");
		String asignacion=request.getParameter("asignacion");
		  //Los datos no estan introducidos, mostrar formulario para introducir datos
		  if(hInicio==null &&mInicio==null &&hFin==null && mFin==null){
		      //Redirecciono a la vista que muestra la pagina.  
			  messageBean.setMsg("");      
              %> 
			  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=hora"/>
			  <%
          }else{//Los datos estan introducidos
		    if (slot==""){
				messageBean.setMsg("Introduzca todos los datos");
			  %> 
			  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=hora"/>
			  <%
			}
		    if (hInicio=="" ||hFin==""||mInicio==""||mFin=="" ){
			  messageBean.setMsg("Error fecha incorrecta");
			  %> 
			  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=hora"/>
			  <%
			}
		    Integer horaInicio= Integer.parseInt(hInicio.trim());
			Integer horaFin= Integer.parseInt(hFin.trim());
		    Integer minutosInicio= Integer.parseInt(mInicio.trim());
			Integer minutosFin= Integer.parseInt(mFin.trim());
		    if (horaInicio>horaFin || (horaInicio==horaFin && minutosInicio>minutosFin))
			{
			  messageBean.setMsg("Error fecha incorrecta");
			  %> 
			  <jsp:forward page="../view/excepcionDiaView.jsp?opcion=hora"/>
			  <%
			}
		    //Insertamos nueva excepci�n con los datos del nuevo horario.
			params.removeAllElements();
			query = pm.getPropiedad("insertExcepcionHora");  
			params.add(d); 
			params.add(m); 
			params.add(a); 
			params.add(hInicio); 
			params.add(mInicio); 
			params.add(hFin); 
			params.add(mFin); 
			params.add(tipo); 
			params.add(idProfesor);
			params.add(slot); 
			params.add(asignacion);
			micon.doUpdate(query,params);
			excepcionBean.sethInicio(horaInicio);
			excepcionBean.setmInicio(minutosInicio);
			excepcionBean.sethFin(horaFin);
			excepcionBean.setmFin(minutosFin);
     	}
	 }
	   messageBean.setMsg("Excepci�n creada");
	   //Redirecciono a la vista que muestra la pagina.        	
	   %>
	   <jsp:forward page="../view/excepcionDiaView.jsp?opcion=salir"/>
       <%	
  } 
 }%>