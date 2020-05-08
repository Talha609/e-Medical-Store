<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	String id=request.getParameter("id_name");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
	PreparedStatement ps=con.prepareStatement("delete from medicine where email_id=? and id=?;");
	ps.setString(1,session_email);
	ps.setString(2,id);
	ps.executeUpdate();
	out.println("<script type='text/javascript' language='javascript'>alert('Medicine Deleted');window.location.href='Delete_view.jsp';</script>");
	//response.sendRedirect("Delete_view.jsp");
	con.close();
%>	