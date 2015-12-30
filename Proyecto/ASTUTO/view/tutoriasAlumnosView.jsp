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
a:link {	text-decoration: none;}
a:visited {	text-decoration: none;}
a:hover {color:#D69E00;	text-decoration: none;}
a:active {	text-decoration: none;}
.boton{
        width:80px;
        height:25px;
		}
-->
</style></head>
<body>
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"> <tbody> <tr>
   <td class="T24" align="right"><font color="#ffffff"> M&nbsp;i&nbsp;s&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp; 
       </font></td>
                          </tr>
                        </tbody>
                      </table></td>
                  </tr>
	<tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           
        <td class="T10a"> <table width="90%" border="0" cellpadding="4" cellspacing="0">
            <tbody>
              <tr> 
                <td colspan="3"> <font class="T14V" color="#8c1233">&nbsp;&nbsp;Búsqueda</font></td>
              </tr>
              <tr> 
                <td colspan="3"><img src="../images/encabezado_w2a.gif" width="479" height="13" /></td>
              </tr>
              <tr> 
                <td class="T10" align="left"  width="5%"> </td>
                <td class="T10" align="left" bgcolor="#d69e00" width="85%"><b><font color="#ffffff">Criterio 
                  de b&uacute;squeda</font></b></td>
                <td class="T10" align="left"  width="7%"> </td>
              </tr>
            </tbody>
          </table>
          <div align="center"></div> 
		  <%--Función para validar el correo--%> 
		   <script>
			function validarEmail(valor) {
			if (/^[a-z][0-9][0-9][a-z][a-z][a-z][a-z][a-z]@uco.es$/.test(form.correo.value)){
			return (true)
			} else {
			alert("La dirección de email es incorrecta. El formato debe ser a11aaaaa@uco.es");
			return (false);}
			}
		   </script>
		   <%String opcion=request.getParameter("opcion");
		   String disabled=null;%>
		   <%if (opcion==null)
		   {%>
		   <form name="form" action="../view/tutoriasAlumnosView.jsp" method="post">
           <%}%>
            <%if (opcion!=null)
			{%>
			 <form name="form" onSubmit="return validarEmail(this);" action="../controller/tutoriasAlumnosController.jsp?identificacion=<%=opcion%>" method="post">
			<table height="123" align="center" cellpadding="1" cellspacing="0">
			<%if (opcion.equals("1"))
			{%>
			  <tr> 
                <td height="61"> 
                  <p>Introduzca su identificador: </p>
                  </td>
                <td><input  id="identificador"name="identificador" type="text" size="15" maxlength="20" /></td>
              </tr>
			  <%}
			  if (opcion.equals("2"))
			  {%>
              <tr> 
                <td width="298" height="60"> Introduzca su correo (a11aaaaa@uco.es): 
                </td>
                <td width="155"><input id="correo"name="correo" type="text" size="15" maxlength="20" /></td>
              </tr>
			  <%}%>
            </table>                        
            <%}%>
			
			<table width="458" height="95" align="center">
              <%if (opcion==null)
			{%>
              <tr> 
                <%--mensaje--%>   
				                    
                <td height="46" class="T10" align="center"> <p>Elige el criterio 
                    de b&uacute;squeda: 
                    <select name="opcion" id="opcion">
                      <option value="1">Por identificador</option>
                      <option value="2">Por correo</option>
                    </select>
                  </p>
                  <p>&nbsp;</p></td>
              </tr>
			  <%}%>
              <tr> 
                <td align="center">
				<p class="T9" align="center"><%=messageBean.getMsg()%></p>
				<input name="Input" type="submit" value="Aceptar" class="boton"></td>
              </tr>
            </table>
          </form>
  <%-- Incluimos el pie de pagina --%>		                             
  <jsp:include page="../view/pie.jsp"/>
</body></html>