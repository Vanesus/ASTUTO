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
       
  <p class="T30 Estilo2"><strong> Usuario</strong></p>
  <p></p> 
       <%--mensaje--%>
       <p><span class="T9L"><%String mensaje = messageBean.getMsg();%><%=mensaje%></span></p>
	    <%--Extraigo el identificar del usuario y la opcion--%>
	     <%String idUsuario =request.getParameter("idUsuario");%>
	       <%String opcion =request.getParameter("opcion");
		   String boton="Guardar";%>
	  <%--Opcion nuevo usuario--%>
	  <%if(idUsuario==null)  {
	  String disabled=null;
      if (mensaje.equals("Usuario Guardado")) {
		 boton ="Salir";%>
      <%}  else	  {%>
	   <form name="form" method="post" >
    <table width="232">
      <tr> 
        <td width="100" height="31" align="left" class="T10L">Login:</td>
        <td width="120"><input name="login" type="text" class="CampoTexto" id="login" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="10"></td>
      </tr>
      <tr> 
        <td height="31" align="left" class="T10L">Contrase&ntilde;a:</td>
        <td><input name="contrasena" type="password" class="CampoTexto" id="contrasena" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="8" /></td>
      </tr>
      <tr> 
        <td height="31" align="left" class="T10L">Confirmar Contrase&ntilde;a:</td>
        <td><input name="confirmar" type="password" class="CampoTexto" id="confirmar" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="8" /></td>
      </tr>
      <tr> 
        <td headers="31" align="left" class="T10L">Rol:</td>
        <td align="left"> <select name="rol" id="rol">
            <option  value="1">Administrador</option>
            <option  value="2">Profesor</option>
          </select></td>
      </tr>
    </table>
       
	   <p>&nbsp;</p>
          <table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/mantenimientoUsuarioController.jsp?disabled=<%=disabled%>'; document.form.submit()"; type="button" value="Guardar" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/usuarioController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
	<%}%>
	<%}%>
	<%--Opción editar o borrar--%>
	<%if(idUsuario!=null) {%>
	   <%boton="Borrar";
	   String disabled="disabled";
	   if (opcion.equals("editar"))	   {
	     boton ="Cambiar";
		 disabled=null;
	   }
	   if (mensaje.equals("Usuario Borrado") || mensaje.equals("Contraseña Cambiada") || mensaje.equals("No se puede eliminar administrador ya que es el único de la aplicación"))   {
		 boton ="Salir";%>
       <%}   else   {%>
		 <form name="form"  method="post" > 
    <table width="229">
      <tr> 
        <td width="97" height="31" align="left"><span class="T10L">Login:</span></td>
        <td width="120"><input name="login" disabled type="text" class="CampoTexto" id="login" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" value="<%=loginBean.getLogin()%>"></td>
      </tr>
      <tr> 
        <td height="30" align="left"><span class="T10L">Contrase&ntilde;a:</span></td>
        <td><input name="contrasena" type="password" onfocus="" class="CampoTexto" id="contrasena" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=loginBean.getContrasena()%>" size="20" maxlength="8" <%=disabled%> /></td>
      </tr>
	  <%--Editar contraseña--%>
	  <%if (opcion.equals("editar"))
	  {%>
      <tr> 
        <td height="31" align="left"><span class="T10L">Confirmar Contrase&ntilde;a:</span></td>
        <td><input name="confirmar" type="password" onfocus="" class="CampoTexto" id="confirmar" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=loginBean.getContrasena()%>" size="20" maxlength="8" <%=disabled%>></td>
      </tr>
	  <%}%>
      <tr> 
        <td height="31" align="left"><span class="T10L">Rol:</span></td>
        <%String rol;%>
        <%if (loginBean.getRol()==1)		 {
		    rol="Administrador";
		}	else	 {
		   rol="Profesor";
		 }%>
        <td><input name="rol" disabled type="text" class="CampoTexto" id="rol" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" value="<%=rol%>"></td>
      </tr>
    </table>
              <p>&nbsp;</p>
          <table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/mantenimientoUsuarioController.jsp?idUsuario=<%=idUsuario%>&opcion=<%=opcion%>&disabled=<%=disabled%>'; document.form.submit()"; type="button" value="<%=boton%>" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/usuarioController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
	  <%}%>	
  <%}%>
  <%if (boton=="Salir")
  {%>
  <form method="post" action="../controller/usuarioController.jsp" target="_top">
    <input name="submit" type="submit" value="Salir" class="boton1"  >
  </form>
  <%}%>
</center>
</body>
</html>