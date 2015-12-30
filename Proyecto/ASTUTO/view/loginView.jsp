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
</style></head>
<body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>

<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
      <td class="T24" align="right"><font color="#ffffff"> I&nbsp;d&nbsp;e&nbsp;n&nbsp;t&nbsp;i&nbsp;f&nbsp;i&nbsp;c&nbsp;a&nbsp;r&nbsp;s&nbsp;e&nbsp; 
        </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
          <table border="0" align="center" cellpadding="4" cellspacing="0">
            <tbody>
                            <tr valign="top">
                              <td><center>
                                        
                    <p class="T10L">&nbsp;</p>
					<p class="T10L">&nbsp;</p>
                                        <form action="../controller/loginController.jsp"  target="_top"  method="post"  >
                                          <table width="171" height="31"  bordercolor="#8c1229" border="2"  >
                                            <tr border="0"> 
                                              <td bordercolor="#FFFFFF" width="160" class="T10L" height="26" align="center"><strong><font size="3">Iniciar Sesi&oacute;n</font></strong></td>
                                            </tr>
                                          </table>
                                            <table width="277" height="140"  bordercolor="#8c1229" border="2"  >
                                              <tr border="0"> 
                                                <td width="285" height="132" bordercolor="#FFFFFF" class="T10L"> 
                                                  <table width="208" align="center">
                              <tr> 
                                <td width="93" height="35" align="left" class="T12V Estilo2"><font color="#000000">Login: 
                                  </font></td>
                                <td width="103"><input name="login" type="text" class="CampoTexto" size="12" maxlength="10"/></td>
                              </tr>
                              <tr> 
                                <td height="35" class="T12V Estilo2"><font color="#000000">Password: 
                                  </font></td>
                                <td> <input name="contrasena" type="password" class="CampoTexto"size="12" maxlength="8"/></td>
                              </tr>
                            </table>
                            
                              <%--menaje--%>
                            <p class="T9" align="center"><%=messageBean.getMsg() %></p>
                                        <blockquote> 
                                                    <p align="center"> 
                                                      <input type="submit" value="Aceptar" class="boton" >
                                                    </p>
                                                  </blockquote></td>
                                              </tr>
                                            </table>
                                        </form>
                                      </center>
									  </td></tr>
                                   </tbody> </table>
  <%-- Incluimos el pie de pagina --%>		                                                
  <jsp:include page="../view/pie.jsp"/>
</body></html>