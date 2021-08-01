<% 

    session.removeAttribute("user");
    session.removeAttribute("type");
	session.invalidate();
	response.sendRedirect("login.jsp");

%>