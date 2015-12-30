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
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>

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
.Estilo4 {font-size: 9px}
.Estilo7 {font-size: 10pt}
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
  
  <p align="center" class="T30 Estilo2 Estilo3"><strong> Profesor Asignatura</strong></p>
<p align="center" class="T9L"  >
  <%--mensaje--%>
  <%String mensaje = messageBean.getMsg();%><%=mensaje%>
  </p>
  <p> 
    <%--Extraigo--%>
    <%String idAsignatura =request.getParameter("idAsignatura");%>
    <%String idProfesor =request.getParameter("idProfesor");%>
    <%String nombre =request.getParameter("nombreProf");%>
    <%String opcion =request.getParameter("opcion");%>
    <%String login =request.getParameter("login");%>
    <%String apellidos= request.getParameter("apellidos");%>
    <%String nombreAsig= request.getParameter("nombreAsig");
	String boton="Guardar";%>
 <%--opcion nueva asignatura asignar el profesor--%>
 <%if(idProfesor==null)
 {%>
  </p>
  <div align="center"></div>
 <%if(idAsignatura!=null)
 {%>
  <form action="../controller/mantenimientoProfAsigController.jsp?nombre=<%=nombre%>&idAsignatura=<%=idAsignatura%>&nombreAsig=<%=nombreAsig%>" method="post"  > 
  <%} else{%>
   <form action="../controller/mantenimientoProfAsigController.jsp?nombre=<%=nombre%>" method="post"  > 
  <%}%>
  <%if(mensaje=="" || mensaje=="No existe el profesor" ){%> 
  </p>
	<table width="223" height="70">
	    <tr>
		   <td height="30" align="left"><span class="T10L">Login:</span></td>
           <td><input name="login" type="text" class="CampoTexto" id="login" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="10"></td>
		</tr>
	    <tr> 
    	   <td height="30" align="left"><span class="T10L">Nombre:</span></td>
           <td><input name="nombreProf" type="text" class="CampoTexto" id="nombreProf" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="100"></td>
		</tr>
		<tr>
           <td align="left"><span class="T10L">Apellidos:</span></td>
           <td><input name="apellidos" type="text" class="CampoTexto" id="apellidos" style="font-size: 10pt; font-family: arial,helvetica; maxlength=" size="20" maxlength="100" /></td>
        </tr>
    </table>
	<%}else if(mensaje=="Elija un profesor"){
	      %>
		    <table>
	  <font color="#8c1229">
	         <tr>
			      <td class="T10L" align="left">Login: </td>
			      <td class="T10L"><%=login%></td>
      </tr>
			   <tr>
			      <td class="T10L" align="left">Nombre: </td>
			      <td class="T10L"><%=nombre%></td>
			   </tr>
			   <tr>
			      <td class="T10L" align="left">Apellidos: </td>
			      <td class="T10L"><%=apellidos%>  </td>
			  </tr>
			  </font>
			</table><br />
			<%if(idAsignatura==null)
			{
			  //lista de profesores que cumplen los criterios
		      for(int i=0;i<profBean.getContador();i++){	%>	   
			  <table border=0 cellspacing=4 cellpadding=4  width=236>	
			    <tr>
				   <td width=13 ><img src="../images/op_a2.gif" width="13" height="13" ></td>   
			       <td width=195 class="T10L" align="left"><a class="T10L" href="../controller/mantenimientoProfAsigController.jsp?idProfesor=<%=profBean.getId(i)%>&nombreAsig=<%=nombreAsig%>" ><%=profBean.getNombre(i)%>&nbsp;<%=profBean.getApellidos(i)%></a></td>
				</tr>
			  </table>
		      <%}
			}else{
		      for(int i=0;i<profBean.getContador();i++){	%>	      
    <table border=0 cellspacing=4 cellpadding=4  width=236>
      <tr>
				   <td width=13 ><img src="../images/op_a2.gif" width="13" height="13" ></td>  
			       <td width=271 class="T10L" align="left"><a class="T10L" href="../controller/mantenimientoProfAsigController.jsp?idProfesor=<%=profBean.getId(i)%>&idAsignatura=<%=idAsignatura%>&nombreAsig=<%=nombreAsig%>" ><%=profBean.getNombre(i)%>&nbsp;<%=profBean.getApellidos(i)%></a></td>
				 </tr>
			   </table>
		      
    <%}
			  
			}
	}	
	//No existen profesores con esos datos
	if (mensaje =="" || mensaje=="No existe el profesor")  
	{
	 boton="Buscar";		 
	   %>
    <p>&nbsp;</p><div align="center">
          <input type="submit" value=<%=boton%> class="boton"> 
		  <%if (boton!="Salir" && (messageBean.getMsg()!="Profesor Añadido" && messageBean.getMsg()!="Profesor Borrado"  && messageBean.getMsg()!="Solo existe un profesor asociado a esta asignatura. No se puede eliminar" ))
  		{%>
			<input onClick="document.salir.action='../controller/asignaturaController.jsp'; document.salir.submit()"; name="submit2" type="button" value="Cancelar" class="boton" />
  		<%}%>
     </div>
			 <%}%>
</form>
  <p>
    <%}
  String Boton = "Borrar";
  String disabled=null;
  //No se puede eliminar profesor solo hay una que imparte la asignatura
  if (messageBean.getMsg()=="Solo existe un profesor asociado a esta asignatura. No se puede eliminar")
  {%>
  <form action="../controller/asignaturaController.jsp?idAsignatura=<%=idAsignatura%>&nombre=<%=nombreAsig%>" name="loginform" target="_top" method="post" > 
  <%Boton = "Salir";
  }
  //Borrar profesor cuando hay mas de uno que imparte la asignatura
  if(idProfesor!=null)
  {
    disabled="disabled";%>
  <%if (messageBean.getMsg()=="Profesor Borrado" || messageBean.getMsg()=="Profesor Añadido" || messageBean.getMsg()=="El profesor ya esta añadido")
  {%><form action="../controller/asignaturaController.jsp?idAsignatura=<%=idAsignatura%>&nombre=<%=nombreAsig%>" name="loginform" target="_top" method="post" > 
  <%Boton = "Salir";
  }  else  {%>
  <form action="../controller/mantenimientoProfAsigController.jsp?idProfesor=<%=idProfesor%>&opcion=<%=opcion%>&idAsignatura=<%=idAsignatura%>&nombreProf=<%=nombre%>&disabled=<%=disabled%>&nombreAsig=<%=nombreAsig%>" name="loginform"  method="post" > 
  
     <table>
	    <tr>
		   <td height="31" align="left"><span class="T10L">Nombre:</span></td>
           <td><input name="nombreProf" disabled type="text" class="CampoTexto" id="nombreProf"  size="20" value="<%=profesorBean.getNombre()%>" /></td>
		</tr>
		<tr>
			<td height="29" align="left"><span class="T10L">Apellidos:</span></td>
            <td><input name="apellidos" type="text" class="CampoTexto" id="apellidos" value="<%=profesorBean.getApellidos()%>"  size="20" maxlength="100" <%=disabled%>/></td>
		</tr>
	</table>
    <%}%>
    <p>
       <input name="submit" type="submit" value="<%=Boton%>" class="boton" />
	   <%if (boton!="Salir" && (messageBean.getMsg()!="Profesor Añadido" && messageBean.getMsg()!="Profesor Borrado"  && messageBean.getMsg()!="Solo existe un profesor asociado a esta asignatura. No se puede eliminar"&&  messageBean.getMsg()!="El profesor ya esta añadido") )
  		{%>
			<input onClick="document.salir.action='../controller/asignaturaController.jsp'; document.salir.submit()"; name="submit2" type="button" value="Cancelar" class="boton" />
  		<%}%>
     </p>
  </form>

  <%}%>
  <%if (boton!="Salir" && (messageBean.getMsg()!="Profesor Añadido" && messageBean.getMsg()!="Profesor Borrado"  && messageBean.getMsg()!="Solo existe un profesor asociado a esta asignatura. No se puede eliminar" &&  messageBean.getMsg()!="El profesor ya esta añadido"))
  {%>
  <form name="salir" method="post" action="../controller/asignaturaController.jsp" target="_top">	
  </form>
  <%}%>
  <%if (messageBean.getMsg().equals("Elija un profesor"))
  {%>
  	<input onClick="document.salir.action='../controller/asignaturaController.jsp'; document.salir.submit()"; name="submit2" type="button" value="Cancelar" class="boton" />
  <%}%>
</center>
</body>
</html>