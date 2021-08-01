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
             <a class="item" href="post.jsp"><i class="share icon"></i>POST JOB</a>
             <a class="active item" href="employer.jsp"><i class="get pocket icon"></i>APPLICATIONS</a>
             <div class="right menu">
               <a class="ui item" href="logout.jsp"><i class="sign-out icon"></i>LOGOUT</a>
             </div>
        </div>
    </div>
    </div>

      <%

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
        if(session.getAttribute("user")==null || session.getAttribute("type")=="Employer"){
            response.sendRedirect("login.jsp");
        }

     %>
     <% 
        String url = "jdbc:mysql://localhost:3306/jobs";
	    String user = "root";
	    String pas = "root123";
        String sql = "select p.id,p.name,p.gender,p.email from profile p,application a where p.id = a.profileId and a.id=? order by dt desc";
        String uname = String.valueOf(session.getAttribute("user"));
        String jobId = request.getParameter("jobId");
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url,user,pas);
          PreparedStatement st = con.prepareStatement(sql);
          st.setInt(1,Integer.parseInt(jobId));
          ResultSet rs = st.executeQuery();
          %>
          <br><br>
          <div class="container" id="tableContainer">
            <table class="ui selectable celled table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Profile</th>
                    </tr>
                </thead>
                <tbody>
               <% while(rs.next()){ %>
                  <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><a href="viewProfile.jsp?id=<%= rs.getInt(1) %>" class="ui blue button" >View Profile</a></td>
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