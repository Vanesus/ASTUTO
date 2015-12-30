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
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>

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
        width:150px;
        height:25px;
		}
-->
</style></head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="96%">
  <tbody><tr>
    <td height="44" align="right" class="T24"><font color="#ffffff"> Configuraci&oacute;n&nbsp; Tutor&iacute;as&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
              <td class="T10a">
		<%--mensaje--%> 
        <%String color="#FFF5E4";
   	    int contador=0;%> </p>
		<%-- Tabla con los dias de la semana y las horas--%>
          <table width="530" height="296"  class="T9L">
            <tr bgcolor="#FFF5E4"> 
                  <td width="67" bgcolor="#FFFFFF">&nbsp;</td>
                  <td width="50" align="center"><font size="3">Lunes</font></td>
                  <td width="55" align="center"><font size="3">Martes</font></td>
                  <td width="73" align="center"><font size="3">Miercoles</font></td>
                  <td width="56" align="center"><font size="3">Jueves</font></td>
                  <td width="62" align="center"><font size="3">Viernes</font></td>
				  <td width="64" align="center"><font size="3">Sabado</font></td>
                  <td width="67" align="center"><font size="3">Domingo</font></td>
                
                </tr>
				<%--Por cada celda de la tabla tendremos que mirar si hay algún horario de tutoría que conincida con ese dia de la semana y esa hora. 
				Para esto tendremos que mirar si la hora de inicio del horario es menor que la hora de fin de la celda y que la hora de fin del horario
				sea mayor o igual que la hora de fin de la celda. Ademas el dia de la semana del horario tiene que ser igual al dia de la semana de la celda.
				Si encontramos que el horario coincide con la celda imprimimos "Ver" dentro de la celda, será un enlace que no muesta la lista de asignaturas 
				que tiene asignado horario ese día y a esa hora. Este proceso se repite con cada una de la celdas de la tabla--%>
                <tr bgcolor="#FFF5E4"> 
				  <%--Hora 8:00 a 9:00 --%>
                  <td height="20" rowspan="2" id="hora8-9" align="center">8:00-9:00</td>
				  <%--Lunes--%>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)//Buscar si los lunes de 8 a 9 hay algun horario asignado
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==1)
											{contador++; if (contador==1) {%>  bgcolor="#FFE0B1"><%--escribir "Ver" con un enlace que muestra las asignaturas que tiene horario asignado--%>
					<a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a></font> 
                    <%}}}%>
                  </td>
				  <%--Marte--%>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==2)
											{contador++; if (contador==1) {%>  bgcolor="#FFE0B1"> 
                   <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a> 
                    <%}}}%>
                  </td>
				  <%--Miercoles--%>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==3)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <%--Jueves--%>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==4)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <%--Viernes--%>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==5)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <%--Sabado--%>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==6)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <%--Domingo--%>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<9 && configuracionTutBean.getHoraFin(i)>=9&&configuracionTutBean.getDia(i)==7)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">9:00-10:00</td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a> 
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<10 && configuracionTutBean.getHoraFin(i)>=10&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==9&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				   </tr>
				   <TR></TR>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">10:00-11:00</td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> 
                    <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a>
                    <%}}}%>
                  </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<11 && configuracionTutBean.getHoraFin(i)>=11&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==10&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
				   <TR></TR>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">11:00-12:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<12 && configuracionTutBean.getHoraFin(i)>=12&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==11&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
				<tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">12:00-13:00</td>
                   <td rowspan="2" <%for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<13 && configuracionTutBean.getHoraFin(i)>=13&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==12&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">13:00-14:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<14 && configuracionTutBean.getHoraFin(i)>=14&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==13&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">16:00-17:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==1)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==2)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==3)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==4)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==5)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==6)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<17 && configuracionTutBean.getHoraFin(i)>=17&&configuracionTutBean.getDia(i)==7)
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">17:00-18:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<18 && configuracionTutBean.getHoraFin(i)>=18&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==17&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="20" rowspan="2" id="hora8-9" align="center">18:00-19:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<19 && configuracionTutBean.getHoraFin(i)>=19&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==18&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
                <tr></tr>
                <tr bgcolor="#FFF5E4"> 
                  <td height="26" rowspan="2" id="hora8-9" align="center">19:00-20:00</td>
                   <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==1||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==1))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==2||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==2))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==3||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==3))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==4||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==4))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==5||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==5))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   <td rowspan="2" <%contador=0; for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==6||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==6))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
                  <td rowspan="2" <%contador=0;for (int i=0;i<configuracionTutBean.getContador();i++)
										{if (configuracionTutBean.getHoraInicio(i)<20 && configuracionTutBean.getHoraFin(i)>=20&&configuracionTutBean.getDia(i)==7||(configuracionTutBean.getHoraFin(i)==19&&configuracionTutBean.getMinutosFin(i)>0&&configuracionTutBean.getDia(i)==7))
											{contador++; if (contador==1){%>  bgcolor="#FFE0B1"> <a class="T8L" href="../controller/configuracionTutController.jsp?opcion=<%="Buscar"%>&dia=<%=configuracionTutBean.getDia(i)%>&horaInicio=<%=configuracionTutBean.getHoraInicio(i)%>" rel="gb_page[600,500]">Ver</a><%}}}%>
                   </td>
				   </tr>
              </table>
              <p>&nbsp;</p>
              <p class="T10L">
                <center>
                  <form name="form1" id="form1" method="post" action="../view/verDatosConfTutoriaView.jsp?idProfesor=<%=configuracionTutBean.getIdProfesor(0)%>">
                    <a href="../view/verDatosConfTutoriaView.jsp?idProfesor=<%=configuracionTutBean.getIdProfesor(0)%>" rel="gb_page[600,600]"><input type="submit" name="Submit" value="Añadir Tutoría" class="boton" /></a>
                  </form>
                </center>
              </p>                    
	<%-- Incluimos el pie de pagina --%>		                                                                                                                                                  
    <jsp:include page="../view/pie.jsp"/>
</body></html>