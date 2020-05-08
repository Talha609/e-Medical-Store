<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	try{
	int x=0;
	String [] selectedmedicine;
	selectedmedicine=request.getParameterValues("c");
	if(selectedmedicine[0]!=null){
		//loading the jdbc Driver
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
             
            PreparedStatement ps1=con.prepareStatement("select quantity from medicine where name=? and email_id=?;");
			ps1.setString(1,selectedmedicine[1]);
			ps1.setString(2,session_email);
			ResultSet rs=ps1.executeQuery();
            rs.next();

            if((Integer.parseInt(rs.getString(1)))<(Integer.parseInt(selectedmedicine[0])))
			{
                out.println("not in capacity");
                con.close();
                response.sendRedirect("sell_new.jsp");
            }
            else
			{
				PreparedStatement ps=con.prepareStatement("insert into medicine_name(name,quantity,time,email_id) value(?,?,sysdate(),?);");
				ps.setString(1,selectedmedicine[1]);
				ps.setInt(2,Integer.parseInt(selectedmedicine[0]));
				ps.setString(3,session_email);
				ps.executeUpdate();
				con.close();
				response.sendRedirect("sell_new.jsp");
            }
    }
	else{
		response.sendRedirect("sell_new.jsp");
	}
}
	catch(Exception e){
		out.println(e);
}
	
%>