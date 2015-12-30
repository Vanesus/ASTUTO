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
<jsp:useBean id="centroBean" class="uco.interfaz.CentroBean" scope="session"/>
<jsp:useBean id="estDocenteBean" class="uco.interfaz.EstDocenteBean" scope="session"/>

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
        width:100px;
        height:25px;
	   }
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%">
  <tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">E&nbsp;s&nbsp;t&nbsp;r&nbsp;u&nbsp;c&nbsp;t&nbsp;u&nbsp;r&nbsp;a&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td height="465"> 
        <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
        <td height="459"><img src="../images/p.gif" width="15" height="1"></td>
        <td class="T10a"> 
         <table width="862" border="0" cellpadding="4" style="width: 459px; height: 200px;">
            <tbody>
                                <tr valign="top"> 
                                  <td width="850" height="420"> 
								   <%--Extraigo el identificador de la estructura docente y la opcion--%>
                                    <%String idEstDocente = request.getParameter("idEstDocente");%>
                                    <%String opcion = request.getParameter("opcion");%>
									<%--si es un centro--%>
                                    <%if(idEstDocente ==null && opcion==null)
									{%>
                                    <table style="MARGIN-LEFT: 10pt" border="0"> <tbody>
                                        <tr> 
                                          <td width="352"><font class="T14V" color="#8c1233">Primer Nivel Estructuras Docentes</font></td>
                                        </tr>
                                      </tbody> </table>
                                    
                  <table width="493" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                      <tr> 
                        <td width="520" height="20"><img src="../images/encabezado_w2a.gif" width="475" height="12" /></td>
                      </tr>
                    </tbody>
                  </table>
                  <%}%>
				  					<%--Si es titulacion o centro--%>
                                    <%if(idEstDocente !=null && opcion==null){%>
                                    <table style="MARGIN-LEFT: 10pt" border="0">
                                      <tbody>
                                        <tr> 
                                          <td><font class="T14V" color="#8c1233"><%=estDocenteBean.getNombre()%></font></td>
                                        </tr>
                                      </tbody>
                                    </table>
									<%--Si es titulación--%>
									<%if(estDocenteBean.getIdAntes()==null){%>
                                    
                  <table width="493" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                                        <tr> 
                                          
                        <td width="520" height="20"><img src="../images/encabezado_w2a.gif" width="475" height="12" /><a href="../controller/estDocenteController.jsp" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                        </tr>
                                      </tbody>  </table>
									  <%}else{%>
									  <table border="0" cellspacing="0" cellpadding="0"><tbody>
                                        <tr>
                                          
                        <td height="27"><img src="../images/encabezado_w2a.gif" width="475" height="12" /><a href="../controller/estDocenteController.jsp?idEstDocente=<%=estDocenteBean.getIdAntes()%>" target="_top"><img border="0" alt="Volver" src="../images/encabezado_w2b.gif" width="10" height="11" title="Atrás" /></a></td>
                                          
                                        </tr>
                                      </tbody>  </table>
                                    
                  <%}}%>
                  <table  width="342" align="center"   >
                                      <tr valign="top"> 
                                        <td width="268" height="23" class="T10"> <strong><font color="#8c1229">Estructura Docente </font></strong></td>
                                        <td colspan="2" class="T10"> <strong><font color="#8c1229">Opciones</a></font></strong></td>
                                      </tr>
									  <%--Lista de Estructuta docente (centros, titulación y curso)--%>
                                      <%String color ="#FFFDE5";%>
                                      <% for (int i=0; i<centroBean.getContador(); i++){
									   if(i%2==0) color="#FFE0B1";
									   else color ="#FFF5E4";%>
                                      <tr valign="middle" bgcolor="<%=color%>"> 
                                        <td width="268" height="25" class="T9L"> 
										<%--Si es centro o titulación y tiene subestructuras centro--%>
                                          <%if(idEstDocente ==null || estDocenteBean.getIdAntes()==null || opcion!=null){%> 
                                          <a class="T9L" href="../controller/estDocenteController.jsp?idEstDocente=<%=centroBean.getId(i)%>" > 
                                          <%}%>
                                          &nbsp;&nbsp;<%=centroBean.getCentro(i)%></font></a></td>
										  <%--Botones de opcion--%>
                                        <td width="29" class="T10" align="center"><font color="#8c1229"><a href="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=centroBean.getId(i)%>&idEstDocenteAntes=<%=idEstDocente%>&opcion=<%="editar"%>" rel="gb_page[450,400]"><img src="../images/edit.gif" width="20" height="21" border="0" title="Editar" /></a></font></td>
                                        <td width="29" class="T10" align="center"><font color="#8c1229"><a href="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=centroBean.getId(i)%>&idEstDocenteAntes=<%=idEstDocente%>&opcion=<%="borrar"%>" rel="gb_page[450,400]"><img src="../images/borrar.gif" width="20" height="23" border="0" title="Eliminar" /></a></font></td>
                                      </tr>
                                      <%}%>
                                    </table>
									<%-- si es centro o titulación--%>
                                    <%if(idEstDocente ==null || estDocenteBean.getIdAntes()==null || opcion!=null){%>
                                    
                  <p align="center" class="T8L" >Puedes navegar por la estructura 
                    docente haciendo click en su nombre.</p>
                                    <%}else{%>
									<p align="center">&nbsp;</p>
									
                  <%}%>
                  <table  width="399" align="center" 	>
                    <tr valign="top"> 
                      <%if (opcion==null){%>
                      <center>
                        <td width="116" height="263">&nbsp;</td>
                      </center>
                      <td width="124" align="center"> 
                        <% if(idEstDocente==null) {%><%--crear nuevo desde los centros--%>
                        <form name="form1" id="form1" method="post" action="../controller/mantenimientoEstDocenteController.jsp?opcion=<%="nuevo"%>">
                          <a href="../controller/mantenimientoEstDocenteController.jsp?opcion=<%="nuevo"%>" rel="gb_page[450,400]"> 
                          <input type="submit" name="Submit" value="Crear Nueva" class="boton" />
                          </a> 
                        </form>
                        <%}
					else
					{%><%--crear nuevo desde las titulacionesy cursos--%>
                        <form name="form2" id="form2" method="post" action="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=idEstDocente%>&opcion=<%="nuevo"%>">
                          <p><a href="../controller/mantenimientoEstDocenteController.jsp?idEstDocente=<%=idEstDocente%>&opcion=<%="nuevo"%>" rel="gb_page[450,400]"> 
                            <input type="submit" name="Submit2" value="Crear Nueva" class="boton" />
                            </a> </p>
                        </form>
                        <%}
					} else {%>
                        <form name="form3" id="form3" method="post" action="../controller/mantenimientoEstDocenteController.jsp?opcion=<%="nuevo"%>">
                          <a href="../controller/mantenimientoEstDocenteController.jsp?opcion=<%="nuevo"%>" rel="gb_page[450,400]S"> 
                          <input type="submit" name="Submit3" value="Crear Nueva" class="boton" />
                          </a> 
                        </form>
                        <%}%>
                      </td>
					  <%--descargar pdf listado--%>
                      <td width="143" align="right"><a href="../controller/imprimirEstDocController.jsp" rel="gb_page[450,400]"><img src="../images/imprimirPDF.gif" border="0"/><span class="T10"><font color="#8c1229"> 
                        Descargar en PDF</font></span></a></td>
                    </tr>
                  </table></tbody>
                            </table>
	<%-- Incluimos el pie de pagina --%>		                                                
    <jsp:include page="../view/pie.jsp"/>
</body></html>