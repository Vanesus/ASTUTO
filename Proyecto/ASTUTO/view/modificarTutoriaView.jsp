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
<body topmargin="1" leftmargin="4" marginheight="2" marginwidth="2">
<p align="center">
  <%--Datos extraidos del formulario--%>
  <% String opcion = request.getParameter("opcion");
	  String mensaje =messageBean.getMsg();
	  String asig = request.getParameter("asig");
	  String estado1 = request.getParameter("estado1");%>
  <%--Modificar tutoría--%>
  <%if(opcion.equals("modificar")){%>
</p>
<center>
  <p class="T30 Estilo2 Estilo3"><strong> Editar Tutoría </strong></p>
  
         <%--Datos de la petición que queremos modificar--%>
		 <form action="../controller/modificarTutoriaController.jsp?opcion=editar&asig=<%=asig%>&estado1=<%=estado1%>" method="post">
         
    <table width="489" cellpadding="4">
      <tbody>
        <tr> 
          <td width="121" height="38" class="T10L">Fecha (dd/mm/yyyy):</font></td>
          <td> <div align="left"></div>
            <table width="344" align="left">
              <tr>
			  <%if(tutoriaDiaBean.getDia(0)==null){%>
			  <td width="167"> 
                <select name="dia" id="dia" >
                    <%for (int i=1;i<=31;i++)
				{%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select>
			  / 
			      <select name="mes" id="mes" >
                    <%for (int i=1;i<=12;i++)
			  {%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select>
			  / 
			      <select name="anyo" id="anyo" >
                    <%for (int i=2010;i<=2030;i++)
			  {%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select></td><%}else{%>
                <td width="165"><select name="dia" id="dia" >
                    <%for (int j=1;j<=31;j++)
		  {%>
                    <option <%if (tutoriaDiaBean.getDia(0)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
                  <select name="mes" id="mes" >
                    <%for (int j=1;j<=12;j++)
		  {%>
		  			<option <%if (tutoriaDiaBean.getMes(0)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            
                   
            <%}%>
          </select>
          / 
                  <select name="anyo" id="anyo" >
                    <%for (int j=2010;j<=2030;j++)
		  {%>
		   			<option <%if (tutoriaDiaBean.getAnyo(0)==j){%>selected<%}%> value=<%=j%>><%=j%></option>
            
                  
            <%}%>
          </select></td> <%}%>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td class="T10L">Hora Inicio:</font></td>
          <td width="344"> 
            <%if(tutoriaDiaBean.getHoraInicio(0)==null){%>
            <input name="horaInicio" class="CampoTexto" value="" size="2">
            : 
            <input name="minutosInicio" class="CampoTexto" value="" size="2" maxlength="2"> 
            <%}else{%>
            <input name="horaInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraInicio(0)%>" size="2" maxlength="2">
            : 
            <%if (tutoriaDiaBean.getMinutosInicio(0)==0){%>
            <input name="minutosInicio" class="CampoTexto" value="00" size="2" maxlength="2"> 
            <%}else{%>
            <input name="minutosInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosInicio(0)%>" size="2" maxlength="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Hora Fin:</font></td>
          <td width="344"> 
            <%if(tutoriaDiaBean.getHoraFin(0)==null){%>
            <input name="horaFin" class="CampoTexto" value="" size="2" maxlength="2">
            : 
            <input name="minutosFin" class="CampoTexto" value="" size="2" maxlength="2"> 
            <%}else{%>
            <input name="horaFin" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraFin(0)%>" size="2" maxlength="2">
            : 
            <%if (tutoriaDiaBean.getMinutosFin(0)==0){%>
            <input name="minutosFin" class="CampoTexto" value="00" size="2" maxlength="2"> 
            <%}else{%>
            <input name="minutosFin" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosFin(0)%>" size="2" maxlength="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Alumno:</font></td>
          <td><input disabled   name="nombreAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getnombreAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">Correo:</td>
          <td><input disabled  name="correoAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getcorreoAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">N&uacute;mero Ausencias:</font></td>
          <td class="T9"><%=tutoriaDiaBean.getNAusencias(0)%></td>
        </tr>
        <tr> 
          <td class="T10L">Asignatura:</font></td>
          <td><select disabled name="asignatura">
              <%for(int j=0;j<asignaturaProfBean.getContador();j++){%>
              <OPTION VALUE="<%=asignaturaProfBean.getId(j)%>"<%if (tutoriaDiaBean.getAsignatura(0).equals(asignaturaProfBean.getAsignatura(j))){%>selected<%}%>><%=asignaturaProfBean.getAsignatura(j)%></OPTION>
              <%}%>
            </select> </td>
        </tr>
        <tr> 
          <td class="T10L">Motivo:</font></td>
          <td class="T9"><%=tutoriaDiaBean.getMotivo(0)%></td>
        </tr>
        <tr> 
          <%int estado=tutoriaDiaBean.getEstado(0);%>
          <td class="T10L">Estado:</font></td>
          <td> <select name="estado">
              <OPTION VALUE="1"<%if(estado==1){%>Selected<%}%>>Solicitada</OPTION>
              <OPTION VALUE="2"<%if(estado==2){%>Selected<%}%>>Enviada</OPTION>
              <OPTION VALUE="3"<%if(estado==3){%>Selected<%}%>>Confirmada</OPTION>
              <OPTION VALUE="4"<%if(estado==4){%>Selected<%}%>>Realizada</OPTION>
              <OPTION VALUE="5"<%if(estado==5){%>Selected<%}%>>No realizada</OPTION>
              <OPTION VALUE="6"<%if(estado==6){%>Selected<%}%>>Incomparescencia</OPTION>
            </select> </td>
        </tr>
        <tr> 
          <td class="T10L">Comentario:</td>
          <td class="T9"> 
            <%if (tutoriaDiaBean.getComentarioProfesor(0)!=null){%>
            <%=tutoriaDiaBean.getComentarioProfesor(0)%> 
            <%}%>
          </td>
        </tr>
    </table>
			
    <%--Mandar correo al alumno--%>
    <div align="right"></div>
    <table>
				<tr>
					<td width="300" align="left" class="T10L">
					<input name="correo" type="checkbox" value="1" checked/>
					 Enviar información al alumno</font></td>
				</tr>
			</table>
			<table>
				<tr>
					<td width="100" align="center"><input type="submit" value="Guardar" class="boton" ></form>    </td> 
  <td width="100" align="center"> <form action="../controller/misTutoriasController.jsp?asignatura=<%=asig%>&estado=<%=estado1%>" method="post" target="_top" >
      <div align="center">
        <input type="submit" value="Cancelar" class="boton" >
      </div>
    </form>
  </td></tr>
  <%--Eliminar peticion--%>
  <%}else if(opcion.equals("borrar")){%>
  <p align="center" class="T30 Estilo2 Estilo3"><strong>Eliminar Tutoría </strong></p>
  <form action="../controller/modificarTutoriaController.jsp?opcion=eliminar&asig=<%=asig%>&estado1=<%=estado1%>" method="post"> 
    <%--Datos de la petición que queremos eliminar--%>
    <table width="366" align="center" cellpadding="4">
      <tbody>
        <tr> 
          <td width="139" class="T10L">Fecha (dd/mm/yyyy):</font></td>
          <td> <table>
              <tr> 
                <%if(tutoriaDiaBean.getDia(0)==null){%>
                <td align="center"><input disabled name="dia" type="text" class="CampoTexto" value="" size="2">
                  /</td>
                <td align="center"><input disabled name="mes" type="text" class="CampoTexto" value="" size="2">
                  /</td>
                <td align="center"><input disabled name="anyo" type="text" class="CampoTexto" value="" size="4"></td>
                <%}else{%>
                <td align="center"><input disabled name="dia" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getDia(0)%>" size="2">
                  /</td>
                <td align="center"><input disabled name="mes" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getMes(0)%>" size="2">
                  /</td>
                <td align="center"><input disabled name="anyo" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getAnyo(0)%>" size="4"></td>
                <%}%>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td class="T10L">Hora Inicio:</font></td>
          <td width="203"> 
            <%if(tutoriaDiaBean.getHoraInicio(0)==null){%>
            <input disabled name="horaInicio" class="CampoTexto" value="" size="2">
            : <input disabled name="minutosInicio" class="CampoTexto" value="" size="2"> 
            <%}else{%>
            <input disabled name="horaInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraInicio(0)%>" size="2">
            : 
            <%if (tutoriaDiaBean.getMinutosInicio(0)==0){%>
            <input disabled name="minutosInicio" class="CampoTexto" value="00" size="2"> 
            <%}else{%>
            <input disabled name="minutosInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosInicio(0)%>" size="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Hora Fin:</font></td>
          <td width="203"> 
            <%if(tutoriaDiaBean.getHoraFin(0)==null){%>
            <input disabled name="horaFin" class="CampoTexto" value="" size="2">
            : <input disabled name="minutosFin" class="CampoTexto" value="" size="2"> 
            <%}else{%>
            <input disabled name="horaFin" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraFin(0)%>" size="2">
            : 
            <%if (tutoriaDiaBean.getMinutosFin(0)==0){%>
            <input disabled name="minutosFin" class="CampoTexto" value="00" size="2"> 
            <%}else{%>
            <input disabled name="minutosFin" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosFin(0)%>" size="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Alumno:</font></td>
          <td><input disabled name="nombreAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getnombreAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">Correo:</font></td>
          <td><input disabled name="correoAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getcorreoAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">Asignatura:</font></td>
          <td><input disabled name="asignatura" value="<%=tutoriaDiaBean.getAsignatura(0)%>"></td>
        </tr>
        <tr> 
          <td class="T12"><font color="#8c1229">Motivo:</font></td>
          <td><input disabled name="motivo" value="<%=tutoriaDiaBean.getMotivo(0)%>"></td>
        </tr>
        <tr> 
          <%String estado=null;%>
          <%if(tutoriaDiaBean.getEstado(0)==1){ estado="Solicitada";
		           }else if(tutoriaDiaBean.getEstado(0)==2){ estado="Enviada";
		           }else if(tutoriaDiaBean.getEstado(0)==3){ estado="Confirmada";
		           }else if(tutoriaDiaBean.getEstado(0)==4){estado="Realizada";
				   }else if(tutoriaDiaBean.getEstado(0)==5){estado="No Realizada";
				   }else if(tutoriaDiaBean.getEstado(0)==6){estado="Incomparescencia";}%>
          <td class="T10L">Estado:</font></td>
          <td> <input name="estado" disabled id="estado" value="<%=estado%>"></td>
        </tr>
        <tr> 
          <td class="T10L">Comentario:</font></td>
          <%if(tutoriaDiaBean.getDia(0)==null){%>
          <td> 
            <%if (tutoriaDiaBean.getComentarioProfesor(0)!=null){%>
            <%=tutoriaDiaBean.getComentarioProfesor(0)%> 
            <%}%>
          </td>
          <%}else{%>
          <%}%>
        </tr>
    </table>
			
    <%if (tutoriaDiaBean.getEstado(0)<=3)
			{%>
    <div align="center">
	<%--Mandar correo al alumno--%>
      <table>
        <tr> 
          <td  class="T10L" width="300" align="left"> <div align="left"> 
              <input name="correo" type="checkbox" value="1" checked="checked"/>
              Enviar información al alumno</font></div></td>
        </tr>
      </table>
      <%}%><table>
      
    <tr> 
      <td width="100" align="center"><div align="center">
          <input type="submit" value="Eliminar" class="boton" >
        </div></form>    </td> 
  <td width="100" align="center"> <form action="../controller/misTutoriasController.jsp?asignatura=<%=asig%>&estado=<%=estado1%>" method="post" target="_top" >
      <div align="center">
        <input type="submit" value="Cancelar" class="boton" >
      </div>
    </form>
  </td></tr>
  <%--Asignar peticion manualmente--%>
  <%}else if(opcion.equals("aceptar")){%>
  <p align="center" class="T30 Estilo2 Estilo3"><strong> Aceptar Tutoría </strong></p>
  <p align="center"></p>
  <%if(tutoriaDiaBean.getEstado(0)==1){%>
  <form action="../controller/modificarTutoriaController.jsp?opcion=<%="validar"%>&asig=<%=asig%>&estado1=<%=estado1%>"  method="post" >
	<%--Datos de la petición que queremos asignar manualmente--%>
    <table width="474" align="center" cellpadding="4">
      <tbody>
        <tr> 
          <td width="114" class="T10L">Fecha (dd/mm/yyyy):</font></td>
          <td> <table>
              <tr> 
                <%if(tutoriaDiaBean.getDia(0)==null){%>
                <td width="167"> 
                <select name="dia" id="dia" >
                    <%for (int i=1;i<=31;i++)
				{%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select>
			  / 
			      <select name="mes" id="mes" >
                    <%for (int i=1;i<=12;i++)
			  {%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select>
			  / 
			      <select name="anyo" id="anyo" >
                    <%for (int i=2010;i<=2030;i++)
			  {%>
                    <option value=<%=i%>><%=i%></option>
				<%}%>
			  </select></td><%}else{%>
                <td width="151"><select name="dia" id="dia" >
                    <%for (int j=1;j<=31;j++)
		  {%>
                    <option <%if (tutoriaDiaBean.getDia(0)==j){%> selected<%}%> value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
                  <select name="mes" id="select2" >
                    <%for (int j=1;j<=12;j++)
		  {%>
                    <option <%if (tutoriaDiaBean.getMes(0)==j){%> selected<%}%>value=<%=j%>><%=j%></option>
            <%}%>
          </select>
          / 
                  <select name="anyo" id="select3" >
                    <%for (int j=2010;j<=2030;j++)
		  {%>
                    <option <%if (tutoriaDiaBean.getAnyo(0)==j){%> selected<%}%>value=<%=j%>><%=j%></option>
            <%}%>
          </select></td><%}%>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td class="T10L">Hora Inicio:</font></td>
          <td width="336">
            <%if(tutoriaDiaBean.getHoraInicio(0)==null){%>
            <input name="horaInicio" class="CampoTexto" value="" size="2" maxlength="2">
            : 
            <input name="minutosInicio" class="CampoTexto" value="" size="2" maxlength="2"> 
            <%}else{%>
            <input name="horaInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraInicio(0)%>" size="2" maxlength="2">
            :
            <%if (tutoriaDiaBean.getMinutosInicio(0)==0){%>
            <input name="minutosInicio" class="CampoTexto" value="00" size="2" maxlength="2"> 
            <%}else{%>
            <input name="minutosInicio" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosInicio(0)%>" size="2" maxlength="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Hora Fin:</font></td>
          <td width="336">
            <%if(tutoriaDiaBean.getHoraFin(0)==null){%>
            <input name="horaFin" class="CampoTexto" value="" size="2" maxlength="2">
            : 
            <input name="minutosFin" class="CampoTexto" value="" size="2" maxlength="2"> 
            <%}else{%>
            <input name="horaFin" class="CampoTexto" value="<%=tutoriaDiaBean.getHoraFin(0)%>" size="2" maxlength="2">
            :
            <%if (tutoriaDiaBean.getMinutosFin(0)==0){%>
            <input name="minutosFin" class="CampoTexto" value="00" size="2" maxlength="2"> 
            <%}else{%>
            <input name="minutosFin" class="CampoTexto" value="<%=tutoriaDiaBean.getMinutosFin(0)%>" size="2" maxlength="2"> 
            <%}}%>
          </td>
        </tr>
        <tr> 
          <td class="T10L">Alumno:</font></td>
          <td><input disabled name="nombreAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getnombreAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">N&uacute;mero Ausencias:</td>
          <td class="T9"><%=tutoriaDiaBean.getNAusencias(0)%></td>
        </tr>
        <tr> 
          <td class="T10L">Correo:</font></td>
          <td><input disabled name="correoAlumno" type="text" class="CampoTexto" value="<%=tutoriaDiaBean.getcorreoAlumno(0)%>" size="30"></td>
        </tr>
        <tr> 
          <td class="T10L">Asignatura:</font></td>
          <td><input disabled name="asignatura" value="<%=tutoriaDiaBean.getAsignatura(0)%>"></td>
        </tr>
        <tr> 
          <td class="T10L">Motivo:</font></td>
          <td><input disabled name="motivo" value="<%=tutoriaDiaBean.getMotivo(0)%>"></td>
        </tr>
        <tr> 
          <%String estado=null;%>
          <%if(tutoriaDiaBean.getEstado(0)==1){ estado="Solicitada";
		           }else if(tutoriaDiaBean.getEstado(0)==2){ estado="Enviada";
		           }else if(tutoriaDiaBean.getEstado(0)==3){ estado="Confirmada";
		           }else if(tutoriaDiaBean.getEstado(0)==4){estado="Realizada";
				   }else if(tutoriaDiaBean.getEstado(0)==5){estado="No Realizada";
				   }else if(tutoriaDiaBean.getEstado(0)==6){estado="Incomparescencia";}%>
          <td class="T10L">Estado:</font></td>
          <td> <input name="estado" disabled id="estado" value="<%=estado%>"></td>
        </tr>
        <tr> 
          <td class="T10L">Comentario:</font></td>
          <%if(tutoriaDiaBean.getDia(0)==null){%>
          <td>
            <%if (tutoriaDiaBean.getComentarioProfesor(0)!=null){%>
            <%=tutoriaDiaBean.getComentarioProfesor(0)%>
            <%}%>
            &nbsp;</td>
          <%}else{%>
          <%}%>
        </tr>
    </table>
			  
    <div align="center">
      
    <table width="214">
      <tr> 
        <td class="T10L" colspan="2" align="center"><div align="left">¿Quiere aceptar 
            la tutoria?</div></td>
      </tr>
      <tr> 
        <td width="97" align="center"><div align="left">
            <input name="submit" type="submit" class="boton" value="Aceptar" >
          </div></td>
        <td width="105" align="center"><input name="button" type="button" class="boton" onClick="document.salir.action='../controller/misTutoriasController.jsp?asignatura=<%=asig%>&estado=<%=estado1%>'; document.salir.submit()" value="Cancelar" ></td>
      </tr>
    </table>
  <tr> 
      <td width="100" align="center"><div align="center"> </div></form>    
  <td width="100" align="center"> <form name="salir"  method="post" target="_top" >
      <div align="center"> </div>
    </form>
  </td></tr>
  <%}else{%>
  <form action="../controller/misTutoriasController.jsp?asignatura=<%=asig%>&estado=<%=estado1%>"  method="post" target="_top" >
    <div align="center">
      <table>
        <tr> 
          <td class="T10L">La tutoria elegida ya esta Asignada y Enviada</td>
        </tr>
        <tr> 
          <td width="300" align="center"><input type="submit" value="Salir" class="boton1" ></td>
        </tr>
      </table>
    </div>
  </form>
  <div align="center">
    <%}%>
    <%}else if(opcion.equals("salir")){%>
  </div>
  <p align="center" class="T30 Estilo2 Estilo3"><strong> Tutoría </strong></p>
  <form action="../controller/misTutoriasController.jsp?asignatura=<%=asig%>&estado=<%=estado1%>" method="post" target="_top" >
    <p align="center"></p>
	<p align="center" class="T9L"><%=mensaje%></p>
    <div align="center">
      <input type="submit" value="Salir" class="boton1" >
    </div>
  </form>
  <div align="center">
    <%}%>
  </div>
</center>
</body>
</html>