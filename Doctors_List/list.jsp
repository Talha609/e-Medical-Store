<%@page import="java.sql.*"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Doctors List</title>

        <link href="styling.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
    </head>
    <body>
        <script src="Nav_home.js"></script>
        <div class="container">
            <table class="table" border="5" cellpadding="10">
                <col width="15%">
                <col width="15%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
				<col width="20%">
                <tr>
                    <th style="text-align: center"> Name: </th>
                    <th style="text-align: center"> Specialist Of: </th>
                    <th style="text-align: center"> From: </th>
					<th style="text-align: center"> To: </th>
                    <th style="text-align: center"> Fees: </th>
					<th style="text-align: center"> Address: </th>
                </tr>
                <%
					String specialist=request.getParameter("B");
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
				    PreparedStatement s=con.prepareStatement("select d.name,d.specialist,d.from_time,d.to_time,d.fees,d.email_id,r.locality from doctor as d,registration as r where specialist=? and d.email_id=r.email_id;");
				    out.println("<col width='15%'><col width='15%'><col width='10%'><col width='10%'><col width='10%'><col width='20%'>");
					s.setString(1,specialist);
				    ResultSet rs=s.executeQuery();
				    while(rs.next())
				    {
						out.println("<tr style='text-align: center'>");
						out.println("<td>");
						out.println(rs.getString(1));
						out.println("</td>");
				   
						out.println("<td>");
						out.println(rs.getString(2));
						out.println("</td>");
					
						out.println("<td>");
						out.println(rs.getString(3));
						out.println("</td>");
						
						out.println("<td>");
						out.println(rs.getString(4));
						out.println("</td>");
					
						out.println("<td>");
						out.println(rs.getInt(5));
						out.println("</td>");   
				   
						out.println("<td>");
						out.println(rs.getString(7));
						out.println("</td>");   
						
						out.println("</tr>");
				    }
                %>
            </table>
        </div>
    </body>
</html>