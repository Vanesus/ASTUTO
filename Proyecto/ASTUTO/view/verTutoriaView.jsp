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
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

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
.boton{
        width:140px;
        height:25px;
       }
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de profesor--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>

<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="95%">
           <tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
		<%--Datos extraidos--%>
        <%int i = Integer.parseInt(request.getParameter("i"));%>
		<form name="form1" method="post" action="../controller/guardarCambiosTutController.jsp?id=<%=tutoriaDiaBean.getId(i)%>">
			<table  width="502" align="center" >
			<tr valign="top">
			    <%--Fecha de la tutoría--%>
		        <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Tutorías día <%=tutoriaDiaBean.getDia(0)%>/<%=tutoriaDiaBean.getMes(0)%>/<%=tutoriaDiaBean.getAnyo(0)%></font> </td>
            </tr> 
		    <tr>
		        <td colspan="3"><img src="../images/encabezado_w2a.gif" width="480" height="12" /><a href="../view/diarioTutoriasView.jsp?m=0"><img src="../images/encabezado_w2b.gif" alt="Volver" width="10" height="11" border="0" title="Atrás"/></a> 
              </tr>
			<%--Datos de la petición de tutoría--%>
            <tr> 
                <td class="T12" width="148"><font color="#8c1229">Hora</font></td>
				<td width="342"><%=tutoriaDiaBean.getHoraInicio(i)%>:<%if (tutoriaDiaBean.getMinutosInicio(i)==0){%>00<%}else{%><%=tutoriaDiaBean.getMinutosInicio(i)%><%}%>&nbsp;-&nbsp;<%= tutoriaDiaBean.getHoraFin(i)%>:<%if (tutoriaDiaBean.getMinutosFin(i)==0){%>00<%}else{%><%=tutoriaDiaBean.getMinutosFin(i)%><%}%> </td>
			</tr>
			<tr>
                <td class="T12"><font color="#8c1229">Alumno</font></td>
			    <td><%=tutoriaDiaBean.getnombreAlumno(i)%>
			</tr>
			<tr>
                <td class="T12"><font color="#8c1229">Asignatura</font></td>
				<td> <%=tutoriaDiaBean.getAsignatura(i)%></td>
            </tr>
			<tr>
			    <td class="T12"><font color="#8c1229">Motivo</font></td>
				<td><%=tutoriaDiaBean.getMotivo(i)%></td>
			</tr>
			<tr>
				   <%int estado=tutoriaDiaBean.getEstado(i);%>
			    <td class="T12"><font color="#8c1229">Estado</font></td>
				<%--El estado y el comentario puede ser modificado--%>
				<td> <select name="estado">
					    <OPTION VALUE="1"<%if(estado==1){%>Selected<%}%>>Solicitada</OPTION>
		                <OPTION VALUE="2"<%if(estado==2){%>Selected<%}%>>Enviada</OPTION>
		                <OPTION VALUE="3"<%if(estado==3){%>Selected<%}%>>Confirmada</OPTION>
		                <OPTION VALUE="4"<%if(estado==4){%>Selected<%}%>>Realizada</OPTION>
						<OPTION VALUE="5"<%if(estado==5){%>Selected<%}%>>No Realizada</OPTION>
						<OPTION VALUE="6"<%if(estado==6){%>Selected<%}%>>Incomparescencia</OPTION>
		                </select>
				</td>
			</tr>
			<tr>
			    <td class="T12" valign="top"><font color="#8c1229">Comentario</font></td>
				<td><textarea  name="comentario" cols="40" rows="10"><%if (tutoriaDiaBean.getComentarioProfesor(i)!=null){%><%=tutoriaDiaBean.getComentarioProfesor(i)%><%}%></textarea></td>
			</tr>
			</table>
				<table>
                                <tr align="center"> 
                                  <td width="550" height="60" align="center" class="T10"><input type="submit" value="Guardar Cambios" class="boton">
                                    </td>
                                </tr>
                </table>
        </form>
 <%-- Incluimos el pie de pagina --%>		                             
 <jsp:include page="../view/pie.jsp"/>
</body></html>