<%@page import="java.sql.*"%>
<%
   String email=request.getParameter("email");
   try{
        if(session.getAttribute("email_id")==null)
            response.sendRedirect("login_admin.html");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
        PreparedStatement ps1=con.prepareStatement("delete from doctor where email_id=?;");
        PreparedStatement ps2=con.prepareStatement("delete from medicine where email_id=?;");
        PreparedStatement ps3=con.prepareStatement("delete from sell_history where email_id=?;");
        PreparedStatement ps4=con.prepareStatement("delete from  medicine_name where email_id=?;");
        PreparedStatement ps5=con.prepareStatement("delete from registration where email_id=?;");
            ps1.setString(1,email);
            ps2.setString(1,email);
            ps3.setString(1,email);
            ps4.setString(1,email);
            ps5.setString(1,email);
            ps1.executeUpdate();ps2.executeUpdate();ps3.executeUpdate();ps4.executeUpdate();ps5.executeUpdate();
                                        
            con.close();
            out.println("<script type='text/javascript' language='javascript'>");
            out.println("alert('User Deleted Successfully');");
            out.println("window.location.href='del_user.jsp';");
            out.println("</script>");
    
    }
	catch(Exception e){
		out.println(e);
    }
%>