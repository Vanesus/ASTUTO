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
<jsp:useBean id="usuarioBean" class="uco.interfaz.UsuarioBean" scope="session"/>

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
        width:100px;
        height:25px;
		}

-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
  <td class="T24" align="right"><font color="#ffffff"> U&nbsp;s&nbsp;u&nbsp;a&nbsp;r&nbsp;i&nbsp;o&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
                          <td height="359"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
 
                                    <table style="MARGIN-LEFT: 10pt" border="0"> <tbody>
                                        <tr> 
                                          <td><font class="T14V" color="#8c1233">Usuarios</font></td>
                                        </tr>
                                      </tbody> </table>
                                    <table border="0"><tbody>
                                        <tr> 
                                          <td width="493" height="25"><img src="../images/encabezado_w2a.gif" width="475" height="12"  /></td>
                                        </tr>
                                      </tbody> </table>
                                    <table  width="367" height="56"  align="center"	>
                                      <tr valign="top"> 
                                        <td width="134" height="23" class="T10"> 
                                          <strong><font color="#8c1229">Login</font></strong></td>
                                        <td colspan="2" class="T10"> <strong><font color="#8c1229">Rol</a></font></strong></td>
                                        <td colspan="2" class="T10"> <strong><font color="#8c1229">Opciones</a></font></strong></td>
                                      </tr>
                                      <%String color ="#FFFDE5";%>
									  <%--Lista de usuarios registrados--%>
                                      <% for (int i=0; i<usuarioBean.getContador(); i++) {
									  if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
                                      <tr valign="middle" bgcolor="<%=color%>"> 
                                        <td width="134" height="25" class="T9L"> 
                                          <%String rol="Administrador";
                                          if(usuarioBean.getRol(i)==2){%>
                                          <a  class="T9L" href="../controller/usuarioController.jsp?idUsuario=<%=usuarioBean.getid(i)%>" > 
                                          <% rol="Profesor";  }%>
                                          &nbsp;<%=usuarioBean.getLogin(i)%></font></a></td>
                                        <td colspan="2" class="T9L"> &nbsp;<%=rol%></font></td>
										<%--Botones de opciones--%>
                                        <td width="34" class="T9L" align="center"><a href="../controller/mantenimientoUsuarioController.jsp?idUsuario=<%=usuarioBean.getid(i)%>&opcion=editar" rel="gb_page[450,400]"><img src="../images/llave%20(3).gif" width="34" height="17" border="0" title="Cambiar Contraseña" /></a></font></td>
                                        <td width="25" class="T9L" align="center"><a href="../controller/mantenimientoUsuarioController.jsp?idUsuario=<%=usuarioBean.getid(i)%>&opcion=borrar" rel="gb_page[450,400]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
                                      </tr>
                                      <%}%>
                                    </table>
                                    
          <p align="center" class="T8L" >Puedes conocer los datos asociado a cada 
            usuario (profesor) haciendo click en su login.</p>
                                    <center>
                                      <table>
                                        <tr> 
                                          <td width="163"></td>
                                          <td width="91"><form name="form1" id="form1" method="post" action="../controller/mantenimientoUsuarioController.jsp">
                                              <a href="../controller/mantenimientoUsuarioController.jsp" rel="gb_page[450,400]"><input type="submit" name="Submit" value="Crear Nuevo" class="boton" /></a>
                                            </form>
                                            </td>
                                          <td width="220" align="right"><a href="../controller/imprimirUsuariosController.jsp" rel="gb_page[450,400]" > 
                                            <img src="../images/imprimirPDF.gif" border="0"/><span class="T10"><font color="#8c1229">Descargar 
                                            en PDF</font></span></a></td>
                                        </tr>
                                      </table>
                                    </center>
 <%-- Incluimos el pie de pagina --%>		                                                                                      
 <jsp:include page="../view/pie.jsp"/>
</body></html>