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
<%@ page import="com.itextpdf.text.*"%>
<%@ page import="com.itextpdf.text.pdf.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import="com.itextpdf.text.List"%>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="titulacionBean" class="uco.interfaz.TitulacionBean" scope="session"/>
<jsp:useBean id="cursoBean" class="uco.interfaz.CursoBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<%

  try{
  
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
  
  
   //Lista de Centros. 
  //Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea null
  query = pm.getPropiedad("selectCentro");  
  micon = new ConexionBD();
  Vector resultadoCentro = micon.doSelect(query);

  centroBean.setContador(resultadoCentro.size());
  for (int i=0; i<centroBean.getContador(); i++){
    item = (Hashtable)resultadoCentro.get(i);  
    String centro = (String)item.get("nombre");
	Integer id_centro = (Integer)item.get("id_EstDocente");
	Integer orden = (Integer)item.get("orden");
	
    centroBean.setCentro(centro,orden-1);//le resto 1 para que sea un vector de 0 a n-1
	centroBean.setId(id_centro,orden-1);
	centroBean.setOrden(orden,orden-1);
    
	//Lista de Titulaciones de cada centro
	//Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea el id del centro.
	params.removeAllElements(); //Elimino elementos del vector
    params.add(id_centro);
    query = pm.getPropiedad("selectTitulacion");   
	micon = new ConexionBD();
    Vector resultadoTit = micon.doSelect(query, params);
	
    titulacionBean.setContador(resultadoTit.size(),orden-1);
      for (int j=0; j<titulacionBean.getContador(orden-1); j++){
		item = (Hashtable)resultadoTit.get(j);  
		String titulacion = (String)item.get("nombre");
		Integer id_titulacion = (Integer)item.get("id_EstDocente");
		Integer ordenTit = (Integer)item.get("orden");
		
		titulacionBean.setTitulacion(titulacion,orden-1,ordenTit-1);
		titulacionBean.setId(id_titulacion,orden-1,ordenTit-1);
		titulacionBean.setOrden(ordenTit,orden-1,ordenTit-1);
		
		//Lista de Curso de cada titulacion
		//Muestra las Estructuras Docentes que cuyo id_EstDocAntecesora sea el id de la titulación.
		params.removeAllElements(); //Elimino elementos del vector
		params.add(id_titulacion);
		query = pm.getPropiedad("selectCurso");   
		micon = new ConexionBD();
		Vector resultadoCurso = micon.doSelect(query, params);
		
		cursoBean.setContador(resultadoCurso.size(),orden-1,ordenTit-1);
		  for (int k=0; k<cursoBean.getContador(orden-1,ordenTit-1); k++){
			item = (Hashtable)resultadoCurso.get(k);  
			String curso = (String)item.get("nombre");
			Integer id_curso = (Integer)item.get("id_EstDocente");
			Integer ordenCurso = (Integer)item.get("orden");
			cursoBean.setCurso(curso,orden-1,ordenTit-1,ordenCurso-1);
			cursoBean.setId(id_curso,orden-1,ordenTit-1,ordenCurso-1);
			cursoBean.setOrden(ordenCurso,orden-1,ordenTit-1,ordenCurso-1);
		 }
	  } 
   }
   Document documento = new Document();//Crear documento
   
   PdfWriter.getInstance(documento,new FileOutputStream("C:/informeEstDocente.pdf"));
   
   documento.open();//abrir documento
   //Poner foto arriba a la derecha del documento
   Image foto= Image.getInstance ("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ASTUTO/images/p_investigador_002.gif");
   foto.scaleToFit(150,150);
   foto.setAlignment(Chunk.ALIGN_RIGHT);
   documento.add(foto);
   
   //Crear una tabla
   documento.add(new Paragraph(" "));
   PdfPTable tabla = new PdfPTable(1);
   
   //Primer fila de la tabla, con el titulo
   Paragraph pg = new Paragraph ("Informe Estructuras");
   pg.getFont().setFamily("Arial");
   pg.getFont().setSize(15);
   pg.getFont().setColor(255,255,255);
   
   PdfPCell celda = new PdfPCell(pg);
   //Celda color rojo
   celda.setColspan(1);
   celda.setHorizontalAlignment(Element.ALIGN_CENTER);
   BaseColor color = new BaseColor (140, 18, 41);
   
   celda.setBackgroundColor(color);
   celda.setPadding(5.0f); 
   tabla.addCell (celda);
   
   //Escribir en el documento la tabla
   documento.add(tabla);
   
   documento.add(new Paragraph(" "));
   documento.add(new Paragraph(" "));
   
   //Vamos escribiendo en el documento cada uno de los datos 
   for(int i=0;i<centroBean.getContador();i++){
   	   documento.add(new Paragraph(("              		 ")+String.valueOf(centroBean.getCentro(i))));//Curso
	   for(int j=0;j<titulacionBean.getContador(i);j++){
	      documento.add(new Paragraph(("                		 --")+String.valueOf(titulacionBean.getTitulacion(i,j))));//Titulacion
	   }
	}
   //Establecer Fecha y hora
   Date fecha = new Date();
   SimpleDateFormat FormatofechaHora = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a");
   
   //Escribir en el documento
   documento.add(new Paragraph(" "));
   documento.add(new Paragraph(" "));
   documento.add(new Paragraph("               Informe Generado el "+FormatofechaHora.format(fecha)));
   
   //Cerrar documento
   documento.close();
   messageBean.setMsg("Se ha creado un documento en PDF en la siguiente dirección: C:/informeEstDocente.pdf");
   messageBean.setUrl("../view/estDocenteMantView.jsp");
   }catch(FileNotFoundException ex){
     javax.swing.JOptionPane.showMessageDialog(null, "El archivo que se esta generando esta abierto o esta siendo utilizado");
	 response.sendRedirect("../controller/principalAdministradorController.jsp");
   }
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/resultadoPDFView.jsp"/>