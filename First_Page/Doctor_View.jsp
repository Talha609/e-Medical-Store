<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	if(session_email==null)
	{
		response.sendRedirect("../Akif/login.html");
	}
	else
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
			PreparedStatement ps=con.prepareStatement("select name,specialist,from_time,to_time,fees from doctor where email_id=?;");
			ps.setString(1,session_email);
			ResultSet rs=ps.executeQuery();
			out.println("<col width='19%'><col width='15%'><col width='13%'><col width='13%'><col width='15%'>");
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td style='text-align: center'>");
				out.println(rs.getString(1));
				out.println("</td>");
				
				out.println("<td style='text-align: center'>");
				out.println(rs.getString(2));
				out.println("</td>");
				
				out.println("<td style='text-align: center'>");
				out.println(rs.getString(3));
				out.println("</td>");
				
				out.println("<td style='text-align: center'>");
				out.println(rs.getString(4));
				out.println("</td>");
				
				out.println("<td style='text-align: center'>");
				out.println(rs.getString(5));
				out.println("</td>");
				out.println("</tr>");
				//out.println("<br>");
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>