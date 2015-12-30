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
<jsp:useBean id="profBean" class="uco.interfaz.ProfBean" scope="session"/>
<jsp:useBean id="asignaturaProfBean" class="uco.interfaz.AsignaturaProfBean" scope="session"/>
<jsp:useBean id="configuracionTutBean" class="uco.interfaz.ConfiguracionTutBean" scope="session"/>
<jsp:useBean id="confInicialBean" class="uco.interfaz.ConfInicialBean" scope="session"/>

<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

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
<body topmargin="2" leftmargin="2" marginheight="2" marginwidth="2">
<p>&nbsp;</p>
<center>
  
  <p align="center" class="T30 Estilo2 Estilo3"><strong> Configuraci&oacute;n 
    Horario Tutor&iacute;a</strong></p>
  <p align="center" class="T30 Estilo2 Estilo3"> 
    <%--Datoas extraidos--%>
    <%String opcion = request.getParameter("opcion");%>
  </p>
  <script>
  function Validar(Cadena){   
    var Fecha= form.fechaFin.value   // Crea un string   
    var RealFecha= new Date()   // Para sacar la fecha de hoy   
    // Cadena Año   
    var Dia= new String(form.fechaFin.value.substring(form.fechaFin.value.lastIndexOf("/")+1,form.fechaFin.value.length))   
    // Cadena Mes   
    var Mes= new String(form.fechaFin.value.substring(form.fechaFin.value.indexOf("/")+1,form.fechaFin.value.lastIndexOf("/")))   
    // Cadena Día   
    var Ano= new String(form.fechaFin.value.substring(0,form.fechaFin.value.indexOf("/")))   
  
    // Valido el año   
    if (isNaN(Ano) || Ano.length<4 || parseFloat(Ano)<1900){   
            alert('Año inválido')   
        return false   
    }   
    // Valido el Mes   
    if (isNaN(Mes) || parseFloat(Mes)<1 || parseFloat(Mes)>12){   
        alert('Mes inválido')   
        return false   
    }   
    // Valido el Dia   
    if (isNaN(Dia) || parseInt(Dia, 10)<1 || parseInt(Dia, 10)>31){   
        alert('Día inválido')   
        return false   
    }   
    if (Mes==4 || Mes==6 || Mes==9 || Mes==11 || Mes==2) {   
        if (Mes==2 && Dia > 28 || Dia>30) {   
            alert('Día inválido')   
            return false   
        }   
    } 
  </script>
  <%--mensaje--%>
  <p align="center" class="T9L"><%String mensaje = messageBean.getMsg();%><%=mensaje%></p>
  <center>
    <%String boton ="Guardar";
  //Boton salir
  if ((mensaje.equals("Horario Guardado")&&opcion==null)||(mensaje.equals("Horario Modificado")&&opcion!=null)||(mensaje.equals("Horario Borrado")&&opcion!=null)||(mensaje.equals("No hay configuración inicial establecida por el administrador")&&opcion==null))
  {
	 boton ="Salir";%>
	 <form target="_top"   method="post" action="../controller/configuracionTutController.jsp"> 
  <%}
  if ((mensaje.equals("") &&opcion==null)||(mensaje.equals("Error hora incorrecta") &&opcion==null)||(mensaje.equals("Error fecha incorrecta") &&opcion==null)|| (mensaje.equals("Fecha vacía") &&opcion==null)||( mensaje.equals("Ninguna asignatura seleccionada")&&opcion==null))
  {%>
    <form   method="post" onSubmit="return Validar(this);" action="../controller/configuracionTutController.jsp?idProfesor=<%=configuracionTutBean.getIdProfesor(0)%>" rel="gb_page[450,400]"> 
	</TD></TR></TABLE>
  <table  width="508" align="center" >
    <%String opc=request.getParameter("opc");%>
  </table>
  <%--Datos del horario de tutoría--%>
  <table  width="519" align="center" >
    <tr valign="middle" > 
      
    <td height="27" rowspan="2" class="T10L" >Fecha Inicio (dd/mm/yyyy):</font></div></td>
      <td height="12" class="T10" valign="middle"> <p align="left">
          <select name="diaI" >
            <%for (int i=1;i<=31;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="mesI" >
            <%for (int i=1;i<=12;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="anyoI" >
            <%for (int i=2010;i<=2030;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
        </p>
        
          </td>
    </tr>
    <tr valign="middle" > 
       </tr>
    <tr valign="middle" > 
      
      <td height="24" class="T10L" >Fecha Fin (dd/mm/yyyy):</font></div></td>
      <td width="296" height="24" class="T10"> 
        <div align="left"> 
          <select name="diaF" >
            <%for (int i=1;i<=31;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="mesF" >
            <%for (int i=1;i<=12;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
          / 
          <select name="anyoF" >
            <%for (int i=2010;i<=2030;i++)
		  {%>
            <option value=<%=i%>><%=i%></option>
            <%}%>
          </select>
        </div></td>
    </tr>
    <tr valign="middle"> 
      <td width="211" height="26" class="T10L" >D&iacute;a:</font></div></td>
      <td colspan="2" class="T10"><div align="left"> 
          <select name="dia" id="dia">
            <option value="1">Lunes</option>
            <option value="2">Martes</option>
            <option value="3">Miercoles</option>
            <option value="4">Jueves</option>
            <option value="5">Viernes</option>
            <option value="6">Sabado</option>
            <option value="7">Domingo</option>
          </select>
        </div></td>
    </tr>
    <tr valign="middle" > 
      <td height="26" class="T10L" >Hora Inicio:</font></div></td>
      <td colspan="2" class="T10"> <div align="left"><font color="#8c1229"> 
          <select name="horaInicio" >
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
            <option>13</option>
            <option>16</option>
            <option>17</option>
            <option>18</option>
            <option>19</option>
          </select>
          h 
          <select name="minutosInicio" >
            <option>00</option>
            <option>15</option>
            <option>30</option>
            <option>45</option>
          </select>
          min</font></div></td>
    </tr>
    <tr valign="middle" > 
      <td height="26" class="T10L" >Hora Fin:</font></div></td>
      <td colspan="2" class="T10"> <p align="left"><font color="#8c1229"> 
          <select name="horaFin" id="horaFin">
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
            <option>13</option>
            <option>14</option>
            <option>17</option>
            <option>18</option>
            <option>19</option>
            <option>20</option>
          </select>
          h 
          <select name="minutosFin" >
            <option>00</option>
            <option>15</option>
            <option>30</option>
            <option>45</option>
          </select>
          min</font></p></td>
    </tr>
    <tr valign="middle" > 
      <td height="28" class="T10L" >Asignaci&oacute;n:</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> <font color="#8c1229"> 
          <select name="asignacion" id="select3">
            <option value="1">Al Inicio</option>
            <option value="2">Al Final</option>
          </select>
          </font></p></td>
    </tr>
    <%--Los datos de la configuración global viene predeterminados al crear un nuevo horario--%>
    <tr valign="middle" > 
      <td height="26" class="T10L" >Metodo Asignacion:</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> <font color="#8c1229"> 
          <input disabled name="metodoAsignacion" type="text" size="15" <%if (confInicialBean.getMetodo()==1){%>value="Manual"<%}else{%>value="Automatico"<%}%>/>
          </font></p></td>
    </tr>
    <tr valign="middle" > 
      <td height="27" class="T10L" >Tiempo Maximo Espera:</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> 
          <input disabled name="tiempoMaxEspera" type="text" size="5" value="<%=confInicialBean.getTiempoEspera()%>"/>
          <font color="#8c1229"> h</font> </p></td>
    </tr>
    <tr valign="middle" > 
      <td height="27" class="T10L" >Prevision Minima:</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> 
          <input disabled name="previsionMinima" type="text" size="5" value="<%=confInicialBean.getPrevisionMinima()%>"/>
          <font color="#8c1229"> h</font> </p></td>
    </tr>
    <tr valign="middle" > 
      <td height="26" class="T10L" >N&uacute;mero Ausencias :</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> 
          <input disabled name="nAusencias" type="text" size="5" value="<%=confInicialBean.getNAusencias()%>"/>
        </p></td>
    </tr>
    <tr valign="middle" > 
      <td height="28" class="T10L" >Slot :</font></div></td>
      <td colspan="2" class="T10"> <p align="left"> 
          <input disabled name="slot" type="text" size="5" value="<%=confInicialBean.getSlot()%>"/>
        </p></td>
    </tr>
    <tr valign="middle" > 
      <td height="18" class="T10L" >Asignaturas:</font></div></td>
      <td colspan="2" rowspan="2" class="T10"> <p align="left"> <font color="#8c1229"> 
          <%--Lista de todas las asiganturas que imparte el profesor--%>
          <%for (int i=0;i<asignaturaProfBean.getContador();i++)
		   {%>
          </font></p>
        <table  width="296" >
          <tr valign="middle" > 
            <td width="20" class="T10L" > <input type="checkbox"  name="<%=asignaturaProfBean.getAsignatura(i)%><%=profBean.getTitulacion(i,0)%>" value="<%=asignaturaProfBean.getId(i)%>" /> </font> 
            </td>
            <td width="264" class="T10"><div align="left"><font color="#8c1229"><%=asignaturaProfBean.getAsignatura(i)%> 
                (<%=profBean.getTitulacion(i,0)%>)</font></div></td>
          </tr>
        </table>
        <p><font color="#8c1229"> 
          <%}%>
          </font></p></td>
    </tr>
    <tr valign="middle" > 
      <td height="68" class="T10">&nbsp;</td>
    </tr>
  </table>
  <%}
	String disabled=null;
	if (opcion!=null&&(mensaje.equals("")||mensaje.equals("Error hora incorrecta")||mensaje.equals("Error fecha incorrecta")|| mensaje.equals("Fecha vacía"))|| mensaje.equals("Ninguna asignatura seleccionada")&&opcion!=null)
	{
	 if (opcion.equals("editar"))
	 	boton ="Cambiar";
	 else
	 {
	    boton ="Borrar";
		disabled ="disabled";
	 }%>
  <form name="form" method="post" onSubmit="return Validar(this);" action="../controller/configuracionTutController.jsp?opcion=<%=opcion%>&disabled=<%=disabled%>&idConfTut=<%=configuracionTutBean.getIdConfTut(0)%>">
    <div align="center">
	<%--Datos del horario de tutoría que desea modificar o eliminar--%>
      <table  width="369" align="center" class="T10L">
        <tr valign="middle" > 
          <td height="28" class="T10L" > <div align="left">Fecha Inicio (dd/mm/yyyy):</font></div></td>
          <td class="T10"> <p align="left"> 
		  <%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		  String cadenaFechaInicio = formato.format(configuracionTutBean.getFechaInicio(0));
		  String cadenaFechaFin = formato.format(configuracionTutBean.getFechaFin(0));%>
              <input name="fechaInicio" type="text" id="fechaInicio" disabled value="<%=cadenaFechaInicio%>" />
            </p></td>
        </tr>
        <tr valign="middle" > 
          <td height="27" class="T10L" >Fecha Fin (dd/mm/yyyy):</td>
          <td class="T10">
              <input name="fechaFin" <%=disabled%> type="text" id="fechaFin" value="<%=cadenaFechaFin%>" />
          </td>
        </tr>
        <tr valign="middle"> 
          <td width="179" height="28" class="T10L"> D&iacute;a:</td>
          <td width="178" class="T10"><div align="left"> 
              <select name="dia" disabled>
                <option value="1" <%if (configuracionTutBean.getDia(0)==1){%> selected<%}%>>Lunes</option>
                <option value="2" <%if (configuracionTutBean.getDia(0)==2){%> selected<%}%>>Martes</option>
                <option value="3" <%if (configuracionTutBean.getDia(0)==3){%> selected<%}%>>Miercoles</option>
                <option value="4" <%if (configuracionTutBean.getDia(0)==4){%> selected<%}%>>Jueves</option>
                <option value="5" <%if (configuracionTutBean.getDia(0)==5){%> selected<%}%>>Viernes</option>
				<option value="5" <%if (configuracionTutBean.getDia(0)==6){%> selected<%}%>>Sabado</option>
			    <option value="5" <%if (configuracionTutBean.getDia(0)==7){%> selected<%}%>>Domingo</option>
              </select>
            </div></td>
        </tr>
        <tr valign="middle" > 
          <td height="27" class="T10L"> Hora Inicio:</td>
          <td class="T10"> <div align="left"><font color="#8c1229"> 
              <select name="horaInicio" <%=disabled%>>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==8){%> selected<%}%>>08</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==9){%> selected<%}%>>09</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==10){%> selected<%}%>>10</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==11){%> selected<%}%>>11</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==12){%> selected<%}%>>12</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==13){%> selected<%}%>>13</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==16){%> selected<%}%>>16</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==17){%> selected<%}%>>17</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==18){%> selected<%}%>>18</option>
                <option  <%if (configuracionTutBean.getHoraInicio(0)==19){%> selected<%}%>>19</option>
              </select>
              h 
              <select name="minutosInicio" <%=disabled%>>
                <option<%if (configuracionTutBean.getMinutosInicio(0)==0){%> selected<%}%>>00</option>
                <option<%if (configuracionTutBean.getMinutosInicio(0)==15){%> selected<%}%>>15</option>
                <option<%if (configuracionTutBean.getMinutosInicio(0)==30){%> selected<%}%>>30</option>
                <option<%if (configuracionTutBean.getMinutosInicio(0)==45){%> selected<%}%>>45</option>
              </select>
              min </font></div></td>
        </tr>
        <tr valign="middle" > 
          <td height="29" class="T10L"> Hora Fin:</td>
          <td class="T10"> <p align="left"><font color="#8c1229"> 
              <select name="horaFin" <%=disabled%>>
                <option  <%if (configuracionTutBean.getHoraFin(0)==9){%> selected<%}%>>09</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==10){%> selected<%}%>>10</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==11){%> selected<%}%>>11</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==12){%> selected<%}%>>12</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==13){%> selected<%}%>>13</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==14){%> selected<%}%>>14</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==17){%> selected<%}%>>17</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==18){%> selected<%}%>>18</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==19){%> selected<%}%>>19</option>
                <option  <%if (configuracionTutBean.getHoraFin(0)==20){%> selected<%}%>>20</option>
              </select>
              h 
              <select name="minutosFin" <%=disabled%>>
                <option<%if (configuracionTutBean.getMinutosFin(0)==0){%> selected<%}%>>00</option>
                <option<%if (configuracionTutBean.getMinutosFin(0)==15){%> selected<%}%>>15</option>
                <option<%if (configuracionTutBean.getMinutosFin(0)==30){%> selected<%}%>>30</option>
                <option<%if (configuracionTutBean.getMinutosFin(0)==45){%> selected<%}%>>45</option>
              </select>
              min </font></p></td>
        </tr>
        <tr valign="middle" > 
          <td height="27" class="T10L"> Asignaci&oacute;n:</td>
          <td class="T10"> <p align="left"> <font color="#8c1229"> 
              <select name="asignacion" <%=disabled%> id="select3">
                <option value="1" <%if (configuracionTutBean.getAsignacion(0)==1){%> selected<%}%>>Al 
                Inicio</option>
                <option value="2" <%if (configuracionTutBean.getAsignacion(0)==2){%> selected<%}%>>Al 
                Final</option>
              </select>
              </font></p></td>
        </tr>
      </table>
      <%}%>
      <p><input type="submit" name="Submit" value=<%=boton%> class="boton" />
	  <%if (boton!="Salir") 
	  {%>
	  	<input  onClick="document.salir.action='../controller/configuracionTutController.jsp'; document.salir.submit()"; name="submit" type="button" value="Cancelar" class="boton" />
	  <%}%>	
    </p></div>
  </form>
  <div align="center">
    <%if (boton!="Salir")  {%>
  </div>
  <form  name="salir"method="post" action="../controller/configuracionTutController.jsp" target="_top">
    </form>
	<%}%>
	
  <p><font color="#8c1229"> 
    <tr>
      <td>&nbsp; </td>
    </tr>
  </font></p> 
</center>
</body>
</html>