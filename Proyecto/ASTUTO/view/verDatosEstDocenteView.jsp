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
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>

<html>
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
       
  <p class="T30 Estilo2 Estilo3"><strong> Estructura Docente</strong></p>
       
  <p>
  <p> 
  <p align="center" class="T9L"  >
  <%--mensaje--%>
  <%String mensaje = messageBean.getMsg();%><%=mensaje%>
  </p>
  	<%--Extraigo el identificador de la estructura docente, opción y el identificador de la estructura docente anterior--%>
    <%String idEstDocente =request.getParameter("idEstDocente");%>
    <%String opcion =request.getParameter("opcion");
	String idEstDocenteAntes =request.getParameter("idEstDocenteAntes");
	
	String boton="Guardar";
	//Opcion nueva estructura
    if (opcion.equals("nuevo"))
	{
	  String disabled=null;
	  //Centros
	  if (idEstDocente==null) 
	  {
	    if (mensaje.equals("Estructura Docente Guardada"))
	   	{	
			//boton salir
		 	boton ="Salir";%>
		 	<form action="../controller/estDocenteController.jsp" name="loginform" target="_top" method="post" >
        <%}  else  {%>
   		  	<form action="../controller/mantenimientoEstDocenteController.jsp?opcion=<%=opcion%>&disabled=<%=disabled%>" name="loginform"  method="post" >
			 <p>&nbsp;</p>
    		<table width="198">
    		<tr> 
    	    <td align="left" class="T10L">Nombre:</td>
            <td><input name="nombre" type="text" class="CampoTexto"  size="30" maxlength="100"></td>
			</tr>
  			</table>	  	  
	  	<%}%>
	 <%} else {//titulaciones o cursos
	   	if (mensaje.equals("Estructura Docente Guardada"))
	   	{
			//boton salir
		 	boton ="Salir";%>
		 	<form action="../controller/estDocenteController.jsp?idEstDocente=<%=idEstDocente%>" name="loginform" target="_top" method="post" >
        <%}	else	{%>
	    	<form action="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=idEstDocente%>&opcion=<%=opcion%>&disabled=<%=disabled%>" name="loginform"  method="post" >
      		 <p>&nbsp;</p>
    		<table width="245">
    		<tr> 
    	    <td width="53" align="left" class="T10L">Nombre:</td>
            <td width="180"><input name="nombre" type="text" class="CampoTexto"  size="30" maxlength="100"></td>
			</tr>
  			</table>		
		<%}
	 }%>
  </p>
	 
      <p>&nbsp; </p>
      <p align="center">
        <input type="submit" value="<%=boton%>" class="boton" >
		<%if (boton!="Salir")  {%>
    		<input onClick="document.salir.action='../controller/estDocenteController.jsp'; document.salir.submit()"; name="submit2" type="button" value="Cancelar" class="boton" />
  		  <%}%>
      </p>
   <%}  else  {//opción borrar o editar
	  boton="Borrar";
	  String disabled="disabled";
	  if (opcion.equals("editar"))
	  {
	    boton ="Cambiar";
		disabled=null;
	  }
	  if (mensaje.equals("Estructura Docente Modificada")||mensaje.equals("Estructura Docente Borrada"))
	  {
	   	boton ="Salir";
	   	if (idEstDocenteAntes.equals("null")) {%><%--boton salir titulaciones--%>
	    	<form action="../controller/estDocenteController.jsp" name="loginform" target="_top" method="post" >
	   	<%}	else  	{%><%--boton salir cursos--%>
			<form action="../controller/estDocenteController.jsp?idEstDocente=<%=idEstDocenteAntes%>" name="loginform" target="_top" method="post" >
      	<%}
	  }  else  {%><%--Cursos o titulaciones borrar o cambiar--%>
		 	<form action="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=idEstDocente%>&opcion=<%=opcion%>&disabled=<%=disabled%>&idEstDocenteAntes=<%=idEstDocenteAntes%>" name="loginform"  method="post" >
		<p>&nbsp;</p>
		 <table width="216">
		      <tr> 
    	         <td align="left" class="T10L">Nombre:</td>
                 <td><input name="nombre" type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=estDocenteBean.getNombre()%>" size="30" maxlength="100" <%=disabled%>></td>
			  </tr>
         </table>
	<%}%>
        <p>&nbsp; </p>
        <div align="center"> 
          <input name="submit" type="submit" value="<%=boton%>" class="boton" />
		  <%if (boton!="Salir")  {%>
    		<input onClick="document.salir.action='../controller/estDocenteController.jsp'; document.salir.submit()"; name="submit2" type="button" value="Cancelar" class="boton" />
  		  <%}%>
        </div>
	</form>
  <%}%></form>
  <%if (boton!="Salir")  {%>
  <form name="salir" method="post" action="../controller/estDocenteController.jsp" target="_top">
  </form>
  <%}%>
</center>
</body>
</html>