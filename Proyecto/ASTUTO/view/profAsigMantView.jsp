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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>

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
        width:140px;
        height:25px;
		}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
   <td class="T24" align="right"><font color="#ffffff">P&nbsp;r&nbsp;o&nbsp;f&nbsp;e&nbsp;s&nbsp;o&nbsp;r&nbsp;/&nbsp;e&nbsp;s&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" width="100%"><tbody><tr valign="top">
                          <td height="359"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a">                     
									  <%--Extraigo el identificador de la asignatura y el nombre de la asignatura--%>                 
                                      <%String idAsignatura= request.getParameter("idAsignatura");%>
                                      <%String nombre= request.getParameter("nombre");%>
									<table style="MARGIN-LEFT: 10pt" border="0">     <tbody>
                                        <tr> 
                                          <td><font class="T14V" color="#8c1233">Asignatura:</font><font class="T12V" color="#8c1233">&nbsp;<%=nombre%></font></td>
                                        </tr>
                                      </tbody>   </table>                         
          <table border="0">
            <tbody>
                                        <tr>                  
                <td height="26"><img src="../images/encabezado_w2a.gif" width="475" height="12" alt="Volver atrás" /><a href="../controller/asignaturaController.jsp" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                        </tr>
                                      </tbody>   </table>
                                    <table  width="402" align="center" >
                                      <tr valign="top"> 
                                        <td width="119" height="23" class="T10"> 
                                          <strong><font color="#8c1229">Nombre</font></strong></td>
                                        <td colspan="2" class="T10"> <strong><font color="#8c1229">Apellidos</a></font></strong></td>
                                        <td colspan="2" class="T10"> <strong><font color="#8c1229">Opci&oacute;n</a></font></strong></td>
                                      </tr>
                                      <%String color ="#FFFDE5";%>
									  <%--Lista de profesores asociados a la asignatura selecciona--%>
                                      <% for (int i=0; i<profBean.getContador(); i++)
									  {
                                      if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
                                      <tr valign="middle" bgcolor="<%=color%>"> 
                                        <td width="119" height="25" class="T9L"> 
                                          &nbsp;<%=profBean.getNombre(i)%></a></font></td>
                                        <td colspan="2" class="T9L"> &nbsp;<%=profBean.getApellidos(i)%></font></td>
                                        <%String valor="editar";%>
										<%--Boton de opcion--%>
                                        <td width="47" class="T9L" align="center"><a href="../controller/mantenimientoProfAsigController.jsp?idProfesor=<%=profBean.getId(i)%>&opcion=<%="borrar"%>&idAsignatura=<%=idAsignatura%>&nombreAsig=<%=nombre%>" rel="gb_page[450,400]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
                                      </tr>
                                      <%}%>
                                    </table>
                                    <p>&nbsp;</p>
                                    <center>
                                      <form name="form1" method="post" action="../controller/mantenimientoProfAsigController.jsp?idAsignatura=<%=idAsignatura%>&nombreAsig=<%=nombre%>">
                                        <a href="../controller/mantenimientoProfAsigController.jsp?idAsignatura=<%=idAsignatura%>&nombreAsig=<%=nombre%>" rel="gb_page[450,400]"><input type="submit" name="Submit" value="Añadir Profesor" class="boton"></a>
                                      </form>
                                    </center>                                                                                 
    <%-- Incluimos el pie de pagina --%>		                                                                                             
    <jsp:include page="../view/pie.jsp"/>
</body></html>