<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	//out.println(session_email);
	try
	{
		String val=request.getParameter("valuess");
		if(val!="1")
		{
			String[] values=val.split("@");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
			PreparedStatement ps=con.prepareStatement("select name,age,date from appointment where email_id=? and date=? and doctor_name=?;");
			ps.setString(1,session_email);
			ps.setString(2,values[0]);
			ps.setString(3,values[1]);
			ResultSet rs=ps.executeQuery();
			int i=1;
			out.println("<col width='100px'><col width='300px'><col width='100px'><col width='200px'>");
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td style='text-align:center'>");
				out.println(i++);
				out.println("</td>");
				
				out.println("<td style='text-align:center'>");
				out.println(rs.getString(1));
				out.println("</td>");
				
				out.println("<td style='text-align:center'>");
				out.println(rs.getString(2));
				out.println("</td>");
				
				out.println("<td style='text-align:center'>");
				out.println(rs.getString(3));
				out.println("</td>");
				
				out.println("</tr>");
			}
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>