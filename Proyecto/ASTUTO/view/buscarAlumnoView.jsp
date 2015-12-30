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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

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
                            B&nbsp;u&nbsp;s&nbsp;c&nbsp;a&nbsp;r&nbsp; A&nbsp;l&nbsp;u&nbsp;m&nbsp;n&nbsp;o&nbsp;s&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
	   <td>
		  <table border="0" cellpadding="4" cellspacing="0" width="100%">
          <tbody><tr valign="top">
			<td class="T10a"> 
                <table border="0" cellpadding="4" cellspacing="0" width="88%">
            <tbody>
                    <tr valign="top"> 
                        <td colspan="3"><img src="../images/p.gif" width="15" height="1" /></td>
                    </tr>
                    <tr> 
                        <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Búsqueda</font></td>
                        <td width="7%"> </td>
                    </tr>
                    <tr> 
                        <td colspan="3"><img src="../images/encabezado_w2a.gif" width="500" height="13" /></td>
                    </tr>
                    <tr> 
                        <td class="T10" align="left"  width="5%"> </td>
                        <td class="T10" align="left" bgcolor="#d69e00" width="84%"><b><font color="#ffffff">Selección de criterios </font></b></td>
                        <td class="T10" align="left"  width="4%"> </td>
                    </tr>
                    <tr> 
                        <td colspan="3" class="T10a"> <form action="../controller/listadoAlumnosController.jsp" method="post">
                         <table width="467" align="center">
                            <tr> 
                                <td align="left" class="T10L"><font color="8c1229">Correo:</font></td>
                                <td><input name="correo" type="text" class="CampoTexto" id="correo" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="30" maxlength="20" /></td>
                            </tr>
                            <tr> 
                                <td width="84" height="24" align="left"class="T10L"><font color="8c1229">Profesor:</font></td>
                                <td width="261"><input name="profesor" type="text" class="CampoTexto" id="profesor" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="30" maxlength="100" /></td>
                            </tr>
                            <tr> 
                                <td height="24" align="left"class="T10L"><font color="8c1229">Asignatura:</font></td>
                                <td><input name="asignatura" type="text" class="CampoTexto" id="asignatura" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="30" maxlength="100" /></td>
                            </tr>
                         </table>
                        <p> 
                        <center>
						<%--mensaje--%>
                            &nbsp; <span class="T9L"> <%=messageBean.getMsg() %></span> 
                        </center>
                        </p>
                        <center>
                            <input name="submit"  type="submit" class="boton" value="Buscar", />
                        </center>
                     </form>
                </td>
                <td><img src="../images/p.gif" width="10" height="1" /></td>
            </tr>
            <tr> 
                <td colspan="3">&nbsp;</td>
            </tr>
        </tbody></table> 
	<%-- Incluimos el pie de pagina --%>		                                                                                      
	<jsp:include page="../view/pie.jsp"/>
</body></html>