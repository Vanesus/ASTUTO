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
<jsp:useBean id="datosProfBean" class="uco.interfaz.DatosProfBean" scope="session"/>
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>
<jsp:useBean id="asignaturaBean" class="uco.interfaz.AsignaturaBean" scope="session"/>

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
         <table border="0" cellpadding="4" cellspacing="0"> <tbody>
                            <tr valign="top"> 
                                    <td> <TABLE width="269">
                    <TBODY>
                      <TR> 
                        <TD width="17">&nbsp; </TD>
						<%--Escribe el nombre del centro--%>
                        <TD width="240"><FONT class="T14V" color="#8c1233"><%=estDocenteBean.getNombreCentro()%></FONT> 
                        </TD>
                      </TR>
                    </TBODY>
                  </TABLE>
                                       <TABLE><TBODY>
                                            <TR> 
                                              <TD><IMG src="../images/encabezado_w2a.gif" width="504" height="11"><A href="../controller/peticionTutController.jsp" target=_top><IMG border=0 alt=Volver src="../images/encabezado_w2b.gif" width=10 height=11 title="Atrás"></A></TD>
                                            </TR>
                                          </TBODY>  </TABLE>
                                      </DIV>
                                      <TABLE cellSpacing="2" cellPadding="2"width="461" align="center"> <TBODY>
                                          <TR> 
										    <%--Escribe el nombre de la titulación--%>
                                            <TD class="T10" vAlign="top" width="20%"><strong>Titulaci&oacute;n:</strong></TD>
                                            <TD class="T10"vAlign="top" width="80%"><%=estDocenteBean.getNombreTit()%></TD>
                                          </TR>
                                          <TR> 
										    <%--Escribe el nombre del curso--%>
                                            <TD class="T10" vAlign="top" width="20%"><strong>Curso:</strong></TD>
                                            <TD class="T10" vAlign="top" width="80%"><%=estDocenteBean.getNombreCurso()%> </TD>
                                          </TR>
                                        </TBODY> </TABLE>
								  <%-- Va escribiendo las titulaciones que se imparten en el curso seleccionado.--%>
                                   <% for (int i=0; i<asignaturaBean.getContador(); i++)  {%>
                                      <TABLE border="0" cellSpacing="2" cellPadding="2" width="443" align="center">    <TBODY>
                                          <TR vAlign="top"> 
                                            <TD width="8"  class="T15"><IMG src="../images/cir.gif" alt="" width="12" height="14"></TD>
                                            <TD width="421" class="T15" ><%=asignaturaBean.getNombre(i)%></TD>
                                          </TR>
                                      </TABLE>
									  <%--Para cada asignatura muestra el nombre y apellidos de los profesores que la imparte--%>
                         			  <% for (int j=0; j<datosProfBean.getContador(i); j++)  {%>
                                      <BR>
                                      <TABLE border="0" cellSpacing="2" cellPadding="2" width="412" align="center">
                                        <TBODY>
                                          <TR vAlign="top"> 
                                            <TD width="10">&nbsp;</TD>
                                            <TD width="13"><IMG src="../images/op_a2.gif"></TD>
											<%-- El nombre y apellidos de cada profesor es un enlace a su perfil--%>
                                            <TD class="T10" width="369"> <DT><a href="../controller/perfilProfesorController.jsp?idProf=<%=datosProfBean.getId(i,j)%>&idAsignatura=<%=asignaturaBean.getId(i)%>"> 
                                                <font color="#000000"><%=datosProfBean.getNombre(i,j)%> 
                                                <%=datosProfBean.getApellidos(i,j)%></font></a></TD>
                                          </TR>
                                      </TABLE>
                                      <%}
                                     }%>
                                     </td>
                          </tbody>
                        </table>
	<%-- Incluimos el pie de pagina --%>
	<jsp:include page="../view/pie.jsp"/>
 </body></html>