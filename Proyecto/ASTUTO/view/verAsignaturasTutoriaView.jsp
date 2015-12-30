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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

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
  
  <p align="center" class="T30 Estilo2 Estilo3"><strong> Configuraci&oacute;n 
    Horario Tutor&iacute;a</strong></p>
	<%--Datos extraidos del formulario--%>
	<%String dia = request.getParameter("dia");%>
	<%String horaInicio = request.getParameter("horaInicio");%>
  <%--mensaje--%>
  <p align="center" class="T9L"><%String mensaje = messageBean.getMsg();%><%=mensaje%></p>
  
   <form target="_top" method="post" action="../controller/configuracionTutController.jsp">
    <table  width="450" height="56"  align="center" 	>
      <tr valign="top"> 
        <td width="71" height="23" class="T10"><div align="left"><strong><font color="#8c1229">Hora</font></strong></div></td>
        <td width="86" class="T10"><strong><font color="#8c1229">Fecha</font></strong></td>
        <td width="208" class="T10"><div align="left"><strong><font color="#8c1229">Asignatura</font></strong></div></td>
        <td colspan="2" class="T10"> <div align="left"><strong><font color="#8c1229">Opciones</font></strong></div></td>
      </tr>
      <%String color ="#FFE0B1";%>
	  <%--Lista de asignaturas que tienen horario asignado para ese día y a esa hora--%>
      <%for (int i=0; i<asignaturaProfBean.getContador(); i++)
   	   {
	   if(i%2==0) color="#FFE0B1";
	   else color ="#FFF5E4";%>
	   <%--Datos del horario junto con el nombre de la asignatura--%>
      <tr align="left"  valign="middle"bgcolor="<%=color%>"> 
        <td width="71" height="25" class="T9L">
		<%=configuracionTutBean.getHoraInicio (i)%>:<%if(configuracionTutBean.getMinutosInicio(i)==0){%>00<%}else%><%=configuracionTutBean.getMinutosInicio(i)%> - <%=configuracionTutBean.getHoraFin (i)%>:<%if(configuracionTutBean.getMinutosFin(i)==0){%>00<%}else%><%=configuracionTutBean.getMinutosFin(i)%> 
        </td>
		<%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		String FechaFin = formato.format(configuracionTutBean.getFechaFin(i));
		String FechaInicio = formato.format(configuracionTutBean.getFechaInicio(i));%>
										
        <td width="86" height="25" class="T9L"><%=FechaInicio%> al <%=FechaFin%> </td>
        <td width="208" height="25" class="T9L">&nbsp;<%=asignaturaProfBean.getAsignatura(i)%> 
          (<%=profBean.getTitulacion(i,0)%>)</font></td>
        <td width="29" class="T9L" align="center"><a href="../controller/configuracionTutController.jsp?asignatura=<%=asignaturaProfBean.getId(i)%>&opcion=<%="editar"%>&dia=<%=dia%>&horaInicio=<%=horaInicio%>" rel="gb_page[600,500]"><img src="../images/edit.gif" width="20" height="21" border="0"  title="Editar"/></a></font></td>
        <td width="32" class="T9L" align="center"><a href="../controller/configuracionTutController.jsp?asignatura=<%=asignaturaProfBean.getId(i)%>&opcion=<%="borrar"%>&dia=<%=dia%>&horaInicio=<%=horaInicio%>" rel="gb_page[600,500]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
      </tr>
      <%}%>
    </table>
    <p>&nbsp;</p>	
    <input type="submit" name="Submit" value=Salir class="boton1" />
  </form>
  <p><font color="#8c1229"> 
    <tr>
      <td>&nbsp; </td>
    </tr>
    </font></p> 
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  <p align="center" class="T10L"  >&nbsp;</p>
</center>
</body>
</html>
