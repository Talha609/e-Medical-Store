<%@page import="java.sql.*"%>
<%
	String specialist=request.getParameter("special");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
	PreparedStatement ps=con.prepareStatement("select name from doctor where specialist=?;");
	ps.setString(1,specialist);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
	}
	con.close();
%>