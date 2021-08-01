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
      .col-4 {
          background-color: rgb(238, 31, 111)
      }
      .container {
          border-radius: 5px;
          display: flex;
      }
      body {
        background: url(bgs.jpg);
        background-size: cover;
        background-attachment: fixed;
      }
      .col-8:hover {
        background-color: lightyellow;
      }
      h3 {
          color: white;
      }
      h4 {
          color: white;
      }
      h6 {
        color: white;
        opacity: .6;
      }
      #view {
        display: None;
      }
      .container:hover #view {
         display: inline-block;
      }
  </style>
</head>
<body>

    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <a class="active item" href="seeker.jsp"><i class="search icon"></i>BROWSE JOBS</a>
             <a class="item" href="myJobs.jsp"><i class="get pocket icon"></i>MY JOBS</a>
             <a class="item" href="profile.jsp"><i class="user icon"></i>JOB PROFILE</a>
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
     <br>
     <%
        String url = "jdbc:mysql://localhost:3306/jobs";
	      String user = "root";
	      String pas = "root123";
        String sql = "select * from post order by dt desc";
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url,user,pas);
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery(sql);
          
          while(rs.next()){   
      %>

            <div class="container">
              <div class="card mb-3 shadow">
                <div class="row no-gutters">
                  <div class="col-4" style="padding: 25px">
                    <h6><strong>JOB TITLE</strong></h6>
                    <h3><strong><%= rs.getString(3) %></strong></h3>
                    <h6><strong>By</strong></h6>
                    <h4><strong><%= rs.getString(4) %></strong></h3>
                  </div>
                  <div class="col-8">
                    <div class="card-body">
                      <h5 class="card-title"><strong>Description</strong></h5>
                      <p class="card-text"><%= rs.getString(5) %></p>
                      <div class="row">
                      <div class="col-9" style="align: bottom">
                        <p class="card-text"><small class="text-muted"><%= rs.getString(10) %></small></p>
                      </div>
                      <div class="col-3">
                        <a class="ui blue button" id="view" href="viewJob.jsp?id=<%= rs.getInt(1) %>"> View Details </a>
                      </div>
                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>



          <% }
          
        }
        catch(Exception e){
            out.println(e);
        }
     %>
      
  </body>
</html>