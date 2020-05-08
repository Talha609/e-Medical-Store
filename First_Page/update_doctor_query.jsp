<%@page import="java.sql.*"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>eMedical Insert</title>

        <link href="styling.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <script type="text/javascript" language="javascript">
		function validation()
		{
			var choice=document.getElementsByName("choice1");
			if(choice[0].checked)
			{
				var name_d=document.getElementById("name_d").value;
				var specialist=document.getElementById("specialist").value;
				var fees=document.getElementById("fees").value;
				
				var name_pattern=/^[a-zA-Z ]{4,20}$/;
				var fee_pattern=/^[0-9]{1,5}$/;
				if(!(name_pattern.test(name_d)))
				{
					alert("Please Enter valid name");
					return false;
				}
				else if(!(name_pattern.test(specialist)))
				{
					alert("Please Enter valid Specialist Type");
					return false;
				}
				else if(!(fee_pattern.test(fees)))
				{
					alert("Please Enter valid Fees");
					return false;
				}
				//myform.method="get";
				//myform.action="insert_doctor.jsp";
				//myform.submit();
				return true;
			}
		}
        </script>    
    </head>
    <body style="background: none">
	  <script src="Nav.js"></script>
	  
	  <div class="container">
		<form class="form-horizontal" action="update_doc.jsp" method="post" onsubmit="validation()">
			<h2 align="center" id="heading">Update Details</h2>
			<%
				String session_email=(String)session.getAttribute("email");
				String id=request.getParameter("id_name");
				out.println("<input type='hidden' value='"+id+"' name='id_col'");
				out.println("<input type='hidden' value='"+session_email+"' name='session_var'");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
				PreparedStatement ps=con.prepareStatement("select name,specialist,from_time,to_time,fees from doctor where email_id=? and id=?;");
				ps.setString(1,session_email);
				ps.setString(2,id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					out.println("<div class='container'><div class='form-group'><label class='control-label col-sm-2' for='name_d'>Name:</label><div class='col-sm-10'><input type='text' class='form-control' value='"+rs.getString(1)+"' id='name_d' placeholder='Enter name' name='name_d' required></div></div><div class='form-group'><label class='control-label col-sm-2' for='specialist'>Specialist of:</label><div class='col-sm-10'><input type='text' class='form-control' value='"+rs.getString(2)+"' id='specialist' placeholder='Enter specialist(Eyes,Ears,..)' name='specialist' requ></div></div><div class='form-group'><label class='control-label col-sm-2' for='from_time'>From Time:</label><div class='col-sm-10'><input type='time' value='"+rs.getString(3)+"' class='form-control' id='from_time' name='from_time'></div></div><div class='form-group'><label class='control-label col-sm-2' for='to_time'>To Time:</label><div class='col-sm-10'><input type='time' value='"+rs.getString(4)+"' class='form-control' id='to_time' name='to_time'></div></div><div class='form-group'><label class='control-label col-sm-2' for='fees'>Fees:</label><div class='col-sm-10'><input type='number' value='"+rs.getString(5)+"' class='form-control' id='fees' name='fees'></div></div></div>");
				}
				con.close();
			%>	
			<div class="container">
				<div class="form-group">        
					<div class="col-sm-offset-2 col-sm-10" style="text-align:right">
						<input type="submit" class="btn btn-default" >
						<a href='update_view.jsp'><input type="button" class="btn btn-default" value="Cancel"></a>
					</div>
				</div>
			</div>
			</form>
       </div>  
    </body>
</html>