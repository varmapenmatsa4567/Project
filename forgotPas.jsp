<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      background: url(bg2.jpg);
      background-size: cover;
      background-attachment: fixed;
    }

    h2 {
      font-weight: 400;
      text-align: center;
    }

    .myform {
      background: white;
      width: 50%;
      padding: 25px 25px 25px 25px;
      border-radius: 10px;
      margin: auto;
    }
  </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-end">
        <ul class="navbar-nav nav-pills">
          <li class="nav-item" style="padding-right:30px">
            <a class="nav-link" href="index.jsp"><strong>Home</strong></a>
          </li>
          <li class="nav-item" style="padding-right:30px">
            <a class="nav-link active" href="login.jsp"><strong>Login</strong></a>
          </li>
          <li class="nav-item" style="padding-right:150px">
            <a class="nav-link" href="signup.jsp"><strong>SignUp</strong></a>
          </li>
        </ul>
      </nav>

      <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Email does not Exists!");

            </script>
        <% }
      %>
    
      <div class="container">
    <br><br>
    <div class="myform">
  <h2>Forgot Password</h2>
  <br>
      <form action="checkEmail.jsp" class="was-validated" method="post">
        <div class="row">
          <div class="form-group col-12">
            <label>Email</label>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
          </div>
        </div>
        
        <div class="row">
          <div class="form-group col-2">
            <input type="submit" class="btn btn-success" value="Submit">
          </div>
        </div>
        
      </form>
    </div>
  </div>
      
      
  </body>
</html>