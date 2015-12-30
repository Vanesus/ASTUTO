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
      <td class="T24" align="right"><font color="#ffffff"> <a name="inicio"></a>A&nbsp;y&nbsp;u&nbsp;d&nbsp;a&nbsp;</font></td>
      </tr></tbody></table></td></tr>
      <tr valign="top">
        <td>
         <table border="0" cellpadding="4" cellspacing="0" width="100%"><tbody>
        <tr valign="top">
           <td><img src="../images/p.gif" width="15" height="1"></td>
           
        <td class="T10a"> <table width="294" height="109" align="center"  >
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="37" colspan="2"  class="T10L"><a href="#saliente" class="T10L"> 
                <font size="5">Men&uacute; Ayuda</font></a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td width="22" height="20"  class="T10L"><a href="#saliente" class="T10L"> 
                </a><img src="../images/op_a2.gif" alt="" width="14" height="13" /></td>
              <td width="260"  class="T10L"><a href="#peticionTut" class="T10L">Petici&oacute;n 
                Tutor&iacute;a</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20" class="T10L"><a href="#eliminar" class="T10L"> </a><img src="../images/op_a2.gif" alt="" width="14" height="13" /></td>
              <td height="20" class="T10L"><a href="#buscarProf" class="T10L">Buscar 
                Profesor</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#misTutorias" class="T10L">Mis Tutor&iacute;as</a></td>
            </tr>
          </table>
          <p class="T10L" align="center">&nbsp;</p>
          <p class="T10L" align="justify"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="peticionTut"></a>Petici&oacute;n Tutor&iacute;a </font></p>
          <p class="T10L" align="justify">A continuaci&oacute;n se muestran los 
            pasos que hay que seguir para pedir una tutor&iacute;a desde la opci&oacute;n 
            &#8220;Petici&oacute;n Tutor&iacute;a&#8221;.</p>
          <p class="T10L"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Elegir centro, titulaci&oacute;n y curso</strong><br>
            Una vez dentro de esta opci&oacute;n se muestra la siguiente p&aacute;gina 
            con la lista de centros, titulaciones y cursos que tiene la aplicaci&oacute;n.</p>
          <p class="T10L"><font size="5"><img src="../images/ayuda/Dibujo.jpg" alt="" width="466" height="603" /></font><br>
            Al final de esta p&aacute;gina podemos ver el icono &#8220;Ir al principio&#8221;, 
            el cual sube al inicio de la p&aacute;gina.<br>
            Una vez hayamos la titulaci&oacute;n y el curso al que pertenece la 
            asignatura que deseamos buscar, debemos hacer &#8220;click&#8221; 
            en el nombre del curso, y nos mostrar&aacute; la informaci&oacute;n 
            explicada en el siguiente punto.
          <p class="T10L"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Elegir asignatura y profesor</strong><br>
            En esta p&aacute;gina aparecen los datos seleccionados anteriormente, 
            como son: el nombre del centro, la titulaci&oacute;n y el curso. <br>
            Seguidamente vemos la lista de las asignaturas asignadas en este curso 
            junto con el nombre del profesor/es que la imparten.<br>
            <font size="5"><img src="../images/ayuda/Dibujo1.jpg" alt="" width="452" height="407" /></font><br class="T10L">
            Para volver a la pantalla anterior realizamos un &#8220;click&#8221; 
            en el s&iacute;mbolo , situado arriba a la derecha.<br>
            Para continuar y realizar la petici&oacute;n deseada, debemos buscar 
            al profesor al que queremos solicitarle la tutor&iacute;a. Una vez 
            encontrado hacemos &#8220;click&#8221; en su nombre, y se nos mostrar&aacute; 
            la informaci&oacute;n explicada en el siguiente punto. </p>
          <p align="justify" class="T10L"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Ver horario de tutor&iacute;a</strong><br>
            En esta p&aacute;gina se muestran los datos del profesor seleccionado, 
            junto con el nombre de la asignatura y el horario de tutor&iacute;a 
            que tiene establecido.<br>
            Si no tiene horario asignado aparece el mensaje &#8220;No tiene horario 
            tutor&iacute;a asignada&#8221; y, por consiguiente, no se puede pedir 
            ninguna tutor&iacute;a.<br>
            Si por el contrario, tiene horario asignado para esta asignatura, 
            nos saldr&aacute; la siguiente p&aacute;gina:<br>
            <font size="5"><img src="../images/ayuda/Dibujo3.jpg" alt="" width="447" height="407" /></font><br>
            Al tener horario asignado, podemos solicitar la tutor&iacute;a haciendo 
            &#8220;click&#8221; en el bot&oacute;n &#8220;Solicitar Tutor&iacute;a&#8221;, 
            y nos mostrar&aacute; la informaci&oacute;n explicada en el paso siguiente.<br>
            <br>
            <strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Solicitar tutor&iacute;a. Aceptar y rechazar.</strong><br>
            En esta p&aacute;gina podemos ver los datos del profesor y la asignatura, 
            los cuales ya vienen establecidos por que fueron seleccionados en 
            las p&aacute;ginas anteriores. Seguidamente introducimos los dem&aacute;s 
            datos como son; nombre y apellidos, email y motivo por el cual solicita 
            la tutor&iacute;a.<br>
            <font size="5"><img src="../images/ayuda/Dibujo4.jpg" alt="" width="450" height="406" /></font><br>
            Los datos deben ser todos introducidos obligatoriamente para poder 
            solicitar la tutor&iacute;a correctamente. Adem&aacute;s el correo 
            tiene que ser el de la uco, con el formato (a11aaaaa@uco.es), si no 
            es correcto aparecer&aacute; un mensaje indic&aacute;ndolo.<br>
            Una vez introducidos todos los datos haga &#8220;click&#8221; en el 
            bot&oacute;n &#8220;Solicitar&#8221;. Tras realizar dicha acci&oacute;n, 
            si se env&iacute;a el correo con &eacute;xito, debe mirar en su correo 
            y deber&iacute;a haber recibido un mensaje.<br>
            Si se produce el error en el env&iacute;o lea el apartado &#8220;<em>Mis 
            Tutor&iacute;as</em>&#8221; de la ayuda. <br>
            Para verificar que el correo se ha enviado con &eacute;xito, debe 
            mirar en su correo y deber&iacute;a haber recibido un mensaje. Si 
            desea seguir con el trascurso de la solicitud, pulse en el enlace 
            de ratificarla. Y se enviar&aacute; otro correo donde ya se ha asignado 
            un d&iacute;a y una hora para su tutor&iacute;a. Si est&aacute; de 
            acuerdo con la asignaci&oacute;n pulse el enlace aceptar. Si no est&aacute; 
            de acuerdo con la asignaci&oacute;n pulse el encale rechazar. Si el 
            correo no se env&iacute;a autom&aacute;ticamente espere que lo recibir&aacute; 
            su correo.<br>
          </p>
          <p align="center" class="T10L"><br>
            <font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p class="T10L" align="justify"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="buscarProf" id="buscarProf"></a>Buscar Profesor</font></p>
          <p class="T10L" align="justify">A continuaci&oacute;n se muestran los 
            pasos que hay que seguir para pedir una tutor&iacute;a desde la opci&oacute;n 
            &#8220;Buscar Profesor&#8221;.</p>
          <p class="T10L" align="justify"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Buscar</strong></p>
          <p class="T10L" align="justify">Una vez seleccionada la opci&oacute;n 
            se muestra el formulario de b&uacute;squeda del profesor. La b&uacute;squeda 
            puede ser; por &#8220;Nombre&#8221;, por &#8220;Apellidos&#8221; o 
            por &#8220;Asignatura&#8221;. Una vez introducidos los datos para 
            realizar la b&uacute;squeda tienes que pulsar el bot&oacute;n &#8220;Buscar&#8221; 
            &#8221;, y mostrar&aacute; la informaci&oacute;n explicada en el siguiente 
            punto.<br>
            <font size="5"><img src="../images/ayuda/Dibujo5.jpg" alt="" width="459" height="395" /></font> 
            <br>
            Si queremos que nos muestre todos los profesores tiene que pulsar 
            el bot&oacute;n &#8220;Buscar Todos&#8221; &#8221;, y se mostrar&aacute; 
            la informaci&oacute;n explicada en el apartado 3. Buscar Todos.<br>
            <br>
            <strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font></strong> 
            <strong>Buscar profesor </strong><br>
            Una vez introducidos los criterios de b&uacute;squeda se muestra el 
            resultado de la b&uacute;squeda.<br>
            <font size="5"><img src="../images/ayuda/Dibujo6.jpg" alt="" width="458" height="401" /></font><br>
            En la parte superior muestra los criterios de b&uacute;squeda que 
            hemos introducido anteriormente. En la inferior el nombre del profesor 
            encontrado, junto con las asignaturas que imparte.<br>
            Para volver hacia atr&aacute;s haga click en simbolo situado arriba 
            a la derecha.<br>
            Si ha encontrado el profesor y posteriormente la asignatura a la que 
            quiere solicitar la tutor&iacute;a, haga click en el nombre de la 
            asignatura que desea elegir.<br>
            Siga los mismos pasos que en el apartado <em>Petici&oacute;n Tutor&iacute;a</em><br>
            <em>- Ver Horario de tutor&iacute;a.<br>
            - Solicitar Tutor&iacute;a. Aceptar y Rechazar.</em></p>
          <p class="T10L" align="justify"><br>
            <strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font></strong> 
            <strong>Buscar todos</strong><br>
            Si pulsa el bot&oacute;n de buscar todos se muestra la siguiente pantalla, 
            con la lista de todos los profesores y las asignaturas que imparte.</p>
          <p class="T10L" align="justify"><font size="5"><img src="../images/ayuda/Dibujo11.jpg" alt="" width="445" height="694" /></font><br>
            Para volver hacia atr&aacute;s haga click en situado arriba a la derecha.<br>
            Si ha encontrado el profesor y la asignatura a la que quiere solicitar 
            la tutor&iacute;a haga click en el nombre de la asignatura que desea 
            elegir.<br>
            Siga los mismos pasos que en el apartado <em>Petici&oacute;n Tutor&iacute;a</em><br>
            <em>- Ver Horario de tutor&iacute;a.<br>
            - Solicitar Tutor&iacute;a. Aceptar y Rechazar.</em></p>
          <p></p>
          <p class="T10L" align="center"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="misTutorias" id="misTutorias"></a>Mis Tutor&iacute;as</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el alumno 
            debe seguir para ver sus tutor&iacute;as desde la opci&oacute;n &#8220;Mis 
            Tutor&iacute;as&#8221;.<br>
          </p>
          <p class="T10L"><strong><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Mis tutor&iacute;as.</strong><br>
            Una vez seleccionada la opci&oacute;n puedes ver las tutor&iacute;as 
            que has pedido, tanto si ya se han realizado como si todav&iacute;a 
            no han sido asignadas. Primero tienes que seleccionar el criterio 
            de b&uacute;squeda que desea. Una vez seleccionado pulsa el bot&oacute;n 
            &#8220;Aceptar&#8221;. <br>
            <strong><font size="5"><img src="../images/ayuda/Dibujo7.jpg" alt="" width="451" height="387" /></font></strong><br>
            Hay dos posibles criterios de b&uacute;squeda uno de ellos es Por 
            identificador y otro de ellos Por Correo.<br>
            Si has seleccionado Por correo, se muestra la siguiente p&aacute;gina 
            donde debes introducir el correo del alumno.<br>
            <strong><font size="5"><img src="../images/ayuda/Dibujo8.jpg" alt="" width="456" height="391" /></font></strong><br>
            Si el formato email no es correcto ya que debe de ser el de la uco, 
            se muestra un mensaje indic&aacute;ndolo. Si el alumno no existe se 
            muestra otro mensaje.<br>
            Una vez pulsado el bot&oacute;n &#8220;Aceptar&#8221; se env&iacute;a 
            al correo del alumno el identificador para que pueda ver sus tutor&iacute;as. 
            Tras realizar dicha acci&oacute;n, si se env&iacute;a el correo con 
            &eacute;xito, nos mostrar&aacute; un mensaje. Si por el contrario, 
            el correo, no se puede enviar, mostrar&aacute; otro mensaje.<br>
            Para verificar que el correo se ha enviado con &eacute;xito, debe 
            mirar en su correo y deber&iacute;a haber recibido un mensaje.<br>
            Desde el correo haciendo click en el enlace puede ver las tutor&iacute;as 
            que tiene asignadas.<br>
            Si has seleccionado Por identificador, se muestra la siguiente p&aacute;gina 
            donde debes introducir el n&uacute;mero identificador del alumno que 
            viene especificado en el correo de Confirmaci&oacute;n Solicitud en 
            Curso.<br>
            <strong><font size="5"><img src="../images/ayuda/Dibujo9.jpg" alt="" width="434" height="428" /></font></strong><br>
            Si el identificador no es correcto se muestra un mensaje indic&aacute;dolo.<br>
            Una vez introducido el identificador correcto pulsa el bot&oacute;n 
            &#8220;Aceptar&#8221; y se muestra la p&aacute;gina con la lista de 
            peticiones que tiene el alumno. De cada petici&oacute;n se muestra 
            el nombre del profesor al que se le solicita la tutor&iacute;a junto 
            con el nombre de la asignatura que imparte. La fecha y la hora si 
            ya esta asignada y por &uacute;ltimo el estado en el que se encuentra.<br>
            <strong><font size="5"><img src="../images/ayuda/Dibujo10.jpg" alt="" width="441" height="329" /></font></strong><br>
            El alumno tiene la posibilidad de eliminar la petici&oacute;n haciendo 
            click en el icono &quot;Eliminar&quot;, una vez pulsado, si el estado 
            de la tutor&iacute;a es &#8220;Solicitud en curso&#8221;, &#8220;Enviada&#8221; 
            o &#8220;Solicitada&#8221; se muestra un mensaje ya que no puede eliminar 
            una tutor&iacute;a si se encuentra en cualquiera de esos estados.<br>
            Si esta en cualquier otro estado, se enviara el correo a la direcci&oacute;n 
            de email. Si se produce un error en el env&iacute;o se muestra un 
            mensaje indic&aacute;dolo.<br>
            Si el mensaje se ha enviado con &eacute;xito recibir&aacute; en su 
            correo un mensaje. Si est&aacute; de acuerdo con la eliminaci&oacute;n 
            de la tutor&iacute;a pulse el enlace eliminar.<br>
            El alumno tiene la posibilidad de reenviarse el correo pulsando el 
            incono &quot;Reenviar&quot;, en el caso de la que tutor&iacute;a este 
            en estado &#8220;Solicitud en curso&#8221; o &#8220;Enviada&#8221;. 
            Si por el contrario esta en cualquier otro estado se muestra el siguiente 
            mensaje.<br>
            Si el estado es correcto, se enviara el correo a su email. Si se produce 
            un error en el env&iacute;o muestra un mensaje indic&aacute;ndolo.<br>
            Si el estado es &#8220;Enviada&#8221;, en su correo recibir&aacute; 
            un correo. Como puedes ver en el correo se ha asignado un d&iacute;a 
            y una hora para su tutor&iacute;a. Si est&aacute; de acuerdo con la 
            asignaci&oacute;n pulse el enlace aceptar. Si no est&aacute; de acuerdo 
            con la asignaci&oacute;n pulse el encale rechazar.<br>
            Si el estado es &#8220;Solicitud en Curso&#8221;, en su correo recibir&aacute; 
            un correo. Si est&aacute; quiere continuar con la solicitud pulse 
            el enlace aceptar. Si no est&aacute; de acuerdo con la solicitud pulse 
            el encale rechazar.</p>
          <p align="center"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p></p>
          <p><br>
          </p>
          <p class="T10L" align="center">&nbsp;</p>

<%-- Incluimos el pie de pagina --%>
<jsp:include page="../view/pie.jsp"/>

</body></html>