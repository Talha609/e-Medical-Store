<%@page import="java.sql.*"%>
<%
    String session_email=(String)session.getAttribute("email");
	if(session_email==null)
	{
		response.sendRedirect("../Akif/login.html");
	}
	else
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
			String name=request.getParameter("name_m");
			String manufacturer=request.getParameter("manufacturer");
			String dates=request.getParameter("date_m");
			int qty=Integer.parseInt(request.getParameter("qty"));
			int price=Integer.parseInt(request.getParameter("price"));
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select name,manufactures from medicine;");
			int flag=0;
			while(rs.next())
			{
				if(rs.getString(1).equalsIgnoreCase(name) && rs.getString(2).equalsIgnoreCase(manufacturer))
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{
				PreparedStatement input=con.prepareStatement("insert into medicine(name,manufactures,date,quantity,price,email_id) values(?,?,?,?,?,?);");
				input.setString(1,name);
				input.setString(2,manufacturer);
				input.setString(3,dates);
				input.setInt(4,qty);
				input.setInt(5,price);
				input.setString(6,session_email);
				int x=input.executeUpdate();
				//out.println(x);
				if(x==1)
				{
					out.println("<script type='text/javascript' language='javascript'>");
					out.println("alert('Medicine Added');");
					out.println("window.location.href='Insert.jsp';");
					out.println("</script>");
				}
				else
				{
					out.println("<script type='text/javascript' language='javascript'>alert('Unable to Add');window.location.href='Insert.jsp';</script>");
				}
				
			}
			else
			{
				out.println("<script type='text/javascript' language='javascript'>alert('Medicine Already Added');window.location.href='Insert.jsp';</script>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>