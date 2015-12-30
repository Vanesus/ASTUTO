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
        width:80px;
        height:25px;
		}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de profesor --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>

<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
                          <td class="T24" align="right"><font color="#ffffff"> 
                            M&nbsp;i&nbsp;s&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
 
<form name="busqueda" method="post" action="../controller/misTutoriasController.jsp">				
          <table width="100%" cellpadding="4"><tbody>
		    <tr valign="top"> 
                <td colspan="3"><img src="../images/p.gif" width="15" height="1"></td>
			</tr>
            <tr> 
                <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Búsqueda</font></td> 
			</tr>
            <tr> 
                <td colspan="2"><IMG src="../images/encabezado_w2a.gif" width="450"></TD>
            </tr>
            <tr> 
               <td class="T10" colspan="3" align="LEFT" bgcolor="#d69e00"><b><font color="#ffffff">Selección de criterios </font></b></td>
            </tr>
			<tr>
			    <td width="95%">&nbsp;</td>
			</tr>
            <tr> 
                <td colspan="3" class="T10a"> 
                    <table><tbody>
                        <tr> 
						<%--Lista de asignaturas que imparte el profesor--%>
                            <td colspan="3" valign="middle" class="T10L" height="30">Asignatura:</td>
                            <td width="413"><select name="asignatura">
							  <option value="0">Todas</option>
							<%for(int j=0;j<asignaturaProfBean.getContador();j++){%>
						      <OPTION VALUE="<%=asignaturaProfBean.getId(j)%>"><%=asignaturaProfBean.getAsignatura(j)%> (<%=profBean.getTitulacion(j,0)%>)</OPTION>
							  <%}%>
							</select>
					</td>
                        </tr>
                        <tr> 
						<%--Lista de estados--%>
						  <td colspan="3" valign="middle" class="T10L" height="30">Estado:</td>
                           <td> <select name="estado">
						      <OPTION VALUE="0">Todas</OPTION>
					          <OPTION VALUE="1">Solicitada</OPTION>
							  <OPTION VALUE="2">Enviada</OPTION>
							  <OPTION VALUE="3">Confirmada</OPTION>
							  <OPTION VALUE="4">Realizada</OPTION>
							  <OPTION VALUE="5">No Realizada</OPTION>
							  <OPTION VALUE="6">Incomparescencia</OPTION>
							</select>
					       </td>
                                              
                       </tr>
					</tbody></table>
				                    </td>
			</tr>
			                      <tr> 
                                    <td>&nbsp;</td>
			</tr>
			<tr>
				<td>
	               <table>
				     <tr>
                      <td align="center">&nbsp;</td> 
                        <td class="T9L" align="center"><%=messageBean.getMsg()%></td>
                     </tr>
                     <tr>
                        <td align="center">&nbsp;</td>
                        <td align="center"width="429"><input type="submit" class="boton" value="Buscar"></td>
                    </tr>
					
				   </table>
				</td>
			</tr>
		</tbody></table>
	   </form>
	  <%-- Incluimos el pie de pagina --%>		                                                
      <jsp:include page="../view/pie.jsp"/>
</body></html>