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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style>
    body {
      background: url(login.jpg);
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
    strong {
      color: white;
    }
  </style>
</head>
<body>
    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <a class="item" href="index.jsp"><i class="home icon"></i>HOME</a>
             <a class="item" href="login.jsp"><i class="sign-in icon"></i>LOGIN</a>
             <a class="item" href="signup.jsp"><i class="user icon"></i>SIGN UP</a>
             <a class="active item" href="admin.jsp"><i class="user secret icon"></i>ADMIN</a>
        </div>
    </div>
    </div>

      <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Invalid Username or Password");

            </script>
        <% }
      %>
    
      <div class="ui container">
      <br><br><br><br>
       <div class="myform">
       <h2><i class="sign-in icon"></i>Admin Login</h2>
       <br>
      <form action="verifyAdmin.jsp" class="was-validated ui form" method="post">
        <div class="row">
          <div class="form-group col-12">
            <label>Username</label>
            <input type="text" name="username" class="form-control" placeholder="Username" required>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-12">
            <label>Password</label>
            <input type="password" name="pass1" class="form-control" placeholder="Password" required>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-2">
            <input type="submit" class="ui green button" value="Login">
          </div>
        </div>
        
      </form>
    </div>
  </div>
      
      
  </body>
</html>