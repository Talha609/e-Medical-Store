
<html>
  <head>
<%
	String session_email=(String)session.getAttribute("email");
	//out.println(session_email);
	if(session_email==null)
	{
		out.println("<script type='text/javascript' language='javascript'>");
		out.println("top.location.href='../Akif/login.html'");
		out.println("</script>");
		//response.sendRedirect("Insert.jsp");
	}
%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eMedical Insert</title>
    <link href="styling.css" rel="stylesheet">
      
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
    <script type="text/javascript" language="javascript">
        window.onload=show;
        function show()
        {
            var choice=document.getElementsByName("choice1");
            if(choice[0].checked)
            {
                document.getElementById("doctor_insert").style.display="none";
                document.getElementById("medicine_insert").style.display="block";
                document.getElementById("heading").innerText="Insert Medicine";
	            document.getElementById("date_m").value=new Date().toISOString().slice(0, 10);
            }
            else if(choice[1].checked)
            {
                var d=new Date();
                document.getElementById("medicine_insert").style.display="none";
                document.getElementById("doctor_insert").style.display="block";
                document.getElementById("heading").innerText="Insert Doctor";
	            document.getElementById("date_d").value=d.toISOString().slice(0, 10);
                document.getElementById("from_time").value=d.getHours()+ ":" + d.getMinutes();
                document.getElementById("to_time").value=d.getHours()+ ":" + d.getMinutes();
            }
        }
		function validation()
		{
			var choice=document.getElementsByName("choice1");
			if(choice[0].checked)
			{
				var name_m=document.getElementById("name_m").value;
				var manufacturer=document.getElementById("manufacturer").value;
				var qty=document.getElementById("qty").value;
				var price=document.getElementById("price").value;
				
				var name_pattern=/^[a-zA-Z ]{4,20}$/;
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
				myform.method="get";
				myform.action="insert_medicine.jsp";
				myform.submit();
				return true;
			}
			else if(choice[1].checked)
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
				myform.method="get";
				myform.action="insert_doctor.jsp";
				myform.submit();
				return true;
			}
		}
    </script>
  </head>
  <body style="background: none">
      <script src="Nav.js"></script>
      
      <div class="container">
          <form class="form-horizontal" name="myform"><!-- method="get" action="insert.jsp" onsubmit="return validation">-->
            <h2 align="center" id="heading">Insert Medicine</h2>
            <div class="fill-container" style="margin-top: 10px;text-align: right">
                <label style="font-size: 18px">Type:</label>
                <input type="radio" value="Medicine" name="choice1" id="Medicine" style="margin-left: 10px" onclick="show()" checked> Medicines
                <input type="radio" value="Doctor" name="choice1" id="Doctor" style="margin-left: 10px" onclick="show()"> Doctors
            </div>
            <div id="medicine_insert">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name_m">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name_m" placeholder="Enter name" name="name_m" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="manufacturer">Manufacturer:</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="manufacturer" placeholder="Enter brand" name="manufacturer" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="date_m">Date:</label>
                    <div class="col-sm-10">          
                        <input type="date" class="form-control" id="date_m" name="date_m" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="doctor">Quantity:</label>
                    <div class="col-sm-10">          
                        <input type="number" class="form-control" id="qty" name="qty" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="doctor">Price:</label>
                    <div class="col-sm-10">          
                        <input type="number" class="form-control" id="price" name="price" required>
                    </div>
                </div>
            </div>
            
            <div id="doctor_insert">
                <div class="form-group">
                  <label class="control-label col-sm-2" for="name_d">Name:</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="name_d" placeholder="Enter name" name="name_d">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-2" for="specialist">Specialist of:</label>
                  <div class="col-sm-10">          
                    <input type="text" class="form-control" id="specialist" placeholder="Specialist In(Eyes,Ears..)" name="specialist">
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="date_d">Date:</label>
                  <div class="col-sm-10">          
                        <input type="date" class="form-control" id="date_d" name="date_d" readonly>
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="from_time">From Time:</label>
                  <div class="col-sm-10">          
                    <input type="time" class="form-control" id="from_time" name="from_time">
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="to_time">To Time:</label>
                  <div class="col-sm-10">          
                    <input type="time" class="form-control" id="to_time" name="to_time">
                  </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="fees">Fees:</label>
                    <div class="col-sm-10">          
                    <input type="number" class="form-control" id="fees" name="fees">
                  </div>
                </div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="Days">Days:</label>
                    <div class="col-sm-10" style="margin-top:5px">
						<input type="checkbox" value="1" name="d1" id="d1" style="margin-left: 10px" checked> Mon
						<input type="hidden" value="0" name="d1">
						<input type="checkbox" value="1" name="d2" id="d2" style="margin-left: 10px"> Tue
						<input type="hidden" value="0" name="d2">
						<input type="checkbox" value="1" name="d3" id="d3" style="margin-left: 10px"> Wed
						<input type="hidden" value="0" name="d3">
						<input type="checkbox" value="1" name="d4" id="d4"  style="margin-left: 10px"> Thurs
						<input type="hidden" value="0" name="d4">
						<input type="checkbox" value="1" name="d5" id="d5" style="margin-left: 10px"> Fri
						<input type="hidden" value="0" name="d5">
						<input type="checkbox" value="1" name="d6" id="d6" style="margin-left: 10px"> Sat
						<input type="hidden" value="0" name="d6">
						<input type="checkbox" value="1" name="d7" id="d7" style="margin-left: 10px"> Sun
						<input type="hidden" value="0" name="d7">
					</div>
				</div>
            </div>

            <div class="form-group">        
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="button" class="btn btn-default" value="Submit" onclick="return validation()">
					<!-- <input type="submit" class="btn btn-default"> -->
                    <button type="reset" class="btn btn-default">Cancel</button>
                </div>
            </div>
        </form>
    </div>  
  </body>
</html>