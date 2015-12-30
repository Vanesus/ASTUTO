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
<jsp:useBean id="calendarioBean" class="uco.interfaz.CalendarioBean" scope="session"/>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>

<html>
<head>
<%-- Fichero de estilos --%>
<link rel="STYLESHEET" type="text/css" href="../images/webuco.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/corp2.jpg);
}
.boton{
        width:80px;
        height:25px;
		}
.boton1{
        width:60px;
        height:25px;
		}
-->
</style>

</head>

<body topmargin="2" leftmargin="4" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
       
  
<p align="center" class="T30 Estilo2 Estilo3"><strong> Configuración Calendario</strong></p>
<%--mensaje--%>
<p align="center" class="T9L"><%=messageBean.getMsg()%></p>
<%--Extraigo opcion--%>
<%String opcion = request.getParameter("opcion");%>
<%if(opcion.equals("nuevo")){%>
<form name="calendario" method="post" target="_self">
  <div align="center">
    <table width="370" align="center" class="T10L">
      <tr> 
        <td width="178">Fecha Inicio (dd/mm/yyyy):</td>
        <td width="180">
<select name="dI" id="dI" >
            <%for (int i=1;i<=31;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="mI" id="mI" >
            <%for (int i=1;i<=12;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="aI" id="aI" >
            <%for (int i=2010;i<=2030;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select> </td>
      </tr>
      <tr> 
        <td>Fecha Fin (dd/mm/yyyy):</td>
        <td>
<select name="dF" id="dF" >
            <%for (int i=1;i<=31;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="mF" id="mF" >
            <%for (int i=1;i<=12;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="aF" id="aF" >
            <%for (int i=2010;i<=2030;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select> </td>
      </tr>
      <tr> 
        <td>Tipo: </td>
        <td><select name="tipo">
            <OPTION VALUE="1">Días hábiles no lectivos</OPTION>
            <OPTION VALUE="2">Días lectivos</OPTION>
            <OPTION VALUE="3">Periodo de exámenes</OPTION>
            <OPTION VALUE="4">Fiestas patronales</OPTION>
            <OPTION VALUE="5">Días fectivos</OPTION>
          </select> </tr>
    </table>
  </div>
  <p align="center">&nbsp;</p>
    <table width="100%">
      <tr> 
        <td align="right" width="49%"><input onClick="document.calendario.action='../controller/calendarioSistemaController.jsp?opcion=nuevo'; document.calendario.submit()"; type="button" value="Guardar" class="boton"> </td>
		<td width="2%">&nbsp;</td>
		</form><form name="salir" target="_top" method="post" >
		<td align="left" width="49%"><input onClick="document.salir.action='../controller/calendarioSistemaController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton"> </td>
      </tr>
  </form>
  <%}//Editar excepción del calendario
  else if(opcion.equals("editar")){
    Integer i=Integer.parseInt(request.getParameter("i"));%>
<form name="calendario" method="post" target="_self">
  <div align="center">
    <table width="367" align="center" class="T10L">
      <tr> 
	  <%--Datos de la excepción en el calendario escolar--%>
        <td width="178" height="38">Fecha Inicio (dd/mm/yyyy):</td>
        <td width="177"> 
          <select name="dI" id="dI" >
            <%for (int j=1;j<=31;j++)
		  {%>
            <option <%if (calendarioBean.getdInicio(i)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
          <select name="mI" id="mI" >
            <%for (int j=1;j<=12;j++)
		  {%>
            <option <%if (calendarioBean.getmInicio(i)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
          <select name="aI" id="aI" >
            <%for (int j=2010;j<=2030;j++)
		  {%>
            <option <%if (calendarioBean.getaInicio(i)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select></td>
      </tr>
      <tr> 
        <td>Fecha Fin (dd/mm/yyyy):</td>
        <td>
			<select name="dF" id="select4" >
            <%for (int j=1;j<=31;j++)
		  {%>
            <option <%if (calendarioBean.getdFin(i)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
          <select name="mF" id="select5" >
            <%for (int j=1;j<=12;j++)
		  {%>
            <option <%if (calendarioBean.getmFin(i)==j){%>selected<%}%>value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
          <select name="aF" id="select6" >
            <%for (int j=2010;j<=2030;j++)
		  {%>
            <option <%if (calendarioBean.getaFin(i)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select></td>
      </tr>
      <tr> 
        <td>Tipo: </td>
        <td>
          <%int tipo=calendarioBean.getTipo(i);%>
          <select name="tipo">
            <OPTION VALUE="1"<%if(tipo==1){%>selected<%}%>>Días hábiles no lectivos</OPTION>
            <OPTION VALUE="2"<%if(tipo==2){%>selected<%}%>>Días lectivos</OPTION>
            <OPTION VALUE="3"<%if(tipo==3){%>selected<%}%>>Periodo de exámenes</OPTION>
            <OPTION VALUE="4"<%if(tipo==4){%>selected<%}%>>Fiestas patronales</OPTION>
            <OPTION VALUE="5"<%if(tipo==5){%>selected<%}%>>Días fectivos</OPTION>
          </select> </tr>
    </table>
  </div>
  <p align="center">&nbsp;</p>
   <table width="100%">
      <tr> 
        <td align="right" width="49%"><input onClick="document.calendario.action='../controller/calendarioSistemaController.jsp?opcion=editar&id=<%=calendarioBean.getId(i)%>'; document.calendario.submit()"; type="button" value="Editar" class="boton"> </td>
		<td width="2%">&nbsp;</td>
		</form><form name="salir" target="_top" method="post" >
		<td align="left" width="49%"><input onClick="document.salir.action='../controller/calendarioSistemaController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton"> </td>
      </tr>
  </form>
   
  <%}//Borrar excepción del calendario
  else if(opcion.equals("borrar")){
    Integer i=Integer.parseInt(request.getParameter("i"));%>
<form name="calendario"method="post" target="_self">
  <div align="center">
    <table align="center" class="T10L">
      <tr> 
	   <%--Datos de la excepción que desea eliminar--%>
        <td width="98">Fecha Inicio:</td>
       
        <td width="162"><input disabled name="dI" type="text" size="2" maxlength="2" value="<%=calendarioBean.getdInicio(i)%>">
          / 
          <input disabled name="mI" type="text" size="2" maxlength="2" value="<%=calendarioBean.getmInicio(i)%>">
          / 
          <input disabled name="aI" type="text" size="4" maxlength="4" value="<%=calendarioBean.getaInicio(i)%>"></td>
      </tr>
      <tr> 
        <td>Fecha Fin:</td>
        <td><input disabled name="dF" type="text" size="2" maxlength="2" value="<%=calendarioBean.getdFin(i)%>">
          / 
          <input disabled name="mF" type="text" size="2" maxlength="2" value="<%=calendarioBean.getmFin(i)%>">
          / 
          <input disabled name="aF" type="text" size="4" maxlength="4" value="<%=calendarioBean.getaFin(i)%>"></td>
      </tr>
      <tr> 
        <td>Tipo: </td>
        <td>
          <%int t=calendarioBean.getTipo(i);
	      String tipo=""; 
		  if(t==1) tipo="Días hábiles no lectivos";
		  if(t==2) tipo="Días lectivos";
		  if(t==3) tipo="Periodo de exámenes";
		  if(t==4) tipo="Fiestas patronales";
		  if(t==5) tipo="Días fectivos";%>
          <input disabled name="tipo" type="text" size="21" maxlength="21" value="<%=tipo%>"> 
      </tr>
    </table>
  </div>
  <p align="center">&nbsp;</p>
     <table width="100%">
      <tr> 
        <td align="right" width="49%"><input onClick="document.calendario.action='../controller/calendarioSistemaController.jsp?opcion=borrar&id=<%=calendarioBean.getId(i)%>'; document.calendario.submit()"; type="button" value="Borrar" class="boton"> </td>
		<td width="2%">&nbsp;</td>
		</form><form name="salir" target="_top" method="post" >
		<td align="left" width="49%"><input onClick="document.salir.action='../controller/calendarioSistemaController.jsp'; document.salir.submit()"; type="button" value="Cancelar" class="boton"> </td>
      </tr>
  </form>
 
  <%}//Boton salir
  else if(opcion.equals("salir")){%><table>
  
<form action="../controller/calendarioSistemaController.jsp"method="post" target="_top">
 
  <tr> 
    <td align="center" > <input type="submit" value="Salir"  class="boton1"></td>
  </tr>
</form>
  <%}%>
</body>
</html>