<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	//String specialist=request.getParameter("special");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
	PreparedStatement ps=con.prepareStatement("select name from doctor where email_id=?;");
	ps.setString(1,session_email);
	ResultSet rs=ps.executeQuery();
	out.println("<option value='1'>Select</option>");
	while(rs.next())
	{
		out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
	}
	con.close();
%>