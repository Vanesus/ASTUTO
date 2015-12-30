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
<%@ page import="com.itextpdf.text.*"%>
<%@ page import="com.itextpdf.text.pdf.*"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import="com.itextpdf.text.List"%>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>

<%
  try{
   Document documento = new Document();//Crear documento
   
   PdfWriter.getInstance(documento,new FileOutputStream("C:/informeAlumnosProfesor.pdf"));
   
   documento.open();//abrir documento
   //Poner foto arriba a la derecha del documento
   Image foto= Image.getInstance ("C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ASTUTO/images/p_investigador_002.gif");
   foto.scaleToFit(150,150);
   foto.setAlignment(Chunk.ALIGN_RIGHT);
   documento.add(foto);
   
   //Crear una tabla
   documento.add(new Paragraph(" "));
   PdfPTable tabla = new PdfPTable(2);
   
   //Primer fila de la tabla, con el titulo
   Paragraph pg = new Paragraph ("Informe Alumnos Profesor");
   pg.getFont().setFamily("Arial");
   pg.getFont().setSize(15);
   pg.getFont().setColor(255,255,255);
   
   PdfPCell celda = new PdfPCell(pg);
   //Celda color rojo
   celda.setColspan(3);
   celda.setHorizontalAlignment(Element.ALIGN_CENTER);
   BaseColor color = new BaseColor (140, 18, 41);
   
   celda.setBackgroundColor(color);
   celda.setPadding(5.0f); 
   tabla.addCell (celda);
   //cremos en la tabla 2 columnas
   celda=new PdfPCell(new Paragraph ("CORREO"));
   celda.setHorizontalAlignment (Element.ALIGN_CENTER);
   celda.setPadding(4.0f);
   tabla.addCell(celda);
   
   celda=new PdfPCell(new Paragraph ("NOMBRE"));
   celda.setHorizontalAlignment (Element.ALIGN_CENTER);
   celda.setPadding(4.0f);
   tabla.addCell(celda);
     
   //Introducir los datos en cada columna
   for(int i=0;i<alumnoBean.getContador();i++){
       tabla.addCell(String.valueOf(alumnoBean.getCorreo(i)));
       tabla.addCell(String.valueOf(alumnoBean.getNombre(i)));
	}
   
   //Escribir en el documento la tabla
   documento.add(tabla);
   
   //Establecer Fecha y hora
   Date fecha = new Date();
   SimpleDateFormat FormatofechaHora = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss a");
   
   //Escribir en el documento
   documento.add(new Paragraph(" "));
   documento.add(new Paragraph(" "));
   documento.add(new Paragraph("               Informe Generado el "+FormatofechaHora.format(fecha)));
   
   //Cerrar documento
   documento.close();
   messageBean.setMsg("Se ha creado un documento en PDF en la siguiente dirección: C:/informeAlumnosProfesor.pdf");
   messageBean.setUrl("../controller/principalProfesorController.jsp");
   }catch(FileNotFoundException ex){
     javax.swing.JOptionPane.showMessageDialog(null, "El archivo que se esta generando esta abierto o esta siendo utilizado");
	 response.sendRedirect("../controller/principalProfesorController.jsp");
   }
   
   //Redirecciono a la vista que muestra la pagina.
   %>
   <jsp:forward page="../view/resultadoPDFView.jsp"/>