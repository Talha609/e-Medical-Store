<%@page import="java.sql.*"%>
<%
	String session_email=(String)session.getAttribute("email");
	if(session_email==null)
	{
		response.sendRedirect("../Akif/login.html");
	}
	else
	{
		int id=Integer.parseInt(request.getParameter("id_col"));
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
			String name=request.getParameter("name_m");
			String manufacturer=request.getParameter("manufacturer");
			
			int qty=Integer.parseInt(request.getParameter("qty"));
			int price=Integer.parseInt(request.getParameter("price"));
			PreparedStatement input=con.prepareStatement("update medicine set name=?,manufactures=?,quantity=?,price=? where email_id=? and id=?;");
			input.setString(1,name);
			input.setString(2,manufacturer);
			input.setInt(3,qty);
			input.setInt(4,price);
			input.setString(5,session_email);
			input.setInt(6,id);
			int x=input.executeUpdate();
			if(x==1)
			{
				out.println("<script type='text/javascript' language='javascript'>alert('Medicine Updated');window.location.href='update_view.jsp';</script>");
			}
			else
			{
				out.println("<script type='text/javascript' language='javascript'>alert('Unable to Update Medicine');window.location.href='update_view.jsp';</script>");
			}
			//response.sendRedirect("update_view.jsp");
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>