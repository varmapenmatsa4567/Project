<% 
    String username = request.getParameter("username");
    String pass = request.getParameter("pass1");

    if (username.equals("admin") && pass.equals("admin")) {
      session.setAttribute("admin","true");
      response.sendRedirect("adminHome.jsp");
    }
    else{
      response.sendRedirect("admin.jsp?m1=fail");
    }

    

 %>