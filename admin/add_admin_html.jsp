<HTML>
<HEAD>
	<link type="text/css" rel="stylesheet" href="sign.css">
    <title>Registration Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Page</title>
    <link href="styling.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script type="text/javascript" language="javascript">
    function validate(){
			var user_name=document.getElementById("n1").value;
			var pss=document.getElementById("p1").value;
			var email=document.getElementById("e1").value;
			
			if(user_name.length<4){
				alert("user name empty");
				return false;
			}
            
			var namepattern=/^[a-z A-Z]{4,15}$/;
            if(!namepattern.test(user_name)){
                //test will check that pattern is matching or not
            	alert("only alphabet are allowed in name");
                return false;
			}
			
			var passpattern= new RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{5,})");
			if(!passpattern.test(pss)){
				alert("password must contain 1 character , one number and one special symbol ");
				return false;
			}
			if(email.length<6){
				alert("email patten not satisfies");
				return false;
			}

			return true;
		}
	</script>
</HEAD>
<BODY >

        <DIV>
        <script src="nav.js"></script>
        </DIV>
	<DIV class="wrap">
	<form method="post" action="add_admin.jsp" onsubmit="return validate()">
		<input type="text" placeholder="User Name" value="" name="c1" id="n1">
				<input type="email" placeholder="Email" value="" name="c1" id="e1">
				<input type="password" placeholder="Password" value="" name="c1" id="p1">
		<input type="submit">	
		<input type="reset">
	</form>
	</DIV>
	
</BODY>
</HTML>
<%
   if(session.getAttribute("email_id")==null)
        response.sendRedirect("login_admin.html");
%>