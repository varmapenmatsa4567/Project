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
      width: 55%;
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
             <a class="item" href="seeker.jsp"><i class="search icon"></i>BROWSE JOBS</a>
             <a class="item" href="myJobs.jsp"><i class="get pocket icon"></i>MY JOBS</a>
             <a class="active item" href="profile.jsp"><i class="user icon"></i>JOB PROFILE</a>
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
          String sql = "select * from profile where user=?";

          try{
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection(url,user,pas);
              PreparedStatement st = con.prepareStatement(sql);
              st.setString(1,uname);
              ResultSet rs = st.executeQuery();
              if (rs.next()) { %>
                <br><br><br>
                <div class="container" id="tb">
                      <h2>Job Profile</h2>
                      <br>
                      <table class="table table-bordered table-hover">
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
                                <td><strong>Resume Filename</strong></td>
                                <td><%= rs.getString(8) %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
              <% } else{ %>
                    <div class="container">
                    <br><br>
                    <div class="myform shadow-lg">
                    <h1 class="ui header">Job Profile</h1>
                    <br>
                    <div class="container">
                        <form class="was-validated" action="addProfile.jsp" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                              <label>Full Name</label>
                              <input type="text" name="name" class="form-control" placeholder="Name" required>
                            </div>
                            <div class="form-group">
                              <label>Gender:</label>
                              <select class="form-control" id="sel1" name="gender" required>
                                <option value="" selected disabled hidden>Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                              </select>
                            </div>
                            <div class="form-group">
                              <label>Email</label>
                              <input type="email" name="email" class="form-control" placeholder="Email" required>
                            </div>
                            <div class="form-group">
                              <label>Phone No:</label>
                              <input type="number" name="phno" class="form-control" placeholder="Phone No" required>
                            </div>
                            <div class="form-group">
                              <label>Experience</label>
                              <input type="number" name="exp" class="form-control" placeholder="Experience" required>
                            </div>
                            <div class="form-group">
                              <label>Skills</label>
                              <input type="text" name="sk" class="form-control" placeholder="Skills" required>
                            </div>
                            <div class="form-group">
                              <label>Choose Resume</label>
                              <input type="file" class="form-control-file border" name="file" required>
                            </div>
                            <div class="row">
                              <div class="form-group col-12">
                                  <input type="submit" class="ui green button" value="Submit">
                              </div>
                            </div>
                        </form>
                      </div>
                    </div>
                <% }
          }
          catch(Exception e){
              out.println(e);
          }
      %>
      
    
    
            
      </div>
      

      
      
      
  </body>
</html>