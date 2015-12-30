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
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

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
  ConexionBD micon;  

  //Extraigo el identificador de la estructura docente y la opción
  String idEstDocente = request.getParameter("idEstDocente");	
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
  //para que cuando le de ha nuevo con una opcion metida que seria cuando salgo de editar, borrar. 
  if(opcion!=null){
    //Busco los todos los centros
	query = pm.getPropiedad("selectDatosEstDocenteNull");  
	micon = new ConexionBD();
	// Realiza una consulta en la base de datos pasando la consulta como argumentos
	Vector resultado = micon.doSelect(query);
	
	centroBean.setContador(resultado.size());
	for (int i=0; i<centroBean.getContador(); i++){
		item = (Hashtable)resultado.get(i);  
		String nombre = (String)item.get("nombre");
		Integer id = (Integer)item.get("id_EstDocente");
		Integer orden = (Integer)item.get("orden");
		
		centroBean.setCentro(nombre,i);
		centroBean.setId(id,i);
		centroBean.setOrden(orden,i);	
    }
   }   
  //la primera vez que entro al EstDocente; Centros	
  if (idEstDocente == null ){
	query = pm.getPropiedad("selectDatosEstDocenteNull");  
	micon = new ConexionBD();
	// Realiza una consulta en la base de datos pasando la consulta como argumentos
	Vector resultado = micon.doSelect(query);
	
	centroBean.setContador(resultado.size());
	for (int i=0; i<centroBean.getContador(); i++){
		item = (Hashtable)resultado.get(i);  
		String nombre = (String)item.get("nombre");
		Integer id = (Integer)item.get("id_EstDocente");
		Integer orden = (Integer)item.get("orden");
		
		centroBean.setCentro(nombre,i);
		centroBean.setId(id,i);
		centroBean.setOrden(orden,i);	
    }
   }
  //para nevegar entre la estructura docente si son titulaciones o cursos tengo que pasarle idEstDocente a las que pertenecen.  
  if (idEstDocente !=null && opcion==null){
	// Realiza una consulta en la base de datos pasando la consulta como argumentos
	//para mostrar el nombre de la EstDocente arriba
	params.removeAllElements(); //Elimino elementos del vector
	params.add(idEstDocente);
	query = pm.getPropiedad("selectEstDocenteNombre");  
	micon = new ConexionBD();
	// Realiza una consulta en la base de datos pasando la consulta como argumentos
	Vector resultado = micon.doSelect(query,params);
	
	if (resultado.size()==1){	
		//nombre de la EstDocente anterior para ponerlo arriba
		item = (Hashtable)resultado.get(0);  
		String nombreVer = (String)item.get("nombre");
		estDocenteBean.setNombre(nombreVer);
		
		query = pm.getPropiedad("selectDatosEstDocente");  
		micon = new ConexionBD();
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idEstDocente);
		// Realiza una consulta en la base de datos pasando la consulta como argumentos
		resultado = micon.doSelect(query,params);
		centroBean.setContador(resultado.size());

		for (int i=0; i<centroBean.getContador(); i++)
		{
			item = (Hashtable)resultado.get(i);  
			String nombre = (String)item.get("nombre");
			Integer id = (Integer)item.get("id_EstDocente");
			Integer orden = (Integer)item.get("orden");
				
			centroBean.setCentro(nombre,i);
			centroBean.setId(id,i);
			centroBean.setOrden(orden,i);	
		}
		//busco el id de la estDocente anterior para poner moverme con el boton atras
		params.removeAllElements(); //Elimino elementos del vector
		params.add(idEstDocente);
		query = pm.getPropiedad("selectIdEstDocente");  
		micon = new ConexionBD();
		// Realiza una consulta en la base de datos pasando la consulta como argumentos
		resultado = micon.doSelect(query,params);
		item = (Hashtable)resultado.get(0);  
		Integer idEstDocenteAntes = (Integer)item.get("id_EstDocAntecesora");
		estDocenteBean.setIdAntes(idEstDocenteAntes);
	 }
  }
}
  //Redirecciono a la vista que muestra la pagina.	  
  %>
  <jsp:forward page="../view/estDocenteMantView.jsp"/>     