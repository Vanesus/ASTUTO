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
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="titulacionBean" class="uco.interfaz.TitulacionBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "uco.data.ConexionBD" %>
<%@ page import = "uco.data.props.GestorPropiedades" %>

<head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<style>
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

<body topmargin="2" leftmargin="4" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
       
  <p class="T30 Estilo2 Estilo3"><strong> Asignatura</strong></p>
       <%--mensaje--%>
       <p><%String mensaje = messageBean.getMsg();%></p>
	   <%--Extraigo--%>
	   <%String idAsignatura =request.getParameter("idAsignatura");%>
	   <%String idAsig =request.getParameter("idAsig");%>
	   <%String opcion =request.getParameter("opcion");
	   //Variables
		   String boton="Guardar";
		   String disabled="disabled";
		   String aux=null;
		if(mensaje=="Asignatura Guardada"||mensaje=="Asignatura Modificada"||mensaje=="Asignatura Borrada")
		 {
		  //Boton salir
		  boton="Salir";%>
		   <p class="T9L"><%=mensaje%></p>
		   <form action="../controller/asignaturaController.jsp"  target="_top" method="post" >
		   <input type="submit" value=<%=boton%> class="boton" > 
		   	<%if (boton!="Salir" &&mensaje==""||mensaje=="Introduzca el nombre de la asignatura") {%>
  				<input onClick="document.salir.action='../controller/asignaturaController.jsp'; document.salir.submit()"; name="submit" type="button" value="Cancelar" class="boton" />
  			<%}%>
		 <%}
	  //Nueva asignatura
       if(idAsignatura==null&&opcion==null)
	   {
	     //Cuando hamos introducido los datos de la asignatura y la titulación		 
		 if(mensaje=="Elija la titulación")
		 {
		   //Estraigo
		   String titulacion = request.getParameter("titulacion");
		   String nombre= request.getParameter("nombre");%>
	       <form action="../controller/mantenimientoAsigController.jsp?disabled=<%=disabled%>&titualcion=<%=titulacion%>&nombre=<%=nombre%>"  method="post" >
		 <%}
		 else
		 {%>
		 <form action="../controller/mantenimientoAsigController.jsp?disabled=<%=disabled%>"  method="post" >
		 <%}%>
		<%--Formulario para introducir el nombre de la asignatura y la titulación--%>
     	<%if(mensaje=="" || mensaje=="Titulación no encontrada"||mensaje=="Introduzca el nombre de la asignatura"){%> 
  		<table width="262" align="center">
    		<tr> 
    	        <td height="32" align="left" ><span class="T10L">Nombre:</span></td>
	            <td><input name="nombre" type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="100"></td>
			</tr>

            <tr>
                 <td height="32" align="left" ><span class="T10L">Titulación:</span></td>
                 <td><input name="titulacion" type="text" class="CampoTexto" id="titulacion" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="100" /></td>
            </tr>
         </table>
		 <p class="T9L"><%=mensaje%></p>
		<%--Editar asignatura mostrar las titulaciones y los cursos--%> 
		<%}else if(mensaje=="Elija la titulación"){
			String titulacion = request.getParameter("titulacion");
		   String nombre= request.getParameter("nombre");
	      %>
  			<table align="center">
    		<tr>
			      <td class="T10L">Nombre: </td>
			      <td class="T10L"><%=nombre%></td>
			</tr>
			<tr>
			      <td class="T10L">Titulación: </td>
			      <td class="T10L"><%=titulacion%>  </td>
			</tr>
			</table>
			<p class="T10L"><%=mensaje%></p>
			<%--Lista de titulaciones--%>
		    <%for(int i=0;i<centroBean.getContador();i++){	%>	
			<table  width=244 border=0 align="center" cellpadding=2 cellspacing=2>
    			<tr>
				   <td width=18 ><img src="../images/op_a2.gif" width="13" height="13" ></td>
			      <td width=279 class="T10L" align="left"><%=centroBean.getCentro(i)%></td>
				</tr>
			 </table>
			 <%--Lista de cursos de la titulacion--%>
 			 <%for(int j=0;j<titulacionBean.getContador(i);j++){	%>	      
			 
  			<table width=175 border=0 align="center" cellpadding=2 cellspacing=2>
			   <tr>
				    <td width=14><img src="../images/op_a1.gif" width="13" height="13" ></td>
		           <td width=198 align="left"><a href="../controller/mantenimientoAsigController.jsp?nombre=<%=nombre%>&titulacion=<%=titulacion%>&curso=<%=titulacionBean.getId(i,j)%>" class="T9L" ><%=titulacionBean.getTitulacion(i,j)%></a></td>
	           </tr>
             </table>
		      <%}
			  } %>
			  <center><a href="../view/verDatosAsignaturaView.jsp" class="T10L">Atrás<%messageBean.setMsg("");%></a> </center>
  <%}}%>
  <p> 
    <%--Borrar o editar--%>
    <%if (opcion!=null)
	 {
      if(idAsignatura!=null)
	  {
	   boton="Borrar";
	   if (opcion.equals("editar"))
	   {
		 boton ="Cambiar";
		 disabled=null;
	   }
       if(mensaje=="" || mensaje=="Titulación no encontrada"||mensaje=="Introduzca el nombre de la asignatura")//borrar o editar
	   {
	     if (opcion.equals("borrar"))//borrar
         {
		 boton="Borrar";
		 aux="borrar";%>
		 <form action="../controller/mantenimientoAsigController.jsp?disabled=<%=disabled%>&opcion=<%=opcion%>&idAsignatura=<%=idAsignatura%>" name="nombre"  method="post" > 
    	<%}
		 else//Editar
		 {boton="Editar";
		 aux="editar";%>
  		</p>
	   <form action="../controller/mantenimientoAsigController.jsp?disabled=<%=disabled%>&opcion=<%=opcion%>&idAsig=<%=idAsignatura%>" name="nombre"  method="post" >
		 <%}%>
    <table width="262" align="center">
      <tr> 
        <td height="32" align="left" ><span class="T10L">Nombre:</span></td>
        <td> 
          <input name="nombre" type="text" class="CampoTexto" id="nombre" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=asignaturaBean.getNombreAsig()%>" size="20" maxlength="100" <%=disabled%> /></td>
      </tr>
      <tr> 
        <td height="32" align="left" ><span class="T10L">Titulación:</span></td>
        <td><input name="titulacion" type="text" class="CampoTexto" id="titulacion3" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" value="<%=asignaturaBean.getNombreTit()%>" size="20" maxlength="100" <%=disabled%> />
          </td>
      </tr>
	 
    </table>	 
    <p class="T9L"><%=mensaje%></p>
    <%}}else if(mensaje=="Elija la titulación"){//Editar buscar titulación
	String titulacion = request.getParameter("titulacion");
		   String nombre= request.getParameter("nombre");
	      %>
    <table align="center">
      <font color="#8c1229"> 
      <tr> 
        <td class="T10L">Nombre: </td>
        <td><%=nombre%></td>
      </tr>
      <tr> 
        <td class="T10L">Titulación: </td>
        <td><%=titulacion%> </td>
      </tr>
      </font> 
    </table>
    <br />
    <blockquote>
      <p class="T9L"><b><%=mensaje%></b></p>
    </blockquote>
	<%--Lista de titulaciones--%>
    <%for(int i=0;i<centroBean.getContador();i++){	%>
    <table  width="257" border="0" align="center" cellpadding="2" cellspacing="2">
      <tr> 
        <td width="18" ><img src="../images/op_a2.gif" width="13" height="13" /></td>
        <td width="225" class="T10L" align="left"><%=centroBean.getCentro(i)%></td>
      </tr>
    </table>
	<%--Lista de cursos de cada titulacion--%>
    <%for(int j=0;j<titulacionBean.getContador(i);j++){	%>
    <table width="191" border="0" align="center" cellpadding="2" cellspacing="2">
      <tr> 
        <td width="14"><img src="../images/op_a1.gif" width="13" height="13" /></td>
        <td width="173" align="left"><a href="../controller/mantenimientoAsigController.jsp?nombre=<%=nombre%>&curso=<%=titulacionBean.getId(i,j)%>&opcion=<%="editar"%>&idAsignatura=<%=idAsig%>" class="T9L" ><%=titulacionBean.getTitulacion(i,j)%></a></td>
      </tr>
    </table>
    <%}} %>
    <center>
	<%--Boton Atras--%>
	<%if (opcion.equals("editar"))
	{%>
      <a href="../view/verDatosAsignaturaView.jsp?idAsignatura=<%=idAsignatura%>&opcion=editar" class="T10L">Atrás
      <%messageBean.setMsg("");%>
      </a> 
	 <%}else
	 {%>
	 <a href="../view/verDatosAsignaturaView.jsp" class="T10L">Atrás
      <%messageBean.setMsg("");%>
      </a> 
	 <%}%>
    </center>
    <%}
	}		 
	if ((mensaje =="" || mensaje=="Titulación no encontrada" ||mensaje=="Introduzca el nombre de la asignatura")&&aux==null)  
	{
	   boton="Buscar";	 
    }
	if (mensaje != "Elija la titulación"&&mensaje!="Asignatura Guardada"&&mensaje!="Asignatura Modificada"&&mensaje!="Asignatura Borrada")
	{%>
		<div align="center">
        <input type="submit" value=<%=boton%> class="boton" >
		<%if (boton!="Salir" &&mensaje==""||mensaje=="Introduzca el nombre de la asignatura") {%>
  			<input onClick="document.salir.action='../controller/asignaturaController.jsp'; document.salir.submit()"; name="submit" type="button" value="Cancelar" class="boton" />
  		<%}%>
     	</div></td></tr>
    <%}%>
  </form>
  <%if (boton!="Salir" &&mensaje==""||mensaje=="Introduzca el nombre de la asignatura") {%>
  <form name="salir" method="post" action="../controller/asignaturaController.jsp" target="_top">
  </form>
  <%}%>
</center>
</body>
</html>