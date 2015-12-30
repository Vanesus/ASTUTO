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
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>

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
.boton{
        width:80px;
        height:25px;
		}
-->
</style></head>
<body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
   <td class="T24" align="right"><font color="#ffffff"> S&nbsp;o&nbsp;l&nbsp;i&nbsp;c&nbsp;i&nbsp;t&nbsp;a&nbsp;r&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp; 
            </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
 									<%--Extraigo el identificador del profesor y la asignatura necesarios para la operación a realizar--%>                 									
                                      <%String idAsignatura =request.getParameter("idAsignatura");
                                      String idProfesor =request.getParameter("idProfesor");%>
									  <%if (idAsignatura==null)
									  {
									     idAsignatura = request.getParameter("asignatura");
									  }%>
									  <%--Función para verificar el formato del correo--%>
									  <script>
										function validarEmail(valor) {
										if (/^[a-z][0-9][0-9][a-z][a-z][a-z][a-z][a-z]@uco.es$/.test(form.correo.value)){
										return (true)
										} else {
										alert("La dirección de email es incorrecta. El formato debe ser a11aaaaa@uco.es");
										return (false);}
										}
									  </script>
                                      <form name="form"onSubmit="return validarEmail(this);" action="../controller/solicitarTutoriaController.jsp?idProfesor=<%=idProfesor%>&idAsignatura=<%=idAsignatura%>" method="post" target="_self" rel="gb_page[450,400]">
                                        <table border="0" cellpadding="2" cellspacing="0">
                                          <tr valign="top"> 
                                            <td height="29" align="left" class="T10L"><font color="#000000">Profesor:</font></td>
											<%--Nombre del profesor--%>
                                            <td align="left" valign="middle" class="T10L" ><font color="#000000"><%=profesorBean.getNombre()%> 
                                              <%=profesorBean.getApellidos()%></font></td>
                                          </tr>
                                          <tr valign="top"> 
                                            <td height="29" align="left" class="T10L"><font color="#000000">Asignatura:</font></td>
											<%--Nombre Asignatura--%>
                                            <td align="left" valign="middle" class="T10L"><font color="#000000"><%=asignaturaBean.getNombreAsig()%></font></td>
                                          </tr>
                                          <tr valign="top"> 
                                              <td width="191" height="36" class="T10L" align="left"><font color="#000000">Nombre y Apellidos:</font></td>
                                              
                <td width="308" align="left" valign="middle"><input  name="alumno" type="text" size="30" maxlength="100" /></td>
                                            </tr>
                                            <tr valign="top"> 
                                              <td height="43" align="left" class="T10L"><font color="#000000">Correo 
                                                UCO (a11aaaaa@uco.es):</font></td>
                                              <td align="left" valign="middle" ><input name="correo" type="text" size="15" maxlength="20" /></td>
                                            </tr>
                                            <tr valign="top"> 
                                              <td class="T10L"><font color="#000000">Motivo Tutoría:</font></td>
                                              <td><textarea  name="motivo" cols="40" rows="10"></textarea></td>
                                            </tr>
                                        </table>
                                        <table cellpadding="2">
                                          <tr> 
										    <%--Mensaje--%>
                                            <td height="31" align="center" class="T10L"><%=messageBean.getMsg()%></td>
                                          </tr>
                                          <tr align="center"> 
                                            <td width="493" align="center"><input name="solicitar" type="submit"  value="Solicitar" class="boton"> </td>
                                          </tr>
                                        </table>
                                      </form> 
 <%-- Incluimos el pie de pagina --%>
 <jsp:include page="../view/pie.jsp"/>
</body></html>