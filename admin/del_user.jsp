<html>
    <HEAD>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Page</title>
        <link href="styling.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script type="text/javascript" language="javascript">
            function del_user(){
                f.method="get";
                f.action="del_user_db.jsp";
                f.submit();
            }
        
        </script>
    </HEAD>
    <BODY style="background: none">
        <script src="nav.js"></script>
    </BODY>
</html>
<%@page import="java.sql.*"%>
<%
	try{
        if(session.getAttribute("email_id")==null)
            response.sendRedirect("login_admin.html");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
        PreparedStatement ps1=con.prepareStatement("select * from registration");
        ResultSet rs1=ps1.executeQuery();
        out.println("<table class='table'>");
        out.println("<form name='f'>");
        out.println("<col width='9%px'><col width='15%px'><col width='9%'><col width='9%px'><col width='9%px'><col width='9%px'><col width='20%px'><col width='10%px'><col width='10%px'>");
        out.println("<tr><th style='text-align: center'>User Name</th><th style='text-align: center'>Email-ID</th><th style='text-align: center'>Passwrod</th><th style='text-align: center'>Firm Name</th><th style='text-align: center'>Owner_name</th><th style='text-align: center'>GST Number</th><th style='text-align: center'>Address</th><th style='text-align: center'>Locality</th><th style='text-align: center'>Remove</th></tr>");
        while(rs1.next()){
		    out.println("<TR >");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(1));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");
                            out.println(rs1.getString(2));
                            out.println("</TD >");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(3));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(4));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(5));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(6));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(7));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");		
                            out.println(rs1.getString(8));
                            out.println("</TD>");
                            out.println("<TD style='text-align: center'>");
                            out.println("<button class='btn btn-default' type='submit' value='"+rs1.getString(2)+"' onclick='del_user()' name='email'>REMOVE</button>");
                            out.println("</TD>");
            out.println("</TR>");
		}
        out.println("</form>");
        out.println("</table>");
		con.close();
    }
	catch(Exception e){
		out.println(e);
    }
	
%>
