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
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>

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
</style>
</head><body>
<%-- Incluimos la cabecera y el menu de profesor--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>

<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
                          
      <td class="T24" align="right"><font color="#ffffff"> C&nbsp;o&nbsp;n&nbsp;f&nbsp;i&nbsp;g&nbsp;u&nbsp;r&nbsp;a&nbsp;c&nbsp;i&nbsp;&oacute;&nbsp;n&nbsp;&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
						<%--Datos extraidos del formulario--%>
						  <%String dia = request.getParameter("dia");%>
                              <%String horaInicio = request.getParameter("horaInicio");%>
                            </p>
                      <form  method="post" action="../controller/configuracionSlotController.jsp?opcion=slot">
                              
            <table  width="483" height="75"  align="center" >
              <tr align="left" valign="middle" > 
                                  
                <td width="22" height="32" class="T9L"> 
                  <div align="left"></div></td>
                                  <td width="138" class="T9L"><strong><font color="#8c1229">Asignatura</font></strong></td>
                                  
                <td width="41" height="32" class="T9L"><strong>Slot </strong></td>
                                  <td width="70" class="T9L"><strong>Metodo Asignaci&oacute;n</strong></td>
                                  <td width="49" class="T9L"><strong>T. Max. Espera </strong></td>
                                  <td width="70" class="T9L"><strong>Previsi&oacute;n M&iacute;nima </strong></td>
                                  <td width="61" class="T9L"><strong>N&ordm; Ausencias</strong></td>
                                </tr>
								<%String color ="#FFFDE5";%>
								<%--Lista de todas las asignatura que tiene asignado horario de tutoría junto con los datos de la configuracion global actual--%>
                                <%for (int i=0; i<asignaturaProfBean.getContador(); i++)
								{if(i%2==0) color="#FFE0B1";
								else color ="#FFF5E4";%>
                                <tr align="left" valign="middle" bgcolor="<%=color%>" > 
                                  <td height="23" class="T9L"><div align="left"><font color="#8c1229"> 
                                      <input type="checkbox" name="<%=asignaturaProfBean.getAsignatura(i)%><%=profBean.getTitulacion(i,0)%>" value="<%=asignaturaProfBean.getId(i)%>"/>
                                      </font></div></td>
                                  <td height="23"  class="T9L"><font color="#8c1229"><%=asignaturaProfBean.getAsignatura(i)%> 
                                    (<%=profBean.getTitulacion(i,0)%>) </font></td>
                                  <%String metodoAsignacion=null;
								if (configuracionTutBean.getMetodo(i)==1)
								  metodoAsignacion="Manual";
								else
								  metodoAsignacion="Automatico";%>
                                  <td class="T9"><font color="#8c1229">&nbsp;<%=configuracionTutBean.getSlot(i)%> min</font></td>
                                  <td class="T9"><font color="#8c1229">&nbsp;<%=metodoAsignacion%></font></td>
                                  <td class="T9"><font color="#8c1229">&nbsp;<%=configuracionTutBean.getTiempoEspera(i)%> h</font></td>
                                  <td class="T9"><font color="#8c1229">&nbsp;<%=configuracionTutBean.getPrevisionMinima(i)%> h</font></td>
                                  <td class="T9"><font color="#8c1229">&nbsp;<%=configuracionTutBean.getNAusencias(i)%></font></td>
                                </tr>
                                <%}%>
                              </table>
                              <p align="center" class="T9L"> 
                              <%String mensaje = messageBean.getMsg();%>
							  <%--mensaje--%>
                              <%=mensaje%></p>
							  <%-- Formulario vacio para introducir los datos de la configuracion global que quieres modificar--%>
                              <table  width="313" align="center" >
                                <tr valign="middle" > 
                                  <td width="200" height="35" class="T10L" align="left">Método 
                                      Asignación:</td>
                                  <td width="101" colspan="2" class="T9"> <p align="left"> 
                                      <font color="#8c1229"> 
                                      <select name="metodoAsignacion" id="select4">
                                        <option value="1">Manual</option>
                                        <option value="2">Autom&aacute;tica</option>
                                      </select>
                                      </font></p></td>
                                </tr>
                                <tr valign="middle" >
                                  <td height="32" class="T10L" align="left">Tiempo M&aacute;ximo Espera:</td>
                                  <td colspan="2" class="T9">
                                    <p align="left">
                                      
                    <input name="tiempoMaxEspera" type="text" size="5" maxlength="4" />
                                      <font color="#8c1229"> h</font> </p></td>
                                </tr>
                                <tr valign="middle" > 
                                  <td height="32" class="T10L" align="left">Prevision M&iacute;nima:</td>
                                  <td colspan="2" class="T9"> <p align="left"> 
                                      
                    <input name="previsionMinima" type="text" size="5" maxlength="4" />
                                      <font color="#8c1229"> h</font> </p></td>
                                </tr>
                                <tr valign="middle" > 
                                  <td height="33" class="T10L" align="left">N&uacute;mero 
                                      Ausencias :</td>
                                  <td colspan="2" class="T9"><div align="left"> 
                                      
                    <input name="nAusencias" type="text" size="5" maxlength="4" />
                                    </div></td>
                                </tr>
                                <tr valign="middle" > 
                                  <td height="33" class="T10L" align="left">Slot: </td>
                                  <td colspan="2" class="T9"> <p align="left"> 
                                      
                    <input name="slot" type="text" size="5" maxlength="5" />
                                      <font color="8c1229"><font size="2">min</font></font></p></td>
                                </tr>
                              </table>
                              <p> 
                              </p>
                              <p class="T10L"> 
                                <center>
                                  <input type="submit" name="Submit" value="Guardar Cambios" class="boton" />
                                </center>
                              </p>
                            </form>
<%-- Incluimos el pie de pagina --%>		                                                                                      
<jsp:include page="../view/pie.jsp"/>														
</body></html>