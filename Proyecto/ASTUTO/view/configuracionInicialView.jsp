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
<jsp:useBean id="confInicialBean" class="uco.interfaz.ConfInicialBean" scope="session"/>

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
<jsp:include page="../view/menuAdmin.jsp"/>
<%--enlace al inicio de la pagina--%> <a name="inicio"></a>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"> <tbody>
    <tr> 
        <td class="T24" align="right"><font color="#ffffff">C&nbsp;o&nbsp;n&nbsp;f&nbsp;i&nbsp;g&nbsp;u&nbsp;r&nbsp;a&nbsp;c&nbsp;i&nbsp;&oacute;&nbsp;n&nbsp;</font></td>
    </tr>
</tbody></table>
  </td>
 </tr>
 <tr valign="top">
   <td>
    <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
        <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
        <td class="T10a"> 
          <table width="315" height="167"  >
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td width="276" height="20"  class="T10L"><a href="#saliente" class="T10L"> 
                Correo Saliente </a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td  width="21" height="20" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="20" class="T10L"><a href="#eliminar" class="T10L"> Correo 
                Mis Tutor&iacute;as</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td  width="21" height="20" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="20"  class="T10L"> <a href="#manual" class="T10L">Correo 
                Tutor&iacute;a Eliminada</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="23" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="23" class="T10L"><a href="#modificar"class="T10L">Correo 
                Modificaci&oacute;n Tutor&iacute;a</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="23" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="23" class="T10L"><a href="#confirmar"class="T10L">Correo 
                Confirmar Solicitud en Curso</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td  width="21" height="23" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="23" class="T10L"><a href="#codigo"class="T10L">Correo 
                Env&iacute;o C&oacute;digo Mis Tutor&iacute;as</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td  width="21" height="20" class="T10L"><img alt="" src="../images/op_a2.gif" /></td>
              <td height="20"  class="T10L"><a href="#tutoria" class="T10L">Par&aacute;metros 
                Configuraci&oacute;n Tutor&iacute;a Profesor</a></td>
            </tr>
          </table>
          <p>&nbsp;</p>
		<form name="form1" method="post" action="../controller/configuracionInicialController.jsp?opcion=<%="a"%>">                
            <table width="173" height="36" >
                <tr border="0"> 
                    <td bordercolor="#FFFFFF" width="161" class="T10L" height="26" align="center"><strong><font size="3"><a name="saliente"></a>Correo Saliente</font></strong></td>
                </tr>
            </table><%--Datos de la configuración inicial--%>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
                <tr border="0"> 
                    <td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                        <table height="367" align="center" >
                    <tr border="0" > 
                      <td bordercolor="#FFFFFF" height="24" class="T10L" ><p>Asunto</p></td>
                      <td><input name="asuntoPeticion" type="text" value="<%=confInicialBean.getAsunto(0)%>" size="50" maxlength="100" /></td>
                    </tr>
                    <tr border="0" > 
                      <td height="18" class="T10L"> <p>Motivo</p></td>
                      <td rowspan="2"> <textarea name="motivoPeticion" cols="50" rows="10" ><%=confInicialBean.getMotivo(0)%></textarea></td>
                    </tr>
                    <tr border="0" > 
                      <td height="67" class="T10L">&nbsp;</td>
                    </tr>
                    <tr border="0" > 
                      <td height="30" class="T10L">
<p>Enlace</p></td>
                      <td> <input name="enlacePeticion" type="text" value="<%=confInicialBean.getEnlace(0)%>"  size="50" maxlength="200" /></td>
                    </tr>
                    <tr border="0" > 
                      <td width="83" height="26" rowspan="8" class="T10L"><p>&nbsp;</p></td>
                      <td width="297" class="T8"><p>[[PROFESOR]]: Nombre y apellidos 
                          del profesor.</p></td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ASIGNATURA]]: Nombre de la asignatura.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[MOTIVO]]: Motivo de la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[FECHA]]: D&iacute;a asignado para la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[HORA]]: Hora asignada para la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACEACEPTAR]]: Enlace para aceptar la 
                        tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACERECHAZAR]]: Enlaces para rechazar 
                        la tutor&iacute;a.</td>
                    </tr>
                  </table>
                        <p align="center"> <input type="submit" name="Submit6" value="Guardar Cambios" class="boton" />
</p>
                        <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> </p></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="195" height="36"   >
                <tr border="0"> 
                    
                <td bordercolor="#FFFFFF" width="187" class="T10L" height="26" align="center"><strong><font size="3"><a name="eliminar"></a>Correo 
                  Mis Tutor&iacute;as</font></strong></td>
                </tr>
            </table>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
                <tr border="0"> 
					<td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                    <table height="163" align="center" >
                    <tr > 
                      <td  height="24" class="T10L"><p>Asunto</p></td>
                      <td> <input name="asuntoTutorias" type="text" value="<%=confInicialBean.getAsunto(1)%>"  size="50" maxlength="100"/> 
                      </td>
                    </tr>
                    <tr> 
                      <td height="18" class="T10L"> <p>Motivo</p></td>
                      <td rowspan="2"> <textarea name="motivoTutorias" cols="50" rows="10" ><%=confInicialBean.getMotivo(1)%></textarea></td>
                    </tr>
                    <tr> 
                      <td height="78" class="T10L">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="84" height="31" class="T10L"><p>Enlace</p></td>
                      <td width="296"> <input name="enlaceTutorias" type="text" value="<%=confInicialBean.getEnlace(1)%>" size="50" maxlength="200"/></td>
                    </tr>
                    <tr border="0" > 
                      <td width="83" height="26" rowspan="8" class="T10L"><p>&nbsp;</p></td>
                      <td width="297" class="T8"><p>[[PROFESOR]]: Nombre y apellidos 
                          del profesor.</p></td>
                    </tr>
                    <tr border="0" > </tr>
                    <tr border="0" > 
                      <td class="T8">[[ASIGNATURA]]: Nombre de la asignatura.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[MOTIVO]]: Motivo de la tutor&iacute;a.</td>
                    </tr>
                    
                    <tr border="0" > 
                      <td class="T8">[[ESTADO]]: Estado de la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACEBORRAR]]: Enlaces para eliminar la 
                        tutor&iacute;a.</td>
                    </tr>
                  </table>
                    <p align="center">  <input type="submit" name="Submit5" value="Guardar Cambios" class="boton" />
</p>
                    <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> </p></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="228" height="36"  >
                <tr border="0"> 
                    
                <td bordercolor="#FFFFFF" width="246" class="T10L" height="26" align="center"><strong><font size="3"><a name="manual"></a>Correo 
                  Tutor&iacute;a Eliminada</font></strong></td>
                </tr>
            </table>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
                <tr border="0"> 
                    <td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                        <table height="295" align="center">
                    <tr> 
                      <td height="24" class="T10L"><p>Asunto</p></td>
                      <td> <input name="asuntoManual" type="text" value="<%=confInicialBean.getAsunto(2)%>"  size="50" maxlength="100"/></td>
                    </tr>
                    <tr> 
                      <td height="18" class="T10L"> <p>Motivo</p></td>
                      <td rowspan="2"> <textarea name="motivoManual" cols="50" rows="10" ><%=confInicialBean.getMotivo(2)%></textarea> 
                      <td> </tr>
                    <tr> 
                      <td height="78" class="T10L">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="84" height="31" rowspan="5" class="T8">&nbsp;</td>
                      <td width="296" class="T8">[[PROFESOR]]: Nombre y apellidos del profesor.</td>
                    </tr>
                    <tr>
                      <td class="T8">[[ASIGNATURA]]: Nombre de la asignatura.</td>
                    </tr>
                    <tr>
                      <td class="T8">[[MOTIVO]]: Motivo de la tutor&iacute;a.</td>
                    </tr>
                    <tr>
                      <td class="T8">[[FECHA]]: D&iacute;a asignado para la tutor&iacute;a.</td>
                    </tr>
                    <tr>
                      <td class="T8">[[HORA]]: Hora asignada para la tutor&iacute;a.</td>
                    </tr>
                  </table>
                        <p align="center"> <input type="submit" name="Submit4" value="Guardar Cambios" class="boton" />
</p>
                        <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> </p></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="251" height="36"   >
                <tr border="0"> 
                    
                <td bordercolor="#FFFFFF" width="243" class="T10L" height="26" align="center"><strong><font size="3"><a name="modificar"></a>Correo 
                  Modificaci&oacute;n Tutor&iacute;a</font></strong></td>
                </tr>
            </table>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
                <tr border="0"> 
                    <td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                        <table height="163" align="center">
                            <tr> 
                                <td height="24" class="T10L"><p>Asunto</p></td>
                                <td> <input name="asuntoModificar" type="text" value="<%=confInicialBean.getAsunto(3)%>"  size="50" maxlength="100"/> </td>
                            </tr>
                            <tr> 
                                <td height="18" class="T10L"> <p>Motivo</p></td>
                                <td rowspan="2"> <textarea name="motivoModificar" cols="50" rows="10" ><%=confInicialBean.getMotivo(3)%></textarea></td>
                            </tr>
                            <tr> 
                                <td height="78" class="T10L">&nbsp;</td>
                            </tr>
                            <tr> 
                                <td width="84" height="31" class="T10L"><p>Enlace</p></td>
                                <td width="296"> <input name="enlaceModificar" type="text" value="<%=confInicialBean.getEnlace(3)%>" size="50" maxlength="200"/> </td>
                            </tr>
						<tr border="0" > 
                      <td width="83" height="26" rowspan="8" class="T10L"><p>&nbsp;</p></td>
                      <td width="297" class="T8"><p>[[PROFESOR]]: Nombre y apellidos 
                          del profesor.</p></td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ASIGNATURA]]: Nombre de la asignatura.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[MOTIVO]]: Motivo de la tutor&iacute;a.</td>
                    </tr>
					<tr border="0" > 
                      <td class="T8">[[ESTADO]]: Estado de la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[FECHA]]: D&iacute;a asignado para la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[HORA]]: Hora asignada para la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACEACEPTAR]]: Enlace para aceptar la 
                        tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACERECHAZAR]]: Enlaces para rechazar 
                        la tutor&iacute;a.</td>
                    </tr>
                        </table>
                        <p align="center"> <input type="submit" name="Submit3" value="Guardar Cambios" class="boton" />
</p>
                        <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> </p></td>
                </tr>
            </table>             
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="321" height="36"  >
              <tr border="0"> 
                <td bordercolor="#FFFFFF" width="337" class="T10L" height="26" align="center"><strong><font size="3"><a name="confirmar"></a>Correo 
                  Confirmar Solicitud en Curso</font></strong></td>
              </tr>
            </table>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
              <tr border="0"> 
                <td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                  <table height="368" align="center">
                    <tr> 
                      <td height="24" class="T10L"><p>Asunto</p></td>
                      <td> <input name="asuntoConfirmar" type="text" value="<%=confInicialBean.getAsunto(4)%>"  size="50" maxlength="100"/> 
                      </td>
                    </tr>
                    <tr> 
                      <td height="18" class="T10L"> <p>Motivo</p></td>
                      <td rowspan="2"> <textarea name="motivoConfirmar" cols="50" rows="10" ><%=confInicialBean.getMotivo(4)%></textarea></td>
                    </tr>
                    <tr> 
                      <td height="78" class="T10L">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="84" height="31" class="T10L"><p>Enlace</p></td>
                      <td width="296"> <input name="enlaceConfirmar" type="text" value="<%=confInicialBean.getEnlace(4)%>" size="50" maxlength="200"/> 
                      </td>
                    </tr>
					<tr border="0" > 
                      <td width="83" height="26" rowspan="8" class="T10L"><p>&nbsp;</p></td>
                      <td width="297" class="T8"><p>[[PROFESOR]]: Nombre y apellidos 
                          del profesor.</p></td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ASIGNATURA]]: Nombre de la asignatura.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[MOTIVO]]: Motivo de la tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACEACEPTAR]]: Enlace para aceptar la 
                        tutor&iacute;a.</td>
                    </tr>
                    <tr border="0" > 
                      <td class="T8">[[ENLACERECHAZAR]]: Enlaces para rechazar 
                        la tutor&iacute;a.</td>
                    </tr>
					<tr border="0" > 
                      <td height="15" class="T8">[[ENLACECODE]]: Enlace a m&iacute;s 
                        tutor&iacute;as.</td>
                    </tr>
					<tr border="0" > 
                      <td class="T8">[[CODE]]: C&oacute;digo para ver sus tutor&iacute;as.</td>
                    </tr>
                  </table>
                  <p align="center"> 
                    <input type="submit" name="Submit32" value="Guardar Cambios" class="boton" />
</p>
                  <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> </p></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="321" height="36"  >
              <tr border="0"> 
                <td bordercolor="#FFFFFF" width="337" class="T10L" height="26" align="center"><strong><font size="3"><a name="codigo" id="codigo"></a>Correo 
                  Env&iacute;o C&oacute;digo Mis Tutor&iacute;as</font></strong></td>
              </tr>
            </table>
            <table width="500" height="313"  bordercolor="#8c1229" border="2"  >
              <tr border="0"> 
                <td width="534" height="303" bordercolor="#FFFFFF" class="T10L"> 
                  <table height="163" align="center">
                    <tr> 
                      <td height="24" class="T10L"><p>Asunto</p></td>
                      <td> <input name="asuntoCode" type="text" value="<%=confInicialBean.getAsunto(5)%>"  size="50" maxlength="100"/> 
                      </td>
                    </tr>
                    <tr> 
                      <td height="18" class="T10L"> <p>Motivo</p></td>
                      <td rowspan="2"> <textarea name="motivoCode" cols="50" rows="10" ><%=confInicialBean.getMotivo(5)%></textarea></td>
                    </tr>
                    <tr> 
                      <td height="78" class="T10L">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="84" height="31" class="T10L"><p>Enlace</p></td>
                      <td width="296"> <input name="enlaceCode" type="text" value="<%=confInicialBean.getEnlace(5)%>" size="50" maxlength="200"/> 
                      </td>
                    </tr>
                    <tr border="0" > 
                      <td width="83" height="26" rowspan="8" class="T10L"><p>&nbsp;</p></td>
                      <td width="297" class="T8"><p>[[CODE]]: C&oacute;digo para 
                          ver sus tutor&iacute;as.</p></td>  
                    </tr>
					<tr border="0" > 
                      <td width="297" class="T8"><p>[[ENLACECODE]]: Enlace a mis 
                          tutor&iacute;as.</p></td>  
                    </tr>
                    <tr border="0" > 
                      
                    </tr>
                  </table>
                  <p align="center"> 
                    <input type="submit" name="Submit322" value="Guardar Cambios" class="boton" />
                  </p>
                  <p align="right"><a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> 
                  </p></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="365" height="36"    >
                <tr border="0"> 
                    
                <td bordercolor="#FFFFFF" width="375" class="T10L" height="26" align="center"><strong><font size="3"><a name="tutoria"></a>Par&aacute;metros 
                  Configuraci&oacute;n Tutor&iacute;a Profesor</font></strong></td>
                </tr>
            </table>
            <table width="500" height="207"  bordercolor="#8c1229" border="2"  >
                <tr border="0"> 
                    <td width="534" height="197" bordercolor="#FFFFFF" class="T10L"> 
                        <table width="477" height="148" align="center">
                    <tr> 
                      <td height="24" class="T10L"><p align="left">Slot</p></td>
                      <td class="T10L"><input name="slot" type="text" value="<%=confInicialBean.getSlot()%>" size="6" maxlength="4" />
                        min </td>
                    </tr>
                    <tr> 
                      <td height="24" class="T10L"><p align="left">Método Asignación</p></td>
                      <td><select name="metodoAsignacion">
                          <option <%if(confInicialBean.getMetodo()==2){%>selected<%}%> value="2">Autom&aacute;tico</option>
                          <option <%if(confInicialBean.getMetodo()==1){%>selected<%}%> value="1">Manual</option>
                        </select> </td>
                    </tr>
                    <tr> 
                      <td height="31" class="T10L"><p align="left">Prevision M&iacute;nima</p></td>
                      <td class="T10L"><input name="previsionMinima" type="text" value="<%=confInicialBean.getPrevisionMinima()%>" size="6" maxlength="4"  />
                        h </td>
                    </tr>
                    <tr> 
                      <td height="31" class="T10L"><p align="left">Tiempo M&aacute;ximo 
                          de Espera</p></td>
                      <td class="T10L"><input name="tiempoMaxEspera" type="text" value="<%=confInicialBean.getTiempoEspera()%>" size="6" maxlength="4"  />
                        h </td>
                    </tr>
                    <tr> 
                      <td width="174" height="24" class="T10L"> <p align="left">Número 
                          Ausencias </p></td>
                      <td width="291"><input name="nAusencias" type="text" value="<%=confInicialBean.getNAusencias()%>" size="6" maxlength="4"/></td>
                    </tr>
                  </table>
                        
                  <p align="center"> 
                    <input type="submit" name="Submit2" value="Guardar Cambios" class="boton" />
                  </p>
                  <p align="right">                    <a href="#inicio"><img src="../images/inicio_1.gif" width="78" height="47" border="0" align="absmiddle" title="Ir al principio" /></a> 
                  </p></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <p align="center">&nbsp;</p>
          </form>
  <%-- Incluimos el pie de pagina --%>		                                                                                      
  <jsp:include page="../view/pie.jsp"/>
</body></html>