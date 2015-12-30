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
<jsp:include page="../view/menuProf.jsp"/>

<table background="../images/investigaAlum.gif" border="0" cellpadding="2" cellspacing="2" width="100%">
  <tbody><tr>
      <td class="T24" align="right"><font color="#ffffff"> <a name="inicio"></a>A&nbsp;y&nbsp;u&nbsp;d&nbsp;a&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           
        <td class="T10a"> <table width="294" height="197" align="center"  >
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="37" colspan="2"  class="T10L"><a href="#saliente" class="T10L"> 
                <font size="5">Men&uacute; Ayuda</font></a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td width="22" height="20"  class="T10L"><a href="#saliente" class="T10L"> 
                </a><img src="../images/op_a2.gif" alt="" width="14" height="13" /></td>
              <td width="260"  class="T10L"><a href="#misTutorias" class="T10L">Mis 
                Tutor&iacute;as </a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20" class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /></td>
              <td height="20" class="T10L"><a href="#diario" class="T10L">Diario 
                Tutor&iacute;as</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#perfil" class="T10L">Perfil 
                P&uacute;blico </a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#contrasena" class="T10L">Cambiar 
                Contrase&ntilde;a</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#confHorario" class="T10L">Configuraci&oacute;n 
                Horario Tutor&iacute;as</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#confGlobal" class="T10L">Configuraci&oacute;n 
                Global </a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#alumnos" class="T10L">Listado Alumnos</a></td>
            </tr>
          </table>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="misTutorias" id="misTutorias"></a>Mis Tutor&iacute;as</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el administrador 
            debe seguir para la gesti&oacute;n de las peticiones de tutor&iacute;as, 
            desde la opci&oacute;n &#8220;Mis Tutor&iacute;as&#8221;. </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver tutor&iacute;as.</strong><br>
            Una vez seleccionada la opci&oacute;n se muestra el formulario de 
            b&uacute;squeda, en el cual podemos hacer una b&uacute;squeda de las 
            peticiones que tiene asignadas el profesor. La b&uacute;squeda puede 
            ser por &#8220;Asignatura&#8221; o por &#8220;Estado&#8221;. Una vez 
            introducidos los datos para realizar la b&uacute;squeda tienes que 
            pulsar el bot&oacute;n &#8220;Buscar&#8221; &#8221;, y se mostrar&aacute; 
            la informaci&oacute;n explicada en el siguiente punto.<br>
            Si quieres buscar todas las peticiones tienes que seleccionar la opci&oacute;n 
            &#8220;Todas&#8221; en las asignaturas y la opci&oacute;n &#8220;Todas&#8221; 
            en el estado.<br>
            Si no hay datos resultantes de la b&uacute;squeda se muestra un mensaje 
            indic&aacute;ndolo.</p>
          <p align="justify" class="T10L"><font size="5"><strong><img src="../images/ayuda/Dibujo52.jpg" alt="" width="493" height="374" /></strong></font><br>
            <br>
            Si la b&uacute;squeda se realiza con &eacute;xito se muestra la lista 
            de las peticiones resultantes. De cada petici&oacute;n mostrada aparece; 
            la fecha y la hora asignada, el alumno que la pide, la asignatura 
            para la que se solicita y el estado en que se encuentra la petici&oacute;n. 
            Si la fecha y hora no est&aacute;n asignadas saldr&aacute; en blanco. 
            <br>
            En la parte superior de la p&aacute;gina se muestra los criterios 
            de b&uacute;squeda seleccionados anteriormente. Desde esta p&aacute;gina 
            podemos volver atr&aacute;s haciendo click en el bot&oacute;n situado 
            arriba a la derecha.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/ayuda/Dibujo53.jpg" alt="" width="507" height="387" /></strong></font></p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Asignar tutor&iacute;a manualmente</strong><br>
            Para asignar la fecha y hora de una tutor&iacute;a manualmente hacer 
            click en el bot&oacute;n de la p&aacute;gina que muestra la lista 
            de peticiones. Es muy importante que el bot&oacute;n que pulse sea 
            el que corresponda a la petici&oacute;n que queremos asignar manualmente.<br>
            Solo se activar&aacute; ese bot&oacute;n para aquellas peticiones 
            que se encuentren en situaci&oacute;n de poder ser asignadas manualmente. 
            Estas son aquellas que se encuentren en estado &#8220;Solicitada&#8221;. 
            <br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina. 
            En ella podemos ver un formulario con algunos datos ya establecidos. 
            Los datos a introducir son la fecha y hora en la que se realizar&aacute; 
            la tutor&iacute;a. Por otro parte los datos que vienen ya establecidos 
            son: nombre y email del alumno, n&uacute;mero de ausencias que el 
            alumno ha hecho, asignatura, motivo y estado. Junto con el comentario 
            si existe del profesor. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo54.jpg" alt="" width="315" height="310" /></strong></font><br>
            Una vez introducidos todos los datos del formulario correctamente, 
            tened cuidado con las fechas ya que el formato establecido en el formulario 
            es &#8220;dd/mm/yyyy&#8221;. Si la fecha no es correcta saldr&aacute; 
            un mensaje indic&aacute;ndolo. <br>
            Si los datos han sido introducidos correctamente puede pulsar el bot&oacute;n 
            &#8220;Aceptar&#8221; y se enviar&aacute; un correo autom&aacute;ticamente 
            al alumno para informarle de que su tutor&iacute;a ha sido asignada 
            a la fecha y hora introducidas por el profesor. Si por el contrario 
            quieres salir del formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; 
            que te lleva a la p&aacute;gina de peticiones.<br>
            Una vez mostrado el mensaje de que se ha enviado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de peticiones, donde estar&aacute; insertada.<br>
            Como puedes ver en el correo ya se ha asignado un d&iacute;a y una 
            hora para su tutor&iacute;a. Si est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el enlace aceptar. Si no est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el encale rechazar.<br>
            <strong><br>
            <font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Editar petici&oacute;n tutor&iacute;a</strong><br>
            Para editar una petici&oacute;n debes hacer click en el bot&oacute;n 
            de la p&aacute;gina donde se muestran las peticiones. Es muy importante 
            que el bot&oacute;n que pulse sea el que corresponda al periodo que 
            queremos modificar.<br>
            Solo se activar&aacute; ese bot&oacute;n para aquellas peticiones 
            que se encuentren en situaci&oacute;n de poder ser editadas. Estas 
            son aquellas que se encuentren en estado &#8220;Enviada&#8221; y &#8220;Confirmada&#8221;.<br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del periodo que desea editar. 
            En ella podemos ver un formulario con algunos datos ya establecidos. 
            Los datos que pueden ser editados son la fecha y hora en la que se 
            realizar&aacute; la tutor&iacute;a y el estado. Por otro parte los 
            datos que vienen ya establecidos son: nombre y email del alumno, n&uacute;mero 
            de ausencias que el alumno ha hecho, asignatura, motivo y el comentario 
            si existe del profesor. <br>
            Justo debajo de los datos de la petici&oacute;n se encuentra una opci&oacute;n 
            que puede ser seleccionada o no. Si est&aacute; activada se enviara 
            un correo al alumno inform&aacute;ndole de la modificaci&oacute;n 
            de los datos de la tutor&iacute;a. Si por el contrario no est&aacute; 
            activada, la tutor&iacute;a se modifica pero el alumno no ser&aacute; 
            informado. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo55.jpg" alt="" width="298" height="298" /></strong></font><br>
            Una vez introducidos todos los datos del formulario correctamente, 
            tened cuidado con las fechas, el formato es el establecido en el formulario 
            (dd/mm/yyyy). Si la fecha no es correcta muestra un mensaje indic&aacute;ndolo.<br>
            Si los datos han sido modificados correctamente puede pulsar el bot&oacute;n 
            &#8220;Guardar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
            Como puedes ver en el correo ya se ha asignado un d&iacute;a y una 
            hora para su tutor&iacute;a. Si est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el enlace aceptar. Si no est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el encale rechazar. <br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Eliminar petici&oacute;n tutor&iacute;a.</strong><br>
            Para eliminar una petici&oacute;n debes hacer click en el bot&oacute;n 
            de la p&aacute;gina donde se muestran las peticiones. Es muy importante 
            que el bot&oacute;n que pulse sea el que corresponda al periodo que 
            queremos modificar.<br>
            Esta opci&oacute;n estar&aacute; siempre activa para cualquier petici&oacute;n. 
            <br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del periodo que desea eliminar. 
            En ella podemos ver un formulario con los datos de la petici&oacute;n.<br>
            Justo debajo de los datos de la petici&oacute;n se encuentra la opci&oacute;n 
            que puede ser seleccionada o no. Si esta activada se enviara un correo 
            al alumno inform&aacute;ndole de la eliminaci&oacute;n de la tutor&iacute;a. 
            Si por el contrario no est&aacute; activada, la tutor&iacute;a se 
            eliminara pero el alumno no ser&aacute; informado. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo56.jpg" alt="" width="294" height="317" /></strong></font> 
          </p>
          <p class="T10L">Si est&aacute; de acuerdo con la eliminaci&oacute;n 
            de la petici&oacute;n, pulsa el bot&oacute;n &#8220;Eliminar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de periodos.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
          </p>
          <p align="center" class="T10L"> <font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p class="T10L" align="left"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="diario" id="diario"></a>Diario Tutor&iacute;as</font></p>
          <p class="T10L" align="left">A continuaci&oacute;n se muestra los pasos 
            que el administrador debe seguir ver el calendario escolar, y su propio 
            calendario de peticiones, desde la opci&oacute;n &#8220;Diario Tutor&iacute;as&#8221;. 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver calendario.</strong><br>
            Una vez seleccionada la opci&oacute;n se muestra el calendario escolar 
            introducido por el administrador. En la parte superior de la pagina 
            podemos ver una leyenda con los tipos de periodos que pueden existir 
            dentro del calendario, divididos en colores, los cuales nos facilitar&aacute;n 
            la visi&oacute;n del calendario ya que, dependiendo del tipo de d&iacute;a 
            que sea, as&iacute; ser&aacute; su color.<br>
            Los d&iacute;as que tienen asignadas peticiones est&aacute;n en negrita. 
            <br>
            Justo debajo del calendario para poder moverte al mes anterior pulsa 
            &#8220;&lt;&lt;Anterior&#8221;, para moverte al mes siguiente pulsa 
            &#8220;Siguiente&gt;&gt;&#8221;.<br>
            Si quieres conocer la informaci&oacute;n espec&iacute;fica de cada 
            d&iacute;a puedes hacer click en el d&iacute;a que quieras conocer 
            su informaci&oacute;n. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo57.jpg" alt="" width="493" height="415" /></strong></font><br>
            Una vez pulsado en el d&iacute;a seleccionado se muestra la siguiente 
            p&aacute;gina, donde podemos observar en la parte superior el d&iacute;a 
            que has seleccionado junto con el tipo de d&iacute;a que es, si pertenece 
            a alg&uacute;n periodo del calendario. <br>
            Justo debajo se divide la p&aacute;gina en dos partes, en la superior 
            se muestra la lista de peticiones asignadas para ese d&iacute;a y 
            las hay y en la inferior se encuentran las excepciones si las hay, 
            en el caso de que no haya ninguna excepci&oacute;n se muestra el horario 
            de tutor&iacute;a asignado para ese d&iacute;a.<br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo58.jpg" alt="" width="468" height="370" /></strong></font></p>
          <p class="T10L"><br>
            <font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Asignar nueva tutor&iacute;a</strong><br>
            Para asignar una nueva tutor&iacute;a manualmente tienes que hacer 
            click en el bot&oacute;n &#8220;Asignar Nueva&#8221; de la p&aacute;gina 
            que muestra la informaci&oacute;n espec&iacute;fica de un d&iacute;a.	
            <br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina. 
            En ella podemos ver un formulario. Los datos a introducir son la asignatura, 
            debes seleccionarla de la lista de asignatura que imparte, nombre 
            y correo del alumno, el correo debe ser el de la uco sino se muestra 
            un error. El estado, la hora de inicio y de fin de la tutor&iacute;a, 
            y el motivo. <br>
            Justo debajo de los datos de la petici&oacute;n se encuentra la opci&oacute;n 
            que puede ser seleccionada o no. Si esta activada se enviar&aacute; 
            un correo al alumno inform&aacute;ndole de los datos de la tutor&iacute;a. 
            Si por el contrario no est&aacute; activada, la tutor&iacute;a se 
            crear&aacute; pero el alumno no ser&aacute; informado.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo59.jpg" alt="" width="281" height="333" /></strong></font><br>
            Si los datos han sido introducidos correctamente puede pulsar el bot&oacute;n 
            &#8220;Guardar&#8221; &#8221;. Si por el contrario quieres salir del 
            formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva 
            a la p&aacute;gina de periodos. <br>
            Como puedes ver en el correo ya se ha asignado un d&iacute;a y una 
            hora para su tutor&iacute;a. Si est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el enlace aceptar. Si no est&aacute; de acuerdo con la asignaci&oacute;n 
            pulse el encale rechazar.<br>
            Una vez mostrado el mensaje de que se ha creado con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong>. 
            A&ntilde;adir excepci&oacute;n</strong><br>
            Para a&ntilde;adir una excepci&oacute;n para ese d&iacute;a tienes 
            que hacer click en el bot&oacute;n &#8220;A&ntilde;adir Excepci&oacute;n&#8221; 
            de la p&aacute;gina que muestra la informaci&oacute;n espec&iacute;fica 
            de un d&iacute;a. <br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina. 
            En ella se muestran dos opciones; la primera para que no sean asignadas 
            tutor&iacute;as ese d&iacute;a. Y la segunda es para modificar el 
            horario de tutor&iacute;as solo y exclusivamente para ese d&iacute;a.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo60.jpg" alt="" width="262" height="211" /></strong></font><br>
            Una vez seleccionada una de las dos opciones pulsa el bot&oacute;n 
            &#8220;Aceptar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.<br>
            Una vez mostrado el mensaje de que se ha creado con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.<br>
            Si se ha pulsado con la opci&oacute;n &#8220;Cambiar horario de tutor&iacute;as&#8221; 
            se mostrar&aacute; la siguiente p&aacute;gina. Donde podemos ver un 
            formulario en el que debes introducir los nuevos datos del horario. 
            La hora de inicio y de fin, el slot (tiempo de duraci&oacute;n de 
            la tutor&iacute;a) y el m&eacute;todo de asignaci&oacute;n que puede 
            ser al inicio o al final. Selecciona &#8220;Al Inicio&#8221; si quieres 
            que la asignaci&oacute;n empiece desde la hora de inicio a la hora 
            de fin, y si quieres que empiece por la hora de fin selecciona &#8220;Al 
            Final&#8221;.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo61.jpg" alt="" width="299" height="251" /></strong></font><br>
            Una vez introducidos los datos pulsa el bot&oacute;n &#8220;Aceptar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina anterior.<br>
            Una vez mostrado el mensaje de que se ha creado con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Eliminar excepci&oacute;n</strong><br>
            Para eliminar una excepci&oacute;n para ese d&iacute;a tienes que 
            hacer click en el bot&oacute;n &#8220;Eliminar Excepci&oacute;n&#8221; 
            de la p&aacute;gina que muestra la informaci&oacute;n espec&iacute;fica 
            de un d&iacute;a. <br>
            Una vez mostrado el mensaje de que se ha creado con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.</p>
          <p class="T10L"><strong><br>
            <font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Ver informaci&oacute;n tutor&iacute;a</strong><br>
            Para ver m&aacute;s informaci&oacute;n de las tutor&iacute;as que 
            tiene asignadas para ese d&iacute;a tienes que hacer click en el bot&oacute;n 
            de la p&aacute;gina que muestra la informaci&oacute;n espec&iacute;fica 
            de un d&iacute;a. <br>
            Una seleccionada la opci&oacute;n se muestra la p&aacute;gina con 
            toda la informaci&oacute;n de la tutor&iacute;a. De estos datos solo 
            pueden ser modificados el estado y el comentario del profesor. Este 
            espacio est&aacute; dedicado a que el profesor pueda hacer una valoraci&oacute;n 
            o comentario de la tutor&iacute;a.<br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo62.jpg" alt="" width="459" height="354" /></strong></font><br>
            Si ha modificado algunos de los datos puedes guardar los cambios haciendo 
            click en el bot&oacute;n &#8220;Guardar Cambios&#8221;, y volver&aacute; 
            a la p&aacute;gina del calendario. </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="perfil" id="perfil"></a>Perfil P&uacute;blico</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el profesor debe seguir 
            para cambiar su perfil p&uacute;blico, desde la opci&oacute;n &#8220;Perfil 
            P&uacute;blico&#8221;. <br>
            <br>
            Una vez seleccionada esta opci&oacute;n se muestra la p&aacute;gina 
            con todos los datos de su perfil. <br>
            <font size="5"><img src="../images/ayuda/Dibujo63.jpg" alt="" width="487" height="347" /></font> 
            <br>
            Si deseas editar estos datos, tienes que hacer click en el bot&oacute;n 
            &#8220;Editar&#8221;. Si ha elegido la opci&oacute;n de editar el 
            perfil se muestra el siguiente formulario con todos los datos. Estos 
            datos son todos editables.<br>
            <font size="5"><img src="../images/ayuda/Dibujo64.jpg" alt="" width="287" height="324" /></font><br>
            Una vez modificados pulsa el bot&oacute;n &#8220;Guardar&#8221;. Si 
            por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina anterior.<br>
            Una vez mostrado el mensaje de que se ha creado con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.<br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="contrasena" id="contrasena"></a>Cambiar Contrase&ntilde;a</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el profesor 
            debe seguir para cambiar su contrase&ntilde;a, desde la opci&oacute;n 
            &#8220;Cambiar Contrase&ntilde;a&#8221;. <br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado su &#8220;login&#8221; junto con 
            la contrase&ntilde;a actual para ser modificada.<br>
            <font size="5"><img src="../images/ayuda/Dibujo65.jpg" alt="" width="254" height="211" /></font><br>
            Una vez modificada la contrase&ntilde;a pulse el bot&oacute;n &#8220;Cambiar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina anterior.<br>
            Una vez mostrado el mensaje de que se ha modificada con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            actual.</p>
          <p align="center" class="T10L"><br>
            <font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p class="T10L"><br>
            <font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="confHorario" id="confHorario"></a>Configuraci&oacute;n Horario 
            Tutor&iacute;as</font> </p>
          <p class="T10L" >A continuaci&oacute;n se muestra los pasos que el profesor debe seguir 
            para la gesti&oacute;n del horario de tutor&iacute;as, desde la opci&oacute;n 
            &#8220;Configuraci&oacute;n Global&#8221;. <br>
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver calendario de horario de tutor&iacute;as</strong><br>
            Una vez seleccionada esta opci&oacute;n se muestra la p&aacute;gina 
            con el calendario de los d&iacute;as de la semana dividi&oacute; por 
            horas desde las 8:00 a las 14:00 y desde las 16:00 a las 20:00. Este 
            calendario mostrar&aacute; los d&iacute;as que tiene horario de tutor&iacute;as 
            en las horas establecidas. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo66.jpg" alt="" width="487" height="356" /></strong></font><br>
            Para ver con m&aacute;s detalle que asignaturas hay asignadas a cada 
            horario tienes que hacer click en &#8220;Ver&#8221; situado encima 
            de cada hora y d&iacute;a que haya horario asignado.<br>
            Una vez seleccionado la opci&oacute;n &#8220;Ver&#8221; se muestra 
            la lista de asignaturas que tienen asignado ese horario de tutor&iacute;as. 
            Junto con el nombre de la asignatura tambi&eacute;n se muestra la 
            hora de inicio y fin de la tutor&iacute;a, junto con el periodo de 
            validez de este horario.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo67.jpg" alt="" width="430" height="241" /></strong></font><br>
            Para salir pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva 
            a la p&aacute;gina anterior.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            A&ntilde;adir tutor&iacute;a</strong><br>
            Para a&ntilde;adir un nuevo horario de tutor&iacute;as tienes que 
            pulsar el bot&oacute;n &#8220;A&ntilde;adir Tutor&iacute;a&#8221; 
            de la p&aacute;gina que muestra el calendario. Una vez pulsado el 
            bot&oacute;n se muestra la siguiente p&aacute;gina.<br>
            En ella se muestra un formulario donde hay datos ya introducidos y 
            otros que debes introducir obligatoriamente. Debes introducir la fecha 
            de inicio y fin que ser&aacute; el periodo de validez de este horario, 
            es decir, solo se asignaran tutor&iacute;a dentro de ese periodo de 
            tiempo. Otro dato que ha de introducir es el d&iacute;a junto con 
            la hora de inicio y fin del horario. Tambi&eacute;n debes introducir 
            la asignaci&oacute;n que puede ser &#8220;Al Inicio&#8221; si quieres 
            que la asignaci&oacute;n autom&aacute;tica empiece desde la hora de 
            inicio, o &#8220;Al Final&#8221; si quieres que la asignaci&oacute;n 
            empiece desde la hora de fin. Estos datos son espec&iacute;ficos para 
            ese d&iacute;a de la semana, por lo que para cada d&iacute;a debes 
            introducir un nuevo horario. Seguidamente vienen establecidos los 
            datos de la configuraci&oacute;n global que ya vienen predeterminados, 
            si deseas modificarlos debes hacerlos en la opci&oacute;n &#8220;Configuraci&oacute;n 
            Inicial&#8221;, explicada en el punto <em>5.6. Configuraci&oacute;n 
            Global.</em><br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo68.jpg" alt="" width="404" height="476" /></strong></font><br>
            Una vez introducidos todos los datos debes seleccionar la o las asignaturas 
            a la que le vas a asignar este horario. Y a continuaci&oacute;n pulsar 
            el bot&oacute;n &#8220;Guardar&#8221;. Si por el contrario quieres 
            salir del formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; 
            que te lleva a la p&aacute;gina anterior.<br>
            Una vez mostrado el mensaje de que se ha modificada con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            actual. </p>
          <p class="T10L"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Editar horario de tutor&iacute;a</strong><br>
            Para editar un horario de tutor&iacute;as ya establecido debes de 
            hacerlo desde la lista de asignaturas que se muestra una vez seleccionado 
            la opci&oacute;n &#8220;Ver&#8221; explicado en el apartado 1. Ver 
            Configuraci&oacute;n Horario Tutor&iacute;as. <br>
            Una vez hayamos seleccionado esa opci&oacute;n y se muestre la lista 
            de asignaturas tienes que hacer click en el bot&oacute;n . Es muy 
            importante que el bot&oacute;n que pulse sea el que corresponda la 
            asignatura que queremos modificar.<br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del horario que desea editar	
            Los datos que pueden ser modificados son la fecha de fin del periodo 
            de validez del horario, la hora de inicio y fin y la asignaci&oacute;n 
            que puede ser &#8220;Al Inicio&#8221; si quieres que la asignaci&oacute;n 
            autom&aacute;tica empiece desde la hora de inicio, o &#8220;Al Final&#8221; 
            si quieres que la asignaci&oacute;n empiece desde la hora de fin. 
            <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo69.jpg" alt="" width="354" height="252" /></strong></font><br>
            Una vez modificados los datos pulsa el bot&oacute;n &#8220;Cambiar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina anterior.<br>
            Una vez mostrado el mensaje de que se ha modificada con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong> Eliminar horario de tutor&iacute;a</strong><br>
            Para eliminar un horario de tutor&iacute;as ya establecido debes de 
            hacerlo desde la lista de asignaturas que se muestra una vez seleccionado 
            la opci&oacute;n &#8220;Ver&#8221; explicado en el apartado 1. Ver 
            Configuraci&oacute;n Horario Tutor&iacute;as. <br>
            Una vez hayamos seleccionado esa opci&oacute;n y muestre la lista 
            de asignaturas, tienes que hacer click en el bot&oacute;n . Es muy 
            importante que el bot&oacute;n que pulse sea el que corresponda la 
            asignatura que queremos eliminar.<br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del horario que desea eliminar.	
            <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo70.jpg" alt="" width="363" height="252" /></strong></font><br>
            Si est&aacute;s de acuerdo con la eliminaci&oacute;n pulsa el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            anterior.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            anterior.</p>
          <p align="center" class="T10L"><br>
            <font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="confGlobal" id="confGlobal"></a>Configuraci&oacute;n Global</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el profesor 
            debe seguir para cambiar modificar la configuraci&oacute;n global 
            del horario de tutor&iacute;as, desde la opci&oacute;n &#8220;Configuraci&oacute;n 
            Global&#8221;. <br>
            <br>
            Una vez seleccionada esta opci&oacute;n se muestra la siguiente p&aacute;gina. 
            Esta p&aacute;gina se divide en varias parte, en la parte de arriba 
            podemos ver la lista de asignaturas que tienen asignado horario de 
            tutor&iacute;as, junto con los datos de la configuraci&oacute;n global 
            que tienen actualmente. <br>
            En la parte inferior vemos un peque&ntilde;o formulario para introducir 
            los siguientes datos:<br>
            - M&eacute;todo de asignaci&oacute;n: puede ser manual o autom&aacute;tico, 
            manual si es el profesor el que quiere asignar las tutor&iacute;as 
            manualmente, si quiere una asignaci&oacute;n autom&aacute;tica tendr&aacute; 
            que elegir esa opci&oacute;n.<br>
            - Tiempo m&aacute;ximo de espera: es el que tiempo m&aacute;ximo que 
            tiene el alumno para acepta la solicitud, o para aceptar la asignaci&oacute;n. 
            Se mide en horas. <br>
            - Previsi&oacute;n m&iacute;nima: es el tiempo m&iacute;nimo que pasara 
            desde que el alumno solicita la tutor&iacute;a hasta la fecha asignada 
            para la tutor&iacute;a. Se mide en horas. <br>
            - N&uacute;mero de ausencias: es el n&uacute;mero m&aacute;ximo de 
            ausencias realizadas por un alumno permitidas por el profesor a la 
            hora de la asignaci&oacute;n autom&aacute;tica.<br>
            - Slot de tiempo: que es tiempo que dura una tutor&iacute;a. Se mide 
            en minutos. <br>
            <font size="5"><img src="../images/ayuda/Dibujo71.jpg" alt="" width="487" height="430" /></font><br>
            Si desea modificar la configuraci&oacute;n global una o varias asignaturas 
            debes seleccionarlas en la parte superior y luego introducir los datos 
            en el formulario. Una vez introducidos pulsa el bot&oacute;n &#8220;Guardar 
            Cambios&#8221; &#8221;, y volver&aacute; a la p&aacute;gina principal 
            del profesor. Es muy importante seleccionar la asignatura que desea 
            modificar ya que si no es seleccionada no se modifican sus datos. 
            <br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="alumnos" id="alumnos"></a>Listado Alumnos</font> </p>
          <p class="T10L" align="left">A continuaci&oacute;n se muestra los pasos 
            que el profesor debe seguir para ver la lista de alumnos, desde la 
            opci&oacute;n &#8220;Listado Alumnos&#8221;.<br>
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong> Buscar alumnos</strong><br>
            Una vez seleccionada la opci&oacute;n se muestra el formulario de 
            b&uacute;squeda del alumno. La b&uacute;squeda puede ser por &#8220;Correo 
            por &#8220;Asignatura&#8221;. Una vez introducidos los datos para 
            realizar la b&uacute;squeda tienes que pulsar el bot&oacute;n &#8220;Buscar&#8221; 
            &#8221;, y se mostrar&aacute; la informaci&oacute;n.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo72.jpg" alt="" width="476" height="351" /></strong></font><br>
            Si la b&uacute;squeda se realiza con &eacute;xito y encuentra alumnos 
            con esos criterios se muestra la lista.<br>
            Arriba se muestra los criterios de b&uacute;squeda que hemos introducido 
            anteriormente. M&aacute;s abajo podemos ver la lista de alumnos.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo73.jpg" alt="" width="479" height="351" /></strong></font> 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver peticiones del alumno</strong><br>
            Para ver la lista de peticiones que tiene asignadas el alumno se obtienen 
            haciendo click en el correo del alumno.<br>
            Una vez pulsado el nombre se muestra la lista de peticiones. De cada 
            petici&oacute;n se conoce el nombre de la asignatura, el motivo y 
            el estado. <br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo74.jpg" alt="" width="476" height="330" /></strong></font><br>
            Para conocer m&aacute;s informaci&oacute;n acerca de la petici&oacute;n 
            tienes que hacer click en el nombre del profesor y se mostrara una 
            p&aacute;gina donde se muestra toda la informaci&oacute;n referente 
            a la petici&oacute;n seleccionada.<br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo75.jpg" alt="" width="474" height="363" /></strong></font> 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Descargar PDF.</strong><br>
            Para obtener un listado de los alumnos de la aplicaci&oacute;n tienes 
            que hacer click en el bot&oacute;n situado en la p&aacute;gina de 
            alumnos.<br>
            Una vez seleccionada la opci&oacute;n se crea autom&aacute;ticamente 
            un pdf con la lista de alumnos. Este pdf se guarda por defecto en 
            el directorio c:/ y el nombre ser&aacute; &#8220;InformeAlumnosProfesor.pdf&#8221;. 
            <br>
            <br>
            Pulsa el bot&oacute;n &#8220;Salir&#8221; y vuelve a la p&aacute;gina 
            de alumnos.</p>
          <p align="center"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p></p>
          <p></p>
          <p></p>
          <p></p>
          <p></p>
          <p class="T10L" align="left">&nbsp; </p>
          <%-- Incluimos el pie de pagina --%>
<jsp:include page="../view/pie.jsp"/>

</body></html>