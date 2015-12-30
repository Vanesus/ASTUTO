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
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>

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
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
   <td class="T24" align="right"><font color="#ffffff">P&nbsp;r o&nbsp;f&nbsp;e&nbsp;s&nbsp;o&nbsp;r&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
 
                       <table style="MARGIN-LEFT: 10pt" border="0">       <tbody>
                                <tr> 
                                   <td width="82"><font class="T14V" color="#8c1233">Login:</font><font class="T12V" color="#8c1233">&nbsp;<%=loginBean.getLogin()%></font></td>
                                 </tr>
                         </tbody></table>
                  
                       <table border="0"> <tbody>
                                 <tr> 
                                    
                <td height="26"><img src="../images/encabezado_w2a.gif" width="475" height="12" /><a href="../controller/usuarioController.jsp" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                  </tr>
                       </tbody> </table>
                                     
                      <table  width="480" height="56"  align="center">
                                      <tr valign="top"> 
                                        <td width="76" height="23" class="T10"align="left"><strong><font color="#8c1229">Nombre</font></strong></td>
                                        <td colspan="2" class="T10" align="left"><strong><font color="#8c1229">Apellidos</font></strong></td>
                                        <td colspan="2" class="T10" align="left"><strong><font color="#8c1229">Email</font></strong></td>
                                        <td colspan="2" class="T10" align="left"><strong><font color="#8c1229">Localizaci&oacute;n</font></strong></td>
                                        <td colspan="2" class="T10" align="left"><strong><font color="#8c1229">Opciones</a></font></strong></td>
                                      </tr>
                                      <%String color ="#FFE0B1";%>
                                      <tr valign="middle" bgcolor="<%=color%>"> 
									  <%--Datos del usurio si es profesor seleccionado--%>
                                        <td width="76" height="25" class="T9L"> &nbsp;<%=profesorBean.getNombre()%></a></font></td>
                                        <td colspan="2" class="T9L">&nbsp;<%=profesorBean.getApellidos()%></font></td>
                                        <td colspan="2" class="T9L">&nbsp;<%=profesorBean.getEmail()%></font></td>
                                        <td colspan="2" class="T9L">&nbsp;<%=profesorBean.getLoc()%></font> 
                                        </td>
										<%--botones de opciones--%>
                                        <td width="28" class="T10" align="center"><font color="#8c1229"><a href="../controller/mantenimientoProfesorController.jsp?idProfesor=<%=profesorBean.getId()%>&opcion=<%="editar"%>" rel="gb_page[500,500]"><img src="../images/edit.gif" width="20" height="21" border="0"  title="Editar"/></a></font></td>
                                        <td width="30" class="T10" align="center"><font color="#8c1229"><a href="../controller/mantenimientoProfesorController.jsp?idProfesor=<%=profesorBean.getId()%>&opcion=<%="borrar"%>" rel="gb_page[500,500]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
                                      </tr>
                                    </table>
                                    <p>&nbsp;</p>
          <%-- Incluimos el pie de pagina --%>
          <jsp:include page="../view/pie.jsp"/>
</body></html>