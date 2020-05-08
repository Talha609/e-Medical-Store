<%@page import="java.sql.*"%>
<%
   try{
		    String[] registeration_detail=request.getParameterValues("c1");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
			Statement s=con.createStatement();
            ResultSet rs=s.executeQuery("select email_id from registration;");
            int count=0;
            while(rs.next())
            {
                if(rs.getString(1).equals(registeration_detail[1]))
                {
                    count+=1;
                    break;
                }
            }
            if(count==1)
            {
                out.println("<script type='text/javascript' language='javascript'>");
                out.println("alert('Email already in Use');");
                out.println("window.location.href='regis2.html';");
                out.println("</script>");
            }
            else
            {
                PreparedStatement ps=con.prepareStatement("insert into registration (user_name,email_id,password,firm_name,owner_name,gst_no,address,locality) values(?,?,?,?,?,?,?,?);");
                ps.setString(1,registeration_detail[0].trim());
                ps.setString(2,registeration_detail[1]);
                ps.setString(3,registeration_detail[2]);
                ps.setString(4,registeration_detail[3]);
                ps.setString(5,registeration_detail[4]);
                ps.setString(6,registeration_detail[5]);
                ps.setString(7,registeration_detail[6]);
                ps.setString(8,registeration_detail[7]);

                int x=ps.executeUpdate();
                con.close();
                if(x==1)
                {
                    response.sendRedirect("login.html");
                }
                else
                {
            //out.println(request.getAttribute("errorMessage"));
                    out.println("<script language='javascript' type='text/javascript'>alert('Unable to Register');window.location.href='regis2.html';</script>");
                }
            }

    }
   	catch(Exception e)
    {
		out.println(e);
    }
%>