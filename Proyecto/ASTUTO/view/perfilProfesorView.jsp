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
<jsp:useBean id="profesorBean" class="uco.interfaz.ProfesorBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
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
.boton{
        width:140px;
        height:25px;
		}
-->
</style></head>
<body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="555px">  <tbody>
   <tr>
    <td class="T24" align="right"><font color="#ffffff"> P&nbsp;e&nbsp;r&nbsp;f&nbsp;i&nbsp;l&nbsp;&nbsp;P&nbsp;ú&nbsp;b&nbsp;l&nbsp;i&nbsp;c&nbsp;o&nbsp;</font></td>
   </tr>
</tbody> </table></td></tr>
      <tr valign="top">
       <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
				               <table border="0" cellspacing="0" cellpadding="0" width="100%">  <tbody>
                                <tr> 
								    <%-- Escribimos el nombre y apellidos del profesor seleccionado--%>
                                    <td width="500"><font class="T20"><b><%=profesorBean.getNombre()%> <%=profesorBean.getApellidos()%></b></font></td>
                                </tr>
								<tr>
									<td>&nbsp;</td>
                               </tbody> </table>
							    			  <%-- Se muestran todos los datos sobre la información publica del profesor--%>
                                              <table width="495" height="383"> <tbody>
                                                    <tr valign=top> 
                                                      <td height="26" colspan="3" class="T10"><strong>Email :</strong></td>
                                                      <td class="T10" width="395" colspan="2"><%=profesorBean.getEmail()%></td>
                                                    </tr>
                                                    <tr valign="top"> 
                                                      <td height="29" colspan="3" class="T10"><strong>Localización:</strong></td>
                                                      <td class="T10" width="395" colspan="2"><%=profesorBean.getLoc()%></td>
                                                    </tr>
                                                    <tr valign="top"> 
                                                      <td height="49" colspan="3" class="T10"><strong>Informaci&oacute;n Adicional:&nbsp;</strong></td>
                                                      <td class="T10" colspan="2"><p><%=profesorBean.getPerfPub()%></p></td>
                                                    </tr>
                                                    <tr valign="top"> 
                                                      <td height="269" colspan="5" class="T12"> 
                                                        <p><strong>Solicitar tutoría para: </strong>
														<%--Extraigo el identificador del profesor y la asignatura necesarios para la operación a realizar--%>
                                                          <%String idProf =request.getParameter("idProf");
														    String idAsignatura =request.getParameter("idAsignatura");%>
														<%--Mostramos el nombre de la asignatura que hemos seleccionado--%>
                                                          <font color="#8c1229"><font color="#000000"><%=asignaturaBean.getNombreAsig()%></font></font> 
                                                          </p>
													<%if (messageBean.getMsg().equals("No tiene horario de tutoría asignado"))
													{%>
													<%--Mostramos el mensaje--%>
													<%=messageBean.getMsg()%>
													<%-- Si tiene horario de tutoría asignado--%>
													<%}else
													{%>	
														 <form method="post" action="../controller/solicitarTutoriaController.jsp?idProfesor=<%=idProf%>&idAsignatura=<%=idAsignatura%>">
                                                          <table  width="458" align="center" >
                                                            <tr valign="top" border="0" > 
                                                              <td height="23" colspan="2" class="T10"> 
                                                                <font color="#000000"><strong>HorarioTutor&iacute;as:</strong> </font></td>
                                                            </tr>
															<%-- Buscamos que dia de la semana tiene tutoría--%>
                                                            <%String dia=null;
														  for (int i=0;i<configuracionTutBean.getContador();i++)
														  {
														  if (configuracionTutBean.getDia(i)==1)
														  	dia="Lunes";
														  if (configuracionTutBean.getDia(i)==2)
														  	dia="Martes";
														  if (configuracionTutBean.getDia(i)==3)
														  	dia="Miercoles";
														  if (configuracionTutBean.getDia(i)==4)
														  	dia="Jueves";
														  if (configuracionTutBean.getDia(i)==5)
														  	dia="Viernes";
														  if (configuracionTutBean.getDia(i)==6)
														  	dia="Sabado";
														  if (configuracionTutBean.getDia(i)==7)
														  	dia="Domingo";%>
                                                            <tr valign="top"> 
                                                              <td width="54" height="38" rowspan="2" class="T10">&nbsp; </td>
															  <%--Escribemos el día de la semana--%>
                                                              <td width="54" rowspan="2" class="T10"><b><%=dia%></b></td>
															  <%--Mostramos el horario de la tutoría para cada día--%>
                                                              <td width="307" class="T10"><p>De 
                                                                  <%=configuracionTutBean.getHoraInicio(i)%><%if(configuracionTutBean.getMinutosInicio(i)==0){%>:00 
                                                                  <%}else{%>
                                                                  <%=configuracionTutBean.getMinutosInicio(i)%> 
                                                                  <%}%>
                                                                  a <%=configuracionTutBean.getHoraFin(i)%><%if(configuracionTutBean.getMinutosFin(i)==0){%>:00 
                                                                  <%}else{%>
                                                                  <%=configuracionTutBean.getMinutosFin(i)%> 
                                                                  <%}%>
                                                                </p></td>
                                                            </tr>
                                                            <tr valign="top"> 
															<%-- Mostramos el periodo en el que la tutoría es valida --%>
                                                              <%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		  														String cadenaFechaInicio = formato.format(configuracionTutBean.getFechaInicio(i));
		  														String cadenaFechaFin = formato.format(configuracionTutBean.getFechaFin(i));%>
															  <td class="T10" >Desde 
                                                                <%=cadenaFechaInicio%> 
                                                                hasta <%=cadenaFechaFin%> 
                                                              </td>
                                                            </tr>
															<%}%>
                                                            <tbody></table>
                                                          <p>&nbsp;   </p>
                                                          <p align="center"> 
                                                            <input type="submit"value="Solicitar Tutor&iacute;a" align="middle" class="boton">
                                                          </p>
                                                          </form>
                                                        <%}%>
                                                      </td>
															
                                                    </tr>
                                                </table>
	<%-- Incluimos el pie de pagina --%>
    <jsp:include page="../view/pie.jsp"/>					
</body></html>