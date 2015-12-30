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
<jsp:useBean id="titulacionBean" class="uco.interfaz.TitulacionBean" scope="session"/>
<jsp:useBean id="cursoBean" class="uco.interfaz.CursoBean" scope="session"/>

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
<a name="inicio"></a>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>
<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%">
  <tbody><tr>
  <td class="T24" align="right"><font color="#ffffff"> P&nbsp;e&nbsp;t&nbsp;i&nbsp;c&nbsp;i&nbsp;ó&nbsp;n&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp; 
  </font></td>
  </tr>
  </tbody> </table></td>
                  </tr>
                 <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="58%">
      <tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           
        <td class="T10a"> 
          <%-- Muestra la lista de centros, titulaciones y curso--%>
          <p><%for (int i=0; i<centroBean.getContador(); i++) {%></p>
								 
          <table border="0" cellspacing="0" cellpadding="4" width="67%" bgcolor=#ffffff>
            <tbody>
                                 <tr> 
								 <%--Muestra el certro--%>
								 <td class="T20" align="left"><font color=#8c1229><b><%=centroBean.getCentro(i)%></b> </font></td>
								 </tr>
                                 </tbody> </table>
                                    <%--Muestra todas las titulaciones de ese centro--%>
                                    <% for (int j=0; j<titulacionBean.getContador(i); j++){%>
									  <table border="0" cellspacing="2" cellpadding="2"  width="403" align="center">
                                      <tbody>
                                      <tr valign="top"> 
                                      <td width="18" ><img src="../images/op_a2.gif" width="13" height="13" ></td>
									  <%--Muestra la titulación--%>
                                      <td width="371" class="T10"><%=titulacionBean.getTitulacion(i,j)%></td>
                                      </tr>
                                      </tbody>     </table>
									  	<%--Muestra todos los curso de esa titulacion--%>
                                      	<% for (int k=0; k<cursoBean.getContador(i,j);k++)    {%>
                                        	<table border="0" cellspacing="2" cellpadding="2" width="322" align="center">
                                        	<tbody>
                                        	<tr valign="top"> 
                                        	<td width="14"><img src="../images/op_a1.gif" width="13" height="13" ></td>
											<%--Muestra el curso. Si hacemos clic en el curso te muestra las asignautras que tiene asignadas asignadas--%>
                                        	<td width="294" class="T10"><a href="../controller/listadoAsigController.jsp?idCurso=<%=cursoBean.getId(i,j,k)%>"><font color="#000000"><%=cursoBean.getCurso(i,j,k)%></font></a> </td>
                                        	</tr>
                                        	</tbody>  </table>
                                    	<%}
 								     }
								   }%>
		
  <%-- Incluimos el pie de pagina --%>
          <p>&nbsp;</p>
          <p align="center"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a></p>
          <jsp:include page="../view/pie.jsp"/>                                    
</body></html>