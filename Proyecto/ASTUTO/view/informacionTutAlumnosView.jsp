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
<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>

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
-->
</style></head>
<body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody>
  <tr>
    <td class="T24" align="right"><font color="#ffffff"> M&nbsp;i&nbsp;s&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp;<font></td>
  </tr>
  </tbody> </table></td>
 </tr>
 <tr valign="top"> 
  <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
           <table border="0" cellspacing="0" cellpadding="4" width="48%" >
            <tbody>
              <tr> 
                <td width="2%" align="left" class="T20"><font color="#000000"><b>&nbsp;</b></font></td>
                <td width="98%" align="left" class="T20"><font color="#000000"><b>Correo: 
				  <%--Correo del alumno--%>
                  </b><%=alumnoBean.getCorreo()%> </font></td>
              </tr>
              <tr> 
                <td height="21" colspan="2" align="left" class="T20"><IMG src="../images/encabezado_w2a.gif" width="487" height="14"></td>
              </tr>
            </tbody>
          </table>
		  
                              <table  width="505" height="71"  align="center" >
                                <tr valign="top"> 
                                  <td width="94" height="23" class="T10" align="left"><font color="#000000"><strong>Profesor</strong></font></td>
                                  <td width="133" class="T10" align="left"><font color="#000000"><strong>Asignatura</strong></font></td>
                                  <td width="80" class="T10" align="left"><font color="#000000"><strong>Fecha</strong></font></td>
                                  <td width="70" class="T10"align="left"><font color="#000000"><strong>Hora</strong></font></td>
                                  <td width="42" class="T10"><strong>Estado</strong></td>
                                  <td colspan="2" class="T10" align="left"><font color="#000000"><strong>Opci&oacute;n</strong></font></td>
                                </tr>
								<%--Lista de las peticiones de tutoría que tiene el alumno, con todos los datos necesarios--%>
                                <%String color ="#FFFDE5";%>
                                <%for (int i=0;i<peticionTutBean.getContador();i++)	{
                                       if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
                                <tr valign="middle" bgcolor="<%=color%>"> 
                                  
              <td width="94" height="40" class="T9"> 
                <%--nombre y apellidos del profesor--%>
                &nbsp;<%=profBean.getNombre(0)%> <%=profBean.getApellidos(i)%> 
              </td>
								  <%--nombre de la asignatura y la titulación--%>
                                  
              <td class="T9"> &nbsp;<%=asignaturaBean.getNombre(i)%>(<%=profBean.getTitulacion(i,0)%>)</td>
                                  
              <td class="T9"> &nbsp; 
                <%--fecha de la tutoría si esta asignada--%>
                <%if (peticionTutBean.getDia1(i)!=null){%>
                <%=peticionTutBean.getDia1(i)%>-<%=peticionTutBean.getMes1(i)%>-<%=peticionTutBean.getAnyo1(i)%> 
                <%}%>
              </td>
                                  <td class="T9"> <p>&nbsp; 
                  <%--Hora de la tutoría si esta asignada--%>
                  <%if (peticionTutBean.getHora(i)!=null){%>
                  <%=peticionTutBean.getHora(i)%>:
                  <%if(peticionTutBean.getMinutos(i)==0){%>
                  00
                  <%}else{%>
                  <%=peticionTutBean.getMinutos(i)%>
                  <%}}%>
                </p>
                                    </td>
									<%--Estado de la tutoría--%>
									 <%String estado=null;
									  if (peticionTutBean.getAceptado(i)==7)
									  	estado ="Solicitud en curso";
									  if (peticionTutBean.getAceptado(i)==1)
									  	estado ="Solicitada";
									  if (peticionTutBean.getAceptado(i)==2)
									  	estado ="Enviada";
								      if (peticionTutBean.getAceptado(i)==3)
									  	estado ="Aceptada";
									  if (peticionTutBean.getAceptado(i)==4)
									  	estado ="Realizada";
									  if (peticionTutBean.getAceptado(i)==5)
									  	estado ="No realizada";
									  if (peticionTutBean.getAceptado(i)==6)
									  	estado ="No realizada";%>
                                  <td class="T9"><%=estado%></td>
								  <%--Botones para aceptar o borrar la petición--%>
                                  	<td width="56" class="T10" align="center"><font color="#000000"><a href="../controller/tutoriasAlumnosController.jsp?opcion=borrar&correoBuscar=<%=alumnoBean.getCorreo()%>&idPeticionTut=<%=peticionTutBean.getId(i)%>" ><img src="../images/borrar.gif" width="20" height="23" border="0" title="Rechazar Petición" /></a><a href="../controller/tutoriasAlumnosController.jsp?opcion=aceptar&correoBuscar=<%=alumnoBean.getCorreo()%>&idPeticionTut=<%=peticionTutBean.getId(i)%>" ><img src="../images/Aceptar.png" width="27" height="25" border="0" title="Reenviar Petición" /></a></font></td>
								</tr>
                                <%}%>
                              </table>
                              <p align="center" class="T8L"><font color="#000000">Si 
                                la fecha y la hora no esta establecida saldra 
                                en blanco </font></p>
								<%--mensaje--%>
								<p align="center" class="T9"><%=messageBean.getMsg()%></font></p>
                              </tr>
	<%-- Incluimos el pie de pagina --%>		                                                
	<jsp:include page="../view/pie.jsp"/>
</body></html>