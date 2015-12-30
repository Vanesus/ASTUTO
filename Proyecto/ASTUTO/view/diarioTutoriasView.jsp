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
<jsp:useBean id="peticionTutBean" class="uco.interfaz.PeticionTutBean" scope="session"/>

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
-->
</style>
</head><body>
<%-- Incluimos la cabecera y el menu de administrador--%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuProf.jsp"/>
<table background= "../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
    <td class="T24" align="right"><font color="#ffffff">  D&nbsp;i&nbsp;a&nbsp;r&nbsp;i&nbsp;o&nbsp;&nbsp;T&nbsp;u&nbsp;t&nbsp;o&nbsp;r&nbsp;í&nbsp;a&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody><tr valign="top">
           <td height="200"><img src="../images/p.gif" width="15" height="1"></td>
                        <td class="T10a"> 
 
	 <table width="500" border="0" cellpadding="0" cellspacing="0">
	            <tbody><tr valign="top">
           <td>
		   <%--Leyenda de tipo de dias que hay en el calendario--%>
           <table border="0" cellpadding="3" cellspacing="3">
           <tbody><tr>
            <td width="8" bgcolor="#fdf6da">&nbsp;&nbsp;</td>
            <td width="132" class="T8">Días laborales y de clase</td>
            <td width="10" bgcolor="#f3cdd5">&nbsp;&nbsp;</td>
            <td width="224" class="T8">Días laborales sin clase</td>
           </tr>
           <tr>
            <td bgcolor="#006699">&nbsp;&nbsp;</td>
            <td class="T8">Exámenes</td>
            <td bgcolor="#b7b874">&nbsp;&nbsp;</td>
            <td class="T8">Días festivos en todos los centros</td>
           </tr>
           <tr>
            <td bgcolor="#808080" height="24">&nbsp;&nbsp;</td>
            <td class="T8" colspan="3"><div align="justify">Fiestas patronales (no lectivas y no laborables en los respectivos centros)</div></td>
           </tr>
           </tbody></table> 
           </td>
           <td align="right">&nbsp;</td>
           </tr>
		   </tbody></table>    

  <%  
  boolean yyok = false;  
  int yy = 0, mm = 0;
  String yyString = request.getParameter("year");
  if (yyString != null && yyString.length(  ) > 0) {
    try {
      yy = Integer.parseInt(yyString);
      yyok = true;
    } catch (NumberFormatException e) {
      out.println("Year " + yyString + " invalid");
    }
  }
  Calendar c = Calendar.getInstance(  );
  if (!yyok)
    yy = c.get(Calendar.YEAR);
 
  String mmString = request.getParameter("month");
  if (mmString == null) {
    mm = c.get(Calendar.MONTH);
  } else {
    for (int i=0; i<months.length; i++)
      if (months[i].equals(mmString)) {
        mm = i;
        break;
      }
  }
  %>

<%! /** Nombre de los meses */
  String[] months = {
    "Enero", "Febrero", "Marzo", "Abril",
    "Mayo", "Junio", "Julio", "Agosto",
    "Septiembre", "Octubre", "Noviembre", "Diciembre"
  };
 
  /** Dias que tiene cada mes. */
  int dom[] = {
      31, 28, 31, 30,  /* jan feb mar apr */
      31, 30, 31, 31, /* may jun jul aug */
      30, 31, 30, 31  /* sep oct nov dec */
  };
%>
<%
  /** The number of days to leave blank at the start of this month */
  int leadGap = 0;
%>
<center>
<table width="100%">
<tr>
   <%--mes y año--%>
   <td class="T14" align="center" bgcolor="#d69e00"><font color="#ffffff"><b><%= months[mm] %>  <%= yy %></b></font></td>
</tr>
 </table>
<% GregorianCalendar calendar = new GregorianCalendar(yy, mm, 1); %>
<table border=1 width="300" height="250"> 
<tr><td class="T14" align="center"><b>L</b></td>
    <td class="T14" align="center"><b>M</b></td>
	<td class="T14" align="center"><b>X</b></td>
	<td class="T14" align="center"><b>J</b></td>
	<td class="T14" align="center"><b>V</b></td>
	<td class="T14" align="center"><b>S</b></td>
	<td class="T14" align="center"><b>D</b></td>
</tr>
 
<%
    leadGap = calendar.get(Calendar.DAY_OF_WEEK)-2;
	 if(calendar.get(Calendar.DAY_OF_WEEK)==1)
		leadGap=6;
 
    int daysInMonth = dom[mm];
    if (calendar.isLeapYear(calendar.get(Calendar.YEAR)) && mm == 1)
      ++daysInMonth;
		%><tr><%
 
    for (int i = 1; i <= leadGap; i++) {
      %><td>&nbsp;</td><%
    }
 
    // Recorremos los dias del mes
    for (Integer i = 1; i <= daysInMonth; i++) {
	   String clase=null;
	   String clasePet=null;
	   for(Integer k=0;k<peticionTutBean.getContador();k++){
				Integer dPet=peticionTutBean.getDia1(k);
		   		Integer mPet=peticionTutBean.getMes1(k);
		   		Integer aPet=peticionTutBean.getAnyo1(k);
				if (mPet==mm+1 && aPet==yy && i.equals(peticionTutBean.getDia1(k)))
					clasePet="<i><b>";					
	   }
       for(Integer j=0;j<calendarioBean.getContador();j++){
	       //Por cada periodo del calendario inicializado por el administrador tenemos que comprobar
		   //si la fecha coincide con el periodo. Si coincide cambiara el color de fondo al que corresponda.
	       Integer dInicio=calendarioBean.getdInicio(j);
		   Integer mInicio=calendarioBean.getmInicio(j);
		   Integer aInicio=calendarioBean.getaInicio(j);
		   Integer dFin=calendarioBean.getdFin(j);
		   Integer mFin=calendarioBean.getmFin(j);
		   Integer aFin=calendarioBean.getaFin(j);
		   Integer tipo=calendarioBean.getTipo(j);		   
		   if(((dInicio<=i && mInicio==mm+1 && aInicio==yy) || (mInicio<mm+1 && aInicio==yy)||(mInicio>mm+1 &&aInicio<yy))&&((dFin>=i && mFin==mm+1 && aFin==yy)||(mFin>mm+1 &&aFin==yy)||(mFin<mm+1 &&aFin>yy) )){	   
				if(tipo==1) clase="DTipo1"; 
				else if(tipo==2) clase="DTipo2";
				else if(tipo==3) clase="DTipo3";
				else if(tipo==4) clase="DTipo4";
				else if(tipo==5) clase="DTipo5";
				j=calendarioBean.getContador();	//No sigue comprobando para ese día, para al siguiente. 
		  }
		}
		//Imprimir el dia del mes.
    %><td class="<%=clase%>" align="center"><%if (clasePet!=null){%><%=clasePet%><%}%><a class="<%=clase%>" href="../controller/diarioTutoriasController.jsp?dia=<%=i%>&mes=<%=mm+1%>&anyo=<%=yy%>"><%if (clase!="DTipo3"){%><font color="#000000"><%}%><%=i%></font></a></td>
 
      <%if ((leadGap + i) % 7 == 0) { %>
        </tr>
        <tr><%
      }
    }%>
</tr>
</table>
<%-- Pasar de un mes al siguiente o al anterior--%>
<table width="300">
  <tr>
     <%int anyo=yy;
		int ant=mm-1;
		int sig=mm+1;
	   if(months[mm]=="Enero"){
		 ant=11;%>
		 <td align="left"><a class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[ant]%>&year=<%=anyo-1%>"><< Anterior</a></td>
	     <td align="right"><a class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[sig]%>&year=<%=anyo%>">Siguiente >></a></td>
	    <%}else if(months[mm]=="Diciembre"){
		 sig=0;%>
         <td align="left"><a  class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[ant]%>&year=<%=anyo%>"><< Anterior</a></td>
	     <td align="right"><a class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[sig]%>&year=<%=anyo+1%>">Siguiente >></a></td>		 
	    <%}else{%>
         <td align="left"><a class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[ant]%>&year=<%=anyo%>"><< Anterior</a></td>
	     <td align="right"><a class="T10L" href="../view/diarioTutoriasView.jsp?month=<%=months[sig]%>&year=<%=anyo%>">Siguiente >></a></td>
	<%}%>
  </tr>
 </table>
</center>
<%-- Incluimos el pie de pagina --%>		                                                                                                                                                  
<jsp:include page="../view/pie.jsp"/>
</body></html>