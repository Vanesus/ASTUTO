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
<jsp:useBean id="enlacesBean" class="uco.interfaz.EnlacesBean" scope="session"/>
<jsp:useBean id="loginBean" class="uco.interfaz.UserBean" scope="session"/>
 
 <td align="left">
 <table border="0" cellpadding="1" cellspacing="0"><tbody><tr>
<a href="../controller/principalProfesorController.jsp">&nbsp;<FONT COLOR="#ffffff"><b>>>Zona&nbsp;Privada&nbsp;Profesor</b></font></a> 
    
    </tr></tbody></table>
</td>
<td width="27%" align="left">
 <table border="0" cellpadding="1" cellspacing="0">
  <tbody>
  <tr aling ="right">
  <%--Login del usuario logado--%>
  &nbsp;<FONT COLOR="#FFFFFF"><B>Bienvenid@&nbsp;<% String texto=loginBean.getUser() ;%><%=texto%></B></FONT><a href="../controller/cerrarSesionController.jsp">&nbsp;&nbsp;&nbsp;<FONT COLOR="#FFFFFF"><I>(Salir)</I></font></a>     
  </tr>
  </tbody>
  </table>
  </td>	  
  </tr>
<tr><td colspan="2" bgcolor="#FFBD58"><img src="../images/p.gif" width="1" height="3"></td></tr>

</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr valign="top"><td colspan="5" bgcolor="#ffffff"><img src="../images/p.gif" width="1" height="3"></td></tr>
<tr valign="top">
  <td bgcolor="#ffffff"><img src="../images/p.gif" width="3" height="1"></td>
            <td bgcolor="#ffffff" width="180" height="458"> 
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                  <tr>
                    <td align="center" bgcolor="#8c1229" width="33">
					    <table border="0" cellpadding="2" cellspacing="2">
                        <tbody>
                          <tr> 
                            <td><img src="../images/t.gif" width="25" height="25" /></td>
                          </tr>
                        </tbody>
                        </table></td>
                    <td width="140">
					  <table border="0" cellpadding="2" cellspacing="2"> <tbody>
                       <tr> 
                           <td class="T10L"><b>Tutorías</b></td>
                       </tr>
                      </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr>
				  <%--Menu del profesor--%>
                    <td bgcolor="#8c1229"><img src="../images/p.gif" width="33" height="8" /></td>
                    <td> <table border="0" cellpadding="1" cellspacing="1">
                         <tbody>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20" /></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12" /></td>
                            <td width="106"align="left"><a href="../controller/misTutoriasController.jsp" class="T8L">&nbsp;Mis tutorías </a></td>
                          </tr>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20" /></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12" /></td>
                            <td align="left"><a href="../controller/diarioTutoriasController.jsp" class="T8L">&nbsp;Diario Tutorías</a></td>
                          </tr>
                        </tbody></table>
					</td>
                  <tr> 
                    <td background="../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td background="../images/brh2.gif" width="140"><img src="../images/p.gif" width="140" height="1"></td>
                    <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
                  </tr>
                  <tr> 
                    <td align="center" bgcolor="#8c1229" width="33">
					    <table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td><img src="../images/c.gif" width="25" height="25" /></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="140">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td class="T10L"><b>Configuración</b></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td width="140"> 
						<table border="0" cellpadding="1" cellspacing="1"><tbody>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12"></td>
                            <td align="left"><a href="../controller/perfilPublicoProfesorController.jsp" class="T8L" >&nbsp;Perfil Público</a></td>
                          </tr>
						   <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20" /></td>
                            <td><img src="../images/tri_r.gif" name="t31" width="9" height="12" id="t31" /></td>
                            <td align="left"><a href="../controller/perfilPublicoProfesorController.jsp?opcion=contrasena" rel="gb_page[450,400]" class="T8L">&nbsp;Cambiar Contrase&ntilde;a</a></td>
                          </tr>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12"></td>
                            <td align="left"><a href="../controller/configuracionTutController.jsp" class="T8L" >&nbsp;Configuración Horario Tutor&iacute;as</a></td>
                          </tr>
                          <tr valign="top"> 
                            <td><img src="../images/p.gif" width="6" height="20" /></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12" /></td>
                            <td align="left"><a href="../controller/configuracionSlotController.jsp" class="T8L" >&nbsp;Configuraci&oacute;n Global </a></td>
                          </tr>
                        </tbody></table>
					</td>
                  </tr>
                  <tr> 
                    <td background="../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td background="../images/brh2.gif" width="140"><img src="../images/p.gif" width="140" height="1"></td>
                    <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
                  </tr>
                  <tr> 
                    <td align="center" bgcolor="#8c1229" width="33">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td><img src="../images/a.gif" width="25" height="25"></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="140">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td class="T10L"><b>Alumnos</b></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td width="140"> 
						<table border="0" cellpadding="1" cellspacing="1"><tbody>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                            <td><img src="../images/tri_r.gif" name="t31" width="9" height="12"></td>
                            <td align="left"><a href="../controller/listadoAlumnosProfesorController.jsp?login=<%=loginBean.getUser()%>" class="T8L">&nbsp;Listado Alumnos</a></td>
                          </tr>
                        </tbody></table>
					</td>
                  </tr>
                  <tr> 
                    <td background="../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="1"></td>
                    <td background="../images/brh2.gif" width="140"><img src="../images/p.gif" width="140" height="1"></td>
                    <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
                  </tr>
                  <tr> 
                    <td align="center" bgcolor="#8c1229" width="33">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td><img src="../images/e.gif" width="25" height="25" /></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="140">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr>
                            <td class="T10L"><b>Enlaces Interes</b></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
                    <td width="140"> 
                      <%for (int i=0;i<enlacesBean.getContador();i++)
	    {%>
                      <table border="0" cellpadding="1" cellspacing="1"><tbody>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                            <td><img src="../images/tri_r.gif" width="9" height="12"></td>
                            <td><a target="_black" href="<%=enlacesBean.getUrl(i)%>" class="T8L">&nbsp;<%=enlacesBean.getNombre(i)%></a></td>
                          </tr>
                        </tbody>
                      </table>
                      <%}%>
                    </td>
                  </tr>
                  <tr> 
                    <td background= "../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td background= "../images/brh2.gif" width="140"><img src="../images/p.gif" width="140" height="1"></td>
                    <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
                  </tr>
                  <tr> 
                    <td align="center" bgcolor="#8c1229" width="33">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td><img src="../images/a.gif" width="25" height="25"></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="140">
						<table border="0" cellpadding="2" cellspacing="2"><tbody>
                          <tr> 
                            <td class="T10L"><b>Ayuda</b></td>
                          </tr>
                        </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
                    <td width="140"> 
						<table border="0" cellpadding="1" cellspacing="1"> <tbody>
                          <tr valign="top"> 
                            <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                            <td><img src="../images/tri_r.gif" name="t31" width="9" height="12"></td>
                            <td align="left"><a href="../view/ayudaPrincipalProfView.jsp" class="T8L">&nbsp;Ayuda</a></td>
                          </tr>
                        </tbody></table>
					</td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
                    <td width="140"> 
						<table border="0" cellpadding="1" cellspacing="1"><tbody>
                          <tr valign="top"> </tr>
                        </tbody></table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td width="140"> 
						<table border="0" cellpadding="1" cellspacing="1"> <tbody>
                          <tr valign="top"> 
                        </tbody> </table>
					</td>
                    <td width="7"></td>
                  </tr>
                  <tr> 
                    <td background= "../images/brh1Alum.gif" width="33"></td>
                  </tr>
                  <tr> 
                    <td background= "../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="8"></td>
                    <td background= "../images/brh2.gif" width="140"><img src="../images/p.gif"width="140" height="1"></td>
                    <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
                  </tr>
                </tbody>
              </table>
  
  </td>
  <td bgcolor="#ffffff"><img src="../images/p.gif"width="6" height="1"></td>
  <td background= "../images/brv.gif" width="1"><img src="../images/p.gif" width="1" height="1"></td>
  <td align="center" background= "../images/corp2.jpg" width="570">
 <table width="100%" height="63"border="0" cellpadding="3" cellspacing="3" background= "../images/p.gif">
                <tr valign="top">
<td>