<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
        body {
            background: url(bgs.jpg);
            background-size: cover;
            background-attachment: fixed;
      }
      #tableContainer {
          background-color: white;
          padding: 25px 25px 25px 25px;
          border-radius: 10px;
      }
    </style>
</head>
<body>
  
  
    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <div class="right menu">
               <a class="ui item" href="adminLogout.jsp"><i class="sign-out icon"></i>LOGOUT</a>
             </div>
        </div>
    </div>
    </div>

      <%

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
        if(session.getAttribute("admin")==null){
            response.sendRedirect("admin.jsp");
        }

     %>
     <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Status Updated Successfully");

            </script>
        <% }
      %>
      <%
        if(request.getParameter("m2")!=null){%>
            <script>
                alert("Error Occured");

            </script>
        <% }
      %>
     <% 
        String url = "jdbc:mysql://localhost:3306/jobs";
	    String user = "root";
	    String pas = "root123";
        String sql = "select id,name,email,type,stats from users order by stats";
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url,user,pas);
          PreparedStatement st = con.prepareStatement(sql);
          ResultSet rs = st.executeQuery();
          %>
          <br><br>
          <div class="container" id="tableContainer">
            <table class="ui selectable celled table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Type</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
               <% while(rs.next()){ %>
                  <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <% if(rs.getString(5).equals("false")) { %>
                       <td><a href="changeStatus.jsp?id=<%= rs.getInt(1) %>" class="ui green button"> Activate </a></td>
                    <% } else { %>
                       <td><a href="changeStatus.jsp?id=<%= rs.getInt(1) %>" class="ui red button"> Deactivate </a></td>

                    <% } %>
                  </tr>

                <% } %>
                </tbody>
                </table>
                </div>
        <% }
        catch(Exception e){
            out.println(e);
        } %>


     
      
  </body>
</html>