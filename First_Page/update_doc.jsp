<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	int id=Integer.parseInt(request.getParameter("id_col"));
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
		String name=request.getParameter("name_d");
		String specialist=request.getParameter("specialist");
		
		String from_time=request.getParameter("from_time");
		String to_time=request.getParameter("to_time");
		int fees=Integer.parseInt(request.getParameter("fees"));
		PreparedStatement input=con.prepareStatement("update doctor set name=?,specialist=?,from_time=?,to_time=?,fees=? where email_id=? and id=?;");
		input.setString(1,name);
		input.setString(2,specialist);
		input.setString(3,from_time);
		input.setString(4,to_time);
		input.setInt(5,fees);
		input.setString(6,session_email);
		input.setInt(7,id);
		int x=input.executeUpdate();
		if(x==1)
		{
			out.println("<script type='text/javascript' language='javascript'>alert('Doctor Details Updated');window.location.href='update_view.jsp';</script>");
		}
		else
		{
			out.println("<script type='text/javascript' language='javascript'>alert('Unable to Update Doctor Details');window.location.href='update_view.jsp';</script>");
		}
		//response.sendRedirect("update_view.jsp");
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>