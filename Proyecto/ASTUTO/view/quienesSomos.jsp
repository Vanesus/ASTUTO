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
<%-- Incluimos la cabecera y el menu de alumnos --%>
<jsp:include page="../view/cabecera.jsp"/>
<jsp:include page="../view/menuAlumno.jsp"/>

<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%"><tbody><tr>
      <td class="T24" align="right"><font color="#ffffff"> Q&nbsp;u&nbsp;i&nbsp;e&nbsp;n&nbsp;e&nbsp;s&nbsp;&nbsp; S&nbsp;o&nbsp;m&nbsp;o&nbsp;s&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           <td class="T10a"> 
			<p class="T10L" align="center">&nbsp;</p>
			<script>
			function validarEmail(valor) {
			if (/^[a-z][0-9][0-9][a-z][a-z][a-z][a-z][a-z]@uco.es$/.test(form.correo.value)){
			return (true)
			} else {
			alert("La dirección de email es incorrecta. El formato debe ser a11aaaaa@uco.es");
			return (false);}
			}
			</script>
			<form name="form" onSubmit="return validarEmail(this);" method="post" action="../controller/contacteController.jsp">
            <table width="459" height="33" align="center" class="T10L" >
              <tr valign="top" border="0" bordercolor="#FFFFFF"> 
                <td width="365" height="27" ><p align="center"><strong>ESCUELA 
                    POLITECNICA SUPERIOR</strong></p>
                  <p align="center"><strong><font size="3">I.T. INFORM&Aacute;TICA 
                    DE GESTI&Oacute;N</font></strong></p>
                  <p align="center">&nbsp;</p>
                  <p align="center"><strong><font size="6">ASTUTO</font></strong></p>
                  <p align="center"><font size="5">Aplicaci&oacute;n web para 
                    la Solicitud de TUTor&iacute;as Online</font></p>
                  <p align="center">&nbsp;</p>
                  <p align="center"><strong>Realizado por:</strong></p>
                  <p align="center">Vanesa Gonz&aacute;lez P&eacute;rez</p>
                  <p align="center">M&ordf; Josefa Aldea Palacios</p>
                  <p align="center">&nbsp;</p>
                  <p align="center"><strong>Dirigido por:</strong></p>
                  <p align="center">Jos&eacute; R&aacute;ul Romero Salgredo</p>
                  <p align="center">&nbsp;</p>
                  <p align="center"><strong>Departamento:</strong></p>
                  <p align="center">Ciencia de la Computaci&oacute;n e Inteligencia 
                    Artificial</p>
                  <p align="center"><strong><font size="4">Universidad de C&oacute;rdoba</font></strong></p>
                  <p align="right">C&oacute;rdoba, 2011</p></td>
              </tr>
            </table>
            <div align="center"></div>
            <div align="center"></div>
            <div align="center"> </div>
          </form>
<%-- Incluimos el pie de pagina --%>
<jsp:include page="../view/pie.jsp"/>

</body></html>