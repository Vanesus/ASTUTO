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
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

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
  		     
  //Lista los enlaces de interes relacionados con los alumnos.
  query = pm.getPropiedad("selectEnlacesAlumno");  
  micon = new ConexionBD();
  Vector resultadoEnlaces = micon.doSelect(query);
  Calendar fecha = Calendar.getInstance();

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
  //Elimino todas las peticiones de tutorías cuyo estado sea "enviada" y la fecha asignada sea mayor que la actual. 
  //Aquellas que no han sido aceptadas ni rechazadas por el alumno y ya no pueden realizarse porque se ha pasado el día asignado.
  query = pm.getPropiedad("selectPeticionCaducada"); 
  params.removeAllElements(); //Elimino elementos del vector
  params.add(2); 
  params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));//fecha Caducidad
  Vector resultado=micon.doSelect(query, params);
  //Si existe la petición
  if (resultado.size()>0)
  {
  	for (int i=0;i<resultado.size();i++)
	{
		item=(Hashtable)resultado.get(i);
		Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		Integer idProfesor= (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		
		query = pm.getPropiedad("deletePeticionTutCaducada"); 
  		params.removeAllElements();
  		params.add(idPeticionTut); 
  		micon.doUpdate(query, params);
		
		//Insertamos registro de movimientos del alumno
		  query = pm.getPropiedad("insertRegistro"); 
		  params.removeAllElements(); //Elimino elementos del vector
		  params.add(idPeticionTut); 
		  params.add(idProfesor); 
		  params.add(idAsignatura);
		  if (anyo==null)
		  	params.add(null);
		  else
		  	params.add(anyo+"-"+mes+"-"+dia); 
		  params.add(horaInicio); 
		  params.add(minutosInicio); 
		  params.add(idAlumno); 
		  params.add("Peticion Tutoria"); 
		  params.add("Caducada"); 
		  params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
		  params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
		  micon.doUpdate(query, params);
	}
  }
  
  //Elimino todas las peticiones de tutorías cuyo estado sea "enviada" y la fecha asignada sea mayor que la actual. 
  //Aquellas que no han sido aceptadas ni rechazadas por el alumno y ya no pueden realizarse porque se ha pasado el día asignado.
  query = pm.getPropiedad("selectPeticionCaducada"); 
  params.removeAllElements(); //Elimino elementos del vector
  params.add(7); 
  params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));//fecha Caducidad
  Vector resultadoConfirmacion=micon.doSelect(query, params);
  //Si existe la petición
  if (resultadoConfirmacion.size()>0)
  {
  	for (int i=0;i<resultadoConfirmacion.size();i++)
	{
		item=(Hashtable)resultadoConfirmacion.get(i);
		Integer idAlumno = (Integer)item.get("id_alumno");
		Integer idPeticionTut = (Integer)item.get("id_peticionTut");
		Integer idProfesor= (Integer)item.get("id_profesor");
		Integer idAsignatura = (Integer)item.get("id_asignatura");
		Integer dia = (Integer)item.get("dia");
		Integer mes = (Integer)item.get("mes");
		Integer anyo = (Integer)item.get("anyo");
		Integer horaInicio = (Integer)item.get("horaInicio");
		Integer minutosInicio = (Integer)item.get("minutosInicio");
		
		query = pm.getPropiedad("deletePeticionTutCaducada"); 
  		params.removeAllElements();
  		params.add(idPeticionTut); 
  		micon.doUpdate(query, params);
		
		//Insertamos registro de movimientos del alumno
		  query = pm.getPropiedad("insertRegistroConfirmacion"); 
		  params.removeAllElements(); //Elimino elementos del vector
		  params.add(idPeticionTut); 
		  params.add(idProfesor); 
		  params.add(idAsignatura); 
		  params.add(idAlumno); 
		  params.add("Confirmacion Peticion en Curso"); 
		  params.add("Caducada"); 
		  params.add(fecha.get(Calendar.YEAR)+"-"+(fecha.get(Calendar.MONTH)+1)+"-"+fecha.get(Calendar.DATE));
		  params.add(fecha.get(Calendar.HOUR_OF_DAY)+":"+fecha.get(Calendar.MINUTE)); 
		  micon.doUpdate(query, params);
	}
  }
  
  messageBean.setMsg("");
  //Redirecciono a la vista que muestra la pagina principal
  %>
  <jsp:forward page="principalView.jsp"/>            