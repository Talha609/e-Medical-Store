<HTML>
    <HEAD>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Page</title>
        <link href="styling.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    </HEAD>
    <BODY style="background: none">
        <script src="nav.js"></script>
        <H1 align="center">
            Welcome Admin
        </H1>
    </BODY>
</HTML>
<%
   if(session.getAttribute("email_id")==null)
        response.sendRedirect("login_admin.html");
%>