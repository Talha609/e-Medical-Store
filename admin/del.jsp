<%@page import="java.sql.*"%>
<%
   String email=request.getParameter("email");
   try{
        if(session.getAttribute("email_id")==null)
            response.sendRedirect("login_admin.html");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
        PreparedStatement ps1=con.prepareStatement("delete from admin where email=?");
        Statement s=con.createStatement();
	    //step-3 Execute statement
	    ResultSet rs=s.executeQuery("select count(*) from admin;");
        rs.next();
        if(rs.getInt(1)==1)
{
		con.close();
            response.sendRedirect("del_admin.jsp");
}
        else{
            ps1.setString(1,email);
            ps1.executeUpdate();
            con.close();
            response.setHeader("Expires","0");
            response.sendRedirect("del_admin.jsp");
        }
    
    }
	catch(Exception e){
		out.println(e);
    }
%>