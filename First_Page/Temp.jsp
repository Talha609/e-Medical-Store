<%@page import="java.sql.*"%>
<%
   try
   {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emedical","root","123456");
        Statement s=con.createStatement();
        ResultSet rs=s.executeQuery("select * from registration");
        while(rs.next())
        {
            out.println("<table class='table' border='5' style='width: 500px;height: 500px;' align='center'>");
   
            out.println("<tr style='text-align: center'>");
            out.println("<td colspan='2'> Firm Name </td>");
            out.println(rs.getString(1));
            out.println("</tr>");
   
            out.println("<tr>");
            out.println("<td> Name: </td>");
            out.println(rs.getString(2));
            out.println("<td> GST No: </td>");
            out.println(rs.getString(3));
            out.println("</tr>");
   
            out.println("<tr>");
            out.println("<td colspan='2'> Email: </td>");
            out.println("</tr>");
   
            out.println("<tr>");
            out.println("<td colspan='2'> Address: </td>");
            out.println("</tr>");
   
            out.println("<tr>");
            out.println("<td colspan='2'> Locality: </td>");
            out.println("</tr>");
   
            out.println("<tr>");
            out.println("<td colspan='2'> Time: </td>")
            out.println("</tr>");
   
            out.println("</table>");
        }
   }
%>