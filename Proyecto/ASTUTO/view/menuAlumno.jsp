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

 <td align="left">
	<table border="0" cellpadding="1" cellspacing="0"><tbody>
    <tr> <a href="../controller/principalController.jsp">&nbsp;<font color="#FFFFFF" class="T10I"><strong>>>Inicio</strong></font></a>
    </tr>
    </tbody></table>
 </td>
 <%--Iniciar sesion con otro login--%>
 <td align="right" class="T10I"> <a href="../controller/loginController.jsp" title="Iniciar sesión"> <FONT COLOR="#FFFFFF"><strong>Iniciar Sesión </strong></FONT></a></td>
</tr>
<tr>
  <td colspan="2" bgcolor="#FFBD58"><img src="../images/p.gif" width="1" height="3"></td>
</tr>
</table>

 <table border="0" cellpadding="0" cellspacing="0" width="100%">
 <tr valign="top">
    <td colspan="5" bgcolor="#ffffff"><img src="../images/p.gif" width="1" height="3"></td>
  </tr>
  <tr valign="top">
    <td bgcolor="#ffffff"><img src="../images/p.gif" width="3" height="1"></td>
    <td bgcolor="#ffffff" width="180" height="100%"> 
		<table width="100%"  border="0" cellpadding="0" cellspacing="0"><tbody>
        <tr> 
          <td width="33" height="33" align="center" bgcolor="#8c1229"> 
            <table border="0" cellpadding="2" cellspacing="2"> <tbody>
            <tr> 
                <td height="29"><img src="../images/t.gif" width="25" height="25"></td>
            </tr>
            </tbody></table>
		  </td>
          <td width="140">
			<table border="0" cellpadding="1" cellspacing="2"> <tbody>
             <tr> 
                <td class="T10L"><b>Tutorias</b></td>
             </tr>
            </tbody></table>
		   </td>
           <td width="7"></td>
        </tr>
        <tr> 
		<%--Menu del alumno--%>
           <td bgcolor="#8c1229" width="33" height="70"><img src="../images/p.gif" width="33" height="1"></td>
           <td width="140"> 
		     <table border="0" cellpadding="1" cellspacing="1" height="70"> <tbody>
             <tr valign="top"> 
                 <td width="6" ><img src="../images/p.gif" width="6" height="20"></td>
                 <td width="10"><img src="../images/tri_r.gif" name="t21" width="9" height="12"></td>
                 <td width="200" height="25"><a href="../controller/peticionTutController.jsp" class="T8L">&nbsp;Petición Tutoría</a></td>
             </tr>
             <tr valign="top"> 
                 <td width="6" height="25"><img src="../images/p.gif" width="6" height="20"></td>
                 <td><img src="../images/tri_r.gif" name="t22" width="9" height="12"></td>
                 <td width="200" height="25"><a href="../controller/buscarProfController.jsp" class="T8L">&nbsp;Buscar Profesor</a></td>
             </tr>
             <tr valign="top"> 
                 <td width="6" height="25"><img src="../images/p.gif" width="6" height="20"></td>
                 <td><img src="../images/tri_r.gif" name="t23" width="9" height="12"></td>
                 <td width="105" height="25"><a href="../controller/tutoriasAlumnosController.jsp" class="T8L">&nbsp;Mis Tutorías</a></td>
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
                <td height="29"><img src="../images/e.gif" width="25" height="25"></td>
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
             <%for (int i=0;i<enlacesBean.getContador();i++){%>
               <table border="0" cellpadding="1" cellspacing="1"><tbody>
                <tr valign="top"> 
                    <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                    <td><img src="../images/tri_r.gif" name="t31" width="9" height="12"></td>
                    <td class="T8L"><a target="_black" href="<%=enlacesBean.getUrl(i)%> "><font color="#8c1229">&nbsp;<%=enlacesBean.getNombre(i)%></font></a></td>
                </tr>
               </tbody></table> <%}%>
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
                    <td><img src="../images/a.gif" width="25" height="25"></td>
                </tr>
              </tbody> </table>
			</td>
            <td width="140">
			  <table border="0" cellpadding="2" cellspacing="2"> <tbody>
                <tr> 
                    <td class="T10L"><b>Ayuda</b></td>
                </tr>
              </tbody> </table>
			</td>
            <td width="7"></td>
        </tr>
        <tr> 
            <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
            <td width="140"> 
			  <table border="0" cellpadding="1" cellspacing="1"><tbody>
                <tr valign="top"> 
                    <td width="6"><img src="../images/p.gif" width="6" height="20"></td>
                    <td><img src="../images/tri_r.gif" name="t31" width="9" height="12"></td>
                    <td class="T8L"><a class="T8L" href="../controller/ayudaController.jsp">&nbsp;Ayuda</a></td>
                </tr>
              </tbody> </table>
			</td>
        </tr>
        <tr> 
            <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
            <td width="140"></td>
            <td width="7"></td>
        </tr>
        <tr> 
            <td bgcolor="#8c1229" width="33"><img src="../images/p.gif" width="33" height="1"></td>
            <td width="140"> </td>
            <td width="7"></td>
        </tr>
        <tr> 
            <td background="../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="1"></td>
        </tr>
        <tr> 
            <td background="../images/brh1Alum.gif" width="33"><img src="../images/p.gif" width="33" height="1"></td>
            <td background="../images/brh2.gif" width="140"><img src="../images/p.gif" width="140" height="1"></td>
            <td bgcolor="#8c1229" width="7"><img src="../images/p.gif" width="7" height="9"></td>
        </tr>
        <tr> 
            <td align="center" bgcolor="#8c1229" width="33">
			  <table border="0" cellpadding="2" cellspacing="2">  <tbody>
                <tr> 
                    <td><img src="../images/c.gif" width="25" height="25"></td>
                </tr>
              </tbody> </table>
			</td>
            <td width="140">
			  <table border="0" cellpadding="2" cellspacing="2"> <tbody>
                <tr> 
                    <td class="T10L"><b>Calendario</b></td>
                </tr>
              </tbody></table>
			</td>
        </tr>
            <td width="7"></td>
        </table>
		    <%--calendario--%>
            <SCRIPT SRC="../view/calendar.js"></SCRIPT> </td>
  <td bgcolor="#ffffff"><img src="../images/p.gif" width="6" height="1"></td>
  <td background="../images/brv.gif" width="1"><img src="../images/p.gif" width="1" height="1"></td>
  <td align="center" background="../images/corp2.jpg" width="570">
    <table background="../images/p.gif" border="0" cellpadding="3" cellspacing="3" width="100%"><tbody>
	  <tr valign="top">
	  <td>