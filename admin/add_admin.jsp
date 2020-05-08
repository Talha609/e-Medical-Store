<%@page import="java.sql.*"%>
<%
   try{
            if(session.getAttribute("email_id")==null)
                response.sendRedirect("login_admin.html");
		    String[] registeration_detail=request.getParameterValues("c1");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
            Statement s=con.createStatement();
            //step-3 Execute statement
            ResultSet rs=s.executeQuery("select email from admin;");
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
                    out.println("alert('Email is already in use');");
                    out.println("window.location.href='add_admin_html.jsp';");
                    out.println("</script>");
            }
            else
            {
                PreparedStatement ps=con.prepareStatement("insert into admin (name,email,password) values(?,?,?)");
                ps.setString(1,registeration_detail[0]);
                ps.setString(2,registeration_detail[1]);
                ps.setString(3,registeration_detail[2]);

                int x=ps.executeUpdate();
                con.close();
                if(x==1)
                {
                    response.sendRedirect("admin_page.jsp");
                }
                else
                {
            //out.println(request.getAttribute("errorMessage"));
                    out.println("<script language='javascript' type='text/javascript'>alert('Unable to Register');</script>");
                }
            }

    }
   	catch(Exception e)
    {
		out.println(e);
    }
%>