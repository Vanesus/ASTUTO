<!- 
	T�tulo: 			ASTUTO. Aplicaci�n web para solicitar tutor�as online.
	Alumnas: 			Vanesa Gonz�lez P�rez, Ingenier�a T�cnica en Inform�tica de Gesti�n.
			 			Mar�a Josefa Aldea Palacios,Ingenier�a T�cnica en Inform�tica de Gesti�n.
	Director:			Dr. Jos� Ra�l Romero Salguero.
	Fecha creaci�n:		
	�ltima modificaci�n:
	Historial:
		v1.0 Inicial
->
<%-- Declaraci�n de los javaBeans usados en este fichero --%>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecuci�n de este fichero --%>
<%@ page import = "java.util.*" %>

<html><head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<%-- Ficheros necesarios para la generaci�n de pantallas GreyBox --%>
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
    <td class="T24" align="right"><font color="#ffffff">P&nbsp;e&nbsp;r&nbsp;f&nbsp;i&nbsp;l&nbsp; P&nbsp;�&nbsp;b&nbsp;l&nbsp;i&nbsp;c&nbsp;o&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="97%">
                      <tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
          <%--Datos del perfil p�blico del profesor--%>
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
                                        <td width="29%" height="27"  class="T12L"><font color="#8c1229">Localizaci�n:</font></td>
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