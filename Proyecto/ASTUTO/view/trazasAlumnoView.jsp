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
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>
<jsp:useBean id="trazasAlumnosBean" class="uco.interfaz.TrazasAlumnosBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>

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
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<a name="inicio"></a>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="99%">
  <tbody><tr>
      <td class="T24" align="right"><font color="#ffffff">T&nbsp;r&nbsp;a&nbsp;z&nbsp;a&nbsp;s&nbsp; 
        A&nbsp;l&nbsp;u&nbsp;m&nbsp;n&nbsp;o&nbsp; </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
 						                
                                    <table border="0" cellspacing="0" cellpadding="4" width="97%" >
            <tbody>
              <tr> 
			  <%--Datos del alumno--%>
                <td width="3%" align="left" class="T12">&nbsp;</td>
                <td width="46%" align="left" class="T12"><font color="#8c1229"><b>Correo: 
                  </b><%=alumnoBean.getCorreo()%> </font></td>
                <td width="51%" align="left" class="T12"><font color="#8c1229"><b>Nombre: 
                  </b><span><%=alumnoBean.getNombre()%></span></font></td>
              </tr>
              <tr> 
                <td colspan="3" align="left" class="T12"><font color="#8c1229"><img src="../images/encabezado_w2a.gif" width="487" height="14"></td>
              </tr>
            </tbody>
          </table>
                                      
          <table  width="513" height="73"  align="center" >
            <tr valign="middle"> 
                                        <td width="59" height="23" class="T10" align="left"><strong><font color="#8c1229">Actividad</font></strong></td>
                                        <td width="43" class="T10"><strong><font color="#8c1229">Acci&oacute;n</font></strong></td>
                                        <td width="47" class="T10"><strong><font color="#8c1229">Fecha</font></strong></td>
                                        <td align="left" class="T10"><strong><font color="#8c1229">Hora</font></strong></td>
                                        <td align="left" class="T10"><strong><font color="#8c1229">Profesor</font></strong></td>
                                        <td align="left" class="T10"><strong><font color="#8c1229"><strong>Asignatura</strong></font></strong></td>
                                        
              <td align="left" class="T10"><strong><font color="#8c1229">Fecha 
                Petici&oacute;n</font></strong></td>
              <td align="left" class="T10"><strong><font color="#8c1229">Hora 
                Petici&oacute;n</font></strong></td>
            </tr>
									  <%--Lista de las trazas del alumno seleccionado--%>
                                      <%String color ="#FFFDE5";%>
                                      <% for (int i=0; i<peticionTutBean.getContador(); i++) {
                                       if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
                                      <tr valign="middle" bgcolor="<%=color%>"> 
              							<td height="20" class="T9L"><font color="#8c1229"><%=trazasAlumnosBean.getActividad(i)%></font></td>
                                        <td class="T9L"><font color="#8c1229"><%=trazasAlumnosBean.getAccion(i)%></font></td>
										<%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		 								 String FechaTraza = formato.format(trazasAlumnosBean.getFecha(i));%>
										
                                        <td class="T9L"><font color="#8c1229"><%=FechaTraza%></font></td>
                                        <td width="30" class="T9L" ><font color="#8c1229"><%=trazasAlumnosBean.getHora(i)%></font></td>
                                        <td width="53" class="T9L" ><%=profBean.getNombre(i)%> <%=profBean.getApellidos(i)%></td>
                                        <td width="68" class="T9L" ><%=asignaturaBean.getNombre(i)%></td>
										<%
										String cadenaFecha =null;
										if (trazasAlumnosBean.getFechaPeticion(i)!=null)
										{
										 cadenaFecha = formato.format(trazasAlumnosBean.getFechaPeticion(i));
										}%>
                                        <td width="83" class="T9L" ><%if (trazasAlumnosBean.getFechaPeticion(i)!=null){%><%=cadenaFecha%><%}%></td>
                                        <td width="86" class="T9L" ><%if (trazasAlumnosBean.getHoraInicio(i)!=null){%><%=trazasAlumnosBean.getHoraInicio(i)%>:<%if (trazasAlumnosBean.getMinutosInicio(i)==0){%>00<%}else{%><%=trazasAlumnosBean.getMinutosInicio(i)%><%}}%></td>
                                      </tr>
									  <%
									  //Cuando cambia la petición se deja un espacio vacio
									 if (i!=(peticionTutBean.getContador()-1))
									 {
									    if (trazasAlumnosBean.getPetTut(i)!=trazasAlumnosBean.getPetTut(i+1))
									  	{%>
											<tr valign="top" > 
												<td height="20"><font color="#8c1229">&nbsp;</font></td>
												<td class="T10"><font color="#8c1229">&nbsp;</font></td>
                                        		<td class="T10"><font color="#8c1229">&nbsp;</font></td>
                                        		<td width="30" class="T10" ><font color="#8c1229">&nbsp;</font></td>
                                      
                                        	    <td width="53" class="T10" >&nbsp;</td>
											    <td width="68" class="T10" >&nbsp;</td>
											    <td width="83" class="T10" >&nbsp;</td>
											    <td width="86" class="T10" >&nbsp;</td>
											</tr>
										<%}
									  }
                                      }%>
                                    </table>
          <%-- Incluimos el pie de pagina --%>
          <p align="center"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a>	
          </p>
          <jsp:include page="../view/pie.jsp"/>
</body></html>