<html>
    <head>
        <script type="text/javascript" language="javascript">
        
            function check1(){
                document.write("akif123");
                //if(document.getElementById("ch").checked){
                    //document.write("akif");
                    //document.getElementById("check").checked=false;
                    
                    f.method="get";
                    f.action="cart.jsp";
                    f.submit();
            }
        </script>
    </head>
    <body>
    </body>
</html>
<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
   String search=request.getParameter("search");
try{
	//loading the class
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
    PreparedStatement ps = con.prepareStatement("select * from medicine where name like ? and email_id=?");
    ps.setString(1,"%"+search+"%");
	ps.setString(2,session_email);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
   
            out.println("<form method='get' class='table table-striped' action='delete1.jsp'>");	
            out.println("<col width='20%'><col width='17%'><col width='20%'><col width='17%'><col width='25%'>");
            out.println("<TR style='text-align:center'>");    

            out.println("<TD>");
            out.println(rs.getString(2));
            out.println("</TD>");
            out.println("<TD>");
            out.println(rs.getString(5));
            out.println("</TD>");
            out.println("<TD>");
            out.println(rs.getString(3));
            out.println("</TD>");
            out.println("<TD>");
            out.println(rs.getString(6));
            out.println("</TD>");
            out.println("<TD>");
            out.println("</form>");	
            out.println("<form action='cart.jsp' method='get' ><input type='number' name='c' width='300px' placeholder='Enter Quantity' required><Button class='btn btn-default' type='submit' name='c' value='"+rs.getString(2)+"'>Buy</Button></form>");
            out.println("</TD>");
            out.println("</TR>");   


		
	}
	con.close();
}catch(Exception e){
	out.println(e);
}
%>