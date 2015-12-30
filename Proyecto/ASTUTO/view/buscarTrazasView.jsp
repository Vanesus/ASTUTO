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
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%">
  <tbody><tr>
                          <td class="T24" align="right"><font color="#ffffff"> 
                            V&nbsp;e&nbsp;r&nbsp; T&nbsp;r&nbsp;a&nbsp;z&nbsp;a&nbsp;s&nbsp; 
                            A&nbsp;l&nbsp;u&nbsp;m&nbsp;n&nbsp;o&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td><table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
            
        <td class="T10a"> 
		  <%--Extraigo el login--%>
          <%String login = request.getParameter("login");%>
          <table width="95%" border="0" cellpadding="4" cellspacing="0">
            <tbody>
              <tr> 
                <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Búsqueda</font></td>
              </tr>
              <tr> 
                <td colspan="3"><img src="../images/encabezado_w2a.gif" width="479" height="10" /></td>
              </tr>
              <tr> 
                <td class="T10" align="left"  width="5%"> </td>
                <td class="T10" align="left" bgcolor="#d69e00" width="85%"><b><font color="#ffffff">Criterio 
                  de b&uacute;squeda</font></b></td>
                <td class="T10" align="left"  width="7%"> </td>
              </tr>
            </tbody>
          </table> 
          <div align="center"></div>
		  <%--Función para validar el correo--%>
			<script>
			function validarEmail(valor) {
			if (/^[a-z][0-9][0-9][a-z][a-z][a-z][a-z][a-z]@uco.es$/.test(form.correo.value)){
			return (true)
			} else {
			alert("La dirección de email es incorrecta. El formato debe ser a11aaaaa@uco.es");
			return (false);}
			}
			</script>
            <form name="form" onSubmit="return validarEmail(this);"  method="post" action="../controller/trazasController.jsp">
            <table width="454" align="center">
              <tr> 
                <td width="200" height="24" align="left"class="T10L"><font color="8c1229">Correo 
                  (a11aaaaa@uco.es): </font></td>
                <td width="229"><input name="correo" type="text" id="correo" size="15" maxlength="20" /></td>
              </tr>
            </table>
			<%--mensaje--%>
              <p>&nbsp;</p><p align="center" class="T9L"><%=messageBean.getMsg()%> </p>
              <p align="center"> <input name="submit" type="submit" class="boton" value="Buscar" />  </p>
              <p>&nbsp; </p>
            </form>
<%-- Incluimos el pie de pagina --%>		                                                                                      					
<jsp:include page="../view/pie.jsp"/>
</body></html>