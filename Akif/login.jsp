<%@page import ="java.sql.*"%>
<%
try
{
   String[] login_detail=request.getParameterValues("c2");
	//step-1 register the driver
	Class.forName("com.mysql.jdbc.Driver");
	//step-2 create connection
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
	Statement s=con.createStatement();
	//step-3 Execute statement
	ResultSet rs=s.executeQuery("select email_id,password from registration;");
	int count=0;
	while(rs.next())
    {
		if(rs.getString(1).equals(login_detail[0])&&rs.getString(2).equals(login_detail[1]))
        {
            count+=1;
            break;
        }
    }
	if(count==1)
    {
        session.setAttribute("email",login_detail[0]);
        response.sendRedirect("../First_Page/Insert.jsp");
    }
	else
	{
		response.sendRedirect("../Akif/login.html");
        //out.println("<html><head><script language='javascript' type='text/javascript'>alert('Login Failed')</script></head><body></body></html>");
	}
	con.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>