<%@page import="java.sql.*"%>
<%
    String session_email=(String)session.getAttribute("email");
	if(session_email==null)
	{
		response.sendRedirect("../Akif/login.html");
	}
	else{
	try
	{
		String choice=request.getParameter("choice1");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
		if(choice.equals("Medicine"))
		{
			String name_m=request.getParameter("name_m");
			PreparedStatement delete=con.prepareStatement("delete from medicine where name=? and email_id=?;");
			delete.setString(1,name_m);
	        delete.setString(2,session_email);
			int x=delete.executeUpdate();
			if(x==1)
			{
				response.sendRedirect("Delete.html");
			}
			else
			{
				out.println(request.getAttribute("errorMessage"));
			}
		}
		else if(choice.equals("Doctor"))
		{
			String name_d=request.getParameter("name_d");
			PreparedStatement delete=con.prepareStatement("delete from doctor where name=? and email_id=?;");
			delete.setString(1,name_d);
	        delete.setString(2,session_email);
			int x=delete.executeUpdate();
			if(x==1)
			{
				response.sendRedirect("Delete.html");
			}
			else
			{
				out.println(request.getAttribute("errorMessage"));
			}
		}
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
	}
%>