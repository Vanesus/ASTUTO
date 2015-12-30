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
.boton{
        width:80px;
        height:25px;
		}
.boton1{
		width:140px;
        height:25px;
       }
-->
</style>
</head><body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>

<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
  <td class="T24" align="right"><font color="#ffffff">B&nbsp;u&nbsp;s&nbsp;c&nbsp;a&nbsp;r&nbsp;&nbsp;P&nbsp;r&nbsp;o&nbsp;f&nbsp;e&nbsp;s&nbsp;o&nbsp;r&nbsp;	  </font></td>
   </tr></tbody></table>
  </td></tr>
  <tr valign="top">
    <td>
	<table border="0" cellpadding="4" cellspacing="0" width="100%">
      <tbody><tr valign="top">
	    <td class="T10a"> 
        <table border="0" cellpadding="4" cellspacing="0" width="100%"> <tbody>
            <tr valign="top"> 
                <td colspan="3"><img src="../images/p.gif" width="15" height="1"></td>
			</tr>
            <tr> 
                <td colspan="3"> <font class=T14V color=#8c1233>&nbsp;&nbsp;Búsqueda</font> 
                <td width="3%"> </tr>
            <tr> 
                <td colspan="3"><IMG src="../images/encabezado_w2a.gif" width="500" height="13"></TD>
            </tr>
            <tr> 
                <td width="5%"> </td>
                <td class="T10" align="LEFT" bgcolor="#d69e00" width="85%"><b><font color="#ffffff">Selección de criterios </font></b></td>
                <td width="7%"> </td>
            </tr>
            <tr> 
                <td colspan="3" class="T10a"> <form name="busqueda" method="post">
                    <table width="80%" align="center" border="0"> <tbody>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                        <tr> 
                            <td colspan="3" valign="top" class="T10L"><font color="#000000">Nombre:</font></td>
                            <td>&nbsp;&nbsp;</td>
                            <td width="100"> <input name="nombre" class="T10" size="50" maxlength="100" type="text"> 
                            </td>
                        </tr>
                        <tr> 
                            
                          <td colspan="3" valign="top" class="T10L"><font color="#000000">Apellidos:</font></td>
                            <td>&nbsp;&nbsp;</td>
                            <td width="100"> <input name="apellido" class="T10" size="50" maxlength="100" type="text"> </td>
                        </tr>
                        <tr> 
                            <td colspan="3" valign="top" class="T10L"><font color="#000000">Asignatura:</font></td>
                            <td>&nbsp;&nbsp;</td>
                            <td width="100"> <input name="asignatura" class="T10" size="50" maxlength="100" type="text"> </td>
                        </tr>
                        <tr> 
                            <td>&nbsp;</td>
                        </tr>
                    </tbody></table>
                    <p> 
					   <%--menaje--%>
                        <center> &nbsp; <span class="T9"><%=messageBean.getMsg()%></span>  </center>
                    </p>
                 <table width="100%">
					  <tr>
						<td width="49%" align="right"><input onClick="document.busqueda.action='../controller/buscarProfController.jsp'; document.busqueda.submit()"; type="button" value="Buscar", class="boton"></td>
						<td width="2%">&nbsp;</td>
						<td widht="49%" align="left"><input onClick="document.busqueda.action='../controller/buscarTodosController.jsp?opcion=todos'; document.busqueda.submit()"; type="button" value="Buscar Todos" class="boton1"></td>
					  </tr>
					</table>
                 </form>
                 
			</td>
        </tr>
    </tbody></table>
	<%-- Incluimos el pie de pagina --%>		
    <jsp:include page="../view/pie.jsp"/>
</body></html>