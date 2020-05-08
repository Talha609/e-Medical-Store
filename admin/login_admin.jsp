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
	ResultSet rs=s.executeQuery("select email,password from admin;");
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
        session.setAttribute("email_id",login_detail[0]);
        response.sendRedirect("admin_page.jsp");
    }
	else
	{
		response.sendRedirect("login_admin.html");
	}
	con.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>