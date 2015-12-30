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
-->
</style>
</head>

<body topmargin="2" leftmargin="2" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
       
  <p class="T30 Estilo2 Estilo3"><strong> Profesor</strong></p>
  <%--mensaje--%>
  <p><span class="T9L"><%String mensaje = messageBean.getMsg();%><%=mensaje%></span></p>
	
  <p> 
  <%--Datos extraidos--%>
    <%String idProfesor =request.getParameter("idProfesor");%>
    <%String opcion =request.getParameter("opcion");
	String boton="Guardar";%>
    <%if(idProfesor==null)
	{%>
  <form action="../controller/mantenimientoProfesorController.jsp?opcion=<%=opcion%>" name="loginform"  method="post" >
	<%--Formulario con los datos del perfil publico del profesor--%> 
  <table align="center">
    <tr> 
    	  
      <td width="92" height="31" align="left"><span class="T10L">Nombre*:</span></td>
         <td width="230"><input name="nombre" type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="25" maxlength="100"></td>
	   </tr>
	   <tr>
          
      <td height="31" align="left"><span class="T10L">Apellidos*:</span></td>
          <td><input name="apellidos" type="text" class="CampoTexto" id="apellidos" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="25" maxlength="100" /></td>
	   </tr>
	   <tr>
          <td height="31" align="left"><span class="T10L">Email:</span></td>
          <td><input name="email" type="text" class="CampoTexto" id="email" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="25" maxlength="100" /></td>
	   </tr>
	   <tr>
	   	  <td height="31" align="left"><span class="T10L">Localizaci&oacute;n:</span> </td>
          <td><input name="localizacion" type="text" class="CampoTexto" id="localizacion" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="25" maxlength="100" /></td>
	   </tr>
	   <tr>
	      <td height="27" align="left"><span class="T10L">Informaci&oacute;n Adicional : </span></td>
          <td rowspan="2" align="left"><textarea name="perfilPublico" cols="40" rows="10" class="CampoTexto" id="perfilPublico" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" ></textarea></td>
	   </tr>
	   <tr>
	     <td height="15" align="left">&nbsp;</td>
    </tr>
	</table>
	  
             
  <p align="center" class="T8L" >(*) Datos Obligatorios</p>
  <div align="center">
                  <p>
                    <input type="submit" value="<%=boton%>" class="boton" > 
					 <%if (boton!="Salir")
  			{%>
  				<input name="submit2" onClick="document.salir.action='../controller/usuarioController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" />
  			<%}%>
    </p>
  </div></td></tr>
		     
	<%}%>
    <%if(idProfesor!=null)
	 {%>
	   <%boton="Borrar";
	   String disabled="disabled";
	   if (opcion.equals("editar"))
	   {
	     boton ="Cambiar";
		 disabled=null;
	   }
       if (mensaje.equals("Usuario y Profesor Borrado")||mensaje.equals("Profesor Modificado"))
	   {
		boton ="Salir";%>
		<form action="../controller/usuarioController.jsp" name="loginform" target="_top" method="post" >
      <%}
	   else
	   {%>
		     <form action="../controller/mantenimientoProfesorController.jsp?idProfesor=<%=idProfesor%>&opcion=<%=opcion%>&disabled=<%=disabled%>" name="loginform"  method="post" >
	 
    <table width="376" align="center">
      <tr> 
    	    
        <td width="89" height="31" align="left"><span class="T10L">Nombre*:</span></td>
           <td width="275"><input name="nombre" type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getNombre()%>" size="35" maxlength="20" <%=disabled%>></td>
	  </tr>
		 <tr>
            
        <td height="31" align="left"><span class="T10L">Apellidos*:</span></td>
            <td><input name="apellidos" type="text" class="CampoTexto" id="apellidos" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getApellidos()%>" size="35" maxlength="30" <%=disabled%>></td>
		</tr>
		<tr>
		    <td height="31" align="left"><span class="T10L">Email:</span></td>
            <td><input name="email" type="text" class="CampoTexto" id="email" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getEmail()%>" size="35" maxlength="20" <%=disabled%>></td>
		</tr>
		<tr>
            <td height="31" align="left"><span class="T10L">Localizaci&oacute;n:</span> </td>
            <td><input name="localizacion" type="text" class="CampoTexto" id="localizacion" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=profesorBean.getLoc()%>" size="35" maxlength="30" <%=disabled%>></td>
		</tr>
		<tr>
		    <td height="34" align="left"><span class="T10L">Informaci&oacute;n Adicional:</span></td>
            <td rowspan="2" align="left"><textarea name="perfilPublico" cols="40" rows="9" class="CampoTexto" id="perfilPublico" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" <%=disabled%> ><%=profesorBean.getPerfPub()%></textarea></td>
        </tr>
		<tr>
		  <td align="left">&nbsp;</td>
	  </tr>
	</table>
	
        <p align="center" class="T8L" >(*) Datos Obligatorios</p>
		<%}%>
  <div align="center"> 
          <p>
            <input name="submit" type="submit" value="<%=boton%>" class="boton" />
			 <%if (boton!="Salir")
  			{%>
  				<input name="submit2" onClick="document.salir.action='../controller/usuarioController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton" />
  			<%}%>
      </p>
        </div>
	</form>
  <%}%></form>
  <%if (boton!="Salir")
  {%>
  <form name="salir" method="post" action="../controller/usuarioController.jsp" target="_top">
  </form>
  <%}%>
</center>
</body>
</html>