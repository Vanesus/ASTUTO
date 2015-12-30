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
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>

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
        width:120px;
        height:25px;
		}
-->
</style>

</head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">A&nbsp;s&nbsp;i&nbsp;g&nbsp;n&nbsp;a&nbsp;t&nbsp;u&nbsp;r&nbsp;a&nbsp;s&nbsp; </font></td>
      </tr></tbody>
</table>
    </td>
    </tr>
    <tr valign="top">
        <td>
        <table border="0" cellpadding="4" cellspacing="0" width="100%">
            <tbody><tr valign="top">
            <td class="T10a"> 
            <table width="512" align="center" cellpadding="4" style="width: 459px; height: 200px;">
                <tbody><tr valign="top">
	                <td width="497"> 
					<table style="MARGIN-LEFT: 10pt" border="0"> <tbody>
                        <tr> 
                            <td><font class="T14V" color="#8c1233">Asignaturas</font></td>
                        </tr>
                    </tbody></table>
                    
                  <table border="0">
                    <tbody>
                        <tr> 
                            
                        <td height="24"><img src="../images/encabezado_w2a.gif" width="475" height="12" /></td>
                        </tr>
                    </tbody></table>
                    <table  width="490" align="center" >
                        <tr valign="top" border=0 > 
                            <td width="150" height="23" class="T10" border=0><strong><font color="#8c1229">Nombre</font></strong></td>
                            <td colspan="2" class="T10" border="0"><strong><font color="#8c1229">Titulación</a></font></strong></td>
                            <td colspan="2" class="T10" border="0"><strong><font color="#8c1229">Curso</a></font></strong></td>
                            <td colspan="2" class="T10" border="0"><strong><font color="#8c1229">Opciones</a></font></strong></td>
                        </tr>
						<%--Lista de asignaturas registradas--%>
                        <%String color ="#FFFDE5";%>
                        <% for (int i=0; i<asignaturaBean.getContador(); i++) {
						    if(i%2==0) color="#FFE0B1";
							else color ="#FFF5E4";%>
                        <tr  bgcolor="<%=color%>" valign="middle"> 
                            <td width="150" height="25" class="T9L"><a class="T9L" href="../controller/asignaturaController.jsp?idAsignatura=<%=asignaturaBean.getId(i)%>&nombre=<%=asignaturaBean.getNombre(i)%>">&nbsp;<%=asignaturaBean.getNombre(i)%></font></a></td>
                            <td colspan="2" class="T9L"><font color="#8c1229">&nbsp;<%=asignaturaBean.getTitulacion(i)%></font></td>
                            <td colspan="2" class="T9L"><font color="#8c1229">&nbsp;<%=asignaturaBean.getCurso(i)%></font></td>
							<%--Botones de opción--%>
                            <td width="29" class="T9L" align="center"><font color="#8c1229"><a href="../controller/mantenimientoAsigController.jsp?idAsignatura=<%=asignaturaBean.getId(i)%>&opcion=editar" rel="gb_page[450,400]"><img src="../images/edit.gif" width="20" height="21" border="0" title="Editar" /></a></font></td>
                            <td width="29" class="T9L" align="center"><font color="#8c1229"><a href="../controller/mantenimientoAsigController.jsp?idAsignatura=<%=asignaturaBean.getId(i)%>&opcion=borrar" rel="gb_page[450,400]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
                        </tr>
                         <%}%>
                    </table>
                    
                  <p class="T8L" >Puedes obtener informaci&oacute;n de los profesores 
                    asociado a cada asignatura haciendo click en su nombre.</p>
                    <center>
                    <p class="T8L" ></p>
                    <table>
                        <tr> 
                            <td width="163"></td>
                            <td width="91"><form method="post" action="../controller/mantenimientoAsigController.jsp">
                                              <a href="../controller/mantenimientoAsigController.jsp" rel="gb_page[450,400]"><input type="submit" name="Submit" value="Crear Nuevo" class="boton"></a>
                                            </form>
                            </td>
                            
                        <td width="220" align="right"><a href="../controller/imprimirAsigController.jsp" rel="gb_page[450,400]"><img src="../images/imprimirPDF.gif" border="0"/><span class="T10"><font color="#8c1229">Descargar 
                          en PDF</font></span></a></td>
                        </tr>
                    </table>
                    </center>
                   <p>&nbsp;</p>
           </tbody></table>
    <%-- Incluimos el pie de pagina --%>		                                                                                      
    <jsp:include page="../view/pie.jsp"/>
</body></html>