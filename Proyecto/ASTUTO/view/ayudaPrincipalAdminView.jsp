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
<jsp:include page="../view/menuAdmin.jsp"/>

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
              <td width="260"  class="T10L"><a href="#estDocentes" class="T10L">Estructuras 
                Docentes </a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20" class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /></td>
              <td height="20" class="T10L"><a href="#usuarios" class="T10L">Usuarios</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#asignaturas" class="T10L">Asignaturas</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#calendario" class="T10L">Calendario</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#confInicial" class="T10L">Configuraci&oacute;n 
                Inicial</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#trazas" class="T10L">Ver 
                Trazas</a></td>
            </tr>
            <tr border="0" bordercolor="#FFFFFF"> 
              <td height="20"  class="T10L"><img src="../images/op_a2.gif" alt="" width="14" height="13" /> 
              </td>
              <td height="20"  class="T10L"><a href="#alumnos" class="T10L">Listado 
                Alumnos</a></td>
            </tr>
          </table>
          <p class="T10L" align="justify"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="estDocentes" id="estDocentes"></a>Estructuras Docentes</font></p>
          <p class="T10L" align="justify">A continuaci&oacute;n se muestra los 
            pasos que el administrador debe seguir para la gesti&oacute;n de la 
            estructuras desde la opci&oacute;n &#8220;Estructuras Docentes&#8221;.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Ver estructuras docentes.</strong><br>
            Una vez seleccionada esta opci&oacute;n se muestra una p&aacute;gina 
            donde podemos ver la lista de centros que hay introducidos en la aplicaci&oacute;n. 
            <br>
            <font size="5"><img src="../images/ayuda/Dibujo12.jpg" alt="" width="468" height="376" /></font> 
            <br>
            Para poder ver las titulaciones que se imparten en cada centro tienes 
            que hacer click en el nombre del centro, y se mostrar&aacute; otra 
            p&aacute;gina con la lista de titulaciones. De igual forma si quieres 
            saber los cursos que tiene cada titulaci&oacute;n debes hacer click 
            en el nombre de la titulaci&oacute;n, y se mostrar&aacute; una nueva 
            p&aacute;gina con los cursos.<br>
            En la p&aacute;gina correspondiente a las titulaciones o los cursos 
            podemos volver atr&aacute;s haciendo click en el bot&oacute;n situado 
            arriba a la derecha.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong> Nueva estructura docente.</strong><br>
            Para crear un nuevo centro debes hacer click en el bot&oacute;n &#8220;Crear 
            Nueva&#8221; de la p&aacute;gina donde se muestra la lista de centros.<br>
            Una vez seleccionada la opci&oacute;n, se muestra el siguiente formulario.<br>
            Debes introducir el nombre del centro. Una vez introducido pulse el 
            bot&oacute;n &#8220;Guardar&#8221;. Si por el contrario quieres salir 
            del formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te 
            lleva a la p&aacute;gina de los centros.<br>
            <font size="5"><img src="../images/ayuda/Dibujo13.jpg" alt="" width="245" height="218" /></font><br>
            Una vez mostrado el mensaje de que se ha guardo con &eacute;xito pulsa 
            el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de los centros, donde estar&aacute; incluido.<br>
            De igual forma para crear una nueva titulaci&oacute;n o un nuevo curso, 
            debemos de pulsar el bot&oacute;n &#8220;Crear Nueva&#8221; que se 
            encuentra en la p&aacute;gina de titulaciones o cursos respectivamente. 
            Y se mostrar&aacute; el mismo formulario que al crear un centro.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Editar estructura docente.</strong><br>
            Para editar el nombre del centro debes hacer click en el bot&oacute;n 
            de la p&aacute;gina donde se muestra la lista de centros. Es muy importante 
            que el bot&oacute;n de editar que pulse sea el que corresponda al 
            centro que queremos editar.<br>
            Esta opci&oacute;n muestra la siguiente p&aacute;gina, donde vendr&aacute; 
            especificado el nombre del centro que has elegido.<br>
            Una vez modificado el nombre del centro pulse el bot&oacute;n &#8220;Cambiar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de los centros.<br>
            <font size="5"><img src="../images/ayuda/Dibujo14.jpg" alt="" width="253" height="233" /></font><br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de los centros, donde estar&aacute; modificado.<br>
            De igual forma para editar una titulaci&oacute;n o un curso, debemos 
            de pulsar el bot&oacute;n que se encuentra en la p&aacute;gina de 
            titulaciones o cursos respectivamente. Y se mostrar&aacute; el mismo 
            formulario que al editar un centro.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Eliminar estructura docente.</strong><br>
            Para eliminar un centro debes hacer click en el bot&oacute;n de la 
            p&aacute;gina donde se muestra la lista de centros. Es muy importante 
            que el bot&oacute;n de eliminar que pulse sea el que corresponda al 
            que queremos eliminar.<br>
            Esta opci&oacute;n muestra la siguiente p&aacute;gina, donde vendr&aacute; 
            especificado el nombre del centro que has elegido. <br>
            <font size="5"><img src="../images/ayuda/Dibujo15.jpg" alt="" width="256" height="236" /></font><br>
            Si este centro tiene asociado a &eacute;l alguna titulaci&oacute;n 
            o curso se mostrar&aacute; un mensaje en la parte superior, que especifica 
            si eliminamos este centro se eliminaran tambi&eacute;n las titulaciones 
            y cursos asociadas a &eacute;l.<br>
            Si est&aacute; de acuerdo con eliminar el centro o en su caso tambi&eacute;n 
            las titulaciones y cursos asociados a &eacute;l pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de los centros.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            Pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de los centros, donde ya no estar&aacute;.<br>
            De igual forma para eliminar una titulaci&oacute;n o un curso, debemos 
            de pulsar el bot&oacute;n que se encuentra en la p&aacute;gina de 
            titulaciones o cursos respectivamente. Y se mostrar&aacute; el mismo 
            formulario que al borrar un centro.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Descargar PDF.</strong><br>
            Para obtener un listado de los centros y titulaciones de la aplicaci&oacute;n 
            tienes que hacer click en el bot&oacute;n situado en cada una de las 
            p&aacute;ginas de las estructuras. <br>
            Una vez seleccionada la opci&oacute;n se crea autom&aacute;ticamente 
            un pdf con la lista de centros y titulaciones. Este pdf se guarda 
            por defecto en el directorio c:/ y el nombre ser&aacute; &#8220;InformeEstDocente.pdf&#8221;.<br>
            Pulsa el bot&oacute;n &#8220;Salir&#8221; y vuelve a la p&aacute;gina 
            de estructuras.</p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>
          <p align="left" class="T10L"><br>
            <font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="usuarios" id="usuarios"></a>Usuarios</font></p>
          <p class="T10L">A continuaci&oacute;n se muestra los pasos que el administrador 
            debe seguir para la gesti&oacute;n de usuarios, desde la opci&oacute;n 
            &#8220;Usuarios&#8221;.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Ver usuarios y profesor.</strong><br>
            Una vez seleccionada esta opci&oacute;n se muestra una p&aacute;gina 
            donde podemos ver la lista de usuario que hay introducidos en la aplicaci&oacute;n. 
            <br>
            <font size="5"><img src="../images/ayuda/Dibujo16.jpg" alt="" width="457" height="350" /></font> 
            <br>
            Para poder ver los datos asociados al usuario que sea profesor tienes 
            que hacer click en su login, y se mostrar&aacute; otra p&aacute;gina 
            con los datos del perfil p&uacute;blico del profesor. <br>
            <font size="5"><img src="../images/ayuda/Dibujo17.jpg" alt="" width="449" height="328" /></font><br>
            En la p&aacute;gina correspondiente al perfil del profesor podemos 
            volver atr&aacute;s haciendo click en el bot&oacute;n situado arriba 
            a la derecha.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Nuevo usuario.</strong><br>
            Para crear un nuevo usuario debes hacer click en el bot&oacute;n &#8220;Crear 
            Nuevo&#8221; de la p&aacute;gina de usuarios.<br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina.<br>
            <font size="5"><img src="../images/ayuda/Dibujo18.jpg" alt="" width="279" height="249" /></font><br>
            Debes introducir los datos del usuario y seleccionar el Rol si el 
            usuario es administrador o profesor. Una vez introducido pulse el 
            bot&oacute;n &#8220;Guardar&#8221;. Si por el contrario quieres salir 
            del formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te 
            lleva a la p&aacute;gina de usuarios.<br>
            Si ya existe otro usuario con el mismo login, se muestra un mensaje 
            indic&aacute;ndolo. Si la confirmaci&oacute;n de la contrase&ntilde;a 
            no es igual a la contrase&ntilde;a se muestra un mensaje indic&aacute;ndolo.<br>
            Una vez mostrado el mensaje de que se ha guardado con &eacute;xito 
            Pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios, donde estar&aacute; incluido.<br>
            Si el usuario es profesor se mostrar&aacute; el siguiente formulario, 
            para introducir los datos del perfil p&uacute;blico. Debes introducir 
            obligatoriamente el nombre y apellidos, los dem&aacute;s datos son 
            opcionales. <br>
            <font size="5"><img src="../images/ayuda/Dibujo19.jpg" alt="" width="318" height="282" /></font><br>
            Una vez introducidos lo datos pulse el bot&oacute;n &#8220;Guardar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de usuarios. 
            <br>
            Una vez mostrado el mensaje de que se ha guardado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios, donde estar&aacute; incluido.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Cambiar contrase&ntilde;a.</strong><br>
            Para cambiar la contrase&ntilde;a del usuario debes hacer click en 
            el bot&oacute;n de la p&aacute;gina de usuarios. Es muy importante 
            que el bot&oacute;n que pulse sea el que corresponda con el usuario 
            al que queremos cambiar su contrase&ntilde;a.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del usuario junto con la 
            contrase&ntilde;a actual para ser modificada.<br>
            <font size="5"><img src="../images/ayuda/Dibujo20.jpg" alt="" width="305" height="236" /></font><br>
            Una vez modificada la contrase&ntilde;a pulse el bot&oacute;n &#8220;Cambiar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de usuarios.<br>
            Una vez mostrado el mensaje de que se ha modificada con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios.<br>
            Si la confirmaci&oacute;n de la contrase&ntilde;a no es igual a la 
            contrase&ntilde;a se muestra un mensaje indic&aacute;ndolo.<br>
            <br>
            <font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font><strong> 
            Eliminar usuario.</strong><br>
            Para eliminar un usuario debes hacer click en el bot&oacute;n de la 
            p&aacute;gina de usuarios. Es muy importante que el bot&oacute;n de 
            eliminar que se pulse sea el que corresponda al usuario que queremos 
            eliminar.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del usuario que has elegido. 
            <br>
            <font size="5"><img src="../images/ayuda/Dibujo21.jpg" alt="" width="261" height="240" /></font><br>
            Si el usuario es profesor, se eliminar&aacute; tambi&eacute;n el perfil 
            de dicho profesor.<br>
            Si est&aacute; de acuerdo con eliminar el usuario pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de usuarios.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios, donde estar&aacute; eliminado.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Editar perfil profesor.</strong><br>
            Para editar el perfil p&uacute;blico del profesor debes hacer click 
            en el bot&oacute;n de la p&aacute;gina donde se muestra los datos 
            del profesor. Cuando selecciona la opci&oacute;n, se muestra la siguiente 
            p&aacute;gina, donde vendr&aacute; especificado los datos del profesor 
            que desea editar. <br>
            <font size="5"><img src="../images/ayuda/Dibujo22.jpg" alt="" width="296" height="262" /></font><br>
            Una vez modificados los datos pulse el bot&oacute;n &#8220;Cambiar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de usuarios.<br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Eliminar profesor.</strong><br>
            Para eliminar un profesor debes hacer click en el bot&oacute;n de 
            la p&aacute;gina donde se muestra los datos del profesor.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del profesor. <br>
            <font size="5"><img src="../images/ayuda/Dibujo23.jpg" alt="" width="299" height="309" /></font> 
            <br>
            Se eliminar&aacute; tambi&eacute;n el usuario asociado a este profesor. 
            Si est&aacute; de acuerdo con eliminar el usuario pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito, 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios, donde estar&aacute; eliminado.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font><strong> 
            Descargar PDF.</strong><br>
            Para obtener un listado de los usuarios de la aplicaci&oacute;n tienes 
            que hacer click en el bot&oacute;n situado en la p&aacute;gina de 
            usuarios.<br>
            Una vez seleccionada la opci&oacute;n se crea autom&aacute;ticamente 
            un pdf con la lista de usuarios. Este pdf se guarda por defecto en 
            el directorio c:/ y el nombre ser&aacute; &#8220;InformeUsuarios.pdf&#8221;.<br>
            Pulsa el bot&oacute;n &#8220;Salir&#8221; y vuelve a la p&aacute;gina 
            de usuarios.<br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p align="left" class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="asignaturas" id="asignaturas"></a>Asignaturas</font></p>
          <p align="left" class="T10L">A continuaci&oacute;n se muestra los pasos 
            que el administrador debe seguir para la gesti&oacute;n de asignaturas, 
            desde la opci&oacute;n &#8220;Asignaturas&#8221;.<br>
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver asignaturas y profesores.</strong><br>
            Una vez seleccionada esta opci&oacute;n se muestra una p&aacute;gina 
            donde podemos ver la lista de asignaturas que hay introducidos en 
            la aplicaci&oacute;n. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo24.jpg" alt="" width="487" height="674" /></strong></font><br>
            Para poder ver los profesores asociados a cada asignatura tienes que 
            hacer click en el nombre, y se mostrar&aacute; otra p&aacute;gina 
            con los datos del profesor o profesores que la imparten. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo25.jpg" alt="" width="481" height="345" /></strong></font><br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Nueva asignatura.</strong><br>
            Para crear una nueva asignatura debes hacer click en el bot&oacute;n 
            &#8220;Crear Nueva&#8221; de la p&aacute;gina de asignaturas.<br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina.<br>
            Debes introducir obligatoriamente el nombre de la asignatura que vamos 
            a crear. El nombre de la titulaci&oacute;n a la que vas a asignar 
            la asignatura no es obligatorio ya que ese dato se utiliza para realizar 
            una b&uacute;squeda por todas las titulaciones de la aplicaci&oacute;n. 
            Aunque no es obligatorio, se puede introducir alg&uacute;n car&aacute;cter 
            para ayudar a realizar la b&uacute;squeda. Una vez introducidos los 
            datos pulse el bot&oacute;n &#8220;Buscar&#8221;. Si por el contrario 
            quieres salir del formulario pulsa el bot&oacute;n &#8220;Cancelar&#8221; 
            que te lleva a la p&aacute;gina de asignaturas.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/ayuda/Dibujo26.jpg" alt="" width="273" height="268" /></strong></font><br>
            Una vez pulsado el bot&oacute;n &#8220;Buscar&#8221; se muestra una 
            lista con el resultado de la b&uacute;squeda. Con nombre de la asignatura, 
            los datos introducidos, si existen, para realizar la b&uacute;squeda 
            de la titulaci&oacute;n, junto con el resultado de la b&uacute;squeda 
            de las titulaciones y los cursos en los que se dividen.<br>
            Si quieres volver atr&aacute;s pulse en el enlace situado justo debajo 
            de la pantalla. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo27.jpg" alt="" width="270" height="267" /></strong></font><br>
            Si has encontrado la titulaci&oacute;n a la que quieres asignarle 
            la nueva asignatura, debes seleccionar el curso al que pertenecer&aacute; 
            haciendo click en el nombre. Una vez seleccionado se muestra la siguiente 
            p&aacute;gina. Donde har&aacute; una b&uacute;squeda por login, nombre 
            o apellidos del profesor que impartir&aacute; la asignatura.<br>
            Una vez introducidos los datos, de manera opcional, pulse el bot&oacute;n 
            &#8220;Buscar&#8221; y se mostrara la siguiente p&aacute;gina. Si 
            por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de asignaturas.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/ayuda/Dibujo28.jpg" alt="" width="271" height="229" /></strong></font><br>
            Una vez seleccionado el bot&oacute;n &#8220;Buscar&#8221;, se muestran 
            los criterios de b&uacute;squeda que haya introducidos, en el caso 
            de que haya sido as&iacute;. Justo debajo de los criterios se muestra 
            el resultado de la b&uacute;squeda, es decir, la lista de profesores 
            encontrados con esos criterios. <br>
            <font size="5"></font><font size="5"><strong><img src="../images/ayuda/Dibujo29.jpg" alt="" width="272" height="256" /></strong></font><br>
            Si has encontrado el profesor al que quieres asignarle la nueva asignatura, 
            debes seleccionarlo haciendo click en el nombre. <br>
            Una vez mostrado el mensaje de que se ha guardado con &eacute;xito 
            Pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de asignaturas, donde estar&aacute; incluida.</p>
          <p class="T10L"><font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            <strong>Editar asignatura.</strong><br>
            Para editar los datos de una asignatura debes hacer click en el bot&oacute;n 
            de la p&aacute;gina de asignaturas. Es muy importante que el bot&oacute;n 
            que pulse sea el que corresponda con la asignatura que queremos modificar.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado el nombre de la asignatura junto 
            con el nombre de la titulaci&oacute;n a la que pertenece.<br>
            Puedes modificar tanto el nombre de la asignatura como la titulaci&oacute;n 
            a la que pertenece o el curso. El nombre de la titulaci&oacute;n si 
            la quieres modificar no es obligatorio ya que ese dato se utiliza 
            para realizar una b&uacute;squeda por todas las titulaciones de la 
            aplicaci&oacute;n. Al igual que no es obligatorio puedes introducir 
            alg&uacute;n car&aacute;cter que ayude a realizar la b&uacute;squeda. 
            Una vez introducidos los datos pulse el bot&oacute;n &#8220;Editar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de asignaturas.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/ayuda/Dibujo30.jpg" alt="" width="260" height="254" /></strong></font><br>
            Una vez pulsado el bot&oacute;n &#8220;Editar&#8221; se muestra una 
            lista con el resultado de la b&uacute;squeda. Con nombre de la asignatura, 
            los datos introducidos, si existen, para realizar la b&uacute;squeda 
            de la titulaci&oacute;n, junto con el resultado de la b&uacute;squeda 
            de las titulaciones y los cursos en los que se dividen.<br>
            Si quieres volver atr&aacute;s pulse en el enlace situado justo debajo 
            de la pantalla. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo27.jpg" alt="" width="263" height="251" /></strong></font><br>
            Selecciona el curso al que quieras asignar la asignatura haciendo 
            click en el curso. <br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito, 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de asignaturas.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Eliminar asignatura.</strong><br>
            Para eliminar una asignatura debes hacer click en el bot&oacute;n 
            de la p&aacute;gina de asignaturas. Es muy importante que el bot&oacute;n 
            de eliminar que pulse sea el que corresponda con la asignatura que 
            queremos eliminar.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos de la asignatura que has 
            elegido. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo31.jpg" alt="" width="257" height="258" /></strong></font><br>
            Si est&aacute; de acuerdo con eliminar la asignatura pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de asignaturas.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de asignaturas, donde estar&aacute; eliminado.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            A&ntilde;adir profesor.</strong><br>
            Para a&ntilde;adir un nuevo profesor a una asignatura debes hacer 
            click en el bot&oacute;n &#8220;A&ntilde;adir Profesor&#8221; de la 
            p&aacute;gina donde se muestra los datos del profesor o los profesores 
            que la imparten. Cuando selecciona la opci&oacute;n, se muestra el 
            siguiente formulario de b&uacute;squeda. Puedes buscar por login, 
            nombre y apellidos del profesor. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo28.jpg" alt="" width="258" height="241" /></strong></font><br>
            Una vez introducidos los datos, de manera opcional, pulse el bot&oacute;n 
            &#8220;Buscar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de asignaturas.<br>
            Una vez seleccionado el bot&oacute;n &#8220;Buscar&#8221;, se muestra 
            los criterios de b&uacute;squeda que hayas introducidos, en el caso 
            de que haya sido as&iacute;. Justo debajo de los criterios se muestra 
            el resultado de la b&uacute;squeda, es decir, la lista de profesores 
            encontrados con esos criterios. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo29.jpg" alt="" width="258" height="244" /></strong></font><br>
            Si has encontrado el profesor que quieres a&ntilde;adir, debes seleccionarlo 
            haciendo click en el nombre.<br>
            Una vez mostrado el mensaje de que se ha a&ntilde;adido con &eacute;xito 
            Pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de profesores, donde estar&aacute; incluido.<br>
            <strong><br>
            <font size="5"><img src="../images/op_a1.gif" alt="" width="13" height="13" /></font> 
            Eliminar asignaci&oacute;n profesor.</strong><br>
            Para eliminar un profesor debes hacer click en el bot&oacute;n de 
            la p&aacute;gina donde se muestra los datos del profesor o los profesores 
            que la imparten.<br>
            Una vez seleccionada la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del profesor. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo32.jpg" alt="" width="261" height="246" /></strong></font><br>
            Si est&aacute; de acuerdo con eliminar el usuario pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de asignaturas.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de usuarios, donde estar&aacute; eliminado.<br>
            Si la asignatura solo tiene asignada un profesor se mostrar&aacute; 
            un mensaje indic&aacute;ndolo, y no podr&aacute; ser eliminado el 
            profesor.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de profesores.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Descargar PDF.</strong><br>
            Para obtener un listado de las asignaturas de la aplicaci&oacute;n 
            tienes que hacer click en el bot&oacute;n situado en la p&aacute;gina 
            de asignaturas.<br>
            Una vez seleccionada la opci&oacute;n se crea autom&aacute;ticamente 
            un pdf con la lista de asignaturas. Este pdf se guarda por defecto 
            en el directorio c:/ y el nombre ser&aacute; &#8220;InformeAsignaturas.pdf&#8221;. 
            <br>
            Pulsa el bot&oacute;n &#8220;Salir&#8221; y vuelve a la p&aacute;gina 
            de asignaturas.<br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p align="left" class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="calendario" id="calendario"></a>Calendario</font></p>
          <p align="left" class="T10L">A continuaci&oacute;n se muestra los pasos 
            que el administrador debe seguir para la gesti&oacute;n de la configuraci&oacute;n 
            del calendario, desde la opci&oacute;n &#8220;Calendario&#8221;.<br>
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong>Ver configuraci&oacute;n calendario</strong>.<br>
            Una vez seleccionada esta opci&oacute;n se muestra una p&aacute;gina 
            donde podemos ver la lista de periodos establecidos en el calendario 
            escolar que hay introducidos en la aplicaci&oacute;n. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo33.jpg" alt="" width="445" height="362" /></strong></font> 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Asignar nuevo</strong>.<br>
            Para crear un nuevo periodo en el calendario debes hacer click en 
            el bot&oacute;n &#8220;Asignar Nueva&#8221; de la p&aacute;gina que 
            muestra la lista de periodos ya establecidos.<br>
            Una vez seleccionada la opci&oacute;n, muestra la siguiente p&aacute;gina. 
            En ella podemos ver un formulario para introducir la fecha de inicio 
            del periodo y la fecha de fin, junto con una lista de tipos de periodos 
            posibles.<br>
            - D&iacute;as h&aacute;biles no lectivos: Son los d&iacute;as que 
            no hay clase sin ser festivos, por ejemplo: vacaciones de navidad<br>
            - D&iacute;as lectivos: Son los d&iacute;as que hay clase<br>
            - Periodo de ex&aacute;menes: Periodo establecido para ex&aacute;menes<br>
            - Fiestas patronales: Fiestas como son el d&iacute;a de San Jos&eacute;, 
            fiestas en la EPS, etc.<br>
            - D&iacute;as festivos: Fiestas como el d&iacute;a de la constituci&oacute;n 
            o la inmaculada. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo34.jpg" alt="" width="303" height="273" /></strong></font><br>
            Una vez introducidos todos los datos del formulario correctamente, 
            tened cuidado con las fechas por el formato establecido en el formulario 
            (dd/mm/yyyy). Si la fecha no es correcta se muestra un mensaje indic&aacute;ndolo.<br>
            Si los datos han sido introducidos correctamente puede pulsar el bot&oacute;n 
            &#8220;Guardar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de los periodos establecidos.<br>
            Una vez mostrado el mensaje de que se ha insertado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos, donde estar&aacute; insertada.</p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Editar periodo calendario.</strong><br>
            Para editar un periodo del calendario debes hacer click en el bot&oacute;n 
            de la p&aacute;gina donde se muestra la lista de periodos. Es muy 
            importante que el bot&oacute;n que pulse sea el que corresponda al 
            periodo que queremos modificar.<br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del periodo que desea editar. 
            <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo36.jpg" alt="" width="303" height="291" /></strong></font><br>
            Una vez modificados los datos pulse el bot&oacute;n &#8220;Editar&#8221;. 
            Si por el contrario quieres salir del formulario pulsa el bot&oacute;n 
            &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina de periodos.<br>
            Una vez mostrado el mensaje de que se ha modificado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
            <br>
            <font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Eliminar periodo calendario.</strong><br>
            Para eliminar un periodo del calendario debes hacer click en el bot&oacute;n 
            de la p&aacute;gina donde se muestra la lista periodos. Es muy importante 
            que el bot&oacute;n que pulse sea el que corresponda al periodo que 
            queremos eliminar.<br>
            Cuando selecciona la opci&oacute;n, se muestra la siguiente p&aacute;gina, 
            donde vendr&aacute; especificado los datos del periodo que desea eliminar. 
            <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo37.jpg" alt="" width="297" height="300" /></strong></font><br>
            Si est&aacute; de acuerdo con eliminar el periodo pulse el bot&oacute;n 
            &#8220;Borrar&#8221;. Si por el contrario quieres salir del formulario 
            pulsa el bot&oacute;n &#8220;Cancelar&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
            Una vez mostrado el mensaje de que se ha eliminado con &eacute;xito 
            pulsa el bot&oacute;n &#8220;Salir&#8221; que te lleva a la p&aacute;gina 
            de periodos.<br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p align="left" class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="confInicial" id="confInicial"></a>Configuraci&oacute;n Inicial</font></p>
          <p align="left" class="T10L">A continuaci&oacute;n se muestran los pasos 
            que el administrador debe seguir para la gesti&oacute;n de la configuraci&oacute;n 
            inicial, desde la opci&oacute;n &#8220;Configuraci&oacute;n Inicial&#8221;.<br>
            <br>
            Una vez seleccionada esta opci&oacute;n se muestra una p&aacute;gina 
            donde podemos ver una lista de las distintas partes de la configuraci&oacute;n 
            inicial junto con cada uno de los formularios correspondiente a cada 
            parte. <br>
            La lista que se muestra en la parte superior que es utilizada para 
            ir al formulario seleccionado, haciendo click en el nombre.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo38.jpg" alt="" width="329" height="154" /></strong></font><br>
            La primera es para configurar el correo saliente, este correo es el 
            que recibir&aacute; el alumno al asignarle la tutor&iacute;a con todos 
            los datos que corresponde a la asignaci&oacute;n.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos de la petici&oacute;n y por &uacute;ltimo 
            el enlace que se introducir&aacute; en el texto.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el nombre del profesor y los apellidos, tienes que 
            poner [[PROFESOR]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo39.jpg" alt="" width="433" height="431" /></strong></font><br>
            La segunda es para configurar el correo mis tutor&iacute;as, este 
            correo es el que recibir&aacute; el alumno cuando quiere eliminar 
            una tutor&iacute;a con todos los datos que corresponde a la tutor&iacute;a.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos y por &uacute;ltimo el enlace que 
            se introducir&aacute; en el texto.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el nombre del profesor y los apellidos, tienes que 
            poner [[PROFESOR]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo40.jpg" alt="" width="425" height="414" /></strong></font><br>
            La tercera es para configurar el correo tutor&iacute;a eliminada, 
            este correo es el que recibir&aacute; el alumno cuando ha sido eliminada 
            su tutor&iacute;a con todos los datos que corresponde a la tutor&iacute;a.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el nombre del profesor y los apellidos, tienes que 
            poner [[PROFESOR]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo41.jpg" alt="" width="420" height="335" /></strong></font><br>
            La cuarta es para configurar el correo modificaci&oacute;n tutor&iacute;a, 
            este correo es el que recibir&aacute; el alumno cuando su tutor&iacute;a 
            ha sido modificada con todos los datos que corresponde a la tutor&iacute;a.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos y por &uacute;ltimo el enlace que 
            se introducir&aacute; en el texto.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el nombre del profesor y los apellidos, tienes que 
            poner [[PROFESOR]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo42.jpg" alt="" width="427" height="440" /></strong></font><br>
            La quinta es para configurar el correo confirmar solicitud en curso, 
            este correo es el que recibir&aacute; el alumno solicita una tutor&iacute;a 
            con todos los datos que corresponde a la tutor&iacute;a.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos y por &uacute;ltimo el enlace que 
            se introducir&aacute; en el texto.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el nombre del profesor y los apellidos, tienes que 
            poner [[PROFESOR]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo43.jpg" alt="" width="423" height="410" /></strong></font><br>
            La sexta es para configurar el correo env&iacute;o c&oacute;digo identificador, 
            este correo es el que recibir&aacute; el alumno el identificador necesario 
            para ver la lista de peticiones de tutor&iacute;a que tiene asignadas.<br>
            Los datos a introducir son: el asunto del correo, el motivo que ser&aacute; 
            el texto que contiene los datos y por &uacute;ltimo el enlace que 
            se introducir&aacute; en el texto.<br>
            Los datos que introduciremos en el texto ser&aacute;n los especificados 
            justo debajo del enlace, y tendr&aacute;n el formato indicado. Donde 
            quieras que ponga el c&oacute;digo identificador, tienes que poner 
            [[CODE]] y as&iacute; con cada una de las variables especificadas.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo44.jpg" alt="" width="408" height="305" /></strong></font><br>
            La s&eacute;ptima es para configurar los par&aacute;metros para la 
            creaci&oacute;n del horario de tutor&iacute;a del profesor.<br>
            Los datos a introducir son: <br>
            - Slot de tiempo: que es tiempo que dura una tutor&iacute;a. Se mide 
            en minutos. <br>
            - M&eacute;todo de asignaci&oacute;n: puede ser manual o autom&aacute;tico, 
            manual si es el profesor el que quiere asignar las tutor&iacute;as 
            manualmente, si quiere una asignaci&oacute;n autom&aacute;tica tendr&aacute; 
            que elegir esa opci&oacute;n.<br>
            - Previsi&oacute;n m&iacute;nima: es el tiempo m&iacute;nimo que pasara 
            desde que el alumno solicita la tutor&iacute;a hasta la fecha asignada 
            para la tutor&iacute;a. Se mide en horas. <br>
            - Tiempo m&aacute;ximo de espera: es el tiempo m&aacute;ximo que tiene 
            el alumno para acepta la solicitud, o para aceptar la asignaci&oacute;n. 
            Se mide en horas. <br>
            - N&uacute;mero de ausencias: es el n&uacute;mero m&aacute;ximo de 
            ausencias realizadas por un alumno permitidas por el profesor a la 
            hora de la asignaci&oacute;n autom&aacute;tica.<br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
            Y si has introducido unos datos o has modificado los existentes pulsa 
            el bot&oacute;n &#8220;Guardar Cambios&#8221;. Una vez guardados volver 
            a la p&aacute;gina principal de la Zona Administrador. <br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo45.jpg" alt="" width="411" height="238" /></strong></font><br>
          </p>
          <p align="center" class="T10L"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p align="left" class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="trazas" id="trazas"></a>Ver Trazas</font></p>
          <p align="justify" class="T10L">A continuaci&oacute;n se muestra los 
            pasos que el administrador debe seguir para ver las trazas de un determinado 
            alumno.<br>
            Para poder ver las trazas de un alumno, tiene que hacer click en la 
            opci&oacute;n &#8220;Ver Trazas&#8221;.<br>
            <br>
            Una vez seleccionada la opci&oacute;n se muestra la siguiente p&aacute;gina 
            donde el administrador debe introducir el email del alumno que quiere 
            buscar y hacer click en el bot&oacute;n &#8220;Buscar&#8221;. <br>
            <font size="5"><img src="../images/ayuda/Dibujo46.jpg" alt="" width="467" height="403" /></font><br>
            El email tiene que ser introducido al completo, si el email no es 
            correcto, ya que debe de ser el de la uco, se muestra un mensaje indic&aacute;ndolo. 
            Si el alumno no existe se muestra un mensaje indic&aacute;ndolo.<br>
            Si el email es correcto se muestra la p&aacute;gina con las trazas 
            del alumno. En la parte superior de la p&aacute;gina se encuentra 
            el nombre y correo del alumno al que pertenecen las trazas, listadas 
            posteriormente.<br>
            De cada traza se muestra; la actividad, la acci&oacute;n, la fecha 
            y la hora que se genera, la traza, el profesor, la asignatura, la 
            fecha y la hora de la petici&oacute;n asignada a la traza.<br>
            Las distintas actividades son:<br>
            - Petici&oacute;n Tutor&iacute;a: generada al aceptar, rechazar, enviar 
            la petici&oacute;n ya asignada, al caducarse o reenviar el correo.<br>
            - Confirmaci&oacute;n petici&oacute;n en curso: generada al aceptar, 
            rechazar, enviar, eliminar cuando esta caducada la solicitud de la 
            petici&oacute;n o reenviar el correo.<br>
            - Mis Tutor&iacute;as: generada al enviar correo para eliminar petici&oacute;n 
            o al eliminar la petici&oacute;n.<br>
            - Petici&oacute;n Modificada: generada al enviar modificaci&oacute;n 
            de la tutor&iacute;a, aceptar y rechazar la modificaci&oacute;n.<br>
            - Petici&oacute;n Eliminada: generada al enviar correo petici&oacute;n 
            eliminada.<br>
            Las acciones son los diferentes motivos por lo que se crea la traza.<br>
            <font size="5"><img src="../images/ayuda/Dibujo47.jpg" alt="" width="458" height="800" /></font><br>
            Para volver hacia arriba pulsa el bot&oacute;n &#8220;Ir al principio&#8221;. 
          </p>
          <p align="center" class="T10L"><br>
            <font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font> 
          </p>
          <p align="left" class="T10L"><font size="5"><img src="../images/op_a2.gif" alt="" width="17" height="18" /> 
            <a name="alumnos" id="alumnos"></a>Listado Alumnos</font></p>
          <p align="left" class="T10L">A continuaci&oacute;n se muestra los pasos 
            que el administrador debe seguir para ver la lista de alumnos, desde 
            la opci&oacute;n &#8220;Listado Alumnos&#8221;.<br>
            <br>
            <font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong> Buscar alumnos</strong>.<br>
            Una vez seleccionada la opci&oacute;n se muestra el formulario de 
            b&uacute;squeda del alumno. La b&uacute;squeda puede ser por &#8220;Correo&#8221;, 
            por &#8220;Profesor&#8221; o por &#8220;Asignatura&#8221;. Una vez 
            introducidos los datos para realizar la b&uacute;squeda tienes que 
            pulsar el bot&oacute;n &#8220;Buscar&#8221; y se mostrar&aacute; la 
            informaci&oacute;n.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo48.jpg" alt="" width="451" height="328" /></strong></font></p>
          <p align="left" class="T10L">Si no introduce datos para realizar la 
            b&uacute;squeda se muestra el siguiente mensaje.<br>
            Si la b&uacute;squeda se realiza con &eacute;xito y encuentra alumnos 
            con esos criterios se muestra la lista.<br>
            Arriba se muestra los criterios de b&uacute;squeda que hemos introducido 
            anteriormente. M&aacute;s abajo podemos ver la lista de alumnos.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo49.jpg" alt="" width="453" height="383" /></strong></font> 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font><strong> 
            Ver peticiones del alumno.</strong><br>
            Para ver la lista de peticiones que tiene asignadas el alumno se obtienen 
            haciendo click en el correo del alumno.<br>
            Una vez pulsado el nombre se muestra la lista de peticiones. De cada 
            petici&oacute;n se conoce el nombre del profesor, la asignatura, el 
            motivo y el estado. <br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo50.jpg" alt="" width="453" height="366" /></strong></font><br>
            Para conocer m&aacute;s informaci&oacute;n acerca de la petici&oacute;n 
            tienes que hacer click en el nombre del profesor y se mostrara una 
            p&aacute;gina donde se muestra toda la informaci&oacute;n referente 
            a la petici&oacute;n seleccionada.<br>
            Desde esta p&aacute;gina podemos volver atr&aacute;s haciendo click 
            en el bot&oacute;n situado arriba a la derecha.<br>
            <font size="5"><strong><img src="../images/ayuda/Dibujo51.jpg" alt="" width="457" height="416" /></strong></font> 
          </p>
          <p class="T10L"><font size="5"><strong><img src="../images/op_a1.gif" alt="" width="13" height="13" /></strong></font> 
            <strong> Descargar PDF.</strong><br>
            Para obtener un listado de los alumnos de la aplicaci&oacute;n tienes 
            que hacer &#8220;click&#8221; en el bot&oacute;n situado en la p&aacute;gina 
            de alumnos.<br>
            Una vez seleccionada la opci&oacute;n se crea autom&aacute;ticamente 
            un pdf con la lista de alumnos. Este pdf se guarda por defecto en 
            el directorio c:/ y el nombre ser&aacute; &#8220;InformeAlumnos.pdf&#8221;. 
            <br>
            Pulsa el bot&oacute;n &#8220;Salir&#8221; y vuelve a la p&aacute;gina 
            de alumnos.</p>
          <p class="T10L" align="center"><font size="5"><a href="#inicio"><img src="../images/inicio_1.gif" alt="" width="71" height="42" border="0" /></a></font></p>

<%-- Incluimos el pie de pagina --%>
<jsp:include page="../view/pie.jsp"/>

</body></html>