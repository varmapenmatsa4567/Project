<% 

    session.removeAttribute("admin");
	session.invalidate();
	response.sendRedirect("admin.jsp");

%>