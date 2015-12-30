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
<jsp:useBean id="alumnoBean" class="uco.interfaz.AlumnoBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>

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
}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
      <td class="T24" align="right"><font color="#ffffff"> I&nbsp;n&nbsp;f&nbsp;o&nbsp;r&nbsp;m&nbsp;a&nbsp;c&nbsp;i&nbsp;&oacute;&nbsp;n&nbsp; 
        T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;&iacute;&nbsp;a&nbsp; </font></td>
   </tr></tbody></table></td></tr>
    <tr valign="top">
    <td>
    <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
        <td height="200"><img src="../images/p.gif" width="15" height="55"></td>
        <td class="T10a"> 
        <table width="505" cellpadding="4" cellspacing="0"><tbody>
		    <tr valign="top">
	        <td width="500"> 
                                    <table border="0" cellspacing="0" cellpadding="4" width="100%" bgcolor="#ffffff"><tbody>
                                        <tr> 
										<%--Datos del alumno seleccionado--%>
                                          <td width="42%" align="left" class="T20"><font color="#8c1229"><b>Correo: </b><%=alumnoBean.getCorreo()%> </font></td>
                                          <td width="58%" align="left" class="T20"><font color="#8c1229"><b>Nombre: </b><%=alumnoBean.getNombre()%></font></td>
                                        </tr>
                                      </tbody> </table>
                                      <table border="0" cellspacing="0" cellpadding="0">  <tbody>
									  <%--Extraigo del formulario--%>
										<%String idPeticionTut= request.getParameter("idPeticionTut");%>
										<%String profesor= request.getParameter("profesor");%>
										<%String asignatura= request.getParameter("asignatura");%>
										<%String correoBuscar= request.getParameter("correoBuscar");%>
								        <tr> 
                                            <td><img src="../images/encabezado_w2a.gif" width="489" height="11" /><a href="../controller/peticionTutAlumnoController.jsp?correo=<%=alumnoBean.getCorreo()%>&correoBuscar=<%=correoBuscar%>&profesor=<%=profesor%>&asignatura=<%=asignatura%>" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás"/></a></td>
                                          </tr>
                                        </tbody>  </table>
										<%--Datos de la petición tutoría seleccionada--%>
                                    <table width="74%" height="204" border="0" align="center" cellpadding="4" cellspacing="0" >   <tbody>
                                        <tr> 
                                          <td width="24%" height="29" align="left" class="T20"><font color="#8c1229"><b>Profesor: </b> </font></td>
                                          <td width="76%" align="left" class="T20"><font color="#8c1229"><%=profesorBean.getNombre()%> <%=profesorBean.getApellidos()%></font></td> 
                                        </tr>
                                        <tr> 
                                          <td width="24%" height="29" align="left" class="T20"><font color="#8c1229"><b>Asignatura: </b> </font></td>
                                          <td width="76%" align="left" class="T20"><font color="#8c1229"><%=asignaturaBean.getNombreAsig()%></font> </td>
                                        </tr>
                                        <tr>
                                          <td height="29" align="left" class="T20"><font color="#8c1229"><b>Fecha:  </b> </font></td>
                                          <td align="left" class="T20"><font color="#8c1229"><%if (peticionTutBean.getDia()!=null){%><%=peticionTutBean.getDia()%>-<%=peticionTutBean.getMes()%>-<%=peticionTutBean.getAnyo()%><%}%></font></td>
                                        </tr>
                                        <tr> 
                                          <td width="24%" height="29" align="left" class="T20"><font color="#8c1229"><b>Hora: </b> </font></td>
                                          <td align="left" class="T20"><font color="#8c1229"><%if (peticionTutBean.getHoraInicio()!=null){%><%=peticionTutBean.getHoraInicio()%>:<%if(peticionTutBean.getMinutosInicio()==0){%>00<%}else%><%=peticionTutBean.getMinutosInicio()%>-<%=peticionTutBean.getHoraFin()%>:<%if(peticionTutBean.getMinutosFin()==0){%>00<%}else%><%=peticionTutBean.getMinutosFin()%><%}%></font></td>
								        </tr>
										<tr>
												    <td height="29" align="left" class="T20"><font color="#8c1229"><b>Estado: </b> </font></td>
												    <%if (peticionTutBean.getEstado()==1){ %>
														<td align="left" class="T20"><font color="#8c1229">Tutoría solicitada </font></td>
                                                    <%}else if (peticionTutBean.getEstado()==2)	{ %>
														<td align="left" class="T20"><font color="#8c1229">Tutoría enviada </font></td>
                                                    <%}else if (peticionTutBean.getEstado()==3){ %>
														<td align="left" class="T20"><font color="#8c1229">Tutoría confirmada</font></td>
                                                    <%}else if (peticionTutBean.getEstado()==4){ %>
														<td align="left" class="T20"><font color="#8c1229">Tutoría realizada </font></td>
                                                    <%}else if (peticionTutBean.getEstado()==5){ %>
														<td align="left" class="T20"><font color="#8c1229">No se ha realizado la tutoría</font></td>
                                                    <%}else if (peticionTutBean.getEstado()==6){ %>
														<td align="left" class="T20"><font color="#8c1229">Incomparescencia</font></td>
												  <%}%>
												  </tr>
                                        <tr> 
                                          <td width="24%" height="29" align="left" class="T20"><font color="#8c1229"><b>Motivo: </b> </font></td>
                                          <td width="76%" rowspan="2" align="left" class="T20" align="left"><textarea name="textarea" cols="45" rows="6" disabled><%=peticionTutBean.getMotivo()%></textarea></td>                                              
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" class="T20">&nbsp;</td>
                                        </tr>
                                        <tr> 
                                          <td width="24%" height="29" align="left" class="T20"><font color="#8c1229"><b>Comentario: </b> </font></td>
                                          <td width="76%" rowspan="2" align="left" class="T20" align="left"> <textarea name="textarea" cols="45" rows="6" disabled><%if (peticionTutBean.getComentario()!=null){%><%=peticionTutBean.getComentario()%><%}%></textarea></td>
                                        </tr>
                                        <tr> 
                                          <td height="15" align="left" class="T20">&nbsp;</td>
                                        </tr>
                                      </tbody> </table>
                  	</table>
	<%-- Incluimos el pie de pagina --%>		                                                                                      
    <jsp:include page="../view/pie.jsp"/>
</body></html>