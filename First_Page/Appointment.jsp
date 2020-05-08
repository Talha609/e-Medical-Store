<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Appointment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <script language = "javascript" type="text/javascript">
			window.onload=show;
			function show()
			{
				var d=new Date();
				document.getElementById("date").value=d.toISOString().slice(0, 10);
			}
            function appoint()
            {
                var btn_name=document.getElementsByName("button_value");
				//document.write(btn_name[0].value);
                if(btn_name[0].value=="submit")
                {
                    var name=document.getElementById("name").value;
                    var age =document.getElementById("age").value;
                    var namePattern=/^[a-zA-Z ]{1,}$/;
					var dates=document.getElementById("date").value;
					var d=new Date().toISOString().slice(0, 10);
					//document.write(d,dates);
					if(!((dates.slice(0,4)-d.slice(0,4)>=0) && (dates.slice(5,7)-d.slice(5,7)>=0) && (dates.slice(8,10)-d.slice(8,10)>0)))
					{
						alert("Please enter valid date");
						return false;
					}
                    if(name=="")
                    {
                        alert("Please enter name");
                        return false;
                    }
                    else if(!(namePattern.test(name)))
                    {
                        alert("Enter valid name");
                        return false;
                    }
                    else if(age=="")
                    {
                        alert("Please enter age");
                        return false;
                    }
                    else if(age<=0 || age>99)
                    {
                        alert("Please enter valid age");
                        return false;
                    }
                    //confirm('Your appointment is confirmed');
					return true;
                }
                else
                {
                    document.getElementById("my_form").action = "";
                    window.open("index.html",_self);
                }
			}	
			function display()
			{
				var type_d=document.getElementById("type_d").value;
				var obj=new XMLHttpRequest();
				obj.onreadystatechange=function()
				{
					if((obj.readyState==4) && (obj.status==200))
					{
						document.getElementById("doctors").innerHTML=obj.responseText;
					}
				}
				obj.open("get","Doctors.jsp?special="+type_d,true);
				obj.send();
			}
        </script>
    </head>
    <body style="background-color:dimgrey">
            <marquee behavior="scroll" direction="left" style="margin-top: 20px;white-space: nowrap" scrollamount="20">
                 <img src="../Doctors_List/images/bone.jpg" width="500" height="300" alt="Natural" />
                 <img src="../Doctors_List/images/brain.jpg" width="500" height="300" alt="Natural" />
                 <img src="../Doctors_List/images/dentist.jpg" width="500" height="300" alt="Natural" />
                 <img src="../Doctors_List/images/ear.jpg" width="500" height="300" alt="Natural" />
                 <img src="../Doctors_List/images/eye.jpg" width="500" height="300" alt="Natural" />
                 <img src="../Doctors_List/images/heart.jpg" width="500" height="300" alt="Natural" />
            </marquee>
        <div class="container">
            <form class="form-horizontal" name="my_form" action="save_appointment.jsp" method="get" onsubmit="return appoint()">
                <h2 align="center">Appointment Form</h2>
                <div class="form-group">
                  <b><label class="control-label col-sm-2" for="name">Name:</label></b>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-2" for="age">Age:</label>
                  <div class="col-sm-10">          
                    <input type="number" class="form-control" id="age" placeholder="Enter Age" name="age">
                  </div>
                </div>

                <div class="form-group">
                  <label class="control-label col-sm-2" for="date">Date:</label>
                  <div class="col-sm-10">          
                    <input type="date" class="form-control" id="date" name="date">
                  </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="type_d">Type:</label>
                    <select class="form-control" style="margin-left:210px;width:200px" name="type_d" id="type_d" onclick="display()">
						<option value="Bone">Bone</option>
						<option value="Brain">Brain</option>
						<option value="Ears">Ears</option>
						<option value="Eyes">Eyes</option>
						<option value="Heart">Heart</option>
						<option value="Kidney">Kidney</option> 
					</select>
                </div>
				
				<div class="form-group">
                    <label class="control-label col-sm-2" for="Type">Doctors:</label>
                    <select class="form-control" style="margin-left:210px;width:200px" name="doctors" id="doctors">
						<option value="">Select</option>
					</select>
                </div>
				<!--
				<div class="form-group">
                    <label class="control-label col-sm-2" for="Type">Locality:</label>
                    <select class="form-control" style="margin-left:210px;width:200px" name="locality" id="locality">
						<option value="">Select</option>
					</select>
                </div>-->
                <br>
                <div class="form-group">        
                  <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-default" value="submit" name="button_value">
                    <a href="index.html"><button type="button" class="btn btn-default" name="button_value">Cancel</button></a>
                  </div>
                </div>
            </form>
        </div>
    </body>
</html>