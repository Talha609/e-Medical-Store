<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eMedical Sell</title>

    <link href="styling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
      
    <script language="javascript" type="text/javascript">
        function display(){
            var s=document.getElementById("search").value;
            var obj=new XMLHttpRequest();
            obj.onreadystatechange=function(){
                if((obj.readyState==4)&&(obj.status==200)){
                   document.getElementById("suggestion").innerHTML=obj.responseText; 
                }
            }
            obj.open("get","search.jsp?search="+s,true);
            obj.send();
        }
        function data1(){
                //document.write("akif123");
                //if(document.getElementById("ch").checked){
                    //document.write("akif");
                    //document.getElementById("check").checked=false;
                    f.method="get";
                    f.action="cart.jsp";
                    f.submit();

        }
    </script>

      
  </head>
  <body style="background: none">
      <!--Create Nav bar-->
      <script src="Nav.js"></script>
      
      <div class="fill-container" style="width: 90%;margin-left: 5%">
      <h2 align="center">Sell Medicines</h2>
      </div>
      <table class="table" style="margin-top: 20px">
        <col width="17%">
        <col width="17%">
        <col width="20%">
        <col width="20%">
        <col width="15%">
        <col width="17%">
          <tr>
            <th style="text-align: center">Name</th>
            <th style="text-align: center">Quantity</th>
            <th style="text-align: center">Manufacture</th>
            <th style="text-align: center">Date</th>
            <th style="text-align: center">Price</th>
            <th style="text-align: center">Remove</th>
          </tr>
        </table>
    <%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	try{
        int x=0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
        PreparedStatement ps1=con.prepareStatement("select * from medicine_name where email_id=?;");
		ps1.setString(1,session_email);
        ResultSet rs1=ps1.executeQuery();
        while(rs1.next())
        {
			PreparedStatement ps=con.prepareStatement("select * from medicine where name=? and email_id=?;");
			ps.setString(1,rs1.getString(2));
			ps.setString(2,session_email);
			ResultSet rs=ps.executeQuery();
            out.println("<table class='table'>");
            out.println("<col width='17%'><col width='17%'><col width='20%'><col width='20%'><col width='15%'><col width='17%'>");
	        rs.next();
                out.println("<TR style='text-align: center'>");
                out.println("<TD>");		
                out.println(rs.getString(2));
                out.println("</TD>");
                out.println("<TD>");
                out.println(rs1.getString(3));
                out.println("</TD>");
                out.println("<TD>");
                out.println(rs.getString(3));
                out.println("</TD>");
                out.println("<TD>");
                out.println(rs.getString(4));
                out.println("</TD>");
                out.println("<TD>");
                out.println(rs.getString(5));
                out.println("</TD>");
                out.println("<TD>");
                out.println("<form method='get' action='remove.jsp'>");
                    out.println("<Button class='btn btn-default' type='submit' value='"+rs1.getInt(1)+"' name='r'>Remove</Button>");
                out.println("</form>");
                out.println("</TD>");

                out.println("</TR>");   
                out.println("</table>");
		}
        out.println("<form method='get' action='delete1.jsp'>");
        out.println("<input type='submit' style='margin-left:92%' class='btn btn-default' value='Confirm'>");
        out.println("</form>");
		con.close();
    }
	catch(Exception e)
	{
		out.println(e);
    }
%>
  </body>
</html>