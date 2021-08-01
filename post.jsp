<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
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
  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <a class="active item" href="post.jsp"><i class="share icon"></i>POST JOB</a>
             <a class="item" href="employer.jsp"><i class="get pocket icon"></i>APPLICATIONS</a>
             <div class="right menu">
               <a class="ui item" href="logout.jsp"><i class="sign-out icon"></i>LOGOUT</a>
             </div>
        </div>
    </div>
    </div>
    
      <%

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    
        if(session.getAttribute("user")==null || session.getAttribute("type")=="Job Seeker"){
            response.sendRedirect("login.jsp");
        }

     %>
     <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Job Posted Successfully");

            </script>
        <% }
      %>

      <div class="container">
    <br><br>
    <div class="myform shadow-lg">
    <h1 class="ui header">Post Job</h1>
    <br>
      <form class="was-validated" action="postJob.jsp" method="post" name="" id=""
        oninput='pass2.setCustomValidity(pass2.value != pass1.value ? "Passwords do not match." : "")'>
        <div class="row">
          <div class="form-group col-6">
            <label>Title</label>
            <input type="text" name="title" class="form-control" placeholder="Title" required>
          </div>
          <div class="form-group col-6">
            <label>Company</label>
            <input type="text" name="company" class="form-control" placeholder="Company" required>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-12">
            <label>Description</label>
            <textarea type="text" name="des" class="form-control" placeholder="Description" required></textarea>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-6">
            <label>Experience</label>
            <input type="number" name="exp" class="form-control" placeholder="Experience" required>
          </div>
          <div class="form-group col-6">
            <label>Skills</label>
            <input type="text" name="sk" class="form-control" placeholder="Skills Required" required>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-6">
            <label>Job Type:</label>
            <select class="form-control" id="sel1" name="type" required>
              <option value="" selected disabled hidden>Select Type</option>
              <option>Full Time</option>
              <option>Part Time</option>
            </select>
          </div>
          <div class="form-group col-6">
            <label>Location</label>
            <input type="text" name="loc" class="form-control" placeholder="Location" required>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-12">
            <input type="submit" class="ui green button" value="Post">
          </div>
        </div>
      </form>
    </div>
  </div>
      
      
  </body>
</html>