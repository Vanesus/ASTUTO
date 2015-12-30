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

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>

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
<%-- Incluimos la cabecera y el menu del profesor--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
      <td class="T24" align="right"><font color="#ffffff"> P&nbsp;r&nbsp;o&nbsp;f&nbsp;e&nbsp;s&nbsp;o&nbsp;r&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td class="T10a"> 
		   							<%--Datos extraidos del formulario--%>
                                      <%String correoBuscar=request.getParameter("correoBuscar");%>
                                      <%String asignatura=request.getParameter("asignatura");%>
									  <%String login=request.getParameter("login");%>
                                      
                                      <table width="505" cellpadding="4" cellspacing="0"><tbody>
									  			<%--Datos del alumno--%>
                                                  <tr valign="top"> 
                                                    <td width="43%" align="left" class="T20"><font color="#8c1229"><b>Correo: </b><%=alumnoBean.getCorreo()%></font></td>
                                                    <td width="57%" align="left" class="T20"><font color="#8c1229"><b>Nombre: </b><%=alumnoBean.getNombre()%></font></td>
                                                  </tr>
                                                </tbody></table>
										    <%--Muestra el boton atrás--%>
											<%if(correoBuscar==null || correoBuscar.equals("null"))
												{}
												else
												{%>
                                                <table border="0" cellspacing="0" cellpadding="0">  <tbody>
                                                    <tr valign="top">
													<%if (asignatura.equals("null"))	{%>
                                                      <td><img src="../images/encabezado_w2a.gif" width="504" height="11" /><a href="../controller/listadoAlumnosProfesorController.jsp?correo=<%=correoBuscar%>&login=<%=login%>&asignatura=" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                                    <%}	else{%>
														<td><img src="../images/encabezado_w2a.gif" width="504" height="11" /><a href="../controller/listadoAlumnosProfesorController.jsp?correo=<%=correoBuscar%>&login=<%=login%>&asignatura=<%=asignatura%>" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                                    <%}%>
													</tr>
                                                  </tbody> </table>
                                                <%}%>
                                             <p>&nbsp;</p>
                                              
          <table  width="466" height="90"  align="center" 	>
            <tr valign="top"> 
              <td width="155" height="23" class="T10" align="left"><strong><font color="#8c1229">Asignatura</font></strong></td>
              <td width="144" class="T10" align="left"><strong><font color="#8c1229">Motivo</font></strong></td>
              <td width="145" class="T10" align="left"><strong><font color="#8c1229">Estado</font></strong></td>
            </tr>
            <%String color ="#FFFDE5";%>
            <%-- Lista de las peticiones de tutoría del alumno--%>
            <% for (int i=0; i<peticionTutBean.getContador(); i++) {
													if(i%2==0) color="#FFE0B1";
													else color ="#FFF5E4";%>
            <tr valign="top" bgcolor="<%=color%>"> 
              <td width="155" height="59" class="T9L"> <a class="T9L" href="../controller/peticionTutAlumnoProfesorController.jsp?idPeticionTut=<%=peticionTutBean.getId(i)%>&correoBuscar=<%=correoBuscar%>&login=<%=login%>&asignatura=<%=asignatura%>"> 
                &nbsp;<%=asignaturaBean.getNombre(i)%></font></a> </td>
              <td class="T9L">&nbsp;<%=peticionTutBean.getMotivo(i)%></font></td>
              <% String estadoStr=null;
											Integer estado=peticionTutBean.getAceptado(i);
											if(estado==1) estadoStr="Solicitada";
											if(estado==2) estadoStr="Enviada";
											if(estado==3) estadoStr="Confirmada";
											if(estado==4) estadoStr="Realizada";
											if(estado==5) estadoStr="No Realizada";
											if(estado==6) estadoStr="Incomparescencia";%>
              <td class="T9L">&nbsp;<%=estadoStr%></td>
            </tr>
            <%}%>
          </table>
                                              
          <p class="T8L" align="center">Puedes obtener información de la tutoría 
            haciendo click en el nombre de la asignatura.</p>
	
    <%-- Incluimos el pie de pagina --%>		                                                                                                                       
    <jsp:include page="../view/pie.jsp"/>		
</body></html>