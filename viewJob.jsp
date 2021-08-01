<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background: url(bgs.jpg);
            background-size: cover;
            background-attachment: fixed;
      }
      #myTable {
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
        String sql = "select * from post where id=?";
        String uname = String.valueOf(session.getAttribute("user"));
        String sql2 = "select * from profile where user=?";
        String jobId = String.valueOf(request.getParameter("id")); 
        String sql3 = "select * from application where id=? and seeker=?";
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection(url,user,pas);
          PreparedStatement st = con.prepareStatement(sql);
          st.setInt(1,Integer.parseInt(request.getParameter("id")));
          ResultSet rs = st.executeQuery();
          rs.next();
     %>
          <div class="container" id="myTable">
            <table class="table table-bordered table-hover">
                <tbody>
                    <tr>
                        <td><strong>Job Title</strong></td>
                        <td><%= rs.getString(3) %></td>
                    </tr>
                    <tr>
                        <td><strong>Company</strong></td>
                        <td><%= rs.getString(4) %></td>
                    </tr>
                    <tr>
                        <td><strong>Description</strong></td>
                        <td><%= rs.getString(5) %></td>
                    </tr>
                    <tr>
                        <td><strong>Experience</strong></td>
                        <td><%= rs.getString(6) %> year</td>
                    </tr>
                    <tr>
                        <td><strong>Skills Required</strong></td>
                        <td><%= rs.getString(7) %></td>
                    </tr>
                    <tr>
                        <td><strong>Job Type</strong></td>
                        <td><%= rs.getString(8) %></td>
                    </tr>
                    <tr>
                        <td><strong>Location</strong></td>
                        <td><%= rs.getString(9) %></td>
                    </tr>
                    <tr>
                        <td><strong>Post Date</strong></td>
                        <td><%= rs.getString(10) %></td>
                    </tr>
                </tbody>
            </table>
            <% 
                PreparedStatement st2 = con.prepareStatement(sql2);
                st2.setString(1,uname);
                ResultSet rs2 = st2.executeQuery();

                PreparedStatement st3 = con.prepareStatement(sql3);
                st3.setInt(1,Integer.parseInt(request.getParameter("id")));
                st3.setString(2,uname);
                ResultSet rs3 = st3.executeQuery();
                if(rs3.next()){%>
                    <p> <strong>You have already applied for this Job</strong></p>
                <% } else {
                    if(rs2.next()){ %>
                        <a href="applyJob.jsp?jobId=<%= jobId %>&profileId=<%= rs2.getInt(1) %>" class="btn btn-success">Apply For this Job</a>
                    <%} else{ %>
                        <p> <strong>Please fill the Job Profile first and then you can apply for the Job.</strong></p>
                        <a href="#" class="btn btn-success disabled">Apply For this Job</a>
                <% }  } %>
                
          </div>
     <% }
        catch(Exception e){
            out.println(e);
        } %>
  </body>
</html>
