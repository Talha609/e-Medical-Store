<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
    String [] selectedmedicine;
    selectedmedicine=request.getParameterValues("r");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");

        PreparedStatement ps=con.prepareStatement("delete from medicine_name where id=? and email_id=?;");
        ps.setInt(1,Integer.parseInt(selectedmedicine[0]));
		ps.setString(2,session_email);
        ps.executeUpdate();
		con.close();
	   response.sendRedirect("cart_item.jsp");       
	
   }
	catch(Exception e){
		out.println(e);
}
	
%>