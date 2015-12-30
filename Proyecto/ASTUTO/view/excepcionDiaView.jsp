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
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="excepcionBean" class="uco.interfaz.ExcepcionBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecuci�n de este fichero --%>
<%@ page import = "java.util.*" %>

<html>
<head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<style type="text/css">
<!--
body {	background-image: url(../images/corp2.jpg);}
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
<body topmargin="2" leftmargin="4" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
  <%--Dia de la excepci�n--%>
  <p class="T30 Estilo2 Estilo3"><strong> Excepci�n D�a: <%=excepcionBean.getDia()%> / <%=excepcionBean.getMes()%> / <%=excepcionBean.getAnyo()%></strong></p>
  <p class="T10L"><%=messageBean.getMsg()%></p>
  <%--Dato extraido del formulario--%>
   <%String opcion = request.getParameter("opcion");
	if(opcion.equals("salir")){%>
	  <form action="../controller/tutoriaDiaController.jsp?dia=<%=excepcionBean.getDia()%>&mes=<%=excepcionBean.getMes()%>&anyo=<%=excepcionBean.getAnyo()%>" method="post" target="_top">
	      
          <input type="submit" class="boton" value="Salir" >
	  </form>
	<%}else if(opcion.equals("hora")){%> <%--Tipo de excepci�n cambio de horario de tutor�a--%>
	<form name="form" method="post" target="_self">    
    <table width="316" class="T10L">
      <tr> 
        <td width="130">Hora Inicio: </td>
        <td width="174"><input name="horaI" size="2" maxlength="2">
          <input name="minutosI" size="2" maxlength="2"> 
		  
      </tr>
      <tr> 
        <td>Hora Fin: </td>
        <td><input name="horaF" size="2" maxlength="2">
          <input name="minutosF" size="2" maxlength="2" >
		  
     </tr>
      <tr> 
        <td>Slot: </td>
        <td><input name="slot" type="text" size="5" maxlength="2">
          min </td>
      </tr>
      <tr> 
        <td>Metodo Asignaci&oacute;n:</td>
        <td><select name="asignacion">
            <option value="1">Al inicio</option>
            <option value="2">Al final</option>
          </select> </td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td>&nbsp; </td>
      </tr>
    </table>
          <table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/excepcionDiaController.jsp?tipo=2'; document.form.submit()"; type="button" value="Aceptar" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/tutoriaDiaController.jsp?dia=<%=excepcionBean.getDia()%>&mes=<%=excepcionBean.getMes()%>&anyo=<%=excepcionBean.getAnyo()%>'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
  
	
  <%}else{%><%--Seleccionar el tipo de excepci�n--%>
  <form name="form" method="post" target="_self">
  <table class="T10L">
  <tr>
	<td width="224"><INPUT TYPE="radio" NAME="tipo" VALUE="1">No asignar tutor�as este d�a</td>
  </tr>
  <tr>
	<td><INPUT TYPE="radio" NAME="tipo" VALUE="2">Cambiar horario de tutor�as</td>
  </tr>
  <tr>
	 <td height="50">&nbsp;</td>
   </tr>
  </table>
  <table width="100%">
            <tr>
               <td width="49%"align="right"> <input onClick="document.form.action='../controller/excepcionDiaController.jsp'; document.form.submit()"; type="button" value="Aceptar" class="boton" > </td>
			   <td width="2%">&nbsp;</td>
			   </form><form name="salir" target="_top" method="post" >
			   <td width="49%"align="left"> <input onClick="document.salir.action='../controller/tutoriaDiaController.jsp?dia=<%=excepcionBean.getDia()%>&mes=<%=excepcionBean.getMes()%>&anyo=<%=excepcionBean.getAnyo()%>'; document.salir.submit()"; type="button" value="Cancelar" class="boton" > </td>
			</tr>
    </form>
     	<%}%>
</center>
</body>
</html>