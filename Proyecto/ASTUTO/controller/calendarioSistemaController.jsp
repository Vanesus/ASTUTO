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
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
//No esta logado, redireciono a la pagina principal de invidatos
if (loginBean.getUser()==""){
  %>
      <jsp:forward page="../controller/principalController.jsp"/>
  <%
}else{  //Si esta logado

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
  
  //Lista los enlaces de interes relacionados con el administrador.
  query = pm.getPropiedad("selectEnlacesAdministrador");  
  micon = new ConexionBD();
  Vector resultadoEnlaces = micon.doSelect(query);

  enlacesBean.setContador(resultadoEnlaces.size());
  for (int i=0; i<enlacesBean.getContador(); i++)
  {
    item = (Hashtable)resultadoEnlaces.get(i);  
    String nombre = (String)item.get("nombre");
	String URL = (String)item.get("URL");
	//Indicaciones para mostrar el nombre y URL del enlace
    enlacesBean.setNombre(nombre,i);
	enlacesBean.setUrl(URL,i);   
  }
  
  //Extraigo del formulario
  String opcion = request.getParameter("opcion");
  String diaI = request.getParameter("dI");
  String mesI = request.getParameter("mI");
  String anyoI = request.getParameter("aI");
  String diaF = request.getParameter("dF");
  String mesF = request.getParameter("mF");
  String anyoF = request.getParameter("aF");
  String tipo = request.getParameter("tipo");
  //Formulario vacio
  if(diaI==null && mesI==null && anyoI==null && diaF==null && mesF==null && anyoF==null && opcion==null){
      //Buscar datos calendario escolar
      query = pm.getPropiedad("selectCalendario");  
      Vector calendario = micon.doSelect(query);
	  calendarioBean.setContador(calendario.size());
	  //No hay ninguna restricciones
	  if(calendario.size()==0){
		messageBean.setMsg("No hay ninguna restricción");
	  }else{
	    for(int i=0;i<calendarioBean.getContador();i++){
		 //Datos de cada periodo del calendario
         item = (Hashtable)calendario.get(i); 
	     calendarioBean.setId((Integer)item.get("id_calendario"),i);
		 calendarioBean.setdInicio((Integer)item.get("dInicio"),i);
		 calendarioBean.setmInicio((Integer)item.get("mInicio"),i);
		 calendarioBean.setaInicio((Integer)item.get("aInicio"),i);
		 calendarioBean.setdFin((Integer)item.get("dFin"),i);
		 calendarioBean.setmFin((Integer)item.get("mFin"),i);
		 calendarioBean.setaFin((Integer)item.get("aFin"),i);
		 calendarioBean.setTipo((Integer)item.get("tipo"),i);
		}
		messageBean.setMsg("");
      }
	  //Redirecciono a la vista que muestra la pagina.	  
	  %>
	  <jsp:forward page="../view/calendarioSistemaView.jsp"/>
	  <%
  }
  //Formulario vacio
  else if(diaI=="" || mesI=="" || anyoI=="" || diaF=="" || mesF=="" || anyoF=="" ){
    messageBean.setMsg("");
    //Redirecciono a la vista que muestra la pagina.	  
  	%><jsp:forward page="../view/nuevoCalendarioView.jsp"/><%		
  }
  //Nueva restricción 
  else if(opcion.equals("nuevo"))
  {
    Integer dI=Integer.parseInt(diaI.trim());
	Integer dF=Integer.parseInt(diaF.trim());
	Integer mI=Integer.parseInt(mesI.trim());
	Integer mF=Integer.parseInt(mesF.trim());
	Integer aI=Integer.parseInt(anyoI.trim());
	Integer aF=Integer.parseInt(anyoF.trim());
	//Fecha errornea
	if (dI>30||dI<1||mI<1||mI>12||aI<1900||dF>30||dF<1||mF<1||mF>12||aF<1900)
	{
		messageBean.setMsg("Error fecha icorrecta");
		//Redirecciono a la vista que muestra la pagina.	  
		%><jsp:forward page="../view/nuevoCalendarioView.jsp"/><%
  	}
	//Fecha errornea
	if ((dI>dF && mI==mF)||((mI>mF) && anyoI.equals(anyoF))||(aI>aF))
	{
		messageBean.setMsg("Error fecha incorrecta");
		//Redirecciono a la vista que muestra la pagina.	  
		%><jsp:forward page="../view/nuevoCalendarioView.jsp"/><%
  	}
	//insertamos una nueva restricción en el calendario
    params.removeAllElements(); //Elimino elementos del vector
    params.add(diaI);	
	params.add(mesI);	
	params.add(anyoI);	
	params.add(diaF);	
	params.add(mesF);	
	params.add(anyoF);	
	params.add(tipo);	
  	query = pm.getPropiedad("insertCalendario");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
	messageBean.setMsg("Fecha en calendario insertada");
	//Redirecciono a la vista que muestra la pagina.	  
	%><jsp:forward page="../view/nuevoCalendarioView.jsp?opcion=salir"/><%
  }
  //Editar calendario
  else if(opcion.equals("editar")){
    //Extraigo el identificador de la excepción seleccionada para editar
  	String id=request.getParameter("id");
    Integer dI=Integer.parseInt(diaI.trim());
	Integer dF=Integer.parseInt(diaF.trim());
	Integer mI=Integer.parseInt(mesI.trim());
	Integer mF=Integer.parseInt(mesF.trim());
	Integer aI=Integer.parseInt(anyoI.trim());
	Integer aF=Integer.parseInt(anyoF.trim());
	//Fecha errornea
	if (dI>30||dI<1||mI<1||mI>12||aI<1900||dF>30||dF<1||mF<1||mF>12||aF<1900)
	{
		messageBean.setMsg("Error fecha incorrecta");
		//Redirecciono a la vista que muestra la pagina.	  
		%><jsp:forward page="../view/nuevoCalendarioView.jsp?opcion=salir"/><%
  	}
	//Fecha erronea
	if ((dI>dF && mI==mF)||((mI>mF) && anyoI.equals(anyoF))||(aI>aF)){
		messageBean.setMsg("Error fecha incorrecta");
		//Redirecciono a la vista que muestra la pagina.	  
		%><jsp:forward page="../view/nuevoCalendarioView.jsp?opcion=salir"/><%
  	}
	//Editar calendario
    params.removeAllElements(); //Elimino elementos del vector
    params.add(diaI);	
	params.add(mesI);	
	params.add(anyoI);	
	params.add(diaF);	
	params.add(mesF);	
	params.add(anyoF);	
	params.add(tipo);	
	params.add(id);	
  	query = pm.getPropiedad("updateCalendario");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
	
	messageBean.setMsg("Fecha en calendario editada");
	//Redirecciono a la vista que muestra la pagina.	  
	%><jsp:forward page="../view/nuevoCalendarioView.jsp?opcion=salir"/><%
  }
  //Borrar calendario
  else if(opcion.equals("borrar")){
    //Extraigo el identificador de la excepción seleccionada para editar
    String id=request.getParameter("id");
	//Borrar excepción del calendario
    params.removeAllElements(); //Elimino elementos del vector	
	params.add(id);	
  	query = pm.getPropiedad("deleteCalendario");  
  	micon = new ConexionBD();
  	micon.doUpdate(query,params);
	
	messageBean.setMsg("Fecha en calendario borrada");
	//Redirecciono a la vista que muestra la pagina.	  
	%><jsp:forward page="../view/nuevoCalendarioView.jsp?opcion=salir"/><%
  }
}
%>