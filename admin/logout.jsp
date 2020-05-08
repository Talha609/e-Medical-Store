<%
try
{
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Expires","0");
    session.setAttribute("email_id",null);
    if(session.getAttribute("email_id")==null)
        response.sendRedirect("login_admin.html");
}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>