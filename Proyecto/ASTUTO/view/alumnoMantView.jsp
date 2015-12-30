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
<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>

<html><head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<%-- Ficheros necesarios para la generación de pantallas GreyBox --%>
<script type="text/javascript">var GB_ROOT_DIR = "../greybox/"; </script>
<script type="text/javascript" src="../greybox/AJS.js"></script>
<script type="text/javascript" src="../greybox/AJS_fx.js"></script>
<script type="text/javascript" src="../greybox/gb_scripts.js"></script>
<link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
a:link {	text-decoration: none;}
a:visited {	text-decoration: none;}
a:hover {color:#D69E00;	text-decoration: none;}
a:active {	text-decoration: none;}
.boton{
        width:80px;
        height:25px;
		}
-->
</style>
</head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>

<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
                          <td class="T24" align="right"><font color="#ffffff"> 
                            A&nbsp;l&nbsp;u&nbsp;m&nbsp;n&nbsp;o&nbsp;/&nbsp;s&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
	   <td>
		  <table border="0" cellpadding="4" cellspacing="0" width="100%">
          <tbody><tr valign="top">
			
        <td class="T10a"> <table width="526" cellpadding="4" cellspacing="0" style="width: 459px; height: 200px;">
            <tbody>
              <tr valign="top"> 
                <td width="518"> <table bgcolor="#d69e00" width="100%">
                    <tbody>
                      <tr> 
                        <td class="T10" align="left" > <b><font color="#ffffff">&nbsp;Criterios 
                          de Búsqueda</font></b> </td>
						<%--Extraigo del formulario--%>
                        <%String correo=request.getParameter("correo");%>
                        <%String profesor=request.getParameter("profesor");%>
                        <%String asignatura=request.getParameter("asignatura");%>
                      </tr>
                    </tbody>
                  </table>
				  <%--Datos de busqueda--%>
                  <table border="0" cellspacing="2" cellpadding="2" width="461" align="center">
                    <tbody>
                      <tr> 
                        <td class="T10L" valign="top" width="20%">Correo:</td>
                        <td class="T10" valign="top" width="80%"><%=correo%></td>
                      </tr>
                      <tr> 
                        <td class="T10L" valign="top" width="20%">Profesor:</td>
                        <td class="T10" valign="top" width="80%"><%=profesor%></td>
                      </tr>
                      <tr> 
                        <td class="T10L" valign="top" width="20%">Asignatura:</td>
                        <td class="T10" valign="top" width="80%"><%=asignatura%></td>
                      </tr>
                    </tbody>
                  </table>
                  <table style="margin-left: 12pt;" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr> 
                        <td width="504">&nbsp; </td>
                      </tr>
                      <tr> 
                        <td><font class="T14V" color="#8c1233">&nbsp;&nbsp;Resultados: 
                          </font></td>
                      </tr>
                      <tr> 
                        <td><img src="../images/encabezado_w2a.gif" width="504" height="11" /></td>
                      </tr>
                    </tbody>
                  </table>
                  <p align="center" >&nbsp;</p>
                  <table  width="334" height="56" align="center"	>
                    <tr valign="top"> 
                      <td width="130" height="23" class="T10" align="left"><strong><font color="#8c1229">Correo</font></strong></td>
                      <td width="188" class="T10" align="left"><strong><font color="#8c1229">Nombre</font></strong></td>
                    </tr>
                    <%String color ="#FFFDE5";%>
                    <%--Lista de alumnos encontrados--%>
                    <%for (int i=0;i<alumnoBean.getContador();i++)  {
					if(i%2==0) color="#FFE0B1";
	  			    else color ="#FFF5E4";%>
                    <tr valign="middle" bgcolor="<%=color%>" > 
                      <td width="130" height="25" class="T9L"><a  class="T9L" href="../controller/peticionTutAlumnoController.jsp?correo=<%=alumnoBean.getCorreo(i)%>&correoBuscar=<%=correo%>&profesor=<%=profesor%>&asignatura=<%=asignatura%>">&nbsp;<%=alumnoBean.getCorreo(i)%></font></a></td>
                      <td class="T9L">&nbsp;<%=alumnoBean.getNombre(i)%></font></td>
                    </tr>
                    <%}%>
                  </table>
                  <p class="T8L" align="center">Puedes obtener información de 
                    las tutoría asignadas al alumno haciendo click en su correo.</p>
                  <table>
                    <tr> 
                      <td width="163"></td>
                      <td width="91"></td>
                      <td width="220" align="right"><a href="../controller/imprimirAlumnosController.jsp" rel="gb_page[450,400]"><img src="../images/imprimirPDF.gif" border="0"/><span class="T10"><font color="#8c1229">Descargar 
                        en PDF</font></span></a></td>
                    </tr>
                  </table>
                  <p>&nbsp;</p>
            </tbody>
          </table> 
		  <%-- Incluimos el pie de pagina --%>		                                                                                      
          <jsp:include page="../view/pie.jsp"/>
</body></html>