<%@page import="java.sql.*"%>
<%
	try
	{
		String session_email=(String)session.getAttribute("email");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
		PreparedStatement ps1=con.prepareStatement("select s.name,m.manufactures,s.quantity,s.time from sell_history as s,medicine as m where s.email_id=m.email_id and s.name=m.name and s.email_id=?;");
		ps1.setString(1,session_email);
		ResultSet rs=ps1.executeQuery();
		out.println("<col width='20%'><col width='25%'><col width='15%'><col width='20%'>");
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
			out.println("</tr>");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>