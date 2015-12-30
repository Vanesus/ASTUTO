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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>

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
.Estilo2 {color: #8C1233}
.Estilo3 {font-size: 18pt}
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
       
  <p class="T30 Estilo2 Estilo3"><strong> Profesor</strong></p>
  <p class="T9L">
  <%--mensaje--%>
  <%String mensaje = messageBean.getMsg();%><%=mensaje%></p>
  <%String boton ="Cambiar";
  if (mensaje=="Perfil Modificado")  {
   boton ="Salir";%>
  <%}  else  {%>
  <form name="form"  method="post" >
  <%--Datos del perfil publico del profesor--%>
    <table>
      <tr> 
        <td width="90" height="31" align="left"><font color="8c1229"><span class="T10L">Nombre:</span></font></td>
        <td width="317"> <div align="left"> 
            <input name="nombre"  type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getNombre()%>" size="45" maxlength="100">
          </div></td>
      </tr>
      <tr> 
        <td height="31" align="left"><font color="8c1229"><span class="T10L">Apellidos:</span></font></td>
        <td> <div align="left"> 
            <input name="apellidos"  type="text" class="CampoTexto" id="apellidos" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getApellidos()%>" size="45" maxlength="100">
          </div></td>
      </tr>
      <tr> 
        <td height="31" align="left"><font color="8c1229"><span class="T10L">Email:</span></font></td>
        <td> <div align="left"> 
            <input name="email"  type="text" class="CampoTexto" id="email" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getEmail()%>" size="45" maxlength="100">
          </div></td>
      </tr>
      <tr> 
        <td height="31" align="left"><font color="8c1229" class="T10L">Localizaci&oacute;n: </font></td>
        <td> <div align="left"> 
            <input name="localizacion"  type="text" class="CampoTexto" id="localizacion" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getLoc()%>" size="45" maxlength="100">
          </div></td>
      </tr>
      <tr> 
        <td height="21" align="left" valign="middle"><font color="8c1229"><span class="T10L">Informaci&oacute;n Adicional :</span></font></td>
        <td rowspan="2" align="left"><div align="left"> 
            <textarea name="perfilPublico"  cols="40" rows="10" class="CampoTexto" id="perfilPublico" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" ><%=profesorBean.getPerfPub()%></textarea>
          </div></td>
      </tr>
      <tr> 
        <td height="81" align="left">&nbsp;</td>
      </tr>
    </table>
	 <p>&nbsp;</p>
          <table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/perfilPublicoProfesorController.jsp?idProfesor=<%=profesorBean.getId()%>&idUsuario=<%=loginBean.getId()%>'; document.form.submit()"; type="button" value="Cambiar" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/perfilPublicoProfesorController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
	<%}%>
  <%if (boton=="Salir")
  {%>
  <form method="post" action="../controller/perfilPublicoProfesorController.jsp" target="_top">
    <input name="submit2" type="submit" value="Salir" class="boton1" />
  </form>
  <%}%>
</center>
</body>
</html>