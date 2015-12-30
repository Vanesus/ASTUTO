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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>

<%
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
  
  //Extraigo 
  String nombre = request.getParameter("nombre");//Nombre Pprofesor
  String apellido = request.getParameter("apellido");//Apellidos profesor
  String asignaturas = request.getParameter("asignatura");//Nombre asignatura
  
  //Lista los enlaces de interes relacionados con los alumnos.
  query = pm.getPropiedad("selectEnlacesAlumno");  
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

 // Si es la primera vez que accedo a este fichero redirecciono y muestro la vista correspondiente
 if (nombre==null && apellido==null && asignaturas==null) { 
	messageBean.setMsg("");
  %>
  <jsp:forward page="../view/buscarProfView.jsp"/>
  <% 
 }else{
 	//No hay ningun dato introducido  
    if(nombre==("") && apellido==("") && asignaturas==("")){
		messageBean.setMsg("Introduzca algún dato");
		 %>
               <jsp:forward page="../view/buscarProfView.jsp"/>
         <%		 
	}else{ //Hay datos introducidos
		//Busco algun profesor que tenga estas caracteristicas
		params.removeAllElements(); //Elimino elementos del vector
		params.add(nombre);
		params.add(apellido);
		params.add(asignaturas);
		query = pm.getPropiedad("selectDatos"); 
		micon = new ConexionBD();
		Vector resultado = micon.doSelect(query,params);
		//Hamos encontrador algun profesor
	    if(resultado.size()!=0){
		 profBean.setContador(resultado.size());
		 for(int i=0;i< resultado.size();i++){	
		 	//Extraigo los datos del profesor/es encontrado/s
			item = (Hashtable)resultado.get(i);  
			Integer idProfesor=(Integer)item.get("id_profesor");
			String nomb = (String)item.get("nombre");
			String ape = (String)item.get("apellidos");
			
			profBean.setId(idProfesor,i);
			profBean.setNombre(nomb,i);
			profBean.setApellidos(ape,i);
				
			//Busco el nombre de la asignaturas que imparte ese profesor
			params.removeAllElements(); //Elimino elementos del vector
			params.add(idProfesor);
			params.add(asignaturas);
	        query = pm.getPropiedad("selectIdAsig");  
	        micon = new ConexionBD();
	        Vector resultadoAsig = micon.doSelect(query, params);
	        //Tiene asignaturas asignadas el profesor
			if(resultadoAsig.size() !=0){
	           profBean.setContadorAsig(resultadoAsig.size(),i);
	           for (int j=0; j<profBean.getContadorAsig(i); j++){
					//Extraigo el identificador de las asiganturas asignadas al profesor
			        item = (Hashtable)resultadoAsig.get(j);  	
			        Integer idAsig=(Integer)item.get("id_asignatura");
			        profBean.setIdAsignatura(idAsig,i,j);
					
					//Busco el nombre de la asignatura
					params.removeAllElements(); //Elimino elementos del vector
					params.add(idAsig);
					query = pm.getPropiedad("selectNombreAsig");  
					micon = new ConexionBD();
					Vector resultadoNombre = micon.doSelect(query, params);
					item = (Hashtable)resultadoNombre.get(0);  	
			        String NombreAsig=(String)item.get("nombre");
					Integer id_EstDocente=(Integer)item.get("id_EstDocente");
			        profBean.setAsignatura(NombreAsig,i,j);
					
					//Busco el nombre de la titulación a la que pertenece dicha asigantura
					params.removeAllElements(); //Elimino elementos del vector
					params.add(id_EstDocente);
					query = pm.getPropiedad("selectNombreTitulacion");  
					micon = new ConexionBD();
					Vector resultadoTit = micon.doSelect(query, params);
					item = (Hashtable)resultadoTit.get(0);  	
			        String NombreTit=(String)item.get("nombre");
					profBean.setTitulacion(NombreTit,i,j);	
   		        }
			}
		}
		//Redirecciono a la vista que muestra la pagina.
		%>
        <jsp:forward page="../view/resultBusquedaProfView.jsp"/>
        <%
	}else{//No existe profesor con esas caracteristicas
	    messageBean.setMsg("Datos no encontrados");
		//Redirecciono a la vista que muestra la pagina.
		 %>
               <jsp:forward page="../view/buscarProfView.jsp"/>
         <%    
	}
   }
  }
  profBean=null;
%>
            