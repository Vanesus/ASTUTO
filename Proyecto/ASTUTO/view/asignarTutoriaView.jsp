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
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>

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
.Estilo2 {color: #8C1233}
.Estilo3 {font-size: 18pt}
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
       
  <p class="T30 Estilo2 Estilo3"><strong> Asignar Tutoría</strong></p>
  <%--Extraigo del formulario--%>
  <p class="T9L"><%=messageBean.getMsg()%></p>
  <%String salir = request.getParameter("salir");
	if(salir.equals("0")){%>
	  <form action="../controller/tutoriaDiaController.jsp?dia=<%=tutoriaDiaBean.getDia(0)%>&mes=<%=tutoriaDiaBean.getMes(0)%>&anyo=<%=tutoriaDiaBean.getAnyo(0)%>" method="post" target="_top">
	            <input type="submit" value="Salir" class="boton1" >
	  </form>
	<%}else{%>
	  <%--validar que el formato del correo sea correcto--%>
	  <script>
		function validarEmail(valor) {
		if (/^[a-z][0-9][0-9][a-z][a-z][a-z][a-z][a-z]@uco.es$/.test(form.correoAlumno.value)){
		return (true)
		} else {
		alert("La dirección de email es incorrecta. El formato debe ser a11aaaaa@uco.es");
		return (false);}
		}
	  </script>
  <%--Fomulario para introducir los datos de la tutoría--%>
  <form name="form" onSubmit="return validarEmail(this);" method="post" target="_self" action="../controller/asignarTutoriaController.jsp">
  <table>
  <tr>
    <td width="156" class="T10L">Asignatura:</td>
	<%--Lista de asignaturas que imparte el profesor--%>
	<td width="275"><select name="asignatura"><%for(int i=0;i<asignaturaProfBean.getContador();i++){%>
						      <OPTION VALUE=<%=asignaturaProfBean.getId(i)%>><%=asignaturaProfBean.getAsignatura(i)%></OPTION>
					          <%}%>
							</select></td>
  </tr>
   <tr>
    <td class="T10L">Nombre Alumno: </td>
	<td><input name="nombreAlumno" type="text" class="CampoTexto" size="30" maxlength="100"></td>
  </tr>
   <tr>
    <td class="T10L">Correo Alumno: </td>
	<td><input name="correoAlumno" type="text" class="CampoTexto" size="30" maxlength="20"></td>
  </tr>
   <tr>
    <td class="T10L">Estado: </td>
	<td><select name="estado">
					          <OPTION VALUE="1">Solicitada</OPTION>
							  <OPTION VALUE="2">Enviada</OPTION>
							  <OPTION VALUE="3">Confirmada</OPTION>
							  <OPTION VALUE="4">Realizada</OPTION>
							  <OPTION VALUE="5">No Realizada</OPTION>
							  <OPTION VALUE="6">Incomparescencia</OPTION>
							</select></td>
  </tr>
  <tr>
    <td class="T10L">Hora Inicio: </td>
	<td><input name="horaInicio" size="2" maxlength="2">:<input name="minutosInicio" size="2" maxlength="2"></td>
  </tr>
  <tr>
    <td class="T10L">Hora Fin: </td>
	<td><input name="horaFin" size="2" maxlength="2">:<input name="minutosFin" size="2" maxlength="2"></td>
  </tr>
  <tr valign="top">
    <td class="T10L">Motivo: </td>
	<td><textarea  name="motivo" cols="35" rows="10"></textarea></td>
  </tr>
  
  </table>
    <table>
      <tr> 
	  <%--checkbox para mandar correo al alumno--%>
        <td class="T10L" width="300" align="left"> <input name="correo" type="checkbox" value="1" checked/> 
          Enviar información al alumno</font></td>
      </tr>
    </table>
    <table width="176">
      <tr> 
        <td colspan="2" align="justify" class="T9L"> 
          <div align="left"></div>
          <div align="left"></div></td>
      </tr>
      <tr> 
        <td width="88" align="center"><input type="submit" value="Guardar" class="boton"> 
        </td>
        <td width="164" align="center"><input name="button" type="button" class="boton" onClick="document.salir.action='../controller/tutoriaDiaController.jsp?dia=<%=tutoriaDiaBean.getDia(0)%>&mes=<%=tutoriaDiaBean.getMes(0)%>&anyo=<%=tutoriaDiaBean.getAnyo(0)%>'; document.salir.submit()" value="Cancelar";></td>
        
      </tr>
    </table>
<table width="100%">
    <tr> 
        <td width="2%">&nbsp;</td>
		</form><form name="salir" target="_top" method="post" >
		
    <td align="left" width="49%">&nbsp; </td>
      </tr>
    </form>
  
  <p>
    <%}%> 
  </p> 
</center>
</body>
</html>