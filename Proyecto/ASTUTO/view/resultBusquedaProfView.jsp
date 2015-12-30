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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>

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
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
<td class="T24" align="right"><font color="#ffffff">A&nbsp;s&nbsp;i&nbsp;g&nbsp;n&nbsp;a&nbsp;t&nbsp;u&nbsp;r&nbsp;a&nbsp;s&nbsp;
	  </font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td class="T10a"> 
 
         <table cellpadding="4" cellspacing="0">  <tbody>
                            <tr valign="top"> 
									<%--Extraigo el identificador de la operación a realizar--%>
                                    <td><%String opcion=request.getParameter("opcion");%>
									<%-- Si la opcion es igual a null (cuando hemos hecho un busqueda con parametros --%>
									<%if (opcion==null) 
									 {%>
                                        <TABLE bgcolor="#d69e00" width="100%"><TBODY>
                                            <TR> 
                                                <td class="T10" align="LEFT"><b><font color="#ffffff">&nbsp;Criterios de Búsqueda</font></b></td>
                                            </TR>
                                          </TBODY> </TABLE>
                                      <%-- criterios de la busqueda --%>
                                      <TABLE cellSpacing="2" cellPadding="2"width="461" align="center"> <TBODY>
                                          <TR> 
                                            <TD class="T10L" vAlign="top" width="20%">Nombre:</TD>
								            <TD class="T10L" vAlign="top" width="80%"><%=request.getParameter("nombre")%></TD>
                                          </TR>
                                          <TR> 
                                            <TD class="T10L" vAlign="top" width="20%">Apellidos:</TD>
                                            <TD class="T10L" vAlign="top" width="80%"><%=request.getParameter("apellido")%></TD>
                                          </TR>
										   <TR> 
                                            <TD class="T10L" vAlign="top" width="20%">Asignatura:</TD>
                                            <TD class="T10L" vAlign="top" width="80%"><%=request.getParameter("asignatura")%></TD>
                                          </TR>  
                                        </TBODY> </TABLE>
                                      <%}%>  
								      <table style="margin-left: 12pt;"><tbody>
                                          <tr>
                                            <td>&nbsp; </td>
                                          </tr>
                                          <tr> 
                                            <td><font class="T14V" color="#8c1233">&nbsp;&nbsp;Resultados:</font></td>
                                          </tr>
                                          <TR> 
                                            <TD><img src="../images/encabezado_w2a.gif" width="480" height="11"><a href="../controller/buscarProfController.jsp"><IMG border=0 alt=Volver src="../images/encabezado_w2b.gif" width=10 height=11 title="Atrás"></a></TD>
                                          </TR>
                                        </tbody></table>										
                                      <p>
									  <%--Lista de profesores y asignaturas--%>
                                        <% for (int i=0; i<profBean.getContador(); i++) {%>
                                      </p>
                                       
                                      <TABLE cellSpacing="2" cellPadding="2" width="443" align="center">   <TBODY>
                                          <TR vAlign="top"> 
                                            <TD width="8"  class="T15"><IMG src="../images/cir.gif" width="12" height="14"></TD>
                                            <TD width="421" class="T15"><font color="#000000"><%=profBean.getNombre(i)%>&nbsp;<%=profBean.getApellidos(i)%></font> </a></TD>
                                          </TR>
                                      </tbody></TABLE>
                                        
 										<%for(int j=0;j<profBean.getContadorAsig(i);j++){%>
									  <TABLE cellSpacing="2" cellPadding="2" width="412" align="center"> <TBODY>
                                          <TR vAlign="top"> 
                                            <TD width="10">&nbsp;</TD>
                                            <TD width="13"><IMG alt="" src="../images/op_a2.gif"></TD>
                                            <TD class="T10" width="369"><a href="../controller/perfilProfesorController.jsp?idProf=<%=profBean.getId(i)%>&idAsignatura=<%=profBean.getIdAsignatura(i,j)%>"> 
											<font color="#000000"><%=profBean.getAsignatura(i,j)%> (<%=profBean.getTitulacion(i,j)%>)</font> </a></TD>
                                          </TR>                             
                                      </tbody></TABLE>
									  <%}
								      }%>
                                 </td>
                          </tbody>
                        </table>
 <%-- Incluimos el pie de pagina --%>		
 <jsp:include page="../view/pie.jsp"/>
</body></html>