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
    <title>eMedical Appointment</title>

    <link href="styling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script type="text/javascript" language="javascript">
        window.onload=show;
        function show()
        {
            document.getElementById("dates").value=new Date().toISOString().slice(0, 10);
			doctors_view();
        }
		function display_table()
		{
			var d=document.getElementsByName("d1");
			//var t=document.getElementById("doctors").value;
			//document.write(d[1].value + " " + d[0].value + " " + d.length);
			var t=d[0].value + "@" + d[1].value;
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if((obj.readyState==4) && (obj.status==200))
				{
					document.getElementById("table_view").innerHTML=obj.responseText;
				}
			}
			obj.open("get","Appointment_list_view.jsp?valuess="+t,true);
			obj.send();
			//document.write(d[1].value + " " + d[0].value + " " + d.length);
		}
		function doctors_view()
		{
			//document.write("Temp");
			var obj=new XMLHttpRequest();
			obj.onreadystatechange=function()
			{
				if((obj.readyState==4) && (obj.status==200))
				{
					document.getElementById("doctors").innerHTML=obj.responseText;
				}
			}
			obj.open("get","Doctor_List.jsp",true);
			obj.send();
			//display_table();
		}
    </script>
      
  </head>
  <body style="background: none">
        <script src="Nav.js"></script>
        <div class="fill-container" max-width=200px>
        <form class="form-horizontal" action="" method="get">
            <h1 align="center">Appointments</h1>
            <div  style="margin-top: 20px" class="form-group">
                <label for="Date" style="margin-left: 8%;font-size: 16px" align="left">Date:</label>
                <input type="date" id="dates" name="d1" onclick="display_table()">
            </div>
			<div class="form-group">
				<label for="doctors" style="margin-left: 8%;font-size: 16px;">Doctors:</label>
				<select style="width:150px" name="d1" id="doctors" onchange="display_table()">
					<option value="">Select</option>
				</select>
            </div>
        </form>
    
        <table border="3" cellspacing="5" cellpadding="8" style="font-size: 20px;margin-top: 10px" align="center" width="85%">
            <col width="100px">
            <col width="300px">
            <col width="100px">
            <col width="200px">
              <tr>
                <th style="text-align: center">Serial No.</th>  
                <th style="text-align:center">Name</th>
                <th style="text-align: center">Age</th>
                <th style="text-align: center">Date</th>
              </tr>
        </table>
		<table border="3" cellspacing="5" cellpadding="8" style="font-size: 20px;margin-top: 10px" align="center" width="85%" id="table_view">
            
		</table>
      </div>  
  </body>
</html>