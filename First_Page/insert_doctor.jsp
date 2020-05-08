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
			String name=request.getParameter("name_d");
			String specialist=request.getParameter("specialist");
			String dates=request.getParameter("date_d");
			String from_time=request.getParameter("from_time");
			String to_time=request.getParameter("to_time");
			int fees=Integer.parseInt(request.getParameter("fees"));
			String d1=request.getParameter("d1");
			String d2=request.getParameter("d2");
			String d3=request.getParameter("d3");
			String d4=request.getParameter("d4");
			String d5=request.getParameter("d5");
			String d6=request.getParameter("d6");
			String d7=request.getParameter("d7");
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select name,specialist from doctor;");
			int flag=0;
			while(rs.next())
			{
				if(rs.getString(1).equalsIgnoreCase(name) && rs.getString(2).equalsIgnoreCase(specialist))
				{
					flag=1;
					break;
				}
			}
			if(flag==0)
			{
				PreparedStatement input=con.prepareStatement("insert into doctor(name,specialist,date,from_time,to_time,fees,mon,tue,wed,thurs,fri,sat,sun,email_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
				input.setString(1,name);
				input.setString(2,specialist);
				input.setString(3,dates);
				input.setString(4,from_time);
				input.setString(5,to_time);
				input.setInt(6,fees);
				input.setString(7,d1);
				input.setString(8,d2);
				input.setString(9,d3);
				input.setString(10,d4);
				input.setString(11,d5);
				input.setString(12,d6);
				input.setString(13,d7);
				input.setString(14,session_email);
				input.executeUpdate();
				out.println("<script type='text/javascript' language='javascript'>alert('Doctor  Added');window.location.href='Insert.jsp';</script>");
				//response.sendRedirect("Insert.jsp");
			}
			else
			{
				out.println("<script type='text/javascript' language='javascript'>alert('Doctor Already Added');window.location.href='Insert.jsp';</script>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println("Error " + e);
		}
	}
%>