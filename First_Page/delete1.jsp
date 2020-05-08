<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
        PreparedStatement ps1=con.prepareStatement("select * from medicine_name where email_id=?;");
		ps1.setString(1,session_email);
        ResultSet rs1=ps1.executeQuery();
        while(rs1.next())
		{
            int q=rs1.getInt(3);
            PreparedStatement ps=con.prepareStatement("update medicine set quantity=quantity-? where name=? and email_id=?;");
            ps.setInt(1,rs1.getInt(3));
			ps.setString(2,rs1.getString(2));
			ps.setString(3,session_email);
			ps.executeUpdate();
            PreparedStatement ps2=con.prepareStatement("insert into sell_history values(?,?,curdate(),?)");
            ps2.setInt(2,rs1.getInt(3));
			ps2.setString(1,rs1.getString(2));
			ps2.setString(3,session_email);
            ps2.executeUpdate();
		
			PreparedStatement ps3=con.prepareStatement("delete from medicine_name where name=? and email_id=?;");
			ps3.setString(1,rs1.getString(2));
			ps3.setString(2,session_email);
			ps3.executeUpdate();
		}
		con.close();
        out.println("<script type='text/javascript' language='javascript'>");
        out.println("alert('Successfully order');");
        out.println("window.location.href='sell_new.jsp';");
        out.println("</script>");
	
   }
	catch(Exception e){
		out.println(e);
}
	
%>