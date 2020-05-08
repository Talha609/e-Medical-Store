<%@page import="java.sql.*"%>
<%
    String session_email=(String)session.getAttribute("email");
	try
	{
		String choice=request.getParameter("choice1");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
		PreparedStatement update;
		if(choice.equals("Medicine"))
		{
			String name_m=request.getParameter("name_m");
			String manufacturer=request.getParameter("manufacturer");
			String date_m=request.getParameter("date_m");
			String qty=request.getParameter("qty");
			String price=request.getParameter("price");
			int quantity,prices;
			
            if(!(manufacturer.equals("")) && qty.equals("") && price.equals(""))
            {
                update=con.prepareStatement("update medicine set manufacturers=?,date=? where name=? and email_id=?;");
                update.setString(1,manufacturer);
                update.setString(2,date_m);
                update.setString(3,name_m);
                update.setString(4,session_email);
            }
            else if(manufacturer.equals("") && (!(qty.equals(""))) && price.equals(""))
            {
                update=con.prepareStatement("update medicine set quantity=?,date=? where name=? and email_id=?;");
				quantity=Integer.parseInt(qty);
                update.setInt(1,quantity);
                update.setString(2,date_m);
                update.setString(3,name_m);
                update.setString(4,session_email);
            }
            else if(manufacturer.equals("") && qty.equals("") && (!(price.equals(""))))
            {
                update=con.prepareStatement("update medicine set price=?,date=? where name=? and email_id=?;");
				prices=Integer.parseInt(price);
                update.setInt(1,prices);
                update.setString(2,date_m);
                update.setString(3,name_m);
                update.setString(4,session_email);
            }
			else if(!(manufacturer.equals("")) && (!(qty.equals(""))))
			{
				update=con.prepareStatement("update medicine set manufacturers=?,quantity=?,date=? where name=? and email_id=?;");
				quantity=Integer.parseInt(qty);
				update.setString(1,manufacturer);
                update.setInt(2,quantity);
                update.setString(3,date_m);
                update.setString(4,name_m);
                update.setString(5,session_email);
			}
			else if(!(manufacturer.equals("")) && (!(price.equals(""))))
			{
				update=con.prepareStatement("update medicine set manufacturers=?,price=?,date=? where name=? and email_id=?;");
				prices=Integer.parseInt(price);
                update.setString(1,manufacturer);
				update.setInt(2,prices);
                update.setString(3,date_m);
                update.setString(4,name_m);
                update.setString(5,session_email);
			}
			else if(!(qty.equals("")) && (!(price.equals(""))))
			{
				update=con.prepareStatement("update medicine set quantity=?,price=?,date=? where name=? and email_id=?;");
				quantity=Integer.parseInt(qty);
				prices=Integer.parseInt(price);
                update.setInt(1,quantity);
				update.setInt(2,prices);
                update.setString(3,date_m);
                update.setString(4,name_m);
                update.setString(5,session_email);
			}
            else
            {
                update=con.prepareStatement("update medicine set manufacturers=?,date=?,quantity=?,price=? where name=name_m and email_id=?;");
				quantity=Integer.parseInt(qty);
				prices=Integer.parseInt(price);
			    update.setString(1,manufacturer);
			    update.setString(2,date_m);
			    update.setInt(3,quantity);
			    update.setInt(4,prices);
             	update.setString(5,name_m);
		        update.setString(6,session_email);
            }
			int x=update.executeUpdate();
			if(x==1)
			{
				response.sendRedirect("Update.html");
			}
			else
			{
				out.println(request.getAttribute("errorMessage"));
			}
		}
		else if(choice.equals("Doctor"))
		{
			String name_d=request.getParameter("name_d");
			String specialist_d=request.getParameter("specialist");
			String date_d=request.getParameter("date_d");
			String from_time_d=request.getParameter("from_time");
			String to_time_d=request.getParameter("to_time");
			String fees_d=request.getParameter("fees");
			/*PreparedStatement update=con.prepareStatement("update from doctor set specialist=specialist_d,date=date_d,from_time=from_time_d,to_time=to_time_d,fees=fees_d where name=name_d;");
			input.setString(1,name_d);
			input.setString(2,specialist_d);
			input.setString(3,date_d);
			input.setString(4,from_time_d);
			input.setString(5,to_time_d);
			input.setInt(6,fees_d);
			update.executeUpdate();*/
		}
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>