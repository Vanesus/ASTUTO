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
.boton{
        width:80px;
        height:25px;
		}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu del profesor --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">P&nbsp;e&nbsp;r&nbsp;f&nbsp;i&nbsp;l&nbsp; P&nbsp;ú&nbsp;b&nbsp;l&nbsp;i&nbsp;c&nbsp;o&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="97%">
                      <tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
          <%--Datos del perfil público del profesor--%>
		  <table width="485" border="0" align="center" cellpadding="4" cellspacing="0" style="width: 459px; height: 200px;">
                                      <tr> 
                                        <td width="29%" height="27"  class="T12L"><font color="#8c1229">Nombre:</font></td>
                                        <td width="71%"  height="27"  class="T10L"> 
                                          <%=profesorBean.getNombre()%></td>
                                      </tr>
                                      <tr> 
                                        <td width="29%" height="27"  class="T12L"><font color="#8c1229">Apellidos:</font></td>
                                        <td  height="27"  class="T10L"> <%=profesorBean.getApellidos()%></td>
                                      </tr>
                                      <tr> 
                                        <td width="29%" height="27"  class="T12L"><font color="#8c1229">Email:</font></td>
                                        <td  height="27"  class="T10L"> <%=profesorBean.getEmail()%></td>
                                      </tr>
                                      <tr> 
                                        <td width="29%" height="27"  class="T12L"><font color="#8c1229">Localización:</font></td>
                                        <td  height="27"  class="T10L"> <%=profesorBean.getLoc()%></td>
                                      </tr>
                                      <tr> 
                                        <td width="29%" height="44"  class="T12L"><font color="#8c1229">Informaci&oacute;n Adicional:</font></td>
                                        <td  height="33" rowspan="2"  class="T10L"><p><textarea name="textarea" disabled cols="40" rows="9" class="T10L"><%=profesorBean.getPerfPub()%></textarea>
                                          </p>                                        </td>
                                      </tr>
                                      <tr> 
                                        <td height="124" class="T10L">&nbsp;</td>
                                      </tr>
                                    </table>
									  <center>
                                      <form name="form1" id="form1" method="post" action="../view/verDatosPerfilProfesorView.jsp?idProfesor=<%=profesorBean.getId()%>&idUsuario=<%=loginBean.getId()%>">
                                        <a href="../view/verDatosPerfilProfesorView.jsp?idProfesor=<%=profesorBean.getId()%>&idUsuario=<%=loginBean.getId()%>" rel="gb_page[450,500]"><input type="submit" name="Submit" value="Editar" class="boton" /></a>
            
            </form>
                                     </center>
	<%-- Incluimos el pie de pagina --%>
    <jsp:include page="../view/pie.jsp"/>
</body></html>