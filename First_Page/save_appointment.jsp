<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String dates=request.getParameter("date");
	String types=request.getParameter("type_d");
	String doctor=request.getParameter("doctors");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery("select d.name,d.specialist,d.email_id from doctor as d,registration as r where r.email_id=d.email_id;");
		while(rs.next())
		{
			String doctor_name=(String)rs.getString(1);
			String specialist=(String)rs.getString(2);
			if((doctor.equals(doctor_name)) && (types.equals(specialist)))
			{
				PreparedStatement ps=con.prepareStatement("insert into appointment values(?,?,?,?,?);");
				ps.setString(1,name);
				ps.setInt(2,age);
				ps.setString(3,dates);
				ps.setString(4,doctor);
				ps.setString(5,rs.getString(3));
				ps.executeUpdate();
				//out.println(request.getAttribute("Appointmet is confirmed"));
				out.println("<script type='text/javascript' language='javascript'>alert('Appointed is Confirmed');</script>");
				break;
			}
		}
		con.close();
		response.sendRedirect("Appointment.jsp");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>