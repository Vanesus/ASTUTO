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
<jsp:useBean id="tutoriaDiaBean" class="uco.interfaz.TutoriaDiaBean" scope="session"/>
<jsp:useBean id="excepcionBean" class="uco.interfaz.ExcepcionBean" scope="session"/>
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>

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
        width:120px;
        height:25px;
		}
.boton1{
        width:150px;
        height:25px;
		}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de profesor--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%">
  <tbody><tr>
 <td class="T24" align="right"><font color="#ffffff">D&nbsp;i&nbsp;a&nbsp;r&nbsp;i&nbsp;o&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
       <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
		
        <table border="0" cellpadding="4" cellspacing="0" width="93%">
            <tbody>
		 <tr valign="top">
		        <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Tutorías 
				<%--Dia del mes, junto con el tipo de día que corresponde en el calendario--%>
                  día <%=tutoriaDiaBean.getDia(0)%>/<%=tutoriaDiaBean.getMes(0)%>/<%=tutoriaDiaBean.getAnyo(0)%></font> 
                  <%String tipoCalendario=null;%>
                  <%if (calendarioBean.getTipo(0)!=null){
				  	if (calendarioBean.getTipo(0)==1)
						tipoCalendario="(Día hábil no lectivo)";
					else if (calendarioBean.getTipo(0)==2)
						tipoCalendario="(Día lectivo)";
					else if (calendarioBean.getTipo(0)==3)
						tipoCalendario="(Exámenes)";
					else if (calendarioBean.getTipo(0)==4)
						tipoCalendario="(Fiesta patronal)";
					else if (calendarioBean.getTipo(0)==5)
						tipoCalendario="(Día fectivos)";
					else if (calendarioBean.getTipo(0)==0)
						tipoCalendario="";
				  }%>
                  <font color="#8c1229"> <%=tipoCalendario%></font> </td>
         </tr> 
		 <tr>
		        <td colspan="3"><img src="../images/encabezado_w2a.gif" width="480" height="12" /><a href="../controller/diarioTutoriasController.jsp?m=0"><img src="../images/encabezado_w2b.gif" alt="Volver" width="10" height="11" border="0" title="Atrás" /></a> 
              </tr>
		 <tr valign="top">
	        <td class="T9L"> <center><%=messageBean.getMsg()%></font></center></td>
	     </tr>
		<tr valign="top">
	            <td height="400"> 
                  <table  width="490" align="center" >
                <tr valign="top"> 
                    <td width="80" class="T12"><font color="#8c1229">Hora</font></td>
                    <td width="180" class="T12"><font color="#8c1229">Alumno</font></td>
                    <td width="200" class="T12"><font color="#8c1229">Asignatura</font></td>
					<td width="20" class="T12">&nbsp;</td>
                </tr>
					<%String color ="#FFFDE5";
					   if(messageBean.getMsg()==""){
					   //Lista de peticiones de tutorías que hay asignadas para ese día
                        for (int i=0; i<tutoriaDiaBean.getContador(); i++){
							if(i%2==0) color="#FFE0B1";
							else color ="#FFF5E4";%>
                             <tr valign="top" bgcolor="<%=color%>"> 
                                <td width="80" class="T10"><font color="#8c1229"><%=tutoriaDiaBean.getHoraInicio(i)%>:<%if (tutoriaDiaBean.getMinutosInicio(i)==0){%>00<%}else{%><%=tutoriaDiaBean.getMinutosInicio(i)%><%}%>&nbsp;-&nbsp;<%= tutoriaDiaBean.getHoraFin(i)%>:<%if (tutoriaDiaBean.getMinutosFin(i)==0){%>00<%}else{%><%=tutoriaDiaBean.getMinutosFin(i)%><%}%></font></td>
								<td width="180" class="T10"><font color="#8c1229"><%=tutoriaDiaBean.getnombreAlumno(i)%></font></td>
								<td width="200" class="T10"><font color="#8c1229"><%=tutoriaDiaBean.getAsignatura(i)%></font></td>
								
                      <td width="20" class="T10"><font color="#8c1229"><a href="../view/verTutoriaView.jsp?i=<%=i%>"><img src="../images/ver.gif" width="21" height="23" border="0"></a></font></td>
							 </tr>
						<%} }%>
		</table>
		<table>
		  <tr>
		     <td>&nbsp;</td>
		  </tr>
		  <tr>
		     <td width="490"align="center"><form name="form1" method="post" action="">
                          <a href="../controller/asignarTutoriaController.jsp" rel="gb_page[450,500]" class="boton"><input  class="boton" type="submit" name="Submit" value="Asignar nueva"></a>
                        </form></td>
		   </tr>
		   <tr>
		     <td height="50">&nbsp;</td>
		  </tr>
		</table>
	  <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
		 <tr valign="top">
		   <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Horario de Tutorías: </font> </td>
		 </tr>
		 <%--Tipo de excepción si la hay--%>
		 <%if(excepcionBean.getTipo()!=0){
				Integer t=excepcionBean.getTipo();
				String tipo="";
				 if(t==1) tipo="No asignar tutorías este día.";
				 if(t==2) tipo="Horario de tutorías cambiado.";%>				
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/op_a1.gif" width="13" height="13" ><font color="#8c1229"> <%=tipo%>
				<%--Si el tipo es cambio de horario se muestra el horario de tutoría para ese día--%>
				 <%if(t==2){%> ->  <%=excepcionBean.gethInicio()%>:<%if (excepcionBean.getmInicio()==0){%>00<%}else{%><%=excepcionBean.getmInicio()%><%}%> a <%=excepcionBean.gethFin()%>:<%if(excepcionBean.getmFin()==0){%>00<%}else{%><%=excepcionBean.getmFin()%><%}}%></font></td>
				 
			</tr>
			<tr>
				        <td width="490" height="33"align="center">
							<form name="form1" method="post" action="">
                            <a href="../controller/excepcionDiaController.jsp?opcion=eliminar&id=<%=excepcionBean.getId()%>" rel="gb_page[450,400]" class="boton">
                            <input  class="boton1" type="submit" name="Submit2" value="Eliminar Excepción">
                            </a> </form></td>
			</tr>
			<%}else{%>
			<tr>
	  		    <td class="T10"> <font color="#8c1229"><center> <%=messageBean.getUrl()%> </center></font></td>
	 	   </tr>
		   <%if(messageBean.getUrl()==""){%>
		   <%--Mostrar el horario de tutoría si hay asignado para ese día y hora hay ninguna excepción--%>
		   <tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/op_a1.gif" width="13" height="13" ><font color="#8c1229"> Horario: <%=excepcionBean.gethInicio()%>:<%if (excepcionBean.getmInicio()==0){%>00<%}else{%><%=excepcionBean.getmInicio()%><%}%> a <%=excepcionBean.gethFin()%>:<%if(excepcionBean.getmFin()==0){%>00<%}else{%><%=excepcionBean.getmFin()%><%}%></font></td>
			</tr>
		   <%}%>
		    <tr>
				<td width="490"align="center">
							<form name="form1" method="post" action="">
                            <a href="../controller/excepcionDiaController.jsp" rel="gb_page[450,400]" class="boton">
                            <input  class="boton1" type="submit" name="Submit2" value="Añadir Excepción">
                            </a> </form></td>
		   </tr>
		   <%}%>
		</table>
 </td>
         </tr></table>
 <%-- Incluimos el pie de pagina --%>		                                                                                                               
 <jsp:include page="../view/pie.jsp"/>
</body></html>