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

<html >
<head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/corp2.jpg);
}

.Estilo1 {font-size: 12px}
.Estilo2 {font-size: 12}
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
      <form action="<%=messageBean.getUrl()%>" target="_top" >
       <p class="T24"><strong><font color="#8c1229">IMPRESI�N PDF</font></strong></p>
	          <p>&nbsp;</p>
       <p class="T8L Estilo2 Estilo1">
	     <%--mensaje--%>
         <% String texto=messageBean.getMsg(); %>
         <span class="Estilo2"><font color="#8c1229"><%=texto%></font></span> </p>
       <p>&nbsp;</p>
	   <input name="" type="submit" value="Salir" class="boton" />
	  </form>
       
</center>
<%--poder a null el bean--%>
  <% 
  messageBean.setMsg("");  
  messageBean.setUrl("");  
  %>
</body>
</html>
