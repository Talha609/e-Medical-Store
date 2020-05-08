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
			PreparedStatement ps=con.prepareStatement("select name,manufactures,quantity,price,id from medicine where email_id=?;");
			ps.setString(1,session_email);
			ResultSet rs=ps.executeQuery();
			out.println("<col width='20%'><col width='25%'><col width='15%'><col width='20%'><col width='20%'>");
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
				out.println("<button class='btn btn-default' type='submit' name='id_name' value='"+rs.getInt(5)+"'>Update</button>");
				//out.println("<input type='hidden' value='"+rs.getInt(5)+"' name='id_name'>");
				out.println("</td>");
				out.println("</tr>");
				//out.println("<br>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>