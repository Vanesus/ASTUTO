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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
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
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="99%">
  <tbody><tr>
  <td class="T24" align="right"><font color="#ffffff"> T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;&iacute;&nbsp;a&nbsp;s&nbsp; A&nbsp;l&nbsp;u&nbsp;m&nbsp;n&nbsp;o&nbsp; 
                            </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
						<%--Extraigo del formulario--%>
 						<%String correoBuscar=request.getParameter("correoBuscar");%>
						<%String profesor=request.getParameter("profesor");%>
						<%String asignatura=request.getParameter("asignatura");%>
                                        
                                    
          <table border="0" cellspacing="0" cellpadding="4" width="99%" >
            <tbody>
                                        <tr> 
										<%--Datos del alumno--%>
                                          <td width="41%" align="left" class="T12"><font color="#8c1229"><b>Correo: </b><%=alumnoBean.getCorreo()%> </font></td>
                                          <td width="59%" align="left" class="T12"><font color="#8c1229"><b>Nombre: </b><%=alumnoBean.getNombre()%></font></td>
                                        </tr>
                                    </tbody></table>
                                      <table border="0" cellspacing="0" cellpadding="0"><tbody>
                                          <tr> 
                                            <td><img src="../images/encabezado_w2a.gif" width="500" height="11" /><a href="../controller/listadoAlumnosController.jsp?correo=<%=correoBuscar%>&profesor=<%=profesor%>&asignatura=<%=asignatura%>" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                          </tr>
                                      </tbody> </table>
                                  <p>&nbsp;</p>
                                    
          <table  width="454" height="90"  align="center" >
            <tr valign="top"> 
              <td width="131" height="23" class="T10" align="left"><strong><font color="#8c1229">Profesor</font></strong></td>
              <td width="117" class="T10" align="left"><strong><font color="#8c1229">Asignatura</font></strong></td>
              <td width="125" class="T10" align="left"><strong><font color="#8c1229">Motivo</font></strong></td>
              <td width="53" class="T10" align="left"><strong><font color="#8c1229">Estado</font></strong></td>
            </tr>
            <%-- Datos de la petición tutoría seleccionada--%>
            <%String color ="#FFFDE5";%>
            <% for (int i=0; i<peticionTutBean.getContador(); i++) {
                                       if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
            <tr valign="top" bgcolor="<%=color%>"> 
              <td width="131" height="59" class="T9L"> <a  class="T9L" href="../controller/peticionTutAlumnoController.jsp?idPeticionTut=<%=peticionTutBean.getId(i)%>&correoBuscar=<%=correoBuscar%>&asignatura=<%=asignatura%>&profesor=<%=profesor%>"> 
                &nbsp;<%=profBean.getNombre(i)%> <%=profBean.getApellidos(i)%></font> 
                </a> </td>
              <td class="T12"> <span class="T9L">&nbsp;<%=asignaturaBean.getNombre(i)%></font></span></td>
              <td class="T12"> <span class="T9L">&nbsp;<%=peticionTutBean.getMotivo(i)%></font></span></td>
              <% String estadoStr=null;
											Integer estado=peticionTutBean.getAceptado(i);
											if(estado==1) estadoStr="Solicitada";
											if(estado==2) estadoStr="Enviada";
											if(estado==3) estadoStr="Confirmada";
											if(estado==4) estadoStr="Realizada";
											if(estado==5) estadoStr="No Realizada";
											if(estado==6) estadoStr="Incomparescencia";
											if(estado==7) estadoStr="Pendiente Verificación ";%>
              <td class="T9L">&nbsp;<%=estadoStr%></td>
            </tr>
            <%}%>
          </table>
									
          <p class="T8L" align="center">Puedes obtener información de la tutoría 
            haciendo click en el nombre del profesor.</p>
	<%-- Incluimos el pie de pagina --%>		                                                                                      
    <jsp:include page="../view/pie.jsp"/>
</body></html>