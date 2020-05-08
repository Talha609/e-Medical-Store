<%
	String session_email=(String)session.getAttribute("email");
	if(session_email==null)
	{
		response.sendRedirect("../Akif/login.html");
	}
%>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>eMedical View</title>

    <link href="styling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
    <script type="text/javascript" language="javascript">
        window.onload=show;
        function show()
        {
            var choice=document.getElementsByName("choice1");
			var obj=new XMLHttpRequest();
            if(choice[0].checked)
            {
                document.getElementById("doctor_view").style.display="none";
                document.getElementById("medicine_view").style.display="block";
                document.getElementById("heading").innerText="Delete Medicine";
				obj.onreadystatechange=function()
				{
					if((obj.readyState==4) && (obj.status==200))
					{
						document.getElementById("medicine_table").innerHTML=obj.responseText;
					}
				}
				obj.open("get","Delete_medicine.jsp",true);
				obj.send();
				
            }
            else if(choice[1].checked)
            {
                document.getElementById("medicine_view").style.display="none";
                document.getElementById("doctor_view").style.display="block";
                document.getElementById("heading").innerText="Delete Doctor";
				
				obj.onreadystatechange=function()
				{
					if((obj.readyState==4) && (obj.status==200))
					{
						document.getElementById("doctor_table").innerHTML=obj.responseText;
					}
				}
				obj.open("get","Delete_doctor.jsp",true);
				obj.send();
				
            }
        }
    </script>
  </head>
  <body style="background: none">
        <script src="Nav.js"></script> 
        <div class="container" max-width=200px>
            <form class="form-horizontal" method="get" name="my_form">
                <h1 align="center" id="heading">Delete Medicines</h1>
                <div class="fill-container" style="margin-top: 10px;text-align: right">
                    <label style="font-size: 18px">Type:</label>
                    <input type="radio" value="Medicine" name="choice1" id="Medicine" style="margin-left: 10px" onclick="show()" checked> Medicines
                    <input type="radio" value="Doctor" name="choice1" id="Doctor" style="margin-left: 10px" onclick="show()"> Doctors
                </div>
            </form>
        </div>
		<form method="get" action="Delete_medicine_query.jsp" style="margin-top:20px">
			<div id="medicine_view">
				<table border="3" cellspacing="5" cellpadding="8" style="font-size: 20px;margin-top: 10px" align="center" width="85%">
					<col width="20%">
					<col width="25%">
					<col width="15%">
					<col width="20%">
					<tr align="center">
						<th style="text-align: center">Name</th>
						<th style="text-align: center">Manufacturer</th>
						<th style="text-align: center">Quantity</th>
						<th style="text-align: center">Price(Rs)</th>
						<th style="text-align: center">Update</th>
					</tr>
				</table>
				<table border="3" cellspacing="5" cellpadding="8" style="font-size: 18px;margin-top: 20px" align="center" width="85%" id="medicine_table">
				</table>
			</div>
		</form>
		<form method="get" action="Delete_doctor_query.jsp" style="margin-top:20px">
			<div id="doctor_view">
				<table border="3" cellspacing="5" cellpadding="8" style="font-size: 20px;margin-top: 10px" align="center" width="85%">
					<col width="19%">
					<col width="18%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
					<col width='10%'>
					<tr align="center">
						<th style="text-align: center">Name</th>
						<th style="text-align: center">Specialist Of</th>
						<th style="text-align: center">From Time</th>
						<th style="text-align: center">To Time</th>
						<th style="text-align: center">Fees</th>
						<th style="text-align: center">Update</th>
					</tr>
				</table>
				<table border="3" cellspacing="5" cellpadding="8" style="font-size: 20px;margin-top: 10px" align="center" width="85%" id="doctor_table">
				</table>
			</div>
		</form>
  </body>
</html>