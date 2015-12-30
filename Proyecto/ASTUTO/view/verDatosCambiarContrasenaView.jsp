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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>

<head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/corp2.jpg);
}
.Estilo2 {
	color: #8C1233;
	font-size: 18pt;
}
.boton{
        width:80px;
        height:25px;
		}
.boton1{
        width:60px;
        height:25px;
       }
-->
</style>
</head>
<body topmargin="2" leftmargin="2" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
       
  <p class="T30 Estilo2"><strong> Cambiar Contrase&ntilde;a</strong></p>
  <p></p> 
  	   <%--mensaje--%>
       <p><span class="T9L"><%String mensaje = messageBean.getMsg();%><%=mensaje%></span></p>
	   <%String opcion = request.getParameter("opcion");%>
	<%if (opcion.equals ("salir"))
	{%>
	     <form method="post" action="../controller/principalProfesorController.jsp" target="_top">
    	<input name="submit" type="submit" value="Salir" class="boton1"  >
  		</form>
	<%}	else	{%>
	<%--Formulario con los datos del login y la contraseña para modificar la contraseña--%>
		 <form name="form"  method="post" >		 
    <table width="229">
      <tr> 
        <td width="97" height="31" align="left"><span class="T10L">Login:</span></td>
        <td width="120"><input name="login" disabled type="text" class="CampoTexto" id="login" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" value="<%=loginBean.getLogin()%>"></td>
      </tr>
      <tr> 
        <td height="30" align="left"><span class="T10L">Contrase&ntilde;a:</span></td>
        <td><input name="contrasena" type="password" onfocus="" class="CampoTexto" id="contrasena" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=loginBean.getContrasena()%>" size="20" maxlength="8"  /></td>
      </tr>
      <tr> 
        <td height="31" align="left"><span class="T10L">Confirmar Contrase&ntilde;a:</span></td>
        <td><input name="confirmar" type="password" onfocus="" class="CampoTexto" id="confirmar" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=loginBean.getContrasena()%>" size="20" maxlength="8" ></td>
      </tr>
    </table>
	 <p>&nbsp;</p> 
	<table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/perfilPublicoProfesorController.jsp?idUsuario=<%=loginBean.getId()%>&opcion=contrasena'; document.form.submit()"; type="button" value="Cambiar" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/principalProfesorController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
<%}%>
</center>
</body>
</html>
