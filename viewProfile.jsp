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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
    body {
      background: url(bgs.jpg);
      background-size: cover;
      background-attachment: fixed;
    }

    h1 {
      style: bold;
      font-weight: 400;
      text-align: center;
    }
    #tb {
          background-color: white;
          padding: 25px 25px 25px 25px;
          border-radius: 10px;
          width: 40%;
      }

    .myform {
      background: white;
      width: 75%;
      padding: 25px 25px 25px 25px;
      border-radius: 10px;
      margin: auto;
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
          String url = "jdbc:mysql://localhost:3306/jobs";
	        String user = "root";
	        String pas = "root123";
          String uname = String.valueOf(session.getAttribute("user"));
          String sql = "select * from profile where id=?";
          int id = Integer.parseInt(request.getParameter("id"));

          try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection(url,user,pas);
              PreparedStatement st = con.prepareStatement(sql);
              st.setInt(1,id);
              ResultSet rs = st.executeQuery(); 
              rs.next();
              %>
              <br><br><br>
                <div class="container" id="tb">
                      <h1 class="ui header">Job Profile</h1>
                      <br>
                      <table class="ui selectable celled table">
                        <tbody>
                            <tr>
                                <td><strong>Name</strong></td>
                                <td><%= rs.getString(2) %></td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td><%= rs.getString(3) %></td>
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>
                                <td><%= rs.getString(4) %></td>
                            </tr>
                            <tr>
                                <td><strong>Phone No</strong></td>
                                <td><%= rs.getString(5) %> </td>
                            </tr>
                            <tr>
                                <td><strong>Experience</strong></td>
                                <td><%= rs.getString(6) %> year</td>
                            </tr>
                            <tr>
                                <td><strong>Skills</strong></td>
                                <td><%= rs.getString(7) %></td>
                            </tr>
                            <tr>
                                <% String file = rs.getString(8); %>
                                <% String filename = file.substring(0,file.lastIndexOf(".")); %>
                                <td><strong>Resume</strong></td>
                                <td><a href="files/<%= file %>" download="<%= filename %>" class="ui green button" target="_blank">Downlaod</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
          <%}
          catch(Exception e){
              out.println(e);
          }
      %>
      </div>
  </body>
</html>