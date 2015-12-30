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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>

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
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
 <td class="T24" align="right"><font color="#ffffff"> M&nbsp;i&nbsp;s&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="98%">
         <tbody><tr valign="top">
         <td class="T10a"> 
 
                    <TABLE bgcolor="#d69e00" width="100%"><TBODY>
                       <TR>                        				       
                          <td align="LEFT"><b><font color="#ffffff">&nbsp;Criterios de Búsqueda</font></b></td>
                      </TR>
                    </TBODY></TABLE> 
						<%--  Criterios de busqueda introducidos anteriormente --%>                                  
                                    <TABLE width="352" align=center cellSpacing="4">           <TBODY>
                                        <TR> 
                                          <TD class="T10" width="87"><span class="T10L Estilo2">&nbsp;&nbsp;Asignatura:</span></TD>
                                          <TD class="T10" width="267">
                                            <% String asig=request.getParameter("asignatura");
							    			if(asig.equals("0")){%>
                                            Todas
                                            <%}else{%>
                                            <%=tutoriaDiaBean.getAsignatura(0)%>
                                            <%}%>
                                          </TD>
                                        </TR>
                                        <TR> 
                                          <TD  vAlign="top" width="87" class="T10L Estilo2">&nbsp;&nbsp;Estado:</TD>
                                          <% String estadoStr=null;
											Integer estado=Integer.parseInt(request.getParameter("estado"));
											if(estado==0) estadoStr="Todas";
											if(estado==1) estadoStr="Solicitada";
											if(estado==2) estadoStr="Enviada";
											if(estado==3) estadoStr="Confirmada";
											if(estado==4) estadoStr="Realizada";
											if(estado==5) estadoStr="Incomparescencia";%>
                                          <TD class="T10" vAlign="top" width="267"><%=estadoStr%></TD>
                                        </TR>
                                      </TBODY>  </TABLE>
                                        
	                                
          <table width="510">
            <tbody>
              <tr> 
                <td>&nbsp; </td>
              </tr>
              <tr> 
                <td><font class="T14V" color="#8c1233">&nbsp;&nbsp;Resultados:</font></td>
              </tr>
              <tr> 
                <td height="13"><img src="../images/encabezado_w2a.gif" width="470" height="11"><a href="../controller/misTutoriasController.jsp"><IMG border=0 alt=Volver src="../images/encabezado_w2b.gif" width=10 height=11 title="Atrás"></a></td>
              </tr>
              <tr>
                <td height="18">&nbsp;</td>
              </tr>
            </tbody>
          </table>
										
                                    
          <table  width="513" align="center" >
            <tr valign="top"> 
										<td width="55" class="T10"><font color="#8c1229"><strong>Fecha</strong></font></td>
										<td width="69" class="T10"><font color="#8c1229"><strong>Hora</strong></font></td>
										<td width="52" class="T10"><font color="#8c1229"><strong>Alumno</strong></font></td>
										<td width="136" class="T10"><font color="#8c1229"><strong>Asignatura</strong></font></td>
										<td width="52" class="T10"><font color="#8c1229"><strong>Estado</strong></font></td>
										<td width="21" class="T10">&nbsp;</td>
									</tr>
					<%String color ="#FFFDE5";
					   if(messageBean.getMsg()==""){
					   //Lista de peticiones de tutorías que cumplan los criterios de busqueda
                        for (int i=0; i<tutoriaDiaBean.getContador(); i++){
							if(i%2==0) color="#FFE0B1";
							else color ="#FFF5E4";%>
                             <tr valign="top" bgcolor="<%=color%>"> 
							    <td width="55" class="T10"><font color="#8c1229"><%if (tutoriaDiaBean.getDia(i)!=null){%><%=tutoriaDiaBean.getDia(i)%>/<%=tutoriaDiaBean.getMes(i)%>/<%= tutoriaDiaBean.getAnyo(i)%><%}%></font></td>
                                <td width="69" class="T10"><font color="#8c1229"><%if (tutoriaDiaBean.getHoraInicio(i)!=null){%><%=tutoriaDiaBean.getHoraInicio(i)%>:<%if (tutoriaDiaBean.getMinutosInicio(i)==0){%>00<%}else%><%=tutoriaDiaBean.getMinutosInicio(i)%>-<%= tutoriaDiaBean.getHoraFin(i)%>:<%if (tutoriaDiaBean.getMinutosFin(i)==0){%>00<%}else%><%=tutoriaDiaBean.getMinutosFin(i)%><%}%></font></td>
								<td width="52" class="T10"><font color="#8c1229"><%=tutoriaDiaBean.getcorreoAlumno(i)%></font></td>
								<td width="136" class="T10"><font color="#8c1229"><%=tutoriaDiaBean.getAsignatura(i)%> (<%=profBean.getTitulacion(i,0)%>)</font></td>
								<%String NombreEstado=null;
								  if (tutoriaDiaBean.getEstado(i)==1)
									NombreEstado="Solicitada";
								  if (tutoriaDiaBean.getEstado(i)==2)
									NombreEstado="Enviada";
								  if (tutoriaDiaBean.getEstado(i)==3)
									NombreEstado="Confirmada";
								  if (tutoriaDiaBean.getEstado(i)==4)
									NombreEstado="Realizada";
								  if (tutoriaDiaBean.getEstado(i)==5)
									NombreEstado="No Realizada";
								  if (tutoriaDiaBean.getEstado(i)==6)
									NombreEstado="Incomparescencia";%>
								<td width="52" class="T10"><font color="#8c1229"><%=NombreEstado%> </font></td>
								<%if (tutoriaDiaBean.getEstado(i)==1)//Estado solicitada
								{%>
									<td width="21" class="T10" align="center"><font color="#8c1229"><a href="../controller/modificarTutoriaController.jsp?i=<%=i%>&opcion=aceptar&asig=<%=asig%>&estado1=<%=estado%>" rel="gb_page[500,470]"><img src="../images/Aceptar.png" width="20" height="20" border="0" title="Asignar tutoría manual" /></a></font></td>
								<%}	else{%>
									<td width="21" class="T10" align="center"><font color="#8c1229"><img src="../images/Aceptar%20-%20enabled.png" width="20" height="20" border="0" title="Tutoría asignada" /></a></font></td>
								<%}%>
								<%if (tutoriaDiaBean.getEstado(i)<=3 && tutoriaDiaBean.getEstado(i)!=1){%><%--Estado confirmada o enviada.--%> 
									<td width="21" class="T10" align="center"><font color="#8c1229"><a href="../controller/modificarTutoriaController.jsp?i=<%=i%>&opcion=modificar&asig=<%=asig%>&estado1=<%=estado%>" rel="gb_page[500,470]"><img src="../images/edit.gif" width="20" height="20" border="0" title="Editar" /></a></font></td>
                                <%}	else		{%>
									    <td width="21" class="T10" align="center"><font color="#8c1229"><img src="../images/edit%20-%20enabled.gif" width="20" height="21" border="0" title="Tutoría no asignada" /></a></font></td>
                                <%}%>
								<td width="21" class="T10" align="center"><font color="#8c1229"><a href="../controller/modificarTutoriaController.jsp?i=<%=i%>&opcion=borrar&asig=<%=asig%>&estado1=<%=estado%>" rel="gb_page[500,470]"><img src="../images/borrar.gif" width="20" height="20" border="0" title="Eliminar" /></a></font></td>
							 </tr>
						<%} }%>
           </table>             
 <%-- Incluimos el pie de pagina --%>		
 <jsp:include page="../view/pie.jsp"/>
</body></html>