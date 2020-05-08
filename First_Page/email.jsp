<%@page import="java.io.*,java.util.*,javax.mail.*"%>
<%@page import="javax.mail.internet.*,javax.activation.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	String[] values=request.getParameterValues("name");
	String to,from,host;
	to="mohdtalha609@gmail.com";    // recipient email id //values[1]
	from="zaid4863@gmail.com";   // sender email id
	host="smtp.gmail.com";           // Gmail host
	//host="localhost";
	
	final String username="zaid4863@gmail.com";
	final String password="Shabmaht";
	
	Properties obj=new Properties(); 			 // host k corresponsing properties set krte hai
	obj.put("mail.smtp.auth","true");			 // authentication
	obj.put("mail.smtp.starttls.enable","true"); // protocol k use
	obj.put("mail.smtp.host",host);				 // kis host k through jaaiga
	obj.put("mail.smtp.port","587");			 // gmail default port number
	
	Session mailSession=Session.getInstance(obj,new javax.mail.Authenticator()
	{
		protected PasswordAuthentication getPasswordAuthentication()
		{
			return new PasswordAuthentication(username,password);
		}
	});
	try
	{
		MimeMessage message=new MimeMessage(mailSession);						// message object
		message.setFrom(new InternetAddress(from));								//setting internet address of senderfrom
		message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));	//to
		message.setSubject("e-Medical Store");			//message subject
		message.setText(values[1] + "\n" + values[2]);	//message text
		Transport.send(message);				//send command
		out.println("<script type='text/javascript' language='javascript'>alert('Send');</script>");
		response.sendRedirect("index.html");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>