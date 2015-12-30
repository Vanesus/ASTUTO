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
<%-- Paquetes Java importados necesarios para la ejecución de este fichero --%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>

<%-- Declaración de los javaBeans usados en este fichero --%>
<jsp:useBean id="messageBean" class="uco.interfaz.MsgBean" scope="session"/>
<jsp:useBean id="correoBean" class="uco.interfaz.CorreoBean" scope="session"/>

<%
	    //Extraigo el identificador de la operación a realizar
		String idProfesor = request.getParameter("idProfesor");
      	String texto=messageBean.getMsg();
	  	messageBean.setMsg("");

		Properties props = new Properties();

		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", "smtp.gmail.com");

		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", "true");

		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port","587");

		// Nombre del usuario
		props.setProperty("mail.smtp.user", correoBean.getEmisor());

		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", "true");
		
		Session sesion = Session.getDefaultInstance(props);
		sesion.setDebug(true);		
		
		MimeMessage message = new MimeMessage(sesion);
		try{
		
		// Quien envia el correo
		message.setFrom(new InternetAddress(correoBean.getEmisor()));

		// A quien va dirigido
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoBean.getReceptor()));
		
		//Asunto del correo
		message.setSubject(correoBean.getAsunto());
		//Motivo del correo
		message.setText(correoBean.getMotivo()+"\n");
		
		Transport t = sesion.getTransport("smtp");
		
		t.connect(correoBean.getEmisor(),correoBean.getContrasena());
		
		t.sendMessage(message,message.getAllRecipients());
		
		messageBean.setMsg("Correo enviado con éxito. \n"+texto);
		t.close();
		
		} catch (MessagingException e) {
			System.err.println(e.getMessage());
			messageBean.setMsg("No se ha podido mandar el correo. Se ha producido un error en el envío.");
		}
		
 	//Redirecciono a la vista que muestra la pagina.        
  	%>
  	<jsp:forward page="<%=messageBean.getUrl()%>"/>
 