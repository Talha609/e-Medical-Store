<%@page import="java.sql.*"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>eMedical Website</title>

        <link href="styling.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    </head>
    <body style="background: none">
      <script src="Nav.js"></script>
      
      <div class="container">
            <!--<form class="form-horizontal" action="Save.jsp" method="post" onsubmit="return update()">-->
            <h2 align="center" id="heading">Firm Details</h2> 
            <table class='table' border='5' cellspacing="10px"  style='width: 500px;height: 400px;' align='center'>
				<%
					try
					{
						String session_email=(String)session.getAttribute("email");
						if(session_email==null)
						{
							response.sendRedirect("../Akif/login.html");
						}
						else
						{
							Class.forName("com.mysql.jdbc.Driver");
							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
							PreparedStatement ps=con.prepareStatement("select * from registration where email_id=?;");
							ps.setString(1,session_email);
							ResultSet rs=ps.executeQuery();
							while(rs.next())
							{
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td colspan='2'> <b>Firm Name</b> : " + rs.getString(4)+ "</td>");
								out.println("</tr>");
								
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td> <b>Name :</b> " + rs.getString(5) + "</td>");
								out.println("<td> <b>GST No :</b> " + rs.getString(6) + "</td>");
								out.println("</tr>");
								
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td colspan='2'> <b>Email :</b> " + rs.getString(2) + "</td>");
								out.println("</tr>");
								
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td colspan='2'> <b>Address :</b> " + rs.getString(7) + "</td>");
								out.println("</tr>");
								
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td colspan='2'> <b>Locality :</b> " + rs.getString(8) + "</td>");
								out.println("</tr>");
								
								out.println("<tr style='text-align: center;font-size:20px'>");
								out.println("<td colspan='2'> <b>User Name :</b> " + rs.getString(1) + "</td>");
								out.println("</tr>");
							}
						}
					}
					catch(Exception e)
					{
						out.println(e);
					}
				%>
            </table>
            <!--<input type="submit" value="Update" style="margin-top: 10px;height: 30px;width: 110px;margin-left: 65%">-->
    </body>
</html>