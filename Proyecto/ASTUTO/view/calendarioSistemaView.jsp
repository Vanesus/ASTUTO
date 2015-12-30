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
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>

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
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAdmin.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">C&nbsp;a&nbsp;l&nbsp;e&nbsp;n&nbsp;d&nbsp;a&nbsp;r&nbsp;i&nbsp;o&nbsp; </font></td>
 </tr></tbody></table></td>
</tr>
<tr valign="top">
    <td>
    <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
        <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
        <td class="T10a"> 
         <table width="500">
            <tr> 
                <td><font class="T14V" color="#8c1233">&nbsp;&nbsp;Configuración del Calendario</font></td>
            </tr>
         </table>
         <table width="500">
            <tr> 
               <td><img src="../images/encabezado_w2a.gif" width="475" height="12" /></td>
            </tr>
         </table>
		  <table width="500" cellpadding="4">
            <tr valign="top"> 
              <td width="130" height="25" class="T10"><strong><font color="#8c1229">Fecha 
                Inicio</font></strong></td>
              <td width="130" height="25" class="T10"><strong><font color="#8c1229">Fecha 
                Fin</font></strong></td>
              <td width="220" height="25" class="T10"><strong><font color="#8c1229">Tipo</font></strong></td>
              <td colspan="2"class="T10"><strong><font color="#8c1229">Opciones</font></strong></td>
            </tr>
			<%--Lista de excepciones del calendario--%>
            <%String color ="#FFFDE5";%>
            <%for(Integer i=0;i<calendarioBean.getContador();i++){%>
            <%if(i%2==0) color="#FFE0B1";
				  else color ="#FFF5E4";%>
            <tr valign="middle" bgcolor="<%=color%>" class="T10L"> 
              <td class="T9L"> <%=calendarioBean.getdInicio(i)%> / <%=calendarioBean.getmInicio(i)%> 
                / <%=calendarioBean.getaInicio(i)%></td>
              <td class="T9L"><%=calendarioBean.getdFin(i)%> / <%=calendarioBean.getmFin(i)%> 
                / <%=calendarioBean.getaFin(i)%></td>
              <td class="T9L"> 
			  <%--Tipo de excepción--%>
                <%int tipo=calendarioBean.getTipo(i);%>
                <%if(tipo==1){%>
                Días hábiles no lectivos 
                <%}else if(tipo==2){%>
                Días lectivos 
                <%}else if(tipo==3){%>
                Exámenes 
                <%}else if(tipo==4){%>
                Fiestas patronales 
                <%}else if(tipo==5){%>
                Días fectivos 
                <%}%>
              </td>
			  <%--Botones de opciones--%>
              <td class="T10"><a href="../view/nuevoCalendarioView.jsp?opcion=editar&i=<%=i%>" rel="gb_page[450,400]"><img src="../images/edit.gif" width="20" height="21" border="0" title="Editar" /></a></td>
              <td class="T10"><a href="../view/nuevoCalendarioView.jsp?opcion=borrar&i=<%=i%>" rel="gb_page[450,400]"><img src="../images/borrar.gif" width="20" height="21" border="0" title="Eliminar"/></a></td>
            </tr>
            <%}%>
            <tr> 
              
            </tr>
          </table>
		  <%--mensaje--%>
          <p class="T9L"><%=messageBean.getMsg()%></p>
		  <%messageBean.setMsg("");%>
          <p align="center"><a href="../view/nuevoCalendarioView.jsp?opcion=nuevo" rel="gb_page[450,400]"> 
            <input type="submit" name="Submit" value="Asignar Nueva" class="boton">
            </a></p>
		  <%-- Incluimos el pie de pagina --%>		                                                                                      
          <jsp:include page="../view/pie.jsp"/>
</body></html>