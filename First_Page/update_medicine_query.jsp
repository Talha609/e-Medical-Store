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
				var name_m=document.getElementById("name_m").value;
				var manufacturer=document.getElementById("manufacturer").value;
				var qty=document.getElementById("qty").value;
				var price=document.getElementById("price").value;
				
				var name_pattern=/^[a-zA-Z ]{5,20}$/;
				var qty_pattern=/^[0-9]{1,5}$/;
				if(!(name_pattern.test(name_m)))
				{
					alert("Please Enter valid name");
					return false;
				}
				else if(!(name_pattern.test(manufacturer)))
				{
					alert("Please Enter valid Manufacturer Name");
					return false;
				}
				else if(!(qty_pattern.test(qty)))
				{
					alert("Please Enter valid Quantity");
					return false;
				}
				else if(!(qty_pattern.test(price)))
				{
					alert("Please Enter valid Price");
					return false;
				}
				//myform.method="get";
				//myform.action="insert_medicine.jsp";
				//myform.submit();
				return true;
			}
		}
        </script>    
    </head>
    <body style="background: none">
          <script src="Nav.js"></script>
		  
          <div class="container">
              <form class="form-horizontal" action="update_med.jsp" method="post" onsubmit="validation()">
                <h2 align="center" id="heading">Update Details</h2>
                <div id="medicine_update">
					<%
						String session_email=(String)session.getAttribute("email");
						String id=request.getParameter("id_name");
						out.println("<input type='hidden' value='"+id+"' name='id_col'");
						out.println("<input type='hidden' value='"+session_email+"' name='session_var'");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","123456");
						PreparedStatement ps=con.prepareStatement("select name,manufactures,quantity,price,id from medicine where email_id=? and id=?;");
						//int id1=Integer.parseInt(id);
						ps.setString(1,session_email);
						ps.setString(2,id);
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							out.println("<div class='container'><div class='form-group'><label class='control-label col-sm-2' for='name_m'>Name:</label><div class='col-sm-10'><input type='text' class='form-control' value='"+rs.getString(1)+"' id='name_m' placeholder='Enter name' name='name_m' required></div></div><div class='form-group'><label class='control-label col-sm-2' for='manufacturer'>Manufacturer:</label><div class='col-sm-10'>          <input type='text' class='form-control' value='"+rs.getString(2)+"' id='manufacturer' placeholder='Enter brand' name='manufacturer' requ></div></div><div class='form-group'><label class='control-label col-sm-2' for='date_m'>Date:</label><div class='col-sm-10'><input type='date' class='form-control' value='date' id='date_m name='date_m' readonly></div></div><div class='form-group'><label class='control-label col-sm-2' for='qty'>Quantity:</label><div class='col-sm-10'><input type='number' class='form-control' value='"+rs.getString(3)+"' id='qty' name='qty'></div></div><div class='form-group'><label class='control-label col-sm-2' for='doctor'>Price:</label><div class='col-sm-10'><input type='number' class='form-control' value='"+rs.getString(4)+"' id='price' name='price'></div></div></div></div>");
						}
						
						//con.close();
						
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